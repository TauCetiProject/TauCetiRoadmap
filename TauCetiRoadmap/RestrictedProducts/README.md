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

- the everywhere-integral subgroup of a restricted product, its openness from coordinatewise
  openness, and its compactness from coordinatewise compactness alone;
- families of compact open subgroups as explicit parameters, never as a hidden global choice;
- componentwise maps between restricted products from **eventual** preservation of the reference
  subgroups, with their evaluation, identity, composition and continuity laws, and the
  everywhere-preserving constructor as a corollary;
- the canonical equivalence for two reference families that agree outside a finite set, with its
  coordinate formula, coherence laws, naturality, and the double-coset caveat below;
- reindexing along an equivalence of index types, with coordinate formulas both ways;
- the away-`S` restriction and, for finite `S`, the decomposition into a product over `S` times
  the away-`S` restricted product, with the coordinate formulas of the map and of its inverse;
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
| change of family | The equivalence for families agreeing outside a finite set is coordinatewise the identity in both directions, and carries a pinned evaluation theorem. It transports the ambient group only; see §*Change of family and double cosets*. |
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
| `integralSubgroup` | 0 | the elements lying in the chosen subgroup at every index |
| `mem_integralSubgroup` | 0 | its membership criterion |
| `isOpen_integralSubgroup` | 0 | openness from coordinatewise openness |
| `isCompact_integralSubgroup` | 0 | compactness from coordinatewise compactness alone |
| `CompactOpenSubgroups` | 0 | a family of compact open subgroups, one per factor |
| `restrictedProductMap` | 1 | the componentwise homomorphism, from eventual preservation |
| `restrictedProductMap_apply` | 1 | its exact coordinate formula |
| `continuous_restrictedProductMap` | 1 | continuity from coordinatewise continuity |
| `restrictedProductMapOfForall` | 1 | the everywhere-preserving corollary |
| `restrictedProductMapOfForall_apply` | 1 | its coordinate formula |
| `restrictedProductMap_id`, `restrictedProductMap_comp` | 1 | identity and composition, both with eventual hypotheses |
| `mapsTo_integralSubgroup_of_forall` | 1 | the everywhere-preserving map respects the integral subgroup |
| `not_forall_mapsTo_integralSubgroup` | 1 | ⚠ the eventual one does not |
| `restrictedProductCongr` | 1 | the equivalence for families agreeing outside a finite set |
| `restrictedProductCongr_apply`, `restrictedProductCongr_symm_apply` | 1 | both directions are coordinatewise the identity |
| `continuous_restrictedProductCongr`, `continuous_restrictedProductCongr_symm` | 1 | it is a homeomorphism |
| `restrictedProductCongr_refl`, `restrictedProductCongr_symm`, `restrictedProductCongr_trans` | 1 | coherence laws |
| `restrictedProductCongr_naturality` | 1 | compatibility with componentwise maps |
| `doubleCosetCongr` | 1 | the induced bijection of double-coset spaces, along transported subgroups |
| `exists_map_integralSubgroup_ne` | 1 | ⚠ why `doubleCosetCongr` cannot use `integralSubgroup U'` |
| `restrictedProductReindex` | 1 | reindexing along an equivalence of index types |
| `restrictedProductReindex_apply`, `restrictedProductReindex_symm_apply` | 1 | coordinate formulas for both directions |
| `continuous_restrictedProductReindex`, `continuous_restrictedProductReindex_symm` | 1 | it is a homeomorphism |
| `RestrictedProductGroup` | 2 | the restricted product relative to a reference family |
| `RestrictedProductGroupAway` | 2 | the restricted product over the indices outside `S` |
| `RestrictedProductGroupWithFactor` | 2 | a restricted product times an unrestricted distinguished factor |
| `restrictAway`, `restrictAway_apply` | 2 | restriction away from `S`, with its coordinate formula |
| `restrictAway_restrictAway` | 2 | compatibility for nested index sets |
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

**0.1 Integral subgroup.** Define the everywhere-integral subgroup inside a restricted product and
prove its membership criterion. Prove it open when every reference subgroup is open — this is
Mathlib's `isOpen_forall_mem` — and compact when every reference subgroup is compact. Compactness
takes no openness hypothesis: the integral subgroup is the range of Mathlib's `structureMap`,
which is an embedding for any family, so compactness of each `U i` suffices.

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

**1.2 Change of reference family.** Construct the equivalence of two restricted products whose
reference families agree outside a finite set. It is coordinatewise the identity in both
directions. Prove the evaluation equations, continuity in both directions, reflexivity, symmetry,
composition, and naturality with componentwise maps.

**1.3 Reindexing.** Construct the equivalence induced by an equivalence `e : ι' ≃ ι` of index
types, with `x` sent to `j ↦ x (e j)`. Pin the inverse by its values at `e j`, and prove
continuity both ways.

### Layer 2: packaging and the away-`S` decomposition

**2.1 Names.** `RestrictedProductGroup U` is the restricted product relative to `U`;
`RestrictedProductGroupAway S U` is the same construction at the index type `{i // i ∉ S}`;
`RestrictedProductGroupWithFactor H U` is `H × RestrictedProductGroup U`, where `H` carries no
integrality condition.

**2.2 Restriction.** Construct `restrictAway`, prove its coordinate formula, and prove that
restriction away from a larger set factors through a smaller one.

**2.3 Decomposition.** For finite `S`, prove that the restricted product is a
`RestrictedProductGroupWithFactor` with distinguished factor `Π i : S, G i`, and that the
equivalence is a homeomorphism. The four coordinate formulas of §*The three equivalences* are part
of this milestone, not conveniences added afterwards.

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

1. A finite index family: the restricted product is the ordinary product, and the integral
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

## Ordering

```text
0 → 1 → 2 → 3
```

## References

- N. Bourbaki, *General Topology*, for restricted-product topology.
- A. Weil, *Basic Number Theory*, for the classical restricted-product model of the adeles.
