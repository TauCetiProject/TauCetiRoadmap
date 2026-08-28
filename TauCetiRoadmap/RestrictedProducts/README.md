# Roadmap: restricted products of topological groups and rational diagonals

This roadmap builds the generic infrastructure for restricted products of topological groups:
families of compact open subgroups used as reference data, componentwise maps, change of reference
family at finitely many indices, reindexing along an equivalence, the away-`S` decomposition, and
diagonal homomorphisms whose coordinates are eventually integral. Its inputs are a family of
topological groups, subgroups of them, and coordinate homomorphisms. It uses no arithmetic and no
algebraic geometry, and its representative `Suggested.lean` imports only Mathlib.

It does **not** construct the local point groups of an algebraic group, prove strong approximation,
or define Tamagawa measures. Those need reductive-group, integral-model, reduction-theory and
adelic-Fourier suppliers; each of them is owned by a roadmap named in §*Future consumers*, which
instantiates this generic contract rather than reproving it.

Suggested home: `TauCeti/Topology/Algebra/RestrictedProduct/`.

---

## Scope and ownership

### Owned here

- the subgroup cut out by a second reference family, the everywhere-integral subgroup as its
  diagonal case, openness and compactness of both — for the second family under only **eventual**
  comparison with the reference family, and for the everywhere-integral one from coordinatewise
  compactness alone with no openness hypothesis;
- families of compact open subgroups as explicit parameters, never as a hidden global choice;
- componentwise maps between restricted products from **eventual** preservation of the reference
  subgroups, with their evaluation, identity, composition and continuity laws, and the
  everywhere-preserving constructor as a corollary;
- change of factors at a fixed index type, from a coordinatewise family of isomorphisms that is
  **eventually** a bijection of the reference subgroups, with its coordinate formulas both ways
  and continuity both ways; the change of reference family at finitely many indices as its
  identity case, with its coherence laws, naturality, and the double-coset caveat below;
- reindexing along an equivalence of index types, with coordinate formulas both ways;
- the splitting of a restricted product over a `Sum` index type into the product of the two
  restricted products, and the collapse of a restricted product over a finite index type to a
  plain product;
- the away-`S` restriction and, for finite `S`, the decomposition into a product over `S` times
  the away-`S` restricted product — assembled from the previous three items, not built from
  scratch — with the coordinate formulas of the map and of its inverse;
- diagonal homomorphisms from supplied coordinate maps and supplied eventual-integrality evidence,
  with their coordinate formula, change-of-family compatibility, injectivity criterion, and the
  continuity criterion that a uniform integrality set gives.

### Consumed from Mathlib

Mathlib owns the restricted product and most of its point-set theory, and this roadmap adopts it
rather than restating it:

| Mathlib declaration | used for |
|---|---|
| `RestrictedProduct`, `Πʳ i, [R i, A i]` | the carrier, for the cofinite filter |
| `RestrictedProduct.mapAlong`, `mapAlongMonoidHom` | the underlying componentwise map, already stated with the eventual `Set.MapsTo` hypothesis |
| `RestrictedProduct.mapAlong_continuous` | continuity of componentwise maps |
| `RestrictedProduct.isOpen_forall_mem` | openness of the integral subgroup |
| `RestrictedProduct.continuous_dom`, `continuous_rng_of_principal` | the two continuity criteria |
| `RestrictedProduct.locallyCompactSpace_of_group` | local compactness; this roadmap adds no local-compactness theorem of its own |
| `RestrictedProduct.isEmbedding_structureMap`, `range_structureMap` | the integral subgroup as the image of `Π i, U i`, which gives its compactness |
| `DoubleCoset.Quotient` | the double-coset spaces of §*Change of family and double cosets* |
| `Function.Injective.comap_cofinite_eq` | discharges FLT's filter hypothesis `𝓕₁ = 𝓕₂.comap e` for reindexing; see §*Relation to FLT* |
| `Set.finite_preimage_inl_and_inr` | the cofinite filter on `ι₁ ⊕ ι₂` from the two summands, for the `Sum` splitting |
| `Filter.cofinite_eq_bot` | the collapse of a restricted product over a finite index type |
| `Equiv.sumCompl`, `MulEquiv.prodCongr` | the index equivalence and the pairing that assemble the away-`S` decomposition |

### Relation to FLT

Mathlib's `RestrictedProduct` came from FLT, and `Mathlib/Topology/Algebra/RestrictedProduct/` has
three files: `Basic`, `TopologicalSpace`, `Units`. FLT still carries a second layer on top of
those, not yet upstreamed, in
`FLT/Mathlib/Topology/Algebra/RestrictedProduct/{Basic,Equiv,TopologicalSpace}.lean`, and most of
Layer 1 here is in it. Tau Ceti roadmaps may import Mathlib only, so those statements must be
proved here either way; what the names below buy is that a later Mathlib bump turns them into
one-line aliases instead of leaving duplicates behind. **Everything in the "port" column is
already proved in FLT and should be lifted rather than reproved.**

| this roadmap | FLT | port or prove |
|---|---|---|
| `restrictedProductCongrRight`, `_apply`, `_symm_apply` | `Equiv.restrictedProductCongrRight` / `MulEquiv.restrictedProductCongrRight φ hφ`, `hφ : ∀ᶠ i in 𝓕, Set.BijOn (φ i) (A₁ i) (A₂ i)` | port |
| `continuous_restrictedProductCongrRight`, `_symm` | the two halves of `ContinuousMulEquiv.restrictedProductCongrRight` (FLT bundles them) | port |
| `restrictedProductCongr` and its lemmas | — (⚠ **not** `MulEquiv.restrictedProductCongr`; see caution 1) | prove, as the `φ = id` case of the row above |
| `restrictedProductCongrLeft`, `restrictedProductCongrLeft_apply_apply` | `MulEquiv.restrictedProductCongrLeft e h` with `h : 𝓕₁ = 𝓕₂.comap e`, and `Equiv.restrictedProductCongrLeft_apply_apply` | port; here `h` is not a hypothesis but `e.injective.comap_cofinite_eq.symm` |
| `restrictedProductCongrLeft_symm_apply`, `restrictedProductReindex` and its lemmas | `Equiv.restrictedProductCongrLeft'` (FLT's other orientation) | port |
| `isOpen_forall_mem_of_eventually_eq` | `RestrictedProduct.isOpen_forall_mem_of_eventually_eq` | port |
| `isCompact_forall_mem_of_eventually_subset` | `RestrictedProduct.isCompact_forall_mem_of_eventually_subset` | port |
| `integralSubgroupOf`, `mem_integralSubgroupOf`, `integralSubgroup`, `mem_integralSubgroup` | `RestrictedProduct.structureMapMonoidHom` is the map, but the subobject is only `structureSubring` / `mem_structureSubring_iff`, which are `Subring`-valued and need `Ring`/`SubringClass` on the factors | prove: FLT has no `Subgroup`-valued version, and none of these admits a second family |
| `isOpen_integralSubgroup` | — | Mathlib's `RestrictedProduct.isOpen_forall_mem` directly |
| `isCompact_integralSubgroup` | — | prove; see caution 2 |
| `restrictedProductSum` and its four coordinate lemmas | — | prove |
| `restrictedProductOfFinite` and its lemmas | — | prove |
| `awayDecomposition` and its lemmas | — | prove, but as the composition below |
| `rationalDiagonal` package, `continuous_rationalDiagonal` | — | prove |
| `doubleCosetCongr`, `exists_map_integralSubgroup_ne`, `not_forall_mapsTo_integralSubgroup` | — | prove |

Three cautions for whoever does the port.

1. ⚠ **`restrictedProductCongr` here is not FLT's `restrictedProductCongr`.** FLT's
   `MulEquiv.restrictedProductCongr` reindexes *and* changes factors in one step. The declaration
   of that name here is the change of reference family at finitely many indices, i.e. the
   `φ = id` case of `restrictedProductCongrRight`. Map it onto `restrictedProductCongrRight`, not
   onto FLT's like-named declaration.
2. ⚠ **`isCompact_integralSubgroup` is not the `V = U` case of
   `isCompact_forall_mem_of_eventually_subset`.** FLT's eventually-shaped statement additionally
   assumes each reference subgroup **open**, because it goes through the open embedding of
   `Πʳ i, [G i, U i]_[𝓟 S]`. The everywhere-integral statement needs no openness at all: it is
   the range of `structureMap`, an embedding for any family. Neither subsumes the other and both
   are milestones.
3. ⚠ The FLT declarations must be consumed under **their** namespaces (`Equiv.`, `MulEquiv.`,
   `ContinuousMulEquiv.`, `RestrictedProduct.`), never redeclared at the root here: a root-level
   redeclaration would clash with Mathlib rather than alias it.

Genuinely new relative to FLT, and the part of this roadmap that is worth writing down for its own
sake rather than as a port:

- **`awayDecomposition` in its cofinite form.** FLT's nearest statements are
  `RestrictedProduct.principalEquivProd` and `Homeomorph.restrictedProductPrincipal`, which give
  `Πʳ i, [R i, A i]_[𝓟 J] ≃ₜ (Π i : J, A i) × (Π i : Jᶜ, R i)` for a **principal** filter: both
  factors are plain products, no restricted product survives, and the integrality condition sits
  on `J` rather than on its complement. `flattenEquiv` / `flattenHomeomorph` split along the
  fibres of a map of index sets, a different factorization again. The cofinite decomposition is
  assembled here as `restrictedProductReindex` — FLT's `CongrLeft` run backwards — along
  `Equiv.sumCompl (· ∈ S)`, then `restrictedProductSum`, then `restrictedProductOfFinite` — and
  `restrictedProductSum` is the step FLT does not have, so it is the one this roadmap owns and
  names. `restrictedProductOfFinite` is new too: Mathlib's `RestrictedProduct.homeoTop` is the
  `⊤`-filter statement and yields `Π i, U i`, the everywhere-integral product, not `Π i, G i`.
- **The `rationalDiagonal` package with its uniform-integrality continuity criterion.** Neither
  FLT nor Mathlib states the criterion of §*Layer 3*: pointwise eventual integrality builds the
  map, but continuity needs one cofinite `S` serving every `γ` at once.
- **The double-coset caveat and its two rejection tests,** `not_forall_mapsTo_integralSubgroup`
  and `exists_map_integralSubgroup_ne`. FLT has no double-coset layer over restricted products,
  and these two witnesses are what keep `restrictedProductMapOfForall` and the `Γ.map`/`K.map`
  form of `doubleCosetCongr` from looking like redundant complications.

### Not owned here

- functors of points, affine group schemes, integral models, reductive structure theory,
  parabolics, character lattices, simply connected covers, and almost-simple factors;
- local-point topologies, and proofs that integral points form compact open subgroups;
- arithmetic proofs of eventual integrality for rational points;
- weak or strong approximation for algebraic groups;
- invariant differential forms, convergence factors, Tamagawa measures, reduction theory,
  finite-covolume theorems, central-isogeny volume formulas, and Tamagawa numbers;
- adelic Schwartz--Bruhat spaces, Fourier transforms, and Poisson summation;
- orthogonal, Pin, Spin, lattice, genus, mass, or theta-series applications.

---

## Pinned conventions

| Subject | Convention |
|---|---|
| factor family | An arbitrary family `G : ι → Type*` of topological groups. No group-scheme carrier is introduced, and no index type is privileged. |
| reference family | A family `U : Π i, Subgroup (G i)`, passed explicitly. `CompactOpenSubgroups` bundles one with openness and compactness of each member. It records no comparison with an integral model: that field cannot be stated before a functor-of-points carrier exists. |
| restricted-product map | A family `φ i : G i →* H i` induces a map as soon as `Set.MapsTo (φ i) (U i) (U' i)` holds for **all but finitely many** `i`. Restrictedness of the image is then derived. The everywhere-preserving constructor is a corollary of this one, never the other way round. |
| change of factors | A family `φ i : G i ≃* H i` induces an equivalence as soon as `Set.BijOn (φ i) (U i) (U' i)` holds for **all but finitely many** `i`. `Set.BijOn` and not `Set.MapsTo`: the inverse's coordinate formula is `(φ i).symm`, and that it lands in `U i` is surjectivity of `φ i` onto `U' i`, which `MapsTo` does not give even for an isomorphism. |
| change of family | The equivalence for families agreeing outside a finite set is the `φ = id` case of the previous row. It is coordinatewise the identity in both directions and carries a pinned evaluation theorem. It transports the ambient group only; see §*Change of family and double cosets*. |
| reindexing | Stated in both orientations: FLT's `restrictedProductCongrLeft`, pinned by `… x (e j) = x j`, and its inverse `restrictedProductReindex`, which is what the consumers use. The filter hypothesis `𝓕₁ = 𝓕₂.comap e` is a theorem here, not an argument. |
| away-`S` | `RestrictedProductGroupAway S U` is the restricted product over `{i // i ∉ S}` and needs no finiteness of `S`. Finiteness is a hypothesis of the decomposition theorem, not of the type. |
| packaging | `RestrictedProductGroup`, `RestrictedProductGroupAway` and `RestrictedProductGroupWithFactor` are index-generic names. A number-field consumer separately identifies the finite places and proves that its distinguished factor is the archimedean one. |
| diagonal | `rationalDiagonal` takes eventual-integrality evidence as an argument. This roadmap never manufactures that evidence, and does not assume the diagonal is injective or continuous. |

A bare existence claim is insufficient anywhere in this roadmap: every equivalence below is
required to come with the coordinate formulas of the map *and* of its inverse, because the
consumers compare diagonal maps, topologies and eventually measures through them.

---

## Export contract

Every export is generic and appears in `Suggested.lean`. No export stands in for a declaration
owned by another roadmap.

| Export | Layer | Mathematical contract |
|---|---:|---|
| `integralSubgroupOf` | 0 | the elements lying in a **second** family `V` at every index |
| `mem_integralSubgroupOf` | 0 | its membership criterion |
| `integralSubgroup` | 0 | the elements lying in the chosen subgroup at every index; `integralSubgroupOf` at `V = U` |
| `mem_integralSubgroup` | 0 | its membership criterion |
| `isOpen_forall_mem_of_eventually_eq` | 0 | openness of `integralSubgroupOf U V` for `V` only eventually equal to `U` |
| `isCompact_forall_mem_of_eventually_subset` | 0 | compactness of `integralSubgroupOf U V` for `V` only eventually inside `U` |
| `isOpen_integralSubgroup` | 0 | openness from coordinatewise openness |
| `isCompact_integralSubgroup` | 0 | compactness from coordinatewise compactness alone — ⚠ no openness hypothesis, so not the `V = U` case above |
| `CompactOpenSubgroups` | 0 | a family of compact open subgroups, one per factor |
| `restrictedProductMap` | 1 | the componentwise homomorphism, from eventual preservation |
| `restrictedProductMap_apply` | 1 | its exact coordinate formula |
| `continuous_restrictedProductMap` | 1 | continuity from coordinatewise continuity |
| `restrictedProductMapOfForall` | 1 | the everywhere-preserving corollary |
| `restrictedProductMapOfForall_apply` | 1 | its coordinate formula |
| `restrictedProductMap_id`, `restrictedProductMap_comp` | 1 | identity and composition, both with eventual hypotheses |
| `mapsTo_integralSubgroup_of_forall` | 1 | the everywhere-preserving map respects the integral subgroup |
| `not_forall_mapsTo_integralSubgroup` | 1 | ⚠ the eventual one does not |
| `restrictedProductCongrRight` | 1 | change of factors from an eventual coordinatewise `Set.BijOn` |
| `restrictedProductCongrRight_apply`, `restrictedProductCongrRight_symm_apply` | 1 | the coordinate formulas, `φ i` and `(φ i).symm` |
| `continuous_restrictedProductCongrRight`, `continuous_restrictedProductCongrRight_symm` | 1 | it is a homeomorphism |
| `restrictedProductCongr` | 1 | the equivalence for families agreeing outside a finite set; the `φ = id` case of `restrictedProductCongrRight` |
| `restrictedProductCongr_apply`, `restrictedProductCongr_symm_apply` | 1 | both directions are coordinatewise the identity |
| `continuous_restrictedProductCongr`, `continuous_restrictedProductCongr_symm` | 1 | it is a homeomorphism |
| `restrictedProductCongr_refl`, `restrictedProductCongr_symm`, `restrictedProductCongr_trans` | 1 | coherence laws |
| `restrictedProductCongr_naturality` | 1 | compatibility with componentwise maps |
| `doubleCosetCongr` | 1 | the induced bijection of double-coset spaces, along transported subgroups |
| `exists_map_integralSubgroup_ne` | 1 | ⚠ why `doubleCosetCongr` cannot use `integralSubgroup U'` |
| `restrictedProductCongrLeft` | 1 | reindexing in FLT's orientation, from `ι'` at the pulled-back family to `ι` |
| `restrictedProductCongrLeft_apply_apply`, `restrictedProductCongrLeft_symm_apply` | 1 | FLT's pinning equation `… x (e j) = x j`, and the coordinate formula of the inverse |
| `restrictedProductReindex` | 1 | reindexing along an equivalence of index types, in the consumers' orientation |
| `restrictedProductReindex_apply`, `restrictedProductReindex_symm_apply` | 1 | coordinate formulas for both directions |
| `continuous_restrictedProductReindex`, `continuous_restrictedProductReindex_symm` | 1 | it is a homeomorphism |
| `RestrictedProductGroup` | 2 | the restricted product relative to a reference family |
| `RestrictedProductGroupAway` | 2 | the restricted product over the indices outside `S` |
| `RestrictedProductGroupWithFactor` | 2 | a restricted product times an unrestricted distinguished factor |
| `restrictAway`, `restrictAway_apply` | 2 | restriction away from `S`, with its coordinate formula |
| `restrictAway_restrictAway` | 2 | compatibility for nested index sets |
| `restrictedProductSum` | 2 | ⚠ owned here: a restricted product over `ι₁ ⊕ ι₂` is the product of the two restricted products |
| `restrictedProductSum_apply_inl`, `_apply_inr`, `_symm_apply_inl`, `_symm_apply_inr` | 2 | its four coordinate formulas |
| `continuous_restrictedProductSum`, `continuous_restrictedProductSum_symm` | 2 | it is a homeomorphism |
| `restrictedProductOfFinite` | 2 | ⚠ owned here: over a finite index type the restricted product is the plain product |
| `restrictedProductOfFinite_apply`, `restrictedProductOfFinite_symm_apply` | 2 | its coordinate formulas |
| `continuous_restrictedProductOfFinite`, `continuous_restrictedProductOfFinite_symm` | 2 | it is a homeomorphism |
| `awayDecomposition` | 2 | for finite `S`: the product over `S` times the away-`S` restricted product |
| `awayDecomposition_fst`, `awayDecomposition_snd` | 2 | the forward coordinate formulas |
| `awayDecomposition_symm_apply_of_mem`, `awayDecomposition_symm_apply_of_notMem` | 2 | the inverse coordinate formulas |
| `continuous_awayDecomposition`, `continuous_awayDecomposition_symm` | 2 | it is a homeomorphism |
| `rationalDiagonal` | 3 | the diagonal from supplied coordinate maps and eventual-integrality evidence |
| `rationalDiagonal_apply` | 3 | its exact coordinate formula |
| `rationalDiagonal_change_family` | 3 | compatibility with change of reference family |
| `restrictedProductMap_comp_rationalDiagonal` | 3 | compatibility with componentwise maps |
| `injective_rationalDiagonal` | 3 | injectivity from a coordinate-separation hypothesis |
| `continuous_rationalDiagonal` | 3 | continuity from a uniform integrality set |

---

## The build, in layers

### Layer 0: reference families and the integral subgroup

**0.1 Integral subgroup.** Define `integralSubgroupOf U V`, the subgroup of `Πʳ i, [G i, U i]` cut
out by a **second** family `V`, and prove its membership criterion; the everywhere-integral
subgroup is its diagonal case `V = U`. A change of integral model produces the general shape: the
new family is comparable to the reference family only outside a finite set. Prove
`isOpen_forall_mem_of_eventually_eq` and `isCompact_forall_mem_of_eventually_subset` in that
eventual generality, with FLT's hypotheses — both of them assume every `U i` open.

Prove separately that `integralSubgroup U` is open when every `U i` is open (Mathlib's
`isOpen_forall_mem`) and compact when every `U i` is compact. ⚠ The compactness statement is
**not** the `V = U` case of `isCompact_forall_mem_of_eventually_subset`: it takes no openness
hypothesis, because it goes through the range of Mathlib's `structureMap`, which is an embedding
for any family. Neither statement subsumes the other, and an implementation that keeps only the
eventual one has lost a theorem.

**0.2 Compact open families.** Bundle a coordinatewise compact open subgroup family. Constructors
that produce such a family from an integral model belong to
`AlgebraicGroupStrongApproximation`.

### Layer 1: functoriality, change of family, reindexing

**1.1 Componentwise maps.** Construct the induced homomorphism from **eventual** preservation of
the reference subgroups: `Set.MapsTo (φ i) (U i) (U' i)` for all but finitely many `i`. This is
the right hypothesis and not a weakening for its own sake — after choosing an integral model, an
arithmetic map preserves the standard compact opens only outside a finite exceptional set, and a
constructor demanding preservation at every index would not accept it. Restrictedness of the image
is a consequence: the two cofinite conditions intersect. Prove the evaluation equation, the
identity law, composition (with the composed eventual hypothesis) and continuity, all in that
generality. Derive the everywhere-preserving constructor as a corollary, and prove that it, and
only it, carries `integralSubgroup U` into `integralSubgroup U'`.

**1.2 Change of factors.** Construct `restrictedProductCongrRight`: the equivalence induced by a
coordinatewise family `φ i : G i ≃* H i` that is a bijection of `U i` onto `U' i` for all but
finitely many `i`. ⚠ `Set.MapsTo` is not the right hypothesis even for isomorphisms — see
rejection test 9 — so the hypothesis is `∀ᶠ i in cofinite, Set.BijOn (φ i) (U i) (U' i)`, exactly
FLT's. Prove the two coordinate formulas, `φ i` forwards and `(φ i).symm` backwards, and
continuity in both directions.

**1.2a Change of reference family.** Specialize to `H = G` and `φ = id`: the equivalence of two
restricted products whose reference families agree outside a finite set, coordinatewise the
identity in both directions. This is the form the consumers cite. Prove the evaluation equations,
continuity in both directions, reflexivity, symmetry, composition, and naturality with
componentwise maps.

**1.3 Reindexing.** Construct `restrictedProductCongrLeft` for an equivalence `e : ι' ≃ ι` of
index types, in FLT's orientation, and pin it by FLT's equation `… x (e j) = x j`; its filter
hypothesis `𝓕₁ = 𝓕₂.comap e` is not assumed here but discharged by Mathlib's
`Function.Injective.comap_cofinite_eq`. Then define `restrictedProductReindex` as the inverse —
the orientation with `x` sent to `j ↦ x (e j)` that the consumers use — and prove continuity both
ways. Its two coordinate formulas are the two equations of `restrictedProductCongrLeft` read
backwards, not separate content.

### Layer 2: packaging and the away-`S` decomposition

**2.1 Names.** `RestrictedProductGroup U` is the restricted product relative to `U`;
`RestrictedProductGroupAway S U` is the same construction at the index type `{i // i ∉ S}`;
`RestrictedProductGroupWithFactor H U` is `H × RestrictedProductGroup U`, where `H` carries no
integrality condition.

**2.2 Restriction.** Construct `restrictAway`, prove its coordinate formula, and prove that
restriction away from a larger set factors through a smaller one.

**2.3 Splitting over a `Sum`.** ⚠ Owned here, with no FLT counterpart. Prove that a restricted
product over `ι₁ ⊕ ι₂` is the product of the restricted products over the two summands, with all
four coordinate formulas and continuity both ways. The content is that a subset of `ι₁ ⊕ ι₂` is
finite exactly when both of its preimages are (`Set.finite_preimage_inl_and_inr`). ⚠ The summand
filters are the comaps along `Sum.inl` and `Sum.inr`, and are `cofinite` here only because those
maps are injective; see rejection test 10. Prove also that over a finite index type the restricted
product is the plain product — Mathlib's `homeoTop` is the `⊤`-filter statement and gives the
everywhere-integral product instead.

**2.4 Decomposition.** For finite `S`, prove that the restricted product is a
`RestrictedProductGroupWithFactor` with distinguished factor `Π i : S, G i`, and that the
equivalence is a homeomorphism. Do not build it from scratch: it is `restrictedProductReindex`
along `Equiv.sumCompl (· ∈ S)`, then the `Sum` splitting of 2.3, then the finite collapse on the
`S` factor. The four coordinate formulas of §*The three equivalences* are part of this milestone,
not conveniences added afterwards.

### Layer 3: diagonals

**3.1 The diagonal.** Given `φ i : Γ →* G i` and evidence that each `γ : Γ` satisfies
`φ i γ ∈ U i` for cofinitely many `i`, construct the diagonal homomorphism and prove its
coordinate formula.

**3.2 Laws.** Prove compatibility with change of reference family and with componentwise maps.
Prove injectivity under a coordinate-separation hypothesis, and continuity under a uniform
integrality set — one cofinite `S` with `φ i γ ∈ U i` for every `γ` and every `i ∈ S`. Neither
injectivity nor continuity follows from the construction.

---

## The three equivalences

The reference-family and index manipulations a consumer needs are these three, and each is
required to pin the map, the inverse, and the coordinate formulas of both. "Canonically
equivalent" is not a milestone: a double-coset or measure computation downstream needs the
formulas.

| Equivalence | forward | inverse |
|---|---|---|
| `awayDecomposition S hS U`, `S` finite | `x ↦ ((x i)_{i ∈ S}, (x i)_{i ∉ S})` | `(y, z)` goes to the element whose `i`-th coordinate is `y ⟨i, _⟩` for `i ∈ S` and `z ⟨i, _⟩` for `i ∉ S` |
| `restrictedProductCongr U U' h`, `U i = U' i` off a finite set | `x ↦ x` coordinatewise | `x ↦ x` coordinatewise |
| `restrictedProductReindex e U`, `e : ι' ≃ ι` | `x ↦ (j ↦ x (e j))` | `y ↦ (i ↦ y (e.symm i))`, pinned by its values at `i = e j`, where it is `y j` |

Each is a homeomorphism, and each has its continuity proved in both directions; that is what makes
them usable for transporting Haar measure later.

The first of the three is not primitive. It is the composite

```text
Πʳ i, [G i, U i]
  -- restrictedProductReindex along Equiv.sumCompl (· ∈ S) -->
Πʳ k : S ⊕ Sᶜ, [G k, U k]
  -- restrictedProductSum -->
(Πʳ i : S, [G i, U i]) × (Πʳ j : Sᶜ, [G j, U j])
  -- restrictedProductOfFinite on the left factor, S finite -->
(Π i : S, G i) × RestrictedProductGroupAway S U
```

and the two middle names carry the same requirement: map, inverse, both coordinate formulas,
continuity both ways.

### Change of family and double cosets

⚠ `restrictedProductCongr` is an isomorphism of the **ambient** restricted products, and that is
all. A double-coset space `Γ \ X / K` depends on `K` as well, and the equivalence does not carry
`integralSubgroup U` to `integralSubgroup U'`: at the finitely many indices where the two families
differ, the coordinate condition changes. Concretely, with `ι = ℕ`, every factor
`Multiplicative ℤ`, `U i = ⊤` for all `i`, `U' i = ⊤` for `i ≠ 0` and `U' 0 = ⊥`, the two families
agree off `{0}`, the image of `integralSubgroup U` is the whole group, and `integralSubgroup U'`
is a proper subgroup. So `doubleCosetCongr` states the bijection along the **transported** subgroups
`Γ.map` and `K.map`, and `exists_map_integralSubgroup_ne` records that no version with
`integralSubgroup U'` on the right can be true.

---

## Future consumers

The topics below are **not milestones of this roadmap and not work to attempt here**. They are
listed only so that every theorem this roadmap declines to own has exactly one named owner, rather
than being picked up implicitly by whoever needs it first. Each is a roadmap in its own right,
with its own suppliers.

| Roadmap | What it owns | What it must import first |
|---|---|---|
| `AlgebraicGroupStrongApproximation` | adelic points of an algebraic group, weak and strong approximation | a reductive-groups supplier for the functor of points, reductive and semisimple predicates, parabolics and split tori, character lattices, simply connected covers, and smooth affine integral models |
| `ArithmeticReductionTheory` | Iwasawa decompositions, height maps, Siegel sets, fundamental sets, and finite covolume | the same reductive-groups supplier, plus the adelic packaging here |
| `TamagawaMeasures` | gauge forms, convergence factors, Tamagawa measures and numbers, and central-isogeny volume comparison | an Artin-`L` supplier for the character-lattice local factors, `ArithmeticReductionTheory`, and `AdelicFourierAnalysis` |
| `AdelicFourierAnalysis` | adelic Schwartz--Bruhat spaces, Fourier transforms, and Poisson summation | a global-adele supplier and the Schwartz--Bruhat infrastructure |
| `OrthogonalTamagawaAndLatticeMass` | the orthogonal specialization: strong approximation for `Spin`, `τ(SO_Q)`, the genus and spinor-genus comparison, and the Smith--Minkowski--Siegel mass formula | `TamagawaMeasures` and `OrthogonalSpinGroups` |

```text
this roadmap
    ├─→ AlgebraicGroupStrongApproximation
    ├─→ ArithmeticReductionTheory
    └─→ TamagawaMeasures  ←  AdelicFourierAnalysis
            └─→ OrthogonalTamagawaAndLatticeMass
```

`OrthogonalSpinGroups` and `IntegralLattices` name these same roadmaps as the owners of the
strong-approximation, Tamagawa and mass-formula results that neither of them claims.

---

## Worked examples and rejection tests

1. A finite index family: the restricted product is the ordinary product — this is
   `restrictedProductOfFinite`, an export and not merely a sanity check — and the integral
   subgroup is the product of the reference subgroups.
2. A change of reference family at finitely many indices gives a coordinatewise-identity
   homeomorphism.
3. The additive diagonal from a supplied family of embeddings satisfies the expected coordinate
   formula.
4. ⚠ A coordinate family preserving the reference subgroups at all but finitely many indices
   **does** induce a map of restricted products. An implementation whose constructor demands
   preservation at every index is wrong, not merely inconvenient: it rejects the maps arithmetic
   supplies.
5. ⚠ That eventual constructor does **not** carry the integral subgroup into the integral
   subgroup. Witness: `ι = ℕ`, every factor `Multiplicative ℤ`, `U i = ⊤`, `U' i = ⊤` for `i ≠ 0`
   and `U' 0 = ⊥`, `φ i` the identity. Only `restrictedProductMapOfForall` has that property.
6. ⚠ Eventual equality of reference families does not by itself transport a double-coset space;
   see §*Change of family and double cosets* for the witness.
7. ⚠ Coordinatewise continuity does not make a map into a restricted product continuous: the
   restricted-product topology is finer than the topology induced from `Π i, G i`, and in general
   strictly finer. The diagonal needs a uniform integrality set, and a construction that claims
   continuity from coordinatewise continuity alone is wrong.
8. Eventual integrality is never inferred from the existence of coordinate maps; it is always an
   argument.
9. ⚠ A coordinatewise family of **isomorphisms** that merely maps the reference subgroups into
   each other does not induce an equivalence. Witness: `ι = ℕ`, every factor `Multiplicative ℤ`,
   `φ` the identity, `U i = ⊥`, `U' i = ⊤`. Each `φ i` is an isomorphism and
   `Set.MapsTo (φ i) (U i) (U' i)` holds everywhere, but the induced map is the inclusion of the
   finitely-supported elements into `Π i, G i` and is not surjective. `Set.BijOn` is the
   hypothesis that carries the inverse; for an isomorphism it is `Set.MapsTo` in both directions.
10. ⚠ In the `Sum` splitting the summand filters are the **comaps** of the filter on `ι₁ ⊕ ι₂`,
    not `cofinite` by fiat. At `𝓟 (Set.range Sum.inl)` the right-hand comap is `⊥`, and the right
    factor is the unrestricted product `Π j, G (Sum.inr j)`. Cofinite is exactly the case where
    both comaps are cofinite again, because `Sum.inl` and `Sum.inr` are injective. An
    implementation that hard-codes `cofinite` on the summands has proved only the cofinite case
    and should say so.

## Ordering

```text
0 → 1 → 2 → 3
```

## References

- N. Bourbaki, *General Topology*, for restricted-product topology.
- A. Weil, *Basic Number Theory*, for the classical restricted-product model of the adeles.
