# Roadmap: Borel equivalence relations, the G₀ dichotomy and Silver's theorem

Develop the classical, non-effective descriptive set theory of Borel equivalence relations on
Polish and standard Borel spaces, from the Baire-category tools Mathlib lacks up to two
summits:

- **Silver's theorem.** A Borel equivalence relation on a Polish space has countably many
  classes, or there is a continuous injection of Cantor space whose distinct points are sent to
  inequivalent points. On a standard Borel space the number of classes is therefore at most ℵ₀
  or exactly 2^ℵ₀ (the cardinality form of Silver's theorem).
- **The Kechris–Solecki–Todorcevic G₀ dichotomy.** An analytic graph on a Polish space has a
  Borel coloring with countably many colors, or the graph G₀ on Cantor space maps into it by a
  continuous homomorphism, and not both.

```lean
-- the shapes we are building toward (Suggested.lean has the full signatures):
-- theorem silver_dichotomy {X : Type u} [TopologicalSpace X] [PolishSpace X]
--     [MeasurableSpace X] [BorelSpace X]
--     (E : Setoid X) (hE : MeasurableSet {p : X × X | E p.1 p.2}) :
--     Countable (Quotient E) ∨ HasCantorAntichainOn E Set.univ
--
-- theorem mk_quotient_le_aleph0_or_eq_continuum {X : Type u} [MeasurableSpace X]
--     [StandardBorelSpace X]
--     (E : Setoid X) (hE : MeasurableSet {p : X × X | E p.1 p.2}) :
--     #(Quotient E) ≤ ℵ₀ ∨ #(Quotient E) = 𝔠
--
-- theorem g0_dichotomy {X : Type u} [TopologicalSpace X] [PolishSpace X]
--     [MeasurableSpace X] [BorelSpace X]
--     (G : SimpleGraph X) (hG : AnalyticSet {p : X × X | G.Adj p.1 p.2}) :
--     Xor (∃ c : G.Coloring ℕ, Measurable c) (∃ φ : gZero →g G, Continuous φ)
```

Silver's theorem is proved from the G₀ dichotomy by B. D. Miller's category route: the
dichotomy applied to the complement of the equivalence relation, Miller's independence lemma
for the graphs G_S, the Kuratowski–Ulam theorem, and Mycielski's theorem. Nothing in the route
uses forcing, effective descriptive set theory or the Gandy–Harrington topology.

The reusable material is part of the specification: Polish and perfect-space instances for
Cantor space, Gδ subspaces, closure properties of analytic sets, the perfect set theorem for
Borel and analytic sets, Kuratowski–Ulam, Mycielski, continuity of Baire-measurable maps on
comeagre sets, the graphs G_S, Borel colorings and the Kechris–Solecki–Todorcevic separation
lemma, invariant Lusin separation, a vocabulary of perfect and Cantor antichains, Borel
reducibility, smoothness, and E₀ with its non-smoothness.

The roadmap has no model-theoretic content and no model-theoretic dependency. Its principal
consumer is the [CountableModelCounting](../CountableModelCounting/README.md) ([#1318](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1318)) roadmap, which
counts countable models through the interface of Layer 4.

## Scope and dependency order

Every layer below is required.

| Layer | Builds | Consumes | Acceptance check (compiles without later layers) |
| --- | --- | --- | --- |
| 0 | Cantor and Baire space instances and word cylinders; Gδ subspaces; analytic-set closure, saturation and the Borel graph theorem; the Borel perfect set theorem; cardinality of perfect sets; perfect and Cantor antichains with transport; countable splits | Mathlib Polish, perfect-set, Cantor-scheme, analytic-set and standard-Borel APIs | an uncountable Borel subset of ℝ contains a Cantor copy |
| 1 | Kuratowski–Ulam; Mycielski; Baire-measurable maps continuous on comeagre Gδ sets; Cantor subcopies; the graphs G_S, dense and sparse word sets, the canonical words, Miller's independence lemma | 0; Mathlib Baire-category API | every Borel equivalence relation on Cantor space with countable classes is meagre in the square |
| 2 | Independent sets and countable Borel colorings; the KST independent-superset lemma; invariant Lusin separation; Miller's ideals on families of assignments, amalgamation positivity and the refinement folds | 0; Mathlib Lusin separation | the complement of a Borel equivalence relation has a countable Borel coloring exactly when there are countably many classes |
| 3 | The fusion construction and the G₀ dichotomy, oriented and symmetric | 1, 2 | G₀ has no countable Borel coloring, and a non-dense word set can give a 2-colorable G_S |
| 4 | Silver's theorem (Polish, standard Borel, cardinal and relative forms); the perfect set theorem for analytic sets; the consumer interface | 0, 1, 3 | Silver for equality on an uncountable Polish space recovers the perfect set theorem |
| 5 | Borel reducibility; smoothness and its characterizations; closed relations are smooth; Silver in reducibility form; E₀, its generic ergodicity and non-smoothness | 0–4 | E₀ is Borel, has a continuous Cantor antichain, and is not smooth |

The ordering is the dependency order. Layers 1 and 2 can proceed in parallel once Layer 0
exists; Layer 3 needs both; Layer 4 needs Layer 3 and Layer 1; Layer 5 needs Layer 4 only for
Silver's reducibility form and Layer 2 only for the closed-relation theorem.

The converse half of Glimm–Effros (`¬ IsSmooth E → BorelReducible eZero E`,
Harrington–Kechris–Louveau), the Gandy–Harrington topology and all effective descriptive set
theory, the coanalytic form of Silver's theorem and Burgess's theorem for analytic equivalence
relations, countable Borel equivalence relations, hyperfiniteness, Polish group actions and
orbit equivalence relations, Cantor–Bendixson ranks, infinite games and determinacy,
uniformization, and finite Borel chromatic numbers belong to separate roadmaps. So does
everything about spaces of countable structures and their isomorphism relations: see
[Out of scope](#out-of-scope-for-this-roadmap).

Suggested homes:

```text
TauCeti/Topology/Instances/CantorSpace.lean          -- Layer 0.1
TauCeti/Topology/MetricSpace/PolishGDelta.lean       -- Layer 0.2
TauCeti/MeasureTheory/Constructions/Polish/Analytic.lean  -- Layers 0.3–0.4
TauCeti/SetTheory/Descriptive/Antichain.lean         -- Layer 0.5
TauCeti/Topology/Baire/KuratowskiUlam.lean           -- Layer 1.1
TauCeti/Topology/Baire/Mycielski.lean                -- Layer 1.2
TauCeti/Topology/Baire/BaireMeasurableMap.lean       -- Layer 1.3
TauCeti/SetTheory/Descriptive/GSGraph.lean           -- Layer 1.4
TauCeti/SetTheory/Descriptive/BorelColoring.lean     -- Layer 2
TauCeti/SetTheory/Descriptive/GZeroDichotomy.lean    -- Layer 3
TauCeti/SetTheory/Descriptive/Silver.lean            -- Layer 4
TauCeti/SetTheory/Descriptive/BorelReducibility.lean -- Layer 5
TauCeti/SetTheory/Descriptive/EZero.lean             -- Layer 5
```

`Mathlib/SetTheory/Descriptive/` is Mathlib's home for descriptive set theory (it holds
`Descriptive.tree`), which is why the Borel-equivalence-relation material is placed under the
same path. General topology and measure-theory lemmas go in Mathlib's own namespaces
(`IsGδ.polishSpace`, `MeasureTheory.AnalyticSet.prod`, ...).

## Conventions

1. **Spaces.** A Polish space carries `[TopologicalSpace X] [PolishSpace X]`, and when Borel
   sets are mentioned also `[MeasurableSpace X] [BorelSpace X]`. A standard Borel space carries
   `[MeasurableSpace X] [StandardBorelSpace X]`. Public statements never assume
   `MetricSpace`, `CompleteSpace` and `SecondCountableTopology` in place of `PolishSpace`;
   proofs that need a metric choose one with `TopologicalSpace.upgradeIsCompletelyMetrizable`,
   and proofs on a standard Borel space choose a Polish topology with `upgradeStandardBorel`.
   Universes are arbitrary: `X : Type u`, and cardinals of quotients live in `Cardinal.{u}`.
2. **Cantor and Baire space.** Cantor space is `ℕ → Bool` and Baire space is `ℕ → ℕ`, with the
   product topologies and product σ-algebras. Mathlib's cylinders `PiNat.cylinder x n` and
   restrictions `PiNat.res x n` (which list the first `n` values newest-first, as
   `CantorScheme` uses them) are the primary cylinder API. A *word* is a `List Bool` read left
   to right; `prependWord w x` is the point that starts with `w` and continues with `x`, and
   `wordCylinder w` is its range. The bridge
   `wordCylinder (PiNat.res x n).reverse = PiNat.cylinder x n` is a Layer 0 target, so the two
   conventions never have to be reconciled inside a proof.
3. **Equivalence relations.** An equivalence relation is a `Setoid X`, applied as `E x y`
   through Mathlib's coercion. *Borel* means the explicit hypothesis
   `MeasurableSet {p : X × X | E p.1 p.2}`, and *analytic* means
   `AnalyticSet {p : X × X | E p.1 p.2}`; neither is bundled into a class or a named predicate.
   Mathlib's order on setoids is used as is: `E ≤ F` means that `E` is finer, and
   `(⊥ : Setoid X)` is equality (`Setoid.bot_def`).
4. **Invariant sets.** The `E`-saturation of `A` is `Quotient.mk E ⁻¹' (Quotient.mk E '' A)`,
   and `A` is `E`-invariant when it equals its saturation. The `E`-invariant Borel sets are
   exactly the preimages of the measurable sets of Mathlib's quotient σ-algebra on
   `Quotient E`, so statements about countable families of invariant Borel sets are stated
   through that σ-algebra (for example `MeasurableSpace.CountablySeparated (Quotient E)`).
5. **Counting classes.** Topological dichotomies conclude with `Countable (Quotient E)`; the
   cardinal form concludes with `#(Quotient E) ≤ ℵ₀ ∨ #(Quotient E) = 𝔠`.
6. **Perfect-set witnesses.** `HasCantorAntichainOn E A` is a continuous map of Cantor space
   into `A` sending distinct points to `E`-inequivalent points; injectivity follows from
   reflexivity of `E` and is not a field. `HasPerfectAntichainOn E A` is a nonempty perfect
   subset of `A` of pairwise inequivalent points, and `IsThinOn E A` is its negation. Builders
   produce the Cantor form; ambient statements use the perfect form; the two agree on Polish
   spaces.
7. **Graphs and relations.** A *relation* `G : Set (X × X)` is a directed graph in which loops
   are allowed; it is the object of the oriented G₀ theory. A set is `G`-independent when it
   contains no pair of `G`, loops included. A symmetric loopless graph is a Mathlib
   `SimpleGraph X`, and its colorings and homomorphisms are Mathlib's `G.Coloring ℕ` and
   `H →g G`. *Countable Borel coloring* means a measurable `c : X → ℕ` with `c x ≠ c y` for
   every pair `(x, y)` of `G`; for a simple graph it means a measurable `c : G.Coloring ℕ`.
8. **Category.** Use Mathlib's `IsMeagre`, `IsNowhereDense`, `residual`, `BaireMeasurableSet`,
   `BaireSpace`, and the scoped notations `∀ᵇ` and `=ᵇ` of
   `Mathlib/Topology/Baire/BaireMeasurable.lean`.
   No second meagre or comeagre predicate is introduced.

## Existing library and ownership

The following are suppliers, not requests to rebuild their objects.

| Supplier | Consumed material |
| --- | --- |
| [Mathlib Polish spaces](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Topology/MetricSpace/Polish.lean) | `PolishSpace`, `PolishSpace.exists_nat_nat_continuous_surjective`, `IsClosed.polishSpace`, `IsOpen.polishSpace`, `PolishSpace.IsClopenable` and its closure properties, `PolishSpace.exists_polishSpace_forall_le` |
| [Mathlib perfect sets](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Topology/Perfect.lean) and [their metric form](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Topology/MetricSpace/Perfect.lean) | `Perfect`, `Preperfect`, `PerfectSpace`, the closed-set Cantor–Bendixson decomposition `exists_countable_union_perfect_of_isClosed`, `Perfect.exists_nat_bool_injection`, `IsClosed.exists_nat_bool_injection_of_not_countable` |
| [Mathlib Cantor schemes](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Topology/MetricSpace/CantorScheme.lean) and [`PiNat`](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/Topology/MetricSpace/PiNat.lean) | `CantorScheme.inducedMap`, `ClosureAntitone`, `VanishingDiam`, `ClosureAntitone.map_of_vanishingDiam`, `VanishingDiam.map_continuous`; `PiNat.cylinder`, `PiNat.res`, the cylinder basis and the `PiNat` metrics |
| [Mathlib Baire category](https://github.com/leanprover-community/mathlib4/tree/master/Mathlib/Topology/Baire) | `BaireSpace` for completely metrizable spaces, `residual`, `IsMeagre`, `IsNowhereDense`, `BaireMeasurableSet` with its σ-algebra laws, `MeasurableSet.baireMeasurableSet`, `MeasurableSet.residualEq_isOpen`, `IsMeagre.preimage_of_isOpenMap`, `BaireMeasurableSet.preimage`, `Homeomorph.residual_map_eq`, `not_isMeagre_of_isOpen` |
| [Mathlib analytic sets and standard Borel spaces](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/MeasureTheory/Constructions/Polish/Basic.lean) | `StandardBorelSpace`, `upgradeStandardBorel`, `MeasureTheory.AnalyticSet` with `AnalyticSet.iUnion`, `AnalyticSet.iInter`, `AnalyticSet.image_of_continuous`, `AnalyticSet.preimage`, `MeasurableSet.analyticSet`; Lusin separation `AnalyticSet.measurablySeparable`; Souslin's theorem `AnalyticSet.measurableSet_of_compl`; Lusin–Souslin `MeasurableSet.image_of_continuousOn_injOn`, `MeasurableSet.image_of_measurable_injOn`, `Measurable.measurableEmbedding`, `Continuous.measurableEmbedding`; `MeasurableSet.isClopenable`, `MeasurableSet.standardBorel`, `PolishSpace.borelSchroederBernstein`, `PolishSpace.measurableEquivNatBoolOfNotCountable` |
| [Mathlib real embedding](https://github.com/leanprover-community/mathlib4/blob/master/Mathlib/MeasureTheory/Constructions/Polish/EmbeddingReal.lean) | `MeasureTheory.exists_measurableEmbedding_real` |
| Mathlib σ-algebra and quotient API | `MeasurableSpace.CountablySeparated`, `HasCountableSeparatingOn`, the quotient σ-algebra `Quotient.instMeasurableSpace`, `measurable_of_countable` |
| Mathlib graphs, germs and cardinals | `SimpleGraph`, `SimpleGraph.fromRel`, `SimpleGraph.Coloring`, `SimpleGraph.Hom`, `SimpleGraph.IsIndepSet`; `Filter.germSetoid`, `Filter.Germ`; `Cardinal.continuum`, `Cardinal.mk_le_aleph0_iff`, `Cardinal.mk_real` |

The following Mathlib proposals fix the shape of corresponding targets. They are built in Tau
Ceti now, named and stated as these proposals do, and replaced by Mathlib's declarations when
equivalents land.

- [Mathlib #17368](https://github.com/leanprover-community/mathlib4/pull/17368): the
  Kuratowski–Ulam theorem as `curry_le_residual`, `eventually_eventually_left_of_mem_residual`,
  `IsMeagre.prod_left`, `BaireMeasurableSet.baireMeasurableSet_curry_left` and
  `BaireMeasurableSet.eventually_eventually_left_iff_mem_residual` (Layer 1.1).
- [Mathlib #42693](https://github.com/leanprover-community/mathlib4/pull/42693): `IsGδ.polishSpace`
  and `IsGδ.isCompletelyMetrizableSpace`; [Mathlib #42912](https://github.com/leanprover-community/mathlib4/pull/42912):
  a completely metrizable subspace is Gδ (Layer 0.2).
- [Mathlib #41945](https://github.com/leanprover-community/mathlib4/pull/41945), on
  [#41944](https://github.com/leanprover-community/mathlib4/pull/41944): the Borel graph theorem
  `analyticSet_graph_iff_measurable`, `measurable_of_analyticSet_graph` and
  `Measurable.measurableSet_graph` (Layer 0.3).
- [Mathlib #36412](https://github.com/leanprover-community/mathlib4/pull/36412) restates
  `PerfectSpace` as `∀ x, (𝓝[≠] x).NeBot`; the Layer 0.1 instances are stated so that either
  definition serves.

What is missing from Mathlib and built here: a working `PolishSpace (ℕ → Bool)` instance (at
the pinned Mathlib, instance search does not find it although `PolishSpace.mk` produces it);
`PerfectSpace` for infinite products; meagreness of countable sets; Gδ subspaces; analytic sets
under binary intersection, products, off-diagonals and saturation; the perfect set theorem
beyond closed sets; Kuratowski–Ulam; Mycielski; every object of Layers 1.3–5.

The Tau Ceti measurable-selection module `TauCeti.MeasureTheory.MeasurableSpace.Selection`
(Kuratowski–Ryll-Nardzewski, [Tau Ceti #13809](https://github.com/TauCetiProject/TauCeti/pull/13809))
is related but not consumed: no milestone here needs a selector.

---

## Layer 0 — Polish, Cantor-space and analytic-set infrastructure

### 0.1 Cantor and Baire space

- Register `PolishSpace (ℕ → Bool)` as an instance, and check that `PolishSpace (ℕ → ℕ)`,
  `StandardBorelSpace (ℕ → Bool)` and `BorelSpace (ℕ → Bool)` are found.
- `perfectSpace_pi`: a product of infinitely many nontrivial spaces has no isolated points,
  so `PerfectSpace (ℕ → Bool)` and `PerfectSpace (ℕ → ℕ)` hold. No separation axiom is needed:
  a basic neighbourhood constrains finitely many coordinates.
- `Set.Countable.isMeagre`: in a perfect `T₁` space every countable set is meagre (singletons
  are closed with empty interior). Consequently, in a nonempty perfect `T₁` Baire space every
  comeagre set is uncountable, and a nonempty perfect Polish space contains a Cantor copy and
  has cardinality 𝔠.
- Word cylinders: `prependWord`, `wordCylinder`, the prefix order on words against inclusion of
  cylinders, `prependWord w` as an open embedding onto the clopen set `wordCylinder w`, and the
  bridge `wordCylinder (PiNat.res x n).reverse = PiNat.cylinder x n`.
- The coordinate flip at position `n`, as a homeomorphism of Cantor space that maps
  `wordCylinder (s ++ [b])` onto `wordCylinder (s ++ [!b])` when `s.length = n`. Miller's
  independence lemma and the generic ergodicity of E₀ both use it.

### 0.2 Gδ subspaces

- `IsGδ.polishSpace`: a Gδ subset of a Polish space is Polish in the subspace topology, with no
  nonemptiness assumption; `IsGδ.standardBorelSpace` for the subspace σ-algebra.
- The converse: a subset of a metrizable space that is completely metrizable (in particular
  Polish) in the subspace topology is Gδ.
- Open and closed subsets are recovered as special cases; the existing `IsOpen.polishSpace` and
  `IsClosed.polishSpace` are not restated.

### 0.3 Analytic sets and Lusin–Souslin consequences

- `AnalyticSet.inter` (Hausdorff ambient space), `AnalyticSet.inter_measurableSet`,
  `AnalyticSet.prod`, `AnalyticSet.offDiag`, and the projection form: the image of an analytic
  subset of `X × Y` under `Prod.fst` is analytic.
- Saturation: for an analytic equivalence relation `E` on a Polish space and analytic `A`, the
  saturation `Quotient.mk E ⁻¹' (Quotient.mk E '' A)` is analytic (it is the first projection of
  the graph of `E` intersected with `X × A`). The same holds for the `G`-neighbourhood
  `{x | ∃ y ∈ A, (x, y) ∈ G ∨ (y, x) ∈ G}` of `A` under an analytic relation `G`.
- The Borel graph theorem, as in Mathlib #41945: a map between Polish Borel spaces is measurable
  iff its graph is analytic, iff its graph is Borel. The direction "measurable implies Borel
  graph" holds for any countably separated target.
- Functional Borel graphs: a Borel `G ⊆ X × Y` with at most one point above each `x`, with `X`
  and `Y` standard Borel, has a Borel domain; the projection `↥G → X` is a measurable embedding;
  `↥G` is measurably equivalent to the domain; and the named partial function on the domain is
  measurable, with `value_mem` and `value_eq_of_mem` identifying it. All of this is Lusin–Souslin
  through `MeasurableSet.image_of_measurable_injOn` and `Measurable.measurableEmbedding`.

### 0.4 Perfect sets and cardinality

- `MeasurableSet.exists_nat_bool_injection_of_not_countable`: an uncountable Borel subset of a
  Polish space contains the range of a continuous injection of Cantor space. Route: refine the
  topology to a Polish one in which the set is clopen (`MeasurableSet.isClopenable`), apply
  `IsClosed.exists_nat_bool_injection_of_not_countable` there, and coarsen the continuity back.
- `Perfect.mk_eq_continuum`: a nonempty perfect subset of a Polish space has cardinality 𝔠.
  The lower bound needs only a complete metric (`Perfect.exists_nat_bool_injection`); the upper
  bound is the cardinality of a Polish space.
- Cardinality bounds: a Polish space, and more generally a standard Borel space, has at most 𝔠
  points (`mk_le_continuum_of_standardBorelSpace`, through
  `MeasureTheory.exists_measurableEmbedding_real` and `Cardinal.mk_real`); hence so does any
  quotient of one.

### 0.5 Antichains, transport and countable splits

Define `HasPerfectAntichainOn`, `HasCantorAntichainOn` and `IsThinOn` as in Convention 6, and
build their API:

- monotonicity in the ambient set; `mono_relation` (a Cantor antichain for a coarser relation is
  one for a finer relation, stated with `E ≤ F`); `hasCantorAntichainOn_subtype_iff` (a
  Cantor antichain for the pulled-back relation on `↥A` is one on `A`, and conversely, so that a
  Cantor antichain on `A` bounds the quotient of `↥A` from below by `𝔠`); `mono_topology` (a Cantor antichain for a finer
  topology is one for a coarser topology, which carries witnesses built in a clopenable
  refinement back to the original topology);
- injectivity from reflexivity; `HasCantorAntichainOn.continuum_le_mk_quotient`, needing no
  metric; `HasCantorAntichainOn.hasPerfectAntichainOn` for a Hausdorff ambient space (the range
  is closed, as the continuous injective image of a compact space, and has no isolated points);
  the converse through `Perfect.exists_nat_bool_injection` in a completely metrizable space; and
  `hasCantorAntichainOn_iff_hasPerfectAntichainOn` on Polish spaces;
- `eq_continuum_of_hasCantorAntichainOn`: on a Polish space, a Cantor antichain gives exactly 𝔠
  classes;
- the Cantor-scheme extraction `CantorScheme.exists_antichain_map`: a `Bool`-scheme with vanishing
  diameter, nonempty branch intersections and `E`-inequivalent siblings induces a Cantor
  antichain along the scheme. Branch nonemptiness is a hypothesis, so the lemma applies to
  schemes of non-closed sets; for closed schemes in a complete space
  `ClosureAntitone.map_of_vanishingDiam` discharges it. Sibling disjointness is not assumed. This
  generalizes `CantorScheme.Disjoint.map_injective`, the case of equality;
- transport: for a measurable embedding `g : X → Y` of Polish Borel spaces with
  `F (g x) (g y) ↔ E x y`, `hasCantorAntichainOn_image_iff` and `isThinOn_image_iff` hold for
  every `A ⊆ X`, with no Borel hypothesis on `A`, `E` or `F`. The witness is transported as a
  Borel set, never as a continuous map: the range of a Cantor antichain is an uncountable Borel
  set of pairwise inequivalent points, its image (or preimage) is again one, and the Borel
  perfect set theorem extracts a new Cantor antichain;
- countable splits, with no topology: if each of countably many predicates on `X` has a
  countable truth side, then they are simultaneously constant off one countable set
  (`exists_countable_exceptions_of_splits`); a map depending only on their truth values has
  countable range; and on an uncountable domain, a map whose values are separated by countably
  many such tests is constant off a countable set.

**Acceptance check.** An uncountable Borel subset of ℝ (for example an uncountable closed set
minus a countable set) contains a Cantor copy, by
`MeasurableSet.exists_nat_bool_injection_of_not_countable`, and the set of pairs of distinct
points of an analytic set is analytic.

## Layer 1 — Baire category on products and on Cantor space

### 1.1 Kuratowski–Ulam

Build the Kuratowski–Ulam theorem in the shapes of Mathlib #17368, for topological spaces with
the stated second countability and no Baire hypothesis:

- `curry_le_residual` (`[SecondCountableTopology Y]`):
  `(residual X).curry (residual Y) ≤ residual (X × Y)`, so a comeagre subset of `X × Y` has
  comeagre sections over a comeagre set of `x`;
- `IsMeagre.prod_left`, `IsMeagre.prod_right`, and residual sections of Baire-measurable sets
  (`BaireMeasurableSet.baireMeasurableSet_curry_left`);
- `BaireMeasurableSet.eventually_eventually_left_iff_mem_residual` and its right-hand and
  swapped forms (both factors second countable): a Baire-measurable `s ⊆ X × Y` is comeagre iff
  comeagrely many sections are comeagre;
- the meagre-sections forms used by Layer 4: a Baire-measurable set is meagre iff comeagrely many of
  its sections are meagre, and `isMeagre_of_forall_isMeagre_sections` when every section is
  meagre.

The auxiliary statement that a nowhere dense subset of a product has nowhere dense sections over
a comeagre set (second factor second countable) is part of the API.

### 1.2 Mycielski

`mycielski`: let `X` be a nonempty perfect Polish space, `k : ℕ → ℕ`, and `R n ⊆ (Fin (k n) → X)`
meagre for every `n`. There is a continuous injection `f : (ℕ → Bool) → X` such that for every
`n` and every injective `a : Fin (k n) → (ℕ → Bool)`, the tuple `f ∘ a` is not in `R n`.

Cover each `R n` by countably many closed nowhere-dense sets; their complements are dense open sets
whose intersection is contained in the complement of `R n` (the complement itself need not be `Gδ`).
Then build, by recursion on levels, a scheme of nonempty open sets with closures shrinking to
diameter at most `2⁻ⁿ` in a compatible complete metric. At level `m` each node splits into two
children with disjoint closures, and then a finite fold over the injective `k`-tuples of distinct
level-`m` nodes shrinks them so that the product of their closures lies in the first `m` dense open
sets of every relation `R n` with `n ≤ m`. The induced map of the scheme (`CantorScheme.inducedMap`)
is total, continuous and injective, and avoids every `R n` on injective tuples, because two distinct
branches lie in distinct nodes from their first difference on. Avoidance holds only in the limit: a
dense meagre relation meets every product of open sets, so no finite stage avoids it. This is why
the construction does not factor through `CantorScheme.exists_antichain_map`.

Corollaries: `mycielski_cantor`, the binary case on Cantor space for one meagre
`M ⊆ (ℕ → Bool) × (ℕ → Bool)`; and a meagre equivalence relation on a nonempty perfect Polish
space has a Cantor antichain on `Set.univ`.

### 1.3 Baire-measurable maps

- `exists_isGδ_mem_residual_continuousOn`: if `Y` is second countable and every open preimage
  under `f : X → Y` has the Baire property, then `f` is continuous on a comeagre Gδ set. Borel
  maps between Polish Borel spaces satisfy the hypothesis through
  `MeasurableSet.baireMeasurableSet`.
- `exists_cantor_subcopy_continuous`: countably many maps from Cantor space into countable
  discrete spaces, each with Borel fibres, become simultaneously continuous after composing with
  one continuous injection `e` of Cantor space into itself. The conclusion is continuity of each
  composite `g i ∘ e`. Route: one comeagre Borel set on which every fibre agrees with an open
  approximant; it is uncountable (Layer 0.1); the Borel perfect set theorem gives `e` inside it.

### 1.4 The graphs G_S and Miller's independence lemma

- `orientedGS S`, the relation of pairs
  `(prependWord (s ++ [false]) x, prependWord (s ++ [true]) x)` for `s ∈ S` and
  `x : ℕ → Bool`, and `gSGraph S := SimpleGraph.fromRel` of it; the adjacency lemma
  `gSGraph_adj_iff` (no diagonal is removed, since the two ends differ at coordinate
  `s.length`). `orientedGS S` is a countable union of graphs of homeomorphisms between clopen
  sets, hence Fσ and Borel.
- `DenseWords S` (every word is a prefix of a word of `S`) and `SparseWords S` (at most one word
  of each length).
- The canonical words: `canonicalWord n` is the word coded by `(Nat.unpair n).1`, padded with
  `false` to length `n` when it is not longer than `n`, and the all-`false` word of length `n`
  otherwise. Prove that `canonicalWord n` has length `n`, that every word `r` is a prefix of
  `canonicalWord (Nat.pair (encode r) k)` for `k ≥ r.length`, and hence that
  `canonicalWords := Set.range canonicalWord` is dense with exactly one word of each length. The
  graph `gZero := gSGraph canonicalWords` is the Kechris–Solecki–Todorcevic G₀. Any dense set of
  words with one word per length serves equally; the statements of Layer 3 are made for every
  sparse set, so the choice is a normalization, not a restriction.
- `exists_gSGraph_adj_of_not_isMeagre` (Miller's independence lemma): for dense `S`, every
  non-meagre set with the Baire property contains two `gSGraph S`-adjacent points. A non-meagre
  Baire-measurable set is comeagre in some cylinder, hence in `wordCylinder s` for some `s ∈ S`;
  the coordinate flip at `s.length` exchanges the two halves, so the set and its flip meet in a
  comeagre subset of `wordCylinder (s ++ [false])`.
- Consequences: for dense `S`, every Baire-measurable `gSGraph S`-independent set is meagre;
  `gSGraph S` has no countable Baire-measurable coloring, in particular no countable Borel
  coloring; and for an equivalence relation `E` on Cantor space with Baire-measurable classes
  and no `E`-related `gSGraph S`-edge, every class is meagre. In pullback form: if
  `φ : (ℕ → Bool) → X` is continuous, `X` second countable, `E` Borel on `X`, and `φ` sends
  `gSGraph S`-edges to `E`-inequivalent pairs, then every section
  `{b | E (φ a) (φ b)}` is meagre.

**Acceptance check.** An equivalence relation on Cantor space with Borel graph and countable
classes is meagre in the square: each section is countable, hence meagre (Layer 0.1), and
Kuratowski–Ulam applies.

## Layer 2 — Borel colorings, separation and Miller's ideals

### 2.1 Independent sets and countable Borel colorings

- `RelIndependent G A` for `G : Set (X × X)`, with monotonicity, and its agreement with
  `SimpleGraph.IsIndepSet` for the edge relation of a simple graph.
- `HasCountableBorelColoring G` (Convention 7), with
  `hasCountableBorelColoring_iff_exists_cover` (a cover of `X` by countably many Borel
  independent sets) and `simpleGraph_hasCountableBorelColoring_iff` (a measurable
  `c : G.Coloring ℕ`). A relation with a loop at some point has no coloring at all.
- Pullback along Borel homomorphisms: if `φ` is measurable and sends `H`-pairs to `G`-pairs, a
  countable Borel coloring of `G` pulls back to one of `H`. Monotonicity in `G`.
- The hinge of the Silver route: for an equivalence relation `E` with Borel classes, the
  `E`-inequivalence relation `{p | ¬ E p.1 p.2}` has a countable Borel coloring iff `E` has
  countably many classes. Every independent set lies in one class; conversely the classes
  themselves form the cover.

### 2.2 Separation

- `exists_measurableSet_relIndependent_superset` (Kechris–Solecki–Todorcevic): on a Polish Borel
  space, an analytic `G`-independent set for an analytic relation `G` lies in a Borel
  `G`-independent set. Build a decreasing sequence of Borel sets containing `A`, each
  separated by Lusin separation from the `G`-neighbourhood of the previous one (Layer 0.3); the
  first stage is separated from the neighbourhood of `A` itself, which keeps `A` disjoint from
  every later neighbourhood. The intersection is Borel and independent.
- `exists_invariant_measurableSet_separating` (invariant Lusin separation): for an analytic
  equivalence relation `E` on a Polish Borel space, an analytic set `A` and an analytic
  `E`-invariant set `B` disjoint from it, there is an `E`-invariant Borel set containing `A` and
  disjoint from `B`. Iterate separation and saturation: separate the saturation of `A` from `B`,
  then the saturation of that separator, and take the union of the ω stages. Disjoint invariant
  analytic sets are therefore separated by an invariant Borel set.

### 2.3 Miller's ideals on families of assignments

These are the objects of the proof of the G₀ dichotomy. Fix an analytic relation `G` on a Polish
Borel space `X`.

- `IsSmallFamily G Φ` for `Φ ⊆ (ι → X)`: countably many Borel `G`-independent sets capture a value
  of every member of `Φ`. It is monotone, holds for `∅`, is closed under countable unions
  (`isSmallFamily_iUnion`), and so satisfies the pigeonhole: a non-small family covered by
  countably many pieces has a non-small piece. Non-small families are nonempty.
- The seed: for nonempty `ι`, `Set.univ : Set (ι → X)` is small iff `G` has a countable Borel
  coloring.
- Amalgamation positivity. Let `comb : (ι → X) → (ι → X) → κ → X` be any map whose values are
  values of its arguments. If `Φ` is not small, the plain combinations `comb φ₀ φ₁` with
  `φ₀, φ₁ ∈ Φ` form a non-small family. If moreover `ι` is countable and `Φ` is analytic, the
  combinations with a fresh edge `(φ₀ s, φ₁ s) ∈ G` at a designated `s` form a non-small family
  (`not_isSmallFamily_comb_cross`): otherwise the members of `Φ` avoiding the capturing sets form
  a non-small analytic subfamily whose values at `s` are `G`-independent, and the
  Kechris–Solecki–Todorcevic lemma captures that subfamily. When `comb` is continuous the
  combined families are analytic.
- Refinement folds, each producing a non-small analytic subfamily: *vertex shrinking* (for finite
  `ι`, all members uniformly within `2⁻ⁿ` at every coordinate, by the pigeonhole over a countable
  cover of `X` by Borel sets of small diameter), and *witness extension* (writing `G` as the range
  of a continuous `g` on Baire space, finitely many tracked coordinate pairs whose values are
  `g`-witnessed through the cylinder of a finite word of naturals all have their words properly
  extended, by a fold of the pigeonhole over one-letter extensions).

**Acceptance check.** For a Borel equivalence relation `E`, the inequivalence relation has a
countable Borel coloring exactly when `Quotient E` is countable (2.1), and in the uncountable
case `Set.univ : Set (Fin 1 → X)` is not small for it.

## Layer 3 — The G₀ dichotomy

Let `X` be a Polish Borel space and `G : Set (X × X)` analytic.

- `exists_continuous_orientedGS_hom` (the homomorphism half). If `S` is sparse and `G` has no
  countable Borel coloring, there is a continuous `φ : (ℕ → Bool) → X` with `(φ y, φ z) ∈ G`
  for every `(y, z) ∈ orientedGS S`. Neither symmetry nor irreflexivity of `G` is assumed.

  The proof is a fusion. Fix a compatible complete metric and write `G` as the range of a
  continuous `g : (ℕ → ℕ) → X × X` (`G` is nonempty, since otherwise every set is independent).
  A stage at level `n` consists of a non-small analytic family of maps
  `(Fin n → Bool) → X`, uniformly within `2⁻ⁿ` at every vertex, together with a finite word of
  naturals for every *level edge*, the level-`n` trace of an oriented `G_S`-edge, such that every
  member's values at the two ends of the edge are `g`-witnessed through that word. Level edges at
  `n + 1` are the extensions of level edges at `n` by a common last bit, together with the one
  fresh pair `(s ⌢ 0, s ⌢ 1)` when `S` has a word `s` of length `n`; sparseness is what makes
  the fresh pair unique. The one-step extension combines pairs of members by the last
  bit (crossing a fresh `G`-edge when there is a fresh pair, by amalgamation positivity), extends
  the inherited witness words, and shrinks vertices. Picking one member per stage, the values
  along a branch form a Cauchy sequence whose limit `φ` is continuous; along an oriented edge
  the witness words nest and grow, define a point `w` of Baire space, and continuity of `g`
  gives `g w = (φ y, φ z)`.
- `not_hasCountableBorelColoring_of_orientedGS_hom` (exclusivity). If `S` is dense and such a `φ`
  exists, `G` has no countable Borel coloring: a coloring would pull back to a countable Borel
  coloring of `gSGraph S`, contrary to Layer 1.4.
- The dichotomy for `canonicalWords`, in both forms:
  - oriented: for analytic `G`, exactly one of `HasCountableBorelColoring G` and the existence of
    a continuous oriented homomorphism from `orientedGS canonicalWords`;
  - symmetric (`g0_dichotomy`): for a simple graph `G` on `X` with analytic edge relation,
    exactly one of a measurable `c : G.Coloring ℕ` and a continuous `φ : gZero →g G`.
- Corollaries: a Borel equivalence relation `E` on `X` with uncountably many classes admits a
  continuous `φ : (ℕ → Bool) → X` sending `gZero`-adjacent points to `E`-inequivalent points
  (apply the oriented form to the inequivalence relation and use Layer 2.1); for every sparse
  `S` the same holds with `orientedGS S`.

**Acceptance check.** `gZero` has no countable Borel coloring (Layer 1.4), so the dichotomy is
not vacuous on its own graph; and for `S = {[]}`, which is sparse but not dense, `gSGraph S` is
2-colored by the first coordinate, so density is needed for exclusivity.

## Layer 4 — Silver's theorem

### 4.1 The category route

For a Borel equivalence relation `E` on a Polish Borel space `X` with uncountably many classes:
Layer 3 gives a continuous `φ` sending `gZero`-edges to inequivalent pairs; the pullback
relation `{(a, b) | E (φ a) (φ b)}` on Cantor space is Borel, and its sections are meagre by
Miller's lemma in pullback form (Layer 1.4); Kuratowski–Ulam makes it meagre; Mycielski gives a
continuous injection `ψ` of Cantor space whose distinct points are pullback-inequivalent; and
`φ ∘ ψ` is a Cantor antichain for `E` on `Set.univ`.

### 4.2 The forms of the theorem

- `silver_dichotomy`: on a Polish Borel space, a Borel equivalence relation satisfies
  `Countable (Quotient E) ∨ HasCantorAntichainOn E Set.univ`; equivalently, through Layer 0.5,
  countably many classes or a perfect antichain.
- `silver_dichotomy_standardBorel`: on a standard Borel space, countably many classes or a
  measurable embedding `f : (ℕ → Bool) → X` whose distinct points are inequivalent (choose a
  Polish topology and use `Continuous.measurableEmbedding`).
- `mk_quotient_le_aleph0_or_eq_continuum` (the cardinality form): on a standard Borel
  space, `#(Quotient E) ≤ ℵ₀ ∨ #(Quotient E) = 𝔠`. The upper bound is Layer 0.4.
- `countable_or_hasCantorAntichainOn_of_measurableSet` (relative form): let `X` be Polish Borel,
  `A ⊆ X` Borel, `R` any equivalence relation on `X`, and `F` a Borel equivalence relation on the
  subtype `↥A` with `R x y → F x y` for `x y : ↥A`. Then `Countable (Quotient F)` or
  `HasCantorAntichainOn R A`, with the antichain continuous for the original topology of `X`.
  Route: `↥A` is standard Borel; the standard Borel form gives a Borel uncountable set of
  pairwise `F`-inequivalent points, hence `R`-inequivalent; its image in `X` is Borel by
  Lusin–Souslin; the Borel perfect set theorem extracts a Cantor antichain. Nothing about
  perfectness survives a change of topology, and nothing needs to: only the Cantor form is
  moved.
- `AnalyticSet.exists_nat_bool_injection_of_not_countable` (perfect set theorem for analytic
  sets): an uncountable analytic subset of a Hausdorff space contains the range of a continuous
  injection of Cantor space. Write it as the range of a continuous `g` on a Polish space; the
  relation `g a = g b` is closed; Silver's theorem gives a Cantor antichain `h` for it, and
  `g ∘ h` is the injection.
- Silver for equality is the perfect set theorem for the space itself, and needs nothing beyond
  Mathlib's `IsClosed.exists_nat_bool_injection_of_not_countable`; the content of Silver's
  theorem is in the non-smooth relations of Layer 5.

### 4.3 The consumer interface

The counting of countable models in [CountableModelCounting](../CountableModelCounting/README.md) ([#1318](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1318))
consumes the following, and nothing about structures is stated here:

- the antichain vocabulary `HasCantorAntichainOn`, `HasPerfectAntichainOn` and `IsThinOn`, with
  `hasCantorAntichainOn_iff_hasPerfectAntichainOn`,
  `HasCantorAntichainOn.continuum_le_mk_quotient`, `HasCantorAntichainOn.mono_relation` and
  `hasCantorAntichainOn_image_iff` (Layer 0.5);
- `exists_countable_exceptions_of_splits` (Layer 0.5);
- the relative form of Silver's theorem, `countable_or_hasCantorAntichainOn_of_measurableSet`
  (4.2), with its witnessed conclusion;
- the cardinality form `mk_quotient_le_aleph0_or_eq_continuum` (4.2).

The other forms and lemmas of Layers 0.4–0.5 and 4.2 are targets of this roadmap in their own
right.

**Acceptance check.** On an uncountable Polish space, `silver_dichotomy` for `⊥` produces a
continuous injection of Cantor space, agreeing with
`IsClosed.exists_nat_bool_injection_of_not_countable` applied to `Set.univ`.

## Layer 5 — Borel reducibility, smoothness and E₀

### 5.1 Borel reducibility

- `BorelReducible E F` for setoids on measurable spaces `X` and `Y`: a measurable `f` with
  `E x y ↔ F (f x) (f y)`. Reflexivity, transitivity, and the induced bireducibility
  equivalence. A Borel reduction induces an injection `Quotient E → Quotient F`, so `F` has at
  least as many classes as `E`.
- Reductions between equalities: for standard Borel `X` and `Y`, `(⊥ : Setoid X)` reduces to
  `(⊥ : Setoid Y)` iff `#X ≤ #Y` (the uncountable case uses
  `PolishSpace.measurableEquivNatBoolOfNotCountable`).

### 5.2 Smoothness

- `IsSmooth E := BorelReducible E (⊥ : Setoid (ℕ → Bool))`.
- `isSmooth_iff_countablySeparated`: `E` is smooth iff `Quotient E` with Mathlib's quotient
  σ-algebra is countably separated, that is, countably many invariant Borel sets separate the
  classes. For uncountable standard Borel `Y`, smoothness is reducibility to equality on `Y`.
  A smooth equivalence relation is Borel, as the preimage of the closed diagonal of Cantor
  space.
- `isSmooth_of_countable_quotient`: a Borel equivalence relation with countably many classes is
  smooth (each class is a Borel section). Such a relation is bireducible with equality on
  `Quotient E`, whose quotient σ-algebra is then discrete.
- `isSmooth_of_isClosed`: a closed equivalence relation on a Polish space is smooth. For basic
  open sets `U` and `V` with `U ×ˢ V` disjoint from the graph of `E`, the saturations of `U` and
  `V` are disjoint invariant analytic sets; invariant Lusin separation (Layer 2.2) separates them
  by an invariant Borel set; the countably many separators separate the classes.
- Reducibility to a smooth relation preserves smoothness.

### 5.3 Silver in reducibility form

- `borelReducible_bot_cantor_iff`: for a Borel `E` on a standard Borel space, equality on Cantor
  space reduces to `E` iff `E` has uncountably many classes.
- The beginning of the Borel reducibility order: every Borel equivalence relation on a standard
  Borel space is bireducible with equality on `Fin n` for some `n`, or with equality on `ℕ`, or
  lies above equality on Cantor space; a smooth one with uncountably many classes is bireducible
  with equality on Cantor space.

### 5.4 E₀

- `eZero := Filter.germSetoid atTop Bool`, eventual equality on Cantor space; its quotient is
  `Filter.Germ atTop Bool`. On `ℕ`, `atTop` and `cofinite` agree (`Nat.cofinite_eq_atTop`), and
  the API states both readings.
- `measurableSet_eZero`: the graph of E₀ is Fσ, hence Borel. Every class is countable and dense.
  E₀ is meagre in the square (Layer 1 acceptance check).
- `isMeagre_or_mem_residual_of_eZero_invariant` (generic ergodicity): an E₀-invariant set with
  the Baire property is meagre or comeagre. Such a set is invariant under every coordinate flip;
  if it is comeagre in some cylinder, the flips carry that cylinder onto every cylinder of the
  same length.
- `not_isSmooth_eZero`: a countable family of invariant Borel sets is, by generic ergodicity,
  constant on one comeagre set, which then lies in a single class; classes are countable, hence
  meagre, contradicting the Baire category theorem.
- `hasCantorAntichainOn_eZero`: the continuous map `x ↦ (n ↦ x (Nat.unpair n).1)` sends distinct
  points to points differing at infinitely many coordinates. Hence
  `borelReducible_bot_eZero`, E₀ has 𝔠 classes, and E₀ lies strictly above equality on Cantor
  space.
- `not_isSmooth_of_borelReducible_eZero`, the easy half of Glimm–Effros, stated exactly as
  `BorelReducible eZero E → ¬ IsSmooth E` for any setoid `E` on a measurable space. Proof:
  compose the reductions, and apply `not_isSmooth_eZero`.

The converse, `¬ IsSmooth E → BorelReducible eZero E` for Borel `E` (in its strong form, a
continuous embedding of E₀; Harrington–Kechris–Louveau), is the general Glimm–Effros dichotomy.
It is not a target of this roadmap in any form, including its special cases for orbit
equivalence relations of Polish group actions; see [Out of scope](#out-of-scope-for-this-roadmap).

**Acceptance check.** `measurableSet_eZero`, `hasCantorAntichainOn_eZero` and
`not_isSmooth_eZero`, assembled only from Layers 0–2 and the definitions of 5.1–5.2.

## Worked examples

Discharge these alongside the layers; they check that the API describes real relations.

1. **Equality on an uncountable Polish space** (the smooth end): smooth, 𝔠 classes, Cantor
   antichain from Mathlib's closed perfect set theorem; on `ℝ` it is bireducible with equality on
   Cantor space.
2. **A finite and a countable quotient.** Equality of first coordinates, `x 0 = y 0`, on
   `ℕ → Bool` (two classes) and on `ℕ → ℕ` (countably many classes): both are closed, smooth,
   bireducible with equality on `Fin 2` and on `ℕ` respectively, and have no Cantor antichain.
3. **A closed relation with 𝔠 classes**: `|x| = |y|` on `ℝ`, and more generally the kernel of a
   continuous map between Polish spaces. Smooth by `isSmooth_of_isClosed` and directly by the
   map itself.
4. **E₀**: Borel, countable dense classes, generically ergodic, explicit Cantor antichain, not
   smooth. No Cantor scheme of open sets has E₀-inequivalent siblings, since any two nonempty
   open sets contain E₀-related points; this is why Silver's theorem is proved by Mycielski's
   limit avoidance rather than by finite-stage separation.
5. **The Vitali relation** on `ℝ`, `x - y ∈ ℚ`, as `QuotientAddGroup.leftRel` of the image of
   `Rat.castHom ℝ`, as a second non-smoothness example. It is Borel (a countable union of
   translates of the diagonal) with countable classes. Its invariant sets are invariant under
   every rational translation, so an invariant set with the Baire property that is comeagre in
   some open interval is comeagre in every rational translate of it, hence comeagre: invariant
   sets with the Baire property are meagre or comeagre. The argument of `not_isSmooth_eZero`
   then shows it is not smooth, and Silver's theorem gives it 𝔠 classes. No bireducibility with
   E₀ is claimed.
6. **Colorings.** The inequivalence relation of E₀ has no countable Borel coloring; the
   inequivalence relation of example 2 has one; `gZero` has none; `gSGraph {[]}` is 2-colorable.
7. **Mycielski regression.** Mycielski applied to E₀ (meagre by the Layer 1 acceptance check)
   produces a Cantor antichain, consistent with the explicit one of 5.4.
8. **Analytic perfect sets.** The projection to the first coordinate of an uncountable closed
   subset of `ℝ × (ℕ → ℕ)` with uncountable projection contains a Cantor copy by the analytic
   perfect set theorem.

## Completion criteria

Each introduced definition comes with its basic rewriting, monotonicity and transport API and
the stated examples. The headline theorems are assembled from these APIs, without hypotheses
asserting a homomorphism, a meagre pullback, a Cantor antichain or a separating family that the
roadmap is meant to prove.

The following chains must be visible in the exported results:

- Lusin separation → Kechris–Solecki–Todorcevic superset lemma → Miller's ideals and
  amalgamation positivity → fusion → the G₀ dichotomy, oriented and symmetric.
- G₀ dichotomy for the inequivalence relation → Miller's independence lemma in pullback form →
  Kuratowski–Ulam → Mycielski → `silver_dichotomy` → standard Borel, cardinal and relative forms.
- Invariant Lusin separation → closed relations are smooth; generic ergodicity → E₀ is not
  smooth; Silver → the reducibility form and the beginning of the reducibility order.

A theorem proved for a private Polish-space class, a private meagre predicate, a private graph
type or a bundled "Borel equivalence relation" structure does not discharge its target.

## Out of scope for this roadmap

The following belong to separate roadmaps.

- The converse half of Glimm–Effros, `¬ IsSmooth E → BorelReducible eZero E` for Borel `E`
  (Harrington–Kechris–Louveau, with its continuous-embedding strengthening), including its
  special cases for orbit equivalence relations of Polish group actions (Glimm, Effros,
  Becker–Kechris).
- The Gandy–Harrington topology and effective descriptive set theory: recursive presentations,
  lightface pointclasses, codes for Borel and analytic sets.
- The coanalytic form of Silver's theorem (whose category proof also needs the Baire property
  of analytic sets) and Burgess's theorem that an analytic equivalence relation has at most ℵ₁
  classes or a perfect antichain.
- Countable Borel equivalence relations.
- Hyperfiniteness.
- Polish group actions and orbit equivalence relations in general, including the logic action
  of `Equiv.Perm ℕ` on spaces of structures.
- Cantor–Bendixson ranks.
- Infinite games (Banach–Mazur, Choquet), determinacy, uniformization and the projective
  hierarchy.
- Borel chromatic numbers beyond the countable/uncountable alternative (finite Borel chromatic
  numbers, Borel Brooks-type theorems) and the Lecomte–Miller basis theorems.
- Everything about spaces of countable structures: the structure space, model classes,
  López–Escobar and the Borel complexity of isomorphism belong to
  [CountableStructureSpaces](../CountableStructureSpaces/README.md) ([#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316)); the counting of countable
  models belongs to [CountableModelCounting](../CountableModelCounting/README.md) ([#1318](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1318)).

## Coordination

- **Infinitary logic.** The [InfinitaryLogic](../InfinitaryLogic/README.md) roadmap lists the
  Silver and G₀ dichotomies among the invariant descriptive set theory it leaves to separate
  roadmaps; this is the general part of that material. It is consumed by
  [CountableModelCounting](../CountableModelCounting/README.md) ([#1318](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1318)) through the interface of 4.3, and
  this roadmap consumes nothing from either.
- **Spaces of countable structures.**
  [CountableStructureSpaces](../CountableStructureSpaces/README.md) ([#1316](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1316)) consumes four general
  results, none of which mentions structures: `IsGδ.polishSpace` and `IsGδ.standardBorelSpace`
  (Layer 0.2), for Gδ model classes; `AnalyticSet.prod` (Layer 0.3); and
  `exists_invariant_measurableSet_separating` (Layer 2.2), for separation invariant under the
  logic action, since the orbit equivalence relation of a continuous action of a Polish group
  is analytic.
- **Ownership of the consumed interface.** This roadmap owns the interface of 4.3 and the four
  results above. The CountableModelCounting prototype writes the perfect-set vocabulary out inline
  instead of copying it. Those inline forms are prototype scaffolding, not authorization to
  implement a parallel API in Tau Ceti. Changes to the interface here are propagated to them and
  rechecked by substituting this roadmap's declarations, until the consumer imports them directly.
- **Mathlib.** The proposals listed under *Existing library and ownership* fix the shape of the
  Kuratowski–Ulam, Gδ, Borel-graph and perfect-space targets. They are design references, not
  assumptions that their code has merged. Mathlib's closed-set Cantor–Bendixson decomposition is
  consumed; the ordinal Cantor–Bendixson analysis discussed on the Zulip thread
  [Cantor-Bendixson analysis](https://leanprover.zulipchat.com/#narrow/stream/287929-mathlib4/topic/Cantor-Bendixson.20analysis)
  is not a target. Opening an upstream PR is not a target of this roadmap; equivalent Mathlib
  declarations replace duplicate Tau Ceti declarations when they become available.

## Provenance

A Lean formalization of most of this roadmap exists in
[`cameronfreer/infinitary-logic`](https://github.com/cameronfreer/infinitary-logic) (Apache-2.0)
at checkpoint
[`518a366`](https://github.com/cameronfreer/infinitary-logic/tree/518a366cba97b1ae8c4dc64a297a396939bc3e0b),
sorry-free with axioms `propext`, `Classical.choice` and `Quot.sound`. It is a proof-script
reference, not the specification: its public statements assume a metric, a complete metric and
second countability where this roadmap assumes `PolishSpace`, its G₀ statements are for one
fixed sparse word set and symmetric relations, and its Silver theorem carries the historical
name `gandy_harrington_for_relation` although the proof is Miller's category route. Its
`Conditional/` directory name is historical; every file listed below is proved, and
`SilverCategoryRoute.lean` contains proposition-valued hypothesis packages
(`MycielskiCantorHypothesis`, `CategoryReductionHypothesis`, `GSGraphHomHypothesis`) that are
discharged in the same file and are not migration targets. Credit
`cameronfreer/infinitary-logic` in ported files.

| Roadmap item | Source file (under `InfinitaryLogic/`) | Adaptation notes |
| --- | --- | --- |
| 0.1 Cantor space | [`Descriptive/CantorStabilization.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/CantorStabilization.lean), [`Descriptive/GSGraph.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/GSGraph.lean) | the source keeps a local `PolishSpace (ℕ → Bool)` and proves only that Cantor space has no isolated points; the roadmap asks for the instance and for infinite products |
| 0.2 Gδ subspaces | [`Descriptive/GDeltaPolish.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/GDeltaPolish.lean) | forward direction only; the converse is new |
| 0.3 analytic sets | [`Descriptive/AnalyticClosure.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/AnalyticClosure.lean), [`Descriptive/BorelFunctionalGraph.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/BorelFunctionalGraph.lean), `relNbhd` in [`Descriptive/G0Dichotomy.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/G0Dichotomy.lean) | saturation by an analytic equivalence relation and the Borel graph theorem are new |
| 0.4 perfect sets | [`Topology/Perfect.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Topology/Perfect.lean), `MeasurableSet.exists_nat_bool_injection_of_not_countable` in `CantorStabilization.lean`, cardinal lemmas in [`Descriptive/PerfectAntichain.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/PerfectAntichain.lean) | the standard Borel cardinality bound is new |
| 0.5 antichains | `PerfectAntichain.lean`, [`Descriptive/CantorAntichain.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/CantorAntichain.lean), [`Descriptive/AntichainTransport.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/AntichainTransport.lean), [`Descriptive/CountableSplits.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/CountableSplits.lean) | the source states `mono_relation` with an explicit implication; the roadmap uses Mathlib's setoid order |
| 1.1 Kuratowski–Ulam | [`Descriptive/KuratowskiUlam.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/KuratowskiUlam.lean) | the source proves the meagre-sections direction under Baire hypotheses; the roadmap follows Mathlib #17368 |
| 1.2 Mycielski | [`Descriptive/Mycielski.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/Mycielski.lean) | binary relations on Cantor space, without injectivity; the general perfect-Polish, finite-arity form is new |
| 1.3 Baire-measurable maps | `CantorStabilization.lean` | the general comeagre-continuity theorem is new; the subcopy theorem is ported |
| 1.4 G_S graphs | `GSGraph.lean` | the source's `canonicalS` has strictly increasing but not consecutive lengths and its `GSGraph` is a bare relation; the roadmap uses `SimpleGraph.fromRel`, an oriented relation and one word per length |
| 2 colorings, separation, ideals | `G0Dichotomy.lean`, [`Descriptive/G0Fusion.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Descriptive/G0Fusion.lean) | `SmallFam` is `IsSmallFamily`; colorings and invariant separation for equivalence relations are new (the source's invariant separation is for the logic action only) |
| 3 G₀ dichotomy | `G0Fusion.lean` (`exists_gsGraph_hom`), `gSGraphHomHypothesis_holds` in [`Conditional/SilverCategoryRoute.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Conditional/SilverCategoryRoute.lean) | the source proves the homomorphism half for `canonicalS` and symmetric analytic relations; the oriented form for every sparse word set, exclusivity and the packaged dichotomy are new |
| 4 Silver | `SilverCategoryRoute.lean`, [`Conditional/GandyHarrington.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Conditional/GandyHarrington.lean) (`gandy_harrington_for_relation`, `silver_core_polish`, `silverBurgessDichotomy`), [`Conditional/SilverAntichain.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Conditional/SilverAntichain.lean) | `SilverBurgessDichotomy` is a proposition-valued definition in the source, proved there; the roadmap states the theorem directly as the cardinality form of Silver's theorem, `mk_quotient_le_aleph0_or_eq_continuum` (the source's name `silverBurgessDichotomy` is not a literature name). The analytic perfect set theorem is new |
| (not a target) closed-relation Silver | [`Conditional/SilverBurgess.lean`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/InfinitaryLogic/Conditional/SilverBurgess.lean) (`silver_core_closed`) | an independent proof of a special case, superseded by Layers 4 and 5.2 |
| 5 reducibility, smoothness, E₀ | none | new; the source's `GandyHarrington.lean` module docstring records the non-smoothness of E₀ as motivation only |

The source's [`docs/silver-phase2-route.md`](https://github.com/cameronfreer/infinitary-logic/blob/518a366cba97b1ae8c4dc64a297a396939bc3e0b/docs/silver-phase2-route.md)
is the proof map of the Silver and G₀ formalization.

## References

- J. H. Silver, "Counting the number of equivalence classes of Borel and coanalytic equivalence
  relations", *Annals of Mathematical Logic* 18 (1980), 1–28. The original theorem, for
  coanalytic relations, by effective methods.
- A. S. Kechris, S. Solecki and S. Todorcevic, "Borel chromatic numbers", *Advances in
  Mathematics* 141 (1999), 1–44. The G₀ dichotomy and the independent-superset lemma.
- B. D. Miller, "The graph-theoretic approach to descriptive set theory", *Bulletin of Symbolic
  Logic* 18 (2012), no. 4, 554–575. The classical proof of the G₀ dichotomy, the independence
  lemma for G_S and Silver's theorem from it.
- B. D. Miller, *Forceless, ineffective, powerless proofs of descriptive dichotomy theorems*,
  lecture notes; Lecture I is Silver's theorem by the category route.
- K. Kuratowski and S. Ulam, "Quelques propriétés topologiques du produit combinatoire",
  *Fundamenta Mathematicae* 19 (1932), 247–251.
- J. Mycielski, "Independent sets in topological algebras", *Fundamenta Mathematicae* 55 (1964),
  139–147.
- A. S. Kechris, *Classical Descriptive Set Theory*, Graduate Texts in Mathematics 156, Springer,
  1995. Polish spaces, perfect sets, Baire category, analytic sets, Lusin separation and
  Lusin–Souslin, Kuratowski–Ulam, Mycielski's theorem, and the continuity of Baire-measurable
  maps on a comeagre set.
- S. Gao, *Invariant Descriptive Set Theory*, CRC Press, 2009. Borel reducibility, smoothness,
  E₀ and the Silver and Glimm–Effros dichotomies.
- J. P. Burgess, "Equivalences generated by families of Borel sets", *Proceedings of the
  American Mathematical Society* 69 (1978), 323–326. Cited for the out-of-scope theorem on
  analytic equivalence relations.
- L. A. Harrington, A. S. Kechris and A. Louveau, "A Glimm–Effros dichotomy for Borel equivalence
  relations", *Journal of the American Mathematical Society* 3 (1990), 903–928. Cited for the
  out-of-scope general dichotomy.
- `cameronfreer/infinitary-logic`, Lean 4 formalization of infinitary logic and the descriptive
  set theory above, checkpoint `518a366`.
