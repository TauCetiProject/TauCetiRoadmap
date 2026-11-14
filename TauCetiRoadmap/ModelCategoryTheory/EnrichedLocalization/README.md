# Roadmap: localization of enriched categories, Bousfield localization and Dugger's theorem

**Summary.** This Part computes maps, localizations and homotopy (co)limits in the model category `Cat_S` of
small S-enriched categories, and localizes simplicial model categories.

It builds on Part SimplicialCategories, whose model structure on `Cat_S` and enriched diagram model structures it
uses throughout.

- **Maps in the homotopy category (Layer 1).** Maps in `hCat_S` are computed through chunks and path objects, so
  that S-enriched functors into fibrant-cofibrant objects are represented by enriched diagrams.
- **Localization and homotopy (co)limits (Layer 2).** Inverting morphisms of S-enriched categories; homotopy
  colimits over posets through the Grothendieck construction; homotopy limits in `Cat_S`; homotopy colimits of
  simplicial categories with a fixed object set.
- **Bousfield localization (Layer 3).** Left Bousfield localizations of left proper combinatorial simplicial model
  categories, and Dugger's presentation theorem.
- **Weak exponentials (Layer 4).** Weak exponentials and their description through mapping spaces; diagram
  categories turn homotopy colimits of indexing categories into homotopy limits.

**Headline theorems.**
- Representability of maps in `hCat_S` (HTT, Prop. A.3.4.12, p. 907, and Cor. A.3.4.14, p. 908).
- Tensor products of S-enriched categories commute with homotopy colimits (HTT, Thm. A.3.5.15, p. 914).
- Existence of the localized model structure (HTT, Prop. A.3.7.3, p. 926).
- Dugger's presentation theorem (Dugger, *Combinatorial model categories have presentations*, Thm. 1.1 and
  Cor. 1.2, as used in the proof of HTT, Prop. A.3.7.6, p. 930).
- Diagram categories turn homotopy colimits into homotopy limits (HTT, Cor. A.3.6.18, p. 923).

## Scope and ownership

Already in the library, and cited rather than planned (see Exact supplier contracts): Mathlib's
model categories, lifting properties, enriched categories, closed monoidal structures and Kan
extensions; Tau Ceti's weak homotopy equivalences, the category of enriched categories, tensor
products of enriched categories and weak contractibility.

Left to other roadmaps: model categories, Quillen adjunctions, combinatorial and left proper model
categories, Smith's theorem, transfer, the projective and Reedy model structures are Part
ModelCategories'; the Kan–Quillen model structure and Kan's `Ex^∞` are Part KanQuillen's;
simplicial model categories, homotopy limits and Kan extensions in diagram categories, the model
structure on `Cat_S`, excellent model categories and enriched diagram model structures are Part
SimplicialCategories'. Quasicategories, the coherent nerve and presentable ∞-categories are later
Parts of the InfinityCategoryTheory family.

## Conventions

Locators such as (HTT, Prop. A.3.2.4, p. 876) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.1.2` here and `Part EnrichedLocalization §2.1.2` elsewhere,
is one target.

The conventions of Part SimplicialCategories hold here: model categories are Mathlib's; the weak
equivalences of simplicial sets are Tau Ceti `SSet.IsWeakHomotopyEquivalence`; `Cat_S`, `[0]_S`,
`[1]_S`, `[1]_K`, `[1]^∼_S`, `hC` and the enriched diagram category `A^C` are as defined there
(Part SimplicialCategories §2.1, §5.2, §5.6). The rows below fix what is new here.

- **Fibrant-cofibrant objects.** For a model category A, `A°` is the full subcategory of fibrant and
  cofibrant objects; for a combinatorial S-enriched model category it is S-enriched with objects one
  universe up, and statements in `hCat_S` involving `A°` and a small C are made in that universe.
  Check: for A simplicial sets, `A°` is the simplicial category `Kan` of Kan complexes; `∂Δ[1]` is
  an object of it, `Λ[2,1]` is not.
- **Excellence.** S is an excellent model category (Part SimplicialCategories §5.6) wherever `Cat_S`
  is used with its model structure, so that fibrant S-enriched categories are the locally fibrant
  ones (Part SimplicialCategories §5.8).
  Check: for S simplicial sets, `[1]_{Δ[0]}` is fibrant and `[1]_{Λ[2,1]}` is not.
- **Homotopy classes.** `Hom_{hCat_S}(C, D)` is the set of maps in the homotopy category of `Cat_S`;
  for C cofibrant and D fibrant it is the set of homotopy classes of S-enriched functors.
  Check: for S simplicial sets, `Hom_{hCat_S}([0]_S, D)` is the set of isomorphism classes of objects
  of the underlying category of `hD`: for D = `[1]^∼_S` it is a point, for `D = [0]_S ⊔ [0]_S` it
  has two elements.
- **Direction of localization.** `C[W⁻¹]` receives a functor from C; a left Bousfield localization
  `S⁻¹A` has the cofibrations of A and more weak equivalences, so its identity functor from A is left
  Quillen.
  Check: for W empty `C[W⁻¹] = C`, and for S empty `S⁻¹A = A`.
- **Letters in Layer 4.** There the model category is M and the indexing poset is A, so that a
  diagram reads `F : A → M`.
  Check: for A the empty poset a diagram `A → M` is unique, and its colimit is the initial object of M.

## Exact supplier contracts

### From Mathlib

- `HomotopicalAlgebra.ModelCategory` with `cofibrations`, `fibrations`, `weakEquivalences`,
  `IsCofibrant`, `IsFibrant` (`Mathlib/AlgebraicTopology/ModelCategory/`).
- `CategoryTheory.EnrichedCategory`, `EnrichedFunctor` (`CategoryTheory/Enriched/Basic.lean`);
  `CategoryTheory.IsLocallyPresentable`; `MorphismProperty.llp`, `rlp`,
  `MorphismProperty.HasSmallObjectArgument`, `MorphismProperty.IsSmall`,
  `MorphismProperty.monomorphisms`.
- `CategoryTheory.IsPushout` (`CategoryTheory/Limits/Shapes/Pullback/IsPullback/Defs.lean`) and
  `CategoryTheory.MonoidalCategory.Arrow.pushoutProduct` (`CategoryTheory/Monoidal/PushoutProduct.lean`):
  pushout squares and pushout-products of maps, in the left properness and pushout-product conditions of §3.2.
- `CategoryTheory.MonoidalClosed.pre` for the internal mapping objects of simplicial sets in §3.1;
  `SSet.KanComplex`.
- `CategoryTheory.Functor.lan`, `Functor.ran` and comma categories for the cosimplicial resolutions
  of Layer 3.
- `HomotopicalAlgebra.ReedyStructure`, `SimplexCategory.reedyStructure`.
- `SSet.stdSimplex` and `SSet.boundary` (`Δ[n]`, `∂Δ[n]`), for the skeletal induction of §4.2.

### From Tau Ceti

- `SSet.IsWeakHomotopyEquivalence` (`TauCeti/AlgebraicTopology/SimplicialSet/WeakHomotopyEquivalence.lean`)
  and `SSet.IsWeaklyContractible` (`SimplicialSet/WeaklyContractible.lean`).
- `CategoryTheory.EnrichedCat.category` (`TauCeti/CategoryTheory/Enriched/EnrichedCat.lean`), the
  carrier of `Cat_S`, and `TauCeti.tensorEnrichedCategory`
  (`TauCeti/CategoryTheory/Enriched/TensorProduct.lean`), the tensor product `C ⊗ D`.

### From TauCetiRoadmap.ModelCategoryTheory.ModelCategories

Part ModelCategories supplies, cited by section: κ-compact objects and presentable categories
(§1.1, §1.2: HTT, Def. A.1.1.1, Def. A.1.1.2); weakly saturated classes and the small object
argument (§1.3, §1.4: HTT, Def. A.1.2.2, Prop. A.1.2.5 (1)); homotopy relations and homotopy lifting
(§3.1, §3.2: HTT, Prop. A.2.2.1, Prop. A.2.3.1); left properness and homotopy pushouts (§3.4:
HTT, Def. A.2.4.1; §3.5: HTT, Prop. A.2.4.4); Quillen adjunctions and equivalences (§4.1: HTT,
§A.2.5; §4.2: HTT, Prop. A.2.5.1); accessibility (§5.1: HTT, Def. A.2.6.2; §5.4: HTT,
Cor. A.2.6.7); combinatorial model categories (§6.1: HTT, Def. A.2.6.1, Cor. A.2.6.8); Smith's
theorem and its perfect-class form (§6.3: HTT, Prop. A.2.6.10, Prop. A.2.6.15); the transfer theorem
and the path-object criterion (§6.4); the projective structure (§7.2: HTT, Prop. A.2.8.2); the
Reedy model structure (§7.7: HTT, Prop. A.2.9.19); coends (§8.3: HTT, §A.2.9, after
Cor. A.2.9.25); tensored categories (§8.2: the definitions before HTT, Ex. A.1.4.5).

### From TauCetiRoadmap.ModelCategoryTheory.KanQuillen

Part KanQuillen supplies Kan's `Ex^∞` as a functorial Kan replacement preserving finite limits
(§2.2) and the Kan–Quillen model structure with the weak homotopy equivalences and its standard
properties (§3.2, HTT, §A.2.7), among them that its homotopy category is that of Kan complexes up to
simplicial homotopy, so that homotopy classes of maps from all simplicial sets detect homotopy
equivalences of Kan complexes (§3.2, with the Yoneda lemma in the homotopy category).

### From TauCetiRoadmap.ModelCategoryTheory.SimplicialCategories

Part SimplicialCategories supplies, cited by section: simplicial and enriched model categories and
their recognition (§1.2–§1.4); the injective model structure and homotopy limits and Kan
extensions (§2.6, §3.2–§3.4); weak equivalences, generators, cell attachments and the model
structure of `Cat_S` (§5.1–§5.4); equivalences and local fibrations (§5.5); the invertibility
hypothesis and excellence (§5.6, §5.7); fibrant objects and fibrations (§5.8); enriched diagram
model structures, their functoriality and invariance and enriched homotopy Kan extensions (§2.1,
§6.1–§6.4).

## How to read the build

Layer 1 computes maps in `hCat_S` through chunks and path objects. Layer 2 inverts morphisms of
S-enriched categories and computes homotopy colimits over posets, homotopy limits in `Cat_S` and
sifted homotopy colimits with a fixed object set. Layer 3 constructs Bousfield localizations and
proves Dugger's theorems. Layer 4 defines weak exponentials, describes them through mapping spaces in
simplicial model categories, and combines all of these for the homotopy limit theorem for diagram
categories.

## Layer 1: Chunks and maps in the homotopy category of `Cat_S`

### 1.1 Chunks and C-chunks

**1.1.1.** Define, for an excellent S and a combinatorial S-enriched model category A, a chunk of A: a full
subcategory U such that (a) for an object X of U and a finite family `X → B_i` in U the product map
`X → ∏ B_i` factors as a trivial cofibration `X → X̄` followed by a fibration with `X̄` in U, and (b)
for a finite family `B_i → X` in U the coproduct map `∐ B_i → X` factors as a cofibration followed by
a trivial fibration through an object of U, both functorially through S-enriched functors;
`U° = A° ∩ U`; two chunks are equivalent when they have the same essential image in `hA`
(HTT, Def. A.3.4.1, p. 903).

- `U°` is a full S-enriched subcategory of `A°`, so its mapping objects are those of A.
- A chunk has replacements inside it: S-enriched functors `R, Q : U → U` with natural maps
  `X → R X`, a trivial cofibration with `R X` fibrant, and `Q X → X`, a trivial fibration with `Q X`
  cofibrant (HTT, Rem. A.3.4.2, p. 903): clause (a) for the empty family, whose product is the
  terminal object, gives R, and clause (b) for the empty family, whose coproduct is the initial
  object, gives Q; `R ∘ Q` lands in `U°`.
- Equivalence of chunks is an equivalence relation, and depends only on the essential images.

**Checks.**

- For A simplicial sets, the full subcategory of Kan complexes is a chunk with `U° = U`: in (a) the
  middle object of a factorization of `X → ∏ B_i` maps to the Kan complex `∏ B_i` by a fibration, and
  in (b) it maps to the Kan complex X by a trivial fibration, so it is a Kan complex in both cases,
  and the small object argument makes the factorizations functorial.
- The empty full subcategory is a chunk (all conditions are vacuous), and `U° = ∅`.
- The full subcategory `{Δ[0]}` of simplicial sets is not a chunk: clause (a) holds, with `X̄ = Δ[0]`,
  but the coproduct map `Δ[0] ⊔ Δ[0] → Δ[0]` needs a cofibration from `Δ[0] ⊔ Δ[0]` into an object of
  U, impossible since `Δ[0] ⊔ Δ[0] → Δ[0]` is not a monomorphism; a definition with only clause (a)
  would accept it.
- Equivalence of chunks: in simplicial sets the chunk of Kan complexes and the chunk of all
  simplicial sets are equivalent, every object being weakly equivalent to a Kan complex, although
  they differ as subcategories; the chunk `{∅}` is not equivalent to the empty chunk, since `[∅]`
  lies in its image.

*Needs:* Part SimplicialCategories §1.3.1, §5.1.1, §5.6.2 (excellence); Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)), §6.1.1 (HTT, Def. A.2.6.1).

**1.1.2.** Prove that for an excellent S, every combinatorial S-enriched model category A is a chunk of itself
(HTT, Ex. A.3.4.4, p. 903). Route: A is a full subcategory of itself containing every middle object,
so only the S-enriched functoriality of the factorizations needs proof. This is the enriched small
object argument (Riehl, Cor. 13.2.4, p. 178): A is cofibrantly generated and locally presentable,
and `K ⊗ −` is left Quillen for every K in S, because the tensor is a left Quillen bifunctor (Part
SimplicialCategories §1.3) and every object of S is cofibrant (axiom (A2) of Part SimplicialCategories
§5.6). The S-enriched factorization of arrows, composed with the S-enriched functors taking a finite
family `{X → B_i}` to its product map and `{B_i → X}` to its coproduct map, gives (a) and (b).

*Needs:* §1.1.1; Part SimplicialCategories §1.3.1, §5.6.2 (axiom (A2)); Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)), §6.1.1 (HTT, Def. A.2.6.1); Riehl, Cor. 13.2.4 (enriched small object argument).

**1.1.3.** Prove two closure properties of chunks. (a) For a chunk U and a family `{X_α}` of objects of A, the
full subcategory V of U on the objects isomorphic in `hA` to some `X_α` is a chunk (HTT, Ex. A.3.4.5,
p. 904). (b) For equivalent chunks `U ⊆ U'` of A, the inclusion `U° ⊆ U'°` is a weak equivalence of
S-enriched categories (HTT, Rem. A.3.4.3, p. 903). Route: for (a), in clause (a) the middle object
receives a trivial cofibration from the object X of V, and in clause (b) it maps to X by a trivial
fibration; either way it is isomorphic to `[X]` in `hA`, so it lies in V, and the S-enriched
functors restrict to V because V is full. For (b), the inclusion is the identity on mapping objects.
For essential surjectivity, an object X' of `U'°` is isomorphic in `hA` to an object of U, and the
replacements `R ∘ Q` make it isomorphic to an object X of `U°`. For X cofibrant and Y fibrant, the
derived adjunction of the left Quillen functor `− ⊗ X : S → A` (the tensor is a left Quillen
bifunctor and the unit `𝟙_S` is cofibrant) identifies `Hom_hS(𝟙_S, Map_A(X, Y))` with `Hom_hA(X, Y)`,
compatibly with composition, so `[X] ≅ [X']` is an isomorphism in the underlying category of the
homotopy category of `U'°`.

*Needs:* §1.1.1; Mathlib `HomotopicalAlgebra.ModelCategory`; Part SimplicialCategories §1.2.1 (the unit is cofibrant), §1.3.1, §5.1.1 (HTT, Def. A.3.2.1); Part ModelCategories §4.1.1 (HTT, §A.2.5, derived functors of a Quillen adjunction).

**1.1.4.** Define, for an S-enriched category C, a C-chunk of A: a chunk U such that `U^C`, the S-enriched functors
`C → A` with values in U, is a chunk of `A^C` with the projective structure (HTT, Def. A.3.4.9, p. 906); here `A^C` is a combinatorial
S-enriched model category by Part SimplicialCategories §6.1 (HTT, Prop. A.3.3.2; Rem. A.3.3.4).

- A C-chunk is a chunk of A, and `U^C` is a chunk of `A^C`, so `(U^C)°` and the equivalence of chunks
  are defined for it; being a C-chunk depends on C only up to isomorphism of S-enriched categories.

**Checks.**

- A itself is a C-chunk for every small C, since `A^C` is a chunk of itself (§1.1.2, HTT, Ex. A.3.4.4,
  applied to the combinatorial S-enriched `A^C` of Part SimplicialCategories §6.1).
- For C empty every chunk is a C-chunk, `A^C` being the terminal category; for C = `[0]_S`,
  `U^C = U` and the C-chunks are the chunks.
- A chunk need not be a C-chunk. For A simplicial sets, the Kan complexes with countably many
  simplices form a chunk (the small object argument on countable generating sets keeps objects
  countable). Let C have one object whose endomorphism monoid is the free monoid K on an uncountable
  set, as a discrete simplicial set. The point with trivial K-action lies in `U^C`, and clause (b)
  for the empty family asks for a projectively cofibrant Z with a trivial fibration `Z → Δ[0]`; such
  a Z is nonempty with a free K-action (cancellation in K), hence uncountable, so U is not a
  C-chunk. A definition calling every chunk a C-chunk would accept it.
- For A simplicial sets and C with one object whose endomorphism monoid is the free monoid K on one
  generator, as a discrete simplicial set, the Kan complexes with countably many simplices form a
  C-chunk: the projective factorizations by the small object argument on the countably many
  generators `K × ∂Δ[n] → K × Δ[n]` and `K × Λ^n_k → K × Δ[n]` keep values countable, and their middle
  objects are Kan complexes as in the chunk Checks. With K free on an uncountable set they do not
  (previous Check).
- For A simplicial sets and C = `[1]_K` with K an uncountable discrete simplicial set, the countable
  Kan complexes are not a C-chunk: with X, Y the objects of `[1]_K`, a projectively cofibrant Z with a
  trivial fibration to the terminal diagram has `Z(X)` nonempty and `K × Z(X) ⊆ Z(Y)`, so `Z(Y)` is
  uncountable and clause (b) for the empty family fails. C has only identity
  endomorphisms, so a definition testing endomorphism monoids alone would accept it.

*Needs:* §1.1.1, §1.1.2 (HTT, Ex. A.3.4.4); Part SimplicialCategories §6.1.1.

**1.1.5.** Prove that chunks exist in abundance. (a) For a small family of small cofibrant S-enriched
categories `C_α` and a small full subcategory U of A, there is a small full subcategory `V ⊇ U` that
is a `C_α`-chunk for every α, with the same essential image in `hA` as U (HTT, Lemma A.3.4.15,
p. 908). (b) Every small S-enriched category C admits a weak equivalence `C → U°` for a chunk U of
some combinatorial S-enriched model category A (HTT, Lemma A.3.4.6, p. 904). Route: for (a), choose
functorial factorizations in A and in each `A^{C_α}` (projective structure: a projective trivial
cofibration followed by a projective fibration, and a projective cofibration followed by a
projective trivial fibration), and close U under them by a sequence of full subcategories of length
κ, for κ regular with every `C_α` κ-small. For (b), replace C by a fibrant one (Part
SimplicialCategories §5.4), hence locally fibrant (Part SimplicialCategories §5.8); embed it in `A°`
for `A = S^{Cᵒᵖ}` with the projective structure by the enriched Yoneda embedding, and enlarge it to a
chunk with the same image in `hA` by (a).

*Needs:* §1.1.1, §1.1.4; Part SimplicialCategories §5.1.1, §5.4.2, §5.8.1, §6.1.1; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §1.1.1 (HTT, Def. A.1.1.1), §6.1.1 (HTT, Def. A.2.6.1).

### 1.2 Path objects and homotopy classes of functors into `U°`

**1.2.1.** Define, for a chunk U, the path category `P(U)`: the S-enriched category of fibrations `A → B × C` with
A, B, C in `U°` and both composites `A → B`, `A → C` weak equivalences, with mapping objects the
evident pullbacks of mapping objects of A; the S-enriched functors `π, π' : P(U) → U°` taking B and C;
and `τ : U° → P(U)` taking A to a functorial factorization `A → Ā → A × A` of the diagonal into a
trivial cofibration and a fibration (HTT, Notation A.3.4.7, p. 904, and Thm. A.3.4.8, the
construction, p. 904).

- π, π' and τ are S-enriched functors with `π ∘ τ = π' ∘ τ = id`, so τ is a common section of π and
  π'.

**Checks.**

- For U the Kan complexes and Z = `Ex^∞ S¹`, the diagonal `Z → Z × Z` has both composites identities
  but is not a fibration (next Check), so it is not an object of `P(U)`; a definition dropping the
  fibration clause would accept it.
- For Z = `Ex^∞ S¹` the diagonal `Z → Z × Z` is not a Kan fibration (its fibers are points, so the
  long exact sequence would make `π₁ Z = ℤ → ℤ × ℤ` surjective), so τ(Z) must be a path object such as `Z^{Δ[1]}`; a definition taking
  τ to be the diagonal fails here, while for Z = `∂Δ[1]` the diagonal is already a fibration.
- For U the chunk of all of A with A simplicial sets, the object `Δ[0] → Δ[0] × Δ[0]` (the diagonal,
  a fibration) lies in `P(U)`, while `Δ[0] → ∂Δ[1] × Δ[0]` does not, since `Δ[0] → ∂Δ[1]` is not a
  weak equivalence.
- For U empty, `P(U)` is empty.

*Needs:* §1.1.1; Part SimplicialCategories §1.3.1.

**1.2.2.** Prove that π, π' and τ make `P(U)` a path object for `U°` in `Cat_S`: π is a weak equivalence of
S-enriched categories, hence so is τ, and `π × π' : P(U) → U° × U°` is a fibration
(HTT, Thm. A.3.4.8, p. 904, with its proof, pp. 905–906). Route: π is essentially surjective because
of τ, and fully faithful by comparing four homotopy pullback squares of mapping objects (Part
ModelCategories §3.5); τ is a section of π, so two out of three applies. For the fibration, by Part
SimplicialCategories §5.8 it suffices that `π × π'` is a local fibration; its maps of mapping objects
are base changes of `Map_A(A, A') → Map_A(A, B' × C')`, fibrations since A is cofibrant and
`A' → B' × C'` a fibration; the quasi-fibration clause lifts a pair of weak equivalences by
factoring in the chunk, using that π is a weak equivalence.

*Needs:* §1.2.1; Part SimplicialCategories §1.3.1, §5.1.1, §5.4.2, §5.5.2, §5.6.2 (excellence), §5.8.3; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §3.1.1 (HTT, Prop. A.2.2.1), §3.5.3 (HTT, Prop. A.2.4.4), §6.1.1 (HTT, Def. A.2.6.1).

**1.2.3.** Prove when two functors into `U°` agree in `hCat_S`. (a) For a small cofibrant S-enriched category
C, a C-chunk U and `f, f' : C → U°`, the classes `[f]` and `[f']` in `Hom_{hCat_S}(C, U°)` coincide
exactly when f and f' are weakly equivalent as objects of `A^C` (HTT, Lemma A.3.4.10, p. 906).
(b) For an S-enriched functor `f : C → C'` inducing weak equivalences on all mapping objects and any
S-enriched D, composition with f is injective on `Hom_{hCat_S}(D, −)`, with image the classes `[g]`
whose essential image in `hC'` lies in that of f (HTT, Cor. A.3.4.11, p. 907). Route: for (a), a
homotopy through the path object of §1.2.2 gives a zigzag of weak equivalences of diagrams; conversely a
zigzag through a projectively cofibrant diagram in `U^C` gives a functor to `P(U)`, since `U°` is
fibrant (Part SimplicialCategories §5.8) and C cofibrant. For (b), by §1.1 (b) assume `C' = U°`; the
objects weakly equivalent to the image of f form a chunk V (§1.1, HTT, Ex. A.3.4.5) with `C → V°` a weak
equivalence; enlarge to D-chunks (§1.1 (a)), which changes `U°` and `V°` only by weak equivalences (§1.1, HTT,
Rem. A.3.4.3), and apply (a).

*Needs:* §1.1.1, §1.1.3, §1.1.4, §1.1.5, §1.2.1, §1.2.2; Part SimplicialCategories §2.1.1, §5.1.1, §5.4.2, §5.6.2, §5.8.3, §6.1.1; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §3.1.1 (HTT, Prop. A.2.2.1), §6.1.1 (HTT, Def. A.2.6.1).

### 1.3 Diagram categories represent maps in `hCat_S`

**1.3.1.** Prove the representability theorem, for an excellent S, a combinatorial S-enriched model category
A and small S-enriched categories C and D. (a) Sending a bifibrant object of `A^C` to the
S-enriched functor `C → A°` it determines induces a bijection from weak equivalence classes of
objects of `A^C` to `Hom_{hCat_S}(C, A°)` (HTT, Prop. A.3.4.12 and the construction before it,
p. 907). (b) The evaluation `(A^C)° ⊗ C → A°` (with Tau Ceti's tensor product of enriched
categories) induces bijections `Hom_{hCat_S}(D, (A^C)°) → Hom_{hCat_S}(C ⊗ D, A°)` (HTT,
Prop. A.3.4.13, p. 908). (c) For a C-chunk U, the evaluation `(U^C)° ⊗ C → U°` induces bijections
`Hom_{hCat_S}(D, (U^C)°) → Hom_{hCat_S}(C ⊗ D, U°)` (HTT, Cor. A.3.4.14, p. 908); this small form is
the one used outside this Part. Route: for (a), by Part SimplicialCategories §6.3 assume C cofibrant;
injectivity is §1.2 (a) for the chunk A of itself (§1.1, HTT, Ex. A.3.4.4, applied to A and to `A^C`); surjectivity by a projectively cofibrant
replacement of a representing functor, which is weakly equivalent to it. For (b), both sides are
weak equivalence classes of objects of `A^{C ⊗ D}` by (a), using `(A^C)^D = A^{C ⊗ D}`. For (c),
combine (b) with §1.2 (b).

*Needs:* §1.1.2, §1.1.4, §1.2.3; Part SimplicialCategories §5.6.2, §5.8.3, §6.1.1, §6.3.1; Tau Ceti `TauCeti.tensorEnrichedCategory`; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1).

### Examples

- For A simplicial sets and C = `[0]_S`, §1.3 says that `Hom_{hCat_S}([0]_S, Kan)` is the set of weak
  homotopy types of simplicial sets.
- For C = `[1]_S`, weak equivalence classes of maps of simplicial sets correspond to homotopy classes
  of functors `[1]_S → Kan`.
- `U = A` is a chunk of A (§1.1), and `P(A)` is a path object for `A°` (§1.2).
- For A simplicial sets, the Kan complexes weakly equivalent to `Δ[0]` or to `∂Δ[1]` form a chunk
  (§1.1, HTT, Ex. A.3.4.5); its fibrant-cofibrant part has two isomorphism classes of objects in its
  homotopy category, while the full subcategory `{Δ[0], ∂Δ[1]}` is not a chunk (the Check of §1.1
  on coproduct maps applies to it).

### Dependencies

Part SimplicialCategories, Layers 5 and 6; Tau Ceti tensor products of enriched categories; Part
ModelCategories (κ-small closures, homotopy pullbacks); the enriched small object argument (Riehl).

## Layer 2: Localization and homotopy (co)limits of S-enriched categories

In this layer S is excellent.

### 2.1 Inverting morphisms

**2.1.1.** Define, after fixing a factorization `[1]_S → E → [1]^∼_S` into a cofibration and a weak equivalence,
for an S-enriched category C and a map of sets `W → Hom_{Cat_S}([1]_S, C)`, the S-enriched category
`C[W⁻¹]` as the pushout of `∐_W E ← ∐_W [1]_S → C` (HTT, Notation A.3.5.1, p. 909).

- `C ↦ C[W⁻¹]` preserves weak equivalences, by left properness of `Cat_S` (HTT, Rem. A.3.5.2, p. 910).
- For W a single morphism this is the `C[f⁻¹]` of Part SimplicialCategories §5.6.

**Checks.**

- For W empty, `C[W⁻¹] = C`.
- For S simplicial sets and C = `BN`, one object with mapping simplicial set the discrete monoid ℕ, and W = {1}, `C[W⁻¹]`
  is weakly equivalent to `Bℤ`, with `π₀ Map = ℤ`; collapsing along `[1]_S → [0]_S` instead of
  gluing in E would give `[0]_S`.
- For C = `[1]_S` and W its non-identity morphism, `C[W⁻¹]` is weakly equivalent to `[1]^∼_S`, hence to
  `[0]_S`; for W containing an identity morphism, inverting it changes nothing up to weak
  equivalence (the identity is an equivalence and the invertibility hypothesis applies).

*Needs:* Part SimplicialCategories §5.2.2, §5.4.2 (the model structure, left properness), §5.6.1 (`[1]^∼_S`); Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1), §3.5.2 (HTT, Prop. A.2.4.4).

**2.1.2.** Prove the universal property of `C[W⁻¹]`. (a) For fibrant C and a morphism f classified by
`[1]_S → C`, f is an equivalence exactly when this map extends along `[1]_S → E` (HTT, Lemma A.3.5.3,
p. 910). (b) For `f₀ : C → D` with D fibrant, `f₀` extends to `C[W⁻¹] → D` exactly when it carries
each element of W to an equivalence of D (HTT, Lemma A.3.5.4, p. 910). (c) For S-enriched categories
C and D, restriction `Hom_{hCat_S}(C[W⁻¹], D) → Hom_{hCat_S}(C, D)` is injective, with image the
classes whose functor `hC → hD` carries W to isomorphisms (HTT, Prop. A.3.5.5, p. 911). Route: for
(a), every morphism of E is an equivalence; conversely the extension exists when
`C → C ⊔_{[1]_S} E` has a left inverse, which holds for fibrant C since that map is a trivial
cofibration by the invertibility hypothesis. (b) is (a) for each element of W. For (c), assume C
cofibrant and D fibrant; the image is (b); for injectivity, make two extensions agree on C by
homotopy lifting (Part ModelCategories §3.2), and use that `C[(W ⊔ W)⁻¹] ≅ C[W⁻¹] ⊔_C C[W⁻¹]` is a
cylinder object for `C[W⁻¹]` in `(Cat_S)_{C/}`, by the invertibility hypothesis.

*Needs:* §2.1.1; Part SimplicialCategories §5.1.1, §5.4.2, §5.5.2, §5.6.1; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §3.1.1 (HTT, Prop. A.2.2.1), §3.2.1 (HTT, Prop. A.2.3.1).

**2.1.3.** Prove that for an S-enriched functor `f : C → D` with categorical mapping cylinder M (objects those of C
and of D, mapping objects those of C and D, `Map_M(X, Y) = Map_D(fX, Y)` for X in C and Y in D, `∅` from
D to C) and a set W of morphisms of M sent to identities by the retraction `j : M → D` and containing
for each object C the morphism `C → fC` classifying `id_{fC}`, the induced `M[W⁻¹] → D` is a weak
equivalence (HTT, Lemma A.3.5.6, p. 911). Route: it suffices that composition with j is bijective on
`Hom_{hCat_S}(−, A)` for every S-enriched A; reduce to `A = U°` for a chunk (§1.1, §1.2), then compare
through the universal property of §2.1.2 and the representability of §1.3.

*Needs:* §1.1.4, §1.1.5, §1.2.3, §1.3.1, §2.1.1, §2.1.2; Part SimplicialCategories §2.1.1; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1).

**2.1.4.** Prove that localization commutes with tensor products: for small S-enriched C and D and a set W of
morphisms of C, with `W'` the morphisms `w ⊗ id_D` of `C ⊗ D`, the map `(C ⊗ D)[W'⁻¹] → C[W⁻¹] ⊗ D`
is a weak equivalence (HTT, Lemma A.3.5.14, p. 914). Route: test on `Hom_{hCat_S}(−, A)`; reduce to
`A = U°` for a chunk (§1.1, §1.2); then chain the bijections of §1.3 and of the universal property
of §2.1.2.

*Needs:* §1.1.4, §1.1.5, §1.2.3, §1.3.1, §2.1.1, §2.1.2; Part SimplicialCategories §5.1.1; Tau Ceti `TauCeti.tensorEnrichedCategory`; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1).

### 2.2 Homotopy colimits over posets: filtrations, the Grothendieck construction and tensor products

**2.2.1.** Define, for a poset A, an A-filtered S-enriched category: an S-enriched category C with
`r : Ob(C) → A` such that `Map_C(X, Y)` is initial whenever `r(X) ≰ r(Y)`; `C_{≤a}` is the full
subcategory on the objects with `r ≤ a` (HTT, Def. A.3.5.7, p. 912).

- For W a set of morphisms of C and `W_a` those lying in `C_{≤a}`, `a ↦ C_{≤a}[W_a⁻¹]` is a diagram
  `χ_W : A → Cat_S` with `colim χ_W ≅ C[W⁻¹]` (HTT, Rem. A.3.5.8, p. 912).
- Full subcategories and the subcategories `C_{≤a}` of an A-filtered category are A-filtered.

**Checks.**

- For A a point, every S-enriched category is A-filtered and `C_{≤∗} = C`.
- `[1]_K` is filtered over `{0 < 1}` with `r(X) = 0`, `r(Y) = 1`, but not with `r(X) = 1`, `r(Y) = 0`
  unless `K = ∅`, since `Map(X, Y) = K` must then be initial; the walking isomorphism `[1]^∼_S` is not
  `{0 < 1}`-filtered in any non-constant way.
- For A discrete, an A-filtered C is a coproduct of the `C_{≤a}`, so the colimit of `χ_W` is a coproduct.

*Needs:* §2.1.1.

**2.2.2.** Prove that the isomorphism `colim χ_W ≅ C[W⁻¹]` exhibits `C[W⁻¹]` as a homotopy colimit of `χ_W`
(HTT, Prop. A.3.5.10, p. 913). Route: first find an S-enriched functor `C' → C`, bijective on
objects and a trivial fibration on every mapping object, such that the A-filtration of C induces one
on `C'` and `a ↦ C'_{≤a}` is projectively cofibrant as a diagram `A → Cat_S` (HTT, Lemma A.3.5.9,
p. 912), by the small object argument for the generators of Part SimplicialCategories §5.2, run
compatibly with the filtration; with a lift of W, `χ'_W → χ_W` is a projectively cofibrant
replacement, and `C'[W⁻¹] → C[W⁻¹]` is a weak equivalence by §2.1.

*Needs:* §2.1.1, §2.2.1; Part SimplicialCategories §2.6.2, §3.2.1, §5.1.1, §5.2.2 (generators), §5.4.2; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion).

**2.2.3.** Define, for a poset A and a diagram `p : A → Cat_S`, `a ↦ C_a`, the Grothendieck construction `Groth(p)`:
objects `(a, C)` with C in `C_a`, mapping objects `Map_{C_{a'}}(p^{a'}_a C, C')` for `a ≤ a'` and `∅` otherwise,
A-filtered by `r(a, C) = a`; `W(p)` is the set of morphisms `(a, C) → (a', p^{a'}_a C)` corresponding to identities,
for `a ≤ a'`, so it contains the identities of `Groth(p)`; `π_a : Groth(p)_{≤a} → C_a` sends `(a', C)` to `p^a_{a'} C`
(HTT, Def. A.3.5.11, p. 913, and the paragraph after it). The API: a natural transformation `p → q` induces `Groth(p)
→ Groth(q)` over A, carrying the transport morphisms of `W(p)` to those of `W(q)` and respecting identities and
composition; each `π_a` is an S-enriched functor carrying `W(p)_{≤a}` to identities; and the projections commute with
the transition functors after restriction.

**Checks.**

- For A a point, `Groth(p) = C_∗` and `W(p)` consists of identities.
- For A = `{0 < 1}` and `p` the identity of `[0]_S`, `Groth(p)` is `[1]_S` and `W(p)` consists of its two identities
  and its non-identity morphism, so `Groth(p)[W(p)⁻¹]` is weakly equivalent to `[0]_S`, the homotopy colimit of a
  constant diagram on a contractible poset; a construction with mapping objects in both directions would give
  `[1]^∼_S` and a non-filtered category.
- For A discrete, `Groth(p)` is the coproduct of the `C_a`.

*Needs:* §2.1.1, §2.2.1.

**2.2.4.** Prove that the Grothendieck construction computes homotopy colimits: for each a,
`π_a : Groth(p)_{≤a}[W(p)_a⁻¹] → C_a` is a weak equivalence (HTT, Lemma A.3.5.12, p. 914), and there
is a canonical isomorphism `Groth(p)[W(p)⁻¹] ≅ hocolim(p)` in `hCat_S` (HTT, Lemma A.3.5.13,
p. 914). Route: the first assertion is a case of the mapping cylinder statement §2.1.3; the second
combines it with the homotopy colimit statement §2.2.2.

*Needs:* §2.1.1, §2.1.3, §2.2.2, §2.2.3; Mathlib `HomotopicalAlgebra.ModelCategory`.

**2.2.5.** Prove that for a poset A and an S-enriched D, `C ↦ C ⊗ D` commutes with A-indexed homotopy colimits:
for projectively cofibrant `p : A → Cat_S`, the isomorphism `colim(p ⊗ D) ≅ (colim p) ⊗ D` exhibits
`(colim p) ⊗ D` as a homotopy colimit of `p ⊗ D` (HTT, Thm. A.3.5.15, p. 914). Route: by §2.2.4
it suffices that `Groth(p ⊗ D)[W(p ⊗ D)⁻¹] → Groth(p)[W(p)⁻¹] ⊗ D` is a weak equivalence,
a case of the tensor product statement §2.1.4.

*Needs:* §2.1.1, §2.1.4, §2.2.4; Part SimplicialCategories §2.6.2, §3.2.1, §5.1.1; Tau Ceti `TauCeti.tensorEnrichedCategory`; Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective assertion).

### 2.3 Homotopy limits in `Cat_S`

**2.3.1.** Prove that homotopy limits in `Cat_S` are detected on mapping objects, for a small category J and a
diagram `{C_J}` in `Cat_S`. (a) If a family `f_J : C → C_J` exhibits C as a homotopy limit, then for
all objects X, Y of C the maps `Map_C(X, Y) → Map_{C_J}(f_J X, f_J Y)` exhibit `Map_C(X, Y)` as a
homotopy limit in S (HTT, Prop. A.3.2.27, p. 887). (b) Given S-enriched functors
`D → C → lim C_J` (β then α) with `α ∘ β` exhibiting D as a homotopy limit, α exhibits C as a
homotopy limit exactly when it does so on every mapping object (HTT, Cor. A.3.2.28, p. 887). Route:
for (a), assume `{C_J}` injectively fibrant and C its limit; injective fibrancy of the
mapping-object diagram follows by lifting against `[1]_{F(J)} → [1]_{F'(J)}` for injective trivial
cofibrations `F → F'` of diagrams in S. For (b), one direction is (a); for the other, reduce to an
injectively fibrant diagram; by (a) for `lim C_J`, α is fully faithful on homotopy categories, and
essentially surjective because `α ∘ β` is.

*Needs:* Part SimplicialCategories §2.6.1, §3.2.1, §5.1.1, §5.2.2 (generators), §5.4.2, §5.6.2; Mathlib `HomotopicalAlgebra.ModelCategory`.

### 2.4 Simplicial categories with a fixed object set and their sifted homotopy colimits

**2.4.1.** Define, for a set O, the category `Cat_{Δ,O}` of simplicial categories with object set O and simplicial
functors that are the identity on objects, identified with monoids in O × O-graphs of simplicial sets
under the matrix product `(X ⊗ Y)_{s,t} = ∐_r X_{s,r} × Y_{r,t}`, and construct on it the model
structure transferred along the free–forgetful adjunction from the objectwise Kan–Quillen structure on
graphs: weak equivalences and fibrations are the functors that are weak equivalences, respectively Kan
fibrations, on every mapping simplicial set (Dwyer–Kan, *Simplicial localizations of categories*, §7;
the input to the proof of HA Lemma 1.3.4.10, pp. 111–112). Route: the transfer theorem with the
path-object criterion (Part ModelCategories §6.4), from the projective structure on graphs (Part
ModelCategories §7.2); apply `Ex^∞` and `(−)^{Δ[1]}` to every mapping simplicial set. Both preserve
finite products, so they act on `Cat_{Δ,O}`, giving a fibrant replacement and path objects created
by the forgetful functor.

- The forgetful functor from `Cat_{Δ,O}` to O × O-graphs is right Quillen and creates weak
  equivalences and fibrations; an object is fibrant exactly when every mapping simplicial set is a
  Kan complex.

**Checks.**

- For O = {s, t} the matrix product has `(X ⊗ Y)_{s,t} = X_{s,s} × Y_{s,t} ⊔ X_{s,t} × Y_{t,t}`; the
  levelwise product `X_{s,t} × Y_{s,t}` would not encode composition, although for a single point both
  give simplicial monoids.
- For O empty, `Cat_{Δ,O}` is the terminal category.
- For O = {s, t} and C with all four mapping simplicial sets `Δ[0]`, the swap `s ↔ t` is an
  isomorphism of simplicial categories but not a morphism of `Cat_{Δ,O}`; a definition allowing
  functors bijective on objects would accept it.
- A map in `Cat_{Δ,{s,t}}` that is a weak equivalence on `Map(s, t)` but not on `Map(s, s)` is not a
  weak equivalence; a definition testing only the off-diagonal mapping objects would accept it.

*Needs:* Part SimplicialCategories §1.2.3 (simplicial sets satisfy (A1)–(A4)); Part KanQuillen §2.2.1 (`Ex^∞` preserves finite limits), §3.2.1; Part ModelCategories §6.4.3 (transfer, path-object criterion), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion).

**2.4.2.** Prove that the functor `Cat_{Δ,O} → (Cat_Δ)_{O/}`, with O the discrete simplicial category, is left
Quillen for the model structure induced by Part SimplicialCategories §5.4 on the undercategory and
preserves weak equivalences (the comparison in the proof of HA Lemma 1.3.4.10, pp. 111–112). Route:
the free map on `∂Δ[n] ⊆ Δ[n]` at `(s, t)` goes to a pushout of `[1]_{∂Δ[n]} → [1]_{Δ[n]}`, and weak
equivalences of `Cat_{Δ,O}` are bijective on objects and weak equivalences on mapping objects.

*Needs:* §2.4.1; Part SimplicialCategories §5.1.1, §5.2.2 (generators), §5.4.2; Part ModelCategories §4.1.1 (HTT, §A.2.5).

**2.4.3.** Define a small category J to be homotopy sifted when it is nonempty and for every pair of objects a, b
the category of cospans `a → c ← b` has weakly contractible nerve; this is hypothesis (3) of HA,
Lemma 1.3.4.10, p. 111.

- Homotopy siftedness is invariant under equivalence of categories, and `J × J'` is homotopy sifted
  when J and J' are: its cospan categories are products of those of J and J', and the nerve of a
  product of weakly contractible categories is weakly contractible.

**Checks.**

- A category with a terminal object is homotopy sifted (each cospan category has a terminal object);
  the discrete category on two objects is not (the cospan category from one object to the other is
  empty).
- `Δᵒᵖ` is homotopy sifted: its category of cospans from `[m]` to `[n]` is the opposite of the
  category of simplices of `Δ[m] × Δ[n]`, whose nerve is weakly equivalent to the contractible
  `Δ[m] × Δ[n]`: the diagram `σ ↦ Δ[k]` on the category of simplices is Reedy cofibrant and
  objectwise weakly contractible, its colimit `Δ[m] × Δ[n]` is a homotopy colimit by the colimit
  lemma of Part KanQuillen §3.5, and the nerve is a homotopy colimit of the constant diagram at
  `Δ[0]` by (i) of the cofinality statement §2.4.4. The pushout shape `{1 ← 0 → 2}` is not
  homotopy sifted: the category of cospans from 1 to 2 is empty.
- The empty category is excluded by nonemptiness, although its cospan condition is vacuous.

*Needs:* Tau Ceti `SSet.IsWeaklyContractible`; Part KanQuillen §3.5.2 (for the Checks).

**2.4.4.** Prove that restriction along a homotopy cofinal functor preserves homotopy colimits: for a functor
`δ : J → J'` of small categories such that for every object j' of J' the comma category `j' ↓ δ`
(pairs of an object j of J and a map `j' → δ(j)`) has weakly contractible nerve, a projectively
cofibrant `X : J' → SSet` and a projectively cofibrant replacement `Y → δ^* X`, the composite
`colim Y → colim δ^* X → colim X` is a weak homotopy equivalence (the model-categorical form, for
nerves, of the cofinality criterion of HTT, Thm. 4.1.3.1). Route: (i) for a small category E, the
diagram `e ↦ N(E ↓ e)` of nerves of over-categories is projectively cofibrant, its n-skeleton being
attached to the previous one along the free maps on `∂Δ[n] ⊆ Δ[n]` at the targets `e_n` of the
nondegenerate n-simplices `e₀ → ⋯ → e_n` of N(E); it is objectwise weakly contractible (each
`E ↓ e` has a terminal object, Part KanQuillen §3.6 (3)) and has colimit N(E), so N(E) is a homotopy
colimit of the constant diagram at `Δ[0]`. (ii) For a functor `P : J → Set`, regarded as discrete
simplicial sets, with category of elements `π : el P → J`, a discrete opfibration, `π_!` is left
Quillen for the projective structures (Part SimplicialCategories §3.1) and computed fiberwise as
coproducts, `(π_! G)(j)` the coproduct of the `G(j, x)` over `x ∈ P(j)` (the fiber inclusion
`π⁻¹(j) → π ↓ j` has a left adjoint by opcartesian transport, hence is final), so `π_!` of the diagram of (i) for `E = el P` is a projectively cofibrant
replacement of `π_! Δ[0] = P`, with colimit `N(el P)`; the same holds after taking products with a
simplicial set K, which preserves projective cofibrations. (iii) For the free diagram
`X = J'(j', −) × K`, `δ^* X = J'(j', δ(−)) × K` has category of elements `j' ↓ δ`, so by (ii) the
composite is the projection `N(j' ↓ δ) × K → K`, a weak homotopy equivalence by hypothesis. (iv)
The projectively cofibrant X for which the composite is a weak homotopy equivalence are closed under
retracts, under pushouts along the free maps on `∂Δ[n] ⊆ Δ[n]` (`δ^*` preserves pushouts and sends
projective cofibrations to monomorphisms, so the restricted square is a homotopy pushout in the
injective structure, by Part ModelCategories §3.5, every object being injectively cofibrant; a
projectively cofibrant resolution of the span is also an injective one, projective cofibrations being
injective ones (Part SimplicialCategories §2.6), so it is a homotopy pushout in the projective
structure too, and the left Quillen `colim` carries the resolved square to a homotopy pushout of
simplicial sets; the target square is a pushout along a monomorphism, and the cube lemma of Part
ModelCategories §3.5 compares the two) and under transfinite composites of such pushouts (choose the replacements as a
chain of projective cofibrations; weak homotopy equivalences are stable under filtered colimits, Part
KanQuillen §3.3); by (iii) and the cell description of projectively cofibrant diagrams (Part
ModelCategories §1.4, §1.5, §7.2) they are all projectively cofibrant X. The choice of Y does not
matter, since colimits of projectively cofibrant diagrams preserve objectwise weak equivalences.

*Needs:* Part SimplicialCategories §1.2.2, §2.6.2, §3.1.1, §3.2.1; Part KanQuillen §3.3.1, §3.6.1; Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)), §1.5.1, §1.5.2, §3.5.1, §3.5.2 (HTT, Prop. A.2.4.4), §4.1.1 (HTT, §A.2.5), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion); Mathlib `CategoryTheory.nerve`; Tau Ceti `SSet.IsWeaklyContractible`.

**2.4.5.** Prove that for a homotopy sifted J and diagrams `u, v : J → SSet`, the map from a homotopy colimit of
`α ↦ u(α) × v(α)` to the product of homotopy colimits of u and v is a weak equivalence (the input of
HA, Lemma 4.1.8.13, to the proof of HA Lemma 1.3.4.10, p. 112). In particular a homotopy colimit
X of the constant diagram at `Δ[0]` over J is weakly contractible, so homotopy sifted homotopy
colimits commute with all finite products, the empty one included (HTT, Prop. 5.5.8.7, p. 525, for
`N(J)`). Route: take u and v projectively
cofibrant; then the external product `u ⊠ v` on `J × J` is projectively cofibrant: the
pushout-product of two generating projective cofibrations is one, and for a fixed generator g the
maps i with `i □ g` a projective cofibration form a weakly saturated class (Part ModelCategories
§1.3), because `− ⊠ −` preserves colimits in each variable, so that, applied in each variable in
turn, `(∅ → u) □ (∅ → v) = (∅ → u ⊠ v)` is a projective cofibration; and its colimit is `colim u × colim v` because the
product of simplicial sets preserves colimits in each variable and weak equivalences between
cofibrant objects (Part SimplicialCategories §1.2), so the right side is a homotopy colimit of `u ⊠ v`
over `J × J` (Part SimplicialCategories §3.2). The left side is the homotopy colimit of the
restriction of `u ⊠ v` along the diagonal `δ : J → J × J`; the comma category of δ under `(a, b)`
is the category of cospans `a → c ← b`, weakly contractible by hypothesis, so §2.4.4
applies to δ and `X = u ⊠ v`. For the constant diagram, X is nonempty because J is, and the diagonal
`X → X × X` is a weak equivalence, so every homotopy group of X at every base point and `π₀ X` are
trivial.

*Needs:* §2.4.3, §2.4.4; Part SimplicialCategories §1.2.2, §3.2.1; Part KanQuillen §3.2.1; Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion); Tau Ceti `SSet.IsWeaklyContractible`.

**2.4.6.** Prove that homotopy sifted homotopy colimits in `Cat_{Δ,O}` are computed on mapping simplicial sets
and are homotopy colimits in `Cat_Δ` (HA, proof of Lemma 1.3.4.10, pp. 111–112). (a) For a homotopy
sifted J and `u : J → Cat_{Δ,O}`, a map `θ : colim u → C` exhibits C as a homotopy colimit of u in
`Cat_{Δ,O}` exactly when for all `s, t` in O the maps `colim_α Map_{u(α)}(s, t) → Map_C(s, t)` exhibit
`Map_C(s, t)` as a homotopy colimit in simplicial sets (the replacement for HA Lemma 4.1.8.13 in the
proof of HA Lemma 1.3.4.10, p. 112). (b) For J with weakly contractible nerve, a homotopy colimit in
`(Cat_Δ)_{O/}` is a homotopy colimit in `Cat_Δ` of the underlying diagram (the comparison in the
proof of HA Lemma 1.3.4.10, p. 112). Route for (a), Lurie's argument (HA, proof of Lemma 4.1.8.13, pp. 498–501) written for
`Gr_O = Fun(O × O, SSet)`, in which every object is cofibrant and the cofibrations are the
objectwise monomorphisms. Let θ be the forgetful functor `Cat_{Δ,O} → Gr_O` and T its left adjoint,
`T X = ∐_k X^{⊗k}`. (1) J-indexed colimits of simplicial sets commute with finite products: for
diagrams of sets this is `π₀` of §2.4.5, and the simplicial case holds levelwise.
Since `⊗` is built from coproducts and finite products, T commutes with J-indexed colimits, so θ
creates them. As θ also creates weak equivalences, it suffices to show that `colim θA` is a
homotopy colimit of `θA` for every projectively cofibrant `A : J → Cat_{Δ,O}` (projective
structure of Part ModelCategories §7.2). (2) Call `X : J → Gr_O` good when `colim X` is a homotopy
colimit of X, and call a map `X → Y` good when X and Y are good, `X → Y` is an objectwise
monomorphism and `colim X → colim Y` is a monomorphism. Good maps are stable under pushout along a
map to a good object and under transfinite composition. A pushout along an objectwise monomorphism
is a homotopy pushout in the injective structure (Part ModelCategories §3.5), hence after projective
replacement (Part SimplicialCategories §2.6). Its colimit is a pushout along a monomorphism, and the
cube lemma compares the two; for composites use filtered colimits of weak equivalences (Part
KanQuillen §3.3). (3) Constant diagrams are good: by (i)–(ii) of the cofinality statement §2.4.4, a
homotopy colimit of the constant diagram at K is `N(J) × K`, and `N(J)` is weakly contractible by
§2.4.5. Projectively cofibrant diagrams and projective cofibrations between them are
good. (4) If X and Y are good, so is `X ⊗ Y`: its homotopy colimit is that of a coproduct of
products, and §2.4.5 with (1) identifies it with `colim X ⊗ colim Y =
colim (X ⊗ Y)`. Hence for good maps f and g the pushout-product `f □ g` for `⊗` is good: it is an
objectwise monomorphism, colim carries it to the pushout-product of monomorphisms, and its source is
good by (2) and (4). (5) A projectively cofibrant A is a retract of a transfinite composite of
pushouts along `T(f)`, with f a projective cofibration of `Fun(J, Gr_O)` (Part ModelCategories §1.4,
§1.5). The initial diagram, constant at the discrete O, is good by (3). For a pushout
`B = B' ⊔_{T X'} T X` along `T(f)`, the underlying graph `θB` is the colimit of a sequence starting
at `θB'` whose k-th step is a pushout of the iterated pushout-product `g □ f □ g □ ⋯ □ f □ g`, with
k factors f and `g : ∅ → θB'`. These are the words of Part SimplicialCategories §5.3, with the cell
`K → L` replaced by the graph monomorphism f and the routes there unchanged. So, inducting along the
cell presentation with (2)–(4), `θA` is good. For (b), the homotopy colimit over J of the constant
diagram at O is O when J has weakly contractible nerve.

*Needs:* §2.4.1, §2.4.2, §2.4.3, §2.4.4, §2.4.5; Part SimplicialCategories §2.6.2, §3.1.1, §3.2.1, §5.3; Part KanQuillen §3.2.1, §3.3.1; Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)), §1.5.1, §1.5.2, §3.5.1, §3.5.2 (HTT, Prop. A.2.4.4), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion); Tau Ceti `SSet.IsWeaklyContractible`.

### Examples

- For W the set of all morphisms of `[1]_S`, `[1]_S[W⁻¹]` is weakly equivalent to `[0]_S` (§2.1).
- `Groth` of the constant diagram on `{0 < 1}` at C is the tensor product `C ⊗ [1]_S`, and inverting
  `W(p)` gives an S-enriched category weakly equivalent to C (§2.2).
- For J = `Δᵒᵖ` and the simplicial object `T_• C` of HA, §2.4 reduces homotopy colimits to mapping
  spaces.

### Dependencies

Layer 1; Part SimplicialCategories, Layers 5 and 6; Part ModelCategories (left properness, homotopy
lifting, transfer); Part KanQuillen; Dwyer–Kan for fixed object sets.

## Layer 3: Bousfield localization and Dugger's theorem

### 3.1 Local objects and local equivalences

**3.1.1.** Define, for two model structures A and A' on one category, that A' is a (left Bousfield) localization of
A when they have the same cofibrations and every weak equivalence of A is one of A' (so every fibration
of A' is one of A); and for a simplicial model category A, with `hA` enriched over the homotopy category
H of spaces by `Map_hA(X, Y) = [Map_A(X, Y)]` for X cofibrant and Y fibrant, and a class S of morphisms
of `hA` (or of A): an object Z is S-local when `Map_hA(Y, Z) → Map_hA(X, Z)` is an isomorphism in H for
every `X → Y` in S, and a morphism is an S-equivalence when it induces such isomorphisms for every
S-local Z (HTT, §A.3.7, the definitions before Lemma A.3.7.1, pp. 923–924). For A simplicial sets
every object is cofibrant, so a simplicial set Z is a fibrant S-local object, `IsLocal`, exactly when
it is a Kan complex and restriction
`Map(Y, Z) → Map(X, Z)` of internal mapping objects is a weak homotopy equivalence for every
`X → Y` in S, and `localEquivalences` are the maps inducing weak homotopy equivalences on
`Map(−, Z)` for every such Z.

- S-local objects are closed under weak equivalence, every weak equivalence of A is an
  S-equivalence, and S-equivalences satisfy two out of three, all because the definitions depend
  only on `hA` and its H-enrichment.

**Checks.**

- For S empty every object is S-local and the S-equivalences are the weak equivalences of A, so
  `S⁻¹A = A` in §3.2.
- For A simplicial sets and S = `{∂Δ[1] ⊆ Δ[1]}`, a Kan complex Z is S-local exactly when
  `Map(Δ[1], Z) → Z × Z`, equivalently the diagonal `Z → Z × Z`, is a weak equivalence, that is,
  when Z is empty or weakly contractible. For
  `Z = Ex^∞ S¹` with `S¹ = Δ[1]/∂Δ[1]`, `π₀ Z → π₀(Z × Z)` is a bijection but `π₁` gives the
  non-surjective diagonal `ℤ → ℤ × ℤ`, so Z is not S-local; a definition testing only components of
  mapping spaces would call it local.
- For S = `{∅ ⊆ Δ[0]}`, Z is S-local exactly when it is weakly contractible: the empty Kan complex,
  local for `{∂Δ[1] ⊆ Δ[1]}`, is not local here.
- S-equivalences: every weak equivalence of A is one. For S = `{∂Δ[1] ⊆ Δ[1]}`, `∂Δ[1] → Δ[0]` is
  one (both mapping spaces are ∅ for Z = ∅ and contractible otherwise), while `∅ → Δ[0]` is not:
  for the local `Z = ∅`, `Map(Δ[0], ∅) = ∅ → Map(∅, ∅) = Δ[0]` is not a weak equivalence. For
  S = `{∅ ⊆ Δ[0]}` every map is an S-equivalence, `∅ → Δ[0]` included, since every mapping space
  into a weakly contractible Kan complex is contractible.
- Localization: A is a localization of itself; the Kan–Quillen structure on simplicial sets is a
  localization of the Joyal structure, while the Joyal structure is not one of the Kan–Quillen
  structure, `Δ[1] → Δ[0]` being a weak homotopy equivalence and not a categorical equivalence; for
  C = [1] the injective structure on `Fun([1], SSet)` is not a localization of the projective one
  although the weak equivalences agree: the diagram `Δ[0] ⊔ Δ[0] → Δ[0]` is injectively but not
  projectively cofibrant, its map not being a monomorphism (Part SimplicialCategories §2.1).

*Needs:* Part SimplicialCategories §1.3.1; Mathlib `HomotopicalAlgebra.ModelCategory`, `MonoidalClosed.pre`, `SSet.KanComplex`; Part KanQuillen §3.2.1.

**3.1.2.** Prove that for a left proper simplicial model category A, a class S of morphisms of `hA` and a
cofibration `i : A → B`, i is an S-equivalence exactly when `Map_A(B, X) → Map_A(A, X)` is a trivial
Kan fibration for every fibrant S-local X (HTT, Lemma A.3.7.1, p. 924). Route: replace i by a
cofibration between cofibrant objects using left properness; the map of mapping spaces is a Kan
fibration, and it is a weak equivalence exactly when i is an S-equivalence; a Kan fibration that is a
weak equivalence is a trivial fibration.

*Needs:* §3.1.1; Part SimplicialCategories §1.3.1; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1); Part KanQuillen §3.2.1.

### 3.2 The localized model structure

**3.2.1.** Prove that for a left proper combinatorial simplicial model category A and a small set S of
cofibrations, the cofibrations of A and the S-equivalences form a combinatorial simplicial model
structure `S⁻¹A` on the same category, left proper, whose fibrant objects are the fibrant S-local
objects of A (HTT, Prop. A.3.7.3, p. 926). For A simplicial sets with the Kan–Quillen structure and S
a small set of monomorphisms this is `exists_localizedModelCategory`, which states the
weak equivalences, cofibrations and fibrant objects together with left properness, the
pushout-product axiom over simplicial sets and a small set of generating trivial cofibrations.

Route (HTT, Prop. A.3.7.3, proof, pp. 927–928): enlarge S to contain the pushout-products of its
members with `∂Δ[n] ⊆ Δ[n]` and a set of generating trivial cofibrations of A. Then:
- an object is fibrant and S-local exactly when it has the extension property against S (§3.1), so
  the small object argument on S (Part ModelCategories §1.4) gives a functor T with a natural
  factorization `X → T X → ∗`, `X → T X` an S-equivalence and `T X` fibrant and S-local, T commuting
  with κ-filtered colimits for large κ, and a map is an S-equivalence exactly when its image under T
  is a weak equivalence;
- the cofibrations that are S-equivalences form a weakly saturated class, stable under pushout along
  cofibrations: by §3.1 they are the cofibrations with the left lifting property against the
  mapping-space trivial fibration tests at fibrant S-local objects, and left properness gives
  stability under pushouts;
- the S-equivalences form an accessible subcategory of the arrow category of A and have the two out
  of three property, being the preimage of the weak equivalences under the accessible functor T
  (Part ModelCategories §5.4);
- Smith's recognition theorem (Part ModelCategories §6.3) assembles the model structure;
  simpliciality: for a cofibration i of A and a monomorphism j of simplicial sets, `i □ j` is a
  cofibration by the axiom for A; if i is an S-equivalence, then for every fibrant S-local X the map
  `Map(i □ j, X)` is the pullback-power of the trivial Kan fibration `Map(i, X)` (§3.1, lifting
  criterion) with j, hence a trivial Kan fibration, so `i □ j` is an S-equivalence by §3.1; if j is
  anodyne, `i □ j` is a trivial cofibration of A, hence an S-equivalence; left properness from that of A; the fibrant objects
  by the extension property against S.

*Needs:* §3.1.1, §3.1.2; Part SimplicialCategories §1.3.1; Mathlib `HomotopicalAlgebra.ModelCategory`, `MorphismProperty.IsSmall`, `MorphismProperty.monomorphisms`, `MorphismProperty.llp`, `MorphismProperty.rlp`, `IsPushout`, `MonoidalCategory.Arrow.pushoutProduct`; Tau Ceti `SSet.IsWeakHomotopyEquivalence`; Part ModelCategories §1.1.1 (HTT, Def. A.1.1.1), §1.3.1 (HTT, Def. A.1.2.2), §1.4.1 (HTT, Prop. A.1.2.5 (1)), §3.4.1 (HTT, Def. A.2.4.1), §5.1.1 (HTT, Def. A.2.6.2), §5.4.1 (HTT, Cor. A.2.6.7), §6.1.1 (HTT, Def. A.2.6.1, Cor. A.2.6.8), §6.3.1 (HTT, Prop. A.2.6.10); Part KanQuillen §3.2.1.

### 3.3 Universality of simplicial presheaves

**3.3.1.** Prove that every functor `γ : C → M` from a small category into a model category has a cosimplicial
resolution: a functor `Γ : C × Δ → M`, Reedy cofibrant and homotopically constant in the cosimplicial
variable, with a natural weak equivalence `Γ(c, •) → γ(c)` to the constant cosimplicial object; any
two resolutions are connected by weak equivalences (Dugger, *Universal homotopy theories*, Def. 3.2
and Prop. 3.4). Route: factor the map from the initial object to the constant cosimplicial diagram
at γ in the Reedy structure on `Fun(Δ, M)`.

*Needs:* Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1), §7.7.1 (HTT, Prop. A.2.9.19).

**3.3.2.** Prove the universal property of `U C = Fun(Cᵒᵖ, SSet)` with the projective structure: for a small category
C and a functor `γ : C → M` into a model category with small colimits (Mathlib's `ModelCategory` asks only for finite
ones, and the coend below is a small colimit) and a cosimplicial resolution Γ, the coend `L(X) = ∫^{c, n} X(c)_n ·
Γ(c, n)` has a right adjoint and is left Quillen, and `L` composed with the Yoneda embedding is `Γ(−, 0)`, naturally
weakly equivalent to a cofibrant replacement of γ (Dugger, *Universal homotopy theories*, Prop. 2.3; the input to the
proof of HTT Prop. A.3.7.6, p. 930). Route: the generating projective cofibrations go to the latching maps of the
Reedy cofibrant Γ. Witness Check: on finite sets with the model structure in which every map is a weak equivalence, C
terminal and `γ(∗) = 1`, the formula sends the discrete simplicial set ℕ to a countable coproduct of 1, which does not
exist there; so small cocompleteness is needed and not implied.

*Needs:* §3.3.1; Part SimplicialCategories §1.2.3 (simplicial sets satisfy (A1)–(A4)); Part KanQuillen §3.2.1; Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion), §7.7.1 (HTT, Prop. A.2.9.19), §8.3 (HTT, §A.2.9, after Cor. A.2.9.25).

### 3.4 Dugger's presentation theorem

**3.4.1.** Prove that for a combinatorial model category M there are a regular cardinal λ such that λ-filtered
colimits of cofibrant objects are homotopy colimits, and a small full subcategory C of cofibrant
λ-presentable objects such that every cofibrant object is weakly equivalent to a λ-filtered colimit of objects of C (Dugger,
*Combinatorial model categories have presentations*, Prop. 2.3 (ii) and Prop. 7.3, for the first assertion;
the second is the route below). Route: the weak equivalences form an
accessible subcategory of the arrow category (Part ModelCategories §6.1, HTT, Cor. A.2.6.8), so for
large λ they are stable under λ-filtered colimits, and λ-filtered colimits of cofibrant objects are
homotopy colimits; for C, apply a cofibrant replacement functor built by the small object argument
(Part ModelCategories §1.4), which commutes with λ-filtered colimits for large λ, to the
λ-presentable objects of M (Part ModelCategories §1.2).

*Needs:* Part SimplicialCategories §3.2.1; Part ModelCategories §1.2.1 (HTT, Def. A.1.1.2), §1.4.1 (HTT, Prop. A.1.2.5 (1)), §6.1.1 (HTT, Def. A.2.6.1, Cor. A.2.6.8).

**3.4.2.** Prove that for C as in §3.4.1 and the left adjoint `L : U C → M` of §3.3 for the
inclusion `C → M`, the derived counit `L(R X) → X` is a weak equivalence for every fibrant X: X is the
homotopy colimit of the canonical diagram over the comma category `C ↓ X` (Dugger, *Combinatorial
model categories have presentations*, Prop. 3.3 with Prop. 4.7).

*Needs:* §3.3.1, §3.3.2, §3.4.1.

**3.4.3.** Prove that there is a small set S of maps of `U C` such that `L ⊣ R` induces a Quillen equivalence
`S⁻¹ U C ⇄ M`, S consisting of the derived unit maps `A^cof → R((L A^cof)^fib)` for A in a small
dense set of λ′-presentable objects of `U C`, where λ′ ≥ λ is chosen so that λ′-filtered colimits in
`U C` commute with a cofibrant replacement functor `(−)^cof` of `U C`, with a fibrant replacement
functor of M and with R (Part ModelCategories §1.2, §1.4 (2); R is computed by maps out of the
λ′-presentable `Γ(c, n)`), each factored as a projective cofibration followed by a
trivial fibration and replaced by its first factor; L is homotopically surjective, that is, its derived
counit is a weak equivalence at every fibrant object, by §3.4.2 (Dugger,
*Combinatorial model categories have presentations*, Def. 3.1, Prop. 3.2 with its proof; Dugger
localizes at the derived unit maps themselves, which the localization of §3.2, requiring
cofibrations, does not accept). Route: the replacement changes neither the S-local objects nor the
S-equivalences, these depending only on the classes of the maps in `hU C` (§3.1); localize `U C` by §3.2 (it is combinatorial and simplicial by Part
SimplicialCategories §6.1 with S simplicial sets, and left proper objectwise by Part KanQuillen §3.4).
L stays left Quillen: the members of S become weak equivalences under L, by the triangle identity
and §3.4.2 (the transpose of the derived unit is the fibrant replacement, and L of
the first factor followed by the derived counit at `(L A^cof)^fib` is that transpose); so for
fibrant X of M, RX lifts against the pushout-products of the members of S with `∂Δ[n] ⊆ Δ[n]` (L
of `s ⊗ K` is a weak equivalence for finite K, by `Q ⊗ Δ[n] → Q` and induction over cells with the
cube lemma, and two out of three), hence RX is S-local; a cofibration i that is an S-equivalence
then lifts against R of every fibration between fibrant objects (the pullback-power of `Map(i, −)`
at it is a Kan fibration and a weak equivalence, by §3.1, lifting criterion), so `L i` lifts
against every fibration between fibrant objects and is a trivial cofibration (a cofibration with
this lifting property is a weak equivalence, by two out of six after factoring the map from its
source to a fibrant replacement of its target). The derived counit is unchanged, the cofibrations
being the same. The derived unit at a cofibrant Y is, up to weak equivalence, the λ′-filtered
colimit of members of S followed by trivial fibrations, by the choice of λ′; filtered colimits of
S-equivalences are S-equivalences (colim is left Quillen on projective diagrams in `S⁻¹ U C`, and
filtered colimits of weak equivalences of `U C` are weak equivalences); conclude by Part
ModelCategories §4.2.

*Needs:* §3.1.2 (the lifting criterion), §3.2.1, §3.4.2; Part SimplicialCategories §1.3.1 (the simplicial axiom for `U C`), §3.1.1, §6.1.1; Part KanQuillen §3.3.1, §3.4.1; Part ModelCategories §1.2.1 (HTT, Def. A.1.1.2), §1.4.1 (HTT, Prop. A.1.2.5 (2)), §3.5.1, §3.5.2 (HTT, Prop. A.2.4.4), §4.1.1 (HTT, §A.2.5), §4.2.1 (HTT, Prop. A.2.5.1), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion).

**3.4.4.** Prove Dugger's presentation theorem: every combinatorial model category M admits a presentation, a
small category C, a small set S of morphisms of `U C` and a Quillen equivalence `S⁻¹ U C ⇄ M` with
left adjoint on `S⁻¹ U C`, where `S⁻¹ U C` is the localization of §3.2 of the projective structure
(Dugger, *Universal homotopy theories*, Def. 6.1; Dugger, *Combinatorial model categories have
presentations*, Thm. 1.1); if M is
simplicial, the resolution can be taken to be `Γ(c, n) = c ⊗ Δ[n]` on cofibrant c, so that L and R
are simplicial functors and the Quillen equivalence is simplicial (HTT, proof of Prop. A.3.7.6,
p. 930). Route: §3.4.1–§3.4.3; for the simplicial assertion, `c ⊗ Δ[n]` is Reedy
cofibrant and homotopically constant for cofibrant c by the pushout-product axiom.

*Needs:* §3.2.1, §3.3.1, §3.3.2, §3.4.1–§3.4.3; Part SimplicialCategories §1.3.1, §6.1.1; Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1).

**3.4.5.** Prove that every combinatorial model category is Quillen equivalent to a left proper combinatorial
simplicial model category, with the left adjoint on the simplicial side (Dugger, *Combinatorial model
categories have presentations*, Cor. 1.2; used in the proof of HTT, Prop. A.3.6.15, p. 921). Route:
`S⁻¹ U C` of §3.4.4 is left proper, combinatorial and simplicial by §3.2.

*Needs:* §3.2.1, §3.4.4.

### Examples

- For M simplicial sets, Dugger's theorem holds with C a point and S empty: `U C` is simplicial sets
  with the Kan–Quillen structure and the identity is the Quillen equivalence.
- For A simplicial sets and `S = {∂Δ[1] ⊆ Δ[1]}`, the fibrant objects of `S⁻¹A` are the empty and the
  contractible Kan complexes (§3.1, §3.2).
- For C a point and a cofibrant object X of M with resolution `X^•`, the left Quillen functor of §3.3
  is `K ↦ K ⊗ X^•`; for `M = SSet` and `X = Δ[0]` it is the identity up to weak equivalence.

### Dependencies

Part SimplicialCategories (simplicial model categories, Reedy structures, enriched diagram
structures); Part ModelCategories (Smith's theorem, accessibility, Reedy model structures); Part
KanQuillen; Dugger's two papers.

## Layer 4: Weak exponentials and homotopy limits of diagram categories

### 4.1 Weak exponentials

**4.1.1.** Define, in a model category M with finite products, that a diagram `Z × Y ← P → X` (maps
`p : P → Z × Y`, `e : P → X`) exhibits Z as a weak exponential of X by Y when `[p] : [P] → [Z] × [Y]`
is an isomorphism in `hM` (P is a homotopy product of Z and Y) and the composite
`[Z] × [Y] ≅ [P] → [X]` exhibits `[Z]` as an exponential of `[X]` by `[Y]` in `hM`: for every object W
of `hM`, `Hom_hM(W, [Z]) → Hom_hM(W × [Y], [X])` is bijective; a map `Z × Y → X` exhibits Z as an
exponential when the diagram with `P = Z × Y` does (HTT, Def. A.3.6.1, p. 915).

- The diagram is standard when X, Y, Z are fibrant and p is a trivial fibration; when `[X]` has an
  exponential by `[Y]`, it is exhibited by a standard diagram (HTT, Rem. A.3.6.2, p. 916).
- Being a weak exponential is a homotopy invariant of the diagram, read as the four objects Z, Y,
  P, X with the maps `P → Z`, `P → Y` (the components of p) and `e : P → X`: if two diagrams are
  joined by a zigzag of maps that are weak equivalences at each of the four objects, one exhibits Z
  as a weak exponential of X by Y exactly when the other does (HTT, Rem. A.3.6.3, p. 916), since
  both conditions concern only the images `[P] → [Z]`, `[P] → [Y]`, `[P] → [X]` in `hM`. Only the
  components of p are compared because `Z × Y` itself is not a homotopy invariant of Z and Y. Hence
  a diagram with P a homotopy product of Z and Y may be made standard: replace X, Y, Z fibrantly,
  factor the induced `P → Z' × Y'` as a trivial cofibration followed by a fibration, which is then
  trivial, and extend e along the trivial cofibration into the fibrant replacement of X.
- For a Quillen equivalence `F : M ⇄ N : G` and a standard diagram in N, it exhibits Z as a weak
  exponential of X by Y exactly when its image under G does so in M (HTT, Rem. A.3.6.4, p. 916),
  since G preserves fibrant objects and trivial fibrations and `RG` is an equivalence preserving
  products.

**Checks.**

- For M simplicial sets and fibrant X, Y, the internal mapping object `Map(Y, X)` with evaluation is an
  exponential; `Δ[0]` is a weak exponential of X by `Δ[0]` only when X is weakly contractible: the
  bijections at `W = Δ[0]` and `W = X` force X nonempty and connected with `id_X` homotopic to a
  constant map.
- For M simplicial sets and Y = ∅, `Hom_hM(W × ∅, [X])` is a point for every W, so Z is a weak
  exponential of X by ∅ exactly when `[Z]` is terminal: `Δ[1]` qualifies and `∂Δ[1]` does not.
- For X terminal, every Z with `[Z]` terminal is a weak exponential; a definition comparing with
  `Hom_M` in place of `Hom_hM` would reject non-strict models of the point such as `Δ[1]`.

*Needs:* Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §3.1.1 (HTT, Prop. A.2.2.1), §4.1.1 (HTT, §A.2.5), §4.2.1 (HTT, Prop. A.2.5.1).

### 4.2 Multiplication preserving homotopy colimits and weak exponentials as mapping spaces

**4.2.1.** Define, for a combinatorial model category M and a fibrant Y, that multiplication by Y preserves
homotopy colimits when for every small poset A, every projectively cofibrant `F : A → M` and every
projectively cofibrant `F' : A → M` with an objectwise weak equivalence `F'(a) → F(a) × Y`, the map
`colim F' → (colim F) × Y` exhibits `colim F'` as a homotopy product of Y and `colim F`;
multiplication in M preserves homotopy colimits when this holds for every fibrant Y
(HTT, Def. A.3.6.5, p. 917).

- Only homotopy colimits over posets are tested; the condition says that `− × Y` commutes, up to
  weak equivalence, with homotopy colimits of such diagrams.
- Products with any object preserve weak equivalences between fibrant objects (trivial fibrations
  are stable under base change, then Ken Brown's lemma), so for a weak equivalence `Y → Y'` of
  fibrant objects, multiplication by Y preserves homotopy colimits exactly when multiplication by `Y'`
  does: by Ken Brown's factorization assume `Y → Y'` a trivial fibration; a diagram `F'` over
  `F × Y` gives one over `F × Y'` by composition, and a diagram over `F × Y'` gives one over `F × Y`
  by base change along `F × Y → F × Y'` followed by a projectively cofibrant replacement, whose
  colimit is weakly equivalent to that of the original.

**Checks.**

- In simplicial sets multiplication preserves homotopy colimits, since `− × Y` preserves colimits and
  weak equivalences; for A empty the condition says that `∅ → ∅ × Y` is a homotopy product, true
  because `∅ × Y = ∅`.
- In pointed simplicial sets the condition fails, and the failure does not need the empty poset: for
  the two-point discrete poset, F = ∗ and F' = Y, the map `Y ∨ Y → Y` is a weak equivalence only for
  weakly contractible Y.
- For A a point the condition says that `X × Y` is a homotopy product of X and Y for every cofibrant
  X; in simplicial sets this holds because `− × Y` preserves weak equivalences, and a definition
  allowing diagrams that are not projectively cofibrant would ask it for every X.

*Needs:* §4.1.1; Part SimplicialCategories §2.6.2; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1), §6.1.1 (HTT, Def. A.2.6.1), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion).

**4.2.2.** Prove that the condition is invariant under Quillen equivalence, and that it holds in `Cat_S`. (a) For a Quillen equivalence
`F : M ⇄ N : G` of combinatorial model categories and a fibrant Y in N, multiplication by Y preserves
homotopy colimits in N exactly when multiplication by `G Y` preserves homotopy colimits in M; hence
multiplication preserves homotopy colimits in N exactly when it does in M (HTT, Rem. A.3.6.7,
p. 917). (b) For an excellent S whose monoidal structure is the Cartesian product, multiplication in
`Cat_S` preserves homotopy colimits (HTT, Ex. A.3.6.8, p. 917). Route: for (a), the derived functors `LF` and `RG` are inverse equivalences of homotopy categories
(Part ModelCategories §4.2); `LF` carries homotopy colimits over a poset to homotopy colimits, since F
is left Quillen for the projective structures on diagrams and commutes with colimits (Part
SimplicialCategories §3.2), and `RG` preserves homotopy products, since G preserves products and
fibrant objects. Transport the data of condition (∗) along these equivalences. For the second
assertion, every fibrant object of M is weakly equivalent to `G Y` for a fibrant Y of N, because `RG` is
essentially surjective, and the condition depends only on the weak equivalence class of the fibrant
object (the last bullet of §4.2.1). (b) is the tensor product theorem §2.2.5.

*Needs:* §4.2.1; §2.2.5 (for (b)); Part SimplicialCategories §3.1.1 (HTT, Prop. A.2.8.7), §3.2.1, §5.4.2, §5.6.2; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §4.1.1 (HTT, §A.2.5), §4.2.1 (HTT, Prop. A.2.5.1), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion).

**4.2.3.** Prove that a class 𝒮 of simplicial sets contains every simplicial set when (i) `Δ[0]` is in 𝒮,
(ii) for a weak homotopy equivalence `K → L`, K is in 𝒮 exactly when L is, and (iii) for every small
poset A and every projectively cofibrant `F : A → SSet` with all values in 𝒮, `colim F` is in 𝒮
(HTT, Lemma A.3.6.9, pp. 917–918). Route: by (ii) and (iii), 𝒮 contains the homotopy colimit of any
poset-indexed diagram with values in 𝒮, in particular coproducts (discrete posets, including the
empty one, so ∅ is in 𝒮) and homotopy pushouts (the poset `{0 ← ∗ → 1}`). Induct on dimension: an
n-dimensional K is the pushout of its (n − 1)-skeleton along `B × ∂Δ[n] → B × Δ[n]`, B its set of
nondegenerate n-simplices, a homotopy pushout since the map is a monomorphism; `B × ∂Δ[n]` and the
skeleton lie in 𝒮 by induction, and `B × Δ[n]` is weakly equivalent to the coproduct of B copies of
`Δ[0]`. A general K is the colimit of its skeleta, a sequence of monomorphisms, hence a projectively
cofibrant diagram over ℕ.

*Needs:* Part KanQuillen §3.2.1 (HTT, §A.2.7); Part SimplicialCategories §3.2.1; Mathlib `SSet.stdSimplex`, `SSet.boundary`; Part ModelCategories §3.5.2 (HTT, Prop. A.2.4.4), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion).

**4.2.4.** Prove the mapping-space form of weak exponentials. (a) For a simplicial model category M with a
standard diagram `Z × Y ← P → X` (maps p and e), cofibrant objects W, W' and a map `W' → W × Y`,
`Map(W', P) → Map(W', Z × Y)` is a trivial Kan fibration; hence the fiber product
`E(W, W') = Map(W, Z) ×_{Map(W', Z × Y)} Map(W', P)`, formed with the map `Map(W, Z) → Map(W', Z × Y)`
taking f to `(f × id_Y) ∘ (W' → W × Y)`, is a Kan complex whose projection to `Map(W, Z)` is a
trivial Kan fibration (HTT, Rem. A.3.6.11, p. 918). (b) For M moreover combinatorial and Y such that multiplication by Y preserves homotopy colimits, the
diagram exhibits Z as a weak exponential of X by Y exactly when, for all cofibrant W, W' and every map
`W' → W × Y` exhibiting W' as a homotopy product of W and Y, the map `E(W, W') → Map(W', X)` induced by
e is a homotopy equivalence of Kan complexes (HTT, Prop. A.3.6.10, p. 918, with its proof,
pp. 918–919). Route: for (a), the first map is the case `∅ → W'` against the trivial fibration p of
the mapping-object form of the simplicial model category axiom (Part SimplicialCategories §1.3, HTT,
Rem. A.3.1.6); the projection is its base change, and `Map(W, Z)` is a Kan complex since W is
cofibrant and Z fibrant. For (b), if the mapping-space condition holds, take W fibrant-cofibrant and W' a cofibrant
replacement of `W × Y`; on components, using (a) and `π₀ Map = Hom_hM` (Part
SimplicialCategories §1.3), the map becomes `Hom_hM([W], [Z]) → Hom_hM([W] × [Y], [X])`, which is
therefore bijective. Conversely, a map of Kan complexes is a homotopy equivalence when it induces
bijections on homotopy classes of maps from every simplicial set K (Part KanQuillen §3.2). By (a) and the tensor–mapping-object adjunction, the two sides become
`Hom_hM([W ⊗ K], [Z])` and `Hom_hM([W' ⊗ K], [X])`, so by the weak exponential property it suffices that
`W' ⊗ K → (W ⊗ K) × Y` is a homotopy product for every K. The class of such K contains `Δ[0]`, is
invariant under weak homotopy equivalence (tensoring a cofibrant object is left Quillen in K and every
simplicial set is cofibrant), and is closed under colimits of projectively cofibrant poset diagrams
`F : A → SSet`. For the last point, `G = W ⊗ F` and `G' = W' ⊗ F` are projectively cofibrant (`W ⊗ −`
and `W' ⊗ −` are left Quillen and commute with colimits), but `G'(a) → G(a) × Y` is only a homotopy
product, not a weak equivalence, since `G(a)` need not be fibrant; so first take a projective
fibrant replacement `G → G^f`, a projective trivial cofibration, so that `G^f` is still projectively
cofibrant and objectwise fibrant. Then `G^f(a) × Y` is a homotopy product of `G(a)` and Y, the
composite `G'(a) → G^f(a) × Y` is a weak equivalence, and the hypothesis on multiplication by Y
(applied to `G^f` and `G'`) makes `colim G' = W' ⊗ colim F` a homotopy product of Y and `colim G^f`,
which is weakly equivalent to `colim G = W ⊗ colim F` (colimits of projectively cofibrant diagrams
preserve objectwise weak equivalences). §4.2.3 (HTT, Lemma A.3.6.9) concludes.

*Needs:* §4.1.1 (standard diagrams, HTT, Rem. A.3.6.2), §4.2.1, §4.2.3; Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5, Rem. A.3.1.6, Rem. A.3.1.8), §3.2.1; Mathlib `SSet.KanComplex`; Part KanQuillen §3.2.1 (HTT, §A.2.7); Mathlib `HomotopicalAlgebra.ModelCategory`; Part SimplicialCategories §3.1.1 (HTT, Prop. A.2.8.7: the colimit functor is left Quillen for the projective structure); Part ModelCategories §3.1.1 (HTT, Prop. A.2.2.1), §4.1.1 (HTT, §A.2.5), §6.1.1 (HTT, Def. A.2.6.1), §7.2.1 (HTT, Prop. A.2.8.2, projective assertion: fibrant replacement by a projective trivial cofibration).

### 4.3 Weak exponentials turn homotopy colimits into homotopy limits

**4.3.1.** Prove that for a combinatorial model category M and a poset `A = A₀ ∪ {∞}` with largest element ∞, with `B
= {(a, b) ∈ Aᵒᵖ × A : a ≥ b}`, given an object X of M, `Y : A → M`, `Z : Aᵒᵖ → M` and diagrams `Z(a) × Y(b) ← P(a, b)
→ X` functorial in `(a, b)` in B such that (i) each exhibits `P(a, b)` as a homotopy product, (ii) those with `a = b`
exhibit `Z(a)` as a weak exponential of X by `Y(a)`, (iii) multiplication in M preserves homotopy colimits, and (iv) Y
exhibits `Y(∞)` as a homotopy colimit of `Y|A₀`: then Z exhibits `Z(∞)` as a homotopy limit of `Z|A₀ᵒᵖ` (HTT, Prop.
A.3.6.15, p. 920, with its proof, p. 921). Route: make the diagrams standard by fibrant replacement (§4.1, HTT, Rem.
A.3.6.3). By Dugger's theorem (§3.4) replace M by a Quillen equivalent combinatorial simplicial model category N, by a
Quillen equivalence `F : N ⇄ M : G`, transporting the standard diagrams (G preserves fibrant objects, trivial
fibrations and products), the homotopy products (`RG` is an equivalence, hence preserves products), the weak
exponentials (§4.1, HTT, Rem. A.3.6.4) and the hypothesis on multiplication (§4.2, HTT, Rem. A.3.6.7). Hypothesis (iv)
and the conclusion also transport: the objectwise adjunction `F ∘ − ⊣ G ∘ −` on A-indexed (and Aᵒᵖ-indexed) diagrams
is a Quillen adjunction for both the projective and the injective structures (F preserves cofibrations and trivial
cofibrations objectwise, G fibrations and trivial fibrations objectwise) and a Quillen equivalence (its derived unit
and counit are computed objectwise). Since `lim ∘ (G ∘ −) = G ∘ lim` and `colim ∘ (F ∘ −) = F ∘ colim`, the derived
functors commute with homotopy limits and colimits, so `RG`, an inverse of `LF`, preserves and reflects that an
objectwise fibrant diagram exhibits its value at ∞ as a homotopy limit or colimit; Y and Z are objectwise fibrant
after the first step, so `G ∘ Y` and `G ∘ Z` compute `RG`. By Part SimplicialCategories §6.4 (for the poset `Aᵒᵖ`
regarded as an S-enriched category, HTT, Rem. A.3.3.11) it suffices that for every fibrant-cofibrant C the diagram `a
↦ Map(C, Z(a))` exhibits its value at ∞ as a homotopy limit. Let W be a cofibrant replacement of `a ↦ C × Y(a)`. Index
the comparison by the three-index poset `T = {(a, b, c) : c ≤ b ≤ a}` inside `Aᵒᵖ × A × Aᵒᵖ`, as in
BordismFormalGroups §F6.5, with `E(a, b, c) = Map(C, Z(a)) ×_{Map(W(c), Z(a) × Y(b))} Map(W(c), P(a, b))` for the
standard diagrams `P` of §4.2 (HTT, Rem. A.3.6.11). Prove the required derived right Kan extensions along the
projections from T, rather than that every transition map of a diagram on B is an equivalence: diagonal equivalences
do not give pointwise ones, and the transition claim fails already for discrete Kan complexes (with `A₀` two points,
`Y₀ = Y₁ = ∗`, `Y∞ = 2`, `X = 2`, `Z(a) = X^{Y(a)}` and `C = ∗`, the map `E(∞, 0) ⟶ Map(Y₀, X)` is evaluation `4 ⟶ 2`,
while the final comparison is `4 ≅ 2 × 2`). By Part SimplicialCategories §3.4 (HTT, Lemma A.3.6.14) both `Map(C,
Z(−))` and `Map(W(−), X)` are then homotopy right Kan extensions of the same diagram on B, so they agree in the
homotopy category of diagrams. Finally the hypotheses on multiplication and on Y make `W(∞)` a homotopy colimit of
`W|A₀`, so `Map(W(−), X)` exhibits its value at ∞ as a homotopy limit (Part SimplicialCategories §6.4).

*Needs:* §3.4.5, §4.1.1 (HTT, Rem. A.3.6.3, Rem. A.3.6.4), §4.2.2 (HTT, Rem. A.3.6.7; Rem. A.3.6.11; Prop. A.3.6.10); Part SimplicialCategories §1.3.1, §2.6.1 (injective structures), §3.1.1 (HTT, Prop. A.2.8.7: limits and colimits as Quillen functors), §3.2.1 (homotopy limits and colimits as derived limits and colimits), §3.4.3 (third statement), §6.4.1, §6.4.2 (first two statements); Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §4.1.1 (HTT, §A.2.5, derived functors), §4.2.1 (HTT, Prop. A.2.5.1, Quillen equivalences), §6.1.1 (HTT, Def. A.2.6.1), §7.1.1 (HTT, Def. A.2.8.1), §7.2.1 (HTT, Prop. A.2.8.2).

### 4.4 Homotopy limits of diagram categories

**4.4.1.** Prove that inverting the weak equivalences between fibrant objects of a chunk recovers `U°`: for a
combinatorial S-enriched M and a chunk `U ⊆ M`, with `U_f` the objects of U fibrant in M and W the weak
equivalences in `U_f`, the map `U° → U_f[W⁻¹]` is a weak equivalence (HTT, Lemma A.3.6.17, p. 922).
Route: weak equivalences in `U°` are equivalences, so `U° → U°[W₀⁻¹]` is a weak equivalence by Part
SimplicialCategories §5.6; an S-enriched cofibrant replacement functor preserving U (§1.1, HTT, Rem. A.3.4.2) gives a
candidate homotopy inverse to `U°[W₀⁻¹] → U_f[W⁻¹]`, the homotopy being a functor
`U_f ⊗ [1]_S → U_f`; the two ends `{0}, {1} ⊆ [1]_S` induce weak equivalences into the localized
tensor product by §1.2 (b) and the tensor product statement §2.1.4 (HTT, Lemma A.3.5.14).

*Needs:* §1.1.1, §1.2.3, §2.1.1 (HTT, Notation A.3.5.1; Lemma A.3.5.14); Part SimplicialCategories §5.1.1, §5.5.2, §5.6.1; Tau Ceti `TauCeti.tensorEnrichedCategory`.

**4.4.2.** Prove that for a combinatorial model category M and a small poset `A = A₀ ∪ {∞}` with largest element
∞ there is a regular cardinal κ such that the diagrams `F : Aᵒᵖ → M` exhibiting `F(∞)` as a homotopy
limit of `F|A₀ᵒᵖ` are stable under κ-filtered colimits in `Fun(Aᵒᵖ, M)` (HTT, proof of Cor. A.3.6.18,
p. 923, which takes it from the proof of Prop. A.2.8.2); κ can be chosen depending only on A, on a
rank of local presentability of M, on generating sets of cofibrations and trivial cofibrations of M and on a cardinal past which the weak
equivalences of M are closed under filtered colimits of that size. Route: choose κ with A small relative to κ,
with the weak equivalences of M closed under κ-filtered colimits in `Arrow M` (they form an accessible
subcategory, Part ModelCategories §6.1, HTT, Cor. A.2.6.8), and with an injectively fibrant replacement
functor R on `Fun(A₀ᵒᵖ, M)`, built by the small object argument on generating injective trivial
cofibrations, commuting with κ-filtered colimits (Part ModelCategories §1.4 (2), with the
combinatorial injective structure of Part SimplicialCategories §2.6). Restriction to `A₀ᵒᵖ` commutes
with colimits, and the limit over the κ-small `A₀ᵒᵖ` commutes with κ-filtered colimits in the presentable
M (test against κ-presentable generators, which reduces it to sets). So for `F = colim F_i` the map
`F(∞) → lim R(F|A₀ᵒᵖ)` is the κ-filtered colimit of the maps `F_i(∞) → lim R(F_i|A₀ᵒᵖ)`, and a weak
equivalence when these are; by the definition of homotopy limits (Part SimplicialCategories §3.2)
that is the claim. Every choice of κ in the route (the size of A, the rank of presentability of M,
the compactness of the domains and
codomains of the generating sets of M and of the generators of the injective structure built from
them by Part SimplicialCategories §2.5, and the closure of the weak equivalences) is made from these
small data alone.

*Needs:* Part SimplicialCategories §2.2.1, §2.5.1, §2.6.1, §3.2.1; Part ModelCategories §1.1.1 (HTT, Def. A.1.1.1), §1.2.1 (HTT, Def. A.1.1.2), §1.4.1 (HTT, Prop. A.1.2.5 (2)), §5.1.1 (HTT, Def. A.2.6.2), §6.1.1 (HTT, Def. A.2.6.1, Cor. A.2.6.8).

**4.4.3.** Prove that diagram categories turn homotopy colimits of indexing categories into homotopy limits,
for an excellent S with the Cartesian product, a combinatorial S-enriched M, a poset
`A = A₀ ∪ {∞}` with largest element ∞ and a diagram `{C_a}` of small S-enriched categories
exhibiting `C_∞` as a homotopy colimit of `{C_a}_{a ∈ A₀}`. (a) If each `C_a` is cofibrant and U is a
small chunk that is a `C_a`-chunk for every a, then, with `U^{C_a}_f` the projectively fibrant
diagrams and `W_a` their weak equivalences, `{U^{C_a}_f[W_a⁻¹]}` exhibits `U^{C_∞}_f[W_∞⁻¹]` as a
homotopy limit of the diagram over `A₀` (HTT, Prop. A.3.6.16, p. 921). (b) The same conclusion holds
for `M^{C_a}_f[W_a⁻¹]`, the projectively fibrant objects of `M^{C_a}` with the weak equivalences
inverted, without the chunk hypothesis and for arbitrary small `C_a`, provided S is the restriction
of an excellent S′ in the next universe with the same generating sets and weak equivalences, as
simplicial sets are of `SSet.{u+1}` (HTT, Cor. A.3.6.18, p. 923).

Route: for (a), apply §4.3 to the model category `Cat_S`, whose multiplication preserves homotopy
colimits (§4.2), with `P(a, b) = (U^{C_a}_f ⊗ C_b)[V_{a,b}⁻¹]`, `V_{a,b}` the morphisms `e ⊗ id_C`
with e in `W_a`, which is a homotopy product by the tensor product statement §2.1.4 (HTT,
Lemma A.3.5.14); the weak exponentials come from §1.3 and the localized chunks of §4.4.1 (HTT,
Lemma A.3.6.17). For (b), assume each `C_a` cofibrant (Part SimplicialCategories §6.3); §4.4.2,
applied to the model category `Cat_S` (combinatorial by Part SimplicialCategories
§5.4), gives a regular κ with homotopy limit diagrams in `Fun(Aᵒᵖ, Cat_S)` stable under κ-filtered
colimits. `Cat_S` formed one universe up with mapping objects in S is not cocomplete, so the large
categories are placed in `Cat_{S′}` instead: the `M^{C_a}_f[W_a⁻¹]` are objects of `Cat_{S′}`,
combinatorial by Part SimplicialCategories §5.4, with generators `C₀` the same maps as for `Cat_S`
(§5.2 there); for a small κ bounding the presentability ranks and the compactness of the generators,
`Cat_S` and `Cat_{S′}`, and their diagram categories on `Aᵒᵖ`, have the same κ-compact objects up to
isomorphism (Part SimplicialCategories §2.2), so the generating injective trivial cofibrations of
Part SimplicialCategories §2.5 can be taken to be the same set; hence the κ of §4.4.2
is the same for both, and the inclusion `Fun(Aᵒᵖ, Cat_S) → Fun(Aᵒᵖ, Cat_{S′})`, which preserves
limits, weak equivalences and injective fibrancy (the right lifting property against the same set),
preserves homotopy limit diagrams (HTT, proof of Cor. A.3.6.18, p. 923). The small subcategories of
M that are `C_a`-chunks for all a, ordered by inclusion, form a κ-filtered poset for every small κ,
by §1.1 (a) applied to unions of fewer than κ of them (A being small), with union M;
`M^{C_a}_f[W_a⁻¹]` is the union, hence the filtered colimit in `Cat_{S′}`, of the
`U^{C_a}_f[W_a⁻¹]`, a diagram on a small `C_a` having values in some small U and localization
commuting with colimits. By (a) and the inclusion, each U-diagram is a homotopy limit diagram in
`Fun(Aᵒᵖ, Cat_{S′})`, and §4.4.2 concludes.

*Needs:* §1.1.4, §1.1.5, §1.3.1, §2.1.1, §2.1.4, §2.2, §4.2.2, §4.3.1, §4.4.1, §4.4.2; Part SimplicialCategories §2.2.1, §2.5.1, §2.6.1, §3.2.1, §5.2.1, §5.2.2, §5.4.2, §5.6.2, §6.3.1; Mathlib `HomotopicalAlgebra.ModelCategory`; Part ModelCategories §1.1.1 (HTT, Def. A.1.1.1), §6.1.1 (HTT, Def. A.2.6.1).

### Examples

- For S and A simplicial sets and C_a ranging over `[0]_S ⊔ [0]_S ← [0]_S → [0]_S` with homotopy pushout
  `C_∞`, §4.4 identifies diagrams on `C_∞` with homotopy pullbacks of diagram categories.
- For A₀ empty, §4.3 says `Z(∞)` is a homotopy limit of the empty diagram, a homotopically terminal
  object, matching that `Y(∞)` is homotopically initial and `Z(∞)` is an exponential of X by an initial
  object.
- `Cat_S` for S simplicial sets satisfies the hypothesis of §4.3 on multiplication (§4.2).
- For M simplicial sets, fibrant X and Y and the standard diagram given by the internal mapping
  object `Map(Y, X)` with `P = Map(Y, X) × Y`, the mapping-space form of §4.2 says that
  `Map(W × Y, X) → Map(W', X)` is a homotopy equivalence for every weak equivalence `W' → W × Y` of
  cofibrant objects, as composition with a weak equivalence into a Kan complex should be.

### Dependencies

Layers 1–3; Part SimplicialCategories, Layers 1, 3 and 6; Part KanQuillen (the Kan–Quillen model
structure, for the mapping-space form of weak exponentials); Part ModelCategories (Quillen
equivalences, combinatorial model categories, homotopy pushouts).

## Downstream consumers

This roadmap is used by Parts InfinityCategoryFoundations, LimitsAndKanExtensions, AdjunctionsAndLocalizations, Straightening, PresentableInfinityCategories and DerivedInfinityCategories of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Homotopy
  limits in `Cat_S`: Prop. A.3.2.27, Cor. A.3.2.28, p. 887; chunks: Def. A.3.4.1–Lemma A.3.4.15,
  pp. 903–908; localization of S-categories: Notation A.3.5.1–Thm. A.3.5.15, pp. 909–914; weak
  exponentials: Def. A.3.6.1–Cor. A.3.6.18, pp. 915–923 (with Lemma A.3.6.9, Prop. A.3.6.10 and
  Rem. A.3.6.11, pp. 917–919); Bousfield localization: §A.3.7,
  Lemma A.3.7.1, Prop. A.3.7.3, pp. 923–928; the uses of Dugger's theorem in the proofs of
  Prop. A.3.6.15, p. 921, and Prop. A.3.7.6, p. 930; Thm. 4.1.3.1 and Prop. 5.5.8.7 (§2.4, as comparisons).
- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  Lemma 1.3.4.10 and its proof,
  pp. 111–112 (fixed object sets and sifted homotopy colimits), with Lemma 4.1.8.13.
- **Riehl.** E. Riehl, *Categorical Homotopy Theory*, New Mathematical Monographs 24, Cambridge
  University Press, 2014, [doi:10.1017/CBO9781107261457](https://doi.org/10.1017/CBO9781107261457).
  Thm. 13.2.1 and Cor. 13.2.4, pp. 177–178 (the enriched small object argument, for HTT, Ex. A.3.4.4,
  in §1.1).
- **DK80.** W. G. Dwyer and D. M. Kan, *Simplicial localizations of categories*, J. Pure Appl. Algebra
  17 (1980), 267–284 (cited by locator). §7 (simplicial categories with a fixed object set, §2.4).
- **Dug01a.** D. Dugger, *Universal homotopy theories*, Adv. Math. 164 (2001), 144–176,
  [arXiv:math/0007070](https://arxiv.org/abs/math/0007070). Prop. 2.3 (the universal property of
  `U C`), Def. 3.2 and Prop. 3.4 (cosimplicial resolutions), §3.3.
- **Dug01b.** D. Dugger, *Combinatorial model categories have presentations*, Adv. Math. 164 (2001),
  177–201, [arXiv:math/0007068](https://arxiv.org/abs/math/0007068). Thm. 1.1, Cor. 1.2, Def. 3.1,
  Props. 3.2, 3.3, 4.7 and 7.3 (§3.4).
