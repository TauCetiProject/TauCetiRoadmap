# Roadmap: barrelled, bornological and (DF)-spaces, Mackey duality and nuclear spaces

**Summary.** Build the duality theory of locally convex spaces of Bourbaki, Dieudonné–Schwartz and
Grothendieck on Mathlib's topological vector spaces over `𝕜 = ℝ` or `ℂ` (`[RCLike 𝕜]`), with local
convexity as Mathlib's `PolynormableSpace 𝕜 E`, boundedness as `Bornology.IsVonNBounded` and the
strong dual as `StrongDual 𝕜 E`. The end theorems are: Mathlib's `BarrelledSpace` is Bourbaki's
definition by barrels; a first-countable (for instance metrizable) topological vector space is
bornological; Mackey's theorem that a space is bornological iff every bounded linear map to a
locally convex space is continuous; a complete separated bornological locally convex space is
barrelled; the Mackey–Arens theorem for an arbitrary pairing `B : E × F → 𝕜`; barrelled and
bornological locally convex spaces carry their Mackey topology `τ(E, E′)`; Grothendieck's theorem
that a separated locally convex space is complete iff every linear form on `E′` that is weakly
continuous on each equicontinuous set is an evaluation; the strong dual of a bornological space is
complete; the strong dual of a Fréchet space is a (DF)-space, and the strong dual of a separated
locally convex (DF)-space is complete and metrizable, with continuity of linear maps tested on
bounded sets. The last layer defines the injective tensor product of locally convex spaces and
nuclear spaces, and states Grothendieck's characterisation of nuclearity, the precompactness of
bounded sets of a nuclear space, the finite dimensionality of nuclear Banach spaces and the
permanence of nuclearity. The statements are those of Bourbaki 1950, Dieudonné–Schwartz 1949,
Grothendieck 1950, 1952 and 1954.

Suggested home: `TauCeti/Analysis/LocallyConvex/`, beside Mathlib's
`Mathlib/Analysis/LocallyConvex/`.

## Scope and ownership

**Owned here.** The general theory of barrels, bornivores, barrelled and bornological spaces
beyond Mathlib's `BarrelledSpace` (Layers 0 and 1); the weak and Mackey topologies of an arbitrary
pairing and the Mackey–Arens theorem (Layer 2); Grothendieck's completeness theorem, the
completeness of strong duals and the reflexivity criteria of Bourbaki 1950 (Layer 3); the class of
(DF)-spaces (Layer 4); the injective tensor product of locally convex spaces and the general notion
of nuclear locally convex space with its characterisations and permanence properties (Layer 5).

**Supplied.** Mathlib supplies barrelled spaces with Banach–Steinhaus, polynormable spaces, von
Neumann bounded sets, polars, weak duals and the strong topology on `E →L[𝕜] F`. The completed
projective tensor product of separated locally convex spaces, its universal property and its
agreement with the Banach projective tensor product are NoncommutativeGeometry N1's; the Banach
projective and injective tensor norms and nuclear operators between Banach spaces are
BanachSpaceTheory B4's. They are consumed by name; no second carrier is built.

**Left to others.** Hyperfunctions keeps, in HF2.AnalyticPreparation.FunctionalDuality, its
Fréchet–Schwartz and DFS strong-dual calculus, the DFS open-mapping theorem and the nuclearity of
its smooth-section spaces: those are statements about the strong duals of Fréchet–Schwartz spaces, a
special case of Layer 4 here, and they stay with their analytic consumers. AutomorphicSpectralTheory
§§0.11 and 0.13 keep their nuclear Fréchet and LF test spaces and their kernel theorem, stated for
those function spaces; the general notion of nuclear space of Layer 5 is the one they specialise.
Kernel theorems for particular function spaces (Schwartz's kernel theorem and its LF variants) stay
with the roadmaps of those function spaces. Non-archimedean locally convex spaces are
PadicFunctionalAnalysis's. The open mapping and closed graph theorems beyond Mathlib's Banach and
Fréchet cases (Ptak, De Wilde) and Eberlein–Šmulian are not in this roadmap.

The boundary in one sentence: if a statement is about an arbitrary locally convex space over `ℝ`
or `ℂ` and its dual, it is here; if it names a particular function space, it is with that space.

## Conventions

- `𝕜` is `ℝ` or `ℂ` (`[RCLike 𝕜]`), with the order of `open scoped ComplexOrder` so that Mathlib's
  `AbsConvex 𝕜` is available. A topological vector space is `[AddCommGroup E] [Module 𝕜 E]
  [TopologicalSpace E] [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]`; it is locally convex when
  `[PolynormableSpace 𝕜 E]`, separated when `[T2Space E]`. Hausdorffness is never part of a
  definition: each theorem states it when its proof uses it. Witness: `ℝ` with the indiscrete
  topology is polynormable (the zero seminorm) and not separated.
- **Bounded** means von Neumann bounded, `Bornology.IsVonNBounded 𝕜 s`: absorbed by every
  neighbourhood of `0`. Witness: in a normed space this is norm boundedness
  (`NormedSpace.isVonNBounded_iff`); in `ℝ` with the indiscrete topology every set is bounded.
- **Dual and strong dual.** `StrongDual 𝕜 E` is `E →L[𝕜] 𝕜` with Mathlib's topology of uniform
  convergence on bounded sets; `WeakDual 𝕜 E` is the same type with `σ(E′, E)`. A pairing is a
  bilinear map `B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜`; the duality of `E` and `E′` is
  `(topDualPairing 𝕜 E).flip`. Witness: `(topDualPairing 𝕜 𝕜).flip 1 (ContinuousLinearMap.id 𝕜 𝕜)
  = 1`, and the value at `2` is `2`, so the first argument is the point of `E`.
- **Order of topologies.** In Lean `t₁ ≤ t₂` means that `t₁` is finer. « `t` lies between `σ(E, F)`
  and `τ(E, F)` » is written `mackeyTopology B ≤ t ∧ t ≤ weakTopology B`. Witness: on `ℝ` the
  discrete topology is `≤` the usual one, which is `≤` the indiscrete one.
- Bourbaki 1950 says « réflexif » for semi-reflexive and « complètement réflexif » for reflexive
  (§1, p. 5); this roadmap uses semi-reflexive and reflexive. Witness: `ℓ¹` is neither.

## Exact supplier contracts

**From Mathlib** (at the pinned revision).

- `BarrelledSpace` (`Mathlib/Analysis/LocallyConvex/Barrelled.lean`), its field
  `BarrelledSpace.continuous_of_lowerSemicontinuous`, `BaireSpace.instBarrelledSpace`,
  `WithSeminorms.banach_steinhaus`, `PolynormableSpace.banach_steinhaus`.
- `PolynormableSpace`, `WithSeminorms`, `SeminormFamily`, `Seminorm.continuous_of_le`
  (`Mathlib/Analysis/LocallyConvex/WithSeminorms.lean`).
- `AbsConvex`, `Absorbent`, `Absorbs`, `Balanced`, `gauge`, `gaugeSeminorm`.
- `Bornology.IsVonNBounded`, `Bornology.IsVonNBounded.image`, `NormedSpace.isVonNBounded_iff`,
  `LinearMap.continuousAt_zero_of_locally_bounded` (`Mathlib/Analysis/LocallyConvex/Bounded.lean`,
  `ContinuousOfBounded.lean`).
- `LinearMap.polar`, `LinearMap.polar_isClosed`, `LinearMap.subset_bipolar`, `WeakBilin`,
  `WeakDual`, `WeakDual.toStrongDual`, `StrongDual.toWeakDual`, `topDualPairing`, `StrongDual`.
- The strong topology and uniformity on `E →SL[σ] F`
  (`Mathlib/Topology/Algebra/Module/Spaces/ContinuousLinearMap.lean`) and
  `ContinuousLinearMap.completeSpace`; `UniformOnFun` with `UniformOnFun.ofFun`; `Equicontinuous`;
  `TopologicalSpace.induced`; `FirstCountableTopology`; `MontelSpace`.

**From Tau Ceti.** Nothing is consumed from Tau Ceti.

**From NoncommutativeGeometry** (N1, first paragraph). The completed projective tensor product
`E ⊗̂π F` of separated locally convex spaces over `ℝ` and `ℂ`, defined by the seminorms
`π_(p,q)(t) = inf Σ p(xᵢ) q(yᵢ)` and Hausdorff completion, its universal property for continuous
bilinear maps into complete spaces, functoriality, and its agreement with BanachSpaceTheory B4's
Banach projective tensor product. Used in Layer 5 only.

**From BanachSpaceTheory** (B4). The Banach injective tensor norm and its completion, and the
nuclear operators between Banach spaces as the range of `E* ⊗π F → (E →L[𝕜] F)` with the quotient
norm. Used in Layer 5 only.

## How to read the build

Layer 0 identifies Mathlib's barrelled spaces with Bourbaki's and collects Banach–Steinhaus and
the permanence properties. Layer 1 defines bornivores and bornological spaces and proves Mackey's
two theorems and that complete bornological spaces are barrelled; it uses only Layer 0's barrels.
Layer 2 defines the weak and Mackey topologies of a pairing, proves Mackey–Arens and shows that the
spaces of Layers 0 and 1 carry their Mackey topology. Layer 3 proves Grothendieck's completeness
theorem and its consequences for strong duals and reflexivity, from Layers 1 and 2. Layer 4 defines
(DF)-spaces and proves Grothendieck's theorems on them, from Layers 1 and 3. Layer 5, which also
needs NoncommutativeGeometry N1 and BanachSpaceTheory B4, defines the injective tensor product and
nuclear spaces. The hardest targets are 2.2, 3.1, 4.2 and 5.2.

## Layer 0: barrels and barrelled spaces

### 0.1 Barrels

Define `IsBarrel 𝕜 T`: `T` is closed, absolutely convex and absorbent (Bourbaki 1950, §2, p. 6).
Prove `barrelledSpace_iff`: for a topological vector space `E`, Mathlib's `BarrelledSpace 𝕜 E`
(every lower semicontinuous seminorm is continuous) holds iff every barrel is a neighbourhood of `0`
(Bourbaki 1950, §2, p. 6, the remark after the definition). Route: the closed unit ball
`{p ≤ 1}` of a lower semicontinuous seminorm is a barrel; conversely the gauge of a barrel is a
seminorm whose sublevel sets `{gauge T ≤ r} = r • T` are closed. *Needs:* Mathlib
`BarrelledSpace`, `AbsConvex`, `Absorbent`, `gauge`, `gaugeSeminorm`,
`Seminorm.continuous_of_le`.

**Checks.**

- The closed unit ball of a normed space is a barrel and a neighbourhood of `0`; the open unit
  ball is a neighbourhood of `0` and not a barrel (not closed), so `IsBarrel` is not « absolutely
  convex neighbourhood ».
- In `ℝ²`, the segment `{(x, 0) : |x| ≤ 1}` is closed and absolutely convex but not absorbent
  (`(0, 1)` is in no multiple of it): a definition without absorbency would make it a barrel that
  is not a neighbourhood, and `ℝ²` would fail to be barrelled.
- In the space `c₀₀` of finitely supported sequences with the sup norm,
  `T = {x : |xₙ| ≤ 1/(n+1) for all n}` is a barrel (absorbent because each `x` has finite support)
  and contains no ball (`εe_N ∉ T` once `N + 1 > 1/ε`), so `c₀₀` is not barrelled: completeness or
  the Baire property cannot be dropped from `BaireSpace.instBarrelledSpace`.

### 0.2 Banach–Steinhaus on barrelled spaces

Mathlib's `WithSeminorms.banach_steinhaus` gives: a pointwise bounded family of continuous linear
maps from a barrelled space to a polynormable space is equicontinuous (Bourbaki 1950, §2,
Théorème 1, p. 7). Prove its two corollaries (Corollaires 1 and 2, p. 7): the pointwise limit of a
bounded filter, or of a filter with a countable basis, of continuous linear maps from a barrelled
space is a continuous linear map and the convergence is uniform on precompact sets; and the dual
form (Proposition 1 and its corollary, p. 7): a subset of `E′` is weakly bounded iff it lies in the
polar of a barrel. *Needs:* 0.1, Mathlib `WithSeminorms.banach_steinhaus`, `LinearMap.polar`.

**Checks.**

- For `E = ℓ²`, the coordinate functionals `eₙ*` are pointwise bounded (`|xₙ| ≤ ‖x‖`) and
  equicontinuous (norm `1`).
- On `c₀₀`, `fₙ(x) = n xₙ` is pointwise bounded (each `x` has finite support) and not
  equicontinuous (`‖fₙ‖ = n`): barrelledness is needed.
- The limit statement fails for nets without boundedness: on `ℝ`, the net `(n x)` indexed by the
  filter of all `n` has no pointwise limit, and the sequence `fₙ(x) = x/n` converges to `0`
  uniformly on bounded sets, as Corollaire 2 predicts.

### 0.3 Permanence

Prove that separated quotients, arbitrary products, separated locally convex inductive limits and
completions of barrelled locally convex spaces are barrelled, and give a closed subspace of a
barrelled space that is not barrelled (Bourbaki 1950, §2, p. 6: every separated locally convex
space embeds in a product of Banach spaces). *Needs:* 0.1.

**Checks.**

- `ℝ^ℕ` is barrelled (a product of Banach spaces, and a Fréchet space).
- `c₀₀` with the sup norm is a subspace of the barrelled `c₀` that is not barrelled (0.1, Checks):
  subspaces are not covered, and its completion `c₀` is barrelled.
- The quotient of `ℓ¹` by a closed subspace is a Banach space, hence barrelled.

### Examples

- Every Banach space and every Fréchet space is barrelled (Mathlib `BaireSpace.instBarrelledSpace`).
- `c₀₀` with the sup norm is a normed space that is not barrelled.

### Dependencies

Mathlib: `BarrelledSpace`, `WithSeminorms.banach_steinhaus`, `AbsConvex`, `Absorbent`, `gauge`,
`LinearMap.polar`.

## Layer 1: bornological spaces

### 1.1 Bornivores and bornological spaces

Define `IsBornivore 𝕜 A`: `A` is absolutely convex and absorbs every bounded set, and the class
`BornologicalSpace 𝕜 E`: every bornivore is a neighbourhood of `0` (Bourbaki 1950, §4, p. 10).
Prove the equivalent form: every seminorm bounded on bounded sets is continuous (same page).
*Needs:* Mathlib `AbsConvex`, `Absorbs`, `Bornology.IsVonNBounded`, `gauge`.

**Checks.**

- Every absolutely convex neighbourhood of `0` is a bornivore; every bornivore is absorbent (finite
  sets are bounded).
- `ℓ²` with its weak topology `σ(ℓ², ℓ²)` is not bornological: its bounded sets are the norm
  bounded ones, so the closed unit ball is a bornivore, and it is not a weak neighbourhood of `0`
  (it contains no finite-codimensional subspace).
- `ℝ` with the indiscrete topology is bornological: every set is bounded, so a bornivore absorbs
  `ℝ` and equals `ℝ`.

### 1.2 Metrizable spaces are bornological

Prove `bornologicalSpace_of_firstCountableTopology`: a first-countable topological vector space is
bornological (Mackey 1946, Theorem 10, p. 527, cited in Bourbaki 1950, §4, p. 11). Route: if a
bornivore `A` is not a neighbourhood, pick `zₙ` in the `n`-th basic neighbourhood with
`zₙ ∉ n • A`; then `zₙ → 0`, so `{zₙ}` is bounded and absorbed by `A`, which contradicts
balancedness. *Needs:* 1.1, Mathlib `Filter.Tendsto.isVonNBounded_range`, `FirstCountableTopology`.

**Checks.**

- Normed spaces, `ℝ^ℕ` and `c₀₀` are bornological.
- The weak topology of `ℓ²` is not first countable, consistently with 1.1, Checks.
- Convexity is not used in the route: the theorem holds for bornivores of any first-countable
  topological vector space.

### 1.3 Mackey's characterisation

Prove `bornologicalSpace_iff_continuous`: `E` is bornological iff every linear map from `E` to a
locally convex space that sends bounded sets to bounded sets is continuous (Mackey 1946, Theorem 8,
p. 527; Bourbaki 1950, §4, Théorème 3, p. 11). The target ranges over the universe of `E`; the
converse uses `E` itself with the locally convex topology whose neighbourhoods of `0` are the
bornivores. Mathlib's `LinearMap.continuousAt_zero_of_locally_bounded` is the first-countable case.
*Needs:* 1.1, 1.2, Mathlib `PolynormableSpace`, `Bornology.IsVonNBounded.image`.

**Checks.**

- The identity of `ℓ²` from the weak to the norm topology is bounded (bounded sets agree) and not
  continuous: the weak topology is not bornological.
- For `E` bornological, a linear form bounded on bounded sets is continuous: on `c₀₀`,
  `x ↦ Σ n xₙ` is unbounded on the unit ball, hence not continuous, as it must not be.
- A target that is not locally convex is excluded: the theorem quantifies over polynormable
  targets, and the converse direction only uses one of them.

### 1.4 Complete bornological spaces are barrelled

Prove that a barrel absorbs every complete bounded absolutely convex set (Bourbaki 1950, §3,
Théorème 2, p. 8; route: the span of such a set `A`, normed by the gauge of `A`, is a Banach space,
hence barrelled), and deduce Mackey's corollary that a weakly bounded subset of the dual of a
complete space is strongly bounded (Proposition 4 and its corollary, p. 10). Prove
`barrelledSpace_of_bornologicalSpace`: a complete separated bornological locally convex space is
barrelled, because every barrel is then a bornivore (§4, p. 11). *Needs:* 0.1, 1.1, Mathlib
`BaireSpace.instBarrelledSpace` (for the Banach span of `A`), `gauge`, `CompleteSpace`.

**Checks.**

- `c₀₀` with the sup norm is bornological (1.2) and not barrelled (0.1, Checks): completeness
  cannot be dropped.
- In a Banach space every barrel absorbs the unit ball (it is a neighbourhood of `0`).
- The bounded set must be complete in Théorème 2: in `c₀₀`, the barrel `T` of 0.1, Checks, does not
  absorb the unit ball, which is bounded and not complete.

### 1.5 Permanence

Prove that separated quotients, countable products and separated locally convex inductive limits
of bornological spaces are bornological (Bourbaki 1950, §4, p. 11), and that a strict inductive
limit of a sequence of Fréchet spaces is bornological and barrelled (same pages, the (LF) case).
*Needs:* 1.1, 1.2, 0.3.

**Checks.**

- `ℝ^ℕ` is bornological (metrizable); so is the countable direct sum `ℝ^(ℕ)` with its finest
  locally convex topology (an inductive limit of the `ℝⁿ`), which is not metrizable.
- The quotient of a normed space by a closed subspace is normed, hence bornological.
- No subspace clause: a closed subspace of a bornological space need not be bornological
  (Grothendieck's example, Bourbaki 1950, §4, p. 11), and products are stated for countable
  families only, the general case being tied there to Ulam's measure problem.

### Examples

- Fréchet spaces and (LF)-spaces are bornological and barrelled.
- `c₀₀` with the sup norm is bornological and not barrelled.

### Dependencies

Layer 0; Mathlib `Bornology.IsVonNBounded`, `PolynormableSpace`, `FirstCountableTopology`.

## Layer 2: dual pairs and the Mackey topology

### 2.1 Weak and Mackey topologies

For a pairing `B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜`, define `weakTopology B`, the topology `σ(E, F)` induced by
`x ↦ (B x y)_y`; `mackeyFamily B`, the set of absolutely convex `σ(F, E)`-compact subsets of `F`
(compactness in Mathlib's `WeakBilin B.flip`); and `mackeyTopology B`, the topology `τ(E, F)` of
uniform convergence on `mackeyFamily B`, through `UniformOnFun.ofFun` (Dieudonné–Schwartz 1949,
§2, pp. 64–65). Prove that both are locally convex topological vector space topologies and that
`mackeyTopology B ≤ weakTopology B`; prove the bipolar theorem for an arbitrary pairing: the
bipolar of `A ⊆ E` is the `σ(E, F)`-closed absolutely convex hull of `A` (Dieudonné–Schwartz 1949,
§2, Proposition 1, p. 64). *Needs:* Mathlib `WeakBilin`, `LinearMap.polar`,
`LinearMap.polar_isClosed`, `LinearMap.subset_bipolar`, `UniformOnFun`, the Hahn–Banach
separation theorem.

**Checks.**

- For `F = 0`, `mackeyFamily B = {∅, {0}}` and both topologies are indiscrete.
- For `E = F = ℓ²` with the inner product (over `ℝ`), the unit ball is weakly compact, so
  `τ(ℓ², ℓ²)` is the norm topology, while `σ(ℓ², ℓ²)` is strictly coarser: the two ends of
  Mackey–Arens differ.
- For `E = F = 𝕜ⁿ` with the standard pairing, `σ = τ` is the Euclidean topology; a definition of
  `τ` by all bounded sets of `F` would give the same here and differ on `ℓ¹` (2.2, Checks).

### 2.2 The Mackey–Arens theorem

Prove `mackey_arens`: a locally convex topology on `E` has exactly the forms `B · y`, `y ∈ F`, as
its continuous linear forms iff it lies between `σ(E, F)` and `τ(E, F)`
(Dieudonné–Schwartz 1949, §2, pp. 64–65, after Mackey 1946 and Arens 1947). No separation of the
pairing is assumed. *Needs:* 2.1, the Alaoglu–Bourbaki theorem for polars of neighbourhoods
of `0` (Mathlib's `WeakDual.isCompact_polar` is its normed case), Mathlib `PolynormableSpace`.

**Checks.**

- For a normed space `E` and `F = E′`, the norm topology is compatible, so it lies below
  `τ(E, E′)`; by 2.3 it equals it.
- For `E = ℓ^∞` and `F = ℓ¹`, the norm topology of `ℓ^∞` is not compatible (its dual strictly
  contains `ℓ¹`), and it is strictly finer than `τ(ℓ^∞, ℓ¹)`, since the unit ball of `ℓ¹` is not
  `σ(ℓ¹, ℓ^∞)`-compact: a definition of `τ` by all bounded subsets of `F` would make the norm
  topology the top of the interval and break the theorem.
- The degenerate case `F = 0`: the only compatible topology is the indiscrete one, and both
  sides of the theorem say so (2.1, Checks; Hahn–Banach gives a nonzero continuous form for any
  other polynormable topology).

### 2.3 Barrelled and bornological spaces carry the Mackey topology

Prove `mackeyTopology_eq_of_barrelledSpace` (Bourbaki 1950, §2, Proposition 2, p. 7) and
`mackeyTopology_eq_of_bornologicalSpace` (§4, Proposition 5, p. 10): for a barrelled or a
bornological locally convex space `E`, the topology of `E` is `τ(E, E′)` for the pairing
`(topDualPairing 𝕜 E).flip`. Prove the full statements: `E` is barrelled iff its topology is
`τ(E, E′)` and every weakly bounded subset of `E′` is weakly relatively compact; `E` is
bornological iff its topology is `τ(E, E′)` and every linear form bounded on bounded sets is
continuous. *Needs:* 0.1, 0.2, 1.1, 2.2, 1.4 (Théorème 2).

**Checks.**

- `c₀₀` is bornological, so its norm topology is its Mackey topology, although it is not barrelled.
- `ℓ²` with `σ(ℓ², ℓ²)` is neither barrelled nor bornological: its topology is not `τ`.
- A barrelled space with a weakly bounded subset of `E′` that is not equicontinuous would
  contradict 0.2; in `ℓ¹`, the ball of `ℓ^∞` is weakly compact, consistently.

### 2.4 Weak continuity on Mackey spaces

Prove: if the topology of `E` is `τ(E, E′)`, every weakly continuous linear map from `E` to a
separated locally convex space `F` is continuous, and every weak homomorphism into a metrizable
`F` is a homomorphism (Bourbaki 1950, §5, Proposition 7 and its corollary, p. 12). *Needs:* 2.2,
2.3.

**Checks.**

- The identity `(ℓ², norm) → (ℓ², weak)` is continuous; its inverse is weakly continuous and not
  continuous, consistently, since the weak topology is not Mackey.
- A weakly continuous form on a Mackey space is continuous: this is 2.2 at `F = 𝕜`.
- For `E` finite-dimensional every linear map is continuous, and every topology compatible with
  the duality is the Euclidean one.

### Examples

- On a normed space, the norm topology is `τ(E, E′)`.
- On `ℓ²`, `σ(ℓ², ℓ²) ≠ τ(ℓ², ℓ²)`.

### Dependencies

Layers 0 and 1; Mathlib `WeakBilin`, `WeakDual`, `LinearMap.polar`, `UniformOnFun`, Hahn–Banach.

## Layer 3: completeness and the strong dual

### 3.1 Grothendieck's completeness theorem

Prove `completeSpace_iff`: a separated locally convex space `E` is complete iff every linear form on
`E′` whose restriction to each equicontinuous subset is `σ(E′, E)`-continuous is the evaluation at
a point of `E` (Grothendieck 1950). Prove the general form: the completion of `E` is the space of
such forms, with the topology of uniform convergence on equicontinuous sets. *Needs:* 2.1 (bipolar
theorem), 2.2, Mathlib `UniformSpace.Completion`, `Equicontinuous`, `WeakDual.toStrongDual`.

**Checks.**

- For `E` a Banach space, the equicontinuous sets are the bounded sets of `E′`, and the theorem
  says that a form on `E′` weak-star continuous on the unit ball is an evaluation.
- For `E = c₀₀` with the sup norm, the form `φ ↦ Σ φ(eₙ)/2ⁿ` on `E′ = ℓ¹` is weak-star continuous
  on bounded sets and is the evaluation at `(2⁻ⁿ) ∈ c₀ ∖ c₀₀`, a point of the completion only:
  `c₀₀` is not complete.
- On `E = 𝕜ⁿ` every form on `E′` is an evaluation.

### 3.2 Strong duals of bornological spaces

Prove `completeSpace_strongDual`: the strong dual of a bornological space is complete, and more
generally `E →L[𝕜] F` with the topology of uniform convergence on bounded sets is complete for a
bornological `E` and a complete separated locally convex `F` (Bourbaki 1950, §4, corollary of
Théorème 3, pp. 11–12). This extends Mathlib's `ContinuousLinearMap.completeSpace`, which assumes
that `E` is coherent with its bounded sets. *Needs:* 1.3, Mathlib's strong topology on
`E →L[𝕜] F`.

**Checks.**

- The strong dual of the non-complete normed space `c₀₀` is `ℓ¹`, complete.
- For `E = ℓ²` with its weak topology (not bornological), the dual is `ℓ²` and the strong topology
  is the norm topology, complete anyway: the theorem gives a sufficient condition.
- For `E = ℝ^(ℕ)` with its finest locally convex topology, the strong dual is `ℝ^ℕ`, complete.

### 3.3 Equicontinuity in the dual

Prove: in the dual of a bornological space every strongly bounded subset is equicontinuous
(Bourbaki 1950, §4, Proposition 6, p. 12); in the dual of a barrelled space, weakly bounded,
strongly bounded, weakly relatively compact and equicontinuous subsets coincide (§2, after
Proposition 2, p. 8); for `E` complete or barrelled, a weakly bounded set of transposes is strongly
equicontinuous (§6, Proposition 8, p. 13). *Needs:* 0.2, 1.3, 1.4.

**Checks.**

- In `ℓ¹ = (c₀₀)′`, the unit ball is strongly bounded and equicontinuous.
- On `c₀₀`, the set `{n eₙ*}` is weakly bounded (pointwise) and not strongly bounded, so the
  barrelled conclusion fails for a non-barrelled space.
- For `E` a Banach space, the four classes are the norm-bounded subsets of `E′`.

### 3.4 Reflexivity

Call `E` semi-reflexive when every continuous linear form on the strong dual is an evaluation, and
reflexive when moreover the evaluation map `E → E″` is a homeomorphism onto the strong bidual.
Prove: the strong dual of a semi-reflexive space is barrelled; `E` is reflexive iff it is
semi-reflexive and barrelled (Bourbaki 1950, §2, Proposition 3, p. 8); and a semi-reflexive space
is one whose weakly closed bounded sets are weakly compact (Dieudonné–Schwartz 1949, §8, p. 79,
from Mackey–Arens). *Needs:* 2.2, 2.3, 3.3, Mathlib `MontelSpace`.

**Checks.**

- `ℓ²` is reflexive; `c₀` and `ℓ¹` are not.
- A Montel space is semi-reflexive (bounded sets relatively compact), and a barrelled Montel space
  is reflexive (Mathlib's `MontelSpace` docstring takes `[MontelSpace 𝕜 E] [BarrelledSpace 𝕜 E]`).
- The direction « reflexive ⇒ barrelled » is the second half of Proposition 3; `c₀₀` is
  neither.

### Examples

- `ℓ¹ = (c₀₀)′` is complete for the strong topology although `c₀₀` is not complete.
- A Fréchet space is complete, and its strong dual is complete (3.2).

### Dependencies

Layers 1 and 2; Mathlib `UniformSpace.Completion`, `Equicontinuous`, `MontelSpace`.

## Layer 4: (DF)-spaces

### 4.1 (DF)-spaces

Define the class `DFSpace 𝕜 E`: `E` has a fundamental sequence of bounded sets, and every
countable intersection of closed absolutely convex neighbourhoods of `0` that absorbs every bounded
set is a neighbourhood of `0` (Grothendieck 1954, Part I). *Needs:* Mathlib
`Bornology.IsVonNBounded`, `AbsConvex`, `Absorbs`.

**Checks.**

- Every normed space is a (DF)-space: the balls `n • B` are a fundamental sequence, and an
  intersection absorbing `B` contains `ε • B`.
- `ℝ^ℕ` is not a (DF)-space: a countable family of products `∏ [−aₖ(n), aₖ(n)]` cannot contain
  the bounded set `∏ [−b(n), b(n)]` with `b(n) = 1 + max_{k ≤ n} aₖ(n)`.
- `ℝ^(ℕ)` with its finest locally convex topology is a (DF)-space (it is the strong dual of
  `ℝ^ℕ`, 4.2) and is not metrizable, so (DF) is not normability.

### 4.2 Strong duals of Fréchet spaces

Prove `dfSpace_strongDual`: the strong dual of a Fréchet space is a (DF)-space (Grothendieck 1954,
Part I, the first result announced in Grothendieck 1950b). *Needs:* 4.1, 3.3, Mathlib
`FirstCountableTopology`, `CompleteSpace`.

**Checks.**

- For `E = ℝ^ℕ` the strong dual is `ℝ^(ℕ)` (4.1, Checks).
- For `E` a Banach space the strong dual is a Banach space, a (DF)-space by 4.1, Checks.
- For `E = 𝕜` the strong dual is `𝕜`.

### 4.3 Continuity on bounded sets

Prove `DFSpace.continuous_of_continuousOn`: a linear map from a separated locally convex
(DF)-space to a locally convex space is continuous as soon as its restriction to every bounded set
is (Grothendieck 1954, Part I). Hence `E →L[𝕜] G` is complete for the topology of uniform
convergence on bounded sets when `G` is complete. *Needs:* 4.1, 3.2.

**Checks.**

- For a normed space the hypothesis on the unit ball alone gives continuity.
- On `ℝ^(ℕ)` every linear form is continuous (its finest locally convex topology), consistently.
- The criterion is not the metrizable one: `ℝ^ℕ` is not a (DF)-space (4.1, Checks), and there
  continuity is tested on sequences instead.

### 4.4 Strong duals of (DF)-spaces

Prove `DFSpace.completeSpace_strongDual` and `DFSpace.firstCountableTopology_strongDual`: the
strong dual of a separated locally convex (DF)-space is complete and metrizable, hence a Fréchet
space (Grothendieck 1954, Part I). *Needs:* 4.1, 4.3.

**Checks.**

- The strong dual of `ℝ^(ℕ)` is `ℝ^ℕ`, a Fréchet space.
- The strong dual of a normed space is a Banach space.
- Metrizability uses only the fundamental sequence: the polars `(n⁻¹) • Bₙ°` form a countable
  basis of neighbourhoods of `0`.

### 4.5 Permanence

Prove that separated quotients and countable locally convex inductive limits of (DF)-spaces are
(DF)-spaces, that a closed subspace need not be (DF), and that a (DF)-space with a dense countable
subset, or whose bounded sets are metrizable, is quasi-barrelled; and that the strong dual of a
Fréchet space is bornological iff it is barrelled, iff the Fréchet space is distinguished
(Grothendieck 1954, Part I). *Needs:* 4.1, 4.4, 1.5.

**Checks.**

- A countable inductive limit of Banach spaces is (DF).
- The quotient of a Banach space by a closed subspace is a Banach space, hence (DF).
- For a reflexive Fréchet space the strong dual is barrelled (3.4), so the space is distinguished.

### Examples

- Banach spaces and strong duals of Fréchet spaces are (DF)-spaces; `ℝ^ℕ` is not.

### Dependencies

Layers 1 and 3; Mathlib `Bornology.IsVonNBounded`, `StrongDual`.

## Layer 5: tensor products and nuclear spaces

### 5.1 The injective tensor product

For separated locally convex `E` and `F`, give `E ⊗ F` the topology of uniform convergence on
products of equicontinuous subsets of `E′` and `F′` (the bi-equicontinuous topology `ε`), and define
`E ⊗̂ε F` as its completion (Grothendieck 1952, Ch. I, no. 5, pp. 81–82). Prove that `π` is finer
than `ε`, that `ε` is the Banach injective norm of BanachSpaceTheory B4 for normed spaces, and that
`E ⊗̂ε F` embeds in the bi-equicontinuous separately continuous bilinear forms on `E′_σ × F′_σ` when
`E` and `F` are complete (same pages). *Needs:* NoncommutativeGeometry N1 (`E ⊗̂π F`),
BanachSpaceTheory B4 (injective norm), 3.3.

**Checks.**

- For `E = 𝕜ⁿ` both topologies are the Euclidean topology of `𝕜ⁿ ⊗ F ≅ Fⁿ`.
- For `E = F = ℓ²`, `π` and `ε` differ: the identity `Σᵢ₌₁ⁿ eᵢ ⊗ eᵢ` has `π`-norm `n` and
  `ε`-norm `1`.
- On `E ⊗ 𝕜 ≅ E` both `π` and `ε` are the topology of `E`.

### 5.2 Nuclear spaces

Call a separated locally convex space `E` nuclear when the canonical map `E ⊗̂π F → E ⊗̂ε F` is a
topological isomorphism for every separated locally convex `F`; it suffices to test Banach spaces
`F`, and `E` is nuclear iff its completion is (Grothendieck 1952, Ch. II, no. 2, p. 100;
Grothendieck 1955, Ch. II, §2, no. 1). Prove Grothendieck's characterisation (Grothendieck 1952,
Ch. II, Théorème 1, p. 100): `E` is nuclear iff every continuous linear map from `E` to a Banach
space is nuclear, iff for every weakly closed equicontinuous disk `A ⊆ E′` there is another `B ⊇ A`
with `E′_A → E′_B` nuclear. *Needs:* 5.1, BanachSpaceTheory B4 (nuclear operators), 3.3.

**Checks.**

- `𝕜ⁿ` is nuclear.
- `ℓ²` is not: 5.1, Checks, gives `π ≠ ε` on `ℓ² ⊗ ℓ²`.
- The sequence space `s` of rapidly decreasing sequences is nuclear, by the summability criterion
  for echelon spaces (Grothendieck 1952, Ch. II, no. 3, pp. 102–103).

### 5.3 Bounded sets of nuclear spaces

Prove: the bounded subsets of a nuclear space are precompact, so a quasi-complete nuclear space is
Montel and reflexive, and a nuclear Banach space is finite-dimensional (Grothendieck 1952, Ch. II,
Corollaire 1 of Théorème 1, p. 101); a Fréchet space is nuclear iff every summable sequence in it
is absolutely summable, which for Banach spaces is the Dvoretzky–Rogers theorem (Théorème 2,
p. 101). *Needs:* 5.2, 3.4, Mathlib `MontelSpace`.

**Checks.**

- `ℓ²` is not nuclear: `Σ eₙ/n` is summable and not absolutely summable.
- The unit ball of `𝕜ⁿ` is compact.
- A nuclear Fréchet space such as `s` is Montel, hence not normable unless finite-dimensional.

### 5.4 Permanence of nuclearity

Prove: subspaces, separated quotients, arbitrary products and countable direct sums of nuclear
spaces are nuclear; `E ⊗̂π F` is nuclear for nuclear `E`, `F`; and a Fréchet or (DF)-space is
nuclear iff its strong dual is (Grothendieck 1952, Ch. II, Théorème 3, p. 102). *Needs:* 5.2,
Layer 4.

**Checks.**

- `𝕜^ℕ` is nuclear (a product of copies of `𝕜`), and so is its strong dual `𝕜^(ℕ)`.
- A closed subspace of `s` is nuclear.
- `ℓ² × 𝕜` is not nuclear, since its quotient `ℓ²` is not.

### Examples

- `𝕜^ℕ`, `𝕜^(ℕ)` and `s` are nuclear; no infinite-dimensional Banach space is.

### Dependencies

Layers 3 and 4; NoncommutativeGeometry N1; BanachSpaceTheory B4; Mathlib `MontelSpace`.

## Downstream consumers

No roadmap on main or in an open pull request cites this one.

## References

- N. Bourbaki, « Sur certains espaces vectoriels topologiques », *Ann. Inst. Fourier* 2 (1950),
  5–16. doi:10.5802/aif.16; Zbl 0042.35302.
- J. Dieudonné, L. Schwartz, « La dualité dans les espaces (F) et (LF) », *Ann. Inst. Fourier* 1
  (1949), 61–101. doi:10.5802/aif.8; Zbl 0035.35501.
- G. W. Mackey, « On convex topological linear spaces », *Trans. Amer. Math. Soc.* 60 (1946),
  519–537. doi:10.2307/1990352; Zbl 0061.24302.
- R. Arens, « Duality in linear spaces », *Duke Math. J.* 14 (1947), 787–794.
  doi:10.1215/S0012-7094-47-01462-2; Zbl 0030.03403.
- A. Grothendieck, « Sur la complétion du dual d'un espace vectoriel localement convexe »,
  *C. R. Acad. Sci. Paris* 230 (1950), 605–606. Zbl 0034.37401.
- A. Grothendieck, « Quelques résultats relatifs à la dualité dans les espaces (F) », *C. R. Acad.
  Sci. Paris* 230 (1950), 1561–1563 (Grothendieck 1950b). Zbl 0037.08003.
- A. Grothendieck, « Résumé des résultats essentiels dans la théorie des produits tensoriels
  topologiques et des espaces nucléaires », *Ann. Inst. Fourier* 4 (1952), 73–112.
  doi:10.5802/aif.46; Zbl 0055.09705.
- A. Grothendieck, « Sur les espaces (F) et (DF) », *Summa Brasil. Math.* 3 (1954), 57–121.
  Zbl 0058.09803.
- A. Grothendieck, *Produits tensoriels topologiques et espaces nucléaires*, Mem. Amer. Math. Soc.
  16 (1955). doi:10.1090/memo/0016; Zbl 0064.35501.
- N. Bourbaki, *Espaces vectoriels topologiques*, chapitres 1 à 5, Masson, 1981; Springer, 2007,
  chapters III (bornologies, barrelled spaces, Banach–Steinhaus) and IV (duality).
  Zbl 0482.46001.
- H. H. Schaefer, M. P. Wolff, *Topological Vector Spaces*, 2nd ed., Graduate Texts in Mathematics
  3, Springer, 1999, chapters II–IV. Zbl 0983.46002.
- G. Köthe, *Topological Vector Spaces I*, Grundlehren der mathematischen Wissenschaften 159,
  Springer, 1969. Zbl 0179.17001.
- F. Trèves, *Topological Vector Spaces, Distributions and Kernels*, Academic Press, 1967,
  chapters 50–51 (nuclear spaces). Zbl 0171.10402.
- A. Dvoretzky, C. A. Rogers, « Absolute and unconditional convergence in normed linear spaces »,
  *Proc. Nat. Acad. Sci. USA* 36 (1950), 192–197. doi:10.1073/pnas.36.3.192.
