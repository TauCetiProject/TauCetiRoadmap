# Roadmap: profinite integers, profinite powers, and continuous automorphisms

This roadmap builds the generic profinite calculus that several arithmetic roadmaps consume and
none of them owns. **ProfiniteProPGroups** names it, in its opening section, as the exact owner
of three constructions: the profinite integers `ẑ` as a topological commutative **ring**, the
profinite power `x ^ᶻ a` of an element of a profinite group by an exponent `a ∈ ẑ` together with
its comparison against the `ℤ_ℓ`-power on a pro-`ℓ` group, and the continuous automorphism and
outer-automorphism groups of a profinite group with their topology. **BelyiMaps** consumes the
same three constructions for its arithmetic layers, under the same name. A fourth belongs with
them for the same reason, that it is group theory about every profinite group and no arithmetic
roadmap should own it: the `ℤ_p`-linear graded Lie algebra of the **closed lower central series**
of a pro-`p` group, with its spanning theorem.

Tau Ceti already has part of this material, and the roadmap builds on it, never beside it. The
profinite integers are Tau Ceti's `TauCeti.zHat`, the profinite completion of `ℤ` with its
universal property: this roadmap puts the ring structure on it and extends its lifting property to
every universe, and introduces no second carrier. The `ℤ_ℓ`-power on a pro-`ℓ` group is Tau Ceti's
`TauCeti.IsProP.padicPow`; the lower `p`-series with its graded pieces and bracket for every `p` is
`TauCeti.pLowerCentralSeries`, whose case `p = 0` is the closed lower central series; and pro-`p`
groups, free pro-`p` groups and topological generation are Tau Ceti's implementations of what
ProfiniteProPGroups specifies. What is built here is what is missing around them.

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

- the ring structure on Tau Ceti's profinite integers: `Additive TauCeti.zHat`, written `ẑ`, as a
  topological commutative ring whose product is composition of the endomorphisms
  `TauCeti.zHat.lift a`; its projections to the `ZMod n` and the description of `ẑ` as their
  inverse limit; its `ℓ`-adic components `ẑ →+* ℤ_ℓ`, and their agreement with Tau Ceti's
  `TauCeti.zHat.maximalProPQuotientEquivPadicInt`; the decomposition `ẑ ≃ ∏_ℓ ℤ_ℓ` as topological
  rings; the idempotents `ω_ℓ` of that decomposition; the unit group `ẑˣ` with its unit criterion;
  and the assembly of a compatible system of characters `G →* (ZMod n)ˣ` into one character
  `G →* ẑˣ`;
- the universal property of profinite completion, and with it `TauCeti.zHat.lift`, for profinite
  targets in every universe, as a generalization of the existing Tau Ceti declarations in place
  (see *Changes to existing Tau Ceti declarations* below);
- the profinite power `x ^ᶻ a`, which is `TauCeti.zHat.lift x` applied to `a`, for `x` in a
  profinite group of any universe and `a ∈ ẑ`, with its complete calculus: agreement with integer
  powers, the additive and multiplicative laws, naturality under continuous homomorphisms and hence
  under conjugation, continuity, the closed procyclic subgroup `⟨x⟩‾` and the `ℓ`-parts
  `x ^ᶻ ω_ℓ`;
- the comparison `x ^ᶻ a = x ^[ℓ] (component_ℓ a)` with Tau Ceti's `ℤ_ℓ`-power, and the behaviour
  of unit exponents: `x ↦ x ^[ℓ] u` is a bijection of `⟨x⟩‾` with inverse `x ↦ x ^[ℓ] u⁻¹`, and
  `x ^[ℓ] u = y ^[ℓ] u` forces `x = y`;
- `ContinuousAut G`, the group of continuous automorphisms `G ≃ₜ* G`, the inner homomorphism
  `G →* ContinuousAut G`, the outer group `ContinuousOut G`, the congruence topology on
  `ContinuousAut G`, its profiniteness when `G` is topologically finitely generated, the actions
  on `G`, on conjugacy classes and on closed subgroups up to conjugacy, functoriality along a
  topologically characteristic closed normal subgroup, the outer action of an extension, and, for
  pro-`p` groups, the open pro-`p` subgroup of automorphisms acting trivially on the Frattini
  quotient;
- for the closed lower central series `γ_n(G)` of a topological group, which is Tau Ceti's lower
  `p`-series at `p = 0`: the `ℤ_p`-linearity of its bracket and the `LieAlgebra ℤ_[p]` structure
  on `⨁ gr_n(G)` for pro-`p` groups, the spanning theorem for the graded pieces of a topologically
  generated compact group, the triviality of the intersection `⋂ γ_n(G)` for pro-`p` groups, the
  comparison with the lower `p`-series, the identification of `gr_0(G)` with Mathlib's
  topological abelianization, and the degree-zero and degree-one pieces of a free pro-`p` group,
  with the topology and pro-`p` structure of Tau Ceti's Heisenberg group over `ℤ_p`, which detects
  degree one.

It does not own, and consumes by name:

- pro-`p` groups, the pro-`p` kernel and the maximal pro-`p` quotient, the pro-`p` Frattini
  subgroup, the Burnside basis theorem, the Hopf property, topological finite generation and free
  pro-`p` groups: **ProfiniteProPGroups** specifies them and Tau Ceti implements them
  (`TauCeti.IsProP`, `TauCeti.proPKernel`, `TauCeti.maximalProPQuotient`, `TauCeti.proPFrattini`,
  `TauCeti.IsTopologicallyFinitelyGenerated`, `TauCeti.freeProP`, and the theorems in the contract
  table below). This roadmap uses the Tau Ceti declarations directly, and nothing from that
  roadmap's `Suggested.lean`;
- from **Tau Ceti**: the profinite integers `TauCeti.zHat` with its generator, its universal
  property and its maximal pro-`p` quotients; the `ℤ_p`-power `TauCeti.IsProP.padicPow` with its
  calculus, used here as `padicPow`; and the lower `p`-series `TauCeti.pLowerCentralSeries` with its
  graded pieces `TauCeti.gradedPiece`, class map `TauCeti.gradedMk` and bracket
  `TauCeti.gradedBracket`, whose case `p = 0` is used as `closedLowerCentralSeries`,
  `lcsGradedPiece`, `lcsGradedMk` and `lcsBracket`;
- the topological abelianization, Mathlib's `TopologicalAbelianization`;
- continuous cohomology, from **ProfiniteCohomology**; nothing here is cohomological;
- every arithmetic object: Galois groups, cyclotomic characters beyond the generic assembly of
  a compatible system into `ẑˣ`, inertia groups, fundamental groups, and the branch-cycle and
  peripheral-power theorems.

There is no second carrier of the profinite integers, no second lift or powering construction,
and no second `IsProP`, free pro-`p` group, `ℤ_p`-power or lower central series. Where a statement
of this roadmap is about a Tau Ceti object, it names the Tau Ceti declaration, through a reducible
alias when this roadmap keeps its own name for it.

### Changes to existing Tau Ceti declarations

Two targets change existing Tau Ceti declarations instead of adding new ones.

- **The universe of the profinite-completion universal property (Layer 1.1).**
  `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv`, with `continuousMonoidHomEquiv_apply` and
  `continuousMonoidHomEquiv_symm_apply_etaFn`, is generalized from profinite targets in the
  universe of the group to profinite targets in any universe. `TauCeti.zHat.lift`, `lift_ofInt`,
  `lift_gen`, `lift_unique` and `existsUnique_lift` are generalized with it, keeping their names and
  their definitions. Existing callers, whose targets lie in the universe of the group, are
  unaffected; `TauCeti.zHat.hom_ext` and `TauCeti.ProfiniteCompletion.continuousMonoidHom_ext`
  already allow targets in any universe.
- **The ring structure on `TauCeti.zHat` (Layer 0).** The ring API of Layer 0 is added to the
  namespace `TauCeti.zHat`, on `Additive TauCeti.zHat`, in its own file beside
  `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Basic.lean`, whose module docstring then points to
  it instead of saying that the ring structure is not treated. Nothing in the existing
  `TauCeti.zHat` API changes.

`Suggested.lean` cannot change or extend Tau Ceti, so it pins the generalized declarations and the
new ring API under this roadmap's namespace (`ProfiniteCompletion.continuousMonoidHomEquiv`,
`zHat.lift`, `zHat.toZMod`, …). The theorem `zHat.lift_eq_tauCeti` records that on targets in
`Type` the generalized lift is the existing one.

## Conventions

- **The profinite type-class stack** is unbundled, as in Tau Ceti:
  `[Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]`. Hausdorffness is a theorem in this stack, not a hypothesis:
  the identity component of a topological group is closed, so a totally disconnected group is
  `T1`, hence `T2`. `ProfiniteGrp` is used only where a categorical limit or completion genuinely
  needs it.
- **Pro-`p`** is Tau Ceti's `TauCeti.IsProP p G`, the implementation of ProfiniteProPGroups'
  `IsProP`, carried as an explicit hypothesis `(hG : TauCeti.IsProP p G)`, never as a class. Every
  `ℤ_ℓ`-power statement carries `[Fact ℓ.Prime]`.
- **`ẑ`** is `Additive TauCeti.zHat`: Tau Ceti's profinite integers `TauCeti.zHat`, the profinite
  completion of `ℤ` written multiplicatively, in additive notation, with the ring structure of
  Layer 0. In `Suggested.lean`, `ẑ` is notation for that type, not a new type. The index of the
  finite levels `ZMod n` runs over `ℕ+`: `ZMod 0 = ℤ` would collapse the limit.
- **Profinite powers** are written `x ^ᶻ a` in prose and in Lean (scoped notation for
  `zpowHat x a`, which is `TauCeti.zHat.lift x` applied to `a` read multiplicatively). The
  `ℤ_ℓ`-power is written `x ^[ℓ] u` in prose only; its Lean name is `padicPow ℓ hG x u`, because
  Mathlib reserves `f^[n]` for iterates, and it is Tau Ceti's `TauCeti.IsProP.padicPow`.
- **Automorphisms compose as functions.** `ContinuousAut G` multiplies by composition,
  `(φ * ψ) x = φ (ψ x)`, matching Mathlib's `MulAut`. The inner automorphism attached to `g` is
  `x ↦ g * x * g⁻¹`, matching `MulAut.conj`. A conjugate written `c⁻¹ * x * c` in a consumer is
  `MulAut.conj c⁻¹ x`; no second conjugation convention is introduced.
- **Conjugacy** is Mathlib's `IsConj`, and conjugacy classes are Mathlib's `ConjClasses`.
- **The closed lower central series is 0-based**, like Mathlib's `Subgroup.lowerCentralSeries`
  and Tau Ceti's `TauCeti.pLowerCentralSeries`, of which it is the case `p = 0`: `γ_0(G) = G` and
  `γ_{n+1}(G) = closure ⁅γ_n(G), G⁆`. So `gr_0(G)` is the topological abelianization and the
  bracket raises the degree by one: `[gr_j, gr_k] ⊆ gr_{j+k+1}`.
- **Graded pieces are written additively**, as `Additive` of the group quotient, so that
  bilinearity is stated with `+`. They are Tau Ceti's `TauCeti.gradedPiece 0 G n`.
- **Commutators** are Mathlib's `⁅x, y⁆ = x * y * x⁻¹ * y⁻¹`; the relator convention of
  ProfiniteProPGroups, `(x, y) = x⁻¹ y⁻¹ x y`, appears only when a Demushkin relator is
  quoted, and never in a statement of this roadmap.

## Exact supplier contracts

All names in this section are part of the dependency contract.

### From Tau Ceti

ProfiniteProPGroups specifies the pro-`p` foundations and Tau Ceti implements them; this roadmap
consumes the implementation directly.

| Use here | Exact declarations |
|---|---|
| pro-`p` groups and the maximal pro-`p` quotient | `TauCeti.IsProP`, `TauCeti.isProP_iff`, `TauCeti.proPKernel`, `TauCeti.mem_proPKernel_iff`, `TauCeti.map_proPKernel_eq`, `TauCeti.maximalProPQuotient`, `TauCeti.maximalProPQuotient.mk`, `TauCeti.isProP_maximalProPQuotient`, `TauCeti.maximalProPQuotient.lift` |
| the pro-`p` Frattini subgroup, Burnside and Hopf | `TauCeti.proPFrattini`, `TauCeti.proPFrattini_def`, `ContinuousMulEquiv.map_proPFrattini_eq`, `TauCeti.topologicallyGenerates_iff_frattiniQuotient`, `TauCeti.IsProP.surjective_of_leftInverse_of_ker_le_proPFrattini`, `TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective` |
| topological finite generation | `TauCeti.IsTopologicallyFinitelyGenerated`, `TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq` |
| free pro-`p` groups | `TauCeti.freeProP`, `TauCeti.freeProP.of`, `TauCeti.freeProP.lift`, `TauCeti.freeProP.lift_of`, `TauCeti.freeProP.lift_unique`, `TauCeti.freeProP.hom_ext`, `TauCeti.isProP_freeProP`, `TauCeti.freeProP.topologicalClosure_closure_range_of_eq_top` |
| the profinite integers | `TauCeti.zHat`, `TauCeti.zHat.ofInt`, `TauCeti.zHat.gen`, `TauCeti.zHat.ofInt_ofAdd`, `TauCeti.zHat.denseRange_ofInt`, its `IsMulCommutative` instance, `TauCeti.zHat.hom_ext`, `TauCeti.zHat.lift`, `TauCeti.zHat.lift_ofInt`, `TauCeti.zHat.lift_gen`, `TauCeti.zHat.lift_unique`, `TauCeti.zHat.existsUnique_lift`, `TauCeti.zHat.maximalProPQuotientEquivPadicInt` |
| the universal property of profinite completion | `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv`, `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv_apply`, `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv_symm_apply_etaFn`, `TauCeti.ProfiniteCompletion.continuousMonoidHom_ext` |
| the `ℤ_p`-power | `TauCeti.IsProP.padicPow`, `TauCeti.IsProP.padicPow_one`, `padicPow_intCast`, `padicPow_add`, `padicPow_mul`, `map_padicPow`, `inv_padicPow`, `continuous_padicPow`, `padicPow_mem`, `TauCeti.IsProP.padicPowHom`, `TauCeti.IsProP.module` |
| the profinite limit description | `TauCeti.existsUnique_forall_mk_eq`, `TauCeti.existsUnique_monoidHom_mk'_comp_eq`, `TauCeti.continuous_iff_forall_continuous_mk`, and their `_of_iInf_eq_bot` variants |
| the Heisenberg group | `TauCeti.HeisenbergGroup`, `TauCeti.HeisenbergGroup.equivProd`, its `Group` instance, `TauCeti.HeisenbergGroup.commutatorElement_eq` |
| the lower `p`-series | `TauCeti.pLowerCentralSeries`, `pLowerCentralSeries_zero`, `pLowerCentralSeries_succ`, `pLowerCentralStep_def`, `mem_pLowerCentralSeries_zero`, the instance `pLowerCentralSeries_normal`, `isClosed_pLowerCentralSeries`, `pLowerCentralSeries_antitone`, `commutator_mem_pLowerCentralSeries`, `mk_conj_of_mem_pLowerCentralSeries`, `MonoidHom.map_pLowerCentralSeries_le`, `ContinuousMulEquiv.map_pLowerCentralSeries_eq` |
| its graded pieces and bracket | `TauCeti.gradedPiece`, `TauCeti.gradedMk`, `gradedMk_surjective`, `gradedMk_eq_gradedMk_iff`, `TauCeti.gradedPieceZeroEquiv`, `gradedPieceZeroEquiv_gradedMk`, `TauCeti.gradedBracket`, `gradedBracket_gradedMk`, `gradedBracket_self`, `gradedBracket_jacobi`, `gradedMap_gradedBracket` |
| detecting `ℤ_p` in degree zero | `TauCeti.isProP_multiplicative_padicInt` |

The profinite integers and the universal property of profinite completion are extended here, not
only consumed: see *Changes to existing Tau Ceti declarations*.

### From Mathlib

`ZMod`, `ZMod.castHom`, `PadicInt`, `PadicInt.toZModPow`, `PadicInt.toZMod`, the inverse-limit
universal property `PadicInt.lift` with `PadicInt.lift_spec` and `PadicInt.lift_unique`,
`PadicInt.ext_of_toZModPow`, `Units`, `Additive`, `Multiplicative`, `zpowersHom`,
`ProfiniteGrp`, `ProfiniteGrp.ProfiniteCompletion.completion` with
`ProfiniteGrp.ProfiniteCompletion.etaFn` and `ProfiniteGrp.ProfiniteCompletion.homEquiv`,
`ContinuousMonoidHom`, `ContinuousMulEquiv` with `refl`, `symm`, `trans` and `ext`, `MulAut`,
`MulAut.conj`, `MulDistribMulAction`, `IsConj`, `isConj_iff`, `ConjClasses`,
`Subgroup.topologicalClosure`, `Subgroup.zpowers`, `Subgroup.lowerCentralSeries`,
`commutatorElement`, `Subgroup.commutator`, `commutator`, `TopologicalAbelianization`,
`ContinuousAddEquiv`, `DiscreteTopology`, `ClosedSubgroup`, `ConjAct`, `MulAction.compHom`,
`MulAction.orbitRel`, `QuotientGroup.map`, `Subgroup.Characteristic`, `frattini`,
`frattini_nongenerating`, `IsPGroup`, `IsPGroup.isNilpotent`, `Group.IsNilpotent`,
`OpenNormalSubgroup`, `isCompact_range`, `IsCompact.image`, `IsCompact.isClosed`,
`IsCompact.nonempty_iInter_of_directed_nonempty_isCompact_isClosed`, `DirectSum`, `LieRing`,
`LieAlgebra`.

Mathlib has no ring of profinite integers, no profinite power, no group structure on
`ContinuousMulEquiv G G`, no `ℤ_p`-power on a nonabelian group, and no graded Lie ring of a lower
central series. Tau Ceti has three of these, and this roadmap consumes them: the `ℤ_p`-power on a
pro-`p` group, the profinite completion `TauCeti.zHat` of `ℤ` as a group with its universal
property for targets in `Type`, and the lower `p`-series with its graded bracket for every `p`,
whose case `p = 0` is the closed lower central series. Neither has the ring structure on `ẑ`, a
group or a topology on `G ≃ₜ* G`, the outer automorphism group, or the `ℤ_p`-linear graded Lie
algebra of the closed series; each is built here, the ring structure on Tau Ceti's own
`TauCeti.zHat`. The `FLT` project's `ZHat` is the same ring presented as compatible residues in
`∏ n, ZMod n`; Layer 0.2 proves that presentation as a characterization of `ẑ`, so a comparison
with `ZHat` is a theorem, not a second definition.

## How to read the build

`README.md` is normative; `Suggested.lean` pins names and signatures for the central objects and is
not exhaustive. In prerequisite annotations, `M` means Mathlib, `TC` means Tau Ceti, and `L0`
through `L3` mean an earlier layer here. No milestone depends on an unmerged roadmap.

## Layer 0: the ring structure on the profinite integers

The profinite integers are Tau Ceti's `TauCeti.zHat`, the profinite completion of `ℤ`, written
multiplicatively, with the generator `TauCeti.zHat.gen` and the universal property
`TauCeti.zHat.lift`: a continuous homomorphism out of `TauCeti.zHat` into a profinite group is
determined by its value at the generator, and every value occurs. This layer puts the ring
structure on its additive presentation `ẑ = Additive TauCeti.zHat` and builds the ring-theoretic
API around it, in the namespace `TauCeti.zHat`. There is no second carrier: every statement is
about `TauCeti.zHat` itself.

### 0.1 The ring structure

- **The product.** For `a b : ẑ`, `a * b` is `TauCeti.zHat.lift a b`, read additively: the product
  with `a` is the unique continuous endomorphism of `TauCeti.zHat` sending the generator to `a`,
  as the product with an integer is on `ℤ`. The unit is `TauCeti.zHat.gen`, and the casts of
  natural numbers and integers are its powers, `(n : ẑ) = TauCeti.zHat.gen ^ n` read additively.
  The addition is that of `Additive TauCeti.zHat`, commutative because `TauCeti.zHat` is.
-  **The ring axioms.** Each follows from uniqueness in the universal property
  (`TauCeti.zHat.hom_ext`) or from density of `ℤ` (`TauCeti.zHat.denseRange_ofInt`): `1 * b = b`
  because the lift of the generator is the identity; `a * (b + c) = a * b + a * c` because each lift
  is a homomorphism; `(a + b) * c = a * c + b * c` because the pointwise product of two continuous
  homomorphisms into the commutative group `TauCeti.zHat` is one, sending the generator to `a + b`;
  `(a * b) * c = a * (b * c)` because `TauCeti.zHat.lift a ∘ TauCeti.zHat.lift b` sends the
  generator to `a * b`; and `a * b = b * a` because both sides are continuous in each variable and
  agree on integers.
- **Topology.** `ẑ` carries the topology of `TauCeti.zHat`: compact, totally disconnected and
  Hausdorff, a topological additive group. It is a topological ring: the product is jointly
  continuous, because modulo each `n` it is the product of the residues (0.2).
  *Needs:* TC `TauCeti.zHat`, `TauCeti.zHat.gen`, `TauCeti.zHat.ofInt_ofAdd`,
  `TauCeti.zHat.denseRange_ofInt`, the `IsMulCommutative` instance, `TauCeti.zHat.hom_ext`,
  `TauCeti.zHat.lift`, `TauCeti.zHat.lift_gen`, `TauCeti.zHat.lift_unique`; M `Additive`,
  `CommRing`, `IsTopologicalRing`.

  API checklist for the ring `ẑ`:
  - Constructors: the ring structure on `Additive TauCeti.zHat`; `zHat.ringLift`, the map into `ẑ`
    assembled from a compatible family of ring homomorphisms `R →+* ZMod n` (0.2).
  - Examples: the image of `ℤ`; `ω_ℓ` (0.3); the element with components `(1, 0, 1, 0, …)` in
    `∏ ℤ_ℓ`, which is not an integer.
  - Morphisms: `zHat.toZMod n : ẑ →+* ZMod n`, continuous, and `zHat.component ℓ` (0.3).
  - Functoriality: `toZMod` is compatible with `ZMod.castHom` along divisibility.
  - Comparison lemmas: the inverse-limit description of 0.2; `component ℓ` against Tau Ceti's
    `TauCeti.zHat.maximalProPQuotientEquivPadicInt` (0.3); `∏_ℓ ℤ_ℓ` (0.3).
  - Naturality: the universal property of 0.2 is natural in `R`.
  - Edge cases: `ẑ` is not a domain, because `ω_2 · (1 - ω_2) = 0`; `n = 1`, where `ZMod 1` is
    trivial and `toZMod 1` carries no information.
  - Downstream interfaces: Layer 1 powers; the cyclotomic character of the BelyiMaps successor.

  ⚠ The multiplicative notation of `TauCeti.zHat` is the *addition* of `ẑ`: the group product of
  two elements of `TauCeti.zHat` is their sum in `ẑ`, and the ring product exists only on
  `Additive TauCeti.zHat`.

### 0.2 Projections and the limit property

- **Projections.** `zHat.toZMod n : ẑ →+* ZMod n` for every `n : ℕ+` is the lift of `ofAdd 1`
  into the finite discrete group `Multiplicative (ZMod n)`, read additively; it is continuous, a
  ring homomorphism for the product of 0.1, and compatible along divisibility:
  `ZMod.castHom h (ZMod n) ∘ toZMod m = toZMod n` for `n ∣ m`.
- **The limit property.** Two elements with the same projections are equal. For a ring `R` and a
  family `f n : R →+* ZMod n` compatible with `ZMod.castHom`, there is a unique ring homomorphism
  `zHat.ringLift f : R →+* ẑ` with `toZMod n ∘ ringLift f = f n`. When `R` is a topological ring
  and every `f n` is continuous, the lift is continuous. The same statement for additive groups
  and for monoids of units is derived from it, not restated. Together these say that `ẑ` is the
  inverse limit of the `ZMod n`; that is a characterization of `ẑ`, not a second carrier.
- **Density.** `ℤ → ẑ` is injective, and every element of `ẑ` is a limit of integers
  (`TauCeti.zHat.denseRange_ofInt`): for every finite set of levels a single integer realizes the
  given projections.
  *Needs:* M `ZMod.castHom`, `Nat.chineseRemainder`; TC `TauCeti.zHat.lift`,
  `TauCeti.zHat.denseRange_ofInt`, `TauCeti.existsUnique_forall_mk_eq`; L0.1.

### 0.3 `ℓ`-adic components, the product decomposition, and idempotents

- **Components.** For a prime `ℓ`, `zHat.component ℓ : ẑ →+* ℤ_[ℓ]`, continuous, is the ring
  homomorphism with `PadicInt.toZModPow k ∘ component ℓ = toZMod (ℓ ^ k)` for every `k`. It is
  Mathlib's inverse-limit universal property of `ℤ_[ℓ]` applied to the projections:
  `PadicInt.lift` of the family `k ↦ toZMod (ℓ ^ k)`, which is compatible by `castHom_toZMod`.
  The characterizing equation is `PadicInt.lift_spec`, and uniqueness is `PadicInt.lift_unique`
  (equivalently `PadicInt.ext_of_toZModPow`).
-  **Agreement with Tau Ceti's pro-`ℓ` quotient.** Tau Ceti's isomorphism
  `TauCeti.zHat.maximalProPQuotientEquivPadicInt` from `maximalProPQuotient ℓ zHat` to
  `Multiplicative ℤ_[ℓ]` sends the class of `a` to `ofAdd (component ℓ a)`
  (`zHat.maximalProPQuotientEquivPadicInt_mk_eq_component`): both are continuous homomorphisms out
  of `TauCeti.zHat` into the pro-`ℓ` group `Multiplicative ℤ_[ℓ]` that send the generator to
  `ofAdd 1`. So the `ℓ`-adic part of `ẑ` has one description, not two.
- **The product decomposition.** The map `ẑ → ∏ ℓ : Nat.Primes, ℤ_[ℓ]` with components
  `component ℓ` is an isomorphism of topological rings. Injectivity and surjectivity come from
  the Chinese remainder theorem at each finite level; continuity of the inverse is the
  compactness of `ẑ`.
- **Idempotents.** `zHat.idem ℓ`, written `ω_ℓ`, is the element with
  `component ℓ' ω_ℓ = if ℓ' = ℓ then 1 else 0`. Then `ω_ℓ * ω_ℓ = ω_ℓ`, `ω_ℓ * ω_{ℓ'} = 0` for
  `ℓ ≠ ℓ'`, `component ℓ (ω_ℓ * a) = component ℓ a`, and `a = ω_ℓ * a` exactly when every other
  component of `a` vanishes.
- **Reduction of an idempotent.** `toZMod (ℓ ^ k) ω_ℓ = 1` and `toZMod n ω_ℓ = 0` when `ℓ ∤ n`.
  *Needs:* M `PadicInt.lift`, `PadicInt.lift_spec`, `PadicInt.lift_unique`, `PadicInt.toZModPow`,
  `PadicInt.ext_of_toZModPow`, `ZMod.chineseRemainder`; TC
  `TauCeti.zHat.maximalProPQuotientEquivPadicInt`, `TauCeti.isProP_multiplicative_padicInt`; L0.2.

  ⚠ *Nearby false statement:* `ω_ℓ` is not an integer, and `a ↦ ω_ℓ * a` is not the reduction
  `toZMod (ℓ ^ k)` for any `k`; it is the projection onto the `ℓ`-adic factor.

### 0.4 Units and characters

- **The unit group.** `ẑˣ` with Mathlib's topology on units. Unit criterion:
  `IsUnit a ↔ ∀ n, IsUnit (toZMod n a) ↔ ∀ ℓ, IsUnit (component ℓ a)`, and the topological
  isomorphism `ẑˣ ≃ₜ* ∏ ℓ, ℤ_[ℓ]ˣ`.
- **Assembly of characters.** For a group `G` and a family `χ n : G →* (ZMod n)ˣ` compatible
  with `Units.map (ZMod.castHom h (ZMod n))`, there is a unique `χ : G →* ẑˣ` with
  `Units.map (toZMod n) ∘ χ = χ n` (`zHat.unitsLift`). If `G` is a topological group and each `χ n`
  is continuous, so is `χ`. This is the form in which the BelyiMaps successor assembles the
  cyclotomic character out of Mathlib's `modularCyclotomicCharacter` at each level.
  *Needs:* M `Units`, `Units.map`; L0.3.

## Layer 1: profinite powers and `ℤ_ℓ`-powers

### 1.1 The power `x ^ᶻ a`

- **The universal property in every universe.** Tau Ceti's
  `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv` identifies continuous homomorphisms from
  the profinite completion of `G` to a profinite group `P` with homomorphisms `G →* P`, for `P`
  in the universe of `G`, because Mathlib's `ProfiniteGrp.ProfiniteCompletion.homEquiv` is an
  adjunction between categories in one universe. It is generalized in place to profinite `P` in
  any universe, and `TauCeti.zHat.lift` with it (see *Changes to existing Tau Ceti
  declarations*). The construction is level by level: for `f : G →* P` and an open normal `U` of
  `P`, the composite `G → P ⧸ U` has finite-index kernel `K`, so it factors through the finite
  quotient `G ⧸ K` onto which the completion projects (Tau Ceti's
  `TauCeti.ProfiniteCompletion.coordinateHom`); these maps are compatible in `U`, and
  `TauCeti.existsUnique_monoidHom_mk'_comp_eq` assembles them into a homomorphism from the
  completion to `P`, continuous by `TauCeti.continuous_iff_forall_continuous_mk`. Uniqueness is
  `TauCeti.ProfiniteCompletion.continuousMonoidHom_ext`, which already allows targets in any
  universe. On targets in the universe of `G` the generalized equivalence is the existing one, so
  every current use of `TauCeti.zHat.lift` is unchanged (`zHat.lift_eq_tauCeti`).
- **Definition.** For `x` in a profinite group `G` of any universe, `x ^ᶻ a` is
  `TauCeti.zHat.lift x` applied to `a` read multiplicatively (`zpowHat`). Continuity in `a` and the
  additive laws are those of the continuous homomorphism `TauCeti.zHat.lift x`, and uniqueness is
  `TauCeti.zHat.lift_unique`: a continuous homomorphism out of `TauCeti.zHat` sending the generator
  to `x` is `TauCeti.zHat.lift x`. There is no second powering construction.
  *Needs:* TC `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv`,
  `TauCeti.ProfiniteCompletion.coordinateHom`,
  `TauCeti.ProfiniteCompletion.continuousMonoidHom_ext`,
  `TauCeti.existsUnique_monoidHom_mk'_comp_eq`, `TauCeti.continuous_iff_forall_continuous_mk`,
  `TauCeti.zHat.lift` and its lemmas; M `ProfiniteGrp.ProfiniteCompletion.homEquiv`, `zpowersHom`;
  L0.1.

  API checklist for `^ᶻ`:
  - Constructors: `zpowHat`, from `TauCeti.zHat.lift`.
  - Examples: `x ^ᶻ (n : ℤ) = x ^ n`; `x ^ᶻ 0 = 1`; `x ^ᶻ 1 = x`; `1 ^ᶻ a = 1`; in
    `TauCeti.zHat` itself, `(toMul b) ^ᶻ a = toMul (b * a)`; for `x` of finite order `m`,
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

  ⚠ *Nearby false statement:* `x ^ᶻ a` is not "`x` to an integer representative of `a`"; in general
  no integer representative exists, and the operation is defined by the universal property. Nor is
  `(x * y) ^ᶻ a = x ^ᶻ a * y ^ᶻ a` without commutativity.
  *Source:* Ribes–Zalesskii, *Profinite Groups*, §4.1.

### 1.2 Closed procyclic subgroups and `ℓ`-parts

-  **The procyclic closure.** `closedZpowers x` is a closed abelian subgroup, the image of the
  compact group `TauCeti.zHat` under `TauCeti.zHat.lift x`, so
  `Set.range (x ^ᶻ ·) = closedZpowers x` and `closedZpowers x` is a quotient of `TauCeti.zHat`. It
  is procyclic: topologically generated by one element.
- **`ℓ`-parts.** `x ^ᶻ ω_ℓ` lies in `closedZpowers x`, the closed subgroup it generates is pro-`ℓ`
  (`TauCeti.IsProP ℓ (closedZpowers (x ^ᶻ ω_ℓ))`), and `x ^ᶻ ω_ℓ = x` whenever `closedZpowers x` is
  pro-`ℓ`. In a pro-`ℓ` group `x ^ᶻ a = x ^ᶻ (ω_ℓ * a)` for every `a`. The elements `x ^ᶻ ω_ℓ`
  for distinct primes commute, and their product over the primes dividing the supernatural order
  of `x` recovers `x`, in the sense that `x ^ᶻ (Σ_{ℓ ∈ S} ω_ℓ) → x` as the finite set `S` of
  primes grows.
  *Needs:* L0.3; L1.1; TC `TauCeti.IsProP`.

  ⚠ `x ^ᶻ ω_ℓ` is the `ℓ`-component of `x` in `closedZpowers x`; it is not the image of `x`
  in a maximal pro-`ℓ` quotient of `G`, which is an element of a different group.

### 1.3 The `ℤ_ℓ`-power on a pro-`ℓ` group

- **Definition (Tau Ceti).** For `[Fact ℓ.Prime]`, `G` pro-`ℓ` (`hG : TauCeti.IsProP ℓ G`) and
  `u : ℤ_[ℓ]`, `padicPow ℓ hG x u`, written `x ^[ℓ] u`, is Tau Ceti's `TauCeti.IsProP.padicPow`:
  the unique continuous extension of `n ↦ x ^ n` along `ℕ ⊆ ℤ_[ℓ]`, equivalently the image of `u`
  under the continuous homomorphism `Multiplicative ℤ_[ℓ] →* G` with `ofAdd 1 ↦ x` (Tau Ceti's
  `TauCeti.IsProP.padicPowHom`). This roadmap uses it under the alias `padicPow` and does not
  construct it again.
- **The comparison.** `x ^ᶻ a = x ^[ℓ] (component ℓ a)`, and `x ^[ℓ] u = x ^ᶻ a` for any `a` with
  `component ℓ a = u`; `component ℓ` here is the ring homomorphism of 0.3 and not a second
  projection. The proof goes through the maximal pro-`ℓ` quotient of `TauCeti.zHat`, which Tau
  Ceti identifies with `Multiplicative ℤ_[ℓ]` (`TauCeti.zHat.maximalProPQuotientEquivPadicInt`),
  compatibly with `component ℓ` by 0.3.
- **The calculus (Tau Ceti).** Integer powers, the additive and multiplicative laws, naturality,
  inverses, joint continuity and membership in closed subgroups are Tau Ceti's theorems, applied
  here; the conjugation instance is naturality for
  `MulAut.conj g`. On an abelian pro-`ℓ` group `x ^[ℓ] u` is the scalar action of Tau Ceti's
  `ℤ_ℓ`-module structure `TauCeti.IsProP.module`.
- **Unit exponents.** For `u : ℤ_[ℓ]ˣ`: `(x ^[ℓ] u) ^[ℓ] u⁻¹ = x`; `closedZpowers (x ^[ℓ] u) =
  closedZpowers x`; `x ↦ x ^[ℓ] u` is a homeomorphism of `G` with inverse `x ↦ x ^[ℓ] u⁻¹`; and
  `x ^[ℓ] u = y ^[ℓ] u → x = y`.
- **The class in a quotient.** For a closed normal subgroup `N`, the image of `x ^[ℓ] u` in
  `G ⧸ N` is `(x N) ^[ℓ] u`, and when `G ⧸ N` is abelian this is `u • (x N)` for Tau Ceti's
  `ℤ_ℓ`-module structure.
  *Needs:* L0.3, L1.1 for the comparison; TC `TauCeti.IsProP.padicPow` and its calculus,
  `TauCeti.IsProP.module`, `TauCeti.zHat.maximalProPQuotientEquivPadicInt`.

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
  where `conj` is injective; `G = TauCeti.zHat`, where `ContinuousAut G ≃* ẑˣ` by 1.1.
- **Inner is inner.** If `φ : ContinuousAut G` is inner as an abstract automorphism, that is
  `φ.toMulAut = MulAut.conj g` for some `g`, then `φ = ContinuousAut.conj g`. This is immediate,
  and it is stated because a consumer that only knows `MulAut` needs it.
  *Needs:* M `ContinuousMulEquiv`, `MulAut`, `MulAut.conj`, `QuotientGroup`.

  ⚠ *Nearby false statement:* an abstract automorphism of a profinite group need not be
  continuous, and `MulAut G` is not `ContinuousAut G`. Every statement of this roadmap is about
  continuous automorphisms, and nothing here uses the theorem of Nikolov and Segal.

### 2.2 The congruence topology

-  **Topologically characteristic subgroups.** `IsTopCharacteristic N : Prop` says every continuous
  automorphism maps `N` onto itself, `N.map φ = N`. This is weaker than Mathlib's
  `Subgroup.Characteristic`, which quantifies over `MulAut G`, and it is the notion every closed
  subgroup "defined from the topology" satisfies. For Tau Ceti's `TauCeti.proPKernel` and
  `TauCeti.proPFrattini` it is Tau Ceti's `TauCeti.map_proPKernel_eq` and
  `ContinuousMulEquiv.map_proPFrattini_eq`, applied directly: `isTopCharacteristic_proPKernel`,
  which BelyiMaps Layer 13.1 consumes, and `isTopCharacteristic_proPFrattini`, for every topological
  group and every `p`. For the terms of the lower `p`-series, and so of the closed lower central
  series, it is Tau Ceti's `ContinuousMulEquiv.map_pLowerCentralSeries_eq` (Layer 3.1).
- **The topology.** `ContinuousAut G` carries the initial topology of the maps
  `ContinuousAut G →* MulAut (G ⧸ N)` induced by the topologically characteristic open normal
  subgroups `N`. Each target `MulAut (G ⧸ N)` carries the discrete topology; when `G` is profinite
  these characteristic open quotients are finite, and hence so are their automorphism groups, but
  not in general (the discrete `ℤ × ℤ` example below). In Lean the discrete topology is `⊥`:
  Mathlib orders topologies by fineness, so `⊥` is discrete and `⊤` indiscrete, and
  `ContinuousAut.continuous_mapQuotient` records continuity into the discrete groups. The map sends
  `φ` to the automorphism `x N ↦ φ x N` (`ContinuousAut.mapQuotient_mk`), which pins it.
  `ContinuousAut G` is a topological group, and `ContinuousAut.conj` is continuous.
- **Profiniteness under finite generation.** If `G` is a topologically finitely generated
  profinite group, the topologically characteristic open normal subgroups are cofinal among all
  open normal subgroups,
  because `G` has finitely many open subgroups of each index and their intersection is
  characteristic. Then `ContinuousAut G` is compact, Hausdorff and totally disconnected: the
  compatible families of automorphisms of the quotients `G ⧸ N` are exactly the continuous
  automorphisms of `G = lim G ⧸ N`. In this case the evaluation `ContinuousAut G × G → G` is
  continuous, `ContinuousOut G` is profinite for the quotient topology, and the range of `conj`
  is closed.
- **Closedness of the conjugacy relation.** If `G` is compact and totally disconnected, the set
  of conjugate pairs `{q : G × G | IsConj q.1 q.2}` is closed (`isClosed_isConj_pair`): it is the
  image of the compact space `G × G` under `(g, x) ↦ (x, g * x * g⁻¹)`, and `G × G` is Hausdorff.
  This binary form is the export for closed-graph arguments, in which both arguments of `IsConj`
  vary; PeripheralActions Layer 3.2 consumes it in that form.
- **Closedness of the automorphism conditions.** For `x y : G`, the set of `φ` with `φ x = y`
  is closed, and so is the set of `φ` with `IsConj (φ x) y` (`ContinuousAut.isClosed_isConj`),
  the preimage of the closed relation `isClosed_isConj_pair` under the continuous map
  `φ ↦ (φ x, y)`, continuous by `ContinuousAut.continuous_eval`.
  *Needs:* TC `TauCeti.IsTopologicallyFinitelyGenerated`,
  `TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq`;
  M `MulAut`, `OpenNormalSubgroup`, `isConj_iff`, `isCompact_range`, `IsCompact.isClosed`.
  *Source:* Ribes–Zalesskii §4.4.

  ⚠ Every profiniteness statement carries `IsTopologicallyFinitelyGenerated` and the profinite
  stack on `G`, and neither can be dropped. Without finite generation the congruence topology need
  not be compact. Without compactness it can be indiscrete or infinite and discrete:
  `Multiplicative ℝ` is topologically generated by `1` and `√2` and has no open subgroup but itself,
  and the discrete group `Multiplicative (ℤ × ℤ)` has the open characteristic subgroup `⊥`, which
  makes the topology discrete on the infinite group `GL₂(ℤ)`.

### 2.3 Actions and functoriality

- **The action on `G`.** `ContinuousAut G` acts on `G` by evaluation, a `MulDistribMulAction`,
  compatible with `^ᶻ` and `^[ℓ]` by naturality (1.1, 1.3).
- **The action on conjugacy classes.** The action descends to `ConjClasses G` and there factors
  through `ContinuousOut G`, because inner automorphisms fix every class (`ContinuousOut.mk_smul_mk`).
- **Closed subgroups up to conjugacy.** `ContinuousAut G` acts on Mathlib's `ClosedSubgroup G` by
  images, `φ • H = H.map φ`, closed because `φ` is a homeomorphism
  (`ContinuousAut.smul_closedSubgroup_toSubgroup`). `G` acts on `ClosedSubgroup G` by conjugation,
  through `ConjAct G` and the inner automorphisms, and `ClosedSubgroupConjClasses G` is the orbit
  quotient `MulAction.orbitRel.Quotient (ConjAct G) (ClosedSubgroup G)`. The action descends to it
  and factors through `ContinuousOut G`: `ContinuousOut.mk φ` sends the class of `H` to the class of
  `φ • H` (`ContinuousOut.mk_smul_closedSubgroupConjClass`). BelyiMaps Layer 12.7 consumes this.
- **Functoriality along a characteristic quotient.** For a closed normal topologically
  characteristic subgroup `N`, descent gives `ContinuousAut.mapClosedQuotient :
  ContinuousAut G →* ContinuousAut (G ⧸ N)`, pinned by `x N ↦ φ x N`
  (`ContinuousAut.mapClosedQuotient_mk`). It carries `conj g` to `conj (g N)`
  (`ContinuousAut.mapClosedQuotient_conj`), so it induces `ContinuousOut.mapClosedQuotient :
  ContinuousOut G →* ContinuousOut (G ⧸ N)`, defined from it by `QuotientGroup.map` and computed on
  classes by `ContinuousOut.mapClosedQuotient_mk`. Both maps are continuous for the congruence
  topologies: the preimage in `G` of a topologically characteristic open normal subgroup of
  `G ⧸ N` is one of `G`. The first map is compatible with the actions on conjugacy classes.
  `mapQuotient` of 2.2 is the shadow of `mapClosedQuotient` in `MulAut (G ⧸ N)`, used only for the
  congruence topology.
- **The outer action of an extension.** For a topological group `E` and a closed normal subgroup
  `N`, conjugation gives `E →* ContinuousAut N` and, since conjugation by an element of `N` is
  inner, `E ⧸ N →* ContinuousOut N`, sending `e N` to the class of conjugation by `e`
  (`outerAction_mk`, with one conjugating automorphism for all of `N`). When `N` is a
  topologically finitely generated profinite group, `E →* ContinuousAut N` is continuous for the
  congruence topology: on each finite characteristic quotient of `N` it is locally constant.
  *Needs:* L2.1, L2.2; M `MulDistribMulAction`, `ConjClasses`, `ClosedSubgroup`, `ConjAct`,
  `MulAction.compHom`, `MulAction.orbitRel`, `QuotientGroup.map`, `QuotientGroup.lift`.

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
  *Needs:* L2.2; TC `TauCeti.proPFrattini`; the finite theorem.
  *Source:* Ribes–Zalesskii §4.4 and §4.5; Dixon–du Sautoy–Mann–Segal, *Analytic pro-p groups*,
  Chapter 5.
-  **The free case.** For `F = TauCeti.freeProP p (Fin n)`,
  `ContinuousAut F →* MulAut (F ⧸ proPFrattini p F)` is surjective: an automorphism of the Frattini
  quotient `(ℤ/p)^n` lifts by sending each generator to a lift of its image, which is a continuous
  endomorphism by the universal property, surjective by the Burnside criterion and bijective by the
  Hopf property.
  *Needs:* TC `TauCeti.freeProP.lift`, the Burnside surjectivity criterion
  `TauCeti.IsProP.surjective_of_leftInverse_of_ker_le_proPFrattini` and the Hopf property
  `TauCeti.IsTopologicallyFinitelyGenerated.bijective_of_surjective`.
  *Source:* Ribes–Zalesskii §4.5.

## Layer 3: the closed lower central series and its graded Lie ring

### 3.1 The series

- **Definition (Tau Ceti).** For a topological group `G`, `closedLowerCentralSeries G n`, written
  `γ_n(G)`, is Tau Ceti's `TauCeti.pLowerCentralSeries 0 G n`. At `p = 0` the power term of Tau
  Ceti's step `closure (λᵖ ⬝ [λ, G])` is trivial, so `γ_0(G) = ⊤` and
  `γ_{n+1}(G) = ⁅γ_n(G), ⊤⁆.topologicalClosure` (`closedLowerCentralSeries_succ`, proved from Tau
  Ceti's `pLowerCentralStep_def`). Closedness, normality, antitonicity, the commutator inclusion
  `⁅γ_j(G), γ_k(G)⁆ ≤ γ_{j+k+1}(G)` that makes the bracket of 3.2 well defined, and functoriality
  under continuous homomorphisms are Tau Ceti's theorems, applied here. Each term is topologically
  characteristic, because continuous isomorphisms match the series term by term (Tau Ceti's
  `ContinuousMulEquiv.map_pLowerCentralSeries_eq`).
- **Comparison with the abstract series.** `γ_n(G) = (Subgroup.lowerCentralSeries ⊤ n).topologicalClosure`:
  taking closures commutes with the commutator step because the commutator map is continuous.
- **Comparison with the lower `p`-series.** `γ_n(G) ≤ λ_n(G)` for every `p` and `n`, where
  `λ_n(G) = TauCeti.pLowerCentralSeries p G n`, by induction from `⁅λ_n, G⁆ ≤ λ_{n+1}`; the induced
  map on graded pieces is compatible with the two brackets (3.2).
- **Triviality of the intersection.** If `G` is pro-`p` then `⨅ n, γ_n(G) = ⊥`: every open normal
  subgroup `U` has a finite `p`-group quotient, which is nilpotent (`IsPGroup.isNilpotent`), so
  `γ_c(G) ≤ U` for `c` its nilpotency class, and the open normal subgroups of a profinite group
  intersect in `⊥`.
  *Needs:* TC `TauCeti.pLowerCentralSeries` and its laws; L2.2 `IsTopCharacteristic`;
  M `Subgroup.lowerCentralSeries`, `Subgroup.topologicalClosure`, `IsPGroup.isNilpotent`;
  TC `TauCeti.IsProP`.

  ⚠ *Nearby false statement:* `γ_n(G)` is not open in general, and `G ⧸ γ_n(G)` is not finite:
  for a free pro-`p` group of rank `2` the quotient `G ⧸ γ_1(G)` is `ℤ_p^2`. Openness and finite
  levels are properties of the lower `p`-series, not of this one.

### 3.2 Graded pieces and the bracket

- **Graded pieces (Tau Ceti).** `lcsGradedPiece G n` is Tau Ceti's
  `TauCeti.gradedPiece 0 G n = Additive (γ_n(G) ⧸ (γ_{n+1}(G)).subgroupOf (γ_n(G)))`, written
  `gr_n(G)`, with the class map `lcsGradedMk`, Tau Ceti's `TauCeti.gradedMk`. It is an abelian
  profinite group when `G` is profinite.
- **Degree zero and the abelianization.** `gr_0(G)` is identified with Mathlib's
  `TopologicalAbelianization G = G ⧸ closure ⁅G, G⁆` by the named topological isomorphism
  `lcsGradedPieceZeroEquiv : gr_0(G) ≃ₜ+ Additive (TopologicalAbelianization G)`, pinned on
  classes by `lcsGradedPieceZeroEquiv_mk`. Its algebraic part is Tau Ceti's
  `TauCeti.gradedPieceZeroEquiv` together with `γ_1(G) = closure ⁅G, G⁆`
  (`closedLowerCentralSeries_one`). Neither Mathlib nor Tau Ceti states the identification, so this
  roadmap owns it.
- **The bracket (Tau Ceti).** `lcsBracket G j k` is Tau Ceti's
  `TauCeti.gradedBracket 0 G j k : gr_j(G) →+ gr_k(G) →+ gr_{j+k+1}(G)`, induced by the commutator,
  with the defining equation `lcsBracket_mk` on classes. Tau Ceti proves it biadditive,
  alternating (`gradedBracket_self`), satisfying the Jacobi identity up to the degree cast
  (`gradedBracket_jacobi`) and natural for continuous homomorphisms (`gradedMap_gradedBracket`).
  Conjugation acts trivially on every `gr_n(G)`, which is the statement
  `lcsGradedMk (g * x * g⁻¹) = lcsGradedMk x` (`lcsGradedMk_conj`, from Tau Ceti's
  `mk_conj_of_mem_pLowerCentralSeries`). Joint continuity of the bracket is owned here.
- **The graded Lie ring.** `⨁ n, gr_n(G)` is a `LieRing` for the degreewise bracket, and the
  functoriality of 3.1 gives a Lie ring homomorphism for every continuous homomorphism.
- **`ℤ_p`-structure.** When `G` is pro-`p`, every `gr_n(G)` is an abelian pro-`p` group, hence a
  topological `ℤ_p`-module by Tau Ceti's `TauCeti.IsProP.module`, with the scalar action given by
  `padicPow`. The class of `x ^[p] u` in `gr_n(G)` is `u • lcsGradedMk x`, and the bracket is
  `ℤ_p`-bilinear: the classes of `⁅x ^[p] u, y⁆` and of `⁅x, y ^[p] u⁆` are the class of
  `⁅x, y⁆ ^[p] u` (`lcsBracket_padicPow_left`, `lcsBracket_padicPow_right`). So `⨁ n, gr_n(G)`
  is a `LieAlgebra ℤ_[p]`.
- **Comparison with the lower `p`-series.** The inclusion `γ_n(G) ≤ λ_n(G)` of 3.1 induces
  `gr_n(G) → TauCeti.gradedPiece p G n`, additive and compatible with the two brackets.
  *Needs:* L3.1; L1.3; TC `TauCeti.gradedPiece`, `TauCeti.gradedMk`, `TauCeti.gradedBracket` and
  their laws, `TauCeti.IsProP.module`; M `Additive`, `DirectSum`, `LieRing`, `LieAlgebra`.

### 3.3 Generation

- **The spanning theorem.** If `S ⊆ G` generates `G` topologically, then for every `n` the
  graded piece `gr_{n+1}(G)` is the topological closure of the subgroup generated by the brackets
  `lcsBracket (lcsGradedMk s) y` for `s ∈ S` and `y ∈ gr_n(G)`. Proof: for fixed `y`, the map
  `g ↦ lcsBracket (lcsGradedMk g) y` is a continuous homomorphism `G → gr_{n+1}(G)`, because
  `⁅g * h, c⁆ = (g * ⁅h, c⁆ * g⁻¹) * ⁅g, c⁆` and conjugation is trivial on `gr_{n+1}(G)`; its
  kernel contains `γ_1(G)`, so it is determined by its values on a topological generating set; and
  `γ_{n+1}(G)` is the closure of the subgroup generated by the commutators `⁅g, c⁆` with
  `c ∈ γ_n(G)`.
- **The finite form.** If `G` is compact and `S` is finite, the closure is superfluous: every
  `z ∈ gr_{n+1}(G)` is a sum `Σ_{s ∈ S} lcsBracket (lcsGradedMk s) (y s)` with one term per
  generator. The set of such sums is the image of the compact group `gr_n(G) ^ S` under a
  continuous additive map, hence closed in the Hausdorff group `gr_{n+1}(G)` (`γ_{n+2}(G)` is
  closed), and the bracket is additive in its second argument.
- **Finite generation of the pieces.** If `G` is a topologically finitely generated pro-`p` group
  then each `gr_n(G)` is a finitely generated `ℤ_p`-module, by induction from the finite form.
  *Needs:* L3.2; M `IsCompact.image`, `Subgroup.closure`.

  ⚠ The spanning theorem is about the closed series and needs no finite generation. The one-term
  form is where finiteness of `S` and compactness of `G` enter. For infinite `S` a graded element
  is a limit of finite sums. Without compactness the one-term form fails: on `ℤ × ℤ² × ℝ` with
  product `(a, b, c)(a', b', c') = (a + a', b + b', c + c' + a (b'₁ + √2 b'₂))`, discrete on the
  integer factors, `gr_1 ≅ ℝ` while every sum of brackets of the three generators lies in
  `ℤ + √2 ℤ`. Tau Ceti's spanning theorems for the lower `p`-series
  (`TauCeti.span_gradedPow_gradedMkZero_union_gradedBracket_eq_top`) assume `p ≠ 0` and an open
  `λ_2`, and do not cover the closed series.

### 3.4 The free pro-`p` group

Write `F = TauCeti.freeProP p (Fin r)`, Tau Ceti's free pro-`p` group, with generators
`x_i := TauCeti.freeProP.of i`; it is pro-`p` (`TauCeti.isProP_freeProP`) and a compact, totally
disconnected topological group by Tau Ceti's instances. Both degrees are proved directly, by
detecting homomorphisms out of `F` supplied by its universal property `TauCeti.freeProP.lift`; no
comparison with the pro-`p` completion of a discrete free nilpotent group is used.

-  **Degree zero.** The classes `x̄_i` form a `ℤ_p`-basis of `gr_0(F)`: the map
  `a ↦ Σ_i [x_i ^[p] a_i]`, `(Fin r → ℤ_[p]) → gr_0(F)`, is a bijection
  (`lcsGradedPiece_zero_freeProP_bijective`), additive because `lcsGradedMk` is. Through
  `lcsGradedPieceZeroEquiv` this identifies `TopologicalAbelianization F` with `ℤ_p ^ r`. *Proof.*
  The map is a continuous homomorphism out of a compact group, and its image contains the classes of
  the topological generators `x_i`, so it is a closed subgroup containing a dense one, hence
  everything. For injectivity, the continuous homomorphism `F → Multiplicative ℤ_[p]` with
  `x_i ↦ ofAdd 1` and `x_k ↦ 1` for `k ≠ i` (`TauCeti.freeProP.lift`; `Multiplicative ℤ_[p]` is
  pro-`p` by Tau Ceti's `isProP_multiplicative_padicInt`) kills `γ_1(F)`, so it factors through
  `gr_0(F)`, and it sends `Σ_k [x_k ^[p] a_k]` to `a_i`, because continuous homomorphisms commute
  with `^[p]` (`map_padicPow`).
-  **The detecting group.** `HeisenbergZp p` is Tau Ceti's Heisenberg group over `ℤ_p`,
  `TauCeti.HeisenbergGroup ℤ_[p]`: triples `(x, y, z)` with
  `(x, y, z) (x', y', z') = (x + x', y + y', z + z' + x y')`. Tau Ceti supplies the group law and
  the commutator formula `⁅(x, y, z), (x', y', z')⁆ = (0, 0, x y' - x' y)`
  (`TauCeti.HeisenbergGroup.commutatorElement_eq`), so `γ_1 = {(0, 0, z)} ≅ ℤ_p` and `γ_2 = 1`. This
  roadmap adds only what the detector needs beyond that: the topology of `ℤ_p³` through
  `TauCeti.HeisenbergGroup.equivProd`, under which it is a compact, totally disconnected topological
  group, and the pro-`p` property: the triples with all coordinates in `p ^ n ℤ_p` form an open
  normal subgroup of index `p ^ (3 n)`, and these form a basis of neighbourhoods of `1`
  (`HeisenbergZp.isProP`). For `i ≠ j`, `TauCeti.freeProP.lift` gives a continuous homomorphism
  `F → HeisenbergZp p` with `x_i ↦ (1, 0, 0)`, `x_j ↦ (0, 1, 0)` and `x_k ↦ 1` otherwise
  (`exists_heisenberg_detect`).
- **Degree one.** The classes `[x̄_i, x̄_j]`, `i < j`, form a `ℤ_p`-basis of `gr_1(F)`: the map
  `c ↦ Σ_{i<j} [⁅x_i, x_j⁆ ^[p] c_ij]` is a bijection (`lcsGradedPiece_one_freeProP_bijective`).
  Equivalently `gr_1(F)` is the exterior square of `gr_0(F)`, a free `ℤ_p`-module of rank
  `r (r - 1) / 2`, with `x̄_i ∧ x̄_j ↦ [x̄_i, x̄_j]`. *Proof.* Surjectivity: by the finite form of
  the spanning theorem (3.3) every element of `gr_1(F)` is `Σ_i [x̄_i, y_i]` with `y_i ∈ gr_0(F)`;
  writing each `y_i` in the basis of degree zero and using `ℤ_p`-bilinearity and alternation, it
  is `Σ_{i<j} c_ij [x̄_i, x̄_j]`. Injectivity: for `i < j` the detecting homomorphism of the pair
  maps `γ_1(F)` into `γ_1 ≅ ℤ_p` and `γ_2(F)` to `1`, so it induces a `ℤ_p`-linear map
  `gr_1(F) → ℤ_p`. That map sends `[x̄_i, x̄_j]` to `1`, because
  `⁅(1, 0, 0), (0, 1, 0)⁆ = (0, 0, 1)`, and every other basis bracket to `0`, because one of its
  generators goes to `1`. So it reads off the coefficient `c_ij`.
- **Nonvanishing.** `[x̄_i, x̄_j] ≠ 0` in `gr_1(F)` for `i ≠ j` (`lcsBracket_freeProP_ne_zero`),
  by the degree-one basis and alternation.
  *Needs:* L3.2, L3.3; L1.3 `padicPow` and `map_padicPow`; TC `TauCeti.freeProP`,
  `TauCeti.freeProP.of`, `TauCeti.freeProP.lift`, `TauCeti.freeProP.lift_of`,
  `TauCeti.isProP_freeProP`, `TauCeti.freeProP.topologicalClosure_closure_range_of_eq_top`,
  `TauCeti.isProP_multiplicative_padicInt`; M `TopologicalAbelianization`, `commutatorElement_def`.
  *Source:* for discrete free groups, where the graded Lie ring of the lower central series is the
  free Lie ring, Magnus–Karrass–Solitar, *Combinatorial Group Theory*, §5.7, and Serre, *Lie
  Algebras and Lie Groups*, Part I, Chapter IV; for free pro-`p` groups, J. Labute, "Algèbres de
  Lie et pro-p-groupes définis par une seule relation", Invent. Math. 4 (1967). The proof above is
  self-contained and is the one this roadmap asks for.

  ⚠ Tau Ceti's `TauCeti.freeProP.degreeOneBasis` is the analogous statement for the lower
  `p`-series over `𝔽_p`, which also contains the `p`-power classes; it is not the `ℤ_p`-basis
  asked for here.

## Worked examples

- `ẑ ≃ ∏_ℓ ℤ_ℓ`, with `ω_2` computed at the levels `2^k` and at an odd level.
- In `Multiplicative ℤ_[3]`: `ofAdd 1 ^ᶻ a = ofAdd (zHat.component 3 a)`.
- In the finite group `Multiplicative (ZMod 6)`: `x ^ᶻ a = x ^ (zHat.toZMod 6 a).val`, so
  `x ^ᶻ ω_2` is the `2`-component of `x`.
- `ContinuousAut (Multiplicative ℤ_[p]) ≃* ℤ_[p]ˣ`, and `ContinuousOut` of an abelian group is
  `ContinuousAut`.
-  For `F = TauCeti.freeProP p (Fin 2)`: `ContinuousAut F →* GL_2(𝔽_p)` is surjective,
  `gr_0(F) = ℤ_p^2` and `gr_1(F) = ℤ_p [x̄_0, x̄_1]`.

## Ordering and parallel work

Layer 0 builds on Tau Ceti's `TauCeti.zHat` alone and comes first. Layer 1 needs 0.1 to 0.3; its
first item, the generalization of the completion universal property in 1.1, is what the rest of
Layer 1 is built on. Layer 2.1 needs nothing beyond Mathlib and can start at once; 2.2 needs Tau
Ceti's topological generation API; 2.3 needs 2.2; 2.4 needs 2.2 and Tau Ceti's Frattini, Burnside
and Hopf theorems. Layers 3.1 and 3.2 consume Tau Ceti's lower `p`-series and need, beyond it,
Layer 2.2's `IsTopCharacteristic` for the characteristic statement and Layer 1.3 for the
`ℤ_p`-statements; 3.3 needs 3.2; 3.4 needs 3.2, 3.3, Layer 1.3 and Tau Ceti's free pro-`p` groups.
Its detecting group is Tau Ceti's algebraic
`TauCeti.HeisenbergGroup ℤ_[p]`, and 3.4 adds the topology, the compactness and total
disconnectedness, and the pro-`p` property that the detection argument uses. Apart from
`IsTopCharacteristic`, Layers 2 and 3 are independent of each other, and both are independent of
Layer 1 except where a `^[ℓ]` statement is involved.

## Acceptance checklist

- There is one profinite-integers object, Tau Ceti's `TauCeti.zHat`. The ring structure lives on
  `Additive TauCeti.zHat`, with `a * b = TauCeti.zHat.lift a b`, and the ring axioms, the ring
  topology and the inverse-limit description by the `ZMod n` are theorems about that carrier; no
  second carrier and no comparison isomorphism between carriers exists.
- The universal property of profinite completion and `TauCeti.zHat.lift` are generalized in place
  to profinite targets in every universe. There is one lift, and `zHat.lift_eq_tauCeti` says that
  on targets in `Type` it is the existing one.
- `component ℓ` is a ring homomorphism that agrees with Tau Ceti's
  `TauCeti.zHat.maximalProPQuotientEquivPadicInt`, and `ẑ ≃ ∏_ℓ ℤ_ℓ` is an isomorphism of
  topological rings.
- `x ^ᶻ a` is `TauCeti.zHat.lift x` applied to `a`, not a second powering construction, and
  `(x ^ᶻ a) ^ᶻ b = x ^ᶻ (a * b)` is proved against the ring product of Layer 0.
- `padicPow` is Tau Ceti's `TauCeti.IsProP.padicPow`, not a second construction; it is stated only
  on pro-`ℓ` groups with `[Fact ℓ.Prime]`, and its comparison with `^ᶻ` goes through
  `component ℓ` and Tau Ceti's identification of the maximal pro-`ℓ` quotient of `TauCeti.zHat`.
- Pro-`p` groups, the pro-`p` kernel and Frattini subgroup, topological finite generation and free
  pro-`p` groups are Tau Ceti's declarations, used directly; nothing is taken from
  ProfiniteProPGroups' `Suggested.lean`.
- `ContinuousAut G` is a group by composition with `(φ * ψ) x = φ (ψ x)`; `conj g x = g * x * g⁻¹`.
- The closedness of conjugate pairs in a compact, totally disconnected group is the exported
  binary theorem `isClosed_isConj_pair` on `G × G`, and `ContinuousAut.isClosed_isConj` is its
  preimage along `φ ↦ (φ x, y)`, not a separate argument.
- `mapQuotient` is pinned by its value on classes, and `outerAction_mk` chooses one conjugating
  automorphism for all of `N`.
- Profiniteness of `ContinuousAut G` is stated for a topologically finitely generated profinite
  `G` and nowhere else.
- The finite `p`-group theorem of 2.4 is proved by the free action on generating tuples, and
  the pro-`p` theorem is its inverse limit.
- The congruence topology is the initial topology for the **discrete** topology `⊥` on each
  finite automorphism group, and `ContinuousAut.continuous_mapQuotient` says so.
- The closed lower central series is Tau Ceti's lower `p`-series at `p = 0`, 0-based, and no
  milestone claims openness or finiteness of a quotient by it.
- `gr_0(G)` and Mathlib's `TopologicalAbelianization G` are related by the named topological
  isomorphism `lcsGradedPieceZeroEquiv`, pinned on classes, not by an unstated identification.
- The spanning theorem is stated for arbitrary topological generating sets, and its one-term form
  for finite ones in a compact group.
- The descents `ContinuousAut.mapClosedQuotient` and `ContinuousOut.mapClosedQuotient` to closed
  characteristic quotients, and the action of `ContinuousOut G` on
  `ClosedSubgroupConjClasses G`, are pinned declarations with computation theorems.
- The topological characteristicity of `TauCeti.proPKernel` and `TauCeti.proPFrattini` is Tau
  Ceti's, applied directly; the Heisenberg group is Tau Ceti's, and only its topology is added
  here.
- `gr_0` and `gr_1` of a free pro-`p` group of finite rank have the bases `x̄_i` and
  `[x̄_i, x̄_j]` (`i < j`) by theorems proved with detecting homomorphisms, to `ℤ_p` and to the
  Heisenberg group over `ℤ_p`; no comparison with the completion of a discrete free nilpotent
  group is left implicit.

## References

- L. Ribes, P. Zalesskii, *Profinite Groups*, 2nd ed., Ergebnisse 40, Springer 2010: §4.1 for
  powers with exponents in `ẑ`, §4.3 for profinite abelian groups, §4.4 for the automorphism group
  of a profinite group, §4.5 for the automorphism group of a free pro-`p` group, Prop. 2.5.2 for
  the Hopf property and Prop. 2.8.7 for the Frattini generation statement consumed from Tau
  Ceti.
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
- The `FLT` formalization project's `ZHat`, the same ring presented by compatible residues in
  `∏ n, ZMod n`; Layer 0.2 characterizes `ẑ` by that presentation.
