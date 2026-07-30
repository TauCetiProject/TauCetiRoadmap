# Roadmap: pro-p and Demushkin groups

Mathlib has the category of profinite groups with limits, the finite-quotient limit
description, the profinite completion of an abstract group with its adjunction, and Galois
groups as profinite groups — and essentially **nothing beyond that**: no pro-`p` groups, no
supernatural orders, no profinite Sylow theory, no topological Frattini/generation theory, no
free profinite or free pro-`p` groups, no presentations of profinite groups, and nothing on
Demushkin groups or profinite Poincaré duality (audit below). We build here the complete
basic theory of profinite and pro-`p` groups — order and index, Sylow subgroups, Frattini
and generation theory, free pro-`p` groups, presentations and their generator/relator ranks,
the pro-`p` part of cohomological-dimension theory — and carry it to two summits: the
**classification of Demushkin groups** (Demushkin, Serre, Labute) with its orientation
theory, and the **structure of the Galois group `G_K(p)` of the maximal `p`-extension of a
`p`-adic field** (Shafarevich free case, Demushkin case with cyclotomic orientation).

Suggested home: `TauCeti/GroupTheory/Profinite/` for Layers 0–3 (foundations, order, Sylow,
pro-`p`/Frattini/generation — parallel to Mathlib's `GroupTheory/` for the abstract half and
`Topology/Algebra/` for the topological half, which is where Mathlib keeps `OpenSubgroup`,
`ClosedSubgroup`, and `ClopenNhdofOne`), and `TauCeti/GroupTheory/ProP/` for Layers 4–11
(free pro-`p`, presentations, cd, Demushkin, classification, the local instance), with the
Demushkin material in `TauCeti/GroupTheory/ProP/Demushkin/`. The category-level statements
(limits, completion) stay phrased against Mathlib's `ProfiniteGrp`.

This roadmap is one of four coordinated roadmaps (with
[continuous cohomology of profinite groups](../ProfiniteCohomology/README.md),
[local fields and local class field theory](../LocalFields/README.md), and
[quadratic form invariants](../QuadraticFormInvariants/README.md), all in preparation)
whose combined target is the reusable foundation under the `G_{ℚ₂}` presentation project
(`roed-math/gq2-lean`, <https://roed314.github.io/gq2/>); its axiom B3c — the identification
`G_{ℚ₂}(2) ≅ D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩` with cyclotomic orientation — is the worked
acceptance instance of Layers 7–11. The roadmap itself is intrinsic mathematics: the theory
below is stated and built for its own sake, and `gq2` appears only as a migration source
(provenance section) and as acceptance criteria. **Scope note:** the peripheral Galois
action / étale `π₁` / thrice-punctured-line material (`gq2`'s B8) is deliberately excluded;
it is a separate, gated, future roadmap.

## Standing hypotheses and pinned conventions

- **Profinite idiom.** State theorems against the unbundled type-class stack
  `[Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]`, following what Mathlib itself does at the pin
  (`ProfiniteGrp.of` takes exactly these; `Mathlib/FieldTheory/Galois/Profinite.lean` and
  `Mathlib/Topology/Algebra/ClopenNhdofOne.lean` state their theorems this way). Do **not**
  add `[T2Space G]`: total disconnectedness makes points closed, and a T1 topological group
  is T2, so the hypothesis is derivable — prove that instance chain early (Layer 0) rather
  than carrying the redundancy. Use the bundled category `ProfiniteGrp` only where a
  categorical construction demands it (limits, the completion functor, diagrams); provide
  unbundled restatements of anything a non-categorical consumer needs.
- **Pro-`p`, quotient form.** `IsProP p G := ∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U)`
  — every continuous finite quotient is a `p`-group. This is the pinned *definition*; the
  inverse-limit description (`G` pro-`p` ⟺ `G ≅ lim` of finite `p`-groups) is a Layer 3
  milestone, not the definition. Rationale: the quotient form is a bare `Prop` over the
  unbundled stack, is what every kernel-containment argument uses directly, and matches
  Mathlib's `IsPGroup` vocabulary.
- **Order and index: supernatural numbers, introduced.** We introduce supernatural
  (Steinitz) numbers — `Supernatural := Nat.Primes → ℕ∞` — as a Layer 1 object, with the
  order of a profinite group and the index of a closed subgroup taking values there. This is
  the literature's vocabulary (Ribes–Zalesskii §2.3) and the only clean home for "index
  prime to `p`" for closed (not open) subgroups. Load-bearing early theorems are *also*
  stated per-open-subgroup with Mathlib's `Nat.card`-valued `Subgroup.index` (as in the
  Sylow definition below), so that Layers 2–3 do not block on the Layer 1 calculus;
  the supernatural statements are the pinned final forms.
- **Commutator convention.** Classification normal forms follow Labute:
  `(x, y) = x⁻¹y⁻¹xy` (Labute 1967, p. 106; same as NSW III and Koch/RZ's `[g, h]`).
  Mathlib's `⁅x, y⁆ = xyx⁻¹y⁻¹` is the other convention; the two generate the same
  subgroups (`(x, y) = ⁅x⁻¹, y⁻¹⁆`), so subgroup-level statements (lower `p`-series,
  commutator subgroups) use Mathlib's bracket, while element-level relator words are
  written out explicitly in Labute's form. Never let the two mix silently in one statement.
  ⚠ Serre's Bourbaki exposé uses the **opposite** convention (`(x, y) = xyx⁻¹y⁻¹`), and
  NSW VII (7.5.14) yet another; NSW remark (2nd ed., printed p. 419) that the normal-form
  shapes are insensitive because they agree mod `F₃` — cite each source's exact form,
  never a mixture.
- **Topological generation and `d(G)`.** `IsTopologicallyFinitelyGenerated G :=
  ∃ s : Finset G, (Subgroup.closure ↑s).topologicalClosure = ⊤`. This exact shape is a
  contract: the [LocalFields](../LocalFields/README.md) roadmap's finite-generation theorem
  for `G_K` (its B1 layer) produces it, and the reconstruction theorem (Layer 8) consumes
  it. Define `d(G) : ℕ∞` as the infimum of the cardinalities of finite topological
  generating sets (`⊤` allowed, value `∞` when none exists); the identity
  `d(G) = dim_{𝔽_p} H¹(G, 𝔽_p)` for pro-`p` `G` is a Layer 5 **theorem** (via the Burnside
  basis theorem), not the definition.
- **Frattini subgroup.** For a pro-`p` group, `Φ(G)` is pinned as the intersection of the
  open normal subgroups of index `p`; that it equals the intersection of the maximal open
  subgroups, and equals `closure (Gᵖ[G,G])`, are Layer 3 milestones. Mathlib's abstract
  `frattini G` (the intersection of *all* maximal subgroups, `Order.radical`) is a different
  object in general — abstract maximal subgroups of a pro-`p` group need not be open when
  `G` is not finitely generated — so do not identify the two except as a theorem where true.
- **Presentation formalism.** A presentation of a pro-`p` group `G` is a continuous
  surjection `π : F ↠ G` from a free pro-`p` group with `R = ker π` (automatically closed);
  a presentation *by relators* takes `R` to be the **closed** normal closure of a relator
  set (the algebraic normal closure need not be closed — always close). A presentation is
  **minimal** when `R ≤ Φ(F)`, equivalently when `rank F = d(G)`. The relation rank `r(G)`
  is defined as `dim_{𝔽_p} H²(G, 𝔽_p)`; that a minimal presentation needs exactly `r(G)`
  relators (`R` is generated as a closed normal subgroup by `dim H¹(R, 𝔽_p)^F = r(G)`
  elements, via the five-term sequence) is the Layer 5 presentation-independence theorem.
- **Demushkin predicate.** A pro-`p` group `G` is **Demushkin** when (with `𝔽_p = ZMod p`
  trivial coefficients, cohomology from
  [ProfiniteCohomology](../ProfiniteCohomology/README.md)):
  (1) `dim_{𝔽_p} H¹(G, 𝔽_p) < ∞`, (2) `dim_{𝔽_p} H²(G, 𝔽_p) = 1`, (3) the cup product
  `H¹ × H¹ → H²` is a nondegenerate bilinear form. Exactly Labute's definition (p. 106).
  Finite generation is **derived** (clause 1 + Burnside basis), not assumed. Nondegeneracy
  is stated two-sidedly unless graded-commutativity of the cup product is available from
  ProfiniteCohomology, in which case one side suffices; state which. **Rank-1 and
  degenerate conventions, pinned:** `n = 1` is allowed by the definition and `ℤ/2` (at
  `p = 2`) is the unique finite Demushkin group and the unique rank-1 one (for `p` odd the
  cup square on a 1-dimensional `H¹` is alternating, hence zero, so no rank-1 examples
  exist); `ℤ_p` is **not** Demushkin (`H² = 0`; it is free pro-`p` of rank 1, the `PD¹`
  group), and no theorem here adopts the occasional literature convention that smuggles it
  in. Labute's normal-form theorems require `n ≥ 2` (case `q ≠ 2`) or hold vacuously/
  separately at `n = 1`; each classification statement below carries its honest `n`
  hypothesis.
- **The `q`-invariant and the orientation, Labute's normalizations.** For a Demushkin group,
  `G^{ab} := G ⧸ closure [G,G]` (the *topological* abelianization) satisfies
  `G^{ab} ≅ ℤ_p^{n-1} × ℤ_p/qℤ_p` with `q = q(G)` a power of `p` or `0`; **`q = 0` is
  Labute's `p^∞` convention for the torsion-free case** and is encoded as the literal `0`.
  The **canonical character** (Serre's invariant): there is a *unique* continuous
  homomorphism `χ : G → ℤ_pˣ` such that, letting `I(χ)` denote `ℤ_p` with `G` acting by
  `g · x = χ(g)x`, the maps `H¹(G, I/p^i I) → H¹(G, I/pI)` are surjective for all `i ≥ 1`
  (Labute Prop. 6 and Thm 4; equivalently, values of continuous crossed homomorphisms into
  `I(χ)` can be prescribed arbitrarily on a minimal generating set). Then
  `Im χ ⊆ ℤ_pˣ` is a closed subgroup, an isomorphism invariant, and `q(G)` is the largest
  `p`-power `q` with `Im χ ⊆ 1 + qℤ_p` (Labute, Corollary to Thm 4). For infinite `G`
  (⟺ `n ≠ 1`), `cd_p G = 2` (Tate) and `χ` is exactly the action on the dualizing module
  `I(G) ≅ ℚ_p/ℤ_p` — the `PD²` framing below. **`q = 2` versus `q = 2^f`:** when
  `q ≠ 2` the pair `(n, q)` is a complete invariant and `Im χ = 1 + qℤ_p`; when `q = 2`
  (only possible for `p = 2`) it is not, and the classification is by `(n, Im χ)`, where
  the possible images are read off the closed-subgroup trichotomy of
  `ℤ₂ˣ = {±1} × (1 + 4ℤ₂)`: the subgroups `U^(f) = 1 + 2^f ℤ₂` (`f ≥ 2`, or `f = ∞`
  meaning `{1}`), `{±1} × U^(f)`, and `U^[f] = closure ⟨-1 + 2^f⟩` (`2 ≤ f < ∞`,
  procyclic) — Labute's Remark after the Corollary to Thm 4. All statements use these
  normalizations; do not substitute other parametrizations of the image.
- **Free pro-`C` generality, decided up front.** The core layers (4–9) build free pro-`p`
  (and where stated free pro-`C` for a variety-like class `C` of finite groups closed under
  subgroups, quotients, and extensions — pin the class formalism as a `Prop`-valued
  predicate on finite groups with those three closure properties) **on finite generating
  sets** (`Fin n` and finite types): that is what presentations, Demushkin theory, and the
  arithmetic instances need. The free pro-`C` group on a general **profinite space** (basis
  converging to 1) is Layer 10 — a definite later layer, not an afterthought: its universal
  property quantifies over continuous maps `X → P` from the profinite space, it recovers
  the finite-set object on discrete finite `X`, and it is required for infinite-rank
  subgroup theory (closed subgroups of free pro-`p` groups). For an *infinite discrete set*
  the profinite completion of the discrete free group is the "free pro-`p` group on the
  abstract set" (all maps classify) and differs from the converging-to-1 object; the
  finite-set core avoids the ambiguity, and Layer 10 states both and relates them.
- **Naming.** `IsProP`, `IsTopologicallyFinitelyGenerated`, `proPKernel`, `proPFrattini`,
  `Supernatural`, `profiniteOrder`, `IsProPSylow`, `pLowerCentralSeries` (0-based, matching
  Mathlib's `lowerCentralSeries`; Labute's `F_i` is index `i - 1`), `freeProfiniteGroup`,
  `freeProP`, `presentedProP`, `topAbelianization`, `IsDemushkin`, `demushkinQ`,
  `demushkinCharacter`. `Suggested.lean` pins the forms.

## What Mathlib already has (consume)

At the build pin (`9caeba1000`, 2026-06-03):

- **The `ProfiniteGrp` category:** `Mathlib/Topology/Algebra/Category/ProfiniteGrp/Basic.lean`
  (Guan–Zhang–Zhao: the category, `of`, `ofFiniteGrp`, `ofClosedSubgroup`, `pi`, limits via
  `limitCone`/`limitConeIsLimit`), `Limits.lean` (every profinite group is the limit of its
  finite quotients: `toLimit_surjective`/`toLimit_injective`,
  `continuousMulEquivLimittoFiniteQuotientFunctor`), and `Completion.lean` (A. Topaz, Feb
  2026: `ProfiniteGrp.completion` over `FiniteIndexNormalSubgroup G`, the unit `eta`,
  `denseRange`, `mono_eta_iff_residuallyFinite`, `lift`, and the adjunction
  `profiniteCompletion ⊣ forget₂`). Consume all of it; the free profinite group *is*
  `profiniteCompletion` applied to a free group.
- **Subgroup infrastructure:** `Mathlib/Topology/Algebra/OpenSubgroup.lean` (`OpenSubgroup`,
  `OpenNormalSubgroup`, clopenness, `Finite (G ⧸ U)` on compact groups),
  `Mathlib/Topology/Algebra/Group/ClosedSubgroup.lean` (`ClosedSubgroup`,
  `normalCore_isClosed`, closed + finite index ⟹ open),
  `Mathlib/Topology/Algebra/ClopenNhdofOne.lean`
  (`exist_openNormalSubgroup_sub_open_nhds_of_one` — the open-normal neighborhood basis —
  and `closedSubgroup_eq_sInf_open` — a closed subgroup of a profinite group is the
  intersection of the open subgroups above it), `Subgroup.topologicalClosure` and its
  normality (`Mathlib/Topology/Algebra/Group/Basic.lean`).
- **Galois groups as profinite groups:** `Mathlib/FieldTheory/KrullTopology.lean`
  (`krullTopology`, T2, total separatedness), `Mathlib/FieldTheory/Galois/Profinite.lean`
  and `Infinite.lean` (`Gal(K/k) ≅ lim` finite Galois groups, `CompactSpace` instance) —
  the instances that make every Galois group a customer of this roadmap.
- **Finite group theory:** `Mathlib/GroupTheory/Sylow.lean` (finite Sylow theory — the
  levelwise input to Layer 2), `PGroup.lean` (`IsPGroup`), `Mathlib/GroupTheory/Frattini.lean`
  (abstract `frattini G` as `Order.radical`, `frattini_nongenerating`, `frattini_nilpotent`
  — consumed at the finite levels; see the convention above for why it is not the pro-`p`
  Frattini subgroup), `Nilpotent.lean` (`lowerCentralSeries` — the naming model for the
  lower `p`-series), `Index.lean` (`Subgroup.index`, `relindex` — `Nat.card`-valued),
  `Finiteness.lean` + `Rank.lean` (`Group.FG`, `Group.rank`), `PresentedGroup.lean` and
  `FreeGroup/` (the discrete objects we complete), `ResiduallyFinite.lean`
  (`Group.ResiduallyFinite`, used by the completion API).
- **`p`-adics:** `Mathlib/NumberTheory/Padics/` (`ℤ_[p]`, `ℤ_[p]ˣ`, `toZModPow`) — the home
  of the orientation character's target; `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean`
  (`cyclotomicCharacter L p : (L ≃+* L) →* ℤ_[p]ˣ`) — the arithmetic summit's character.
- **Discrete group cohomology:** `Mathlib/RepresentationTheory/Homological/GroupCohomology/`
  (`H1`, `H2`, `LowDegree`, `Functoriality`, `Shapiro`, long exact sequences — for
  *discrete* groups). Useful for finite-level computations; the continuous theory is the
  ProfiniteCohomology sibling's subject, not ours and not this.

**On master since the pin (track, flag refactor-onto milestones):** continuous cohomology
exists as `Mathlib/RepresentationTheory/Homological/ContCohomology/{Basic,Functoriality,LowDegree}.lean`
(R. Hill, A. Yang, E. Xie; PRs #41144 merged 2026-07-02, #41309 merged 2026-07-03), with
all-degrees `continuousCohomology` via the coinduced resolution but explicit `H⁰` only; open
PRs #41545 (inflation maps, rmhi, 2026-07-11) and #41539 (functoriality refactor, rmhi,
updated 2026-07-27); cup products exist only in FLT staging
(`FLT/Mathlib/.../ContCohomology/CupProduct.lean`, E. Xie, FLT#1098, 2026-07-10). The
[ProfiniteCohomology](../ProfiniteCohomology/README.md) roadmap owns the interface to this
line of work; every cohomological statement below is written against *its* API, and
refactors onto Mathlib's `ContCohomology` land there, not here. Also relevant on master:
`ProfiniteGrp` additivization (#39973, T. Browning, 2026-06-19). Open PRs to watch:
**#35603** (Frattini extras for finite `p`-groups including the elementary-abelian Frattini
quotient — exactly the finite half of our Layer 3; coordinate and consume when it lands),
**#42200** (`IsMulFG` unification, tb65536 — the substrate a Mathlib-native
"topologically f.g." would sit on), **#41961** (Iwasawa algebra of measures on profinite
groups, D. Loeffler — adjacent to the completed group algebra `ℤ_p[[G]]` that Layer 9's
`q = 2` arguments use; coordinate before building any `ℤ_p[[G]]`).

## What is missing (build here)

Everything pro-`p`. At the pin **and on master** there is no pro-`p` predicate, no
supernatural order or index, no profinite Sylow theory, no topological finite generation,
no pro-`p` Frattini theory or Burnside basis theorem, no free profinite or free pro-`p`
groups (the completion functor exists but is never applied to free groups), no profinite
presentations, no Hopfian/Gaschütz/reconstruction theory, no lower `p`-series, no
cohomological-dimension results for pro-`p` groups, no Demushkin theory, and no profinite
duality groups (verified against master `ccedd50412`, 2026-07-30; "Demushkin" has zero PRs
in any state). The Zulip archive shows no one building or claiming any of it (the only
pro-`p` design artifact on Zulip is a sketch of a pro-`p` `GroupFilterBasis` in the
Dec 2024 "Refactor `krullTopology`?" thread, never landed). External-repo audit and the
one overlap (a brand-new AI-generated pro-`C` library) are in the coordination section.

---

## The build, in layers

The ordering is the dependency order. As each layer makes the next layer's *types*
expressible in `TauCeti/`, state its milestones in `Suggested.lean` (with `sorry`).
Layers 5–7, 9, and 11 have cohomological statements that consume the
[ProfiniteCohomology](../ProfiniteCohomology/README.md) roadmap (H¹, H², cup products,
five-term exact sequence, cd formalism); their non-cohomological substatements do not block
on it.

### Layer 0: profinite foundations

- **The instance chain.** Totally disconnected topological groups are T1 (components are
  closed), hence T2, hence T3; a compact totally disconnected group is profinite in every
  sense already in Mathlib. Prove the missing glue instances once, so no statement ever
  carries `[T2Space G]` redundantly.
- **Quotients.** For `G` profinite and `N` a *closed* normal subgroup, `G ⧸ N` is profinite:
  the missing ingredient is `TotallyDisconnectedSpace (G ⧸ N)` (clopen-image basis
  argument); package with the (existing) compactness and topological-group instances.
  ⚠ Closedness of `N` is essential and must be a hypothesis, not an afterthought: quotients
  by non-closed subgroups are not even T1.
- **Closed and open subgroups.** Closed subgroups of profinite groups are profinite
  (instances exist — assemble); an element lying in every open normal subgroup is `1`;
  consume `closedSubgroup_eq_sInf_open`; open ⟺ closed of finite index; the correspondence
  between open normal subgroups of `G ⧸ N` and open normal subgroups of `G` above `N`.
- **Inverse limits, unbundled.** Consume `ProfiniteGrp.Limits`; provide the unbundled
  workhorse: a compatible family of elements of the finite quotients of `G` comes from a
  unique element (surjectivity/injectivity of `toLimit`, restated for consumers outside the
  category), and the compactness lemma "a directed family of nonempty closed subsets of a
  profinite set has nonempty intersection" in the exact König form Layer 8 uses.
- **Profinite completion.** Consume `ProfiniteGrp.ProfiniteCompletion` wholesale. Add: the
  unbundled universal property (continuous homs from the completion to a profinite `P`
  biject with abstract homs from `G`); the unit is bijective on a finite group
  (`Suggested.lean`); the completion of a topologically finitely generated profinite group's
  underlying abstract group — do **not** develop; instead record the warning that abstract
  homs out of profinite groups need not be continuous, so the completion of the *abstract*
  underlying group is generally larger (Nikolov–Segal territory, out of scope).
- **Countability.** Where a theorem genuinely needs a countable neighborhood basis (the
  diagonal/König arguments of Layer 8 as usually written), state the hypothesis as
  "countably many open normal subgroups" and prove it for topologically finitely generated
  profinite groups (finitely many open subgroups of each index — Layer 3) rather than
  assuming second countability ambiently. ⚠ No global second-countability hypotheses:
  absolute Galois groups of general fields are not second countable, and every foundation
  layer must apply to them.

### Layer 1: supernatural order and index

- **Supernatural numbers.** `Supernatural := Nat.Primes → ℕ∞` with: divisibility (pointwise
  `≤`), multiplication (pointwise `+`), `lcm`/`gcd` (pointwise `⊔`/`⊓`), the embedding
  `ℕ+ → Supernatural` by prime factorization (`padicValNat`), "is a natural number"
  (finitely supported with finite values), and `p`-primary / prime-to-`p` parts. This is
  order theory on exponent functions; keep it computation-friendly.
- **Order of a profinite group.** `profiniteOrder G : Supernatural`, at each prime the
  supremum of the valuations of the finite quotient orders. Compatibility: on a finite
  (discrete) group it is the factorization of `Nat.card G` (`Suggested.lean`).
- **Index of a closed subgroup.** `profiniteIndex H G` for closed `H ≤ G` via the images in
  finite quotients (equivalently `lcm` over open `U ⊇ H` of `[G : U]`); agreement with
  `Subgroup.index` for open `H`; **Lagrange**:
  `profiniteOrder G = profiniteOrder H * profiniteIndex H G` (Ribes–Zalesskii §2.3);
  multiplicativity of the index in towers `K ≤ H ≤ G` of closed subgroups.
- **Pro-`p` ⟺ order a power of `p`** (`Suggested.lean`), and `H` open ⟺ closed of finite
  (natural-number) index, restated supernaturally.

### Layer 2: profinite Sylow theory

- **Definition.** `IsProPSylow p P`: `P` closed, pro-`p` (subspace), and of index prime to
  `p` — per-quotient form in `Suggested.lean`, supernatural form
  (`¬ p ∣ profiniteIndex P G`) proved equivalent here.
- **Existence.** Every profinite group has a `p`-Sylow subgroup: the sets of Sylow
  `p`-subgroups of the finite quotients form a surjective inverse system of nonempty finite
  sets; apply the Layer 0 compactness lemma. (Consume `Mathlib/GroupTheory/Sylow.lean` at
  the finite levels.)
- **Conjugacy and the poset.** Any two `p`-Sylow subgroups are conjugate (same inverse-limit
  argument over the finite conjugating sets); every closed pro-`p` subgroup is contained in
  a `p`-Sylow subgroup; a pro-`p` subgroup of index prime to `p` is maximal pro-`p`, and
  conversely a maximal closed pro-`p` subgroup is `p`-Sylow.
- **Functoriality.** The image of a `p`-Sylow subgroup under a continuous surjection is
  `p`-Sylow; the `p`-Sylow subgroup of an inverse limit is an inverse limit of `p`-Sylow
  subgroups. This is the clean citable target the
  [LocalFields](../LocalFields/README.md) roadmap consumes for wild inertia (the `p`-Sylow
  of the inertia/ramification groups); keep its statement free of any Galois vocabulary.
- **Worked instances** (`Suggested.lean`): the Galois group of any Galois extension has
  `p`-Sylow subgroups; every `p`-Sylow subgroup of `ℤ̂ = completion ℤ` is topologically
  isomorphic to `ℤ_p`.

### Layer 3: pro-`p` groups, the maximal pro-`p` quotient, Frattini theory, generation

- **The `IsProP` API.** Stability under closed subgroups, quotients by closed normal
  subgroups, finite products, inverse limits; the **equivalence milestone**: a profinite
  group is pro-`p` iff it is (continuously isomorphic to) a limit of finite `p`-groups —
  via `ProfiniteGrp.Limits` and `ofFiniteGrp`.
- **The maximal pro-`p` quotient.** `proPKernel p G` (intersection of open normals with
  `p`-group quotient; closed, normal), `G(p) := G ⧸ proPKernel p G`; `G(p)` is pro-`p`
  (compactness: an open normal `⊇` the kernel contains a member of the defining family);
  the universal property (continuous maps to pro-`p` groups factor uniquely; both in
  `Suggested.lean`); idempotence on pro-`p` groups; functoriality in `G`.
- **Topological generation.** `Subgroup.topologicalClosure`-based generation API;
  `IsTopologicallyFinitelyGenerated` (pinned shape above); generation passes along
  continuous surjections; `d(G) : ℕ∞` and its monotonicity under quotients.
- **Finitely many open subgroups of each index.** A topologically finitely generated
  profinite group has finitely many open subgroups of each index (finitely many continuous
  maps to each finite group). Consequences: the open normal subgroups are countable
  (Layer 0's countability hypothesis holds). Companion bound: an open subgroup `U` of a
  topologically finitely generated profinite group is topologically finitely generated,
  with `d(U) ≤ 1 + [G : U](d(G) - 1)` (the Schreier bound; RZ Cor. 3.6.3) — equality is
  the free case, Layer 6.
- **Hopf property.** A continuous surjective endomorphism of a topologically finitely
  generated profinite group is an isomorphism (`Suggested.lean`) — the endgame of Layer 8.
- **Gaschütz lifting.** Along a continuous surjection of profinite groups, an `n`-tuple
  topologically generating the target lifts to an `n`-tuple topologically generating the
  source, provided the source is topologically generated by `n` elements
  (`Suggested.lean`). Nakayama-style corollary: for a quotient map with kernel inside
  `Φ(G)`, generators lift verbatim.
- **Frattini theory for pro-`p` groups.** For pro-`p` `G`: maximal open subgroups are
  normal of index `p` (finite `p`-group input: maximal subgroups of a finite `p`-group are
  normal of index `p` — consume/complete Mathlib's `Frattini.lean` and coordinate with
  PR #35603); `proPFrattini p G` (index-`p` form) equals the intersection of maximal open
  subgroups and equals `closure (Gᵖ[G,G])` (`Suggested.lean`); the Frattini quotient
  `G/Φ(G)` is elementary abelian, an `𝔽_p`-vector space.
- **Burnside basis theorem.** Elements generate `G` topologically iff their images span
  `G/Φ(G)`; the index-`p` detection form (a closed subgroup contained in no open normal
  subgroup of index `p` is everything) and the surjectivity criterion for continuous
  homomorphisms (surjective onto every index-`p` quotient ⟹ surjective) — both in
  `Suggested.lean`; `G` topologically finitely generated ⟺ `G/Φ(G)` finite
  (`Suggested.lean`), and then `d(G) = dim_{𝔽_p} G/Φ(G)`.
  ⚠ **Abstract versus topological generation:** all statements are about *topological*
  generation; the Frattini quotient argument is exactly why the two agree numerically for
  pro-`p` groups, but never conflate the closures. Sanity example: `d = 2` for
  `ℤ/4 × ℤ/2` (`Suggested.lean`, via `Group.rank` on the finite instance).

### Layer 4: free pro-`p` (and pro-`C`) groups on finite sets

- **Construction.** `freeProfiniteGroup X := profiniteCompletion (FreeGroup X)`;
  `freeProP p X` its maximal pro-`p` quotient (equivalently the pro-`p` completion);
  `freeProC` for a class `C` (closed under subgroups, quotients, extensions) via the
  completion over `C`-quotients. The pro-`C` class formalism is decided here once:
  a structure/predicate on `Set (FiniteGrp)`-like data with the three closure properties,
  instantiated at `p`-groups; do not fork per-class constructions.
- **Universal property.** Maps `X → P` into pro-`p` profinite `P` extend uniquely to
  continuous homomorphisms (`Suggested.lean`); uniqueness of the free object up to unique
  isomorphism; functoriality in `X`.
- **Basics.** `freeProP p X` is pro-`p`, topologically finitely generated for finite `X`
  (`Suggested.lean`), of rank `|X|`: `d(freeProP p (Fin n)) = n` via the Frattini quotient
  `(ℤ/p)ⁿ` (Layer 3). The generators are a basis: free groups are **residually `p`**, so
  `FreeGroup X → freeProP p X` is injective (`Suggested.lean`; the classical
  finite-`p`-quotient separation argument, e.g. via the finite Heisenberg/upper-triangular
  representations or the lower `p`-series of the discrete free group).
- **Small instances.** `freeProP p (Fin 0) ≅ 1`, `freeProP p (Fin 1) ≅ ℤ_p` (as topological
  groups; `Multiplicative ℤ_[p]`) — the second is the bridge to every `ℤ_p`-quotient
  argument in Layer 9.

### Layer 5: presentations and the rank interpretations

Cohomological statements here consume [ProfiniteCohomology](../ProfiniteCohomology/README.md)
(H¹, H² of profinite groups with `𝔽_p` and finite discrete coefficients, inflation,
restriction, transgression, the five-term exact sequence of a closed normal subgroup).

- **Presentations.** `presentedProP p X rels` (free pro-`p` mod closed normal closure of
  relators); every pro-`p` group has a presentation; a presentation with
  `rank F = d(G) < ∞` exists (minimal presentation) and is characterized by
  `R ≤ Φ(F)`. Non-vacuity: `D₀` (below) is nontrivial, pro-`2`, topologically finitely
  generated (`Suggested.lean`).
- **`H¹` interpretation.** `H¹(G, 𝔽_p) ≅ Hom_cont(G, 𝔽_p) ≅ (G/Φ(G))^∨`, so
  `d(G) = dim H¹(G, 𝔽_p)` (the Burnside basis theorem in cohomological clothes; Labute
  §1.3, Serre CG I §4.2).
- **`H²` interpretation.** For a minimal presentation `1 → R → F → G → 1`: transgression
  `H¹(R, 𝔽_p)^F → H²(G, 𝔽_p)` is an isomorphism (five-term sequence plus `H²(F) = 0`,
  which is Layer 6's freeness input, stated here as a forward reference *target*, proved
  there); `H¹(R, 𝔽_p)^F` is dual to `R/Rᵖ[R,F]`, whose dimension is the minimal number of
  generators of `R` as a closed normal subgroup (Labute §1.4). Hence
  `r(G) = dim H²(G, 𝔽_p)` counts relations, **independently of the chosen minimal
  presentation** — the presentation-independence theorem.
- **Deficiency and one-relator groups.** `def(G) = d(G) - r(G)` for finitely presented
  pro-`p` `G` (NSW (3.9.4): a finite relation system exists iff `H²` is finite, and then
  `#S - #R ≥ d - r` with equality for minimal); `r(G) = 1` ⟺ one-relator minimal
  presentations; a Demushkin group is a one-relator pro-`p` group with the relator in
  `Fᵖ[F,F]` (setup for Layer 7).
- **The Golod–Shafarevich inequality.** For a nontrivial finite `p`-group,
  `r(G) > d(G)²/4` (NSW (3.9.7), RZ Thm. 7.8.5) — the deficiency theory's classical
  capstone, and the reason finite `p`-groups need many relations. It closes this layer;
  nothing downstream here consumes it, so it can land late within the layer.
- **Sanity example.** `d((ℤ/p)ⁿ) = n`, `r((ℤ/p)ⁿ) = n(n+1)/2` — the elementary-abelian
  count that keeps the `H²` normalization honest.

### Layer 6: cohomological dimension of pro-`p` groups

The general `cd_p` formalism (definition via vanishing of `H^n` on `p`-torsion discrete
modules, dimension shifting, `cd` of closed subgroups, spectral-sequence generalities)
belongs to [ProfiniteCohomology](../ProfiniteCohomology/README.md); this layer owns the
pro-`p`-specific theorems, stated against that formalism.

- **Free ⟹ `cd ≤ 1`.** `H²(F, M) = 0` for `F` free pro-`p` and `M` finite discrete
  `p`-torsion: freeness gives the lifting property against finite `p`-group extensions
  (universal property + Frattini/Burnside surjectivity from Layer 3), and `H²` classifies
  those extensions (ProfiniteCohomology supplies the classification; we supply the
  splitting).
- **Serre's theorem: `cd_p G ≤ 1` ⟹ free pro-`p`** (the layer's summit). Pinned route:
  `cd ≤ 1` gives the lifting/projectivity property; choose a minimal generating system,
  hence a continuous surjection `φ : F ↠ G` from the free pro-`p` group of rank `d(G)`
  (finite or converging-to-1 basis — for the finitely generated case `Fin (d G)` suffices;
  the general case waits for Layer 10 and is stated then); projectivity produces a section
  `s : G → F` of `φ`; `s(G)` is a closed subgroup mapping onto `F/Φ(F)` (minimality), so
  `s(G) = F` by Burnside, and `φ` is an isomorphism. (NSW III §5, Serre CG I §4.2;
  RZ Ch. 7.) State for finitely generated `G` first, full generality at Layer 10.
- **`cd` of open subgroups.** For `U` open in pro-`p` `G` with `cd_p G < ∞`:
  `cd_p U = cd_p G` (Serre; the ProfiniteCohomology restriction/corestriction machinery
  does the work, this layer states and instantiates it for pro-`p`).
- **Pro-`p` Nielsen–Schreier, open case.** An open subgroup `U` of a free pro-`p` group `F`
  of finite rank `n ≥ 1` is free pro-`p`, of rank `1 + [F : U](n - 1)` (`Suggested.lean`).
  **Route pinned: cohomological.** Freeness via `cd_p U ≤ cd_p F ≤ 1` and Serre's theorem;
  the rank count via the multiplicativity of the Euler characteristic `1 - d` on open
  subgroups of groups with `cd ≤ 1` (a two-term instance of the Euler-characteristic
  formalism — state it as such, don't build the general χ machinery here; Koch derives his
  Example 6.3 rank formula exactly this way from his §5.4). The literature's alternative
  is RZ Thm. 3.6.2: a direct Schreier-transversal argument through the pro-`C` completion
  of the abstract Nielsen–Schreier theorem, for extension-closed varieties. We pin the
  cohomological route because Layers 5–7 build its ingredients anyway and the closed-
  subgroup case (Layer 10, RZ Cor. 7.7.5) is cohomological in any treatment; RZ 3.6.2 is
  the cross-check citation, not the plan.
- ⚠ **Closed subgroups are Layer 10.** Closed (non-open) subgroups of free pro-`p` groups
  are free pro-`p` of possibly infinite rank; the statement needs converging-to-1 bases.
  Do not state a truncated finite-rank version here.

### Layer 7: Demushkin groups — definition, invariants, orientation

- **The predicate.** `IsDemushkin p G` per the pinned convention (three clauses, trivial
  `𝔽_p`-coefficients, two-sided nondegeneracy). Derived immediately: `G` is topologically
  finitely generated with `n(G) = d(G) = dim H¹`; `G` is a one-relator pro-`p` group with
  relator in `Fᵖ[F,F]` (Layer 5).
- **First examples and non-examples** (Labute p. 106, Serre CG I §4.5): `ℤ/2` is Demushkin
  at `p = 2` (the unique finite one; the cup square of the generator of `H¹(ℤ/2, 𝔽₂)` is
  the extension class of `ℤ/4`); free pro-`p` groups (in particular `1` and `ℤ_p`) are
  **not** Demushkin (`H² = 0`); `ℤ_p × ℤ_p` is Demushkin with `q = 0` (surface relation
  `(x₁, x₂)`); for `p` odd no rank-1 Demushkin groups exist.
- **The abelianization structure theorem.** For Demushkin `G`:
  `G^{ab} ≅ ℤ_p^{n-1} × ℤ_p/qℤ_p` (topological abelianization; Labute p. 106). Home of
  `q(G)` per the pinned convention (`demushkinQ`: `0` for torsion-free, else the torsion
  count). Worked instance: `D₀^{ab} ≅ ℤ₂² × ℤ/2` and `q(D₀) = 2` (`Suggested.lean`) —
  a presentation-level computation, deliberately independent of the classification.
- **The canonical character.** Labute Prop. 6: for `dim H¹ < ∞`, the prescription
  properties (1)–(3) for `I(χ)` are equivalent; free pro-`p` groups satisfy them for every
  `χ`. **Theorem (Serre/Labute Thm 4): a Demushkin group has a *unique* continuous
  `χ : G → ℤ_pˣ` with the prescription property.** Define `demushkinCharacter G := χ`;
  prove `Im χ` is closed, is an isomorphism invariant (functoriality under continuous
  isomorphisms — the orientation-transport lemma the acceptance instance needs), and
  recovers `q(G)` (largest `q` with `Im χ ⊆ 1 + qℤ_p`).
- **The image trichotomy at `p = 2`.** Classification of the closed subgroups of `ℤ₂ˣ`
  (`U^(f)`, `{±1} × U^(f)`, `U^[f]` — pinned above), with the procyclicity statement in
  `Suggested.lean`; for `p` odd, closed subgroups of `1 + pℤ_p` are exactly the `U^(f)`
  (`log` isomorphism). Self-contained `ℤ_pˣ`-theory; no cohomology.
- **Poincaré-duality framing, boundary pinned.** The *general* notions — duality group at
  `p`, dualizing module, `PD^n` (NSW (3.4.4)–(3.4.6), (3.7.1)) — live in
  [ProfiniteCohomology](../ProfiniteCohomology/README.md) (its duality layer), and this
  roadmap does not define them. This layer states and proves, against that interface, the
  Demushkin-specific results: an infinite Demushkin group has `cd_p = 2` (Tate; via the
  one-relator presentation and Layer 6) and is a `PD²` group at `p` with dualizing module
  `ℚ_p/ℤ_p` on which `G` acts through `demushkinCharacter` (Labute Thm 1 Remark 1, Serre
  1962/63 §9; NSW (3.9.9) discussion). Conversely `PD²` pro-`p` groups are Demushkin
  (NSW (3.7.6), Serre's cup-pairing characterization; the dim-2 case instantiated here) —
  both halves live here, consuming the sibling's duality vocabulary only.
- **Alternative characterizations (Andozhskii; Dummit–Labute).** For finitely generated
  one-relator pro-`p` `G` with `d(G) > 1`, Demushkin ⟺ `cd_p G = 2` and the dualizing
  module is `ℚ_p/ℤ_p` ⟺ `cd_p G = 2` and `dim H²(N, 𝔽_p) = 1` for every open normal `N`
  ⟺ `cd_p G = 2` and `d(N) - 2 = [G : N](d(G) - 2)` for all open normal `N` (and the
  index-`p`-only sharpenings) — NSW (3.9.15). These are the working recognition criteria
  for Layer 11's arithmetic instance and the bridge to Layer 9's open-subgroup formula.

### Layer 8: the central-tower comparison method and finite-quotient determinacy

The abstraction of the classification method that has already succeeded in Lean at one
instance (provenance section): compare two pro-`p` groups through the finite quotients of
the lower `p`-series, then assemble. Everything here is cohomology-free.

- **The lower `p`-series.** `pLowerCentralSeries p G` (0-based; step
  `H ↦ closure (Hᵖ[H, G])`), Labute's descending `q`-central series at `q = p` (§2, `F₁ = F`,
  `F_{i+1} = F_iᵖ(F_i, F)`). Verbal functoriality (continuous homs respect it; equality
  under continuous epis); each layer `λ_k/λ_{k+1}` is central elementary abelian.
- **Openness and cofinality** (`Suggested.lean`): in a topologically finitely generated
  pro-`p` group every `λ_k` is open (induction: open ⟹ topologically f.g. ⟹ finite
  Frattini-type quotient) and the series is a neighborhood basis of `1` — so
  `G ≅ lim G/λ_k` with finite `p`-group levels, and any comparison can run level by level.
  (RZ Prop. 2.8.13 is the same statement for the iterated-Frattini series; prove it for
  both series, they interleave.)
- **Graded structure.** `gr(G) = ⊕ λ_k/λ_{k+1}` as a graded Lie algebra over `𝔽_p[π]`
  (`π` = the `p`-power operator), with Labute's Prop. 1–2 commutator/power congruences.
  ⚠ **The dyadic obstruction, stated as a theorem, not a footnote:** for `q = 2` the
  bracket fails `𝔽₂[π]`-linearity by the `(q choose 2)`-term (Labute §2 Remarks) — `gr(F)`
  is free over `k[π]` for `q ≠ 2` and *not* a `k[π]`-Lie algebra for `q = 2`. Every `q = 2`
  argument downstream is shaped by this; encode the failing identity explicitly.
- **Finite-quotient determinacy (reconstruction).** Two topologically finitely generated
  profinite groups with the same finite continuous quotients are isomorphic
  (`Suggested.lean`): the sets of continuous surjections at each level are nonempty finite,
  restriction maps make them a surjective inverse system (Gaschütz/counting from Layer 3),
  the limit yields epis both ways, and the Hopf property (Layer 3) closes. Sharp form
  (Fried–Jarden; RZ Thm. 3.2.9): finite generation of *one* of the two groups suffices —
  state that version. Corollary (Dixon–Formanek–Poland–Ribes 1982; RZ Cor. 3.2.8):
  finitely generated abstract groups with identical finite quotient sets have isomorphic
  (as topological groups) profinite completions.
- **The comparison schema.** The reusable statement of the method: given topologically
  finitely generated pro-`p` groups `G`, `H` and, for every `k`, a nonempty set
  `S_k ⊆ ContinuousMulHom`-data of level-`k` comparisons (surjections `G/λ_k ↠ H/λ_k`
  compatible with the projections, plus whatever finite side conditions — e.g. prescribed
  values on marked generators or a character shadow — as long as the conditions are closed
  under the restriction maps and each `S_k` is finite nonempty), there is a limit
  comparison `G ↠ H` satisfying all conditions; two-sided version plus Hopf gives
  `G ≅ H`. This is the exact schema the one-instance `D₀` classification used
  (`exists_contSurj_of_levelwise_nonempty` in the provenance source) — state it once,
  abstractly, with the side-condition slot explicit.

### Layer 9: the classification of Demushkin groups

The full Demushkin–Serre–Labute classification, sequenced *after* the Layer 8 method
because its proofs are successive-approximation arguments along the lower `p`-series —
Layer 8's tower plus per-level linear algebra. Source of record: Labute,
*Classification of Demushkin groups* (Canad. J. Math. 19 (1967), 106–132); modern
statements NSW III §9.

- **Cup-form normal forms (Labute Prop. 3–4 + Corollary).** The relator's image in
  `gr₂(F)` computes the cup product (`r̄(χ_i ∪ χ_j) = a_{ij}`, `(q choose 2) a_i` on the
  diagonal — Prop. 3, the statement that ties Layers 5/7 to the tower); normal forms for
  nondegenerate (skew-)symmetric forms over `𝔽_p`, including ⚠ the characteristic-2
  non-alternating case (a self-contained bilinear-forms input; coordinate with
  [QuadraticFormInvariants](../QuadraticFormInvariants/README.md) rather than duplicating);
  conclusion: `r ≡ x₁^q(x₁,x₂)(x₃,x₄)⋯` or (n odd) `x₁^q(x₂,x₃)⋯ (mod F₃)`.
- **The successive-approximation engine (Labute Prop. 5, Thm 3).** The span statements
  `gr_j(F) = Im δ_{j-1} (+ π^{j-1}ξ-tails for q = 2)` and the limit process: a Demushkin
  group with `q(G) = q` has a basis with `r = x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)` if
  `q ≠ 2`; `r = x₁²x₂^{2^f}(x₂,x₃)(x₄,x₅)⋯` (`f ≥ 2` or `∞`) if `q = 2`, `n` odd;
  `r = x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` (`f ≥ 2` or `∞`, `α ∈ 4ℤ₂`) if `q = 2`, `n` even.
  This is the tower method of Layer 8 with `S_k` = basis-correction data; implement it
  through that schema.
- **Character values in normal form (Labute Thm 4 + Corollary).** Existence of `χ` by
  explicit values on the normal-form basis — pinned exactly: case `q ≠ 2`:
  `χ(x₂) = (1-q)^{-1}`, else `1`; case `q = 2, n` odd: `χ(x₁) = -1`,
  `χ(x₃) = (1-2^f)^{-1}`, else `1`; case `q = 2, n` even: `χ(x₂) = -(1+α)^{-1}`,
  `χ(x₄) = (1-2^f)^{-1}`, else `1` — and uniqueness by the forced-derivation computation.
  Image table: `1 + qℤ_p`; `{±1} × U^(f)`; and for `n` even `{±1} × U^(f)` if
  `v₂(α) ≥ f`, `U^[f']` with `f' = v₂(α)` if `f' < f`.
- **The `q = 2` even-rank endgame (Labute Thm 1 via Thms 5–6).** The Iwasawa-algebra
  arguments over `Λ = ℤ₂[[Γ]]`, `Γ = Im χ` (`ℤ₂[[T]]` for procyclic `Γ`; Weierstrass-style
  divisibility `T - c ∣ ψ ⟺ ψ(c) = 0`): the two even-rank families
  `x₁^{2+2^f}(x₁,x₂)(x₃,x₄)⋯` — for `Im χ = U^[f]`, `(A : A²) = 2`, allowing `N ≥ 1` and
  `f = ∞` — and `x₁²(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` — for `Im χ = {±1} × U^(f)`,
  `(A : A²) = 4`, needing `N ≥ 2` and `f < ∞` (Labute Thm 1's fine print; carry these side
  conditions in the statements). The completed group algebra `ℤ_p[[Γ]]` for procyclic `Γ`
  is a named prerequisite (Labute §1.5; coordinate with Mathlib PR #41961 and the
  `lean-iwasawa` project before building).
  ⚠ **Cite Labute, not NSW, for completeness:** NSW (3.9.19) states only the *existence*
  of the `q = 2` normal forms; which `(α, f)` give isomorphic groups — the classification
  proper — is Labute Thms 1, 2, 4–6 only. ⚠ NSW's second even-form is printed
  `x₂²(x₁,x₂)x₃^{2^f}⋯` (2nd ed. p. 417) where Labute has `x₁²(x₁,x₂)x₃^{2^f}⋯`;
  equivalent up to a basis change, but quote each source's exact form.
- **The classification theorems.** *Uniqueness:* two Demushkin groups with the same `n`
  and `Im χ` are isomorphic; sharpened to Labute Thm 2 (an automorphism of `F` carries any
  Demushkin relator to any other with the same invariants — the statement the marked/
  normalized instances consume). *Existence* (Labute Remark 2, quoted exactly): `(n, A)`
  with `A` a closed subgroup of `ℤ_pˣ` is realized provided (i) `n` even and
  `p^n > (A : A^p)`, or (ii) `n` odd `≥ 3` (so `p = 2`) and `A = {±1} × U^(f)`
  (`f ≥ 2` or `∞`), or (iii) `n = 1` and `A = {±1}`. The small-rank edge cases are part of
  the statement, not exceptions to it; for the odd case cite Serre's Thm 3.2 only for
  `n ≥ 3` (its printed `n ≥ 1` degenerates at `n = 1`) and handle `n = 1` via
  NSW (3.9.10)/Labute Remark 2(iii).
- **Consequences.** Open subgroups of *infinite* Demushkin groups are Demushkin, with
  `n(U) - 2 = [G : U](n(G) - 2)` and `q(U)` determined by `Im(χ|_U)` (Serre 1962/63
  Thm 9.2, via Layer 6's `cd` and Euler-characteristic instances plus duality; the `ℤ/2`
  exception is why "infinite" is in the statement). ⚠ At `n = 2` this is the fixed point
  of the index formula — the `q ≠ 2` rank-2 groups `ℤ_p ⋊ ℤ_p` and their subgroup
  structure make a good stress test.

### Layer 10: free pro-`C` groups on profinite spaces

The definite home of the infinite-rank theory (pinned in the conventions):

- **Construction and universal property.** `F_C(X, ∗)` on a pointed profinite space
  (basis converging to 1): continuous maps `X → P` sending `∗ ↦ 1` classify continuous
  homomorphisms. Recovers Layer 4's object for finite discrete `X`; the two objects on an
  infinite discrete set (all-maps completion vs converging-to-1) are distinguished and
  related (the former is the latter on the one-point compactification's dense discrete
  part — state precisely).
- **Bases and rank.** Existence of converging-to-1 bases; invariance of the rank
  (`d`-theory extended past finite); the Frattini argument at infinite rank.
- **Serre's theorem, full generality.** `cd_p ≤ 1` ⟺ free pro-`p`, without finite
  generation (the Layer 6 proof upgraded with converging-to-1 bases); **closed** subgroups
  of free pro-`p` groups are free pro-`p` (the full pro-`p` Nielsen–Schreier;
  RZ Cor. 7.7.5).
- This layer unblocks nothing downstream in *this* roadmap (Layers 9 and 11 need only
  finite rank) but is required for the theory to be right rather than truncated; it may
  proceed in parallel after Layer 6.

### Layer 11: the arithmetic summit — `G_K(p)` for `p`-adic fields

Consumes [LocalFields](../LocalFields/README.md) (its local-duality and Euler-
characteristic layers) and [ProfiniteCohomology](../ProfiniteCohomology/README.md). For
`K/ℚ_p` finite of degree `d`, `G_K(p) := Gal(K(p)/K)` the Galois group of the maximal
`p`-extension — intrinsically: the maximal pro-`p` quotient of the absolute Galois group,
`maxProP` applied to `Gal(K^sep/K)` (Layer 3 makes this well-defined and functorial).

- **Inputs, stated as the exact interface expected from LocalFields** (cite their layers,
  don't prove here): `H¹(G_K, 𝔽_p)` and `H²(G_K, 𝔽_p)` dimensions via local Tate duality
  and the Euler-characteristic formula (`-χ(G_K, 𝔽_p) = d`); the cup product
  `H¹ × H¹ → H² ≅ 𝔽_p` is the Hilbert-symbol pairing, nondegenerate; the cyclotomic
  character `G_K → ℤ_pˣ` with image `Gal(K(μ_{p^∞})/K)`-computed; Kummer-sequence
  compatibilities. What is *ours*: the passage from `G_K` to `G_K(p)` — inflation
  `H^i(G_K(p), 𝔽_p) → H^i(G_K, 𝔽_p)` is an isomorphism for `i = 1` (universal property of
  the maximal pro-`p` quotient) and for `i = 2` (five-term sequence plus
  `H¹(N, 𝔽_p)^{G_K} = 0` for `N` the kernel: a `G_K`-stable index-`p` open subgroup of `N`
  would contradict maximality of the `p`-extension — a Layer 3/5 argument).
- **The free case (Shafarevich).** If `μ_p ⊄ K`: `G_K(p)` is free pro-`p` of rank `d + 1`
  (`H²(G_K(p), 𝔽_p) = 0` from the duality input since `μ_p ⊄ K`; then Layer 6's Serre
  theorem plus the `H¹` count). Also record the `K = ℚ_p, p ≠ 2` instance: free of rank 2.
- **The Demushkin case.** If `μ_p ⊆ K`: `G_K(p)` is Demushkin with `n = d + 2` and
  `q = #(μ_{p^∞} ∩ K)` = the largest `p`-power `q` with `μ_q ⊆ K` (Labute §5;
  NSW VII §7.5). **The orientation is cyclotomic:** the canonical character of Layer 7
  equals the (descent to `G_K(p)` of the) cyclotomic character — Labute's §5 argument:
  the Kummer-sequence diagram exhibits the prescription property for `I(χ_cyc)`, and
  Theorem 4's uniqueness forces `χ = χ_cyc`. This single sentence is the mathematical
  content of `gq2`'s "dualizing = cyclotomic" clause; it is a theorem of this layer, with
  the Kummer diagram supplied by LocalFields.
- **Explicit presentations** (now corollaries of Layer 9 + the invariants):
  `q ≠ 2`: `G_K(p) = ⟨x₁, …, x_{d+2} ∣ x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{d+1},x_{d+2})⟩` (Demushkin's
  theorem = Labute Thm 7); `q = 2`, `d` odd: `⟨x₁, …, x_{d+2} ∣ x₁²x₂⁴(x₂,x₃)(x₄,x₅)⋯⟩`
  with `Im χ = ℤ₂ˣ` (Serre's theorem = Labute Thm 8 — `d` odd forces
  `K ∩ ℚ₂(μ_{2^∞}) = ℚ₂`, so `f = 2`); `q = 2`, `d` even: the two Layer 9 families per
  `Im χ` (Labute Thm 9).
- **Acceptance instances, stated intrinsically.**
  - `K = ℚ₂` (`d = 1`, `q = 2`): `G_{ℚ₂}(2) ≅ D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩`, rank 3,
    `q = 2`, `Im χ = ℤ₂ˣ`, `χ` cyclotomic with (Thm 4 case-2 values, `f = 2`)
    `(χ(A), χ(S), χ(Y)) = (-1, 1, (1-2²)^{-1} = (-3)^{-1})` on the normal-form basis.
    This — not any marked refinement — is the roadmap's form of the statement; the
    marked-generator normalization stays in `gq2` (provenance section).
  - `K = ℚ₂(√-2)` (`d = 2`, `q = 2`, `Im χ = U^[2] = closure ⟨3⟩`, of index 2 in `ℤ₂ˣ`):
    `G_K(2) = ⟨x, y, z, w ∣ x⁶(x,y)(z,w)⟩` — Labute's closing example, the dyadic-
    exceptional family made concrete, and the acceptance test that the `U^[f]` branch is
    right.
  - `K ⊇ μ_p`, `p` odd, e.g. `K = ℚ_p(μ_p)`: `d = p - 1`, `q = p`, normal form
    `x₁^p(x₁,x₂)(x₃,x₄)⋯(x_p, x_{p+1})` — the `q = p^f ≠ 2` canonical form in a small
    case.

## Worked examples (acceptance criteria, keeping the definitions honest)

Collected from the layers; each catches a specific way the definitions could go vacuous or
mis-normalized:

- `ℤ̂`-Sylow: every `p`-Sylow subgroup of the profinite completion of `ℤ` is `ℤ_p`
  (Layers 0–2; `Suggested.lean`).
- `d(ℤ/4 × ℤ/2) = 2` and `d((ℤ/p)ⁿ) = n`, `r((ℤ/p)ⁿ) = n(n+1)/2` (Layers 3, 5).
- `ℤ/2` is Demushkin (`n = 1`, `q = 2`, `Im χ = {±1}`); `ℤ_p` and all free pro-`p` groups
  are not; `ℤ_p²` is Demushkin with `q = 0` (Layer 7 — the three rank-degenerate checks).
- `D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩`: nontrivial, pro-`2`, `D₀^{ab} ≅ ℤ₂² × ℤ/2`, `q(D₀) = 2`
  (Layers 5, 7; `Suggested.lean`) — all *before* the classification, so the acceptance
  instance cannot silently depend on it.
- Open subgroups: index-2 subgroups of `D₀` are Demushkin of rank 4 (Layer 9's index
  formula at the smallest case); open subgroups of `freeProP p (Fin n)` have rank
  `1 + m(n-1)` (Layer 6; `Suggested.lean`).
- The summit instances: `G_{ℚ₂}(2) ≅ D₀` with cyclotomic `χ` values `(-1, 1, (-3)^{-1})`;
  `G_{ℚ₂(√-2)}(2) = ⟨x,y,z,w ∣ x⁶(x,y)(z,w)⟩`; `G_{ℚ_p(μ_p)}(p)` of rank `p + 1` in the
  `q = p` normal form (Layer 11).

## Ordering and parallelism

Layers 0 → 1 → 2 → 3 → 4 are sequential (each consumes the previous). After Layer 4:
Layer 5's presentation half and Layer 8 (tower + reconstruction, cohomology-free) can
proceed in parallel with the cohomological work; Layer 5's rank interpretations and all of
Layers 6–7 block on [ProfiniteCohomology](../ProfiniteCohomology/README.md) delivering H¹,
H², cup, and the five-term sequence for profinite groups; Layer 7's `ℤ_pˣ`-subgroup theory
and abelianization invariants are unblocked now. Layer 9 needs 5–8; Layer 10 needs 6 and
can run in parallel with 9; Layer 11 needs 7 and 9 plus
[LocalFields](../LocalFields/README.md)' duality and Euler-characteristic layers — its
free case (Shafarevich) needs only the `H²`-vanishing input and can land before the
classification. The reconstruction theorem (Layer 8) and the topological-finite-generation
predicate (Layer 3) are the two contracts the LocalFields roadmap consumes; deliver them
early.

## References

- J. P. Labute, *Classification of Demushkin groups*, Canad. J. Math. 19 (1967), 106–132 —
  **the source of record for Layers 7 and 9**: the definition (p. 106), §1.3–1.4 (rank
  interpretations), §1.5 (`ℤ_p[[G]]`), §2 (the `q`-central series and the graded Lie
  algebra, Props. 1–5), §3 (the invariant `Im χ`, Prop. 6, Thm 4 and its Corollary), §4
  (Thms 5–6, the Iwasawa-algebra arguments), Thms 1–2 (the even-rank classification), §5
  (Thms 7–9, `G_K(p)`, and the `ℚ₂(√-2)` example).
- J.-P. Serre, *Structure de certains pro-p-groupes (d'après Demuškin)*, Séminaire Bourbaki
  1962/63, no. 252 — §2 (2.1–2.3: generation/relation criteria, free ⟺ `H² = 0`), §3
  (Thm 3.1 `q ≠ 2`, Thm 3.2 `q = 2` `n` odd incl. the `n = 2` family
  `⟨x, y ∣ yxy⁻¹ = x^{-(1+k)}⟩`), §§6–7 (the `q`-central series and the `q = 2`
  breakdown), §9 (Tate: 9.1 `cd = 2`, 9.2 open subgroups Demushkin with
  `n_H - 2 = [G : H](n_G - 2)`, 9.3 the dualizing characterization of `χ`). ⚠ opposite
  commutator convention (see conventions).
- J.-P. Serre, *Galois Cohomology* (Springer; transl. of *Cohomologie Galoisienne*) — I
  §3–§4: `cd`, free pro-`p` ⟺ `cd ≤ 1`, generator/relation ranks, I §4.5 Demushkin summary,
  I Prop. 25–26 (the generation/relation dualities Labute cites).
- L. Ribes, P. Zalesskii, *Profinite Groups*, 2nd ed., Springer (2010) — **the source of
  record for Layers 0–4 and 10**: Thm 2.1.3 (profinite characterizations), §2.3
  (supernatural order and index, Prop 2.3.2 Lagrange; Sylow: Cor 2.3.6), §2.8 (Frattini:
  2.8.7 `Φ = closure(Gᵖ[G,G])`, 2.8.10 f.g. ⟺ `Φ` open, 2.8.13 Frattini series as
  neighborhood basis), §3.2 (3.2.8–3.2.9 finite-quotient determinacy), §3.3 (free pro-`C`:
  profinite spaces, converging-to-1, Prop 3.3.6 completion of a free group), Thm 3.6.2 +
  Cor 3.6.3 (open Nielsen–Schreier, transversal route), Ch. 7 (7.5.1 embedding-problem
  characterization of `cd ≤ 1`, 7.7.4 `cd ≤ 1` ⟺ `H² = 0` ⟺ free ⟺ projective, 7.7.5
  closed subgroups, §7.8 rank theory incl. 7.8.5 Golod–Shafarevich).
- J. Neukirch, A. Schmidt, K. Wingberg, *Cohomology of Number Fields*, 2nd ed., Springer
  (2008) — III §4 (3.4.4–3.4.6 dualizing modules, duality groups), III §7 (3.7.1 Poincaré
  groups, 3.7.6 Serre's cup-pairing characterization), III §9 (3.9.1 Burnside/`d = dim H¹`,
  3.9.4–3.9.5 `r = dim H²` and free ⟺ `cd ≤ 1`, 3.9.7 Golod–Shafarevich, 3.9.9 Demushkin
  definition, 3.9.10 `ℤ/2`, 3.9.11 `q ≠ 2` classification, 3.9.12–3.9.14 trace/cup
  matrices, 3.9.15 Andozhskii–Dummit–Labute characterizations, 3.9.19 `q = 2` normal forms
  — existence only), VII §5 (7.5.9 `ℓ ≠ p`, 7.5.10 char `p`, **7.5.11** the `G_K(p)`
  dichotomy, **7.5.12** explicit presentations; also VII (7.4.1) for the `[K : ℚ_p] + 2`
  generator bound the LocalFields sibling proves).
- H. Koch, *Galois Theory of p-Extensions*, Springer (2002) — Ch. 4 (free pro-`p`: 4.6
  universal property, 4.8 projectivity, 4.10 Burnside basis, 4.12 free ⟺ `H² = 0`), Ch. 6
  (6.1–6.2 `d(G)`, 6.13 relation rank = `dim H²`, Example 6.3 the Euler-characteristic
  Schreier formula), Ch. 10 (arithmetically normalized generators for `G_K(p)`; Thms 10.5,
  10.9, 10.12 — the relation pinned only mod the Zassenhaus filtration, a useful contrast
  to Labute's exact normal forms).
- S. P. Demushkin, *On the maximal p-extension of a local field* (Russian), Izv. Akad. Nauk
  SSSR 25 (1961), 329–346; *On 2-extensions of a local field* (Russian), Sibirsk. Mat. Ž. 4
  (1963), 951–955 — the original `q ≠ 2` classification (and the flawed 2-adic attempt
  corrected by Labute Thm 9's `U^[f]` family).
- I. R. Shafarevich, *On p-extensions* (Russian), Mat. Sb. 20 (1947), 351–363; transl.
  AMS Transl. Ser. 2, 4 (1956), 59–72 — the free case of Layer 11.
- U. Jannsen, K. Wingberg, *Die Struktur der absoluten Galoisgruppe p-adischer Zahlkörper*,
  Invent. Math. 70 (1982), 71–98 — the full `G_K` (not just `G_K(p)`) for `p` odd; context
  for why the pro-`p` quotient is the right first target (out of scope here beyond
  citation).
- M. Lazard, *Sur les groupes nilpotents et les anneaux de Lie*, Ann. Sci. ENS 71 (1954) —
  the graded-Lie-algebra theory under Layer 8/9 (Labute's reference (6)).
- J. D. Dixon, E. Formanek, J. Poland, L. Ribes, *Profinite completions and isomorphic
  finite quotients*, J. Pure Appl. Algebra 23 (1982), 227–231 — Layer 8's determinacy
  corollary for abstract groups.

## Provenance, coordination, and licensing

**Migration source (primary).** `roed-math/gq2-lean` (Apache-2.0, same owner — no licensing
obstacle) contains working single-instance implementations of much of Layers 0, 3–5, 7–8 at
a June-2026 Mathlib. Per the "improve, don't canonize" rule, the roadmap above specifies the
mathematics intrinsically; this map is for provenance and reviewer orientation only, and
none of these files' choices (universe placements, `Nat.card` dimension encodings, marked
generators) is prescriptive:

- `GQ2/ProfiniteQuotient.lean` → Layer 0 (quotients by closed normal subgroups profinite).
- `GQ2/MaxProP.lean` → Layer 3 (`IsProP`, `proPKernel`, universal property; the roadmap
  keeps its quotient-form pro-`p` definition).
- `GQ2/FinitelyGenerated.lean` → Layer 3 (the `IsTopologicallyFinitelyGenerated` shape and
  its surjection stability).
- `GQ2/FrattiniCriterion.lean`, `GQ2/FrattiniNongen.lean` → Layer 3 (index-`p` detection,
  Burnside surjectivity criterion; finite `p`-group coatom lemmas).
- `GQ2/FreeProfinite.lean`, `GQ2/ProfinitePresentation.lean` → Layers 4–5 (completion-based
  free profinite groups, closed-normal-closure presentations).
- `GQ2/Zhat.lean` → Layers 0–2 stress objects (`ℤ̂`, profinite exponentiation — the
  `x^λ, λ ∈ ℤ̂` calculus is worth migrating with Layer 4).
- `GQ2/Demushkin.lean` → Layer 7 (an `IsDemushkin` structure with `Nat.card` clauses
  against a project-local continuous-cohomology API; the `ℤ/2` positive and trivial-group
  negative stress tests migrate as Layer 7 examples). ⚠ Its `demushkinQ` (torsion count,
  no `q = 0` case) is a documented deviation the roadmap's convention *fixes* — port the
  statement, not the convention.
- `GQ2/Orientation.lean` + axiom `B3c` (`GQ2/Foundations/Axioms.lean`) → the Layer 11
  `ℚ₂` instance. The axiom bundles (a) Labute Thm 4(2) values, (b) dualizing = cyclotomic,
  (c) a marked-isomorphism normalization; Layers 7/9/11 make (a) and (b) theorems, and (c)
  — the choice of marked generators `A, S, Y` and the exact value bundle — **stays in
  `gq2`** as a thin adapter, per its own documentation.
- `GQ2/Roe/Labute/{TwoCentralTower,Levelwise,StageLemma,SpanFoundation,GradedLie/*,Assembly}.lean`
  + `GQ2/Reconstruction.lean` → Layer 8. This is the completed one-instance rank-3 `q = 2`
  classification (`bLab`, sorry-free at the standard axioms): lower 2-central tower with
  openness/cofinality, levelwise comparison sets with a character shadow as the side
  condition, span/stage lemmas along `gr`, König assembly
  (`exists_contSurj_of_levelwise_nonempty`), two epis + Hopfian endgame. Layer 8 is its
  abstraction (the side-condition slot generalizes the χ-shadow); Layer 9 is the general
  theorem it instantiated. Its graded-Lie span arguments are the seed of Layer 9's
  Prop.-5 engine.
- `GQ2/Devissage*.lean` (module-coefficient two-out-of-three dévissage) is **not** in this
  roadmap's scope — it is self-duality machinery for the `gq2` paper's word complex, cited
  here only to delimit the migration.

**Independent formalization (audit only, no code transfer).**
`davidturturean/gq2-lean-turturean` (GPL-3.0) contains a from-scratch maximal pro-2
quotient (`Q2Presentation/Boundary/MaximalPro2.lean`) and consumes the classification as an
axiom (`labute_GQ2_maxPro2_marked` in `Local/LabuteClassification.lean`) — useful as an
independent decomposition cross-check for Layers 3 and 11. GPL: no code may be copied into
Apache-licensed Tau Ceti without an explicit licensing decision; cite, don't port.

**Overlapping new work (assess and coordinate before building).**
`n-yamaguchi-0729/ProCGroups` (Apache-2.0, created 2026-07-28, AI-generated, unreviewed,
unannounced on Zulip) claims free pro-`C` groups with universal property, maximal pro-`C`
quotients, completed group algebras, Fox calculus, Reidemeister–Schreier, and profinite
Crowell exact sequences — overlapping Layers 3–5 and the Layer 9 prerequisites (no
Demushkin content). Before starting Layers 3–5, audit it declaration-by-declaration and
contact the author; the license permits reuse, but the coordination rule (and review
standards) apply — independent development with citation is the default unless its
material passes review.

**Mathlib coordination.** The `ProfiniteGrp` line is Nailin Guan, Yuyang Zhao, Jujian
Zhang (category, limits, Galois-profinite; Zulip PR-review threads #16648, #16992, #16993,
#20740) with Adam Topaz (completion, #34893) and Thomas Browning (residual finiteness
#35540, additivization #39973, `IsMulFG` #42200) — contact before upstreaming anything
touching those files, and follow their Hom-wrapper category conventions. The continuous-
cohomology line (R. Hill, A. Yang, E. Xie; open #41539/#41545) is coordinated through the
[ProfiniteCohomology](../ProfiniteCohomology/README.md) roadmap. D. Loeffler's `p`-adic
measure PRs (#41961) and Jz Pan's `lean-iwasawa` (Iwasawa algebras over `ℤ_p`-extensions)
border Layer 9's `ℤ₂[[Γ]]` needs. Register intentions per the repository's claims process
before substantial pushes.
