# Roadmap: stable ∞-categories, t-structures and spectra

**Summary.** This Part builds the theory of stable ∞-categories and of spectra.

It builds on the limits, Kan extensions, presheaves, Ind-objects and presentable ∞-categories of the earlier
Parts. Pointed ∞-categories, fiber and cofiber sequences, stability and suspension functors are defined in §1.1.

- **The triangulated homotopy category (Layers 1–2).** The homotopy category of a stable ∞-category is
  triangulated, agreeing with Mathlib's `CategoryTheory.Pretriangulated` and `CategoryTheory.IsTriangulated`;
  stability criteria and exact functors.
- **t-structures (Layer 3).** Truncation functors and hearts, compared with Mathlib's
  `CategoryTheory.Triangulated.TStructure`.
- **Filtered objects and Dold–Kan (Layers 4–5).** ℤ-complexes and filtered objects; the classical Dold–Kan
  functor for additive categories.
- **Limits and quotients (Layer 6).** Ind-objects and idempotent completions of stable ∞-categories, limits of
  towers with the Milnor sequence, limits and filtered colimits in `Cat∞^Ex`, and Verdier quotients.
- **Spectra (Layer 7).** Spectrum objects, stabilization and its universal property, and spectra.
- **Completions (Layer 8).** Bounded t-structures and left completion.
- **Presentable stable ∞-categories (Layers 9–11).** Presentable stable ∞-categories and the freeness of spectra;
  `Sp(𝒫)` as presheaves of spectra and the stable `P_Σ`; accessible t-structures and the t-structure on spectra.
- **Spectral sequences (Layer 12).** The ∞-categorical Dold–Kan correspondence, and the spectral sequences of
  filtered, simplicial and cosimplicial objects.

**Headline theorems.**
- The homotopy category of a stable ∞-category is triangulated, with shift, distinguished triangles and octahedra
  agreeing with Mathlib's (HA, Thm. 1.1.2.14, p. 27).
- A pointed ∞-category is stable exactly when it has finite limits and colimits and its pushout squares are its
  pullback squares (HA, Prop. 1.1.3.4, p. 31).
- A t-structure has truncation functors and an abelian heart whose short exact sequences are the distinguished
  triangles (HA, Prop. 1.2.1.5, p. 38; Rem. 1.2.1.12, p. 40; BBD, Thm. 1.3.6).
- The classical Dold–Kan functor is fully faithful for every additive category (HA, Thm. 1.2.3.7, p. 56).
- `Cat∞^Ex` has small limits and filtered colimits, preserved by its inclusion into `Cat∞` (HA, Thm. 1.1.4.4 and
  Prop. 1.1.4.6, p. 35).
- The Verdier quotient of a small stable ∞-category is stable, with an exact universal property and a
  filtered-colimit formula for its mapping spaces (NS, Thm. I.3.3, p. 19).
- The spectrum objects of an ∞-category with finite limits form a stable ∞-category (HA, Cor. 1.4.2.17, p. 146)
  with a universal property among left exact functors (HA, Cor. 1.4.2.23, p. 147), and are the limit of the tower
  of loop functors (HA, Prop. 1.4.2.24, p. 147).
- A pointed ∞-category is stable exactly when it has finite limits and Ω is an equivalence (HA, Cor. 1.4.2.27,
  p. 149).
- The left completion of a t-structure is stable with a t-structure, and left completeness is detected by
  ∞-connective objects (HA, Props. 1.2.1.17, 1.2.1.19, pp. 44–45).
- For presentable C, `Sp(C)` is presentable with left adjoint `Σ^∞₊` (HA, Prop. 1.4.4.4, p. 156), and spectra are
  the free presentable stable ∞-category on one object (HA, Cor. 1.4.4.6, p. 157).
- The presentable stable ∞-categories are the accessible left exact localizations of `Fun(E, Sp)` (HA,
  Prop. 1.4.4.9, p. 159).
- `Sp(𝒫)` is the ∞-category of limit-preserving functors `𝒫^op ⟶ Sp` (SAG, Rem. 1.3.2.2, p. 118, in the
  presentable case), and the product-preserving presheaves of spectra on a small C with finite coproducts are
  `Sp(P_Σ(C))`, free on C among presentable stable ∞-categories.
- Colimit-closed, extension-closed presentable subcategories are the connective parts of accessible
  t-structures (HA, Prop. 1.4.4.11, p. 160), and `Sp` has a left and right complete accessible t-structure with
  heart the abelian groups (HA, Prop. 1.4.3.6, p. 151).
- Simplicial objects of a stable ∞-category are its filtered objects (HA, Thm. 1.2.4.1, p. 66), and the spectral
  sequences of filtered and simplicial objects converge (HA, Props. 1.2.2.14, 1.2.4.5, pp. 52, 68), with the
  Bousfield–Kan spectral sequence of a cosimplicial object as the dual case.

## Scope and ownership

Monoidal refinements and the multiplicative part of the derived-limit filtration are not stated here.

Already in the libraries, and only cited: Mathlib's triangulated categories, t-structures with their truncation
functors and hearts, the derived category with its standard t-structure (used in Checks), the Dold–Kan
equivalence for idempotent complete additive and for abelian categories, and Lurie's normalized chain complex
N∗ (HA, Def. 1.2.3.9, p. 56), which is Mathlib's `AlgebraicTopology.normalizedMooreComplex`; Tau Ceti's
homotopy groups of Kan complexes, its Alexander–Whitney map of simplicial objects, its identification
πₙ A ≅ Hₙ(N∗(A)) for simplicial modules (HA, Rem. 1.2.3.14, p. 58), and its monoidal Dold–Kan correspondence,
with N and C∗ oplax monoidal through the Alexander–Whitney map and DK lax monoidal, for an idempotent complete
monoidal preadditive category with finite coproducts whose tensor product is additive in each variable, which
are exactly Lurie's hypotheses (HA, Ex. 1.2.3.26, p. 64). Tau Ceti's stable category of a Frobenius exact
category is an unrelated 1-categorical notion. Tau Ceti's symmetric spectra of simplicial sets are a
1-categorical model owned by GeneralizedCohomology §G2; this Part uses the ∞-categorical definition and no
model. The unstable P_Σ(C), truncation and Postnikov towers are Part PresentableInfinityCategories's; the one cofinality
lemma about injective maps into Δ≤n is Part LimitsAndKanExtensions §9.6. Brown representability and the
monoidal theory of spectra (smash products, ring spectra, multiplicative spectral sequences) are outside this
Part, and so are sheaves of spectra on ∞-topoi, prestable ∞-categories and the derived ∞-categories of abelian
categories (see Downstream consumers).

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.1.2` here and `Part StableInfinityCategories §2.1.2`
elsewhere, is one target.

- **∞-categories.** An ∞-category is a simplicial set `C` with Mathlib's `SSet.Quasicategory` instance;
  objects are vertices, morphisms are edges, equivalences are Tau Ceti's `SSet.Edge.IsEquivalence`, and hC
  is `SSet.hoFunctor.obj C`. The functor ∞-category Fun(K, C) is `(ihom K).obj C`, a quasicategory by
  Mathlib's instance. C, K and all index categories live in one universe u, as `ihom` requires; Lurie's
  statements are for small K and C, so nothing is lost.
  **Check.** For C the nerve of a category D, hC is equivalent to D.
- **Stability.** Zero objects are those of Part InfinityCategoryFoundations §1.2. Pointed ∞-categories, triangles, fiber and
  cofiber sequences, fibers and cofibers, and stable ∞-categories are those of §1.1 (HA, Defs. 1.1.1.1, 1.1.1.4, 1.1.1.6, 1.1.1.9,
  pp. 17–20), with the zero corner of a triangle at (0, 1); suspension and loop functors are those of §1.1
  (HA, §1.1.2, pp. 23–24). Pushout and pullback squares are colimit and limit diagrams of
  shape Δ[1] × Δ[1] in the sense of Tau Ceti's `SSet.coslice.IsColimit` and `SSet.slice.IsLimit`, the square
  read as a cocone Λ[2,0] ⋆ Δ[0] or a cone Δ[0] ⋆ Λ[2,2]. The `Suggested.lean` declarations
  `IsZeroObject`, `IsPointed`, `IsPushoutSquare`, `IsPullbackSquare`, `corner` and `IsStable` state these
  (`IsZeroObject` and the squares restated from Part InfinityCategoryFoundations §1.2, through its colimit and limit diagrams
  `IsColimitDiagram` and `IsLimitDiagram`); `IsPointed` and `IsStable` include the quasicategory hypothesis.
  They are built from seven `Suggested.lean` helpers: the
  coordinate maps `spanCoord₁`, `spanCoord₂` : Λ[2,0] ⟶ Δ[1], sending the span vertices 0, 1, 2 to (0, 0),
  (1, 0), (0, 1), and `cospanCoord₁`, `cospanCoord₂` : Λ[2,2] ⟶ Δ[1], sending the cospan vertices 0, 1, 2 to
  (1, 0), (0, 1), (1, 1); the shapes `coconeShape` : Λ[2,0] ⋆ Δ[0] ⟶ Δ[1] × Δ[1], with cone point (1, 1),
  and `coneShape` : Δ[0] ⋆ Λ[2,2] ⟶ Δ[1] × Δ[1], with cone point (0, 0), both isomorphisms; and `corner`,
  the vertex (0, 1) of a square.
  **Check.** In the nerve of abelian groups, for g : X ⟶ Y the square with X at (0, 0), Y at (1, 0), 0 at
  (0, 1) and coker g at (1, 1) is a triangle and a cofiber sequence; its transpose, with Y at (0, 1), is not a
  triangle unless Y = 0. So the position of the zero corner fixes which edge is the first map.
- **Choice-free definitions.** Where a definition presupposes an object that exists only by a later theorem (a
  pullback, a truncation, a suspension functor), it quantifies over all such objects or asks for one explicitly;
  uniqueness up to equivalence, which makes the two readings agree, is proved later. **Check.** In the nerve
  of abelian groups, a fiber of g : X ⟶ Y (§1.1) is any fiber sequence with g as second map: the kernel
  inclusion and its composite with any automorphism of ker g both qualify, and none is distinguished; the
  space of fibers is contractible by §1.2 (dually). Likewise a suspension functor (§1.1) is the composite with
  any section `s : C → M^Σ` of evaluation at (0, 0), and §1.3 proves the sections form a contractible space.
- **Shifts and indexing.** X[1] is the suspension ΣX and X[−1] the loop object ΩX, and X[n] their powers
  (§1.3). On hC the shift by n is Mathlib's `X⟦n⟧`. t-structures are homological, as in Lurie: C≥n is
  closed under [1], and πₙ X = π₀(X[−n]) with π₀ = τ≥0 ∘ τ≤0 valued in the heart. Mathlib's
  `Triangulated.TStructure` is cohomological; the dictionary is C≥n = `t.le (−n)` and C≤n = `t.ge (−n)`, so
  HA's τ≥n is Mathlib's truncation `truncLE (−n)`, HA's τ≤n is `truncGE (−n)`, and the heart C≥0 ∩ C≤0 is
  `t.heart`.
  **Check.** In Mathlib's derived category of abelian groups, ℤ in cohomological degree −1 has homology in
  homological degree 1: it lies in HA's C≥1 ∩ C≤1 and is Mathlib's ≤ −1 and ≥ −1. A dictionary C≥n = `t.le n`
  would put it in C≥n exactly for n ≥ −1, so C≥n would grow with n.
- **Signs.** The rotation of a distinguished triangle X ⟶ Y ⟶ Z ⟶ X[1] is Y ⟶ Z ⟶ X[1] ⟶ Y[1] with last
  map −f[1], as in Mathlib's `Pretriangulated.Triangle.rotate`.
  **Check.** Rotating X ⟶ X ⟶ 0 ⟶ X[1] (identity first map) gives X ⟶ 0 ⟶ X[1] ⟶ X[1] with last map
  −id; both are distinguished, by TR1 and TR2.
- **Cofinality.** Cofinal means cofinal in the sense of Part LimitsAndKanExtensions §2.1 (HTT, Def. 4.1.1.1), the analogue
  of Mathlib's `CategoryTheory.Functor.Final`. HA and SAG call this notion "left cofinal" and write
  "right cofinal" for f when f^op is cofinal; Kerodon uses the two words the other way round. This Part
  writes only "cofinal" and "f^op is cofinal".
  **Check.** The inclusion {1} ⊆ Δ[1] of the final vertex is cofinal and {0} ⊆ Δ[1] is not: a diagram on Δ[1]
  has colimit its value at 1, not at 0.
- **Size, spaces and pointed spaces.** Small and large are as in Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15). S is the
  ∞-category of small spaces (Part InfinityCategoryFoundations §7.1, HTT, Def. 1.2.16.1) and S∗ its pointed objects (Part
  LimitsAndKanExtensions §9.3, HTT, Def. 7.2.2.1); the finite pointed spaces S^fin_∗ and the spheres Sⁿ are
  defined in §7.1.
  **Check.** S∗ is pointed, its zero object being the point; S is not, since Map(∗, ∅) is empty.
- **Spectra and illustrations.** Sp is the ∞-category of spectra of §7.6, 𝕊 the sphere spectrum of §9.2, HM
  the Eilenberg–MacLane spectrum of an abelian group M (the object of the heart of §11.3 corresponding to M;
  HZ for M = ℤ), and πₙ X the homotopy groups of a spectrum for the t-structure of §11.3. Checks and Examples
  in the layers before these objects are built use them as illustrations, with only standard values:
  π₀𝕊 ≅ ℤ, π₁𝕊 ≅ ℤ/2, π₃𝕊 ≅ ℤ/24, πₙ HM = M for n = 0 and 0 otherwise, the finite spectra have finitely
  generated homotopy groups, the connective spectra are Sp≥0, τ≥0 is the connective cover, and πₙ commutes
  with filtered colimits. No statement, proof route or *Needs:* line uses them before they are built.
  **Check.** π₀ HZ = ℤ and π₁ HZ = 0, while π₁𝕊 ≅ ℤ/2: the two spectra have the same π₀ and are not
  equivalent, so an illustration using 𝕊 cannot be replaced by one using HZ.

## Exact supplier contracts

### From Mathlib

- `SSet.Quasicategory`, `SSet.hoFunctor` (`AlgebraicTopology/Quasicategory/Basic.lean`,
  `AlgebraicTopology/SimplicialSet/HomotopyCat.lean`); `CategoryTheory.nerve`; `SSet.op`; the instance
  `Quasicategory ((ihom K).obj C)` (`AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/`);
  `SSet.rlp_monomorphisms` (`AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`), trivial
  fibrations lift against monomorphisms (HTT, Ex. 2.0.0.2); `SSet.innerAnodyneExtensions`, for the spine of
  N(ℤ≥0); `CategoryTheory.Functor.Final`, the 1-categorical analogue of cofinality.
- `CategoryTheory.Preadditive`, `CategoryTheory.Limits.HasFiniteBiproducts`,
  `CategoryTheory.Limits.HasZeroObject`, `CategoryTheory.Functor.Additive`.
- `CategoryTheory.HasShift`, `CategoryTheory.Pretriangulated`, `CategoryTheory.IsTriangulated`,
  `CategoryTheory.Triangulated.Octahedron`, `CategoryTheory.Pretriangulated.Triangle.rotate`
  (`CategoryTheory/Triangulated/`); `CategoryTheory.Functor.IsHomological`
  (`Triangulated/HomologicalFunctor.lean`).
- `CategoryTheory.Triangulated.TStructure` with `heart`, `Heart`, `ιHeart`, `truncLE`, `truncGE`,
  `truncGELEIsoLEGE` (`Triangulated/TStructure/`); `CategoryTheory.Functor.RightTExact`,
  `CategoryTheory.Functor.LeftTExact` and `CategoryTheory.Functor.TExact`, with the constructors
  `RightTExact.mk` and `LeftTExact.mk` from the case n = 0 (`Triangulated/TStructure/TExact.lean`), for
  t-exact functors; these classes assume `[F.CommShift ℤ] [F.IsTriangulated]`, which §2.3 supplies for the
  functor induced by an exact functor; `CategoryTheory.Functor.CommShift` (`Shift/CommShift.lean`),
  `CategoryTheory.Functor.IsTriangulated` and `CategoryTheory.Functor.mapTriangle`
  (`Triangulated/Functor.lean`), for triangulated functors; `Triangulated.AbelianSubcategory.admissibleMorphism`
  and `Triangulated.AbelianSubcategory.abelian` (`Triangulated/TStructure/AbelianSubcategory.lean`), which
  build an abelian structure on a full additive subcategory without negative maps whose morphisms are all
  admissible. Mathlib does not state that the heart is abelian.
- `DerivedCategory`, `DerivedCategory.TStructure.t` (`Algebra/Homology/DerivedCategory/TStructure.lean`),
  used in Checks only.
- `ChainComplex`, `HomologicalComplex₂.total`, `HomologicalComplex.mapBifunctor`,
  `AlgebraicTopology.alternatingFaceMapComplex`, `AlgebraicTopology.normalizedMooreComplex`,
  `AlgebraicTopology.DoldKan.Γ₀`, `AlgebraicTopology.DoldKan.N₁Γ₀`, `AlgebraicTopology.DoldKan.PInfty`,
  `AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`,
  `CategoryTheory.Idempotents.DoldKan.equivalence`, `CategoryTheory.Preadditive.DoldKan.equivalence`,
  `CategoryTheory.Abelian.DoldKan.equivalence` (`AlgebraicTopology/DoldKan/`). Mathlib's equivalence assumes
  idempotent completeness; the full faithfulness of `Γ₀` for every additive category is not stated.
- `CategoryTheory.IsIdempotentComplete` (`CategoryTheory/Idempotents/Basic.lean`); `CategoryTheory.Functor.IsLocalization`
  (`CategoryTheory/Localization/`), for the homotopy category of a Verdier quotient.
- `CategoryTheory.Triangulated.SpectralObject` with `mapHomologicalFunctor`
  (`CategoryTheory/Triangulated/SpectralObject.lean`) and `spectralSequence`, `spectralSequenceHomologyData`
  (`Algebra/Homology/SpectralObject/SpectralSequence.lean`), for the pages and differentials of §12.2.

### From Tau Ceti

- `SSet.Edge.IsEquivalence`, `SSet.IsTerminalVertex`, `SSet.IsInitialVertex`, `SSet.slice.IsLimit`,
  `SSet.coslice.IsColimit`, `SSet.catInfty` (HTT, Def. 3.0.0.1), `SSet.QCat.IsCategoricalEquivalence`
  (`TauCeti/AlgebraicTopology/Quasicategory/`); `SSet.fullEnhancedSubcategory`
  (`Quasicategory/FullSubcategory.lean`), for `M^Ω` in §7.5; `SSet.evalAt` (`SimplicialSet/WeaklyContractible.lean`),
  evaluation at a vertex; `SSet.join`, `SSet.join.stdSimplexIso`
  (`AlgebraicTopology/SimplicialSet/Join/`), used to state the stability of functor ∞-categories and the
  ∞-categorical Dold–Kan correspondence.
- `SSet.KanComplex.π` with its group structure (`SimplicialSet/KanComplex/HomotopyGroup.lean`), for the
  additive structure of hC and the homotopy groups of the spaces of a spectrum.
- `CategoryTheory.SimplicialObject.alexanderWhitney` and
  `CategoryTheory.SimplicialObject.alternatingFaceMapComplexOplaxMonoidal`
  (`AlgebraicTopology/SimplicialObject/AlexanderWhitney.lean`), for a monoidal preadditive category with
  finite coproducts; `CategoryTheory.Idempotents.DoldKan.oplaxMonoidalN` and
  `CategoryTheory.Idempotents.DoldKan.laxMonoidalΓ` (`AlgebraicTopology/DoldKan/Monoidal.lean`), for an
  idempotent complete monoidal preadditive category with finite coproducts (HA, Ex. 1.2.3.26).

### From TauCetiRoadmap.InfinityCategoryTheory (earlier Parts)

- Definitions, by owner Part. Part InfinityCategoryFoundations: fully faithful functors (§2.1); functor ∞-categories, cores
  and full subcategories, cones, final and zero objects, limits, colimits and pushout and pullback squares (§1.2); size (§1.1)
  and the ∞-category of spaces (§7.1); truncated objects (§10.1). Part LimitsAndKanExtensions: cofinality (§2.1), Kan
  extensions (§7.1), presheaves (§8.1), simplicial objects (§9.1). Part AdjunctionsAndLocalizations: adjunctions
  (§1.1), localizations (§2.1). Part PresheavesAndCompletions: idempotent completeness (§2.1), filtered simplicial
  sets (§4.1), compact objects and Ind-objects (§6.1). Part AccessibleInfinityCategories: accessible ∞-categories (§4.1). Part
  PresentableInfinityCategories: local objects (§1.2), presentable and compactly generated ∞-categories (§1.1). Pointed
  ∞-categories, fibers and cofibers, stable ∞-categories and suspension and loop functors are defined here (§1.1). Assumed: the
  definitions as stated there (HA, Defs. 1.1.1.1–1.1.1.9, §1.1.2; HTT, §§1.2.7–1.2.16, Defs. 4.1.1.1–6.1.2.2,
  as cited at each claim).
- Part InfinityCategoryFoundations: slices along inner and left fibrations (§4.2, HTT, Prop. 2.1.2.1), coslices and
  restriction along anodyne maps (§4.3, HTT, Prop. 2.1.2.5), left fibrations over Kan complexes (§5.3, HTT,
  Lemma 2.1.3.3), uniqueness of final objects and colimits (§5.5, HTT, Prop. 1.2.12.9, Rems. 1.2.12.6,
  1.2.13.5), colimits in overcategories (§8.3, HTT, Prop. 1.2.13.8), quasicategories with discrete mapping
  spaces are nerves (§10.6, HTT, Prop. 2.3.4.18).
- Part CartesianFibrations: functor ∞-categories are invariant under categorical equivalence (§3.4, HTT, Prop. 1.2.7.3 (2), (3)); the Cartesian
  model structure over a point (§5.7, HTT, Prop. 3.1.3.7) and its fibrant objects (§5.8, HTT, Prop. 3.1.4.1).
- Part LimitsAndKanExtensions: the mapping-space criterion for colimits (§1.4, HTT, Lemma 4.2.4.3); cofinal
  maps (§2.3, HTT, Prop. 4.1.1.3; §2.5, HTT, Prop. 4.1.1.8); homotopy limits in locally Kan simplicial
  categories are limits (§3.2, HTT, Thm. 4.2.4.1), with the *Size* paragraph of §3.3 and the object-by-object
  size argument of §3.7 (step 5); tensors (§3.5, HTT, §4.4.4); `Cat∞` ≃ N((Set⁺_Δ)°) with small limits (§3.8); Theorem A (§5.4, HTT, Thm. 4.1.3.1); decompositions of
  diagrams (§6.1, HTT, Not. 4.2.3.1; §6.3, HTT, Cor. 4.2.3.10; §6.4, HTT, Prop. 4.2.3.14); reduction to
  pushouts, coproducts and pullbacks (§6.5, HTT, Lemma 4.4.2.1, Props. 4.4.2.2, 4.4.2.6, 4.4.2.7, Cor. 4.4.2.4,
  Prop. 4.4.3.2); relative colimits in fibrations (§7.3, HTT, Prop. 4.4.2.9); existence of Kan extensions and
  the trivial fibration (§7.4, HTT, Lemmas 4.3.2.7, 4.3.2.13, Prop. 4.3.2.15); Kan extensions along arbitrary
  functors (§7.6, HTT, Def. 4.3.3.2); pointwise limits and colimits in functor ∞-categories (§8.2, HTT,
  Prop. 5.1.2.2, Cor. 5.1.2.3); pointed objects (§9.3, HTT, Def. 7.2.2.1); geometric realization and
  totalization (§9.4, HTT, Not. 6.1.2.12); semisimplicial objects (§9.5, HTT, Not. 6.5.3.6); the cofinality of
  injective maps into Δ≤n (§9.6, HA, Lemma 1.2.4.17).
- Part AdjunctionsAndLocalizations: adjoints preserve limits and colimits (§1.5, HTT, Prop. 5.2.3.5), the
  mapping property of Kan extensions (§1.8, HTT, Prop. 4.3.2.17), the criteria for localization functors
  (§2.3, HTT, Props. 5.2.7.4, 5.2.7.8), the localization C[W⁻¹] at a class of morphisms (§2.4, HA,
  Def. 1.3.4.1, Rem. 1.3.4.2).
- Part Straightening: limits of ∞-categories and the limit of a tower of equivalences (§3.2, HTT,
  Prop. 3.3.3.1).
- Part PresheavesAndCompletions: the Yoneda embedding and corepresented functors (§1.1, HTT, §5.1.3);
  Yoneda's lemma and the limit-preserving Yoneda embedding (§1.3, HTT,
  Props. 5.1.3.1, 5.1.3.2), the free cocompletion (§1.4, HTT, Thm. 5.1.5.6, Def. 5.1.5.7), duality of adjoints
  (§1.5, HTT, Def. 5.2.6.1, Prop. 5.2.6.2), retracts as sequential colimits (§2.4, HTT, Prop. 4.4.5.17),
  idempotent completions (§3.1, HTT, Def. 5.1.4.1), filtered ∞-categories are weakly contractible (§4.3, HTT,
  Lemma 5.3.1.20), filtered colimits in S are left exact (§6.2, HTT, Prop. 5.3.3.3), Ind-objects (§6.4, HTT,
  Prop. 5.3.5.3, Cor. 5.3.5.4, Prop. 5.3.5.14), the universal property of Ind_κ (§6.5, HTT, Lemma 5.3.5.8,
  Props. 5.3.5.10, 5.3.5.11).
- Part AccessibleInfinityCategories: colimits in a categorical pullback (§1.2, HTT, Lemma 5.4.5.5), colimits of κ-compact
  objects (§2.2, HTT, Cor. 5.3.4.15), ω-compactness of finite simplicial sets in `Cat∞` (§3.1, SAG, proof of
  Lemma 4.5.3.1), compact objects of Ind and idempotent completion (§4.4, HTT, Lemma 5.4.2.4), Ind and finite
  poset diagrams (§4.6, HTT, Prop. 5.3.5.15), the generator characterization (§5.1, HTT, Prop. 5.4.2.2).
- Part PresentableInfinityCategories: compact objects under adjoints (§1.4, HTT, Props. 5.5.7.2, Cor. 5.5.7.3), accessible
  localization functors (§1.5, HTT, Prop. 5.5.1.2), the presentation theorem (§1.6, HTT, Thm. 5.5.1.1,
  Prop. 5.5.1.9), representable presheaves and small limits (§2.1, HTT, Prop. 5.5.2.2, Cor. 5.5.2.4), the
  adjoint functor theorem (§2.2, HTT, Cor. 5.5.2.9), functor ∞-categories (§3.1, HTT, Prop. 5.5.3.6), slices
  (§3.2, HTT, Props. 5.5.3.10–5.5.3.12), strongly saturated classes (§4.1, HTT, Def. 5.5.4.5, Rem. 5.5.4.7),
  mapping spaces under an object (§4.3, HTT, Lemma 5.5.5.12), the localization S⁻¹C (§4.4, HTT,
  Props. 5.5.4.15, 5.5.4.20), strongly reflective subcategories (§4.6, HTT, Lemmas 5.5.4.18, 5.5.4.19,
  Prop. 5.5.4.16), adjoining colimits (§4.7, HTT, Prop. 5.3.6.2), `Pr^R` (§5.1, HTT, Def. 5.5.3.1), limits of
  presentable ∞-categories (§5.2, HTT, Prop. 5.5.3.13, Thm. 5.5.3.18), filtered colimits of ∞-categories with
  finite colimits (§5.4, HTT, Prop. 5.5.7.11), P_Σ (§7.1, HTT, Def. 5.5.8.8, Prop. 5.5.8.10), its universal
  property (§7.3, HTT, Prop. 5.5.8.15) and its truncated objects (§7.5); the closure of local objects under
  limits (§4.5); Postnikov completeness (§6.4, HTT, Def. 5.5.6.23).

### From TauCetiRoadmap.ModelCategoryTheory

- Part KanQuillen: Whitehead's theorem for Kan complexes (§1.3), n-connective Kan complexes (§4.1),
  n-truncated Kan complexes (§5.1), Eilenberg–MacLane complexes, their uniqueness and the pointed maps between
  them (§5.4–§5.6) (HTT, §A.2.7).
- Part SimplicialCategories: homotopy limits of towers (§3.2, HTT, definitions following Prop. A.2.8.7).
- Part ModelCategories: latching and matching objects (§7.5, HTT, Not. A.2.9.7).

## How to read the build

Layer 1 defines stable ∞-categories, constructs suspension, loops and shifts, and proves that hC is triangulated. Layer 2 answers when an ∞-category is
stable and which elementary constructions keep it so (stable subcategories, functor ∞-categories, the
pushout–pullback criterion) and defines exact functors. Layer 3 develops t-structures, truncations, the
abelian heart and t-exact functors. Layer 4 identifies ℤ-complexes with filtered objects and computes colimits
over truncated simplex categories. Layer 5 extends the classical Dold–Kan correspondence to additive
categories that are not idempotent complete; it needs only the additive categories of §1.4. Layer 6 uses the
presheaf and Ind machinery of the earlier Parts: Ind-objects, idempotent completions and limits of towers, the
limits and filtered colimits of `Cat∞^Ex`, and Verdier quotients. Layer 7 builds excisive functors, spectrum
objects and their stability and universal property, and defines spectra. Layer 8 uses stabilization to show
that the left completion of a t-structure is stable with a t-structure. Layer 9 treats presentable
stabilization, the freeness of spectra, presentable stable ∞-categories and compact generation, with the
Ind-completion of a Verdier quotient. Layer 10 identifies Sp(𝒫) with limit-preserving functors to spectra and
builds the stable P_Σ. Layer 11 constructs accessible t-structures, the t-structure on spectra and the
coproduct criteria for colimits and compactness, and ends with t-structures compatible with filtered colimits.
Layer 12 proves the ∞-categorical Dold–Kan correspondence, builds the Tot tower and cosimplicial replacement,
and constructs the spectral sequences of filtered, simplicial and cosimplicial objects. The order is forced by
dependencies: Layer 6 needs Ind and presentability, the left completion needs stabilization, the t-structure
on spectra needs presentable stabilization and completeness, and convergence for simplicial objects needs left
completeness.

Layer 1 opens with the definitions this Part owns (§1.1): pointed ∞-categories, fiber and cofiber sequences, stable
∞-categories, and suspension and loop functors.

## Layer 1: Stable ∞-categories and the triangulated homotopy category

### 1.1 Pointed ∞-categories, fiber and cofiber sequences, stability and suspension

**1.1.1.** Define C to be pointed when it has a zero object in the sense of Part InfinityCategoryFoundations §1.2 (HA, Def. 1.1.1.1,
p. 17). The `Suggested.lean` declaration is `IsPointed`; `IsZeroObject` is Part InfinityCategoryFoundations', restated.

**Checks.**
- Δ[0] and the nerve of abelian groups are pointed; Δ[1] and the nerve of sets are not (the Checks of Part
  InfinityCategoryFoundations §1.2).

*Needs:* Part InfinityCategoryFoundations §1.2.3 (zero objects).

**1.1.2.** Define, in a pointed ∞-category, a triangle as a square `s : Δ[1] × Δ[1] → C` whose vertex (0, 1) is a zero
object (the `Suggested.lean` helper `corner` names that vertex): with X = s(0, 0), Y = s(1, 0) and
Z = s(1, 1), it is drawn X → Y along Δ[1] × {0}, X → 0, 0 → Z, and Y → Z along {1} × Δ[1]. A triangle is a
fiber sequence when it is a pullback square and a cofiber sequence when it is a pushout square (HA,
Def. 1.1.1.4, p. 18). Define a fiber of g : X → Y as a fiber sequence W → X → Y with g as second map, and a
cofiber of g as a cofiber sequence X → Y → Z with g as first map, written `fib(g)` and `cofib(g)` (HA,
Def. 1.1.1.6, p. 19).

**Checks.**
- In the nerve of abelian groups, ℤ → ℤ (multiplication by 2) → ℤ/2 is both a fiber and a cofiber sequence.
- There, ℤ/2 → 0 → 0 is a cofiber sequence (the pushout of 0 ← ℤ/2 → 0 is 0) and not a fiber sequence (the
  pullback of 0 → 0 ← 0 is 0, not ℤ/2).
- In any pointed ∞-category the fiber of an identity is a zero object.

*Needs:* Part InfinityCategoryFoundations §1.2.3 (zero objects), §1.2.4 (pullback and pushout squares).

**1.1.3.** Define an ∞-category to be stable when it has a zero object, every morphism has a fiber and a cofiber, and a
triangle is a fiber sequence exactly when it is a cofiber sequence (HA, Def. 1.1.1.9, p. 19). The
`Suggested.lean` declaration is `IsStable`, with fibers taken along {1} × Δ[1] and cofibers along Δ[1] × {0}.

**Checks.**
- Δ[0] is stable: its only square is constant at the zero object.
- The nerve of abelian groups has a zero object, fibers and cofibers but is not stable: ℤ/2 → 0 → 0 is a
  cofiber sequence and not a fiber sequence (Checks above). A definition asking only for fibers and cofibers
  would accept it.
- S∗ is pointed with fibers and cofibers but is not stable: S⁰ → Δ[0] → S¹ is a cofiber sequence, while the
  fiber of Δ[0] → S¹ is the loop space ΩS¹ ≃ ℤ, not S⁰.

*Needs:* §1.1.1 and §1.1.2.

**1.1.4.** For a pointed ∞-category C with cofibers, for instance one with finite colimits, let
`M^Σ ⊆ Fun(Δ[1] × Δ[1], C)` be the full subcategory of pushout squares with zero objects at (0, 1) and (1, 0);
these are the cofiber sequences of the maps X → 0. Define a suspension functor as a composite of a map
`s : C → M^Σ` with `ev_(0,0) ∘ s = id` and evaluation at (1, 1) (HA, §1.1.2, pp. 23–24). Dually, for a pointed
C with fibers, for instance one with finite limits, let `M^Ω` be the full subcategory of pullback squares with
zero objects at (0, 1) and (1, 0), and define a loop functor as a composite of a map `s : C → M^Ω` with
`ev_(1,1) ∘ s = id` and evaluation at (0, 0) (HA, §1.1.2, p. 24, the paragraph before Rem. 1.1.2.6). §1.3
proves that both exist and are unique up to equivalence.

**Checks.**
- In Δ[0] every suspension functor and every loop functor is the identity: the only square is constant at the
  zero object.
- In the nerve of abelian groups every suspension functor is zero: the pushout of 0 ← X → 0 is 0, so `M^Σ`
  consists of squares with zero at (1, 1). Dually every loop functor is zero.
- In S∗ the suspension of S⁰ is the circle: π₁ of the pushout of ∗ ← S⁰ → ∗ is ℤ. A definition taking the
  cofiber of the identity of X, rather than the pushout along two zero maps, would give the point. The loop
  space of the circle is ℤ, so `Ω ∘ Σ` is not equivalent to the identity there: Σ and Ω are not inverse in
  general.

*Needs:* §1.1.1–§1.1.3; Part InfinityCategoryFoundations §1.2 (functor ∞-categories), §1.2.4 (pushout and pullback squares).

### 1.2 Zero morphisms, the cofiber functor and self-duality

**1.2.1.** Prove that in a pointed ∞-category C cofibers are unique and functorial in the morphism, and that the
cofiber functor is a left adjoint (HA, Rems. 1.1.1.7, 1.1.1.8, p. 19). Let E ⊆ Fun(Δ[1] × Δ[1], C) be the full
subcategory of cofiber sequences.

- Composition through 0 gives, for X and Y, a map from the contractible space Map(X, 0) × Map(0, Y) to
  Map(X, Y), hence a well-defined zero morphism 0 : X ⟶ Y of hC; hC has a zero object, and Mathlib's zero
  morphisms of `HasZeroObject` on hC are these (HA, Rem. 1.1.1.3, p. 18).
- Restriction to the top edge E ⟶ Fun(Δ[1], C) is a Kan fibration whose fibers are empty or contractible,
  and a trivial fibration when every morphism has a cofiber (HA, Rem. 1.1.1.7, p. 19). The route is two
  left Kan extensions, each a trivial fibration by HTT 4.3.2.15.
- When every morphism has a cofiber, the cofiber functor cofib : Fun(Δ[1], C) ⟶ C (a section of that
  trivial fibration followed by evaluation at (1, 1)) is left adjoint to the functor C ⟶ Fun(Δ[1], C)
  sending X to a zero morphism 0 ⟶ X, the left Kan extension along {1} ⊆ Δ[1]; hence cofib preserves every
  colimit that exists in Fun(Δ[1], C) (HA, Rem. 1.1.1.8, p. 19). The adjunction is checked on mapping
  spaces, and preservation of colimits is HTT 5.2.3.5.
- Passing to Mathlib's `SSet.op` exchanges zero objects, fibers and cofibers, and fiber and cofiber
  sequences, so the opposite of a stable ∞-category is stable, and fib in C is cofib in C^op (HA,
  Rem. 1.1.1.13, p. 20). The `Suggested.lean` declaration is `isStable_op`.

*Needs:* §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Defs. 1.1.1.4, 1.1.1.6), §1.1.3 (HA, Def. 1.1.1.9); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2);
Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Part LimitsAndKanExtensions §7.4.6 (HTT,
Prop. 4.3.2.15); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Mathlib `SSet.hoFunctor`,
`SSet.op`, `CategoryTheory.Limits.HasZeroObject`.

### 1.3 Existence of suspension and loop functors, and shifts

**1.3.1.** Let Σ = Σ_C be a suspension functor of a pointed ∞-category C with cofibers, and Ω = Ω_C a loop functor of a
pointed C with fibers, as defined in §1.1 (HA, §1.1.2, construction following Def. 1.1.2.5,
pp. 23–24; Rem. 1.1.2.6, p. 24), with the full subcategories M^Σ and M^Ω of §1.1. Prove that when C has cofibers, evaluation at (0, 0) is a
trivial fibration M^Σ ⟶ C (two applications of HTT 4.3.2.15), so a suspension functor exists, and dually that a
loop functor exists when C has fibers (HA, §1.1.2, construction following Def. 1.1.2.5, p. 24).

- Σ and Ω are well defined up to a contractible space of choices, since the trivial fibration has
  contractible fibers.
- When C is stable, M^Σ and M^Ω coincide, so Σ and Ω are mutually inverse equivalences.
- When C is pointed with cofibers, Map(ΣX, Y) ≃ Ω Map(X, Y) naturally, where Map(X, Y) is based at the
  zero map; when C also has fibers, Σ is left adjoint to Ω (HA, Rem. 1.1.2.8, p. 24). Hence
  π₀ Map(ΣX, Y) ≅ π₁ Map(X, Y) is a group and π₀ Map(Σ²X, Y) ≅ π₂ Map(X, Y) an abelian group, naturally
  in X and Y, with cofibers alone.

**1.3.2.** Define, for C stable and n ∈ ℤ, the shift X ↦ X[n] as the n-th power of Σ for n ≥ 0 and the (−n)-th
power of Ω for n ≤ 0, and use the same notation for the induced functors on hC (HA, Not. 1.1.2.7, p. 24).
When C is only pointed with cofibers but Σ is an equivalence, X[n] = ΣⁿX for n ≥ 0, and X[−n] denotes the
n-th power of a chosen inverse of Σ, well defined up to equivalence since inverses of an equivalence are.

**Checks.**

- For C = Δ[0], X[n] = X for every n ∈ ℤ.
- For C stable, X[0] ≃ X and X[1][−1] ≃ X, so the shifts compose additively up to equivalence; a convention
  X[n] = ΣⁿX for all n would not be defined for n < 0.
- In the nerve of abelian groups Σ ≃ 0 (§1.1, Checks), which is an equivalence only for the zero category, so
  X[−1] is not defined there: the negative shifts, and §1.7, need Σ to be an equivalence.

*Needs:* §1.1 (HA, Defs. 1.1.1.1, 1.1.1.6, 1.1.1.9; §1.1.2, suspension and loop functors); Part InfinityCategoryFoundations §1.2 (HTT,
§1.2.11; Def. 1.2.12.3, final objects; pushout and pullback squares); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Part
LimitsAndKanExtensions §7.4.6 (HTT, Prop. 4.3.2.15); Mathlib `SSet.rlp_monomorphisms` (HTT, Ex. 2.0.0.2).

### 1.4 Additive and triangulated categories

**1.4.1.** Prove that Lurie's additive categories are Mathlib's (HA, Def. 1.1.2.1, p. 21). A category is additive in
Lurie's sense when it has finite products and coproducts and a zero object, each canonical map X ⊔ Y ⟶ X × Y
is an isomorphism, and the induced commutative monoids Hom(X, Y) are groups; X ⊕ Y is the direct sum (HA,
Rem. 1.1.2.4, p. 22). The target: such a category carries a unique Mathlib `Preadditive` structure whose
biproducts are the given ones, and a `Preadditive` category with `HasFiniteBiproducts` and a zero object is
additive in Lurie's sense.

**Checks.**

- Abelian groups are additive: ℤ ⊕ ℤ is both product and coproduct.
- The category of commutative monoids has biproducts but ℕ = Hom(ℕ, ℕ) is not a group, so it is not
  additive; a definition dropping the group condition would accept it.
- The category of pointed sets has a zero object, products and coproducts, but the wedge {∗, a, b} ⟶ the
  product of two two-element sets is not surjective, so the canonical map is not an isomorphism.

*Needs:* Mathlib `CategoryTheory.Preadditive`, `CategoryTheory.Limits.HasFiniteBiproducts`,
`CategoryTheory.Limits.HasZeroObject`.

**1.4.2.** Prove that Verdier's triangulated categories in Lurie's form are Mathlib's (HA, Def. 1.1.2.5, pp. 22–23):
an additive category with an autoequivalence X ↦ X[1] and a class of distinguished triangles satisfying
Lurie's TR1–TR4 is the same as a `Pretriangulated` category (TR1–TR3) that is `IsTriangulated` (TR4). No new
definition is made; the target is that Lurie's forms of TR3 and TR4 are equivalent to Mathlib's fields and
to `Triangulated.Octahedron`.

**Checks.**

- The zero category with its unique triangle is triangulated in both senses.
- Mathlib's derived category of abelian groups satisfies Lurie's axioms with X[1] the shift of complexes;
  the triangle ℤ ⟶ ℤ ⟶ ℤ/2 ⟶ ℤ[1] with first map multiplication by 2 is distinguished.
- A class of triangles omitting X ⟶ X ⟶ 0 ⟶ X[1] fails TR1 (c) and Mathlib's corresponding axiom.

*Needs:* §1.4.1 (additive categories); Mathlib `CategoryTheory.Pretriangulated`,
`CategoryTheory.IsTriangulated`, `CategoryTheory.Triangulated.Octahedron`.

### 1.5 The additive structure of the homotopy category

**1.5.1.** Prove that if C is pointed with cofibers and Σ is an equivalence, then hC is additive, and C itself has
finite coproducts, the coproduct X ⊔ Y being the cofiber of the zero map X[−1] ⟶ Y (HA, Lemma 1.1.2.9,
p. 24). The route is Lurie's: the abelian group structure on Hom_hC(X, Y) ≅ π₀ Map(Σ²X′, Y) of §1.3 (with
X ≃ Σ²X′) is natural, and coproducts come from cofib preserving coproducts in Fun(Δ[1], C) (§1.2,
HTT 5.1.2.2).

*Needs:* §1.2.1 (cofiber functor); §1.3.1, §1.3.2 (shifts, Σ ⊣ Ω and Map(ΣX, Y) ≃ Ω Map(X, Y)); §1.4.1 (additive
categories); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Part LimitsAndKanExtensions §8.2.2 (HTT,
Prop. 5.1.2.2); Tau Ceti `SSet.KanComplex.π`.

**1.5.2.** Prove that for C pointed with cofibers and zero objects 0, 0′, a square X ⟶ 0, X ⟶ 0′, 0 ⟶ Y, 0′ ⟶ Y (any
commutative square, not necessarily a pushout) classifies a class θ ∈ Hom_hC(X[1], Y) ≅ π₁ Map(X, Y), and
its transpose, exchanging 0 and 0′, classifies −θ (HA, Lemma 1.1.2.10, p. 25). The route is Lurie's: the
space of such squares with fixed X ⟶ 0 is contractible (0 initial), its restriction is a left fibration over
a Kan complex, hence a Kan fibration, and the transposition becomes loop reversal.

*Needs:* §1.3.1 (the group structure on π₀ Map(ΣX, Y)); §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Def. 1.1.1.6);
Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1); Part InfinityCategoryFoundations §5.3.1 (HTT, Lemma 2.1.3.3); Part
InfinityCategoryFoundations §5.5 (HTT, Rem. 1.2.12.6); Tau Ceti `SSet.KanComplex.π`.

### 1.6 Distinguished triangles

**1.6.1.** Define, for C pointed with cofibers, the distinguished triangles of hC (HA, Def. 1.1.2.11, p. 26). A
diagram X ⟶ Y ⟶ Z ⟶ X[1] in hC is distinguished when there is a diagram Δ[1] × Δ[2] ⟶ C with rows X ⟶ Y ⟶ 0
and 0′ ⟶ Z ⟶ W, both squares pushouts and 0, 0′ zero objects, whose edges represent f and g, and whose last
map is h followed by the equivalence W ≃ X[1] given by the outer rectangle.

- The class is closed under isomorphism of triangles in hC.
- The definition uses only cofibers, not stability.

**Checks.**

- X ⟶ X ⟶ 0 ⟶ X[1] with first map the identity is distinguished: the diagram with 0 = Z and W ≃ X[1]
  exists because the cofiber of an equivalence is zero.
- For C = Δ[0] every triangle is distinguished. For C stable, X ⟶ 0 ⟶ Z ⟶ X[1] is distinguished exactly when
  its last map is an isomorphism; a definition allowing any last map would accept the zero map for Z ≠ 0.
- The last map is h followed by W ≃ X[1]: a definition using h alone would land in W, a cofiber of Y ⟶ Z and
  not literally X[1].

*Needs:* §1.3.2 (the shift X[1]); §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Def. 1.1.1.6).

**1.6.2.** Prove that for C pointed with cofibers and a diagram Δ[2] × Δ[1] ⟶ C with columns X ⟶ Y ⟶ 0′ and
0 ⟶ Z ⟶ W, both squares pushouts and 0, 0′ zero, the triangle X ⟶ Y ⟶ Z ⟶ X[1] whose last map is −h′ is
distinguished, where h′ is Z ⟶ W followed by the outer-square equivalence W ≃ X[1] (HA, Lemma 1.1.2.13,
p. 27). HA states the lemma for C stable; the route, which compares with the definition through the
transposition sign of §1.5, uses only cofibers, and §1.7 needs it in this generality.

*Needs:* §1.3.1 (the group structure on Hom(X[1], X[1]) ≅ π₁ Map(X, X[1])); §1.5.2 (transposition gives −θ);
§1.6.1 (distinguished triangles).

### 1.7 The triangulation theorem

**1.7.1.** Prove the shift lemma, a statement about ordinary categories: an adjoint autoequivalence (S, T, η, ε) of a
category D, with η : 𝟭 ≅ T ∘ S and ε : S ∘ T ≅ 𝟭, defines a shift of D by ℤ, a Mathlib `HasShift D ℤ` built
through `ShiftMkCore` (no source states this; HA uses it in Thm. 1.1.2.14 without proof, and Mathlib at
the pin has no construction of a ℤ-shift from an autoequivalence). The data:

- the shift by n is Sⁿ for n ≥ 0 and T^(−n) for n ≤ 0;
- the `zero` isomorphism is the identity, so Mathlib's `shiftFunctorZero` is the identity;
- `add m n`, from the shift by m + n to the shift by m followed by the shift by n, is the identity when m and
  n have the same sign. Otherwise it inserts the min(|m|, |n|) pairs S T or T S at the junction, through ε⁻¹
  or η, one pair at a time, each new pair inserted at the junction, inside the pairs already inserted: for
  m ≥ n > 0, `add m (−n)` is T^(n−1) η S^(n−1) ∘ ⋯ ∘ T η S ∘ η, whiskered on the right by S^(m−n), and the other mixed-sign cases are formed in
  the same way. By the coherence argument below, any other order of insertion gives the same isomorphism.

The conditions `assoc_hom_app`, `zero_add_hom_app` and `add_zero_hom_app` of `ShiftMkCore` hold for all
integers. The route:

- The two unit conditions hold on the nose: `zero` is the identity, and `add 0 n` and `add m 0` insert no
  pair.
- For `assoc_hom_app`, write composites of S and T as words, the functor applied first on the right. Both
  sides are components of isomorphisms between words that are vertical composites of whiskerings X α Y, with
  X and Y words and α one of η, η⁻¹, ε, ε⁻¹: `add` is one by construction, the shift by m₃ applied to it is a
  whiskering on the left, and its component at the shift by m₁ of an object is a whiskering on the right. It
  suffices that any two such composites with the same source and target words agree.
- Call X ε Y : X S T Y ⟶ X Y and X η⁻¹ Y : X T S Y ⟶ X Y reductions. Each shortens a word by two, and a word
  with no adjacent S T or T S is Sᵈ or T⁻ᵈ, with d the number of letters S minus the number of letters T.
  So every word W reduces to Sᵈ or T⁻ᵈ.
- Any two chains of reductions from W to Sᵈ or T⁻ᵈ compose to the same isomorphism c_W, by induction on the
  length of W. Given two different first steps W ⟶ W₁ and W ⟶ W₂, it suffices to find reductions
  W₁ ⟶ W₃ ⟵ W₂ with equal composites, since the inductive hypothesis then applies to W₁, W₂ and W₃. If the
  two canceled pairs are disjoint, cancel the other pair after each: the composites agree by the interchange
  law. If they overlap, they lie in a subword S T S, where the steps are ε S and S η⁻¹, or in a subword T S T,
  where they are η⁻¹ T and T ε. Then W₁ = W₂, and the steps are equal by the triangle identities
  (ε S) ∘ (S η) = id and (T ε) ∘ (η T) = id.
- For a whiskered generator α : W ⟶ W′, c_W′ ∘ α = c_W. If α is a reduction, this is the previous step. If α
  is X η Y or X ε⁻¹ Y, it is inverse to a reduction β : W′ ⟶ W, and c_W′ = c_W ∘ β.
- By induction on the number of factors, every composite φ : W ⟶ W′ of whiskered generators satisfies
  c_W′ ∘ φ = c_W. So φ = c_W′⁻¹ ∘ c_W depends only on W and W′.

The triangle identities enter only at the overlaps S T S and T S T. This is the coherence theorem for an
object with an adjoint inverse in a strict monoidal category, here the endofunctors of D under composition.
Words such as S S T are not 1-cells of the free-living adjoint equivalence, so coherence for adjoint
equivalences in a 2-category does not give it directly.

**Checks.**

- For D the trivial category, every condition holds trivially, and the shift by every n is the identity.
- For S = T = 𝟭 and η = ε = id, every `add m n` is the identity.
- The triangle identities are needed. Take D the one-object category of ℤ/2, S = T = 𝟭, u the generator
  of ℤ/2 (a nonidentity automorphism of 𝟭, since ℤ/2 is abelian), η = u and ε = id. The triangle identity
  would say u = id, which fails. With these data `add 1 (−1)` is u and `add (−1) 1` is the identity, and the
  two sides of `assoc_hom_app` for (1, −1, 1) are u and the identity, which differ.
- The two cases of the cancellation step both occur. For (1, −1, 1) the target word is S T S, and the two
  sides are S η and ε⁻¹ S, equal exactly by the triangle identity (ε S) ∘ (S η) = id: the overlap case. For
  (−1, 2, −1) the target word is T S S T, and the two sides are (T S ε⁻¹) ∘ η and (η S T) ∘ ε⁻¹, both equal to
  the horizontal composite of η and ε⁻¹ by the interchange law: the disjoint case. For (2, −1, −1) and
  (1, 1, −1) the two sides are equal as written, to (T η S) ∘ η and η S.

*Needs:* Mathlib `CategoryTheory.ShiftMkCore`, `CategoryTheory.hasShiftMk` (`CategoryTheory/Shift/Basic.lean`);
Mathlib `CategoryTheory.Equivalence` (adjoint equivalences and their triangle identities).

**1.7.2.** Prove that if C is pointed with cofibers and Σ is an equivalence, then hC, with the shift of §1.3 and the
distinguished triangles of §1.6, is triangulated (HA, Thm. 1.1.2.14, p. 27). The intended form installs
`HasShift` with additive shift functors, `Preadditive`, `Pretriangulated` and `IsTriangulated` on
`SSet.hoFunctor.obj C`, with distinguished triangles exactly those isomorphic to the triangles of §1.6.
When C is stable the hypotheses hold, and this is the triangulated structure that the later layers use. The
shift functors are the functors X ↦ X[n] of §1.3 on hC, with Σ and a chosen inverse made into an adjoint
equivalence (Σ ⊣ Ω when C is stable), and the shift is the one the adjoint equivalence generates by the
shift lemma (§1.7.1). The axioms are proved as follows, with E ⊆ Fun(Δ[1] × Δ[2], C) the diagrams of §1.6.

- TR1 and TR3: restriction to the first edge E ⟶ Fun(Δ[1], C) is a trivial fibration (HTT 4.3.2.15 per
  Kan-extension step); hence every morphism of hC extends to a distinguished triangle, the class contains
  X ⟶ X ⟶ 0 ⟶ X[1], and a square between first edges extends to a morphism of triangles, by lifting with
  Δ[1] as a parameter (HA, Thm. 1.1.2.14, pp. 27–29).
- TR2: a triangle X ⟶ Y ⟶ Z ⟶ X[1] is distinguished exactly when its rotation Y ⟶ Z ⟶ X[1] ⟶ Y[1], with
  last map −f[1], is (HA, Thm. 1.1.2.14, axiom TR2, pp. 28–29): extend by one more pushout and apply the
  column lemma of §1.6; the converse uses that Σ is an equivalence.
- TR4: for composable f : X ⟶ Y and g : Y ⟶ Z, the distinguished triangles on f, g and g ∘ f extend, with a
  distinguished triangle on the cofibers, to a Mathlib `Triangulated.Octahedron` (HA, Thm. 1.1.2.14, axiom
  TR4, pp. 29–30): one staircase of pushout squares with zero corners, built by HTT 4.3.2.15, has the four
  triangles as rectangles.

*Needs:* §1.3.2 (shifts); §1.4.2 (triangulated categories); §1.5.1 (hC additive); §1.6.1 (distinguished triangles),
§1.6.2 (the column lemma); §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Def. 1.1.1.6); Part LimitsAndKanExtensions §7.4.6
(HTT, Prop. 4.3.2.15); Mathlib `CategoryTheory.Triangulated.Octahedron`; the shift lemma (§1.7.1).

### 1.8 Ext groups

**1.8.1.** Define, for X and Y in a stable ∞-category, Extⁿ_C(X, Y) = Hom_hC(X[−n], Y), an abelian group; for n < 0
it is π₋ₙ Map_C(X, Y) (HA, Not. 1.1.2.17, p. 30).

**Checks.**

- Ext⁰_C(X, Y) = Hom_hC(X, Y); in Mathlib's derived category of abelian groups, Ext¹(ℤ/2, ℤ) ≅ ℤ/2 and
  Ext¹(ℤ, ℤ/2) = 0, which fixes the direction of the shift: a definition Hom(X[n], Y) would give
  Ext¹(ℤ/2, ℤ) = Hom(ℤ/2[1], ℤ) = 0.
- Negative Ext groups are homotopy groups of mapping spaces: Ext⁻¹(ℤ, ℤ[1]) = Hom(ℤ[1], ℤ[1]) ≅ ℤ, while
  Ext¹(ℤ, ℤ[1]) = Hom(ℤ, ℤ[2]) = 0 in the same derived category. A definition putting πₙ Map(X, Y) in
  degree n would exchange the two values.
- Positive Ext groups are not homotopy groups of Map(X, Y): Ext¹(ℤ/2, ℤ) ≅ ℤ/2, while
  πₙ Map(ℤ/2, ℤ) = Hom(ℤ/2[n], ℤ) = 0 for every n ≥ 0. A definition through π∗ Map alone would lose every
  positive Ext group.

*Needs:* §1.3.1, §1.3.2 (shifts, πₙ Map(X, Y) as π₀ Map(ΣⁿX, Y)); §1.5.1 (hC additive); §1.1.3 (HA,
Def. 1.1.1.9).

### Examples

- The nerve of an abelian category is pointed with cofibers and has Σ ≃ 0 (§1.1, Checks of suspension functors), so §1.7
  applies to it only when it is zero. A nerve can still have a triangulated homotopy category: for C the
  nerve of Mathlib's `DerivedCategory` of abelian groups, hC is that category, but C is not stable. Colimits in
  the nerve of a category are the 1-categorical ones, and in any category with a zero object the pushout of
  0 ⟵ X ⟶ 0 exists and is 0, so ΣX ≃ 0 for every X, while general cofibers need not exist in C at all.
- The opposite of a stable ∞-category is stable (§1.2), and the shift of hC^op is the inverse of the shift
  of hC, with the distinguished triangles of hC reversed.
- The ∞-category of spectra (Layer 7) is stable, and §1.7 makes its homotopy category triangulated.

### Dependencies

Part InfinityCategoryFoundations, Part CartesianFibrations (functor ∞-categories), Part LimitsAndKanExtensions (Kan extensions along full
inclusions, pointwise colimits), Part AdjunctionsAndLocalizations (adjoints preserve colimits); Mathlib's
additive and triangulated categories; Tau Ceti's homotopy groups of Kan complexes.

## Layer 2: Stability criteria and exact functors

### 2.1 Stable subcategories and functor ∞-categories

**2.1.1.** Prove that if C is stable and K is a simplicial set, Fun(K, C) is stable (HA, Prop. 1.1.3.1, p. 30): zero
objects, fibers and cofibers are computed pointwise (HTT 5.1.2.2), and so are pullback and pushout squares.
The `Suggested.lean` declaration is `isStable_ihom`, stated with the `IsZeroObject`,
`IsPushoutSquare`, `IsPullbackSquare` and `IsStable` of the Conventions.

*Needs:* Part InfinityCategoryFoundations §1.2.4 (pushout and pullback squares); §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Defs. 1.1.1.4, 1.1.1.6), §1.1.3 (HA, Def. 1.1.1.9); Part CartesianFibrations §3.4.1 (HTT,
Prop. 1.2.7.3; Mathlib's instance `Quasicategory ((ihom K).obj C)`); Part LimitsAndKanExtensions §8.2.2 (HTT,
Prop. 5.1.2.2); Tau Ceti `SSet.IsInitialVertex`, `SSet.IsTerminalVertex`, `SSet.coslice.IsColimit`,
`SSet.slice.IsLimit`, `SSet.join`, `SSet.join.stdSimplexIso`.

**2.1.2.** Define a stable subcategory of a stable C as a full subcategory containing a zero object and closed under
fibers and cofibers; it is then stable (HA, Def. 1.1.3.2, p. 30).

- The intersection of stable subcategories is a stable subcategory.
- A nonempty full subcategory of a stable C closed under cofibers and under all translations X ↦ X[n] is a
  stable subcategory (HA, Lemma 1.1.3.3, p. 30). The route: fib(f) ≃ cofib(f)[−1] (§1.7), and cofib(id_X)
  is a zero object of the subcategory. Nonemptiness is needed: the empty full subcategory is closed under
  both operations and has no zero object. This is the closure lemma used throughout the Part.

**Checks.**

- A definition omitting the zero object would accept the empty full subcategory, which is closed under
  fibers and cofibers vacuously but is not stable, having no zero object.
- In spectra, the connective spectra are closed under cofibers and contain 0, but the fiber of 𝕊 ⟶ 0 is
  𝕊[−1], which is not connective; a definition requiring only cofibers would accept them.
- The subcategory of finite direct sums of copies of 𝕊 contains 0 and is not closed under the cofiber of
  multiplication by 2, so it is not a stable subcategory; a definition asking only for a zero object and
  direct sums would accept it.

*Needs:* §1.3.2 (shifts); §1.7.2 (the triangulation theorem); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Def. 1.1.1.6), §1.1.3 (HA, Def. 1.1.1.9).

### 2.2 The pushout–pullback criterion for stability

**2.2.1.** Prove that a pointed ∞-category C is stable exactly when it has finite limits and finite colimits and a
square in C is a pushout exactly when it is a pullback (HA, Prop. 1.1.3.4, p. 31). The route is Lurie's:
"if" is immediate; conversely C has finite coproducts (§1.5) and coequalizers, the coequalizer of f and f′
being cofib(f − f′), hence finite colimits (HTT 4.4.3.2), and dually finite limits. The pullback squares
form a stable subcategory D of the stable Fun(Δ[1] × Δ[1], C) (§2.1). The left Kan extension
i! : Fun(Λ[2,0], C) ⟶ Fun(Δ[1] × Δ[1], C) along the inclusion of the span preserves finite colimits (a left
adjoint, HTT 5.2.3.5), hence zero objects and cofiber sequences, hence fiber sequences, so the spans whose
pushout lies in D form a stable subcategory of Fun(Λ[2,0], C). Every span is a finite colimit of spans
X ⟵ X ⟶ X, Z ⟵ 0 ⟶ 0 and 0 ⟵ 0 ⟶ Z, whose pushouts are pullbacks because a pushout along an equivalence
is a pullback; the converse is dual. The `Suggested.lean` declaration is `isStable_iff_of_isPointed`, with
finite colimits and limits read as extensions of every diagram indexed by a simplicial set with finitely many
nondegenerate simplices to a colimit, resp. limit, diagram.

*Needs:* §1.5.1; §2.1.1, §2.1.2; §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Defs. 1.1.1.4, 1.1.1.6), §1.1.3 (HA, Def. 1.1.1.9); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2); Part LimitsAndKanExtensions §6.5.6 (HTT,
Prop. 4.4.3.2); Part LimitsAndKanExtensions §7.4.6 (HTT, Prop. 4.3.2.15); Part AdjunctionsAndLocalizations
§1.5.1 (HTT, Prop. 5.2.3.5).

**2.2.2.** Prove the higher-dimensional form: in a stable C a cube σ : (Δ[1])ⁿ ⟶ C is a colimit diagram exactly when
it is a limit diagram, the cube being viewed as a right cone on the cube minus its final vertex and as a
left cone on the cube minus its initial vertex (HA, Prop. 1.2.4.13, p. 73). The route is induction on n:
n = 0 says zero objects are initial and final; for n > 0, view σ as α : σ′ ⟶ σ″ in Fun((Δ[1])ⁿ⁻¹, C) and
apply the two bullets below, then cofib(α) ≃ fib(α)[1] (§1.7) and the inductive hypothesis.

- A square with vertical maps f′ : X′ ⟶ Y′ and f : X ⟶ Y is a pullback exactly when the induced map
  cofib(f′) ⟶ cofib(f) is an equivalence (HA, Lemma 1.2.4.14, p. 73): paste with the pushout square
  defining cofib(f), which is also a pullback (§2.2.1), and use the pasting lemma HTT 4.4.2.1.
- For C with K-indexed colimits and α : K^▷ × Δ[1] ⟶ C a natural transformation between p, q : K^▷ ⟶ C, α
  is a colimit diagram exactly when cofib(α) : K^▷ ⟶ C is (HA, Lemma 1.2.4.15, p. 74). The route: form the
  cofiber in the stable Fun(K^▷, C) (§2.1), compare with the colimit extensions of p|K and q|K
  (HTT 4.2.3.10), use that cofib commutes with colimits (§1.2), and apply the previous bullet.

*Needs:* §1.2.1 (cofib preserves colimits); §1.7.2; §2.1.1 (functor categories); §2.2.1;
Part InfinityCategoryFoundations §1.2.2 (HTT, Not. 1.2.8.4); §1.1.2 (HA, Def. 1.1.1.6), §1.1.3 (HA, Def. 1.1.1.9); Part InfinityCategoryFoundations §5.5.4 (HTT, Prop. 1.2.12.9, Rem. 1.2.13.5); Part
LimitsAndKanExtensions §6.3.2 (HTT, Cor. 4.2.3.10); Part LimitsAndKanExtensions §6.5.1 (HTT, Lemma 4.4.2.1).

### 2.3 Exact functors and exact localizations

**2.3.1.** Define a functor F : C ⟶ C′ between stable ∞-categories to be exact when it carries zero objects to zero
objects and fiber sequences to fiber sequences (HA, §1.1.4, opening definition, p. 33). Then F carries
triangles to triangles. Define `Cat∞^Ex` ⊆ `Cat∞` as the subcategory whose objects are the small stable
∞-categories and whose morphisms are the exact functors; identities and composites of exact functors are
exact (HA, §1.1.4, discussion following Prop. 1.1.4.1, p. 34). For stable C and E, Fun^Ex(C, E) ⊆ Fun(C, E)
is the full subcategory on the exact functors. A functor equivalent in Fun(C, E) to an exact one is exact,
so the core of Fun^Ex(C, E) is a union of components of the core of Fun(C, E); these are the mapping spaces
of `Cat∞^Ex`. The `Suggested.lean` declaration is `IsExact`.

**Checks.**

- The identity, Σ and Ω of a stable C are exact.
- Truncation τ≥0 on spectra carries zero to zero but not the cofiber sequence HZ[−1] ⟶ 0 ⟶ HZ
  to a cofiber sequence: its image is 0 ⟶ 0 ⟶ HZ. A definition asking only for preservation of zero
  objects would accept it.
- The functor X ↦ X ⊕ X preserves zero objects and fiber sequences, so it is exact; X ↦ τ≥0 X ⊕ X preserves
  zero objects but not fiber sequences, so it is not, although it preserves finite direct sums.
- `Cat∞^Ex` is not a full subcategory of `Cat∞`: for a stable C with a nonzero object X, the functor
  Δ[0] ⟶ C picking X goes between stable ∞-categories but carries the zero object to a nonzero one, so it
  is not exact; a definition taking the full subcategory on the stable ∞-categories would contain it.

*Needs:* §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Def. 1.1.1.4), §1.1.3 (HA, Def. 1.1.1.9); Tau
Ceti `SSet.catInfty` (HTT, Def. 3.0.0.1).

**2.3.2.** Prove that for a functor F between stable ∞-categories the following are equivalent: F preserves finite
limits; F preserves finite colimits; F is exact (HA, Prop. 1.1.4.1, p. 33). The route: exact functors
preserve coequalizers (the proof of §2.2) and finite coproducts (the proof of §1.5), hence finite colimits
(HTT 4.4.3.2); dually. This is the finite-limit criterion, the `Suggested.lean` declaration `isExact_tfae`,
stated with Part InfinityCategoryFoundations' `IsLeftExact` (§1.2, restated) and its dual, the `Suggested.lean`
declaration `IsRightExact`.

*Needs:* §1.5.1; §2.2.1; §2.3.1 (exact functors); Part LimitsAndKanExtensions §6.5.6 (HTT,
Prop. 4.4.3.2).

**2.3.3.** Prove that an exact functor F : C ⟶ C′ between stable ∞-categories induces a triangulated functor
hF : hC ⟶ hC′ of the triangulated homotopy categories of §1.7. HA uses this without stating it, for
instance in Def. 1.3.3.1 (p. 97). The intended form gives `SSet.hoFunctor.map F` the structure of a Mathlib
`Functor.CommShift ℤ` and proves `Functor.Additive` and `Functor.IsTriangulated` for it.

- *Additive.* F preserves finite coproducts (finite-limit criterion), and these are the biproducts of §1.5.
- *CommShift, the shift by 1.* Write M^Σ_C and M^Σ_C′ for the ∞-categories of squares of §1.3, and s_C, s_C′
  for the sections chosen there. Evaluation at (0, 0) is a trivial fibration M^Σ_C′ ⟶ C′ (§1.3), so
  composition with it, Fun(C, M^Σ_C′) ⟶ Fun(C, C′), is a trivial fibration too: trivial fibrations are the
  maps with the right lifting property against monomorphisms (Mathlib `SSet.rlp_monomorphisms`), C × − preserves
  monomorphisms, and the exponential law transfers the lifting property. F preserves zero objects and pushout
  squares, so F ∘ s_C and s_C′ ∘ F are both functors C ⟶ M^Σ_C′ lying over F. The fiber over F is a
  contractible Kan complex, so they are joined by an edge of it, an equivalence of Fun(C, M^Σ_C′) lying over
  id_F and unique up to a contractible choice. Its value at (1, 1) is an equivalence F ∘ Σ_C ≃ Σ_C′ ∘ F in
  Fun(C, C′), hence a natural isomorphism of functors hC ⟶ hC′ through h Fun(C, C′) ⟶ Fun(hC, hC′). It is
  `commShiftIso 1`, natural in X because it is built in the functor ∞-category, not objectwise.
- *CommShift, all n.* For n ≥ 0, define `commShiftIso n` by iterating `commShiftIso 1` along the isomorphisms
  `shiftFunctorAdd` of §1.7. `commShiftIso 0` is Mathlib's `Functor.CommShift.isoZero`, built from
  `shiftFunctorZero`; it is the identity because §1.7's `shiftFunctorZero` is the identity, so
  `commShiftIso_zero` holds. For n < 0, define `commShiftIso n` as the mate of `commShiftIso (−n)` through the
  units and counits of the adjoint equivalences Σ ⊣ Ω in hC and hC′, which is again an isomorphism.
  `commShiftIso_add` holds for m and n of the same sign by associativity of the iteration, since §1.7's
  `shiftFunctorAdd m n` is then the identity. For m and n of opposite signs, §1.7 builds `shiftFunctorAdd m n`
  from the unit and counit (the shift lemma of §1.7), and a mate of an isomorphism through adjoint
  equivalences is the isomorphism compatible with their units and counits. Comparing the two sides of
  `commShiftIso_add` therefore reduces, one canceled pair at a time, to that compatibility.
- *IsTriangulated.* F carries a diagram Δ[1] × Δ[2] ⟶ C of §1.6 for T = (f, g, h) to such a diagram in C′,
  since it preserves zero objects and pushout squares. That diagram is a §1.6 diagram for (Ff, Fg, k), where
  k is F(h) followed by the identification F(W) ≃ (FX)[1] given by its outer rectangle. The image of the outer
  rectangle and F(s_C X) are equivalent squares of M^Σ_C′ over FX, and F(s_C X) and s_C′(FX) are equivalent by
  the previous item. The fiber of M^Σ_C′ ⟶ C′ over FX is contractible (§1.3), so any two equivalences of
  squares over id_FX induce the same map in hC′. Hence k = F(h) ≫ `commShiftIso 1`, which is the last map of
  Mathlib's `Functor.mapTriangle`, whatever orientation §1.6 gives the outer rectangle, since F preserves
  it. So `mapTriangle` sends distinguished triangles to distinguished triangles.

The sign of the shift isomorphism is fixed by this route: F is applied to the defining square of X[1] with
its zero corners in place, and the comparison does not transpose the image square. It may still exchange
suspension coordinates, and for F = Σ it does, so that the isomorphism is −1 (Checks). The target includes
the check that this choice is the one under which `Functor.mapTriangle` sends distinguished triangles to
distinguished triangles.

**Checks.**

- For F the identity, the shift isomorphism is the identity and hF is the identity triangulated functor.
- For F = Σ, both F(X[1]) and (FX)[1] are Σ²X, and Mathlib's `shiftFunctorComm C 1 1` is the identity of
  `X⟦2⟧` (`shiftFunctorComm_eq_refl`). Write Q = s_C X, a square on Δ[1] × Δ[1], and form the diagram
  D(u, v) = s_C(Q(u))(v) on (Δ[1] × Δ[1]) × (Δ[1] × Δ[1]). Σ applied to Q is its slice v = (1, 1), and the
  defining square s_C(ΣX) of (ΣX)[1] is its slice u = (1, 1). Under Hom(Σ²X, Y) ≅ π₂ Map(X, Y) (§1.3,
  twice), the two slices give the same class with the two loop coordinates exchanged, so the comparison is
  the action on π₂ of the coordinate swap of the square I². The swap has degree −1, so on π₂ it equals the
  reversal of one coordinate (equivalently, by the Eckmann–Hilton argument). Reversing one coordinate of a
  single square is its transposition, which gives −θ (§1.5, HA, Lemma 1.1.2.10). So `commShiftIso 1` is −1
  times `shiftFunctorComm C 1 1`, as for the classical twist of S¹ ∧ S¹, which has degree −1, and `mapTriangle` sends a
  triangle T = (f, g, h) to `(f[1], g[1], −h[1])`. Mathlib's `Triangle.shiftFunctor C 1` sends T to
  `(−f[1], −g[1], −h[1] ≫ shiftFunctorComm C 1 1) = (−f[1], −g[1], −h[1])`, distinguished when T is
  (`Pretriangulated.Triangle.shift_distinguished`); the isomorphism (1, −1, 1) of triangles identifies the
  two, so the image is distinguished. With +1 the image would be `(f[1], g[1], h[1])`, and that is not
  distinguished in general. Take f = 3 : 𝕊 → 𝕊 in spectra (Sp as in §7.6, 𝕊 as in §9.2). The long exact
  sequences, with π₀𝕊 = ℤ, π₁𝕊 = ℤ/2 and π₋₁𝕊 = 0, show that 𝕊 and 𝕊/3 have only the automorphisms ±1 and
  that h has order 3 in `Hom(𝕊/3, 𝕊[1]) = ℤ/3`. A triangle isomorphism (a, b, c) from `(f[1], g[1], h[1])`
  to the distinguished `(f[1], g[1], −h[1])` would need a = b = c and a = −c, which is impossible. So a route
  that took the identity of Σ²X here would give a functor that `mapTriangle` does not make triangulated.
- τ≥0 on spectra admits no shift isomorphism: τ≥0((HZ[−1])[1]) = HZ, while (τ≥0(HZ[−1]))[1] = 0. A form
  stated for functors that only preserve zero objects would be false for it.

*Needs:* §1.3.1, §1.3.2 (M^Σ and its trivial fibration, shifts, Map(ΣX, Y) ≃ Ω Map(X, Y)); §1.5.1 (biproducts in hC),
§1.5.2 (transposition gives −θ); §1.6.1 (distinguished triangles); §1.7.2 (the triangulated structure on hC), §1.7.1 (the shift
lemma); the finite-limit criterion (§2.3.2); Mathlib `SSet.rlp_monomorphisms` (trivial fibrations, so that
Fun(C, −) preserves them); Mathlib `CategoryTheory.Functor.CommShift` and `Functor.CommShift.isoZero`
(`CategoryTheory/Shift/CommShift.lean`),
`CategoryTheory.Functor.IsTriangulated`, `CategoryTheory.Functor.mapTriangle`
(`CategoryTheory/Triangulated/Functor.lean`), `CategoryTheory.Functor.Additive`.

**2.3.4.** Prove that for C stable and C′ ⊆ C a localization with left adjoint L, L is left exact exactly when C′ is
stable (HA, Lemma 1.4.4.7, p. 158). The route: if C′ is stable, L is right exact between stable ∞-categories, hence
exact (the finite-limit criterion); conversely, C′ is closed under finite limits in C: its objects are the local
objects for the morphisms that L inverts (Part PresentableInfinityCategories §1.5, HTT Prop. 5.5.4.2 (1)), and a limit
in C of local objects is local: for a localization C′ ⊆ C with left adjoint L and `p : K ⟶ C′` with limit X in C,
`Map(Y, X) ≃ lim Map(Y, p(k)) ≃ lim Map(LY, p(k)) ≃ Map(LY, X)` for every Y, so the unit `X ⟶ LX` has a retraction r,
and `(unit ∘ r) ∘ unit = unit` forces `unit ∘ r = id`. So C′ contains a zero object and fibers, and is closed under
pushouts by §2.2 and left exactness of L.

*Needs:* §2.2.1; the finite-limit criterion (§2.3.2); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part PresentableInfinityCategories §1.5.1 (HTT, Prop. 5.5.4.2) and §4.5.1 (closure of local objects under limits).

### Examples

- Fun(K, C) is stable for every simplicial set K and stable C, for instance Fun(K, Sp) (§2.1).
- The connective spectra are not a stable subcategory, and τ≥0 is not exact (§2.1, §2.3 Checks).
- A square in a stable ∞-category is a pullback exactly when it is a pushout, and for n = 3 a cube that is a
  colimit diagram is a limit diagram (§2.2).
- For a stable C, the pullback squares form a stable subcategory of Fun(Δ[1] × Δ[1], C) (§2.1, §2.2), and
  restriction to the span is an equivalence onto Fun(Λ[2,0], C).

### Dependencies

Layer 1; Part InfinityCategoryFoundations, Part CartesianFibrations (functor ∞-categories), Part
LimitsAndKanExtensions (finite colimits from pushouts, pasting, Kan extensions, pointwise colimits), Part
AdjunctionsAndLocalizations (adjoints preserve colimits); Tau Ceti `SSet.catInfty` and its limit and
colimit predicates.

## Layer 3: t-structures, truncations and hearts

### 3.1 t-structures on triangulated and stable ∞-categories

**3.1.1.** Define a t-structure on a triangulated category D as a pair of full subcategories D≥0, D≤0, closed under
isomorphism, with Hom(X, Y[−1]) = 0 for X ∈ D≥0 and Y ∈ D≤0, with D≥0[1] ⊆ D≥0 and D≤0[−1] ⊆ D≤0, and such
that every X sits in a distinguished triangle X′ ⟶ X ⟶ X″ ⟶ X′[1] with X′ ∈ D≥0 and X″ ∈ D≤0[−1] (HA,
Def. 1.2.1.1, p. 37). Write D≥n = D≥0[n] and D≤n = D≤0[n] (HA, Not. 1.2.1.2, p. 37). The target is the
comparison with Mathlib: such pairs correspond bijectively to Mathlib's `Triangulated.TStructure` under the
dictionary of the Conventions. The `Suggested.lean` declaration `HomologicalTStructure` records Lurie's pair
as a structure, and `exists_equiv_tStructure` is the bijection, with D≥0 = `t.le 0` and D≤0 = `t.ge 0`.

**Checks.**

- The standard t-structure on Mathlib's derived category of abelian groups corresponds to D≥0 = complexes
  with homology in nonnegative homological degrees.
- (D, 0) is a t-structure for every D (take X′ = X, X″ = 0); its heart is zero.
- (D, D) is a t-structure only for D zero: with X = Z and Y = Z[1], axiom (1) forces id_Z = 0. A definition
  without axiom (1) would accept it.

*Needs:* §1.4.2 (triangulated categories); Mathlib `CategoryTheory.Triangulated.TStructure`.

**3.1.2.** Define a t-structure on a stable ∞-category C as a t-structure on hC, with C≥n and C≤n the full
subcategories of C on the objects of (hC)≥n and (hC)≤n (HA, Def. 1.2.1.4, p. 38).

**Checks.**

- Taking C≥0 = C and C≤0 = C fails the vanishing of Hom(X, Y[−1]) at X = Y[−1] ≠ 0, so for C nonzero it is
  not a t-structure; a definition asking only for the truncation triangles would accept it.
- A t-structure on C gives one on C^op, with C^op≥n = (C≤−n)^op; for C = Δ[0] there is exactly one.
- For spectra, 𝕊 ∈ Sp≥0 and 𝕊 ∉ Sp≤n for every n, since π₃𝕊 ≅ ℤ/24 and infinitely many πₖ𝕊
  are nonzero.
- The indexing is homological: Σ𝕊 ∈ Sp≥1 ⊆ Sp≥0, while 𝕊 ∉ Sp≥1 since π₀𝕊 ≅ ℤ. A cohomological reading,
  with C≥1 ⊇ C≥0, would put 𝕊 in Sp≥1.
- C≥0 and C≤0 need not be stable subcategories: Sp≥0 is not closed under Ω, since Ω𝕊 has π₋₁ ≅ ℤ. A
  definition asking for stable subcategories would exclude the t-structure on spectra.

*Needs:* §3.1.1 (t-structures on triangulated categories); §1.7.2 (hC triangulated);
Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); §1.1.3 (HA, Def. 1.1.1.9).

### 3.2 Truncation functors

**3.2.1.** Define, for a t-structure on a stable C and n ∈ ℤ, τ≤n as a left adjoint to C≤n ⊆ C and τ≥n as a right
adjoint to C≥n ⊆ C (HA, Not. 1.2.1.7, p. 38), and prove that they exist: C≤n ⊆ C is a localization (HA,
Prop. 1.2.1.5, p. 38), and C≥n ⊆ C is a colocalization by the same statement for C^op. The route is Lurie's,
at n = −1: by HTT 5.2.7.8 it suffices that the map X ⟶ X″ of axiom (3) induces equivalences
Map(X″, Y) ⟶ Map(X, Y) for Y ∈ C≤−1. Mapping spaces in a stable ∞-category are loop spaces, so all
components are equivalent and Whitehead's theorem reduces this to Extᵏ for k ≤ 0, which follows from the
long exact sequence (§1.7, §1.8) and axioms (1) and (2). For τ≥n the argument is the same one read in C^op,
whose t-structure has (C^op)≤−n = (C≥n)^op (§3.1): the map X′ ⟶ X of axiom (3) induces equivalences
Map(Y, X′) ⟶ Map(Y, X) for Y ∈ C≥0, by the same long exact sequence with the variables exchanged. With both
adjoints, the triangle of axiom (3) is a fiber sequence τ≥n X ⟶ X ⟶ τ≤n−1 X, functorial in X.

- C≤n is closed under all limits that exist in C, and C≥n under all colimits that exist in C (HA,
  Cor. 1.2.1.6, p. 38): the inclusion of a localization is a right adjoint (HTT 5.2.3.5); dually, through
  C^op.
- τ≤n and τ≥n carry C≤m into itself, and dually C≥m into itself, for all m, n (HA, Rem. 1.2.1.8, p. 38):
  τ≤n is the identity on C≤m for m ≤ n and lands in C≤n ⊆ C≤m for m ≥ n; for τ≥n, use the fiber sequence
  above and closure of C≤m under limits.

**Checks.**

- On objects of C≤n, the unit X ⟶ τ≤n X is an equivalence; τ≤n 0 ≃ 0.
- Under the dictionary of the Conventions, τ≤n is Mathlib's truncation onto the objects ≥ −n in cohomological
  indexing. In Mathlib's derived category of abelian groups, ℤ[1] has homology in homological degree 1
  (cohomological degree −1), so HA's τ≤0, Mathlib's `truncGE 0`, kills it, while `truncLE 0`, the
  cohomological truncation ≤ 0 that a naive reading would use, keeps it.
- For the t-structure (C, 0), τ≤n = 0 and τ≥n = id for every n.

*Needs:* §1.2.1 (opposites); §1.7.2; §1.8.1; §3.1.2; §1.1.2 (HA, Defs. 1.1.1.4, 1.1.1.6); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part
AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part AdjunctionsAndLocalizations §2.3.1 (HTT,
Prop. 5.2.7.8); ModelCategoryTheory, Part KanQuillen §1.3.3 (Whitehead's theorem for Kan complexes).

### 3.3 The abelian heart and homotopy objects

**3.3.1.** Prove that the heart of a t-structure on a triangulated category D is abelian, with its exact structure
read off from distinguished triangles (BBD, Thm. 1.3.6; this is the 1-categorical input that HA,
Rem. 1.2.1.12, p. 40, cites).

- Every morphism of the heart is admissible in the sense of Mathlib's
  `Triangulated.AbelianSubcategory.admissibleMorphism`, so that, with the vanishing of Hom(X, Y[n]) for
  heart objects and n < 0, Mathlib's `Triangulated.AbelianSubcategory.abelian` makes the heart abelian.
  The `Suggested.lean` declaration is `admissibleMorphism_ιHeart_eq_top`. The route is BBD's: complete f : X₁ ⟶ X₂ to a distinguished
  triangle on its cone X₃ and use the truncation triangle (τ≥1 X₃) ⟶ X₃ ⟶ τ≤0 X₃, whose ends are shifts of
  heart objects.
- For f : X₁ ⟶ X₂ in the heart and a distinguished triangle X₁ ⟶ X₂ ⟶ X₃ ⟶ X₁[1], the kernel of f is
  (τ≥1 X₃)[−1] and the cokernel is τ≤0 X₃ (in Mathlib's terms `truncLT 0` shifted by −1 and `truncGE 0`),
  with the kernel and cokernel maps induced by the triangle; and a short complex 0 ⟶ A ⟶ B ⟶ E ⟶ 0 in the
  heart is short exact exactly when there is δ : E ⟶ A[1] making A ⟶ B ⟶ E ⟶ A[1] distinguished. The last
  statement is the `Suggested.lean` declaration `shortExact_iff_exists_distinguished`.
- The functor H⁰ = τ≤0 τ≥0 from D to the abelian heart is homological in the sense of Mathlib's
  `CategoryTheory.Functor.IsHomological`, and isomorphic to the identity on the heart; hence each
  distinguished triangle gives a long exact sequence of the Hⁿ X = H⁰(X[n]) = H⁰(X⟦n⟧). In HA's homological
  indexing H⁰ is π₀ and Hⁿ X is π₋ₙ X. The `Suggested.lean` declaration is `isHomological_of_iso_truncLE_truncGE`, for any functor to the heart
  whose composite with the inclusion is isomorphic to Mathlib's `truncLE 0 ⋙ truncGE 0`.

**Check.** In Mathlib's derived category of abelian groups, ℤ placed in cohomological degree n is ℤ⟦−n⟧.
Then Hⁿ(ℤ⟦−n⟧) = H⁰((ℤ⟦−n⟧)⟦n⟧) = H⁰(ℤ) = ℤ, as the cohomological convention requires, while the reading
H⁰(X⟦−n⟧) would give H⁰(ℤ⟦−2n⟧) = 0 for n ≠ 0.

*Needs:* §1.4.2; §3.1.1; Mathlib `CategoryTheory.Triangulated.TStructure.ιHeart`, `truncLE`, `truncGE`,
`Triangulated.AbelianSubcategory.admissibleMorphism`, `Triangulated.AbelianSubcategory.abelian`,
`CategoryTheory.Functor.IsHomological`.

**3.3.2.** Prove that the natural transformation θ : τ≤m ∘ τ≥n ⟶ τ≥n ∘ τ≤m of functors C ⟶ C≤m ∩ C≥n, the mate of the
identity of inclusions given by the commuting squares of §3.2 (τ≤m preserves C≥n), is an equivalence (HA,
Prop. 1.2.1.10, p. 39). The route: both sides are objects of hC, where θ is Mathlib's
`TStructure.truncGELEIsoLEGE (−m) (−n)`; the target is that the ∞-categorical θ maps to it. At m = n = 0
this makes the two composites defining π₀ in §3.3.3 agree.

*Needs:* §1.7.2 (long exact sequences); §1.8.1; §3.2.1 (truncation functors); Part InfinityCategoryFoundations §1.2 (HTT,
Not. 1.2.7.2); Mathlib `CategoryTheory.Triangulated.TStructure.truncGELEIsoLEGE`.

**3.3.3.** Define the heart C♥ = C≥0 ∩ C≤0 of a t-structure on a stable C, the functor π₀ : C ⟶ C♥ as τ≤0 ∘ τ≥0 ≃
τ≥0 ∘ τ≤0, and πₙ X = π₀(X[−n]) (HA, Def. 1.2.1.11, p. 40).

- For X, Y ∈ C♥, Map_C(X, Y) is discrete, so C♥ is equivalent to the nerve of its homotopy category h(C♥),
  which is abelian (HA, Rem. 1.2.1.12, p. 40). The route: πₙ Map(X, Y) ≅ Ext⁻ⁿ(X, Y) vanishes for n ≥ 1
  by axioms (1) and (2) (§1.8); a quasicategory with discrete mapping spaces is a nerve (HTT 2.3.4.18);
  and h(C♥) is the heart of the t-structure on hC, abelian by the 1-categorical theorem of §3.3.1.

**Checks.**

- For spectra, πₙ is the n-th stable homotopy group: π₀𝕊 ≅ ℤ and π₁𝕊 ≅ ℤ/2.
- πₙ(X[1]) ≅ πₙ₋₁ X; the opposite sign convention πₙ X = π₀(X[n]) would give πₙ₊₁.
- An off-by-one heart C≥0 ∩ C≤−1 consists of zero objects, since the identity of such an X lies in
  Hom(X, (X[1])[−1]) = 0 by axiom (1); the heart of spectra is abelian groups.
- π₀ needs both truncations: for X = HZ ⊕ HZ[1] in spectra, τ≥0 X = X is not in the heart, while π₀ X = ℤ.

*Needs:* §1.3.2 (shifts); §1.7.2; §1.8.1; §3.1.2; §3.2.1 (truncation functors); §3.3.1 and §3.3.2
(the abelian heart, θ an equivalence); Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11).

### 3.4 t-structures from localizations

**3.4.1.** Define a quasisaturated class S of morphisms of an ∞-category with pushouts: S contains the equivalences,
has two-out-of-three for 2-simplices, and is closed under pushout (HA, Def. 1.2.1.14, p. 41). Intersections
of quasisaturated classes are quasisaturated, so every class generates one.

**Checks.**

- The equivalences form the smallest quasisaturated class, and all morphisms the largest.
- In the nerve of sets, the monomorphisms contain the isomorphisms and are closed under pushout, but
  {a} ⟶ {a, b} ⟶ {a} is a composite in the class with second factor not in it, so two-out-of-three fails.
- For a localization functor L, the morphisms inverted by L form a quasisaturated class (HA, observation
  following Def. 1.2.1.15, p. 42); the surjections of sets do not, since {a} ⟶ {a, b} ⟶ {a} has surjective
  composite and second factor but not first factor.

*Needs:* Part InfinityCategoryFoundations §1.2.4 (pushout squares); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2, for the third
Check); Tau Ceti `SSet.Edge.IsEquivalence`, `SSet.coslice.IsColimit`.

**3.4.2.** Define a full subcategory C′ of a stable C to be closed under extensions when, for every fiber sequence
X ⟶ Y ⟶ Z with X, Z ∈ C′, also Y ∈ C′ (HA, Def. 1.2.1.15, p. 42).

**Checks.**

- C≥0 and C≤0 of a t-structure are closed under extensions; so is C.
- In Mathlib's derived category of abelian groups, the subcategory of objects isomorphic to 0 or ℤ is not:
  ℤ ⟶ ℤ ⊕ ℤ ⟶ ℤ is a fiber sequence and ℤ ⊕ ℤ is not in it.
- The heart of a t-structure is closed under extensions (§3.3), but its union with the shifted heart is
  not: in the derived category of abelian groups ℤ ⟶ ℤ ⊕ ℤ[1] ⟶ ℤ[1] is a fiber sequence whose middle term
  is in neither.

*Needs:* Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); §1.1.2 (HA, Def. 1.1.1.4), §1.1.3 (HA, Def. 1.1.1.9).

**3.4.3.** Prove that for a stable C, a localization functor L : C ⟶ C and S the morphisms inverted by L, the following
are equivalent: S is generated as a quasisaturated class by some morphisms 0 ⟶ X; it is generated by
{0 ⟶ X : LX ≃ 0}; the essential image of L is closed under extensions; Ext¹(LA, B) ⟶ Ext¹(A, B) is injective
for every A and every local B; the subcategories C≥0 = {A : LA ≃ 0} and C≤−1 = {A : LA ≃ A} form a
t-structure (HA, Prop. 1.2.1.16, p. 42). The route is Lurie's cycle of implications; locality may be tested
on a generating set of a quasisaturated class, Ext long exact sequences come from §1.7, and the left adjoint
L preserves colimits (HTT 5.2.3.5), so C≥0 is closed under finite colimits.

*Needs:* §1.6.1; §1.7.2; §1.8.1; §3.1.2; §3.4.1 and §3.4.2 (quasisaturated classes, extensions); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part PresentableInfinityCategories §1.2.1 (HTT, Def. 5.5.4.1); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5).

### 3.5 t-exact functors

**3.5.1.** Define, for stable ∞-categories C and C′ with t-structures, an exact functor f : C ⟶ C′ to be right
t-exact when it carries C≥0 into C′≥0, left t-exact when it carries C≤0 into C′≤0, and t-exact when both
hold (HA, Def. 1.3.3.1, p. 97).

- Under the dictionary of the Conventions, right t-exactness of f is Mathlib's
  `CategoryTheory.Functor.RightTExact` of the triangulated functor hf of §2.3, for the Mathlib
  t-structures of §3.1, and left t-exactness is `CategoryTheory.Functor.LeftTExact`; t-exactness is
  `CategoryTheory.Functor.TExact`. Mathlib's `RightTExact` asks that X ∈ `t.le n` imply hf X ∈ `t.le n` for
  every n, which under C≥n = `t.le (−n)` is preservation of every C≥n, and dually for `LeftTExact` and
  `t.ge`.
- Right t-exact functors are closed under composition, and a right t-exact functor carries C≥n into C′≥n
  for every n; dually for left t-exact functors and C≤n. The second statement is Mathlib's
  `Functor.RightTExact.mk` and `Functor.LeftTExact.mk`, which build the classes from the case n = 0 through
  the shift isomorphism of hf (§2.3).

**Checks.**

- The shift [1] on a stable C with a t-structure is right t-exact, and on Sp it is not left t-exact: it
  sends HZ ∈ Sp≤0 to HZ[1], which has π₁ ≠ 0. A definition with C≥0 and C≤0 exchanged (right
  t-exact meaning preserving C≤0) would make [−1] right t-exact instead.
- [−1] on Sp is left t-exact but not right t-exact, since it sends 𝕊 ∈ Sp≥0 to 𝕊[−1], whose π₋₁ is ℤ. A
  definition that called every exact functor t-exact would accept it.
- The cofiber of multiplication by 2, X ↦ cofib(2 · id_X), is exact and right t-exact (C≥0 is closed under
  cofibers) but not left t-exact on Sp: for HZ/2 ∈ Sp♥ the map 2 is zero, so the cofiber is
  HZ/2 ⊕ HZ/2[1], which is not in Sp≤0. A definition demanding preservation of the heart would exclude it.

*Needs:* §2.3.1 (exact functors), §2.3.3 (the triangulated functor hf); §3.1.2 (HA, Def. 1.2.1.4, and the Mathlib form
of a t-structure); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4); §1.1.3 (HA, Def. 1.1.1.9);
Mathlib `CategoryTheory.Functor.RightTExact`, `CategoryTheory.Functor.LeftTExact`,
`CategoryTheory.Functor.TExact`, `Functor.RightTExact.mk`, `Functor.LeftTExact.mk`
(`CategoryTheory/Triangulated/TStructure/TExact.lean`).

### Examples

- For Mathlib's derived category of abelian groups, the heart of the standard t-structure is equivalent to
  abelian groups, and §3.3 recovers that ℤ ⟶ ℤ ⟶ ℤ/2 is short exact.
- For spectra, C≥0 is the connective spectra and τ≥0 the connective cover; the shift [n] is right t-exact
  for n ≥ 0 and left t-exact for n ≤ 0 (§3.5).
- On any stable C with a t-structure, τ≥0 and τ≤0 are not exact in general (§2.3 Checks), so they are not
  t-exact functors; the identity is.
- A presentable stable ∞-category with a non-zero object is not Postnikov complete in the sense of Part
  PresentableInfinityCategories §6.4. In a stable ∞-category every n-truncated object in the sense of HTT Def. 5.5.6.1 (Part
  InfinityCategoryFoundations §10.1) is zero, since `Map(X, Y) ≃ Ωᵏ Map(Σ⁻ᵏ X, Y)` for all k; so lim over n of its truncations τ≤n is
  trivial. The ∞-category of spectra (§7.6) is one instance. This rules out reading the τ≤n of Postnikov
  completeness as the truncations of a t-structure (§3.1).

### Dependencies

Layers 1 and 2; Part PresentableInfinityCategories, Part InfinityCategoryFoundations (n-categories and truncation, for the heart), Part
AdjunctionsAndLocalizations (adjoints, the criterion for localizations), ModelCategoryTheory, Part KanQuillen
(Whitehead's theorem); Mathlib's t-structures, abelian subcategories and homological functors.

## Layer 4: ℤ-complexes and filtered objects

### 4.1 ℤ-complexes and filtered objects

**4.1.1.** Define, for a pointed C and a linearly ordered set I, the poset I^[1] of pairs i ≤ j ordered
componentwise, and an I-complex as a functor F : N(I^[1]) ⟶ C with each F(i, i) a zero object and, for
i ≤ j ≤ k, the square F(i, j) ⟶ F(i, k), F(j, j) ⟶ F(j, k) a pushout. Gap(I, C) ⊆ Fun(N(I^[1]), C) is the
full subcategory of I-complexes (HA, Def. 1.2.2.2, p. 47).

- For C stable and F ∈ Gap(ℤ, C), the pushout squares give boundary maps δ : F(n, n+1) ⟶ F(n−1, n)[1], and
  Cₙ = F(n−1, n)[−n] with the induced maps is a chain complex in hC: d ∘ d = 0 because F(n−2, n−2) ≃ 0 (HA,
  Rem. 1.2.2.3, p. 47; this uses §1.3 and §1.7).

**Checks.**

- For I = ∅, Gap(I, C) = Δ[0]; for I = {0}, Gap(I, C) is the contractible space of zero objects.
- For I = {0 < 1}, a complex is 0 ⟶ F(0, 1) ⟶ 0 and Gap(I, C) ≃ C; without the condition F(i, i) ≃ 0 one
  would get Fun(Δ[2], C).
- For I = {0 < 1 < 2}, a complex is a cofiber sequence F(0, 1) ⟶ F(0, 2) ⟶ F(1, 2); a definition without
  the pushout condition would allow any object at (1, 2).
- The middle term is an extension, not a sum: for C stable and X with 2·id_X ≠ 0 in hC, take
  F(0, 1) = X[−1], F(1, 2) = X and F(0, 2) the fiber of 2 : X ⟶ X; the boundary δ : X ⟶ X is ±2 ≠ 0. A
  definition demanding F(0, 2) ≃ F(0, 1) ⊕ F(1, 2) would force δ = 0. For X = 𝕊 in spectra,
  π₋₁ F(0, 2) ≅ ℤ/2 where the sum would give ℤ.

*Needs:* §1.3.2 (shifts); §1.7.2 (hC triangulated); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part InfinityCategoryFoundations §1.2.4 (pushout squares); §1.1.1 (HA, Def. 1.1.1.1); Tau Ceti `SSet.coslice.IsColimit`;
Mathlib `CategoryTheory.nerve`.

**4.1.2.** Prove that for C pointed with pushouts and I = I₀ ∪ {−∞} with least element −∞, restriction along
i ↦ (−∞, i) is an equivalence Gap(I, C) ⟶ Fun(N(I₀), C) (HA, Lemma 1.2.2.4, p. 48). The route is Lurie's: a
complex is left Kan extended from J = {(−∞, j)} ∪ {(i, i)}, whose restriction is right Kan extended from
I₀; HTT 4.3.2.13 gives existence (C has finite colimits by HTT 4.4.2.4, since a zero object is initial) and
HTT 4.3.2.15 the trivial fibrations.

*Needs:* §4.1.1 (complexes); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2); Part
LimitsAndKanExtensions §7.4.2 (HTT, Lemma 4.3.2.13), §7.4.6 (HTT, Prop. 4.3.2.15); Part LimitsAndKanExtensions §6.5.3 (HTT,
Cor. 4.4.2.4).

**4.1.3.** Define a filtered object of a stable ∞-category C to be a functor X : N(ℤ) ⟶ C (HA, Def. 1.2.2.9, first
sentence, p. 52). No t-structure is involved.

- By §4.1.2 with I₀ = ℤ, X extends, uniquely up to a contractible space of choices, to a complex in
  Gap(ℤ ∪ {−∞}, C) with X(i, j) = cofib(X(i) ⟶ X(j)); its restriction to Gap(ℤ, C) gives X the chain
  complex Cₙ = cofib(X(n−1) ⟶ X(n))[−n] in hC (HA, Rem. 1.2.2.3, p. 47). A filtered object indexed by ℤ≥0
  is extended by 0 in negative degrees.

**Checks.**

- The constant filtered object at Y, with identity maps, has Cₙ ≃ 0 in every degree; a definition taking
  Cₙ = X(n)[−n] would give Y[−n].
- For C stable and Y with 2·id_Y not an equivalence, X(n) = Y for all n with every map 2·id_Y is a
  filtered object, with Cₙ = cofib(2·id_Y)[−n] (for Y = 𝕊 in spectra, (𝕊/2)[−n]). A definition requiring
  the maps to be monomorphisms, as for filtrations of a module, would exclude it: in a stable ∞-category
  the monomorphisms are the equivalences.
- For f : Y ⟶ Z, the filtered object that is 0 in negative degrees, Y in degree 0 and Z from degree 1 on
  (with f, then identities) has C₀ = Y, C₁ = cofib(f)[−1] and Cₙ ≃ 0 otherwise; a definition using fibers
  instead of cofibers would put fib(f)[−1] in degree 1.

*Needs:* §1.3.2 (shifts); §4.1.1 (complexes) and §4.1.2 (the lemma); §1.1.3 (HA,
Def. 1.1.1.9); Mathlib `CategoryTheory.nerve`.

### 4.2 Colimits over truncated simplex categories

Throughout, I is the full subcategory of (Δ≤n)/[n] on the injective maps [m] ⟶ [n], and N(I)^op ⟶ N(Δ≤n)^op is
cofinal by Part LimitsAndKanExtensions §9.6 (HA, Lemma 1.2.4.17, p. 75).

**4.2.1.** Prove that, with I the full subcategory of `(Δ≤n)/[n]` on the injective maps `[m] ⟶ [n]`, for C stable and
F : N(Δ≤n)^op ⟶ C with F([m]) ≃ 0 for m < n, the colimit of F is isomorphic in hC to F([n])[n] (HA, Cor. 1.2.4.18, p.
75). The route is Lurie's: compute over N(I)^op by the cofinality statement, compare with the constant diagram through
a fiber sequence of colimits, and identify the cofiber of the boundary inclusion with the n-fold suspension, using HTT
4.3.2.7.

*Needs:* §1.3.2 (shifts); §2.1.1 (fibers in the stable Fun(N(I)^op, C)); Part LimitsAndKanExtensions §9.6.1 (HA,
Lemma 1.2.4.17); Part LimitsAndKanExtensions §3.5.1 (HTT, §4.4.4, tensors X ⊗ K); Part LimitsAndKanExtensions
§7.4.1 (HTT, Lemma 4.3.2.7); §1.1.2 (HA, Defs. 1.1.1.4, 1.1.1.6); Part LimitsAndKanExtensions §7.1.2 (HTT,
Def. 4.3.2.2); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1).

**4.2.2.** Prove that for C stable, n ≥ 0 and F : N(Δ₊,≤n)^op ⟶ C, F is left Kan extended from N(Δ≤n)^op exactly when it
is right Kan extended from N(Δ₊,≤n−1)^op (HA, Lemma 1.2.4.19, p. 76). The route is Lurie's: both conditions
reduce, through the inclusion of the injective maps (which has an adjoint, so its opposite is cofinal by
HTT 4.1.3.1) and the cofinality statement above, to one cube (Δ[1])ⁿ⁺¹ ⟶ C being a limit, resp. colimit,
diagram; apply §2.2.

*Needs:* §2.2.2 (cubes); Part LimitsAndKanExtensions §9.6.1 (HA, Lemma 1.2.4.17); Part LimitsAndKanExtensions
§5.4.2 (HTT, Thm. 4.1.3.1); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions); Part LimitsAndKanExtensions §7.1.2 (HTT,
Def. 4.3.2.2); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §5.5.4 (HTT, Prop. 1.2.12.9,
Rem. 1.2.13.5).

### Examples

- For the filtered object 0 ⟶ Y ⟶ Y ⟶ ⋯, the chain complex of §4.1 is Y in degree 0 and zero elsewhere.
- For n = 1 and F : N(Δ≤1)^op ⟶ C with F([0]) ≃ 0, the colimit of F is F([1])[1]: over the injective maps
  the diagram is the span 0 ⟵ F([1]) ⟶ 0, whose pushout is the suspension (§4.2).
- For n = 0, the condition of §4.2 on F : N(Δ₊,≤0)^op ⟶ C says that the augmentation F([0]) ⟶ F([−1]) is an equivalence,
  both as a left and as a right Kan extension condition.

### Dependencies

Layers 1 and 2; Part AdjunctionsAndLocalizations, Part InfinityCategoryFoundations, Part LimitsAndKanExtensions (Kan extensions,
tensors, Theorem A, and the cofinality of injective maps into Δ≤n); Tau Ceti `SSet.coslice.IsColimit`.

## Layer 5: The Dold–Kan correspondence for additive categories

### 5.1 Chain complexes and their truncations

**5.1.1.** Define, for an additive A, Ch(A) as the ℤ-graded chain complexes with differentials of degree −1, and
Ch(A)≥n, Ch(A)≤n as the complexes vanishing below, resp. above, degree n (HA, Def. 1.2.3.1, p. 54). The
target is the comparison: Ch(A) is Mathlib's `ChainComplex A ℤ` and Ch(A)≥0 is equivalent to
`ChainComplex A ℕ`.

- For A abelian, Ch(A)≥0 ⊆ Ch(A) has a right adjoint τ≥0, replacing M₀ by ker d(0) and the lower terms by
  0, and Ch(A)≤0 ⊆ Ch(A) has a left adjoint τ≤0 (HA, Rem. 1.2.3.4, p. 54).

**Checks.**

- Ch(A)≥0 ∩ Ch(A)≤0 is equivalent to A, through complexes concentrated in degree 0.
- Mathlib's chain complexes indexed by ℕ have differentials from degree n + 1 to n, matching degree −1;
  its cochain complexes would reverse the direction and are not Lurie's Ch(A)≥0.
- For the complex ℤ ⟶ ℤ (multiplication by 2) in degrees 0 and −1 of abelian groups, τ≥0 is zero, since
  ker d(0) = 0; the naive truncation keeping M₀ = ℤ is not right adjoint to the inclusion.

*Needs:* §1.4.1 (additive categories); Mathlib `ChainComplex`.

### 5.2 Normalized and unnormalized chains

**5.2.1.** Define the unnormalized chain complex C∗(A) of a semisimplicial (or simplicial) object of an additive A,
with Cₙ = Aₙ and differential Σᵢ (−1)ⁱ dᵢ over 0 ≤ i ≤ n (HA, Def. 1.2.3.8, p. 56). For simplicial objects
this is Mathlib's `AlgebraicTopology.alternatingFaceMapComplex`; for semisimplicial objects, defined on
functors from Δ_s^op (Part LimitsAndKanExtensions §9.5 (HTT, Not. 6.5.3.6)), the target is the same
construction, compatible with Mathlib's under restriction.

- For a simplicial set K, with ℤK the free simplicial abelian group, Lurie's N∗(K) = N∗(ℤK) and
  C∗(K) = C∗(ℤK) are Mathlib's normalized Moore complex and alternating face map complex of ℤK, so that
  N∗(K) ⊆ C∗(K) are complexes of abelian groups computing the homology of K (HA, Not. 1.2.3.10, p. 56),
  by Mathlib's comparison of the two complexes through `AlgebraicTopology.DoldKan.PInfty`. For K = Δ[0],
  C∗(K) is ℤ in every degree with differentials 0, id, 0, … from C₁ ⟶ C₀ on, while N∗(K) is ℤ in degree 0,
  and both have homology ℤ in degree 0.

**Checks.**

- For the constant simplicial object at A, d₁ = 0 and d₂ = id, so the homology is A in degree 0; the sum
  without signs would give d₁ = 2·id.
- A differential over 0 ≤ i < n would give d₁ = id and H₀ = 0 for the constant object at A ≠ 0.
- Dropping d₀, a sum over 1 ≤ i ≤ n, would give C₁ ⟶ C₀ equal to −id for the constant object, so again
  H₀ = 0; C₁ ⟶ C₀ must be the difference d₀ − d₁ of the two face maps.

*Needs:* §1.4.1; §5.1.1 (chain complexes); Part LimitsAndKanExtensions §9.5.1 (HTT, Not. 6.5.3.6); Mathlib
`AlgebraicTopology.alternatingFaceMapComplex`, `AlgebraicTopology.normalizedMooreComplex`,
`AlgebraicTopology.DoldKan.PInfty`,
`AlgebraicTopology.DoldKan.homotopyEquivNormalizedMooreComplexAlternatingFaceMapComplex`.

### 5.3 The Dold–Kan correspondence for additive categories

**5.3.1.** Define, for a nonnegatively graded complex A in an additive A, the simplicial object DK(A) with
DKₙ(A) = ⊕ over surjections α : [n] ⟶ [k] of A_k, and structure maps given by identities, differentials or
zero according to the factorization of α ∘ β (HA, Constr. 1.2.3.5, p. 55). This is Mathlib's
`AlgebraicTopology.DoldKan.Γ₀`, defined by the same sum over epimorphisms; the target identifies the
structure maps with Lurie's matrix.

**Checks.**

- DK₀(A) = A₀, DK₁(A) = A₀ ⊕ A₁ and DK₂(A) = A₀ ⊕ A₁ ⊕ A₁ ⊕ A₂, one summand for each surjection out of [n]
  (there are two surjections [2] ⟶ [1]); a sum over all maps [1] ⟶ [1] would already give three copies of A₁
  in degree 1.
- For A concentrated in degree 0, DK(A) is the constant simplicial object.
- The naive DKₙ(A) = Aₙ is not a simplicial object: for A concentrated in degree 0 with A₀ ≠ 0 it has
  DK₁ = 0, so no s₀ with d₀s₀ = id exists.
- The structure maps involve the differential: for A = (ℤ ⟶ ℤ, the identity) in degrees 1, 0, the two
  faces DK₁ = ℤ ⊕ ℤ ⟶ ℤ differ by the differential and π₀ DK(A) = H₀(A) = 0; structure maps that were all
  projections would give π₀ = ℤ.

*Needs:* §1.4.1 (direct sums); §5.1.1 (chain complexes); Mathlib `AlgebraicTopology.DoldKan.Γ₀`.

**5.3.2.** Prove that for every additive A, DK : Ch(A)≥0 ⟶ Fun(Δ^op, A) is fully faithful, and an equivalence when A is
idempotent complete (HA, Thm. 1.2.3.7, p. 56). The second assertion is Mathlib's
`CategoryTheory.Idempotents.DoldKan.equivalence`; the first, the `Suggested.lean` declaration `full_faithful_Γ₀`, is not in
Mathlib. The route: Mathlib's equivalence on Karoubi envelopes
(`CategoryTheory.Preadditive.DoldKan.equivalence`) and the full faithfulness of `toKaroubi` (Lurie's route, through the
Yoneda embedding of A into additive presheaves and the case of abelian groups, also works). Along the way:

- For A abelian, Nₙ(DK(A)) is the summand of the identity surjection, giving A ≅ N∗(DK(A)) (HA,
  Rem. 1.2.3.11, p. 57), Mathlib's `AlgebraicTopology.DoldKan.N₁Γ₀`; it is the unit of an adjunction DK ⊣ N∗
  (HA, Lemma 1.2.3.12, p. 57), that of Mathlib's `CategoryTheory.Abelian.DoldKan.equivalence`, whose counit
  is an isomorphism for A = Ab (HA, Lemma 1.2.3.13, p. 57).
- For A idempotent complete, with N∗ an inverse of DK, Nₙ(A) is a kernel of (d₁, …, dₙ) : Aₙ ⟶ ⊕ Aₙ₋₁,
  which exists although A need not be abelian, giving a monomorphism u : N∗(A) ⟶ C∗(A) (HA, Rem. 1.2.3.15,
  p. 59); dually Nₙ(A) is a cokernel of (s₀, …, sₙ₋₁) : ⊕ Aₙ₋₁ ⟶ Aₙ, giving an epimorphism
  v : C∗(A) ⟶ N∗(A) with v ∘ u = id (HA, Rem. 1.2.3.16, p. 60); u ∘ v is Mathlib's
  `AlgebraicTopology.DoldKan.PInfty`.

*Needs:* §1.4.1; §5.1.1; §5.2.1 (normalized and unnormalized complexes); §5.3.1 (DK); Mathlib
`CategoryTheory.Idempotents.DoldKan.equivalence`, `CategoryTheory.Preadditive.DoldKan.equivalence`,
`CategoryTheory.Abelian.DoldKan.equivalence`, `AlgebraicTopology.DoldKan.Γ₀`, `AlgebraicTopology.DoldKan.N₁Γ₀`, `AlgebraicTopology.DoldKan.PInfty`.

### 5.4 Multi-additive functors and the Alexander–Whitney map

**5.4.1.** Define a functor F : A₁ × ⋯ × Aₙ ⟶ B between additive categories to be multi-additive when it preserves
direct sums separately in each variable (HA, Def. 1.2.3.19, p. 61).

- A multi-additive F induces Ch(F)≥0 : ∏ Ch(Aᵢ)≥0 ⟶ Ch(B)≥0 with Ch(F)ₚ the direct sum over
  p = p₁ + ⋯ + pₙ of F(A¹_(p₁), …, Aⁿ_(pₙ)) and the Koszul-signed differential, multi-additive again; and
  Ch(F) on unbounded complexes when B has countable coproducts (HA, Rem. 1.2.3.21, p. 62). For n = 2 this is
  Mathlib's total complex of `HomologicalComplex.mapBifunctor` (`HomologicalComplex₂.total`).

**Checks.**

- For n = 1 this is Mathlib's notion of an additive functor.
- The tensor product of modules over a commutative ring is multi-additive.
- (A, B) ↦ A ⊕ B is additive on the product category but not multi-additive: (A₁ ⊕ A₂) ⊕ B is not
  (A₁ ⊕ B) ⊕ (A₂ ⊕ B).
- Conversely the tensor product is multi-additive but not additive on the product category:
  (A₁ ⊕ A₂) ⊗ (B₁ ⊕ B₂) has four summands, not two, so a definition "additive on ∏ Aᵢ" would reject it.

*Needs:* §1.4.1 (additive categories, direct sums); §5.1.1; Mathlib `CategoryTheory.Functor.Additive`,
`HomologicalComplex.mapBifunctor`, `HomologicalComplex₂.total`.

**5.4.2.** Define, for a multi-additive F between idempotent complete additive categories and simplicial objects Aⁱ,
the Alexander–Whitney maps AWₚ : F(A¹ₚ, …, Aⁿₚ) ⟶ Ch(F)≥0(C∗(A¹), …, C∗(Aⁿ))ₚ, the sum of the maps
induced by the consecutive inclusions [pᵢ] ⊆ [p]; they form a chain map and descend to normalized complexes
(HA, Constr. 1.2.3.22, p. 62).

- AW is compatible with composition: for an order-preserving α : {1, …, n} ⟶ {1, …, m}, multi-additive
  F : ∏ Bᵢ ⟶ C and Gᵢ : ∏ Aⱼ over α(j) = i ⟶ Bᵢ with composite H, Ch(H)≥0 ≅ Ch(F)≥0 ∘ ∏ Ch(Gᵢ)≥0 and AW_H is
  the composite of AW_F with the AW_(Gᵢ), on normalized and on unnormalized complexes (HA, Rem. 1.2.3.25,
  p. 63).
- For the tensor product of a monoidal category satisfying the hypotheses of the Scope, the resulting
  oplax monoidal structures on N∗ and C∗ and the lax monoidal structure on DK are Tau Ceti's (HA,
  Ex. 1.2.3.26, p. 64).

**Checks.**

- For n = 1, AW is the identity of C∗(A¹).
- For n = 2 and p = 1, AW₁ has the two components F(d₁, id) : F(A₁, B₁) ⟶ F(A₀, B₁) (front vertex of A)
  and F(id, d₀) : F(A₁, B₁) ⟶ F(A₁, B₀) (back vertex of B). The shuffle map goes in the opposite direction,
  from Ch(F)≥0 of the chains to the chains of F, so it is not a candidate for AW.
- Using the back vertex on both sides, F(d₀, id) in place of F(d₁, id), does not give a chain map: in degree
  1 the composite with the differential of Ch(F)≥0 is 2F(d₀, d₀) − F(d₀, d₁) − F(d₁, d₀) instead of
  F(d₀, d₀) − F(d₁, d₁).
- For F the tensor product of a monoidal preadditive category, AW is Tau Ceti's Alexander–Whitney map of
  simplicial objects.

*Needs:* §1.4.1; §5.2.1 (unnormalized complexes); §5.3.2 (the two descriptions of N∗); §5.4.1
(multi-additive functors and Ch(F)); Tau Ceti `CategoryTheory.SimplicialObject.alexanderWhitney`,
`CategoryTheory.SimplicialObject.alternatingFaceMapComplexOplaxMonoidal`,
`CategoryTheory.Idempotents.DoldKan.oplaxMonoidalN`, `CategoryTheory.Idempotents.DoldKan.laxMonoidalΓ`.

### Examples

- For A = Ab, DK and N∗ are inverse equivalences, and πₙ of DK(ℤ[n]) is ℤ (§5.3).
- For A the finitely generated free modules over R = ℝ[x, y, z]/(x² + y² + z² − 1), which is not idempotent
  complete, and P the stably free but not free tangent module (P ⊕ R ≅ R³), DK of the complex R ⊕ P[1],
  formed in all modules, has terms R ⊕ Pⁿ, which are free, but its N₁ is P, so it is a simplicial object of A not in
  the image of DK on Ch(A)≥0: DK is fully faithful but not essentially surjective.

### Dependencies

Layer 1 (§1.4) only, with Part LimitsAndKanExtensions §9.5 for semisimplicial objects; Mathlib's chain
complexes and Dold–Kan correspondence; Tau Ceti's Alexander–Whitney map and monoidal Dold–Kan
correspondence. The ∞-categorical layers do not enter: this layer is classical homological algebra, used in
Layer 12 for the first page of the spectral sequence of a simplicial object.

## Layer 6: Ind-objects, limits of stable ∞-categories and Verdier quotients

### 6.1 Ind-objects, idempotent completion and limits of towers

**6.1.1.** Prove that for a small stable C and a regular cardinal κ, Ind_κ(C) is stable (HA, Prop. 1.1.3.6, p. 32).
The route: the Yoneda embedding j preserves finite limits and colimits (HTT 5.1.3.2, 5.3.5.14), so j(0) is
a zero object; a morphism of Ind_κ(C) is a κ-filtered colimit of morphisms in the image of j (HTT 5.3.5.15),
so its cofiber is a κ-filtered colimit of cofibers (HTT 5.3.5.3); its fiber is computed in P(C), where
Ind_κ(C) is closed under κ-small limits (HTT 5.3.5.4, 5.3.3.3, 5.1.2.2).

*Needs:* §1.2.1 (cofibers); §1.1.3 (HA, Def. 1.1.1.9); Part PresheavesAndCompletions §4.1.1 (HTT,
Def. 5.3.1.7); Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1); Part LimitsAndKanExtensions §8.2.2 (HTT,
Prop. 5.1.2.2); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2); Part PresheavesAndCompletions §6.2.2
(HTT, Prop. 5.3.3.3, only-if direction); Part PresheavesAndCompletions §6.4.1 (HTT, Prop. 5.3.5.3),
§6.4.2 (HTT, Cor. 5.3.5.4), §6.4.4 (HTT, Prop. 5.3.5.14); Part AccessibleInfinityCategories §4.6.1 (HTT, Prop. 5.3.5.15).

**6.1.2.** Prove that the idempotent completion of a stable ∞-category is stable (HA, Cor. 1.1.3.7, p. 33): by HTT
5.4.2.4 it is the full subcategory of Ind(C) on the retracts of objects of C, which is closed under shifts
and finite colimits (compact objects are closed under finite colimits, HTT 5.3.4.15); apply the closure
lemma of §2.1 inside Ind(C), which is stable by §6.1.1.

*Needs:* §2.1.2 (the closure lemma); §6.1.1 (Ind_κ is stable); Part AccessibleInfinityCategories §2.2.2
(HTT, Cor. 5.3.4.15); Part AccessibleInfinityCategories §4.4.1 (HTT, Lemma 5.4.2.4); Part PresheavesAndCompletions §3.1.1 (HTT,
Def. 5.1.4.1).

**6.1.3.** Prove that in a stable ∞-category C with countable products, every tower X : N(ℤ≥0)^op ⟶ C, written
⋯ ⟶ X₂ ⟶ X₁ ⟶ X₀ with maps tₙ : Xₙ₊₁ ⟶ Xₙ, has a limit, and that lim X is a fiber of 1 − s : ∏ₙ Xₙ ⟶ ∏ₙ Xₙ,
where the n-th component of s is the projection to Xₙ₊₁ followed by tₙ. For every object Z there is then a
short exact sequence of abelian groups
0 ⟶ lim¹ₙ Ext⁻¹(Z, Xₙ) ⟶ Ext⁰(Z, lim X) ⟶ limₙ Ext⁰(Z, Xₙ) ⟶ 0, the Milnor sequence, where for a tower of
abelian groups Aₙ the groups lim and lim¹ are the kernel and the cokernel of 1 − s on ∏ₙ Aₙ (no source states this; no
Lurie statement; the triangulated analogue is Stacks, Def. 13.34.1, Tag 08TC, for the triangle and
Lemma 15.88.5, Tag 0919, for the sequence). The route: the spine K ⊆ N(ℤ≥0), with all
vertices and only the edges n ⟶ n + 1, is inner anodyne (a filtered union of spine inclusions of simplices),
hence left and right anodyne, so restriction along K^op ⊆ N(ℤ≥0)^op preserves limit cones (HTT 4.1.1.3,
4.1.1.8). K is a pushout of copies of Δ[1] along their boundaries onto the discrete set of vertices, so a
limit over K^op is the equalizer of the identity and s (the dual of HTT 4.4.2.2), and in a stable
∞-category the equalizer of f and g is fib(f − g), dually to the coequalizer in the proof of §2.2. The
Milnor sequence is the long exact sequence of Ext⁰(Z, −) on the fiber sequence lim X ⟶ ∏ Xₙ ⟶ ∏ Xₙ
(§1.7, §1.8), since Ext⁰(Z, −) carries products to products.

- Dually, with countable coproducts, a sequence X₀ ⟶ X₁ ⟶ ⋯ has colimit a cofiber of 1 − s on ⊕ₙ Xₙ, and for
  every Y there is a short exact sequence 0 ⟶ lim¹ₙ Ext⁻¹(Xₙ, Y) ⟶ Ext⁰(colim X, Y) ⟶ limₙ Ext⁰(Xₙ, Y) ⟶ 0:
  apply the statement to C^op, which is stable (§1.2), where Ext groups are those of C with the variables
  exchanged.
- For a tower whose maps tₙ all induce surjections on Ext⁰(Z[1], −), the lim¹ term vanishes (Mittag-Leffler),
  and Ext⁰(Z, lim X) ≅ lim Ext⁰(Z, Xₙ).

**Checks.**

- For the tower ⋯ ⟶ HZ ⟶ HZ of multiplications by a prime p in spectra, lim of the groups π₀ = ℤ is 0 and
  lim¹ is ℤₚ/ℤ ≠ 0, so the limit spectrum has π₋₁ ≅ ℤₚ/ℤ and π₀ = 0. A formula without the lim¹ term would
  make the limit zero.
- For the tower with all maps zero, s = 0 and 1 − s is the identity, so lim X ≃ 0, as it must be (both
  lim and lim¹ of a tower of zero maps vanish). The fiber of s alone would be ∏ Xₙ ⊕ (∏ Xₙ)[−1], nonzero
  whenever some Xₙ is.
- For the constant tower at Y with identity maps, 1 − s on ∏ Y has fiber the diagonal copy of Y, so
  lim X ≃ Y; the plain product ∏ Y, which a formula forgetting the maps would give, is far larger.

*Needs:* §1.2.1 (opposites); §1.5.1 (hC additive, finite direct sums); §1.7.2; §1.8.1; §2.2.1 (equalizers as fibers,
dually to coequalizers); Part LimitsAndKanExtensions §2.3.1 (HTT, Prop. 4.1.1.3, right anodyne maps are
cofinal); Part LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8); Part LimitsAndKanExtensions §6.5.2 (HTT,
Prop. 4.4.2.2); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Mathlib `SSet.innerAnodyneExtensions`.

**6.1.4.** Prove that a stable ∞-category is idempotent complete exactly when its homotopy category is, in the sense
of Mathlib's `CategoryTheory.IsIdempotentComplete` (HA, Lemma 1.2.4.6, p. 69). The route is Lurie's: for
(2) ⇒ (1), a cofinal N(ℤ≥0) ⟶ Idem (HTT 4.4.5.17) and a direct sum splitting of the sequence X ⟶ X ⟶ ⋯; for
(1) ⇒ (2), embed C fully and exactly in Ind(C) (§6.1.1, HTT 5.3.5.14) and split Ext∗
along the idempotent, with the Milnor sequence for maps out of a colimit over N(ℤ≥0) (the colimit form
of §6.1.3).

*Needs:* §1.4.1 (direct sums); §1.5.1 (hC additive); §1.8.1; §2.1.2 (stable subcategories); §6.1.1
(Ind is stable) and §6.1.3 (the Milnor sequence); Part PresheavesAndCompletions §2.4.1 (HTT,
Prop. 4.4.5.17); Part PresheavesAndCompletions §2.1 (HTT, Defs. 4.4.5.2, 4.4.5.4, §4.4.5); Part PresheavesAndCompletions §6.1.2 (HTT,
Def. 5.3.5.1); Part PresheavesAndCompletions §6.4.4 (HTT, Prop. 5.3.5.14); Mathlib
`CategoryTheory.IsIdempotentComplete`.

### 6.2 Limits and filtered colimits in `Cat∞^Ex`

**6.2.1.** Prove that in a homotopy pullback C′ = C ×_D D′ of ∞-categories with C, D, D′ stable and F : C ⟶ D,
G : D′ ⟶ D exact, C′ is stable, the projections are exact, and a functor from a stable E to C′ is exact
exactly when both composites are (HA, Prop. 1.1.4.2, p. 34). The route is §2.2 with HTT 5.4.5.5 (finite
limits and colimits in a homotopy fiber product are computed componentwise, and a cone is a limit or
colimit cone exactly when both projections of it are) and the finite-limit criterion of §2.3.

*Needs:* §2.2.1; §2.3.1 (exact functors), §2.3.2 (the finite-limit criterion); Part AccessibleInfinityCategories §1.2.2 (HTT,
Lemma 5.4.5.5).

**6.2.2.** Prove that a product ∏ C_α of stable ∞-categories is stable and that a functor from a stable D into it is
exact exactly when each component is (HA, Prop. 1.1.4.3, p. 34). Limits and colimits in a product are
computed componentwise; apply §2.2 and §2.3. The `Suggested.lean` declarations are `isStable_pi` and
`isExact_lift_iff`, for products indexed by a type in the universe of the factors.

*Needs:* §2.2.1; §2.3.1 (exact functors), §2.3.2 (the finite-limit criterion).

**6.2.3.** Prove that `Cat∞^Ex` has small limits and that its inclusion into `Cat∞` preserves them (HA, Thm. 1.1.4.4,
p. 35). The route has four steps, with §6.2.1 and §6.2.2 as the only stable input.

- (a) *A simplicial model of `Cat∞^Ex`.* By Part LimitsAndKanExtensions §3.8, `Cat∞` is equivalent to
  N((Set⁺_Δ)°), the simplicial nerve of the fibrant marked simplicial sets over a point (the ∞-categories
  with their equivalences marked), whose mapping spaces are the cores of the functor ∞-categories. Let A^Ex
  be the simplicial subcategory of (Set⁺_Δ)° whose objects are the small stable ∞-categories and whose
  mapping spaces are the cores of Fun^Ex(C, D). By §2.3 these cores are unions of components of the cores of
  Fun(C, D), and composites of exact functors are exact, so A^Ex is a locally Kan simplicial category, its
  inclusion into (Set⁺_Δ)° is a union of components on every mapping space, and N(A^Ex) is `Cat∞^Ex` as a
  subcategory of `Cat∞`.
- (b) *Reduction to pullbacks and products.* By HTT 4.4.2.6 and 4.4.2.7, read for limits, an ∞-category with
  pullbacks and small products has small limits, and a functor out of it preserving pullbacks and small
  products preserves small limits. So it suffices that N(A^Ex) has pullbacks and small products and that the
  inclusion into N((Set⁺_Δ)°) preserves them.
- (c) *Homotopy limits in A^Ex.* By HTT 4.2.4.1, read for limits, a cone in the nerve of a locally Kan
  simplicial category is a limit cone exactly when it is a homotopy limit cone, that is, when for every
  object E the induced map from the mapping space into the apex to the homotopy limit of the mapping spaces
  into the diagram is a weak homotopy equivalence. In (Set⁺_Δ)° the pullback of exact functors C ⟶ D ⟵ D′
  is the homotopy fiber product C′ = C ×_D D′, and a product is the product of ∞-categories, each with its
  projections. Take such a cone over a diagram of A^Ex. If its apex lies in A^Ex and its legs are exact, then
  for every stable E the map Map_(A^Ex)(E, C′) ⟶ Map_(A^Ex)(E, C) ×^h Map_(A^Ex)(E, D′) over Map_(A^Ex)(E, D) is
  the restriction of the corresponding weak homotopy equivalence for (Set⁺_Δ)° to unions of components. It
  is again a weak homotopy equivalence exactly when a functor E ⟶ C′ is exact as soon as its composites with
  the legs are, since a homotopy pullback of unions of components is the union of the components of the
  homotopy pullback lying over them. The same holds for products, with products of mapping spaces.
  *Strict cones.* HTT 4.2.4.1 needs a strict cone, and a homotopy fiber product commutes only up to the
  chosen equivalence. So first factor F^♮ : C^♮ ⟶ D^♮ in the Cartesian model structure on Set⁺_Δ over a
  point (Part CartesianFibrations §5.7) as a trivial cofibration followed by a fibration C₁^♮ ⟶ D^♮. As
  D^♮ is fibrant, so is C₁^♮, and C₁ is an ∞-category (Part CartesianFibrations §5.8) equivalent to C,
  hence stable; C₁ ⟶ D is exact, exactness being invariant under equivalence (§2.3). The strict pullback
  C′ = C₁ ×_D D′ of a fibration between fibrant objects is a homotopy pullback, and it is a strict cone
  over a cospan of A^Ex equivalent to the given one. Products need no replacement, since every C^♮ is
  fibrant.
  *Size.* A^Ex and (Set⁺_Δ)° are large, and the proof of HTT 4.2.4.1 embeds the simplicial category into a
  projective model structure on simplicial presheaves on it, which needs it to be small. So argue object by
  object, as in Part LimitsAndKanExtensions §3.7, step 5, and in its application to N((Set⁺_Δ)°) in
  §3.8 (through the *Size* paragraph of §3.3). For each stable E, let A_E ⊆ A^Ex be the full simplicial
  subcategory on the objects of the diagram (C, D, D′, or the C_α), the apex C′ and E. It is small and
  locally Kan, and its mapping spaces are those of A^Ex. The homotopy-limit condition is a condition object
  by object, so it holds in A_E, and HTT 4.2.4.1 applied in A_E makes the nerve of the cone a limit diagram
  in N(A_E). By the mapping-space criterion (Part LimitsAndKanExtensions §1.4, HTT, Lemma 4.2.4.3), the
  comparison map of mapping spaces at E is a homotopy equivalence; as E is arbitrary, the same criterion
  makes the cone a limit diagram in N(A^Ex). The same argument in (Set⁺_Δ)°, with E an arbitrary
  ∞-category, gives the limit condition there, which is what preservation by the inclusion needs.
- (d) *The stable input.* HA 1.1.4.2 says that C′ is stable, that its projections are exact, and that
  exactness of E ⟶ C′ is detected by the two composites; HA 1.1.4.3 says the same for products. So by (c)
  the homotopy pullbacks and products of (Set⁺_Δ)° restrict to pullbacks and products in N(A^Ex), preserved
  by the inclusion, and (b) concludes.

*Needs:* §6.2.1 and §6.2.2 (HA, Props. 1.1.4.2, 1.1.4.3); §2.3.1 (`Cat∞^Ex`, Fun^Ex, exactness
invariant under equivalence); Part LimitsAndKanExtensions §1.4.1 (HTT, Lemma 4.2.4.3, the mapping-space
criterion); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1); Part LimitsAndKanExtensions §3.7.1 (the
object-by-object size argument, step 5); Part LimitsAndKanExtensions §3.3.1 (*Size*); Part
LimitsAndKanExtensions §3.8.1 (`Cat∞` ≃ N((Set⁺_Δ)°)); Part LimitsAndKanExtensions §6.5.4 (HTT, Props. 4.4.2.6, 4.4.2.7); Part CartesianFibrations §5.7.1 (HTT,
Prop. 3.1.3.7, the Cartesian model structure) and §5.8.1 (HTT, Prop. 3.1.4.1, its fibrant objects); Tau Ceti `SSet.catInfty` (HTT, Def. 3.0.0.1).

**6.2.4.** Prove that `Cat∞^Ex` has small filtered colimits and that its inclusion into `Cat∞` preserves them (HA,
Prop. 1.1.4.6, p. 35). The route is Lurie's: for a filtered diagram of stable ∞-categories and exact
functors with colimit C in `Cat∞`, prove that C is stable, that each C_I ⟶ C is exact, and that exactness of
C ⟶ D is tested on the C_I. Each step reduces to finite diagrams in C, which factor through a stage because
finite simplicial sets are ω-compact in `Cat∞` (SAG, proof of Lemma 4.5.3.1, p. 403), with the description of
filtered colimits in `Cat∞` (HTT 5.5.7.11).

*Needs:* §2.2.1 (stability through pushouts and pullbacks); §2.3.1 (exact functors); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Part AccessibleInfinityCategories §3.1.5 (SAG, proof of Lemma 4.5.3.1, p. 403; ω-compactness of finite
simplicial sets in `Cat∞`); Part PresentableInfinityCategories §5.4.1 (HTT, Prop. 5.5.7.11).

### 6.3 Verdier quotients

For stable C and E, `Fun^Ex(C, E) ⊆ Fun(C, E)` is the full subcategory on the exact functors (§2.3).

**6.3.1.** Define, for a small stable ∞-category C and a stable subcategory `D ⊆ C` (§2.1), the Verdier quotient C/D
as the localization C[W⁻¹] of C at the class W of morphisms whose cofiber lies in D, together with the localization
functor q : C ⟶ C/D (NS, Thm. I.3.3 (i), p. 19, with the localization of HA, Def. 1.3.4.1, p. 108). Define a Verdier
sequence to be a sequence D ⟶ C ⟶ E of exact functors between small stable ∞-categories with a null-homotopy of the
composite, such that D ⟶ C is fully faithful with image a stable subcategory D′, and the induced functor C/D′ ⟶ E,
which exists by the universal property of §6.3.3, is an equivalence. The kernel of an exact functor F : C ⟶ E is the
full subcategory of the X with F(X) a zero object.

- W contains the equivalences and is closed under composition and under the two-out-of-three property
  (the octahedral axiom of §1.7, the class of objects of D being closed under extensions).
- Every object of C/D is q(X) for some X ∈ C, and the objects of C/D are those of C in the standard model of
  the localization (NS, proof of Thm. I.3.3, p. 20).
- On homotopy categories, h(C/D) is the Verdier quotient hC/hD of triangulated categories: hq is a
  localization of hC at the morphisms whose cone lies in hD, in the sense of Mathlib's
  `CategoryTheory.Functor.IsLocalization` (NS, remark following Thm. I.3.3, p. 20).

**Checks.**

- For D = 0, W is the class of equivalences (a morphism of a stable ∞-category with zero cofiber is an
  equivalence, §1.7), so q is an equivalence C ≃ C/D; for D = C every morphism lies in W and C/D is
  contractible, the localization of C at all its morphisms being weakly contractible since C has a zero
  object. A definition with W the morphisms whose cofiber is a zero object, ignoring D, would give C in
  both cases.
- For C the finite spectra (the compact objects of Sp) and D those with torsion homotopy groups,
  the mapping formula of §6.3.2 gives π₀ Map_(C/D)(q𝕊, q𝕊) ≅ ℚ, the colimit of ℤ along the multiplications by n,
  so q is not full. A definition of C/D as the full subcategory of C right orthogonal to D would give 0: a
  finite spectrum on whose homotopy every n acts invertibly has rational, finitely generated homotopy
  groups, hence is zero.
- For C the finite spectra and D those whose rational homotopy has even Euler characteristic, D is a stable
  subcategory (the Euler characteristic is additive on cofiber sequences and changes sign under the shift),
  𝕊 ⊕ 𝕊 lies in D, and its retract 𝕊 maps to zero in C/D; so every X, a retract of X ⊕ X ∈ D, maps to zero
  and C/D ≃ 0. A notion of Verdier sequence demanding that D be exactly the kernel of C ⟶ E would reject
  D ⟶ C ⟶ 0, which this definition accepts; the kernel is the retract closure of D (§6.3.2).

*Needs:* §1.7.2 (octahedra); §2.1.2 (stable subcategories); §2.3.1 (exact functors); Part
AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1, p. 108, the localization C[W⁻¹], its uniqueness,
essential surjectivity and homotopy category), §2.4.2 (HA, Rem. 1.3.4.2, p. 108, its existence); §1.1.2 (HA, Def. 1.1.1.6); Mathlib `CategoryTheory.Functor.IsLocalization`.

**6.3.2.** Prove that, for a small stable C and a stable subcategory `D ⊆ C` (§2.1), for X, Y ∈ C, with D/Y = D ×_C
C/Y the ∞-category of maps Z ⟶ Y from objects of D, there is an equivalence Map_(C/D)(qX, qY) ≃ colim over (Z ⟶ Y) ∈
D/Y of Map_C(X, cofib(Z ⟶ Y)), the colimit being filtered; that consequently the Yoneda functor C/D ⟶ Fun(C^op, S), qY
↦ Map_(C/D)(q−, qY), factors through a functor C/D ⟶ Ind(C) sending qY to the formal filtered colimit of the cofib(Z ⟶
Y) (NS, Thm. I.3.3 (ii), p. 20); and that the kernel of q is the full subcategory of the retracts in C of objects of D
(not stated in the sources; from (ii)). The route is that of NS: Fun(C/D, S) ⊆ Fun(C, S) is the full subcategory of W-inverting functors
(HA, Def. 1.3.4.1), closed under limits and colimits in the presentable Fun(C, S) (HTT 5.5.3.6), so it has a left
adjoint L (HTT 5.5.2.9), and Map_(C/D)(qX, −) is L of Map_C(X, −) (NS, Lemma I.3.4, p. 21, by adjunction and the
Yoneda lemma). The formula LF(Y) = colim over D/Y of F(cofib(Z ⟶ Y)) defines a localization functor with that
essential image, by the criterion HTT 5.2.7.4. D/Y is filtered because it has finite colimits (HTT, Def. 5.3.1.7). For
the kernel: qX ≃ 0 exactly when the identity of qX is zero, so by the formula the map X ⟶ cofib(Z ⟶ X) is zero for
some Z ⟶ X with Z ∈ D; the cofiber sequence then splits in hC and X is a direct summand of Z (§1.5, §1.7); conversely
a retract of an object of D maps to a retract of 0.

*Needs:* §1.2.1 (cofib); §1.5.1; §1.7.2; §2.1.2 (D has finite colimits); §6.1.1 (Ind(C) is stable; Ind(C) ⊆ P(C));
§6.3.1 (the definition of C/D); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Part PresheavesAndCompletions §6.1.2 (HTT,
Def. 5.3.5.1); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2); Part PresheavesAndCompletions §6.4.4
(HTT, Prop. 5.3.5.14); Part PresentableInfinityCategories §2.2.2 (HTT, Cor. 5.5.2.9); Part PresentableInfinityCategories §3.1.2 (HTT,
Prop. 5.5.3.6); Part AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.4); Part AdjunctionsAndLocalizations
§2.4.1 (HA, Def. 1.3.4.1).

**6.3.3.** Prove that, for a small stable C and a stable subcategory `D ⊆ C` (§2.1), C/D is stable and q is exact, and
that for every stable E composition with q is an equivalence from Fun^Ex(C/D, E) onto the full subcategory of
Fun^Ex(C, E) on the functors carrying every object of D to a zero object (NS, Thm. I.3.3 (i), p. 19); the functor C/D
⟶ Ind(C) of §6.3.2 is then exact (NS, Thm. I.3.3 (ii), p. 20). The route is that of NS (proof of Thm. I.3.3, pp.
21–22): from the mapping-space formula of §6.3.2, q preserves finite colimits, because filtered colimits are left
exact in S; applied to C^op (§1.2), it preserves finite limits too; so C/D is pointed and additive, every pushout in
C/D lifts to C, hence C/D has finite colimits (HTT 4.4.2.4) and dually finite limits, and the units of Σ ⊣ Ω are
equivalences because they are after restriction along q. The universal property is then that of C[W⁻¹], an exact
functor inverting W exactly when it kills D (cofibers of maps in W lie in D, and X ⟶ 0 lies in W for X ∈ D).

*Needs:* §1.2.1 (opposites); §1.3.1 (Σ ⊣ Ω); §1.5.1; §2.3.2 (the finite-limit criterion); §6.1.1 (Ind(C) is stable,
for the exactness of C/D ⟶ Ind(C)); §6.3.2 (the mapping formula); Part LimitsAndKanExtensions §6.5.3 (HTT,
Cor. 4.4.2.4); Part PresheavesAndCompletions §6.2.2 (HTT, Prop. 5.3.3.3, filtered colimits in S are left
exact); Part AdjunctionsAndLocalizations §2.4.1 (HA, Def. 1.3.4.1).

**6.3.4.** Prove that, for a small stable C and a stable subcategory `D ⊆ C` (§2.1), for E presentable and stable, the
inclusion Fun^Ex(C/D, E) ⊆ Fun^Ex(C, E) (through q) has a left adjoint which is a localization in the sense of Part
AdjunctionsAndLocalizations §2.1 (HTT, Def. 5.2.7.2), and that the localization functor sends an exact F : C ⟶ E to
the composite C/D ⟶ Ind(C) ⟶ Ind(E) ⟶ E of the functor of the mapping formula, Ind(F) and the colimit functor of E
(NS, Thm. I.3.3 (iii), p. 20). The route is the criterion HTT 5.2.7.4 (3), checked on the explicit composite: it kills
D and is the identity on functors that already factor through q.

*Needs:* §2.3.1; §6.1.1; §6.3.2 (the mapping formula) and §6.3.3 (the universal property); Part PresheavesAndCompletions
§6.5.3 (HTT, Prop. 5.3.5.10, the extension Ind(F) and the colimit functor); Part AdjunctionsAndLocalizations
§2.3.1 (HTT, Prop. 5.2.7.4); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part PresentableInfinityCategories §1.1.1 (HTT,
Def. 5.5.0.1).

### Examples

- Ind(C) of a small stable C is stable, and so is its idempotent completion, for instance for C the finite
  spectra (§6.1).
- The limit of the tower ⋯ ⟶ HZ ⟶ HZ of multiplications by p has π₋₁ ≅ ℤₚ/ℤ, the lim¹ term of the Milnor
  sequence (§6.1).
- The fiber product C ×_D D′ of stable ∞-categories along exact functors is stable; for instance the
  ∞-category of composable pairs Fun(Δ[1], C) ×_C Fun(Δ[1], C), formed along target and source, which are
  exact and categorical fibrations, is stable (§6.2), in accordance with its equivalence to Fun(Δ[2], C)
  (§2.1).
- The Verdier quotient of the finite spectra by those with torsion homotopy has π₀ Map(q𝕊, q𝕊) ≅ ℚ, and the
  quotient by those with even rational Euler characteristic is zero (§6.3).

### Dependencies

Layers 1 and 2; Part LimitsAndKanExtensions (cofinality, finite colimits, the model of
`Cat∞` and its limits), Part AdjunctionsAndLocalizations (localizations), Part PresheavesAndCompletions
(Yoneda, idempotents, filtered colimits in S, Ind), Part AccessibleInfinityCategories (Ind of finite diagrams, idempotent
completion inside Ind, limits in categorical pullbacks, ω-compactness in `Cat∞`), Part PresentableInfinityCategories (the
adjoint functor theorem, presentable functor ∞-categories, filtered colimits of ∞-categories); Tau Ceti
`SSet.catInfty`; Mathlib `SSet.innerAnodyneExtensions`, `CategoryTheory.Functor.IsLocalization`,
`CategoryTheory.IsIdempotentComplete`.

## Layer 7: Spectrum objects, stabilization and spectra

### 7.1 Finite pointed spaces and excisive functors

**7.1.1.** With S∗ the pointed objects of S (Conventions), define S^fin ⊆ S as the smallest full subcategory containing
the final object and closed under finite colimits, S^fin_∗ ⊆ S∗ its pointed objects, and Sⁿ ∈ S^fin_∗ the
pointed n-sphere (HA, Not. 1.4.2.5, p. 141). Σ carries S^fin_∗ into itself.

- S^fin is freely generated by ∗ under finite colimits: for D with finite colimits, evaluation at ∗ is an
  equivalence from the right exact functors S^fin ⟶ D to D (HA, Rem. 1.4.2.6, p. 141). Since S = P(Δ⁰),
  S^fin is the free completion of Δ⁰ under finite colimits with no relations (HTT, Prop. 5.3.6.2, with R
  empty and 𝒦 the finite simplicial sets), and the inverse is left Kan extension along ∗ (HTT 4.3.2.15).

**Checks.**

- S⁰ = ∗ ⊔ ∗ with a base point and S¹ = ΣS⁰ lie in S^fin_∗; π₁S¹ ≅ ℤ.
- The space K(ℤ, 2) is not in S^fin, since its homology is nonzero in infinitely many degrees and finite
  colimits of ∗ have finitely generated total homology.
- S^fin is closed under finite colimits but not under retracts in general, so it is not the compact
  objects of S: a definition as the compact spaces would admit retracts of finite spaces whose Wall
  finiteness obstruction is nonzero.

*Needs:* §1.3.1 (Σ); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1);
Part LimitsAndKanExtensions §9.3.2 (HTT, Def. 7.2.2.1, pointed objects); Part LimitsAndKanExtensions §7.4.6
(HTT, Prop. 4.3.2.15); Part PresentableInfinityCategories §4.7.2, §4.7.5 (HTT, Prop. 5.3.6.2).

**7.1.2.** Define, for F : C ⟶ D: when C has pushouts, F is excisive when it carries pushout squares to pullback
squares; when C has a final object, F is reduced when F(∗) is final. Exc(C, D), Fun∗(C, D) and
Exc∗(C, D) = Exc(C, D) ∩ Fun∗(C, D) are the corresponding full subcategories of Fun(C, D) (HA, Def. 1.4.2.1,
p. 141).

- For C pointed with finite colimits: if C is stable, F is reduced and excisive exactly when it is left
  exact; if D is stable, exactly when it is right exact; if both are stable, exactly when it is exact (HA,
  Rem. 1.4.2.2, p. 141), by §2.2 and §2.3.
- If C has pushouts and D has K-indexed limits, Fun(C, D) has them, computed pointwise (HTT 5.1.2.2), and
  Exc(C, D) is closed under them; so is Fun∗(C, D) when C has a final object (HA, Rem. 1.4.2.3, p. 141).
- For C small, pointed, with finite colimits and D presentable, Fun∗(C, D), Exc(C, D) and Exc∗(C, D) are
  accessible localizations of Fun(C, D), hence presentable (HA, Rem. 1.4.2.4, p. 141): each is the
  subcategory of local objects for a small set of morphisms (HTT 5.5.4.18, 5.5.4.19, 5.5.3.6, 5.5.4.15).

**Checks.**

- The identity of S is not excisive: the pushout of ∗ ⟵ S⁰ ⟶ ∗ is S¹, and the pullback of ∗ ⟶ S¹ ⟵ ∗ is
  ΩS¹ ≃ ℤ, not S⁰.
- The constant functor at a final object is reduced and excisive; the constant functor at S⁰ ∈ S∗ is
  excisive but not reduced.
- The identity of a stable C is reduced and excisive (§2.2). A definition of excisive as preserving pushout
  squares would accept the identity of S, which the first Check shows is not excisive.

*Needs:* §2.2.1; §2.3.2 (the finite-limit criterion); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §4.1.2 (HTT,
Def. 5.4.2.5); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part CartesianFibrations §3.4.1 (HTT,
Prop. 1.2.7.3); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresentableInfinityCategories §3.1.2 (HTT,
Prop. 5.5.3.6); Part PresentableInfinityCategories §4.4.1 (HTT, Prop. 5.5.4.15); Part PresentableInfinityCategories §4.6.4 (HTT,
Lemma 5.5.4.18), §4.6.5 (HTT, Lemma 5.5.4.19); Tau Ceti `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`.

### 7.2 Spectrum objects

**7.2.1.** Define, for C with finite limits, a spectrum object as a reduced excisive functor S^fin_∗ ⟶ C, and
Sp(C) = Exc∗(S^fin_∗, C) (HA, Def. 1.4.2.8, p. 142). Define Ω^∞ : Sp(C) ⟶ C as evaluation at S⁰, and
Ω^(∞−n) as Ω^∞ composed with the shift X ↦ X[n] of Sp(C), which for n ≥ 0 is evaluation at Sⁿ (HA,
Not. 1.4.2.20, p. 146).

- For any simplicial set K, Sp(Fun(K, C)) ≅ Fun(K, Sp(C)) (HA, Rem. 1.4.2.9, p. 142): pullbacks and final
  objects in Fun(K, C) are pointwise (HTT 5.1.2.3), so excisive and reduced are pointwise conditions.

**Checks.**

- Sp(Δ[0]) ≃ Δ[0]; and for C the nerve of sets, every spectrum object X has X(S⁰) ≃ ΩX(S¹), the loop object
  of a set, which is a point, so Sp(C) ≃ Δ[0]. A definition by sequences of pointed objects without the loop
  condition would give the nonzero category of sequences of pointed sets.
- For C = S∗, Ω^∞ is not conservative: the spectrum object HZ[−1], whose value at Sⁿ is an
  Eilenberg–MacLane space K(ℤ, n − 1) for n ≥ 1, is not zero, while its value at S⁰ is contractible. A
  definition of spectrum objects as the objects of C itself would make Ω^∞ an equivalence.
- Ω^(∞−1)(X) = X(S¹) and Ω(Ω^(∞−1) X) ≃ Ω^∞ X; the opposite convention Ω^(∞−n) = evaluation at S⁻ⁿ is not
  defined for n > 0.

*Needs:* the definitions of §7.1.1 (finite pointed spaces) and §7.1.2 (excisive and reduced functors); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Part LimitsAndKanExtensions §8.2.3
(HTT, Cor. 5.1.2.3).

**7.2.2.** Prove that for C pointed with finite colimits and D with finite limits, Exc∗(C, D) is pointed (the constant
functor at a final object is a zero object) and has finite limits (HA, Lemma 1.4.2.10, p. 142). The route:
finite limits by §7.1; the constant functor is final (HTT 5.1.2.3) and initial in Fun∗(C, D), because it is
the left Kan extension of its restriction to ∗ (HTT 4.3.2.2) and maps out of a left Kan extension are
computed on the restriction (HTT 4.3.2.17).

*Needs:* §7.1.2 (limits of excisive functors); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); §1.1.1 (HA, Def. 1.1.1.1); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2); Part LimitsAndKanExtensions §8.2.3 (HTT,
Cor. 5.1.2.3); Part AdjunctionsAndLocalizations §1.8.1 (HTT, Prop. 4.3.2.17).

### 7.3 Stability of spectrum objects

**7.3.1.** For a functor F : C ⟶ D with D having finite limits and a commutative square τ in C with corners W, X, Y, Z
(W the source corner, Z the target corner), write η_τ : F(W) ⟶ F(X) ×_F(Z) F(Y) for the comparison map,
well defined up to homotopy. When τ is a pushout, X and Y are zero objects of C and F(X), F(Y) are zero
objects of D, so that Z is Σ_C W, it is a map η_W : F(W) ⟶ Ω_D F(Σ_C W) (HA, Not. 1.4.2.12, p. 143).

Prove the comparison lemma: for C pointed with finite colimits, D pointed with finite limits, F reduced and a
pushout square τ in C as above, there is a map θ_τ : F(X) ×_F(Z) F(Y) ⟶ Ω_D F(Σ_C W) with θ_τ ∘ η_τ
homotopic to η_W, together with a pullback square in Fun(Δ[1], D) whose corners are η_(Σ_C τ) ∘ θ_τ,
η_X, η_Y and η_Z (HA, Lemma 1.4.2.15, pp. 144–145). The route is Lurie's: extend τ by zero objects to a
grid of pushout squares ending in the suspensions of W, X, Y and Z, apply F, replace the upper left square by a
pullback, and read θ_τ off the large upper left square; the pullback square of arrows comes from the same grid.

*Needs:* §1.3.1 (Σ and Ω); §7.1.2 (reduced functors); §1.1.1 (HA, Def. 1.1.1.1, zero objects);
Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, pullbacks in Fun(Δ[1], D) are pointwise).

**7.3.2.** Prove the excision criterion: for C pointed with finite colimits, D pointed with finite limits and F reduced, F
is excisive exactly when η_X : F(X) ⟶ Ω_D F(Σ_C X) is an equivalence for every object X of C (HA,
Prop. 1.4.2.13, p. 143). The route is Lurie's: the forward direction is the case of the pushout square defining
Σ_C X. Conversely, for a pushout square τ, θ_τ ∘ η_τ ≃ η_W is an equivalence, so θ_τ has a right homotopy
inverse; in the pullback square of the comparison lemma the maps η_X, η_Y, η_Z are equivalences, so
η_(Σ_C τ) ∘ θ_τ is one and θ_τ has a left homotopy inverse. Hence θ_τ and then η_τ are equivalences.

*Needs:* §1.3.1 (Σ and Ω); §7.1.2 (excisive and reduced functors); the comparison lemma, §7.3.1 (HA,
Lemma 1.4.2.15).

**7.3.3.** Prove that for C pointed with finite limits and colimits: if Σ is fully faithful, pushout squares are
pullback squares; if Ω is fully faithful, pullback squares are pushout squares; if Ω is an equivalence, C is
stable (HA, Prop. 1.4.2.11, p. 142). The route is Lurie's, through the excision criterion, §7.3.2 (HA,
Prop. 1.4.2.13) applied to the identity, for which Σ fully faithful makes each η_X an equivalence; (2) follows
from (1) through C^op; (3) from (1), (2), Σ ⊣ Ω, and §2.2.

*Needs:* §1.2.1 (opposites); §1.3.1 (Σ ⊣ Ω); §2.2.1; §7.1.2 (excisive and reduced functors); the excision
criterion, §7.3.2 (HA, Prop. 1.4.2.13); Part InfinityCategoryFoundations §2.1.8 (HTT, Def. 1.2.10.1, fully faithful).

**7.3.4.** Prove that for C pointed with finite colimits and D with finite limits, Exc∗(C, D) is stable (HA,
Prop. 1.4.2.16, p. 145). The route is Lurie's: for presentable D, precomposition with Σ_C is an inverse of
Ω on Exc∗(C, D), and §7.3.3 applies, with finite colimits from §7.1; in general embed D into
P(D) by the left exact Yoneda embedding (HTT 5.1.3.2), P(D) presentable (HTT 5.5.1.1), and use the closure
lemma of §2.1.

*Needs:* §1.3.1 (Σ ⊣ Ω); §2.1.2 (the closure lemma); §7.1.2 (presentability of Exc∗); §7.2.2 (Exc∗ pointed with
finite limits); §7.3.3 (stability from invertible loops); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part PresheavesAndCompletions §1.3.2 (HTT,
Prop. 5.1.3.2); Part PresentableInfinityCategories §1.6.1 (HTT, Thm. 5.5.1.1).

**7.3.5.** Prove that for C with finite limits, Sp(C) is stable (HA, Cor. 1.4.2.17, p. 146): S^fin_∗ is pointed with
finite colimits, and §7.3.4 applies.

- For C∗ the pointed objects of C, the forgetful functor induces an equivalence Sp(C∗) ⟶ Sp(C) (HA,
  Rem. 1.4.2.18, p. 146): Sp(C∗) ≅ Sp(C)∗ (the case K = Δ[1] of §7.2), and Sp(C)∗ ⟶ Sp(C) is an equivalence
  because Sp(C) is pointed.

*Needs:* §7.1.1 (finite pointed spaces); §7.2.1 (spectrum objects, Sp of functor categories); §7.3.4
(Exc∗ stable); Part LimitsAndKanExtensions §9.3.2 (HTT, Def. 7.2.2.1, pointed objects).

### 7.4 The universal property of stabilization

**7.4.1.** Prove that for D with finite limits, D is stable exactly when Ω^∞ : Sp(D) ⟶ D is an equivalence (HA,
Prop. 1.4.2.21, p. 146). The route: (2) ⇒ (1) by §7.3; for (1) ⇒ (2), reduce by the lemma below with
f : S^fin ⟶ S^fin_∗ adding a base point, observe that for D stable the functors in Exc₀(S^fin, D) are the
right exact ones (pushouts in D are pullbacks by §2.2, and finite colimits are built from an initial object
and pushouts, HTT 4.4.2.4), and apply the freeness of S^fin (§7.1).

- For C with finite colimits and a final object, f : C ⟶ C∗ left adjoint to the forgetful functor, and D
  stable, composition with f is an equivalence Exc∗(C∗, D) ⟶ Exc₀(C, D), where Exc₀(C, D) is the full
  subcategory of excisive functors carrying the initial object to a final object (HA, Lemma 1.4.2.19,
  p. 146). The inverse sends F to X ↦ cofib(F(∗) ⟶ F(X)), using that pullback squares in D form a stable
  subcategory of the stable Fun(Δ[1] × Δ[1], D).

*Needs:* §1.2.1 (cofibers are unique); §2.1.1 (functor categories), §2.1.2 (stable subcategories); §2.2.1 (pushouts are
pullbacks); §7.1.1, §7.1.2 (excisive functors, reduced excisive = right exact, freeness of S^fin); §7.2.1 (Ω^∞); §7.3.5
(Sp(D) stable); §1.1.3 (HA, Def. 1.1.1.9); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions);
Part LimitsAndKanExtensions §6.5.3 (HTT, Cor. 4.4.2.4); Part LimitsAndKanExtensions §9.3.2 (HTT, Def. 7.2.2.1,
pointed objects).

**7.4.2.** Prove the universal property of stabilization: for C pointed with finite colimits and D with finite limits,
composition with Ω^∞ is an equivalence Exc∗(C, Sp(D)) ⟶ Exc∗(C, D) (HA, Prop. 1.4.2.22, p. 147); for C
stable, where reduced excisive functors are the left exact ones (§7.1), this is an equivalence from the left
exact functors C ⟶ Sp(D) to the left exact functors C ⟶ D (HA, Cor. 1.4.2.23, p. 147). The route: under
Exc∗(C, Sp(D)) ≅ Sp(Exc∗(C, D)) (the restriction of the Sp of functor categories of §7.2), the map is Ω^∞
of the stable Exc∗(C, D) (§7.3), an equivalence by §7.4.1.

*Needs:* §2.2.1; §7.1.2 (excisive functors, reduced excisive = left exact); §7.2.1 (spectrum objects, Ω^∞, Sp of
functor categories); §7.3.4 (Exc∗ stable); §7.4.1 (stability through Ω^∞).

### 7.5 Sp(C) as a limit of loop functors, and stability through Ω

**7.5.1.** Prove that for C small and pointed, the full subcategory P∗(C) ⊆ P(C) of presheaves carrying zero objects to
final objects is the accessible localization of P(C) at one map from an initial to a final object, hence
presentable; j factors through it, preserving zero objects and existing limits; colimit-preserving functors
P∗(C) ⟶ D, for D with small colimits, are the functors C ⟶ D carrying zero objects to initial objects; P∗(C)
is pointed, compactly generated, and closed in P(C) under small limits and weakly contractible colimits (HA,
Lemma 1.4.2.26, pp. 147–148). The route is Lurie's, with HTT 5.5.4.15 for (2), the mapping property of left
Kan extensions (HTT 4.3.2.17), pointwise limits and colimits (HTT 5.1.2.3) and weak contractibility of
filtered simplicial sets (HTT 5.3.1.20).

*Needs:* §1.1.1 (HA, Def. 1.1.1.1); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part PresentableInfinityCategories §1.2.1 (HTT, Def. 5.5.4.1);
Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.7.1); Part
LimitsAndKanExtensions §8.2.3 (HTT, Cor. 5.1.2.3); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2);
Part PresheavesAndCompletions §1.4.3 (HTT, Thm. 5.1.5.6); Part PresheavesAndCompletions §1.5.1 (HTT,
Def. 5.2.6.1); Part PresheavesAndCompletions §4.3.2 (HTT, Lemma 5.3.1.20); Part AdjunctionsAndLocalizations
§1.8.1 (HTT, Prop. 4.3.2.17); Part PresentableInfinityCategories §1.4.3 (HTT, Cor. 5.5.7.3); Part PresentableInfinityCategories §4.4.1 (HTT,
Prop. 5.5.4.15), §4.4.2 (HTT, Prop. 5.5.4.20).

**7.5.2.** Prove that for C pointed with finite limits, Ω^∞ lifts to an equivalence of Sp(C) with the homotopy limit of
the tower ⋯ ⟶ C ⟶ C of loop functors (HA, Prop. 1.4.2.24, p. 147). The route is Lurie's: the limit is
stable (for presentable C by HTT 5.5.3.18, Ω being a right adjoint (§1.3), and §7.3; in general through the
embedding into P∗(C) and the closure lemma of §2.1); then compare universal properties through §7.4.

- For C with finite limits but not pointed, Sp(C) is the homotopy limit of the tower ⋯ ⟶ C∗ ⟶ C∗ of loop
  functors on pointed objects (HA, Rem. 1.4.2.25, p. 147): combine Sp(C∗) ≃ Sp(C) (§7.3) with the
  statement for C∗, which has finite limits computed in C (HTT 1.2.13.8).

*Needs:* §1.3.1 (Σ ⊣ Ω); §2.1.2 (the closure lemma); §7.2.1 (spectrum objects, Ω^∞); §7.3.3 (stability from
invertible loops), §7.3.5 (Sp(C∗) ≃ Sp(C)); §7.4.2 (universal property); §7.5.1 (pointed
presheaves); Part InfinityCategoryFoundations §8.3.1 (HTT, Prop. 1.2.13.8); Part LimitsAndKanExtensions §9.3.2 (HTT,
Def. 7.2.2.1, pointed objects); Part PresentableInfinityCategories §5.2.6 (HTT, Thm. 5.5.3.18); Part Straightening §3.2.1 (HTT,
Prop. 3.3.3.1); ModelCategoryTheory, Part SimplicialCategories §3.2.1 (homotopy limits of towers).

**7.5.3.** Prove that for a pointed ∞-category C the following are equivalent: C is stable; C has finite colimits and Σ
is an equivalence; C has finite limits and Ω is an equivalence (HA, Cor. 1.4.2.27, p. 149). The route: for
(3) ⇒ (1), the tower of §7.5.2 is constant up to equivalence, so Ω^∞ is an equivalence
(HTT 3.3.3.1) and §7.3 applies; (2) ⇔ (1) by passing to C^op. The `Suggested.lean` declaration is
`isStable_iff_exists_loop_isCategoricalEquivalence`, for (1) ⇔ (3), with `M^Ω` of §1.1 as `loopSquares` and
evaluation at a vertex as Tau Ceti's `SSet.evalAt`.

*Needs:* §1.2.1 (opposites); §1.3.1 (Σ, Ω); §7.2.1 (Ω^∞); §7.3.5 (Sp(C) stable); §7.5.2 (the loop tower); Part
Straightening §3.2.1 (HTT, Prop. 3.3.3.1); Part LimitsAndKanExtensions §8.2.3 (HTT, Cor. 5.1.2.3, evaluation at
a vertex); Tau Ceti `SSet.fullEnhancedSubcategory`, `SSet.evalAt`, `SSet.QCat.IsCategoricalEquivalence`.

### 7.6 Spectra

**7.6.1.** Define a spectrum as a spectrum object of S, and Sp = Sp(S∗) (HA, Def. 1.4.3.1, p. 150); by §7.3,
Sp(S∗) ≃ Sp(S).

**Checks.**

- Sp is stable by §7.3, while S∗ is not: in S∗ the pushout of ∗ ⟵ S⁰ ⟶ ∗ is S¹, which is not a pullback.
- A spectrum is determined by the pointed spaces X(Sⁿ) with X(Sⁿ) ≃ ΩX(Sⁿ⁺¹) (§7.5); the sequence with S⁰ in
  degree 0 and points elsewhere is not a spectrum, since ΩX(S¹) is a point, so a definition by sequences of
  pointed spaces without these equivalences would accept it.
- Sp(Δ[0]) ≃ Δ[0]: replacing S∗ by the terminal ∞-category kills every spectrum, so the definition depends on
  the base.
- Dropping reducedness, Exc(S^fin_∗, S∗) contains the constant functor at S⁰, which is excisive (§7.1) but
  is not a spectrum: its value at the zero object is S⁰, not a point.
- Excisive means pushouts to pullbacks: the inclusion S^fin_∗ ⊆ S∗ preserves pushouts and is reduced, but
  sends the pushout of ∗ ⟵ S⁰ ⟶ ∗ to S¹, whose pullback ΩS¹ ≃ ℤ is not S⁰, so it is not a spectrum.

*Needs:* §7.1.1 (pointed spaces); §7.2.1 (spectrum objects); §7.3.5 (Sp(C∗) ≃ Sp(C)); Part InfinityCategoryFoundations §7.1.2 (HTT,
Def. 1.2.16.1); Part LimitsAndKanExtensions §9.3.2 (HTT, Def. 7.2.2.1, pointed objects).

### Examples

- Sp(Sp) ≃ Sp, Ω^∞ being an equivalence on a stable ∞-category (§7.4).
- Fun(K, Sp) ≃ Sp(Fun(K, S)) for every simplicial set K (§7.2).
- For a stable C, the left exact functors C ⟶ Sp are, through Ω^∞, the left exact functors C ⟶ S (§7.4);
  for instance the mapping spaces Map_C(X, −) lift to mapping spectra.

### Dependencies

Layers 1 and 2; Part AccessibleInfinityCategories, Part InfinityCategoryFoundations, Part CartesianFibrations, Part
LimitsAndKanExtensions (Kan extensions, pointwise limits, pointed objects), Part AdjunctionsAndLocalizations
(the mapping property of Kan extensions), Part Straightening (limits of towers of ∞-categories), Part
PresheavesAndCompletions (Yoneda, free cocompletion, filtered ∞-categories), Part PresentableInfinityCategories
(localizations, limits of presentable ∞-categories, free finite colimits), ModelCategoryTheory, Part
SimplicialCategories (homotopy limits of towers).

## Layer 8: Bounded t-structures and left completion

### 8.1 Bounded t-structures and the left completion

**8.1.1.** Define, for a stable C with a t-structure, C⁺ = ⋃ₙ C≤n, C⁻ = ⋃ₙ C≥−n and C^b = C⁺ ∩ C⁻, which are stable
subcategories (closed under cofibers and shifts, the closure lemma of §2.1) and are the full subcategories on the
objects of Mathlib's `t.plus`, `t.minus` and `t.bounded` for the t-structure of hC (C⁺ is `t.plus`, since C≤n is `t.ge
(−n)`); C is left bounded, right bounded or bounded when C = C⁺, C⁻ or C^b. Define the left completion Ĉ as the
homotopy limit of the tower ⋯ ⟶ C≤1 ⟶ C≤0 ⟶ C≤−1 ⟶ ⋯ of truncation functors τ≤n; concretely, the full subcategory of
Fun(N(ℤ), C) of functors F with F(n) ∈ C≤−n and τ≤−n F(m) ⟶ F(n) an equivalence for m ≤ n (HA, §1.2.1, definitions
following Prop. 1.2.1.16, p. 44).

**Checks.**

- For the t-structure (0, C), C≤0 = C, so C⁺ = C and C⁻ = 0: C is left bounded and C^b = 0.
- For Mathlib's derived category of abelian groups with the standard t-structure, C^b is the bounded
  derived category, matching Mathlib's bounded objects of a t-structure under the dictionary.
- For (C, 0) every C≤n is zero, so Ĉ = 0; a definition of Ĉ as the limit of the C≥−n under τ≥ would give C.
- C⁺ and C⁻ are not interchangeable: in spectra, ⊕ over n ≥ 0 of HZ[n] lies in Sp≥0 ⊆ Sp⁻ but in no Sp≤n,
  so it is not in Sp⁺.
- The concrete description needs the compatibility τ≤−n F(m) ≃ F(n): in spectra, F with F(0) = HZ and
  F(n) = 0 for n ≠ 0 has each F(n) ∈ Sp≤−n, but τ≤0 F(−1) = 0 is not F(0), so F ∉ Ĉ.

*Needs:* §2.1.2 (stable subcategories, the closure lemma); §3.1.2; §3.2.1 (truncation functors); Part
Straightening §3.2.1 (HTT, Prop. 3.3.3.1); ModelCategoryTheory, Part SimplicialCategories §3.2.1 (homotopy limits
of towers).

**8.1.2.** Prove that Ĉ is stable; that the functors landing in C≤0, resp. C≥0, form a t-structure on Ĉ; and that there
is an exact functor C ⟶ Ĉ restricting to an equivalence C≤0 ⟶ Ĉ≤0 (HA, Prop. 1.2.1.17, p. 44). The route:
Ĉ is also the limit of the tower ⋯ ⟶ C≤0 ⟶ C≤0 with maps τ≤0 ∘ Σ, which is the loop functor of (C≤0)^op;
so Ĉ^op ≃ Sp((C≤0)^op) (§7.5), stable by §7.3. The t-structure axioms are verified with Ext⁰ vanishing,
and the functor comes from a left adjoint to an inclusion (HTT 5.2.7.8), exact because right exact (§2.3).

*Needs:* §1.8.1; §2.3.2; §3.1.2; §3.2.1; §7.3.5 (Sp stable); §7.5.2 (the loop tower); §8.1.1 (the definition of Ĉ); Part
AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.8); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions).

**8.1.3.** Define C to be left complete when the functor C ⟶ Ĉ of §8.1.2 is an equivalence (HA,
definition following Prop. 1.2.1.17, p. 45).

**Checks.**

- For (0, C) on nonzero C, every C≤n is C with τ≤n the identity, so Ĉ is the limit of a constant tower and
  C ⟶ Ĉ is an equivalence: (0, C) is left complete, although it is not right complete (§8.1.5), so a
  definition of left completeness symmetric under passing to C^op would get one of the two wrong.
- Left completeness is not left boundedness: 𝕊 is in no Sp≤n, so Sp ≠ Sp⁺, and a definition "C = C⁺" would
  exclude spectra.
- (C, 0) on nonzero C is not left complete, as Ĉ = 0, although C ⟶ Ĉ is an equivalence on C≤0 = 0; a
  definition asking only for C≤0 ≃ Ĉ≤0 would accept it.

*Needs:* §8.1.1 (the left completion) and §8.1.2 (the functor C ⟶ Ĉ).

**8.1.4.** Prove that if C has countable products and C≥0 is closed under them, C is left complete exactly when
C≥∞ = ⋂ₙ C≥n consists of zero objects (HA, Prop. 1.2.1.19, p. 45). The route is Lurie's: limits of towers
exist as fibers of a map of products (§6.1), and lie in C≥−1 when the terms lie in C≥0 (§3.2); C ⟶ Ĉ has a
right adjoint lim, and unit and counit are checked on truncations, with TR4 in hC (§1.7).

*Needs:* §1.7.2; §3.2.1; §6.1.3 (limits of towers as fibers of 1 − s); §8.1.3 (left completeness);
§1.1.2 (HA, Defs. 1.1.1.4, 1.1.1.6); Part AdjunctionsAndLocalizations §1.1.1 (HTT, §1.2.7, adjunctions).

**8.1.5.** Define the right completion and right completeness by duality (HA, Rem. 1.2.1.20, p. 46). The opposite C^op
carries the t-structure with (C^op)≥0 = (C≤0)^op and (C^op)≤0 = (C≥0)^op, whose heart is (C♥)^op and whose
homotopy objects are πₙ of C^op = π₋ₙ of C (no source states this; shifts of C^op are those of C reversed); the right
completion of C is the opposite of the left completion of C^op, the limit of the tower of truncation functors
τ≥−n, and C is right complete when C^op is left complete. Prove the dual criterion: if C has countable
coproducts and C≤0 is closed under them, C is right complete exactly when C≤−∞ = ⋂ₙ C≤−n consists of zero
objects (the dual of HA, Prop. 1.2.1.19, by passing to C^op).

**Checks.**

- Spectra are right complete: a spectrum in every Sp≤−n has all πₙ zero, so it is zero, and Sp≤0 is closed
  under coproducts.
- For the t-structure (0, C) on nonzero C, C≤−∞ = C, so C is not right complete, although it is left
  bounded; a definition copying left completeness without dualizing would accept it, since (0, C) is left
  complete (its left completion is the constant tower at C).
- Right completeness is not right boundedness: the spectrum ⊕ over n ≥ 0 of HZ[−n] lies in no Sp≥−m, so
  Sp ≠ Sp⁻, while Sp is right complete.

*Needs:* §1.2.1 (opposites); §3.1.2 (t-structures); §8.1.1 (the left completion) and §8.1.4 (the criterion for left
completeness).

### Examples

- For the t-structure (C, 0) on nonzero C, C≥∞ = C, consistent with the failure of left completeness.
- Spectra satisfy the criterion: an ∞-connective spectrum has all πₙ zero, so it is zero.
- The opposite of spectra, with the opposite t-structure, is left complete because Sp is right complete,
  and right complete because Sp is left complete.

### Dependencies

Layers 1–3, §6.1 and Layer 7 (the left completion is a stabilization); Part
AdjunctionsAndLocalizations (localizations and the criterion for localizations), Part Straightening (limits of towers of
∞-categories), ModelCategoryTheory, Part SimplicialCategories (homotopy limits of towers).

## Layer 9: Presentable stable ∞-categories and the freeness of spectra

### 9.1 Presentable stabilization and Σ^∞₊

**9.1.1.** Prove that for C and D presentable with D stable: Sp(C) is presentable; Ω^∞ : Sp(C) ⟶ C has a left adjoint
Σ^∞₊; and an exact G : D ⟶ Sp(C) has a left adjoint exactly when Ω^∞ ∘ G does (HA, Prop. 1.4.4.4, p. 156).
The route is Lurie's: C∗ ≃ C_(1/) is presentable (HTT 5.5.3.11), Ω on C∗ has the left adjoint Σ (§1.3), so
the tower of §7.5 lies in `Pr^R` and its limit is presentable (HTT 5.5.3.18); the adjoints come from the
adjoint functor theorem (HTT 5.5.2.9), with HTT 4.4.2.9 and 1.2.13.8 for the forgetful functor C∗ ⟶ C.

*Needs:* §1.3.1 (Σ ⊣ Ω); §2.3.1 (exact functors); §7.2.1 (Ω^∞); §7.5.2 (Sp(C) as a tower on C∗); Part PresentableInfinityCategories
§2.2.2 (HTT, Cor. 5.5.2.9); Part PresentableInfinityCategories §3.2.2 (HTT, Prop. 5.5.3.11); Part PresentableInfinityCategories §5.1.1 (HTT,
Def. 5.5.3.1); Part PresentableInfinityCategories §5.2.6 (HTT, Thm. 5.5.3.18); Part LimitsAndKanExtensions §7.3.5 (HTT,
Prop. 4.4.2.9); Part InfinityCategoryFoundations §8.3.1 (HTT, Prop. 1.2.13.8); Part LimitsAndKanExtensions §9.3.2 (HTT,
Def. 7.2.2.1, pointed objects).

**9.1.2.** Prove that for C, D presentable with D stable, composition with Σ^∞₊ is an equivalence LFun(Sp(C), D) ⟶
LFun(C, D) between the ∞-categories of colimit-preserving functors (HA, Cor. 1.4.4.5, p. 157). The route:
passing to right adjoints (HTT 5.2.6.2), this is composition with Ω^∞ on right adjoints D ⟶ Sp(C), which are
exact (§7.1), so §7.4 (Sp of the target) and §9.1.1 apply.

*Needs:* §7.1.2 (reduced excisive = left exact); §7.2.1 (Ω^∞); §7.4.2 (Sp of the target); §9.1.1
(presentable stabilization); Part PresheavesAndCompletions §1.5.1, §1.5.2 (HTT, Prop. 5.2.6.2, Def. 5.2.6.1).

### 9.2 The sphere spectrum and the freeness of spectra

**9.2.1.** Define the sphere spectrum 𝕊 ∈ Sp as Σ^∞₊ ∗, the image of the final object of S under Σ^∞₊ : S ⟶ Sp (HA,
definition following Cor. 1.4.4.5, p. 157).

**Checks.**

- π₀𝕊 ≅ ℤ and π₁𝕊 ≅ ℤ/2; Ω^∞𝕊 has π₀ ≅ ℤ.
- 𝕊 is Σ^∞₊ of the point, which is Σ^∞ of the pointed space S⁰; Σ^∞ of ∗ regarded as a pointed space is the
  zero spectrum, so the subscript ₊ matters.
- Map_Sp(𝕊, X) ≃ Ω^∞ X for every spectrum X, by the adjunction of §9.1.
- Taking Σ^∞₊ of the two-point space S⁰, read as an unpointed space, would give Σ^∞(S⁰ ⊔ ∗) ≃ 𝕊 ⊕ 𝕊, with
  π₀ ≅ ℤ², not the sphere spectrum.
- The final, not the initial, object: Σ^∞₊ ∅ = Σ^∞(∗) is the zero spectrum.

*Needs:* §7.6.1 (spectra); §9.1.1 (Σ^∞₊); Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.3); Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1).

**9.2.2.** Prove that for D presentable and stable, evaluation at 𝕊 is an equivalence LFun(Sp, D) ⟶ D (HA,
Cor. 1.4.4.6, p. 157): factor it through LFun(S, D), the first factor an equivalence by §9.1 (with
Sp = Sp(S) by §7.3) and the second by the universal property of S = P(∗) (HTT 5.1.5.6), colimit-preserving
functors out of S being left adjoints (HTT 5.5.2.9).

*Needs:* §7.3.5 (Sp(C∗) ≃ Sp(C)); §7.6.1; §9.1.2 (universal property of Σ^∞₊); §9.2.1 (the sphere spectrum); Part
PresheavesAndCompletions §1.4.3 (HTT, Thm. 5.1.5.6); Part PresentableInfinityCategories §2.2.2 (HTT, Cor. 5.5.2.9).

### 9.3 Presentable stable ∞-categories as localizations

**9.3.1.** Prove that for C stable, D with finite limits and G : C ⟶ Sp(D) exact with Ω^∞ ∘ G fully faithful, G is fully
faithful (HA, Lemma 1.4.4.8, p. 158). The route is Lurie's: by §7.5 it suffices that each Ω^(∞−n) ∘ G : C ⟶ D∗
is fully faithful, which reduces to n = 0 through Ω; then compare fiber sequences of mapping spaces in
D∗ = D_(∗/) (HTT 5.5.5.12).

*Needs:* §2.3.1; §7.2.1 (spectrum objects, Ω^(∞−n)); §7.5.2 (Sp(D) as a tower on D∗); Part InfinityCategoryFoundations §2.1.8 (HTT,
Def. 1.2.10.1, fully faithful); §1.1.3 (HA, Def. 1.1.1.9); Part LimitsAndKanExtensions §9.3.2
(HTT, Def. 7.2.2.1, pointed objects); Part PresentableInfinityCategories §4.3.2 (HTT, Lemma 5.5.5.12).

**9.3.2.** Prove that for an ∞-category C the following are equivalent: C is presentable and stable; C is an accessible
left exact localization of a presentable stable ∞-category; C is equivalent to an accessible left exact
localization of Fun(E, Sp) for some small E (HA, Prop. 1.4.4.9, p. 159). The route is Lurie's: Fun(E, Sp) is
stable (§7.3 with §2.1) and presentable (HTT 5.5.3.6, §9.1); (2) ⇒ (1) by §2.3 (exact localizations); for
(1) ⇒ (3), embed C in P(E) with a left adjoint (HTT 5.5.1.1), lift to Sp(P(E)) ≃ Fun(E^op, Sp) by §7.4 (Sp of
the target) and §7.2 (Sp of functor categories) with §7.3 (pointed objects), the lift being fully faithful
by §9.3.1 and with an exact left adjoint by §9.1 and §2.3.

*Needs:* §2.1.1; §2.3.4 (exact localizations); §7.2.1 (spectrum objects, Sp of functor categories); §7.3.5 (Sp
stable, Sp(C∗) ≃ Sp(C)); §7.4.2 (Sp of the target); §7.6.1; §9.1.1 (presentable stabilization); §9.3.1
(fully faithful lifts); Part PresentableInfinityCategories §1.6.1 (HTT, Thm. 5.5.1.1); Part PresentableInfinityCategories
§3.1.2 (HTT, Prop. 5.5.3.6); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §4.1.2 (HTT,
Def. 5.4.2.5); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1).

### 9.4 Compact generation and Ind of Verdier quotients

**9.4.1.** Prove that for C compactly generated, Sp(C) is compactly generated (HA, Prop. 1.4.3.7, p. 152). The route is
Lurie's: with D the compact objects of the presentable Sp(C) (§9.1), the fully faithful Ind(D) ⟶ Sp(C)
(HTT 5.3.5.10) preserves colimits (HTT 5.5.1.9) and has a right adjoint G (HTT 5.5.2.9); G is conservative
because each Ω^(∞−n) is detected on compact objects of C, the left adjoints Σ^(∞−n)₊ preserving compact
objects (HTT 5.5.7.2) and filtered colimits being left exact (HTT 5.3.3.3).

*Needs:* §7.2.1 (Ω^(∞−n)); §9.1.1 (presentable stabilization); Part PresheavesAndCompletions §6.2.2 (HTT,
Prop. 5.3.3.3); Part PresheavesAndCompletions §6.5.3 (HTT, Prop. 5.3.5.10); Part PresentableInfinityCategories §1.4.2 (HTT,
Prop. 5.5.7.2); Part PresentableInfinityCategories §1.6.3 (HTT, Prop. 5.5.1.9); Part PresentableInfinityCategories §2.2.2 (HTT,
Cor. 5.5.2.9); Part InfinityCategoryFoundations §2.1.8 (HTT, Def. 1.2.10.1, fully faithful); Part PresheavesAndCompletions §6.1.1 (HTT,
Def. 5.3.4.5); Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.7.1).

**9.4.2.** Prove that for a small stable C and a stable subcategory D, with Verdier quotient q : C ⟶ C/D (§6.3):
Ind(D) ⊆ Ind(C) is a presentable stable subcategory of the presentable stable Ind(C); the functor
Ind(q) : Ind(C) ⟶ Ind(C/D) is a localization in the sense of Part AdjunctionsAndLocalizations §2.1 (HTT, Def. 5.2.7.2), whose
fully faithful right adjoint is the Ind-extension of the functor C/D ⟶ Ind(C) of §6.3 (Ind as in Part
PresheavesAndCompletions §6.1), which preserves filtered colimits and, being exact between stable
∞-categories, finite colimits, hence all small colimits; and the
kernel of Ind(q) is Ind(D) (NS, Prop. I.3.5, p. 22). The compact objects of Ind(C/D) are then the idempotent
completion Idem(C/D), which is stable (HTT 5.4.2.4 with HA, Cor. 1.1.3.7; §6.1), so the sequence is a
compactly generated presentation of the quotient. The route is that of NS: Ind(q) preserves colimits, so it
has a right adjoint R (HTT 5.5.2.9). R preserves filtered colimits because Ind(q) preserves compact objects
(HTT 5.5.7.2), and on C/D it is the functor of §6.3. For L = R ∘ Ind(q) with unit η, the maps L(η_X) and
η_(LX) are equivalences for X ∈ C by the mapping formula of §6.3, hence for every X, so Ind(q) is a
localization (HTT 5.2.7.4). For the kernel, the fiber of X ⟶ R q X is a filtered colimit of objects of D for
X ∈ C, and so, passing to filtered colimits, for every X ∈ Ind(C).

**Checks.**

- For D = 0 the kernel is 0 and Ind(q) is an equivalence; for D = C, Ind(C/D) ≃ 0 and the kernel is Ind(C).
- For C the finite spectra and D those with torsion homotopy, Ind(D) is the torsion spectra and the right
  adjoint R carries q𝕊 to the rational sphere 𝕊ℚ, the colimit of 𝕊 along the multiplications by n, so
  Ind(C/D) is the rational spectra. A right adjoint sending q𝕊 to 𝕊 itself would not land in the local
  objects, since the map 𝕊/n[−1] ⟶ 𝕊 is nonzero.
- For D the finite spectra with even rational Euler characteristic, C/D ≃ 0 (§6.3) and Ind(D) = Ind(C) = Sp,
  although D ≠ C: the kernel is Ind(D), not the Ind-completion of a strictly smaller retract-closed
  subcategory.

*Needs:* §2.1.2; §2.3.1; §6.1.1 (Ind(C) is stable), §6.1.2 (idempotent completions are stable); §6.3.1 (the Verdier quotient),
§6.3.2 (the mapping formula and the functor C/D ⟶ Ind(C)); Part PresheavesAndCompletions §6.5.3 (HTT, Prop. 5.3.5.10),
§6.5.4 (HTT, Prop. 5.3.5.11); Part PresentableInfinityCategories §1.4.2 (HTT, Prop. 5.5.7.2); Part PresentableInfinityCategories §2.2.2 (HTT, Cor. 5.5.2.9);
Part AdjunctionsAndLocalizations §2.3.1 (HTT, Prop. 5.2.7.4); Part AccessibleInfinityCategories §4.4.1 (HTT, Lemma 5.4.2.4);
Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.7.1).

### Examples

- Ind of the Verdier quotient of the finite spectra by the torsion ones is the rational spectra (§9.4).
- Sp is presentable and stable, and Fun(E, Sp) is too for every small E (§9.1, §9.3).
- For a presentable stable D, the colimit-preserving functors Sp ⟶ D correspond to objects of D, the functor
  of an object Y sending 𝕊 to Y (§9.2).

### Dependencies

Layers 1, 2, 6 and 7; Part InfinityCategoryFoundations, Part LimitsAndKanExtensions, Part
AdjunctionsAndLocalizations, Part PresheavesAndCompletions (duality of adjoints, Ind and its universal
property, left exact filtered colimits in S), Part AccessibleInfinityCategories (compact objects of Ind), Part PresentableInfinityCategories
(the adjoint functor theorem, presentable slices, limits in `Pr^R`, compact generation).

## Layer 10: Sp(𝒫) as presheaves of spectra, and the stable P_Σ

### 10.1 Sp(𝒫) as limit-preserving functors to Sp

**10.1.1.** For an ∞-category 𝒫 and an ∞-category 𝒞 with small limits, write Fun^lim(𝒫^op, 𝒞) ⊆ Fun(𝒫^op, 𝒞) for the
full subcategory of functors preserving small limits. For 𝒫 presentable, the Yoneda embedding identifies 𝒫
with Fun^lim(𝒫^op, S): it is fully faithful (HTT 5.1.3.1, applied in the next universe, since 𝒫 is large;
the values land in S because 𝒫 is locally small), and a functor 𝒫^op ⟶ S is representable exactly when it
preserves small limits (HTT 5.5.2.2; representable functors preserve limits by HTT 5.1.3.2).

Prove that for a presentable ∞-category 𝒫, composition with Ω^∞ : Sp ⟶ S, followed by this identification,
gives an equivalence Fun^lim(𝒫^op, Sp) ≃ Sp(𝒫), under which Ω^∞ : Sp(𝒫) ⟶ 𝒫 corresponds to pointwise
composition with Ω^∞; consequently Fun^lim(𝒫^op, Sp) is a presentable stable ∞-category (SAG, Rem. 1.3.2.2,
p. 118, in the presentable case: Lurie states it for ∞-topoi, and the argument uses only presentability).

The route is Lurie's. Use the model Sp ≃ Sp(S) = Exc∗(S^fin_∗, S) (§7.3, §7.6). The equivalence
Sp(S∗) ⟶ Sp(S) of §7.3 is composition with the forgetful functor S∗ ⟶ S, so it is compatible with Ω^∞:
Ω^∞ : Sp ⟶ S means Ω^∞ of Sp(S∗) followed by the forgetful functor, which is evaluation at S⁰ in the model
Exc∗(S^fin_∗, S), and "pointwise composition with Ω^∞" is unambiguous. Since 𝒫 is large, the
functor ∞-categories below, and the currying, are taken in the next universe, with S, Sp and S^fin_∗ lifted
to it, so that the one-universe requirement of the Conventions holds. A functor
𝒫^op ⟶ Exc∗(S^fin_∗, S) and a functor S^fin_∗ ⟶ Fun(𝒫^op, S) are the same datum, a functor of two variables
𝒫^op × S^fin_∗ ⟶ S (the exponential law for `ihom`, an isomorphism of simplicial sets carrying full
subcategories to full subcategories). The first preserves small limits exactly when each evaluation at an object of S^fin_∗
does, because Exc∗(S^fin_∗, S) is closed under limits in Fun(S^fin_∗, S), where they are pointwise (§7.1,
HA, Rem. 1.4.2.3; HTT 5.1.2.2). Likewise the second is reduced and excisive with values in Fun^lim(𝒫^op, S) exactly when it is
reduced and excisive in each object of 𝒫. Here Fun^lim(𝒫^op, S) is closed under small limits in
Fun(𝒫^op, S), since limits commute with limits (HTT 5.1.2.2 with the dual of HTT 5.5.2.3), so its final
object and its pullbacks are the pointwise ones. So both sides are the same
full subcategory of functors of two variables, and Fun^lim(𝒫^op, Sp) ≅ Exc∗(S^fin_∗, Fun^lim(𝒫^op, S)) ≃
Exc∗(S^fin_∗, 𝒫) = Sp(𝒫), the last step by the Yoneda identification, which is an equivalence and so
preserves finite limits. Sp(𝒫) is stable (§7.3, HA, Cor. 1.4.2.17) and presentable (§9.1, HA,
Prop. 1.4.4.4).

- Ω^∞ : Fun^lim(𝒫^op, Sp) ⟶ 𝒫 has a left adjoint Σ^∞₊ (§9.1), and Map(Σ^∞₊ U, F) ≃ Ω^∞ F(U) for every
  object U of 𝒫.
- The levels Ω^(∞−n) F, n ≥ 0, are pointed objects of 𝒫 with Ω^(∞−n) F ≃ Ω Ω^(∞−n−1) F, and they determine F
  (§7.5, HA, Prop. 1.4.2.24, Rem. 1.4.2.25).

**Checks.**

- For 𝒫 = S, a limit-preserving functor S^op ⟶ Sp is determined by its value at the point, since S^op is
  generated under small limits by it; so Fun^lim(S^op, Sp) ≃ Sp ≃ Sp(S), as the statement predicts. With all
  functors in place of the limit-preserving ones, Fun(S^op, Sp) is far larger than Sp.
- For 𝒫 = Δ[0], which is presentable, a limit-preserving functor Δ[0] ⟶ Sp preserves the empty limit, so its
  value is a zero object, and Fun^lim(Δ[0], Sp) ≃ Δ[0] ≃ Sp(Δ[0]); all functors would give Sp.
- Limit preservation excludes functors that correspond to no spectrum object: for 𝒫 = S, the functor
  S^op ⟶ Sp constant at 𝕊 sends the final object of S^op, the empty space, to 𝕊 ≠ 0, so it does not
  preserve the empty limit and is not in Fun^lim(S^op, Sp). A definition through functors preserving only
  pullbacks, or only limits over weakly contractible diagrams, would accept it: the limit of a constant
  diagram at 𝕊 over a weakly contractible index is 𝕊. Nonempty limits already exclude it, since it sends
  the product x ⊔ y of S^op to 𝕊 and not to 𝕊 ⊕ 𝕊.

*Needs:* §7.1.2 (HA, Rem. 1.4.2.3); §7.2.1 (HA, Def. 1.4.2.8, Rem. 1.4.2.9); §7.3.5 (HA, Cor. 1.4.2.17,
Rem. 1.4.2.18); §7.5.2 (HA, Prop. 1.4.2.24, Rem. 1.4.2.25); §7.6.1 (HA, Def. 1.4.3.1); §9.1.1 (HA,
Prop. 1.4.4.4); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §1.3.1
(HTT, Prop. 5.1.3.1), §1.3.2 (HTT, Prop. 5.1.3.2) and §5.2.1 (HTT, Lemma 5.5.2.3, dual form); Part PresentableInfinityCategories §2.1.2 (HTT, Prop. 5.5.2.2); Part PresentableInfinityCategories §1.1.1 (HTT,
Def. 5.5.0.1).

### 10.2 Stable P_Σ

**10.2.1.** Define, for a small ∞-category C with finite coproducts, P_Σ(C; Sp) ⊆ Fun(C^op, Sp) as the full subcategory of
presheaves of spectra that carry finite coproducts of C to products in Sp. This is the stable counterpart of
P_Σ(C) of Part PresentableInfinityCategories §7.1 (HTT, Def. 5.5.8.8) (no source states this).

- F lies in P_Σ(C; Sp) exactly when every level Ω^(∞−n) ∘ F lies in P_Σ(C): Ω^(∞−n) preserves limits, and the
  levels jointly detect equivalences of spectra (§7.5).
- F(∅) ≃ 0 for F in P_Σ(C; Sp), the empty product.
- P_Σ(C; Sp) is closed under small limits and small colimits in Fun(C^op, Sp), both computed pointwise:
  limits commute with products, and in Sp finite products are finite coproducts (§1.5), which commute with
  colimits.

**Checks.**

- For C the nerve of finite sets, F(n) ≃ F(1)^n, so evaluation at a one-element set identifies P_Σ(C; Sp) with
  Sp. Without the product condition one gets all of Fun(C^op, Sp).
- For C = Δ[0], whose object is also the empty coproduct, P_Σ(C; Sp) ≃ Δ[0]: F of the object is the empty
  product, 0. In P_Σ(Δ[0]) the same computation gives the contractible presheaf.
- Closure under colimits separates the stable from the unstable case: in P(C) the coproduct of two
  representables is not in P_Σ(C) (its value at ∅ is ∂Δ[1], not a point), while P_Σ(C; Sp) is closed under all
  colimits in Fun(C^op, Sp).
- Σ^∞₊ ∘ j(c), the pointwise suspension spectrum of a representable, is not in P_Σ(C; Sp): its value at ∅ is
  Σ^∞₊ Δ[0] = 𝕊, not 0.

*Needs:* §1.5.1 (HA, Lemma 1.1.2.9); §7.5.2 (HA, Prop. 1.4.2.24); §7.6.1 (HA, Def. 1.4.3.1); Part PresentableInfinityCategories
§7.1.1 (HTT, Def. 5.5.8.8); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2).

### 10.3 The stable P_Σ as a localization and as Sp(P_Σ(C))

**10.3.1.** Prove the following for a small ∞-category C with finite coproducts (no source states this; each step
cites its inputs).

1. P_Σ(C; Sp) is the localization of Fun(C^op, Sp) at the small set of maps
   ⊕ᵢ (Σ^∞₊ ∘ j(cᵢ))[k] ⟶ (Σ^∞₊ ∘ j(⊔ᵢ cᵢ))[k], for finite families (cᵢ) and k ∈ ℤ, induced by the coproduct
   inclusions. Hence it is presentable, stable and an accessible localization; its inclusion preserves small
   colimits, so it has a right adjoint as well; and the localization L_Σ is exact.
2. Composition with the levels identifies P_Σ(C; Sp) with Sp(P_Σ(C)), compatibly with
   Sp(P(C)) ≃ Fun(C^op, Sp), and with the limit-preserving functors P_Σ(C)^op ⟶ Sp of §10.1.
3. P_Σ(C; Sp) is compactly generated by the objects L_Σ(Σ^∞₊ ∘ j(c))[k].

Routes.

- *(1).* Map(Σ^∞₊ ∘ j(c), F) ≃ Ω^∞ F(c) by the pointwise adjunction Σ^∞₊ ⊣ Ω^∞ and Yoneda (HTT 5.1.3.1), so
  F is local exactly when Ω^∞(F(⊔ᵢ cᵢ)[−k]) ⟶ ∏ᵢ Ω^∞(F(cᵢ)[−k]) is an equivalence for all k, that is, when F
  preserves finite products. Fun(C^op, Sp) is presentable (§9.1) and stable (§2.1), and the localization at a
  small set is accessible and presentable (HTT 5.5.4.15). Closure under colimits (§10.2) gives the right
  adjoint by the adjoint functor theorem (HTT 5.5.2.9), and L_Σ preserves finite colimits, hence is exact
  (§2.3).
- *(2).* Sp(Fun(C^op, S)) ≅ Fun(C^op, Sp) (§7.2, HA, Rem. 1.4.2.9). P_Σ(C) ⊆ P(C) is closed under limits
  (HTT, Prop. 5.5.8.10 (1)), so Sp(P_Σ(C)) is the full subcategory of spectrum objects with levels in P_Σ(C),
  which is P_Σ(C; Sp) by §10.2. The comparison with limit-preserving functors is §10.1 for the presentable
  P_Σ(C).
- *(3).* P_Σ(C) is compactly generated (HTT, Prop. 5.5.8.10 (6)), so Sp(P_Σ(C)) is (§9.4, HA,
  Prop. 1.4.3.7), with generators the shifts of Σ^∞₊ of the representables of P_Σ(C), which are
  L_Σ(Σ^∞₊ ∘ j(c)).

*Needs:* §2.1.1; §2.3.1 (HA, §1.1.4); §7.2.1 (HA, Rem. 1.4.2.9); §7.5.2 (HA, Prop. 1.4.2.24); §9.1.1 (HA,
Prop. 1.4.4.4); §9.4.1 (HA, Prop. 1.4.3.7); §10.1.1; §10.2.1; Part PresentableInfinityCategories §2.2.2 (HTT, Cor. 5.5.2.9); Part
PresentableInfinityCategories §4.4.1 (HTT, Prop. 5.5.4.15); Part PresentableInfinityCategories §7.1.2 (HTT, Prop. 5.5.8.10); Part
PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1).

### 10.4 The universal property of the stable P_Σ

**10.4.1.** Prove that, for a small ∞-category C with finite coproducts and a presentable stable ∞-category D, composition
with c ↦ L_Σ(Σ^∞₊ ∘ j(c)) is an equivalence from the colimit-preserving functors P_Σ(C; Sp) ⟶ D to the
functors C ⟶ D that preserve finite coproducts (no source states this).

The route: by §10.3 (2), P_Σ(C; Sp) ≃ Sp(P_Σ(C)), and composition with Σ^∞₊ identifies colimit-preserving
functors Sp(P_Σ(C)) ⟶ D with colimit-preserving functors P_Σ(C) ⟶ D (§9.1, HA, Cor. 1.4.4.5). Those
correspond, by restriction along the Yoneda embedding, to the functors C ⟶ D that preserve finite coproducts
(HTT, Prop. 5.5.8.15).

**Checks.**

- For C the nerve of finite sets and D = Sp, finite-coproduct-preserving functors C ⟶ Sp are determined by their
  value at a point, and colimit-preserving functors Sp ⟶ Sp by their value at 𝕊 (§9.2), consistently with
  P_Σ(C; Sp) ≃ Sp from §10.2; the generator for the one-element set is n ↦ the direct sum of n copies of 𝕊.
- Restricting instead along c ↦ Σ^∞₊ ∘ j(c), which is not in P_Σ(C; Sp) (§10.2), gives the universal property
  of Fun(C^op, Sp), free on all functors C ⟶ D; the coproduct condition is what the localization adds.
- For C = Δ[0], the unique functor Δ[0] ⟶ D preserving the empty coproduct picks a zero object, matching
  P_Σ(Δ[0]; Sp) ≃ Δ[0].

*Needs:* §9.1.2 (HA, Cor. 1.4.4.5); §9.2.2 (HA, Cor. 1.4.4.6); §10.3.1; Part PresentableInfinityCategories §7.3.1 (HTT,
Prop. 5.5.8.15).

### Examples

- For C the nerve of finitely generated free abelian groups, the discrete objects of P_Σ(C) are the abelian
  groups (Part PresentableInfinityCategories §7.5), and P_Σ(C; Sp) ≃ Sp(P_Σ(C)) is its stabilization (§10.3).
- For any small C with finite coproducts, the functor Fun(C^op, Sp) ⟶ P_Σ(C; Sp) is the stable counterpart of
  the localization P(C) ⟶ P_Σ(C), and it is exact, which the unstable one is not.
- For a presentable 𝒫 and U ∈ 𝒫, the functor Map(Σ^∞₊ U, −) on Fun^lim(𝒫^op, Sp) is evaluation at U followed
  by Ω^∞ (§10.1); for 𝒫 = P_Σ(C) and U = j(c) it is the corepresented functor of §10.3 (1).

### Dependencies

Layers 7 and 9 (stabilization, presentable stabilization, compact generation), §1.5, §2.1 and §2.3; Part
LimitsAndKanExtensions (pointwise limits and colimits), Part PresheavesAndCompletions (Yoneda), Part
PresentableInfinityCategories (representable presheaves, the adjoint functor theorem, localization, P_Σ and its universal
property).

## Layer 11: Accessible t-structures and the t-structure on spectra

### 11.1 t-structures generated by objects

**11.1.1.** Prove that for C presentable stable, colimit-closed subcategories closed under extensions give
t-structures, and every small set of objects generates one (HA, Prop. 1.4.4.11, p. 160).

- A full subcategory C′ that is presentable and closed under small colimits and extensions is C≥0 for a
  t-structure on C (HA, Prop. 1.4.4.11 (1), p. 160). The route is Lurie's: C′/X = C/X ×_C C′ is presentable
  (HTT 5.5.3.12, with C/X presentable by HTT 5.5.3.10), so it has a final object (HTT 5.5.2.4), making C′
  coreflective; apply §3.4 to C^op and shift by one.
- For a small set {X_α}, the smallest full subcategory containing every X_α and closed under extensions and
  small colimits is presentable (HA, Prop. 1.4.4.11 (2), pp. 160–163). The route is Lurie's: choose κ with
  each X_α κ-compact (HTT 5.4.2.2); the colimit closure C″ of C′ ∩ C^κ is κ-accessible, hence presentable
  (HTT 5.5.1.1); it contains C′ once C″ is closed under extensions, that is, once cofib carries D into C″, where
  D ⊆ Fun(Δ[1], C) is spanned by the f : X ⟶ Y with X ∈ C″[−1] and Y ∈ C″; this holds once D is generated under
  colimits by its subcategory D^κ of maps between κ-compact objects. That follows from HTT 5.3.5.8,
  pointwise colimits (HTT 5.1.2.2), cofib preserving colimits (§1.2), and the cofinality of the evaluation
  maps (C′^κ[−1])/X ⟵ D^κ/f ⟶ (C′^κ)/Y for f : X ⟶ Y in D (HA, Prop. 1.4.4.11, proof of (2), pp. 162–163): by
  Theorem A (HTT 4.1.3.1) the fibers must be weakly contractible, and they are κ-filtered (HTT 5.3.1.7,
  5.3.1.20), a κ-small diagram extending by one lift against the trivial fibration C/f ⟶ C/X (HTT 2.1.2.5)
  and κ-small colimits of κ-compact objects being κ-compact (HTT 5.3.4.15).

*Needs:* §1.2.1 (opposites, cofib preserves colimits); §3.4.2 (extensions), §3.4.3 (t-structures from localizations);
Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §6.5.2 (HTT,
Lemma 5.3.5.8); Part PresheavesAndCompletions §4.3.2 (HTT, Lemma 5.3.1.20); Part AdjunctionsAndLocalizations
§2.3.1 (HTT, Prop. 5.2.7.8); Part PresentableInfinityCategories §1.6.1 (HTT, Thm. 5.5.1.1); Part PresentableInfinityCategories §2.1.3 (HTT,
Cor. 5.5.2.4); Part PresentableInfinityCategories §3.2.1 (HTT, Prop. 5.5.3.10), §3.2.3 (HTT, Prop. 5.5.3.12); Part AccessibleInfinityCategories §2.2.2 (HTT,
Cor. 5.3.4.15); Part AccessibleInfinityCategories §5.1.1 (HTT, Prop. 5.4.2.2); Part LimitsAndKanExtensions §5.4.2 (HTT,
Thm. 4.1.3.1); Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7);
Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1).

### 11.2 Accessible t-structures

**11.2.1.** Define a t-structure on a presentable stable C to be accessible when C≥0 is presentable (HA, Def. 1.4.4.12,
p. 160). By §11.1, every small set of objects generates an accessible t-structure, minimal among those with
the X_α in C≥0.

**Checks.**

- The t-structures (C, 0) and (0, C) on a presentable stable C are accessible: C and 0 are presentable.
- The t-structure on spectra (§11.3) is accessible, generated by {𝕊}.
- The condition asks for presentability, not stability, of C≥0: the connective spectra are not closed
  under fibers, so a definition requiring C≥0 to be a presentable stable subcategory would exclude the
  t-structure on spectra.
- C≥0 is coreflective, not an accessible localization: Sp≥0 is not closed under limits in Sp (the limit of
  ⋯ ⟶ HZ ⟶ HZ, multiplication by a prime p, has π₋₁ ≠ 0, §6.1), so a definition asking C≥0 ⊆ C to be an
  accessible localization would exclude the t-structure on spectra.

*Needs:* §3.1.2; §11.1.1; Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15); §1.1.3 (HA, Def. 1.1.1.9); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1).

**11.2.2.** Prove that for a t-structure on a presentable stable C the following are equivalent: C≥0 is presentable;
C≥0 is accessible; C≤0 is presentable; C≤0 is accessible; τ≤0 : C ⟶ C is accessible; τ≥0 : C ⟶ C is
accessible (HA, Prop. 1.4.4.13, p. 160). The route: C≥0 is closed under colimits and C≤0 is a localization
(§3.2), so both have small colimits and (1) ⇔ (2), (3) ⇔ (4); the fiber sequence τ≥0 ⟶ id ⟶ τ≤−1 links (5)
and (6); and accessible localizations are presentable (HTT 5.5.1.2, 5.5.4.15, 5.5.4.16), with §3.4 for the
converse.

*Needs:* §1.8.1; §3.2.1; §3.4.1 (quasisaturated classes), §3.4.3 (t-structures from localizations); §11.1.1; §11.2.1
(accessible t-structures); Part PresentableInfinityCategories §1.5.3 (HTT, Prop. 5.5.1.2); Part PresentableInfinityCategories §4.1.1
(HTT, Def. 5.5.4.5, Rem. 5.5.4.7); Part PresentableInfinityCategories §4.4.1 (HTT, Prop. 5.5.4.15); Part PresentableInfinityCategories
§4.6.1, §4.6.2 (HTT, Prop. 5.5.4.16, strongly reflective subcategories); §1.1.2 (HA, Defs. 1.1.1.4, 1.1.1.6); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §4.1.1 (HTT,
Def. 5.4.2.1), §4.1.2 (HTT, Def. 5.4.2.5).

### 11.3 The t-structure on spectrum objects and the homotopy groups of spectra

**11.3.1.** Prove that for C presentable, the full subcategory Sp(C)≤−1 of X with Ω^∞ X final determines an accessible
t-structure on Sp(C) (HA, Prop. 1.4.3.4, p. 150). The route: Ω^∞ is accessible and preserves limits, so it
has the left adjoint Σ^∞₊ (§9.1); for generators C_α of C, X ∈ Sp(C)≤−1 exactly when every Map(Σ^∞₊ C_α, X)
is contractible, and Sp(C)≥0, the closure of the Σ^∞₊ C_α under colimits and extensions, is the C≥0 of
§11.1.

*Needs:* §3.1.2; §7.2.1 (Ω^∞); §9.1.1 (Sp(C) presentable, Σ^∞₊); §11.1.1; §11.2.1 (accessible t-structures); Part
PresheavesAndCompletions §1.4.4 (HTT, Def. 5.1.5.7); Part AccessibleInfinityCategories §4.1.2 (HTT, Def. 5.4.2.5).

**11.3.2.** Prove that Sp is stable; that Sp≤−1 = {X : Ω^∞ X contractible} is an accessible t-structure; that it is left
and right complete; and that its heart is canonically the nerve of the category of abelian groups (HA,
Prop. 1.4.3.6, p. 151). Consequently πₙ : Sp ⟶ N(Ab) agrees for n ≥ 2 with πₙ ∘ Ω^∞, and a map of spectra is
an equivalence exactly when it induces isomorphisms on all πₙ, n ∈ ℤ (HA, Rem. 1.4.3.8, p. 153). The route:
stability by §7.3, the t-structure by §11.3.1; a spectrum is a sequence of pointed spaces
X(n) ≃ ΩX(n+1) (§7.5), in Sp≤m exactly when each X(n) is (n + m)-truncated, with levelwise truncations; a
spectrum X in the heart has each X(n) an n-connective, n-truncated Kan complex (π_k X(n) zero for k ≠ n),
hence X(n) ≃ K(A, n) for A = π₀X, and for n ≥ 2 the pointed mapping complex from K(A, n) to K(B, n) has
contractible components indexed by Hom(A, B), so the heart is equivalent to abelian groups (ModelCategoryTheory,
Part KanQuillen); completeness follows from §8.1 and its dual, πₙ commuting with products and filtered
colimits.

*Needs:* §3.3.3 (πₙ); §7.2.1 (Ω^∞); §7.3.5 (Sp(C) stable); §7.5.2 (sequences of pointed spaces); §7.6.1; §8.1.3, §8.1.4, §8.1.5 (left
complete, the criterion and its dual); §11.3.1 (the t-structure on Sp(C)); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); ModelCategoryTheory, Part KanQuillen §1.3.3 (Whitehead's theorem);
ModelCategoryTheory, Part KanQuillen §4.1.1 (n-connective Kan complexes); ModelCategoryTheory, Part KanQuillen
§5.1.1 (n-truncated Kan complexes); ModelCategoryTheory, Part KanQuillen §5.4.1 (Eilenberg–MacLane complexes);
ModelCategoryTheory, Part KanQuillen §5.5.2 (their uniqueness among n-connective n-truncated Kan complexes);
ModelCategoryTheory, Part KanQuillen §5.6.1 (the pointed maps between them); Tau Ceti `SSet.KanComplex.π`.

### 11.4 Colimits and compactness tested on coproducts

**11.4.1.** Prove that a stable ∞-category has small colimits exactly when it has small coproducts; that an exact functor
between such preserves small colimits exactly when it preserves small coproducts; and that an object X is
compact exactly when every map from X to a small coproduct factors, up to homotopy, through a finite
subcoproduct (HA, Prop. 1.4.4.1, p. 154). The route is Lurie's: (1) and (2) by HTT 4.4.3.2 with the finite
colimits of §2.2; for (3), a coproduct is a filtered colimit of its finite subcoproducts, and compactness
is tested on Ext⁰ groups through mapping spectra, which take values in the stabilization of the large
∞-category of spaces (§7.4) where homotopy groups detect equivalences (§11.3); the mapping objects are
built from the large Yoneda embedding (HTT 5.1.3.2) and colimits over cones (HTT 4.2.3.1).

*Needs:* §1.8.1; §2.2.1; §2.3.1, §2.3.2; §7.2.1 (Ω^∞); §7.4.2 (Sp of the target); §7.6.1; §11.3.2 (homotopy groups detect
equivalences); Part LimitsAndKanExtensions §6.1.1 (HTT, Not. 4.2.3.1); Part LimitsAndKanExtensions §6.5.6 (HTT,
Prop. 4.4.3.2); Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15) and §7.1.2 (HTT,
Def. 1.2.16.1); Part PresheavesAndCompletions §1.1.2 (HTT, §5.1.6); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, retracts); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5).

### 11.5 t-structures compatible with filtered colimits

**11.5.1.** Define, for a stable ∞-category C with small filtered colimits, a t-structure to be compatible with
filtered colimits when C≤0 is closed under small filtered colimits in C (HA, Def. 1.3.5.20, p. 129).

- Compatibility implies that each truncation τ≤n commutes with filtered colimits: C≥n+1 is closed under all
  colimits (§3.2), so a filtered colimit of the fiber sequences τ≥n+1 X ⟶ X ⟶ τ≤n X is again one, with its
  ends in C≥n+1 and in C≤n; by uniqueness of truncation triangles it is the truncation triangle of the
  colimit.

**Checks.**

- C≥0 is always closed under all small colimits that exist (§3.2), so the condition is only about C≤0, and a
  definition about C≥0 would be vacuous.
- For Sp with the t-structure of §11.3 the condition holds, because πₙ commutes with filtered colimits of
  spectra.
- For the opposite of Sp, with the opposite t-structure, the condition asks that Sp≥0 be closed under
  cofiltered limits. This fails: the limit of the tower ⋯ ⟶ HZ ⟶ HZ of multiplications by a prime p is not
  connective, its π₋₁ being the lim¹ term ℤₚ/ℤ (§6.1).

*Needs:* §3.1.2 (HA, Def. 1.2.1.4); §3.2.1 (truncation functors); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4);
Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15); §1.1.3 (HA, Def. 1.1.1.9); Part PresheavesAndCompletions §4.1.1 (HTT,
Def. 5.3.1.7).

### Examples

- 𝕊 is a compact object of Sp: a map 𝕊 ⟶ ⊕ Y_α is a class in π₀ of the direct sum, which is a finite sum
  (§11.4).
- The heart of Sp is abelian groups, the Eilenberg–MacLane spectrum HA of an abelian group A having π₀ = A and
  no other homotopy (§11.3).
- For a small set of objects of a presentable stable C, the t-structure they generate (§11.1) is accessible;
  for {𝕊} in Sp it is the t-structure of §11.3, and it is compatible with filtered colimits (§11.5).

### Dependencies

Layers 1–3, 6–9; Part InfinityCategoryFoundations, Part LimitsAndKanExtensions (Theorem A, colimits over
cones, pointwise colimits), Part AdjunctionsAndLocalizations, Part PresheavesAndCompletions (Yoneda,
filtered ∞-categories, Ind), Part AccessibleInfinityCategories (κ-compact objects), Part PresentableInfinityCategories (the presentation
theorem, presentable slices, accessible localizations), ModelCategoryTheory, Part KanQuillen (truncated,
connective and Eilenberg–MacLane Kan complexes); Tau Ceti's homotopy groups of Kan complexes.

## Layer 12: The ∞-categorical Dold–Kan correspondence and spectral sequences

### 12.1 The ∞-categorical Dold–Kan correspondence and the Tot tower

**12.1.1.** Prove that for a stable C, Fun(N(ℤ≥0), C) and Fun(N(Δ)^op, C) are categorically equivalent (HA, Thm. 1.2.4.1,
p. 66). The `Suggested.lean` declaration is `exists_isCategoricalEquivalence_doldKan`, an existence statement
with simplicial objects as Part LimitsAndKanExtensions' `simplicialObjects` (§9.1, restated). The equivalence sends a simplicial object X to the
filtered object D(0) ⟶ D(1) ⟶ ⋯ of colimits of its restrictions to N(Δ≤k)^op, so colim_k D(k) is a geometric
realization of X when either exists. The route is Lurie's, a composite of three equivalences. Let
I⁺ ⊆ N(ℤ≥0) × N(Δ₊)^op be the pairs (n, [m]) with m ≤ n and I ⊆ I⁺ those with 0 ≤ m.

- Composition with the projection p : I ⟶ N(Δ)^op is an equivalence from Fun(N(Δ)^op, C) onto the functors
  Fun⁰(I, C) carrying each (m, [s]) ⟶ (n, [s]) to an equivalence, for every ∞-category C: on the truncations
  I≤k these are right Kan extensions from Iᵏ ≃ N(Δ≤k)^op (HTT 4.3.2.15), and one passes to the limit of the
  tower (HA, Thm. 1.2.4.1, first step of the proof, pp. 76–77).
- Restriction from Fun⁰(I⁺, C), the functors left Kan extended from Fun⁰(I, C), is a trivial fibration, since
  each I/(n,[−1]) is finite and C has finite colimits (HTT 4.3.2.15; second step, pp. 76–77).
- Restriction along n ↦ (n, [−1]) is an equivalence Fun⁰(I⁺, C) ⟶ Fun(N(ℤ≥0), C): Fun⁰(I⁺, C) is the limit of
  a tower whose steps are composites of two trivial fibrations, one through the Kan extension lemma of §4.2
  and the cofinality of Iᵏ ⊆ I≤k, which has the adjoint (n, [m]) ↦ (k, [m]) (third step, pp. 76–77).

*Needs:* §4.2.2 (the Kan extension lemma, HA, Lemma 1.2.4.19); §1.1.3 (HA, Def. 1.1.1.9); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Part LimitsAndKanExtensions §9.1.1 (HTT,
Def. 6.1.2.2); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Part LimitsAndKanExtensions §7.4.6 (HTT,
Prop. 4.3.2.15); Part LimitsAndKanExtensions §5.4.2 (HTT, Thm. 4.1.3.1, for the cofinality of Iᵏ ⊆ I≤k);
ModelCategoryTheory, Part SimplicialCategories §3.2.1 (homotopy limits of towers); Tau Ceti
`SSet.QCat.IsCategoricalEquivalence`.

The filtered object D(0) ⟶ D(1) ⟶ ⋯ is the skeletal filtration of X. Its dual for cosimplicial objects is
the Tot tower.

**12.1.2.** Define, for an ∞-category C and a cosimplicial object X : N(Δ) ⟶ C, the totalization Tot X as a limit of X
and, for n ≥ 0, Totₙ X as a limit of the restriction of X to N(Δ≤n), when these limits exist. The
restrictions along N(Δ≤n−1) ⊆ N(Δ≤n) ⊆ N(Δ) give the Tot tower ⋯ ⟶ Tot₂ X ⟶ Tot₁ X ⟶ Tot₀ X under Tot X
(no source states this; the dual of the skeletal filtration, HA, Thm. 1.2.4.1, p. 66, read in C^op; totalization is the
dual of the geometric realization, HTT, Not. 6.1.2.12).

- When C has the limits involved, Tot X ≃ lim over n of Totₙ X: N(Δ) is the union of the N(Δ≤n), and a limit
  over this union is computed in stages (the dual of HTT 4.2.3.10 for the decomposition of N(Δ) along
  N(ℤ≥0)).
- Totₙ X exists when C has finite limits: N(Δ≤n) is not finite, but by the cofinality of injective maps into
  Δ≤n (HA, Lemma 1.2.4.17), read in C^op, a limit over it is a limit over the finite poset of faces of Δ[n],
  the face [m] ↪ [n] going to Xᵐ. If C is moreover stable with countable products, the limit of the tower
  exists by §6.1, and so does Tot X.

**Checks.**

- Tot₀ X ≃ X⁰, as Δ≤0 has one object and one morphism, and Tot₁ X ≃ X⁰ ×_X¹ X⁰, the pullback along the two
  coface maps, by the face-poset reduction above. A definition with Totₙ X = Xⁿ would make Tot₁ ⟶ Tot₀ a
  codegeneracy X¹ ⟶ X⁰, with fiber N¹X in place of the fiber N¹X[−1] of §12.1.3.
- For X constant at Y, every Totₙ X and Tot X are Y, because [0] is final in Δ and in each Δ≤n, so the
  nerves are weakly contractible and the limit of a constant diagram is Y. A definition taking the product
  over the objects would give a power of Y.
- In the nerve of abelian groups, a cosimplicial abelian group X has Tot X = Tot₁ X, the equalizer of the
  two coface maps X⁰ ⇉ X¹, and in general not the totalization of the associated cochain complex: limits in a
  nerve are 1-categorical, so higher cohomology is invisible there. In a stable C, by contrast, the fibers
  of §12.1.3 see every degree.

*Needs:* §1.2.1 (opposites); §6.1.3 (limits of towers); the skeletal filtration (§12.1.1); Part InfinityCategoryFoundations §1.2.2 (cones, HTT §1.2.8); Part LimitsAndKanExtensions §9.1.1 (HTT, Def. 6.1.2.2, simplicial objects, dually); Part
LimitsAndKanExtensions §6.3.2 (HTT, Cor. 4.2.3.10); Part LimitsAndKanExtensions §9.4.2 (HTT, Not. 6.1.2.12);
Part LimitsAndKanExtensions §9.6.1 (HA, Lemma 1.2.4.17); Tau Ceti `SSet.slice.IsLimit`.

**12.1.3.** The fibers of the Tot tower, for C stable with finite limits and a cosimplicial object X: fib(Totₙ X ⟶
Totₙ₋₁ X) ≃ (NⁿX)[−n], where NⁿX = fib(Xⁿ ⟶ MⁿX) is the n-th conormalized piece and MⁿX the matching object,
the limit of X over the surjections [n] ⟶ [m] with m < n; Xⁿ ⟶ MⁿX is split, so NⁿX is a direct summand
of Xⁿ in hC, the splitting being found in the idempotent completion of C (no source states this; the dual, in C^op, of HA,
Rem. 1.2.4.3, p. 67, and Cor. 1.2.4.18, p. 75, through the ∞-categorical Dold–Kan correspondence (§12.1.1) and HA,
Rem. 1.2.4.7, p. 70). In particular, for X constant NⁿX ≃ 0 for n ≥ 1 and the tower is constant.

*Needs:* §1.2.1 (opposites); §4.2.1 (colimits concentrated in one degree, HA, Cor. 1.2.4.18, read in C^op);
§6.1.2 (idempotent completion); §12.1.1 (the Dold–Kan correspondence) and §12.1.2 (the Tot tower); ModelCategoryTheory,
Part ModelCategories §7.5.1 (HTT, Not. A.2.9.7, latching objects, whose dual are the matching objects).

**12.1.4.** Define, for a small category I, an ∞-category C and X : N(I) ⟶ C, the cosimplicial replacement Π•X: the
cosimplicial object of C with ΠⁿX = ∏ over the n-simplices σ = (i₀ ⟶ ⋯ ⟶ iₙ) of N(I), degenerate ones
included, of X(iₙ), formed when C has these products. For α : [n] ⟶ [m], the component of ΠⁿX ⟶ ΠᵐX at an
m-simplex τ is the projection to the factor of τ ∘ α followed by X of the edge τ(α(n)) ⟶ τ(m). As a functor,
Π•X is the right Kan extension of X ∘ u along π : Δ/N(I) ⟶ Δ, where Δ/N(I) is the category of simplices of
N(I), π sends σ to its source [n] and u : Δ/N(I) ⟶ I sends σ to its last vertex σ(n). Prove that X has a
limit exactly when Π•X has a totalization, and that then Tot Π•X ≃ lim X (no source states this; the ∞-categorical form of
the formula for homotopy limits through cosimplicial replacement, Bousfield–Kan, Ch. XI). The route:

- u^op is cofinal. By Theorem A (HTT 4.1.3.1) it suffices that each category of pairs (σ, σ(n) ⟶ i) be weakly
  contractible. That category is the category of simplices of N(I/i), whose nerve is weakly equivalent to
  N(I/i) (HTT 4.2.3.14, with cofinal maps weak homotopy equivalences, HTT 4.1.1.3). N(I/i) is contractible,
  as I/i has a final object. Hence lim X ≃ lim (X ∘ u) (HTT 4.1.1.8, in C^op).
- π is a discrete fibration. For each [n] the discrete fiber N(I)ₙ includes into the comma category [n]/π,
  and each object (σ, β) of it receives exactly one map from the fiber, from σ ∘ β. So the inclusion is
  initial, and the pointwise right Kan extension along π exists and has value ∏ over N(I)ₙ of X(σ(n)) at [n]
  (existence: on a correspondence representing π the extension is along a full inclusion, so it exists by
  Part LimitsAndKanExtensions §7.4 (HTT, Lemma 4.3.2.13), dually, with the pointwise values of Part
  LimitsAndKanExtensions §7.6, since the limits giving them exist; this is Kerodon, Prop. 7.3.5.1, tag 0300, dually).
- The limit of a right Kan extension is the limit of the functor extended: apply HTT 4.3.2.7, dually, on a
  correspondence representing π, in which the inclusion of Δ is initial: for each σ, the objects of Δ over
  σ have the final object π(σ) ⟶ σ. So Tot Π•X ≃ lim (X ∘ u) ≃ lim X, and either side exists when the other
  does.

**Checks.**

- For I discrete on a set S, every simplex of N(I) is constant, so ΠⁿX = ∏ over S of X(s) for every n with
  identity structure maps, and Tot Π•X is that product, the limit of X. A replacement without the product,
  using a single chain, would give one factor.
- For I empty, every ΠⁿX is the empty product, a final object, and so are Tot Π•X and lim X; a replacement
  built from coproducts would give an initial object instead.
- The last vertex is forced: with X(i₀) in place of X(iₙ), the component at τ would need a map
  X(τ(α(0))) ⟶ X(τ(0)), against the direction of the edge τ(0) ⟶ τ(α(0)).
- Degenerate chains are needed: for I a point and only nondegenerate chains, ΠⁿX would be final for n ≥ 1,
  and the identity of Π⁰X = X(∗), being s⁰ ∘ d⁰, would factor through a final object, so X(∗) would have to
  be final.

*Needs:* §1.2.1 (opposites); §12.1.2 (the Tot tower); Part LimitsAndKanExtensions §2.3.1 (HTT, Prop. 4.1.1.3); Part
LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8); Part LimitsAndKanExtensions §5.4.2 (HTT, Thm. 4.1.3.1); Part
LimitsAndKanExtensions §6.4.1 (HTT, Prop. 4.2.3.14); Part LimitsAndKanExtensions §7.4.1 (HTT, Lemma 4.3.2.7);
Part LimitsAndKanExtensions §7.4.2 (HTT, Lemma 4.3.2.13) and §7.6.2 (HTT, Def. 4.3.3.2, Prop. 4.3.3.5, the
pointwise form); Mathlib
`CategoryTheory.nerve`.

### 12.2 The spectral sequence of a filtered object

**12.2.1.** Construct, for C stable with a t-structure whose heart is the nerve of an abelian category A and X ∈
Gap(ℤ, C), the `Triangulated.SpectralObject` of hC indexed by ℤ with `ω₁(i ≤ j) = X(i, j)` and δ the boundary maps of
the cofiber sequences X(i, j) ⟶ X(i, k) ⟶ X(j, k), and identify its spectral sequence — Mathlib's `spectralSequence`
of the image under `mapHomologicalFunctor` for π₀ — with the objects E_r(p, q) = im(π_(p+q) X(p−r, p) ⟶ π_(p+q) X(p−1,
p+r−1)) of A for r ≥ 1 and the differential d_r : E_r(p, q) ⟶ E_r(p−r, q+r−1) (HA, Constr. 1.2.2.6, p. 49). Lurie
writes p and q as superscripts; the comparison fixes the bidegree (−r, r − 1) against Mathlib's cohomological
indexing.

- `d_r ∘ d_r = 0` for every r ≥ 1 and the next page is the homology of the previous one (HA, Prop. 1.2.2.7 (1)–(2),
  pp. 49–51) come with Mathlib's `spectralSequence` and `spectralSequenceHomologyData` once the comparison above is in
  place, and are not proved again here. Lurie's route, for the record: E_r(p, q) is a quotient of π_(p+q) X(p−r, p),
  and the composite of two boundary maps factors through π∗ X(p−r, p−r) = 0.
- The identification of `E_(r+1)(p, q)` with `Z/B`, for Z = ker d_r and B = im d_r, is the content of that comparison,
  natural in X. Lurie's route, which Mathlib's construction follows: E_(r+1)(p, q) is the image in a factorization
  π_(p+q) X(p−r−1, p) ⟶ Z ⟶ Z/B ⟶ E_r/B ⟶ π_(p+q) X(p−1, p+r), whose first composite is an epimorphism and last a
  monomorphism.
- For fixed q the complex (E_1(∗, q), d_1) is the chain complex of §4.1 with the homological functor π_q
  applied (HA, Rem. 1.2.2.8, p. 49).

**Checks.**

- E_1(p, q) = π_(p+q) X(p−1, p), since for r = 1 the map is the identity; a definition with X(p−r, p+r)
  would change E₁.
- For the filtered object X(n) = 0 for n < 0 and X(n) = Y for n ≥ 0 (identities), E_1(p, q) is π_q Y at
  p = 0 and zero otherwise, and the spectral sequence degenerates at E₁; a definition through the cofibers
  of X(p) ⟶ X(p+1) would put it at p = −1.
- The bidegree of d_r is (−r, r − 1). In spectra, for X(n) = 0 for n < 0, X(0) = HZ and X(n) = 0 for n ≥ 1,
  E_1(0, 0) = π₀ HZ = ℤ, E_1(1, 0) = π₁(HZ[1]) = ℤ, and d₁ : E_1(1, 0) ⟶ E_1(0, 0) is an isomorphism, so
  E₂ = 0, matching colim X = 0. A differential of bidegree (−r, r + 1) would leave E_2(1, 0) = ℤ.

*Needs:* §3.1.2; §3.3.1, §3.3.3 (πₙ, the homological functor H⁰, the abelian heart); §4.1.1 (complexes, the chain
complex).

**12.2.2.** The construction and the proof of HA, Prop. 1.2.2.7 use only the long exact sequences of the πₙ. So for a
stable C, a homological functor H : hC ⟶ A to an abelian category and Hₙ = H ∘ [−n], the same formulas with
πₙ replaced by Hₙ define the spectral sequence of X ∈ Gap(ℤ, C) with respect to H, with d_r ∘ d_r = 0 and
E_(r+1) the homology of E_r (no source states this; from HA, Constr. 1.2.2.6 and Prop. 1.2.2.7, pp. 49–51, with πₙ replaced by
Hₙ): each step of the route of §12.2.1 uses only exactness of the long sequences of the Hₙ attached to the
cofiber sequences X(i, j) ⟶ X(i, k) ⟶ X(j, k), which holds for any homological H on the triangulated hC. The
t-structure case is H = π₀, for which Hₙ = πₙ. For H = Ext⁰(𝕊, −) on Sp, Hₙ = πₙ for the t-structure on
spectra, and one recovers the spectral sequence of §12.2.1.

**Checks.**

- For H = Ext⁰(𝕊, −) on Sp and the filtered object with X(n) = 0 for n < 0 and X(n) = HZ[1] for n ≥ 0,
  E_1(0, 1) = H₁(HZ[1]) = π₁(HZ[1]) = ℤ, as for π₀.
- For H = 0 every page is 0, while for H = π₀ the same X has E_1(0, 1) = ℤ, so the pages depend on H.
- Replacing Hₙ = H ∘ [−n] by H ∘ [n] would give E_1(0, q) = π_(−q)(HZ[1]), nonzero at q = −1 instead of
  q = 1, which reverses the bidegree.

*Needs:* §1.7.2 (hC triangulated); §1.8.1 (Ext groups); §4.1.1; §12.2.1 (the construction).

**12.2.3.** Define, for C stable with a t-structure whose heart is the nerve of an abelian category A and a filtered
object X of C, the spectral sequence of X (HA, Def. 1.2.2.9, second paragraph, p. 52) as the spectral sequence
of §12.2.1 of the complex in Gap(ℤ, C) obtained by restricting the extension of X from §4.1. Since the
extension is unique up to a contractible space of choices, the spectral sequence is well defined up to
canonical isomorphism.

**Checks.**

- The constant filtered object X(n) = Y (identities) has E_1 = 0, since each X(p−1, p) is the cofiber of an
  identity.
- The filtered object with X(n) = 0 for n < 0 and X(n) = Y for n ≥ 0 has E_1(0, q) = π_q Y and E_1(p, q) = 0
  for p ≠ 0.
- Reading X(p−1, p) as X(p) would put π_q Y at every p ≥ 0 for the second object, and π_q Y at every p for
  the first.

*Needs:* §3.1.2; §4.1.3 (filtered objects and their extension to Gap(ℤ ∪ {−∞}, C)); §12.2.1 (HA,
Constr. 1.2.2.6, Prop. 1.2.2.7).

### 12.3 Convergence for filtered objects

**12.3.1.** Define: an ∞-category admits sequential colimits when every N(ℤ≥0) ⟶ C has a colimit; for C stable with
sequential colimits, a t-structure is compatible with sequential colimits when C≤0 is closed under them
(HA, Def. 1.2.2.12, p. 52). A t-structure compatible with filtered colimits (§11.5) is compatible with
sequential colimits.

- If C has sequential colimits and the heart is an abelian A, then A has sequential colimits; if moreover
  the t-structure is compatible, the inclusion of the heart and every πₙ preserve them, and sequential
  colimits of monomorphisms in A are monomorphisms (HA, Rem. 1.2.2.13, p. 52). The route: C≥0 is closed
  under colimits (§3.2), A is a localization of C≥0 through τ≤0 (§3.2), and πₙ is homological (§3.3).

**Checks.**

- Spectra are compatible: πₙ commutes with filtered colimits.
- C≥0 is always closed under sequential colimits (§3.2), so the condition imposed on C≥0 would be vacuous.
- The opposite of spectra, with the opposite t-structure, is not compatible: its C≤0 is (Sp≥0)^op, and the
  limit of the tower ⋯ ⟶ HZ ⟶ HZ of multiplications by a prime p has π₋₁ ≅ lim¹ ≠ 0, so it is not
  connective.

*Needs:* §3.1.2; §3.2.1; §3.3.1, §3.3.3 (the heart, the homological functor H⁰); §11.5.1 (for the comparison sentence); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); Tau Ceti `SSet.coslice.IsColimit`.

**12.3.2.** Prove that if C is stable with sequential colimits and a t-structure compatible with them, and the filtered
object X has X(n) ≃ 0 for n ≪ 0, its spectral sequence converges to π_(p+q) colim X (HA, Prop. 1.2.2.14,
p. 52), in the following sense (HA, proof of Prop. 1.2.2.14, (i)–(iii), p. 53).

- For fixed p, q the differentials out of E_r(p, q) vanish for r ≫ 0, so the maps
  E_r(p, q) ⟶ E_(r+1)(p, q) ⟶ ⋯ are eventually epimorphisms, and E_∞(p, q) is their colimit in A.
  Differentials into E_r(p, q) need not vanish: in spectra, with X(n) = 0 for n < 0 and X(k) = ⊕ over j > k
  of HZ, each map X(k) ⟶ X(k+1) killing one summand, one finds E_r(0, 0) = ⊕ over j ≥ r of ℤ, the
  differential into E_r(0, 0) is nonzero for every r, and E_∞(0, 0) = 0 = π₀ colim X.
- For each n, Aₙ = πₙ colim X has the filtration FᵖAₙ = im(πₙ X(p) ⟶ Aₙ), with FᵖAₙ = 0 for p ≪ 0 and
  colim over p of FᵖAₙ ≅ Aₙ (by Rem. 1.2.2.13).
- E_∞(p, q) ≅ FᵖA_(p+q) / F^(p−1)A_(p+q) in A, through Tau Ceti's `abutmentFiltration` and
  `EInftyIsoCokernel` for the spectral object of §12.2.1 extended to `EInt` (X(−∞) = 0, X(+∞) = colim X).
  What this statement adds to the library is that extension, the identification of the abutment with
  πₙ colim X, and the vanishing hypotheses.

The route is Lurie's: with X(n) ≃ 0 for n < 0, differentials out of E_r(p, q) vanish for r > p, when
E_r(p, q) is the image of π_(p+q) X(p) in π_(p+q) X(p−1, p+r−1); the fiber sequence
X(p−1) ⟶ colim X ⟶ colim over r of X(p−1, p+r) identifies E_∞(p, q) with the graded piece.

*Needs:* §3.3.1 (the homological functor H⁰); §4.1.3 (filtered objects, the extension to Gap(ℤ ∪ {−∞}, C));
§12.2.1, §12.2.3 (the pages); §12.3.1 (exact sequential colimits); §1.1.2 (HA, Def. 1.1.1.4).

### 12.4 The spectral sequence of a simplicial object

**12.4.1.** Prove that for a stable C with a t-structure whose heart is an abelian A and X a simplicial object of C≥0,
with filtered object D (§12.1) and spectral sequence E_r(p, q), the spectral sequence converges to the
homotopy of the geometric realization (HA, Prop. 1.2.4.5, p. 68):

- The first page: for any simplicial object X of C, (E_1(∗, q), d₁) is the normalized chain complex of the
  simplicial object π_q X of A (HA, Rem. 1.2.4.4, p. 67; Prop. 1.2.4.5 (1)). The route is §12.2 (the first
  page) with two facts. First, two chain complexes in hC agree (HA, Rem. 1.2.4.3, p. 67): the Dold–Kan complex
  of X, with Cₙ = cofib(Lₙ X ⟶ Xₙ) for the latching object Lₙ (a direct summand of Xₙ), and the complex
  C′ₙ = cofib(D(n−1) ⟶ D(n))[−n] of §4.1; the cofiber of the map from the left Kan extension of the
  (n−1)-truncation to the n-truncation is concentrated in degree n with value Cₙ, and §4.2 computes its
  colimit as Cₙ[n]. Second, each Xₙ is, in the idempotent completion C^∨, a finite coproduct of the objects
  Σ⁻ᵐ cofib(D(m−1) ⟶ D(m)) for 0 ≤ m ≤ n, with D(−1) = 0 (HA, Rem. 1.2.4.7, p. 70): C^∨ is stable and hC^∨
  idempotent complete (§6.1), and classical Dold–Kan in hC^∨ (§5.3) identifies the pieces.
- Hence E_r(p, q) = 0 unless p, q ≥ 0, for every r ≥ 1; and for r > p and r > q + 1 the maps
  E_r(p, q) ≅ E_(r+1)(p, q) ≅ ⋯ are isomorphisms, defining E_∞(p, q) (HA, Prop. 1.2.4.5 (2)–(3), p. 68), by
  §12.2.
- cofib(D(m) ⟶ D(n)) ∈ C≥m+1 for m ≤ n; πₙ D(k) ⟶ πₙ D(k+1) is an epimorphism for k = n and an isomorphism
  for k > n, with stable value Aₙ; and the images FᵖAₙ of πₙ D(p) form a finite filtration with
  Fᵖ A_(p+q) / F^(p−1) A_(p+q) ≅ E_∞(p, q) (HA, Prop. 1.2.4.5 (4)–(6), pp. 68, 71). The route: (4) by
  induction on n − m through the decomposition of the terms Xₙ above and closure of C≥m+1 under colimits
  (§3.2); (6) with the formula for E_r of §12.2.
- If C has countable colimits or the t-structure is left complete, X has a geometric realization
  |X| ∈ C≥0 with πₙ|X| ≅ Aₙ (HA, Prop. 1.2.4.5 (7), pp. 69, 71). With countable colimits, |X| = colim D(n)
  (§12.1) and the previous bullet passes to the colimit, which stays in C≥k because C≥k is closed under
  colimits (§3.2); in the left complete case, build the colimit through the truncations, using C as the
  limit of the C≤n (§8.1) and colimits in a limit of ∞-categories (HTT 5.5.3.13).

*Needs:* §3.2.1 (closure under colimits); §3.3.1, §3.3.3 (πₙ, the homological functor H⁰); §4.1.3; §4.2.1 (colimits
concentrated in one degree); §5.1.1; §5.2.1; §5.3.2 (Dold–Kan in an idempotent complete additive category, the two
descriptions of N∗); §6.1.2, §6.1.4 (idempotent completion); §8.1.3 (left complete); §12.1.1; §12.2.1, §12.2.3 (the pages, the next
page is the homology); ModelCategoryTheory, Part ModelCategories §7.5.1 (HTT, Not. A.2.9.7); §1.1.2 (HA, Def. 1.1.1.6), §1.1.3 (HA, Def. 1.1.1.9); Part PresheavesAndCompletions §3.1.1 (HTT,
Def. 5.1.4.1); Part LimitsAndKanExtensions §9.4.2 (HTT, Not. 6.1.2.12); Part PresentableInfinityCategories §5.2.1 (HTT,
Prop. 5.5.3.13); ModelCategoryTheory, Part SimplicialCategories §3.2.1 (homotopy limits of towers); Mathlib
`AlgebraicTopology.normalizedMooreComplex`.

**12.4.2.** The Tot tower of a cosimplicial object X of C (§12.1) has the dual spectral sequence, the Bousfield–Kan
spectral sequence (Bousfield–Kan, Ch. X; here the spectral sequence of §12.2 applied in C^op). Read the Tot
tower as the filtered object Tot₀ X ⟶ Tot₁ X ⟶ ⋯ of the stable C^op, with the opposite t-structure, whose
heart is A^op, and apply §12.2. Re-indexed by s = p and t = −q, its first page is E₁(s, t) = πₜ NˢX, with
the fibers of §12.1, and d_r : E_r(s, t) ⟶ E_r(s + r, t + r − 1) (as maps in A; in A^op this is the
bidegree (−r, r − 1) of §12.2).

- By the dual of the first bullet of §12.4.1, (E₁(∗, t), d₁) is the conormalized cochain complex of the
  cosimplicial object πₜ X of A, so E₂(s, t) is its s-th cohomology, πˢ πₜ X. The target is π_(t−s) Tot X.
- No convergence is asserted in general. §12.3, read in C^op, applies only when C≥0 is closed under limits of
  towers, which fails for spectra (the Check of §12.3 with the lim¹ term).
- For a small category I and X : I ⟶ C, the cosimplicial replacement [n] ↦ ∏ over chains i₀ ⟶ ⋯ ⟶ iₙ of
  X(iₙ) has Tot equal to lim X, when C has the products involved (§12.1). The spectral sequence of §12.2 with
  respect to the homological functor Ext⁰(Z, −) of hC (a homological functor on hC^op with values in
  Ab^op), applied to its Tot tower, has E₂(s, t) = limˢ over I of Ext^(−t)(Z, X), the derived functors of
  lim on functors I ⟶ Ab, computed by this cosimplicial replacement (Bousfield–Kan, Ch. XI). If limˢ vanishes
  for s > d, then E₂ lies in 0 ≤ s ≤ d, every d_r with r > d is zero, and Ext⁰(Z, lim X) has a finite
  filtration of length at most d + 1 whose graded pieces are subquotients of the limˢ Ext^(−s)(Z, X). The
  route is Boardman's conditional convergence (no source states this). The fibers `Fₛ = fib(Tot X ⟶ Totₛ X)`, with
  `F₋₁ = Tot X`, give Boardman's indexing: the exact couple has `Aˢ = Ext(Z, Fₛ)` and `Eₛ = 0` for s < 0,
  and the target is the limit. The `Fₛ` have limit 0, so by the Milnor sequence of §6.1 the lim and lim¹ of
  the groups `Ext(Z, Fₛ)` vanish. That vanishing is exactly Boardman's conditional convergence to the limit
  (Boardman, Def. 5.10: `A^∞ = 0 = RA^∞`), so the spectral sequence converges conditionally to
  Ext⁰(Z, Tot X). When limˢ vanishes for s > d, a differential leaving (s, t) is nonzero only when
  s + r ≤ d, so only finitely many nonzero differentials leave each position. Hence the derived limit
  `RE_∞` vanishes, and Boardman's theorem for half-plane spectral sequences with entering differentials
  (Boardman, Thm. 7.1, and the remark after it) gives strong convergence; the filtration by the kernels
  of the maps to Ext⁰(Z, Totₛ X) is then exhaustive and Hausdorff, with the graded pieces above. For I = N(ℕ)^op, the
  towers, d = 1 and the filtration is the Milnor sequence of §6.1. Products of filtration classes, which need
  a symmetric monoidal structure, are not part of this Part.

*Needs:* §1.2.1 (opposites); §1.8.1 (Ext groups); §3.1.2; §3.3.3 (t-structures, the heart); §6.1.3 (limits of towers,
the Milnor sequence); §8.1.5 (the opposite t-structure and its heart); §12.1.2, §12.1.3 (the Tot tower and its fibers),
§12.1.4 (the cosimplicial replacement); §12.2.2 (the spectral sequence of a homological functor); §12.3.1, §12.3.2; §12.4.1 (the first page).

### Examples

- For the constant simplicial object at Y, the filtered object of §12.1 is constant at Y and its colimit,
  the geometric realization, is Y; for Y ∈ C≥0 the spectral sequence is concentrated on p = 0 (§12.4).
- For the cosimplicial object constant at Y, the Tot tower of §12.1 is constant at Y, its fibers vanish, and
  Tot is Y.
- For X : N(ℤ≥0)^op ⟶ C a tower, the cosimplicial replacement has Tot equal to lim X, which §6.1 computes
  as a fiber of 1 − s, and the Bousfield–Kan filtration of §12.4 is the Milnor sequence.
- For a simplicial object of spectra that is levelwise connective, πₙ|X| is computed by the spectral
  sequence with E₂ the homology of the normalized complexes of π_q X (§12.4).

### Dependencies

Layers 1–6, 8 and 11 (§11.5); Part InfinityCategoryFoundations, Part CartesianFibrations, Part LimitsAndKanExtensions
(cofinality, Theorem A, decompositions, Kan extensions, simplicial diagrams and the cofinality of injective
maps into Δ≤n), Part PresheavesAndCompletions (idempotent completion), Part PresentableInfinityCategories (colimits in limits
of ∞-categories), ModelCategoryTheory, Parts ModelCategories (latching objects) and SimplicialCategories
(homotopy limits of towers); Mathlib's normalized Moore complex; Tau Ceti `SSet.QCat.IsCategoricalEquivalence`,
`SSet.slice.IsLimit`, `SSet.coslice.IsColimit`.

## Downstream consumers

This roadmap is used by Parts HypercompletenessAndCoherence, PrestableInfinityCategories and DerivedInfinityCategories, each of which lists what it uses from it in its own supplier contracts.

## References

- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  Cited: §1.1 (stable ∞-categories, the triangulated homotopy category, exact functors and limits of
  stable ∞-categories, pp. 17–36), §1.2.1–1.2.4 (t-structures and their completions, ℤ-complexes, filtered
  objects and their spectral sequences, Dold–Kan, simplicial objects, pp. 37–77), Def. 1.3.3.1 (p. 97),
  Def. 1.3.4.1 and Rem. 1.3.4.2 (p. 108), Def. 1.3.5.20 (p. 129), §1.4.2–1.4.4 (spectrum objects, spectra,
  presentable stable ∞-categories, pp. 141–163).
- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited through the
  earlier Parts by theorem number.
- **SAG.** Jacob Lurie, *Spectral Algebraic Geometry*, author's PDF, version of 3 February 2018,
  [math.ias.edu/~lurie/papers/SAG-rootfile.pdf](https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf). Statement
  numbers and pages are those of this PDF, whose PDF and printed page numbers agree.
  Cited: Rem. 1.3.2.2 (p. 118), in its presentable case (§10.1); proof of Lemma 4.5.3.1 (p. 403), cited in §6.2,
  through Part AccessibleInfinityCategories §3.1.
- **BBD.** Alexander Beilinson, Joseph Bernstein, Pierre Deligne, *Faisceaux pervers*, Astérisque 100
  (1982). Cited by locator only: Thm. 1.3.6 (the heart of a t-structure is abelian, with its kernels,
  cokernels and homological functor), in §3.3.
- **NS.** Thomas Nikolaus, Peter Scholze, *On topological cyclic homology*, Acta Math. 221 (2018), 203–409;
  cited from arXiv version 2 (7 September 2018),
  [arXiv:1707.01799](https://arxiv.org/abs/1707.01799), whose page numbers are used. Cited: Thm. I.3.3,
  pp. 19–22, with Lemma I.3.4, p. 21 (§6.3); Prop. I.3.5, p. 22 (§9.4).
- **Bousfield–Kan.** A. K. Bousfield, D. M. Kan, *Homotopy Limits, Completions and Localizations*, Lecture
  Notes in Math. 304, Springer (1972), [doi:10.1007/978-3-540-38117-4](https://doi.org/10.1007/978-3-540-38117-4).
  Cited by locator only: Ch. X (the spectral sequence of a cosimplicial object) and Ch. XI (cosimplicial
  replacement and the derived functors of lim), in §12.1 and §12.4.
- **Boardman.** J. Michael Boardman, *Conditionally convergent spectral sequences*, in *Homotopy invariant
  algebraic structures*, Contemp. Math. 239, Amer. Math. Soc. (1999), 49–84. Cited by locator only:
  Thm. 7.1 (conditional convergence with vanishing `RE_∞` gives strong convergence), in §12.4.
- **Kerodon.** Jacob Lurie, *Kerodon*, [kerodon.net](https://kerodon.net), online. Cited by locator only:
  Prop. 7.3.5.1, tag 0300 (existence of pointwise Kan extensions when the pointwise colimits exist; used
  dually, for right Kan extensions), in §12.1.
- **Stacks.** The Stacks project authors, *The Stacks project*,
  [Tag 08TC](https://stacks.math.columbia.edu/tag/08TC) (Def. 13.34.1, derived limits in a triangulated
  category) and [Tag 0919](https://stacks.math.columbia.edu/tag/0919) (Lemma 15.88.5, the lim¹ sequence of
  a derived limit). Cited as the triangulated analogue of the tower limit and Milnor sequence of §6.1.
