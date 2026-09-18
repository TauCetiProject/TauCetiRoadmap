# Roadmap: profinite integers, profinite powers, and continuous automorphisms

This roadmap builds the generic profinite calculus that several arithmetic roadmaps consume and
none of them owns. **ProfiniteProPGroups** names it, in its opening section, as the exact owner
of three constructions: the profinite integers `ẑ` as a topological commutative **ring**, the
profinite power `x ^ᶻ a` of an element of a profinite group by an exponent `a ∈ ẑ` together with
its comparison against the `ℤ_ℓ`-power on a pro-`ℓ` group, and the continuous automorphism and
outer-automorphism groups of a profinite group with their topology. **BelyiMaps** consumes the
same three constructions for its arithmetic layers, under the same name. A fourth construction
belongs with them and is built here for the same reason, that it is group theory about every
profinite group and no arithmetic roadmap should own it: the **closed lower central series** of a
profinite group, with its graded Lie ring, `ℤ_p`-linear when the group is pro-`p`.

Nothing here is about a particular group. The first consumers are:

- **PeripheralActions**, which uses the `ℤ_p`-power, the automorphism group and the graded
  Lie ring of the closed lower central series to construct the peripheral automorphisms of a
  free pro-`p` group of finite rank;
- the successor of **BelyiMaps** that owns its Layers 12 and 13, which uses the ring `ẑ`, the
  power `x ^ᶻ a`, its pro-`ℓ` comparison, and `ContinuousOut` for the arithmetic outer action on
  the fundamental group of the thrice-punctured line;
- **LocalFieldsRamification**, whose Tate twist of the tame inertia group is a `ẑ`-module
  statement.

## Scope and ownership

The roadmap owns:

- `ProfiniteInt`, written `ẑ` in prose: the topological commutative ring of compatible systems
  in `∏ n, ZMod n`, its finite-level projections and their universal property, its `ℓ`-adic
  components `ẑ →+* ℤ_ℓ`, the decomposition `ẑ ≃ ∏_ℓ ℤ_ℓ` as topological rings, the idempotents
  `ω_ℓ` of that decomposition, the unit group `ẑˣ` with its unit criterion, and the assembly of a
  compatible system of characters `G →* (ZMod n)ˣ` into one character `G →* ẑˣ`;
- the comparison of the additive group of `ẑ` with the profinite completion of `ℤ` supplied by
  ProfiniteProPGroups as `zHat`, stated as a named theorem;
- the profinite power `x ^ᶻ a` for `x` in a profinite group and `a ∈ ẑ`, defined through the
  universal property of `ẑ`, with its complete calculus: agreement with integer powers, the
  additive and multiplicative laws, naturality under continuous homomorphisms and hence under
  conjugation, continuity, the closed procyclic subgroup `⟨x⟩‾` and the `ℓ`-parts `x ^ᶻ ω_ℓ`;
- the `ℤ_ℓ`-power `x ^[ℓ] u` on a pro-`ℓ` group, its calculus, the comparison
  `x ^ᶻ a = x ^[ℓ] (component_ℓ a)`, and the behaviour of unit exponents: `x ↦ x ^[ℓ] u` is a
  bijection of `⟨x⟩‾` with inverse `x ↦ x ^[ℓ] u⁻¹`, and `x ^[ℓ] u = y ^[ℓ] u` forces `x = y`;
- `ContinuousAut G`, the group of continuous automorphisms `G ≃ₜ* G`, the inner homomorphism
  `G →* ContinuousAut G`, the outer group `ContinuousOut G`, the congruence topology on
  `ContinuousAut G`, its profiniteness when `G` is topologically finitely generated, the actions
  on `G`, on conjugacy classes and on closed subgroups up to conjugacy, functoriality along a
  topologically characteristic closed normal subgroup, the outer action of an extension, and, for
  pro-`p` groups, the open pro-`p` subgroup of automorphisms acting trivially on the Frattini
  quotient;
- the closed lower central series `γ_n(G)` of a topological group, its graded pieces
  `gr_n(G) = γ_n(G) / γ_{n+1}(G)`, the bracket `gr_j × gr_k → gr_{j+k+1}` with its Lie identities,
  the spanning theorem for the graded pieces of a topologically generated group, the
  `ℤ_p`-module structure and `ℤ_p`-bilinearity for pro-`p` groups, the triviality of the
  intersection `⋂ γ_n(G)` for pro-`p` groups, and the comparison with the lower `p`-series of
  ProfiniteProPGroups.

It does not own, and consumes by name:

- `IsProP`, `proPKernel`, `maximalProPQuotient`, `proPFrattini`, the Burnside basis theorem, the
  Hopf property, `IsTopologicallyFinitelyGenerated`, `freeProfiniteGroup`, `freeProP`, `zHat` as a
  profinite group, `pLowerCentralSeries`, `gradedPiece` and `gradedBracket`, and the
  `ℤ_p`-exponentiation on an abelian pro-`p` group, all from **ProfiniteProPGroups**;
- continuous cohomology, from **ProfiniteCohomology**; nothing here is cohomological;
- every arithmetic object: Galois groups, cyclotomic characters beyond the generic assembly of
  a compatible system into `ẑˣ`, inertia groups, fundamental groups, and the branch-cycle and
  peripheral-power theorems.

There is no second `zHat`, no second `IsProP`, and no second free pro-`p` group. Where a
statement of this roadmap is about the supplier's object, it names the supplier's declaration.

## Conventions

- **The profinite type-class stack** is unbundled, as in ProfiniteProPGroups:
  `[Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]`. Hausdorffness is a theorem in this stack, not a hypothesis:
  the identity component of a topological group is closed, so a totally disconnected group is
  `T1`, hence `T2`. `ProfiniteGrp` is used only where a categorical limit or completion genuinely
  needs it.
- **Pro-`p`** is ProfiniteProPGroups' `IsProP p G`, carried as an explicit hypothesis
  `(hG : IsProP p G)`, never as a class. Every `ℤ_ℓ`-power statement carries `[Fact ℓ.Prime]`.
- **`ẑ`** is `ProfiniteInt`, the subring of `∏ n : ℕ+, ZMod n` cut out by the compatibility of the
  reduction maps. The index runs over `ℕ+`: `ZMod 0 = ℤ` would collapse the limit. Its additive
  group is written additively; the multiplicative group used for powers is
  `Multiplicative ProfiniteInt`. The supplier's `zHat` is a different type, related to this one
  by the named comparison of Layer 0.4.
- **Profinite powers** are written `x ^ᶻ a` in prose and in Lean (scoped notation for
  `zpowHat x a`). The `ℤ_ℓ`-power is written `x ^[ℓ] u` in prose only; its Lean name is
  `padicPow ℓ hG x u`, because Mathlib reserves `f^[n]` for iterates.
- **Automorphisms compose as functions.** `ContinuousAut G` multiplies by composition,
  `(φ * ψ) x = φ (ψ x)`, matching Mathlib's `MulAut`. The inner automorphism attached to `g` is
  `x ↦ g * x * g⁻¹`, matching `MulAut.conj`. A conjugate written `c⁻¹ * x * c` in a consumer is
  `MulAut.conj c⁻¹ x`; no second conjugation convention is introduced.
- **Conjugacy** is Mathlib's `IsConj`, and conjugacy classes are Mathlib's `ConjClasses`.
- **The closed lower central series is 0-based**, like Mathlib's `Subgroup.lowerCentralSeries`
  and the supplier's `pLowerCentralSeries`: `γ_0(G) = G` and
  `γ_{n+1}(G) = closure ⁅γ_n(G), G⁆`. So `gr_0(G)` is the topological abelianization and the
  bracket raises the degree by one: `[gr_j, gr_k] ⊆ gr_{j+k+1}`.
- **Graded pieces are written additively**, as `Additive` of the group quotient, so that
  bilinearity is stated with `+`. This copies ProfiniteProPGroups Layer 8.
- **Commutators** are Mathlib's `⁅x, y⁆ = x * y * x⁻¹ * y⁻¹`; the relator convention of
  ProfiniteProPGroups, `(x, y) = x⁻¹ y⁻¹ x y`, appears only when a Demushkin relator is
  quoted, and never in a statement of this roadmap.

## Exact supplier contracts

All names in this section are part of the dependency contract.

### From `TauCetiRoadmap.ProfiniteProPGroups`

| Use here | Exact declarations |
|---|---|
| pro-`p` groups and the maximal pro-`p` quotient | `IsProP`, `proPKernel`, `maximalProPQuotient`, `isProP_maximalProPQuotient`, the universal property of `maximalProPQuotient` |
| generation and the Frattini quotient | `IsTopologicallyFinitelyGenerated`, `topologicalGeneratorRankNat`, `proPFrattini`, `topologicallyGenerates_iff_frattiniQuotient`, the Burnside surjectivity criterion, the Hopf property |
| the profinite completion of `ℤ` | `zHat`, `maximalProPQuotient_zHat_equiv_padicInt` |
| free objects | `freeProfiniteGroup`, `freeProfiniteGroup.of`, `freeProP`, `freeProP.of`, `freeProP.lift`, `freeProP.lift_of`, `freeProP.lift_unique` |
| abelian pro-`p` groups | the `ℤ_p`-exponentiation and `ℤ_p`-module structure of an abelian pro-`p` group (Layer 4), and the structure theorem |
| the lower `p`-series | `pLowerCentralSeries`, `gradedPiece`, `gradedMk`, `gradedBracket`, `gradedBracket_mk` |

### From Mathlib

`ZMod`, `ZMod.castHom`, `PadicInt`, `PadicInt.toZModPow`, `PadicInt.toZMod`, `Units`,
`ProfiniteGrp`, `ProfiniteGrp.profiniteCompletion` with `ProfiniteGrp.ProfiniteCompletion.lift`,
`ContinuousMonoidHom`, `ContinuousMulEquiv` with `refl`, `symm`, `trans` and `ext`, `MulAut`,
`MulAut.conj`, `MulDistribMulAction`, `IsConj`, `ConjClasses`, `Subgroup.topologicalClosure`,
`Subgroup.zpowers`, `Subgroup.lowerCentralSeries`, `commutatorElement`, `Subgroup.commutator`,
`Subgroup.Characteristic`, `frattini`, `frattini_nongenerating`, `IsPGroup`, `IsPGroup.isNilpotent`,
`Group.IsNilpotent`, `OpenNormalSubgroup`, `IsCompact.image`, `IsCompact.isClosed`,
`IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed`, `DirectSum`, `LieRing`,
`LieAlgebra`.

Mathlib has no ring of profinite integers, no profinite power, no group structure on
`ContinuousMulEquiv G G`, no `ℤ_p`-power on a nonabelian group, and no graded Lie ring of a lower
central series; each is built here. The `FLT` project's `ZHat` has the shape adopted for
`ProfiniteInt` in Layer 0.1, so that the eventual comparison is a rename.

## How to read the build

`README.md` is normative; `Suggested.lean` pins names and signatures for the central objects and is
not exhaustive. In prerequisite annotations, `M` means Mathlib, `L0` through `L3` mean an earlier
layer here, and `PPG-<layer>` means an export of ProfiniteProPGroups. No milestone depends on an
unmerged roadmap.

## Layer 0: the profinite integers as a topological ring

### 0.1 The carrier

- **`ProfiniteInt`.** The subring `profiniteIntSubring` of `∏ n : ℕ+, ZMod n` of families `f` with
  `ZMod.castHom h (ZMod n) (f m) = f n` whenever `n ∣ m`, and `ProfiniteInt` its carrier. It is a
  commutative ring by restriction, a topological ring for the subspace topology of the product of
  the discrete rings `ZMod n`, compact because it is closed in a product of finite discrete
  spaces (it is an intersection of equalizers of continuous maps), totally disconnected and
  Hausdorff because the product is. As an additive group it is profinite, and `ℤ → ẑ` is injective
  with dense image.
  *Needs:* M `ZMod`, `ZMod.castHom`, `Subring`, `Pi.topologicalSpace`, `IsTopologicalRing`.

  API checklist for `ProfiniteInt`:
  - Constructors: the subring; `ProfiniteInt.lift`, the map into `ẑ` assembled from a compatible
    family of ring homomorphisms `R →+* ZMod n` (0.2).
  - Examples: the image of `ℤ`; `ω_ℓ` (0.3); the element `(1, 0, 1, 0, …)` in `∏ ℤ_ℓ` that is not
    an integer.
  - Morphisms: `ProfiniteInt.toZMod n : ẑ →+* ZMod n`, continuous, and `component ℓ` (0.3).
  - Functoriality: `toZMod` is compatible with `ZMod.castHom` along divisibility.
  - Comparison lemmas: 0.4 against `zHat`; 0.3 against `∏_ℓ ℤ_ℓ`.
  - Naturality: the universal property of 0.2 is natural in `R`.
  - Edge cases: `ẑ` is not a domain, because `ω_2 · (1 - ω_2) = 0`; `n = 1`, where `ZMod 1` is
    trivial and `toZMod 1` carries no information.
  - Downstream interfaces: Layer 1 powers; the cyclotomic character of the BelyiMaps successor.

### 0.2 Projections and the limit property

- **Projections.** `ProfiniteInt.toZMod n : ẑ →+* ZMod n` for every `n : ℕ+`, continuous, with the
  compatibility `ZMod.castHom h (ZMod n) ∘ toZMod m = toZMod n` for `n ∣ m`, and extensionality:
  two elements with the same projections are equal.
- **The limit property.** For a ring `R` and a family `f n : R →+* ZMod n` compatible with
  `ZMod.castHom`, there is a unique ring homomorphism `ProfiniteInt.lift f : R →+* ẑ` with
  `toZMod n ∘ lift f = f n`. When `R` is a topological ring and every `f n` is continuous, the
  lift is continuous. The same statement for additive groups and for monoids of units is derived
  from it, not restated.
- **Density.** `ℤ → ẑ` is injective, and every element of `ẑ` is a limit of integers: for every
  finite set of levels a single integer realizes the given projections.
  *Needs:* M `ZMod.castHom`, `Nat.chineseRemainder`; L0.1.

### 0.3 `ℓ`-adic components, the product decomposition, and idempotents

- **Components.** For a prime `ℓ`, `ProfiniteInt.component ℓ : ẑ →+* ℤ_[ℓ]`, continuous, is the
  ring homomorphism with `PadicInt.toZModPow k ∘ component ℓ = toZMod (ℓ ^ k)` for every `k`. It
  exists and is unique by the universal property of `ℤ_[ℓ]` as the inverse limit of the
  `ZMod (ℓ ^ k)`, in Mathlib's form `PadicInt.ext_of_toZModPow`.
- **The product decomposition.** The map `ẑ → ∏ ℓ : Nat.Primes, ℤ_[ℓ]` with components
  `component ℓ` is an isomorphism of topological rings. Injectivity and surjectivity come from
  the Chinese remainder theorem at each finite level; continuity of the inverse is the
  compactness of `ẑ`.
- **Idempotents.** `ProfiniteInt.idem ℓ`, written `ω_ℓ`, is the element with
  `component ℓ' ω_ℓ = if ℓ' = ℓ then 1 else 0`. Then `ω_ℓ * ω_ℓ = ω_ℓ`, `ω_ℓ * ω_{ℓ'} = 0` for
  `ℓ ≠ ℓ'`, `component ℓ (ω_ℓ * a) = component ℓ a`, and `a = ω_ℓ * a` exactly when every other
  component of `a` vanishes.
- **Reduction of an idempotent.** `toZMod (ℓ ^ k) ω_ℓ = 1` and `toZMod n ω_ℓ = 0` when `ℓ ∤ n`.
  *Needs:* M `PadicInt.toZModPow`, `PadicInt.ext_of_toZModPow`, `ZMod.chineseRemainder`; L0.2.

  ⚠ *Nearby false statement:* `ω_ℓ` is not an integer, and `a ↦ ω_ℓ * a` is not the reduction
  `toZMod (ℓ ^ k)` for any `k`; it is the projection onto the `ℓ`-adic factor.

### 0.4 Units and characters

- **The unit group.** `ẑˣ` with Mathlib's topology on units. Unit criterion:
  `IsUnit a ↔ ∀ n, IsUnit (toZMod n a) ↔ ∀ ℓ, IsUnit (component ℓ a)`, and the topological
  isomorphism `ẑˣ ≃ₜ* ∏ ℓ, ℤ_[ℓ]ˣ`.
- **Assembly of characters.** For a group `G` and a family `χ n : G →* (ZMod n)ˣ` compatible
  with `Units.map (ZMod.castHom h (ZMod n))`, there is a unique `χ : G →* ẑˣ` with
  `Units.map (toZMod n) ∘ χ = χ n`. If `G` is a topological group and each `χ n` is continuous,
  so is `χ`. This is the form in which the BelyiMaps successor assembles the cyclotomic character
  out of Mathlib's `modularCyclotomicCharacter` at each level.
- **The group comparison.** `ProfiniteInt.toZHat : Multiplicative ẑ ≃ₜ* zHat`, a named
  isomorphism of topological groups sending `ofAdd 1` to the image of the generator of `ℤ` under
  the completion map; it is characterized by that value. Through it, ProfiniteProPGroups'
  `maximalProPQuotient_zHat_equiv_padicInt` becomes the statement that `component ℓ` induces
  `maximalProPQuotient ℓ (Multiplicative ẑ) ≃ₜ* Multiplicative ℤ_[ℓ]`.
  *Needs:* M `Units`, `Units.map`, `ProfiniteGrp.profiniteCompletion`,
  `ProfiniteGrp.ProfiniteCompletion.lift`; PPG-4 `zHat`,
  `maximalProPQuotient_zHat_equiv_padicInt`; L0.3.

## Layer 1: profinite powers and `ℤ_ℓ`-powers

### 1.1 The power `x ^ᶻ a`

- **Definition.** For `x` in a profinite group `G`, `zpowHatHom x : Multiplicative ẑ →* G` is the
  unique continuous homomorphism with `ofAdd 1 ↦ x`; it exists because the map `n ↦ x ^ n` on
  `ℤ` extends along the dense inclusion `ℤ → ẑ` into the compact group `G`, level by level
  through the finite quotients of `G`. Then `x ^ᶻ a := zpowHatHom x (ofAdd a)`. Uniqueness is a
  theorem: any continuous homomorphism `Multiplicative ẑ →* G` sending `ofAdd 1` to `x` is
  `zpowHatHom x`.
  *Needs:* L0.2 density; M `ProfiniteGrp.ProfiniteCompletion.lift` through L0.4, or the
  finite-level construction directly.

  API checklist for `^ᶻ`:
  - Constructors: `zpowHatHom`; `zpowHat`.
  - Examples: `x ^ᶻ (n : ℤ) = x ^ n`; `x ^ᶻ 0 = 1`; `x ^ᶻ 1 = x`; `1 ^ᶻ a = 1`; in
    `Multiplicative ẑ` itself, `ofAdd b ^ᶻ a = ofAdd (a * b)`; for `x` of finite order `m`,
    `x ^ᶻ a = x ^ (toZMod m a).val`.
  - Morphisms: naturality `f (x ^ᶻ a) = f x ^ᶻ a` for every continuous homomorphism `f`, hence
    the conjugation instances `(g * x * g⁻¹) ^ᶻ a = g * (x ^ᶻ a) * g⁻¹` and
    `(c⁻¹ * x * c) ^ᶻ a = c⁻¹ * (x ^ᶻ a) * c`, and `(x ^ᶻ a)⁻¹ = x⁻¹ ^ᶻ a`.
  - Functoriality: `x ^ᶻ (a + b) = x ^ᶻ a * x ^ᶻ b`, `x ^ᶻ (-a) = (x ^ᶻ a)⁻¹`,
    `(x ^ᶻ a) ^ᶻ b = x ^ᶻ (a * b)` with the ring product of Layer 0, `x ^ᶻ a` commutes with
    `x ^ᶻ b`, and `(x * y) ^ᶻ a = x ^ᶻ a * y ^ᶻ a` when `x` and `y` commute.
  - Comparison lemmas: the range of `a ↦ x ^ᶻ a` is the closed procyclic subgroup
    `closedZpowers x := (Subgroup.zpowers x).topologicalClosure` (1.2); the `ℓ`-adic comparison
    (1.3).
  - Naturality: `a ↦ x ^ᶻ a` is continuous, and `(x, a) ↦ x ^ᶻ a` is jointly continuous.
  - Edge cases: `x = 1`; `x` of finite order; `G` finite, where `^ᶻ` factors through
    `toZMod (Nat.card G)`.
  - Downstream interfaces: 1.2, 1.3, Layer 2's actions, the BelyiMaps successor's branch-cycle
    theorem.

  ⚠ *Nearby false statement:* `x ^ᶻ a` is not "`x` to an integer representative of `a`"; no
  representative exists, and the operation is defined by the universal property. Nor is
  `(x * y) ^ᶻ a = x ^ᶻ a * y ^ᶻ a` without commutativity.
  *Source:* Ribes–Zalesskii, *Profinite Groups*, §4.1.

### 1.2 Closed procyclic subgroups and `ℓ`-parts

- **The procyclic closure.** `closedZpowers x` is a closed abelian subgroup, the image of the
  compact group `Multiplicative ẑ` under `zpowHatHom x`, so `Set.range (x ^ᶻ ·) = closedZpowers x`
  and `closedZpowers x` is a quotient of `ẑ`. It is procyclic: topologically generated by one
  element.
- **`ℓ`-parts.** `x ^ᶻ ω_ℓ` lies in `closedZpowers x`, the closed subgroup it generates is pro-`ℓ`
  (`IsProP ℓ (closedZpowers (x ^ᶻ ω_ℓ))`), and `x ^ᶻ ω_ℓ = x` whenever `closedZpowers x` is
  pro-`ℓ`. In a pro-`ℓ` group `x ^ᶻ a = x ^ᶻ (ω_ℓ * a)` for every `a`. The elements `x ^ᶻ ω_ℓ`
  for distinct primes commute, and their product over the primes dividing the supernatural order
  of `x` recovers `x`, in the sense that `x ^ᶻ (Σ_{ℓ ∈ S} ω_ℓ) → x` as the finite set `S` of
  primes grows.
  *Needs:* L0.3; L1.1; PPG-3 `IsProP`.

  ⚠ `x ^ᶻ ω_ℓ` is the `ℓ`-component of `x` in `closedZpowers x`; it is not the image of `x`
  in a maximal pro-`ℓ` quotient of `G`, which is an element of a different group.

### 1.3 The `ℤ_ℓ`-power on a pro-`ℓ` group

- **Definition.** For `[Fact ℓ.Prime]`, `G` pro-`ℓ` (`hG : IsProP ℓ G`) and `u : ℤ_[ℓ]`,
  `padicPow ℓ hG x u`, written `x ^[ℓ] u`, is the image of `u` under the unique continuous
  homomorphism `Multiplicative ℤ_[ℓ] →* G` with `ofAdd 1 ↦ x`. It exists because `zpowHatHom x`
  factors through the maximal pro-`ℓ` quotient of `Multiplicative ẑ`, which Layer 0.4 identifies
  with `Multiplicative ℤ_[ℓ]` through `component ℓ`.
- **The comparison.** `x ^ᶻ a = x ^[ℓ] (component ℓ a)`, and `x ^[ℓ] u = x ^ᶻ a` for any `a` with
  `component ℓ a = u`; `component ℓ` here is the ring homomorphism of 0.3 and not a second
  projection.
- **The calculus.** The laws of 1.1, with `ℤ_[ℓ]` in place of `ẑ`: integer powers, the additive
  and multiplicative laws, naturality and conjugation, continuity in `u` and jointly. On an
  abelian pro-`ℓ` group `x ^[ℓ] u` is the `ℤ_ℓ`-exponentiation of ProfiniteProPGroups Layer 4, a
  named comparison and not a definitional identification.
- **Unit exponents.** For `u : ℤ_[ℓ]ˣ`: `(x ^[ℓ] u) ^[ℓ] u⁻¹ = x`; `closedZpowers (x ^[ℓ] u) =
  closedZpowers x`; `x ↦ x ^[ℓ] u` is a homeomorphism of `G` with inverse `x ↦ x ^[ℓ] u⁻¹`; and
  `x ^[ℓ] u = y ^[ℓ] u → x = y`.
- **The class in a quotient.** For a closed normal subgroup `N`, the image of `x ^[ℓ] u` in
  `G ⧸ N` is `(x N) ^[ℓ] u`, and when `G ⧸ N` is abelian this is `u • (x N)` for the
  `ℤ_ℓ`-module structure of ProfiniteProPGroups Layer 4.
  *Needs:* L0.3, L0.4, L1.1; PPG-3 the universal property of `maximalProPQuotient`; PPG-4 the
  abelian `ℤ_p`-exponentiation.

  ⚠ Every consumer of `x ^[ℓ] u` carries `[Fact ℓ.Prime]` and the pro-`ℓ` hypothesis. On a
  profinite group that is not pro-`ℓ` the `ℓ`-adic component of `a` does not determine `x ^ᶻ a`,
  and no milestone applies `^[ℓ]` outside a pro-`ℓ` group.

  ⚠ *Nearby false statement:* injectivity of `x ↦ x ^[ℓ] u` needs `u` to be a unit. For `u = ℓ`
  the map `x ↦ x ^ ℓ` identifies all the elements of order `ℓ` with `1`.

## Layer 2: continuous automorphisms and outer automorphisms

### 2.1 The groups

- **`ContinuousAut G := G ≃ₜ* G`** with the group structure by composition:
  `1 = ContinuousMulEquiv.refl G`, `φ * ψ = ψ.trans φ`, `φ⁻¹ = φ.symm`, so that
  `(φ * ψ) x = φ (ψ x)`. The forgetful map `ContinuousAut G →* MulAut G` is an injective
  homomorphism. This is stated for any topological group.
- **Inner automorphisms.** `ContinuousAut.conj : G →* ContinuousAut G`, `conj g x = g * x * g⁻¹`,
  lifting `MulAut.conj` along the forgetful map; its kernel is the centre and its range is a
  normal subgroup.
- **`ContinuousOut G := ContinuousAut G ⧸ (ContinuousAut.conj G).range`**, with `ContinuousOut.mk`.
- **Examples.** `G` abelian, where `ContinuousOut G = ContinuousAut G`; `G` with trivial centre,
  where `conj` is injective; `G = Multiplicative ẑ`, where `ContinuousAut G ≃* ẑˣ` by 1.1.
- **Inner is inner.** If `φ : ContinuousAut G` is inner as an abstract automorphism, that is
  `φ.toMulAut = MulAut.conj g` for some `g`, then `φ = ContinuousAut.conj g`. This is immediate,
  and it is stated because a consumer that only knows `MulAut` needs it.
  *Needs:* M `ContinuousMulEquiv`, `MulAut`, `MulAut.conj`, `QuotientGroup`.

  ⚠ *Nearby false statement:* an abstract automorphism of a profinite group need not be
  continuous, and `MulAut G` is not `ContinuousAut G`. Every statement of this roadmap is about
  continuous automorphisms, and nothing here uses the theorem of Nikolov and Segal.

### 2.2 The congruence topology

- **Topologically characteristic subgroups.** `IsTopCharacteristic N : Prop` says every
  continuous automorphism maps `N` onto itself, `N.map φ = N`. This is weaker than Mathlib's
  `Subgroup.Characteristic`, which quantifies over `MulAut G`, and it is the notion every closed
  subgroup "defined from the topology" satisfies: `proPKernel`, `proPFrattini`, the terms of the
  lower `p`-series (ProfiniteProPGroups Layer 3 and 8 state these), and the terms of the closed
  lower central series (Layer 3 here).
- **The topology.** `ContinuousAut G` carries the initial topology of the maps
  `ContinuousAut G →* MulAut (G ⧸ N)` induced by the topologically characteristic open normal
  subgroups `N`, each `MulAut (G ⧸ N)` being finite and discrete. It is a topological group, and
  `ContinuousAut.conj` is continuous.
- **Profiniteness under finite generation.** If `G` is topologically finitely generated, the
  topologically characteristic open normal subgroups are cofinal among all open normal subgroups,
  because `G` has finitely many open subgroups of each index and their intersection is
  characteristic. Then `ContinuousAut G` is compact, Hausdorff and totally disconnected: the
  compatible families of automorphisms of the quotients `G ⧸ N` are exactly the continuous
  automorphisms of `G = lim G ⧸ N`. In this case the evaluation `ContinuousAut G × G → G` is
  continuous, `ContinuousOut G` is profinite for the quotient topology, and the range of `conj`
  is closed.
- **Closedness of the automorphism conditions.** For `x y : G`, the set of `φ` with `φ x = y`
  is closed, and so is the set of `φ` with `IsConj (φ x) y`. The second uses that the conjugacy
  class of `y` is compact, as the image of `G` under `g ↦ g * y * g⁻¹`, and that the set of
  conjugate pairs `{(a, b) | IsConj a b}` is closed in `G × G` for the same reason.
  *Needs:* PPG-3 finitely many open subgroups of each index, `IsTopologicallyFinitelyGenerated`;
  M `MulAut`, `OpenNormalSubgroup`, `IsCompact.image`, `IsCompact.isClosed`.
  *Source:* Ribes–Zalesskii §4.4.

  ⚠ Without topological finite generation the congruence topology need not be compact, and no
  milestone asserts it is. Every profiniteness statement carries `IsTopologicallyFinitelyGenerated`.

### 2.3 Actions and functoriality

- **The action on `G`.** `ContinuousAut G` acts on `G` by evaluation, a `MulDistribMulAction`,
  compatible with `^ᶻ` and `^[ℓ]` by naturality (1.1, 1.3).
- **The action on conjugacy classes.** The action descends to `ConjClasses G` and there factors
  through `ContinuousOut G`, because inner automorphisms fix every class. The action on closed
  subgroups, `H ↦ H.map φ`, and its descent to closed subgroups up to conjugacy are stated in the
  same way.
- **Functoriality along a characteristic quotient.** For a topologically characteristic closed
  normal subgroup `N`, restriction and descent give `ContinuousAut G →* ContinuousAut (G ⧸ N)` and
  `ContinuousOut G →* ContinuousOut (G ⧸ N)`, both continuous for the congruence topologies. The
  first map is compatible with the actions on conjugacy classes.
- **The outer action of an extension.** For a topological group `E` and a closed normal subgroup
  `N`, conjugation gives `E →* ContinuousAut N` and, since conjugation by an element of `N` is
  inner, `E ⧸ N →* ContinuousOut N`. When `N` is a topologically finitely generated profinite
  group, `E →* ContinuousAut N` is continuous for the congruence topology: on each finite
  characteristic quotient of `N` it is locally constant.
  *Needs:* L2.1, L2.2; M `MulDistribMulAction`, `ConjClasses`, `QuotientGroup.lift`.

### 2.4 Automorphisms of pro-`p` groups

- **The finite theorem.** For a finite `p`-group `P`, the kernel of
  `MulAut P →* MulAut (P ⧸ frattini P)` is a `p`-group. Proof: it acts freely on the set of
  generating tuples lying over a fixed basis of `P ⧸ frattini P`, a set of cardinality
  `|frattini P| ^ d` by Burnside's basis theorem (`frattini_nongenerating`), so its order divides
  a power of `p`.
  *Needs:* M `frattini`, `frattini_nongenerating`, `IsPGroup`, `MulAction` orbit counting.
  *Source:* Gorenstein, *Finite Groups*, Chapter 5 §1; Huppert, *Endliche Gruppen I*, III §3.
- **The pro-`p` theorem.** For a topologically finitely generated pro-`p` group `G`, the kernel of
  `ContinuousAut G →* MulAut (G ⧸ proPFrattini p G)` is an open pro-`p` subgroup of
  `ContinuousAut G`, so `ContinuousAut G` is virtually pro-`p`. It is the inverse limit of the
  finite kernels of 2.4 over the characteristic open normal subgroups of `G` contained in
  `proPFrattini p G`.
  *Needs:* L2.2; PPG-3 `proPFrattini`; the finite theorem.
  *Source:* Ribes–Zalesskii §4.4 and §4.5; Dixon–du Sautoy–Mann–Segal, *Analytic pro-p groups*,
  Chapter 5.
- **The free case.** For `F = freeProP p (Fin n)`, `ContinuousAut F →* MulAut (F ⧸ proPFrattini p F)`
  is surjective: an automorphism of the Frattini quotient `(ℤ/p)^n` lifts by sending each
  generator to a lift of its image, which is a continuous endomorphism by the universal property,
  surjective by the Burnside criterion and bijective by the Hopf property.
  *Needs:* PPG-4 `freeProP.lift`; PPG-3 the Burnside surjectivity criterion and the Hopf property.
  *Source:* Ribes–Zalesskii §4.5.

## Layer 3: the closed lower central series and its graded Lie ring

### 3.1 The series

- **Definition.** For a topological group `G`, `closedLowerCentralSeries G : ℕ → Subgroup G`,
  written `γ_n(G)`: `γ_0(G) = ⊤` and `γ_{n+1}(G) = ⁅γ_n(G), ⊤⁆.topologicalClosure`. Each term is
  closed, normal, topologically characteristic, and the series is antitone. The commutator
  inclusion `⁅γ_j(G), γ_k(G)⁆ ≤ γ_{j+k+1}(G)` holds, by the three-subgroup lemma and the
  continuity of the commutator map, and it is what makes the bracket of 3.2 well defined.
- **Comparison with the abstract series.** `γ_n(G) = (Subgroup.lowerCentralSeries ⊤ n).topologicalClosure`:
  taking closures commutes with the commutator step because the commutator map is continuous.
- **Functoriality.** A continuous homomorphism `f : G →* H` satisfies `(γ_n(G)).map f ≤ γ_n(H)`,
  with equality of closures when `f` is surjective.
- **Comparison with the lower `p`-series.** `γ_n(G) ≤ pLowerCentralSeries p G n` for every `n`,
  by induction from `⁅λ_n, G⁆ ≤ λ_{n+1}`; the induced map on graded pieces is compatible with the
  two brackets (3.2).
- **Triviality of the intersection.** If `G` is pro-`p` then `⨅ n, γ_n(G) = ⊥`: every open normal
  subgroup `U` has a finite `p`-group quotient, which is nilpotent (`IsPGroup.isNilpotent`), so
  `γ_c(G) ≤ U` for `c` its nilpotency class, and the open normal subgroups of a profinite group
  intersect in `⊥`. The same argument gives the statement for every pronilpotent group.
  *Needs:* M `Subgroup.lowerCentralSeries`, `Subgroup.commutator`, `Subgroup.topologicalClosure`,
  `Subgroup.is_normal_topologicalClosure`, `IsPGroup.isNilpotent`; PPG-3 `IsProP`; PPG-8
  `pLowerCentralSeries`.

  ⚠ *Nearby false statement:* `γ_n(G)` is not open in general, and `G ⧸ γ_n(G)` is not finite:
  for a free pro-`p` group of rank `2` the quotient `G ⧸ γ_1(G)` is `ℤ_p^2`. Openness and finite
  levels are properties of the lower `p`-series, not of this one.

### 3.2 Graded pieces and the bracket

- **Graded pieces.** `lcsGradedPiece G n := Additive (γ_n(G) ⧸ (γ_{n+1}(G)).subgroupOf (γ_n(G)))`,
  written `gr_n(G)`, with `lcsGradedMk : γ_n(G) → gr_n(G)`. It is an abelian profinite group when
  `G` is profinite, and `gr_0(G)` is ProfiniteProPGroups' `topAbelianization G`.
- **The bracket.** `lcsBracket G j k : gr_j(G) → gr_k(G) → gr_{j+k+1}(G)`, induced by the
  commutator, with the defining equation `lcsBracket_mk` on classes. It is biadditive,
  alternating, satisfies the Jacobi identity up to the degree cast, is natural for continuous
  homomorphisms, and is jointly continuous. Conjugation acts trivially on every `gr_n(G)`, which
  is the statement `lcsGradedMk (g * x * g⁻¹) = lcsGradedMk x`.
- **The graded Lie ring.** `⨁ n, gr_n(G)` is a `LieRing` for the degreewise bracket, and the
  functoriality of 3.1 gives a Lie ring homomorphism for every continuous homomorphism.
- **`ℤ_p`-structure.** When `G` is pro-`p`, every `gr_n(G)` is an abelian pro-`p` group, hence a
  topological `ℤ_p`-module by ProfiniteProPGroups Layer 4, with the scalar action given by
  `padicPow`; the bracket is `ℤ_p`-bilinear, and `⨁ n, gr_n(G)` is a `LieAlgebra ℤ_[p]`. The
  class of `x ^[p] u` in `gr_n(G)` is `u • lcsGradedMk x`.
- **Comparison with `gradedPiece`.** The inclusion `γ_n(G) ≤ λ_n(G)` of 3.1 induces
  `gr_n(G) → gradedPiece p G n`, additive and compatible with `lcsBracket` and `gradedBracket`.
  *Needs:* L3.1; L1.3; PPG-4 the abelian `ℤ_p`-module structure; PPG-8 `gradedPiece`,
  `gradedBracket`; M `Additive`, `DirectSum`, `LieRing`, `LieAlgebra`.

### 3.3 Generation

- **The spanning theorem.** If `S ⊆ G` generates `G` topologically, then for every `n` the
  graded piece `gr_{n+1}(G)` is the topological closure of the subgroup generated by the brackets
  `lcsBracket (lcsGradedMk s) y` for `s ∈ S` and `y ∈ gr_n(G)`. Proof: for fixed `y`, the map
  `g ↦ lcsBracket (lcsGradedMk g) y` is a continuous homomorphism `G → gr_{n+1}(G)`, because
  `⁅g * h, c⁆ = (g * ⁅h, c⁆ * g⁻¹) * ⁅g, c⁆` and conjugation is trivial on `gr_{n+1}(G)`; its
  kernel contains `γ_1(G)`, so it is determined by its values on a topological generating set; and
  `γ_{n+1}(G)` is the closure of the subgroup generated by the commutators `⁅g, c⁆` with
  `c ∈ γ_n(G)`.
- **The finite form.** If `S` is finite, the closure is superfluous: every `z ∈ gr_{n+1}(G)` is a
  sum `Σ_{s ∈ S} lcsBracket (lcsGradedMk s) (y s)` with one term per generator, because the set
  of such sums is the image of the compact group `gr_n(G) ^ S` under a continuous additive map,
  hence closed, and the bracket is additive in its second argument.
- **Finite generation of the pieces.** If `G` is a topologically finitely generated pro-`p` group
  then each `gr_n(G)` is a finitely generated `ℤ_p`-module, by induction from the finite form.
  *Needs:* L3.2; M `IsCompact.image`, `Subgroup.closure`.

  ⚠ The spanning theorem is about the closed series and needs no finite generation. The one-term
  form is where finiteness of `S` enters; for infinite `S` a graded element is a limit of finite
  sums.

### 3.4 The free pro-`p` group

- **Degree zero.** For `F = freeProP p (Fin r)` with generators `x_i := freeProP.of p i`,
  `gr_0(F)` is a free `ℤ_p`-module of rank `r` on the classes `x̄_i`, by ProfiniteProPGroups'
  identification of `topAbelianization F`.
- **Degree one.** `gr_1(F)` is generated by the brackets `[x̄_i, x̄_j]`, `i < j`, by 3.3, and
  these form a basis: `gr_1(F)` is a free `ℤ_p`-module of rank `r (r - 1) / 2`, the exterior
  square of `gr_0(F)`. The proof transports the corresponding statement for the discrete free
  group, `γ_2 / γ_3 ≅ Λ² ℤ^r`, along the dense inclusion `FreeGroup (Fin r) → F`, using that
  `F ⧸ γ_2(F)` is the pro-`p` completion of the discrete free nilpotent group of class two.
- **The nonvanishing instance.** `[x̄_0, x̄_1] ≠ 0` in `gr_1(F)` for `r ≥ 2`. This is the input
  to two nearby-false-statement checks in PeripheralActions.
  *Needs:* L3.2, L3.3; PPG-4 `freeProP`, `topAbelianization`; M `FreeGroup`, `ExteriorAlgebra`.
  *Source:* Magnus–Karrass–Solitar, *Combinatorial Group Theory*, §5.7; Serre, *Lie Algebras and
  Lie Groups*, Part I, Chapter IV.

## Worked examples

- `ẑ ≃ ∏_ℓ ℤ_ℓ`, with `ω_2` computed at the levels `2^k` and at an odd level.
- In `Multiplicative ℤ_[3]`: `ofAdd 1 ^ᶻ a = ofAdd (component 3 a)`.
- In the finite group `ZMod 6`: `x ^ᶻ a = x ^ (toZMod 6 a).val`, so `x ^ᶻ ω_2` is the
  `2`-component of `x`.
- `ContinuousAut (Multiplicative ℤ_[p]) ≃* ℤ_[p]ˣ`, and `ContinuousOut` of an abelian group is
  `ContinuousAut`.
- For `F = freeProP p (Fin 2)`: `ContinuousAut F →* GL_2(𝔽_p)` is surjective, `gr_0(F) = ℤ_p^2`
  and `gr_1(F) = ℤ_p [x̄_0, x̄_1]`.

## Ordering and parallel work

Layer 0 is self-contained and comes first. Layer 1 needs 0.2 and 0.3; 1.3 needs 0.4. Layer 2.1
needs nothing beyond Mathlib and can start at once; 2.2 needs ProfiniteProPGroups Layer 3; 2.3
needs 2.2; 2.4 needs 2.2 and ProfiniteProPGroups Layers 3 and 4. Layer 3.1 and 3.2 need only
Mathlib and, for the `ℤ_p`-statements, Layer 1.3 and ProfiniteProPGroups Layer 4; 3.3 needs 3.2;
3.4 needs 3.3 and ProfiniteProPGroups Layer 4. Layers 2 and 3 are independent of each other and
of Layer 1 except where a `^[ℓ]` statement is involved.

## Acceptance checklist

- `ProfiniteInt` is a subring of `∏ n : ℕ+, ZMod n`, and its ring, topology, compactness and
  universal property are theorems about that carrier, not axioms.
- `component ℓ` is a ring homomorphism, and `ẑ ≃ ∏_ℓ ℤ_ℓ` is an isomorphism of topological rings.
- The comparison with `zHat` is a named `ContinuousMulEquiv` with a pinned value on the generator.
- `x ^ᶻ a` is defined by a universal property, and `(x ^ᶻ a) ^ᶻ b = x ^ᶻ (a * b)` is proved
  against the ring product of Layer 0.
- `padicPow` is stated only on pro-`ℓ` groups with `[Fact ℓ.Prime]`, and its comparison with
  `^ᶻ` goes through `component ℓ` and through ProfiniteProPGroups' identification of the maximal
  pro-`ℓ` quotient of `zHat`.
- `ContinuousAut G` is a group by composition with `(φ * ψ) x = φ (ψ x)`; `conj g x = g * x * g⁻¹`.
- Profiniteness of `ContinuousAut G` is stated under `IsTopologicallyFinitelyGenerated G` and
  nowhere else.
- The finite `p`-group theorem of 2.4 is proved by the free action on generating tuples, and
  the pro-`p` theorem is its inverse limit.
- The closed lower central series is 0-based, each term is defined as a closure, and no
  milestone claims openness or finiteness of a quotient by it.
- The spanning theorem is stated for arbitrary topological generating sets, and its one-term form
  for finite ones.
- `gr_1` of a free pro-`p` group of finite rank is identified with the exterior square of `gr_0`
  by a theorem, not by a definition.

## References

- L. Ribes, P. Zalesskii, *Profinite Groups*, 2nd ed., Ergebnisse 40, Springer 2010: §4.1 for
  powers with exponents in `ẑ`, §4.3 for profinite abelian groups, §4.4 for the automorphism group
  of a profinite group, §4.5 for the automorphism group of a free pro-`p` group, Prop. 2.5.2 for
  the Hopf property and Prop. 2.8.7 for the Frattini generation statement consumed from
  ProfiniteProPGroups.
- J. D. Dixon, M. P. F. du Sautoy, A. Mann, D. Segal, *Analytic pro-p groups*, 2nd ed., CUP 1999,
  Chapter 5, for automorphism groups of finitely generated pro-`p` groups.
- D. Gorenstein, *Finite Groups*, Chapter 5 §1, and B. Huppert, *Endliche Gruppen I*, Kapitel III
  §3, for the `p`-group of automorphisms acting trivially on the Frattini quotient.
- W. Magnus, A. Karrass, D. Solitar, *Combinatorial Group Theory*, §5.7, and J.-P. Serre,
  *Lie Algebras and Lie Groups*, Part I, Chapter IV, for the graded Lie ring of the lower central
  series of a free group.
- M. Lazard, "Sur les groupes nilpotents et les anneaux de Lie", Ann. Sci. École Norm. Sup. 71
  (1954), for the graded Lie ring of a central series in general.
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed., Chapter I §1 for
  profinite groups and Chapter III §9 for the pro-`p` Frattini argument.
- The `FLT` formalization project's `ZHat`, for the shape of `ProfiniteInt`.
