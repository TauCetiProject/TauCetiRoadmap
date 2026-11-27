# Roadmap: locally convex spaces: duality, barrelled and bornological spaces, inductive limits

**Summary.** A locally convex space is a real or complex topological vector space whose topology
is given by a family of seminorms. This roadmap builds the general theory of such spaces beyond
normed spaces: the duality between a space and its continuous dual, the classes of spaces on which
the theorems of Banach space theory survive, and locally convex inductive limits, in particular
the LF-spaces. Hausdorffness and completeness are explicit hypotheses throughout.

The duality layer starts from a pairing of two vector spaces. Each family of weakly bounded
subsets of one space defines the topology of uniform convergence on its members on the other;
the weak topology and the Mackey topology (uniform convergence on the absolutely convex weakly
compact sets) are the two extreme cases. The roadmap proves the Alaoglu–Bourbaki theorem (the
polar of a neighbourhood of zero is weak-star compact), Mackey's theorem (in a locally convex
space a set is bounded if and only if every continuous linear functional is bounded on it), and
the Mackey–Arens theorem (a locally convex topology has a prescribed dual exactly when it lies
between the weak and the Mackey topology of the pairing).

A space is barrelled when every closed, absolutely convex, absorbing set is a neighbourhood of
zero, and bornological when every absolutely convex set that absorbs all bounded sets is one.
The roadmap proves that a metrizable space is bornological, that a sequentially complete Hausdorff
bornological space is barrelled, and that both classes pass to quotients, direct sums and
inductive limits. For the spaces of continuous linear maps with the topology of uniform
convergence on a family of bounded sets it proves: maps from a bornological space into a complete
space form a complete space; maps from a barrelled space into a quasi-complete space form a
quasi-complete space; on an equicontinuous set, pointwise and precompact convergence agree. It
proves Grothendieck's completeness theorem, the characterizations of semi-reflexive and reflexive
spaces, and that a barrelled space in which closed bounded sets are compact (a Montel space) is
reflexive with a Montel strong dual. The strong dual of a metrizable space is a (DF)-space, and
the strong dual of a (DF)-space is a Fréchet space.

An LF-space is a Hausdorff space that is the locally convex inductive limit of an increasing
sequence of Fréchet spaces; it is strict when each step carries the topology induced by the next.
For a strict inductive limit of a sequence with closed steps the roadmap proves the theorems of
Dieudonné and Schwartz: the limit induces on each step its own topology, a set is bounded
exactly when it is contained and bounded in one step, and the limit of complete steps is
complete. It identifies the dual of an inductive limit with the projective limit of the duals.
Grothendieck's factorization theorem says that a linear map with closed graph from a Fréchet
space into a Hausdorff space covered by countably many continuous linear images of Fréchet
spaces has its range in one of them and factors continuously through it. From it the roadmap
derives the closed graph theorem for maps from an ultrabornological space into such a covered
space, and the open mapping theorem: a continuous linear surjection between LF-spaces is open.

The last layer treats quotients and subspaces of LF-spaces. In a Fréchet–Schwartz space every
bounded subset of a quotient by a closed subspace is the image of a bounded set. An inductive
sequence of Fréchet spaces is acyclic in Palamodov's sense exactly when it satisfies Retakh's
condition (M), and exactly when it is boundedly retractive (Wengenroth); an acyclic LF-space is
regular and complete. For a closed subspace of an acyclic LF-space, the subspace topology is the
inductive limit topology of the intersections with the steps if and only if the sequence of
quotients is acyclic. For a strict LF-space with Fréchet–Schwartz steps this holds if and only if
the quotient map lifts bounded sets.

The roadmap rests on Mathlib's locally convex library (seminorm families, polars, the spaces of
continuous linear maps with a topology of uniform convergence, barrelled spaces with the
Banach–Steinhaus theorem) and on Tau Ceti's bipolar theorem, strong bidual and final locally
convex topology. [Spectral manifolds](../SpectralManifolds/README.md) supplies the open mapping
and closed graph theorems for F-spaces, which Layer 4 extends.
[Noncommutative geometry](../NoncommutativeGeometry/README.md) supplies the completed projective
tensor product and [Banach space theory](../BanachSpaceTheory/README.md) the Banach injective
tensor product and nuclear operators, which Layer 5 uses to build the completed injective tensor
product of locally convex spaces and to prove that it agrees with the projective one when a factor
is nuclear; [AutomorphicSpectralTheoryPartII](../AutomorphicSpectralTheoryPartII/README.md)
consumes that. [Hyperfunctions](../Hyperfunctions/README.md) owns the inductive limits of Banach
spaces with compact bonding maps, which Layer 6 places among the acyclic sequences.

## How to read the build

Layer 0 is duality for an arbitrary pairing: polar topologies, the bipolar theorem,
Alaoglu–Bourbaki, Mackey's theorem on bounded sets and Mackey–Arens. Layer 1 is the four classes
of spaces: barrelled, quasi-barrelled, bornological and ultrabornological, with Banach disks and
permanence. Layer 2 is the spaces of continuous linear maps and the strong dual: equicontinuity,
completeness and quasi-completeness, Grothendieck's completeness theorem, reflexivity, Montel
spaces and (DF)-spaces. Layer 3 is inductive limits: final locally convex topologies, direct sums,
inductive sequences, strict limits, LF-spaces and their duals. Layer 4 is Grothendieck's
factorization theorem with the closed graph and open mapping theorems. Layer 5 is the injective
tensor product and its agreement with the projective one on nuclear spaces. Layer 6 is regularity:
Schwartz spaces, lifting of bounded sets, acyclic sequences and limit subspaces.

Layers 0 to 4 are built in order. Layer 5 needs Layers 0 and 2 only. Layer 6 needs Layers 0 to 4
and not Layer 5. The hardest targets are §0.5, §2.5, §4.2, §6.4 and §6.5.

## Conventions

- **Scalars.** `𝕜` is `ℝ` or `ℂ` (`[RCLike 𝕜]`), with the order of `open scoped ComplexOrder`, so
  that Mathlib's `AbsConvex 𝕜` and `LocallyConvexSpace 𝕜` are available. Where Mathlib states a
  declaration for a nontrivially normed field (`Bornology.IsVonNBounded`, `BarrelledSpace`,
  `UniformConvergenceCLM`), and where a target of this roadmap needs neither the Hahn–Banach
  theorem nor convexity, the statement is made at Mathlib's generality and says so.
- **Topological vector space.** `[AddCommGroup E] [Module 𝕜 E] [TopologicalSpace E]
  [IsTopologicalAddGroup E] [ContinuousSMul 𝕜 E]`. When completeness or uniform continuity is
  involved the hypotheses are `[UniformSpace E] [IsUniformAddGroup E]` instead of the topology.
- **Locally convex.** The hypothesis is Mathlib's `[PolynormableSpace 𝕜 E]`: the topology is given
  by the family of all continuous seminorms. Over `RCLike 𝕜` this is equivalent to
  `LocallyConvexSpace 𝕜 E`; Mathlib has the instance from `LocallyConvexSpace 𝕜 E` to
  `PolynormableSpace 𝕜 E` (for a compatible real structure), and §0.1 proves the equivalence.
  Tau Ceti declarations that ask for `[Module ℝ E] [IsScalarTower ℝ 𝕜 E]
  [LocallyConvexSpace ℝ E]` are applied through `TauCeti.locallyConvexSpace_RCLike_iff`. A
  locally convex space is not assumed Hausdorff: each statement carries `[T2Space E]` when it
  needs it.
- **Bounded** means von Neumann bounded, `Bornology.IsVonNBounded 𝕜 s`. **Precompact** means
  `TotallyBounded s` for the uniformity of the additive group.
- **Duals.** `StrongDual 𝕜 E` is `E →L[𝕜] 𝕜` with the topology of uniform convergence on bounded
  sets, written `E′_b`; `WeakDual 𝕜 E` is the same type with the weak-star topology `σ(E′, E)`;
  `WeakSpace 𝕜 E` is `E` with `σ(E, E′)`. A pairing is `B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜`;
  `LinearMap.polar B : Set E → Set F` and `StrongDual.polar 𝕜 : Set E → Set (StrongDual 𝕜 E)` are
  Mathlib's absolute polars, defined by `‖B x y‖ ≤ 1`. Mathlib's canonical pairing is
  `topDualPairing 𝕜 E : StrongDual 𝕜 E →ₗ[𝕜] E →ₗ[𝕜] 𝕜`, with the dual on the left; the pairing
  with `E` on the left is `(topDualPairing 𝕜 E).flip`.
- **Order of topologies.** In Lean `t₁ ≤ t₂` means that `t₁` is finer. The statement that `t` lies
  between `σ(E, F)` and `τ(E, F)` is `mackeyTopology B ≤ t ∧ t ≤ weakTopology B`.
- **Seminorm form of the definitions.** Mathlib defines `BarrelledSpace 𝕜 E` by: every lower
  semicontinuous seminorm is continuous. The classes introduced here (`QuasiBarrelledSpace`,
  `BornologicalSpace`, `UltrabornologicalSpace`) are defined in the same form, as conditions on
  seminorms, and each section proves the equivalence with the textbook definition by absolutely
  convex sets for locally convex spaces. Like `BarrelledSpace`, these classes do not include
  local convexity; theorems add `[PolynormableSpace 𝕜 E]`.
- **Fréchet space, F-space.** An F-space is as in SpectralManifolds §3.2: `[UniformSpace E]
  [IsUniformAddGroup E] [ContinuousSMul 𝕜 E] [CompleteSpace E] [T2Space E]
  [(uniformity E).IsCountablyGenerated]`. A Fréchet space is an F-space with
  `[PolynormableSpace 𝕜 E]`. Neither is a class; they are these hypotheses.
- **Montel.** Mathlib's `MontelSpace 𝕜 E` is the Heine–Borel property alone: closed bounded sets
  are compact. In this roadmap a *Montel space* is a Hausdorff locally convex space with
  `[MontelSpace 𝕜 E] [BarrelledSpace 𝕜 E]`, and every theorem lists the hypotheses it uses.
- **Reflexive.** `E` is *semi-reflexive* when every continuous linear functional on `E′_b` is the
  evaluation at a point of `E`, and *reflexive* when moreover evaluation is a homeomorphism of `E`
  onto `(E′_b)′_b`. Bourbaki's older « réflexif » and « complètement réflexif » are these two.
- **Inductive sequence, step, LF-space.** An inductive sequence consists of spaces `X n`, continuous
  linear bonding maps `T n : X n →L[𝕜] X (n + 1)` and continuous linear maps `ι n : X n →L[𝕜] E`
  with `ι (n + 1) ∘ T n = ι n`, each `ι n` injective, whose ranges cover `E`, such that `E` carries
  the final locally convex topology of the `ι n`. This is the shape of Tau Ceti's inductive limits
  of normed spaces (`TauCeti/Analysis/LocallyConvex/CompactInductiveLimit.lean`). The `X n` are the
  *steps*. The sequence is *strict* when every `T n` is a topological embedding. An *LF-space* is
  a Hausdorff locally convex space that has an inductive sequence of Fréchet spaces; a *strict
  LF-space* has a strict one. Schaefer, Trèves and Köthe say « (LF)-space » for the strict notion
  only; Meise–Vogt, Wengenroth and Pérez Carreras–Bonet use the convention adopted here.
- **Names.** Lean names for targets of this roadmap are suggestions for declarations in Tau Ceti
  under `TauCeti/Analysis/LocallyConvex/`, beside Mathlib's `Mathlib/Analysis/LocallyConvex/`.
  Declarations cited as Tau Ceti's exist in the Tau Ceti library.

## Layer 0: dual pairs and polar topologies

### 0.1 Pairings, weak topologies and the bipolar theorem

The weak topology `σ(E, F)` of a pairing `B : E →ₗ[𝕜] F →ₗ[𝕜] 𝕜` is the topology of Mathlib's
`WeakBilin B`; as a topology on `E` itself it is `WeakBilin.instTopologicalSpace B`, here named
`LinearMap.weakTopology B`. Mathlib proves that it is locally convex
(`LinearMap.weakBilin_withSeminorms`) and that its continuous linear functionals are exactly the
`x ↦ B x y` (`LinearMap.dualEmbedding_surjective`).

Prove the equivalence of the two Mathlib notions of local convexity over `RCLike 𝕜`:
`polynormableSpace_iff_locallyConvexSpace`, `PolynormableSpace 𝕜 E ↔ LocallyConvexSpace 𝕜 E` for a
topological vector space `E`. One direction is Mathlib's instance
`LocallyConvexSpace.toPolynormableSpace`; the other is `WithSeminorms.toLocallyConvexSpace` with
`TauCeti.locallyConvexSpace_RCLike_iff`.

Prove the bipolar theorem for an arbitrary pairing, `LinearMap.flip_polar_polar`: for `s ⊆ E`,
`B.flip.polar (B.polar s)` is the `σ(E, F)`-closed absolutely convex hull of `insert 0 s`. No
separation of the pairing is assumed. Tau Ceti's `StrongDual.bipolar_eq_closedAbsConvexHull` is
the case of a locally convex space and its dual; the general case follows from it applied to
`WeakBilin B`, whose dual is the image of `F`.

(Schaefer–Wolff, Ch. IV, 1.5; Bourbaki, EVT II §6 and IV §1.)

**Checks.**

- For `s = ∅`, `B.polar ∅ = univ` (Mathlib `LinearMap.polar_empty`) and the bipolar is
  `{x | ∀ y, B x y = 0}`, the `σ(E, F)`-closure of `{0}`. The closed absolutely convex hull of
  `∅` is `∅`, so a statement without `insert 0` is false.
- For `E = F = ℝ²` with the dot product, the bipolar of `{(1, 0)}` is the segment
  `{(t, 0) : |t| ≤ 1}`.
- For `F = 0` the weak topology is indiscrete and every bipolar is `E`.

*Needs:* Mathlib `WeakBilin`, `LinearMap.polar`, `LinearMap.polar_isClosed`,
`LinearMap.subset_bipolar`, `LinearMap.weakBilin_withSeminorms`,
`LinearMap.dualEmbedding_surjective`, `closedAbsConvexHull`, `LocallyConvexSpace.toPolynormableSpace`,
`WithSeminorms.toLocallyConvexSpace`; Tau Ceti `StrongDual.bipolar_eq_closedAbsConvexHull`,
`TauCeti.locallyConvexSpace_RCLike_iff`.

### 0.2 Polar topologies

For a pairing `B` and a family `𝔖 : Set (Set F)`, define `LinearMap.polarTopology B 𝔖`, the
topology on `E` of uniform convergence on the members of `𝔖`: the topology induced by
`x ↦ UniformOnFun.ofFun 𝔖 (fun y ↦ B x y)` from Mathlib's `F →ᵤ[𝔖] 𝕜`. Prove:

- `polarTopology B 𝔖` makes `E` a topological additive group. It makes `E` a topological vector
  space if and only if every member of `𝔖` is `σ(F, E)`-bounded, that is
  `∀ S ∈ 𝔖, ∀ x, BddAbove ((fun y ↦ ‖B x y‖) '' S)`. In that case it is locally convex, given by
  the seminorms `p_S x = ⨆ y ∈ S, ‖B x y‖` for `S ∈ 𝔖` (`WithSeminorms`), and the sets
  `B.flip.polar S'`, for `S'` a finite union of scalar multiples of members of `𝔖`, form a basis
  of neighbourhoods of zero.
- It is Hausdorff if and only if for every `x ≠ 0` there are `S ∈ 𝔖` and `y ∈ S` with `B x y ≠ 0`.
- It is antitone in `𝔖` (a larger family gives a finer topology), and it does not change when
  `𝔖` is replaced by its saturation: the family of subsets of `σ(F, E)`-closed absolutely convex
  hulls of finite unions of scalar multiples of members of `𝔖`. This is §0.1's bipolar theorem.
- `polarTopology B {S | S.Finite} = weakTopology B`.
- For a topological vector space `E`, the topology of `StrongDual 𝕜 E` is `polarTopology
  (topDualPairing 𝕜 E) {s | Bornology.IsVonNBounded 𝕜 s}`, and for a family `𝔖` of subsets of `E`
  the topology of Mathlib's `E →Lᵤ[𝕜, 𝔖] 𝕜` is `polarTopology (topDualPairing 𝕜 E) 𝔖`.
- For a locally convex space `E`, the topology of `E` is `polarTopology (topDualPairing 𝕜 E).flip
  𝔈`, where `𝔈` is the family of equicontinuous subsets of the dual: every locally convex topology
  is the topology of uniform convergence on the equicontinuous sets.

(Schaefer–Wolff, Ch. III §3 and Ch. IV §1; Köthe I, §21; Jarchow, Ch. 8.)

**Checks.**

- The boundedness condition is needed: for `E = F = ℝ` with `B x y = x y` and `𝔖 = {univ}`, the
  only `x` with `sup_y |x y| < ∞` is `0`, the topology is discrete, and `t ↦ t • 1` is not
  continuous at `0`.
- For `E = F = ℝ` and `𝔖 = {[−1, 1]}` the topology is the usual one; so is the weak topology,
  since `F` is one-dimensional.
- On `ℓ²` paired with itself, the family of finite sets gives the weak topology and the family
  `{closed unit ball}` gives the norm topology, which is strictly finer.

*Needs:* §0.1; Mathlib `UniformOnFun`, `UniformConvergenceCLM.topologicalSpace_eq`, `WithSeminorms`,
`Equicontinuous`, `topDualPairing`; Tau Ceti `StrongDual.isVonNBounded_polar`.

### 0.3 The Alaoglu–Bourbaki theorem

Prove `WeakDual.isCompact_polar_of_mem_nhds`: for a topological vector space `E` over a
nontrivially normed field `𝕜` with `[ProperSpace 𝕜]` and a neighbourhood `U` of zero,
`StrongDual.polar 𝕜 U` is compact in `WeakDual 𝕜 E`. Mathlib's `WeakDual.isCompact_polar` is the
case of a normed space; the proof is the same Tychonoff argument, with the remark that a linear
functional bounded on a neighbourhood of zero is continuous. No local convexity is used.

Prove its companions for a topological vector space `E` over `RCLike 𝕜`: a set `H` of continuous
linear functionals is equicontinuous if and only if `H ⊆ StrongDual.polar 𝕜 U` for some
neighbourhood `U` of zero; every equicontinuous set is relatively compact in `WeakDual 𝕜 E`; its
weak-star closed absolutely convex hull is equicontinuous; and an equicontinuous set is bounded in
`StrongDual 𝕜 E` (Tau Ceti `StrongDual.isVonNBounded_polar`).

(Schaefer–Wolff, Ch. III §4; Bourbaki, EVT III §3; Köthe I, §20.)

**Checks.**

- In `E = 𝕜^ℕ` with the product topology and `U = {x | ‖x 0‖ ≤ 1}`, the polar is
  `{t • e₀* : ‖t‖ ≤ 1}`.
- For `E ≠ 0` the set `{0}` is not a neighbourhood of zero, and its polar is the whole dual,
  which is not weak-star compact unless it is zero.
- Compactness is for the weak-star topology: the polar of the unit ball of `ℓ²` is the unit ball of
  its dual, which is not compact in `StrongDual 𝕜 ℓ²`.

*Needs:* Mathlib `WeakDual`, `StrongDual.polar`, `WeakDual.isCompact_polar`, `ProperSpace`,
`Equicontinuous`, `isCompact_univ_pi`; Tau Ceti `StrongDual.isVonNBounded_polar`.

### 0.4 Mackey's theorem on bounded sets

Prove `isVonNBounded_iff_forall_strongDual`: in a locally convex space `E` over `RCLike 𝕜`, a set
`s` is bounded if and only if `f '' s` is bounded for every `f : StrongDual 𝕜 E`. Equivalently
`s` is bounded in `WeakSpace 𝕜 E`. No Hausdorff or completeness hypothesis is needed. *Route:* for
each continuous seminorm `p`, `E` with `p` is a seminormed space whose continuous functionals are
continuous on `E`, and Tau Ceti's `TauCeti.NormedSpace.isBounded_iff_forall_dual_isBounded` applies
to it.

Deduce that two locally convex topologies on `E` with the same continuous linear functionals have
the same bounded sets (Schaefer–Wolff, Ch. IV §3; Bourbaki, EVT IV §1; Mackey 1946).

**Checks.**

- In `ℓ²` the set `{n • eₙ}` is not bounded, and the functional given by `(k^(−3/4))ₖ` takes the
  values `n^(1/4)` on it.
- Local convexity is needed. In `ℓ^(1/2)` with the metric `d(x, y) = Σ |xₙ − yₙ|^(1/2)`, whose
  dual is `ℓ^∞`, the vectors `s_N = N⁻¹ (e₁ + ⋯ + e_N)` have `ℓ¹` norm `1`, so every continuous
  linear functional is bounded on `{s_N}`; but `d(t s_N, 0) = (|t| N)^(1/2)`, so the set is not
  bounded.

*Needs:* Mathlib `Bornology.IsVonNBounded`, `WithSeminorms.isVonNBounded_iff_seminorm_bddAbove`,
`PolynormableSpace.withSeminorms`, `Seminorm`; Tau Ceti
`TauCeti.NormedSpace.isBounded_iff_forall_dual_isBounded`.

### 0.5 The Mackey topology and the Mackey–Arens theorem

Define `LinearMap.mackeyTopology B`, the topology `τ(E, F)`: `polarTopology B 𝔎` for the family
`𝔎` of absolutely convex subsets of `F` that are compact in `WeakBilin B.flip`. By §0.2 it is a
locally convex vector topology, and `mackeyTopology B ≤ weakTopology B`.

Prove `LinearMap.mackey_arens`: for a locally convex vector topology `t` on `E`, the
`t`-continuous linear functionals are exactly the `x ↦ B x y`, `y : F`, if and only if
`mackeyTopology B ≤ t ∧ t ≤ weakTopology B`. No separation of the pairing is assumed. *Route:* if
`t` has dual `Set.range B.flip`, the polar of a closed absolutely convex `t`-neighbourhood is
weak-star compact by §0.3 and its preimage in `F` is `σ(F, E)`-compact, because `F → E′` induces
`σ(F, E)`; so `t` is coarser than `τ`. Conversely a `τ`-continuous functional is bounded on the
polar of some `K ∈ 𝔎`, hence lies in the bipolar of the image of `K` in the algebraic dual of `E`,
which is that image itself, a compact convex set being closed.

Prove the consequences for a locally convex space `E` with `B = (topDualPairing 𝕜 E).flip`: the
topology of `E` is coarser than `τ(E, E′)`; all locally convex topologies between `σ(E, E′)` and
`τ(E, E′)` have the same closed convex sets (Mathlib `Convex.toWeakSpace_closure`), the same
bounded sets (§0.4) and the same closed subspaces.

(Schaefer–Wolff, Ch. IV, 3.2; Bourbaki, EVT IV §1; Mackey 1946; Arens 1947; Dieudonné–Schwartz
1949, §2.)

**Checks.**

- For `F = 0` the family `𝔎` is `{∅, {0}}`, both topologies are indiscrete, and the indiscrete
  topology is the only locally convex topology on `E` with zero dual.
- For `E = F = ℓ²` over `ℝ` with the inner product, the unit ball is weakly compact, so
  `τ(ℓ², ℓ²)` is the norm topology, strictly finer than `σ(ℓ², ℓ²)`.
- For `E = ℓ^∞` and `F = ℓ¹`, the norm topology of `ℓ^∞` is strictly finer than `τ(ℓ^∞, ℓ¹)` and
  its dual is strictly larger than `ℓ¹`: the unit ball of `ℓ¹` is not `σ(ℓ¹, ℓ^∞)`-compact. A
  definition of `τ` by all bounded subsets of `F` would give the norm topology, which is not
  compatible with the pairing.

*Needs:* §§0.1–0.4; Mathlib `WeakBilin`, `AbsConvex`, `Convex.toWeakSpace_closure`,
`StrongDual.exists_extension`.

### 0.6 Weak continuity and transposes

For a linear map `u : E → F` between locally convex spaces prove: `u` is continuous from
`WeakSpace 𝕜 E` to `WeakSpace 𝕜 F` if and only if `f ∘ u` is continuous on `E` for every
`f : StrongDual 𝕜 F`; a continuous `u` is weakly continuous (Mathlib `WeakSpace.map`); a weakly
continuous `u` is continuous from `τ(E, E′)` to `τ(F, F′)`, so it is continuous whenever `E`
carries its Mackey topology. For continuous `u`, the transpose `f ↦ f ∘ u` is continuous
`WeakDual 𝕜 F → WeakDual 𝕜 E` and `StrongDual 𝕜 F → StrongDual 𝕜 E` (Mathlib
`ContinuousLinearMap.precomp`), it maps equicontinuous sets to equicontinuous sets, and
`(u '' s)° = (transpose u)⁻¹' s°` for polars. The Banach-space transpose with its norm identities
is BanachSpaceTheory B1's and is not restated.

(Schaefer–Wolff, Ch. IV §2 and §7; Bourbaki, EVT IV §1.)

**Checks.**

- The identity from `ℓ²` with the weak topology to `ℓ²` with the norm topology is weakly
  continuous and not continuous: the weak topology is not the Mackey topology.
- For `u = 0` the transpose is `0` and the polar identity reads `univ = univ`.

*Needs:* §0.5; Mathlib `WeakSpace.map`, `ContinuousLinearMap.precomp`, `StrongDual.polar`.

## Layer 1: barrelled, quasi-barrelled, bornological and ultrabornological spaces

### 1.1 Barrels and barrelled spaces

Define `IsBarrel 𝕜 T` for a subset `T` of a topological vector space: `T` is closed, absolutely
convex (`AbsConvex 𝕜 T`) and absorbent (`Absorbent 𝕜 T`). Prove `barrelledSpace_iff_isBarrel`:
`BarrelledSpace 𝕜 E` holds if and only if every barrel is a neighbourhood of zero. *Route:* the set
`{x | p x ≤ 1}` of a lower semicontinuous seminorm is a barrel; the gauge of a barrel `T` is a
seminorm with `{x | gauge T x ≤ r} = r • T` closed. No local convexity is used.

Prove for a locally convex space `E`: `E` is barrelled if and only if every bounded subset of
`WeakDual 𝕜 E` is equicontinuous. With Mathlib's `PolynormableSpace.banach_steinhaus` and §0.3 this
gives: in the dual of a barrelled locally convex space, the weak-star bounded, the strongly
bounded, the equicontinuous and the relatively weak-star compact sets are the same sets.

(Bourbaki, EVT III §4; Schaefer–Wolff, Ch. II §7 and Ch. IV §5; Köthe I, §21 and §27.)

**Checks.**

- The closed unit ball of a normed space is a barrel. The open unit ball is not: it is not closed.
- In `ℝ²` the segment `{(x, 0) : |x| ≤ 1}` is closed and absolutely convex and not absorbent; a
  definition without absorbency would make `ℝ²` not barrelled.
- In the space `c₀₀` of finitely supported sequences with the supremum norm,
  `T = {x | ∀ n, |x n| ≤ 1/(n + 1)}` is a barrel that contains no ball, so `c₀₀` is not barrelled.
  The functionals `fₙ x = n xₙ` are pointwise bounded on `c₀₀` and not equicontinuous.

*Needs:* §0.3; Mathlib `BarrelledSpace`, `BaireSpace.instBarrelledSpace`,
`PolynormableSpace.banach_steinhaus`, `AbsConvex`, `Absorbent`, `gauge`, `gaugeSeminorm`,
`LowerSemicontinuous`; Tau Ceti `Bornology.IsVonNBounded.equicontinuous`.

### 1.2 Quasi-barrelled spaces

Define the class `QuasiBarrelledSpace 𝕜 E`: every lower semicontinuous seminorm that is bounded
on every bounded set is continuous. Prove for a locally convex space `E` the equivalence of:

1. `QuasiBarrelledSpace 𝕜 E`;
2. every barrel that absorbs every bounded set is a neighbourhood of zero;
3. every bounded subset of `StrongDual 𝕜 E` is equicontinuous;
4. evaluation `E → StrongDual 𝕜 (StrongDual 𝕜 E)` is continuous.

Under these conditions evaluation is a topological embedding when `E` is Hausdorff, by Tau Ceti's
`TauCeti.isInducing_applyₗ_of_continuous`. Give the instance from `BarrelledSpace 𝕜 E`. The
barrelled case of 4 is Tau Ceti's `TauCeti.strongEval`.

(Schaefer–Wolff, Ch. IV §5; Köthe I, §23; Jarchow, Ch. 11.)

**Checks.**

- `c₀₀` with the supremum norm is quasi-barrelled (it is bornological, §1.3) and not barrelled.
- `ℓ²` with its weak topology is not quasi-barrelled: the closed unit ball is a barrel, it absorbs
  every bounded set by §0.4, and it is not a weak neighbourhood of zero.

*Needs:* §§0.3, 1.1; Mathlib `BarrelledSpace`, `StrongDual`; Tau Ceti `TauCeti.strongEval`,
`TauCeti.comap_applyₗ_le_nhds_zero`, `TauCeti.isInducing_applyₗ_of_continuous`.

### 1.3 Bornological spaces

Define the class `BornologicalSpace 𝕜 E`: every seminorm on `E` that is bounded on every bounded
set is continuous. Prove for a locally convex space `E` the equivalence of:

1. `BornologicalSpace 𝕜 E`;
2. every absolutely convex set that absorbs every bounded set is a neighbourhood of zero;
3. every linear map from `E` into a locally convex space that maps bounded sets to bounded sets
   is continuous (the target ranges over the universe of `E`);
4. the topology of `E` is the finest locally convex topology with the same bounded sets.

Prove `BornologicalSpace.of_firstCountableTopology`: a first countable topological vector space is
bornological. Mathlib's `LinearMap.continuousAt_zero_of_locally_bounded` is the argument; no
convexity is used. Give the instance to `QuasiBarrelledSpace`.

(Bourbaki, EVT III §2; Schaefer–Wolff, Ch. II §8; Köthe I, §28; Mackey 1946.)

**Checks.**

- Normed spaces, `𝕜^ℕ` and `c₀₀` are bornological. `c₀₀` is bornological and not barrelled.
- `ℓ²` with its weak topology is not bornological: the norm is a seminorm bounded on bounded
  sets and it is not weakly continuous.
- `ℝ` with the indiscrete topology is bornological: every set is bounded, so a seminorm bounded
  on bounded sets is zero.

*Needs:* §1.2; Mathlib `Bornology.IsVonNBounded`, `Bornology.IsVonNBounded.image`,
`LinearMap.continuousAt_zero_of_locally_bounded`, `Filter.Tendsto.isVonNBounded_range`,
`FirstCountableTopology`.

### 1.4 Banach disks and ultrabornological spaces

For an absolutely convex bounded subset `B` of a topological vector space, `E_B` denotes
`Submodule.span 𝕜 B` with the seminorm `gauge B` (Mathlib's `gauge`, for the underlying real
vector space; for an absolutely convex set it is a `𝕜`-seminorm on the span, and `gauge B x < r`
implies `x ∈ r • B`, which implies `gauge B x ≤ r`). Define `IsBanachDisk 𝕜 B`: `B` is absolutely
convex and bounded, `gauge B` is a norm on `E_B`, and `E_B` is complete for it. In a Hausdorff
space the gauge of a bounded absolutely convex set is a norm on its span. Prove:

- the inclusion `E_B → E` is continuous;
- in a Hausdorff topological vector space, a bounded, absolutely convex set in which every
  Cauchy sequence converges is a Banach disk; in particular a closed bounded absolutely convex
  subset of a sequentially complete Hausdorff locally convex space, and a compact absolutely
  convex set;
- the image of a Banach disk under a continuous linear map into a Hausdorff space is a Banach
  disk;
- the Banach–Mackey theorem: every barrel absorbs every Banach disk. Consequently in the dual
  of a sequentially complete Hausdorff locally convex space every weak-star bounded set is
  strongly bounded.

Define the class `UltrabornologicalSpace 𝕜 E`: a seminorm `p` on `E` is continuous as soon as
`p ∘ T` is continuous for every Banach space `X` in the universe of `E` and every continuous
linear `T : X →L[𝕜] E`. Prove for a Hausdorff locally convex space `E` the equivalence with: every
absolutely convex set that absorbs every Banach disk is a neighbourhood of zero. Prove:

- `UltrabornologicalSpace 𝕜 E` implies `BornologicalSpace 𝕜 E` and `BarrelledSpace 𝕜 E`;
- a sequentially complete Hausdorff bornological locally convex space is ultrabornological; in
  particular every Fréchet space is, and every quasi-complete Hausdorff bornological space is
  barrelled;
- a linear map from an ultrabornological space into a locally convex space is continuous if and
  only if its composite with every continuous linear map from a Banach space is continuous.

(Bourbaki, EVT III §1 and §4; Köthe I, §20; Jarchow, Ch. 13; Meise–Vogt, Ch. 24.)

**Checks.**

- The closed unit ball of a Banach space is a Banach disk; so is the unit ball of `ℓ²` regarded in
  `ℓ²` with its weak topology, where it is compact.
- The unit ball of `c₀₀` is a bounded absolutely convex set that is not a Banach disk, and the
  barrel `T` of §1.1 does not absorb it.
- `c₀₀` is bornological and not ultrabornological, since it is not barrelled.

*Needs:* §§1.1, 1.3; Mathlib `gauge`, `gaugeSeminorm`, `Submodule.span`,
`BaireSpace.instBarrelledSpace`, `CompleteSpace`, `CauchySeq`.

### 1.5 The Mackey topology of these spaces

Prove: a quasi-barrelled locally convex space carries its Mackey topology, that is, its topology
is `mackeyTopology (topDualPairing 𝕜 E).flip`. Hence barrelled, bornological and metrizable locally
convex spaces carry their Mackey topology. *Route:* an absolutely convex weak-star compact subset
of the dual is a Banach disk (§1.4), so it is strongly bounded by the Banach–Mackey theorem
applied in `WeakDual 𝕜 E`, hence equicontinuous.

Prove the two characterizations for a Hausdorff locally convex space: `E` is barrelled if and
only if it carries its Mackey topology and every bounded subset of `WeakDual 𝕜 E` is relatively
compact; `E` is bornological if and only if it carries its Mackey topology and every linear
functional that is bounded on bounded sets is continuous.

(Schaefer–Wolff, Ch. IV §3; Bourbaki, EVT IV §1 and §2; Köthe I, §21 and §28.)

**Checks.**

- On a normed space the norm topology is `τ(E, E′)`.
- `ℓ²` with `σ(ℓ², ℓ²)` does not carry its Mackey topology, consistently with §§1.2 and 1.3.
- `c₀₀` carries its Mackey topology and is not barrelled: the absolutely convex hull of
  `{n • eₙ*}` is weak-star bounded and not relatively weak-star compact, since a weak-star compact
  absolutely convex set is strongly bounded (§1.4). The set `{n • eₙ*} ∪ {0}` itself is weak-star
  compact, so the absolutely convex hull cannot be omitted.

*Needs:* §§0.3, 0.5, 1.2, 1.3, 1.4.

### 1.6 Permanence

Let `F` carry the final locally convex topology of a family of linear maps `f i : E i → F`
(Tau Ceti's `TauCeti.finalLocallyConvexTopology`). Prove: if every `E i` is barrelled, or
quasi-barrelled, or bornological, or ultrabornological, then so is `F`. A quotient is the case of
one surjective map; §§3.2 and 3.3 apply the statement to direct sums and inductive limits. Prove
also:

- an arbitrary product of barrelled locally convex spaces is barrelled; a countable product of
  bornological locally convex spaces is bornological;
- a locally convex space with a dense barrelled subspace is barrelled; in particular the
  completion of a barrelled Hausdorff locally convex space is barrelled;
- the image of a barrelled space under a continuous open linear map is barrelled.

No statement is made for subspaces: a closed subspace of a barrelled or bornological space need not
have the property.

(Bourbaki, EVT III §2 and §4; Schaefer–Wolff, Ch. II §7–§8 and Ch. IV §4; Köthe I, §27 and §28.)

**Checks.**

- `𝕜^ℕ` is barrelled and bornological; it is a Fréchet space.
- `c₀₀` is a dense subspace of the barrelled space `c₀` and is not barrelled: the dense-subspace
  statement has no converse and subspaces do not inherit barrelledness.
- The quotient of `ℓ¹` by a closed subspace is a Banach space, consistently.

*Needs:* §§1.1–1.4; Tau Ceti `TauCeti.finalLocallyConvexTopology`,
`TauCeti.FinalLocallyConvexTopology.continuous_seminorm_iff`; Mathlib `Pi.topologicalSpace`,
`UniformSpace.Completion`.

## Layer 2: spaces of linear maps and the strong dual

### 2.1 Topologies of uniform convergence on spaces of linear maps

For a family `𝔖` of subsets of `E`, the space `L_𝔖(E, F)` is Mathlib's `E →Lᵤ[𝕜, 𝔖] F`
(`UniformConvergenceCLM`). Its cases are the strong topology `E →L[𝕜] F` (all bounded sets), the
topology of compact convergence `E →L_c[𝕜] F` and the topology of pointwise convergence
`E →Lₚₜ[𝕜] F`. Define the abbreviation `PrecompactConvergenceCLM`, the case
`𝔖 = {s | TotallyBounded s}`, in the pattern of Mathlib's `CompactConvergenceCLM`. Mathlib proves
that `L_𝔖(E, F)` is a topological vector space when the members of `𝔖` are bounded, that it is
locally convex when `F` is, that it is Hausdorff when `F` is and `𝔖` covers `E`, and characterizes
its bounded sets (`UniformConvergenceCLM.isVonNBounded_iff`). Prove:

- for a locally convex `F` and a family `𝔖` of bounded sets, the seminorms
  `u ↦ ⨆ x ∈ S, q (u x)`, for `S ∈ 𝔖` and `q` a continuous seminorm of `F`, give the topology
  (`WithSeminorms`);
- the topology does not change when `𝔖` is replaced by the family of subsets of closed absolutely
  convex hulls of finite unions of members of `𝔖`, for locally convex `F`;
- precompact sets are bounded, so the topology of precompact convergence lies between those of
  compact and of bounded convergence; it equals compact convergence when `E` is quasi-complete
  (Mathlib `isCompact_closure_of_totallyBounded_quasiComplete`) and bounded convergence when
  `E` satisfies `MontelSpace 𝕜 E` and is Hausdorff.

(Bourbaki, EVT III §3; Schaefer–Wolff, Ch. III §3; Trèves, Ch. 32.)

**Checks.**

- For normed `E` and `F` the strong topology is the operator norm topology (Mathlib).
- For `E = 𝕜` every `L_𝔖(𝕜, F)` with `𝔖` covering `𝕜` by bounded sets is `F`.
- On an infinite-dimensional Hilbert space pointwise convergence is strictly coarser than compact
  convergence, which is strictly coarser than norm convergence.

*Needs:* Mathlib `UniformConvergenceCLM`, `UniformConvergenceCLM.isVonNBounded_iff`,
`UniformConvergenceCLM.locallyConvexSpace`, `UniformConvergenceCLM.t2Space`,
`UniformConvergenceCLM.topologicalSpace_mono`, `CompactConvergenceCLM`, `PointwiseConvergenceCLM`,
`TotallyBounded.isVonNBounded`, `isCompact_closure_of_totallyBounded_quasiComplete`.

### 2.2 Equicontinuous sets of linear maps

Let `E` and `F` be topological vector spaces and `H` an equicontinuous set of linear maps
`E → F`. Prove:

- `H` is bounded in `L_𝔖(E, F)` for every family `𝔖` of bounded sets;
- on `H`, the uniformities of pointwise convergence on a subset `D` with dense span, of pointwise
  convergence on `E`, and of precompact convergence coincide;
- the closure of `H` in `E → F` for the product topology consists of continuous linear maps and
  is equicontinuous (Mathlib `Equicontinuous.closure'`);
- if moreover `{u x | u ∈ H}` is relatively compact in `F` for each `x`, then `H` is relatively
  compact for precompact convergence (Mathlib `ArzelaAscoli.isCompact_closure_of_isClosedEmbedding`).

(Bourbaki, EVT III §3; Schaefer–Wolff, Ch. III §4.)

**Checks.**

- On the unit ball of the dual of `ℓ²`, weak-star convergence is uniform convergence on norm
  compact sets, and it is tested on the vectors `eₙ`.
- The functionals `n • eₙ*` on `ℓ²` converge to `0` at each `e_k` and not at
  `(k⁻¹)ₖ`: without equicontinuity, convergence on a set with dense span does not give pointwise
  convergence.

*Needs:* §2.1; Mathlib `Equicontinuous`, `UniformEquicontinuous`, `Equicontinuous.closure'`,
`ArzelaAscoli.isCompact_closure_of_isClosedEmbedding`.

### 2.3 The Banach–Steinhaus theorem and its corollaries

Mathlib's `PolynormableSpace.banach_steinhaus` states that a pointwise bounded family of
continuous linear maps from a barrelled space to a locally convex space is equicontinuous; Tau
Ceti's `Bornology.IsVonNBounded.equicontinuous` is the form for bounded subsets of `E →L[𝕜] F`.
Prove for a barrelled `E` and a locally convex `F`:

- for every family `𝔖` of bounded sets covering `E`, the bounded subsets of `L_𝔖(E, F)` are the
  equicontinuous sets; in particular they do not depend on `𝔖`;
- if a filter on `E →L[𝕜] F` contains a pointwise bounded set and converges pointwise to a map
  `u : E → F`, then `u` is linear and continuous and the convergence is uniform on precompact
  sets. Mathlib's `continuousLinearMapOfTendsto` is the case of a countably generated filter, where
  the bounded set comes for free.

The joint continuity of a separately continuous bilinear map on first countable barrelled spaces
is Tau Ceti's `LinearMap.continuous_uncurry_of_barrelledSpace` and is not restated.

(Bourbaki, EVT III §4; Schaefer–Wolff, Ch. III §4; Trèves, Ch. 33.)

**Checks.**

- For `E = ℓ²` the coordinate functionals are pointwise bounded and equicontinuous.
- On `c₀₀` the functionals `fₙ x = n xₙ` converge pointwise to `0`, and not uniformly on the
  precompact set `{eₙ/√n} ∪ {0}`, where `fₙ (eₙ/√n) = √n`: barrelledness is needed.

*Needs:* §§1.1, 2.2; Mathlib `PolynormableSpace.banach_steinhaus`, `continuousLinearMapOfTendsto`;
Tau Ceti `Bornology.IsVonNBounded.equicontinuous`.

### 2.4 Completeness and quasi-completeness

Let `F` be a Hausdorff locally convex space. Prove:

- `UniformConvergenceCLM.completeSpace_of_bornologicalSpace`: if `E` is bornological, `F` is
  complete, and `𝔖` is a family of bounded subsets of `E` that covers `E` and such that the range
  of every sequence converging to zero is contained in a member of `𝔖`, then `E →Lᵤ[𝕜, 𝔖] F` is
  complete. In particular `E →L[𝕜] F`, `E →L_c[𝕜] F` and `StrongDual 𝕜 E` are complete. Mathlib's
  `ContinuousLinearMap.completeSpace` assumes instead that the topology of `E` is coherent with
  its bounded sets.
- `UniformConvergenceCLM.quasiCompleteSpace_of_barrelledSpace`: if `E` is barrelled, `F` is
  quasi-complete (Mathlib `QuasiCompleteSpace`), and `𝔖` is a family of bounded sets covering `E`,
  then `E →Lᵤ[𝕜, 𝔖] F` is quasi-complete. In particular `E →Lₚₜ[𝕜] F` and `WeakDual 𝕜 E` are
  quasi-complete.

*Route.* A Cauchy filter converges pointwise to a linear map, uniformly on each member of `𝔖`. In
the first case the limit is bounded on null sequences, hence maps bounded sets to bounded sets,
hence is continuous by §1.3. In the second case a closed bounded set is equicontinuous by §2.3 and
the limit is in its pointwise closure, which §2.2 controls.

(Bourbaki, EVT III §3 and §4; Schaefer–Wolff, Ch. III §4 and Ch. IV §6; Köthe II, §39.)

**Checks.**

- The strong dual of the incomplete normed space `c₀₀` is `ℓ¹`, which is complete.
- For an infinite-dimensional Banach space `E`, `WeakDual 𝕜 E` is quasi-complete and not complete:
  a discontinuous linear functional on `E` is a pointwise limit of continuous ones along a Cauchy
  filter.
- For an infinite-dimensional Hilbert space `H`, `H →Lₚₜ[𝕜] H` is quasi-complete and not complete.

*Needs:* §§1.3, 2.2, 2.3; Mathlib `UniformConvergenceCLM.completeSpace`,
`ContinuousLinearMap.completeSpace`, `QuasiCompleteSpace`, `UniformOnFun`.

### 2.5 Grothendieck's completeness theorem

Let `E` be a Hausdorff locally convex space. Prove `completeSpace_iff_forall_weakStarContinuousOn`:
`E` is complete if and only if every linear functional on `StrongDual 𝕜 E` whose restriction to
each equicontinuous set is continuous for the weak-star topology is the evaluation at a point of
`E`. Prove the general form: the space of such functionals, with the topology of uniform
convergence on equicontinuous sets, is complete, and `E` embeds in it densely by evaluation, so it
is the completion of `E`.

(Grothendieck 1950; Schaefer–Wolff, Ch. IV, 6.2; Köthe I, §21.)

**Checks.**

- For a Banach space the equicontinuous sets are the bounded sets of the dual, and the theorem
  says that a functional on `E′` that is weak-star continuous on the unit ball is an evaluation.
- For `E = c₀₀` the functional `φ ↦ Σ φ(eₙ) 2⁻ⁿ` on `E′ = ℓ¹` is weak-star continuous on bounded
  sets and is the evaluation at `(2⁻ⁿ)`, which lies in the completion `c₀` and not in `c₀₀`.
- On `E = 𝕜ⁿ` every linear functional on `E′` is an evaluation.

*Needs:* §§0.1–0.3; Mathlib `UniformSpace.Completion`, `Equicontinuous`, `WeakDual`.

### 2.6 Semi-reflexive and reflexive spaces

Define the classes `SemireflexiveSpace 𝕜 E` and `ReflexiveSpace 𝕜 E` of the Conventions:
respectively `∀ φ : StrongDual 𝕜 (StrongDual 𝕜 E), ∃ x, ∀ f, φ f = f x`, and the existence of
`e : E ≃L[𝕜] StrongDual 𝕜 (StrongDual 𝕜 E)` with `e x f = f x`. For a Hausdorff locally convex
space `E` prove:

- `E` is semi-reflexive if and only if every bounded subset of `E` is relatively compact in
  `WeakSpace 𝕜 E`, if and only if the strong topology of the dual is `mackeyTopology
  (topDualPairing 𝕜 E)`;
- a semi-reflexive space is quasi-complete, and its strong dual is barrelled;
- `E` is reflexive if and only if it is semi-reflexive and quasi-barrelled, if and only if it is
  semi-reflexive and barrelled;
- the strong dual of a reflexive space is reflexive;
- a closed subspace of a semi-reflexive space is semi-reflexive;
- for a normed space, `ReflexiveSpace 𝕜 E` is equivalent to surjectivity of
  `NormedSpace.inclusionInDoubleDual 𝕜 E`, the convention of BanachSpaceTheory.

Tau Ceti's `TauCeti.strongBidualEquivOfSurjective` is the implication from semi-reflexive and
barrelled to reflexive.

(Schaefer–Wolff, Ch. IV §5, in particular 5.5 and 5.6; Bourbaki, EVT IV §2; Köthe I, §23;
Dieudonné–Schwartz 1949, §8.)

**Checks.**

- `ℓ²` is reflexive; `c₀` is not semi-reflexive.
- `ℓ²` with its weak topology is semi-reflexive and not reflexive: its dual is `ℓ²`, its bounded
  sets are the norm bounded sets, so its strong bidual is `ℓ²` with the norm topology, and
  evaluation is a bijection that is not a homeomorphism.

*Needs:* §§0.3–0.5, 1.1, 1.2, 1.4, 1.5; Mathlib `StrongDual`, `WeakSpace`,
`NormedSpace.inclusionInDoubleDual`; Tau Ceti `TauCeti.strongBidualEquivOfSurjective`,
`TauCeti.isEmbedding_strongEval`.

### 2.7 Montel spaces

Let `E` be a Hausdorff locally convex space with `[MontelSpace 𝕜 E]`. Prove:

- `E` is semi-reflexive and quasi-complete, and on each bounded subset of `E` the weak topology
  and the topology of `E` coincide;
- the strong topology of the dual is the topology of compact convergence (Mathlib
  `ContinuousLinearEquiv.toCompactConvergenceCLM`) and of precompact convergence.

If moreover `[BarrelledSpace 𝕜 E]`, prove:

- `E` is reflexive;
- `StrongDual 𝕜 E` satisfies `MontelSpace` and `BarrelledSpace`: the strong dual of a Montel space
  is a Montel space;
- on each bounded subset of the dual, the weak-star and the strong topology coincide; in
  particular a weak-star convergent sequence of functionals converges strongly.

Closed subspaces and products are Tau Ceti's `MontelSpace.of_isClosedEmbedding` and
`MontelSpace.pi`.

(Schaefer–Wolff, Ch. IV §5; Trèves, Ch. 34 and 36; Köthe I, §27.)

**Checks.**

- `𝕜^ℕ` is a Montel space. A normed space with `MontelSpace` is finite-dimensional (Mathlib
  `MontelSpace.finiteDimensional_of_normedSpace`).
- `ℓ²` with its weak topology satisfies `MontelSpace 𝕜` (weakly closed bounded sets are weakly
  compact) and is not reflexive (§2.6): the Heine–Borel property alone does not give
  reflexivity, and barrelledness cannot be dropped.

*Needs:* §§2.1, 2.2, 2.6; Mathlib `MontelSpace`, `ContinuousLinearEquiv.toCompactConvergenceCLM`,
`MontelSpace.finiteDimensional_of_normedSpace`; Tau Ceti `MontelSpace.of_isClosedEmbedding`,
`MontelSpace.pi`.

### 2.8 (DF)-spaces

Define the class `DFSpace 𝕜 E`: `E` has a fundamental sequence of bounded sets (a sequence of
bounded sets such that every bounded set is contained in one of them), and every countable
intersection of closed absolutely convex neighbourhoods of zero that absorbs every bounded set is
a neighbourhood of zero. For a locally convex space the second condition is equivalent to: every
strongly bounded subset of the dual that is a countable union of equicontinuous sets is
equicontinuous. Prove, for locally convex spaces:

- a normed space is a (DF)-space; a quasi-barrelled space with a fundamental sequence of bounded
  sets is a (DF)-space;
- `DFSpace.strongDual_of_firstCountable`: the strong dual of a metrizable locally convex space is
  a (DF)-space, and it is complete by §2.4;
- `DFSpace.continuous_of_continuousOn`: a linear map from a (DF)-space to a locally convex space
  is continuous if its restriction to every bounded set is continuous;
- the strong dual of a Hausdorff (DF)-space is a Fréchet space; more generally `E →L[𝕜] G` is
  complete for a Hausdorff (DF)-space `E` and a complete Hausdorff locally convex `G`;
- Hausdorff quotients and completions of (DF)-spaces are (DF)-spaces;
- a (DF)-space that is separable, or whose bounded sets are metrizable, is quasi-barrelled;
- for a Fréchet space `E`, the strong dual is barrelled if and only if it is bornological, if
  and only if it is quasi-barrelled (`E` is then called distinguished); a reflexive Fréchet space
  is distinguished.

(Grothendieck 1954; Köthe I, §29; Schaefer–Wolff, Ch. IV §6; Jarchow, Ch. 12; Meise–Vogt, Ch. 25.)

**Checks.**

- `𝕜^ℕ` is not a (DF)-space: for bounded sets `Bₖ ⊆ ∏ [−aₖ(n), aₖ(n)]`, the bounded set
  `∏ [−b(n), b(n)]` with `b(n) = 1 + max_{k ≤ n} aₖ(n)` is contained in none of them.
- The space `𝕜^(ℕ)` of finitely supported sequences with its finest locally convex topology is
  the strong dual of `𝕜^ℕ`; it is a (DF)-space and is not metrizable, so (DF) is not normability.
  Its strong dual is `𝕜^ℕ`, a Fréchet space.
- The strong dual of a metrizable locally convex space `E` is metrizable only if `E` is normable:
  a metrizable (DF)-space has a bounded neighbourhood of zero.

*Needs:* §§0.3, 1.2, 1.3, 2.3, 2.4, 2.6; Mathlib `Bornology.IsVonNBounded`,
`FirstCountableTopology`, `TopologicalSpace.SeparableSpace`.

## Layer 3: inductive limits and LF-spaces

### 3.1 Final locally convex topologies

Tau Ceti's `TauCeti.finalLocallyConvexTopology f` is the finest locally convex topology on `F`
making the linear maps `f i : E i → F` continuous, with its universal property
`TauCeti.FinalLocallyConvexTopology.continuous_iff_continuous_comp`, its seminorm criterion
`continuous_seminorm_iff` and, for `𝕜`-linear maps, continuity of the `𝕜`-scalar multiplication
(`TauCeti.FinalLocallyConvexTopology.continuousSMul`). Define the predicate
`IsFinalLocallyConvex f` on a topological vector space `F` over `𝕜` with `𝕜`-linear maps
`f i : E i →ₗ[𝕜] F` from topological vector spaces: the topology of `F` is
`finalLocallyConvexTopology` of the `f i` restricted to real scalars. Theorems about inductive
limits are stated with this predicate, so that they apply to spaces that already carry a topology.
Prove:

- `IsFinalLocallyConvex f` holds if and only if `F` is locally convex and a `𝕜`-seminorm `p` on
  `F` is continuous exactly when every `p ∘ f i` is; if and only if `F` is locally convex, every
  `f i` is continuous, and an absolutely convex `U ⊆ F` is a neighbourhood of zero as soon as
  every `f i ⁻¹' U` is one;
- a set `H` of linear maps from `F` to a locally convex space is equicontinuous if and only if
  each `{u ∘ f i | u ∈ H}` is;
- transitivity: if each `E i` carries the final locally convex topology of maps `g i j`, then `F`
  carries that of the `f i ∘ g i j`;
- for a subspace `M` of a locally convex space `E`, the quotient topology on `E ⧸ M` is the final
  locally convex topology of `M.mkQ`;
- if the ranges of the `f i` do not span `F`, the final locally convex topology induces on a
  complement of the span the finest locally convex topology.

(Bourbaki, EVT II §4; Schaefer–Wolff, Ch. II §6; Köthe I, §19; Jarchow, Ch. 4.)

**Checks.**

- For a single surjective map `f : E → F` from a locally convex space, the final locally convex
  topology is the quotient topology of `E ⧸ ker f`.
- For the empty family, or all `f i = 0`, it is the finest locally convex topology on `F`, in which
  every seminorm is continuous.
- The final locally convex topology can be strictly coarser than the final topology of
  topological spaces; Mathlib's `TestFunction.originalTop_le` is the comparison for test functions.

*Needs:* Tau Ceti `TauCeti.finalLocallyConvexTopology`,
`TauCeti.FinalLocallyConvexTopology.continuous_iff_continuous_comp`,
`TauCeti.FinalLocallyConvexTopology.continuous_seminorm_iff`,
`TauCeti.FinalLocallyConvexTopology.continuousSMul`,
`TauCeti.FinalLocallyConvexTopology.eq_of_rightInverse`; Mathlib `Submodule.mkQ`, `Seminorm`.

### 3.2 Locally convex direct sums

For a family of locally convex spaces `E i`, define the locally convex direct sum topology on
Mathlib's `Π₀ i, E i` (equivalently `⨁ i, E i`): the final locally convex topology of the maps
`DFinsupp.lsingle i`. It is a definition and a scoped instance, not a global instance. Prove:

- the universal property: a linear map from the direct sum to a locally convex space is continuous
  if and only if its restriction to each summand is;
- the topology is given by the seminorms `x ↦ Σ i, p i (x i)`, for all families `(p i)` of
  continuous seminorms;
- each `DFinsupp.lsingle i` is a topological embedding, each coordinate projection is continuous,
  and the inclusion of the direct sum into the product `Π i, E i` is continuous;
- the direct sum is Hausdorff if and only if every `E i` is; then each summand is closed;
- for Hausdorff `E i`: a subset is bounded if and only if it is contained in the sum of finitely
  many summands and each of its coordinate projections is bounded;
- for Hausdorff `E i`: the direct sum is complete if and only if every `E i` is; it is
  quasi-complete if and only if every `E i` is;
- for a finite index set the direct sum is the product, as topological vector spaces;
- duality: restriction to the summands identifies the dual of the direct sum with the product of
  the duals, and the dual of the product `Π i, E i` with the direct sum of the duals, a continuous
  linear functional on a product depending on finitely many coordinates. For Hausdorff `E i` both
  identifications are isomorphisms of topological vector spaces for the strong topologies:
  `StrongDual 𝕜 (Π₀ i, E i) ≃L[𝕜] Π i, StrongDual 𝕜 (E i)` and
  `StrongDual 𝕜 (Π i, E i) ≃L[𝕜] Π₀ i, StrongDual 𝕜 (E i)`;
- the locally convex direct sum of a sequence of (DF)-spaces is a (DF)-space.

(Bourbaki, EVT II §4; Schaefer–Wolff, Ch. II §6 and Ch. IV §4; Köthe I, §18 and §22.)

**Checks.**

- `𝕜^(ℕ) = Π₀ _ : ℕ, 𝕜` carries the finest locally convex topology: every linear functional is
  continuous, and its dual is `𝕜^ℕ`.
- In `𝕜^(ℕ)` the set `{eₙ}` is not bounded, since it lies in no finite partial sum; it is bounded
  in the topology induced by the product `𝕜^ℕ`, where `eₙ → 0`. So the direct sum topology is
  strictly finer than the product topology.
- Hausdorffness is needed for the description of bounded sets: if each `E i` is `𝕜` with the
  indiscrete topology, the whole direct sum is bounded.

*Needs:* §§0.4, 2.8, 3.1; Mathlib `DFinsupp`, `DFinsupp.lsingle`, `DFinsupp.lsum`, `DirectSum`,
`Pi.topologicalSpace`.

### 3.3 Inductive sequences

Define the predicate `IsInductiveSequence T ι` of the Conventions for `T n : X n →L[𝕜] X (n + 1)`
and `ι n : X n →L[𝕜] E`: the compatibility `ι (n + 1) ∘ T n = ι n`, injectivity of each `ι n`,
`⋃ n, range (ι n) = univ`, and `IsFinalLocallyConvex (fun n ↦ (ι n : X n →ₗ[𝕜] E))`. Define the
transition maps `X n →L[𝕜] X m` for `n ≤ m` as composites of the `T k`, with their functoriality
and `ι m ∘ transition = ι n`. Prove:

- the sum map `Π₀ n, X n → E` is a continuous open linear surjection: `E` is the quotient of the
  direct sum of the steps; its kernel is the range of `x ↦ x − shift x`, where `shift` applies
  `T n` on the `n`-th summand;
- passing to a subsequence of the steps, with the composite bonding maps, gives an inductive
  sequence with the same limit;
- if `(X′, T′, ι′)` is a second family with the compatibility, injectivity and covering
  properties for the same `E`, and each `range (ι n)` is contained in some `range (ι′ m)` with
  `X n → X′ m` continuous and conversely, then one is an inductive sequence if and only if the
  other is;
- a linear map from `E` into a locally convex space is continuous if and only if its composite
  with each `ι n` is (this is §3.1);
- the limit of an inductive sequence of (DF)-spaces, in particular of normed spaces, is a
  (DF)-space when it is Hausdorff.

Define regularity: an inductive sequence is *regular* when every bounded subset of `E` is the
image under some `ι n` of a bounded subset of `X n`.

The limit of an inductive sequence of Hausdorff spaces need not be Hausdorff; Hausdorffness of
`E` is a hypothesis wherever it is used.

(Bourbaki, EVT II §4; Köthe I, §19; Bierstedt 1988; Floret 1980.)

**Checks.**

- The constant sequence `X n = E`, `T n = id` is an inductive sequence with limit `E`.
- `𝕜^(ℕ)` is the limit of `X n = 𝕜ⁿ` with the coordinate inclusions.
- The inductive sequences of normed spaces with compact bonding maps of Hyperfunctions §2.0e are
  inductive sequences in this sense, and Tau Ceti's
  `TauCeti.isVonNBounded_iff_exists_subset_image_closedBall` proves that they are regular.

*Needs:* §§2.8, 3.1, 3.2; Hyperfunctions §2.0e; Tau Ceti
`TauCeti.isVonNBounded_iff_exists_subset_image_closedBall`.

### 3.4 Strict inductive limits

Let `(X, T, ι)` be a strict inductive sequence of locally convex spaces: every `T n` is a
topological embedding. Prove:

- `IsInductiveSequence.isEmbedding_of_strict`: every `ι n` is a topological embedding, so the
  limit induces on each step its own topology. *Route:* a convex neighbourhood of zero in `X n`
  extends step by step to convex neighbourhoods in `X (n + 1)`, `X (n + 2)`, …, whose union is a
  neighbourhood in the limit;
- if every `X n` is Hausdorff, so is `E`;
- if moreover the range of every `T n` is closed, then every `range (ι n)` is closed in `E`, and
  `IsInductiveSequence.isVonNBounded_iff_of_strict` (Dieudonné–Schwartz): a subset `B` of `E` is
  bounded if and only if `B = ι n '' A` for some `n` and some bounded `A ⊆ X n`. In particular the
  sequence is regular, a convergent sequence of `E` lies and converges in one step, and a compact
  subset of `E` lies and is compact in one step;
- `IsInductiveSequence.completeSpace_of_strict` (Köthe): if every `X n` is Hausdorff and complete,
  then `E` is complete;
- if every `X n` is Hausdorff, the range of every `T n` is closed, and `T n` is not surjective for
  infinitely many `n`, then `E` is not metrizable and is not a Baire space.

(Dieudonné–Schwartz 1949; Schaefer–Wolff, Ch. II, 6.4 to 6.6; Bourbaki, EVT II §4 and III §1;
Köthe I, §19; Trèves, Ch. 13 and 14.)

**Checks.**

- In `𝕜^(ℕ) = ⋃ 𝕜ⁿ` every bounded set lies in some `𝕜ⁿ`, and the sequence `eₙ` does not converge.
- Closed ranges are needed for the description of bounded sets. Partition `ℕ` into infinitely
  many infinite sets `Rⱼ`, let `gⱼ x = Σ_{k ∈ Rⱼ} x k` on `c₀₀`, and let
  `Xₙ = {x ∈ c₀₀ | ∀ j > n, gⱼ x = 0}` with the supremum norm. The `Xₙ` increase to `c₀₀`, the
  inclusions are isometric embeddings, and `X₀` is dense in `c₀₀`. The limit topology is the
  supremum norm topology of `c₀₀`, whose unit ball is bounded and lies in no `Xₙ`.
- For the constant sequence of a Fréchet space every `T n` is surjective, so the last statement
  does not apply, as it must not: the limit is the space itself.

*Needs:* §§3.1, 3.3; Mathlib `Topology.IsEmbedding`, `BaireSpace`, `CompleteSpace`,
`TopologicalSpace.MetrizableSpace`.

### 3.5 LF-spaces

Define `IsLFSpace 𝕜 E` and `IsStrictLFSpace 𝕜 E` of the Conventions: `E` is Hausdorff and has an
inductive sequence, respectively a strict inductive sequence, of Fréchet spaces in the universe of
`E`. Prove:

- a Fréchet space is a strict LF-space; a strict LF-space is an LF-space; a strict inductive
  sequence of Fréchet spaces has closed ranges, so §3.4 applies in full: the limit is Hausdorff
  and complete, and bounded sets lie in a step;
- an LF-space is barrelled, bornological and ultrabornological (§1.6);
- for a linear map `u` from an LF-space into a locally convex space, the following are
  equivalent: `u` is continuous; every `u ∘ ι n` is continuous; `u` is sequentially continuous;
  `u` maps bounded sets to bounded sets;
- a Hausdorff quotient of an LF-space by a closed subspace `L` is an LF-space, with steps
  `X n ⧸ (ι n)⁻¹ L`; a countable locally convex direct sum of LF-spaces is an LF-space; a finite
  product of LF-spaces is an LF-space;
- a closed subspace of an LF-space, with the subspace topology, need not be an LF-space (§6.5).

Layer 4 proves that any two inductive sequences of Fréchet spaces with the same limit are
equivalent in the sense of §3.3, so the regularity notions of Layer 6 do not depend on the
sequence.

(Dieudonné–Schwartz 1949; Köthe I, §19; Trèves, Ch. 13; Meise–Vogt, Ch. 24; Pérez Carreras–Bonet,
Ch. 8.)

**Checks.**

- `𝕜^(ℕ)` is a strict LF-space that is not metrizable.
- A quotient of a strict LF-space is an LF-space and need not be a strict one, and need not be
  complete (Köthe I, §31): the definitions of LF-space and strict LF-space differ.
- The space of germs of holomorphic functions at a point, the inductive limit of the Banach spaces
  of bounded holomorphic functions on the discs of radius `1/n`, is an LF-space with compact
  bonding maps. It is not a strict LF-space: it is a (DF)-space satisfying `MontelSpace`, so a
  Fréchet space embedded in it is normable and has the Heine–Borel property, hence is
  finite-dimensional, while the space has uncountable dimension.

*Needs:* §§1.6, 3.3, 3.4; Mathlib `SeqContinuous`, `Submodule.mkQ`.

### 3.6 Duals of inductive limits

Let `(X, T, ι)` be an inductive sequence with limit `E`. Prove:

- `f ↦ (f ∘ ι n)ₙ` is a linear bijection of the dual of `E` onto the space of compatible
  families `{(fₙ) | ∀ n, f (n + 1) ∘ T n = f n}` in `Π n, StrongDual 𝕜 (X n)`, the projective
  limit of the duals;
- it is a topological embedding `WeakDual 𝕜 E → Π n, WeakDual 𝕜 (X n)`;
- it is continuous `StrongDual 𝕜 E → Π n, StrongDual 𝕜 (X n)`, and it is a topological embedding
  for the strong topologies if and only if every bounded subset of `E` is contained in the closure
  of `ι n '' A` for some `n` and some bounded `A ⊆ X n`. In particular it is one when the sequence
  is regular, hence for strict sequences with closed ranges (§3.4);
- a subset `H` of the dual of `E` is equicontinuous if and only if each `{f ∘ ι n | f ∈ H}` is.

For a strict inductive sequence of Fréchet spaces this identifies the strong dual of the strict
LF-space `E` with the projective limit of the strong duals of the steps; the restriction maps
`StrongDual 𝕜 E → StrongDual 𝕜 (X n)` are surjective by the Hahn–Banach theorem. The case of
normed steps with weakly compact bonding maps is Tau Ceti's
`TauCeti.dualProjectiveLimit.strongDualEquiv` (Hyperfunctions §2.0e) and is not restated.

(Schaefer–Wolff, Ch. IV §4; Köthe I, §22; Dieudonné–Schwartz 1949.)

**Checks.**

- For `E = 𝕜^(ℕ) = ⋃ 𝕜ⁿ` the projective limit of the duals is `𝕜^ℕ` with the product topology.
- For the example of §3.4 with non-closed steps, the limit is `c₀₀`, its strong dual is `ℓ¹`
  with the norm topology, and the unit ball of `c₀₀` is contained in the closure of the unit ball
  of `X₀`: the closure in the criterion cannot be omitted.

*Needs:* §§0.1, 0.2, 3.3, 3.4; Mathlib `WeakDual`, `StrongDual`, `StrongDual.exists_extension`;
Hyperfunctions §2.0e; Tau Ceti `TauCeti.dualProjectiveLimit`.

## Layer 4: factorization, closed graph and open mapping theorems

### 4.1 Banach's theorem for maps with non-meagre range

Prove `ContinuousLinearMap.isOpenMap_of_not_isMeagre_range`: let `X` be an F-space, `Y` a Hausdorff
topological vector space and `u : X →L[𝕜] Y` with `range u` not meagre in `Y`. Then `u` is
surjective and open, and `Y` is an F-space. The open mapping theorem of SpectralManifolds §3.2 is
the case of a surjection onto an F-space. *Route:* the Baire step of Tau Ceti's
`TauCeti.closure_image_mem_nhds_zero_of_tendsto_zero`, run with a non-meagre range in place of
surjectivity onto a Baire space, shows that the closure of the image of a neighbourhood of zero is
a neighbourhood of zero; `TauCeti.isOpenMap_of_closure_image_mem_nhds` concludes.

(Rudin, *Functional Analysis*, Theorem 2.11; Bourbaki, EVT I §3.)

**Checks.**

- The inclusion of `ℓ¹` into `ℓ²` is continuous, injective and not surjective, so its range is
  meagre in `ℓ²`.
- A continuous linear functional on an F-space is zero or open.

*Needs:* SpectralManifolds §3.2; LocallyAnalyticDistributions §0.2; Tau Ceti
`TauCeti.closure_image_mem_nhds_zero_of_tendsto_zero`,
`TauCeti.isOpenMap_of_closure_image_mem_nhds`; Mathlib `IsMeagre`, `BaireSpace`.

### 4.2 Grothendieck's factorization theorem

Prove `exists_range_subset_of_isSeqClosed_graph`: let `X` be an F-space, `F` a Hausdorff topological
vector space, `(Y n)` a sequence of F-spaces with continuous linear maps `v n : Y n →L[𝕜] F`, and
`u : X →ₗ[𝕜] F` a linear map whose graph is sequentially closed in `X × F` (Mathlib
`IsSeqClosed`), such that `range u ⊆ ⋃ n, range (v n)`. Then there is `n` with
`range u ⊆ range (v n)`. If moreover `v n` is injective, there is a unique continuous linear
`w : X →L[𝕜] Y n` with `u = v n ∘ w`; in general there is a continuous linear
`w : X →L[𝕜] Y n ⧸ ker (v n)` through which `u` factors. In particular `u` is continuous.

*Route.* The set `Gₙ = {(x, y) | u x = v n y}` is the preimage of the graph of `u` under the
continuous map `(x, y) ↦ (x, v n y)`, so it is a sequentially closed, hence closed, subspace of the
metrizable space `X × Y n`, and is an F-space. The ranges of the first projections `Gₙ → X` cover
the Baire space `X`, so one of them is not meagre, and §4.1 makes that projection surjective and
open.

(Grothendieck 1955, Introduction, IV, Théorème A; Meise–Vogt, 24.33.)

**Checks.**

- The source must be an F-space: the identity of `𝕜^(ℕ) = ⋃ 𝕜ⁿ` is continuous and its range lies
  in no `𝕜ⁿ`.
- For a single F-space `Y` and `v = id` the theorem is the closed graph theorem of
  SpectralManifolds §3.2.
- A continuous linear map from a Fréchet space into the strict LF-space `𝕜^(ℕ)` has
  finite-dimensional range.

*Needs:* §4.1; SpectralManifolds §3.2; Mathlib `LinearMap.graph`, `BaireSpace`, `Submodule.mkQ`.

### 4.3 The closed graph theorem

Say that a Hausdorff locally convex space `F` is *covered by a sequence of Fréchet spaces* when
there are Fréchet spaces `Y n` and continuous linear maps `v n : Y n →L[𝕜] F` with
`⋃ n, range (v n) = univ`. This is a hypothesis of the theorems below and is not made a class.
Every LF-space is covered by its steps; so are a closed subspace and a Hausdorff quotient of a
space covered by a sequence of Fréchet spaces, and a countable product or countable locally convex
direct sum of Fréchet spaces.

Prove `LinearMap.continuous_of_isSeqClosed_graph_of_ultrabornological`: let `E` be an
ultrabornological locally convex space, `F` a Hausdorff locally convex space covered by a
sequence of Fréchet spaces, and `u : E →ₗ[𝕜] F` a linear map whose graph is sequentially closed.
Then `u` is continuous. *Route:* for a continuous linear `T : X → E` from a Banach space, the
graph of `u ∘ T` is sequentially closed, so `u ∘ T` is continuous by §4.2, and §1.4 concludes.

(Grothendieck 1955, Introduction, IV, Théorème B; Köthe II, §34 and §35; Meise–Vogt, Ch. 24.)

**Checks.**

- The source must be ultrabornological: the identity from `ℓ²` with its weak topology to `ℓ²` has
  closed graph and is not continuous.
- The target must be covered: the identity from `ℓ²` to `ℓ²` with the finest locally convex
  topology has closed graph and is not continuous.
- For Fréchet `E` and `F` the theorem is the closed graph theorem of SpectralManifolds §3.2.

*Needs:* §§1.4, 4.2; SpectralManifolds §3.2.

### 4.4 The open mapping theorem

Prove `ContinuousLinearMap.isOpenMap_of_surjective_of_ultrabornological`: let `F` be a Hausdorff
locally convex space covered by a sequence of Fréchet spaces, `E` a Hausdorff ultrabornological
locally convex space, and `u : F →L[𝕜] E` a continuous linear surjection. Then `u` is open.
*Route:* `F ⧸ ker u` is covered by a sequence of Fréchet spaces, and the inverse of the induced
bijection has closed graph, so §4.3 applies to it.

Deduce for LF-spaces:

- a continuous linear surjection between LF-spaces is open, and a continuous linear bijection
  between LF-spaces is an isomorphism of topological vector spaces;
- a linear map between LF-spaces with sequentially closed graph is continuous;
- if two LF-space topologies on the same vector space are comparable, they are equal;
- a continuous linear map from a Fréchet space into an LF-space has its range in one step and is
  continuous into that step (§4.2); hence any two inductive sequences of Fréchet spaces with the
  same limit are equivalent in the sense of §3.3;
- an LF-space that is a Baire space is a Fréchet space, isomorphic to one of its steps (§4.1).

(Dieudonné–Schwartz 1949; Grothendieck 1955, Introduction, IV, Théorème B; Köthe II, §34 and
§35; Meise–Vogt, 24.30 and 24.31.)

**Checks.**

- The identity from `ℓ²` to `ℓ²` with its weak topology is a continuous linear bijection that is
  not open: the target is not ultrabornological.
- For Fréchet spaces this is the open mapping theorem of SpectralManifolds §3.2 and
  LocallyAnalyticDistributions §0.2.
- The sum map `Π₀ n, X n → E` of §3.3 is open by construction, consistently.

*Needs:* §§3.3, 3.5, 4.1–4.3; SpectralManifolds §3.2; LocallyAnalyticDistributions §0.2.

## Layer 5: the injective tensor product and nuclear spaces

### 5.1 The injective tensor product

Let `E` and `F` be Hausdorff locally convex spaces. Define the injective topology on the algebraic
tensor product `E ⊗[𝕜] F`, on a type synonym `InjectiveTensorProduct 𝕜 E F` in the pattern of Tau
Ceti's Banach `TauCeti.InjectiveTensor`: the topology of the seminorms

`ε_(p,q)(t) = sup {‖(f ⊗ g) t‖ : f ∈ {p ≤ 1}°, g ∈ {q ≤ 1}°}`

for continuous seminorms `p` on `E` and `q` on `F`, where `(f ⊗ g)(x ⊗ y) = f x * g y`. It is the
topology of uniform convergence on products of equicontinuous subsets of the two duals. Define the
completed injective tensor product `E ⊗̂ε F` as its `UniformSpace.Completion`,
`CompletedInjectiveTensorProduct 𝕜 E F`. Prove:

- the injective topology is a Hausdorff locally convex topology, and `ε_(p,q)(x ⊗ y) = p x * q y`;
- `ε_(p,q) ≤ π_(p,q)` for the projective seminorms of NoncommutativeGeometry N1, so the identity of
  `E ⊗[𝕜] F` extends to a continuous linear map `E ⊗̂π F → E ⊗̂ε F` with dense range;
- functoriality: for continuous linear `u : E → E₁` and `v : F → F₁`, the map `u ⊗ v` is
  continuous for the injective topologies and extends to the completions, with identity and
  composition laws; the flip `E ⊗̂ε F ≃L[𝕜] F ⊗̂ε E`;
- subspaces: if `u` and `v` are topological embeddings, so is `u ⊗ v` for the injective
  topologies, and so is its extension to the completions;
- for normed spaces the injective topology is that of the Banach injective norm of
  BanachSpaceTheory §4.3, and `E ⊗̂ε F` is isomorphic to `TauCeti.CompletedInjectiveTensor 𝕜 E F`
  by the identity on pure tensors;
- the embedding into bilinear forms: `t ↦ ((f, g) ↦ (f ⊗ g) t)` maps `E ⊗[𝕜] F` injectively
  into the space `𝔅(E′_σ, F′_σ)` of separately continuous bilinear forms on
  `WeakDual 𝕜 E × WeakDual 𝕜 F`, and is a topological embedding for the topology of uniform
  convergence on products of equicontinuous sets on `𝔅(E′_σ, F′_σ)`. If `E` and `F` are complete,
  that space is complete, so `E ⊗̂ε F` is isomorphic to the closure of `E ⊗[𝕜] F` in it. In
  particular, for complete `E` and `F`, the functionals `f ⊗ g`, extended to `E ⊗̂ε F`, separate
  its points.

The completeness of `𝔅(E′_σ, F′_σ)` uses Grothendieck's completeness theorem (§2.5): a limit of
weak-star continuous functionals, uniform on equicontinuous sets, is weak-star continuous on
equicontinuous sets, hence is an evaluation.

(Grothendieck 1955, Ch. I, §3; Trèves, Ch. 42 and 43; Schaefer–Wolff, Ch. III §6 and Ch. IV §9;
Köthe II, §44; Jarchow, Ch. 16.)

**Checks.**

- For `E = 𝕜ⁿ`, both the projective and the injective topology on `𝕜ⁿ ⊗ F ≅ Fⁿ` are the product
  topology.
- For `E = F = ℓ²`, the tensor `Σ_{i<n} eᵢ ⊗ eᵢ` has projective norm `n` and injective norm `1`,
  so the two topologies differ.
- On `E ⊗[𝕜] 𝕜 ≅ E` both topologies are the topology of `E`.

*Needs:* §§0.2, 0.3, 2.5; NoncommutativeGeometry N1; BanachSpaceTheory B4; Mathlib `TensorProduct`,
`UniformSpace.Completion`, `StrongDual.exists_extension`; Tau Ceti
`TauCeti.CompletedProjectiveTensorProduct`, `TauCeti.CompletedInjectiveTensor`, `TauCeti.InjectiveTensor`.

### 5.2 Nuclear spaces

Nuclear spaces are those of AutomorphicSpectralTheory §0.11, over `ℝ` and `ℂ` as in
SpectralManifolds §3.6: a Hausdorff locally convex space `E` such that for every continuous
seminorm `p` there is a continuous seminorm `q ≥ p` for which the canonical map `Ê_q → Ê_p`
between the Banach completions of the seminormed spaces `(E, q)` and `(E, p)` is a nuclear
operator in the sense of BanachSpaceTheory §4.4. No second notion of nuclear space is defined.

Prove Grothendieck's theorem, `IsNuclear.projectiveTensor_eq_injectiveTensor`: if `E` is nuclear
and `F` is a Hausdorff locally convex space, then the projective and the injective topology
coincide on `E ⊗[𝕜] F`, and the canonical map `E ⊗̂π F → E ⊗̂ε F` of §5.1 is an isomorphism of
topological vector spaces. Explicitly, if `Ê_q → Ê_p` is nuclear with nuclear norm `ν`, then
`π_(p,r)(t) ≤ ν * ε_(q,r)(t)` for every continuous seminorm `r` on `F` and every `t`. The same
holds with the factors exchanged.

Deduce, for complete nuclear `E` and complete `F`: the functionals `f ⊗ g`, with `f` in the dual
of `E` and `g` in the dual of `F`, separate the points of `E ⊗̂π F` (§5.1).

The converse (a space is nuclear if the two topologies coincide on `E ⊗ F` for every Banach
space `F`), the other characterizations of nuclear spaces, and their permanence properties are
not targets of this roadmap.

(Grothendieck 1955, Ch. II, §2, no. 1; Trèves, Ch. 50; Schaefer–Wolff, Ch. IV §9.)

**Checks.**

- `𝕜ⁿ` is nuclear, and the two topologies on `𝕜ⁿ ⊗ F` coincide (§5.1).
- `ℓ²` is not nuclear: by the theorem, nuclearity would make the projective and injective
  topologies of `ℓ² ⊗ ℓ²` equal, which §5.1 excludes.
- The bound is sharp in rank one: for `E = 𝕜`, `p = q = ‖·‖` and `ν = 1` it reads
  `π_(p,r) ≤ ε_(q,r)`, an equality.

*Needs:* §5.1; AutomorphicSpectralTheory §0.11; SpectralManifolds §3.6; BanachSpaceTheory B4;
NoncommutativeGeometry N1; Tau Ceti `TauCeti.NuclearOperator`.

## Layer 6: regularity of inductive limits

### 6.1 Schwartz spaces

Define the class `SchwartzLocallyConvexSpace 𝕜 E` (a Schwartz space in the sense of Grothendieck;
the name avoids Mathlib's `SchwartzMap`): for every continuous seminorm `p` there is a
neighbourhood `V` of zero that is precompact for `p`, that is, for every `ε > 0` there is a
finite set `t` with `V ⊆ ⋃ x ∈ t, {y | p (y − x) < ε}`. A *Fréchet–Schwartz space* is a Fréchet
space with this property; this is the notion FS of Hyperfunctions, Conventions. Prove, for
locally convex spaces:

- `E` is a Schwartz space if and only if for every continuous seminorm `p` there is a continuous
  seminorm `q ≥ p` such that the canonical map `Ê_q → Ê_p` is a compact operator; if and only if
  every continuous linear map from `E` into a Banach space maps some neighbourhood of zero onto
  a relatively compact set;
- a normed space is a Schwartz space if and only if it is finite-dimensional;
- subspaces, quotients, arbitrary products, countable locally convex direct sums and countable
  inductive limits of Schwartz spaces are Schwartz spaces;
- every bounded subset of a Schwartz space is precompact; a quasi-complete Hausdorff Schwartz
  space satisfies `MontelSpace 𝕜 E`; a Fréchet–Schwartz space is a Montel space, hence reflexive
  (§2.7);
- a closed subspace and a quotient by a closed subspace of a Fréchet–Schwartz space are
  Fréchet–Schwartz spaces.

That nuclear spaces are Schwartz spaces is not a target of this roadmap.

(Grothendieck 1954; Jarchow, Ch. 10.)

**Checks.**

- `𝕜^ℕ` is a Fréchet–Schwartz space: a continuous seminorm depends on finitely many
  coordinates.
- An infinite-dimensional Banach space is not a Schwartz space, since its unit ball is not
  precompact.
- `ℓ²` with its weak topology is a Schwartz space: a weakly continuous seminorm is dominated by
  a finite maximum of `|fᵢ|` and factors through a finite-dimensional quotient. So a Schwartz
  space need not be barrelled, and `MontelSpace` in the statement above is the Heine–Borel
  property only.

*Needs:* §§2.7, 3.1–3.3; Mathlib `IsCompactOperator`, `TotallyBounded`, `MontelSpace`,
`isCompact_closure_of_totallyBounded_quasiComplete`.

### 6.2 Lifting of compact and bounded sets

Let `E` be an F-space, `L` a closed subspace and `q = L.mkQ : E → E ⧸ L`. Prove:

- `exists_isCompact_image_eq_of_quotient`: every compact subset of `E ⧸ L` is the image under `q`
  of a compact subset of `E`. No local convexity is used;
- if `E` is a Fréchet–Schwartz space, every bounded subset `B` of `E ⧸ L` is contained in
  `q '' A` for a bounded, indeed compact, `A ⊆ E`. *Route:* `E ⧸ L` is Fréchet–Schwartz, so the
  closure of `B` is compact (§6.1).

The second statement is false for Fréchet–Montel spaces in general: Köthe and Grothendieck
constructed a Fréchet–Montel space with a quotient isomorphic to `ℓ¹`, whose unit ball is not the
image of a bounded set.

(Bourbaki, *Topologie générale*, IX §2; Köthe I, §22 and §31; Grothendieck 1954.)

**Checks.**

- For Banach spaces every bounded subset of a quotient is the image of a bounded set, by the
  open mapping theorem; the first statement is not needed and the second does not apply, since
  an infinite-dimensional Banach space is not a Schwartz space.
- For `L = 0` both statements are trivial, and for `L = E` they concern `{0}`.

*Needs:* §6.1; SpectralManifolds §3.2; Mathlib `Submodule.mkQ`, `IsCompact`,
`QuotientAddGroup.isOpenQuotientMap_mk`.

### 6.3 Regularity conditions and Retakh's condition (M)

Let `(X, T, ι)` be an inductive sequence with Hausdorff limit `E`. For a subset `S` of
`range (ι m)`, the *topology of step `m` on `S`* is the topology on `S` induced by
`(ι m)⁻¹ : range (ι m) → X m`. Besides regularity (§3.3), define:

- *compactly regular*: every compact subset of `E` is the image under some `ι n` of a compact
  subset of `X n`;
- *sequentially retractive*: every sequence of `E` converging to zero is the image under some
  `ι n` of a sequence of `X n` converging to zero;
- *boundedly retractive*: for every bounded `B ⊆ E` there is `n` with `B ⊆ range (ι n)` such that
  the topology of step `n` on `B` is the topology induced by `E`;
- *condition (M)* (Retakh): there are absolutely convex neighbourhoods of zero `U n ⊆ X n` with
  `T n '' U n ⊆ U (n + 1)` such that for every `n` there is `m ≥ n` such that for all `k ≥ m` the
  topologies of step `k` and of step `m` on `ι n '' U n` coincide.

Prove:

- boundedly retractive implies compactly regular, compactly regular implies sequentially
  retractive, and boundedly retractive implies regular;
- a strict inductive sequence satisfies (M); if moreover the ranges of the `T n` are closed and
  the steps are Hausdorff, it is boundedly retractive (§3.4);
- an inductive sequence of Banach spaces with compact bonding maps (Hyperfunctions §2.0e)
  satisfies (M);
- if every step satisfies `MontelSpace 𝕜 (X n)`, a regular sequence is boundedly retractive: a
  bounded set of a step has compact closure there, and on a compact set the topology of the step
  and the coarser Hausdorff topology of `E` coincide;
- regularity, compact regularity, sequential retractivity and bounded retractivity are invariant
  under equivalence of inductive sequences (§3.3); for LF-spaces they are therefore properties of
  the space (§4.4).

(Retakh 1970; Floret 1971; Bierstedt 1988; Wengenroth 2003, Ch. 6.)

**Checks.**

- For `𝕜^(ℕ) = ⋃ 𝕜ⁿ` all conditions hold, with `U n` the unit ball of `𝕜ⁿ`.
- For the constant sequence of a Fréchet space all conditions hold trivially.
- In the example of §3.4 with non-closed steps the limit `c₀₀` is normed, (M) holds since the
  sequence is strict, and the sequence is not regular: (M) alone, for steps that are not complete,
  does not give regularity.

*Needs:* §§3.3, 3.4, 4.4; Hyperfunctions §2.0e; Mathlib `MontelSpace`, `Topology.IsInducing`.

### 6.4 Acyclic inductive sequences

Let `(X, T, ι)` be an inductive sequence. Let `σ : Π₀ n, X n →L[𝕜] Π₀ n, X n` be `x ↦ x − shift x`,
where `shift` is `T n` from the `n`-th summand to the `(n + 1)`-st (§3.3), for the locally convex
direct sum topology. It is injective and its range is the kernel of the sum map. Define: the
sequence is *acyclic* (Palamodov) when `σ` is a topological embedding. Since `E` is the quotient
of the direct sum by the range of `σ`, a sequence is acyclic if and only if
`0 → Π₀ n, X n → Π₀ n, X n → E → 0` is an exact sequence of topological vector spaces with open
maps onto their ranges. Prove, for an inductive sequence of Fréchet spaces with Hausdorff limit
`E`:

- the theorem of Palamodov and Retakh: the sequence is acyclic if and only if it satisfies (M);
- Wengenroth's theorem: the following are equivalent: the sequence is acyclic; it is boundedly
  retractive; it is compactly regular; it is sequentially retractive;
- an acyclic sequence is regular, and its limit `E` is complete;
- a strict inductive sequence of Fréchet spaces is acyclic; an inductive sequence of Banach
  spaces with compact bonding maps and Hausdorff limit is acyclic;
- if the steps are Fréchet–Montel spaces, the sequence is acyclic if and only if it is regular
  (§6.3).

By §4.4 acyclicity of an LF-space does not depend on the inductive sequence of Fréchet spaces.

(Palamodov 1971; Retakh 1970; Wengenroth 1996; Wengenroth 2003, Ch. 6; Vogt 1992.)

**Checks.**

- For `𝕜^(ℕ) = ⋃ 𝕜ⁿ` the direct sum of the steps is a countable-dimensional space with its
  finest locally convex topology, on which every injective linear endomorphism is a topological
  embedding; so the sequence is acyclic, as the theorem predicts for a strict sequence.
- Completeness of `𝕜^(ℕ)` and of the limits of Hyperfunctions §2.0e is recovered.
- The quotient of a strict LF-space that is not complete (§3.5, Checks) is an LF-space that is
  not acyclic.

*Needs:* §§3.2–3.4, 4.4, 6.3; Hyperfunctions §2.0e.

### 6.5 Limit subspaces and quotients

Let `(X, T, ι)` be an inductive sequence of Fréchet spaces with Hausdorff limit `E`, and `L` a
closed subspace of `E`. Put `L n = (ι n)⁻¹ L`, a closed subspace of `X n`, with the restricted
maps `L n → L (n + 1)` and `L n → L`, and `Q n = X n ⧸ L n`, with the induced maps
`Q n → Q (n + 1)` and `Q n → E ⧸ L`. Prove that `(Q n)` is an inductive sequence of Fréchet
spaces with limit `E ⧸ L` for the quotient topology (§3.5), and that `(L n)` satisfies the
compatibility, injectivity and covering conditions for `L`.

Define: `L` is a *limit subspace* when `(L n)` is an inductive sequence with limit `L` for the
subspace topology, that is, when the subspace topology of `L` is the final locally convex topology
of the maps `L n → L`. The latter topology is always finer. Prove:

- `isLimitSubspace_iff_acyclic_quotient` (Palamodov): if `(X n)` is acyclic, then `L` is a limit
  subspace if and only if the quotient sequence `(Q n)` is acyclic;
- `isLimitSubspace_iff_lifts_bounded`: if `(X n)` is strict and every `X n` is a Fréchet–Schwartz
  space, the following are equivalent:
  1. `L` is a limit subspace;
  2. the quotient sequence `(Q n)` is acyclic;
  3. the quotient sequence is regular;
  4. the quotient map lifts bounded sets: for every bounded `B ⊆ E ⧸ L` there is a bounded
     `A ⊆ E` with `B ⊆ L.mkQ '' A`.

  When they hold, `E ⧸ L` is complete and `L`, with the subspace topology, is an LF-space;
- `L` is a limit subspace if and only if `L` with its subspace topology is ultrabornological,
  if and only if it is an LF-space. *Route:* the identity from `L` with the inductive limit
  topology of the `L n` to `L` with the subspace topology is a continuous linear bijection from a
  space covered by a sequence of Fréchet spaces, and §4.4 applies;
- every step `range (ι n)` of a strict inductive sequence of Fréchet spaces is a limit subspace,
  and so is every closed subspace of `E` contained in a step.

*Route for the second statement.* The `Q n` are Fréchet–Schwartz (§6.1), so 2 and 3 are equivalent
by §6.4, and 1 and 2 by the first statement, a strict sequence being acyclic. If 3 holds, a bounded
set of `E ⧸ L` is bounded in some `Q n` and lifts to a bounded set of `X n` by §6.2. If 4 holds,
the lift lies and is bounded in one step by §3.4, so its image is bounded in the corresponding
`Q n`.

A closed subspace of a strict LF-space need not be a limit subspace (Grothendieck 1954).

(Palamodov 1971; Retakh 1970; Vogt 1992; Wengenroth 2003, Ch. 6.)

**Checks.**

- `L = E` and `L = 0` are limit subspaces of every LF-space; the quotient sequences are zero and
  `(X n)` itself.
- For `E = 𝕜^(ℕ)` every subspace is closed and is a limit subspace: every linear map between
  countable-dimensional spaces with the finest locally convex topology is continuous and open
  onto its range.
- For a Fréchet space `E` with the constant sequence, every closed subspace is a limit
  subspace, and the fourth condition holds for Fréchet–Schwartz `E` by §6.2.

*Needs:* §§3.3–3.6, 4.4, 6.1–6.4.

## Downstream consumers

- AutomorphicSpectralTheoryPartII §2.15 consumes §5.1 and §5.2: on complete nuclear Fréchet
  spaces the functionals `ℓ ⊗ m` separate the points of the completed projective tensor product.
- NoncommutativeGeometry N1 and BanachSpaceTheory B4 name Layer 5 as a consumer of their tensor
  products.
- The strict LF-spaces of test functions of AutomorphicSpectralTheory §0.11 and of
  AutomorphicFormsOnReductiveGroups §0.2, and Mathlib's `TestFunction`, are instances of Layer 3;
  those roadmaps keep their own statements.

## Scope and ownership

**Owned here.** Polar topologies of a pairing, the bipolar theorem for a pairing, the
Alaoglu–Bourbaki theorem outside normed spaces, Mackey's theorem on bounded sets, the Mackey
topology and the Mackey–Arens theorem (Layer 0). Barrels, quasi-barrelled, bornological and
ultrabornological spaces, Banach disks, and their permanence (Layer 1). The theory of
equicontinuous sets, completeness and quasi-completeness of the spaces `L_𝔖(E, F)`, Grothendieck's
completeness theorem, semi-reflexive and reflexive locally convex spaces, the theorems on Montel
spaces, and (DF)-spaces (Layer 2). Locally convex direct sums, inductive sequences, strict
inductive limits, LF-spaces and the duals of inductive limits (Layer 3). Banach's theorem for
non-meagre ranges, Grothendieck's factorization theorem, and the closed graph and open mapping
theorems for ultrabornological spaces and spaces covered by a sequence of Fréchet spaces (Layer
4). The injective tensor product of locally convex spaces and Grothendieck's theorem that it
agrees with the projective one when a factor is nuclear (Layer 5). Schwartz spaces, lifting of
compact and bounded sets, the regularity conditions, acyclic inductive sequences and limit
subspaces (Layer 6).

**Owned elsewhere.** Banach-space duality, weak compactness, reflexivity of Banach spaces and the
Banach tensor norms are BanachSpaceTheory's. The open mapping and closed graph theorems for
F-spaces are SpectralManifolds §3.2's, and the Fréchet open mapping theorem over a complete
nontrivially valued field is LocallyAnalyticDistributions §0.2's. The completed projective tensor
product of locally convex spaces is NoncommutativeGeometry N1's. The definition of nuclear maps
and nuclear spaces is AutomorphicSpectralTheory §0.11's, with SpectralManifolds §3.6 for real
scalars and independence of the seminorm family. Inductive limits of Banach spaces with compact
bonding maps, the Fréchet–Schwartz and DFS duality and the DFS open mapping theorem are
Hyperfunctions §2.0e's. Locally convex spaces over nonarchimedean fields are the p-adic roadmaps'.
The one-sided polar of convex sets with its bipolar theorem is ConvexAnalysisAndDuality's; this
roadmap uses Mathlib's absolute polar. Statements about particular
function spaces stay with the roadmaps of those spaces.

**Not in this roadmap.** Characterizations and permanence of nuclear spaces beyond §5.2, the
inductive tensor product, hypocontinuity, the approximation property for locally convex spaces,
bases, and vector-valued integration and holomorphy. The theory of webbed spaces and De Wilde's
closed graph theorem, Pták's theory of B-complete spaces, the Eberlein–Šmulian and Krein theorems
outside normed spaces, weakly acyclic sequences and well-located subspaces, and the derived
projective limit functor.

The boundary in one sentence: a statement about an arbitrary locally convex space over `ℝ` or
`ℂ`, its dual, or a countable inductive limit of such spaces is here; a statement that names a
particular function space, or that concerns nuclearity beyond §5.2, is not.

**Existing Lean elsewhere.** Ryan McCorvie's formalization of A. Masullo's manuscript *The Music of
the Primes*, one consumer of this material among others, contains an Appendix C development
(https://github.com/mccorvie/riemann-masullo, `RiemannMasullo/AppC_LCTVS/` and
`RiemannMasullo/ForMathlib/Analysis/`, Apache-2.0) that proves versions of several statements of
Layers 3, 4 and 6 over `ℂ`. It is written at the generality of that manuscript and is unlikely to
be of library quality. It is a place to look when stuck; it is never the specification, and
nothing in this roadmap is defined by reference to it. Mathlib pull request
https://github.com/leanprover-community/mathlib4/pull/32470 « feat: the space of test functions is
barrelled » is prior art for §1.6 applied to test functions.

## Exact supplier contracts

### From Mathlib

- `PolynormableSpace`, `PolynormableSpace.withSeminorms`, `WithSeminorms`, `SeminormFamily`,
  `Seminorm`, `LocallyConvexSpace`, `LocallyConvexSpace.toPolynormableSpace`,
  `WithSeminorms.toLocallyConvexSpace`, `WithSeminorms.isVonNBounded_iff_seminorm_bddAbove`.
- `AbsConvex`, `absConvexHull`, `closedAbsConvexHull`, `Absorbent`, `Absorbs`, `Balanced`, `gauge`,
  `gaugeSeminorm`.
- `Bornology.IsVonNBounded` with `IsVonNBounded.image`, `TotallyBounded.isVonNBounded`,
  `Filter.Tendsto.isVonNBounded_range`, `NormedSpace.isVonNBounded_iff`; `QuasiCompleteSpace`,
  `isCompact_closure_of_totallyBounded_quasiComplete`;
  `LinearMap.continuousAt_zero_of_locally_bounded`.
- `BarrelledSpace`, `BaireSpace.instBarrelledSpace`, `WithSeminorms.banach_steinhaus`,
  `PolynormableSpace.banach_steinhaus`, `continuousLinearMapOfTendsto`; `MontelSpace`,
  `MontelSpace.finiteDimensional_of_normedSpace`, `ContinuousLinearEquiv.toCompactConvergenceCLM`.
- `LinearMap.polar` with `polar_isClosed`, `subset_bipolar`, `polar_empty`; `StrongDual.polar`;
  `WeakBilin`, `WeakBilin.instTopologicalSpace`, `LinearMap.weakBilin_withSeminorms`,
  `LinearMap.dualEmbedding_surjective`; `WeakDual`, `WeakSpace`, `WeakSpace.map`,
  `WeakDual.isCompact_polar`, `topDualPairing`, `StrongDual`, `StrongDual.exists_extension`,
  `Convex.toWeakSpace_closure`.
- `UniformConvergenceCLM` with `topologicalSpace_eq`, `isVonNBounded_iff`, `completeSpace`,
  `locallyConvexSpace`, `t2Space`, `topologicalSpace_mono`; `CompactConvergenceCLM`,
  `PointwiseConvergenceCLM`, `ContinuousLinearMap.completeSpace`, `ContinuousLinearMap.precomp`;
  `UniformOnFun`; `Equicontinuous`, `UniformEquicontinuous`, `Equicontinuous.closure'`,
  `ArzelaAscoli.isCompact_closure_of_isClosedEmbedding`.
- `DFinsupp`, `DFinsupp.lsingle`, `DFinsupp.lsum`, `DirectSum`, `TensorProduct`,
  `UniformSpace.Completion`, `Submodule.mkQ`, `LinearMap.graph`, `IsMeagre`, `BaireSpace`,
  `IsCompactOperator`, `TestFunction.topologicalSpace`.

### From Tau Ceti

- `TauCeti.finalLocallyConvexTopology` with `FinalLocallyConvexTopology.continuous`, `le_iff`,
  `continuous_seminorm_iff`, `continuous_iff_continuous_comp`, `lift`, `continuousSMul`,
  `eq_of_rightInverse` (`TauCeti/Analysis/LocallyConvex/FinalTopology.lean`).
- `AbsConvex.bipolar_eq_closure`, `StrongDual.bipolar_eq_closedAbsConvexHull`
  (`Bipolar.lean`); `LinearMap.polar_absConvexHull`, `StrongDual.isVonNBounded_polar`
  (`Polar.lean`); `TauCeti.locallyConvexSpace_RCLike_iff` (`Separation.lean`).
- `TauCeti.comap_applyₗ_le_nhds_zero`, `TauCeti.isInducing_applyₗ_of_continuous`,
  `TauCeti.strongEval`, `TauCeti.isEmbedding_strongEval`, `TauCeti.strongBidualEquivOfSurjective`
  (`DoubleDual.lean`).
- `Bornology.IsVonNBounded.equicontinuous`, `LinearMap.continuous_uncurry_of_barrelledSpace`
  (`Barrelled.lean`); `MontelSpace.of_isClosedEmbedding`, `MontelSpace.pi` (`Montel.lean`).
- `TauCeti.NormedSpace.isBounded_iff_forall_dual_isBounded`
  (`TauCeti/Analysis/Normed/Module/WeakSpace/Bounded.lean`).
- `TauCeti.dualProjectiveLimit`, `TauCeti.dualProjectiveLimit.strongDualEquiv`,
  `TauCeti.isVonNBounded_iff_exists_subset_image_closedBall`
  (`DualProjectiveLimit.lean`, `CompactInductiveLimit.lean`).
- `TauCeti.closure_image_mem_nhds_zero_of_tendsto_zero`,
  `TauCeti.isOpenMap_of_closure_image_mem_nhds` (`TauCeti/Topology/Algebra/OpenMapping/`).
- `TauCeti.CompletedProjectiveTensorProduct`, `TauCeti.InjectiveTensor`,
  `TauCeti.CompletedInjectiveTensor`, `TauCeti.NuclearOperator`.

### From TauCetiRoadmap.SpectralManifolds

§3.2, **The open mapping and closed graph theorems for F-spaces**: the definition of F-space, the
open mapping theorem for a continuous linear surjection between F-spaces and the closed graph
theorem, consumed by Layer 4 and §6.2. §3.6, **Nuclear Fréchet spaces and the nuclearity of
`H∞`**: the definition of nuclear space over `ℝ` and its independence of the defining seminorm
family, consumed by §5.2.

### From TauCetiRoadmap.LocallyAnalyticDistributions

§0.2, **Strict sequences and three-space properties**, theorem « Fréchet open mapping »: a
continuous linear surjection between Fréchet spaces is open. Consumed by §§4.1 and 4.4 as the
Fréchet case.

### From TauCetiRoadmap.NoncommutativeGeometry

N1.Tensor, **Completed locally convex projective tensors**: the completed projective tensor
product `E ⊗̂π F` of Hausdorff locally convex spaces over `ℝ` and `ℂ`, its projective seminorms
`π_(p,q)`, the cross property, the universal property and the comparison with the Banach projective
tensor product. Consumed by §§5.1 and 5.2.

### From TauCetiRoadmap.BanachSpaceTheory

B4, §4.3, **Projective and injective tensor products**, and §4.4, **Nuclear operators and integral
bilinear forms**: the Banach injective tensor norm and its completion, and nuclear operators
between Banach spaces with the nuclear norm. Consumed by §§5.1 and 5.2. The convention for
reflexivity of normed spaces is compared in §2.6.

### From TauCetiRoadmap.AutomorphicSpectralTheory

§0.11, **Nuclear Fréchet and LF test spaces**: the definitions of nuclear map and nuclear space.
Consumed by §5.2.

### From TauCetiRoadmap.Hyperfunctions

§2.0e, **FunctionalDuality: closed range, reflexivity and compact inductive limits**: the
inductive limits of Banach spaces with compact bonding maps, their regularity and the
identification of their strong duals. Cited by §§3.3, 3.6, 6.3 and 6.4, which place those limits
among the regular and acyclic sequences and do not reprove the theorems of that section.

## References

- R. Arens, « Duality in linear spaces », *Duke Math. J.* 14 (1947), 787–794.
- K.-D. Bierstedt, « An introduction to locally convex inductive limits », in *Functional Analysis
  and its Applications (Nice, 1986)*, World Scientific, 1988, 35–133.
- N. Bourbaki, *Espaces vectoriels topologiques*, chapitres 1 à 5, Masson, 1981 (EVT); English
  translation *Topological Vector Spaces, Chapters 1–5*, Springer, 1987.
- N. Bourbaki, *Topologie générale*, chapitres 5 à 10, Hermann, 1974.
- N. Bourbaki, « Sur certains espaces vectoriels topologiques », *Ann. Inst. Fourier* 2 (1950),
  5–16.
- J. Dieudonné, L. Schwartz, « La dualité dans les espaces (F) et (LF) », *Ann. Inst. Fourier* 1
  (1949), 61–101.
- K. Floret, « Lokalkonvexe Sequenzen mit kompakten Abbildungen », *J. reine angew. Math.* 247
  (1971), 155–195.
- K. Floret, « Some aspects of the theory of locally convex inductive limits », in *Functional
  Analysis: Surveys and Recent Results II*, North-Holland Math. Studies 38, 1980, 205–237.
- A. Grothendieck, « Sur la complétion du dual d'un espace vectoriel localement convexe »,
  *C. R. Acad. Sci. Paris* 230 (1950), 605–606.
- A. Grothendieck, « Sur les espaces (F) et (DF) », *Summa Brasil. Math.* 3 (1954), 57–123.
- A. Grothendieck, *Produits tensoriels topologiques et espaces nucléaires*, Mem. Amer. Math.
  Soc. 16 (1955).
- H. Jarchow, *Locally Convex Spaces*, Teubner, 1981.
- G. Köthe, *Topological Vector Spaces I*, Grundlehren 159, Springer, 1969 (Köthe I).
- G. Köthe, *Topological Vector Spaces II*, Grundlehren 237, Springer, 1979 (Köthe II).
- G. W. Mackey, « On convex topological linear spaces », *Trans. Amer. Math. Soc.* 60 (1946),
  519–537.
- R. Meise, D. Vogt, *Introduction to Functional Analysis*, Oxford Graduate Texts in Math. 2,
  Clarendon Press, 1997.
- V. P. Palamodov, « Homological methods in the theory of locally convex spaces », *Uspekhi Mat.
  Nauk* 26:1 (1971), 3–65; English translation *Russian Math. Surveys* 26:1 (1971), 1–64.
- P. Pérez Carreras, J. Bonet, *Barrelled Locally Convex Spaces*, North-Holland Math. Studies 131,
  1987.
- V. S. Retakh, « Subspaces of a countable inductive limit », *Dokl. Akad. Nauk SSSR* 194 (1970);
  English translation *Soviet Math. Dokl.* 11 (1970), 1384–1386.
- W. Rudin, *Functional Analysis*, 2nd ed., McGraw-Hill, 1991.
- H. H. Schaefer, M. P. Wolff, *Topological Vector Spaces*, 2nd ed., Graduate Texts in Math. 3,
  Springer, 1999.
- F. Trèves, *Topological Vector Spaces, Distributions and Kernels*, Academic Press, 1967.
- D. Vogt, « Regularity properties of (LF)-spaces », in *Progress in Functional Analysis*,
  North-Holland Math. Studies 170, 1992, 57–84.
- J. Wengenroth, « Acyclic inductive spectra of Fréchet spaces », *Studia Math.* 120 (1996),
  247–258.
- J. Wengenroth, *Derived Functors in Functional Analysis*, Lecture Notes in Math. 1810,
  Springer, 2003.
