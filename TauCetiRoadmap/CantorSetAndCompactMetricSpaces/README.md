# Roadmap: the Cantor set and compact metric spaces

**Summary.** This roadmap proves the classical topological characterisations of three spaces
of real numbers: the Cantor set, the irrationals and the rationals. They are modelled by Cantor
space `ℕ → Bool` and Baire space `ℕ → ℕ` with their product topologies, and by `ℚ`. Throughout,
a space is zero-dimensional when its clopen sets form a basis, and perfect when it has no
isolated point.

The headline theorems are these.

- *Brouwer.* A topological space is homeomorphic to Cantor space if and only if it is
  nonempty, compact, metrizable, totally disconnected and perfect. A subset of the real line
  is homeomorphic to Cantor space if and only if it is nonempty, compact, perfect and has
  empty interior.
- *Alexandrov–Urysohn.* A space is homeomorphic to Baire space if and only if it is a
  nonempty zero-dimensional Polish space in which every compact set has empty interior. The
  irrational numbers, and the sequences in `ℕ → Bool` with infinitely many `true` values, are
  homeomorphic to Baire space.
- *Sierpiński.* A space is homeomorphic to `ℚ` if and only if it is nonempty, countable,
  metrizable and perfect.
- *Universality.* A space embeds in Cantor space if and only if it is T0, second countable and
  zero-dimensional. A space is homeomorphic to a closed subset of Baire space if and only if it
  is a zero-dimensional Polish space, and every Polish space is the image of a closed subset of
  Baire space under a continuous bijection.

The roadmap builds on Mathlib's general topology: schemes on sequence spaces,
zero-dimensional and Polish spaces, the middle-thirds set and the Hausdorff–Alexandroff
theorem, binary expansions, and Cantor's back-and-forth theorem for countable dense orders. From
Tau Ceti it uses the perfect-space results for products. It sits beside
BorelEquivalenceRelations, which works on Cantor and Baire space throughout.

Layer 1 embeds zero-dimensional spaces in Cantor and Baire space. Layer 2 proves Brouwer's
theorem by a binary scheme of clopen sets. Layer 3 proves the Alexandrov–Urysohn theorem by a
scheme with infinitely many children at each node and applies it to the irrationals. Layer 4
proves Sierpiński's theorem through Layers 1 and 2 and an order isomorphism.

## Conventions

- Cantor space is `ℕ → Bool` and Baire space is `ℕ → ℕ`, each with the product of discrete
  topologies. For a finite word `s`, the cylinder `[s]` is the set of sequences beginning with
  `s`; cylinders are clopen and form a basis.
- Zero-dimensional means Mathlib's `ZeroDimensionalSpace`: the clopen sets form a basis. It
  allows the empty space and does not include T0: an indiscrete space is zero-dimensional.
- Perfect means Mathlib's `PerfectSpace` for a space (no isolated point) and `Perfect` for a
  subset of an ambient space (closed, and every point is an accumulation point of the set).
- Polish means Mathlib's `PolishSpace`: separable and completely metrizable. Metrizable means
  `MetrizableSpace`.
- A scheme is a family `A s` of subsets of a metric space indexed by finite words. It is
  disjoint if the children of each node are pairwise disjoint, and has vanishing diameter if
  the diameters along every infinite branch tend to `0`. Its induced map sends a branch `x` to
  the point of `⋂ₙ A (x|n)` when this intersection is nonempty. Mathlib's `CantorScheme`
  indexes words newest letter first (`PiNat.res`); the routes below read them in the usual
  order.
- A homeomorphism is stated as `Nonempty (X ≃ₜ Y)`; an embedding as `IsEmbedding`.

## Layer 1: zero-dimensional spaces inside Cantor and Baire space

### 1.1 Embeddings in Cantor space

Prove `exists_isEmbedding_cantor_iff`: a topological space `X` admits an embedding into
`ℕ → Bool` if and only if `X` is T0, second countable and zero-dimensional (Francis,
Proposition 3, p. 8; Tserunyan, Theorem 5.6, p. 19, for separable metrizable spaces).

Route. If `f` is an embedding, `X` is homeomorphic to a subspace of a compact metrizable,
totally disconnected space: subspaces of second countable spaces are second countable, of T2
spaces are T0, and an inducing map pulls a clopen basis back to a clopen basis. Cantor space is
zero-dimensional by the Mathlib instance for T2, totally disconnected, locally compact spaces.
Conversely, the clopen sets form a basis, so a countable subfamily `U₀, U₁, …` is still a basis
(`IsTopologicalBasis.exists_countable`); if `X` is empty there is nothing to prove, and
otherwise the countable basis is nonempty and can be listed as a sequence. Put
`f x n = decide (x ∈ Uₙ)`. Each coordinate is continuous because `Uₙ` is clopen. Two distinct
points are separated by an open set (T0), hence by some `Uₙ`, so `f` is injective. The set `Uₙ`
is the preimage of the open set `{y | y n = true}`, so every basic open set of `X` is a
preimage of an open set and `f` is inducing.

**Checks.**

- The two-point indiscrete space is second countable and zero-dimensional (its only nonempty
  open set is clopen) but not T0, and has no injective map into a T2 space that is inducing.
- `ℝ` is T0 and second countable but not zero-dimensional: its only clopen sets are `∅` and
  `ℝ`. It does not embed.
- `Bool`-valued functions on `ℝ`, with the product topology, form a compact T2 totally
  disconnected space, hence a T0 zero-dimensional one, that is not first countable and
  therefore does not embed.
- The empty space satisfies both sides.

*Needs:* Mathlib `isTopologicalBasis_isClopen`, `IsTopologicalBasis.exists_countable`, the
zero-dimensional instance for T2 totally disconnected weakly locally compact spaces,
`Topology.IsInducing.hasSmallInductiveDimensionLT`.

### 1.2 Zero-dimensional Polish spaces are closed in Baire space

Prove `exists_isClosedEmbedding_baire_iff`: a space `X` admits a closed embedding into
`ℕ → ℕ` if and only if `X` is a zero-dimensional Polish space (Tserunyan, Theorem 5.6, p. 19,
proves that zero-dimensional Polish spaces are homeomorphic to closed subsets of `ℕ → ℕ`; the
other implication is proved here).

Route. From a closed embedding: a closed subspace of a Polish space is Polish
(`IsClosedEmbedding.polishSpace`), and Baire space is zero-dimensional because its cylinders
are clopen and form a basis (`PiNat.isTopologicalBasis_cylinders`, `PiNat.isOpen_cylinder`; a
cylinder is a finite intersection of preimages of points, hence closed). To a closed embedding: fix
a complete metric. *Splitting step:* every clopen `U` and every `ε > 0` give pairwise disjoint
clopen sets `V₀, V₁, …` of diameter `< ε` with union `U`. Indeed the clopen sets of diameter
`< ε` contained in `U` cover `U`; a countable subfamily `W₀, W₁, …` still covers `U` (second
countability); put `Vᵢ = Wᵢ \ (W₀ ∪ … ∪ Wᵢ₋₁)`, padding with empty sets when the family is
finite. Apply the splitting step at each node with `ε = 2⁻ⁿ` at depth `n`, starting from
`A [] = X`. The scheme is disjoint, each child is a clopen subset of its parent (so the closure
of a child lies in the parent), and its diameters vanish. Let `D` be the domain of the induced
map `f`. If every `A (x|n)` is nonempty, points chosen in them form a Cauchy sequence whose
limit lies in every `A (x|n)`, since these are closed; so `x ∉ D` exactly when some `A (x|n)`
is empty, and `D` is closed. The map `f` is injective (disjointness), surjective (each point of
a node lies in one child), continuous (vanishing diameter) and sends `[s] ∩ D` onto the open
set `A s`, so it is a homeomorphism from `D` onto `X`; its inverse composed with the inclusion
is the closed embedding.

**Checks.**

- `ℚ` is zero-dimensional and separable metrizable but has no closed embedding: a closed
  subspace of a Polish space is Polish, and `ℚ` is not, being a countable union of nowhere
  dense singletons in itself (Baire category).
- `ℝ` is Polish and not zero-dimensional.

*Needs:* Mathlib `IsClosedEmbedding.polishSpace`, `PiNat.isTopologicalBasis_cylinders`,
`PiNat.isOpen_cylinder`, `isTopologicalBasis_isClopen`, `IsTopologicalBasis.exists_countable`,
`CantorScheme.inducedMap`, `CantorScheme.Disjoint.map_injective`,
`CantorScheme.VanishingDiam.map_continuous`, `TopologicalSpace.upgradeIsCompletelyMetrizable`.

### 1.3 Polish spaces are bijective images of closed subsets of Baire space

Prove `exists_continuous_bijective_of_isClosed_baire`: for every Polish space `X` there is a
closed set `C ⊆ ℕ → ℕ` and a continuous bijection `C → X` (Tserunyan, Theorem 5.7, p. 19).

Route. Fix a complete metric. *Splitting step:* every Fσ set `F` and every `ε > 0` give
pairwise disjoint Fσ sets `F₀, F₁, …` of diameter `< ε` with union `F` and with the closure of
each `Fᵢ` contained in `F`. Write `F` as an increasing union of closed sets `K₀ ⊆ K₁ ⊆ …`,
cover `X` by open balls `B₀, B₁, …` of radius `ε/3` (separability), and let `Pₘ` be `Bₘ` minus
the earlier balls. In a metric space open sets are Fσ, so `Pₘ` and
`Pₘ ∩ Kₖ ∩ (X \ Kₖ₋₁)` (with `K₋₁ = ∅`) are Fσ; the latter sets, listed as one sequence, are
pairwise disjoint, have union `F`, have diameter at most `2ε/3`, and the closure of the one
indexed by `k` lies in `Kₖ ⊆ F`. Starting from `A [] = X` and splitting at depth `n` with
`ε = 2⁻ⁿ` gives a disjoint scheme of vanishing diameter in which the closure of each child lies
in its parent. As in 1.2, a branch lies outside the domain `D` of the induced map exactly when
some node along it is empty, so `D` is closed, and the induced map `D → X` is a continuous
bijection.

**Checks.**

- `ℚ` satisfies the conclusion without being Polish: the closed discrete set of sequences
  vanishing after the first coordinate maps bijectively onto `ℚ`, and every map from a discrete
  space is continuous.
- `Bool`-valued functions on `ℝ` do not: the space has cardinality greater than that of
  Baire space.

*Needs:* Mathlib `CantorScheme.inducedMap`, `CantorScheme.Disjoint.map_injective`,
`CantorScheme.VanishingDiam.map_continuous`, `IsClosed.isGδ`,
`TopologicalSpace.upgradeIsCompletelyMetrizable`.

### Examples

- `ℚ`, and every countable metrizable space, embeds in Cantor space: Mathlib makes countable
  completely regular spaces zero-dimensional.
- The Cantor set, the `p`-adic integers and every compact metrizable totally disconnected
  space embed in Cantor space, with closed image.

### Dependencies

Mathlib only: Polish spaces, zero-dimensional spaces, countable bases, schemes on sequence
spaces.

## Layer 2: Brouwer's characterisation of Cantor space

### 2.1 Brouwer's theorem

Prove `nonempty_homeomorph_cantor_iff`: a space `X` is homeomorphic to `ℕ → Bool` if and only
if `X` is nonempty, compact, metrizable, totally disconnected and perfect (Tserunyan,
Theorem 5.3, p. 18, with zero-dimensional in place of totally disconnected; Francis, Theorem 1,
p. 2).

Route. Cantor space has the five properties: compactness and total disconnectedness are
instances, it is metrizable as a countable product of metrizable spaces, and it is perfect by
`TauCeti.perfectSpace_pi`. Each property transfers along a homeomorphism (for perfectness,
`Homeomorph.perfect_image`). Conversely, fix a metric; `X` is zero-dimensional by the Mathlib
instance for T2 totally disconnected locally compact spaces, and complete because compact.

*Finite splitting step:* every nonempty clopen `U` and every `ε > 0` give `m ≥ 2` pairwise
disjoint nonempty clopen sets of diameter `< ε` with union `U`. The clopen subsets of `U` of
diameter `< ε` cover `U`; finitely many do, by compactness; removing from each the earlier ones
and discarding empty sets gives such a partition with `m ≥ 1` pieces. If `m = 1`, then `U` has
diameter `< ε`; as `U` is open and nonempty and `X` is perfect, `U` has two points `x ≠ y`, and a
clopen set containing `x` but not `y` cuts `U` into two nonempty clopen pieces of diameter `< ε`.

*Binary coding:* a partition `P₀, …, Pₘ₋₁` of a node `A s` is placed on binary words below `s`
by giving `Pᵢ` the word `s 0ⁱ 1` for `i < m − 1` and `Pₘ₋₁` the word `s 0ᵐ⁻¹`, and the
intermediate word `s 0ⁱ` the union `Pᵢ ∪ … ∪ Pₘ₋₁`. Each intermediate node is the disjoint
union of its two children. Apply the finite splitting step with `ε = 2⁻ᵏ` to the pieces of
stage `k − 1`, starting from `A [] = X`. Every node is nonempty and clopen with exactly two
disjoint children covering it, and every infinite branch passes through a piece of every stage
after finitely many letters, so the diameters vanish. The induced map is defined on all of
Cantor space (`CantorScheme.ClosureAntitone.map_of_vanishingDiam`), injective, surjective and
continuous; a continuous bijection from a compact space to a T2 space is a homeomorphism
(`Continuous.homeoOfEquivCompactToT2`).

**Checks.**

- Each hypothesis is needed, the others holding: the empty space (not nonempty); `ℚ` (not
  compact); `Bool`-valued functions on `ℝ` (not metrizable; perfect by the same product
  result); `[0, 1]` (not totally disconnected); `Bool`, or the one-point compactification of
  `ℕ` (not perfect).
- The binary coding of a partition into `m` pieces uses the words `0ⁱ 1` for `i < m − 1` and
  `0ᵐ⁻¹`; for each `m` from 1 to 8 this set is prefix-free and every binary word of length
  `m − 1` has exactly one of them as prefix (so the code is complete; its Kraft sum is 1).

*Needs:* Mathlib `CantorScheme.ClosureAntitone.map_of_vanishingDiam`,
`CantorScheme.Disjoint.map_injective`, `CantorScheme.VanishingDiam.map_continuous`,
`Continuous.homeoOfEquivCompactToT2`, `isTopologicalBasis_isClopen`, the zero-dimensional
instance for T2 totally disconnected weakly locally compact spaces; Tau Ceti
`TauCeti.perfectSpace_pi`, `Homeomorph.perfect_image`.

### 2.2 Cantor sets in the real line

Prove `nonempty_homeomorph_cantor_iff_of_real`: a set `K ⊆ ℝ` is homeomorphic to Cantor space
if and only if `K` is nonempty, compact, perfect and has empty interior (Francis, Example 1(b), p. 2;
Francis, Theorem 5, p. 6, proves the order-preserving form). Proved here from 2.1.

Route. If `K` is nonempty, compact and perfect, the subspace `K` is nonempty, compact,
metrizable and perfect (an accumulation point of `K` in `ℝ` lying in `K` is not isolated in
`K`). It is totally disconnected: a connected subset of `K` is preconnected in `ℝ`, hence
order-connected (`isPreconnected_iff_ordConnected`), so if it had two points `a < b` it would
contain `[a, b]`, and the interior of `K` would contain `(a, b)`. Apply 2.1. Conversely, if
`K ≃ₜ ℕ → Bool`, then `K` is nonempty and compact (the image of a compact space under the
inclusion), hence closed, and the subspace has no isolated point, so `K` is perfect; if the
interior of `K` contained an interval `(a, b)` with `a < b`, that interval would be a connected
subset of a totally disconnected space with more than one point.

**Checks.**

- Each hypothesis is needed, the others holding: `∅`; the closed set `⋃ (n + C)` over `n ∈ ℤ`,
  with `C` the middle-thirds set (not compact); `{0}` (not perfect); `[0, 1]` (interior
  nonempty).

*Needs:* 2.1; Mathlib `isPreconnected_iff_ordConnected`, `IsCompact.isClosed`.

### Examples

- The middle-thirds set is compact (`isCompact_cantorSet`), perfect and has empty interior; 2.2
  recovers Mathlib's `cantorSetHomeomorphNatToBool` up to the choice of homeomorphism.
- A fat Cantor set, of positive Lebesgue measure, is also homeomorphic to Cantor space.
- A countable product of nonempty compact metrizable totally disconnected spaces, infinitely
  many of them with at least two points, is homeomorphic to Cantor space; so are
  `ℕ → Fin 3`, `(ℕ → Bool) × (ℕ → Bool)` and the `p`-adic integers.
- Every nonempty clopen subset of Cantor space, and every nonempty perfect closed subset of it,
  is homeomorphic to Cantor space.

### Dependencies

Mathlib schemes and compact spaces; Tau Ceti perfect products.

## Layer 3: Baire space and the irrationals

### 3.1 The Alexandrov–Urysohn theorem

Prove `nonempty_homeomorph_baire_iff`: a space `X` is homeomorphic to `ℕ → ℕ` if and only if
`X` is a nonempty zero-dimensional Polish space in which every compact set has empty interior
(Tserunyan, Theorem 5.4, p. 19, which leaves the proof to an exercise). Proved here.

Route. Baire space is nonempty, Polish and zero-dimensional (cylinders, as in 1.2). A compact
set with nonempty interior would contain a cylinder `[s]`; cylinders are closed, so `[s]` would
be compact, but its image under the coordinate of index `|s|` is all of `ℕ`, which is not
compact. These properties transfer along homeomorphisms.

Conversely, fix a complete metric. Every nonempty open set, being its own interior, is not
compact. *Infinite splitting step:* every nonempty clopen `U` and every `ε > 0` give infinitely
many pairwise disjoint nonempty clopen sets of diameter `< ε`, indexed by `ℕ`, with union `U`.
Since `U` is not compact, some open cover `𝒱` of `U` has no finite subcover. The clopen sets of
diameter `< ε` that lie in `U` and in some member of `𝒱` cover `U`; a countable subfamily
`W₀, W₁, …` does (second countability), and no finite subfamily does, since it would yield a
finite subcover of `𝒱`. The sets `Wᵢ \ (W₀ ∪ … ∪ Wᵢ₋₁)` are clopen, pairwise disjoint, cover
`U`, and infinitely many of them are nonempty: if all after index `N` were empty, `W₀, …, W_N`
would cover `U`. Keep the nonempty ones in order. Build the scheme from `A [] = X`, splitting at
depth `n` with `ε = 2⁻ⁿ`. All nodes are nonempty and clopen, each the disjoint union of its
children, and the diameters vanish, so the induced map is defined on all of Baire space
(`CantorScheme.ClosureAntitone.map_of_vanishingDiam`), injective, surjective and continuous; it
maps `[s]` onto the open set `A s`, so it is open and a homeomorphism.

**Checks.**

- Each hypothesis is needed, the others holding: the empty space; `ℚ` (not Polish; a compact
  `K ⊆ ℚ` containing `(a, b) ∩ ℚ` with `a < b` would be closed in `ℝ` and contain `[a, b]`,
  which has irrational points); `ℕ → ℝ` (Polish and connected; a nonempty open set contains a
  basic open set that leaves some coordinate free, so its image under that coordinate is `ℝ`,
  while a compact set has bounded coordinate images); `ℕ → Bool` (compact).

*Needs:* Mathlib `PolishSpace`, `isTopologicalBasis_isClopen`,
`IsTopologicalBasis.exists_countable`, `PiNat.isTopologicalBasis_cylinders`,
`PiNat.isOpen_cylinder`, `CantorScheme.ClosureAntitone.map_of_vanishingDiam`,
`CantorScheme.Disjoint.map_injective`, `CantorScheme.VanishingDiam.map_continuous`,
`TopologicalSpace.upgradeIsCompletelyMetrizable`.

### 3.2 The irrationals

Prove `nonempty_homeomorph_irrational_baire`: the subspace of irrational numbers is homeomorphic
to `ℕ → ℕ` (Tserunyan, Corollary 5.5, p. 19). Proved here from 3.1.

Route. The irrationals form a Gδ subset of `ℝ` (`IsGδ.setOfPred_irrational`), hence a Polish
space (`IsGδ.polishSpace`), and are nonempty. For rationals `a < b`, the set of irrationals in
`(a, b)` is open, and closed in the irrationals because its complement there is the set of
irrationals in `(−∞, a) ∪ (b, ∞)`; these sets form a basis, so the irrationals are
zero-dimensional. A compact set `K` of irrationals with nonempty interior contains the
irrationals of some `(a, b)` with `a < b`; `K` is closed in `ℝ`, and the irrationals are dense
(`dense_irrational`), so `K ⊇ [a, b]`, which contains a rational. Apply 3.1.

*Needs:* 3.1; Mathlib `IsGδ.setOfPred_irrational`, `IsGδ.polishSpace`, `dense_irrational`.

### 3.3 Sequences with infinitely many ones

Prove `nonempty_homeomorph_frequently_true_baire`: the subspace of `x : ℕ → Bool` with
`x n = true` for infinitely many `n` is homeomorphic to `ℕ → ℕ`. Proved here; Tserunyan,
Proposition 1.12, p. 7, states that Baire space is homeomorphic to a Gδ subset of Cantor space.

Route. Send `m : ℕ → ℕ` to the sequence `0^m₀ 1 0^m₁ 1 0^m₂ 1 …` (runs of `false` of lengths
`m₀, m₁, …`, each followed by one `true`). It has infinitely many `true` values, and every such
sequence arises from exactly one `m`, read off as the lengths of the runs of `false` between
consecutive `true` values. The first `L` letters of the image depend only on `m₀, …, m_{L−1}`,
so the map is continuous. The values `m₀, …, mₖ` depend only on the letters up to the
`(k + 1)`-st `true`, so on a cylinder intersected with the subspace they are constant, and the
inverse is continuous.

**Checks.**

- The run-length map and its inverse agree exactly on all tuples of length at most 3 with
  entries at most 3 (85 words).
- The set of sequences that are eventually `true` is countable, so it is not homeomorphic to
  Baire space: "infinitely many" cannot be replaced by "cofinitely many".

*Needs:* Mathlib `PiNat.isTopologicalBasis_cylinders`, `PiNat.isOpen_cylinder`.

### Examples

- The irrationals in `(0, 1)` are homeomorphic to Baire space, by 3.1 as in 3.2.
- `(ℕ → ℕ) × (ℕ → ℕ)` and `ℕ → ℕ → ℕ` are homeomorphic to Baire space, by 3.1 or by an
  interleaving of coordinates.

### Dependencies

Mathlib Polish spaces, schemes and irrationals.

## Layer 4: Sierpiński's characterisation of the rationals

### 4.1 Sierpiński's theorem

Prove `nonempty_homeomorph_rat_iff`: a space `X` is homeomorphic to `ℚ` if and only if `X` is
nonempty, countable, metrizable and perfect (Francis, Theorem 2, p. 2, where countable means
countably infinite (p. 2); for a nonempty perfect T1 space the two readings agree). The route below
uses Francis's translation idea (Francis, §4, p. 9) inside its own organisation.

Route. `ℚ` is nonempty, countable, metrizable and perfect, and these transfer along
homeomorphisms. Conversely:

1. *Embedding.* A countable metrizable space is second countable and, by the Mathlib instance
   for countable completely regular spaces, zero-dimensional; so 1.1 gives an embedding
   `f : X → ℕ → Bool`.
2. *Dense image.* The image of `f` has no isolated point, so its closure `K` is a nonempty
   perfect closed subset of Cantor space (`Preperfect.perfect_closure`), compact, metrizable and
   totally disconnected. By 2.1, `K ≃ₜ ℕ → Bool`; composing gives an embedding `g` with dense
   range.
3. *Avoiding dyadic sequences.* Let `E` be the countable set of eventually constant sequences.
   For `t : ℕ → Bool`, coordinatewise exclusive or with `t` is a homeomorphism of Cantor space;
   the set of `t` with `(g x xor t) ∈ E` for some `x` is countable, while Cantor space maps onto
   `[0, 1]` (`Real.fromBinary_surjective`) and is uncountable. Choose `t` outside it; then
   `h = (· xor t) ∘ g` is an embedding with dense range disjoint from `E`.
4. *Into the line.* Let `φ = Real.fromBinary`, `φ x = Σ x n / 2^(n+1)`. It maps the cylinder of
   a word `w` of length `n` onto the dyadic interval `[v, v + 2⁻ⁿ]`, `v` the value of `w`. A
   sequence outside `E` is the only expansion of its value, which is not dyadic and lies in the
   open interval of each of its cylinders; so `φ` restricted to the complement of `E` is
   injective, and it carries cylinders (intersected with that complement) to the open dyadic
   intervals intersected with its image, hence is an embedding. Thus `X` is homeomorphic to
   `Y = φ (h X)`, a countable subset of `(0, 1)` that is dense in `[0, 1]`.
5. *Order.* `Y` is densely ordered without endpoints. Seen inside the interval `(0, 1)`, whose
   subspace topology is its order topology (`orderTopology_of_ordConnected`), `Y` meets every
   open subinterval, so the subspace topology of `Y` is its order topology
   (`induced_orderTopology`).
   Cantor's theorem gives an order isomorphism `Y ≃o ℚ` (`Order.iso_of_countable_dense`), which
   is a homeomorphism of order topologies (`OrderIso.toHomeomorph`).

**Checks.**

- Each hypothesis is needed, the others holding: the empty space; Cantor space (not countable);
  a countably infinite set with the cofinite topology (perfect, not T2, hence not metrizable);
  `ℕ` (discrete, not perfect).
- Metrizability cannot be weakened to "T2 and zero-dimensional": the polynomials with rational
  coefficients under pointwise convergence on `ℝ` form a countable, perfect, zero-dimensional T2
  space that is not first countable (Francis, Example 4, p. 10).
- Step 4 depends on avoiding `E`: `1/2` has the two expansions `1000…` and `0111…`, both
  eventually constant. Exactly: for `n` from 1 to 6 the values of the `2ⁿ` words of length `n`
  are the `j / 2ⁿ`, every extension of a word `w` has value in `[v, v + 2⁻ⁿ]`, and `1/3` has
  the unique expansion `0101…`.

*Needs:* 1.1, 2.1; Mathlib `Preperfect.perfect_closure`, `Real.fromBinary`,
`Real.fromBinary_continuous`, `Real.fromBinary_surjective`, `induced_orderTopology`,
`orderTopology_of_ordConnected`, `Order.iso_of_countable_dense`, `OrderIso.toHomeomorph`, the
zero-dimensional instance for countable completely regular spaces.

### Examples

- Every countable dense subset of `ℝ`, for instance `ℚ ∪ {√2}`, is homeomorphic to `ℚ`, by an
  order-preserving homeomorphism (step 5 alone).
- `ℚ ∩ [0, 1]`, `ℚ × ℚ` and the endpoints of the middle-thirds set are homeomorphic to `ℚ`, though
  the first and the last are not order-isomorphic to it.
- Every countable metrizable space `Z` embeds in `ℚ`: for nonempty `Z`, `Z × ℚ` is
  homeomorphic to `ℚ` by 4.1, and the empty space embeds trivially.

### Dependencies

Layers 1 and 2; Mathlib countable dense orders and binary expansions.

## Scope and ownership

This roadmap owns the nine theorems above. Already in the library, and not restated:

- Mathlib `cantorSetHomeomorphNatToBool`: the middle-thirds set is homeomorphic to Cantor space;
  `cantorSpaceHomeomorphNatToCantorSpace`: Cantor space is homeomorphic to its countable power.
- Mathlib `exists_nat_bool_continuous_surjective_of_compact` (Hausdorff–Alexandroff): every
  nonempty compact metric space is a continuous image of Cantor space; `exists_retractionCantorSet`
  and `PiNat.exists_retraction_of_isClosed`: nonempty closed subsets of Cantor space are retracts.
- Mathlib `PolishSpace.exists_nat_nat_continuous_surjective`: every nonempty Polish space is a
  continuous image of Baire space.
- Mathlib `Perfect.exists_nat_bool_injection` and
  `IsClosed.exists_nat_bool_injection_of_not_countable`: Cantor space injects continuously into
  every nonempty perfect subset of a complete metric space and every uncountable closed subset of
  a Polish space (with compact domain, the injection is a closed embedding).
- Mathlib `CantorBendixson.perfectKernel` and `exists_countable_union_perfect_of_isClosed`: the
  Cantor–Bendixson decomposition; Mathlib's zero-dimensional instances for compact T2 totally
  disconnected spaces and for countable completely regular spaces.
- Tau Ceti `TauCeti.perfectSpace_pi` and the word cylinders of
  `TauCeti/Topology/Instances/CantorSpace.lean`.

BorelEquivalenceRelations (on main) works on Cantor and Baire space with these library results
and states none of the theorems here. Not treated: Hausdorff's theorem that every uncountable
Polish space has the cardinality of the continuum, the Hahn–Mazurkiewicz theorem, the
homogeneity and extension theorems for homeomorphisms of Cantor space, and characterisations of
the real line or of the Hilbert cube.

## Exact supplier contracts

### From Mathlib

- `isTopologicalBasis_isClopen` (`Topology/InductiveDimension/Classes.lean`): in a
  `ZeroDimensionalSpace` the clopen sets form a basis; `ZeroDimensionalSpace` is
  `HasSmallInductiveDimensionLT X 1`, equivalently a clopen basis.
- `instZeroDimensionalSpaceOfT2SpaceOfTotallyDisconnectedSpaceOfWeaklyLocallyCompactSpace`
  (`Topology/Separation/Regular.lean`): a T2, totally disconnected, weakly locally compact space
  is zero-dimensional. The instance for `[CompletelyRegularSpace X] [Countable X]` is in
  `Topology/Separation/CompletelyRegular.lean`.
- `Topology.IsInducing.hasSmallInductiveDimensionLT` (`Topology/InductiveDimension/Functions.lean`):
  an inducing map pulls small inductive dimension back.
- `TopologicalSpace.IsTopologicalBasis.exists_countable` (`Topology/Bases.lean`): in a second
  countable space every basis contains a countable subfamily that is still a basis.
- `PiNat.isTopologicalBasis_cylinders`, `PiNat.isOpen_cylinder`
  (`Topology/MetricSpace/PiNat.lean`): for discrete factors, cylinders are open and form a basis.
- `CantorScheme.inducedMap`, `CantorScheme.Disjoint.map_injective`,
  `CantorScheme.VanishingDiam.map_continuous` (discrete index type),
  `CantorScheme.ClosureAntitone.map_of_vanishingDiam` (complete space, vanishing diameter,
  closure of each child inside its parent, every node nonempty: the domain is everything)
  (`Topology/MetricSpace/CantorScheme.lean`).
- `Continuous.homeoOfEquivCompactToT2` (compact domain, T2 codomain); `IsCompact.isClosed` (T2).
- `IsClosedEmbedding.polishSpace`, `IsGδ.polishSpace` (`Topology/MetricSpace/Polish.lean`);
  `TopologicalSpace.upgradeIsCompletelyMetrizable` (`Topology/Metrizable/CompletelyMetrizable.lean`); `IsClosed.isGδ` (perfectly normal space,
  which every metric space is).
- `IsGδ.setOfPred_irrational`, `dense_irrational` (`Topology/Instances/Irrational.lean`).
- `isPreconnected_iff_ordConnected` (preconnected subsets of a densely ordered conditionally
  complete order topology are order-connected).
- `Preperfect.perfect_closure` (`Topology/Perfect.lean`).
- `Real.fromBinary`, `Real.fromBinary_continuous`, `Real.fromBinary_surjective`
  (`Topology/MetricSpace/HausdorffAlexandroff.lean`): `x ↦ Σ x n / 2^(n+1)` from Cantor space
  onto `[0, 1]`.
- `induced_orderTopology` (`Topology/Order/Basic.lean`): if `f : α → β` is an order embedding
  into a space with the order topology and its image meets every nonempty open interval
  `(x, y)` of `β`, the topology induced on `α` is its order topology;
  `orderTopology_of_ordConnected` (same file): an order-connected subset, such as an interval,
  carries its order topology;
  `OrderIso.toHomeomorph` (`Topology/Order/MonotoneContinuity.lean`);
  `Order.iso_of_countable_dense` (`Order/CountableDenseLinearOrder.lean`): two countable
  nonempty densely ordered linear orders without endpoints are order-isomorphic.

### From Tau Ceti

- `TauCeti.perfectSpace_pi` (`TauCeti/Topology/Perfect.lean`): a product of infinitely many
  nontrivial spaces is a perfect space.
- `Homeomorph.perfect_image` (same file): the image of a set under a homeomorphism is perfect
  exactly when the set is.

## References

- A. Tserunyan, *Introduction to descriptive set theory*, lecture notes, author's page at McGill
  University (PDF of 25 October 2026). Proposition 1.12 (p. 7); §5.B, Theorem 5.3 (p. 18),
  Theorem 5.4 and Corollary 5.5 (p. 19); §5.C, Theorem 5.6 (p. 19); §5.D, Theorem 5.7 (p. 19).
- M. Francis, *Two topological uniqueness theorems for spaces of real numbers*,
  arXiv:1210.1008 (2012). Theorems 1 and 2, Examples 1 and 2 (p. 2); Theorem 5 (p. 6);
  Proposition 3 (p. 8); §4 (pp. 8–9); Example 4 (p. 10). It
  credits the theorems to L. E. J. Brouwer (1910), W. Sierpiński (1920) and P. Alexandroff and
  P. Urysohn (1928).
