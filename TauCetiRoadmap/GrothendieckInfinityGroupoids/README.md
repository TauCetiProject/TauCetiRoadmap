# Roadmap: Grothendieck ∞-groupoids: globular theories, coherators and their models

**Summary.** Build Grothendieck's globular ∞-groupoids in the form Maltsiniotis and Ara gave to
the definition of *Pursuing Stacks*: the globe category `𝔾` and globular sets, tables of
dimensions and globular sums, the category `Θ₀`, globular extensions, admissible pairs,
contractibility, free extensions along admissible pairs, cellular towers and coherators; the
category `∞-Gpd_C` of ∞-groupoids of type `C` (globular presheaves on `C` sending globular sums to
globular products); their homotopy groups and weak equivalences; the fundamental ∞-groupoid
`Π_∞(X)` of a topological space, with the canonical isomorphisms `π_n(Π_∞ X, x) ≅ π_n(X, x)`, so
that `Π_∞` preserves and reflects weak equivalences (Ara 2013, Theorem 8.7 and Corollaries
8.9–8.11); cellular ∞-groupoids; and the functor `Π_∞ : Hot → Ho(∞-Gpd_C)` induced between the
localizations, with the independence of its homotopy invariants from the choices made.

**Research motivation.** These objects were introduced to model homotopy types: Grothendieck's
homotopy hypothesis asks whether the functor `Hot → Ho(∞-Gpd_C)` is an equivalence of categories
for every coherator `C` (Ara 2013, Conjecture 8.14). That question motivates the subject and is
not a target of this roadmap; no item states it or depends on it. The section *Research context*
records the recent work on it and the boundary between what is claimed and what is formalized.

The « yoga » first appears in Grothendieck's notes in a 1975 letter to Breen (Montpellier fonds,
folder 134-2, p. 42: an `n`-groupoid up to `n`-equivalence is « essentially the same thing » as
a homotopy `n`-type); the definitions specified here are the refereed ones of Ara 2013, after
*Pursuing Stacks* (ed. Maltsiniotis, 2022) and Maltsiniotis 2010.

Suggested home: `TauCeti/AlgebraicTopology/GlobularGroupoid/` (globular sets, theories, models,
homotopy groups) and `TauCeti/AlgebraicTopology/GlobularGroupoid/Topological/` (`Π_∞` and the
comparison).

## Scope and ownership

**In scope.** This roadmap owns:

- the globe category `𝔾` and globular sets, coglobular objects of a category and their
  globular sums (Layers 0 and 1);
- tables of dimensions, globular sums, the category `Θ₀`, globular extensions, admissible pairs,
  liftings, contractibility, free extensions `C[A]`, cellular towers and coherators, with the
  canonical coherator as the example that exists (Layer 2);
- ∞-groupoids of type `C`, their underlying globular sets, free models and disks (Layer 3);
- the homotopy theory of ∞-groupoids of type `C`: identity cells, the relation of being joined by
  a cell, `π₀`, the groups `π_n`, their independence of choices, and weak equivalences
  (Layer 4);
- the fundamental ∞-groupoid of a topological space and its comparison with homotopy groups of
  spaces (Layer 5);
- cellular ∞-groupoids (Layer 6);
- the weak-equivalence classes as `MorphismProperty`, the functor `Hot ⥤ Ho(∞-Gpd_C)` they
  induce, and the independence of homotopy invariants from the globular functor `R` (Layer 7).

**Shared material: owner, interface, consumer.**

| Material | Owner | Exact declaration or interface | Consumer |
| --- | --- | --- | --- |
| The globe category `𝔾` and globular sets | this roadmap, Layer 0.1 | `Globe`, `Globe.Hom`, `instance : Category Globe`, `Globe.σ`, `Globe.τ`, `GlobularPresheaf := Globeᵒᵖ ⥤ Type u` (`Suggested.lean`) | Layers 0–7 here; [HomotopyTheoryOfCategories](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1521), Layer 8.6, which proves `Globe` direct on this exact carrier |
| Globular sums and theories, coherators, their models, homotopy groups and weak equivalences of models, `Π_∞^R` | this roadmap, Layers 1–7 | the declarations of `Suggested.lean` (`CoglobularObject`, `Table`, `GlobularExtension`, `PseudoCoherator`, `IsGlobularPresheaf`, `InfinityGroupoid`, `piPresheaf`, `localizedFunctor`) and the items of Layers 2.4, 4 and 6 | this roadmap |
| Direct and inverse categories, Reedy structures, and the directness of `𝔾` | [HomotopyTheoryOfCategories](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1521), Layers 7–8, on Mathlib's [`HomotopicalAlgebra.ReedyStructure`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/AlgebraicTopology/Reedy/Basic.lean) | `IsDirect`, `IsInverse`, `IsDirect.rank` (Layer 7.1–7.2 there); `IsDirect Globe` with degree `n` (Layer 8.6 there) | not consumed here: no layer of this roadmap states a direct, inverse or Reedy property, and none is defined here |
| Homotopy groups of spaces, their functoriality, weak homotopy equivalences, Whitehead's theorem | [AlgebraicTopology](../AlgebraicTopology/README.md), implemented in Tau Ceti | `HomotopyGroup.map` (`TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean`); `ContinuousMap.IsWeakHomotopyEquivalence` with `comp`, `of_postcomp`, `of_precomp` (`TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean`); `TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean` | Layers 5.3–5.4 and 7.1 (`weTop` in `Suggested.lean` until the pin carries `IsWeakHomotopyEquivalence`) |
| Ordinary localization of a category at a class of morphisms | Mathlib | `MorphismProperty.Localization`, `MorphismProperty.Q`, `MorphismProperty.IsInvertedBy`, `Localization.lift` | Layer 7.1, which supplies `W_Top`, `W_C`, the proof that `Π_∞^R` inverts `W_Top`, and the induced functor, and no localization construction of its own |
| Simplicial sets, Kan complexes and their homotopy groups | Mathlib and Tau Ceti | `SSet`, `SSet.KanComplex`, `SSet.PtSimplex`; `TauCeti/AlgebraicTopology/SimplicialSet/KanComplex/HomotopyGroup.lean` | not consumed |
| Model categories, the Kan–Quillen and Serre model structures and realization ⊣ `Sing` | Mathlib (`HomotopicalAlgebra.ModelCategory`); [GeneralizedCohomology](../GeneralizedCohomology/README.md), G2 item 1 | as specified there | not consumed: no item here asks for a model or semi-model structure on `∞-Gpd_C` |
| Simplicially enriched categories, enriched diagrams, quasicategories and their categorical model | [BordismFormalGroups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/main/TauCetiRoadmap/BordismFormalGroups/README.md), F6.5 item 1 | as specified there | not consumed |

*Not in this roadmap:* strict ∞-groupoids, crossed complexes, Batanin–Leinster ∞-categories, and
the variant of Grothendieck ∞-categories.

The boundary in one sentence: if a statement is about globular sets, globular theories or their
models, it is here; if it is about direct or Reedy categories, it is HomotopyTheoryOfCategories';
if it is about spaces or simplicial sets alone, or about model structures, it is
AlgebraicTopology's, GeneralizedCohomology's or Mathlib's.

## What Mathlib and Tau Ceti already have (consume)

- **Categories.** Presheaf categories, Yoneda, pushouts and colimits in `Type` and in presheaf
  categories (`CategoryTheory.Limits`), `IsPushout`, `IsPullback`, transfinite compositions
  (`TransfiniteCompositionOfShape`), `MorphismProperty`, `MorphismProperty.Localization` and
  `Localization.lift`, `Functor.IsEquivalence`.
- **Spaces.** `TopCat`, pushouts in `TopCat`, the disks and spheres of Tau Ceti
  (`TauCeti/AlgebraicTopology/Sphere/`), Mathlib's `HomotopyGroup` (`π_ n X x`) with its group
  structure, Tau Ceti's functoriality and `ContinuousMap.IsWeakHomotopyEquivalence` with
  `comp`, `of_postcomp`, `of_precomp`, `HomotopyEquiv.isWeakHomotopyEquivalence`.
- Nothing about globular sets, globular theories or Grothendieck ∞-groupoids exists in Mathlib or
  Tau Ceti.

## Conventions (pinned)

- **Globular sets** are presheaves of types on the globe category `𝔾` (`Globe`), whose objects are the
  natural numbers and whose non-identity morphisms `m → n` (`m < n`) are the two sides
  `σ, τ`, composites of `σ_k, τ_k : k → k + 1` subject to the globular identities
  `σ_{k+1} σ_k = τ_{k+1} σ_k` and `σ_{k+1} τ_k = τ_{k+1} τ_k`. A morphism `m → n` is determined by
  its side; the composite of sides `ε` then `δ` is `ε`. `n`-cells are `X_n`, with source and target
  `s, t : X_{n+1} → X_n`.
- **Tables of dimensions** (Ara 2013, 1.3): finite sequences `(i₁, i'₁, i₂, …, i'_{m−1}, i_m)` with
  `i_k > i'_k < i_{k+1}`. The globular sum of a table in a category `K` with a coglobular object
  `D` is the iterated pushout `D_{i₁} ⊔_{D_{i'₁}} D_{i₂} ⊔ ⋯ ⊔_{D_{i'_{m−1}}} D_{i_m}`, glued by target
  on the left and source on the right. Its dimension is `max i_k`.
- **`Θ₀`** is the full subcategory of globular sets on the globular sums of the representable
  coglobular object `n ↦ 𝔾(−, n)`; its objects are indexed by tables.
- **Globular extension** (Ara 2013, 1.4): a category `C` under `𝔾` in which the globular sum of
  every table exists; a **globular functor** is a functor under `𝔾` preserving globular sums.
  Every globular extension receives a globular functor from `Θ₀` (Ara 2013, Proposition 1.6). This
  roadmap works with globular extensions whose objects are indexed by tables, the functor from
  `Θ₀` being the identity on objects: free globular extensions are of this kind (Ara 2013, 2.10),
  and Ara 2013, Remark 2.6, notes that this is the natural restriction.
- **Admissible pair** (Ara 2013, 2.3): parallel `f, g : D_n → S` with `S` a globular sum of
  dimension `≤ n + 1`. A **lifting** is `h : D_{n+1} → S` with `h σ_n = f`, `h τ_n = g`.
  **Contractible**: every admissible pair has a lifting. **Coherator** (Ara 2013, 2.11): free (has
  a defining cellular tower `Θ₀ = C₀ → C₁ → ⋯`, `C_{n+1} = C_n[A_n]`, `C = colim C_n`) and
  contractible.
- **∞-groupoids of type `C`** (Ara 2013, 1.8 and 2.5): presheaves of types on `C` sending
  globular sums to globular products (the canonical cones to limit cones). Their underlying globular set is the
  restriction along `𝔾 → Θ₀ → C`.
- **Weak equivalences of ∞-groupoids** (Ara 2013, 4.11 and 4.17): bijection on `π₀` and on
  `π_n(−, x)` for all `n ≥ 1` and every `0`-cell `x`, where `π_n(X, x)` is the set of `n`-cells from
  `1^n_x` to `1^n_x` modulo the relation of being joined by an `(n+1)`-cell (Ara 2013, 4.2), and
  `1_x` is the identity cell given by a structural map of the coherator.
- **Spaces**: `TopCat.{0}`; weak equivalences are Tau Ceti's `IsWeakHomotopyEquivalence`;
  `Hot := TopCat[W_Top⁻¹]`, `Ho(∞-Gpd_C) := ∞-Gpd_C[W_C⁻¹]`, both as Mathlib's
  `MorphismProperty.Localization`.
- **The fundamental ∞-groupoid** (Ara 2013, 5.2 and Examples 5.3, after Grothendieck): `TopCat`
  with the coglobular object of disks `D^n` (hemisphere inclusions as `σ, τ`) is a contractible
  globular extension (Ara 2013, Example 2.7.1); for a coherator `C`, a globular functor
  `R : C → TopCat` exists (Ara 2013, Proposition 2.14); `Π_∞^R(X)(S) := TopCat(R S, X)`. Every
  statement about `Π_∞` is made for an arbitrary such `R`.

## The build, in layers

### Layer 0: globular sets

**0.1** The globe category `𝔾` (objects `ℕ`, sides `σ, τ`; `Globe` with its `Category` instance,
the single carrier, which HomotopyTheoryOfCategories' Layer 8.6 proves direct), globular sets as
`𝔾ᵒᵖ ⥤ Type u` (`GlobularPresheaf`), with the equivalent explicit description (cells, source,
target, globular identities; `GlobularSet`) and its `Equivalence`. *Checks:* the globular set
with one cell in each dimension is terminal; the representable `𝔾(−, n)` has two `k`-cells for `k < n` and one `n`-cell.

**0.2** Parallel cells, the boundary `∂ x = (s x, t x)`, the relation `Joined n x y` (there is an
`(n+1)`-cell from `x` to `y`), the globular sphere `∂D_n` and the disk `D_n`.

### Layer 1: coglobular objects and globular sums

**1.1** Coglobular objects of a category `K`; the faces `D_m → D_n` of each side; maps of
coglobular objects. Examples: the representable one in globular sets; disks and hemisphere
inclusions in `TopCat`.

**1.2** Tables of dimensions; globular sums in `K` with pushouts, with their universal property
and functoriality in `(K, D)`. *Checks:* the globular sum of `(1, 0, 1)` in globular sets has
three `0`-cells and two `1`-cells; in `TopCat` every globular sum of disks is contractible
(Ara 2013, Example 2.7.1, with the general statement in Proposition 5.11).

**1.3** `Θ₀` and its morphisms; every globular sum in globular sets is a colimit of representables,
and maps out of it are determined by the images of its top cells.

### Layer 2: globular extensions and coherators

**2.1** Globular extensions (objects indexed by tables, a functor from `Θ₀`, globular sums
preserved), globular functors between them, and `Θ₀` itself as the initial one.

**2.2** Admissible pairs, liftings, contractibility. *Checks:* `Θ₀` is not contractible (the pair
`(1, 1) : D_0 → D_0` is admissible and has no lifting, since `D_0` has no `1`-cell); `TopCat` is
contractible (Ara 2013, Example 2.7.1).

**2.3** Free extensions `C[A]` along a set `A` of admissible pairs, with their universal
property, constructed by universally adjoining a lifting to each pair and closing under globular
sums (globular completion, Ara 2013, Proposition 1.11 and 1.12). *Source:* Ara 2013, 2.9.

**2.4** Cellular towers, free globular extensions, coherators (Ara 2013, 2.10–2.11); the canonical
coherator (every admissible pair at every stage), with the theorem that it is a coherator (Ara
2013, Examples 2.12). *Check:* in a coherator every pair `(1_{D_n}, 1_{D_n})` has a lifting, the identity cell.

**2.5** For a coherator `C` and a contractible globular extension `E`, a globular functor `C → E`
exists (Ara 2013, Proposition 2.14), by induction along the defining tower.

### Layer 3: ∞-groupoids of type `C`

**3.1** The category `∞-Gpd_C`, the underlying globular set, the forgetful functor to globular
sets and its left adjoint on globular sums (free models `y S`, disks `D_n := y(D_n)`,
`J_n : D_n → D_{n+1}` from `σ_n`).

**3.2** Structural operations from the coherator: identities `1_x`, compositions and inverses of
`n`-cells along `k`-cells, each chosen by a lifting (Ara 2013, §3, and the pregroupoidal
structures of 3.11), with their action on underlying cells.

### Layer 4: homotopy groups and weak equivalences

**4.1** The homotopy relation on `n`-cells (Ara 2013, 4.2, Lemma 4.3), the groupoids `ϖ_n(X)`
(Proposition 4.5), `π₀ X` and `π_n(X, x)` for `n ≥ 1` (4.11) with the group structure from the
composition operations; functoriality (4.8).

**4.2** Independence of choices: `ϖ_n(X)` does not depend on the pregroupoidal structure chosen in
3.2 (Ara 2013, Proposition 4.6), and `π_n(X, x)` does not depend on `x` within its component up to
isomorphism (Theorem 4.13, Corollaries 4.14–4.15). *Check:* for the terminal ∞-groupoid all `π_n`
are trivial.

**4.3** Weak equivalences (Ara 2013, 4.17); two-out-of-three; the equivalent characterizations of
Ara 2013, Theorem 4.18 (homotopy groups at every `(n−1)`-cell; `ϖ_1` an equivalence and
bijections on parallel pairs).

### Layer 5: the fundamental ∞-groupoid of a space

**5.1** The coglobular space of disks and the contractibility of its globular sums; `TopCat` as a
contractible globular extension; a globular functor `R : C → TopCat` for each coherator (2.5;
Ara 2013, Examples 5.3).

**5.2** `Π_∞^R : TopCat ⥤ ∞-Gpd_C`, `X ↦ TopCat(R(−), X)`; the sum condition holds because `R`
preserves globular sums and `TopCat(−, X)` sends colimits to limits.

**5.3** The comparison: `π₀(Π_∞^R X) ≅ π₀(X)` and `π_n(Π_∞^R X, x) ≅ π_n(X, x)` as groups, naturally
in `X` (Ara 2013, Theorem 8.7, proved through loop objects, Propositions 8.4–8.6; Ara works in a
model category whose objects are all fibrant, of which `TopCat` is the instance used here, with
the disks of Example 5.10).

**5.4** `Π_∞^R f` is a weak equivalence iff `f` is a weak homotopy equivalence (Ara 2013,
Corollaries 8.9–8.11).

### Layer 6: cellular ∞-groupoids

**6.1** Cellular ∞-groupoids: transfinite composites of pushouts of the boundary inclusions
`∂D_n → D_n` in `∞-Gpd_C`, starting from the initial object (Henry 2016, 5.3.2 and 5.3.4).

### Layer 7: localizations

**7.1** `W_Top` and `W_C` as `MorphismProperty`; `Π_∞^R` inverts `W_Top` (5.4), hence the induced
functor `Hot ⥤ Ho(∞-Gpd_C)` through Mathlib's `Localization.lift` (Ara 2013, 8.13). This item
supplies the two classes, the inversion and the functor; the localizations are Mathlib's.

**7.2** Independence of the homotopy invariants from `R`: for two globular functors
`R, R' : C → TopCat`, `Π_∞^R(X)` and `Π_∞^{R'}(X)` have the same underlying globular set and the
same groupoids `ϖ_n` for `n ≥ 1` (Ara 2013, 5.2 and Proposition 5.5), hence the same `π₀` and
isomorphic groups `π_n`, all of them those of `X` by 5.3, whatever the coherator (Corollary 8.8).
Consequently `Π_∞^R f` is a weak equivalence if and only if `Π_∞^{R'} f` is. The statement
compares invariants only: the identity of the underlying globular sets is not a morphism of
∞-groupoids (Ara 2013, Remark 5.6), and no morphism, zigzag or natural isomorphism between
`Π_∞^R` and `Π_∞^{R'}`, before or after localization, is asked for.

## Ordering

Layers 0–1 first; 2 needs 1; 3 needs 2; 4 needs 3; 5 needs 1, 2.5 and 4; 6 needs 3; 7 needs 4
and 5. Layers 5 and 6 are independent of each other.

## Research context: elementary expansions and the homotopy hypothesis

Nothing in this section is a target of this roadmap.

**The elementary expansion assertion.** For a coherator `C`, a cellular `X` (6.1), a map
`a : D_n → X` and a pushout square of `J_n : D_n → D_{n+1}` (3.1) along `a`, the map
`X → X ⊔_{D_n} D_{n+1}` is a weak equivalence (4.3). For finitely cellular `X` this is Henry's
Conjecture 5.3.3 (Henry 2016), extended to retracts of cellular objects by his Lemma 5.3.4; Henry
shows that it implies a canonical left semi-model structure on `∞-Gpd_C` (Theorem 5.3.5) and the
homotopy hypothesis (Corollary 5.3.13). Henry and Lanari (2023) treat Grothendieck
`3`-groupoids.

**The openai/math preprint.** Source pinned at openai/math commit
`7ef5c0cc5ca4b0e072b7a050fca09ab24bc6fa3a`: the preprint « The Grothendieck homotopy hypothesis via
elementary expansions » (24 September 2026, not peer-reviewed;
`preprints/The-Grothendieck-homotopy-hypothesis-via-elementary-expansions-September-24-2026/`),
its formalization scope note `lean/docs/312.md`, the comparator statement
`lean/ComparatorChallenges/GrothendieckElementaryExpansion.lean` with its `.json`, and the
development `lean/OAI/CategoryTheory/Globular/` (58 files, 12,753 lines, solution module
`OAI.CategoryTheory.Globular.Main`).

- *Claimed in the paper.* For every Grothendieck coherator in the convention of Ara 2013 (2.3,
  2.9–2.11) as fixed by Henry 2016 (5.3): the elementary expansion assertion for every cellular
  `X` (Theorem 1.1); the canonical left semi-model structure (Corollary 5.1, after Henry's
  Theorem 5.3.5); and, through Henry's cylinder-category comparison (Henry 2016, §§5.1 and 5.3),
  a Quillen equivalence `|−| ⊣ Π_∞` between models of `C` and spaces, hence the full homotopy
  hypothesis for these coherators (Corollary 5.2).
- *Formalized.* Only the elementary expansion theorem, `OAI.Grothendieck.elementary_expansion`,
  checked against the comparator statement with the axioms `propext`, `Quot.sound` and
  `Classical.choice`. The semi-model structure and the comparison with spaces are not formalized
  (`312.md`), and the Lean development defines neither `Π_∞` of a space nor any functor to or
  from `TopCat`.
- *Definition and hypothesis match with this roadmap.* Tables: `Table n` (`globe`, `attach`
  gluing a new disk by its source face to the target face of the previous last disk, `b < last`,
  `b < h`), the tables of Conventions. Globular theories: `GlobularTheory`, hom-types on
  `Shape := Σ n, Table n` with a functor from the realized tables (`Θ₀`) preserving each
  attaching pushout, the objects-indexed-by-tables form of 2.1. Admissible pairs: arity of height
  `≤ n + 1` and parallel maps, as 2.2. Coherators: `IsCoherator` is a cellular presentation (an
  initial stage, free extensions along families of admissible pairs indexed by a type, a
  sequential colimit) together with a filler for every admissible pair, as 2.4. Models:
  presheaves sending each attaching pushout to a pullback, as 3.1. `J_n`: the Yoneda image of the
  source inclusion, as 3.1. Weak equivalences: bijection on `0`-cells modulo `Joined 0` and on
  every `HomotopyGroup hC x n`, the `(n+1)`-cells from `1^n_x` to `1^n_x` modulo `Joined (n+1)`
  with identities chosen by `Classical.choose`, which is Ara's `π_{n+1}(X, x)` as a set (4.1,
  4.3). Cellular: a well-ordered transfinite composition from an initial model whose successor
  steps attach families of cells along their boundaries, as 6.1. Universes: theories and models
  in `Type v`, tables realized in `Type 0` globular presheaves. The Quillen equivalence of
  Corollary 5.2 is stated for Henry's fundamental ∞-groupoid functor; the paper does not
  identify it with `Π_∞^R` of Layer 5.

Admitting the elementary expansion theorem as a target here is a theorem import, made by a
reviewed revision of this roadmap that checks the match above at a pinned revision and states the
theorem as an item of Layer 6. The semi-model structure and the comparison with spaces rest on
Henry 2016 and on the paper's unformalized arguments, and are not targets of this roadmap.

## Porting guidance for the openai/math formalization

The openai/math repository (Apache License 2.0, `lean/LICENSE`) contains, at the revision pinned
above, `lean/OAI/CategoryTheory/Globular/`: globular sets, tables, globular theories indexed by
tables, admissible pairs, free extensions, cellular presentations, coherators, models, the
homotopy groups of models and weak equivalences, cutoff models, and the elementary expansion
theorem. It does not define `Π_∞` of a space and does not state the comparison with spaces. Its
conventions match Ara 2013 (admissible pairs with arity of height `≤ n + 1`; coherator = cellular
presentation and contractibility).

The Apache licence permits copying and adaptation with attribution and the licence notice.
Following the README's porting rules, contact the authors and discuss the plan on Zulip before
porting, treat the files as a cited source and not as the specification, and keep a file-by-file
map only in a provenance note.

## References

All checked on zbMATH or arXiv.

- A. Grothendieck, *Pursuing Stacks (À la poursuite des champs)*, vol. I, ed. G. Maltsiniotis,
  Documents Mathématiques 20, SMF, 2022. Zbl 1499.14001.
- G. Maltsiniotis, *La théorie de l'homotopie de Grothendieck*, Astérisque 301 (2005).
  Zbl 1104.18005.
- G. Maltsiniotis, « Grothendieck ∞-groupoids, and still another definition of ∞-categories »,
  arXiv:1009.2331 (2010).
- D. Ara, « On the homotopy theory of Grothendieck ∞-groupoids », *J. Pure Appl. Algebra* 217
  (2013), no. 7, 1237–1278. Zbl 1291.18006; arXiv:1206.2941.
- S. Henry, « Algebraic models of homotopy types and the homotopy hypothesis », arXiv:1609.04622
  (2016), preprint.
- S. Henry and E. Lanari, « On the homotopy hypothesis for 3-groupoids », *Theory Appl. Categ.*
  39 (2023), no. 26, 735–768. Zbl 1533.18017.
- C. Simpson, « Homotopy types of strict 3-groupoids », arXiv:math/9810059 (1998), preprint
  (strict models fail from dimension `3`; context for the scope).
- OpenAI, « The Grothendieck homotopy hypothesis via elementary expansions », preprint,
  24 September 2026, github.com/openai/math, commit `7ef5c0cc5ca4b0e072b7a050fca09ab24bc6fa3a`;
  formalization scope `lean/docs/312.md`; Lean companion `lean/OAI/CategoryTheory/Globular/`
  (Apache 2.0).

## Provenance

The 1975 letter to Breen in Grothendieck's notes (Montpellier fonds, folder 134-2, pp. 42–45)
sets out the fundamental `n`-groupoid of a Kan complex and the comparison of homotopy groups that
Layer 5 specifies in Ara's form.
