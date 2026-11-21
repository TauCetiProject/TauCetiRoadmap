# Roadmap: saturation, quantifier elimination and decidable theories

**Summary.** The classical model theory of fields — Tarski's real closed fields, the
Ax–Kochen–Ershov principle for henselian valued fields, Macintyre's p-adic elimination — runs on
a small common toolkit: saturated models, back-and-forth arguments, tests for quantifier
elimination and model completeness, the elementary theory of the value group, and the passage
from a complete recursive axiomatization to decidability. Mathlib has the syntax and semantics of
first-order logic, compactness, Łoś's theorem and the Löwenheim–Skolem theorems, but none of this
toolkit. This roadmap builds it, for an arbitrary first-order language.

A structure `M` is `κ`-saturated when every complete type over fewer than `κ` parameters from `M`
is realized in `M`. Every structure has a `κ`-saturated elementary extension, and a
`κ`-saturated structure contains an elementary copy of every elementarily equivalent structure of
cardinality at most `κ`. By Keisler's theorem, an ultraproduct of structures in a countable
language over an ultrafilter that is not countably complete, for instance a nonprincipal
ultrafilter on `ℕ`, is `ℵ₁`-saturated. A back-and-forth family between `M` and `N` is a nonempty
set of partial isomorphisms in which every member extends, within the family, to any further
element on either side. Every member of such a family preserves all first-order formulas, so `M`
and `N` are elementarily equivalent. This is the form in which saturation proves elementary
equivalence without the continuum hypothesis: the AKE proofs build a family of partial
isomorphisms between small substructures of saturated valued fields and verify its extension
property from saturation.

A theory eliminates quantifiers when every formula is equivalent modulo the theory to a
quantifier-free one, and it is model complete when every embedding between its models is
elementary. Quantifier elimination follows when every embedding of a finitely generated
substructure into an `ℵ₀`-saturated model extends by one element. Robinson's test characterizes
model completeness by universal formulas. The headline examples are ordered abelian groups. The
nontrivial divisible ones form a complete theory with quantifier elimination. An ordered abelian
group is elementarily equivalent to `ℤ` exactly when it is a `ℤ`-group: discretely ordered with
`[Γ : nΓ] = n` for every `n ≥ 1`. In the Presburger language, with a constant for the least
positive element and predicates for divisibility by each `n`, the theory of `ℤ` eliminates
quantifiers. Finally, a complete theory with a recursively enumerable axiomatization is
decidable, so the theories of divisible ordered abelian groups, of `ℤ`-groups and of
algebraically closed fields of fixed characteristic are decidable.

The roadmap builds on Mathlib's model theory (types, ultraproducts, elementary embeddings,
partial equivalences, `Language.order`, computability), on Tau Ceti's infinitary logic, which
supplies potential isomorphisms and Karp's theorem, and on Tau Ceti's first-order language of
groups. It takes the proof calculus and its completeness theorem from
SequentCalculusAndCutElimination. It feeds the model theory of valued fields: AxKochenErshov uses
saturation, back-and-forth families and the theory of `ℤ`-groups, and PadicallyClosedFields uses
the quantifier elimination tests, model completeness and decidability.

Layer 0 builds saturated structures and their existence. Layer 1 proves that back-and-forth
families preserve formulas. Layer 2 gives quantifier elimination and model completeness with
their tests. Layer 3 treats ordered abelian groups. Layer 4 codes formulas and derivations
effectively and proves that complete recursively enumerable theories are decidable.

## Conventions

- **Logic.** Languages, structures, formulas, theories and elementary maps are Mathlib's
  `FirstOrder.Language`, `Structure`, `BoundedFormula`, `Formula`, `Sentence`, `Theory`,
  `ElementaryEmbedding` (`↪ₑ[L]`), `ElementarilyEquivalent` (`≅[L]`) and `PartialEquiv`
  (`≃ₚ[L]`). Modelhood is `M ⊨ T`, consequence is `T ⊨ᵇ φ`, and equivalence modulo `T` is
  `φ ⇔[T] ψ`.
- **Parameters.** For `A : Set M`, formulas with parameters from `A` are formulas of `L[[A]]`, and
  `M` is an `L[[A]]`-structure with each constant naming itself. A complete `n`-type over `A` is a
  `CompleteType` of the complete `L[[A]]`-theory of `M` in the variables `Fin n`, and it is
  realized by `v : Fin n → M` when it is `typeOf v`.
- **Cardinals.** "Fewer than `κ` parameters" means `#A < κ`. Saturation is stated for
  `κ : Cardinal.{w}` with `M : Type w`; statements comparing structures in different universes use
  `Cardinal.lift`.
- **Quantifier elimination.** The declarations and names of Layer 2.1–2.2 are those of the Mathlib
  series mathlib4#41112–#41116: `Theory.IsQFEquivalent`, `Theory.HasQuantifierElimination`, and
  the criteria named in 2.2. Tau Ceti builds them now in that shape; when the series lands, the
  Tau Ceti declarations are deleted and Mathlib's used.
- **Universes of models.** Quantification over all models of `T` is over models in
  `Type (max u v)` for `L : Language.{u, v}`, as in Mathlib's `Theory.IsComplete` and
  `Theory.ModelType`. By Löwenheim–Skolem this loses nothing.
- **Ordered abelian groups are multiplicative.** An ordered abelian group is
  `[CommGroup Γ] [LinearOrder Γ] [IsOrderedMonoid Γ]`, as for Mathlib's value groups
  `(ValueGroupWithZero R)ˣ`. Its language `orderedGroup` is `Language.group.sum Language.order`:
  Tau Ceti's language of groups (`1`, `⁻¹`, `*`) and Mathlib's `≤`. The model of `ℤ` is
  `Multiplicative ℤ`, and of `ℚ` is `Multiplicative ℚ`. Divisibility is Mathlib's
  `RootableBy Γ ℕ`. Results quoted from the literature in additive notation are translated:
  `nγ` becomes `γⁿ` and `0` becomes `1`.
- **The Presburger language.** `zGroupLang` adds to `orderedGroup` one constant `ϖ` and, for every
  `n : ℕ`, a unary predicate `Dₙ`, read in an ordered group with chosen `ϖ` as
  `Dₙ(x) :↔ ∃ y, yⁿ = x`. In a `ℤ`-group, `ϖ` is the least element greater than `1`.
- **Effectivity.** Computability is Mathlib's `Primcodable`, `Computable`, `REPred` and
  `ComputablePred`. A language is effective when `Σ n, L.Functions n` and `Σ n, L.Relations n` are
  `Primcodable` with decidable equality. A theory is recursively enumerable when `REPred (· ∈ T)`
  holds for the coding of sentences of Layer 4.1, and decidable when `ComputablePred (T ⊨ᵇ ·)`
  holds.

## Layer 0: saturated structures

### 0.1 Definition

`IsSaturated κ M`: for every `A : Set M` with `#A < κ`, every complete `1`-type over `A` is
realized in `M`. API:

- monotonicity: `κ'`-saturation follows from `κ`-saturation for `κ' ≤ κ`;
- invariance under isomorphism of `L`-structures;
- for `κ ≥ ℵ₀`, every complete `n`-type over fewer than `κ` parameters is realized, for every
  finite `n`, by induction on `n`;
- for `κ ≥ ℵ₀`, every partial type over fewer than `κ` parameters that is finitely satisfiable in
  `M` is realized, since it extends to a complete type;
- a finite structure is `κ`-saturated for every `κ`.

**Checks.**

- `(ℕ, <)` is not `ℵ₀`-saturated: the type over `∅` saying "`x` has at least `n` predecessors",
  for every `n`, is finitely satisfiable and not realized.
- `(ℚ, <)` is `ℵ₀`-saturated and not `ℵ₁`-saturated: over the countable set `ℕ ⊆ ℚ`, the type
  `{n < x : n ∈ ℕ}` is not realized.
- `(ℝ, <)` is not `ℵ₁`-saturated, by the same type.

### 0.2 Universality and homogeneity

- *Extension of partial elementary maps.* Let `M` be `κ`-saturated with `κ ≥ ℵ₀`, let
  `N ≅[L] M`, and let `f` be a map from a subset `B ⊆ N` with `#B < κ` to `M` preserving all
  formulas with parameters in `B`. Then for every `b ∈ N`, `f` extends to `B ∪ {b}` preserving all
  formulas. This is the engine of the section.
- *Universality.* If `M` is `κ`-saturated, `κ ≥ ℵ₀`, `N ≅[L] M` and `#N ≤ κ`, then `N` embeds
  elementarily into `M` (Marker Lem. 4.3.17).
- *Uniqueness.* Elementarily equivalent saturated structures of the same infinite cardinality,
  `M` being `#M`-saturated, are isomorphic (Tent–Ziegler Lem. 5.2.8; Marker Thm. 4.3.20). The countable case:
  elementarily equivalent countable `ℵ₀`-saturated structures are isomorphic (Tent–Ziegler
  Lem. 4.3.3).

### 0.3 Existence

- Every structure has a `κ`-saturated elementary extension, for every `κ`. The proof is an
  elementary chain of length a regular cardinal `≥ κ`, each step realizing all types over the
  previous model (Tent–Ziegler Cor. 2.2.9), with the union an elementary extension of each member
  (Tarski's chain lemma, Tent–Ziegler Thm. 2.1.4). The chain lemma is itself a target here,
  stated for Mathlib's `DirectLimit` of a directed system of elementary embeddings.
- With the size bound: for an infinite cardinal `λ ≥ #L`, a structure of cardinality at most
  `2^λ` has a `λ⁺`-saturated elementary extension of cardinality `2^λ` (Tent–Ziegler Lem. 6.1.2).
  For every infinite `κ`, `M` has a `κ⁺`-saturated elementary extension of cardinality at most
  `#M ^ κ` (Marker Thm. 4.3.12).

### 0.4 Ultraproducts

Keisler's theorem. Let `L` have countably many symbols (`Countable L.Symbols`), let `U` be an
ultrafilter on `ι` that is not countably complete (`¬ CountableInterFilter U`), and let each
`M i` be a nonempty `L`-structure. Then `(U : Filter ι).Product M` is `ℵ₁`-saturated
(Chang–Keisler, §6.1). Corollary (Marker Exercise 4.5.37): for a nonprincipal ultrafilter on `ℕ`, which is never countably
complete, the ultraproduct is `ℵ₁`-saturated.

The proof writes a countable type as `{φₙ}`, uses a decreasing sequence `Iₙ ∈ U` with empty
intersection, and chooses at each index `i` an element realizing `φ₁, …, φₖ` for the largest `k`
with `i ∈ Iₖ` and `{φ₁, …, φₖ}` realized in `M i`. Łoś's theorem is Mathlib's
`Ultraproduct.sentence_realize` and `realize_formula_cast`.

**Checks.**

- A principal ultrafilter on `ℕ` is countably complete, and the ultrapower of `(ℕ, <)` along it is
  isomorphic to `(ℕ, <)`, which is not `ℵ₀`-saturated (0.1). The hypothesis on `U` cannot be
  dropped.
- The ultrapower of `(ℚ, <)` along a nonprincipal ultrafilter on `ℕ` realizes `{n < x : n ∈ ℕ}`,
  by the class of the sequence `(n)ₙ`.

### Dependencies

Mathlib `Theory.CompleteType`, `Theory.typeOf`, `completeTheory`, `ElementaryEmbedding`,
`Ultraproduct.sentence_realize`, `Filter.Product`, `CountableInterFilter`, `DirectLimit`,
`exists_elementaryEmbedding_card_eq`, `isSatisfiable_iff_isFinitelySatisfiable`.

## Layer 1: back-and-forth families

### 1.1 Back-and-forth families

`IsBackAndForth F`, for `F : Set (M ≃ₚ[L] N)`: `F` is nonempty; for `f ∈ F` and `m : M` there is
`g ∈ F` with `f ≤ g` and `m ∈ g.dom` (forth); for `f ∈ F` and `n : N` there is `g ∈ F` with
`f ≤ g` and `n ∈ g.cod` (back). No size condition is put on the domains.

### 1.2 Preservation of formulas

- Every `f ∈ F` is partial elementary: for every formula `φ` and every tuple `v` in `f.dom`,
  `M ⊨ φ(v) ↔ N ⊨ φ(f v)`. The proof is by induction on `φ`, the existential step using forth
  and its converse back.
- Hence `M ≅[L] N`.
- If `f ∈ F` has `f.dom = ⊤`, the embedding `f.toEmbeddingOfEqTop` is elementary.
- The relative form: if `A` is a substructure of both `M` and `N` and `F` contains a partial
  isomorphism restricting to the identity on `A`, then `M` and `N` satisfy the same sentences of
  `L[[A]]`.

### 1.3 Comparison with potential isomorphism

The restrictions of the members of a back-and-forth family to finitely generated substructures of
their domains form a potential isomorphism in the sense of Tau Ceti's
`TauCeti.PotentialIso`. With Tau Ceti's `PotentialIso.infEquivAt` and
`InfEquivAt.elementarilyEquivalent`, this gives a second proof of `M ≅[L] N`; the theorem is
`IsBackAndForth.potentialIso`.

**Checks.**

- The finite order-preserving partial maps from `ℚ` to `ℝ` form a back-and-forth family, so
  `(ℚ, <) ≅ (ℝ, <)` elementarily, though they are not isomorphic.
- `ℤ` and `ℤ ⊕ₗ ℤ` are elementarily equivalent as orders but not potentially isomorphic (Tau Ceti
  `elementarilyEquivalent_int_sumLex_int` and `not_potentialIso_int_sumLex_int`), so no
  back-and-forth family links them: the converse of 1.2 fails.

### Dependencies

Mathlib `PartialEquiv`, `PartialEquiv.toEquiv`, `PartialEquiv.toEmbeddingOfEqTop`,
`Substructure.closure`; Tau Ceti `TauCeti.PotentialIso`, `PotentialIso.infEquivAt`,
`InfEquivAt.elementarilyEquivalent`.

## Layer 2: quantifier elimination and model completeness

### 2.1 Quantifier elimination

`Theory.IsQFEquivalent T φ`: there is a quantifier-free `ψ` with `φ ⇔[T] ψ`.
`Theory.HasQuantifierElimination T`: every `φ : L.Formula α` is `T.IsQFEquivalent`. API:

- quantifier elimination passes to `T ∪ T'` for `T'` a set of sentences;
- with quantifier elimination, every formula with parameters from a model is equivalent in that
  model to a quantifier-free one with the same parameters;
- every embedding between models of a theory with quantifier elimination is elementary.

### 2.2 The Mathlib criteria

Built here with the names and statements of mathlib4#41114–#41115:

- `hasQuantifierElimination_iff_finite_isQFEquivalent`: finitely many free variables suffice;
- `hasQuantifierElimination_iff_ex_isQFEquivalent_of_isQF`: elimination of one existential
  quantifier from quantifier-free formulas suffices (Tent–Ziegler Lem. 3.2.4);
- `isQFEquivalent_iff_realize_iff_of_embeddings`: `φ` is equivalent to a quantifier-free formula
  if and only if its truth is preserved between models embedding a common structure;
- `hasQuantifierElimination_of_exists_realize_of_embeddings`: the witness-transfer criterion
  (Tent–Ziegler Thm. 3.2.5);
- `IsElementaryExtensionPair` and its finitely generated and `< κ`-generated forms, with
  `hasQuantifierElimination_of_isElementaryExtensionPair` and its two variants.

### 2.3 The saturated extension test

`T` has quantifier elimination if, for all models `M`, `N` of `T` with `N` `ℵ₀`-saturated, every
embedding `f : A ↪[L] N` of a finitely generated substructure `A ≤ M` extends, for every `m : M`,
to an embedding of `A ⊔ closure {m}`. The converse holds as well. The proof applies the
witness-transfer criterion of 2.2 after replacing `N` by an `ℵ₀`-saturated elementary extension
(0.3).

### 2.4 Completeness from quantifier elimination

A satisfiable theory with quantifier elimination is complete if any two of its models contain
isomorphic substructures, in particular if the language has a constant and the substructures
generated by the constants are isomorphic in all models (Tent–Ziegler Lem. 3.2.2).

### 2.5 Model completeness

`IsModelComplete T`: every embedding between models of `T` is elementary.

- *Robinson's test* (Tent–Ziegler Lem. 3.2.7; Marker Exercise 3.4.12(b), (d)). The following are equivalent: `T` is model
  complete; for every embedding `M ↪ N` of models of `T`, an existential formula with parameters
  from `M` that holds in `N` holds in `M`; every formula is equivalent modulo `T` to a universal
  formula (Mathlib `BoundedFormula.IsUniversal`); every formula is equivalent modulo `T` to an
  existential one.
- Quantifier elimination implies model completeness (Marker Prop. 3.1.14).
- A theory is model complete if and only if `T ∪ diag(M)` is complete for every model `M`, where
  `diag(M)` is the atomic diagram.

### 2.6 Completeness from model completeness

A model complete theory with a model that embeds into every model is complete (Marker
Prop. 3.1.15).

### 2.7 Model companions

A theory `T*` is a model companion of `T` when it is model complete and every model of either
theory embeds into a model of the other (Tent–Ziegler Def. 3.2.8). A model companion is unique up
to equivalence of theories (Tent–Ziegler Thm. 3.2.9).

**Checks.**

- The theory of `(ℤ, <)` does not eliminate quantifiers in `Language.order`: "there is no `z`
  with `x < z < y`" is not equivalent to a quantifier-free formula, since `(0, 1)` and `(0, 2)`
  satisfy the same quantifier-free formulas.
- The theory of `ℤ` as an ordered group (`orderedGroup`) is not model complete: the inclusion
  `Multiplicative (2ℤ) ↪ Multiplicative ℤ` is an embedding of models, since `2ℤ ≅ ℤ`, and the
  image of the least element `> 1` of `2ℤ` is not least in `ℤ`. In `zGroupLang` this inclusion is
  not an embedding, since it does not preserve `ϖ`.
- Dense linear orders without endpoints: quantifier elimination agrees with mathlib4#41116.

### Dependencies

Mathlib `BoundedFormula.IsQF`, `IsUniversal`, `IsExistential`, `Theory.Iff`, `Theory.IsComplete`,
`Substructure.FG`, `Substructure.closure`; Layer 0.3.

## Layer 3: ordered abelian groups

### 3.1 The language and the theory

`orderedGroup := Language.group.sum Language.order`, and `orderedGroupStructure Γ` the structure
of an ordered group from Tau Ceti's `TauCeti.Group.structureOfGroup` and Mathlib's
`orderStructure`. `Theory.orderedAbelianGroup` axiomatizes ordered abelian groups: Tau Ceti's
`Theory.group` along `LHom.sumInl`, commutativity, Mathlib's `linearOrderTheory` for the sum
language, and `x ≤ y → x * z ≤ y * z`. The bridge, in both directions: a model of
`Theory.orderedAbelianGroup` is an ordered abelian group with the given operations and order,
and an ordered abelian group is a model.

### 3.2 Divisible ordered abelian groups

`Theory.doag` adds nontriviality and, for each `n ≥ 1`, `∀ x ∃ y, yⁿ = x`. Its models are the
nontrivial ordered abelian groups with `RootableBy Γ ℕ`.

- `Theory.doag` eliminates quantifiers. One existential quantifier over a conjunction of literals
  `xᵏ·t = 1`, `xᵏ·t ≤ 1` and their negations reduces, after taking `k`-th roots, to an interval
  condition.
- `Theory.doag` is complete (Marker Cor. 3.1.17); its complete theory is that of `Multiplicative ℚ`, and of
  `Multiplicative ℝ`.
- It is model complete.

### 3.3 `ℤ`-groups

`IsZGroup Γ`: there is `ϖ > 1` below every element greater than `1`, and for every `n > 0` every
element is `ϖᵏ·δⁿ` for some `k < n`. Then `[Γ : Γⁿ] = n` with coset representatives
`1, ϖ, …, ϖⁿ⁻¹`, since a power `ϖᵏ = δⁿ` with `0 < k < n` would force `ϖ ≤ δ` and `δⁿ > ϖᵏ`.
`Theory.zGroup` axiomatizes `ℤ`-groups in `orderedGroup`, with the least element `ϖ` existentially
quantified in each axiom.

- In `zGroupLang`, with `ϖ` interpreted as the least element `> 1` and `Dₙ` as in the
  conventions, the theory of `ℤ`-groups eliminates quantifiers (Presburger; Marker Cor. 3.1.21). The reduction
  normalizes `xᵏ` coefficients to a common `k`, after which divisibility conditions `Dₙ` and
  bounds on `x` are solved by a finite search modulo the lcm of the moduli.
- The theory of `ℤ`-groups is complete in `zGroupLang` and in `orderedGroup`, and `Multiplicative
  ℤ` is its prime model: it embeds into every `ℤ`-group, and in `zGroupLang` the embedding is
  elementary.
- `Γ ≅[orderedGroup] Multiplicative ℤ ↔ IsZGroup Γ`. The `ℤ`-groups are Robinson–Zakon's
  regularly discrete groups (Def. 3.3(iii)), whose axioms are complete (Thm. 4.4), so that all of
  them are elementarily equivalent (Thm. 4.7).
- The theory of `ℤ`-groups in `zGroupLang` is model complete.

### 3.4 Definability in `ℤ`-groups

In a `ℤ`-group, every subset of `Γ` definable in `zGroupLang` with parameters is a finite Boolean
combination of intervals and cosets of `Γⁿ`. The definable subsets of `Γ` are already
quantifier-free definable in `zGroupLang`, and those of `Multiplicative ℤ` are, transported along
`Multiplicative.toAdd`, the sets that are ultimately periodic in both directions. Consequently a
subset of `ℕ` is definable in Mathlib's `presburger` structure on `ℕ` if and only if its image in
`ℤ` is definable in `zGroupLang`; with Mathlib's `presburger.definable₁_iff_ultimately_periodic`,
both mean ultimately periodic.

**Checks.**

- `Multiplicative (ℤ ×ₗ ℤ)`, lexicographic, is discretely ordered but not a `ℤ`-group: its index
  `[Γ : Γ²]` is `4`.
- `Multiplicative (ℚ ×ₗ ℤ)`, lexicographic with `ℚ` dominant, is a `ℤ`-group not isomorphic to
  `Multiplicative ℤ`, since it is not archimedean. So it is elementarily equivalent to `ℤ`.
- The even integers are not quantifier-free definable with parameters in `ℤ` as an ordered group:
  quantifier-free definable subsets there are finite unions of intervals. The predicates `Dₙ` are
  needed for quantifier elimination (Marker Exercise 3.4.10).
- `Multiplicative ℝ` and `Multiplicative ℚ` are elementarily equivalent as ordered groups (3.2),
  and neither is a `ℤ`-group.

### Dependencies

Tau Ceti `Language.group`, `TauCeti.Group.structureOfGroup`, `Theory.group`, `model_group`;
Mathlib `Language.order`, `orderStructure`, `linearOrderTheory`, `Language.sumStructure`,
`RootableBy`, `IsOrderedMonoid`, `presburger.definable₁_iff_ultimately_periodic`; Layer 2.

## Layer 4: effective theories and decidability

### 4.1 Effective codings

For an effective language, `Primcodable` instances on `L.Term α`, `Σ n, L.BoundedFormula α n`,
`L.Formula α` and `L.Sentence` for `Primcodable α`, built on Mathlib's `Term.listEncode` and
`BoundedFormula.listEncode`. The constructors (`equal`, `rel`, `imp`, `all`, `falsum`), `not`,
`relabel`, `toFormula` and the substitution of SequentCalculusAndCutElimination's `inst` are
primitive recursive, and `IsQF` and `IsAtomic` are decidable by computable predicates.

### 4.2 Consequences of an enumerable theory

If `T` is recursively enumerable, then so is `{φ : L.Sentence | T ⊨ᵇ φ}`. The proof enumerates
pairs of a finite `T₀ ⊆ T` and a cut-free derivation of the sequent `T₀ ⇒ φ`, using
SequentCalculusAndCutElimination's completeness for theories
(`models_iff_exists_cutRank_eq_zero`). The targets here are a `Primcodable` coding of
`Σ Γ Δ, LKDerivation Γ Δ` and the computability of its end sequent and cut rank.

### 4.3 Complete enumerable theories are decidable

If `T` is complete and recursively enumerable, then `ComputablePred (T ⊨ᵇ ·)`. For each `φ`
exactly one of `T ⊨ᵇ φ` and `T ⊨ᵇ ∼φ` holds, both sets are recursively enumerable by 4.2, and
Mathlib's `ComputablePred.computable_iff_re_compl_re` applies.

### 4.4 Examples

- `Theory.doag` and `Theory.zGroup` (in `orderedGroup` and in `zGroupLang`) are recursively
  enumerable, hence decidable by 3.2, 3.3 and 4.3.
- Mathlib's `Theory.ACF p`, for `p` prime or `0`, is recursively enumerable, and with Mathlib's
  `ACF_isComplete` it is decidable.

**Checks.**

- The `Primcodable` instance on `L.Term α` of 4.1 has the same `encode` as Mathlib's
  `Encodable (L.Term α)`.
- A complete theory that is not recursively enumerable need not be decidable: the theory of a
  structure with one unary predicate `Pₙ` for each `n`, true of one element exactly when `n` lies
  in a fixed non-computable set, is complete and undecidable.

### Dependencies

Mathlib `Primcodable`, `Computable`, `REPred`, `ComputablePred`,
`ComputablePred.computable_iff_re_compl_re`, `Term.listEncode`, `BoundedFormula.listEncode`,
`Theory.ACF`, `ACF_isComplete`; SequentCalculusAndCutElimination `LKDerivation`,
`LKDerivation.cutRank`, `models_iff_exists_cutRank_eq_zero`, `inst`; Layers 2 and 3.

## Downstream consumers

- **AxKochenErshov.** Layer 0 (saturated elementary extensions, universality, Keisler's theorem),
  Layer 1 (back-and-forth families give elementary equivalence and elementary embeddings), and
  Layer 3 (the theory of `ℤ`-groups, for the value group of `ℚ_p`), with Layer 4 for the
  decidability of `Th(ℚ_p)`.
- **PadicallyClosedFields.** Layer 2 (the saturated extension test for Macintyre's elimination,
  model completeness and Robinson's test) and Layer 4.
- **LogicAndDefinabilityInNumberTheory.** Its §4.31 takes `IsModelComplete` and Robinson's test
  from 2.5. Layer 0.4 serves the ultraproduct arguments of its transfer theorems, if it adopts it.

## Scope and ownership

This roadmap owns, for arbitrary first-order languages: saturated structures, their existence and
universality, Keisler's theorem on ultraproducts, back-and-forth families, the saturated extension
test, model completeness with Robinson's test, model companions, the theories of ordered abelian
groups in Layer 3, the effective coding of formulas and derivations, and decidability of complete
recursively enumerable theories.

Boundaries:

- **Mathlib** owns first-order syntax and semantics, compactness, Łoś's theorem, Löwenheim–Skolem,
  complete types, elementary embeddings and substructures, partial equivalences, Fraïssé theory,
  the completeness of `Theory.ACF`, and Presburger definability on `ℕ`
  (`presburger.definable_iff_isSemilinearSet`).
- **mathlib4#41112–#41116** own the design of quantifier elimination and its criteria
  (Layer 2.1–2.2) and the elimination for dense linear orders. Tau Ceti builds 2.1–2.2 in their
  shape and adopts Mathlib's declarations when they land.
- **Tau Ceti's infinitary logic** (Completed/InfinitaryLogic, CountableModelCounting,
  InfinitaryModelExistence) owns `L∞ω`, Scott sentences, potential isomorphisms and Karp's
  theorem. Layer 1 is the first-order form and is compared with them in 1.3.
- **SequentCalculusAndCutElimination** owns the sequent calculus, its soundness and completeness,
  and cut elimination. Layer 4 adds only codings and computability.
- **RealAlgebraicGeometry** owns real semialgebraic geometry and its quantifier elimination over
  `ℝ`. No field theory is treated here.
- **LogicAndDefinabilityInNumberTheory** owns interpretations, the Denef–Pas language and its
  relative elimination, and existential closure of an embedding as a named predicate (its §4.31).
  Robinson's test in 2.5 states that condition inline.

## Exact supplier contracts

### From Mathlib

- `FirstOrder.Language.Theory.CompleteType`, `Theory.typeOf`, `Language.completeTheory`,
  `Theory.IsComplete`, `Theory.isComplete_iff_models_elementarily_equivalent`,
  `Theory.isSatisfiable_iff_isFinitelySatisfiable`, `Theory.Iff` (`⇔[T]`).
- `ElementaryEmbedding`, `ElementarilyEquivalent`, `exists_elementaryEmbedding_card_eq`,
  `ElementaryEmbedding.ofModelsElementaryDiagram`, `DirectLimit`.
- `Filter.Product` with its `Structure`, `Ultraproduct.sentence_realize`,
  `Ultraproduct.realize_formula_cast`, `CountableInterFilter`.
- `PartialEquiv`, `PartialEquiv.toEquiv`, `PartialEquiv.toEmbeddingOfEqTop`, `FGEquiv`,
  `IsExtensionPair`, `Substructure.FG`, `Substructure.closure`.
- `BoundedFormula.IsQF`, `IsAtomic`, `IsUniversal`, `IsExistential`, `Term.listEncode`,
  `BoundedFormula.listEncode`.
- `Language.order`, `orderStructure`, `linearOrderTheory`, `Language.sumStructure`, `dlo`.
- `RootableBy`, `IsOrderedMonoid`, `Multiplicative`.
- `Primcodable`, `REPred`, `ComputablePred`, `ComputablePred.computable_iff_re_compl_re`.
- `Theory.ACF`, `ACF_isComplete`, `presburger.definable₁_iff_ultimately_periodic`.

### From the Mathlib quantifier elimination series

mathlib4#41112–#41116 (shape only): `Theory.IsQFEquivalent`, `Theory.HasQuantifierElimination`,
`hasQuantifierElimination_iff_finite_isQFEquivalent`,
`hasQuantifierElimination_iff_ex_isQFEquivalent_of_isQF`,
`isQFEquivalent_iff_realize_iff_of_embeddings`,
`hasQuantifierElimination_of_exists_realize_of_embeddings`, `IsElementaryExtensionPair`,
`IsElementaryExtensionPairFG`, `IsElementaryExtensionPairCardinalLTGenerated`.

### From Tau Ceti

- `FirstOrder.Language.group`, `TauCeti.Group.structureOfGroup`, `Theory.group`,
  `TauCeti.Group.model_group` (`TauCeti/ModelTheory/Algebra/Group/Basic.lean`).
- `TauCeti.PotentialIso` (`TauCeti/ModelTheory/BackAndForth/PotentialIso.lean`),
  `PotentialIso.infEquivAt`, `InfEquivAt.elementarilyEquivalent`, `karp_theorem`
  (`TauCeti/ModelTheory/BackAndForth/Karp.lean`).
- `elementarilyEquivalent_int_sumLex_int`, `not_potentialIso_int_sumLex_int`
  (`TauCeti/ModelTheory/BackAndForth/DiscreteOrder.lean`), for the Checks of Layer 1.

### From SequentCalculusAndCutElimination

`LKDerivation`, `LKDerivation.cutRank`, `LKDerivation.sound`, `inst`, and its completeness for
theories `models_iff_exists_cutRank_eq_zero`: `T ⊨ᵇ φ` if and only if for some finite `T₀ ⊆ T`
the sequent `T₀ ⇒ φ` has a cut-free derivation.

## References

- K. Tent and M. Ziegler, *A Course in Model Theory*, Lecture Notes in Logic 40, Cambridge, 2012.
  Cited: Thm. 2.1.4, Cor. 2.2.9, Lem. 3.2.2, Lem. 3.2.4, Thm. 3.2.5, Lem. 3.2.7, Def. 3.2.8,
  Thm. 3.2.9, Lem. 4.3.3, Def. 5.2.7, Lem. 5.2.8, Lem. 6.1.2.
- C. C. Chang and H. J. Keisler, *Model Theory*, 3rd ed., North-Holland, 1990, §6.1.
- H. J. Keisler, Ultraproducts and saturated models, *Indag. Math.* 26 (1964), 178–186.
- D. Marker, *Model Theory: An Introduction*, GTM 217, Springer, 2002. Cited: Prop. 3.1.14,
  Prop. 3.1.15, Cor. 3.1.17, Cor. 3.1.21, Exercises 3.4.10 and 3.4.12, Thm. 4.3.12, Lem. 4.3.17,
  Thm. 4.3.20, Exercise 4.5.37.
- M. Presburger, Über die Vollständigkeit eines gewissen Systems der Arithmetik ganzer Zahlen,
  in welchem die Addition als einzige Operation hervortritt, *Comptes Rendus du I Congrès des
  Mathématiciens des Pays Slaves*, Warsaw, 1929.
- A. Robinson and E. Zakon, Elementary properties of ordered abelian groups, *Trans. Amer. Math.
  Soc.* 96 (1960), 222–236. Cited: Def. 3.3, Thms. 4.4 and 4.7.
- A. Robinson, *Complete Theories*, North-Holland, 1956.
