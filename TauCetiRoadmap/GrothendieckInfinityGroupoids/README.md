# Roadmap: Grothendieck ∞-groupoids and the homotopy hypothesis

**Summary.** Build Grothendieck's globular ∞-groupoids in the form Maltsiniotis and Ara gave to
the definition of *Pursuing Stacks*: globular sets, tables of dimensions and globular sums, the
category `Θ₀`, globular extensions, admissible pairs, contractibility, free extensions along
admissible pairs, cellular towers and coherators; the category `∞-Gpd_C` of ∞-groupoids of type
`C` (globular presheaves on `C` sending globular sums to globular products); their homotopy groups
and weak equivalences; the fundamental ∞-groupoid `Π_∞(X)` of a topological space, with the
canonical isomorphisms `π_n(Π_∞ X, x) ≅ π_n(X, x)`, so that `Π_∞` preserves and reflects weak
equivalences; and the induced functor `Π_∞ : Hot → Ho(∞-Gpd_C)` between localizations. The
homotopy hypothesis for Grothendieck ∞-groupoids, that this functor is an equivalence for every
coherator `C` (Ara 2013, Conjecture 8.14), is stated as a `def … : Prop`. The elementary
expansion theorem (pushouts along the disk inclusions `D_n → D_{n+1}` are weak equivalences
between cellular ∞-groupoids) is a proved target of Layer 6. Deriving the homotopy hypothesis
from it is recorded at the end as a roadmap for a roadmap: a refereed reduction exists only for
Grothendieck `n`-groupoids with `n < ∞`, conditional on a semi-model structure (Henry–Lanari 2023).

The « yoga » first appears in Grothendieck's notes in a 1975 letter to Breen (Montpellier fonds,
folder 134-2, p. 42: an `n`-groupoid up to `n`-equivalence is « essentially the same thing » as
a homotopy `n`-type); the statement specified here is the refereed one of Ara 2013, after
*Pursuing Stacks* (ed. Maltsiniotis, 2022) and Maltsiniotis 2010.

Suggested home: `TauCeti/AlgebraicTopology/GlobularGroupoid/` (globular sets, theories, models,
homotopy groups) and `TauCeti/AlgebraicTopology/GlobularGroupoid/Topological/` (`Π_∞` and the
comparison).

## Scope and ownership

**In scope.** This roadmap owns:

- globular sets and the globe category `𝔾`, coglobular objects of a category and their
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
- cellular ∞-groupoids and the elementary expansion theorem (Layer 6);
- the localizations and the statement of the homotopy hypothesis (Layer 7).

**Out of scope, with owner.**

- *Homotopy groups of spaces, their functoriality, weak homotopy equivalences, Whitehead's
  theorem*: [AlgebraicTopology](../AlgebraicTopology/README.md), implemented in Tau Ceti
  (`ContinuousMap.IsWeakHomotopyEquivalence`, `TauCeti/Topology/Homotopy/HomotopyGroup/`,
  `TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean`). Consumed.
- *Simplicial sets, Kan complexes and their homotopy groups*: Mathlib
  (`SSet`, `SSet.KanComplex`, `SSet.PtSimplex`) and Tau Ceti
  (`TauCeti/AlgebraicTopology/SimplicialSet/KanComplex/HomotopyGroup.lean`). Not consumed except
  as an alternative model of homotopy types named in the last section.
- *Strict ∞-groupoids, crossed complexes, Batanin–Leinster ∞-categories, and the variant of
  Grothendieck ∞-categories*: not in this roadmap.
- *Model category structures*: Mathlib's `HomotopicalAlgebra.ModelCategory` is not needed; the
  localizations of Layer 7 are Mathlib's `MorphismProperty.Localization`.

The boundary in one sentence: if a statement is about globular sets, globular theories or their
models, it is here; if it is about spaces or simplicial sets alone, it is AlgebraicTopology's or
Mathlib's.

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

- **Globular sets** are presheaves of types on the globe category `𝔾`, whose objects are the
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

**0.1** The globe category `𝔾` (objects `ℕ`, sides `σ, τ`), globular sets as `𝔾ᵒᵖ ⥤ Type u`, with
the equivalent explicit description (cells, source, target, globular identities) and its
`Equivalence`. *Checks:* the globular set with one cell in each dimension is terminal; the
representable `𝔾(−, n)` has two `k`-cells for `k < n` and one `n`-cell.

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

### Layer 6: cellular ∞-groupoids and elementary expansions

**6.1** Cellular ∞-groupoids: transfinite composites of pushouts of the boundary inclusions
`∂D_n → D_n` in `∞-Gpd_C`, starting from the initial object.

**6.2** The elementary expansion theorem: for a coherator `C`, a cellular `X`, a map
`a : D_n → X` and a pushout square of `J_n : D_n → D_{n+1}` along `a`, the map `X → X ⊔_{D_n}
D_{n+1}` is a weak equivalence. This is Henry's pushout conjecture (Henry 2016, preprint). Its
Lean proof in the openai/math repository (see Provenance) is a cited source; the roadmap
specifies the statement, and an implementation may port that proof only on the terms of the
Porting guidance below.

### Layer 7: localizations and the homotopy hypothesis

**7.1** `W_Top` and `W_C` as `MorphismProperty`; `Π_∞^R` inverts `W_Top` (5.4), hence the induced
functor `Hot ⥤ Ho(∞-Gpd_C)` through `Localization.lift`.

**7.2** The weak-equivalence class of `Π_∞^R(X)` does not depend on `R`: the homotopy groups of
`Π_∞(X)` depend only on `X` (Ara 2013, Corollary 8.8, and Remark 5.6 on the dependence on `R`);
state that the induced functors for two choices of `R` are naturally isomorphic after
localization.

**7.3** `def HomotopyHypothesis (C : Coherator) : Prop` — the induced functor
`Hot ⥤ Ho(∞-Gpd_C)` is an equivalence of categories (Ara 2013, Conjecture 8.14). Proved
consequences, each an implication from `HomotopyHypothesis C`: `Ho(∞-Gpd_C)` and `Ho(∞-Gpd_{C'})`
are equivalent for two coherators (Ara 2013, Remark 2.13); every ∞-groupoid of type `C` is weakly
equivalent to some `Π_∞^R X`.

## Ordering

Layers 0–1 first; 2 needs 1; 3 needs 2; 4 needs 3; 5 needs 1, 2.5 and 4; 6 needs 4; 7 needs 5.
Layers 5 and 6 are independent of each other.

## Porting guidance for the openai/math formalization

The openai/math repository (Apache License 2.0, `lean/LICENSE`) contains
`lean/OAI/CategoryTheory/Globular/` (58 files, about 12,750 lines): globular sets, tables,
globular theories indexed by tables, admissible pairs, free extensions, cellular presentations,
coherators, models, the homotopy groups of models and weak equivalences, cutoff models, and the
elementary expansion theorem `OAI.Grothendieck.elementary_expansion`. It does not define `Π_∞` of
a space and does not state the comparison with spaces. Its conventions match Ara 2013 (admissible
pairs with arity of height `≤ n + 1`; coherator = cellular presentation and contractibility).

The Apache licence permits copying and adaptation with attribution and the licence notice.
Following the README's porting rules, contact the authors and discuss the plan on Zulip before
porting, treat the files as a cited source and not as the specification, and keep a file-by-file
map only in a provenance note.

## Roadmap for a roadmap: proving the homotopy hypothesis

**Do not implement this section.** Henry (2016, preprint) reduces the homotopy hypothesis for a
coherator to the pushout conjecture of Layer 6.2; an OpenAI preprint (24 September 2026, not
peer-reviewed) announces the pushout conjecture for every coherator, with the Lean proof cited
above. For finite `n` a reduction is refereed: Henry and Lanari (2023) prove that if the
canonical left semi-model structure on Grothendieck `n`-groupoids exists (weak equivalences the
maps inducing bijections on homotopy groups), it satisfies the homotopy hypothesis, its
`(∞,1)`-category being that of homotopy `n`-types; their corollary for `n = 3` rests on the
existence of that structure, proved in a preprint. Once a refereed account of the reduction for
`n = ∞` exists, a successor roadmap would specify: the
model structure on `∞-Gpd_C` transferred along `Π_∞`'s left adjoint (Henry's construction), the
comparison with Kan complexes, and the proof of `HomotopyHypothesis C`. Until then
`HomotopyHypothesis C` is open in this library and appears only as a hypothesis.

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
  24 September 2026, github.com/openai/math; Lean companion
  `lean/OAI/CategoryTheory/Globular/` (Apache 2.0).

## Provenance

The 1975 letter to Breen in Grothendieck's notes (Montpellier fonds, folder 134-2, pp. 42–45)
sets out the fundamental `n`-groupoid of a Kan complex and the comparison of homotopy groups that
Layer 5 specifies in Ara's form.
