# Roadmap: Grothendieck ∞-groupoids: globular theories, coherators and their models

**Summary.** Build Grothendieck's globular ∞-groupoids in the form Maltsiniotis and Ara gave to
the definition of *Pursuing Stacks*: the globe category `𝔾` and globular sets, tables of
dimensions and globular sums, the category `Θ₀`, globular extensions, admissible pairs,
contractibility, free extensions along admissible pairs, cellular towers and coherators; the
category `∞-Gpd_C` of ∞-groupoids of type `C` (presheaves on `C` sending globular sums to
globular products); their homotopy groups and weak equivalences (Ara 2013, 4.11, 4.17 and
Theorem 4.18); the fundamental ∞-groupoid `Π_∞^R(X)` of a topological space, with the canonical
isomorphisms `π_n(Π_∞^R X, x) ≅ π_n(X, x)` (Ara 2013, Theorem 8.7), so that `Π_∞^R` preserves and
reflects weak equivalences (Corollaries 8.9–8.11); cellular ∞-groupoids; and the functor
`Hot ⥤ Ho(∞-Gpd_C)` induced between the localizations (Ara 2013, 8.13), with the independence of
its homotopy invariants from the globular functor `R` (Proposition 5.5, Corollary 8.8).

**Research motivation.** These objects were introduced to model homotopy types: Grothendieck's
homotopy hypothesis asks whether the functor `Hot → Ho(∞-Gpd_C)` is an equivalence of categories
for every coherator `C` (Ara 2013, Conjecture 8.14). That question motivates the subject and is
not a target of this roadmap; no item states it or depends on it. The section *Research context*
records the recent work on it and separates what is claimed from what is formalized.

The « yoga » already appears in the P.S. of Grothendieck's letter to Lawrence Breen of
5 February 1975: « une (petite) `n`-catégorie (en groupoïdes) à `n`-équivalence près « est
essentiellement la même chose » qu'un ensemble semi-simplicial pris à homotopie près et où on
néglige les `π_i` pour `i ≥ n+1` » (Montpellier, cote 134-2, pp. 42–43; the author's pp. 27–28).
The letter is unpublished; it is quoted from a transcription of the manuscript. The definitions
specified here are the refereed ones of Ara 2013, after *Pursuing Stacks* (ed. Maltsiniotis,
2022) and Maltsiniotis 2010.

Suggested home: `TauCeti/AlgebraicTopology/GlobularGroupoid/` (globular sets, theories, models,
homotopy groups) and `TauCeti/AlgebraicTopology/GlobularGroupoid/Topological/` (`Π_∞` and the
comparison).

## Scope and ownership

**In scope.** This roadmap owns:

- the globe category `𝔾` and globular sets, coglobular objects of a category and their
  globular sums, including the coglobular space of disks and hemisphere inclusions (Layers 0
  and 1);
- tables of dimensions, globular sums, the category `Θ₀`, globular extensions, admissible pairs,
  liftings, contractibility, free extensions `C[A]`, cellular towers and coherators, with the
  canonical coherator as the example that exists (Layer 2);
- ∞-groupoids of type `C`, their underlying globular sets, free models and disks, and their
  structural operations (Layer 3);
- the homotopy theory of ∞-groupoids of type `C`: the homotopy relation, `π₀`, the groups `π_n`,
  their independence of choices, and weak equivalences (Layer 4);
- the fundamental ∞-groupoid of a topological space and its comparison with homotopy groups of
  spaces (Layer 5);
- cellular ∞-groupoids (Layer 6);
- the weak-equivalence classes as `MorphismProperty`, the functor `Hot ⥤ Ho(∞-Gpd_C)` they
  induce, and the independence of homotopy invariants from the globular functor `R` (Layer 7).

**Not in this roadmap:** strict ∞-groupoids, crossed complexes, Batanin–Leinster ∞-categories,
the variant of Grothendieck ∞-categories; Grothendieck's test categories and basic localizers
(Cisinski 2006, Définitions 3.3.2 and 4.1.12; Maltsiniotis 2005); direct, inverse and Reedy
categories (HomotopyTheoryOfCategories, Layers 7–8); model structures (Mathlib's
`HomotopicalAlgebra.ModelCategory`; GeneralizedCohomology, G2); weak homotopy equivalences of
spaces as a notion (StableHomotopyKTheory, §2.1).

The boundary in one sentence: if a statement is about globular sets, globular theories or their
models, it is here; if it is about direct or Reedy categories, it is HomotopyTheoryOfCategories';
if it is about spaces alone, it is StableHomotopyKTheory's, AlgebraicTopology's or Mathlib's; if
it is about model structures, it is GeneralizedCohomology's or Mathlib's.

## Conventions (pinned)

- **Globular sets** are presheaves of types on the globe category `𝔾` (`Globe`), whose objects
  are the natural numbers and whose non-identity morphisms `m → n` (`m < n`) are the two sides
  `σ, τ`, composites of `σ_k, τ_k : k → k + 1` subject to the globular identities
  `σ_{k+1} σ_k = τ_{k+1} σ_k` and `σ_{k+1} τ_k = τ_{k+1} τ_k` (Ara 2013, 1.1). A morphism
  `m → n` is determined by its side; the composite of sides `ε` then `δ` is `ε`. `n`-cells are
  `X_n`, with source and target `s, t : X_{n+1} → X_n` (Ara 2013, 1.2).
- **Tables of dimensions** (Ara 2013, 1.3): finite sequences `(i₁, i'₁, i₂, …, i'_{m−1}, i_m)`
  with `i_k > i'_k < i_{k+1}`. The globular sum of a table in a category `K` with a coglobular
  object `D` is the iterated pushout `D_{i₁} ⊔_{D_{i'₁}} D_{i₂} ⊔ ⋯ ⊔_{D_{i'_{m−1}}} D_{i_m}` of
  Ara's 1.3: at the `k`-th gluing, `D_{i'_k}` maps to the left disk `D_{i_k}` by its source face
  `σ` and to the right disk `D_{i_{k+1}}` by its target face `τ` (`CoglobularObject.Compatible`).
  Its dimension is `max i_k` (`Table.dim`). The sum of the one-disk table `(n)` is `D_n`
  (`GlobularExtension.ofTable_globe`).
- **`Θ₀`** is the full subcategory of globular sets on the globular sums of the representable
  coglobular object `n ↦ 𝔾(−, n)`, one for each table (Ara 2013, Examples 1.5.4).
- **Globular extension** (Ara 2013, 1.4): a category with a functor from `𝔾` (here a
  `CoglobularObject`) in which the globular sum of every table exists. The prototype records a
  chosen globular sum for every table (`GlobularSums`), which is the same as a lifting of the
  functor along `𝔾 → Θ₀` (Ara 2013, Remark 1.7). No condition is put on the objects: `TopCat`
  with its disks is a globular extension, and Layers 2.2, 5.1 and 7.2 use it as one. Ara
  considers restricting ∞-groupoids to globular extensions whose objects are in bijection with the
  tables and chooses not to, for technical reasons, citing Proposition 5.5, where `∞-Gpd_M` is
  used for a cocomplete `M` such as `TopCat` (Ara 2013, Remark 2.6); this roadmap makes the same
  choice. A **globular functor** `R` from a globular extension `C` to a category `K` with a
  coglobular object `D` is a functor compatible with the coglobular objects and preserving globular
  sums (Ara 2013, 1.4): `R` sends the disks and faces of `C` to those of `D`, and the image of each
  globular sum of `C` is a globular sum in `K` (`IsGlobularFunctor`).
- **Admissible pair** (Ara 2013, 2.3): parallel `f, g : D_n → S` with `S` a globular sum of
  dimension `≤ n + 1`. A **lifting** is `h : D_{n+1} → S` with `h σ_n = f`, `h τ_n = g` (2.1).
  **Contractible** (2.4): every admissible pair has a lifting; a contractible globular extension
  is called a pseudo-coherator by Maltsiniotis (2010), as Ara recalls in 2.4. **Coherator**
  (2.11): free (a defining cellular tower `Θ₀ = C₀ → C₁ → ⋯`, `C_{n+1} = C_n[A_n]`,
  `C = colim C_n`, 2.10) and contractible.
- **∞-groupoids of type `C`** (Ara 2013, 1.8 and 2.5): presheaves of types on a contractible
  globular extension `C` sending globular sums to globular products (the canonical maps
  `X(D_{i₁} ⊔ ⋯ ⊔ D_{i_m}) → X_{i₁} ×_{X_{i'₁}} ⋯ ×_{X_{i'_{m−1}}} X_{i_m}` are bijections). Their
  underlying globular set is the restriction along `𝔾 → C`.
- **Homotopy groups** (Ara 2013, 4.2 and 4.11): `u ∼_n v` when some `(n+1)`-cell goes from the
  `n`-cell `u` to `v`; `π₀(X) = X₀/∼₀`; for `n ≥ 1` and an `(n−1)`-cell `u`, `π_n(X, u)` is the
  set of `n`-cells from `u` to `u` modulo `∼_n`; for a `0`-cell `x`,
  `π_n(X, x) = π_n(X, 1^{n−1}_x)`, where `1^{n−1}_x` is the `(n−1)`-fold identity of `x` (Ara's
  `k⁰_{n−1}(x)`; `1^0_x = x`) given by a structural map of `C`
  (`PseudoCoherator.iteratedIdentity`).
- **Weak equivalences of ∞-groupoids** (Ara 2013, 4.17): bijection on `π₀` and on `π_n(−, x)` for
  all `n ≥ 1` and every `0`-cell `x` (`PseudoCoherator.IsWeakEquivalence`).
- **Spaces**: `TopCat.{0}`; weak equivalences are StableHomotopyKTheory's
  `IsWeakHomotopyEquivalence` (§2.1: bijective on path components and on every positive `π_n` at
  every basepoint; `weTop` in `Suggested.lean` has its body); `Hot := TopCat[W_Top⁻¹]`, the
  identification Cisinski 2006 makes in the Introduction, p. xiii, note 2, and
  `Ho(∞-Gpd_C) := ∞-Gpd_C[W_C⁻¹]`, both as Mathlib's `MorphismProperty.Localization`.
- **The fundamental ∞-groupoid** (Ara 2013, 5.2 and Examples 5.3): `TopCat` with the coglobular
  space `stdDisks` of disks `D^n = TopCat.disk n` and hemisphere inclusions
  `σ_n(x) = (x, √(1 − ‖x‖²))`, `τ_n(x) = (x, −√(1 − ‖x‖²))` (`hemisphere n false`,
  `hemisphere n true`; Ara 2013, Examples 1.5.2) is a contractible globular extension (Examples
  2.7.1); for a coherator `C`, which is free, a globular functor `R : C → TopCat` into `stdDisks`
  exists (Proposition 2.14); `Π_∞^R(X)(S) := TopCat(R S, X)` (`piPresheaf`). Every statement about
  `Π_∞` is made for an arbitrary such `R`.

## Exact supplier contracts

### From Mathlib

| Use here | Exact declarations |
| --- | --- |
| presheaves and limits | `yoneda`, `Functor.whiskeringLeft`, `ObjectProperty.FullSubcategory`, `HasPushouts`, `IsPushout`, `eqToHom`, `TransfiniteCompositionOfShape`, `Functor.IsEquivalence` |
| localization | `MorphismProperty`, `MorphismProperty.Localization`, `MorphismProperty.Q`, `MorphismProperty.IsInvertedBy`, `Localization.lift` |
| spaces | `TopCat`, `TopCat.disk`, `TopCat.diskBoundary`, `TopCat.diskBoundaryInclusion`, `TopCat.ofHom`, `ContractibleSpace`, `Joined`, `Path.map`, `ZerothHomotopy`, `ZerothHomotopy.mk`, `ZerothHomotopy.lift`, `ZerothHomotopy.sound`, `HomotopyGroup` |
| the hemisphere inclusions (Layer 1.1) | `EuclideanSpace`, `WithLp.toLp`, `Fin.snoc`, `Real.sqrt`, `Metric.closedBall`, `mem_closedBall_zero_iff`, `ULift.map`, `continuous_uliftMap`, `Continuous.subtype_mk`, `continuous_subtype_val` |

Layer 1.1 constructs the hemisphere inclusions `D^n → D^{n+1}` on Mathlib's `TopCat.disk`
(`hemisphere`, `stdDisks`).

### From Tau Ceti

| Use here | Exact declarations |
| --- | --- |
| functoriality of `π_n` (Layers 5.3, 5.4) | `HomotopyGroup.map` (`TauCeti/Topology/Homotopy/HomotopyGroup/Map.lean`) |
| the disks are contractible (Layer 5.1) | `TauCeti.TopCat.contractibleSpace_disk` (`TauCeti/AlgebraicTopology/Disk.lean`) |
| closed hemispheres are disks (Layer 1.1) | `TauCeti.hemisphereHomeomorph` (`TauCeti/Analysis/InnerProductSpace/Hemisphere.lean`) |

### From StableHomotopyKTheory

| Use here | Exact declarations |
| --- | --- |
| weak homotopy equivalences `W_Top` (Layers 5.4, 7.1) | §2.1: `IsWeakHomotopyEquivalence`, `IsWeakHomotopyEquivalence.comp`, `ContinuousMap.HomotopyEquiv.isWeakHomotopyEquivalence` |

`weTop` in `Suggested.lean` is `IsWeakHomotopyEquivalence` applied to `f.hom`, with the same body.

## How to read the build

`README.md` is normative; `Suggested.lean` gives acceptance tests for the items its docstrings
name. Each item gives its contract, its checks and its source in Ara 2013 (or Henry 2016 for
Layer 6); *Needs* names the declarations the item consumes, each with the item, library or
roadmap that supplies it. Each layer ends with Examples and its Dependencies.

**Lean prototypes.** `Suggested.lean` builds the coglobular space of disks (`stdDisks`, 1.1) and
states Theorem 4.18 (1) ⇔ (2) (`PseudoCoherator.isWeakEquivalence_iff`), the existence of
globular sums (`GlobularSums.nonempty_of_hasPushouts`) and Corollaries 8.9–8.11 in `TopCat`
(`piPresheaf_isWeakEquivalence_iff`, 5.4). Ara's Theorem 8.7 (5.3) is not stated there, since it
compares groups whose structure comes from the operations of 3.2, and neither are Proposition 5.5
and Corollary 8.8 (7.2), which compare the groupoids `ϖ_n` and groups `π_n` of 4.1 and 4.2. Their
statements are fixed by the items below.

## Layer 0: globular sets

### 0.1 The globe category and globular sets

The globe category `𝔾` (`Globe` with its `Category` instance and `Globe.σ`, `Globe.τ`,
the single carrier, which HomotopyTheoryOfCategories' Layer 8.6 proves direct), globular sets as
`𝔾ᵒᵖ ⥤ Type u` (`GlobularPresheaf`), with the equivalent explicit description (cells, source,
target, globular identities; `GlobularSet`) and its `Equivalence`. *Source:* Ara 2013, 1.1–1.2.
*Needs:* Mathlib `Category`, `Functor`, `Equivalence`. *Checks:*
- `𝔾` has two morphisms `m → n` for `m < n`, one for `m = n` and none for `m > n`;
- the globular set with one cell in each dimension is terminal;
- the representable `𝔾(−, n)` has two `k`-cells for `k < n`, one `n`-cell and no cell above `n`.

### 0.2 Spheres, disks and joined cells

Parallel cells, the boundary `∂ x = (s x, t x)`, the relation `GlobularSet.Joined n x y`
(there is an `(n+1)`-cell from `x` to `y`), the globular sphere `∂D_n` (the representable
`𝔾(−, n)` without its top cell) and the disk `D_n = 𝔾(−, n)`. *Needs:* `Globe`,
`GlobularPresheaf` and `GlobularSet` (0.1). *Checks:*
- `∂D_0` is the initial (empty) globular set, and `∂D_1` has two `0`-cells and no other cell;
- in `D_n`, `n ≥ 1`, the two `(n−1)`-cells are joined by the top cell; in `∂D_1` the two `0`-cells
  are not joined, since it has no `1`-cell;
- `∂D_{n+1}` is the pushout of two copies of `D_n` along `∂D_n` (Ara 2013, Example 2.2, there
  in `Top`).

### Examples

- `𝔾` has exactly two morphisms `0 → 2`, `σ_1 σ_0 = τ_1 σ_0` and `σ_1 τ_0 = τ_1 τ_0`, so `D_2` has
  two `0`-cells, two `1`-cells and one `2`-cell (0.1, Checks).
- If `α` is a `2`-cell from `u` to `v`, the `1`-cells `u` and `v` have the same source and the
  same target: the globular identities `s s = s t` and `t s = t t` (Ara 2013, 1.2).
- `∂D_1` has two `0`-cells and no `1`-cell, and in `D_1` they are joined by the top cell (0.2,
  Checks).

### Dependencies

Mathlib only: presheaves of types on `𝔾` and `Equivalence` (0.1); 0.2 uses 0.1. Nothing is
consumed from Tau Ceti or from another roadmap.

## Layer 1: coglobular objects and globular sums

### 1.1 Coglobular objects and the coglobular space of disks

Coglobular objects of a category `K` (`CoglobularObject`); the faces `D_m → D_n` of each
side (`CoglobularObject.faceTo`); maps of coglobular objects. The representable coglobular object
`n ↦ 𝔾(−, n)` in globular sets, and the coglobular space of disks in `TopCat` (`stdDisks`):
`D^n` the closed unit ball of `ℝ^n` (`TopCat.disk n`), and `σ_n(x) = (x, √(1 − ‖x‖²))` and
`τ_n(x) = (x, −√(1 − ‖x‖²))` (`hemiPoint`, `hemisphere n false`, `hemisphere n true`) the
inclusions of the two hemispheres of `D^{n+1}` (Ara 2013, Examples 1.5.2), with their norm
(`norm_hemiPoint`), continuity (`continuous_hemiPoint`) and coglobular identities
(`hemiPoint_eq_of_norm_eq_one`, `hemiPoint_hemiPoint`, `hemisphere_hemisphere`). *Needs:*
`Globe` and `GlobularPresheaf` (0.1); Mathlib `TopCat.disk`, `TopCat.ofHom`, `EuclideanSpace`,
`Real.sqrt`, `Metric.closedBall`; Tau Ceti `TauCeti.hemisphereHomeomorph`. *Checks:*
- `σ_0, τ_0 : D^0 → D^1 = [−1, 1]` are the points `1` and `−1`, and `σ_1 σ_0` and `τ_1 σ_0` both
  send the point of `D^0` to `(1, 0)` in `D^2`, an instance of the coglobular identities;
- the images of `σ_n` and `τ_n` cover the boundary sphere of `D^{n+1}` and meet in its equator,
  which is the boundary of each closed hemisphere;
- the source face `D_0 → D_2` of any coglobular object is `σ_1 σ_0`, equal to `τ_1 σ_0`, and its
  target face is `σ_1 τ_0 = τ_1 τ_0`: a face is fixed by the side of its first step.

### 1.2 Tables of dimensions and globular sums

Tables of dimensions (`Table`, `Table.globe`, `Table.dim`); globular sums in `K` with
pushouts, with their universal property and functoriality in `(K, D)`; existence of all
globular sums in a category with pushouts (`GlobularSums.nonempty_of_hasPushouts`; Ara 2013,
Examples 1.5.1). *Needs:* `CoglobularObject` and `CoglobularObject.faceTo` (1.1); Mathlib
`HasPushouts`, `IsPushout`. *Checks:*
- in the globular sum of `(1, 0, 1)` in globular sets, with `u` the `1`-cell of the first disk and
  `v` that of the second, the source of `u` is the target of `v` and the target of `u` and the
  source of `v` are distinct, so the sum has three `0`-cells and two `1`-cells and is the
  composable pair `v` then `u` (Ara 2013, 1.3); the sum of `(2, 1, 2)` has two `0`-cells, three
  `1`-cells and two `2`-cells;
- the table `(2, 0, 1)` has dimension `2`, and the globular sum of the one-disk table `(n)` is
  `D_n`;
- in `TopCat` every globular sum of disks is contractible (Ara 2013, Examples 2.7.1; the general
  statement is Proposition 5.11).

### 1.3 The category `Θ₀`

`Θ₀` and its morphisms; every globular sum in globular sets is a colimit of
representables, and maps out of it are determined by the images of its top cells. *Source:* Ara
2013, Examples 1.5.4 and 1.9.1. *Needs:* `Table` and `GlobularSums` (1.2); Mathlib `yoneda`.
*Checks:*
- the maps `D_m → D_n` in `Θ₀` are the morphisms `m → n` of `𝔾` (Yoneda);
- the maps `D_0 → S` into a globular sum are its `0`-cells, and there is no map `D_1 → D_0`;
- the restriction of globular presheaves on `Θ₀` to `𝔾` is an equivalence onto globular sets
  (Ara 2013, Examples 1.9.1).

### Examples

- The globular sum of `(1, 0, 1)` in globular sets has three `0`-cells and two `1`-cells, and the
  table `(2, 0, 1)` has dimension `2` (1.2, Checks).
- The coglobular space of disks is faithful as a functor `𝔾 → TopCat`: the images of `σ^n_m` and
  `τ^n_m` differ for `m < n` (Ara 2013, Examples 1.5.2).
- In `TopCat`, `D^n ⊔_{∂D^n} D^n` is the boundary sphere `∂D^{n+1}` (Ara 2013, Example 2.2), the
  topological form of the last Check of 0.2.

### Dependencies

Layer 0; Mathlib `HasPushouts`, `IsPushout` and `TopCat.disk` (1.1, 1.2); Tau Ceti
`TauCeti.hemisphereHomeomorph` (1.1). Within the layer, 1.2 uses 1.1 and 1.3 uses 1.2.

## Layer 2: globular extensions and coherators

### 2.1 Globular extensions and globular functors

Globular extensions (`GlobularExtension`: a category, a coglobular object, chosen globular
sums `GlobularSums`), globular functors (`IsGlobularFunctor`), and `Θ₀` as the initial globular
extension up to unique isomorphism (Ara 2013, 1.4, Proposition 1.6). *Needs:* `CoglobularObject`
and `stdDisks` (1.1), `GlobularSums` and `GlobularSums.nonempty_of_hasPushouts` (1.2), `Θ₀`
(1.3). *Checks:*
- `TopCat` with the coglobular space of disks is a globular extension, since `TopCat` has
  pushouts (Ara 2013, Examples 1.5.1–1.5.2);
- globular sets with the representable coglobular object, and `Θ₀`, are globular extensions
  (Examples 1.5.3–1.5.4);
- a globular extension receives a globular functor from `Θ₀`, unique up to a unique natural
  isomorphism (Proposition 1.6).

### 2.2 Admissible pairs and contractibility

Admissible pairs (`GlobularExtension.AdmissiblePair`), liftings (`IsLifting`),
contractibility (`IsContractible`), pseudo-coherators (`PseudoCoherator`). *Source:* Ara 2013,
2.1–2.4. *Needs:* `GlobularExtension`, `GlobularExtension.ofTable` and `Table.dim` (2.1, 1.2).
*Checks:*
- the pair `(1_{D_n}, 1_{D_n})` is admissible in every globular extension: `D_n` is the globular
  sum of the table `(n)`, of dimension `n ≤ n + 1`, and a map is parallel to itself;
- `Θ₀` is not contractible: the pair `(1, 1) : D_0 → D_0` is admissible and has no lifting,
  since `D_0` has no `1`-cell;
- `TopCat` is contractible (Ara 2013, Examples 2.7.1, through Example 2.2).

### 2.3 Free extensions `C[A]`

Free extensions `C[A]` along a set `A` of admissible pairs, with their universal
property, constructed by universally adjoining a lifting to each pair and closing under globular
sums (globular completion, Ara 2013, Proposition 1.11 and 1.12). *Source:* Ara 2013, 2.9.
*Needs:* `GlobularExtension.AdmissiblePair` and `GlobularExtension.IsLifting` (2.2),
`IsGlobularFunctor` (2.1). *Checks:*
- the functor `C → C[A]` is bijective on objects (Ara 2013, 2.9);
- every pair of `A` has a lifting in `C[A]`; for `C = Θ₀` and `A` the single pair
  `(1_{D_0}, 1_{D_0})`, this is a map `D_1 → D_0`, which `Θ₀` does not have;
- `C[∅]` is `C` for a globular extension `C` under `Θ₀`.

### 2.4 Cellular towers and coherators

Cellular towers (`CellularTower`), free globular extensions, coherators (Ara 2013,
2.10–2.11); the canonical coherator (every admissible pair at every stage), with the theorem that
it is a coherator (Ara 2013, Examples 2.12). *Needs:* the free extensions `C[A]` (2.3),
`GlobularExtension.IsContractible` (2.2). *Checks:*
- a defining tower gives a functor `Θ₀ → C` bijective on objects (Ara 2013, 2.10);
- the canonical, reduced canonical and Batanin–Leinster towers define coherators (Examples 2.12);
- in a coherator the pair `(1_{D_0}, 1_{D_0})` has a lifting `D_1 → D_0`, the identity of 3.2.

### 2.5 Globular functors out of a free globular extension

For a free globular extension `C` (in particular a coherator) and a contractible globular
extension `E`, a globular functor `C → E` exists, by induction along a defining tower (Ara 2013,
Proposition 2.14). *Needs:* `CellularTower` (2.4), `IsGlobularFunctor` (2.1),
`GlobularExtension.IsContractible` (2.2). *Checks:*
- for the tower with every `A_n` empty, the functor is the one of Proposition 1.6;
- for `E = TopCat` it gives the functor `R` of Layer 5.1;
- it depends on the tower and on the liftings chosen (Ara 2013, Remarks 2.15.1).

### Examples

- In `Θ₀`, the pair `(τ_n, σ_n) : D_n → D_{n+1}` is admissible by the coglobular identities; in
  the canonical coherator it has a lifting `Ω : D_{n+1} → D_{n+1}` at the first stage `C₁`, with
  `Ω σ_n = τ_n` and `Ω τ_n = σ_n`, which gives the inverses of 3.2 (Ara 2013, 3.5).
- With `ε₁, ε₂ : D_{n+1} → D_{n+1} ⊔_{D_n} D_{n+1}` the two canonical maps, the pair
  `(ε₂ σ_n, ε₁ τ_n) : D_n → D_{n+1} ⊔_{D_n} D_{n+1}` is admissible and comes from `Θ₀`, so it has
  a lifting `∇` in `C₁`, which gives the composition of 3.2 (Ara 2013, 3.2 and 3.4).
- `Θ₀` is not contractible: `(1, 1) : D_0 → D_0` has no lifting (2.2, Checks); in the canonical
  coherator the liftings `κ_n : D_{n+1} → D_n` of `(1_{D_n}, 1_{D_n})` appear in `C₁` (Ara 2013,
  3.5).

### Dependencies

Layer 1 (globular sums, `Θ₀`, the coglobular space of disks and the contractibility of its
globular sums); Mathlib only otherwise. Within the layer, each item uses the one before.

## Layer 3: ∞-groupoids of type `C`

### 3.1 The category `∞-Gpd_C`

The category `∞-Gpd_C` (`IsGlobularPresheaf`, `InfinityGroupoid`), the underlying globular
set, the forgetful functor to globular sets and its left adjoint on globular sums (free models
`y S`, disks `D_n := y(D_n)`, `J_n : D_n → D_{n+1}` from `σ_n`). *Source:* Ara 2013, 1.8, 2.5,
5.4. *Needs:* `PseudoCoherator` (2.2), `GlobularSums` and `CoglobularObject.faceTo` (1.1, 1.2),
`GlobularPresheaf` (0.1); Mathlib `ObjectProperty.FullSubcategory`, `yoneda`. *Checks:*
- the terminal presheaf is an ∞-groupoid of type `C`, with one cell in each dimension;
- every representable `y S` is an ∞-groupoid of type `C` (Ara 2013, 5.4);
- for `C = Θ₀` (not contractible), the presheaves sending globular sums to globular products are
  the globular sets, by restriction to `𝔾` (Examples 1.9.1).

### 3.2 Structural operations

Structural operations from the coherator: identities `1_x` (`PseudoCoherator.identityMap`,
a chosen lifting of `(1_{D_n}, 1_{D_n})`), compositions and inverses of `n`-cells along `k`-cells,
each chosen by a lifting, with their action on underlying cells. *Source:* Ara 2013, §3, and the
pregroupoidal structures of 3.11. *Needs:* `InfinityGroupoid` (3.1), `GlobularExtension.idPair`
and `PseudoCoherator.contractible` (2.2). *Checks:*
- `1_x` has source and target `x`;
- for `u : x → y` and `v : y → z`, `v ∗ u : x → z` (Ara 2013, 3.2);
- the inverse of `u : x → y` goes from `y` to `x`.

### Examples

- For `C = Θ₀`, which is not contractible, the presheaves sending globular sums to globular
  products are the globular sets (3.1, Checks; Ara 2013, Examples 1.9.1).
- `TopCat` being contractible (2.2), the representable presheaf `TopCat(−, X)` of a space `X` is an
  ∞-groupoid `y_TopCat(X)` of type `TopCat`, whose `n`-cells are the maps `D^n → X` (Ara 2013,
  5.4); 7.2 compares `Π_∞^R X` with it.
- The composition of `n`-cells along `(n−1)`-cells depends on the lifting chosen, and two choices
  give composites joined by an `(n+1)`-cell (Ara 2013, 3.2, with Proposition 4.6).

### Dependencies

Layer 2 (contractible globular extensions, 2.2, for 3.1; their liftings for 3.2); Mathlib
`yoneda`, `Functor.whiskeringLeft`, `ObjectProperty.FullSubcategory`. 3.2 uses 3.1.

## Layer 4: homotopy groups and weak equivalences

### 4.1 The homotopy relation and the homotopy groups

The homotopy relation on `n`-cells (`GlobularExtension.CellJoined`; Ara 2013, 4.2,
Lemma 4.3), the groupoids `ϖ_n(X)` (Proposition 4.5), `π₀ X` and `π_n(X, x)` for `n ≥ 1` with
the group structure from the composition operations (4.11; `PseudoCoherator.iteratedIdentity`
gives `1^{n−1}_x`); functoriality (4.8). *Needs:* `PseudoCoherator.identityMap` and the
compositions and inverses of 3.2, `InfinityGroupoid` (3.1). *Checks:*
- `∼_n` is an equivalence relation compatible with `∗^n_{n−1}` (Lemma 4.3);
- `π_n(X, x)` is abelian for `n ≥ 2` (Ara 2013, 4.11, Eckmann–Hilton);
- for the terminal ∞-groupoid, `π₀` is a point and all `π_n` are trivial.

### 4.2 Independence of choices

Independence of choices: `ϖ_n(X)` does not depend on the pregroupoidal structure chosen in
3.2 (Ara 2013, Proposition 4.6); `π_n(X, u) ≅ π_n(X, x)` naturally for an `(n−1)`-cell `u` with
`0`-source `x` (Theorem 4.13); a `1`-cell `x → y` induces `π_n(X, x) ≅ π_n(X, y)` (Corollary
4.14); `π_n(X, x)` does not depend on the pregroupoidal structure (Corollary 4.15). *Needs:*
`GlobularExtension.CellJoined`, `PseudoCoherator.iteratedIdentity` and the groups `π_n` (4.1).
*Checks:*
- for `n = 1`, `π_1(X, u) = π_1(X, x)` with `u = x`, and the isomorphism of Theorem 4.13 is the
  identity;
- the set `π_n(X, u)` at an `(n−1)`-cell `u` involves no identity map, so only `π_n(X, x)` moves
  with the choice of `1^{n−1}_x`;
- for the terminal ∞-groupoid every isomorphism of this item is the identity of the trivial group.

### 4.3 Weak equivalences

Weak equivalences (`PseudoCoherator.IsWeakEquivalence`; Ara 2013, 4.17); two-out-of-three;
the equivalent characterizations of Ara 2013, Theorem 4.18: (2) bijections on `π₀` and on
`π_n(−, u)` at every `(n−1)`-cell `u` (`PseudoCoherator.isWeakEquivalence_iff`, stated with
`GlobularExtension.BijectiveOnComponents` and `GlobularExtension.BijectiveOnLoops`), (3) `ϖ_1` an
equivalence and bijections on `π_n(−, u, v)` for parallel pairs, (4) `ϖ_1` full and essentially
surjective and surjections on `π_n(−, u, v)`. *Needs:* the isomorphisms
`π_n(X, u) ≅ π_n(X, x)` of 4.2, `PseudoCoherator.iteratedIdentity` (4.1). *Checks:*
- identities are weak equivalences, and weak equivalences satisfy two-out-of-three;
- any morphism between ∞-groupoids whose `π₀` are points and whose `π_n` are trivial is a weak
  equivalence;
- the constant presheaf with value a two-element set is an ∞-groupoid of type `C`, and its map to
  the terminal ∞-groupoid is not a weak equivalence (`π₀` has two elements).

### Examples

- `π₀ X` is the set of connected components of the groupoid `ϖ_1(X)` (Ara 2013, 4.11).
- For the terminal ∞-groupoid, `π₀` is a point and every `π_n` is trivial (4.1, Checks).
- The constant presheaf with value a two-element set is an ∞-groupoid of type `C`, and its map to
  the terminal ∞-groupoid is not a weak equivalence (4.3, Checks).

### Dependencies

Layer 3: the structural operations of 3.2 give the groupoids `ϖ_n` and the group structures
(4.1). Within the layer, 4.2 uses 4.1 and 4.3 uses 4.2. No supplier beyond Mathlib.

## Layer 5: the fundamental ∞-groupoid of a space

In the same P.S. (Montpellier, cote 134-2, pp. 42–44; the author's pp. 27–29) Grothendieck
associates with a simplicial set `K•` (« il peut être prudent de le prendre de Kan ») an
`n`-category `C_n(K•)` of 0-simplices, paths, homotopies between paths and so on, with homotopy
classes in dimension `n`, and observes that it is an `n`-groupoid: the fundamental `n`-groupoid.
He notes canonical isomorphisms `π_i(K•, x) ≃ π_i(C_n(K•))` for `0 ≤ i ≤ n`, so that `C_n(f)` is
an `n`-equivalence if and only if `f` induces isomorphisms on `π_0` and on the `π_i` at every
point, `1 ≤ i ≤ n`: the comparison this layer specifies in Ara's form. As above, the letter is
unpublished and quoted from a transcription of the manuscript.

### 5.1 `TopCat` as a contractible globular extension

The coglobular space of disks `stdDisks` of 1.1 and the contractibility of its globular sums;
`TopCat` as a contractible globular extension; a globular functor `R : C → TopCat` into
`stdDisks` (`IsGlobularFunctor C stdDisks R`) for each coherator (2.5; Ara 2013, Examples 5.3).
*Needs:* `stdDisks` and `hemisphere` (1.1), `GlobularSums.nonempty_of_hasPushouts` (1.2),
`IsGlobularFunctor` (2.1), the globular functors of 2.5; Tau Ceti
`TauCeti.TopCat.contractibleSpace_disk`. *Checks:*
- each `D^n` is contractible and each `σ_n, τ_n` is a closed embedding;
- every globular sum of disks is contractible (Ara 2013, Proposition 5.11, with Example 5.10:
  the disks form a cofibrant and weakly contractible functor `𝔾 → Top`);
- `R` sends `D_n` to `D^n` and each globular sum of `C` to the corresponding globular sum of
  disks, so on the image of `Θ₀` it is the functor of Proposition 1.6, unique up to unique
  isomorphism.

### 5.2 The fundamental ∞-groupoid `Π_∞^R`

`Π_∞^R : TopCat ⥤ ∞-Gpd_C`, `X ↦ TopCat(R(−), X)` (`piPresheaf`); the sum condition holds
because `R` preserves globular sums and `TopCat(−, X)` sends colimits to limits. *Source:* Ara
2013, 5.2. *Needs:* `IsGlobularFunctor` (5.1, 2.1), `IsGlobularPresheaf` and `InfinityGroupoid`
(3.1); Mathlib `yoneda`, `Functor.whiskeringLeft`. *Checks:*
- the `0`-cells of `Π_∞^R X` are the points of `X`, its `1`-cells the paths, its `2`-cells the
  homotopies of paths relative to the endpoints (Ara 2013, Examples 5.3);
- `Π_∞^R` of a point is the terminal ∞-groupoid;
- `Π_∞^R` preserves limits (it is a right adjoint, Ara 2013, 5.2).

### 5.3 Comparison with the homotopy groups of spaces

The comparison: `π₀(Π_∞^R X) ≅ π₀(X)` and `π_n(Π_∞^R X, x) ≅ π_n(X, x)` as groups,
naturally in `X` (Ara 2013, Theorem 8.7, proved through loop objects, Propositions 8.4–8.6; Ara
works in a model category whose objects are all fibrant, with a cofibrant and weakly
contractible functor `𝔾 → M` (5.14), and `TopCat` with the disks is that case by Example 5.10).
*Needs:* `piPresheaf` (5.2), the groups `π_n` and `PseudoCoherator.iteratedIdentity` (4.1); Mathlib
`ZerothHomotopy`, `HomotopyGroup`; Tau Ceti `HomotopyGroup.map`. *Checks:*
- for a contractible `X`, `π₀(Π_∞^R X)` is a point and every `π_n(Π_∞^R X, x)` is trivial;
- for a discrete `X`, `π₀(Π_∞^R X)` is `X` and every `π_n(Π_∞^R X, x)` is trivial;
- for `f : X → Y`, the isomorphisms carry the map that `Π_∞^R f` induces on `π_n` at `x` to the
  map that `f` induces on `π_n(X, x)`.

### 5.4 Weak equivalences detected by `Π_∞^R`

`Π_∞^R f` is a weak equivalence iff `f` is a weak homotopy equivalence
(`piPresheaf_isWeakEquivalence_iff`, for every pseudo-coherator `C` and every `R` with
`IsGlobularFunctor C stdDisks R`; Ara 2013, Corollaries 8.9–8.11, there for a formal coherator).
*Needs:* the natural isomorphisms of 5.3, `PseudoCoherator.IsWeakEquivalence` (4.3), `weTop`;
StableHomotopyKTheory §2.1 `IsWeakHomotopyEquivalence`. *Checks:*
- `Π_∞^R` of a homotopy equivalence is a weak equivalence;
- `Π_∞^R` of the inclusion of a point into a two-point discrete space is not a weak equivalence;
- `Π_∞^R` of the inclusion of the endpoints `{0, 1}` into `[0, 1]` is not a weak equivalence, and
  `Π_∞^R` of the map `[0, 1] → *` is one.

### Examples

- The `3`-cells of `Π_∞^R X` are the relative homotopies between relative homotopies between paths
  of `X` (Ara 2013, Examples 5.3).
- `ϖ_1(Π_∞^R X)` is isomorphic, naturally in `X`, to the groupoid `Π_1(D^0, X)` of points of `X`
  and left homotopies between them up to `2`-homotopy, Quillen's fundamental groupoid (Ara 2013,
  6.6 and Proposition 8.4; `TopCat` with the disks satisfies its hypotheses by Example 5.10).
- For `R` constant at a point, every cell of `TopCat(R(−), X)` is a point of `X`, and the inclusion
  of a point into `[0, 1]` is a weak homotopy equivalence sent to a map that is not a bijection on
  `π₀`: the hypothesis that `R` is globular cannot be dropped from 5.4.

### Dependencies

Layers 1 (the disks of 1.1), 2 (the globular functor of 2.5), 3 (3.1) and 4 (4.1 for 5.3, 4.3
for 5.4); not Layer 6. Tau Ceti `TauCeti.TopCat.contractibleSpace_disk` (5.1) and
`HomotopyGroup.map` (5.3); StableHomotopyKTheory §2.1, `IsWeakHomotopyEquivalence` (5.4).

## Layer 6: cellular ∞-groupoids

### 6.1 Cellular ∞-groupoids

Cellular ∞-groupoids: transfinite composites (`TransfiniteCompositionOfShape`) of
pushouts of the boundary inclusions `∂D_n → D_n` in `∞-Gpd_C`, starting from the initial object
(Henry 2016, 5.3.2 and 5.3.4). *Needs:* `InfinityGroupoid` and the free models `∂D_n`, `D_n`
(3.1); Mathlib `TransfiniteCompositionOfShape`, `IsPushout`. *Checks:*
- the initial ∞-groupoid is cellular;
- the free models `∂D_n` and `D_n` are cellular (`∂D_{n+1}` is the pushout of two copies of
  `D_n` along `∂D_n`);
- a pushout of a cellular ∞-groupoid along a boundary inclusion is cellular.

### Examples

- The initial ∞-groupoid is cellular (6.1, Checks).
- `∂D_{n+1}` is the pushout of two copies of `D_n` along `∂D_n`, so the free models `∂D_n` and
  `D_n` are cellular (6.1, Checks; 0.2 for the same pushout in globular sets).

### Dependencies

Layer 3 (`∞-Gpd_C`, the free models `∂D_n` and `D_n`, 3.1); Mathlib
`TransfiniteCompositionOfShape`. Independent of Layers 4 and 5; Layer 7 does not use it.

## Layer 7: localizations

### 7.1 The functor `Hot ⥤ Ho(∞-Gpd_C)`

`W_Top` (`weTop`) and `W_C` (`PseudoCoherator.weakEquivalences` on presheaves, its
inverse image on `∞-Gpd_C`) as `MorphismProperty`; `Π_∞^R` inverts `W_Top` (5.4), hence the
induced functor `Hot ⥤ Ho(∞-Gpd_C)` through Mathlib's `Localization.lift` (Ara 2013, 8.13).
This item supplies the two classes, the inversion and the functor; the localizations are
Mathlib's. *Needs:* `piPresheaf_isWeakEquivalence_iff` (5.4), `PseudoCoherator.weakEquivalences`
(4.3), `weTop`; Mathlib `MorphismProperty.Localization`, `MorphismProperty.Q`,
`MorphismProperty.IsInvertedBy`, `Localization.lift`; StableHomotopyKTheory §2.1
`IsWeakHomotopyEquivalence`. *Checks:*
- `W_Top` contains the homeomorphisms and `W_C` the isomorphisms;
- the induced functor, composed with the localization functor of `TopCat`, is `Π_∞^R` followed by
  the localization functor of `∞-Gpd_C`, up to the canonical isomorphism of the lift;
- the induced functor sends a point and a contractible space to isomorphic objects.

### 7.2 Changing the globular functor `R`

Independence of the homotopy invariants from `R`: for two globular functors
`R, R' : C → TopCat`, `Π_∞^R(X)` and `Π_∞^{R'}(X)` have the same underlying globular set and the
same groupoids `ϖ_n` for `n ≥ 1` (Ara 2013, 5.2 and Proposition 5.5, whose proof compares both
with the ∞-groupoid `y_TopCat(X)` of type `TopCat`, 5.4), hence the same `π₀` and isomorphic
groups `π_n`, all of them those of `X` by 5.3, whatever the coherator (Corollary 8.8).
Consequently `Π_∞^R f` is a weak equivalence if and only if `Π_∞^{R'} f` is. The statement
compares invariants only: the identity of the underlying globular sets is not a morphism of
∞-groupoids (Ara 2013, Remark 5.6), and no morphism, zigzag or natural isomorphism between
`Π_∞^R` and `Π_∞^{R'}`, before or after localization, is asked for. *Needs:* the isomorphisms of
5.3, the groupoids `ϖ_n` and their independence of choices (4.1, 4.2), `IsGlobularFunctor` (2.1),
`piPresheaf` (5.2). *Checks:*
- the `n`-cells of `Π_∞^R X` and `Π_∞^{R'} X` are the same set `TopCat(D^n, X)` (Ara 2013, 5.2);
- `π₀(Π_∞^R X) = π₀(Π_∞^{R'} X)`, both the path components of `X`;
- for a contractible `X`, both are weakly equivalent to the terminal ∞-groupoid.

### Examples

- The induced functor `Hot ⥤ Ho(∞-Gpd_C)` sends a point and a contractible space to isomorphic
  objects (7.1, Checks).
- For a contractible `X`, `Π_∞^R X` and `Π_∞^{R'} X` are both weakly equivalent to the terminal
  ∞-groupoid (7.2, Checks).
- For the inclusion `f` of the endpoints `{0, 1}` into `[0, 1]`, neither `Π_∞^R f` nor
  `Π_∞^{R'} f` is a weak equivalence (7.2, with the Checks of 5.4).

### Dependencies

Layers 4 (4.2) and 5 (5.3, 5.4), and 2.1; not Layer 6. Mathlib `MorphismProperty`,
`MorphismProperty.Localization`, `MorphismProperty.Q`, `MorphismProperty.IsInvertedBy`,
`Localization.lift`; StableHomotopyKTheory §2.1 for `W_Top`.

## Downstream consumers

| Consumer | Interface |
| --- | --- |
| HomotopyTheoryOfCategories, Layer 8.6 | `Globe` with its `Category` instance, proved direct with degree `n` on this exact carrier |

No other roadmap consumes this one.

## Research context: elementary expansions and the homotopy hypothesis

Nothing in this section is a target of this roadmap.

**The elementary expansion assertion.** For a coherator `C`, a cellular `X` (6.1), a map
`a : D_n → X` and a pushout square of `J_n : D_n → D_{n+1}` (3.1) along `a`, the map
`X → X ⊔_{D_n} D_{n+1}` is a weak equivalence (4.3). For finitely cellular `X` this is Henry's
Conjecture 5.3.3 (Henry 2016), extended to retracts of cellular objects by his Lemma 5.3.4; Henry
shows that it implies a canonical left semi-model structure on `∞-Gpd_C` (Theorem 5.3.5) and the
homotopy hypothesis (Corollary 5.3.13). In the same paper Henry proves the homotopy hypothesis for
his cylinder coherators: their models carry semi-model structures, Quillen equivalent to one
another and, through the fundamental ∞-groupoid functor, to spaces (Theorem 5.1.2, with
Theorem 5.2.10 for a semi-simplicial cylinder coherator); Grothendieck ∞-groupoids of type `C`
are an instance of that framework under Conjecture 5.3.3 (5.3). Henry and Lanari (2023) treat
Grothendieck `3`-groupoids.

**Strict and semi-strict models.** Strict models do not reach all homotopy types: for every
realization functor of strict `3`-groupoids that induces isomorphisms on `π₀` and on the `π_i`
(Simpson 1998, Definition 3.1), no strict `3`-groupoid realizes the `3`-type of `S²` (Proposition
5.1, through the splitting of the Postnikov tower of a simply connected strict `3`-groupoid,
Proposition 5.3), and no strict ∞-groupoid realizes `S²` (Corollary 6.1). Simpson conjectures that
strict composition with weak units suffices (§7, Conjecture 1, for his `n`-snugroupoids). Henry
proves a regular form of this conjecture for ∞-groupoids: for a good class `C` of polygraphs
stable under the Gray tensor product, such as the regular polygraphs, the `C`-categories carry a
weak model structure, the groupoidal analogue of the folk model structure (Henry 2018, §6.1 and
Theorem 6.1.7), Quillen equivalent to `C`-polygraphs (Theorem 6.2.5), and regular polygraphs are
Quillen equivalent to semi-simplicial sets (Theorem 6.3.8). The general form, with every composition
strict, is open (Conjecture 6.4.1). The combinatorial input is that non-unital (positive)
polygraphs form a presheaf category (Henry 2019, Corollary 2.4.9). These models are not
Grothendieck ∞-groupoids and are outside the scope of this roadmap.

**The OpenAI preprint** « The Grothendieck homotopy hypothesis via elementary expansions »
(24 September 2026, not peer-reviewed), with its formalization scope note `lean/docs/312.md`, the
comparator statement `lean/ComparatorChallenges/GrothendieckElementaryExpansion.lean` and the
development `lean/OAI/CategoryTheory/Globular/` (references below).

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
- *Definition and hypothesis match with this roadmap.* Tables: `Table n` (`globe`, `attach`); the
  constructor `attach` glues a new disk by its source face to the target face of the previous last
  disk, the mirror image of Ara's orientation (Conventions), so a table of the development read
  from right to left is a table of Conventions with the same globular sum. Globular theories:
  `GlobularTheory`, hom-types on `Shape := Σ n, Table n` with a functor from the realized tables
  (`Θ₀`) preserving each attaching pushout, a globular extension whose objects are indexed by
  tables, the case of free globular extensions (2.4). Admissible pairs: arity of height `≤ n + 1`
  and parallel maps, as 2.2. Coherators: `IsCoherator` is a cellular presentation (an initial
  stage, free extensions along families of admissible pairs indexed by a type, a sequential
  colimit) together with a filler for every admissible pair, as 2.4. Models: presheaves sending
  each attaching pushout to a pullback, as 3.1. `J_n`: the Yoneda image of the source inclusion,
  as 3.1. Weak equivalences: bijection on `0`-cells modulo `Joined 0` and on every
  `HomotopyGroup hC x n`, the `(n+1)`-cells from `1^n_x` to `1^n_x` modulo `Joined (n+1)` with
  identities chosen by `Classical.choose`, which is Ara's `π_{n+1}(X, x)` as a set (4.1, 4.3).
  Cellular: a well-ordered transfinite composition from an initial model whose successor steps
  attach families of cells along their boundaries, as 6.1. Universes: theories and models in
  `Type v`, tables realized in `Type 0` globular presheaves. The Quillen equivalence of
  Corollary 5.2 is stated for Henry's fundamental ∞-groupoid functor; the paper does not identify
  it with `Π_∞^R` of Layer 5.

The semi-model structure and the comparison with spaces rest on Henry 2016 and on the paper's
unformalized arguments.

The development `lean/OAI/CategoryTheory/Globular/` (Apache License 2.0, `lean/LICENSE`, which
permits adaptation with attribution and the licence notice) is a cited source, not the
specification of this roadmap.

## References

- A. Grothendieck, *Pursuing Stacks (À la poursuite des champs)*, vol. I, ed. G. Maltsiniotis,
  Documents Mathématiques 20, SMF, 2022. Zbl 1499.14001.
- G. Maltsiniotis, *La théorie de l'homotopie de Grothendieck*, Astérisque 301 (2005).
  Zbl 1104.18005. (Test categories; Cisinski 2006 cites its 1.3.7 and 1.5.4 in Remarques 4.1.9
  and 4.1.13.)
- D.-C. Cisinski, *Les préfaisceaux comme modèles des types d'homotopie*, Astérisque 308 (2006).
  Zbl 1111.18008. Cited: Introduction, p. xiii, note 2 (`Hot` as the localization of spaces at
  the weak homotopy equivalences); Définition 3.3.2 (basic localizers); Définitions 4.1.3 and
  4.1.12 (weak equivalences of presheaves, test categories); Théorème 4.2.15, Corollaires
  4.2.18–4.2.19 and paragraph 4.2.20 (the minimal basic localizer, whose localization `Hot_∞` of
  `Cat` is equivalent to the homotopy category of simplicial sets).
- G. Maltsiniotis, « Grothendieck ∞-groupoids, and still another definition of ∞-categories »,
  arXiv:1009.2331 (2010).
- D. Ara, « On the homotopy theory of Grothendieck ∞-groupoids », *J. Pure Appl. Algebra* 217
  (2013), no. 7, 1237–1278. Zbl 1291.18006; arXiv:1206.2941.
- S. Henry, « Algebraic models of homotopy types and the homotopy hypothesis », arXiv:1609.04622
  (2016), preprint. Cited: Theorems 5.1.2 and 5.2.10, Definition 5.3.2, Conjecture 5.3.3,
  Lemma 5.3.4, Theorem 5.3.5, Corollary 5.3.13.
- S. Henry, « Non-unital polygraphs form a presheaf category », *High. Struct.* 3 (2019), no. 1,
  248–291. Zbl 1427.18014; arXiv:1711.00744. Cited: Corollary 2.4.9.
- S. Henry, « Regular polygraphs and the Simpson conjecture », arXiv:1807.02627 (2018), preprint.
  Cited: Theorems 6.1.7, 6.2.5 and 6.3.8, Conjecture 6.4.1.
- S. Henry and E. Lanari, « On the homotopy hypothesis for 3-groupoids », *Theory Appl. Categ.*
  39 (2023), no. 26, 735–768. Zbl 1533.18017.
- C. Simpson, « Homotopy types of strict 3-groupoids », arXiv:math/9810059 (1998), preprint.
  Cited: Definition 3.1, Propositions 5.1 and 5.3, Corollary 6.1, §7 Conjecture 1.
- OpenAI, « The Grothendieck homotopy hypothesis via elementary expansions », preprint,
  24 September 2026, github.com/openai/math, commit `7ef5c0cc5ca4b0e072b7a050fca09ab24bc6fa3a`,
  `preprints/The-Grothendieck-homotopy-hypothesis-via-elementary-expansions-September-24-2026/`;
  formalization scope `lean/docs/312.md`; Lean companion `lean/OAI/CategoryTheory/Globular/`,
  solution module `OAI.CategoryTheory.Globular.Main` (Apache 2.0).
