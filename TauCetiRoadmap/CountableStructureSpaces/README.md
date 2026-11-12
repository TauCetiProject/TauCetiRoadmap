# Roadmap: spaces of countable structures and the López–Escobar theorem

Fix the carrier of a countable structure to be ℕ. In a countable relational language a structure
is then the same thing as the set of relation queries it answers positively, so the structures
form a compact Polish space, a countable power of `Bool`. The infinite symmetric group
S∞ = `Equiv.Perm ℕ` acts continuously on this space by relabelling. Its orbits are exactly the
isomorphism classes, and the invariant Borel sets are the natural classes of countable structures.

This roadmap builds that space and its basic invariant descriptive set theory. The summit is
**López–Escobar's theorem**: a class of countable structures is Borel and isomorphism invariant
if and only if it is the class of models of a single Lω₁ω sentence. On the way it proves that
satisfaction and back-and-forth equivalence are Borel, that isomorphism is Borel on any model
class of bounded Scott height, that every isomorphism class is Borel, and that the class of
coded well-orders is not Borel.

Mathlib supplies the ambient descriptive set theory: `PolishSpace`, `StandardBorelSpace`,
`MeasureTheory.AnalyticSet` with Lusin's separation theorem and Suslin's theorem, trees
(`Descriptive.tree`), group actions (`MulAction.orbitRel`, `fixingSubgroup`, `arrowAction`) and
`MeasurableSpace.invariants`. The [InfinitaryLogic roadmap](../../Completed/InfinitaryLogic/README.md),
implemented in Tau Ceti, supplies Lω₁ω, back-and-forth equivalence, Karp's theorem, Scott
sentences and the internal Scott rank. At Tau Ceti revision `2fd255d99`, Tau Ceti also
has the coding space `RelationalConfiguration` with decoding, encoding, transport, its topology
and Polish structure; the pointwise topology on `Equiv.Perm α` with S∞ as a Polish group; the logic
action; model classes with Borel satisfaction; the isomorphism and back-and-forth setoids with
Borel back-and-forth levels; and most of the external Scott height. Those declarations are
consumed here (see [ownership](#existing-library-and-ownership)) and the remaining targets are
stated over them. Neither Mathlib nor Tau Ceti has the tree material of Layer 3, López–Escobar's
theorem or the results on the well-order class.

The reusable material is part of the specification: the coding space on an arbitrary carrier;
the permutation group of a countable discrete set as a Polish group; measurable satisfaction;
Borel back-and-forth equivalence; the external Scott height with its two-sided comparison with the
internal rank; well-founded trees, their heights, the Kleene–Brouwer order and the boundedness
theorem; the tree representation of analytic sets; projective (PC) presentations of invariant
analytic classes; and invariant analytic separation.

## Scope and dependency order

Every layer below is required. Each is a full development: the objects, their API, the named
milestones and an acceptance check that compiles without later layers.

| Layer | Construction and endpoint | Inputs |
| --- | --- | --- |
| 0 | The coding space `RelationalConfiguration L α` (Tau Ceti): decoding, encoding, transport, topology, Polish and standard Borel structure, the query code, graph codes | Mathlib; Tau Ceti |
| 1 | The pointwise topology on `Equiv.Perm α`, S∞ as a Polish group, the logic action, orbits = isomorphism classes, invariance and the invariant σ-algebra | 0; Mathlib group actions; BorelEquivalenceRelations (products of analytic sets) |
| 2 | Satisfaction and model classes `modelsOf φ`: Borel, invariant, standard Borel; Gδ model classes | 0–1; InfinitaryLogic Layer 0; BorelEquivalenceRelations (Gδ subspaces) |
| 3 | Trees: bodies, well-foundedness, heights, Kleene–Brouwer, the boundedness theorem, tree representations of analytic sets | 0; Mathlib analytic sets and `Descriptive.tree` |
| 4 | Borel back-and-forth equivalence, the isomorphism relation, Borel isomorphism classes, the external Scott height, Borel isomorphism under bounded height, forced back-and-forth trees and uniform separation | 1–3; InfinitaryLogic Layers 1–3 |
| 5 | López–Escobar: PC sentences of trees, both directions, the action form, the invariant σ-algebra, invariant analytic classes as PC classes | 2–4; InfinitaryModelExistence PC-separation |
| 6 | Invariant analytic separation; the well-order class: boundedness, not analytic, not Borel, coded undefinability | 1–5; BorelEquivalenceRelations (invariant Lusin separation) |

Besides Mathlib and Tau Ceti, the layers consume four general lemmas of the sibling roadmap
[BorelEquivalenceRelations](../BorelEquivalenceRelations/README.md) (Layers 1, 2 and 6) and one theorem of the sibling roadmap
[InfinitaryModelExistence](../InfinitaryModelExistence/README.md) (Layer 5), all stated exactly under
[ownership](#existing-library-and-ownership). In Layer 6 only `exists_sentence_separating` uses
Layer 5; the well-order results use Layers 0–3 and the easy direction of López–Escobar.

## Conventions

1. **Languages.** The core is relational languages `L : FirstOrder.Language.{u, v}` in arbitrary
   universes. Carry `[L.IsRelational]` and `[∀ n, Countable (L.Relations n)]` (Tau Ceti's form,
   equivalent to countability of `Σ l, L.Relations l`) as separate, explicit instance arguments, and only where a statement needs them; there is no bundled
   countable-language class. Decoding a code needs `[L.IsRelational]`. The topology and the
   σ-algebra of the coding space exist for every language; Polishness, standard Borelness and
   the passage from Borel to analytic sets need countably many relation symbols and a countable
   carrier. Measurability of satisfaction needs only a relational language and a countable carrier.
2. **Codes.** The coding space is Tau Ceti's `RelationalConfiguration L α`, a type synonym (a
   `def`) for `Atom L α → Bool`, where `Atom L α := Σ n, L.Relations n × (Fin n → α)` and
   `atom R x` is the atom of `R` on `x`; a code is read with `c.eval (atom R x)`. Its instances are
   declared on the synonym. There is no abbreviation for the carrier `ℕ`; write
   `RelationalConfiguration L ℕ`. Finite carriers `Fin n` are instances of the same construction,
   not a second one.
3. **The logic action.** `Equiv.Perm α` acts on codes by Tau Ceti's relabelling action
   (`σ • c = c.restrict σ⁻¹`), so `(σ • c).eval (atom R v) = c.eval (atom R (σ⁻¹ ∘ v))`. With this convention `σ` is an
   isomorphism from the structure named by `c` to the one named by `σ • c`, and orbits are
   isomorphism classes. Fix the inverse before building any invariance or measurability API on it.
4. **Topology on permutations.** For `[TopologicalSpace α] [DiscreteTopology α]`, `Equiv.Perm α`
   carries Tau Ceti's topology, induced by `σ ↦ (σ, σ⁻¹)` into `(α → α) × (α → α)`. This is the topology
   of pointwise convergence; the inverse coordinate adds no open sets (Layer 1 acceptance lemma)
   but makes the embedding closed. S∞ is the case `α = ℕ`. No other topology is put on
   `Equiv.Perm α`.
5. **Borel.** "Borel" means `MeasurableSet` for the product σ-algebra. Under the countability
   hypotheses the `BorelSpace` instance identifies it with the Borel σ-algebra of the Polish
   topology; state results as `MeasurableSet` and let the instance do the identification. With
   uncountably many atoms (for instance uncountably many relation symbols on the carrier `ℕ`) the
   two differ: the topology is compact but not metrizable, and its Borel σ-algebra is strictly
   larger (a single code is closed but depends on uncountably many coordinates). Every statement
   here, including López–Escobar for arbitrary relational languages, means the product σ-algebra.
6. **Invariance.** Action invariance of `B` is Mathlib's
   `MulAction.IsFixedBlock (Equiv.Perm α) B`: `σ • B = B` for every `σ`, equivalently
   `(σ • ·) ⁻¹' B = B`. Mathlib's `isInvariantBlock_iff_isFixedBlock` identifies it with the
   one-sided `MulAction.IsInvariantBlock`, the form Tau Ceti states its results in; there is no
   separate invariance predicate. `IsomorphismInvariant B` is Tau Ceti's
   `RelationalConfiguration.IsomorphismInvariant`: membership passes to every code naming an
   isomorphic structure. The two coincide (Layer 1). The invariant σ-algebra is
   `⨅ σ, MeasurableSpace.invariants (σ • ·)`, Mathlib's single-map construction taken over the
   group; there is no new σ-algebra constructor.
7. **Ordinals.** `ω₁` is `Ordinal.omega 1`. Back-and-forth levels and tree heights for codes live
   in `Ordinal.{0}`; ordinals attached to a structure `M : Type w` live in `Ordinal.{w}`, as the
   internal Scott rank does. Bounds below `ω₁` are explicit hypotheses `β < Ordinal.omega 1`.
8. **External Scott height.** `StabilizesCompletely M β` holds when for every countable structure
   `N : Type`, every `n` and all `a : Fin n → M`, `b : Fin n → N`, `BFEquiv β n a b` implies
   `BFEquiv (succ β) n a b`. Then `scottHeight M := sInf {β | StabilizesCompletely M β}` in
   `Ordinal.{w}`. Both are Tau Ceti's (`TauCeti.StabilizesCompletely`, which writes `β + 1` and
   allows the level in any ordinal universe, and `TauCeti.scottHeight`). Finite `N` are included, and this matters: a countably infinite pure set has
   height `ω`, but would have height `0` if only infinite `N` were allowed. Taking `N` in `Type`
   is no restriction, since every countable structure is isomorphic to one in `Type` and
   `BFEquiv` is invariant under isomorphism; Layer 4 records this as a lemma.
   The internal objects `SelfStabilizesCompletely`, `selfStabilizationOrdinal` (written s(M)) and
   `internalScottRank` (written SR(M)) are Tau Ceti's implementations of the InfinitaryLogic
   roadmap's, unchanged. Like Tau Ceti's `BFEquiv`, they are defined for relational languages.
9. **Trees.** A tree is Mathlib's `Descriptive.tree A`. Its body is the set of `x : ℕ → A` all of
   whose initial segments lie in it, named and stated as in Mathlib #41946 (`initialSegment`,
   `body`). A tree is well-founded when its body is empty. Its height is the strict supremum of the
   ranks of its nodes under strict extension, so the empty tree has height `0` and the root alone
   height `1`.
10. **Sentences.** Sentences are Tau Ceti's `L.Sentenceω`, satisfaction is
   `SentenceInf.Realize φ M` (dot notation does not elaborate on `L.Sentenceω`), and the model class
   of `φ` on the carrier `α` is Tau Ceti's `modelsOf φ : Set (RelationalConfiguration L α)`
   (stated there for sentences with any index type), written Mod(φ).

## Existing library and ownership

The following are suppliers, not requests to rebuild their objects.

| Supplier | Consumed material |
| --- | --- |
| [Mathlib Polish spaces](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Topology/MetricSpace/Polish.lean) | `PolishSpace`, `IsClosed.polishSpace`, `IsOpen.polishSpace`, `Topology.IsClosedEmbedding.polishSpace`, `PolishSpace.IsClopenable` |
| [Mathlib analytic and standard Borel sets](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/MeasureTheory/Constructions/Polish/Basic.lean) | `StandardBorelSpace`, `MeasureTheory.AnalyticSet`, `analyticSet_empty`, `AnalyticSet.image_of_continuous`, `AnalyticSet.iUnion`, `AnalyticSet.iInter`, `MeasurableSet.analyticSet`, `AnalyticSet.measurablySeparable` (Lusin), `AnalyticSet.measurableSet_of_compl` (Suslin), `MeasurableSet.standardBorel`, `MeasurableSet.isClopenable`, `MeasurableSet.image_of_continuousOn_injOn` |
| [Mathlib descriptive trees](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/SetTheory/Descriptive/Tree.lean) | `Descriptive.tree`, its prefix-closure API and `take_mem` |
| Mathlib group actions | `Equiv.Perm.applyMulAction`, `arrowAction`, `MulAction.orbitRel`, `MulAction.stabilizer`, `fixingSubgroup`, `IsTopologicalGroup`, `ContinuousSMul` |
| Mathlib measurable spaces | `MeasurableSpace.pi`, `MeasurableSpace.invariants`, `MeasurableSpace.measurableSet_iInf`, the measurable space on `SimpleGraph V` (`Mathlib/MeasureTheory/Constructions/SimpleGraph.lean`) |
| Mathlib model theory | `Structure`, `Language.Equiv`, `Equiv.inducedStructure`, `Language.sum` with `sumStructure`, `BoundedFormula.IsQF`, `IsUniversal`, `IsExistential`, `BoundedFormula.alls`, `Language.graph` with `SimpleGraph.structure`, `Language.order` with `FirstOrder.Language.dlo` (for `[L.IsOrdered]`, here `Language.order.dlo`) |
| Tau Ceti at the pin, `ModelTheory/Infinitary/` (InfinitaryLogic Layer 0) | `L.BoundedFormulaω`, `L.Sentenceω`, `BoundedFormulaInf.Realize`, `SentenceInf.Realize`, the connectives, `iInfAlong`/`iSupAlong`, `IndexCoding.ofEncodableWith`, `BoundedFormula.toInf` with `realize_toInf`, realization invariance under isomorphism, `BoundedFormulaInf.freeVarSupport` |
| Tau Ceti, `ModelTheory/BackAndForth/` (InfinitaryLogic Layer 1) | `TauCeti.BFEquiv` (for relational `L`) with `refl`, `symm`, `trans` (across three structures), `mono`, `comp`, the successor and limit laws `add_one` and `limit`, `Language.Equiv.bfEquiv`, `potentialIso_iff_bfEquiv_all`, `countable_potentialIso_iff_iso`, `SameAtomicType` |
| Tau Ceti, `ModelTheory/Scott/` (InfinitaryLogic Layers 2–3) | `SelfStabilizesCompletely` with `bfEquiv_of_le`, `exists_complete_self_stabilization`, `selfStabilizationOrdinal` with its attainment and its bound below `ω₁`, `scottFormula` with `realize_scottFormula_iff_bfEquiv`, `scottSentence` with `realize_scottSentence_iff` and `scott_isomorphism`, `orbitRank`, `internalScottRank`, `selfStabilizationOrdinal_le_internalScottRank`, `internalScottRank_le_succ_selfStabilizationOrdinal`, `internalScottRank_empty` |
| Tau Ceti, `ModelTheory/Scott/Height.lean` (most of Layer 4.2 here) | `StabilizesCompletely` with `bfEquiv_of_le` and `mono`; `scottHeight` with `stabilizesCompletely_scottHeight`, `scottHeight_lt_omega_one`, `Language.Equiv.scottHeight_eq`, `scottHeight_le_selfStabilizationOrdinal_add_omega0`, `scottHeight_le_internalScottRank_add_omega0` and `nonempty_equiv_of_bfEquiv_of_scottHeight_le` (with `N` in any universe); the countable constant-chain case `SelfStabilizesCompletely.stabilizesCompletely_add_omega0` |
| Tau Ceti, `ModelTheory/RelationalConfiguration/` (most of Layers 0, 1.2, 2 and 4.1 here) | `RelationalConfiguration` with `Atom`, `atom` and `eval`, its topology, σ-algebra, compactness and, for countably many relation symbols and a countable carrier, its Polish and Borel instances, `isClopen_setOf_eval`, `mk_le_continuum`; `toStructure` and `ofStructure` with both round trips; `Equiv.encodeVia` with `nonempty_equiv_encodeVia`, `encodeVia_trans` and `realize_encodeVia`; the action of `Equiv.Perm α` with `eval_perm_smul`; `isoSetoid` with `isoSetoid_eq_orbitRel` and `analyticSet_setOf_isoSetoid`; `IsomorphismInvariant` with its lattice API and `analyticSet_iUnion_smul`; `modelsOf` with its constructor equations, `measurableSet_setOf_realize`, `measurableSet_modelsOf` and `standardBorelSpace_modelsOf`; `measurableSet_setOf_bfEquiv`; `bfEquivSetoid` with `measurableSet_setOf_bfEquivSetoid` and `isoSetoid_le_bfEquivSetoid`. In `Combinatorics/SimpleGraph/RelationalConfiguration.lean`: `SimpleGraph.toRelationalConfiguration` with `measurableEmbedding_toRelationalConfiguration`. The orbit, saturation and isomorphism-invariance results there assume `[L.IsRelational]`; the targets here that are stated for every language stay targets |
| Tau Ceti, `Topology/Algebra/Group/Perm.lean` (most of Layer 1.1 here) | the topology on `Equiv.Perm α`, `Equiv.Perm.hasBasis_nhds_one_fixingSubgroup` (indexed by finite sets), the topological-group instance and, for countable `α`, the Polish instance |
| BorelEquivalenceRelations, as implemented at the pin | `IsGδ.polishSpace` (Mathlib's declaration) and `IsGδ.standardBorelSpace` (a Gδ subset of a Polish space is Polish, resp. standard Borel, in the subspace structures), `MeasureTheory.AnalyticSet.prod`, and `Setoid.exists_invariant_measurableSet_separating` (for an analytic equivalence relation `E` on a Hausdorff space whose open sets are measurable, and analytic `A`, `B` with disjoint `E`-saturations, some `E`-saturated Borel `C` contains `A` and is disjoint from `B`; for `B` saturated, disjointness of the saturations is disjointness of `A` and `B`). Nothing else |
| InfinitaryModelExistence, PC classes and Craig interpolation | `LHom.PCMem`, Tau Ceti's implementation of that roadmap's projective-class predicate (`ModelTheory/Interpolation/PCClass.lean`), and the single theorem `pcSeparation` stated below, which is that roadmap's contract and is not at the pin; nothing else |

**The dependency on InfinitaryModelExistence.** Layer 5 consumes exactly the following theorem
of that roadmap, which proves it from sentence-level Craig interpolation for Lω₁ω, together with
its projective-class membership predicate, implemented in Tau Ceti as `LHom.PCMem`:
`LHom.PCMem g Θ M` holds when `M` itself, on the
same carrier, expands along `g` to a model of `Θ`. With `g = LHom.sumInl : L →ᴸ L.sum L₁`, `M` is
the `L`-reduct of a model of `Θ`, the symbols of `L₁` being auxiliary relations chosen
existentially; Layer 5 uses them to describe a branch through a tree. For a countable relational
language, on the space of structures with carrier `ℕ`, these projective classes are exactly the
isomorphism-invariant analytic sets (`analyticSet_iff_exists_pc`); Lω₁ω model classes are exactly
the isomorphism-invariant Borel sets (`lopezEscobar_iff`; for sets measurable in the product
σ-algebra it holds for every relational language, by a reduction to a countable sublanguage,
§5.3). There `pcSeparation` plays the role of
Lusin separation, turning the two analytic descriptions of `B` and its complement into one
sentence. The analytic correspondence needs the countable language, not only a countable carrier
(negative control in §5.4). `LHom.PCMem` and `pcSeparation` themselves are for arbitrary languages. For languages
`L`, `L₁`, `L₂` in arbitrary universes and `Θ₁ : (L.sum L₁).Sentenceω`,
`Θ₂ : (L.sum L₂).Sentenceω`: if no countable nonempty `L`-structure in `Type` lies in both
projective classes, some `θ : L.Sentenceω` holds in every nonempty member of the first class and fails in every nonempty
member of the second, in every universe.

```lean
-- Tau Ceti, `FirstOrder.Language.LHom.PCMem`
def PCMem (g : L →ᴸ L') (Θ : L'.Sentenceω) (M : Type w) [L.Structure M] : Prop :=
  ∃ S : L'.Structure M, @IsExpansionOn L L' g M _ S ∧ @SentenceInf.Realize L' ℕ Θ M S

-- InfinitaryModelExistence, Layer 7
theorem pcSeparation {L : FirstOrder.Language.{u, v}} {L₁ : FirstOrder.Language.{u₁, v₁}}
    {L₂ : FirstOrder.Language.{u₂, v₂}}
    (Θ₁ : (L.sum L₁).Sentenceω) (Θ₂ : (L.sum L₂).Sentenceω)
    (h : ∀ (M : Type) [L.Structure M] [Nonempty M] [Countable M],
      LHom.PCMem LHom.sumInl Θ₁ M → ¬ LHom.PCMem LHom.sumInl Θ₂ M) :
    ∃ θ : L.Sentenceω,
      (∀ (M : Type w) [L.Structure M] [Nonempty M], LHom.PCMem LHom.sumInl Θ₁ M →
        SentenceInf.Realize θ M) ∧
      (∀ (M : Type w) [L.Structure M] [Nonempty M], LHom.PCMem LHom.sumInl Θ₂ M →
        ¬ SentenceInf.Realize θ M)
```

Each `LHom.PCMem` carries its own expansion, so the theorem applies with `L₁ = L₂`, which is how
Layer 5 uses it. Layer 5 needs nothing else from that roadmap: no Löwenheim–Skolem theorem, no
fragment-elementary substructures, no graph translation and no boundedness of well-ordered
models. Its PC sentences are relational, and every model of them is countable by construction.

**Ownership.** This roadmap owns the targets of Layers 0–6: the coding space, the topology on
permutation groups of discrete spaces, the logic action, model classes, Borelness of
back-and-forth equivalence and isomorphism, the external Scott height and its comparison with the
internal rank, the tree material of Layer 3, the forms of López–Escobar in Layers 5 and 6.1 (a
relative form belongs to the [CountableModelCounting](../CountableModelCounting/README.md) roadmap), separation by invariant Borel sets and sentences for the logic
action, and the well-order class. Where Tau Ceti at the pin already implements a target (the
supplier rows above that name layers of this roadmap), the implementation is the interface: the
remaining targets are stated over it. `Suggested.lean` cites the implemented milestones and
restates only those whose form here differs from the library's (indexing, conventions, generality
or vocabulary), proving them by the library's theorems. It proves no perfect-set, Silver,
`G₀` or Borel-reducibility theorem, and none of the general Polish-space lemmas listed above; those
belong to the BorelEquivalenceRelations roadmap. It counts no models; that belongs to the
CountableModelCounting roadmap, which uses the Tau Ceti declarations above directly and consumes,
from the remaining targets here, `isomorphismInvariant_modelsOf`, `exists_sentence_separating`
and `exists_uniform_bfSeparation`.

The following Mathlib proposal fixes the shape of targets here. Those targets are built in Tau
Ceti now, named and stated as the proposal does, and replaced by Mathlib's declarations when it
lands.

- [Mathlib #41946](https://github.com/leanprover-community/mathlib4/pull/41946): `initialSegment`,
  `IsBranch` and `body` for `Descriptive.tree` (Layer 3).

Suggested homes:

Layers 0, 1, 2 and 4.1 extend the existing files under `TauCeti/ModelTheory/RelationalConfiguration/`
and `TauCeti/Topology/Algebra/Group/Perm.lean`, and Layer 4.2 extends
`TauCeti/ModelTheory/Scott/Height.lean`. The rest:

```text
TauCeti/SetTheory/Descriptive/WellFoundedTree.lean      -- Layer 3, trees and heights
TauCeti/SetTheory/Descriptive/KleeneBrouwer.lean        -- Layer 3
TauCeti/SetTheory/Descriptive/Boundedness.lean          -- Layer 3
TauCeti/ModelTheory/RelationalConfiguration/BFTree.lean -- Layer 4.3–4.4
TauCeti/ModelTheory/Descriptive/LopezEscobar.lean       -- Layer 5
TauCeti/ModelTheory/Descriptive/WellOrder.lean          -- Layer 6
```

## Layer 0 — The coding space

**At the pin.** Tau Ceti's `RelationalConfiguration` provides the coding space, decoding and
encoding with both round trips, transport with `nonempty_equiv_encodeVia`, composition and
realization, the topology and σ-algebra with clopen and measurable cylinders, compactness, the
Polish and Borel instances, the cardinality bound, continuity of each coordinate
(`continuous_eval`; with `toStructure_relMap` it makes decoding locally constant in each relation)
and the coordinatewise continuity criterion (`continuous_iff`), and the graph coding as a
measurable embedding whose range is the set of symmetric irreflexive codes
(`range_toRelationalConfiguration`). Still to build: the finite-cylinder basis, the query code,
the equality case of the cardinality bound and closedness of the range of the graph coding.

The specification, for every language `L` and carrier `α`:

- `Atom L α`, `RelationalConfiguration L α` and the carrier `ℕ` as in the conventions, with
  `Countable (Atom L α)` from countable relation symbols and a countable carrier;
- **decoding** `RelationalConfiguration.toStructure c : L.Structure α` for relational `L`
  (function symbols eliminated by `IsRelational`, `RelMap R v ↔ c.eval (atom R v) = true`), with
  its `simp` lemma, and **encoding** `RelationalConfiguration.ofStructure L α` (for the structure
  on `α`) for every `L`; both round trips, `ofStructure c.toStructure = c` and, for relational `L`,
  `(ofStructure S).toStructure = S` as an equality of structures (`Structure.ext`), so that
  decoding is a bijection between codes and structures on `α`;
- **transport** `Equiv.encodeVia (e : M ≃ α)`, the code of `Equiv.inducedStructure e`, with
  `nonempty_equiv_encodeVia`, its compatibility with composition of bijections, and realization
  of every Lω₁ω sentence along it. Every countable structure therefore has a code on `ℕ` (if
  infinite) or on `Fin n` (if of size `n`);
- **topology and measure**: the product topology with `Bool` discrete and the product σ-algebra,
  for every `L` and `α`; the basic cylinders `{c | c.eval a = true}` clopen and measurable; the
  finite cylinders `{c | ∀ a ∈ s, c.eval a = f a}` (`s` a `Finset`) a basis of clopen sets;
  `CompactSpace`; and, under `[∀ n, Countable (L.Relations n)] [Countable α]`, `MetrizableSpace`,
  `SecondCountableTopology`, `PolishSpace`, `BorelSpace` and hence `StandardBorelSpace`, for the
  space and for its square;
- **decoding is continuous in each relation**: for fixed `R` and `v` the map
  `c ↦ RelMap R v` is locally constant, and a map into a coding space is continuous exactly when
  each coordinate is;
- the **query code** `queryCode : RelationalConfiguration L ℕ → (ℕ → Bool)`, reading at `n` the
  coordinate of the atom that `Encodable.decode` (for `Encodable.ofCountable`) returns at `n`, and `false`
  where decoding fails, with `isClosedEmbedding_queryCode`. That decoder need not be injective on
  the indices where it succeeds, so the range is the closed set of sequences that are `false`
  where decoding fails and agree at any two indices decoding to the same atom;
- **cardinality**: under `[∀ n, Countable (L.Relations n)] [Countable α]`, `mk_le_continuum`, and
  equality with the continuum when moreover `α` is
  infinite and `L` has a relation symbol of positive arity. Without these hypotheses the space
  has cardinality `2 ^ #(Atom L α)`: one unary predicate on `ℝ` already gives `2 ^ 𝔠`;
- the **graph coding** `SimpleGraph.toRelationalConfiguration`, `G ↦ ofStructure` of
  `G.structure`, a measurable embedding for Mathlib's σ-algebra on graphs, whose
  range is the closed set of codes of symmetric irreflexive relations.

**Acceptance check.** Decoding the code of `(ℕ, ≤)` in Mathlib's `Language.order` (with
`orderStructure`) gives back `(ℕ, ≤)`, and the cylinder `{c | c.eval (atom leSymb ![0, 1]) = true}`
is clopen.

⚠ **API warning.** `RelationalConfiguration L α` is a `def`, not an `abbrev` of the function
type, so the action of Layer 1 is an instance on the coding space rather than a global instance
on `Atom L α → Bool` competing with Mathlib's pointwise instances on Pi types. Keep new instances
on the synonym.

## Layer 1 — Permutation groups and the logic action

### 1.1 The permutation group of a discrete space

**At the pin.** Tau Ceti provides all of 1.1: the topology of Convention 4, continuity of the
evaluations (`Equiv.Perm.continuous_apply`, `continuous_inv_apply`), the closed embedding
`isClosedEmbedding_prodMk_coe_coe_inv`, the basis lemma indexed by finite `Set`s (restated here
over `Finset`s by `Filter.HasBasis.to_hasBasis`), `IsTopologicalGroup` and, for countable `α`,
`PolishSpace`.

For `[TopologicalSpace α] [DiscreteTopology α]`, the topology of Convention 4 satisfies:

- the evaluations `σ ↦ σ a` and `σ ↦ σ⁻¹ a` are continuous, and `σ ↦ (σ, σ⁻¹)` is a closed
  embedding, its range being the pairs of mutually inverse maps;
- the **acceptance lemma** `hasBasis_nhds_one_fixingSubgroup`: the pointwise stabilizers
  `fixingSubgroup (Equiv.Perm α) s` of finite sets `s` form a neighbourhood basis of `1`; each is
  an open, hence closed, subgroup. In particular the inverse coordinate of the embedding adds no
  open sets, because fixing `σ` on a finite set fixes `σ⁻¹` on its image;
- the topological-group instance `Equiv.Perm.instIsTopologicalGroup` and, for countable `α`, the
  Polish instance `Equiv.Perm.instPolishSpace`, from the closed embedding into a Polish product. For `α = ℕ` this is S∞; for finite `α` the topology is discrete.

### 1.2 The logic action

**At the pin.** Tau Ceti provides the action with `eval_perm_smul`, joint continuity of
restriction (`continuous_uncurry_restrict`), from which joint continuity of the action follows with
`Equiv.Perm.continuous_inv_apply`, `isoSetoid_eq_orbitRel`,
`isomorphismInvariant_iff_isInvariantBlock`, the closure properties of `IsomorphismInvariant`
(`IsomorphismInvariant.compl`, `inter`, `union`, `isomorphismInvariant_iUnion`, `_iInter`,
`_empty`, `_univ`) and, for relational `L`, `analyticSet_iUnion_smul`. Mathlib's
`MeasurableSpace.measurableSet_iInf` and `measurableSet_invariants` give the invariant σ-algebra.
Still to build: `mem_stabilizer_iff` and closedness of stabilizers, and the two saturation results
for languages with function symbols.

- The relabelling action of `Equiv.Perm α` on `RelationalConfiguration L α` (Tau Ceti's), with
  `eval_smul_atom`: `(σ • c).eval (atom R v) = c.eval (atom R (σ⁻¹ ∘ v))`.
- `continuousSMul_relationalConfiguration`: the action is jointly continuous, for every language. Under
  the countability hypotheses the coding space on `ℕ` is therefore a Polish S∞-space.
- **Orbits are isomorphism classes.** `σ` is an isomorphism from `c.toStructure` to
  `(σ • c).toStructure`, and every isomorphism between decoded structures is of this form: Tau
  Ceti's `isoSetoid_eq_orbitRel` with `isoSetoid_apply`.
- **Stabilizers are automorphism groups**: `mem_stabilizer_iff`, and stabilizers are closed
  subgroups.
- **Invariance**: `MulAction.IsFixedBlock (Equiv.Perm α)` and `IsomorphismInvariant` with
  `isFixedBlock_iff_isomorphismInvariant`; both are closed under complement, countable union
  and countable intersection, and contain `∅` and `univ`.
- **The invariant σ-algebra**: `measurableSet_iInf_invariants_iff`, measurability for
  `⨅ σ, MeasurableSpace.invariants (σ • ·)` is measurability together with action invariance. It
  is coarser than the product σ-algebra.
- **Saturations**: for countable relation symbols, the saturation `⋃ σ, σ • A` of an analytic
  set is analytic (`analyticSet_iUnion_smul`, for every language; Tau Ceti proves the relational
  case), as the image of `univ ×ˢ A` under the continuous
  action, using `AnalyticSet.prod` (BorelEquivalenceRelations). The isomorphism relation, as a
  subset of the square, is analytic for the same reason (`analyticSet_orbitRel_graph`: the image of
  `Perm ℕ × RelationalConfiguration L ℕ` under `(σ, c) ↦ (σ • c, c)`).

**Acceptance check.** In the language of one unary predicate `P`, let `σ` be the 3-cycle
`0 ↦ 1 ↦ 2 ↦ 0` and `τ` the transposition of `0` and `1`. Then `σ` sends the code of `P = {0}` to
the code of `P = {1}`, and the two decoded structures are isomorphic via `σ`; the inverse
convention would give `P = {2}`, which a transposition cannot detect. The action is a left action:
`(σ * τ) • c = σ • (τ • c)` names `P = {σ (τ 0)} = {2}`, whereas `τ • (σ • c)` names `P = {0}`.

⚠ **API warning.** The action needs no countability and no relational hypothesis; only the
orbit–isomorphism correspondence needs `[L.IsRelational]`, and only Polishness needs countability.
Keep those hypotheses off the action itself.

## Layer 2 — Satisfaction and model classes

**At the pin.** Tau Ceti provides `modelsOf` (for sentences with any index type) with `mem_modelsOf`
and the constructor equations, measurability of satisfaction (`measurableSet_setOf_realize`,
`measurableSet_modelsOf`) and `standardBorelSpace_modelsOf`, all on every countable carrier, and
`Language.Equiv.mem_modelsOf_iff` across carriers, from which `isomorphismInvariant_modelsOf`
follows in one step; clopenability is Mathlib's `MeasurableSet.isClopenable` applied to
`measurableSet_modelsOf`. Still to build: locality, the Gδ model classes and the graph events.

The specification, for relational `L`:

- `modelsOf φ` for `φ : L.Sentenceω`, with `mem_modelsOf` (membership is `SentenceInf.Realize` in
  the decoded structure), and, for `φ : L.BoundedFormulaω β n` and assignments `v : β → α`,
  `xs : Fin n → α`, the set `{c | φ.Realize v xs}` of codes whose decoded structure satisfies `φ`
  there (the set of `measurableSet_setOf_realize`);
- the **constructor equations**: `modelsOf ⊥ = ∅`, `modelsOf ⊤ = univ`, negation is complement,
  binary and countable conjunction and disjunction are intersection and union (`iInf`, `iSup`,
  and the coded forms `iInfAlong`, `iSupAlong`), and the quantifier steps are the intersection and
  union over the carrier;
- **satisfaction is Borel**: `measurableSet_setOf_realize` and `measurableSet_modelsOf` for every
  relational `L` and countable `α`. No countability of the language is used;
- **locality**: `{c | φ.Realize v xs}` depends only on the values of the assignment on
  `freeVarSupport φ` (InfinitaryLogic Layer 0), and transforms under the action by
  `σ • {c | φ.Realize v xs} = {c | φ.Realize (σ ∘ v) (σ ∘ xs)}`;
- **invariance**: `isomorphismInvariant_modelsOf`, from invariance of realization under
  isomorphism; hence `modelsOf φ` is measurable for the invariant σ-algebra;
- **model spaces**: `standardBorelSpace_modelsOf` (Mathlib's `MeasurableSet.standardBorel`) and
  clopenability (`MeasurableSet.isClopenable`); the cardinality bound for `modelsOf φ`;
- **Gδ model classes**: a Gδ model class is Polish and standard Borel in the subspace structures,
  directly by `IsGδ.polishSpace` and `IsGδ.standardBorelSpace` (BorelEquivalenceRelations). Closure of the Gδ
  property under finite and countable conjunction. For a first-order sentence embedded by `toInf`:
  a quantifier-free matrix gives clopen sets, a universal sentence (`IsUniversal`) a closed set,
  and a `∀∃` sentence (`ψ.alls` with `ψ.IsExistential`) a Gδ set (`isGδ_modelsOf_toInf_alls`);
- **graph events**: `measurableSet_setOf_realize_graph`, satisfaction of every Lω₁ω sentence is a
  measurable event on `SimpleGraph ℕ`, through `SimpleGraph.toRelationalConfiguration`.

**Acceptance check.** `modelsOf (⊥ : L.Sentenceω) = ∅`, and for a binary relation symbol `R` the
codes satisfying `∀ x, ∃ y, R(x, y)` form a Gδ set, hence a Polish space.

⚠ **API warning.** A model class need not be Gδ, so do not install a `PolishSpace` instance on
`modelsOf φ` in its subspace topology. In the language of one unary predicate `P`, the codes with
finitely many `P`-elements form a countable dense subset of a perfect Polish space, so by the
Baire category theorem they are not Gδ; this is a model class (of the sentence
`⋁ₖ "at most k elements satisfy P"`). Model classes are standard Borel in the subspace
σ-algebra, and that is the general statement.

## Layer 3 — Trees, boundedness and the tree representation

Build, on Mathlib's `Descriptive.tree A`:

- `initialSegment`, `IsBranch` and `body`, following Mathlib #41946, with `body_mono`, the empty
  tree's empty body, and closedness of `body T` in `ℕ → A` for discrete `A`;
- the strict-extension relation `StrictExt T` on the nodes and `wellFounded_strictExt_iff`: it is
  well-founded exactly when `body T = ∅`. Neither direction uses finite branching. Every closed
  subset of `ℕ → A` is the body of the tree of initial segments of its points;
- `treeHeight T hT` for a well-founded tree, as in Convention 9, with monotonicity under
  homomorphisms of strict extension (injective or not), and `treeHeight_lt_omega_one` for trees
  on `ℕ` (countably many nodes, each of countable rank, and `ℵ₁` regular);
- the **Kleene–Brouwer order** `KBLT` on `List ℕ` (a proper extension comes first, otherwise the
  first difference decides), a strict linear order, with `wellFounded_kbLT_iff` (well-founded on
  the nodes of `T` exactly when `body T = ∅`) and the bound of the height by the order type of
  the Kleene–Brouwer order on a well-founded tree;
- the **boundedness theorem** `analytic_treeHeight_bounded`: for a topological space `X`, an
  analytic `A ⊆ X` and `T : X → tree ℕ` whose node sets `{x | s ∈ T x}` are closed, if every
  `T x` with `x ∈ A` is well-founded then their heights are bounded by one `β < ω₁`. Proof
  (Kunen's tree of attempts): the empty case is immediate; otherwise write `A` as the range of a
  continuous `f : (ℕ → ℕ) → X`. The tree
  `W` of codes of pairs `(s, u)` such that some `y` extending `u` has `s ∈ T (f y)` is
  well-founded, because a branch would give, through the closed node sets and convergence in Baire
  space, a branch of some `T (f y)`; each `T (f y)` maps into `W` by a homomorphism of strict
  extension, so its height is at most that of `W`, which is countable;
- the **tree representation of analytic sets**: `exists_tree_of_analyticSet_cantor`, every
  analytic `A ⊆ ℕ → Bool` is `{x | ∃ y, (fun n => (x n, y n)) ∈ body T}` for a tree `T` on
  `Bool × ℕ` (the graph of a continuous parametrization is closed, and closed sets are bodies);
  and `exists_tree_of_analyticSet` for analytic classes of codes, through the query code.

**Acceptance check.** The tree of strictly decreasing finite sequences in `ℕ` is well-founded, of
height `ω + 1` (its root has rank `ω`); the full tree on `ℕ` has a branch.

⚠ **API warning.** The node sets in the boundedness theorem are closed, not clopen, so the map
`x ↦ T x` need not be continuous. This is the generality Layer 4 needs: the node sets of the
forced back-and-forth trees are closed, and need not be open when the language has infinitely many
relation symbols.

## Layer 4 — Back-and-forth, isomorphism and Scott height on codes

### 4.1 Borel back-and-forth equivalence and isomorphism

**At the pin.** Tau Ceti provides the measurability of back-and-forth equivalence below `ω₁`,
`isoSetoid` with `isoSetoid_eq_orbitRel` and (relational, countable) analyticity of its graph, and
`bfEquivSetoid` with its measurability and `isoSetoid_le_bfEquivSetoid`; and
`realize_scottSentence_iff` (`ModelTheory/Scott/Isomorphism.lean`), which gives
`setOf_iso_eq_modelsOf_scottSentence` directly. Section 4.1 is therefore complete at the pin; the
statements below fix how the later layers use it.

- The code pairs whose decoded structures satisfy `BFEquiv β n a b` at fixed tuples `a b` form a
  Borel set for `β < ω₁` and countable relation symbols (`measurableSet_setOf_bfEquiv`). The
  single-structure form is a cross-check: for a fixed countable `M`, a tuple `a` of `M` and
  `b : Fin n → ℕ`, the codes `d` with `BFEquiv β n a b` (comparing `M` with the structure named by
  `d`) are the codes satisfying `scottFormula a β` at `b`, by `realize_scottFormula_iff_bfEquiv`.
- `isoSetoid L α`, the isomorphism relation on `RelationalConfiguration L α` (the decoded
  structures are isomorphic), for every carrier and in particular for `ℕ` and each `Fin n`, with
  `isoSetoid_eq_orbitRel` (it is the orbit relation of the logic action) and, for countable `α`
  and countably many relation symbols, analyticity of its graph.
- `bfEquivSetoid L α β`, back-and-forth equivalence of the empty tuples as an equivalence relation
  on codes, assembled from `TauCeti.BFEquiv.refl`, `symm` and `trans`, with
  `measurableSet_setOf_bfEquivSetoid` for `β < ω₁` and `isoSetoid_le_bfEquivSetoid`.
- **Isomorphism classes are Borel**: `setOf_iso_eq_modelsOf_scottSentence`, the class of `c` is
  the model class of the Scott sentence of the structure `c` names, by `realize_scottSentence_iff`;
  hence each orbit is Borel and invariant.

### 4.2 The external Scott height

`StabilizesCompletely` and `scottHeight` are Tau Ceti's (Convention 8). Tau Ceti also proves
`bfEquiv_of_le`, `mono`, `stabilizesCompletely_scottHeight`, `scottHeight_lt_omega_one`,
`Language.Equiv.scottHeight_eq` (invariance under isomorphism), the countable case
`stabilizesCompletely_add_omega0`, `scottHeight_le_selfStabilizationOrdinal_add_omega0`,
`scottHeight_le_internalScottRank_add_omega0` and the height comparison, and the constant-chain
bound for arbitrary `N` follows from `SelfStabilizesCompletely.bfEquiv_add_one_of_isSuccLimit` at
the limit level `β + ω` and `bfEquiv_of_le_of_forall_add_one`
(`ModelTheory/Scott/Stabilization.lean`).
Still to build: `stabilizesCompletely_iff_univ`, `selfStabilizationOrdinal_le_scottHeight`,
`internalScottRank_le_succ_scottHeight` and `orbitRank_le_scottHeight`. The statements:

- `StabilizesCompletely.bfEquiv_of_le` and `StabilizesCompletely.mono`: external stabilization at
  `β` makes `BFEquiv β` imply `BFEquiv γ` for every `γ ≥ β`, and persists at every `γ ≥ β`, by
  transfinite induction on `γ` with the stabilization supplying the forth and back witnesses;
- `stabilizesCompletely_iff_univ`: quantifying over countable `N` in any other universe gives the
  same predicate;
- **the constant-chain bound** `bfEquiv_of_selfStabilizesCompletely`: if `M` self-stabilizes at
  `β`, then for every structure `N`, of any cardinality and in any universe, and all tuples `a`
  of `M` and `b` of `N`, `BFEquiv (β + ω) n a b` implies `BFEquiv γ n a b` for every `γ`: the
  library's one-step upgrade at the limit level `β + ω > β`
  (`SelfStabilizesCompletely.bfEquiv_add_one_of_isSuccLimit`, for any `N`), propagated upward by
  `bfEquiv_of_le_of_forall_add_one`, with monotonicity below `β + ω`. The countable case,
  `stabilizesCompletely_add_omega0`, says that `M` stabilizes externally at `β + ω` in the sense of
  Convention 8;
- `stabilizesCompletely_scottHeight` (the infimum is attained, the set being nonempty by the
  constant-chain bound), `scottHeight_lt_omega_one` for countable `M`, and
  `Language.Equiv.scottHeight_eq`;
- **comparison with the internal rank**, for countable `M` where stated:
  - `selfStabilizationOrdinal_le_scottHeight` (countable `M`): external stabilization at `β`,
    applied to a copy of `M` in `Type`, is internal stabilization at `β`;
  - `scottHeight_le_selfStabilizationOrdinal_add_omega0` (every `M`), from the constant-chain
    bound at `s(M)`;
  - `internalScottRank_le_succ_scottHeight` (countable `M`) and
    `scottHeight_le_internalScottRank_add_omega0` (every `M`), combining the above with the
    InfinitaryLogic comparisons `s(M) ≤ SR(M) ≤ s(M) + 1`;
  - `orbitRank_le_scottHeight` (countable `M`): every tuple of `M` has orbit rank at most SH(M),
    by Tau Ceti's `orbitRank_le_selfStabilizationOrdinal` and
    `selfStabilizationOrdinal_le_scottHeight`.

  So s(M) ≤ SH(M) ≤ s(M) + ω and SR(M) ≤ SH(M) + 1 ≤ SR(M) + ω + 1. The bound SH ≤ SR + ω is
  attained by the countably infinite pure set (SR = 1, SH = ω), and the pure sets of size `m`
  (SR = 1, SH = m + 1) show that no bound SH ≤ SR + n with finite `n` holds;
- **the height comparison** `nonempty_equiv_of_bfEquiv_of_scottHeight_le`: for countable `M` and
  `N`, if `scottHeight M ≤ β` and the empty tuples are `BFEquiv β`, then `M ≃[L] N`. Upward
  closure gives `BFEquiv` at every level, then `potentialIso_iff_bfEquiv_all` and
  `countable_potentialIso_iff_iso`.

### 4.3 Borel isomorphism and strata

- `measurableSet_iso_inter_of_scottHeight_le`: if every code in `modelsOf φ` has Scott height at
  most `β < ω₁`, then isomorphism restricted to `modelsOf φ` is Borel, namely
  `bfEquivSetoid L ℕ β` restricted to `modelsOf φ`.
- `measurableSet_setOf_selfStabilizationOrdinal_le`: for `β < ω₁` the codes with
  `s(c) ≤ β` form a Borel set, because `s(c) ≤ β` is self-stabilization at `β` (attainment and
  upward propagation), a countable intersection over pairs of tuples of conditions read off
  back-and-forth equivalence of tuples (`measurableSet_setOf_bfEquiv`) along the diagonal.

### 4.4 Forced back-and-forth trees and uniform separation

- `bfTree c d : tree ℕ`, the forced back-and-forth tree: step `2 i` answers element `i` of the
  left structure, step `2 i + 1` element `i` of the right one, and a node is in the tree when the
  two tuples it decodes have the same atomic type. Prove `body_bfTree_nonempty_iff` (a branch is
  an isomorphism and conversely, every element of both structures being scheduled), the root and
  empty-tree lemmas (a disagreeing nullary relation empties the tree), closed node sets for every
  relational `L` (`isClosed_setOf_mem_bfTree`; clopen when `L` has finitely many relation
  symbols), and `lt_treeHeight_bfTree`: `BFEquiv β` of the empty tuples gives
  `β < treeHeight (bfTree c d)`, a node's rank being at least the back-and-forth level of its
  tuples.
- `exists_uniform_bfSeparation`: an analytic set of non-isomorphic pairs of codes is separated at
  one level `β < ω₁`, by the boundedness theorem applied to the forced trees. Its form for two
  analytic classes `B`, `C` with no element of `B` isomorphic to an element of `C`.
- `measurableSet_iso_inter_iff_exists_bfLevel`: isomorphism restricted to `modelsOf φ` is Borel
  exactly when some `β < ω₁` makes `bfEquivSetoid L ℕ β` agree with isomorphism on `modelsOf φ`. The
  forward direction applies uniform separation to the complement, which is Borel and hence
  analytic; the converse is `measurableSet_setOf_bfEquivSetoid`.

**Acceptance check.** In the language of one unary predicate, the codes of `P = 2ℕ` and
`P = 3ℕ` are isomorphic, and `bfEquivSetoid L ℕ β` relates them for every `β`.

⚠ **API warning.** Borelness of the external strata `{c | scottHeight c ≤ β}` is not claimed: the
definition quantifies over all countable structures. Stratify by the internal ordinal `s(c)`,
whose strata are Borel, and pass to the external height with the comparison bounds.

⚠ **API warning.** The internal rank alone does not bound the level at which back-and-forth
equivalence of the empty tuples decides isomorphism: an infinite pure set has internal rank `1`,
yet `BFEquiv k` relates it to a finite pure set of size `k` for every finite `k`. The external
height is the right parameter for the height comparison.

## Layer 5 — The López–Escobar theorem

### 5.1 The easy direction

For every `φ : L.Sentenceω`, `modelsOf φ` is Borel (`measurableSet_modelsOf`) and isomorphism
invariant (`isomorphismInvariant_modelsOf`). This is Layer 2.

### 5.2 The PC sentence of a tree

Let `W = pcWitnessLanguage` be the relational vocabulary with a unary `zero`, a binary `succ` and
a binary `branch`. For `k : ℕ` let `νₖ(x)` be the first-order numeral formula: `ν₀(x) := zero(x)`
and `νₖ₊₁(x) := ∃ y, νₖ(y) ∧ succ(y, x)`. For `i : ℕ` let `χᵢ` be the sentence "the `i`-th
atom holds at the numerals": if the enumeration of atoms sends `i` to `atom R v`, then
`χᵢ := ∃ y₀ … y_{l-1}, ⋀ⱼ ν_{v j}(yⱼ) ∧ R(y₀, …, y_{l-1})`, and otherwise `χᵢ := ⊥` (matching the
padding of `queryCode`). For a tree `T` on `Bool × ℕ`, `pcSentence T : (L.sum W).Sentenceω` is
the conjunction of:

1. `zero` has exactly one element; `succ` is the graph of an injective total function whose range
   misses `zero`; and `∀ x, ⋁ₖ νₖ(x)`. Together these make `k ↦ (the realization of νₖ)` a
   bijection from `ℕ` onto the universe;
2. `branch` is the graph of a total function;
3. for every `n`, the disjunction over the nodes `s` of `T` of length `n` of
   `⋀_{i < n} (χᵢ ↔ (s i).1) ∧ ⋀_{i < n} ∃ x y, νᵢ(x) ∧ ν_{(s i).2}(y) ∧ branch(x, y)`.

Every conjunction and disjunction is countable, so `pcSentence T` is an Lω₁ω sentence built from
the InfinitaryLogic connectives. Prove its specification (`Suggested.lean` records the two
statements together as `exists_pcSentence`):

- `realize_pcSentence_standardWitness`: if `(queryCode c, g)` is a branch of `T`, then `ℕ` with
  `c.toStructure` and `standardWitness g` (zero `{0}`, successor `n ↦ n + 1`, branch `g`) is a
  model;
- `exists_code_of_realize_pcSentence`: every model `M`, of any cardinality and in any universe,
  is countably infinite, and the numeral bijection `e : M ≃ ℕ` satisfies: the code
  `e.encodeVia`, together with the function read off `branch`, is a branch of `T`. No invariance
  is used.

Hence, for a tree representation `T` of an analytic class `B`, the codes of models of
`pcSentence T` on `ℕ` lie in the saturation of `B`, and contain `B`.

### 5.3 The hard direction

`lopez_escobar`: for every relational `L`, if `B ⊆ RelationalConfiguration L ℕ` is measurable for
the product σ-algebra (Borel in the sense of Convention 5) and isomorphism invariant then `B = modelsOf φ` for some `φ : L.Sentenceω`. Proof:

0. **Reduction to a countable sublanguage.** A set measurable for the product σ-algebra
   (Convention 5) is determined by countably many atoms. Let `L₀` be the countable relational
   sublanguage of their symbols, `g : L₀ →ᴸ L` its inclusion, and `B₀` the set of `L₀`-codes whose
   extension by `false` lies in `B`. Extension by `false` is measurable and commutes with the
   action, so `B₀` is measurable and invariant, and `B` is the preimage of `B₀` under Tau Ceti's
   reduct map `g.reductConfiguration`. Steps 1–4, for `L₀`, give `φ₀` with `B₀ = modelsOf φ₀`,
   and `realize_sentenceInf_reductConfiguration` gives `B = modelsOf (g.onBoundedFormulaInf φ₀)`.
   Steps 1–4 assume countably many relation symbols.
1. `B` and its complement are Borel, hence analytic (`MeasurableSet.analyticSet`); take tree
   representations `T₀` of `B` and `T₁` of `Bᶜ` (Layer 3).
2. **Disjointness.** No nonempty `L`-structure `M`, countable or not, lies in both
   `LHom.PCMem LHom.sumInl (pcSentence T₀)` and `LHom.PCMem LHom.sumInl (pcSentence T₁)`. Otherwise
   `exists_code_of_realize_pcSentence`, applied to the `W`-part of each expansion (its reduct along
   `LHom.sumInr`), gives two bijections `e₀, e₁ : M ≃ ℕ` with
   `e₀.encodeVia ∈ B` and `e₁.encodeVia ∈ Bᶜ`; both codes name structures isomorphic to `M`, so
   invariance of `B` gives a contradiction. This is the only use of invariance. The step uses
   `sumStructure_reducts`: an `(L.sum W)`-structure on `M` is the `sumStructure` of its reducts
   along `LHom.sumInl` and `LHom.sumInr`, and when it is an expansion of `M` along `LHom.sumInl` its
   `L`-reduct is `M`'s own structure (extensionality, with `propext` for relations).
3. `pcSeparation` (InfinitaryModelExistence) gives `θ : L.Sentenceω` true in every nonempty member
   of the projective class of `pcSentence T₀` and false in every nonempty member of that of
   `pcSentence T₁`.
4. If `c ∈ B`, `realize_pcSentence_standardWitness` for `T₀` puts `ℕ` with `c.toStructure` in the
   projective class of `pcSentence T₀` (the expansion is the sum structure with
   `standardWitness g`), so `c ∈ modelsOf θ`. If `c ∉ B`, the same for `T₁` gives
   `c ∉ modelsOf θ`.

### 5.4 Packaging

- `lopezEscobar_iff`: measurable for the product σ-algebra and isomorphism invariant ⟺
  `∃ φ, B = modelsOf φ`, for every relational `L`;
- `lopezEscobar_action_iff`: the same with `MulAction.IsFixedBlock (Equiv.Perm ℕ) B`;
- `measurableSet_iInf_invariants_iff_exists_modelsOf`: the invariant σ-algebra is exactly the
  collection of model classes, `{B | MeasurableSet[⨅ σ, invariants (σ • ·)] B} = range modelsOf`;
- `analyticSet_iff_exists_pc`: an isomorphism-invariant class of codes is analytic exactly when it
  is the class of codes `c` with `LHom.PCMem LHom.sumInl ψ ℕ` (for `c.toStructure`) for a single
  `ψ : (L.sum W).Sentenceω`. The
  forward direction is 5.2 with invariance; the converse projects the Borel set
  `modelsOf ψ ⊆ RelationalConfiguration (L.sum W) ℕ` along the continuous reduct map onto
  `RelationalConfiguration L ℕ`. Unlike the Borel form, it needs countably many relation symbols.
  Negative control: with unary predicates `P_r` for `r ∈ ℝ`, the code with every `P_r` empty is
  fixed by every permutation, so its singleton is invariant and analytic; but a single sentence
  mentions only countably many symbols, so no PC class is that singleton. The singleton is closed,
  hence Borel for the topology, but not measurable for the product σ-algebra, which is the one
  `lopezEscobar_iff` uses; for the topology's Borel σ-algebra that theorem would fail here.

**Acceptance check.** In the empty language every class of codes is `∅` or `univ`, and
`lopezEscobar_iff` is witnessed by `⊥` or `⊤`.

⚠ **API warning.** Isomorphism invariance cannot be dropped from `lopez_escobar`: a singleton
`{c}` whose orbit has more than one point is Borel but not a model class, because model classes
are invariant.
The analytic statement `analyticSet_iff_exists_pc` is also stated for invariant classes only; a
non-invariant analytic class is contained in, but in general not equal to, the codes of its PC
presentation.

## Layer 6 — Separation and the well-order class

### 6.1 Invariant separation

- `invariant_analytic_separation`: if `A` and `B` are analytic, `B` is action invariant and `A`
  and `B` are disjoint, there is an invariant Borel `C ⊇ A` disjoint from `B`. This is
  `Setoid.exists_invariant_measurableSet_separating` (BorelEquivalenceRelations, implemented in
  Tau Ceti) for the orbit relation,
  whose graph is analytic (`analyticSet_orbitRel_graph`, Layer 1), once action invariance is
  identified with saturation for the orbit relation (`saturated_iff_isFixedBlock`).
- `exists_sentence_separating`: by López–Escobar, the separator is `modelsOf θ` for a single
  sentence `θ`.

### 6.2 The coded well-order class

For a relational `L` with a distinguished binary relation symbol `lt`, let `codeRel lt c` be the
relation a code assigns to `lt` and `wellOrderClass lt` the codes for which it is a (strict)
well-order of `ℕ`. Prove:

- `isomorphismInvariant_wellOrderClass`, and that the complement of `wellOrderClass lt` is
  analytic, so `wellOrderClass lt` is coanalytic: the strict linear orders form a closed set, and
  a strict linear order fails to be a well-order exactly when it has a descending sequence, a
  projection of a closed subset of the product with Baire space;
- `exists_mem_wellOrderClass_type_eq`: every `β` with `ω ≤ β < ω₁` is the order type of some code
  in the class (transport `β.ToType ≃ ℕ`; the other relations are empty);
- `descTree lt c`, the tree of strictly `codeRel lt c`-decreasing finite sequences, with clopen
  node sets, `body (descTree lt c) = ∅` exactly when `codeRel lt c` is well-founded, and, for a
  well-order, its order type at most `treeHeight (descTree lt c)` (a node ending at `x` has rank
  the order type of the predecessors of `x`);
- `analytic_type_bounded`: an analytic class of coded well-orders has order types bounded below
  `ω₁`, by `analytic_treeHeight_bounded` applied to `descTree`;
- `not_analyticSet_wellOrderClass`, from `analytic_type_bounded` and
  `exists_mem_wellOrderClass_type_eq`, and `not_measurableSet_wellOrderClass`, since Borel sets
  are analytic;
- `not_exists_modelsOf_eq_wellOrderClass`: no Lω₁ω sentence has exactly the coded well-orders as
  its coded models, from the easy direction of López–Escobar.

**Acceptance check.** In a language with one binary symbol `lt`, the code of `(ℕ, <)` lies in
`wellOrderClass lt` with order type `ω`, and the code of `(ℤ, <)` transported to `ℕ` does not.

⚠ **API warning.** The well-order class constrains only `lt`. With one further unary predicate
the class contains a continuous Cantor family of pairwise non-isomorphic codes (fix the usual
order and vary the predicate), so no thinness or counting statement about `wellOrderClass` holds
for arbitrary `L`. Counting statements belong to the CountableModelCounting roadmap.

## Worked examples

Discharge these alongside the layers; they check that the API describes real spaces.

1. **The empty language.** `Atom Language.empty ℕ` is empty, so
   `RelationalConfiguration Language.empty ℕ` is a single point; every class of codes is invariant and is `∅` or `univ`. The pure sets test the
   height comparison. Take tuples with the same equality type and `d` distinct entries in pure
   sets of sizes `m` and `m'` (finite or `ℵ₀`), and let `r = m - d`, `r' = m' - d` be the numbers
   of remaining elements. Then `BFEquiv k` holds exactly when `r = r'` or both `r` and `r'` are at
   least `k`. Hence `scottHeight (Fin m) = m + 1` (`scottHeight_fin_pureSet`; at a level `k ≤ m`
   take `d = m - k` against a set of size `m + 1`), and `scottHeight ℕ = ω`
   (`scottHeight_nat_pureSet`; at a finite level `k` compare with a set of size `d + k`). All of
   them have internal Scott rank `1`: the infinite one attains `SH ≤ SR + ω`, and the finite ones
   show that no bound `SH ≤ SR + n` with finite `n` holds.
2. **One unary predicate.** The map `c ↦ (n ↦ c.eval (atom P ![n]))` is a homeomorphism onto Cantor space,
   and the action permutes coordinates. The orbits are classified by the pair
   `(|P|, |¬P|)` with `|P| + |¬P| = ℵ₀`, so there are countably many, each Borel and each the model
   class of an explicit sentence ("exactly `k` elements satisfy `P`", "infinitely many do and
   infinitely many do not", ...). Every code has Scott height at most `ω`, so
   `measurableSet_iso_inter_of_scottHeight_le` applies with `φ = ⊤`. The class "finitely many
   `P`-elements" is Borel, invariant and countable union of orbits, but not Gδ.
3. **Linear orders.** In Mathlib's `Language.order` the codes of linear orders form a closed set,
   and the model class of `Language.order.dlo` is Gδ (each axiom is equivalent to a `∀∃` sentence) and a
   single orbit (Cantor's theorem, through Mathlib's DLO back-and-forth), hence a Polish space
   on which S∞ acts transitively. In a language with a strict order symbol the well-ordered codes
   are coanalytic, not analytic, and an analytic set of them has bounded order types.
4. **Graphs.** Through `SimpleGraph.toRelationalConfiguration`, the satisfaction event of every Lω₁ω graph sentence is
   measurable on `SimpleGraph ℕ`, and the isomorphism class of any fixed countable graph is a
   Borel set of graphs. For the Rado graph this class is the model class of the conjunction of the
   simple-graph axioms and the extension axioms (those of the InfinitaryLogic random-graph worked
   example), a Gδ set.
5. **Orbits as back-and-forth classes.** For a code `c`, its orbit is
   `modelsOf (scottSentence ℕ)` for the structure `c` names, and it is also the
   `bfEquivSetoid L ℕ β`-class of `c` for every `β ≥ scottHeight` of that structure, by the height
   comparison.

## Completion criteria

Each introduced definition comes with its rewriting, transport and boundary-case API and the
stated examples. The headline theorems are assembled from these APIs, with no hypothesis asserting
measurability, analyticity, stabilization, separation or definability that the roadmap is meant to
prove. The statements consumed from sibling roadmaps are exactly those listed under ownership:
`pcSeparation` with `LHom.PCMem`, and four general lemmas of BorelEquivalenceRelations.

The following chains must be visible in the exported results:

- Coding space → Polish and standard Borel structure → continuous logic action of the Polish group
  S∞ → orbits are isomorphism classes → invariant σ-algebra.
- Infinitary syntax → measurable satisfaction → model classes Borel and invariant (easy
  López–Escobar).
- Borel invariant class → analytic class and complement → tree representations → PC sentences →
  disjointness by invariance → `pcSeparation` → the hard direction → the invariant σ-algebra is the
  collection of model classes.
- Borel back-and-forth levels → external Scott height and its comparison with the internal rank →
  height comparison → Borel isomorphism under bounded height.
- Forced back-and-forth trees → boundedness theorem → uniform back-and-forth separation → Borel
  isomorphism on a model class is decided at one countable level.
- Descending-sequence trees → boundedness → the well-order class is not analytic, not Borel, and
  not the model class of any sentence.

A theorem proved for a private coding space, a private topology on permutations, a private
satisfaction relation or a private back-and-forth relation does not discharge the corresponding
target.

## Out of scope for this roadmap

These belong to separate roadmaps.

- Perfect-set theorems, the `G₀` dichotomy, Silver's theorem, Borel reducibility, smoothness and
  `E₀`: the BorelEquivalenceRelations roadmap.
- Burgess's dichotomy for analytic equivalence relations, the coanalytic form of Silver's
  theorem, the general Glimm–Effros dichotomy of Harrington, Kechris and Louveau, and the
  Gandy–Harrington effective topology: a separate roadmap.
- Counting countable models, Morley's theorem, stratification of model classes by Scott height
  and Vaught's conjecture: the CountableModelCounting roadmap, which consumes the interface listed
  under ownership.
- Model existence, omitting types, Craig, Lyndon and Malitz interpolation, PC classes in general,
  and the model-theoretic boundedness of well-ordered models:
  the InfinitaryModelExistence roadmap. Layer 6 proves the descriptive boundedness theorem for
  coded well-orders independently of it.
- Vaught transforms, the Becker–Kechris theorem on finer Polish topologies, general Polish group
  actions beyond the logic action of S∞, Borel completeness of isomorphism of countable graphs or
  linear orders, coanalytic rank theory beyond the tree heights of Layer 3, and the rest of
  effective descriptive set theory.
- Admissible sets, Barwise compactness, Nadel's bound, Scott processes, Lκλ for `κ > ω₁`, and
  many-sorted logic.
- The graph-language translation of function and constant symbols and its semantic API belong to
  InfinitaryModelExistence (its Layer 6). Transferring Karp theory, back-and-forth analysis and
  Scott ranks across that translation is outside this series of roadmaps and must reuse that API.

## Coordination

- **InfinitaryLogic.** The syntax, back-and-forth relation and Scott analysis are the Tau Ceti
  implementation of the [InfinitaryLogic roadmap](../../Completed/InfinitaryLogic/README.md), under
  `TauCeti/ModelTheory/{Infinitary,BackAndForth,Scott}` at the pin. The external Scott height,
  excluded there, is specified here; Tau Ceti's `Scott/Height.lean` implements most of it and
  leaves the internal objects unchanged. The free-variable support
  `BoundedFormulaInf.freeVarSupport` is used in Layer 2. Tau Ceti's random-graph file
  (`ModelTheory/Scott/RandomGraph.lean`) supplies the extension axioms of worked example 4.
- **[InfinitaryModelExistence](../InfinitaryModelExistence/README.md).** The single dependency is
  `pcSeparation`, with `LHom.PCMem`, as stated under ownership. That roadmap owns both. Tau Ceti
  implements the predicate as `LHom.PCMem`; `pcSeparation` is not at the pin. Its application here uses relational PC sentences
  whose models are countable by construction, so it needs neither Löwenheim–Skolem, nor graph
  translation, nor that roadmap's boundedness of well-ordered models.
- **[BorelEquivalenceRelations](../BorelEquivalenceRelations/README.md).** This roadmap consumes
  exactly four general results of that roadmap, all implemented at the pin: `IsGδ.polishSpace`
  and `IsGδ.standardBorelSpace` (its Layer 0.2; the first is Mathlib's declaration),
  `AnalyticSet.prod` (Layer 0.3) and `exists_invariant_measurableSet_separating` (Layer 2.2).
  That roadmap consumes nothing from this one.
- **[CountableModelCounting](../CountableModelCounting/README.md)** uses the Tau Ceti declarations
  directly and the targets of this roadmap listed under ownership.
- **Mathlib.** [#41946](https://github.com/leanprover-community/mathlib4/pull/41946) (bodies of
  trees) fixes the shape of the corresponding targets; build them here now and replace them by
  imports when it lands. Opening an upstream PR is not a target of this roadmap.

## Provenance

A Lean formalization of most of this material exists in
[`cameronfreer/infinitary-logic`](https://github.com/cameronfreer/infinitary-logic) at revision
[`518a366`](https://github.com/cameronfreer/infinitary-logic/tree/518a366cba97b1ae8c4dc64a297a396939bc3e0b)
(Apache-2.0, sorry-free, axioms `propext`, `Classical.choice`, `Quot.sound`). It is a proof
reference, not the specification. Credit `cameronfreer/infinitary-logic` in ported files, and
record where a Tau Ceti file diverges from it. Paths below are under `InfinitaryLogic/` at that
revision.

| Layer | Source files | Differences from this specification |
| --- | --- | --- |
| 0 | `Descriptive/{StructureSpace, Topology, Measurable, Polish, QueryCode, CodeTransport}.lean` | `StructureSpace` is a `def` with bridging instances and `StructureSpaceOn` an `abbrev`; here Tau Ceti's `RelationalConfiguration` is the `def`, on every carrier |
| 1 | `Descriptive/{PermTopology, PermPolishGroup, PolishAction, LogicAction, InvariantMeasurableSpace, InvariantMeasurableModels}.lean` | the source topologizes only `Equiv.Perm ℕ`, works in `Language.{0, 0}` and defines its own invariant σ-algebra; here any discrete carrier, any universes, Tau Ceti's relabelling action and `MeasurableSpace.invariants` |
| 2 | `Descriptive/{SatisfactionBorel, SatisfactionBorelOn, ModelClassStandardBorel, ModelsOfGDelta, LopezEscobarEasy}.lean` | names `ModelsOf`, `ModelsOfOn`; here one `modelsOf` on every carrier. The source's `GDeltaPolish.lean` and `AnalyticClosure.lean` map to BorelEquivalenceRelations |
| 3 | `Descriptive/{KleeneBrouwer, AnalyticTreeBoundedness, AnalyticTree, TreeCodes}.lean` | the source states the tree representation level by level and has no `body`; here Mathlib #41946's vocabulary |
| 4 | `Descriptive/{BFEquivBorel, IsomorphismBorel, StructureIsoSetoid, BFTree, BFSeparation}.lean`, `Scott/Height/{Defs, RankBounds}.lean`, `Scott/RefinementCount.lean`, `Scott/InternalRankBounds.lean` | the source's `scottHeight` lives in `Ordinal.{0}`, ranges over countable `N` in the universe of `M`, and is compared with the internal rank through `Ordinal.lift`; here `Ordinal.{w}`, `N : Type`, and no lifts. The constant-chain argument is `RefinementCount.lean`'s proof of `countableRefinementHypothesis`, stated there for countable `N`; `bfEquiv_of_selfStabilizesCompletely` is its adaptation to arbitrary `N`, which the argument permits |
| 5 | `Methods/LopezEscobar/*.lean`, `Descriptive/LopezEscobar.lean`, `Methods/Interpolation/CraigSeparation.lean` (`craig_pcSeparation_relational`) | the source codes trees in a functional witness vocabulary relationalized by graph translation, and proves disjointness through a countable fragment-elementary substructure; here the witness vocabulary is relational and its numeral axiom makes every model countable, so neither is needed |
| 6 | `Descriptive/{InvariantSeparation, WellOrderClass, WellOrderNonBorel, WellOrderBridge, AnalyticWellOrderBoundedness}.lean` | the source obtains non-Borelness of the well-order class from López–Escobar, fragment Löwenheim–Skolem and the model-theoretic boundedness of well-ordered models; here from the descriptive boundedness theorem of Layer 3 |

## References

- E. G. K. López-Escobar, "An interpolation theorem for denumerably long formulas",
  *Fundamenta Mathematicae* 57 (1965), 253–272.
- R. L. Vaught, "Invariant sets in topology and logic", *Fundamenta Mathematicae* 82 (1974),
  269–294: the logic action and invariant Borel sets.
- A. S. Kechris, *Classical Descriptive Set Theory*, Graduate Texts in Mathematics 156, Springer,
  1995. §2 (trees, well-founded trees, ranks and the Kleene–Brouwer order), §9 (Polish groups,
  with S∞), §14 (analytic sets and Lusin separation), §16 (Borel sets and Baire category; the
  logic action and López-Escobar's theorem), §31 (analytic well-founded relations: the boundedness
  theorem, with Kunen's proof).
- S. Gao, *Invariant Descriptive Set Theory*, Pure and Applied Mathematics, CRC Press, 2009:
  the logic action, invariant separation and López-Escobar's theorem.
- D. Marker, *Lectures on Infinitary Model Theory*, Lecture Notes in Logic 46, Cambridge
  University Press, 2016: López-Escobar's theorem through interpolation and PC classes, the route
  of Layer 5.
- H. J. Keisler, *Model Theory for Infinitary Logic*, North-Holland, 1971: PC classes and
  interpolation for Lω₁ω.
