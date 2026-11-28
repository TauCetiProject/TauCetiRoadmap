# Roadmap: metrization theorems

**Summary.** This roadmap characterizes metrizable topological spaces beyond the second-countable
case. Its objects are discrete families of sets (every point has a neighbourhood meeting at most
one member), σ-locally finite and σ-discrete families (countable unions of locally finite,
respectively discrete, families), and locally metrizable spaces. Separation axioms are stated
exactly as each theorem needs them: regularity alone where it suffices, and the T₀ axiom added
only where metrizability, rather than pseudometrizability, is concluded.

The headline theorems:

- (A. H. Stone) Every open cover of a pseudometrizable space has an open refinement that covers
  the space and is both locally finite and σ-discrete. Consequently a pseudometrizable space has
  a σ-discrete base.
- (Nagata–Smirnov and Bing) A space is metrizable if and only if it is regular, T₀ and has a
  σ-locally finite base, and if and only if it is regular, T₀ and has a σ-discrete base. A regular
  space with a σ-locally finite base, without the T₀ axiom, is pseudometrizable.
- (Michael) A regular space is paracompact if and only if every open cover has an open
  refinement that covers the space and is σ-locally finite.
- (Smirnov) A space is metrizable if and only if it is paracompact, Hausdorff and every point
  has an open neighbourhood that is metrizable.

Two further theorems complete the picture: Bing's theorem that a regular space in which every
open cover has a σ-discrete open refinement is collectionwise normal (disjoint open
neighbourhoods for every discrete family of closed sets), and A. H. Stone's theorem that a
product of uncountably many copies of the discrete space of natural numbers is not normal.

The roadmap builds on Mathlib's general topology: locally finite families, paracompactness and
its proof for (pseudo-extended) metric spaces, Urysohn's metrization theorem (the second-countable
case, which it does not restate), perfectly normal spaces and the shrinking lemma. Smirnov's
theorem applies to paracompact Hausdorff manifolds, and the Sorgenfrey line and the first
uncountable ordinal, from Mathlib's counterexamples, show which hypotheses are needed.

Layer 1 sets up discrete and σ-discrete families and proves Stone's refinement theorem with its
corollary on bases. Layer 2 works in regular spaces: Michael's characterization of
paracompactness, Bing's collectionwise normality, perfect normality and pseudometrizability from
a σ-locally finite base. Layer 3 assembles the metrization theorems of Nagata–Smirnov, Bing and
Smirnov, and proves Stone's non-normal product.

## Conventions

- `X` is a topological space. Separation axioms are Mathlib's: `RegularSpace` does not include
  `T0Space`; `T3Space` is `T0Space` together with `RegularSpace`; `ParacompactSpace` does not
  include a Hausdorff axiom. Munkres's "regular" includes T₁ and Michael's and Stone's
  "paracompact" includes Hausdorff; every statement below says which axiom it uses.
- An indexed family `f : ι → Set X` is *locally finite* in Mathlib's sense `LocallyFinite`. A base,
  an open cover or a refinement is a set of sets `𝒮 : Set (Set X)`; "`𝒮` is locally finite" means
  that the family `fun s : 𝒮 => (s : Set X)` is. A refinement of a cover `𝒰` is a set of sets each
  contained in a member of `𝒰`; "an open refinement that covers the space" is spelled out in each
  statement.
- σ-discrete implies σ-locally finite: a discrete family is locally finite, since a neighbourhood
  meeting the members of at most one index meets finitely many. This one-line fact is used
  inline below and is not a target.
- Bing's definition of a discrete collection (closures pairwise disjoint, and the union of the
  closures of any subcollection closed) agrees with the local definition of 1.1 for collections
  indexed injectively: if `x` lies in the closure of one member, the union of the closures of the
  others is a closed set missing `x`; if in none, the union of all closures is.

## Layer 1: discrete families and A. H. Stone's theorem

### 1.1 Discrete, σ-locally finite and σ-discrete families

Define `IsDiscreteFamily f` for `f : ι → Set X`: every point has a neighbourhood `U` such that the
set of indices `i` with `f i ∩ U` nonempty has at most one element. Define
`IsSigmaLocallyFinite 𝒮` and `IsSigmaDiscrete 𝒮` for `𝒮 : Set (Set X)`: there is a sequence
`b : ℕ → Set (Set X)` with `𝒮 = ⋃ n, b n` and each `b n` locally finite, respectively discrete.

API, each a short fact proved with the definitions:

- A discrete family is locally finite, its members are pairwise disjoint, the family of closures
  is again discrete, and the union of the members over any set of indices has closure equal to
  the union of their closures.
- A subfamily of a discrete family is discrete; a family of at most one set is discrete.
- A countable set of sets is σ-discrete (one set per index); a countable union of σ-discrete
  (σ-locally finite) sets of sets is σ-discrete (σ-locally finite), by reindexing along `ℕ × ℕ`.

**Checks.**

- The open intervals `(1/(n+1), 1/n)` in `ℝ` are pairwise disjoint but not locally finite at `0`,
  so not discrete: pairwise disjointness is a plausible wrong definition of discreteness.
- On every finite space of at most four points, the local definition agrees with Bing's (closures
  of members with distinct indices pairwise disjoint, and the union of the closures of any
  subfamily closed) for every indexed family of at most three subsets, repetitions allowed
  (exhaustive enumeration of the 390 topologies).

### 1.2 A. H. Stone's refinement theorem

Prove `exists_locallyFinite_isSigmaDiscrete_refinement`: if `X` is pseudometrizable and `u : ι →
Set X` is a family of open sets covering `X`, there is `𝒱 : Set (Set X)` of open sets, each
contained in some `u i`, covering `X`, locally finite and σ-discrete (Stone 1948, Corollary 1 and
the Remark, p. 979, for metric spaces: the Remark gives each stage pairwise disjoint closures,
which together with local finiteness is discreteness; Dydak, Corollary 5.5, for the σ-discrete
refinement).

Route. Mathlib's proof of `Metric.instParacompactSpace`, for pseudo-extended metric spaces, builds
a locally finite open refinement `D n i` (`n : ℕ`, `i : ι`) of `u` by Rudin's construction, but
keeps it inside the proof and exposes neither the family nor any property of its stages. Redo that construction for a
compatible pseudometric `d` and a well-order on `ι`: `D n i` is the union of the balls of radius
`2⁻ⁿ` around the points whose least covering index is `i`, whose ball of radius `3·2⁻ⁿ` lies in
`u i`, and which lie in no `D m j` with `m < n`. Openness, `D n i ⊆ u i`, covering and local
finiteness are proved as in Mathlib. Take `𝒱` the set of all `D n i`, locally finite as a set of
sets by `LocallyFinite.on_range`, and `b n` its `n`-th stage. What has to be added is that each
stage is discrete.

- Two points in different members `D n i ≠ D n j` of stage `n`, say with `i < j`, are more than
  `2⁻ⁿ` apart. Their centres `y` (for `i`) and `z` (for `j`) are at least `3·2⁻ⁿ` apart, since the
  ball of radius `3·2⁻ⁿ` about `y` lies in `u i` while `z`, whose least covering index is `j`, is
  not in `u i`; the triangle inequality loses at most `2·2⁻ⁿ`.
- Hence any set of diameter at most `2⁻ⁿ`, in particular a ball of radius `2⁻ⁿ⁻¹` about any
  point, meets at most one member of `b n`, so `b n` is discrete.

Nowhere is `d(x, y) = 0 ⇒ x = y` used, so the theorem holds for pseudometrizable spaces.

*Needs:* 1.1; Mathlib `TopologicalSpace.pseudoMetrizableSpacePseudoMetric`,
`exists_wellFoundedLT`, `LocallyFinite.on_range`.

**Checks.**

- Pseudometrizability is needed: the space of countable ordinals (Mathlib's `Iio ω₁` in the order
  topology) is regular and Hausdorff but not paracompact, so some open cover has no locally finite
  open refinement.

### 1.3 A σ-discrete base

Prove `exists_isTopologicalBasis_isSigmaDiscrete`: a pseudometrizable space has a σ-discrete base
(Bing 1951, proof of necessity of Theorem 3, p. 179; Dydak, Corollary 5.6).

Route. Fix a compatible pseudometric. For each `k`, apply 1.2 to the cover by the balls
`B(x, 2⁻ᵏ)`, `x ∈ X`, to get a σ-discrete open refinement `𝒱 k` covering `X`; let `𝓑 = ⋃ k, 𝒱 k`,
σ-discrete by reindexing along `ℕ × ℕ`. Given `x ∈ O` open, choose `k` with `B(x, 2⁻ᵏ⁺¹) ⊆ O`
and `V ∈ 𝒱 k` containing `x`; `V` lies in a ball of radius `2⁻ᵏ` through `x`, so `V ⊆ O`.

*Needs:* 1.1, 1.2; Mathlib `TopologicalSpace.isTopologicalBasis_of_isOpen_of_nhds`.

**Checks.**

- Pseudometrizability is needed: the Sorgenfrey line is T₃ and not metrizable (both from Mathlib's
  `Counterexamples/SorgenfreyLine.lean`, which is not importable; see 3.1), so by 3.1 it has no
  σ-locally finite base, and a fortiori no σ-discrete one.

### Examples

- On a discrete space the cover by singletons is its own discrete refinement. On an indiscrete
  two-point space (pseudometrizable by the zero pseudometric) every open cover contains the whole
  space, and `{univ}` is a discrete refinement.

### Dependencies

Mathlib only (pseudometrizable spaces, compatible pseudometrics, locally finite families,
topological bases, well-orders).

## Layer 2: regular spaces with σ-locally finite refinements or bases

### 2.1 Michael's theorem

Prove `paracompactSpace_iff_forall_isSigmaLocallyFinite_refinement`: for a regular space `X`,
`ParacompactSpace X` holds if and only if every open cover `𝒰` of `X` has an open refinement that
covers `X` and is σ-locally finite (Michael 1953, Theorem 1, p. 831; Munkres, Lemma 41.3).

Route. The forward direction needs no regularity: a locally finite open refinement, indexed by
its range (`LocallyFinite.on_range`), is σ-locally finite with all stages equal. The converse
passes through refinements that are locally finite but not open, in three moves.

- Disjointifying the stages. Given a σ-locally finite open refinement `⋃ n, 𝒱 n` of `𝒰`, cut each
  member of the `n`-th stage down to the points not covered by any earlier stage. The pieces still
  cover `X` and refine `𝒰`; near a point `x` whose first covering stage is `m`, the union of the
  `m`-th stage is an open set containing `x` that meets no piece of a later stage, and each of the
  stages up to `m` contributes finitely many pieces near `x`. So every open cover has a locally
  finite refinement covering `X`.
- Closing up. By regularity the open sets whose closures lie in a member of `𝒰` cover `X`. A
  locally finite refinement of that cover, from the first move, has closures that again form a
  locally finite family (`LocallyFinite.closure`) refining `𝒰`: every open cover has a closed
  locally finite refinement covering `X`.
- Opening up. Let `𝒜` be a locally finite refinement of `𝒰` covering `X`. The open sets meeting
  only finitely many members of `𝒜` cover `X`; let `𝒲` be a closed locally finite refinement of
  that cover. Enlarge `A ∈ 𝒜` to the set `Â` of points `x` such that every member of `𝒲`
  containing `x` meets `A`. Its complement is a union of members of `𝒲`, hence closed
  (`LocallyFinite.isClosed_iUnion`), so `Â` is open, and `A ⊆ Â`; a member of `𝒲` that misses
  `A` misses `Â`. The open sets `Â ∩ U`, with `U ∈ 𝒰` chosen to contain `A`, cover `X` and refine
  `𝒰`. Near a point, finitely many members of `𝒲` cover a neighbourhood, and each of them meets
  only finitely many `A` and so only finitely many `Â`: the refinement is locally finite.

*Needs:* 1.1; Mathlib `ParacompactSpace`, `LocallyFinite.on_range`, `LocallyFinite.closure`,
`LocallyFinite.isClosed_iUnion`, `exists_mem_nhds_isClosed_subset`.

**Checks.**

- Regularity is needed: the real line with the K-topology (open intervals and open intervals
  minus `{1/n : n ≥ 1}`) is Hausdorff and second countable, so every open cover has a countable
  subcover, which is σ-locally finite; but it is T₁ and not regular, hence not normal, while a
  paracompact Hausdorff space is normal, so it is not paracompact.
- On an indiscrete two-point space (regular, not T₀) both sides hold.

### 2.2 Bing's collectionwise normality

Prove `exists_pairwise_disjoint_open_of_isDiscreteFamily`: let `X` be regular, and suppose every
open cover of `X` has an open refinement that covers `X` and is σ-discrete. Then for every
discrete family `F : ι → Set X` of closed sets there are open sets `U i ⊇ F i` that are pairwise
disjoint (Bing 1951, Theorem 2, p. 177).

Route. By discreteness and regularity each point has an open neighbourhood whose closure meets at
most one `F i`; let `𝒦` be the cover by these, and `𝓗 = ⋃ n, 𝓗 n` a σ-discrete open refinement of
`𝒦` covering `X`. The closure of each member of `𝓗` meets at most one `F i`. Let `P n i` be the
union of the members of `𝓗 n` meeting `F i` and `Q n i` the union of those meeting some `F j`,
`j ≠ i`; `Q n i` has closure equal to the union of the closures of its members (1.1). Put
`U i = ⋃ n, (P n i \ ⋃ m ≤ n, closure (Q m i))`.

- `U i` is open, and `F i ⊆ U i`: a point `a ∈ F i` lies in a member of some `𝓗 n` meeting `F i`,
  and lies in the closure of no member meeting another `F j`, since that closure would meet two
  members of `F`.
- If `i ≠ j`, a point of `U i ∩ U j` lies in `P n i \ closure (Q n' i)` for `n' ≤ n` and in
  `P k j \ closure (Q k' j)` for `k' ≤ k`; with `n ≤ k`, it lies in `P n i ⊆ Q n j` and outside
  `closure (Q n j)`, which is absurd.

No T₁ axiom is used, and the argument uses only that each stage `𝓗 n` is locally finite: its
discreteness enters once, through `LocallyFinite.closure_iUnion`. So the conclusion also holds
when every open cover has a σ-locally finite open refinement, that is, by 2.1, for a paracompact
regular space. For a pseudometrizable space the hypothesis holds by 1.2, which gives Bing's
theorem that metrizable spaces are collectionwise normal.

*Needs:* 1.1; Mathlib `exists_mem_nhds_isClosed_subset`, `LocallyFinite.closure_iUnion`.

**Checks.**

- Regularity is needed: in the K-topology on `ℝ` (2.1) every open cover has a countable subcover,
  which is σ-discrete; the closed sets `{0}` and `{1/n : n ≥ 1}` form a discrete family of two
  members that have no disjoint open neighbourhoods.
- The refinement hypothesis is needed: `Iio ω₁ × Iic ω₁` is T₃ and not normal
  (`Counterexample.Omega1Space.not_normalSpace_Iio_prod_Iic_omega_one`, in Mathlib's
  `Counterexamples` folder, which is not importable), and a two-member family of disjoint closed
  sets is discrete.
- With two members the conclusion is normality; with `ι` empty it is trivially true.

### 2.3 Perfect normality from a σ-locally finite base

Prove that a regular space with a σ-locally finite base `B = ⋃ n, b n` is perfectly normal
(Mathlib's `PerfectlyNormalSpace`: normal, and every closed set is a Gδ) (Munkres, Lemma 40.1;
Dydak, proof of Corollary 3.11). This is the first step of the route of 2.4 and is not stated
in Lean: once 2.4 is proved it also follows from Mathlib's instance that pseudometrizable spaces
are perfectly normal (`Mathlib/Topology/GDelta/MetrizableSpace.lean`), so as a Lean statement it
would be a one-step corollary of 2.4.

Route. For an open set `O` and each `n`, let `F n O` be the union of the closures of the members of
`b n` whose closure lies in `O`. It is closed (`LocallyFinite.closure`,
`LocallyFinite.isClosed_iUnion`), and by regularity `O = ⋃ n, F n O`; so every closed set
`X \ O = ⋂ n, X \ F n O` is a Gδ. Normality: for disjoint closed `A`, `C`, let `G n` be the union of
the members of `b n` whose closures miss `C`, and `H n` likewise with `A`; by regularity the `G n`
cover `A` and the `H n` cover `C`, and `closure (G n)` misses `C` (`LocallyFinite.closure_iUnion`
for the locally finite subfamily). The open sets
`⋃ n, (G n \ ⋃ m ≤ n, closure (H m))` and `⋃ n, (H n \ ⋃ m ≤ n, closure (G m))` contain `A` and
`C` and are disjoint.

*Needs:* 1.1; Mathlib `PerfectlyNormalSpace`, `LocallyFinite.closure`,
`LocallyFinite.isClosed_iUnion`, `LocallyFinite.closure_iUnion`,
`exists_mem_nhds_isClosed_subset`.

**Checks.**

- The σ-locally finite base is needed: `Iic ω₁` is compact Hausdorff, hence regular and normal,
  but the closed point `ω₁` is not a Gδ (a countable intersection of neighbourhoods of `ω₁`
  contains a tail of countable ordinals).
- Regularity is needed: the K-topology on `ℝ` has a countable base and is not normal.
- An indiscrete two-point space satisfies the hypotheses and is perfectly normal; it is not T₀,
  which is why the statement concludes `PerfectlyNormalSpace` and not `T6Space`.

### 2.4 Pseudometrizability from a σ-locally finite base

Prove `pseudoMetrizableSpace_of_isTopologicalBasis_isSigmaLocallyFinite`: a regular space with a
σ-locally finite base is pseudometrizable (Munkres, Theorem 40.3, sufficiency; Dydak,
Corollary 3.11).

Route. Write `B = ⋃ n, b n`. By 2.3 and `perfectlyNormalSpace_iff_forall_isClosed_preimage_zero`,
each `D ∈ b n` is the set where a continuous `f_D : X → [0, 1]` is positive. Let `J` be the set of
pairs `(n, D)` with `D ∈ b n` and define `Φ : X → ℓ^∞(J)`, into bounded real functions on `J` with
the supremum distance, by `Φ(x)(n, D) = f_D(x) / (n + 1)`.

- `Φ` is continuous: given `x₀` and `ε > 0`, choose `N` with `1/(N + 2) < ε`. For `n ≤ N` a
  neighbourhood of `x₀` meets finitely many members of `b n`, and `f_D` vanishes off `D`, so on
  that neighbourhood only finitely many coordinates with `n ≤ N` are nonzero; by continuity of
  these finitely many `f_D` a smaller neighbourhood keeps them within `ε` of their values at `x₀`.
  The coordinates with `n > N` differ by at most `1/(N + 2)`.
- `Φ` is inducing: for `x₀ ∈ O` open, choose `D ∈ b n` with `x₀ ∈ D ⊆ O`; if
  `dist (Φ x) (Φ x₀) < f_D(x₀)/(n + 1)` then `f_D(x) > 0`, so `x ∈ O`.

Hence `X` is pseudometrizable (`Topology.IsInducing.pseudoMetrizableSpace`). No T₀ axiom is used:
points with the same neighbourhoods have the same image.

*Needs:* 1.1, 2.3; Mathlib `perfectlyNormalSpace_iff_forall_isClosed_preimage_zero`,
`Topology.isInducing_iff_nhds`, `Topology.IsInducing.pseudoMetrizableSpace`,
`BoundedContinuousFunction.dist_le`.

**Checks.**

- The σ-locally finite base is needed: `Iic ω₁` is regular and not first countable at `ω₁`, so it
  is not pseudometrizable.
- On an indiscrete two-point space `Φ` is constant and the zero pseudometric is compatible.

### Examples

- A countable base is σ-locally finite (one set per stage), so 2.4 contains the pseudometrizable
  form of Urysohn's metrization theorem, Mathlib's
  `TopologicalSpace.PseudoMetrizableSpace.of_regularSpace_secondCountableTopology`.
- A regular Lindelöf space is paracompact by 2.1 (Michael 1953, p. 833; Munkres, Theorem 41.5): a
  countable subcover is a σ-locally finite refinement.

### Dependencies

Layer 1 (1.1 only). Mathlib: paracompact spaces, perfectly normal spaces, regular spaces, bounded
continuous functions, inducing maps into pseudometrizable spaces.

## Layer 3: the metrization theorems and a non-normal product

### 3.1 The theorems of Nagata–Smirnov and Bing

Prove `metrizableSpace_iff_isSigmaLocallyFinite_basis_and_isSigmaDiscrete_basis`: `X` is
metrizable if and only if `T3Space X` and `X` has a σ-locally finite base; and `X` is metrizable
if and only if `T3Space X` and `X` has a σ-discrete base (Munkres, Theorem 40.3; Bing 1951,
Theorem 3, p. 178; Dydak, Corollaries 3.11 and 5.6).

Route. A metrizable space is T₃ (it is regular by `PseudoMetrizableSpace.regularSpace` and T₀ by
`MetrizableSpace.toT0Space`) and has a σ-discrete base by 1.3, which is σ-locally finite. A T₃
space with a σ-locally finite base is pseudometrizable by 2.4 and T₀, hence metrizable
(`PseudoMetrizableSpace.toMetrizableSpace`); a σ-discrete base is σ-locally finite.

*Needs:* 1.1, 1.3, 2.4; Mathlib `TopologicalSpace.PseudoMetrizableSpace.regularSpace`,
`TopologicalSpace.MetrizableSpace.toT0Space`,
`TopologicalSpace.PseudoMetrizableSpace.toMetrizableSpace`.

**Checks.**

- The T₀ axiom is needed: an indiscrete two-point space is regular with the finite base `{univ}`
  and is not metrizable.
- Regularity is needed: the K-topology on `ℝ` is Hausdorff with a countable base and is not
  metrizable.
- The Sorgenfrey line is T₃ (Hausdorff, its topology being order-closed, and completely normal)
  and not metrizable, all three in Mathlib's `Counterexamples/SorgenfreyLine.lean` (the
  `Counterexamples` folder is not importable), so it has no σ-locally finite base.
- An uncountable discrete space is metrizable; its singletons form a discrete base, while it has no
  countable base: the theorem reaches beyond Urysohn's.

### 3.2 Smirnov's metrization theorem

Define `IsLocallyMetrizable X`: every point of `X` has an open neighbourhood `U` with
`MetrizableSpace U` for the subspace topology. Prove
`metrizableSpace_iff_paracompactSpace_t2Space_isLocallyMetrizable`: `X` is metrizable if and only
if it is paracompact, Hausdorff and locally metrizable (Munkres, Theorem 42.1).

Route. A metrizable space is paracompact (`Metric.instParacompactSpace` for a compatible metric),
Hausdorff, and locally metrizable with `U = univ`. Conversely, let `X` be paracompact, Hausdorff
and locally metrizable. It is normal (`NormalSpace.of_paracompactSpace_r1Space`) and T₁, hence T₃.

- By `precise_refinement` applied to metrizable open neighbourhoods, there is a locally finite
  open cover `v s` with each `v s` metrizable (`Topology.IsEmbedding.metrizableSpace`), and by
  `exists_iUnion_eq_closure_subset` (point-finite by local finiteness) an open cover `w s` with
  `closure (w s) ⊆ v s`.
- By 1.3 each `v s` has a σ-discrete, hence σ-locally finite, base `⋃ n, 𝒟 s n` of open subsets
  of `v s`. Let `𝓑 n`
  be the set of the sets `D ∩ w s` for all `s` and `D ∈ 𝒟 s n`, read in `X`; these are open in `X`
  because `v s` is open.
- `𝓑 n` is locally finite in `X`: a point `x` has a neighbourhood meeting only finitely many
  `v s`, and each member `D ∩ w s` lies in `v s`. For each of those finitely many `s`, either `x`
  is outside `closure (w s)`, which gives a neighbourhood missing every `D ∩ w s`; or `x ∈
  closure (w s) ⊆ v s`, and local finiteness of `𝒟 s n` in `v s` gives a neighbourhood of `x`,
  open in `X`, meeting finitely many `D`.
- `⋃ n, 𝓑 n` is a base: for `x ∈ O` open choose `s` with `x ∈ w s` and `D ∈ 𝒟 s n` with
  `x ∈ D ⊆ O ∩ w s`; then `D ∩ w s = D`.

So `X` is T₃ with a σ-locally finite base, and metrizable by 3.1.

*Needs:* 1.3, 3.1; Mathlib `Metric.instParacompactSpace`,
`TopologicalSpace.metrizableSpaceMetric`, `NormalSpace.of_paracompactSpace_r1Space`,
`precise_refinement`, `exists_iUnion_eq_closure_subset`, `Topology.IsEmbedding.metrizableSpace`,
`TopologicalSpace.MetrizableSpace.subtype`.

**Checks.**

- Paracompactness is needed: `Iio ω₁` is Hausdorff and locally metrizable (each point has a
  countable compact neighbourhood `[0, α]`, open in `Iio ω₁`, which is second countable and
  regular), and it is not metrizable, being countably compact and not compact.
- The Hausdorff axiom is needed: the interval `[−1, 1]` with its origin doubled is compact, hence
  paracompact in Mathlib's sense, and locally metrizable (each point lies in an open copy of an
  interval), but not Hausdorff.
- Local metrizability is needed: `Iic ω₁` is compact Hausdorff, hence paracompact, and not
  metrizable (it is not first countable at `ω₁`), so `ω₁` has no metrizable open neighbourhood.

### 3.3 A non-normal product

Prove `not_normalSpace_pi_nat`: if `ι` is uncountable, the product `ι → ℕ` of copies of the
discrete space `ℕ` is not normal (Stone 1948, Theorem 3, pp. 980–981).

Route. Let `A` be the set of `x` such that every value other than `0` is taken at most once, and
`C` the set of `x` such that every value other than `1` is taken at most once. Both are closed:
if two coordinates `λ ≠ μ` share a value `v ≠ 0`, fixing those two coordinates gives a
neighbourhood outside `A`. They are disjoint: a point of `A ∩ C` takes every value at most once,
so it is an injection of the uncountable `ι` into `ℕ`. Suppose open `U ⊇ A` and `V ⊇ C` are
disjoint; a basic neighbourhood fixes the coordinates in a finite set. The contradiction comes
from a point that copies a point of `A` on one finite set and a point of `C` on another.

- Labelling. Build finite sets `F₁ ⊊ F₂ ⊊ ⋯` of coordinates together with an injective
  labelling `λ : ℕ₊ → ι` such that `F_n` is the image of `{1, …, m(n)}`. For a finite set of
  labels `K`, write `a_K` for the point that equals `k` at `λ_k` for `k ∈ K` and `0` everywhere
  else; it lies in `A`. Start with `F₁` the coordinates fixed by a basic neighbourhood of the
  constant point `0` inside `U`; given `F_n`, let `F_{n+1}` be a finite set strictly containing
  `F_n` such that fixing it at `a_{{1, …, m(n)}}` gives a neighbourhood inside `U`, and extend
  the labelling to the new coordinates.
- The point `b` that equals `k` at every `λ_k` and `1` off the image of `λ` lies in `C`, so fixing
  some finite set `G` at `b` gives a neighbourhood inside `V`. Only finitely many labels occur in
  `G`; choose `n` with all of them at most `m(n)`.
- The point equal to `a_{{1, …, m(n)}}` on `F_{n+1}` and to `b` elsewhere agrees with `b` on `G`,
  because on `F_n` both points are the labels and `G` misses `F_{n+1} \ F_n`. So it lies in
  `U ∩ V`.

*Needs:* Mathlib `Pi.topologicalSpace` (product topology, basic open sets fixing finitely many
coordinates), the discrete topology on `ℕ`, `NormalSpace`.

**Checks.**

- Uncountability is needed: for countable `ι` the product `ι → ℕ` is metrizable (a countable
  product of metrizable spaces), hence normal.
- Infinitely many values are needed: for a finite discrete space `Y`, `ι → Y` is compact
  Hausdorff, hence normal; the labelling above uses a new value for every labelled coordinate.

### Examples

- Every second-countable T₃ space is metrizable (Urysohn), since a countable base is σ-discrete.
- A paracompact Hausdorff topological manifold modelled on a normed space is metrizable by 3.2.

### Dependencies

Layers 1 and 2 (1.3, 2.4). Mathlib: metrizable and paracompact spaces, the shrinking lemma,
product topologies.

## Scope and ownership

This roadmap owns the definitions of 1.1 and 3.2 and the nine theorems 1.2, 1.3, 2.1–2.4 and
3.1–3.3; eight of them are stated in `Suggested.lean`, all but 2.3, which is a step of the route
of 2.4.

Already in the library and not restated: Urysohn's metrization theorem
(`TopologicalSpace.metrizableSpace_of_t3_secondCountable` and its pseudometrizable form); the
paracompactness and normality of (pseudo-extended) metric spaces (`Metric.instParacompactSpace`,
`Metric.t4Space`), which 1.2 sharpens to a locally finite σ-discrete refinement; metrizability of
T₀ uniform spaces with countably generated uniformity (`UniformSpace.metrizableSpace`); perfect
normality of pseudometrizable spaces; Dieudonné's theorem that paracompact R₁ spaces are normal;
and, in Mathlib's counterexample files (not importable), the Sorgenfrey line (not metrizable, not
second countable, completely normal, with non-normal square) and the non-normal product
`Iio ω₁ × Iic ω₁`. The Checks above cite these as facts and do not restate them.

Not treated here: metrization through developments (Moore spaces and Bing's metrization theorems
for them), Frink's and Alexandroff–Urysohn's metrization theorems, uniform and complete
metrizability, normality of products of more than countably many metric
spaces in general (Stone's Theorem 4), and paracompactness and normality of specific
counterexample spaces such as the Sorgenfrey line.

Layer 1 serves dimension theory and partitions of unity on metric spaces, Layer 2 gives
regular-space criteria, and Layer 3 metrization criteria for spaces with no countable base.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Topology/LocallyFinite.lean`: `LocallyFinite` (every point has a neighbourhood meeting
  finitely many members), `LocallyFinite.on_range`, `LocallyFinite.closure`,
  `LocallyFinite.isClosed_iUnion` (closed members), `LocallyFinite.closure_iUnion`.
- `Mathlib/Topology/Compactness/Paracompact.lean`: `ParacompactSpace` (no Hausdorff axiom),
  `precise_refinement` (paracompact `X`, open cover indexed by `ι`, a locally finite open
  refinement indexed by `ι` with `v i ⊆ u i`), `NormalSpace.of_paracompactSpace_r1Space`.
- `Mathlib/Topology/EMetricSpace/Paracompact.lean`: `Metric.instParacompactSpace` (every
  `PseudoEMetricSpace` is paracompact), `Metric.t4Space`.
- `Mathlib/Topology/Metrizable/Basic.lean`: `TopologicalSpace.PseudoMetrizableSpace`,
  `TopologicalSpace.MetrizableSpace` (extends `T0Space`), `MetrizableSpace.toT0Space`,
  `PseudoMetrizableSpace.toMetrizableSpace` (`T0Space` and pseudometrizable),
  `PseudoMetrizableSpace.regularSpace`, `MetrizableSpace.subtype`,
  `Topology.IsInducing.pseudoMetrizableSpace` and `Topology.IsEmbedding.metrizableSpace` (target
  pseudometrizable, respectively metrizable); all in namespace `TopologicalSpace` except the last
  two.
- `Mathlib/Topology/Metrizable/Uniformity.lean`:
  `TopologicalSpace.pseudoMetrizableSpacePseudoMetric` and
  `TopologicalSpace.metrizableSpaceMetric` (a compatible pseudometric, respectively metric),
  `UniformSpace.metrizableSpace`.
- `Mathlib/Topology/Metrizable/Urysohn.lean`:
  `TopologicalSpace.metrizableSpace_of_t3_secondCountable`,
  `TopologicalSpace.PseudoMetrizableSpace.of_regularSpace_secondCountableTopology`.
- `Mathlib/Topology/Separation/GDelta.lean`: `PerfectlyNormalSpace` (normal, closed sets Gδ).
  `Mathlib/Topology/Separation/PerfectlyNormal.lean`:
  `perfectlyNormalSpace_iff_forall_isClosed_preimage_zero` (closed sets are zero sets of
  continuous maps to `[0, 1]`). `Mathlib/Topology/GDelta/MetrizableSpace.lean`: the instance
  that a pseudometrizable space is perfectly normal.
- `Mathlib/Topology/Separation/Regular.lean`: `RegularSpace`, `T3Space`,
  `exists_mem_nhds_isClosed_subset` (regular `X`: every neighbourhood contains a closed one).
- `Mathlib/Topology/ShrinkingLemma.lean`: `exists_iUnion_eq_closure_subset` (normal `X`, open
  point-finite cover `u`: an open cover `v` with `closure (v i) ⊆ u i`).
- `Mathlib/Topology/Bases.lean`: `TopologicalSpace.IsTopologicalBasis`,
  `TopologicalSpace.isTopologicalBasis_of_isOpen_of_nhds`.
- `Mathlib/Topology/Maps/Basic.lean`: `Topology.isInducing_iff_nhds`.
- `Mathlib/Topology/ContinuousMap/Bounded/Basic.lean`: `BoundedContinuousFunction.dist_le`
  (supremum distance at most `C ≥ 0` iff pointwise).
- `Mathlib/SetTheory/Cardinal/Order.lean`: `exists_wellFoundedLT` (every type carries a linear
  order whose strict order is well founded).

### From Tau Ceti

Nothing is used. The pinned library has no discrete or σ-locally finite families, no metrization
theorem and no locally metrizable spaces.

## References

- [Bing 1951] R. H. Bing, Metrization of topological spaces, Canad. J. Math. 3 (1951), 175–186,
  doi:10.4153/CJM-1951-022-3. Definitions p. 176; Theorem 2, p. 177; Theorem 3, pp. 178–179.
- [Dydak] J. Dydak, Partitions of unity, arXiv:math/0210379v2 (2003). Corollaries 3.11, 5.5, 5.6.
- [Michael 1953] E. Michael, A note on paracompact spaces, Proc. Amer. Math. Soc. 4 (1953),
  831–838, doi:10.1090/S0002-9939-1953-0056905-8. Theorem 1, p. 831; Lemmas 1–2, pp. 831–832;
  regular Lindelöf spaces, p. 833.
- [Munkres] J. R. Munkres, Topology, 2nd ed., Prentice Hall, 2000, Chapter 6: Lemma 40.1,
  Theorem 40.3, Lemma 41.3, Theorem 41.5 and Theorem 42.1, with the numbering as in R. Gardner's
  lecture notes on Munkres §§40–42 (East Tennessee State University).
- [Rudin 1969] M. E. Rudin, A new proof that metric spaces are paracompact, Proc. Amer. Math. Soc.
  20 (1969), 603, doi:10.1090/S0002-9939-1969-0236876-3.
- [Stone 1948] A. H. Stone, Paracompactness and product spaces, Bull. Amer. Math. Soc. 54 (1948),
  977–982, doi:10.1090/S0002-9904-1948-09118-2. Theorem 1, p. 977; Remark and Corollary 1, p. 979;
  Theorem 3, pp. 980–981.
