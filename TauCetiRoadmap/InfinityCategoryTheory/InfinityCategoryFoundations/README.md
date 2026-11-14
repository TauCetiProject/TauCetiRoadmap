# Roadmap: foundations of ∞-category theory

**Summary.** This roadmap develops the basic homotopy theory of quasicategories, the entry point of the
InfinityCategoryTheory family.

It builds on Mathlib's `SSet.Quasicategory`, the quasicategory library of Tau Ceti, and the ModelCategoryTheory
family.

- **Vocabulary (Layer 1).** Size conventions, the H-enriched homotopy category of a simplicial category and its
  equivalences (§1.1); functor ∞-categories, subcategories, cones, zero objects, limits, colimits, pushout and
  pullback squares and left exact functors (§1.2).
- **Rigidification (Layer 2).** Rigidification and the coherent nerve, the H-enriched homotopy category of a
  simplicial set, mapping objects and categorical equivalences (§2.1); equivalences, essential surjectivity and
  the agreement of the two homotopy categories of a simplicial set.
- **Fibrations (Layers 3–5).** Left and right fibrations and left anodyne maps, joins and slices along inner and
  left fibrations, Kan complexes as ∞-groupoids, mapping spaces and cores, transport along left fibrations, final
  objects and the uniqueness of colimits.
- **Unmarked straightening (Layers 6–7).** The covariant and contravariant model structures over a base; the
  ∞-category of spaces, essential smallness, straightening, unstraightening and classifying maps (§7.1); the
  twisted realization; the straightening theorem for right fibrations and their classification.
- **The comparison theorem and the Joyal model structure (Layers 8–9).** Mapping spaces of quasicategories and of
  their rigidifications, final objects through the homotopy category, and the Joyal model structure.
- **Minimal models and truncation (Layer 10).** Homotopy relative to a subcomplex, n-categories and truncated
  objects (§10.1); categorical fibrations over an ∞-category, minimal models of inner fibrations, and truncated
  morphisms.

**Headline theorems.**
- The straightening theorem for right fibrations: straightening and unstraightening form a Quillen equivalence
  between simplicial sets over S and simplicial presheaves on the rigidification of S (HTT, Thm. 2.2.1.2, p. 92).
- Right fibrations are exactly the contravariantly fibrant objects (HTT, Cor. 2.2.3.12, p. 103).
- Every small right fibration is classified, up to pointwise equivalence, by a map to the opposite of the
  ∞-category of spaces, and equivalent maps classify pointwise equivalent right fibrations (§7.7).
- The comparison theorem: the counit of rigidification and coherent nerve is a weak homotopy equivalence on
  mapping spaces of every locally Kan simplicial category (HTT, Thm. 2.2.0.1, p. 90).
- Existence of the Joyal model structure: cofibrations the monomorphisms, weak equivalences the categorical
  equivalences, fibrations the categorical fibrations, fibrant objects the ∞-categories; it is Cartesian closed and
  Quillen equivalent to the Bergner structure (HTT, Thms. 2.2.5.1 and 2.4.6.1, pp. 107 and 154).
- Joyal's form of categorical equivalences, through homotopy categories of functor ∞-categories (HTT,
  Prop. 2.2.5.8, p. 112).
- Categorical fibrations over an ∞-category (HTT, Cor. 2.4.6.5).
- Minimal models of inner fibrations (HTT, Prop. 2.3.3.8, p. 121).
- The ∞-categories equivalent to n-categories are those with truncated mapping spaces (HTT, Prop. 2.3.4.18,
  p. 130).

## Scope and ownership

This roadmap is the first Part of the InfinityCategoryTheory family; it consumes Mathlib, Tau Ceti and the ModelCategoryTheory
family.

The following statements are already in the library, and the layers below use them through the supplier
contracts:

- the nerve–homotopy-category adjunction (HTT, Prop. 1.2.3.1, p. 46): Mathlib `CategoryTheory.nerveAdjunction`;
- the coherent nerve of a locally Kan simplicial category is a quasicategory (HTT, Prop. 1.1.5.10, p. 41): Tau Ceti
  `CategoryTheory.SimplicialNerve.quasicategory`;
- the two lifting-class conventions (HTT, Examples 2.0.0.1 and 2.0.0.2, p. 71): Kan fibrations and anodyne maps are
  Mathlib's horn generators `SSet.modelCategoryQuillen.J`, their right lifting class, and `SSet.anodyneExtensions`;
  trivial fibrations and their left lifting class, the monomorphisms, are Mathlib `SSet.rlp_monomorphisms` and Tau
  Ceti `SSet.rlp_monomorphisms_iff`;
- the universal property of slices and coslices (HTT, Prop. 1.2.9.2, p. 60): Tau Ceti `SSet.slice.homEquiv` and
  `SSet.coslice.homEquiv`;
- slices of a quasicategory are quasicategories, and the slice projection is a right fibration (HTT,
  Prop. 1.2.9.3, first assertion, p. 61): Tau Ceti `SSet.slice.quasicategory` and `SSet.slice.rightFibration_π`;
- Joyal's characterization of equivalences by outer horns `Λ[n, 0]` (HTT, Prop. 1.2.4.3, p. 52): Tau Ceti
  `SSet.Edge.isEquivalence_iff_hornFilling_zero`;
- the pushout-product of a left anodyne map with a monomorphism is left anodyne (HTT, Cor. 2.1.2.7, p. 82): Tau
  Ceti `SSet.leftAnodyneExtensions_pushoutObjObjι'`, with the right-anodyne form
  `SSet.rightAnodyneExtensions_pushoutObjObjι'`;
- the pushout-product of an anodyne map with a monomorphism is anodyne (HTT, Remark 2.1.2.8, p. 83): Mathlib
  `SSet.anodyneExtensions_pushoutObjObjι`;
- the pullback-hom of a monomorphism and a left fibration is a left fibration (HTT, Cor. 2.1.2.9, first assertion,
  p. 83): Tau Ceti `SSet.leftFibration_pullbackObjObjπ`;
- the pullback-hom of a monomorphism and an inner fibration is an inner fibration (HTT, Cor. 2.3.2.5, first half,
  p. 119): Mathlib `SSet.innerFibration_pullbackObjObjπ`.

Boundaries:

- **Model-categorical background.** Weakly saturated classes, the small object argument, Smith's recognition
  theorem, Quillen adjunctions and projective model structures belong to ModelCategoryTheory, Part
  ModelCategories. The Kan–Quillen model structure, weak homotopy equivalences, Whitehead's theorem, the long exact
  sequence of a Kan fibration and truncated Kan complexes belong to ModelCategoryTheory, Part KanQuillen. Simplicial
  model categories, the Bergner model structure and the localization of simplicial categories belong to
  ModelCategoryTheory, Parts SimplicialCategories and EnrichedLocalization.
- **Definitions.** Quasicategories and Kan complexes are Mathlib's; left and right fibrations, cores, slices,
  right mapping spaces, final vertices, colimits and fully faithful maps are Tau Ceti's, with their Checks in the
  supplier contracts. The definitions this Part adds are those listed in the Summary.
- **What comes next.** Cartesian and coCartesian edges and fibrations, marked simplicial sets and the Cartesian
  model structure are the subject of the Part CartesianFibrations, which also proves that Tau Ceti's
  `SSet.QCat.IsCategoricalEquivalence` (equivalence in the bicategory of ∞-categories) characterizes the
  categorical equivalences of §2.1 between ∞-categories (its §3.4). Lurie's other equivalent conditions for local
  smallness are theorems of the Part AccessibleInfinityCategories (§4.2). The comparison of the three mapping spaces `Hom^R`,
  `Hom` and `Hom^L`, cofinality and its
  converse, which consumes the classifying maps of §7.7, are in the Part LimitsAndKanExtensions. Marked
  straightening and the classification of Cartesian fibrations by maps to `Cat∞` are in the Part Straightening;
  its §2.5 identifies the universal right fibration of §7.1 with Lurie's restriction of the universal Cartesian
  fibration (HTT, Cor. 3.3.2.7) and the classifying maps of §7.1 with those read through `Cat∞ᵒᵖ` and the
  inclusion of spaces into `Cat∞`.
  Truncation functors, Postnikov towers and the slice and limit properties of truncated morphisms are in the Part
  PresentableInfinityCategories.

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.1.2` here and `Part InfinityCategoryFoundations §2.1.2`
elsewhere, is one target.

Each convention comes with a witness that pins it down.

- **∞-categories.** An ∞-category is a quasicategory: a simplicial set `C : SSet.{u}` with Mathlib's
  `SSet.Quasicategory C`. Witness: the nerve of a category and every `Δ[n]` are quasicategories, while the horn
  `Λ[2, 1]` is not (its inner horn has no filler inside it).
- **Objects, morphisms and directions.** Objects are vertices `C _⦋0⦌`. A morphism from x to y is Mathlib's
  `SSet.Edge x y`, an edge with source vertex 0 at x and target vertex 1 at y. Witness: `Δ[1]` has a
  nondegenerate edge from 0 to 1 and none from 1 to 0.
- **Equivalences.** An equivalence is Tau Ceti's `SSet.Edge.IsEquivalence`: an edge with an inverse up to
  2-simplices. For a quasicategory these are the edges that become isomorphisms in Mathlib's homotopy category
  `SSet.hoFunctor.obj C` (Tau Ceti `SSet.Edge.isEquivalence_iff_isIso`). Witness: in the nerve of the walking
  isomorphism both nondegenerate edges are equivalences; in `Δ[1]` the nondegenerate edge is not one.
- **Lifting classes.** A Kan fibration is a map with the right lifting property against all horns (Mathlib's
  `SSet.modelCategoryQuillen.J`); a trivial fibration has the right lifting property against all monomorphisms,
  equivalently against the boundary inclusions; a left fibration has it against the horns `Λ[n, i] ⊆ Δ[n]` with
  `0 ≤ i < n`, a right fibration against those with `0 < i ≤ n` (Tau Ceti `SSet.LeftFibration`,
  `SSet.RightFibration`). Left and right anodyne maps are the left lifting classes of left and right fibrations
  (Tau Ceti `SSet.leftAnodyneExtensions`, `SSet.rightAnodyneExtensions`). Witness: the inclusion of the vertex 0
  into `Δ[1]` is the horn `Λ[1, 0]`, hence left anodyne, and it is a right fibration but not a left fibration:
  the edge from 0 to 1 has no lift starting at the vertex.
- **Final objects.** A final object of an ∞-category is a strongly final vertex, Tau Ceti's `SSet.IsTerminalVertex`:
  every `∂Δ[n] → C` with n ≥ 1 and last vertex at it extends to `Δ[n]` (§1.2, HTT, Def. 1.2.12.3);
  initial objects are the dual notion. Witness: in `Δ[n]` the vertex n is final and, for n ≥ 1, the vertex 0 is
  not; in `Λ[2, 1]` no vertex is final, since there is no edge from 0 to 2.
- **Weak homotopy equivalences.** A weak homotopy equivalence of simplicial sets is Tau Ceti's
  `SSet.IsWeakHomotopyEquivalence`: a bijection on homotopy classes of maps into every Kan complex. Its agreement
  with the realization-based notion is discussed in ModelCategoryTheory, Part KanQuillen. A Kan
  complex K is contractible when K → Δ[0] is a trivial fibration, equivalently when it is weakly contractible
  (Tau Ceti `SSet.IsWeaklyContractible`). Witness: `∂Δ[1] → Δ[0]` is not a weak homotopy equivalence (two
  components), `Δ[n] → Δ[0]` is.
- **Truncation indices.** A Kan complex is k-truncated, for k ≥ −1, when its homotopy groups vanish above degree k at
  every vertex: for k ≥ 0 this is ModelCategoryTheory, Part KanQuillen §5.1, and at k = −1 the same condition
  says that every homotopy group, π₀ included, is trivial at every vertex, so that the Kan complex is empty or contractible. It is (−2)-truncated
  when it is contractible (HTT, Def. 2.3.4.15, p. 130). Witness: the empty Kan complex is k-truncated for every k ≥ −1 and is not (−2)-truncated;
  `Δ[0] ⊔ Δ[0]` is 0-truncated and not (−1)-truncated.
- **Products and exponentials.** Products are the cartesian monoidal structure `⊗` of `SSet`; the exponential
  `X^K` is `(ihom K).obj X`, also written `Fun(K, X)`; for a map i : A → B and p : X → S, the pullback-hom
  `X^B → X^A ×_{S^A} S^B` is Mathlib's `Functor.PullbackObjObj.ofHasPullback MonoidalClosed.internalHom i p`, with
  projection `.π`. Witness: for i the inclusion of the empty simplicial set, the pullback-hom is `X^B → S^B`; for
  B = Δ[0] the exponential is X itself.
- **Joins, slices and pushout-joins.** The join `K ⋆ L` is Tau Ceti's `SSet.join`, with
  `Δ[n] ⋆ Δ[m] ≅ Δ[n + m + 1]` and the vertices of K first. The slice `C_{/p}` of p : K → C is Tau Ceti's
  `SSet.slice p`, whose n-simplices are maps `Δ[n] ⋆ K → C` restricting to p; the coslice `C_{p/}` is
  `SSet.coslice p`, with n-simplices `K ⋆ Δ[n] → C`. For A₀ ⊆ A and B₀ ⊆ B the pushout-join is the inclusion
  `(A₀ ⋆ B) ∪ (A ⋆ B₀) ⊆ A ⋆ B` (Tau Ceti `SSet.Subcomplex.unionJoin`). Witness: for K empty, `C_{/p}` and `C_{p/}`
  are C (Tau Ceti `SSet.slice.isIso_π`); for K = Δ[0] at y, the vertices of `C_{/p}` are the edges into y; the
  pushout-join of `Λ[1, 1] ⊆ Δ[1]` with `∅ ⊆ Δ[0]` is `Λ[2, 1] ⊆ Δ[2]`.
- **Mapping spaces.** `Hom^R_C(x, y)` is Tau Ceti's `SSet.rightMappingSpace C x y`: its n-simplices are the
  (n+1)-simplices whose last vertex is y and whose face on the first n+1 vertices is constant at x. Witness: its
  vertices are the edges from x to y (Tau Ceti `SSet.rightMappingSpace.obj₀Equiv`).
- **Cones.** For a simplicial set K, `K◁ = Δ[0] ⋆ K` and `K▷ = K ⋆ Δ[0]` (§1.2, HTT, Notation
  1.2.8.4); the cone point of `K◁` is a source and that of `K▷` a target. Witness: `Δ[0]▷ = Δ[1]` with the cone
  point as the vertex 1.
- **Simplicial categories, rigidification and the coherent nerve.** Simplicial categories are Mathlib's
  `CategoryTheory.SimplicialCategory`, with mapping simplicial sets `a ⟶[SSet] b`. The rigidification `C[S]` of a
  simplicial set is defined in §2.1 (HTT, Def. 1.1.5.5, the adjunction), and its value on `Δ[n]` is
  Mathlib's `CategoryTheory.SimplicialThickening`. The coherent nerve is Mathlib's `CategoryTheory.SimplicialNerve`,
  with functoriality Tau Ceti `CategoryTheory.simplicialNerveMap`. A simplicial category is locally Kan when all
  its mapping simplicial sets are Kan complexes. Witness: `C[Δ[1]]` has mapping simplicial set Δ[0] from 0 to 1,
  and `C[Δ[2]]` has mapping simplicial set Δ[1] from 0 to 2.
- **Homotopy categories.** The homotopy category of a simplicial set is Mathlib's `SSet.hoFunctor`. The
  H-enriched homotopy category of a simplicial category is that of §1.1; the H-enriched form for
  simplicial sets, the mapping objects `Map_S(x, y)` in the homotopy category H of spaces, and categorical
  equivalences are those of §2.1 (HTT, Def. 1.1.5.14 and Def. 1.2.2.1). Witness: the homotopy category of
  `Λ[2, 1]` is the poset [2], with a composite from 0 to 2 that `Λ[2, 1]` itself does not contain.
- **Straightening.** Straightening is indexed by a simplicial functor φ : C[S] → Cᵒᵖ and goes from simplicial
  sets over S to simplicial functors C → SSet (§7.1); it matches right fibrations over S with
  presheaves, and the model structure used over S is the contravariant one. Write `St_S` and `Un_S` when C is
  `C[S]ᵒᵖ` and φ is the identity. Witness: over S = Δ[0], `St_S` sends Δ[0] to Δ[0] and the empty simplicial set to
  the empty one.
- **Spaces.** `Kan` is the simplicial category of small Kan complexes and S = N(Kan) the ∞-category of spaces
  (§7.1, HTT, Def. 1.2.16.1); write `Sᵒᵖ` for the coherent nerve `N(Kanᵒᵖ)` of the opposite simplicial category,
  isomorphic to the opposite of S, and ∗ for its vertex Δ[0]. As in HTT, the letter S also names the base of
  straightening and of fibrations in Layers 6–8, the straightening paragraphs of §7.1 included; in the
  classification statements of §7.1 and §7.7 the base is called K and S means spaces.
  Witness: an edge of `Sᵒᵖ` from K to L is a map of Kan complexes L → K; the vertex ∗ is final in S and initial,
  not final, in `Sᵒᵖ`.
- **Universes and pages.** Simplicial sets live in one universe u; a simplicial category has objects in a universe
  u and mapping simplicial sets in `SSet.{v}`. S, `Sᵒᵖ` and the simplicial sets built from them in §7.7 live in
  `SSet.{u+1}`, and the results of Layers 1–7 used there are applied in that universe, in which `Kan` is small.
  Page numbers are those of the cited PDF.
- **Size.** Small means living in `Type u` or `SSet.{u}`, large means living in the next universe; κ-small simplicial
  sets are defined in §1.1 and essentially small ∞-categories in §7.1 (HTT, §1.2.15). Large ∞-categories (spaces, presheaves,
  `Cat∞`) are objects of `SSet.{u+1}`. Witness: Δ[n] is ω-small for every n although
  it has infinitely many simplices.
- **H and classes in H.** H is the homotopy category of simplicial sets for the Kan–Quillen weak equivalences
  (ModelCategoryTheory, Part KanQuillen, HTT §A.2.7; Part ModelCategories, HTT §A.2.2, p. 830). For a simplicial
  set X, `[X]` is its image in H. A morphism of H between classes of Kan complexes is a homotopy class of maps. Witness: `[∂Δ[1]]`
  and `[Δ[0]]` are not isomorphic, while `[Δ[1]]` and `[Δ[0]]` are.
- **Duality.** The opposite of a simplicial set is Mathlib's `SSet.opFunctor`; every notion has the dual notion
  obtained by passing to opposites, stated with the primary one. Witness: the opposite of Δ[1] is isomorphic to
  Δ[1] with the vertices exchanged, so its final vertex is 0.
- **Variance of classifying maps.** A right fibration over K is classified by a map `K → Sᵒᵖ` and a left
  fibration by a map `K → S` (§7.1). Fibers of a right fibration are contravariant in the base: an edge k → k′ of
  K induces a map from the fiber over k′ to the fiber over k. Witness: the right fibration {0} ⊆ Δ[1] has fibers
  Δ[0] over 0 and ∅ over 1, and the only map between them goes from ∅ to Δ[0], from the fiber over 1 to the fiber
  over 0.

## Exact supplier contracts

### From Mathlib

Paths are relative to the Mathlib repository at the pin.

- `SSet.Quasicategory` (`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean`), `SSet.KanComplex`
  (`Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean`), `SSet.InnerFibration` and
  `SSet.innerAnodyneExtensions` (`Mathlib/AlgebraicTopology/Quasicategory/InnerFibration.lean`,
  `Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/Basic.lean`), with
  `SSet.innerAnodyneExtensions_pushoutObjObjι`, `SSet.innerAnodyneExtensions_unionProd_ι` and
  `SSet.innerFibration_pullbackObjObjπ` (`…/AnodyneExtensions/Inner/`). The instance making `(ihom A).obj X` a
  quasicategory for a quasicategory X is in
  `Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean`. Nerves of categories are ∞-categories by `CategoryTheory.Nerve.quasicategory`. `SSet.innerFibrations` is the class of inner fibrations (HTT, Def. 2.0.0.3, p. 71, its inner case).
  **Checks** (`SSet.KanComplex`, `SSet.Quasicategory`, `CategoryTheory.Nerve.quasicategory`).
  - Δ[0] ⊔ Δ[0] is a Kan complex; Δ[1] is an ∞-category but not a Kan complex (the horn Λ[2,0] with edges
    0 → 1 and the identity of 0 has no filler); so the two classes differ.
  - ∂Δ[2] is not an ∞-category: the inner horn Λ[2,1] ⊆ ∂Δ[2] has no filler in ∂Δ[2], since the only
    2-simplices of ∂Δ[2] are degenerate. A definition testing only 1-dimensional lifting would accept it.
  - The nerve of any category is an ∞-category; the nerve
    of a category is a Kan complex exactly when the category is a groupoid, so the nerve of [1] separates
    the two notions again.
  **Checks** (the internal hom `(ihom K).obj C`).
  - `Fun(Δ[0], C)` is C and `Fun(∅, C)` is Δ[0], not ∅: there is exactly one functor out of ∅.
  - The vertices of `Fun(Δ[1], C)` are the edges of C, and an edge of `Fun(Δ[0] ⊔ Δ[0], C)` is a pair of
    edges: natural transformations are maps `K × Δ[1] → C`, not maps `K ⋆ Δ[0] → C`.
  - For C the nerve of a category D, `Fun(N(E), C)` is the nerve of the functor category from E to D.
- `SSet.modelCategoryQuillen.I` (boundaries), `SSet.modelCategoryQuillen.J` (horns), the scoped fibrations
  `J.rlp` and cofibrations (monomorphisms), and `SSet.rlp_monomorphisms`
  (`Mathlib/AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`). No `ModelCategory SSet` instance is
  assumed.
- `SSet.anodyneExtensions` and `SSet.anodyneExtensions_pushoutObjObjι`
  (`Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Basic.lean`, `…/PushoutProduct.lean`).
- `SSet.Edge`, `SSet.Edge.map`, `SSet.Edge.CompStruct`, `SSet.Edge.InvStruct`
  (`Mathlib/AlgebraicTopology/SimplicialSet/CompStruct.lean`).
- `SSet.hoFunctor` (`Mathlib/AlgebraicTopology/SimplicialSet/HomotopyCat.lean`) and its monoidal structure
  `SSet.hoFunctor.monoidal` (`…/SimplicialSet/HoFunctorMonoidal.lean`): the homotopy category of `X ⊗ Y` is
  equivalent to the product of the homotopy categories, for all simplicial sets X and Y; `CategoryTheory.nerve`,
  `CategoryTheory.nerveFunctor` (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`),
  `CategoryTheory.nerveAdjunction : SSet.hoFunctor ⊣ nerveFunctor`
  (`Mathlib/AlgebraicTopology/SimplicialSet/NerveAdjunction.lean`), `SSet.IsStrictSegal` and the strict Segal
  structure of nerves (`Mathlib/AlgebraicTopology/SimplicialSet/StrictSegal.lean`).
- `CategoryTheory.SimplicialCategory` (`Mathlib/AlgebraicTopology/SimplicialCategory/Basic.lean`),
  `CategoryTheory.SimplicialThickening` and `CategoryTheory.SimplicialNerve`
  (`Mathlib/AlgebraicTopology/SimplicialNerve.lean`), `CategoryTheory.EnrichedFunctor`
  (`Mathlib/CategoryTheory/Enriched/Basic.lean`).
  **Checks** (`CategoryTheory.SimplicialCategory`, `CategoryTheory.EnrichedFunctor`).
  - Every ordinary category is a simplicial category with discrete (constant) mapping simplicial sets; its
    simplicial nerve is its ordinary nerve. A definition requiring Kan mapping spaces still accepts it.
  - Simplicial sets themselves, with mapping objects the internal homs, form a simplicial category
    (Mathlib's instance on `SSet`); mapping objects need not be Kan (`Fun(Δ[0], Δ[1])` is Δ[1]).
  - A one-object simplicial category is a simplicial monoid; Δ[1] with the maximum operation is one, so
    mapping objects need not be discrete.
  **Checks** (`CategoryTheory.SimplicialThickening`).
  - For J = [1], the mapping object from 0 to 1 is a point; for J = [2], from 0 to 2 it is Δ[1] (the subsets
    {0,2} ⊂ {0,1,2}). A rigidification by the free category on the 1-skeleton would give two discrete
    points there (the paths 02 and 01 then 12), and the homotopy category `hΔ[2]` a single point.
  - Mapping objects backwards are empty: from 1 to 0 in `C[Δ^1]` there is nothing.
  - For the monotone map [1] → [0], the induced functor sends the mapping object from 0 to 1 to the one from
    0 to 0, a point, so constant maps are respected; a functoriality by preimages would not be defined.
  **Checks** (`CategoryTheory.SimplicialNerve`).
  - For C an ordinary category with discrete mapping objects, N(C) is the ordinary nerve.
  - The 2-simplices of N(C) are triples of morphisms with an edge in `Map(X₀, X₂)` from the third
    morphism to the composite (the edge {0,2} ⊆ {0,1,2} of `Map(0,2)` in `C[Δ^2]`), not a commuting
    triangle: for C the simplicial category of Kan complexes (§7.1)
    a 2-simplex is a homotopy, which separates N(C) from the nerve of the underlying category.
  - The vertices of N(C) are the objects of C, and N of the empty simplicial category is ∅.
- `SSet.stdSimplex` (`Mathlib/AlgebraicTopology/SimplicialSet/StdSimplex.lean`), `SSet.horn` (`…/Horn.lean`),
  `SSet.boundary` (`…/Boundary.lean`), `SSet.ι₀`, `SSet.ι₁` and `SSet.Subcomplex.unionProd` (`…/Monoidal.lean`),
  `SSet.relativeCellComplexOfMono` (`…/Skeleton.lean`), `SSet.opFunctor`
  (`Mathlib/AlgebraicTopology/SimplicialSet/Op.lean`). Also `SSet.nonDegenerate`, `SSet.uliftFunctor`, `SSet.const`, `SimplexCategory` and `AugmentedSimplexCategory`.
- `MorphismProperty.monomorphisms`, `MorphismProperty.llp`, `MorphismProperty.rlp`,
  `CategoryTheory.Functor.PullbackObjObj` (`Mathlib/CategoryTheory/Limits/Shapes/Pullback/PullbackObjObj.lean`),
  `CategoryTheory.Over.mapPullbackAdj` (`Mathlib/CategoryTheory/Comma/Over/Pullback.lean`), and
  `HomotopicalAlgebra.ModelCategory` (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`).
- `SSet.QCat`, `SSet.QCat.bicategory` (`Mathlib/AlgebraicTopology/Quasicategory/StrictBicategory.lean`): the bicategory
  of ∞-categories, with hom-categories the homotopy categories of the functor ∞-categories;
  `CategoryTheory.Bicategory.Adjunction` (`Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean`).
- 1-categorical comparison notions, used only in Checks and as later comparison targets: `CategoryTheory.Functor.EssSurj`.

### From Tau Ceti

Paths are relative to the Tau Ceti repository; each declaration keeps its own hypotheses.

- `SSet.LeftFibration`, `SSet.RightFibration`, the class `SSet.leftFibrations`, `SSet.leftAnodyneExtensions`,
  `SSet.rightAnodyneExtensions`
  (`TauCeti/AlgebraicTopology/SimplicialSet/AnodyneExtensions/LeftRight/Basic.lean`), and the pushout-product
  theorems `SSet.leftAnodyneExtensions_pushoutObjObjι'`, `SSet.rightAnodyneExtensions_pushoutObjObjι'`,
  `SSet.leftFibration_pullbackObjObjπ`, `SSet.rightFibration_pullbackObjObjπ`, with the generating cases
  `SSet.prodStdSimplex.leftAnodyneExtensions_unionProd_ι` (`…/LeftRight/PushoutProduct.lean`).
  **Checks** (`SSet.LeftFibration`, `SSet.RightFibration`, `SSet.leftAnodyneExtensions`).
  - The inclusion of the vertex 0 into Δ[1] is a right fibration (the only nontrivial square, for Λ[1,1],
    cannot be formed), and it is not a left fibration (Λ[1,0] → {0} over the identity of Δ[1] has no lift).
  - Every left fibration is an inner fibration, and the map Δ[1] → Δ[0] is an inner fibration that is
    neither left nor right.
  - Δ[1] → Δ[0] is not a left fibration (the horn Λ[2,0] with edges 0 → 1 and 0 → 0 has no filler) and not a
    right fibration (dually, Λ[2,2]), so the outer horns matter.
- `SSet.Edge.IsEquivalence`, `SSet.Edge.isEquivalence_iff_isIso`, `SSet.Edge.isEquivalence_of_kanComplex`,
  `SSet.Edge.IsEquivalence.map`, `SSet.core`, `SSet.range_le_core_iff`, `SSet.le_core_of_kanComplex`
  (`TauCeti/AlgebraicTopology/Quasicategory/Core.lean`); `SSet.Truncated.HomotopyCategory₂.equivalence`
  (`…/Quasicategory/HomotopyCategory.lean`); `SSet.Edge.isEquivalence_iff_hornFilling_zero` and
  `SSet.Quasicategory.hornFilling_zero` (`…/Quasicategory/OuterHorn.lean`);
  `SSet.Edge.isEquivalence_map_iff_of_rightFibration` and `SSet.RightFibration.hasLift_of_isEquivalence`
  (`…/Quasicategory/RightFibration.lean`). The outer-horn theorem is proved there for `Λ[n, 0]` only. Also `SSet.Edge.CompStruct.isEquivalence₀₂` (`…/Quasicategory/Core.lean`): a 2-simplex whose first two edges are equivalences has an equivalence as third edge.
  **Checks** (`SSet.core`).
  - The core of the nerve of a category is the nerve of its groupoid of isomorphisms.
  - The core of Δ[1] is ∂Δ[1], and the core of a Kan complex is the whole complex; a definition keeping all
    edges would return Δ[1].
  - The core of Δ[2] is three points: a 2-simplex all of whose edges are degenerate is degenerate, so no
    nondegenerate simplex survives.
- `SSet.join`, `SSet.Subcomplex.unionJoin` (`TauCeti/AlgebraicTopology/SimplicialSet/Join/`), `SSet.slice`,
  `SSet.slice.π`, `SSet.slice.homEquiv`, `SSet.slice.map`, `SSet.slice.restrictionMap`, `SSet.slice.isIso_π`
  (`…/SimplicialSet/Slice.lean`), `SSet.coslice`, `SSet.coslice.π`, `SSet.coslice.homEquiv`,
  `SSet.coslice.map`, `SSet.coslice.opSliceIso` (`…/SimplicialSet/Coslice.lean`), `SSet.slice.quasicategory`,
  `SSet.slice.rightFibration_π`, `SSet.slice.rightFibration_map`, `SSet.slice.hasLift_of_isEquivalence`
  (`…/Quasicategory/Slice.lean`). Tau Ceti has no left-fibration form of the coslice projection.
  **Checks** (`SSet.join`).
  - `Δ[i−1] ⋆ Δ[j−1]` is `Δ[i+j−1]`; in particular `Δ[0] ⋆ Δ[0]` is Δ[1], while `Δ[0] × Δ[0]` is Δ[0].
  - ∅ is a unit on both sides, so `∅ ⋆ K` is K; a product-type construction would give ∅.
  - The join is not symmetric: `Δ[0] ⋆ (Δ[0] ⊔ Δ[0])` is Λ[2,0] and `(Δ[0] ⊔ Δ[0]) ⋆ Δ[0]` is Λ[2,2].
- `SSet.rightMappingSpace`, `SSet.rightMappingSpace.obj₀Equiv`, `SSet.rightMappingSpace.hornFilling` (for
  horns `Λ[n, i]` with i ≠ 0) and its quasicategory instance (`…/Quasicategory/RightMappingSpace.lean`). The Kan
  property is not proved there.
- `SSet.IsTerminalVertex`, `SSet.IsInitialVertex` (`…/Quasicategory/TerminalVertex.lean`,
  `…/InitialVertex.lean`), `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.coslice.IsColimit.isEquivalence`
  (`…/Quasicategory/Limit.lean`), `SSet.fullEnhancedSubcategory` (`…/Quasicategory/FullSubcategory.lean`),
  `SSet.IsFullyFaithful` (`…/Quasicategory/FullyFaithful.lean`). In the nerve of a category the final vertices are the terminal objects (`CategoryTheory.nerve.isTerminalVertex_iff`).
  **Checks** (`SSet.IsTerminalVertex`, `SSet.IsInitialVertex`, `CategoryTheory.nerve.isTerminalVertex_iff`).
  - In Δ[n] the vertex n is final and 0 is initial; in Δ[1], 1 is final and not initial, so the direction is
    pinned. In ∂Δ[1] and in ∅ no vertex is final (the boundary of Δ[1] sending 0 to the other vertex and 1
    to the candidate has no extension).
  - In Λ[2,1] the vertex 2 is not strongly final (no edge from 0 to 2), although every mapping object
    `Map(x, 2)` in `hΛ[2,1]` is a point (for x = 0 it is the point `C[Λ[2,1]](0,2)`, the composite). So the
    H-enriched notion of HTT Def. 1.2.12.1 and the strong one differ off ∞-categories.
  - In the nerve of a category, the final vertices are the terminal objects.
  **Checks** (`SSet.slice.IsLimit`, `SSet.coslice.IsColimit`).
  - For K = ∅, `C_{p/}` is C, so a colimit of the empty diagram is an initial object; a definition through
    final vertices would give final objects.
  - For K = Δ[0], `C_{p/}` is `C_{x/}`, whose identity of x is initial, so every one-vertex diagram is its own
    colimit.
  - For K = Δ[0] ⊔ Δ[0] in the nerve of a poset, colimits are joins: in the nerve of {a, b} with no order, the
    diagram (a, b) has no colimit.
- `SSet.fiber` and its Kan and quasicategory instances (`…/SimplicialSet/Fiber.lean`), `SSet.ihomOver`
  (`…/SimplicialSet/InternalHom.lean`), `SSet.IsWeaklyContractible` (`…/SimplicialSet/WeaklyContractible.lean`),
  `SSet.IsWeakHomotopyEquivalence` (`…/SimplicialSet/WeakHomotopyEquivalence.lean`), `SSet.rlp_monomorphisms_iff`
  (`…/SimplicialSet/TrivialFibration.lean`), `SSet.anodyneExtensions.isWeakHomotopyEquivalence`
  (`…/SimplicialSet/AnodyneExtensions/WeakHomotopyEquivalence.lean`), `SSet.KanComplex.π`
  (`…/SimplicialSet/KanComplex/HomotopyGroup.lean`).
  **Checks** (`SSet.IsWeakHomotopyEquivalence`).
  - ∂Δ[1] → Δ[0] is not one: for Z = ∂Δ[1], `π₀ Fun(Δ[0], Z)` has two elements and `π₀ Fun(∂Δ[1], Z)` four.
  - Δ[1] → Δ[0] and Λ[2,1] ⊆ Δ[2] are weak homotopy equivalences, although Δ[1] → Δ[0] is not a categorical
    equivalence; a definition by categorical equivalence would reject it.
  - ∅ → Δ[0] is not one: for Z = Δ[0] ⊔ Δ[0] the two sides have two elements and one.
  **Checks** (`SSet.KanComplex.π`).
  - For X = Δ[0] ⊔ Δ[0], `π 0` at either vertex has two elements: π₀ is the set of components, not a point.
  - For the singular complex of the circle, `π 1` is ℤ and `π 2` is trivial.
  - For n = 0 there is no group structure; the class of x is a base point only.
- `CategoryTheory.simplicialNerveMap`, `CategoryTheory.SimplicialNerve.fromNerve`
  (`TauCeti/AlgebraicTopology/SimplicialNerve/Basic.lean`), `CategoryTheory.SimplicialNerve.quasicategory`
  (`…/SimplicialNerve/Quasicategory.lean`), `TauCeti.HornThickening` (`…/SimplicialNerve/HornThickening/`),
  `CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence` (`TauCeti/AlgebraicTopology/SimplicialCategory/DwyerKan.lean`),
  `TauCeti.SimplicialHomotopyCategory` and `CategoryTheory.EnrichedFunctor.mapHomotopyCategory`
  (`…/SimplicialCategory/HomotopyCategory.lean`). Tau Ceti's `SSet.CategoricalFibration`
  (`…/Quasicategory/CategoricalFibration.lean`) is not used: it imposes on arbitrary maps the condition that
  defines isofibrations between ∞-categories (an inner fibration along which equivalences lift; Kerodon,
  Def. 4.4.1.4), which is weaker than the categorical fibrations of §9.4.1 (Kerodon's isofibrations of simplicial
  sets, Def. 4.5.6.5) when the target is not an ∞-category. This roadmap takes that declaration to be removed and
  the name `SSet.CategoricalFibration` to denote the notion of §9.4.1; over an ∞-category the two agree (§10.2.4). Also `SSet.QCat.IsCategoricalEquivalence` (`…/Quasicategory/CategoricalEquivalence.lean`), equivalence in the bicategory of ∞-categories. Also `CategoryTheory.simplicialNerveFunctor` (`…/SimplicialNerve/Basic.lean`), the simplicial nerve as a functor, right adjoint to rigidification.
- `SSet.IsLocallySmall`, `TauCeti.HasSmallSpaceModel` (`TauCeti/AlgebraicTopology/Quasicategory/LocallySmall.lean`,
  `TauCeti/AlgebraicTopology/SimplicialSet/SmallModel.lean`), with `CategoryTheory.nerve.isLocallySmall_iff`: an ∞-category is locally
  small when every right mapping space has a small Kan model (HTT, §5.4.1, p. 441, the definition after Prop.
  5.4.1.7).
  **Checks.**
  - The nerve of a category is locally small exactly when the category is.
  - Every small ∞-category is locally small.
  - The nerve of a one-object category whose endomorphism monoid has the size of the universe is not; a
    definition asking only for small sets of objects up to equivalence would accept it.
- `SSet.CoreEnriched`, `SSet.CatInftyΔ`, `SSet.catInfty` (`TauCeti/AlgebraicTopology/Quasicategory/CatInfty.lean`): `Cat^Δ_∞`, the
  simplicial category of small ∞-categories with mapping simplicial sets the cores `Fun(C, D)^≃`, and
  `Cat∞ = N(Cat^Δ_∞)` (HTT, Def. 3.0.0.1, p. 162).
  **Checks.**
  - The mapping object from Δ[0] to an ∞-category D is the core of D, not D: an edge of the mapping object
    `Fun(Δ[0], Δ[1])^≃ = ∂Δ[1]` is an equivalence between two functors, so the two vertex inclusions are not
    joined by an edge there, while in `Fun(Δ[0], Δ[1]) = Δ[1]` they are. The edges of `Cat∞` from Δ[0] to Δ[1]
    are the vertices of that mapping object, the two functors.
  - The vertices are the small ∞-categories; Λ[2,1] is not a vertex.
  - `Cat∞` lives in the next universe, `SSet.{u+1}`.

### From TauCetiRoadmap.ModelCategoryTheory

- Part ModelCategories: weakly saturated classes and their generation by a set (§1.3, §1.5; HTT, Def. A.1.2.2,
  Cor. A.1.2.7), the small object argument (§1.4; HTT, Prop. A.1.2.5), model categories and left properness (§3.4;
  HTT, Def. A.2.1.1, Def. A.2.4.1), homotopy pushouts (§3.5; HTT, §A.2.4, Prop. A.2.4.4), Quillen adjunctions and
  equivalences (§4.1, §4.2; HTT, §A.2.5, Prop. A.2.5.1), combinatorial model categories, perfect classes and Smith's
  recognition theorem (§5.5, §6.1, §6.3; HTT, Def. A.2.6.1, Def. A.2.6.12, Cor. A.2.6.14, Prop. A.2.6.15), and the
  projective model structure on diagrams (§7.2; HTT, Prop. A.2.8.2); change of enrichment along a
  finite-product-preserving functor (§8.2; HTT, Remark A.1.4.3, p. 815) and the homotopy category of a model
  category (§3.1; HTT, §A.2.2, p. 830), for the H-enriched homotopy categories of §1.1 and §2.1 of this Part.
- Part KanQuillen: homotopy groups of Kan complexes (§1.1), the long exact sequence of a Kan fibration (§1.2),
  Whitehead's theorem and homotopy equivalences of Kan complexes (§1.3), weak homotopy equivalences and the
  Kan–Quillen model structure with its properness and combinatoriality (Layer 3; HTT, §A.2.7, pp. 846–847), and
  truncated Kan complexes (§5.1); its homotopy category is H.
- Part SimplicialCategories: simplicial model categories and their homotopy categories (§1.2–§1.4, §5.9; HTT,
  Def. A.3.1.2, Def. A.3.1.5, Prop. A.3.1.7, Remarks A.3.1.8 and A.3.1.9, Prop. A.3.1.10), the projective structure
  on enriched diagrams (§6.1; HTT, §A.2.8 and Prop. A.3.3.2), invariance under Dwyer–Kan equivalence (§6.3; HTT,
  Prop. A.3.3.8), the Bergner model structure with its generators, colimits and left properness (§5.2, §5.4; HTT,
  Remark A.3.2.3, Prop. A.3.2.4), its fibrant objects and fibrations (§5.8; HTT, Thm. A.3.2.24), and the
  invertibility hypothesis (§5.6; HTT, Remark A.3.2.14); simplicially enriched diagram categories `Set_Δ^C` (§2.1; HTT,
  Def. A.3.3.1, p. 888), for the straightening functor of §7.1 of this Part.
- Part EnrichedLocalization: homotopy limits in `Cat_S` (§2.3; HTT, Cor. A.3.2.28), localization of simplicial
  categories (§2.1; HTT, Notation A.3.5.1), and the homotopy limits of diagram categories (§4.4; HTT,
  Lemma A.3.6.17, Cor. A.3.6.18).

## How to read the build

Layer 1 fixes the vocabulary of the whole family: sizes, the H-enriched homotopy categories of
simplicial categories with their equivalences, functor ∞-categories, subcategories, cones, limits and colimits. It
uses nothing from the later layers, and a reader new to the family starts there. Layer 2 defines rigidification,
the H-enriched homotopy category of a simplicial set and categorical equivalences (§2.1), then sets up nerves,
equivalences and essential surjectivity, the two notions of Dwyer–Kan equivalence, the rigidification of a simplex
and the inner-fibration property of coherent nerves, the agreement of the two homotopy categories of a simplicial
set, and ends with homotopy-invertible morphisms of locally Kan simplicial categories. Layer 3 develops left
fibrations and left anodyne maps: lifting of equivalences, Joyal's generators, pushout-products and the homotopy
extension property. Layer 4 adds joins and slices: pushout-joins of anodyne maps and slices along inner and left
fibrations. Layer 5 uses them to identify Kan complexes with ∞-groupoids, to make right mapping spaces and cores
into Kan complexes, to study left fibrations over Kan complexes and their transport functors, to treat final
objects and the uniqueness of colimits, and to show that the inclusion of a final object is right anodyne. Layer 6
shows that rigidification sends monomorphisms and inner anodyne maps to cofibrations and trivial cofibrations, and
uses it to construct the covariant and contravariant model structures. Layer 7 studies straightening: over a point
it is the twisted realization, over a simplex it is a Quillen equivalence, and by induction on the base
unstraightening is an equivalence onto right fibrations, which identifies the fibrant objects and weak equivalences
of the contravariant structure; unstraightening the inclusion of `Kan` then shows that every small right fibration
is pulled back from a single one over `Sᵒᵖ`, and that equivalent maps to `Sᵒᵖ` pull it back to pointwise
equivalent right fibrations. Layer 8 deduces the mapping-space comparison and with it the comparison of fully
faithful maps, the comparison theorem for the coherent nerve, the detection of final objects in the homotopy
category, and colimits in slices. Layer 9 uses the comparison theorem to build the Joyal model structure, shows
that its fibrant objects are the ∞-categories, and makes it Cartesian closed and Quillen equivalent to the Bergner
structure, and it ends with the agreement of categorical equivalences with Joyal's form, through left homotopy
in functor ∞-categories. Layer 10 proves a relative form of Joyal's outer-horn lemma, identifies the categorical fibrations over
an ∞-category with it, and uses the Joyal structure, the relative outer-horn lemma and a relative pointwise
criterion for equivalences to construct minimal models of inner fibrations, to characterize n-categories and the
∞-categories equivalent to them, and to set up truncated morphisms.

Layer 1 consists of definitions, and Layers 2, 7 and 10 open with a section of definitions (§2.1, §7.1 and §10.1):
the basic definitions of the family that the layer is the first to use, each with its Checks. Later Parts cite them
there. The few statements in these sections (the adjunction of §2.1 and the unstraightening adjunction of §7.1)
are the ones the definitions need in order to be usable.

## Layer 1: Sizes, enriched homotopy categories, functor ∞-categories, limits and colimits

This layer is the entry point of the family. It fixes the vocabulary that every later layer of this Part and every
later Part uses, and it needs nothing beyond Mathlib, Tau Ceti and the ModelCategoryTheory family. Objects,
morphisms, equivalences, slices, right mapping spaces and final objects are the library's, as the Conventions and
the supplier contracts record; the homotopy category of a simplicial set is Mathlib's `SSet.hoFunctor`.

§1.1 fixes sizes: small and large objects, κ-small simplicial sets and locally small ∞-categories. It then
defines the H-enriched homotopy category of a simplicial category and the equivalences between such
categories, the notion against which the later comparisons of models are measured. §1.2 names the functor
∞-categories and cores, and defines subcategories, the two cones on a simplicial set and the language of limits
and colimits: colimit and limit diagrams, admitting and preserving colimits, pushout and pullback squares,
coproducts and left exact functors.

The homotopy category of a simplicial set as an H-enriched category, categorical equivalences, mapping objects and
fully faithful maps need rigidification, and are defined in the next layer.

### 1.1 Size; equivalences of simplicial categories

Fix the size conventions (HTT, §1.2.15, pp. 68–69): small objects live in the fixed universe u, large ones in
the next. Large ∞-categories, such as the ∞-category of spaces, presheaf ∞-categories and `Cat∞`, are objects of
`SSet.{u+1}`. A small simplicial set is κ-small, for a cardinal κ, when it has fewer than κ nondegenerate simplices.

**Checks.**
- Δ[n] is small and ω-small, although it has infinitely many simplices: only finitely many are nondegenerate.
- ∅ is κ-small for every κ > 0, and Δ[0] ⊔ Δ[0] is 3-small but not 2-small.
- The nerve of the category of small sets is large: it has a vertex for every small set, more than any small
  simplicial set has.

Local smallness is Tau Ceti's `SSet.IsLocallySmall`: every right mapping space has a small Kan model (HTT,
§5.4.1, p. 441, the definition after Prop. 5.4.1.7); its Checks are in the supplier contract.

*Needs:* Mathlib universes and `SSet.nonDegenerate`; Tau Ceti `SSet.IsLocallySmall`.

**1.1.1.** The homotopy category `hC` of a simplicial category C is the H-enriched category with the same objects and
mapping objects `[Map_C(X, Y)]`, obtained by change of enrichment along the finite-product-preserving functor
`X ↦ [X]` (ModelCategoryTheory, Part ModelCategories §8.2; HTT, Remark A.1.4.3). An H-enriched functor is an
equivalence when it is essentially surjective on underlying categories (whose morphisms from X to Y are the
morphisms from the unit to the mapping object in H) and an isomorphism in H on every mapping object.

Define a simplicial functor F : C → C′ of simplicial categories to be an equivalence (a Dwyer–Kan
equivalence) when the induced functor `hC → hC′` of H-enriched categories, with mapping objects
`[Map_C(X, Y)]`, is an equivalence (HTT, Def. 1.1.4.4, p. 37). Tau Ceti's
`CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence` is the unwound form (weak homotopy equivalences on
mapping objects, essential surjectivity on homotopy categories); the comparison of the two is proved in the next
layer.

- Mapping objects need not be Kan complexes: the class of a simplicial set in H is taken directly.
- Equivalences are closed under composition and satisfy two-out-of-three, formally from the H-enriched
  form.

**Checks.**
- The simplicial functor `C[Δ^2] → [2]` (Mathlib's `SimplicialThickening (Fin 3)`) to the poset [2] (discrete mapping objects) is an equivalence: the
  mapping object from 0 to 2 is Δ[1], weakly contractible. It is not an isomorphism.
- The one-object simplicial category with endomorphism monoid Δ[1] (under the maximum) maps to the terminal
  simplicial category by an equivalence, although Δ[1] is not a Kan complex; a definition asking for homotopy
  equivalences of Kan mapping objects could not even be stated here.
- The one-object simplicial category with discrete endomorphism group ℤ/2 does not map to the terminal one by
  an equivalence: ℤ/2 and a point differ in H.

*Needs:* Mathlib `CategoryTheory.SimplicialCategory`, `CategoryTheory.EnrichedCategory`; ModelCategoryTheory, Part
ModelCategories §8.2.1 (HTT, Remark A.1.4.3) and Part KanQuillen (HTT, §A.2.7: H).

### 1.2 Functor ∞-categories, subcategories, cones, limits and colimits

Functor ∞-categories and cores need no new definition: `Fun(K, C)` is Mathlib's internal hom `(ihom K).obj C`
(Conventions), an ∞-category when C is one (HTT, Notation 1.2.7.2, p. 57), and the core is Tau Ceti's `SSet.core`,
the simplices all of whose edges are equivalences (HTT, §1.2.5, pp. 53–54). Their Checks are in the supplier
contracts. Later Parts cite them here.

**1.2.1.** Define, for an ∞-category C and a subcategory `(hC)₀` of its homotopy category `SSet.hoFunctor.obj C`, the
subcategory of C spanned by it as the pullback of `N((hC)₀) → N(hC)` along the unit `C → N(hC)` (HTT, §1.2.11, p. 62); a simplicial
subset of C is a subcategory when it arises this way. When `(hC)₀` is full, this is Tau Ceti's
`SSet.fullEnhancedSubcategory` of the objects of `(hC)₀`.

**Checks.**
- For `(hC)₀ = hC` the subcategory is C.
- For the nerve of a category D, the subcategory spanned by a subcategory D₀ is the nerve of D₀.
- In Δ[2], the edges 0 → 1 and 1 → 2 without 0 → 2 do not form a subcategory (not closed under composition),
  so the simplicial subset Λ[2,1] is not a subcategory of Δ[2]; the full subcategory on {0, 2} is Δ[1].

*Needs:* Mathlib `CategoryTheory.nerveAdjunction`, `SSet.hoFunctor`; Tau Ceti `SSet.fullEnhancedSubcategory`.

**1.2.2.** Define the left cone `K◁ = Δ[0] ⋆ K` and the right cone `K▷ = K ⋆ Δ[0]`, each with its cone point and the
inclusion of K (HTT, Notation 1.2.8.4, p. 59).

**Checks.**
- `∅▷` is Δ[0], the cone point alone.
- `Δ[n]▷` is `Δ[n+1]` with the cone point as last vertex, and `Δ[n]◁` is `Δ[n+1]` with the cone point first.
- `(Δ[0] ⊔ Δ[0])▷` is Λ[2,2] and `(Δ[0] ⊔ Δ[0])◁` is Λ[2,0]; exchanging the two cones would exchange
  pushouts and pullbacks below.

*Needs:* Tau Ceti `SSet.join`.

Final objects of an ∞-category are Tau Ceti's strongly final vertices `SSet.IsTerminalVertex` (Conventions), and
initial objects are its `SSet.IsInitialVertex`, the final objects of the opposite (HTT, Def. 1.2.12.3, p. 63;
§1.2.12, pp. 62–63). Their Checks are in the supplier contract. HTT's Def. 1.2.12.1 defines final objects through
the H-enriched homotopy category of a simplicial set (§2.1); for ∞-categories the two notions agree by §8.2.

**1.2.3.** Define a zero object of an ∞-category as an object that is both initial and final (HTT, Def. 7.2.2.7, p. 743;
HA, Def. 1.1.1.1, p. 17). The `Suggested.lean` declaration is `IsZeroObject`.

**Checks.**
- The vertex of Δ[0] is a zero object; Δ[1] has none, since its initial object 0 and its final object 1 differ. - In
  J, the nerve of the contractible groupoid on {0, 1}, both vertices are zero objects: zero objects are unique up to
  equivalence, not equal. A definition asking for a unique vertex would reject J.
- The nerve of sets has none: ∅ is initial, a point is final, and they differ. In the nerve of abelian groups
  the zero group is a zero object, matching Mathlib's `HasZeroObject`.

*Needs:* Tau Ceti `SSet.IsInitialVertex`, `SSet.IsTerminalVertex`.

**1.2.4.** Define the vocabulary of limits and colimits on top of Tau Ceti's `SSet.coslice.IsColimit` and
`SSet.slice.IsLimit` (HTT, Def. 1.2.13.4, p. 65):

- a map `p̄ : K▷ → C` is a colimit diagram when the vertex of `C_{p/}` it determines (p = `p̄|K`, through
  the universal property of the coslice) is initial, and dually for limit diagrams `K◁ → C` (`Suggested.lean`
  declarations `IsColimitDiagram` and `IsLimitDiagram`); `p̄` of the cone point is then called a colimit of p;
- C admits K-indexed colimits when every p : K → C has one; it admits small (finite) colimits when it admits
  K-indexed colimits for every small K (every finite K, that is every K with finitely many nondegenerate
  simplices);
- a functor F preserves K-indexed colimits when it carries colimit diagrams `K▷ → C` to colimit diagrams;
- a pushout square is a map `Δ[1] × Δ[1] → C` that is a colimit diagram through `Δ[1] × Δ[1] ≅ (Λ[2,0])▷`,
  and a pullback square one that is a limit diagram through `Δ[1] × Δ[1] ≅ (Λ[2,2])◁` (HTT, §4.4.2,
  p. 313). The isomorphisms send the span vertices 0, 1, 2 of Λ[2,0] to (0, 0), (1, 0), (0, 1) and the cone
  point to (1, 1), and the cone point of `(Λ[2,2])◁` to (0, 0) and the cospan vertices to (1, 0), (0, 1),
  (1, 1) (`Suggested.lean` declarations `IsPushoutSquare` and `IsPullbackSquare`, built from the coordinate maps
  `spanCoord₁`, `spanCoord₂`, `cospanCoord₁`, `cospanCoord₂` and shapes `coconeShape`, `coneShape`);
- a coproduct is a colimit of a diagram indexed by a discrete simplicial set (HTT, §4.4.1, p. 312);
- a functor between ∞-categories admitting finite limits is left exact when it preserves finite limits (HTT,
  Remark 5.3.2.10, p. 411, with κ = ω), that is, carries limit diagrams `K◁ → C` with K finite to limit
  diagrams (`Suggested.lean` declaration `IsLeftExact`).

**Checks.**
- A colimit diagram `∅▷ → C` is an initial object, and a limit diagram `∅◁ → C` is a final object.
- In the nerve of the poset [1] × [1] the identity square is a pushout and a pullback. Adding a top element ⊤
  above (1, 1) and using ⊤ in place of (1, 1) gives a square that is still a pullback, since the meet of (1, 0)
  and (0, 1) is (0, 0), but not a pushout, since their join is (1, 1), not ⊤.
- The functor Δ[1] → Δ[1] constant at 1 preserves final objects but not initial objects, so preservation is a
  real condition; it is left exact (every finite limit in Δ[1] is a minimum, and the constant cone at 1 is a
  limit cone), while the functor constant at 0 is not, since it sends the final object 1 to 0.
- In Δ[1] the coproduct of 0 and 1 is 1 and the empty coproduct is 0; in Δ[0] ⊔ Δ[0] the two vertices have no
  coproduct, so admitting coproducts is a condition.

*Needs:* Tau Ceti `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`, `SSet.coslice.homEquiv`; the cones of §1.2.2.

### Examples

- In the nerve of a poset P, a vertex is final exactly when it is a maximum, and a colimit of a diagram
  K → N(P) is a least upper bound of its image (the coslice is the nerve of the poset of upper bounds). So N(P)
  admits small colimits exactly when every small subset of P has a least upper bound, as for Δ[n] = N([n]); and a
  monotone map between posets with finite meets is left exact exactly when it preserves finite meets and the
  maximum.
- The ∞-categories met first in this family, Δ[n], horns and nerves of small categories, are small. The
  ∞-category of spaces, presheaf ∞-categories and `Cat∞` are large but locally small.

### Dependencies

Mathlib's universes, nondegenerate simplices, simplicial and enriched categories, internal homs, nerves and
homotopy categories; Tau Ceti's local smallness, weak homotopy equivalences, Dwyer–Kan equivalences, joins, cores,
strongly final vertices and colimits in coslices; ModelCategoryTheory, Part ModelCategories §8.2 and Part
KanQuillen for H and the change of enrichment. Nothing from later layers.

## Layer 2: Rigidification, homotopy categories and equivalences

### 2.1 Rigidification, the coherent nerve and categorical equivalences

**2.1.1.** Define the rigidification functor `C[−] : SSet → Cat_Δ` as the colimit-preserving extension of
`Δ[n] ↦ C[Δ^n]` (Mathlib `SimplicialThickening (Fin (n+1))` with its functoriality in monotone maps): the
left Kan extension along the Yoneda embedding, which exists because `Cat_Δ` has small colimits (HTT, §1.1.5,
p. 41, after Example 1.1.5.8).

- `C[Δ[n]]` is `C[Δ^n]`, `C[−]` preserves small colimits, and the objects of `C[S]` are the vertices of S.

**Checks.**
- `C[∅]` is the empty simplicial category and `C[Δ[0]]` has one object with a point as endomorphisms.
- `C[∂Δ[1]]` has two objects and no morphisms between them, while `C[Δ[1]]` has a point from 0 to 1: the
  functor sees the edge.
- From 0 to 2 the mapping object is two points in `C[∂Δ[2]]` (the edge 02 and the composite of 01 and 12), one
  point in `C[Λ[2,1]]` (the composite) and Δ[1] in `C[Δ[2]]`, joining the two: the extension glues the cubes of
  the simplices, so a functor that saw only the 1-skeleton could not tell `∂Δ[2]` from `Δ[2]`.

*Needs:* Mathlib `CategoryTheory.SimplicialThickening`; ModelCategoryTheory, Part SimplicialCategories §5.2.1 (HTT,
Prop. A.3.2.4: colimits in `Cat_Δ`).

**2.1.2.** Define the isomorphism `C[Kᵒᵖ] ≅ C[K]ᵒᵖ` of simplicial categories, natural in K, induced on simplices by
the order reversal j ↦ n − j of [n] (HTT, §5.1.3, p. 338, the opposite comparison). Both sides preserve
colimits in K, so it suffices to give it on simplices, where order reversal identifies the cube of chains from i
to j in `C[Δ[n]ᵒᵖ]` with the cube from n − j to n − i in `C[Δ[n]]`.

**Checks.**
- For K = Δ[1], both sides have objects 0 and 1 and one point from 1 to 0, and the isomorphism is the
  identity; composed with `Δ[1]ᵒᵖ ≅ Δ[1]` (Conventions) it exchanges the two objects.
- For K = Δ[2], the mapping object of `C[Δ[2]ᵒᵖ]` from 2 to 0 (a composable pair in `Δ[2]ᵒᵖ`) is Δ[1], and so is
  the mapping object of `C[Δ[2]]ᵒᵖ` from 2 to 0, which is `Map_{C[Δ[2]]}(0, 2)`; from 0 to 2 both are empty. A
  comparison that kept the direction of mapping objects would send the mapping object Δ[1] from 2 to 0 to the
  empty mapping object of `C[Δ[2]]` from 2 to 0.
- For K = ∂Δ[1] both sides are the discrete simplicial category on two objects, and the isomorphism is the
  identity on objects: the opposite of a simplicial set keeps its vertices.

*Needs:* §2.1.1 above (C[−]); Mathlib `SSet.opFunctor`.

**2.1.3.** The homotopy category of the opposite is the opposite of the homotopy category: for every simplicial set C there
is an isomorphism `SSet.hoFunctor.obj Cᵒᵖ ≅ (SSet.hoFunctor.obj C)ᵒᵖ`, the identity on objects, natural in C. The
route: by `CategoryTheory.nerveAdjunction`, functors from either side to a category D are the maps
`Cᵒᵖ → N(D)`, equivalently `C → N(D)ᵒᵖ ≅ N(Dᵒᵖ)`, naturally in D, and the Yoneda lemma concludes. For C = Δ[1]
both sides are the poset [1] with its order reversed. `Suggested.lean` declaration
`nonempty_opFunctor_comp_hoFunctor_iso` states the natural isomorphism.

*Needs:* Mathlib `CategoryTheory.nerveAdjunction`, `SSet.hoFunctor`, `SSet.opFunctor`, `CategoryTheory.nerve`.

**2.1.4.** Define the functoriality of the simplicial nerve, `N(F) : N(C) → N(D)` for a simplicial functor F, by
composing simplices `C[Δ^n] → C` with F, and the counit `C[N(C)] → C`, the simplicial functor corresponding to
the identity of N(C) under the bijection of §2.1.5 (HTT, Def. 1.1.5.5, p. 40, the nerve map).

**Checks.**
- For the simplicial functor F : `C[Δ^2]` → `C[Δ^2]` that is the identity on objects and collapses
  `Map(0,2)` = Δ[1] onto its vertex {0,1,2}, N(F) sends the identity 2-simplex of `N(C[Δ^2])` to the
  different 2-simplex F. A nerve map defined through the induced functor of homotopy categories, which is the
  identity here, would fix it.
- On objects the counit is the identity of the objects of C (the vertices of N(C)), and for C = `C[Δ^n]`
  it sends the n-simplex of `N(C[Δ^n])` given by the identity back to the identity functor.
- For C an ordinary category with discrete mapping objects, N(F) is the nerve of the underlying functor.

*Needs:* Mathlib `CategoryTheory.SimplicialNerve`; §2.1.1 above (the functor C[−]).

**2.1.5.** Prove that `C[−]` is left adjoint to the simplicial nerve: maps `C[S] → C` correspond to maps `S → N(C)`,
naturally in S and C (HTT, Def. 1.1.5.5, p. 40, and §1.1.5, p. 41, the adjunction). The route: for `S = Δ[n]` this
is the definition of N(C); both sides turn colimits in S into limits, and every simplicial set is a colimit
of simplices. Tau Ceti's `CategoryTheory.simplicialNerveFunctor` is the right adjoint.

**Checks.**
- For S = ∅ both sides are a point.
- For S = ∂Δ[1] both sides are pairs of objects of C.
- For S = Δ[1] both sides are vertices of `Map_C(X, Y)` for pairs of objects.

*Needs:* §2.1.1, §2.1.4 above (C[−], the nerve map); Mathlib `CategoryTheory.SimplicialNerve`; Tau Ceti
`CategoryTheory.simplicialNerveFunctor`.

**2.1.6.** Define the homotopy category of a simplicial set S as the H-enriched category `hS = h(C[S])`, and a map
f : S → T to be a categorical equivalence when `hf : hS → hT` is an equivalence of H-enriched categories
(HTT, Def. 1.1.5.14, p. 43). `Suggested.lean` declaration `IsCategoricalEquivalence`, with the class
`categoricalEquivalences`, states it in Joyal's equivalent form, which needs no rigidification: for every
∞-category C, restriction `h Fun(T, C) → h Fun(S, C)` is an equivalence of categories (Kerodon, §4.5.4, Def. 4.5.4.1 and Prop. 4.5.4.8). The
agreement of the two forms is HTT, Prop. 2.2.5.8, p. 112, which needs Joyal's theorem on the fibrant objects of
the Joyal structure and is proved with it in Layer 9; the Lean statements of the layers that use
`IsCategoricalEquivalence` read categorical equivalences through it.

- Categorical equivalences contain isomorphisms, are closed under composition and retracts, and satisfy
  two-out-of-three, since equivalences of H-enriched categories do.
- Categorical equivalences are stable under opposites: f is a categorical equivalence exactly when `fᵒᵖ` is,
  through the opposite comparison `C[Kᵒᵖ] ≅ C[K]ᵒᵖ` (§2.1.2), since an H-enriched functor is an equivalence exactly
  when its opposite is.

**Checks.**
- Λ[2,1] → Δ[2] is a categorical equivalence that is not an isomorphism: the only mapping object that changes,
  from 0 to 2, goes from a point to Δ[1].
- ∂Δ[1] → Δ[1] is not: the mapping object from 0 to 1 goes from ∅ to a point.
- Δ[1] → Δ[0] is a weak homotopy equivalence but not a categorical equivalence (the mapping object from 1 to
  0 is empty in `hΔ[1]`): the two notions of weak equivalence are separated.

*Needs:* §2.1.1, §2.1.2 above (C[−]; the opposite comparison); §1.1.1 (equivalences of H-enriched categories).

**2.1.7.** Define, for vertices x and y of a simplicial set S, the mapping object `Map_S(x, y)` as the mapping object
of `hS`, an object of H (HTT, Def. 1.2.2.1, p. 44). For an ∞-category it is represented by Tau Ceti's
`SSet.rightMappingSpace`; the comparison is §5.2 and §8.1.

**Checks.**
- For S the nerve of a category, `Map_S(x, y)` is the discrete set of morphisms.
- In Δ[1], `Map(1, 0)` is empty and `Map(0, 1)` is a point; a symmetric definition would be wrong.
- In Λ[2,1], `Map(0, 2)` is a point although Λ[2,1] has no edge from 0 to 2: mapping objects count composites,
  not edges.

*Needs:* §2.1.6 above (hS).

**2.1.8.** Define a map f : S → T of simplicial sets to be fully faithful when every `Map_S(x, y) → Map_T(fx, fy)` is an
isomorphism in H (HTT, Def. 1.2.10.1, p. 61, the fully faithful part). Tau Ceti's `SSet.IsFullyFaithful`
(right mapping spaces, realization weak equivalences) is the characterization for ∞-categories (§8.1).

**Checks.**
- The inclusion of a full subcategory of an ∞-category is fully
  faithful; the vertex 0 of Δ[1] gives one.
- ∂Δ[1] → Δ[1] is not fully faithful (∅ to a point), although it is injective.
- Δ[1] → Δ[0] is not fully faithful (`Map(1, 0)` goes from ∅ to a point), although it is surjective on every
  set of simplices.

*Needs:* §2.1.7 above (mapping objects).

### 2.2 Strict Segal sets are nerves

**2.2.1.** Prove that a strict Segal simplicial set is the nerve of its homotopy category: for X with Mathlib's
`SSet.IsStrictSegal X`, the unit `X → nerve (hoFunctor X)` of `CategoryTheory.nerveAdjunction` is an
isomorphism (HTT, Prop. 1.1.2.2, implication from unique inner fillers to nerves, pp. 27–28). `Suggested.lean` declaration
`isIso_nerveAdjunction_unit_app`. The proof route is Lurie's construction of the category, read through the
adjunction: the unique fillers of `Λ[2, 1]` define composition and those of `Λ[3, 1]` and `Λ[3, 2]` make it
associative, so the homotopy category of X has the edges of X as its morphisms, and the unit is a map of strict
Segal simplicial sets that is bijective on spines.

*Needs:* Mathlib `CategoryTheory.nerveAdjunction` (HTT, Prop. 1.2.3.1, p. 46), `SSet.IsStrictSegal`, the strict
Segal structure of nerves.

### 2.3 Homotopic morphisms and equivalences

**2.3.1.** The identity of an object x is Mathlib's degenerate edge `SSet.Edge.id x`, and equivalences are Tau Ceti's
`SSet.Edge.IsEquivalence` (Conventions; HTT, §1.2.4, p. 51). Define two morphisms f, g from x to y of a simplicial
set C to be homotopic when they have the same image in the homotopy category `SSet.hoFunctor.obj C`, and two
objects to be equivalent when an equivalence joins them (HTT, §1.2.3, pp. 47–48, and Prop. 1.2.3.5, p. 48).

- In a quasicategory, f and g are homotopic exactly when some 2-simplex has boundary (f, g, the identity of y)
  in the appropriate positions, and this relation is an equivalence relation; this is Tau Ceti's comparison
  `SSet.Truncated.HomotopyCategory₂.equivalence` of the two descriptions of the homotopy category.
- In a quasicategory, an edge is an equivalence exactly when its image in the homotopy category is an
  isomorphism (Tau Ceti `SSet.Edge.isEquivalence_iff_isIso`).
- Equivalences are preserved by every map of simplicial sets, contain the identities, and in a quasicategory
  satisfy two-out-of-three along 2-simplices.
- Equivalence of objects is symmetric in every simplicial set: the inverse carried by an equivalence is itself an
  equivalence, with the same 2-simplices (Mathlib `SSet.Edge.InvStruct.invStructInv`). So "x is equivalent to y"
  gives an equivalence in either direction.

**Checks.**

- In the nerve of a category D, an edge is an equivalence exactly when the corresponding morphism of D is an
  isomorphism, and two edges are homotopic exactly when they are equal. A definition by "has a one-sided inverse"
  would make a split monomorphism of D an equivalence.
- In `Δ[1]` the nondegenerate edge is not an equivalence (there is no edge from 1 to 0), while in a Kan complex
  every edge is one. A definition that called every edge of a quasicategory an equivalence fails the first case.
- For n = 0: in Δ[0] the only edge is the identity, which is an equivalence; the identity `s₀ x` is an
  equivalence in every simplicial set, so the relation "equivalent objects" is reflexive even where the
  homotopy category is not a groupoid.
- In the singular complex of a space, two paths with the same end points are homotopic in this sense exactly
  when they are homotopic relative to the end points. Homotopy without fixed end points would identify every
  pair of paths in a path-connected space.

*Needs:* Mathlib `SSet.Quasicategory`, `SSet.Edge`, `SSet.Edge.InvStruct`, `SSet.hoFunctor`; Tau Ceti `SSet.Edge.IsEquivalence`,
`SSet.Edge.isEquivalence_iff_isIso`, `SSet.Truncated.HomotopyCategory₂.equivalence`; §2.1.6 (HTT,
Def. 1.1.5.14).

### 2.4 Essential surjectivity and Dwyer–Kan equivalences

**2.4.1.** Define a map of simplicial sets f : C → D to be essentially surjective when the induced functor of homotopy
categories `hoFunctor.map f` is essentially surjective (HTT, Def. 1.2.10.1, essential-surjectivity half, p. 61); when
D is an ∞-category this says that every object of D is equivalent to f(x) for some object x of C. The same definition
applies to a simplicial functor, through the homotopy category of a simplicial category (§1.1).

- A composite of essentially surjective maps is essentially surjective, and an isomorphism is.
- If g ∘ f is essentially surjective then g is.
- For a functor of categories F, the nerve of F is essentially surjective exactly when F is (Mathlib's
  `CategoryTheory.nerveAdjunction` identifies the homotopy category of a nerve with the category).

**Checks.**

- The inclusion of the vertex 0 into `Δ[1]` is not essentially surjective (the vertex 1 is not equivalent to 0),
  while the inclusion of a vertex into the nerve of the walking isomorphism is. A definition by surjectivity on
  vertices would reject the second.
- The map from the empty simplicial set to Δ[0] is not essentially surjective; the map ∅ → ∅ is.
- The map `Δ[0] ⊔ Δ[0] → Δ[0]` is essentially surjective but not injective on equivalence classes of objects; a
  definition asking for a bijection on equivalence classes would reject it.

*Needs:* Mathlib `SSet.hoFunctor`, `CategoryTheory.nerveAdjunction` (HTT, Prop. 1.2.3.1, p. 46); §2.3.1; §1.1.1 (HTT, Def. 1.1.4.4, the H-enriched homotopy category of a simplicial category).

**2.4.2.** Prove that the equivalences of simplicial categories of §1.1 (HTT, Def. 1.1.4.4, p. 37) are
exactly Tau Ceti's Dwyer–Kan equivalences `CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence`, with no
fibrancy hypothesis. The route: a map of simplicial sets is an isomorphism in H exactly when it is a weak homotopy
equivalence, and the underlying category of the H-enriched homotopy category of a simplicial category is Tau
Ceti's `TauCeti.SimplicialHomotopyCategory`, whose morphisms are connected components of mapping simplicial sets.
For the one-object simplicial category with endomorphisms Δ[1] under the maximum, both notions accept the functor
to the terminal simplicial category although Δ[1] is not a Kan complex.

*Needs:* §1.1.1 (HTT, Def. 1.1.4.4); Tau Ceti
`CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence`, `TauCeti.SimplicialHomotopyCategory`,
`CategoryTheory.EnrichedFunctor.mapHomotopyCategory`; ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7, weak
homotopy equivalences and H).

### 2.5 Rigidifications of simplices and inner horns

**2.5.1.** Prove the structure of `C[Δ[n]]` (HTT, Def. 1.1.5.1 with Remark 1.1.5.2, p. 39). For i < j in [n], the mapping simplicial set of
`C[Δ[n]]` from i to j is isomorphic to the cube `(Δ[1])^(j−i−1)`, whose vertices are the chains from i to j; it is a
point when i = j and empty when j < i. The functor `C[Δ[n]] → [n]` that is the identity on objects is
a Dwyer–Kan equivalence (§2.4). The route: the cube description is the definition of
Mathlib's `CategoryTheory.SimplicialThickening`, and cubes are weakly contractible.

*Needs:* Mathlib `CategoryTheory.SimplicialThickening` (HTT, Def. 1.1.5.1); §1.1.1 (HTT, Def. 1.1.4.4); §2.4.2
equivalences of simplicial categories; ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7).

**2.5.2.** Prove that, for 0 < i < n, the inclusion `C[Λ[n,i]] → C[Δ[n]]` is bijective on objects and an isomorphism on
every mapping object except the one from 0 to n, which is the subcomplex of the cube `(Δ[1])^(n−1)` obtained by
removing its interior and the one face that corresponds to the missing face of the horn (HTT, in the proof
of Prop. 1.1.5.10, p. 42, the horn computation). Identify `C[Λ[n,i]]` with Tau Ceti's
`TauCeti.HornThickening`. The route computes the colimit over the faces of the horn with the description
of pushouts along functors bijective on objects, using that the mapping objects of `C[Δ[n]]` are cubes.
For n = 2, i = 1 only `Map(0,2)` changes, from the vertex {0,1,2} to Δ[1]. The restriction to inner horns
is needed: for i = 0, `Map(1,2)` in `C[Λ[2,0]]` is empty, since Λ[2,0] has no edge from 1 to 2.

*Needs:* §2.1.1 (C[−]); Mathlib `CategoryTheory.SimplicialThickening`; Tau Ceti `TauCeti.HornThickening`;
ModelCategoryTheory, Part SimplicialCategories §5.2.1 (HTT, Prop. A.3.2.4).

**2.5.3.** Prove the outer-horn case, which §2.5.2 excludes: for n ≥ 1 the inclusion `C[Λ[n, n]] → C[Δ[n]]`
is bijective on objects and an isomorphism on every mapping object except those from 0 to n − 1 and from
0 to n, which are the subcomplexes of the cubes spanned by the chains of subsets no bead of which contains
`{0, …, n − 1}`; dually for `C[Λ[n, 0]]`. The route is that of §2.5.2, with the faces of the outer horn in
place of the inner ones.

**Checks.**

- For `Λ[2, 2]`: `Map(0, 1)` is ∅, since the horn has no edge from 0 to 1, and `Map(0, 2)` is a point,
  against a point and Δ[1] in `C[Δ[2]]`. So the inclusion is not an isomorphism on either, which is why
  §2.5.2's conclusion does not extend verbatim.
- For n = 1 both horns are a vertex and the statement is the inclusion of an object.
- Dually, in `C[Λ[2, 0]]` the empty mapping object is `Map(1, 2)` (§2.5.2's last sentence).

*Needs:* §2.5.2; §2.1.1 (C[−]); Mathlib `CategoryTheory.SimplicialThickening`.

### 2.6 Coherent nerves, the two homotopy categories and categorical equivalences

**2.6.1.** Prove that the coherent nerve of a simplicial functor F : C → D which is a Kan fibration on every mapping
simplicial set is an inner fibration `N(C) → N(D)` (HTT, proof of Prop. 1.1.5.10, pp. 41–42, as recorded in Remark 1.1.5.11,
p. 42). No fibrancy is assumed of C or D.
`Suggested.lean` declaration `innerFibration_simplicialNerveMap`. The route is the one Tau Ceti uses for
`CategoryTheory.SimplicialNerve.quasicategory` (HTT, Prop. 1.1.5.10, p. 41): an inner horn of `N(C)` is a simplicial
functor from `C[Λ[n, i]]`, which differs from `C[Δ[n]]` only in the mapping simplicial set from 0 to n, an
open box in the cube; the inclusion of the open box is anodyne, so it lifts against the Kan fibration
`Map_C(0, n) → Map_D(F0, Fn)`.

*Needs:* Tau Ceti `CategoryTheory.simplicialNerveMap`, `TauCeti.HornThickening`,
`CategoryTheory.SimplicialNerve.quasicategory`; Mathlib `SSet.InnerFibration`; §2.1.5 (HTT, Def. 1.1.5.5,
horn part); ModelCategoryTheory,
Part KanQuillen (HTT, §A.2.7, anodyne maps and Kan fibrations).

**2.6.2.** Prove that the coherent nerve of a simplicial category whose mapping simplicial sets are discrete is its nerve:
for such a simplicial category, Tau Ceti's comparison `CategoryTheory.SimplicialNerve.fromNerve` from the nerve to
the coherent nerve is an isomorphism (HTT, Example 1.1.5.8, p. 40). The route: an n-simplex of the coherent nerve
is a simplicial functor from `C[Δ[n]]`, and when every mapping simplicial set of the target is discrete such a
functor factors through the poset [n] (the mapping cubes of `C[Δ[n]]` are connected), so it is a chain of n
composable morphisms. In low degrees this is Tau Ceti's `CategoryTheory.SimplicialNerve.bijective_fromNerve_app`.
`Suggested.lean` declaration `isIso_fromNerve_of_discrete`, with discreteness stated as an isomorphism of every
mapping simplicial set with a constant one.

*Needs:* Mathlib `CategoryTheory.SimplicialNerve`, `CategoryTheory.nerve`; Tau Ceti
`CategoryTheory.SimplicialNerve.fromNerve`; Mathlib `CategoryTheory.SimplicialThickening` (HTT, Def. 1.1.5.1); §2.1.5 (HTT, Def. 1.1.5.5); §2.5.1.

**2.6.3.** Prove that the two homotopy categories of a simplicial set agree: for every simplicial set S, the underlying
category of the H-enriched homotopy category hS of §2.1 (HTT, Def. 1.1.5.14), whose morphisms
from x to y are the morphisms from the point to `Map_S(x, y)` in H, that is the connected components of
`Map_{C[S]}(x, y)`, is isomorphic to Mathlib's `SSet.hoFunctor.obj S`, naturally in S, by the identity on objects
and the class of an edge on morphisms (HTT, Prop. 1.2.3.1 and its proof, pp. 46–47). The route is Lurie's: both
functors from simplicial sets to categories are left adjoint to the nerve, the first as the composite of
rigidification, left adjoint to the coherent nerve, with the connected-components functor, left adjoint to the
inclusion of categories as simplicial categories with discrete mapping objects, whose coherent nerve is the nerve
(§2.6.2); left adjoints agree up to a unique natural isomorphism. Equivalently, both preserve colimits and agree
on simplices, since the cubes of `C[Δ[n]]` are connected. For S = `Λ[2, 1]` both have a morphism from 0 to 2
that is not an edge; for S = `∂Δ[1]` both have no morphism from 0 to 1.

*Needs:* Mathlib `CategoryTheory.nerveAdjunction`, `CategoryTheory.SimplicialThickening`; §2.1.5 (HTT, Def. 1.1.5.5, adjunction part), §2.1.6 (HTT, Def. 1.1.5.14); §2.6.2 (HTT,
Example 1.1.5.8); ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7: maps from the point in H are connected
components).

**2.6.4.** Prove that a map of simplicial sets is a categorical equivalence (§2.1) exactly when it is fully faithful (§2.1)
and essentially surjective (§2.4) (HTT, §1.2.10, after Remark 1.2.10.2, p. 61); the same holds for equivalences of
simplicial categories (§1.1), that is Tau Ceti's `CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence` (§2.4). The route: a functor of H-enriched categories is an equivalence exactly when it is fully
faithful and essentially surjective, applied to the induced functor of H-enriched homotopy categories. Instances:

- the inclusion `{0} ⊆ Δ[1]` is fully faithful but not essentially surjective, so it is not a categorical
  equivalence, and `∂Δ[1] ⊆ Δ[1]` is essentially surjective but not fully faithful (the mapping object from 0 to 1
  goes from empty to a point);
- the functor `C[Δ[n]] → [n]` of §2.5 is a Dwyer–Kan equivalence though not an isomorphism for n ≥ 2;
- for nerves of categories, categorical equivalence is the classical equivalence of categories.

*Needs:* §1.1.1 (HTT, Def. 1.1.4.4) and §2.1.6 (HTT, Def. 1.1.5.14), §2.1.8 (HTT, Def. 1.2.10.1, fully-faithful
half); Tau Ceti
`CategoryTheory.EnrichedFunctor.IsDwyerKanEquivalence`; §2.4.1 essential surjectivity; the agreement of the two homotopy
categories (§2.6.3).

### 2.7 Homotopy-invertible morphisms in locally Kan simplicial categories

**2.7.1.** Prove the characterization of equivalences in a locally Kan simplicial category C, the simplicial analogue of
HTT, Prop. 1.2.4.1, pp. 51–52, which treats topological categories. For a morphism f : X → Y of C, that is a vertex of `X ⟶[SSet] Y`, the following are
equivalent: f is an isomorphism in hC; f has a homotopy inverse; for every object Z, composition with f is a
homotopy equivalence `Map(Z, X) → Map(Z, Y)`; it is a weak homotopy equivalence for every Z; and the same two
conditions for precomposition `Map(Y, Z) → Map(X, Z)`. The route: Yoneda in the H-enriched category hC for the
first four; Whitehead's theorem for Kan complexes identifies homotopy equivalences with weak homotopy
equivalences.

*Needs:* Mathlib `CategoryTheory.SimplicialCategory` (HTT, Def. 1.1.4.1); §1.1.1 (HTT, Def. 1.1.4.4,
the H-enriched homotopy category hC); ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7, weak
homotopy equivalences and Whitehead's theorem for Kan complexes).

### Examples

- The nerve of a category is strict Segal, so it is recovered from its homotopy category (§2.2); `Λ[2, 1]` is not
  strict Segal and its unit is not an isomorphism.
- In the nerve of the walking isomorphism, every edge is an equivalence and the inclusion of either vertex is a
  categorical equivalence (§2.6).
- Δ[n] is the nerve of [n]: its mapping objects (§2.1) are points or empty, and `C[Δ[n]] → [n]` is a Dwyer–Kan
  equivalence (§2.5). For the nerve of any category, the homotopy category, mapping objects and categorical
  equivalences of §2.1 are the classical ones (§2.6).

### Dependencies

Mathlib's nerves, homotopy categories, simplicial categories and thickenings; Tau Ceti's equivalences, homotopy
categories, Dwyer–Kan equivalences and coherent nerves; Layer 1 for equivalences of simplicial
categories and their H-enriched homotopy categories, and for subcategories; §2.1 for rigidification and categorical
equivalences; ModelCategoryTheory, Part KanQuillen.

## Layer 3: Left fibrations and left anodyne maps

### 3.1 Equivalences along left fibrations

**3.1.1.** Prove that a left fibration reflects equivalences: for a left fibration p : C → D of ∞-categories and a morphism
f of C, if p(f) is an equivalence of D then f is an equivalence of C (HTT, Prop. 2.1.1.5, p. 77; `Suggested.lean`
declaration `isEquivalence_map_iff_of_leftFibration`, which asks only that C be an ∞-category). The route is
Lurie's: lift a 2-simplex of D witnessing a left inverse of p(f) along the lifting property against `Λ[2, 0]`; this
gives a left inverse g of f whose image is again an equivalence, so g has a left inverse too, which is homotopic to
f. Tau Ceti proves the right-fibration form `SSet.Edge.isEquivalence_map_iff_of_rightFibration`; the left form
also follows from it by passing to opposites.

*Needs:* Tau Ceti `SSet.LeftFibration` (HTT, Def. 2.0.0.3), `SSet.Edge.IsEquivalence`,
`SSet.Edge.isEquivalence_map_iff_of_rightFibration`, `SSet.opFunctor`; §2.3.1.

**3.1.2.** Prove that a left fibration lifts equivalences with prescribed target: for a left fibration p : C → D of
∞-categories, an object Y of C and an equivalence f̄ : X → p(Y) of D, there is a morphism f : X' → Y of C with p(f) =
f̄; when C is an ∞-category every such f is an equivalence (§3.1.1) (HTT, Prop. 2.1.1.6, p. 77). `Suggested.lean`
declaration `hasLift_of_isEquivalence_of_leftFibration` states the lifting, as a square from `Λ[1, 1] ⊆ Δ[1]`. The
route: lift a homotopy inverse ḡ of f̄ to an edge g starting at Y, then lift the 2-simplex exhibiting f̄ ∘ ḡ as the
identity along `Λ[2, 0]`; the resulting edge into Y lies over f̄, and it is an equivalence by §3.1.1. Tau Ceti proves
the dual, `SSet.RightFibration.hasLift_of_isEquivalence`.

*Needs:* Tau Ceti `SSet.LeftFibration` (HTT, Def. 2.0.0.3),
`SSet.RightFibration.hasLift_of_isEquivalence`; §2.3.1; §3.1.1 reflection of equivalences.

### 3.2 Generators of left anodyne maps

**3.2.1.** Prove Joyal's generation theorem: the following three classes of maps generate the same weakly saturated class,
the left anodyne maps (HTT, Prop. 2.1.2.6, p. 81):

- the horn inclusions `Λ[n, i] ⊆ Δ[n]` with `0 ≤ i < n`;
- the inclusions `(Δ[m] × {0}) ∪ (∂Δ[m] × Δ[1]) ⊆ Δ[m] × Δ[1]`;
- the inclusions `(S' × {0}) ∪ (S × Δ[1]) ⊆ S' × Δ[1]` for all monomorphisms S ⊆ S'.

In lifting form, the right lifting class of the second family is Tau Ceti's `SSet.leftFibrations`
(`Suggested.lean` declaration `rlp_unionProd_boundary_horn_eq_leftFibrations`). The route: the third class is built cell by cell from the second, which it contains, so they generate the same
class. The second class consists of pushout-products of `{0} ⊆ Δ[1]` with boundary inclusions, so it is left
anodyne (Tau Ceti `SSet.leftAnodyneExtensions_pushoutObjObjι'`). Conversely, each left horn `Λ[n, i] ⊆ Δ[n]` is a
retract of the map of the third class for `S = Λ[n, i]`, `S' = Δ[n]`, through Lurie's retraction of `Δ[n] × Δ[1]`
onto `Δ[n]`; Lurie's filtration of `Δ[n] × Δ[1]` by its nondegenerate (n+1)-simplices is also available, each
step a pushout of a left horn.

*Needs:* ModelCategoryTheory, Part ModelCategories §1.5.1 (HTT, Cor. A.1.2.7) and §1.3.1 (HTT, Def. A.1.2.2); Tau Ceti
`SSet.leftAnodyneExtensions`, `SSet.leftAnodyneExtensions_pushoutObjObjι'`,
`SSet.prodStdSimplex.leftAnodyneExtensions_unionProd_ι` (left anodyne maps, HTT, Def. 2.0.0.3).

### 3.3 Pullback-homs, homotopy extension and fiberwise contractions

**3.3.1.** Prove that the pullback-hom of a left anodyne map and a left fibration is a trivial fibration: for a left
fibration p : X → S and a left anodyne map i : A → B (left anodyne maps are monomorphisms), the map
`X^B → X^A ×_{S^A} S^B` has the right lifting property against all monomorphisms (HTT, Cor. 2.1.2.9, second
assertion, p. 83). For an arbitrary
monomorphism i this map is a left fibration, which is Tau Ceti's `SSet.leftFibration_pullbackObjObjπ` (the first
assertion). `Suggested.lean` declaration `rlp_monomorphisms_pullbackObjObjπ_of_leftAnodyne`. The route: by adjunction, lifting a
monomorphism j against the pullback-hom is lifting the pushout-product of i and j against p, and that
pushout-product is left anodyne by Tau Ceti's `SSet.leftAnodyneExtensions_pushoutObjObjι'` (HTT, Cor. 2.1.2.7,
p. 82). The anodyne analogue (HTT, Remark 2.1.2.8, p. 83) is not needed.

*Needs:* Tau Ceti `SSet.leftAnodyneExtensions_pushoutObjObjι'`, `SSet.leftFibration_pullbackObjObjπ`,
`SSet.rlp_monomorphisms_iff`; Mathlib `CategoryTheory.Functor.PullbackObjObj`, `SSet.rlp_monomorphisms`.

**3.3.2.** Prove the homotopy extension lifting property: a map p : X → S is a left fibration exactly when the pullback-hom
`X^Δ[1] → X^{0} ×_{S^{0}} S^Δ[1]` along the vertex inclusion `{0} ⊆ Δ[1]` is a trivial fibration (HTT, Cor. 2.1.2.10,
p. 83). `Suggested.lean` declaration `leftFibration_iff_rlp_pullbackObjObjπ`. The route: "only if" is §3.3.1 for the left
anodyne map `{0} ⊆ Δ[1]`; "if" follows by adjunction, since lifting against the boundary inclusions says that p
lifts against the second generating class of §3.2.

*Needs:* §3.3.1 pullback-hom of a left anodyne map; §3.2.1; Tau Ceti `SSet.LeftFibration`; Mathlib
`SSet.rlp_monomorphisms`.

**3.3.3.** Prove that a section with a fiberwise contraction is left anodyne (HTT, Prop. 2.1.2.11, p. 83). Let p : X → S have
a section s, and let h : X × Δ[1] → X be a homotopy over S from s ∘ p to the identity that is constant along the
section: its restriction to s(S) × Δ[1] is s composed with the projection `S × Δ[1] → S`. Then s is left anodyne.
`Suggested.lean` declaration `leftAnodyneExtensions_of_fiberwiseContraction`. The constancy condition is what the proof at the locator
uses, and the first Check shows that it cannot be dropped. The route: given a lifting problem of s against a
left fibration q, the constancy makes the data on `(S × Δ[1]) ∪ (X × {0})` well defined; extend it to `X × Δ[1]`
along this left anodyne inclusion (HTT, Cor. 2.1.2.7, p. 82) and restrict to `X × {1}`.

**Checks.**

- Let M be the monoid {1, e} with e² = e, so that its nerve has one vertex. The natural transformation from the
  constant endofunctor to the identity with component e gives a homotopy over Δ[0] from the composite through the
  vertex to the identity, but it is not constant on the vertex. The vertex inclusion is not left anodyne: a lift
  against the left fibration from the coslice under the vertex would be a functor from M to the coslice category
  sending the object to the identity morphism, and that forces e · 1 = 1. So the constancy hypothesis cannot be
  dropped.
- For the projection `Δ[1] → Δ[0]` with section the vertex 0 and the homotopy contracting `Δ[1]` onto 0 (constant
  on 0), the conclusion is that `{0} ⊆ Δ[1]` is left anodyne, which is true. For the section the vertex 1, no
  homotopy from the constant map at 1 to the identity exists over Δ[0] (it would need an edge from 1 to 0), so
  the statement does not wrongly make `{1} ⊆ Δ[1]` left anodyne.
- For S = X and p the identity, the hypothesis holds with the constant homotopy, and the conclusion (an
  isomorphism is left anodyne) is correct.

*Needs:* Tau Ceti `SSet.leftAnodyneExtensions`, `SSet.leftAnodyneExtensions_pushoutObjObjι'`; Mathlib `SSet.ι₀`,
`SSet.ι₁` (left anodyne maps as in HTT, Def. 2.0.0.3).

### Examples

- The vertex inclusion `{0} ⊆ Δ[n]` is left anodyne by §3.3 (the linear contraction of `Δ[n]` onto 0 is constant
  on 0), while `{n} ⊆ Δ[n]` is right anodyne and, for n ≥ 1, not left anodyne.
- For a Kan complex K, evaluation `K^Δ[1] → K` at the vertex 0 is a trivial fibration (§3.3 for K → Δ[0] and the
  left anodyne `{0} ⊆ Δ[1]`).

### Dependencies

Tau Ceti's left and right fibrations, anodyne maps and pushout-product theorems; Mathlib's pullback-homs and
trivial fibrations; ModelCategoryTheory, Part ModelCategories for weak saturation; Layer 2 for equivalences.

## Layer 4: Joins and slices

### 4.1 Pushout-joins of anodyne maps

Slices of p : K → C are characterized by Tau Ceti's universal property: maps Y → `C_{/p}` correspond to maps
`Y ⋆ K → C` restricting to p, and maps Y → `C_{p/}` to maps `K ⋆ Y → C` restricting to p (HTT, Prop. 1.2.9.2,
p. 60; `SSet.slice.homEquiv`, `SSet.coslice.homEquiv`). Lifting problems against maps of slices therefore become
extension problems along pushout-joins.

**4.1.1.** Prove Joyal's lemmas on pushout-joins: for monomorphisms A₀ ⊆ A and B₀ ⊆ B, the pushout-join
`(A₀ ⋆ B) ∪ (A ⋆ B₀) ⊆ A ⋆ B` is inner anodyne whenever A₀ ⊆ A is right anodyne or B₀ ⊆ B is left anodyne (HTT,
Lemma 2.1.2.3, p. 80), and it is left anodyne whenever A₀ ⊆ A is left anodyne (HTT, Lemma 2.1.2.4, p. 80).
`Suggested.lean` declarations `innerAnodyneExtensions_unionJoin_ι_of_rightAnodyne`,
`innerAnodyneExtensions_unionJoin_ι_of_leftAnodyne` and `leftAnodyneExtensions_unionJoin_ι`. The route
is Lurie's: for fixed B₀ ⊆ B (or fixed A₀ ⊆ A) the maps for which the conclusion holds form a weakly saturated class,
so it suffices to treat a horn `Λ[n, j] ⊆ Δ[n]` against `∂Δ[m] ⊆ Δ[m]`, where the pushout-join is the horn
`Λ[n + m + 1, j] ⊆ Δ[n + m + 1]`: inner when `0 < j ≤ n`, a left horn when `0 ≤ j < n`; the case of B₀ ⊆ B left
anodyne is dual.

*Needs:* Tau Ceti `SSet.join`, `SSet.Subcomplex.unionJoin`, `SSet.rightAnodyneExtensions`,
`SSet.leftAnodyneExtensions`; Mathlib `SSet.innerAnodyneExtensions`; ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT,
Def. A.1.2.2) and §1.5.1 (HTT, Cor. A.1.2.7).

### 4.2 Slices along inner and left fibrations

**4.2.1.** Prove Joyal's theorem on slices along fibrations (HTT, Prop. 2.1.2.1, p. 78). Let A ⊆ B be a monomorphism,
p : B → X and q : X → S, with r = q ∘ p, p₀ = p|A and r₀ = r|A.

- If q is an inner fibration, the map `X_{p/} → X_{p₀/} ×_{S_{r₀/}} S_{r/}` is a left fibration (first assertion).
  This map is the `Suggested.lean` declaration `cosliceRestrictionMap`, the coslice form of Tau Ceti's
  `SSet.slice.restrictionMap`, and the statement is `leftFibration_cosliceRestrictionMap`.
- If q is a left fibration, the map `X_{/p} → X_{/p₀} ×_{S_{/r₀}} S_{/r}` is a left fibration (second
  assertion). This map is Tau Ceti's `SSet.slice.restrictionMap`, and the `Suggested.lean` declaration for the
  statement is `leftFibration_slice_restrictionMap`.

The route: by the universal property of slices, a lifting problem of a left horn against either map is an extension
problem along a pushout-join of `Λ[n, i] ⊆ Δ[n]` with A ⊆ B, taken in the order K ⋆ Y for coslices and Y ⋆ K for
slices; for the first assertion the horn is in the second factor and §4.1 makes the pushout-join inner anodyne,
for the second it is in the first factor and §4.1 makes it left anodyne.

*Needs:* §4.1.1 pushout-joins; Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv`, `SSet.slice.restrictionMap`,
`SSet.coslice.map`, `SSet.LeftFibration`; Mathlib `SSet.InnerFibration`.

### 4.3 Coslices and restriction along anodyne maps

**4.3.1.** Prove that for an ∞-category C and any diagram p : K → C, the projection `C_{p/} → C` is a left fibration, so the
coslice `C_{p/}` is an ∞-category (HTT, Cor. 2.1.2.2, p. 79). `Suggested.lean` declaration `leftFibration_coslice_π`; Tau Ceti has the
dual statements for slices (HTT, Prop. 1.2.9.3, first assertion, p. 61). The route: the first assertion of §4.2
with X = C, S = Δ[0] and A empty; or the dual of Tau Ceti's `SSet.slice.rightFibration_π` through
`SSet.coslice.opSliceIso`.

*Needs:* §4.2.1 first assertion; Tau Ceti `SSet.coslice`, `SSet.coslice.π`, `SSet.coslice.opSliceIso`,
`SSet.slice.rightFibration_π`.

**4.3.2.** Prove that restriction of coslices along anodyne maps is a trivial fibration (HTT, Prop. 2.1.2.5, p. 80). Let
π : S → T, p : B → S and a monomorphism i : A ⊆ B, with p₀ = p|A, p' = π ∘ p and p'₀ = p'|A. If i is right anodyne
and π is an inner fibration, or i is anodyne and π is a left fibration, then `S_{p/} → S_{p₀/} ×_{T_{p'₀/}} T_{p'/}`
is a trivial fibration (`Suggested.lean` declarations `rlp_monomorphisms_cosliceRestrictionMap_of_rightAnodyne` and
`rlp_monomorphisms_cosliceRestrictionMap_of_anodyne`). The route: the class of such i is weakly saturated; for i = `Λ[m, j] ⊆ Δ[m]`, a lifting
problem against `∂Δ[n] ⊆ Δ[n]` is, through the universal property of coslices, a filling problem for the horn
`Λ[m + n + 1, j]` against π, which is inner when j > 0 and a left horn when j = 0.

*Needs:* Tau Ceti `SSet.coslice.homEquiv`, `SSet.coslice.map`, `SSet.join`, `SSet.LeftFibration`,
`SSet.rightAnodyneExtensions`, `SSet.rlp_monomorphisms_iff`; Mathlib `SSet.InnerFibration`, `SSet.anodyneExtensions`; ModelCategoryTheory, Part
ModelCategories (HTT, Def. A.1.2.2 and Cor. A.1.2.7).

### Examples

- For a vertex y of an ∞-category C, `C_{y/} → C` is a left fibration (§4.3) whose fiber over x has as
  n-simplices the (n+1)-simplices of C with first vertex y and face opposite it constant at x (the left mapping
  space of §5.2).
- For K = Δ[1] and p an edge f : x → y of an ∞-category C, restriction `C_{f/} → C_{y/}` along the right anodyne
  `{1} ⊆ Δ[1]` is a trivial fibration (§4.3 with T = Δ[0] and π inner). Restriction `C_{f/} → C_{x/}` along `{0}`
  need not be one: for C = Δ[1] and f the nondegenerate edge, `C_{f/}` is a point and `C_{x/}` is Δ[1].

### Dependencies

Tau Ceti's joins, slices, coslices, their universal properties and restriction maps; Layer 3 for left and right
anodyne maps; ModelCategoryTheory, Part ModelCategories for weak saturation.

## Layer 5: Kan complexes, mapping spaces, final objects and colimits

### 5.1 Kan complexes as ∞-groupoids, and cores

The outer-horn characterization of equivalences is Tau Ceti's `SSet.Edge.isEquivalence_iff_hornFilling_zero`: an
edge φ of an ∞-category is an equivalence exactly when every `Λ[n, 0] → C` with n ≥ 2 and first edge φ extends to
`Δ[n]` (HTT, Prop. 1.2.4.3, p. 52). Its proof turns an extension along `Λ[n, 0]` into a lift of φ, with prescribed
source, along the restriction map of slices `C_{/Δ[n−2]} → C_{/∂Δ[n−2]}`, a right fibration (Tau Ceti
`SSet.slice.rightFibration_map`), and right fibrations lift equivalences (Tau Ceti
`SSet.slice.hasLift_of_isEquivalence`). The dual statement for `Λ[n, n]` follows by passing to `Cᵒᵖ`.

**5.1.1.** Prove that the following conditions on a simplicial set C are equivalent (HTT, Prop. 1.2.5.1, p. 53): (1) C is an
∞-category whose homotopy category is a groupoid; (2) C has fillers for all horns `Λ[n, i]` with `0 ≤ i < n`;
(3) C has fillers for all horns with `0 < i ≤ n`; (4) C is a Kan complex. The `Suggested.lean` declaration for the equivalence of (1) and (4)
is `kanComplex_iff`, and for that of (2) and (4) `kanComplex_iff_leftFibration` (condition (2) says that C → Δ[0] is a
left fibration). The route: (1) ⇔ (2) is the outer-horn characterization, (1) ⇔ (3) is its dual for `Cᵒᵖ`, whose
homotopy category is the opposite of that of C (§2.1), and (4) is (2) and (3) together.

*Needs:* Tau Ceti `SSet.Edge.isEquivalence_iff_hornFilling_zero` (HTT, Prop. 1.2.4.3, p. 52),
`SSet.Edge.isEquivalence_iff_isIso`, `SSet.LeftFibration`; Mathlib `SSet.KanComplex`, `SSet.Quasicategory`,
`SSet.opFunctor`; §2.1.6 (HTT, Def. 1.1.5.14; the homotopy category of the opposite).

**5.1.2.** Prove that the core of an ∞-category is a Kan complex (HTT, Prop. 1.2.5.3, p. 53). The core `C^≃` is Tau Ceti's
`SSet.core C`, the largest simplicial subset all of whose edges are equivalences, and every map from a Kan complex
into C factors uniquely through it (Tau Ceti `SSet.Edge.isEquivalence_of_kanComplex`, `SSet.Edge.IsEquivalence.map`
and `SSet.range_le_core_iff`; uniqueness since the core is a simplicial subset). `Suggested.lean` declaration `kanComplex_core`. The route:
the core is an ∞-category, since inner horns of the core fill in C and the edges it adds are composites of
equivalences; a homotopy inverse of an equivalence is an equivalence and so lies in the core, so the homotopy
category of the core is a groupoid, and §5.1 applies.

*Needs:* Tau Ceti `SSet.core`, `SSet.range_le_core_iff`, `SSet.Edge.isEquivalence_of_kanComplex`; §5.1.1 Kan complexes; §1.2 (HTT, §1.2.5).

### 5.2 Mapping spaces

**5.2.1.** Define the three models of the mapping space between vertices x and y of a simplicial set C (HTT, §1.2.2 and
Remark 1.2.2.5, pp. 45–46).

- The right mapping space `Hom^R_C(x, y)` is Tau Ceti's `SSet.rightMappingSpace C x y`: it is the fiber over x of
  the slice projection `C_{/y} → C`.
- The left mapping space `Hom^L_C(x, y)`: its n-simplices are the (n+1)-simplices of C whose first vertex is x and
  whose face opposite that vertex is constant at y. It is the fiber over y of the coslice projection `C_{x/} → C`,
  and it is isomorphic to the opposite of `Hom^R_{Cᵒᵖ}(y, x)`.
- The mapping space `Hom_C(x, y)` is the fiber over (x, y) of evaluation at the two ends,
  `C^Δ[1] → C × C`; an n-simplex is a map `Δ[n] × Δ[1] → C` constant at x on `Δ[n] × {0}` and at y on
  `Δ[n] × {1}`.

API:

- The vertices of each of the three are the edges from x to y.
- Each is functorial for maps of simplicial sets C → D, and `Hom_C(x, y)` is functorial through `Fun(Δ[1], −)`.
- The quotient map `Δ[n] × Δ[1] → Δ[n] ⋆ Δ[0]` that collapses `Δ[n] × {1}` to the cone point, and dually the
  quotient map `Δ[n] × Δ[1] → Δ[0] ⋆ Δ[n]` that collapses `Δ[n] × {0}`, give natural maps
  `Hom^R_C(x, y) → Hom_C(x, y) ← Hom^L_C(x, y)`.

**Checks.**

- For the nerve of a category D, `Hom^R`, `Hom^L` and `Hom` from x to y are all the discrete simplicial set on
  `D(x, y)`. A definition as the fiber of the slice over the wrong vertex would give the morphisms into x instead.
- Let S be `Δ[2]` with the edge from 0 to 1 collapsed to a point x. Then `Hom^R_S(x, 2)` has a nondegenerate edge
  (the 2-simplex, whose face on the first two vertices is constant), while `Hom^L_S(x, 2)` has the same two
  vertices and no nondegenerate edge. So the left mapping space is not the right one with a different name, and
  the two are not isomorphic in general.
- For C = Δ[0] and x = y the unique vertex, all three are Δ[0]; for vertices in different components of
  `Δ[0] ⊔ Δ[0]` all three are empty.

*Needs:* Tau Ceti `SSet.rightMappingSpace`, `SSet.rightMappingSpace.obj₀Equiv`, `SSet.slice.π`, `SSet.coslice.π`,
`SSet.fiber`, `SSet.ihomOver`; Mathlib `SSet.opFunctor`, `SSet.Edge`; §1.2 (HTT, Notation 1.2.7.2).

**5.2.2.** Prove that for an ∞-category C and objects x, y, the right mapping space `Hom^R_C(x, y)` is a Kan complex (HTT,
Prop. 1.2.2.3, p. 45). `Suggested.lean` declaration `kanComplex_rightMappingSpace`. The route: Tau Ceti's
`SSet.rightMappingSpace.hornFilling` fills every horn `Λ[n, i]` with `0 < i ≤ n`, which is condition (3) of §5.1.

*Needs:* Tau Ceti `SSet.rightMappingSpace.hornFilling`; §5.1.1 Kan complexes.

### 5.3 Left fibrations over Kan complexes

**5.3.1.** Prove that a left fibration p : S → T over a Kan complex T is a Kan fibration (HTT, Lemma 2.1.3.3, p. 84). `Suggested.lean` declaration
`rlp_J_of_leftFibration_of_kanComplex`. The route: S is a Kan complex, since S → Δ[0] is a composite of left
fibrations (§5.1). For an anodyne A ⊆ B the restrictions `S^B → S^A` and `T^B → T^A` are trivial fibrations
(Mathlib `SSet.anodyneExtensions_pushoutObjObjι`, HTT, Remark 2.1.2.8, p. 83), so the pullback-hom
`S^B → S^A ×_{T^A} T^B` is a homotopy equivalence between Kan complexes, and it is a left fibration (Tau Ceti
`SSet.leftFibration_pullbackObjObjπ`, HTT, Cor. 2.1.2.9, first assertion, p. 83). It is therefore surjective on
vertices, which is the lifting property against A ⊆ B, because a left fibration between Kan complexes that is a
homotopy equivalence is surjective on vertices: for a vertex t some vertex s has an edge from p(s) to t, and the
edge lifts to an edge starting at s (HTT, Lemma 2.1.3.2, p. 84).

*Needs:* §5.1.1 Kan complexes; Mathlib `SSet.anodyneExtensions_pushoutObjObjι`,
`SSet.modelCategoryQuillen.J`; Tau Ceti `SSet.leftFibration_pullbackObjObjπ`; ModelCategoryTheory, Part KanQuillen
(HTT, §A.2.7, homotopy equivalences of Kan complexes).

**5.3.2.** Prove that a left fibration p : S → T whose fibers over all vertices are contractible Kan complexes is a trivial
fibration (HTT, Lemma 2.1.3.4, p. 84). `Suggested.lean` declaration `rlp_monomorphisms_of_leftFibration`, with contractibility of the
fiber `SSet.fiber p t` stated as weak contractibility. The route is Lurie's, written for the dual right fibrations:
p has nonempty fibers, so it lifts against `∅ ⊆ Δ[0]`; for a boundary `∂Δ[n] → S` over `Δ[n] → T`, pull back to
T = Δ[n], deform along `Δ[n] × Δ[1]` towards the initial vertex using the right anodyne inclusion
`∂Δ[n] × {1} ⊆ ∂Δ[n] × Δ[1]` (the dual of HTT, Cor. 2.1.2.7) and the filtration of §3.2, and fill the last horn
`Λ[n + 1, 0]`, whose first edge lies in a fiber and is therefore an equivalence (§5.1), by the outer-horn
characterization.

*Needs:* §3.2.1; §5.1.1 Kan complexes; Tau Ceti `SSet.Edge.isEquivalence_iff_hornFilling_zero` (HTT, Prop. 1.2.4.3,
p. 52), `SSet.rightAnodyneExtensions_pushoutObjObjι'`, `SSet.fiber`, `SSet.IsWeaklyContractible`.

### 5.4 Transport along left fibrations

**5.4.1.** Prove that a left fibration determines a functor from the homotopy category of its base to the homotopy category
of spaces (HTT, Lemma 2.1.1.4, p. 76). For a left fibration q : X → S, each fiber `X_s` is a Kan complex, and each
edge f : s → s' determines a morphism `f_! : X_s → X_{s'}` of H, characterized as follows: for homotopy classes
η : K → `X_s` and η' : K → `X_{s'}`, η' = f_! ∘ η exactly when some `K × Δ[1] → X` lying over `K × Δ[1] → Δ[1] → S`
(through f) restricts to representatives of η and η'. The assignment s ↦ `X_s`, f ↦ `f_!` is a functor from
`hoFunctor.obj S` to H. The route: `X_s × {0} ⊆ X_s × Δ[n]` is left anodyne (HTT, Cor. 2.1.2.7, p. 82), which
gives the lifts over Δ[1] defining `f_!` and the lifts over Δ[2] proving the composition law; a functor out of the
homotopy category is determined by edges and 2-simplices (Mathlib `CategoryTheory.nerveAdjunction`).

*Needs:* §5.1.1 Kan complexes (fibers of left fibrations are Kan by condition (2)); Tau Ceti `SSet.LeftFibration`,
`SSet.fiber`, `SSet.leftAnodyneExtensions_pushoutObjObjι'`; Mathlib `SSet.hoFunctor`,
`CategoryTheory.nerveAdjunction` (HTT, Prop. 1.2.3.1, p. 46); ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7,
the homotopy category H); §2.1.6 (HTT, Def. 1.1.5.14).

**5.4.2.** Prove that a left fibration p : S → T is a Kan fibration exactly when every transport map `f_!` of §5.4.1 is
an isomorphism of H (HTT, Prop. 2.1.3.1, p. 84). The route is Lurie's. If p is a Kan fibration it is also a
right fibration, whose transport `f^*` is inverse to `f_!` up to homotopy. Conversely, by the dual of the homotopy
extension lifting property (§3.3) it suffices to show that `S^Δ[1] → S^{1} ×_{T^{1}} T^Δ[1]` is a trivial
fibration; it is a left fibration (Tau Ceti `SSet.leftFibration_pullbackObjObjπ`), and its fibers are contractible
because the transport maps are homotopy equivalences, so §5.3 applies.

*Needs:* §5.4.1 transport; §3.3.2 homotopy extension lifting; §5.3.1, §5.3.2 (both the Kan-fibration lemma and the
contractible-fiber lemma); Tau Ceti `SSet.leftFibration_pullbackObjObjπ`, `SSet.RightFibration`; Mathlib
`SSet.modelCategoryQuillen.J`; ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7: a Kan fibration that is a
homotopy equivalence is a trivial fibration).

### 5.5 Final objects and the uniqueness of colimits

Final objects are the strongly final vertices of §1.2. Everything in this section dualizes to initial objects
(HTT, Remark 1.2.12.6, p. 63).

**5.5.1.** Prove that a vertex y of a simplicial set C is strongly final (`SSet.IsTerminalVertex`) exactly when the slice
projection `SSet.slice.π` for y : Δ[0] → C has the right lifting property against all monomorphisms (HTT,
Def. 1.2.12.3, p. 63, where the two forms are given as equivalent; `Suggested.lean` declaration
`isTerminalVertex_iff_rlp_monomorphisms_slice_π`). The route: by `SSet.slice.homEquiv`, a lifting
problem of `∂Δ[n] ⊆ Δ[n]` against the projection is an extension problem along the pushout-join
`(∂Δ[n] ⋆ Δ[0]) ∪ Δ[n] = ∂Δ[n + 1] ⊆ Δ[n + 1]`, whose last vertex goes to y; n ≥ 0 matches the boundaries of
dimension at least 1 in the definition.

*Needs:* Tau Ceti `SSet.slice.homEquiv`, `SSet.Subcomplex.unionJoin`, `SSet.IsTerminalVertex`,
`SSet.rlp_monomorphisms_iff`.

**5.5.2.** Prove that an object y of an ∞-category C is strongly final exactly when `Hom^R_C(x, y)` is contractible for every
object x (HTT, Prop. 1.2.12.4, p. 63). `Suggested.lean` declaration `isTerminalVertex_iff_isWeaklyContractible`. The route: y is
strongly final exactly when the right fibration `C_{/y} → C` is a trivial fibration (§5.5.1); `Hom^R_C(x, y)` is its fiber
over x; a trivial fibration has contractible fibers, and conversely §5.3, in its dual form for right fibrations,
applies.

*Needs:* §5.5.1 strongly final vertices through slices; Tau Ceti `SSet.slice.rightFibration_π` (HTT, Prop. 1.2.9.3,
first assertion, p. 61), `SSet.rightMappingSpace`, `SSet.IsWeaklyContractible`; §5.2.2 Kan property of `Hom^R`; §5.3.2 contractible-fiber lemma (dual form).

**5.5.3.** Prove that the full subcategory of an ∞-category spanned by its strongly final objects is either empty or a
contractible Kan complex (HTT, Prop. 1.2.12.9, p. 64). `Suggested.lean` declaration
`rlp_monomorphisms_terminal_from_fullEnhancedSubcategory_isTerminalVertex`, in which the full subcategory is Tau
Ceti's `SSet.fullEnhancedSubcategory`. The route: for n ≥ 1 a map `∂Δ[n]` into the full subcategory extends to
`Δ[n]` in C because its last vertex is strongly final, and the extension lies in the full subcategory; for n = 0
one needs the subcategory to be nonempty. Its vertices are the final objects of C (§1.2).

*Needs:* Tau Ceti `SSet.IsTerminalVertex`, `SSet.fullEnhancedSubcategory`; §1.2.1 (HTT, §1.2.11) and §1.2 (HTT, Def. 1.2.12.3).

**5.5.4.** Prove that colimits are unique in the strongest sense: for an ∞-category C and p : K → C, the full subcategory of
`C_{p/}` spanned by the colimits of p (§1.2: its initial vertices) is empty or a contractible Kan complex, and
dually for limits (HTT, Prop. 1.2.12.9 applied to `C_{p/}ᵒᵖ`, p. 64, as recorded in HTT, Remark 1.2.13.5, p. 65).
`Suggested.lean` declaration
`rlp_monomorphisms_terminal_from_colimits`. The route: §4.3 makes `C_{p/}` an ∞-category, and §5.5.3,
dualized to initial objects (HTT, Remark 1.2.12.6, p. 63), applies to it.

*Needs:* §4.3.1 (coslice of an ∞-category); §5.5.3 space of strongly final objects, dual form; Tau Ceti
`SSet.coslice.IsColimit`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2, p. 60), `SSet.fullEnhancedSubcategory`; §1.2.4 (HTT, Def. 1.2.13.4; Notation 1.2.8.4).

**5.5.5.** Prove that colimits in a full subcategory are computed in the ambient ∞-category: for a full subcategory C₀ ⊆ C of
an ∞-category and p : K → C₀, the coslice `(C₀)_{p/}` is `C₀ ×_C C_{p/}`, so a colimit of p in C that lies in C₀ is a
colimit of p in C₀ (HTT, Def. 1.2.13.4, with HTT, Remark 1.2.13.7, p. 66; `Suggested.lean` declaration
`isColimit_of_isColimit_coslice_map_ι`). The route: the n-simplices of `(C₀)_{p/}` are maps `K ⋆ Δ[n] → C` whose vertices lie in C₀.

*Needs:* Tau Ceti `SSet.fullEnhancedSubcategory`, `SSet.coslice.map`, `SSet.coslice.IsColimit`; §1.2.1 (HTT, §1.2.11), §1.2.4 (HTT, Def. 1.2.13.4).

### 5.6 The inclusion of a final object is right anodyne

**5.6.1.** Prove that if x is a final object of an ∞-category C, then the vertex inclusion `{x} ⊆ C` is right anodyne, and
dually that the inclusion of an initial object is left anodyne (the statement used in HTT, Prop. 4.4.4.5, p. 318,
here with its proof). The statement holds in every universe, and is applied to large ∞-categories (`Suggested.lean`
declarations `rightAnodyneExtensions_const_of_isTerminalVertex` and `leftAnodyneExtensions_const_of_isInitialVertex`).
The route is a retraction onto a mapping cylinder.

- Since x is strongly final, the slice projection `C_{/x} → C` is a trivial fibration (§5.5). Lifting it against
  the monomorphism `{x} ⊆ C`, with the vertex `id_x` of `C_{/x}` prescribed on `{x}` and the identity of C below,
  gives a section s with `s(x) = id_x`, the degenerate edge at x. Through the universal property of slices, s is a
  map `C ⋆ Δ[0] → C` that is the identity on C and sends the cone point to x.
- Let `c : C × Δ[1] → C ⋆ Δ[0]` send an n-simplex (σ, τ), with σ : Δ[n] → C and τ : [n] → [1], to the restriction
  of σ to `τ⁻¹(0)`, joined with the cone point when `τ⁻¹(1)` is nonempty. It is a map of simplicial sets, the
  identity on `C × {0}`, and it collapses `C × {1}` to the cone point. Composing gives `h : C × Δ[1] → C` that is
  the identity on `C × {0}`, constant at x on `C × {1}` and degenerate on `{x} × Δ[1]`.
- Let M be the pushout of `C × Δ[1]` along `(C × {1}) ∪ ({x} × Δ[1]) → {x}`. Then `{x} → M` is a pushout of the
  pushout-product of `{x} ⊆ C` with the right anodyne `{1} ⊆ Δ[1]`, hence right anodyne (Tau Ceti
  `SSet.rightAnodyneExtensions_pushoutObjObjι'`).
- h factors through M, and `C → C × {0} → M → C` is the identity, compatibly with `{x}`. So `{x} ⊆ C` is a retract of
  `{x} → M`, and right anodyne maps are closed under retracts.

Instances:

- for C = Δ[n] and x = n this gives that `{n} ⊆ Δ[n]` is right anodyne; for n ≥ 1 the vertex 0 is not final, and
  `{0} ⊆ Δ[1]` is not right anodyne, since it does not lift against itself, a right fibration (Conventions);
- in a contractible Kan complex every vertex is final, and its inclusion is right and left anodyne;
- for C = `Δ[0] ⊔ Δ[0]` there is no final object, and neither vertex inclusion is right anodyne, since it is not even
  a weak homotopy equivalence.

*Needs:* §5.5.1 (strongly final objects through slices); Tau Ceti `SSet.slice.homEquiv`, `SSet.join`,
`SSet.IsTerminalVertex`, `SSet.rightAnodyneExtensions`, `SSet.rightAnodyneExtensions_pushoutObjObjι'`; Mathlib `SSet.rlp_monomorphisms`;
ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2: pushouts and retracts in a weakly saturated
class).

### Examples

- In the nerve of a poset with a largest element, the full subcategory of strongly final objects is a point; in
  `Δ[0] ⊔ Δ[0]` it is empty.
- In a contractible Kan complex every vertex is strongly final and strongly initial, since every boundary extends.
- The core of the nerve of a category is the nerve of its maximal subgroupoid, a Kan complex by §5.1.
- In the nerve of a category, the subcategories, cones, limits and colimits of §1.2 are the classical ones; in Δ[n]
  the final object is n and the initial object 0.

### Dependencies

Layers 3 and 4, with §3.3's pushout-products for §5.6; Tau Ceti's core, right mapping spaces, fibers, terminal and
initial vertices, colimits and full subcategories; ModelCategoryTheory, Part KanQuillen for homotopy equivalences
of Kan complexes and Part ModelCategories for weak saturation; §1.2 for full subcategories,
cones, strongly final objects and colimits.

## Layer 6: The covariant and contravariant model structures

### 6.1 Rigidification of monomorphisms and inner anodyne maps

**6.1.1.** Prove that rigidification carries monomorphisms of simplicial sets to cofibrations of the Bergner model structure on
simplicial categories (HTT, proof of Thm. 2.2.5.1, p. 108), and that it carries inner anodyne maps to trivial
cofibrations, so that every inner anodyne map is a categorical equivalence (HTT, Lemma 2.2.5.2, p. 107; for the last
claim, `Suggested.lean` declaration `isCategoricalEquivalence_of_innerAnodyneExtensions`). The route is
Lurie's. Rigidification preserves colimits, and the maps of each kind form a weakly saturated class, so it suffices
to treat generators.

- **Boundaries.** For n = 0 the map is ∅ → ∗. For n > 0, `C[∂Δ[n]]` differs from `C[Δ[n]]` only in the mapping
  simplicial set from 0 to n, the boundary of the cube `(Δ[1])^(n−1)`, so `C[∂Δ[n]] → C[Δ[n]]` is a pushout of the
  generating cofibration `[1]_{∂ cube} → [1]_{cube}`. With the left properness of the Bergner model structure this
  makes pushouts of rigidifications along monomorphisms homotopy pushouts.
- **Inner horns.** For 0 < i < n, `C[Λ[n, i]]` has the same objects and mapping simplicial sets as `C[Δ[n]]` except
  from 0 to n, where it is the cube with its interior and one face removed (§2.5, Tau Ceti's `TauCeti.HornThickening`);
  that inclusion K ⊆ cube is anodyne, so `C[Λ[n, i]] → C[Δ[n]]` is a pushout of the trivial cofibration
  `[1]_{K} → [1]_{cube}` (HTT, proof of Lemma 2.2.5.2, p. 107).

*Needs* (monomorphisms): §2.5; Mathlib `CategoryTheory.SimplicialThickening` (HTT, Def. 1.1.5.3); §2.1 (HTT, Def. 1.1.5.5, adjunction part); ModelCategoryTheory, Part ModelCategories §1.3 (HTT, Def. A.1.2.2);
ModelCategoryTheory, Part SimplicialCategories §5.2 (HTT, Prop. A.3.2.4: generators and colimits) and §5.4 (the
Bergner model structure and its left properness).

*Needs* (inner anodyne maps): the monomorphism case; §2.1 (HTT, Def. 1.1.5.5, horn part; Def. 1.1.5.14); Tau Ceti `TauCeti.HornThickening`; Mathlib `SSet.innerAnodyneExtensions`; ModelCategoryTheory,
Part KanQuillen (HTT, §A.2.7, anodyne maps).

### 6.2 Left cones and covariant equivalences

**6.2.1.** Define the left cone of a map f : X → S as the pushout `C◁(f) = S ⊔_X X◁` of the inclusion X ⊆ X◁ along f, and the
right cone as `C▷(f) = S ⊔_X X▷` (HTT, Def. 2.1.4.2, p. 86). `Suggested.lean` declarations `leftCone`, `rightCone`
and the induced maps `leftConeMap`, `rightConeMap`, for objects and maps of Mathlib's `CategoryTheory.Over S`.

- S is a simplicial subset of `C◁(f)`, which has exactly one more vertex, the cone point, and every other
  nondegenerate simplex of `C◁(f)` is the join of the cone point with a nondegenerate simplex of X.
- `f ↦ C◁(f)` is a functor from simplicial sets over S to simplicial sets under S; it preserves monomorphisms,
  pushouts and filtered colimits, but not the initial object or coproducts: the left cone of ∅ → S is S with a
  disjoint cone point, and the left cone of `Δ[0] ⊔ Δ[0] → Δ[0]` has two vertices while the coproduct under Δ[0]
  of two copies of the left cone `Δ[1]` of the identity has three.

**Checks.**

- For f the identity of S, `C◁(f)` is `S◁`; for X empty, `C◁(f)` is S with a disjoint cone point. A definition
  through the join `S◁` itself would add edges from the cone point to every vertex of S in the second case.
- For f : `Δ[0] ⊔ Δ[0] → Δ[0]`, `X◁` is `Λ[2, 0]`, and the pushout identifies its two outer vertices: `C◁(f)` has
  two vertices and two parallel nondegenerate edges from the cone point, so it is not `Δ[1]`.
- For f = `{1} ⊆ Δ[1]`, `C◁(f)` is `Λ[2, 2]` (edges from the cone point to 1 and from 0 to 1), while the left cone
  of the identity of `Δ[1]` is `Δ[2]`; the cone point is a source, as in the convention for `K◁`.

*Needs:* §1.2.2 (HTT, Notation 1.2.8.4); Tau Ceti `SSet.join`.

**6.2.2.** Define the covariant classes of maps over a simplicial set S (HTT, Def. 2.1.4.5, pp. 86–87). For a map f : X → Y of
simplicial sets over S:

- f is a covariant cofibration when it is a monomorphism;
- f is a covariant equivalence when the induced map of left cones `C◁(X → S) → C◁(Y → S)` is a categorical
  equivalence;
- f is a covariant fibration when it has the right lifting property against every map that is both a covariant
  cofibration and a covariant equivalence.

`Suggested.lean` declarations `IsCovariantEquivalence`, `covariantEquivalences` and `covariantFibrations`.

API: covariant equivalences contain the isomorphisms and satisfy two-out-of-three and retracts (from the same
properties of categorical equivalences); no hypothesis is placed on S.

**Checks.**

- Over S = Δ[1], the vertex inclusion `{0} ⊆ Δ[1]` is a covariant equivalence (a left anodyne map, by the closure
  properties below), while `{1} ⊆ Δ[1]` is not: its map of left cones is `Λ[2, 2] ⊆ Δ[2]`, and the homotopy
  category of `Λ[2, 2]` has no morphism from the cone point to 0. A definition through right cones would exchange
  the two.
- Over S = Δ[0], the map ∅ → Δ[0] is not a covariant equivalence: its map of left cones is `Δ[0] ⊔ Δ[0] → Δ[1]`
  (the cone point is disjoint from S when X is empty), which is not fully faithful. So not every monomorphism is a
  covariant equivalence.
- Over S = Δ[0], `Δ[1] → Δ[0]` is a covariant equivalence (two-out-of-three with the left anodyne `{0} ⊆ Δ[1]`),
  although it is not a categorical equivalence. A definition comparing X and Y themselves by categorical
  equivalence would reject it.

*Needs:* §6.2.1 cones; §2.1.6 (HTT, Def. 1.1.5.14).

**6.2.3.** Prove the closure properties of covariant equivalences over S that Smith's recognition theorem asks for.

- **Left anodyne maps** over S are covariant equivalences (HTT, Lemma 2.1.4.6, p. 87; `Suggested.lean` declaration
  `isCovariantEquivalence_of_leftAnodyneExtensions`). The route: the monomorphisms
  over S whose map of left cones is a categorical equivalence form a weakly saturated class, because rigidification
  preserves colimits, carries monomorphisms to cofibrations (§6.1) and the Bergner model structure is left proper;
  for a generator `Λ[n, i] ⊆ Δ[n]` with `0 ≤ i < n`, the map of left cones is a pushout of the inner horn
  `Λ[n + 1, i + 1] ⊆ Δ[n + 1]`, a categorical equivalence by §6.1.
- **Trivial fibrations**, the maps over S with the right lifting property against all monomorphisms, are covariant
  equivalences (HTT, proof of Prop. 2.1.4.7, p. 88; `Suggested.lean` declaration
  `isCovariantEquivalence_of_rlp_monomorphisms`). The route: a trivial fibration p : X → Y over S has a section s
  and a homotopy h over Y from s ∘ p to the identity. The inclusion `X × {0} ⊆ X × Δ[1]` is left anodyne (Tau Ceti
  `SSet.leftAnodyneExtensions_pushoutObjObjι'`), hence a covariant equivalence, so by two-out-of-three the projection
  `X × Δ[1] → X` and the other end `X × {1} ⊆ X × Δ[1]` are too; hence so are h and s ∘ p, and p is a retract of
  s ∘ p.
- **Perfectness and pushouts.** Covariant equivalences form a perfect class, and they are stable under pushout along
  monomorphisms (HTT, proof of Prop. 2.1.4.7, p. 87). The route: the left-cone functor and rigidification preserve
  filtered colimits and pushouts; the weak equivalences of the Bergner model structure are perfect, rigidification
  carries monomorphisms to cofibrations (§6.1), and pushouts along cofibrations in the left proper Bergner model
  structure are homotopy pushouts.

*Needs* (left anodyne maps): §6.2 covariant equivalences; §6.1; Tau Ceti `SSet.leftAnodyneExtensions`; §2.1 (HTT, Def. 1.1.5.5, functor part); ModelCategoryTheory, Part ModelCategories §1.5 (HTT,
Cor. A.1.2.7); ModelCategoryTheory, Part SimplicialCategories §5.4 (HTT, Remark A.3.2.3).

*Needs* (trivial fibrations): the left anodyne case; Tau Ceti `SSet.leftAnodyneExtensions_pushoutObjObjι'` (HTT,
Cor. 2.1.2.7, p. 82), `SSet.rlp_monomorphisms_iff`.

*Needs* (perfectness and pushouts): §6.2 covariant equivalences; §6.1; ModelCategoryTheory, Part ModelCategories §3.5
(HTT, Prop. A.2.4.4) and §5.5 (HTT, Def. A.2.6.12, Cor. A.2.6.14); ModelCategoryTheory, Part SimplicialCategories §5.4
(HTT, Remark A.3.2.3, Prop. A.3.2.4).

### 6.3 The covariant model structure

**6.3.1.** Prove that for every simplicial set S, the covariant cofibrations, covariant equivalences and covariant fibrations
form a left proper combinatorial model structure on simplicial sets over S (HTT, Prop. 2.1.4.7, p. 87), the
covariant model structure (HTT, §2.1.4 after Prop. 2.1.4.8, p. 88), and that (1) every left anodyne map over S is a
trivial cofibration, (2) every covariant fibration is a left fibration, and (3) every fibrant object X → S is a left
fibration (HTT, Prop. 2.1.4.9, p. 88). The route: Smith's recognition theorem, whose three conditions are the closure
properties of §6.2; the cofibrations are generated by the boundary inclusions over S, and every object is cofibrant,
which gives left properness. Then (1) is §6.2, (2) follows since left horns over S are trivial cofibrations, and (3)
is (2) for X → S; the converse of (3) also holds, and its proof needs straightening (§7.6). Mathlib's `ModelCategory.over` on simplicial sets over S is a
different structure (Kan–Quillen over S); the covariant one lives on a type synonym. The `Suggested.lean` declarations
state the model structure through its two weak factorization systems, `isWeakFactorizationSystem_covariantFibrations`
and `rlp_monomorphisms_eq_covariantFibrations_inf`, and (2) as `leftFibration_of_covariantFibrations`.

*Needs:* §6.2.3 (closure properties); Tau Ceti `SSet.LeftFibration`; ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT,
Def. A.2.4.1), §6.1.1 (HTT, Def. A.2.6.1) and §6.3.2 (HTT, Prop. A.2.6.15); Mathlib `HomotopicalAlgebra.ModelCategory`
(HTT, Def. A.2.1.1).

**6.3.2.** Prove that the covariant model structure is simplicial and changes base along Quillen adjunctions.

- **Enrichment.** Simplicial sets over S, with the simplicial sets of maps over S and tensors X × K, form a
  simplicial model category (HTT, Prop. 2.1.4.8, p. 88). The route: Lurie's recognition criterion for simplicial
  model categories applies once `X × Δ[n] → X` is a covariant equivalence, and it is, because its section
  `X × {0}` is left anodyne (Tau Ceti `SSet.leftAnodyneExtensions_pushoutObjObjι'`) and so a trivial cofibration.
- **Base change.** For j : S → S′, the adjunction `j_! ⊣ j^*` given by composition with j and pullback along j
  (Mathlib `Over.mapPullbackAdj j`) is a Quillen adjunction (HTT, Prop. 2.1.4.10, p. 89; `Suggested.lean` declaration
  `isCovariantEquivalence_map` for the preservation of covariant equivalences). The route: `j_!` preserves
  monomorphisms, and it preserves covariant equivalences because the left cone of X → S′ is the pushout of
  `C[S] → C[S′]` along `C[S] → C[C◁(X → S)]`, and this pushout of rigidifications along a cofibration (§6.1) is a
  homotopy pushout in the left proper Bergner model structure.

*Needs* (enrichment): §6.3 covariant model structure; Tau Ceti `SSet.leftAnodyneExtensions_pushoutObjObjι'`,
`SSet.ihomOver`; ModelCategoryTheory, Part SimplicialCategories §1.3 (HTT, Def. A.3.1.5) and §1.4 (HTT,
Prop. A.3.1.7).

*Needs* (base change): §6.3 covariant model structure; §6.2 cones; §6.1; Mathlib `CategoryTheory.Over.mapPullbackAdj`;
ModelCategoryTheory, Part ModelCategories §4.1 (HTT, §A.2.5, Quillen adjunctions) and §3.5 (HTT, Prop. A.2.4.4);
ModelCategoryTheory, Part SimplicialCategories §5.4 (HTT, Prop. A.3.2.4).

### 6.4 The contravariant model structure

**6.4.1.** Define the contravariant model structure on simplicial sets over S (HTT, Remark 2.1.4.12, p. 89; it is a model
structure by Prop. 2.1.4.7 over `Sᵒᵖ`, p. 87): a map f over S is a contravariant cofibration when it is a
monomorphism, and a contravariant equivalence (respectively fibration) when `fᵒᵖ` is a covariant equivalence
(respectively fibration) over `Sᵒᵖ`. `Suggested.lean` declarations `IsContravariantEquivalence`,
`contravariantEquivalences` and `contravariantFibrations`; the first is read through Mathlib's `CategoryTheory.Over.post`
of `SSet.opFunctor`, and the fibrations are the right lifting class of the monomorphisms that are contravariant
equivalences.

- It is a left proper combinatorial model structure with the same cofibrations; it is not the covariant one in
  general (`Suggested.lean` declarations `isWeakFactorizationSystem_contravariantFibrations` and
  `rlp_monomorphisms_eq_contravariantFibrations_inf`).
- Equivalently, f is a contravariant equivalence when the induced map of right cones `C▷(X → S) → C▷(Y → S)` is a
  categorical equivalence (`Suggested.lean` declaration `isContravariantEquivalence_iff`).
- The results of §6.2–§6.3 hold for it with right anodyne maps and right fibrations in place of left ones (HTT,
  Remark 2.1.4.12, analogues of Props. 2.1.4.8–2.1.4.10, p. 89): right anodyne maps are trivial cofibrations,
  fibrant objects are right fibrations, the structure is simplicial, and `j_! ⊣ j^*` is a Quillen adjunction
  (`Suggested.lean` declarations `isContravariantEquivalence_of_rightAnodyneExtensions` and
  `rightFibration_of_contravariantFibrations`).

**Checks.**

- Over S = Δ[1], `{1} ⊆ Δ[1]` is a contravariant equivalence and `{0} ⊆ Δ[1]` is not, the reverse of the covariant
  case of §6.2. A definition that took the contravariant structure to be the covariant one would fail here.
- Over S = Δ[0], `Δ[1] → Δ[0]` is a contravariant equivalence (two-out-of-three with the right anodyne
  `{1} ⊆ Δ[1]`) but not a categorical equivalence; a definition comparing total spaces categorically fails here.
- Over S = Δ[1], `{0} → Δ[1]` is a right fibration and not a left fibration, so by §6.3 (3) it is not covariantly
  fibrant; the contravariant structure is the one adapted to it.

*Needs:* §6.3.1, §6.3.2 (both results); §2.1.2 (the opposite comparison), §2.1.6 (categorical equivalences are stable under opposites),
for the right-cone form and the transfer by opposites; Mathlib `SSet.opFunctor`, `HomotopicalAlgebra.ModelCategory`;
Tau Ceti `SSet.RightFibration`, `SSet.rightAnodyneExtensions`.

### Examples

- Over S = Δ[0], every covariantly fibrant object is a left fibration to a point, that is, a Kan complex (§6.3 (3)
  with §5.1).
- For a category D, the nerve of a discrete opfibration E → D (unique lifts of morphisms with prescribed source)
  is a left fibration over the nerve of D with discrete fibers.
- The vertex inclusion `{0} ⊆ Δ[n]` over Δ[n] is a covariant trivial cofibration, so for a covariantly fibrant
  X → Δ[n] the restriction from sections over Δ[n] to the fiber over 0 is a trivial fibration (§6.3, enrichment); the fiber
  over n, not the one over 0, is a deformation retract of X, by transport along the contraction of Δ[n] onto n.
  For n = 1 and X = `{1} ⊆ Δ[1]`, the fiber over 0 is empty while X is a point.

### Dependencies

Layers 1–5; §1.2 for cones, §1.1 for the H-enriched homotopy categories of simplicial categories, and §2.1 for
rigidification and categorical equivalences; ModelCategoryTheory, Part
ModelCategories for weak saturation, homotopy pushouts, Smith's theorem and Quillen adjunctions; ModelCategoryTheory,
Part SimplicialCategories for the Bergner model structure and simplicial model categories.

## Layer 7: Straightening and the classification of right fibrations

### 7.1 Spaces, straightening, unstraightening and classifying maps

**7.1.1.** Define the comparison `C[K × L] → C[K] × C[L]`, the pairing of `C[pr₁]` and `C[pr₂]`, the identity on objects
(HTT, §5.1.3, p. 338, the product comparison).

**Checks.**
- For K = L = Δ[1], the mapping object of `C[Δ[1] × Δ[1]]` from (0,0) to (1,1) is two copies of Δ[1]
  glued along an endpoint (one per 2-simplex of the square), while that of `C[Δ[1]] × C[Δ[1]]` is a point:
  the comparison is not an isomorphism, only a weak equivalence on mapping objects.
- For L = Δ[0], the comparison is the isomorphism `C[K × Δ[0]] ≅ C[K]`.
- For K = Δ[1] and L = ∂Δ[1], K × L is two disjoint copies of Δ[1] and the comparison is an isomorphism onto two
  copies of `C[Δ[1]]`; a comparison that always failed to be an isomorphism off L = Δ[0] would be wrong.

*Needs:* §2.1.1 (C[−]).

**7.1.2.** Define `Kan` as the full simplicial subcategory of simplicial sets on the small Kan complexes, and the
∞-category of spaces `S = N(Kan)`, an object of `SSet.{u+1}` (HTT, Def. 1.2.16.1, p. 69); write `Ŝ` for the
spaces of the next universe. Define the inclusion `S → Cat∞` as the nerve of the simplicial functor
`Kan → Cat^Δ_∞` that is the identity on objects and on mapping objects: for Kan complexes X and Y every edge
of `Fun(X, Y)` is an equivalence (`SSet.Edge.isEquivalence_of_kanComplex`), so the core of `Fun(X, Y)` is all of
it. The `Suggested.lean` declarations are `Kan` and `spaces`, with the vertex `spacesPoint` for the Kan complex Δ[0].

**Checks.**
- The vertices of S are the small Kan complexes; Λ[2,1] is not one.
- A 2-simplex of S is a triple of maps f, g, h together with an edge of `Fun(X₀, X₂)` from h to `g ∘ f` (a
  homotopy, invertible since `Fun(X₀, X₂)` is a Kan complex), not a commuting triangle: the nerve of the ordinary category of Kan complexes is a different
  simplicial set.
- The empty Kan complex is a vertex, initial in S, and Δ[0] is another, so S has at least two equivalence
  classes of objects.

*Needs:* Mathlib `CategoryTheory.SimplicialNerve`, `SSet.KanComplex`; Tau Ceti `SSet.catInfty`,
`SSet.Edge.isEquivalence_of_kanComplex`.

**7.1.3.** Define an ∞-category to be essentially small when it is categorically equivalent (§2.1) to a small one, small in
the sense of §1.1 (HTT, §1.2.15, p. 69).

**Checks.**
- Every small ∞-category is essentially small.
- The nerve of the codiscrete groupoid on a large set is categorically equivalent to Δ[0], so it is
  essentially small without being small.
- The ∞-category of spaces of §7.1.2 is not essentially small: its vertices include a Kan complex of every small
  cardinality, so it has more equivalence classes of objects than any small simplicial set has vertices.

*Needs:* §1.1 (sizes); §2.1.6 (categorical equivalences); §7.1.2 above (S, for the third Check).

**7.1.4.** Fix a simplicial set S, a simplicial category C and a simplicial functor `φ : C[S] → Cᵒᵖ`. For X → S, let v
be the cone point of `X▷` and form the simplicial category `M = C[X▷] ⊔_{C[X]} Cᵒᵖ` (the pushout along
`C[X] → C[S] → Cᵒᵖ`). Define the straightening `St_φ X : C → SSet` by `(St_φ X)(c) = Map_M(c, v)`, functorial
in X over S (HTT, §2.2.1, p. 91, the straightening functor); write `St_S` when `C = C[S]ᵒᵖ` and φ is the
identity.

**Checks.**
- For X = ∅, M is `Cᵒᵖ` with an isolated object v, so `St_φ ∅` is the empty functor.
- For S = X = Δ[0] and `C = C[Δ[0]]ᵒᵖ`, `X▷ = Δ[1]` and `St(Δ[0])` is a point.
- Over S = Δ[1], `St_S` of the vertex 0 is a point at 0 and empty at 1, and `St_S` of the vertex 1 is a point at
  both: the presheaves on `C[Δ[1]]` represented by 0 and by 1, matching the right fibration `{0} → Δ[1]` with
  empty fiber over 1. Taking v as a source rather than a target (the left cone) would exchange the two.

*Needs:* §2.1.1 (C[−]); §1.2.2 (cones); ModelCategoryTheory, Part SimplicialCategories §5.2.1 (HTT, Prop. A.3.2.4:
pushouts in `Cat_Δ`) and §2.1.1 (HTT, Def. A.3.3.1: the diagram category `Set_Δ^C`).

**7.1.5.** Define the unstraightening `Un_φ F` of a simplicial functor F : C → SSet as the simplicial set over S whose
n-simplices are pairs of an n-simplex σ : Δ[n] → S and a natural transformation `St_φ(σ) → F`, and prove the
adjunction `St_φ ⊣ Un_φ` (HTT, §2.2.1, p. 92, the unstraightening). The adjunction rests on `St_φ` preserving
small colimits (HTT, §2.2.1, p. 92, implicit before Prop. 2.2.1.1): `X ↦ X▷`, `C[−]` and the pushout defining
M commute with colimits over S, and `Map_M(−, v)` is computed on the component of the cone point; then
every X over S is the colimit of its simplices, so maps `St_φ X → F` are the compatible families defining
maps `X → Un_φ F`.

**Checks.**
- For F the constant functor at Δ[0], `Un_φ F` is S itself (each σ has a unique transformation to F).
- For F the empty functor, `Un_φ F` is empty, since every `St_φ(σ)` has a nonempty value at the image of the
  last vertex of σ.
- For X = Δ[n] over S, maps `Δ[n] → Un_φ F` over S are exactly transformations `St_φ(Δ[n]) → F`.

*Needs:* §7.1.4 above (St).

**7.1.6.** Right and left fibrations are classified by maps to spaces through a universal right fibration that needs no
marking. Let ∗ be the vertex Δ[0] of the ∞-category of spaces S (§7.1 above). Define the universal right fibration
as the projection `(Sᵒᵖ)_{/∗} → Sᵒᵖ` from the slice of the opposite of spaces over ∗ (Tau Ceti `SSet.slice`),
and the universal left fibration as the projection `S_{∗/} → S` (Tau Ceti `SSet.coslice`), which is its
opposite through the isomorphism `S_{∗/} ≅ ((Sᵒᵖ)_{/∗})ᵒᵖ` (Tau Ceti `SSet.coslice.opSliceIso`). The
same constructions with the spaces `Ŝ` of the next universe give the universal right and left fibrations
for large fibers. Since S is an ∞-category (Tau Ceti `CategoryTheory.SimplicialNerve.quasicategory`, the
mapping objects of `Kan` being Kan complexes), so is `Sᵒᵖ`, and the first projection is a right fibration
(Tau Ceti `SSet.slice.rightFibration_π`); the second is then a left fibration, through `opSliceIso`. Lurie
gives the name "universal right fibration" to the restriction of the universal Cartesian fibration to `Sᵒᵖ`
(HTT, §3.3.2, p. 230). Here it means the slice projection, which is equivalent to that restriction (HTT,
Cor. 3.3.2.7, p. 231). `Suggested.lean` declarations `universalLeftFibration` and `universalRightFibration`; the second is taken
as the opposite `(S_{∗/})ᵒᵖ → Sᵒᵖ` of the first, with `Sᵒᵖ` the opposite simplicial set of S, which the isomorphisms
`N(Kanᵒᵖ) ≅ Sᵒᵖ` and `SSet.coslice.opSliceIso` identify with the slice projection.

**7.1.7.** For a simplicial set K, a map over K between two right fibrations X → K and X′ → K, or between two left
fibrations, is a pointwise equivalence when, for every vertex k of K, the induced map of fibers `X_k → X′_k`
(the pullbacks along k : Δ[0] → K) is a weak homotopy equivalence (Tau Ceti `SSet.IsWeakHomotopyEquivalence`).
HTT asks for a homotopy equivalence of the fibers, which are Kan complexes (HTT, Def. 2.2.3.2, p. 98); the
weak-equivalence form is used because the pinned Tau Ceti has no homotopy-equivalence predicate. That the two
forms agree, and the identification of pointwise equivalences with the contravariant equivalences (HTT,
Cor. 2.2.3.13), are proved in §7.4 and §7.6. `Suggested.lean` declaration `IsPointwiseEquivalence`, for
maps of Mathlib's `CategoryTheory.Over K`.

**7.1.8.** Define, for a right fibration p : X → K and a map g : K → Sᵒᵖ, that g classifies p when X and the pullback
`K ×_{Sᵒᵖ} (Sᵒᵖ)_{/∗}` of the universal right fibration along g are joined by a finite zigzag of pointwise
equivalences of right fibrations over K. Dually, g : K → S classifies a left fibration p when `gᵒᵖ : Kᵒᵖ → Sᵒᵖ`
classifies `pᵒᵖ`, that is, when X is joined to the pullback `K ×_S S_{∗/}` of the universal left
fibration by such a zigzag. For right or left fibrations with large fibers the same definition is used with
`Ŝ` in place of S. This is the unmarked form of the classification of HTT, §3.3.2, pp. 230–231 (Prop. 3.3.2.5;
Cor. 3.3.2.7 identifies the universal right fibration with the slice; Cor. 3.3.2.8 for left fibrations). The existence of a classifying map for every right fibration between small
simplicial sets is proved in §7.7. `Suggested.lean` declarations `Classifies` and `ClassifiesLeft`, with the zigzag as Mathlib's
`Relation.EqvGen` of the relation "both ends are right (left) fibrations over K and a pointwise equivalence goes
from one to the other". The fibration condition on the intermediate objects is needed: over K = Δ[1], the right
fibrations X with edges a → c and b → d and Y with edges a → c and a → d (b isolated over 0) admit no pointwise
equivalence in either direction, yet the discrete simplicial set on a, b, c, d maps to both by fiberwise
isomorphisms; it is not a right fibration (no edge of it over 0 → 1 ends at c), so it is not an allowed step.

**Checks.**
- Over K = ∅ the unique map classifies the unique right fibration ∅ → ∅.
- Over K = Δ[0], a map g picks a Kan complex Y, and the pullback is the fiber of `(Sᵒᵖ)_{/∗}` over Y, whose
  vertices are the edges ∗ → Y of S, that is the vertices of Y. For Y = ∅ the fiber is empty, so ∅ classifies
  the right fibration ∅ → Δ[0] and the vertex Δ[0] does not: no zigzag of weak homotopy equivalences joins a
  nonempty Kan complex to ∅.
- Over K = Δ[0], the fiber of `(Sᵒᵖ)_{/∗}` over ∗ is Δ[0], since the full simplicial subcategory of `Kan` on
  Δ[0] is the terminal one. So the vertex ∗ classifies the right fibration J → Δ[0], J the nerve of the
  contractible groupoid on two objects, although J is not isomorphic to Δ[0]. A definition by an isomorphism
  with a strict pullback would reject it.
- The right fibration {0} ⊆ Δ[1] has fibers Δ[0] over 0 and ∅ over 1, so its classifier sends the edge 0 → 1
  to the edge of `Sᵒᵖ` from Δ[0] to ∅, the map ∅ → Δ[0] of spaces read backwards; the pullback of the
  universal right fibration along it is {0} ⊆ Δ[1] itself. A covariant reading would need a map Δ[0] → ∅,
  which does not exist. Dually, the left fibration {1} ⊆ Δ[1] is classified by the map Δ[1] → S given by the
  edge ∅ → Δ[0].

*Needs:* §7.1.2 above (S, `Ŝ`, `Kan`); Tau Ceti `SSet.slice`, `SSet.coslice`, `SSet.slice.rightFibration_π`,
`SSet.coslice.opSliceIso`, `CategoryTheory.SimplicialNerve.quasicategory`, `SSet.RightFibration`,
`SSet.LeftFibration`, `SSet.IsWeakHomotopyEquivalence`; Mathlib `SSet.opFunctor` and pullbacks in `SSet`.

### 7.2 Functoriality of straightening and the Quillen adjunction

**7.2.1.** Prove the functoriality of straightening (HTT, Prop. 2.2.1.1, p. 92). For p : S′ → S and φ′ = φ ∘ C[p], there is a
natural isomorphism `St_φ ∘ p_! ≅ St_{φ′}`, where `p_!` is composition with p. For a simplicial functor π : C → C′,
there is a natural isomorphism `St_{πᵒᵖ ∘ φ} ≅ π_! ∘ St_φ`, where `π_!` is left adjoint to restriction along π. The
route: both sides preserve colimits and agree on simplices, by the pushout formula defining straightening.

*Needs:* §2.1.4 (HTT, Def. 1.1.5.5, functor part) and §7.1.4, §7.1.5 (HTT, §2.2.1, straightening and its colimit preservation);
ModelCategoryTheory, Part SimplicialCategories §6.1.1 (HTT, Prop. A.3.3.2, left Kan extension of enriched diagrams).

**7.2.2.** Prove that straightening and unstraightening form a Quillen adjunction between simplicial sets over S with the
contravariant model structure and simplicial functors C → SSet with the projective model structure (HTT,
Thm. 2.2.1.2, first assertion, p. 92). The route: `St_φ` preserves colimits, carries the boundary inclusions over S
to projective cofibrations (by the pushout formula), and carries contravariant equivalences, which are categorical
equivalences of right cones, to pointwise weak homotopy equivalences.

*Needs:* §7.1.4, §7.1.5 (HTT, §2.2.1, straightening and unstraightening); §6.4.1 contravariant model structure;
ModelCategoryTheory, Part ModelCategories (HTT, §A.2.5 Quillen adjunctions, Prop. A.2.8.2 projective model
structure); ModelCategoryTheory, Part SimplicialCategories §6.1.1 (HTT, Prop. A.3.3.2).

### 7.3 Straightening over a point: the twisted realization

**7.3.1.** Define the twisted realization (HTT, §2.2.2, p. 94). Let `Jⁿ = (Δ[n] ⋆ {y}) ⊔_{Δ[n]} {x}`, the join of Δ[n] with a
point y in which Δ[n] is collapsed to a point x, and let `Qⁿ` be the mapping simplicial set of `C[Jⁿ]` from x to y.
This is a cosimplicial simplicial set `Q•`. Its colimit-preserving extension along the Yoneda embedding is
`|−|_Q : SSet → SSet`, with right adjoint `Sing_Q`, where the n-simplices of `Sing_Q K` are the maps `Qⁿ → K`. The map
of posets from nonempty subsets of [n] to [n] taking the largest element gives `π : Q• → Δ•` and hence a natural map
`p_S : |S|_Q → S`.

- `Qⁿ` is a quotient of the nerve of the poset of nonempty subsets of [n]: for each i, the part of that nerve made
  of subsets containing i is collapsed onto its coordinates above i.
- `St_{Δ[0]}` is `|−|_Q`, and over any S the value `(St_S X)(s)` on a vertex is computed through `|−|_Q`.

**Checks.**

- `Q⁰` is Δ[0] (`J⁰` is Δ[1]) and `Q¹` is isomorphic to Δ[1] (`J¹` is Δ[2] with its first edge collapsed, and the two
  vertices of the mapping simplicial set from 0 to 2 in `C[Δ[2]]` remain distinct).
- `Q•` is not the standard cosimplicial simplex Δ•: the realizations of the `Qⁿ` are simplices, but the product of
  the degeneracies `Qⁿ → (Q¹)ⁿ` is not injective for n ≥ 2 (HTT, Remark 2.2.2.6, p. 94). So `|−|_Q` is not the
  identity functor, and `p_S` below is a weak homotopy equivalence, not an isomorphism.
- For S = Δ[0], `p_S` is the identity of Δ[0], and `|∅|_Q` is empty.

*Needs:* §1.2.2 (HTT, Notation 1.2.8.4) and §2.1.1, §2.1.5 (HTT, Def. 1.1.5.5, functor and horn parts); Tau Ceti `SSet.join`;
Mathlib `SSet.stdSimplex`.

**7.3.2.** Prove that the twisted realization is a homotopically trivial Quillen self-equivalence of the Kan–Quillen model
structure:

- for every simplicial set S, `p_S : |S|_Q → S` is a weak homotopy equivalence (HTT, Prop. 2.2.2.7, p. 94);
- `|−|_Q ⊣ Sing_Q` is a Quillen equivalence of the Kan–Quillen model structure with itself (HTT, Prop. 2.2.2.9,
  p. 95);
- for a Kan complex K the counit `|Sing_Q K|_Q → K` is a weak homotopy equivalence (HTT, Cor. 2.2.2.10, p. 95).

The route is Lurie's. Each `Qⁿ` is weakly contractible and `|Δ[0]|_Q` is Δ[0] (HTT, proof of Prop. 2.2.2.7, p. 95):
the nerve of the poset of nonempty subsets of [n] has a largest element, and each collapse in the description of `Qⁿ`
replaces a cube by a smaller cube, a pushout along a monomorphism of a weak homotopy equivalence. The class of S for
which `p_S` is a weak homotopy equivalence is closed under filtered colimits, so it suffices to treat S with finitely
many nondegenerate simplices, by induction on dimension and the number of top cells; attaching a simplex along its
boundary gives pushouts along monomorphisms on both sides, which are homotopy pushouts. Hence `|−|_Q` preserves
monomorphisms and weak homotopy equivalences, so the pair is a Quillen adjunction whose left derived functor is
isomorphic to the identity of H; every simplicial set is cofibrant and K is fibrant, so the counit at K computes the
derived counit.

*Needs:* §7.3.1 twisted realization; ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7, model structure, homotopy
pushouts along monomorphisms, filtered colimits of weak equivalences); ModelCategoryTheory, Part ModelCategories (HTT,
§A.2.4, §A.2.5 and Prop. A.2.5.1); Mathlib `SSet.KanComplex`.

**7.3.3.** Prove the two links between the twisted realization and unstraightening.

- **Fibers of unstraightening.** For a vertex s of S, a simplicial functor φ : C[S] → Cᵒᵖ with c = φ(s) and a
  simplicial functor F : C → SSet, there is a natural isomorphism `(Un_φ F) ×_S {s} ≅ Sing_Q F(c)`; through
  `π : Q• → Δ•` it gives a natural map `F(c) → (Un_φ F)_s`, which is a homotopy equivalence when F(c) is a Kan
  complex (HTT, Prop. 2.2.1.1 with Cor. 2.2.2.10, as recorded in Remark 2.2.2.11, p. 95). The route: the restriction
  of `Un_φ F` to the vertex s is `Un_s` of `F(c)`, and `St_s` is `|−|_Q`; the last claim is the counit statement
  of §7.3.2 with Whitehead's theorem.
- **Right mapping spaces of coherent nerves.** For a simplicial category C and objects X, Y, there is a natural
  isomorphism `Hom^R_{N(C)}(X, Y) ≅ Sing_Q Map_C(X, Y)` (HTT, Prop. 2.2.2.13, p. 96). The route: an n-simplex on
  either side is a simplicial functor `C[Jⁿ] → C` sending x to X and y to Y, by the adjunction between
  rigidification and the coherent nerve.

*Needs* (fibers of unstraightening): §7.2 functoriality; §7.3 (construction and the Quillen self-equivalence); §7.1 (HTT, §2.2.1, unstraightening); ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7, Whitehead's
theorem).

*Needs* (right mapping spaces of coherent nerves): §7.3 construction; §5.2 mapping spaces; Mathlib
`CategoryTheory.SimplicialNerve`; §2.1 (HTT, Def. 1.1.5.5, adjunction part).

### 7.4 Pointwise equivalences of right fibrations

**7.4.1.** Pointwise equivalences of right fibrations are those of §7.1: a map f : X → Y between right
fibrations over S is one when for every vertex s of S the induced map of fibers `X_s → Y_s` is a weak homotopy
equivalence. Prove that f is a pointwise equivalence exactly when every `X_s → Y_s` is a homotopy equivalence of Kan
complexes, the form of HTT, Def. 2.2.3.2, p. 98. The route: the fibers are Kan complexes by §5.1 (condition (3)), and
between Kan complexes weak homotopy equivalences are homotopy equivalences (Whitehead's theorem, ModelCategoryTheory,
Part KanQuillen §1.3).

- Pointwise equivalences contain the isomorphisms over S, satisfy two-out-of-three, and are stable under base change
  along any S′ → S.
- The left-fibration version is the same definition over `Sᵒᵖ`.

**Checks.**

- Over S = Δ[0] a pointwise equivalence is a homotopy equivalence of Kan complexes; over S empty every map is one.
- Over S = Δ[1], the inclusion of the right fibration `{0} → Δ[1]` into the identity of Δ[1] is a weak homotopy
  equivalence of total spaces but not a pointwise equivalence (its fiber over 1 is empty). A definition through the
  total spaces would accept it.
- The fold map from two copies of the identity of Δ[1] to one copy is not a pointwise equivalence (two points over
  each vertex against one), although it is surjective on every fiber.

*Needs:* §7.1.7 (pointwise equivalences); Tau Ceti `SSet.RightFibration`, `SSet.fiber`,
`SSet.IsWeakHomotopyEquivalence`; Mathlib `SSet.KanComplex`; §5.1.1; ModelCategoryTheory, Part KanQuillen §1.3.3
(Whitehead's theorem, homotopy equivalences of Kan complexes).

**7.4.2.** Define `RFib(S)` to be the full simplicial subcategory of simplicial sets over S spanned by the right fibrations
X → S, with mapping simplicial sets the simplicial sets of maps over S (HTT, Notation 2.2.3.8, p. 101). By §6.4 the
contravariantly fibrant objects lie in it.

- `RFib(S)` is locally Kan, and restriction along S′ ⊆ S is a Kan fibration
  `Map_S(X, Y) → Map_{S′}(X ×_S S′, Y ×_S S′)` for any X → S and right fibration Y → S (HTT, Lemma 2.2.3.4, p. 98).
  The route: it is a right fibration, since for right anodyne A ⊆ B the pushout-product `(B × X′) ∪ (A × X) ⊆ B × X`
  is right anodyne (Tau Ceti `SSet.rightAnodyneExtensions_pushoutObjObjι'`); taking S′ empty shows that its source
  `Map_S(X, Y)` is a Kan complex (§5.1), and its target is one by the same argument over S′, and §5.3, dualized, makes a right fibration over a Kan complex a Kan fibration.

**Checks.**

- `RFib(Δ[0])` is the simplicial category of Kan complexes (§5.1, condition (3)); a definition by all simplicial sets
  over S would include `Δ[1]` over a point.
- Over S = Δ[1], the vertex 0 is an object of `RFib(S)` and the vertex 1 is not (it has no lift of the edge from 0 to
  1 ending at it).
- `RFib(∅)` has one object, the empty simplicial set; the identity of S is always an object.

*Needs:* Tau Ceti `SSet.RightFibration`, `SSet.ihomOver`, `SSet.rightAnodyneExtensions_pushoutObjObjι'`; §5.1.1; §5.3.1
Kan-fibration lemma (dual form); §6.4.1; Mathlib `SSet.modelCategoryQuillen.J`; Mathlib
`HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1).

**7.4.3.** Prove the characterization of pointwise equivalences (HTT, Lemma 2.2.3.6, p. 100). For right fibrations X, Y over S
and f : X → Y over S, the following are equivalent: (a) f is a pointwise equivalence; (b) f is an equivalence of the
simplicial category of simplicial sets over S, that is, it has a homotopy inverse; (c) for every A → S, composition
with f is a homotopy equivalence of Kan complexes `Map_S(A, X) → Map_S(A, Y)`. The route: (b) ⇒ (a) restricts a
homotopy inverse to fibers; (c) ⇒ (b) is §2.7 for the locally Kan simplicial category `RFib(S)`. For (a) ⇒ (c), use
the induction principle for simplicial sets (HTT, Lemma 2.2.3.5, p. 99): a class of simplicial sets closed under
isomorphism and disjoint unions, containing every Δ[n], containing the pushout of a monomorphism whenever it contains
the other three corners, and containing the colimit of every sequence of monomorphisms between its members, contains
every simplicial set (by skeleta, Mathlib `SSet.relativeCellComplexOfMono`). The class of A for which (c) holds over
every A → S satisfies it, by the restriction lemma for pushouts and sequential colimits, and for A = Δ[n] restriction
along the right anodyne inclusion of the last vertex reduces to a fiber.

*Needs:* §7.4.1, §7.4.2 (pointwise equivalences, `RFib(S)` and its restriction lemma); §2.7.1 equivalences in a locally Kan
simplicial category; §3.3.1 (pullback-hom along a left anodyne map, in its dual form for right anodyne maps and
right fibrations); Tau Ceti `SSet.rightFibration_pullbackObjObjπ`; Mathlib `SSet.KanComplex`, `SSet.stdSimplex`,
`SSet.boundary`, `SSet.relativeCellComplexOfMono`.

### 7.5 The straightening theorem

**7.5.1.** Prove that for every simplicial set S, unstraightening induces an equivalence of simplicial categories from the
fibrant-cofibrant objects of the projective model structure on simplicial presheaves on `C[S]` to `RFib(S)` (HTT,
Prop. 2.2.3.11, p. 101). The route is Lurie's: induction on S by the principle of §7.4, after a reduction to
localizations, with the simplex case as the main input.

- **The localized comparison** (HTT, proof of Prop. 2.2.3.11, p. 102). Compare both sides with their Dwyer–Kan
  localizations, at the weak equivalences between projectively fibrant presheaves and at the pointwise equivalences
  of `RFib(S)`; both comparison maps are equivalences (HTT, Lemma A.3.6.17; §7.4 with HTT, Remark A.3.2.14). This
  gives a functor `φ_S` between the localizations, natural in S, and it remains to show that `φ_S` is an
  equivalence. The class of S for which it is is closed under isomorphism and disjoint unions.
- **The simplex case** (HTT, proof of Prop. 2.2.3.11, p. 102). Let φ : C[Δ[n]] → [n] be the canonical functor to
  the poset [n], regarded as Cᵒᵖ for C = [n]ᵒᵖ, identified with [n] by j ↦ n − j. Four steps.
  - Straightening over Δ[n] along φ is a Quillen equivalence between the contravariant structure over Δ[n] and the
    projective structure on functors [n] → SSet (HTT, Lemma 2.2.3.1, p. 97). The left derived functor of `St_φ` is
    conservative, so it suffices that the derived counit is an isomorphism at a projectively fibrant F. There are
    isomorphisms `(St_φ X)(i) ≅ |X ×_{Δ[n]} Δ{n−i,…,n}|_Q`, so by §7.3 it suffices that the inclusion of the fiber
    over n − i into `X ×_{Δ[n]} Δ{n−i,…,n}` is a weak homotopy equivalence; it is a deformation retract because
    X → Δ[n] is a right fibration, by lifting a contraction of `Δ{n−i,…,n}` onto its first vertex along a right
    anodyne pushout-product.
  - For a right fibration X → Δ[n], a projectively fibrant F and a weak equivalence `St_φ X → F`, the adjoint map
    `X → Un_φ F` is a pointwise equivalence (HTT, Lemma 2.2.3.7, p. 101): the same deformation retraction and the
    Quillen self-equivalence of §7.3 make `X_{n−i} → Sing_Q F(i) ≅ (Un_φ F)_{n−i}` a weak homotopy equivalence of
    Kan complexes.
  - The inclusion of the contravariantly fibrant objects over Δ[n] into `RFib(Δ[n])` is an equivalence of simplicial
    categories (HTT, Lemma 2.2.3.9, p. 101): it is fully faithful, and a right fibration X is pointwise equivalent,
    hence homotopy equivalent (§7.4), to the fibrant `Un_φ F` for a fibrant replacement F of `St_φ X`.
  - `Un_{Δ[n]}` from the fibrant-cofibrant projective simplicial presheaves on `C[Δ[n]]` to `RFib(Δ[n])` is an
    equivalence of simplicial categories (HTT, Lemma 2.2.3.10, p. 101): `(St_{Δ[n]}, Un_{Δ[n]})` is a Quillen
    equivalence by transport of the first step along the Dwyer–Kan equivalence `C[Δ[n]] → [n]` (§2.5) and §7.2, and
    Lurie's criterion comparing fibrant-cofibrant objects along a simplicial Quillen equivalence applies with the
    previous step. Hence `φ_{Δ[n]}` is an equivalence.
- **Pushouts and sequential colimits** (HTT, proof of Prop. 2.2.3.11, pp. 102–103). If S is a pushout along a
  monomorphism whose other three corners satisfy the claim, so does S, and likewise for colimits of sequences of
  monomorphisms. On the presheaf side a homotopy pushout of simplicial sets gives a homotopy pullback of localized
  diagram categories (HTT, Cor. A.3.6.18), reduced to mapping spaces by HTT, Cor. A.3.2.28; on the fibration side
  the square of mapping spaces is a pullback along the Kan fibration of the restriction lemma (§7.4), and the
  compatibility of unstraightening with restriction comes from §7.2. Towers are treated the same way.

*Needs:* §7.4.1, §7.4.2, §7.4.3 (pointwise equivalences, `RFib(S)`, restriction lemma, characterization, induction principle); §7.3.2, §7.3.3
(`p_S`, the Quillen self-equivalence, fibers of unstraightening); §7.2.1, §7.2.2 (functoriality, Quillen adjunction); §6.4.1
(contravariant structure, fibrant objects, simplicial enrichment); §2.5.1; §2.4.1, §2.4.2; Tau Ceti
`SSet.rightAnodyneExtensions_pushoutObjObjι'`; §2.1.8 (HTT, Def. 1.2.10.1) and §7.1.5 (HTT, §2.2.1, unstraightening);
ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1) and §7.2.1 (HTT, Prop. A.2.8.2); ModelCategoryTheory, Part
SimplicialCategories (HTT, Remark A.3.1.9, Prop. A.3.1.10, Remark A.3.2.14, Prop. A.3.3.2, Prop. A.3.3.8, §A.2.8);
ModelCategoryTheory, Part EnrichedLocalization §2.3.1 (HTT, Cor. A.3.2.28), §2.1.1 (HTT, Notation A.3.5.1) and §4.4.1 (HTT,
Lemma A.3.6.17), §4.4.3 (HTT, Cor. A.3.6.18); ModelCategoryTheory, Part KanQuillen
(HTT, §A.2.7).

**7.5.2.** Prove the **straightening theorem** (HTT, Thm. 2.2.1.2, p. 92): for every simplicial set S, simplicial category C and
simplicial functor φ : C[S] → Cᵒᵖ, straightening and unstraightening form a Quillen adjunction for the contravariant
and projective model structures (§7.2), and a Quillen equivalence when φ is an equivalence of simplicial categories
(HTT, Thm. 2.2.1.2, second assertion, p. 92, proof on p. 103). The route: by HTT, Prop. A.3.3.8 one reduces to φ the
identity of `C[S]ᵒᵖ`; then §7.5.1 and Lurie's criterion (HTT, Prop. A.3.1.10), applied in the
simplicial model categories of §6.4 and of projective diagrams, give the equivalence.

*Needs:* §7.2.2 Quillen adjunction; §7.5.1 unstraightening onto right fibrations; §6.4.1 simplicial enrichment; §1.1.1 (HTT, Def. 1.1.4.4); ModelCategoryTheory, Part ModelCategories (HTT, §A.2.5, Prop. A.2.5.1,
Prop. A.2.8.2); ModelCategoryTheory, Part SimplicialCategories §5.9.1 (HTT, Prop. A.3.1.10) and §6.3.1 (HTT,
Prop. A.3.3.8).

### 7.6 Right fibrations are the contravariantly fibrant objects

**7.6.1.** Prove that the contravariant model structure over S is described on right fibrations as follows.

- **Fibrant objects.** A map p : X → S is a right fibration exactly when X is fibrant in the contravariant model
  structure over S; dually, the covariantly fibrant objects are the left fibrations (HTT, Cor. 2.2.3.12, p. 103;
  `Suggested.lean` declarations `rightFibration_iff_contravariantFibrations` and `leftFibration_iff_covariantFibrations`).
  The route: fibrant objects are right fibrations by §6.4. Conversely, §7.5 makes the inclusion of contravariantly
  fibrant objects into `RFib(S)` essentially surjective, so a right fibration X is homotopy equivalent over S to a
  fibrant Y; a lifting problem for X against a trivial cofibration is solved in Y and transported back along the
  homotopy, by lifting against the right anodyne inclusion `(A × Δ[1]) ∪ (B × {1}) ⊆ B × Δ[1]` for the trivial
  cofibration A ⊆ B (§3.2, dual form).
- **Weak equivalences.** A map f between right fibrations over S is a contravariant equivalence exactly when it is a
  pointwise equivalence (HTT, Cor. 2.2.3.13, p. 104; `Suggested.lean` declaration
  `isContravariantEquivalence_iff_isPointwiseEquivalence`; this is the equivalence of (a) and (b) in Remark 2.2.3.3,
  p. 98). The route: both are fibrant-cofibrant in the simplicial model category of §6.4, so f is a weak equivalence
  exactly when it is a homotopy equivalence (HTT, Remark A.3.1.8), and §7.4 identifies homotopy equivalences with
  pointwise equivalences.
- **Fibers.** For a right fibration f : X → S and a vertex s, the canonical map `|X_s|_Q ≅ (St_s X_s)(s) → (St_S X)(s)`
  given by §7.2 is a weak homotopy equivalence: straightening computes fibers (HTT, Prop. 2.2.3.15, p. 105). The
  route: replace `St_S X` by a projectively fibrant F; by the straightening theorem `X → Un_S F` is a contravariant
  equivalence, hence a pointwise equivalence, so `X_s → (Un_S F)_s ≅ Sing_Q F(s)` is a homotopy equivalence (§7.3);
  the Quillen self-equivalence of §7.3 and two-out-of-three conclude.

*Needs* (fibrant objects): §7.5 unstraightening onto right fibrations; §7.4 characterization; §6.4 (fibrant objects
are right fibrations, simplicial enrichment); §3.2 generators (dual form); Mathlib `HomotopicalAlgebra.ModelCategory`
(HTT, Def. A.2.1.1).

*Needs* (weak equivalences): the fibrant-object statement; §7.4 characterization; §6.4 simplicial enrichment;
ModelCategoryTheory, Part SimplicialCategories §1.3 (HTT, Def. A.3.1.5 and Remark A.3.1.8).

*Needs* (fibers): §7.5 straightening theorem; the weak-equivalence statement; §7.3 (fibers of unstraightening,
Quillen self-equivalence); §7.2 functoriality; §7.1 (HTT, §2.2.1, unstraightening);
ModelCategoryTheory, Part ModelCategories §7.2 (HTT, Prop. A.2.8.2); ModelCategoryTheory, Part KanQuillen (HTT,
§A.2.7).

### 7.7 Classifying maps of right fibrations

**7.7.1.** Let `ε : C[Sᵒᵖ] → Kanᵒᵖ` be the counit of rigidification and the coherent nerve (§2.1), ι the inclusion
of `Kan` into simplicial sets, regarded as a simplicial functor on `(Kanᵒᵖ)ᵒᵖ = Kan`, and `Z₀ = Un_ε(ι) → Sᵒᵖ` its
unstraightening. The universal right fibration is the slice projection `(Sᵒᵖ)_{/∗} → Sᵒᵖ`, a right fibration (Tau Ceti
`SSet.slice.rightFibration_π`) whose fiber over a Kan complex K is `Hom^R_{Sᵒᵖ}(K, ∗) ≅ Sing_Q K`, homotopy equivalent
to K (§7.3). Prove the existence of classifying maps for small right fibrations (the unmarked form of HTT,
Props. 3.3.2.5 and 3.3.2.6, p. 230):

1. `Z₀ → Sᵒᵖ` is a right fibration, and the unique vertex `∗_Z` of its fiber over ∗ is a final object of Z₀;
2. there is a pointwise equivalence of right fibrations `e : (Sᵒᵖ)_{/∗} → Z₀` over `Sᵒᵖ`;
3. for every small simplicial set K and every right fibration X → K with X small, there are a map `p : K → Sᵒᵖ` and
   pointwise equivalences of right fibrations over K, `X → K ×_{Sᵒᵖ} Z₀ ← K ×_{Sᵒᵖ} (Sᵒᵖ)_{/∗}`; so p classifies X in
   the sense of §7.1;
4. dually, every small left fibration X → K is joined by pointwise equivalences to `K ×_S S_{∗/}` for some K → S,
   so it is classified by a map to S in the sense of §7.1 (the unmarked form of HTT, Cor. 3.3.2.8,
   p. 231).

Statements (1)–(4) claim the existence of p. Statement (5) (§7.7.2) gives the half of its uniqueness that says
equivalent maps classify the same right fibrations; the converse half is not claimed. Statements (1) and (2) are taken
one universe up, where `Kan` is small, and with them the projective structure on simplicial functors to simplicial sets,
`Un_ε`, the contravariant structure over `Sᵒᵖ`, the comparison of contravariant and pointwise equivalences over
`Sᵒᵖ`, and §5.6 for the large Z₀ and `(Sᵒᵖ)_{/∗}`; in (3) K and X are small, so `St_K X` and its replacement are small
and take values in Kan complexes of the first universe. `Suggested.lean` declarations `exists_classifies` for (3) and
`exists_classifiesLeft` for (4), with K and X in `SSet.{u+1}` and u-small in every degree; (1) and (2) are not
stated there, since the pins have no rigidification and hence no `Un_ε`.

- **(1).** `Un_ε` carries projectively fibrant functors to contravariantly fibrant objects (§7.2, the Quillen
  adjunction), and these are right fibrations (§6.4). For every A → `Sᵒᵖ`, maps A → Z₀ over `Sᵒᵖ` are, by the
  adjunction `St_ε ⊣ Un_ε` and the definition of straightening through `C[A▷]` (§7.1), the simplicial functors `C[A ⋆
  Δ[0]] → 𝒟` extending ε ∘ `C[A → Sᵒᵖ]` with the cone point sent to X, where 𝒟 is `Kanᵒᵖ` with one object X adjoined,
  `Map(K, X) = K`, `Map(X, X) = ∗` and `Map(X, K) = ∅`. Take A = `∂Δ[n]` (n ≥ 1) with last vertex at `∗_Z`: then
  `∂Δ[n] ⋆ Δ[0] = Λ[n + 1, n + 1]`, whose rigidification differs from `C[Δ[n + 1]]` only in the mapping simplicial
  sets from 0 to n and from 0 to n + 1 (§2.5.3). The target `Map_𝒟(K₀, ∗) = K₀`, and composition with `Map_𝒟(∗, X) =
  ∗` is an isomorphism onto `Map_𝒟(K₀, X) = K₀`; so it suffices to extend the map from 0 to n + 1 along an open-box
  inclusion of the cube, which is anodyne, into the Kan complex K₀, and the face of the cube through the vertex n then
  defines the map from 0 to n. For n = 1 the inclusion is a point into Δ[1]. So `∗_Z` is final. Z₀ is an ∞-category,
  as §5.6 requires in (2), being a right fibration over the ∞-category `Sᵒᵖ` (Tau Ceti
  `CategoryTheory.SimplicialNerve.quasicategory`).
- **(2).** `id_∗` is final in `(Sᵒᵖ)_{/∗}`: a map `∂Δ[n] → (Sᵒᵖ)_{/∗}` with last vertex `id_∗` is a horn
  `Λ[n + 1, n + 1] → Sᵒᵖ` whose last edge is degenerate, which extends by the dual of the outer-horn theorem (§5.1).
  So `{id_∗} ⊆ (Sᵒᵖ)_{/∗}` and `{∗_Z} ⊆ Z₀` are right anodyne (§5.6). Since `Z₀ → Sᵒᵖ` is a right fibration, lifting
  against the first inclusion gives e with `e(id_∗) = ∗_Z`; right anodyne maps are contravariant equivalences (§6.4),
  so e is one by two-out-of-three, and a contravariant equivalence between right fibrations is pointwise (§7.6).
- **(3).** Choose a projectively fibrant replacement `St_K X → F`. Since `(St_K, Un_K)` is a Quillen equivalence (§7.5)
  and every object over K is cofibrant, the adjoint `X → Un_K(F)` is a contravariant equivalence between right
  fibrations, hence pointwise (§7.6). The functor `F : C[K]ᵒᵖ → Kan` is the same as `Fᵒᵖ : C[K] → Kanᵒᵖ`, adjoint to
  p : K → `Sᵒᵖ` with `Fᵒᵖ = ε ∘ C[p]`. Base change in the target and then in the base (§7.2, HTT, Prop. 2.2.1.1) gives
  isomorphisms `Un_K(F) ≅ Un_{Fᵒᵖ}(ι) = Un_{ε ∘ C[p]}(ι) ≅ p^* Un_ε(ι) = K ×_{Sᵒᵖ} Z₀`; pull e back along p.
- **(4).** Apply (3) to the small right fibration `Xᵒᵖ → Kᵒᵖ`, which gives `q : Kᵒᵖ → Sᵒᵖ` and a zigzag of pointwise
  equivalences, and take opposites. The isomorphism `N(Kanᵒᵖ)ᵒᵖ ≅ N(Kan)`, adjoint to the
  opposite comparison of §2.1, reads `qᵒᵖ` as a map K → S and identifies `((Sᵒᵖ)_{/∗})ᵒᵖ` with `S_{∗/}` (Tau Ceti
  `SSet.coslice.opSliceIso`); fibers of opposites are opposites of fibers, and the opposite of a weak homotopy
  equivalence of Kan complexes is one.

Instances:

- for K = Δ[0], X is a Kan complex, p picks a Kan replacement F of X, and the fiber of `(Sᵒᵖ)_{/∗}` over F is
  homotopy equivalent to F, hence to X;
- for K = Δ[1], F is a map from the fiber over 1 to the fiber over 0, and p is the edge of `Sᵒᵖ` from F(0) to F(1)
  given by that map, read backwards: transport in a right fibration goes against the edges of the base;
- for K = `∂Δ[2]`, which is not an ∞-category, p is three edges with no 2-simplex between them, and F is a triangle of
  maps that need not commute, as the construction requires nothing more;
- for K the circle `Δ[1]/∂Δ[1]` and X the right fibration with fiber ℤ and monodromy the shift, p is the loop of
  `Sᵒᵖ` at ℤ given by the shift; a classifier through the identity of ℤ would describe the trivial covering instead.

*Needs:* §5.1 (the outer-horn theorem, dual form); §5.6.1; §6.4.1 (contravariant structure: fibrant objects are right
fibrations, right anodyne maps are trivial cofibrations); §7.2.1, §7.2.2 (functoriality, Quillen adjunction); §7.3.3 (right
mapping spaces of coherent nerves); §7.4.1 (pointwise equivalences); §7.5.2 (the straightening theorem); §7.6.1 (weak
equivalences between right fibrations); §2.5.1 (the cubes of `C[Δ[n]]`); §2.1.4 (the counit), §2.1.2 (the opposite comparison,
for (4)); §7.1.2 (`Kan`, S and the universes), §7.1.4, §7.1.5 (straightening and unstraightening), §7.1.8 (classifying maps); Tau Ceti `SSet.slice.rightFibration_π`,
`SSet.slice.homEquiv`, `SSet.coslice.opSliceIso`, `CategoryTheory.SimplicialNerve.quasicategory`; Mathlib
`SSet.opFunctor`;
ModelCategoryTheory, Part SimplicialCategories §6.1.1 (HTT, Prop. A.3.3.2, the projective structure on enriched
diagrams) and Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1, Quillen equivalences).

**7.7.2.** (5) Prove that equivalent maps to `Sᵒᵖ` classify pointwise equivalent right fibrations: this is the half of the
uniqueness of classifying maps used in the proof of HTT, Prop. 3.3.4.5, p. 237. `Suggested.lean` declaration
`exists_isPointwiseEquivalence_of_isEquivalence`, with the equivalence given as a map `K × Δ[1] → Sᵒᵖ` whose edge of
`Fun(K, Sᵒᵖ)` is an equivalence. Write U for `(Sᵒᵖ)_{/∗}`. Let K be a
simplicial set and p, p′ : K → `Sᵒᵖ` equivalent objects of the ∞-category `Fun(K, Sᵒᵖ)` (§2.3), joined by an
equivalence from p to p′, and write `p^* U = K ×_{Sᵒᵖ} U` for the pullback along p. Then there is a pointwise
equivalence `p′^* U → p^* U` of right fibrations over K. Consequently a right fibration X → K is classified by p in
the sense of §7.1 exactly when it is classified by p′. The statement is taken in `SSet.{u+1}`, like
(1) and (2), and K need not be small. The route uses neither straightening nor the pointwise criterion for natural
equivalences.

- **The homotopy.** The equivalence is an edge of `Fun(K, Sᵒᵖ)`, that is a map `h : K × Δ[1] → Sᵒᵖ` with
  `h|K × {0} = p` and `h|K × {1} = p′`. For a vertex k of K, evaluation at k is a map `Fun(K, Sᵒᵖ) → Sᵒᵖ`, so the
  edge `e_k = h|{k} × Δ[1]` from p(k) to p′(k) is an equivalence of `Sᵒᵖ` (§2.3, maps preserve equivalences).
- **The total family.** Let `Y = (K × Δ[1]) ×_{Sᵒᵖ} U` be the pullback along h. It is a right fibration over
  `K × Δ[1]`, a base change of `U → Sᵒᵖ` (Tau Ceti `SSet.slice.rightFibration_π`). Its restrictions Y₀ and Y₁ to
  `K × {0}` and `K × {1}` are the pullbacks of U along p and along p′, and its fiber over (k, i) is the fiber of U
  over h(k, i).
- **The comparison map.** The inclusion `Y₁ × {1} ⊆ Y₁ × Δ[1]` is the pushout-product of `∅ ⊆ Y₁` with the right
  anodyne `{1} ⊆ Δ[1]`, hence right anodyne (Tau Ceti `SSet.rightAnodyneExtensions_pushoutObjObjι'`). Lift it
  against the right fibration `Y → K × Δ[1]`, with the inclusion of Y₁ on top and `π₁ × id` at the bottom, π₁ the
  projection of Y₁ to K. The lift `H : Y₁ × Δ[1] → Y` restricts on `Y₁ × {0}` to a map `f : Y₁ → Y₀` over K. The
  direction matters: `Y₀ × {0} ⊆ Y₀ × Δ[1]` is left anodyne, and right fibrations need not lift against it.
- **Fibers.** Over a vertex k, H restricts to a map `U_{p′(k)} × Δ[1] → Y` over `{k} × Δ[1]`, which composed with
  `Y → U` lies over `e_k` and restricts to the identity at 1 and to the fiber map `f_k` at 0. By the characterization
  of transport in §5.4, in its form for right fibrations (by passing to opposites), the class of `f_k` in H is the
  transport `e_k^* : U_{p′(k)} → U_{p(k)}`. Transport along U is a functor from the opposite of the homotopy category of
  `Sᵒᵖ` to H: §5.4 for the left fibration `Uᵒᵖ → (Sᵒᵖ)ᵒᵖ` gives a functor on `h((Sᵒᵖ)ᵒᵖ)`, which is
  `(h Sᵒᵖ)ᵒᵖ` (§2.1, the homotopy category of the opposite). That functor takes values in the classes of the
  opposite fiber maps `(f_k)ᵒᵖ`; since `(−)ᵒᵖ` preserves weak homotopy equivalences (`|Kᵒᵖ| ≅ |K|`), it induces an
  automorphism of H, which carries isomorphisms to isomorphisms and lets one read the statement for `f_k` itself. The edge `e_k` is an isomorphism of `h Sᵒᵖ` (Tau Ceti `SSet.Edge.isEquivalence_iff_isIso`), so `f_k` is an isomorphism of H. The fibers
  of the right fibration U are Kan complexes (§5.1), so `f_k` is a weak homotopy equivalence. So f is a pointwise equivalence
  (§7.1; equivalently in the homotopy-equivalence form of §7.4).
- **Classification.** A zigzag may be extended by f in either direction. A zigzag of pointwise equivalences from
  X to `p^* U`, followed by f read backwards, is one from X to `p′^* U`; a zigzag from X to `p′^* U`, followed by f,
  is one from X to `p^* U`. So the single equivalence from p to p′ gives both directions of "exactly when".

Instances:

- for K = Δ[0], p and p′ are Kan complexes L and L′ joined by an equivalence of `Sᵒᵖ`, for instance the edge given
  by a homotopy equivalence g : L′ → L; the fibers of U over L and L′ are homotopy equivalent to L and L′ (§7.3), and
  f goes from the second to the first, in the direction of g, against the edge of `Sᵒᵖ`;
- the equivalence hypothesis cannot be dropped: for K = Δ[0], the edge of `Sᵒᵖ` from Δ[0] to ∅ given by the map
  ∅ → Δ[0] is not an equivalence; the lift still exists and gives f from the empty fiber over ∅ to the fiber over
  Δ[0], a point up to homotopy, and f is not a weak homotopy equivalence;
- for the degenerate edge at p, that is h = p ∘ pr, the lift is not unique, but the constant lift is a valid
  choice, and it gives f the identity of the pullback along p.

*Needs:* §2.3.1 (equivalent objects; maps preserve equivalences); §2.1.3 (the homotopy
category of the opposite); §5.1.1 (fibers of right fibrations are Kan complexes); §5.4.1 (transport along left
fibrations and its characterization, dual form); §7.3.2, §7.3.3 (fibers of U); §7.4.1 (pointwise equivalences); §1.2 (functor ∞-categories) and §7.1.6, §7.1.7, §7.1.8 (pointwise
equivalences, the universal right fibration and classifying maps); Tau Ceti
`SSet.slice.rightFibration_π`, `SSet.rightAnodyneExtensions_pushoutObjObjι'`, `SSet.Edge.isEquivalence_iff_isIso`,
`SSet.RightFibration`, `SSet.fiber`, `CategoryTheory.SimplicialNerve.quasicategory`; Mathlib `SSet.opFunctor` and
the quasicategory instance on `(ihom K).obj X`; ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7: an isomorphism
of H between Kan complexes is a weak homotopy equivalence).

### Examples

- Over S = Δ[0], straightening is the twisted realization and the straightening theorem says that `|−|_Q ⊣ Sing_Q`
  is a Quillen self-equivalence of the Kan–Quillen structure (§7.3).
- For an ∞-category S and an object y, the right fibration `S_{/y} → S` straightens to a presheaf on `C[S]` whose value
  at x is weakly equivalent to `Hom^R_S(x, y)` (§7.6).
- For S = Δ[1], a right fibration X → Δ[1] straightens to a map of Kan complexes from the fiber over 1 to the fiber
  over 0, up to weak equivalence.
- The ∞-category of spaces S of §7.1 is the basic large ∞-category; `Cat∞` contains it through the inclusion
  `S → Cat∞` of §7.1, and its coslice projection `S_{∗/} → S` is the universal left fibration.

### Dependencies

Layer 6 for the contravariant model structure and its simplicial enrichment; Layers 2, 3 and 5 for equivalences,
anodyne maps and Kan complexes, §5.6 for the classifying maps of §7.7 and §5.4 for their invariance under
equivalence; §1.1 for sizes and equivalences of simplicial categories; §7.1 for straightening and unstraightening,
the ∞-category of spaces and classifying maps, and §2.1 for the counit;
ModelCategoryTheory, Part
ModelCategories for projective structures and Quillen equivalences; ModelCategoryTheory, Part SimplicialCategories for
simplicial model categories, enriched diagrams and Dwyer–Kan localizations; ModelCategoryTheory, Part KanQuillen.

## Layer 8: Mapping spaces of rigidifications and the comparison theorem

### 8.1 The mapping-space comparison and the comparison theorem

**8.1.1.** Prove that the right mapping space of an ∞-category models the mapping space of its rigidification (HTT,
Prop. 2.2.4.1, p. 106): for an ∞-category S and objects x, y, the natural map `|Hom^R_S(x, y)|_Q → Map_{C[S]}(x, y)` is a
weak homotopy equivalence. The route is Lurie's: let M be the right cone of `S_{/y} → S`; the map factors through
`(St_S S_{/y})(x)`. The first factor is a weak homotopy equivalence by §7.6, since `S_{/y} → S` is a right fibration
(HTT, Prop. 1.2.9.3, first assertion, p. 61) whose fiber over x is `Hom^R_S(x, y)`. For the second, the inclusion of
the vertex `id_y` into `S_{/y}` is a retract of a right anodyne map (the dual of HTT, Cor. 2.1.2.7), hence a
contravariant equivalence (§6.4), so straightening it gives a weak equivalence from `(St_S {y})(x) ≅ Map_{C[S]}(x, y)`.

*Needs:* §7.6.1 straightening computes fibers; §7.2.1 straightening and its functoriality; §6.4.1 (right anodyne maps are
contravariant trivial cofibrations); §5.2.1 mapping spaces; §7.3.1 twisted realization; Tau Ceti
`SSet.slice.rightFibration_π`, `SSet.rightAnodyneExtensions_pushoutObjObjι'`; §7.1.4 (HTT, §2.2.1);
ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7).

**8.1.2.** Prove the **comparison theorem** (HTT, Thm. 2.2.0.1, p. 90): for a locally Kan simplicial category C and objects x, y,
the counit `Map_{C[N(C)]}(x, y) → Map_C(x, y)` is a weak homotopy equivalence. The route: N(C) is an ∞-category
(HTT, Prop. 1.1.5.10, p. 41), its right mapping spaces are `Sing_Q Map_C(x, y)` (§7.3), and composing the
mapping-space comparison with the counit gives the counit `|Sing_Q Map_C(x, y)|_Q → Map_C(x, y)` of the twisted
realization, a weak homotopy equivalence for the Kan complex `Map_C(x, y)` (§7.3); two-out-of-three concludes.

*Needs:* §8.1.1 mapping-space comparison; §7.3.2, §7.3.3 (right mapping spaces of coherent nerves, counit corollary); Tau Ceti
`CategoryTheory.SimplicialNerve.quasicategory`; §2.1.1, §2.1.4 (HTT, Def. 1.1.5.5, functor, counit and
nerve-map parts); Mathlib `CategoryTheory.SimplicialCategory`; ModelCategoryTheory, Part KanQuillen (HTT, §A.2.7).

**8.1.3.** Prove that for an ∞-category S and objects x, y, the mapping object `Map_S(x, y)` of §2.1 (HTT,
Def. 1.2.2.1) is the class of `Hom^R_S(x, y)` in H, naturally in maps of ∞-categories (HTT, §1.2.2, p. 46, where
this is announced, proved by Prop. 2.2.4.1). Consequently a map f : C → D of ∞-categories is fully faithful in
the sense of §2.1 (HTT, Def. 1.2.10.1, p. 61) exactly when it is Tau Ceti's `SSet.IsFullyFaithful`,
a weak homotopy equivalence on every right mapping space. The route: the weak homotopy equivalences
`Hom^R_S(x, y) ← |Hom^R_S(x, y)|_Q → Map_{C[S]}(x, y)` of §7.3 (`p_S`) and of the mapping-space comparison are
natural in S, and a map of simplicial sets is an isomorphism in H exactly when it is a weak homotopy equivalence.
For the inclusion `∂Δ[1] ⊆ Δ[1]` of ∞-categories both conditions fail at (0, 1), where `Hom^R` goes from ∅ to a
point; off ∞-categories the two notions differ, since `Hom^R_{Λ[2, 1]}(0, 2)` is empty while `Map(0, 2)` is a point.

*Needs:* §8.1.1 mapping-space comparison; §7.3.2 (`p_S`); §2.1.7 (HTT, Def. 1.2.2.1) and
§2.1.8 (HTT, Def. 1.2.10.1); Tau Ceti `SSet.IsFullyFaithful`, `SSet.rightMappingSpace`; ModelCategoryTheory, Part KanQuillen (HTT,
§A.2.7, weak homotopy equivalences and H).

### 8.2 Final objects through the homotopy category

Final objects of an ∞-category are those of §1.2 (HTT, §1.2.12): strongly final vertices, Tau Ceti's
`SSet.IsTerminalVertex`. HTT's own definition asks instead, for a vertex X of any simplicial set C, that X be final
in the H-enriched homotopy category hC: every mapping object `Map_C(Y, X)` of §2.1 (HTT, Def. 1.2.2.1)
is weakly contractible (HTT, Def. 1.2.12.1, p. 62). This roadmap does not name that condition; it compares it with
the strong one.

**8.2.1.** Prove that if a vertex X of a simplicial set C is strongly final, then `Map_C(Y, X)` is weakly contractible for
every vertex Y, and that the converse holds when C is an ∞-category, so that there the two notions agree (HTT,
Cor. 1.2.12.5, p. 63). The route is Lurie's. A strongly final X gives a retraction of `C▷` onto C carrying the cone
point to X, hence a retraction of H-enriched homotopy categories; the cone point has weakly contractible mapping
objects from every vertex of C in `h(C▷)`, since these are the values of the straightening of the identity of C,
weakly contractible by §7.6 (the fibers of the identity are points). In an ∞-category, `Map_C(Y, X)` is represented
by `Hom^R_C(Y, X)` (§8.1 with §7.3), so the converse is §5.5. Instances:

- in `Λ[2, 1]` the vertex 2 is not strongly final (no edge from 0 to 2), yet each `Map(Y, 2)` is a point, so the
  converse fails off ∞-categories;
- in the nerve of a category both conditions say terminal object; in `Δ[n]` with n ≥ 1 the vertex n satisfies them
  and 0 does not; the vertex of the nerve of a nontrivial group fails both (its endomorphism object is the discrete
  set G).

*Needs:* §5.5.2 strongly final objects through mapping spaces; §8.1.1 mapping-space comparison; §7.3.2 `p_S`; §7.6.1
straightening computes fibers; Tau Ceti `SSet.IsTerminalVertex`; §1.2 (HTT, §1.2.12), §1.2.2 (HTT, Notation 1.2.8.4) and §2.1.6 (HTT, Def. 1.1.5.14),
§2.1.7 (HTT, Def. 1.2.2.1).

### 8.3 Colimits in slices

**8.3.1.** Prove that colimits in a slice are computed in the underlying ∞-category (HTT, Prop. 1.2.13.8, p. 66;
`Suggested.lean` declarations `exists_isColimitDiagram_slice` for (1) and `isColimitDiagram_iff_comp_slice_π` for
(2)). Let C
be an ∞-category, q : T → C and p : K → `C_{/q}`, and let p₀ be p followed by the projection to C. If p₀ has a colimit
in C, then (1) p has a colimit in `C_{/q}`, preserved by the projection, and (2) an extension `p̃ : K▷ → C_{/q}` is a
colimit of p exactly when its image in C is a colimit of p₀. The route is Lurie's. Identify `p̃` with a map
`K ⋆ Δ[0] ⋆ T → C`. If its image `p̃₀` is a colimit diagram, the restriction `C_{p̃₀/} → C_{p₀/}` is a trivial
fibration, which solves the lifting problems against `A ⋆ T ⊆ B ⋆ T` that make `p̃` a colimit and that produce `p̃`
from a colimit of p₀; this proves (1) and the "if" half of (2). For "only if", any two colimits of p are equivalent
(§5.5), and initial objects of an ∞-category are invariant under equivalence, being detected in the H-enriched
homotopy category (§8.2, dual form).

*Needs:* §5.5.4 (uniqueness of colimits, strongly final objects); §8.2.1 comparison with the homotopy category; §4.3.1, §4.3.2;
Tau Ceti `SSet.join`, `SSet.slice`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2, p. 60), `SSet.coslice.IsColimit`;
§1.2.4 (HTT, Def. 1.2.13.4 and the final objects of §1.2.12).

### Examples

- For a locally Kan simplicial category C, §8.1 and §2.6 make N(C) an ∞-category whose mapping objects in H are those
  of C; in particular N(C) and C have equivalent H-enriched homotopy categories.
- For the simplicial category of Kan complexes, the coherent nerve is the ∞-category of spaces, and its mapping
  spaces are the simplicial sets of maps up to weak homotopy equivalence.
- In a slice `C_{/q}` of an ∞-category with all colimits indexed by K, all colimits indexed by K exist and are
  detected in C (§8.3).

### Dependencies

Layer 7 for straightening and the twisted realization; Layer 5 for mapping spaces and strongly final objects; Tau Ceti
for coherent nerves, slices, terminal vertices and fully faithful maps; Layer 1 (§1.1, §1.2) for final objects,
colimits and the H-enriched homotopy categories of simplicial categories, and §2.1 for those of simplicial sets; ModelCategoryTheory, Part KanQuillen.

## Layer 9: Inner anodyne maps and the Joyal model structure

### 9.1 Generators of the inner anodyne maps

**9.1.1.** Prove that three families of monomorphisms generate the same weakly saturated class, the inner anodyne maps (HTT,
Prop. 2.3.2.1, p. 117; `Suggested.lean` declaration `rlp_unionProd_boundary_horn_eq_innerFibrations`): the inner horns `Λ[n, i] ⊆ Δ[n]`,
0 < i < n; the inclusions `(Δ[m] × Λ[2, 1]) ∪ (∂Δ[m] × Δ[2]) ⊆ Δ[m] × Δ[2]`, m ≥ 0; and
`(S' × Λ[2, 1]) ∪ (S × Δ[2]) ⊆ S' × Δ[2]` for every monomorphism S ⊆ S'. In lifting form, the right lifting class of
the second family is Mathlib's `SSet.innerFibrations`. The route: the second and third families are inner anodyne by
Mathlib's pushout-product theorem, the third is generated by the second cell by cell, and each inner horn is a retract
of its member of the third family, through the section of `[n] × [2] ⟶ [n]` sending j to (j, 0), (j, 1) or (j, 2) as
j < i, j = i or j > i.

*Needs:*
- ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2).
- `SSet.innerAnodyneExtensions_unionProd_ι`, `SSet.Subcomplex.unionProd`.

### 9.2 Restriction along inner anodyne maps

**9.2.1.** Prove that a simplicial set C is an ∞-category exactly when restriction `Fun(Δ[2], C) ⟶ Fun(Λ[2, 1], C)` is a
trivial fibration (HTT, Cor. 2.3.2.2, p. 118; `Suggested.lean` declaration `quasicategory_iff_rlp_pre_horn`). The route is §9.1 by
adjunction: lifting against `∂Δ[m] ⊆ Δ[m]` for the restriction map is lifting against the second family for C.

*Needs:* §9.1.1; Mathlib `SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2).

**9.2.2.** Prove that for an inner fibration `p : X ⟶ S` and an inner anodyne `A ⟶ B`, the map
`Fun(B, X) ⟶ Fun(A, X) ×_{Fun(A, S)} Fun(B, S)` is a trivial fibration (HTT, Cor. 2.3.2.5, second half, p. 119). The
route is adjunction from Mathlib's `SSet.innerAnodyneExtensions_pushoutObjObjι`. `Suggested.lean` declaration
`rlp_monomorphisms_pullbackObjObjπ_of_innerAnodyne`.

*Needs:* `SSet.innerAnodyneExtensions_pushoutObjObjι`, `SSet.innerFibration_pullbackObjObjπ`; Mathlib
`SSet.rlp_monomorphisms` (HTT, Example 2.0.0.2).

### 9.3 Products preserve categorical equivalences

**9.3.1.** Prove that for a categorical equivalence `f : A ⟶ B` and any simplicial set K, `f × K` is a categorical equivalence
(HTT, Cor. 2.2.5.4, p. 110; `Suggested.lean` declaration `isCategoricalEquivalence_whiskerRight`). The route: inner anodyne replacements by
the small object argument reduce to A, B and K ∞-categories; then `h(A × K) ≅ hA × hK` (Mathlib
`SSet.hoFunctor.monoidal`, for all simplicial sets) gives essential surjectivity, and mapping spaces of a product
are products of mapping spaces, which gives full faithfulness.

*Needs:*
- §6.1.1 (HTT, Lemma 2.2.5.2), §8.1.1 (HTT, Prop. 2.2.4.1) and §2.4.1 (HTT, Def. 1.2.10.1, essential
  surjectivity).
- §2.1.6 (HTT, Def. 1.1.5.14; Def. 1.2.10.1, full faithfulness).
- `SSet.innerAnodyneExtensions_pushoutObjObjι`, Mathlib `SSet.hoFunctor.monoidal`; ModelCategoryTheory, Part
  ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)).

### 9.4 Categorical fibrations

**9.4.1.** Define a categorical fibration as a map of simplicial sets with the right lifting property against every
monomorphism that is a categorical equivalence (HTT, §2.2.5, in the proof of Thm. 2.2.5.1, p. 108). The `Suggested.lean`
declaration for this class of maps is `categoricalFibrations`, a morphism property of simplicial sets; the planned Tau
Ceti declaration is the predicate `SSet.CategoricalFibration` with this definition (supplier contract).

- Every trivial fibration is a categorical fibration, and categorical fibrations are stable under composition, base
  change and retracts.
- Every categorical fibration is an inner fibration, since inner horn inclusions are monomorphisms and categorical
  equivalences (§6.1); the converse fails (HTT, Rem. 2.2.5.5, p. 110). Kerodon calls these maps isofibrations
  (Kerodon, Def. 4.5.6.5; Prop. 4.5.6.1 for the comparison over an ∞-category). `Suggested.lean` declaration
  `innerFibration_of_categoricalFibrations` for the first assertion.

**Checks.**
- `{0} ⟶ J` (J the nerve of the free-living isomorphism) is an inner fibration, being the nerve of a functor, but not
  a categorical fibration: the isomorphism `0 ⟶ 1` of J does not lift. This rules out defining categorical fibrations
  as inner fibrations.
- `Δ[1] ⟶ Δ[0]` is a categorical fibration but not a trivial fibration. Maps into a nerve are functors out of the
  homotopy category, a monic categorical equivalence A ⊆ B induces an equivalence `hA → hB` injective on objects, and a
  functor to the poset [1] extends along it. It is not a trivial fibration: the map
  `∂Δ[1] ⟶ Δ[1]` sending 0 to 1 and 1 to 0 has no extension to Δ[1]. This rules out "categorical fibration = trivial
  fibration".
- `Δ[1] ⟶ Δ[0]` is not a Kan fibration: the horn `Λ[2, 0] ⟶ Δ[1]` with vertices 0, 1, 0 has no filler, which would
  need an edge `1 ⟶ 0`. This rules out "categorical fibration = Kan fibration".

*Needs:* §2.1.6 (HTT, Def. 1.1.5.14); §6.1.1 (HTT, Lemma 2.2.5.2); `SSet.InnerFibration`.

### 9.5 The Joyal model structure and its fibrant objects

**9.5.1.** Prove that simplicial sets carry a left proper combinatorial model structure whose cofibrations are the monomorphisms,
whose weak equivalences are the categorical equivalences and whose fibrations are the categorical fibrations (HTT,
Thm. 2.2.5.1, model-structure part, p. 107; `Suggested.lean` declarations `isWeakFactorizationSystem_categoricalFibrations` and
`rlp_monomorphisms_eq_categoricalFibrations_inf`, as a weak factorization system and the identification of trivial
fibrations). The route is Smith's theorem: categorical equivalences are perfect, since `C[−]` preserves
filtered colimits; stable under pushout along monomorphisms, since the Bergner structure is left proper; and contain
the trivial fibrations. For the last, let p : X → Y be a trivial fibration and J the nerve of the contractible
groupoid on {0, 1}. Then p has a section s, and lifting `X × ∂J ⊆ X × J` against p, with `(s ∘ p, id)` on top and
`p ∘ pr` below, gives `H : X × J → X` from `s ∘ p` to the identity. `J → Δ[0]` is an equivalence of categories,
hence a categorical equivalence (§2.6), so `{0} ⊆ J` and `{1} ⊆ J` are categorical equivalences, and so are
`X × {0} ⊆ X × J` and `X × {1} ⊆ X × J` (§9.3). By two-out-of-three H is one, hence so is `s ∘ p`, and p is a
retract of `s ∘ p` (through s and p), so p is a categorical equivalence. Left properness holds because every object
is cofibrant.

*Needs:*
- §9.1.1; §2.1.6 (HTT, Def. 1.1.5.14; closure under retracts); §2.6.4 (nerves of categories); §9.3.1; Mathlib
  `SSet.rlp_monomorphisms`.
- §6.1.1 (HTT, Lemma 2.2.5.2; Thm. 2.2.5.1 (C)), §8.1.1 (HTT, Prop. 2.2.4.1) and §7.3.2 (HTT,
  Prop. 2.2.2.7).
- ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)), §3.4.2 (HTT, Prop. A.2.4.2), §5.5.1 (HTT, Cor. A.2.6.14) and §6.3.2 (HTT, Prop. A.2.6.15).
- ModelCategoryTheory, Part SimplicialCategories §5.4.2 (HTT, Prop. A.3.2.4, left properness of the Bergner structure;
  Rem. A.3.2.3).

**9.5.2.** Prove Joyal's theorem that the fibrant objects of the Joyal structure are the ∞-categories: a simplicial set C is
fibrant, that is `C → Δ[0]` is a categorical fibration, exactly when C is an ∞-category (HTT, Thm. 2.4.6.1, p. 154;
`Suggested.lean` declaration `quasicategory_iff_categoricalFibrations`). Necessity is §9.4 (categorical fibrations are inner). The
route for sufficiency is Lurie's (HTT, §2.4.5–§2.4.6, pp. 152–155); it uses neither marked simplicial sets nor
straightening beyond the mapping-space comparison of §8.1, which the model structure of §9.5.1 already uses.

1. **Fibers of slices** (HTT, Lemma 2.4.5.1, p. 152, in its form for slices, by passing to opposites). Let
   p : C → D be a fully faithful map of ∞-categories (§2.1), j : K → C a diagram with K finite, and x an object of C.
   Then `C_{/j} ×_C {x} → D_{/pj} ×_D {p x}` is a homotopy equivalence of Kan complexes. The fibers are Kan
   complexes, being fibers of right fibrations (Tau Ceti `SSet.slice.rightFibration_π`; §5.1). Induct on the
   dimension of K and the number of its nondegenerate simplices. For K = ∅ both fibers are points. Attaching a simplex along `∂Δ[n] ⊆ Δ[n]` turns
   both sides into pullbacks, by the universal property of slices, along the restriction maps of fibers for
   `∂Δ[n] ⊆ Δ[n]`. These are right fibrations (§4.2, first assertion, in its form for slices) between Kan
   complexes, hence Kan fibrations (§5.3, dual form), so the pullbacks are homotopy pullbacks, and a map of homotopy pullbacks that is a weak homotopy
   equivalence on the three corners is one on the fourth (ModelCategoryTheory, Part KanQuillen, right properness, with
   Part ModelCategories §3.5); so the induction step holds. For K = Δ[n], restriction to the vertex 0 is a trivial fibration on both sides (§4.3, dual form for
   slices, along the left anodyne `{0} ⊆ Δ[n]`). For K a vertex y the fibers are `Hom^R_C(x, y)` and
   `Hom^R_D(px, py)`, and p induces a homotopy equivalence between them because it is fully faithful (§8.1, with
   Whitehead's theorem).
2. **Special outer horns along a categorical equivalence** (HTT, Lemma 2.4.6.2, p. 154). Let p : C → D be a
   categorical equivalence of ∞-categories and m ≥ 2. Given `f₀ : ∂Δ{1,…,m} → C` and `h₀ : Λ[m, 0] → D` with
   `h₀|∂Δ{1,…,m} = p ∘ f₀` and `h₀|Δ{0,1}` an equivalence of D, there are `f : Δ{1,…,m} → C` extending f₀ and
   `h : Δ[m] → D` extending h₀ with `h|Δ{1,…,m} = p ∘ f`. The route: p is essentially surjective and fully faithful
   (§2.6). Read h₀ as a vertex of `D_{/p f₀}` over `d = h₀(0)`, choose an equivalence `d → p(x)` (§2.4, with
   §2.3 for the direction) and lift it
   along the right fibration `D_{/p f₀} → D` with source h₀ (Tau Ceti `SSet.RightFibration.hasLift_of_isEquivalence`);
   the lift is an equivalence, since right fibrations reflect equivalences (§3.1, right-fibration form). By step 1
   its target h₁ lies, in the Kan fiber of `D_{/p f₀} → D` over p(x), in the component of the image p(k) of a vertex k
   of `C_{/f₀}` over x; in a Kan complex two vertices of one component are joined by an edge in either direction, so
   there is a fiber edge h₁ → p(k). Fiber edges are equivalences of `D_{/p f₀}` (§2.3, maps preserve equivalences,
   the fiber being a Kan complex), and `D_{/p f₀}` is an ∞-category (§4.3, dual form), so the composite
   h₀ → h₁ → p(k) is an equivalence of `D_{/p f₀}` (§2.3, two-out-of-three). Read through `SSet.slice.homEquiv`,
   this composite gives a vertex 0′ and maps `f′₀ : {0′} ⋆ ∂Δ{1,…,m} → C` extending f₀ and
   `h′₀ : Δ{0, 0′} ⋆ ∂Δ{1,…,m} → D` extending h₀ and `p ∘ f′₀`, with `h′₀|Δ{0,0′}` an equivalence. By two-out-of-three
   (§2.3) `p(f′₀|Δ{0′,1})` is an equivalence, and p reflects equivalences, since it induces an equivalence of homotopy
   categories (§2.6; Tau Ceti `SSet.Edge.isEquivalence_iff_isIso`), so `f′₀|Δ{0′,1}` is an equivalence. The outer-horn
   theorem (§5.1) extends f′₀ to `f′ : Δ{0′,1,…,m} → C`; then `p ∘ f′` and h′₀ form an inner horn `Λ[m + 1, 1]` of
   `Δ{0, 0′, 1, …, m}` in D, which fills. Take f the restriction of f′ to `Δ{1,…,m}` and h the face opposite 0′.
3. **Lifting along a categorical equivalence** (HTT, Lemma 2.4.6.3, p. 154). Let p : C → D be a categorical
   equivalence of ∞-categories, A ⊆ B a monomorphism, `f₀ : A → C`, `g : B → D`, and `h₀ : A × Δ[1] → D` from `g|A`
   to `p ∘ f₀` with every `h₀|{a} × Δ[1]` an equivalence. Then there are `f : B → C` extending f₀ and
   `h : B × Δ[1] → D` from g to `p ∘ f` extending h₀, with every `h|{b} × Δ[1]` an equivalence. The route: attach the
   nondegenerate simplices of B outside A one at a time (Mathlib `SSet.relativeCellComplexOfMono`). For a vertex b
   this is essential surjectivity (§2.4), with an equivalence `g(b) → p(x)` in that direction by §2.3. For an n-simplex, n ≥ 1, extend h over the filtration of `Δ[n] × Δ[1]` by
   the simplices `τ_n, …, τ_0` of §3.2: for j ≥ 1 adjoining τ_j fills an inner horn in D, and adjoining τ₀ is step 2
   with m = n + 1, whose first edge is the equivalence at the vertex 0 and whose face `Δ[n] × {1}` is chosen in C.
4. **Retractions** (HTT, Lemma 2.4.6.4, p. 155). If C is an ∞-category and `C ⊆ D` is a monomorphism and a
   categorical equivalence, then C is a retract of D. The route: embed D in an ∞-category D′ by an inner anodyne map
   (small object argument), a categorical equivalence (§6.1), so `C ⊆ D′` is one; apply step 3 to `C ⊆ D′` with
   A = C, B = D′, f₀ and g the identities and h₀ degenerate, and restrict f to D.
5. **The theorem** (HTT, proof of Thm. 2.4.6.1, p. 155). Given a monic categorical equivalence A ⊆ B and a map
   A → C to an ∞-category, the pushout `C ⊆ C ⊔_A B` is a trivial cofibration of the model structure of §9.5.1; a
   retraction from step 4 restricts along B → C ⊔_A B to the required extension.

Instances:

- for C = Δ[1] and the monic categorical equivalence `{0} ⊆ J`, every map `{0} → Δ[1]` extends to J, constantly,
  since the only equivalences of Δ[1] are degenerate;
- `Λ[2, 1]` is not fibrant: `Λ[2, 1] ⊆ Δ[2]` is a monic categorical equivalence (§6.1), and the identity of
  `Λ[2, 1]` does not extend to Δ[2], which would need an edge from 0 to 2 in `Λ[2, 1]`;
- the hypothesis that A ⊆ B is a categorical equivalence is needed: the identity of `∂Δ[1]` does not extend along
  `∂Δ[1] ⊆ Δ[1]` to the Kan complex, hence ∞-category, `∂Δ[1]`.

*Needs:*
- §9.4.1; §9.5.1 above (the model structure: trivial cofibrations are stable under pushout); ModelCategoryTheory, Part
  ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)) and §3.4 (HTT, Def. A.2.1.1).
- For step 1: §2.1.8 (HTT, Def. 1.2.10.1, full faithfulness); §8.1.3 (full faithfulness through `Hom^R`); §4.2.1 first
  assertion and §4.3.2, dual forms for slices; §5.1.1; §5.3.1 Kan-fibration lemma (dual form); Tau Ceti `SSet.slice`,
  `SSet.slice.homEquiv`, `SSet.slice.rightFibration_π`, `SSet.rightMappingSpace`; ModelCategoryTheory, Part
  ModelCategories §3.5.3 (homotopy pullbacks) and Part KanQuillen §1.3.3 and §3.4.1 (Whitehead's theorem; right
  properness).
- For steps 2–4: §2.3 (equivalences, two-out-of-three, symmetry of equivalence of objects); §4.3.1 (dual form: slices
  of ∞-categories are ∞-categories); §2.4.1 and §2.6.3, §2.6.4 (essential surjectivity and full
  faithfulness of categorical equivalences; the two homotopy categories); §3.2.1 (the filtration of `Δ[n] × Δ[1]`);
  §3.1.1, §3.1.2 and §5.1 (lifting and reflection of equivalences; the outer-horn theorem); §6.1.1; Tau Ceti
  `SSet.RightFibration.hasLift_of_isEquivalence`, `SSet.Edge.isEquivalence_map_iff_of_rightFibration`,
  `SSet.Edge.isEquivalence_iff_isIso`; Mathlib `SSet.relativeCellComplexOfMono`, `SSet.Quasicategory`.

**9.5.3.** Prove that the Joyal structure is Cartesian closed as a model category: for monomorphisms `A ⊆ B` and `K ⊆ L`, the
inclusion `(A × L) ∪ (B × K) ⊆ B × L` is a monomorphism, and a categorical equivalence when `A ⊆ B` is one. So for
every simplicial set T, `T × −` is left Quillen with right adjoint `Fun(T, −)`, and the Cartesian product makes the
Joyal structure a monoidal model category (a consequence of HTT, Cor. 2.2.5.4, p. 110, by the route below). Consequently, for an ∞-category X and a
monomorphism `K ⊆ L`, restriction `Fun(L, X) ⟶ Fun(K, X)` is a categorical fibration, and a trivial fibration
when `K ⊆ L` is a categorical equivalence (as used in the proof of HTT, Prop. 1.2.7.3, p. 112). `Suggested.lean`
declarations `isCategoricalEquivalence_pushoutObjObjι`, `categoricalFibrations_pre_app` and
`rlp_monomorphisms_pre_app`. The route: `A × L ⟶ (A × L) ∪ (B × K)` is a pushout of `A × K ⟶ B × K` and `A × L ⟶ B × L` is a trivial cofibration, both by §9.3,
so two-out-of-three applies. For the consequence, by adjunction a lifting problem of `A ⊆ B` against the
restriction map is an extension problem for X along `(A × L) ∪ (B × K) ⊆ B × L`, a monic categorical equivalence
when A ⊆ B is one, or when `K ⊆ L` is one and A ⊆ B is any monomorphism; X is fibrant by Joyal's theorem (§9.5.2).
For X = Δ[1], K = ∂Δ[1] and L = Δ[1], the restriction `Fun(Δ[1], Δ[1]) → Δ[1] × Δ[1]` is a categorical
fibration whose fiber over (1, 0) is empty, so it is not a trivial fibration.

*Needs:* §9.3.1; §9.5.1, §9.5.2 above (the model structure; Joyal's theorem on fibrant objects); `MonoidalClosed.pre`, `ihom`;
ModelCategoryTheory, Part SimplicialCategories §1.2.1 (HTT, Def. A.3.1.2).

### 9.6 The Quillen equivalence with the Bergner model structure

**9.6.1.** Prove that the adjunction `C[−] ⊣ N` between simplicial sets with the Joyal structure and simplicial categories with
the Bergner structure is a Quillen equivalence (HTT, Thm. 2.2.5.1, last assertion, p. 107). The route: `C[−]` is left
Quillen by the definition of categorical equivalences and Thm. 2.2.5.1 (C); for a fibrant simplicial category D the
counit `C[N(D)] ⟶ D` is an equivalence.

*Needs:*
- §9.5.1; §2.1.6 (HTT, Def. 1.1.5.14; Def. 1.1.5.5, the adjunction).
- §8.1.2 (HTT, Thm. 2.2.0.1) and §6.1.1 (HTT, Thm. 2.2.5.1 (C)).
- ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1); Part SimplicialCategories §5.8.4 (HTT, Thm. A.3.2.24).

**9.6.2.** Prove that for simplicial sets S, S' the comparison `C[S × S'] ⟶ C[S] × C[S']` is an equivalence of simplicial
categories (HTT, Cor. 2.2.5.6, p. 111). The route: first for nerves of fibrant simplicial categories, by the counit
equivalence and two-out-of-three; then replace S and S' by such nerves along categorical equivalences with §2.4.

*Needs:* §9.3.1; §9.6.1 above (the Quillen equivalence); §8.1.2 (HTT, Thm. 2.2.0.1);
ModelCategoryTheory, Part SimplicialCategories §5.8.4 (HTT, Thm. A.3.2.24).

### 9.7 The forms of categorical equivalence

**9.7.1.** Prove that for an ∞-category C and a simplicial set K, two maps `f, g : K ⟶ C` are equivalent objects of the
∞-category `Fun(K, C)` (§2.3) exactly when they are left homotopic in the Joyal structure (HTT, Prop. 2.2.5.7,
p. 111). The route: for a contractible Kan complex S with distinct vertices x and y, `K × {x, y} ⊆ K × S` is a
cylinder object for K, since it is a monomorphism and `K × S ⟶ K` is a categorical equivalence (`S ⟶ Δ[0]` is a
trivial fibration, hence a categorical equivalence by §9.5, and §9.3 applies). As K is cofibrant and C fibrant
(§9.5, Joyal's theorem), left homotopy may be tested through this one cylinder (ModelCategoryTheory, Part
ModelCategories §3.1). A map `K × S ⟶ C` is a map `S ⟶ Fun(K, C)`; it lands in the core of `Fun(K, C)`, since
every edge of the Kan complex S is an equivalence and maps preserve equivalences (§2.3, §5.1), so f and g lie in
one component of the core, the Kan complex of §5.1, and are equivalent. Conversely an equivalence from f to g is an
edge of the core, which extends along the anodyne inclusion `Δ[1] ⊆ J` to a map from J, J the nerve of the
contractible groupoid on {0, 1}.

**Checks.**
- For K = Δ[0] and C = Δ[1], the vertices 0 and 1 are not equivalent, and they are not left homotopic: a map
  J → Δ[1] through both would need an edge from 1 to 0.
- For K = Δ[0] and C = J, the vertices 0 and 1 are equivalent and left homotopic, through the identity of J; a
  notion asking only for an edge from f to g would also relate 0 and 1 in Δ[1], where they are not left homotopic.

*Needs:* §9.3.1; §9.5.1, §9.5.2 (the model structure; Joyal's theorem on fibrant objects); §5.1.2 (HTT, Prop. 1.2.5.3); §1.2
(HTT, §1.2.5, the core); §2.3.1 (equivalences); Mathlib instance `Quasicategory ((ihom K).obj C)`;
ModelCategoryTheory, Part ModelCategories §3.1.1 (HTT, Prop. A.2.2.1) and Part KanQuillen (HTT, §A.2.7, anodyne
maps and Kan complexes).

**9.7.2.** Prove that a map `f : A ⟶ B` of simplicial sets is a categorical equivalence (§2.1, HTT, Def. 1.1.5.14) exactly
when, for every ∞-category C, restriction `h Fun(B, C) ⟶ h Fun(A, C)` is an equivalence of categories (HTT,
Prop. 2.2.5.8, p. 112; Joyal's form, Kerodon, §4.5.4, Def. 4.5.4.1 and Prop. 4.5.4.8). Write `[X, C]` for the
set of maps from X to C in the homotopy category of the Joyal structure; for an ∞-category C, which is fibrant
(§9.5), it is the set of left-homotopy classes of maps X → C, hence, by §9.7.1, the set of
isomorphism classes of `h Fun(X, C)` (Tau Ceti `SSet.Edge.isEquivalence_iff_isIso`). The route:

- **Forward.** Let f be a categorical equivalence and C an ∞-category. For every simplicial set K, `A × K ⟶ B × K`
  is a categorical equivalence (§9.3), so `[B × K, C] ⟶ [A × K, C]` is bijective; by the adjunction of `− × K`
  with `Fun(K, −)` and §9.7.1, this says that restriction `Fun(B, C) ⟶ Fun(A, C)`, a map of
  ∞-categories, induces a bijection `[K, Fun(B, C)] ⟶ [K, Fun(A, C)]`. A map of bifibrant objects inducing
  bijections on `[K, −]` for every K is an isomorphism of the homotopy category of bifibrant objects, hence a
  homotopy equivalence and a categorical equivalence (ModelCategoryTheory, Part ModelCategories §3.1). A
  categorical equivalence induces an equivalence of the underlying categories of the H-enriched homotopy
  categories, which are `SSet.hoFunctor` (§2.6, the agreement of the two homotopy categories); so restriction
  `h Fun(B, C) ⟶ h Fun(A, C)` is an equivalence.
- **Converse.** If every such restriction is an equivalence, it is a bijection on isomorphism classes, so
  `[B, C] ⟶ [A, C]` is bijective for every ∞-category C, that is for every fibrant object (§9.5). Every object
  is cofibrant, so after fibrant replacement of A and B (by trivial cofibrations) f becomes a map of bifibrant
  objects inducing bijections on `[−, C]` for every fibrant C, an isomorphism of the homotopy category of bifibrant
  objects; so f is a weak equivalence of the Joyal structure, a categorical equivalence, by two-out-of-three.

So the `Suggested.lean` declaration `IsCategoricalEquivalence` of §2.1, in Joyal's form, is the categorical
equivalence of §2.1, and the Lean statements that use it state the results of their sections.

**Checks.**
- For f = `∂Δ[1] ⊆ Δ[1]` both sides fail: for C = Δ[0] ⊔ Δ[0], `h Fun(Δ[1], C)` is discrete with 2 objects and
  `h Fun(∂Δ[1], C)` with 4. A criterion testing only C = Δ[0] would accept f, since both functor ∞-categories are
  then Δ[0].
- For f = `Λ[2, 0] ⊆ Δ[2]` both sides fail (C = Δ[1]: `h Fun(Δ[2], Δ[1])` is a poset with 4 elements and
  `h Fun(Λ[2, 0], Δ[1])` one with 5),
  although f is a weak homotopy equivalence: a criterion testing only Kan complexes C would accept it.
- For f = `J ⟶ Δ[0]` both sides hold: restriction `C ⟶ Fun(J, C)` is a section of `Fun(J, C) ⟶ Fun({0}, C) = C`,
  a trivial fibration since `{0} ⊆ J` is a monomorphism and a categorical equivalence (§9.5, Cartesian
  closedness). A criterion asking for isomorphisms of homotopy categories would reject it, `h J` being the
  free-living isomorphism.

*Needs:*
- §9.3.1; §9.5.1, §9.5.2, §9.5.3 (the model structure, Joyal's theorem on fibrant objects, Cartesian closedness); §9.7.1
  (HTT, Prop. 2.2.5.7).
- §2.1.6 (HTT, Def. 1.1.5.14); §2.6.3 (the agreement of the two homotopy categories); §2.3.1 (equivalences); Tau Ceti
  `SSet.Edge.isEquivalence_iff_isIso`; Mathlib `MonoidalClosed.pre`, `ihom`, instance `Quasicategory ((ihom K).obj C)`.
- ModelCategoryTheory, Part ModelCategories §3.1.2 (HTT, §A.2.2, p. 830, the homotopy category of bifibrant
  objects).

### Examples

- For a category D, the nerve of D is Joyal-fibrant, a case of Joyal's theorem (§9.5) that the argument of the
  second Check of §9.4 proves directly for any D: a functor to D extends along a monic categorical equivalence by
  choosing inverse isomorphisms. A functor of categories is a
  categorical equivalence of nerves exactly when it is an equivalence of categories (§2.6).
- For an ∞-category X, restriction `Fun(Δ[1], X) → Fun(∂Δ[1], X)` is a categorical
  fibration (§9.5, Joyal's theorem with Cartesian closedness), whose fibers are the mapping spaces `Hom_X(x, y)`
  of §5.2.

### Dependencies

Mathlib's inner anodyne theory; Layers 6–8 (inner anodyne maps as categorical equivalences, straightening over a
point, the mapping-space comparison); Layers 2–5 for Joyal's theorem on fibrant objects (equivalences, the
filtration of the prism, slices along inner fibrations, outer horns and Kan fibrations between Kan complexes) and
for the forms of categorical equivalence of §9.7 (cores, equivalences, the two homotopy categories);
§1.1 and §2.1; ModelCategoryTheory, Parts ModelCategories, KanQuillen and SimplicialCategories.

## Layer 10: Minimal models, n-categories and truncated morphisms

### 10.1 Homotopy relative to a subcomplex, n-categories and truncated objects

**10.1.1.** Given a commutative square with `i : A → B` on the left, an inner fibration `p : X → S` on the right (HTT,
§2.3.3, p. 119), top `u : A → X` and bottom `v : B → S`, with i an arbitrary map, define two diagonal fillers
f, f′ : B → X to be homotopic relative to A over S when there is `F : B × Δ[1] → X` with `F|B×{0} = f`,
`F|B×{1} = f′`, `p ∘ F = v ∘ pr_B`, `F ∘ (i × id) = u ∘ pr_A`, and with `F|{b}×Δ[1]` an equivalence of the fiber
`X_{v(b)}` for every vertex b of B (HTT, §2.3.3, p. 119). This explicit form is the definition used throughout this
Part; its case S = Δ[0], i = `∂Δ[n] ⊆ Δ[n]`, X an ∞-category is the `Suggested.lean` declaration
`HomotopicRelBoundary`, and its case i = `∂Δ[n] ⊆ Δ[n]` over any S is the `Suggested.lean` declaration
`HomotopicRelBoundaryOver`, which states the fiber condition through Tau Ceti's `SSet.fiber`. Lurie states it first as:
f and f′ are equivalent objects of the fiber of `Fun(B, X) → Fun(A, X) ×_{Fun(A, S)} Fun(B, S)` over (u, v). The
agreement of the two forms uses that p is an inner fibration, so that this fiber is an ∞-category, and the
pointwise criterion for equivalences in it; it is proved in §10.2. The fiber condition is HTT's. When S is the
nerve of a category, which covers the uses in §10.3–§10.6 after base change to simplices `Δ[n] → S`, it agrees
with asking that `F|{b}×Δ[1]` be an equivalence of X: an inverse in X and the 2-simplices exhibiting it lie over
an identity of S and over 2-simplices with identity edges, which in a nerve are degenerate, so they lie in the fiber.

**Checks.**
- For A = ∅, B = S = Δ[0] and X an ∞-category, two vertices are homotopic exactly when they are equivalent:
  in Δ[1] the two vertices are joined by an edge and are not homotopic.
- For X a Kan complex over S = Δ[0], vertices in the same path component are homotopic; in Δ[0] ⊔ Δ[0] the two
  vertices are not.
- For A = B (i the identity), the fiber is a point and f = f′ = u is forced.

*Needs:* §1.2 (functor ∞-categories); Mathlib `SSet.InnerFibration`; Tau Ceti `SSet.Edge.IsEquivalence`.

**10.1.2.** Define, for an integer n ≥ −1, an n-category to be an ∞-category C such that (1) two maps `Δ[n] → C` that are
homotopic relative to ∂Δ[n] (over Δ[0], in the explicit form of §10.1.1) are equal, and (2) for m > n, two maps
`Δ[m] → C` that agree on ∂Δ[m] are equal (HTT, Def. 2.3.4.1, p. 124). For n = −1 condition (1) is about maps
from the empty simplex and is vacuous. The hypothesis n ≥ −1 is part of the definition: no simplicial set
is an n-category for n < −1. HTT's separate convention calling Δ[0] alone a (−2)-category (HTT, §2.3.4,
p. 124, after Def. 2.3.4.1) is a different extension and is not used. The `Suggested.lean` declaration
is `IsNCategory`, using `HomotopicRelBoundary` for (1).

**Checks.**
- The (−1)-categories are ∅ and Δ[0]: condition (2) for m = 0 says any two vertices are equal, so Δ[0] ⊔ Δ[0]
  fails. For n = −2 nothing qualifies, not even ∅, so the bound n ≥ −1 is not vacuous: without it, ∅
  would satisfy both conditions at n = −2.
- Δ[1] (the nerve of [1]) is a 0-category, while the nerve of the groupoid with two isomorphic objects is not:
  its two objects are homotopic relative to ∅ but distinct.
- The nerve of the group ℤ/2 is a 1-category and not a 0-category: two distinct edges with the same
  endpoints violate (2) for m = 1. The singular complex of the circle is an ∞-category that is an
  n-category for no n.

*Needs:* §10.1.1 (homotopy relative to a subcomplex); Mathlib `SSet.Quasicategory`, `SSet.boundary`.

**10.1.3.** Define, for k ≥ −2, an object c of an ∞-category C to be k-truncated when every `Map_C(d, c)` is k-truncated in
H in the sense of the Conventions (for k ≥ −1, a Kan representative has trivial homotopy groups above k at every
base point, Tau Ceti `SSet.KanComplex.π`; for k = −1 it is empty or contractible; for k = −2 it is contractible).
So the (−2)-truncated objects are the final ones (§5.5, §8.2), and the discrete objects are the 0-truncated
ones; `τ≤k C` is their full subcategory (HTT, Def. 5.5.6.1, p. 511). Define `Disc(C)` as the homotopy category of
`τ≤0 C` (HTT, Notation 5.5.6.2, p. 511).

**Checks.**
- In the nerve of a category every object is 0-truncated, and `Disc(C)` is the category itself.
- In Δ[1], 1 is (−2)-truncated and 0 is (−1)-truncated.
- In S, the circle is 1-truncated but not 0-truncated: `Map(Δ[0], S¹)` is the circle, with π₁ = ℤ.

*Needs:* §2.1.7 (mapping objects); §1.2 (final objects); Tau Ceti `SSet.KanComplex.π`,
`SSet.fullEnhancedSubcategory`.

### 10.2 Relative outer horns, prisms, the pointwise criterion and categorical fibrations over an ∞-category

**10.2.1.** Prove the relative form of Joyal's outer-horn lemma (the relative form of HTT, Prop. 1.2.4.3, p. 52; it is the case
of equivalences in the dual (coCartesian) form of HTT, Prop. 2.4.1.5 with Remark 2.4.1.4, p. 134, which HTT states
for Cartesian edges and `Λ[n, n]`). Let p : C → D be an inner fibration between
∞-categories and n ≥ 2. Every commutative square with `Λ[n, 0] → C` on top and `Δ[n] → D` at the bottom, in which
the edge of the horn from 0 to 1 is an equivalence of C, has a diagonal filler `Δ[n] → C`. For D = Δ[0] this is
Tau Ceti's outer-horn theorem of §5.1. `Suggested.lean` declaration `exists_fill_horn_zero_of_innerFibration`.

The route goes through slices. Write `Δ[n] = Δ{0,1} ⋆ Δ{2,…,n}`; then `Λ[n, 0]` is the pushout-join of `{0} ⊆ Δ{0,1}`
with `∂Δ{2,…,n} ⊆ Δ{2,…,n}` (for n = 2 the second inclusion is ∅ ⊆ Δ[0]). Let σ be the restriction of the horn to
`Δ{2,…,n}`, σ₀ its restriction to the boundary and τ the image of `Δ{2,…,n}` in D. By the universal property of slices
the square is the problem of lifting an edge of `E = C_{/σ₀} ×_{D_{/pσ₀}} D_{/τ}`, with its source already lifted,
along `q : C_{/σ} → E`.

- q is a right fibration: this is the first assertion of §4.2 for the inner fibration p, in its form for slices
  obtained by passing to opposites.
- E is an ∞-category: `E → C_{/σ₀}` is a base change of `D_{/τ} → D_{/pσ₀}`, a right fibration by the same assertion
  for D → Δ[0], and `C_{/σ₀}` is an ∞-category. This is the only use of the hypothesis that D is an ∞-category.
- The edge of E is an equivalence: its image under the right fibrations `E → C_{/σ₀} → C` is the edge from 0 to 1,
  an equivalence of C, and right fibrations of ∞-categories reflect equivalences (§3.1, right-fibration form).
- A right fibration of ∞-categories lifts an equivalence with prescribed source (§3.1, right-fibration form).

*Needs:* §3.1.1, §3.1.2 (Tau Ceti `SSet.Edge.isEquivalence_map_iff_of_rightFibration`,
`SSet.RightFibration.hasLift_of_isEquivalence`); §4.2.1 first assertion; Tau Ceti `SSet.slice.homEquiv`,
`SSet.slice.rightFibration_π`, `SSet.join`, `SSet.Subcomplex.unionJoin`; Mathlib `SSet.InnerFibration`,
`SSet.opFunctor`.

**10.2.2.** Prove the prism form (HTT, Prop. 2.4.1.8, p. 136, in the case of fiber equivalences; `Suggested.lean` declaration
`exists_extension_unionProd_of_isEquivalence`). Let p : X → S be an inner
fibration, n ≥ 0, σ : Δ[n] → S, and `h₀ : (Δ[n] × {0}) ∪ (∂Δ[n] × Δ[1]) → X` a map over `σ ∘ pr`. For n ≥ 1 suppose
that the edge `h₀|{0} × Δ[1]`, which lies in the fiber `X_{σ(0)}`, is an equivalence of that fiber. Then h₀ extends
to `h : Δ[n] × Δ[1] → X` over `σ ∘ pr`.

The route is the filtration of `Δ[n] × Δ[1]` from §3.2 (HTT, proof of Prop. 2.1.2.6, p. 81). Let τ_j be the
(n+1)-simplex with vertices (0,0), …, (j,0), (j,1), …, (n,1), and adjoin `τ_n, τ_(n−1), …, τ_0` in this order. Adjoining
τ_j is a pushout of `Λ[n + 1, j] ⊆ Δ[n + 1]`: its faces that omit (i,0) with i < j or (i,1) with i > j lie in
`∂Δ[n] × Δ[1]`, the face that omits (j,1) is a face of `τ_(j+1)` (of `Δ[n] × {0}` when j = n), and only the face that
omits (j,0) is missing. For 1 ≤ j ≤ n the horn is inner and p fills it. For j = 0 the horn is `Λ[n + 1, 0]`, with
first edge `{0} × Δ[1]`. Pull back along σ: `X_σ = X ×_S Δ[n] → Δ[n]` is an inner fibration over an ∞-category, so
`X_σ` is an ∞-category; the fiber `X_{σ(0)}` is a simplicial subset of it, so the first edge is an equivalence of
`X_σ` (§2.3); Tau Ceti's outer-horn theorem (§5.1) fills the last horn in `X_σ`, and the filler lies over
`Δ[n + 1] → Δ[n] × Δ[1] → Δ[n]` automatically, because Δ[n] is the nerve of a poset and the horn contains every
vertex (n + 1 ≥ 2). The relative outer-horn lemma (§10.2.1) for `X_σ → Δ[n]` gives the same filler. For n = 0 the
inclusion is `{0} ⊆ Δ[1]` and the degenerate edge at `h₀(0, 0)` extends.
Pulling back to `Δ[n]` rather than to `Δ[n + 1]` matters: over `Δ[n + 1]` the first edge would lie over the
nondegenerate edge from 0 to 1 and would not be an equivalence of the pullback.

Instances:

- for X = Δ[1] over S = Δ[0] and n = 1, take `{0} × Δ[1]` to the nondegenerate edge and the rest of the open box to the
  vertex 0; no extension exists, since it would need an edge from 1 to 0, so the equivalence hypothesis cannot be
  dropped;
- for C = Δ[1] over D = Δ[0], the horn `Λ[2, 0]` with vertices 0, 1, 0 has no filler, and its first edge is not an
  equivalence;
- for S = Δ[0] the prism form is the statement that a natural transformation defined on `∂Δ[n]` whose component at the
  vertex 0 is an equivalence extends over `Δ[n]` from a given source.

*Needs:* §2.3.1 (maps preserve equivalences); §5.1 (Tau Ceti `SSet.Edge.isEquivalence_iff_hornFilling_zero`, HTT,
Prop. 1.2.4.3, p. 52); §3.2.1 (the filtration of `Δ[n] × Δ[1]`); Mathlib `SSet.InnerFibration`,
`SSet.Subcomplex.unionProd`, `SSet.Quasicategory`.

**10.2.3.** Prove the relative pointwise criterion for equivalences (Joyal; for S = Δ[0] and A = ∅ it is the pointwise criterion
for natural equivalences, HTT, Prop. 3.1.2.1 (2), pp. 169–170, over a point, and Kerodon, Thm. 4.4.4.4; `Suggested.lean` declaration
`isEquivalence_fiber_pullbackObjObjπ_iff`). Let
p : X → S be an inner fibration, i : A ⊆ B a monomorphism, (u, v) a vertex of `X^A ×_{S^A} S^B`, and Y the fiber over
(u, v) of the pullback-hom `X^B → X^A ×_{S^A} S^B`. Y is an ∞-category, since the pullback-hom is an inner fibration
(Mathlib `SSet.innerFibration_pullbackObjObjπ`). An edge of Y, that is a map `F : B × Δ[1] → X` over `v ∘ pr` equal
to `u ∘ pr` on `A × Δ[1]`, is an equivalence of Y exactly when for every vertex b of B the edge `F|{b} × Δ[1]` is an
equivalence of the fiber `X_{v(b)}`.

- Consequently the two forms of homotopy relative to A over S of §10.1 agree: two vertices f, f′ of
  Y are equivalent objects of Y exactly when some F as in the explicit form goes from f to f′.
- Moreover, Y is a Kan complex when A contains every vertex of B: then every `F|{b} × Δ[1]` is degenerate, so every
  edge of Y is an equivalence, and §5.1 applies.

The route is cell induction on B, a retraction onto the prism form and the prism form itself.

1. "Only if": evaluation at b is a map `Y → X_{v(b)}`, and maps preserve equivalences (§2.3).
2. "If": by the outer-horn characterization in the ∞-category Y (§5.1), it suffices to extend every `Λ[m, 0] → Y`
   with m ≥ 2 and first edge F to `Δ[m]`. By adjunction this is the extension of a map to X along
   `(A × Δ[m]) ∪ (B × Λ[m, 0]) ⊆ B × Δ[m]`, over `v ∘ pr` against p.
3. Attach the nondegenerate simplices of B outside A one at a time (Mathlib `SSet.relativeCellComplexOfMono`). For a
   k-simplex β of B, the step is an extension along `M = (∂Δ[k] × Δ[m]) ∪ (Δ[k] × Λ[m, 0]) ⊆ N = Δ[k] × Δ[m]`
   against the inner fibration `C = X ×_S Δ[k] → Δ[k]`, the pullback along `v ∘ β`, over the projection N → Δ[k].
   The given map g : M → C sends each edge `{a} × Δ{0,1}` to `F|{β(a)} × Δ[1]`, an equivalence of a fiber.
4. `Λ[m, 0] ⊆ Δ[m]` is a retract of `(Δ[m] × {0}) ∪ (Λ[m, 0] × Δ[1]) ⊆ Δ[m] × Δ[1]`, through s(j) = (j, 1) and
   r(j, 0) = 0, r(j, 1) = j: both are maps of posets, r ∘ s is the identity, and r carries the source into
   `Λ[m, 0]`, since the image under r of a simplex that misses a vertex j₀ ≠ 0 still misses j₀. This is the
   retraction of §3.2 for the horn `Λ[m, 0]`. Hence M ⊆ N is a retract of the prism inclusion
   `(N × {0}) ∪ (M × Δ[1]) ⊆ N × Δ[1]`, and it suffices to extend `g ∘ (id × r)` along it and restrict along
   `id × s`.
5. Extend over the nondegenerate simplices ρ of N outside M one at a time, by the prism form (§10.2.2) for C → Δ[k].
   Such a ρ projects onto Δ[k], and its projection to Δ[m] is Δ[m] or the face opposite 0. So ρ(0) = (0, c) with
   c ∈ {0, 1}, and `g ∘ (id × r)` sends `{ρ(0)} × Δ[1]` to g of the edge from (0, 0) to (0, c): degenerate for c = 0,
   and a fiber equivalence for c = 1. Since m ≥ 2, every vertex of N lies in M, so every ρ has dimension at least 1.

Instances:

- for S = Δ[0], A = ∅ and B = Δ[0] ⊔ Δ[0], Y is X × X, and an edge (φ, ψ) is an equivalence exactly when φ and ψ
  both are; for X = Δ[1], the edge (identity of 0, the nondegenerate edge) is not one, so a condition at a single
  vertex does not suffice;
- for S = Δ[0], B = Δ[1] and A = ∂Δ[1] with u = (x, y), Y is the mapping space `Hom_X(x, y)` of §5.2, which is
  therefore a Kan complex when X is an ∞-category;
- for S = Δ[0], A = ∅, B = Δ[1] and X the nerve of a category D, Y is the nerve of the arrow category of D, and the
  criterion is the classical fact that a natural transformation with invertible components is a natural
  isomorphism.

*Needs:* §2.3.1 (maps preserve equivalences); §5.1.1 (Tau Ceti `SSet.Edge.isEquivalence_iff_hornFilling_zero`, HTT,
Prop. 1.2.4.3, p. 52; Kan complexes, HTT, Prop. 1.2.5.1); the prism form (§10.2.2); §3.2.1 (the retraction of
`Δ[n] × Δ[1]` onto `Δ[n]`); Mathlib `SSet.innerFibration_pullbackObjObjπ`, `SSet.relativeCellComplexOfMono`,
`SSet.Subcomplex.unionProd`, `CategoryTheory.Functor.PullbackObjObj`; Tau Ceti `SSet.fiber`,
`SSet.Edge.IsEquivalence`; §1.2 (functor ∞-categories) and §10.1.1 (HTT, §2.3.3).

**10.2.4.** Prove Joyal's description of the categorical fibrations over an ∞-category (HTT, Cor. 2.4.6.5, p. 155; Kerodon,
Def. 4.5.6.5 and Prop. 4.5.6.1; `Suggested.lean` declaration `categoricalFibration_iff_innerFibration_and_exists_lift`). Let
p : C → D be a map of simplicial sets with D an ∞-category. Then p is a categorical fibration (§9.4) exactly when
(1) p is an inner fibration and (2) for every equivalence `f̄ : d → d′` of D and object c of C with p(c) = d there is
an equivalence `f : c → c′` of C with p(f) = f̄. Over D = Δ[0] this is Joyal's theorem of §9.5.

- **Necessity.** (1) is §9.4. For (2), f̄ lies in the core `D^≃`, a Kan complex (§5.1). Let F be the fiber over d
  of evaluation at 0, `Fun(Δ[1], D^≃) → D^≃`, a trivial fibration (§3.3, the Kan complex `D^≃` being a left
  fibration over Δ[0]); so F is a contractible Kan complex, and `{id_d} ⊆ F` is a categorical equivalence by
  two-out-of-three, trivial fibrations being categorical equivalences (§9.5). Lift evaluation at 1, `F → D`, along
  p with `id_d` sent to c. The composite of f̄ with `min : Δ[1] × Δ[1] → Δ[1]` is an edge of F from `id_d` to f̄
  whose evaluation at 1 is f̄; its image under the lift is an edge f over f̄, an equivalence because every edge of
  the Kan complex F is one (Tau Ceti `SSet.Edge.isEquivalence_of_kanComplex`) and maps preserve equivalences (§2.3).
- **Sufficiency.** C is an ∞-category, since p is inner and D is one. Let A ⊆ B be a monic categorical equivalence,
  `g₀ : A → C` and `g : B → D` with `p ∘ g₀ = g|A`. By Joyal's theorem (§9.5) g₀ extends to `g′ : B → C`. The
  restriction `Fun(B, D) → Fun(A, D)` is a trivial fibration (§9.5), so its fiber over `p ∘ g₀` is a contractible
  Kan complex containing `p ∘ g′` and g, and an edge `H : B × Δ[1] → D` joins them, constant on A. Every
  `H|{b} × Δ[1]` is an equivalence of D, as the image of an edge of a Kan complex under evaluation at b (§2.3). Lift
  H along p, starting at g′ and constant on A, by attaching the nondegenerate simplices of B outside A (Mathlib
  `SSet.relativeCellComplexOfMono`): at a vertex b, lift `H|{b} × Δ[1]` to an equivalence by (2); for an n-simplex,
  n ≥ 1, use the filtration of `Δ[n] × Δ[1]` by `τ_n, …, τ_0` (§3.2), filling inner horns by (1) and the last horn
  `Λ[n + 1, 0]`, whose first edge is the equivalence lifted at the vertex 0, by the relative outer-horn lemma (§10.2.1).
  The end of the lift, at `B × {1}`, solves the lifting problem.

Instances:

- `{0} ⊆ J`, J the nerve of the contractible groupoid on {0, 1}, is an inner fibration but not a categorical
  fibration (§9.4): the equivalence from 0 to 1 of J has no lift starting at 0, so (2) fails;
- For a functor `F : A ⥤ B` of ordinary categories, the nerve of F is a categorical fibration exactly when every
  isomorphism `F a ≅ b` of B is the image of an isomorphism `a ≅ a′` of A: the nerve of B is an ∞-category whose
  equivalences are the isomorphisms, and the nerve of F is always an inner fibration.
- `{0} ⊆ Δ[1]` is a categorical fibration: it is inner, and the only equivalences of Δ[1] are degenerate, so (2)
  holds;
- for D = Δ[0], (2) is automatic and the statement is that inner fibrations to a point, the ∞-categories, are
  fibrant.

*Needs:* §9.4.1; §9.5.2 (Joyal's theorem on fibrant objects), §9.5.3 (restriction maps of functor ∞-categories), §9.5.1 (trivial
fibrations are categorical equivalences); the relative outer-horn lemma (§10.2.1); §3.2.1 (the filtration of
`Δ[n] × Δ[1]`); §3.3.1 (pullback-hom along a left anodyne map); §2.3.1; §5.1.2 (cores are Kan complexes); Tau Ceti
`SSet.core`, `SSet.fiber`, `SSet.Edge.isEquivalence_of_kanComplex`; Mathlib `SSet.InnerFibration`,
`SSet.relativeCellComplexOfMono`.

### 10.3 Minimal inner fibrations

**10.3.1.** Define an inner fibration `p : X ⟶ S` to be minimal when any two n-simplices of X that are homotopic over S relative
to `∂Δ[n]` (§10.1) are equal; an ∞-category is minimal when `C ⟶ Δ[0]` is (HTT, Def. 2.3.3.1,
p. 119). `Suggested.lean` declaration `IsMinimalInnerFibration`, with homotopy relative to `∂Δ[n]` over S in the
explicit form, the `Suggested.lean` declaration `HomotopicRelBoundaryOver`.

- Minimality is stable under base change along any `T ⟶ S`, and p is minimal when its base change along every
  simplex `Δ[n] ⟶ S` is, since a homotopy over S relative to `∂Δ[n]` between two simplices over σ lies over σ ∘ pr
  (HTT, Remark 2.3.3.4, p. 120).
- An inner fibration over `Δ[n]` is minimal exactly when its total space is a minimal ∞-category (HTT,
  Remark 2.3.3.3, p. 120): a homotopy between two maps into it is automatically compatible with the projection.

**Checks.**
- The nerve of a category D is minimal exactly when isomorphic objects of D are equal: for n ≥ 2 two n-simplices of a
  nerve with the same boundary are equal, for n = 1 homotopic edges are equal, and for n = 0 the relation is
  isomorphism. A definition that ignored dimension 0 would call every nerve minimal.
- The nerve J of the free-living isomorphism is not minimal: its vertices 0 and 1 are homotopic relative to
  `∂Δ[0] = ∅` (equivalent objects) but distinct. Its minimal model is Δ[0].
- `Sing` of an interval is not minimal: the constant path and a nonconstant path with the same ends are homotopic
  relative to `∂Δ[1]` but distinct.

*Needs:* Mathlib `SSet.InnerFibration`; §10.1.1 (HTT, §2.3.3, homotopy relative to a subcomplex over
S, in its explicit form).

### 10.4 Minimal models

**10.4.1.** Prove that for an inner fibration `p : X ⟶ S` there are a simplicial subset `X₀ ⊆ X` and a retraction `r : X ⟶ X₀`
over S such that `p|X₀` is a minimal inner fibration and r is homotopic over S to the identity relative to X₀, in
the explicit form of §10.1, equivalently in the fiber form (§10.2, relative pointwise criterion); and
that `X₀ ⊆ X` is a categorical equivalence when S is an ∞-category (HTT, Prop. 2.3.3.8 (1)–(3), and (4) for T = S over
an ∞-category, pp. 121–123). The route is Lurie's, with the prism form of §10.2 where HTT uses coCartesian edges.

- **The relation.** Two n-simplices are homotopic over S relative to `∂Δ[n]` exactly when they are equivalent objects
  of a fiber of the pullback-hom `X^{Δ[n]} → X^{∂Δ[n]} ×_{S^{∂Δ[n]}} S^{Δ[n]}` (§10.1, by the relative pointwise
  criterion of §10.2, which makes the explicit form symmetric: an edge of the fiber is invertible), an inner
  fibration (Mathlib `SSet.innerFibration_pullbackObjObjπ`) whose fibers are therefore ∞-categories; so the relation
  is an equivalence relation. Two related degenerate simplices have the same boundary and are therefore equal, so
  each class contains at most one degenerate simplex. Choose a representative of every class, including every
  degenerate simplex, and let X₀ consist, dimension by dimension, of the representatives whose boundary lies in X₀.
- **(1) X₀ → S is a minimal inner fibration.** Minimality is immediate from the construction. For an inner horn
  `Λ[n, i] → X₀` over `Δ[n] → S`, fill it in X by σ′. The face `d_i σ′` has its boundary in X₀ and is homotopic relative
  to its boundary to a simplex of X₀; with the constant homotopy on the rest of the horn this is a homotopy on
  `∂Δ[n] × Δ[1]` starting at the boundary of σ′, whose edges at the vertices are degenerate. By the prism form of
  §10.2 it extends to a homotopy from σ′ to a simplex σ″ whose boundary lies in X₀, and the representative of the class
  of σ″ lies in X₀ and fills the horn.
- **(2) and (3) the retraction.** Build `h : X × Δ[1] → X` over S, constant on X₀, by transfinite induction over the
  nondegenerate simplices τ of X outside X₀ (Mathlib `SSet.relativeCellComplexOfMono` for `X₀ ⊆ X`). Given h on
  `∂Δ[n] × Δ[1]` for τ, with fiber equivalences at the vertices, the prism form of §10.2 extends it along
  `(Δ[n] × {0}) ∪ (∂Δ[n] × Δ[1])` to a homotopy from τ to a simplex τ′ with boundary in X₀; choose a homotopy over S
  relative to `∂Δ[n]` from τ′ to the representative τ″ in X₀; glue the two along
  `(Δ[n] × Λ[2, 1]) ∪ (∂Δ[n] × Δ[2]) ⊆ Δ[n] × Δ[2]`, which is inner anodyne (§9.1), and restrict to `Δ[n] × Δ{0,2}`. The
  edges at vertices stay fiber equivalences, being composites of fiber equivalences in a fiber. Then r = h|X × {1}.
  So h has exactly the four properties that (4) uses: `h|X × {0}` is the identity, `h|X × {1} = i ∘ r`, h is constant
  on X₀, and every `h|{x} × Δ[1]` is an equivalence of a fiber.
- **(4) over an ∞-category.** X and X₀ are ∞-categories, and it suffices that the inclusion i is essentially surjective
  and fully faithful (§2.6). Each object x is equivalent to r(x) through the fiber equivalence `h|{x} × Δ[1]`. For
  objects a, b of X₀, r restricts to `r_* : Hom^R_X(a, b) → Hom^R_{X₀}(a, b)` with `r_* ∘ i_*` the identity, and it
  remains that `i_* ∘ r_*` is the identity in H. The map `(K × Δ[1]) ⋆ Δ[0] → (K ⋆ Δ[0]) × Δ[1]` that is the inclusion
  on `K × Δ[1]` and sends the cone point to (cone point, 1) turns h, which is constant on a and b, into a homotopy on
  `Hom^R_X(a, b)` from a map Φ₀ to `i_* ∘ r_*`. The map Φ₀ is the restriction along the vertex 1 of a map
  `ζ : Hom^R_X(a, b) → F` into the fiber over a of `X_{/s₀b}`, the slice over the degenerate edge at b, whose
  restriction along the vertex 0 is the identity; restriction along the vertex 0 is a trivial fibration from F with
  the degeneracy as a section, since restriction along the left anodyne vertex 0 is a trivial fibration (§4.3, dual
  form for slices, X an ∞-category); restriction along the vertex 1 is a retraction of the same section, and a
  trivial fibration is a weak homotopy equivalence, so the two restrictions agree in H and Φ₀ is the identity in H.
  With §8.1 this makes i fully faithful.

*Needs:*
- §10.2.2 (prism form); §10.3.1; §9.1.1 (the inner anodyne inclusion `(Δ[n] × Λ[2, 1]) ∪ (∂Δ[n] × Δ[2]) ⊆ Δ[n] × Δ[2]`);
  Mathlib `SSet.innerFibration_pullbackObjObjπ`, `SSet.relativeCellComplexOfMono`.
- For (4): §2.6.4 (categorical equivalences are the fully faithful and essentially surjective maps); §8.1.3 (full
  faithfulness through `Hom^R`); §4.3.2 (restriction along anodyne maps, dual form for slices); §2.3.1; Tau Ceti
  `SSet.slice.homEquiv`, `SSet.rightMappingSpace`, `SSet.Edge.IsEquivalence`; ModelCategoryTheory, Part KanQuillen
  (trivial fibrations are weak homotopy equivalences).
- For the relation and the fiber form of (3): §10.2.3 (relative pointwise criterion).
- §2.1.6 (HTT, Def. 1.1.5.14) and §10.1.1 (HTT, §2.3.3).

### 10.5 Testing categorical equivalences over simplices, and minimal models after base change

**10.5.1.** Prove that for maps `X ⟶ Y ⟶ Z`, the base changes `X ×_Z T ⟶ Y ×_Z T` are categorical equivalences for every `T ⟶ Z`
as soon as they are for every simplex `Δ[n] ⟶ Z` (HTT, Prop. 3.2.2.8, p. 199; `Suggested.lean` declaration
`isCategoricalEquivalence_pullback_map_of_stdSimplex`). The route: by filtered colimits reduce
to T with finitely many nondegenerate simplices, then induct on simplices, attaching a simplex being a homotopy
pushout by left properness of the Joyal structure; base change along `T ⟶ Z` preserves pushouts and monomorphisms.

*Needs:* §9.5.1; §2.1.6 (HTT, Def. 1.1.5.14); ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT,
Def. A.2.4.1), §3.5.1 (HTT, §A.2.4, homotopy pushouts) and §5.5.1 (HTT, Example A.2.6.13).

**10.5.2.** Prove that for an inner fibration `p : X ⟶ S` and the minimal model of §10.4, `X₀ ×_S T ⊆ X ×_S T` is a categorical
equivalence for every `T ⟶ S` (HTT, Prop. 2.3.3.8 (4), p. 122). The route: by §10.5.1 reduce to
simplices, where the base change of `X₀ ⊆ X` along `Δ[n] ⟶ S` is a minimal model over an ∞-category (the restricted
retraction and homotopy have the properties (1)–(3)), and §10.4 (4) applies. Together with §10.4 this is HTT,
Prop. 2.3.3.8, p. 121. `Suggested.lean` declaration `exists_isMinimalInnerFibration` states
§10.4 and this result together, with (3) in the explicit form.

*Needs:* §10.3.1; §10.4.1; §10.5.1 (HTT, Prop. 3.2.2.8).

### 10.6 n-categories and truncated mapping spaces

**10.6.1.** Prove that for a simplicial set S the following are equivalent: the unit `S ⟶ nerve (hoFunctor.obj S)` is an
isomorphism; S is isomorphic to the nerve of a small category; S is a 1-category (HTT, Prop. 2.3.4.5, p. 125;
`Suggested.lean` declaration `tfae_isIso_nerveAdjunction_unit_app`). The
route: the unit is bijective on n-simplices by induction on n, homotopic simplices with the same boundary being equal.
In low dimensions the (−1)-categories are ∅ and Δ[0] (HTT, Example 2.3.4.2, p. 125), and the 0-categories are the
nerves of posets, ordered by existence of a morphism (HTT, Example 2.3.4.3, p. 125).

*Needs:* §1.1 (HTT, §1.2.15, smallness) and §10.1.2 (HTT, Def. 2.3.4.1; §2.3.3); §2.2.1
(HTT, Prop. 1.1.2.2, nerves); Mathlib `CategoryTheory.nerveAdjunction`, `CategoryTheory.nerve`.

**10.6.2.** Prove that for n ≥ −1 an ∞-category C is an n-category exactly when any two maps f, f′ : K → C from a simplicial set
that agree on the n-skeleton up to homotopy relative to the (n − 1)-skeleton are equal (HTT, Prop. 2.3.4.7, p. 126).
The converse direction is immediate (take K a simplex); for the forward one, reduce to K = Δ[m] simplex by simplex and
induct on m: below n there is nothing to show, at m = n the n-category condition applies directly, and above n the
inductive hypothesis makes f and f′ agree on ∂Δ[m], where uniqueness of fillers in degrees above n finishes.

*Needs:* §10.1.2 (HTT, Def. 2.3.4.1; §2.3.3, homotopy relative to a subcomplex).

**10.6.3.** Prove that if C is an n-category, then Fun(X, C) is an n-category for every simplicial set X (HTT, Cor. 2.3.4.8,
p. 126; `Suggested.lean` declaration `isNCategory_ihom`). Fun(X, C) is an ∞-category (Mathlib's `Quasicategory` instance on the internal hom), and a pair of maps
K → Fun(X, C) as in the criterion of §10.6.2 corresponds to a pair K × X → C that agrees on the n-skeleton of K × X up to
homotopy relative to its (n − 1)-skeleton, since the p-skeleton of K × X lies in (p-skeleton of K) × X for every p;
the criterion for C then gives equality.

*Needs:* §10.6.2; §10.1.2 (HTT, Def. 2.3.4.1); Mathlib `SSet.Quasicategory` instance for
`(ihom X).obj C`.

**10.6.4.** Truncated Kan complexes are those of ModelCategoryTheory, Part KanQuillen §5.1 for k ≥ −1, extended by calling a Kan
complex (−2)-truncated when it is contractible (HTT, Def. 2.3.4.15, p. 130; Conventions). For k ≥ 0 the `Suggested.lean`
declaration `IsTruncated` restates Part KanQuillen's definition word for word.

- Truncatedness is invariant under homotopy equivalence of Kan complexes, so it is a property of objects of the
  homotopy category of spaces (HTT, Rem. 2.3.4.16, p. 130): homotopy equivalences induce bijections on π₀ and
  isomorphisms on every `π_i(X, x)`.
- A Kan complex is (−1)-truncated exactly when it is empty or contractible, and 0-truncated exactly when it is
  homotopy equivalent to a discrete simplicial set.

**Checks.**
- ∅ is k-truncated for every k ≥ −1 (there are no vertices) but not (−2)-truncated. A definition that read
  "(−2)-truncated" as "π_i trivial for all i" would wrongly accept ∅.
- `Δ[0] ⊔ Δ[0]` is 0-truncated and not (−1)-truncated: for k = −1 the condition includes i = 0, and π₀ has two
  elements.
- A Kan replacement of `∂Δ[2]` (a circle) has `π₁ ≅ ℤ` and trivial higher groups, so it is 1-truncated but not
  0-truncated. A definition through π₀ alone would call it 0-truncated.

*Needs:* Mathlib `SSet.KanComplex`; Tau Ceti `SSet.KanComplex.π`; ModelCategoryTheory, Part KanQuillen §1.1 (homotopy
groups of Kan complexes), §1.3.1 (homotopy equivalences) and §5.1.1 (truncated Kan complexes).

**10.6.5.** Prove that for an ∞-category C and n ≥ −1 the following are equivalent: some minimal model `C₀ ⊆ C` (§10.4) is an
n-category; C is categorically equivalent to an n-category; every mapping space `Map_C(X, Y)` is (n − 1)-truncated
(HTT, Prop. 2.3.4.18, p. 130; `Suggested.lean` declaration
`exists_isNCategory_iff_isTruncated`, the second and third conditions for n ≥ 1, with `Hom^R` for the mapping
spaces). The route: the first condition implies the second by §10.4. Mapping spaces are
invariant under categorical equivalence, and in an n-category a class in `π_m` of a mapping space, m ≥ n, is an
(m + 1)-simplex with prescribed boundary, hence trivial; the case n = −1 is the description of (−1)-categories. For
the converse, a minimal model C₀ of C has the same mapping spaces. It satisfies the first condition of an
n-category by minimality (§10.3), since both are stated with the explicit form of §10.1 over Δ[0]. For the
second, let m > n and f, f′ : `Δ[m] → C₀` agree on `∂Δ[m]`. A filler g of the map `∂Δ[m + 1] → C₀` with faces
`d_i g = d_i s_m f` for i < m, `d_m g = f′` and `d_(m+1) g = f` gives, on the simplices `τ_0, …, τ_m` of the prism
`Δ[m] × Δ[1]` (§3.2), the homotopy `(s₀f′, …, s_(m−1)f′, g)` from f to f′ relative to `∂Δ[m]`, with degenerate
edges at the vertices; minimality then gives f = f′. The filler exists: the lifting problem against
`∂Δ[m + 1] ⊆ Δ[m + 1]` is transferred to a fibrant simplicial category D with `N(D)` equivalent to C (§9.6,
homotopy extension), where through the cube description of `C[∂Δ[m + 1]]` (§6.1) the obstruction lies in
`π_(m − 1)` of a mapping space of D, which vanishes (ModelCategoryTheory, Part ModelCategories §3.2; HTT,
Prop. A.2.3.1).

*Needs:*
- §9.5.1, §9.5.2; §9.6.1; §3.2.1 (the simplices of the prism); §10.3.1; §10.4.1; §10.6.1 and §10.6.4 (HTT, Example 2.3.4.2;
  Def. 2.3.4.15; Rem. 2.3.4.16).
- §2.1.7 (HTT, Def. 1.2.2.1, mapping objects) and §10.1.2 (HTT, Def. 2.3.4.1; §2.3.3).
- §8.1.1 (HTT, Prop. 2.2.4.1; Thm. 2.2.0.1), §5.2.2 (HTT, Prop. 1.2.2.3) and §6.1.1 (HTT, proof of Thm. 2.2.5.1, boundaries).
- ModelCategoryTheory, Part ModelCategories §3.2.1 (HTT, Prop. A.2.3.1).

### 10.7 Truncated objects and morphisms

**10.7.1.** Define, for k ≥ −2, a map f : X → Y of Kan complexes to be k-truncated when its homotopy fibers over all vertices of Y
are k-truncated, and a morphism f : C → D of an ∞-category C to be k-truncated when for every object E composition
with f is a k-truncated map `Map_C(E, C) → Map_C(E, D)`; a (−1)-truncated morphism is a monomorphism (HTT,
Def. 5.5.6.8, p. 512; Ex. 5.5.6.13, p. 513). Composition with f is the morphism of H given by the H-enriched homotopy
category of C (§2.1), represented by a map of the Kan complexes `Hom^R_C(E, −)` (§5.2, §8.1); its
homotopy fibers are well defined up to homotopy equivalence, so the condition does not depend on the representative.

- A k-truncated map or morphism is (k + 1)-truncated, and truncatedness of morphisms depends only on the class of f in
  the homotopy category of C.
- f is (−2)-truncated exactly when it is an equivalence (HTT, Ex. 5.5.6.13, first assertion, p. 513). The route: a map
  of Kan complexes has contractible homotopy fibers over every vertex exactly when it is a weak homotopy equivalence
  (the long exact sequence and Whitehead's theorem); if composition with f is one for every E, then f is an
  isomorphism of the homotopy category by the Yoneda lemma there, hence an equivalence (§2.3); conversely an
  equivalence induces isomorphisms of mapping objects in H.
- In an ∞-category with a final object 1, an object C is k-truncated in the sense of §10.1 exactly
  when `C → 1` is a k-truncated morphism: every `Map_C(E, 1)` is contractible, and the homotopy fiber of
  `Map_C(E, C) → Map_C(E, 1)` is `Map_C(E, C)`. For k = −2 both sides say that C is final.

**Checks.**

- In S, `Δ[0] → ∂Δ[1]` is a monomorphism (homotopy fibers a point and ∅), while the fold map `∂Δ[1] → Δ[0]` is
  0-truncated and not a monomorphism (homotopy fiber two points).
- In S, `Δ[0] → S¹` is injective on `π₀` but is not a monomorphism: its homotopy fiber is the loop space, discrete with
  `π₀ ≅ ℤ`, so the map is 0-truncated and not (−1)-truncated. A definition by injectivity on `π₀`, or through strict
  fibers, would accept it.
- In the nerve of the ordered set {0 < 1}, the morphism `0 → 1` is a monomorphism and not an equivalence: composition
  with it is `Δ[0] → Δ[0]` at E = 0 and `∅ → Δ[0]` at E = 1, with homotopy fibers contractible or empty. The empty
  homotopy fiber is (−1)-truncated but not (−2)-truncated, which is where the two indices differ.

*Needs:* §2.3.1 (equivalences are the isomorphisms of the homotopy category); §5.2.2 (Kan property of `Hom^R`); §8.1.3
(`Hom^R` represents the mapping objects); §10.6.4 (truncated Kan complexes, k = −2); §2.1.7 (HTT,
Def. 1.2.2.1) and §10.1.3 (HTT, Def. 5.5.6.1); ModelCategoryTheory, Part KanQuillen §1.2.1 (the long exact sequence) and
§1.3.3 (Whitehead's theorem).

**10.7.2.** Prove that for a morphism f : X → Y of an ∞-category C with Y n-truncated (n ≥ −2), X is n-truncated exactly when f is
n-truncated (HTT, Lemma 5.5.6.14, p. 513). The route is Lurie's: for each object E it is the statement that for a map
of Kan complexes `Map_C(E, X) → Map_C(E, Y)` with n-truncated target, the source is n-truncated exactly when the
homotopy fibers are, which is the long exact sequence of homotopy groups. In the boundary cases: for n = −2 the target
is contractible and the homotopy fiber is the source; for n = −1 an empty target forces an empty source, and both
sides hold.

*Needs:* §10.7.1; §10.1.3 (HTT, Def. 5.5.6.1); ModelCategoryTheory, Part KanQuillen §1.2.1
(the long exact sequence) and §5.1.1 (truncated Kan complexes).

### 10.8 Truncated Kan complexes through boundary spheres

**10.8.1.** Prove that a Kan complex X is k-truncated (k ≥ −2) exactly when the map `X → X^{∂Δ[k+2]}` to the space of maps
`∂Δ[k+2] → X`, induced by the constant maps, is a homotopy equivalence (HTT, Lemma 5.5.6.17, p. 514;
for k ≥ 0, `Suggested.lean` declaration `isTruncated_iff_isWeakHomotopyEquivalence`, with a weak homotopy equivalence,
equivalent here since both sides are Kan complexes). For k > −2,
evaluation at a vertex is a Kan fibration `X^{∂Δ[k+2]} → X` left inverse to the constant map, so the condition is that
it is a trivial fibration; its fiber over x is pointed by the constant map, with `π_i ≅ π_{i+k+1}(X, x)` for i ≥ 0
(∂Δ[k+2] is a (k+1)-sphere), and these all vanish exactly when X is k-truncated. For k = −2, `∂Δ[0] = ∅`, the target
is a point and the condition is that X is contractible.

**Checks.**

- For k = −1 the map is the diagonal `X → X × X` (`∂Δ[1]` is two points), a homotopy equivalence exactly when X is
  empty or contractible: for `X = Δ[0] ⊔ Δ[0]` the diagonal misses two of the four vertices.
- For k = 0 and X discrete, every map `∂Δ[2] → X` is constant, so the map is an isomorphism; for X a Kan model of the
  circle, the loop going once around is not homotopic to a constant map of `∂Δ[2]`.
- For k = −2 and X = ∅ the target is a point and the map ∅ → Δ[0] is not a homotopy equivalence, matching the
  convention that ∅ is not (−2)-truncated.

*Needs:* Mathlib `SSet.KanComplex`; Mathlib `SSet.anodyneExtensions_pushoutObjObjι` (evaluation at a vertex is a Kan
fibration); ModelCategoryTheory, Part KanQuillen §1.1 (homotopy groups), §1.3.3 (Whitehead's theorem) and §5.1.1
(truncated Kan complexes).

### Examples

- A Kan complex is minimal over Δ[0] exactly when it is a minimal Kan complex in the classical sense; the minimal
  model of a contractible Kan complex is Δ[0] (§10.4).
- The nerve of a category is a 1-category, and its minimal models are the nerves of its skeleta; an ∞-category with
  discrete mapping spaces is equivalent to the nerve of a category (§10.6).
- In S, the inclusion of a union of path components of a Kan complex is a monomorphism, and the map from a Kan complex
  to a point is k-truncated exactly when the Kan complex is (§10.7).

### Dependencies

Layers 3–5 (left and right fibrations, slices, outer horns), Layer 8 (mapping spaces of rigidifications) and Layer 9
(the inner anodyne generators, the Joyal model structure, its fibrant objects and its comparison with simplicial
categories); §1.1,
§2.1, §7.1 and §10.1; ModelCategoryTheory, Parts ModelCategories and KanQuillen.

## Downstream consumers

This roadmap is used by every later member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  The definitions of Layer 1 and of §2.1, §7.1 and §10.1:
  Def. 1.1.3.6, p. 35, Def. 1.1.4.4, p. 37, Def. 1.1.5.5, p. 40, Def. 1.1.5.14, p. 43, Def. 1.2.2.1, p. 44,
  Notation 1.2.7.2, p. 57, Notation 1.2.8.4, p. 59, Def. 1.2.10.1, p. 61, §1.2.11, p. 62, Def. 1.2.13.4, p. 65,
  §1.2.15, pp. 68–69, Def. 1.2.16.1, p. 69, §2.2.1, pp. 91–92, Def. 2.2.3.2, p. 98, §2.3.3, p. 119, Def. 2.3.4.1,
  p. 124, Def. 3.0.0.1, p. 162, §3.3.2 with Cor. 3.3.2.7, pp. 230–231, §4.4.1–§4.4.2, pp. 312–313, §5.1.3, p. 338,
  Remark 5.3.2.10, p. 411, §5.4.1, p. 441, Def. 5.5.6.1 and Notation 5.5.6.2, p. 511, and Remark A.1.4.3, p. 815.
  Nerves and quasicategories: Prop. 1.1.2.2, p. 27;
  §1.1.3, pp. 33–37; simplicial categories and the coherent nerve: Remark 1.1.5.2, p. 39,
  Example 1.1.5.8, p. 40, Prop. 1.1.5.10, p. 41, Remark 1.1.5.11, p. 42; mapping spaces: §1.2.2, Prop. 1.2.2.3,
  pp. 44–46; the homotopy category: Prop. 1.2.3.1, p. 46; equivalences: §1.2.4, Prop. 1.2.4.1, Prop. 1.2.4.3,
  pp. 51–52; Kan complexes: Props. 1.2.5.1 and 1.2.5.3, p. 53; slices: Props. 1.2.9.2 and 1.2.9.3, pp. 60–61;
  essential surjectivity: Def. 1.2.10.1, p. 61; final objects: Def. 1.2.12.1, Def. 1.2.12.3, Prop. 1.2.12.4,
  Cor. 1.2.12.5, Remark 1.2.12.6, Prop. 1.2.12.9, pp. 62–64; colimits: Remarks 1.2.13.5 and 1.2.13.7, Prop. 1.2.13.8,
  pp. 65–66; the ∞-category of spaces: Def. 1.2.16.1, p. 69; lifting classes: Examples 2.0.0.1 and 2.0.0.2, p. 71; left
  fibrations: Lemma 2.1.1.4, Props. 2.1.1.5 and 2.1.1.6, pp. 76–77; Joyal's theory of left anodyne maps and slices:
  Prop. 2.1.2.1 through Prop. 2.1.2.11, pp. 78–83; left fibrations over Kan complexes: Prop. 2.1.3.1,
  Lemmas 2.1.3.2–2.1.3.4, p. 84; the covariant model structure: Defs. 2.1.4.2 and 2.1.4.5, Lemma 2.1.4.6,
  Props. 2.1.4.7–2.1.4.10, Remark 2.1.4.12, pp. 86–89; the comparison theorem: Thm. 2.2.0.1, p. 90; straightening:
  §2.2.1, Prop. 2.2.1.1, Thm. 2.2.1.2, pp. 91–92; the twisted realization: §2.2.2, Remark 2.2.2.6, Props. 2.2.2.7 and
  2.2.2.9, Cor. 2.2.2.10, Remark 2.2.2.11, Prop. 2.2.2.13, pp. 94–96; right fibrations and unstraightening:
  Lemmas 2.2.3.1–2.2.3.10, Prop. 2.2.3.11, Cors. 2.2.3.12 and 2.2.3.13, Prop. 2.2.3.15, pp. 97–105; the mapping-space
  comparison: Prop. 2.2.4.1, p. 106; the Joyal model structure: Thm. 2.2.5.1, Lemma 2.2.5.2, Cors. 2.2.5.4 and 2.2.5.6,
  Remark 2.2.5.5, pp. 107–111; left homotopy and Joyal's form of categorical equivalences: Props. 2.2.5.7 and
  2.2.5.8, pp. 111–112; inner anodyne maps: Prop. 2.3.2.1, Cors. 2.3.2.2 and 2.3.2.5, pp. 117–119; minimal
  fibrations: Def. 2.3.3.1, Remarks 2.3.3.3 and 2.3.3.4, Prop. 2.3.3.8, pp. 119–123; n-categories: Def. 2.3.4.1,
  Examples 2.3.4.2 and 2.3.4.3, Prop. 2.3.4.5, Prop. 2.3.4.7, Cor. 2.3.4.8, Def. 2.3.4.15, Rem. 2.3.4.16,
  Prop. 2.3.4.18, pp. 124–130; equivalences and coCartesian edges: Remark 2.4.1.4, Prop. 2.4.1.5, Prop. 2.4.1.8,
  pp. 134–136; the fibrant objects of the Joyal structure: Lemma 2.4.5.1, Thm. 2.4.6.1, Lemmas 2.4.6.2–2.4.6.4 and
  Cor. 2.4.6.5, pp. 152–155; the pointwise criterion: Prop. 3.1.2.1 (2), pp. 169–170; testing over simplices: Prop. 3.2.2.8, p. 199;
  right fibrations classified by maps to the opposite of spaces: §3.3.2, Props. 3.3.2.5 and 3.3.2.6, p. 230,
  Cor. 3.3.2.8, p. 231, and their use in Prop. 3.3.4.5, p. 237; truncated morphisms: Def. 5.5.6.8, Ex. 5.5.6.13,
  Lemmas 5.5.6.14 and 5.5.6.17, pp. 512–514; the Kan–Quillen model structure: §A.2.7, pp. 846–847.
- **Kerodon.** Jacob Lurie, *Kerodon*, an online resource for homotopy-coherent mathematics,
  [kerodon.net](https://kerodon.net). The pointwise criterion for natural isomorphisms: Thm. 4.4.4.4; categorical
  equivalences: Def. 4.5.4.1 and Prop. 4.5.4.8; isofibrations and categorical fibrations: Def. 4.5.6.5 and
  Prop. 4.5.6.1.
