# Roadmap: adic spaces

Mathlib can talk about valuations in the way this subject needs — `ValuativeRel R` packages an
equivalence class of valuations on a ring, with the canonical valuation into its value group,
compatibility (`Valuation.Compatible`), extensions, and the induced topology
(`Mathlib/RingTheory/Valuation/ValuativeRel/`, `Mathlib/Topology/Algebra/ValuativeRel/`) — and it
has the nonarchimedean substrate (`NonarchimedeanRing`, `OpenSubgroup`, `IsAdic` and adic
topologies, `Valued` fields, uniform completions, `IsTopologicallyNilpotent`). What it does
**not** have is any of Huber's theory built on top: **Huber (f-adic) rings** and **Tate rings**,
the **valuation spectrum** `Spv A`, **continuous valuations** and the **adic spectrum**
`Spa (A, A⁺)`, **rational subsets** and **rational localization**, the **structure presheaf**
and the **sheafiness** question, the sheafiness theorem for **strongly noetherian Tate rings**,
**Tate acyclicity**, or the definition of an **adic space**. None of that is upstream, and no
mathlib4 PR is building it (checked 2026-07-21; the Lean 3 perfectoid-spaces project of
Buzzard–Commelin–Massot did construct `Spa` and its presheaf, but was never ported).

This roadmap builds that theory. The headline is **Tate acyclicity** in Huber's generality:
for a **complete strongly noetherian Tate** affinoid pair, the augmented Čech complex of every
finite rational cover is exact in **all** degrees — with the theorem that the structure
presheaf is a **sheaf** as its degree-`≤ 1` shadow — and, on top of sheafiness, the definition
of **adic spaces** as locally-affinoid objects of Huber's category `𝒱`. The closing layer
stress-tests the definitions on a suggested worked example, the **finite-jet pinching
algebra** of [FJP]: a uniform, non-noetherian, sheafy Tate ring that is not stably uniform
(answering Hansen–Kedlaya, *Sheafiness criteria for Huber rings*, Remark 3.16). The sources are
T. Wedhorn, *Adic Spaces* (arXiv:1910.05934) — whose section numbering is this roadmap's shared
coordinate system — and R. Huber's original papers ([Hu1], [Hu2], [Hu3] below); the mathematics
is theirs, but the specification is a **thorough, Mathlib-style API** for each object, not a
transcription of either.

**The existing development.** The AINTLIB `dev/adic-spaces` project (provenance section) has
already carried this program a long way in Lean 4 — sorry-free foundations for Huber rings,
`Spv` **built directly on Mathlib's `ValuativeRel`**, `Spa`, rational subsets, restricted power
series and strong noetherianness, and a sorry-free formalization of the finite-jet pinching
example — with the structure presheaf, spectrality, and full acyclicity as its open frontier.
This roadmap specifies the mathematics intrinsically; the provenance section maps each layer to
that code as material to migrate and complete, never as the standard.

**Out of scope.** Perfectoid rings and spaces, tilting, and diamonds — a future roadmap; the
Lean 3 perfectoid project and AINTLIB's partial `PerfectoidRing/PerfectoidSpace` files are its
provenance, not this roadmap's targets. The Fargues–Fontaine curve and almost mathematics.
Derived and condensed approaches to sheafiness (Andreychev, Clausen–Scholze; also §7 of [FJP]).
The étale site and étale cohomology of adic spaces. Rigid-analytic formal models, Raynaud
generic fibres, and GAGA. Berkovich spaces and the comparison functors. Fibre products of adic
spaces (they need stability theorems for sheafiness that do not exist classically in useful
generality). Huber's *other* sheafiness cases — rings with a noetherian ring of definition
([Hu2] Theorem 2.2(i)) and the stably-uniform-plus refinements beyond Buzzard–Verberkmoes — are
excluded so this roadmap has one spine: the strongly noetherian Tate case.

Suggested home: `TauCeti/RingTheory/Huber/` for the ring-level theory,
`TauCeti/AlgebraicGeometry/AdicSpace/` for `Spv`/`Spa`/presheaf/spaces (mirroring Mathlib's
layout).

## Standing conventions

- **Valuations up to equivalence are Mathlib's `ValuativeRel`.** The valuation spectrum is the
  type of `ValuativeRel` instances on `A` — the design the existing development already uses —
  and never a bespoke quotient of a bundled valuation type by an equivalence relation. Facts
  about a single representative valuation go through `Valuation.Compatible`. This API is under
  active development upstream (e.g. mathlib #30192, valuative topology vs adic topology);
  coordinate with it, and refactor onto upstream improvements as they land.
- **Classes are unbundled `Prop` mixins.** `IsHuberRing A`, `IsTateRing A`,
  `IsStronglyNoetherian A`, `IsUniform A`, sheafiness — all are `Prop`-valued classes over
  `[CommRing A] [TopologicalSpace A] [IsTopologicalRing A]`, in Mathlib's `Is*` style. The
  Lean 3 perfectoid project's bundled `Huber_pair` design is deliberately **not** followed: the
  mixin style is what composes with Mathlib's instance ecosystem. The subring `A⁺` is carried by
  a dedicated class (a `PlusSubring A`-style data class with notation `A⁺`), so that pairs
  `(A, A⁺)` need no bundled pair type either.
- **Completeness is `CompleteSpace` for the canonical uniformity.** A topological ring is
  complete when `CompleteSpace A` holds for
  `IsTopologicalAddGroup.rightUniformSpace A`; state it exactly this way everywhere (the letI
  idiom of the provenance), so hypotheses compose instead of multiplying uniform structures.
- **Spectrality is spelled in Mathlib's vocabulary.** "`X` is spectral" is the conjunction
  `CompactSpace X ∧ QuasiSober X ∧ PrespectralSpace X ∧ QuasiSeparatedSpace X` — all four
  classes exist upstream, with `PrimeSpectrum` the model — asserted as the four instances, not
  as a new bundled `SpectralSpace` class. If Mathlib later bundles spectral spaces, these
  milestones refactor onto it; do not introduce the bundle here.
- **Wedhorn's numbering is the coordinate system.** Milestones cite Wedhorn (arXiv:1910.05934)
  by result number — Definition 6.1, Theorem 7.35, Theorem 8.28, … — with Huber's originals
  cited in parallel; the provenance's files are already named this way (`Cor732.lean`,
  `Wedhorn828.lean`), so the numbers are the shared language across the paper sources, this
  roadmap, and the code. ⚠ Two of Wedhorn's proofs are literally "*Proof.* Missing" (Props
  6.17–6.18, the open-mapping content); the roadmap proves them via Henkel's Tate-ring open
  mapping theorem (arXiv:1407.5647), and they are milestones here, never axioms.
- **Pin the hypotheses of the headline exactly.** The sheafiness theorem is stated for a
  **complete, Hausdorff, strongly noetherian Tate** ring with a ring of integral elements
  `A⁺` — no noetherian ring of definition, no `IsDomain`, no discreteness of the value groups.
  Do not weaken to "uniform" hypotheses silently and do not strengthen to Banach-algebra
  assumptions from the rigid-analytic literature.
- **Sources, not a single specification.** Wedhorn is a careful survey and Huber is the origin;
  neither develops Mathlib-grade API (and [FJP] is an unrefereed preprint: its proofs are to be
  **checked adversarially, with the formalization as the referee** — discrepancies get reported
  against the paper, not patched silently). Where existing Lean work proves a milestone, that is
  provenance (final section), never the standard it is judged against.

## What Mathlib already has (consume)

This is the substrate the roadmap builds on; it is consumed, not rebuilt.

- **Valuative relations.** `ValuativeRel R` (the relation `≤ᵥ`, the canonical
  `ValuativeRel.valuation R` into `ValueGroupWithZero R`), `Valuation.Compatible`,
  `ValuativeExtension`, the induced topology (`Topology/Algebra/ValuativeRel/`), and
  `DiscreteValuativeRel` (`Mathlib/RingTheory/Valuation/ValuativeRel/`).
- **Nonarchimedean topological algebra.** `NonarchimedeanRing`, `OpenSubgroup`/`OpenAddSubgroup`,
  adic topologies and `IsAdic` (`Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean`),
  `IsTopologicallyNilpotent`, bounded sets in topological rings, and topological
  subring/quotient instances.
- **Completions.** `UniformSpace.Completion` with its ring structure for topological rings, and
  the algebraic `AdicCompletion` with `AdicCompletion.flat_of_isNoetherian` (Stacks 00MB) — the
  flatness engine Layer 4 leans on.
- **Valued fields and examples.** `Valued`, `ℚ_[p]`/`ℤ_[p]` with their topology, Laurent series
  `F⸨t⸩` with its `t`-adic valuation, rank-one valuations (`Valuation.RankOne`).
- **The spectral-space vocabulary.** `CompactSpace`, `QuasiSober`, `PrespectralSpace` (compact
  opens form a basis, Stacks 08YG), `QuasiSeparatedSpace`, with `PrimeSpectrum` as the worked
  model of all four.
- **Presheaf machinery.** `TopCat.Presheaf`, `PresheafedSpace`, stalks, and the categorical
  limits API; homological algebra (`HomologicalComplex`, exactness) for the Čech complexes of
  Layer 4.
- **Restricted power series, normed flavour.** `PowerSeries.IsRestricted`
  (`Mathlib/RingTheory/PowerSeries/Restricted.lean`) is the normed-ring cousin of Layer 0's
  adically restricted series; coordinate the two rather than duplicating (a shared home upstream
  is the right endgame), but the roadmap's notion is the topological one below.

What is *not* here is the roadmap: Huber and Tate rings, `Spv`, continuity of valuations, `Spa`,
rational subsets and localization, the structure presheaf, sheafiness, acyclicity, and adic
spaces.

## What is missing (build here)

`Suggested.lean` prototypes the Layer-0 vocabulary that is fully statable against pinned
Mathlib — `PairOfDefinition`, `IsHuberRing`, `IsTateRing`, as honest definitions — and seeds
first milestones over it as `sorry`-targets: discrete rings are Huber, `ℚ_[p]` is Tate, `ℤ_[p]`
is Huber but **not** Tate. The layers whose central objects are new *types* — `Spv` and its
topology (Layer 1), `Spa` and rational subsets (Layer 2), rational localization, the structure
presheaf and the category `𝒱` (Layer 3), the Čech complexes (Layer 4), adic spaces (Layer 5),
and the finite-jet rings (Layer 6) — are specified in the narrative below with embedded Lean
prototypes and built there, not pinned as `sorry`-typed placeholder types.

---

## The build, in layers

The ordering is the dependency order.

### Layer 0: Huber rings and Tate rings (Wedhorn §6; [Hu1] §1, [Hu2] §1)

- **Pairs of definition and Huber rings.** `PairOfDefinition A`: an open subring
  `A₀ ⊆ A` whose subspace topology is `I`-adic for a finitely generated ideal `I ⊆ A₀`
  (Definition 6.1; prototyped in `Suggested.lean` against Mathlib's `IsAdic`); `IsHuberRing A`
  (a pair exists) and `IsTateRing A` (Huber with a topologically nilpotent unit, Definition
  6.10). Basic theory: powers `Iⁿ` and their images are open, elements of `I` are topologically
  nilpotent, rings of definition are bounded and are exactly the open adically-topologized
  subrings (Corollary 6.4, Lemma 6.6); a Huber ring is nonarchimedean
  (`NonarchimedeanRing A` an instance); the topologically nilpotent elements `A°°`, the
  power-bounded subring `A°` (Mathlib-side notions where they exist), `A°` open and integrally
  closed in `A`; in a Tate ring, a **pseudo-uniformizer** `ϖ` lies in every ring of definition
  after a power, and `(ϖⁿA₀)ₙ` is a basis of neighbourhoods of `0`.
- **Completion.** The completion of a Huber ring (via `UniformSpace.Completion` for the
  canonical uniformity) is Huber, with a pair of definition induced from any pair for `A`, and
  `A → Â` is an open embedding onto its image with dense range; completion preserves Tate.
  ([Hu2] Lemma 1.6, Wedhorn §6.4.) Needed by every presheaf value in Layer 3.
- **Restricted power series and strong noetherianness.** `A⟨T₁, …, Tₖ⟩` over a Huber ring — the
  subring of `MvPowerSeries` whose coefficients tend to `0`, with its Huber topology — and
  `IsStronglyNoetherian A`: `A⟨T₁, …, Tₖ⟩` is noetherian for every `k` (Wedhorn Definition 6.9,
  via the restricted-series subring; the provenance's exact shape). `IsStronglyNoetherian → 
  IsNoetherianRing` (`k = 0`). Completely valued fields are strongly noetherian — record the
  statement with BGR 5.2.6 as the classical source and prove the cases the examples need
  (`ℚ_p`, `F⸨t⸩`), so Layer 6's vertices have their instances.
- **The open mapping theorem for Tate rings.** A continuous surjective module map of complete
  Tate rings is open (Henkel, arXiv:1407.5647, the zero-sequence route — the classical Banach
  OMT does not apply verbatim: complete Tate rings need not be σ-compact). This discharges
  Wedhorn's "Proof. Missing" Props 6.17–6.18 and is the topological engine behind Layer 4's
  embedding half.
- **Examples** (seeded where statable now): every discrete ring is Huber (`(A, (0))`); `ℚ_[p]`
  is Tate (`(ℤ_[p], (p))`, `ϖ = p`); `ℤ_[p]` is Huber and **not** Tate (its units have norm
  `1`); `F⸨t⸩` is Tate; `ℚ_p⟨T⟩` is Tate and strongly noetherian.

### Layer 1: the valuation spectrum (Wedhorn §4; [Hu1])

- **`Spv A`.** The type of `ValuativeRel` instances on `A` (Definition 4.1 — the
  equivalence-classes-of-valuations reading is Mathlib's `ValuativeRel` on the nose), with the
  topology generated by the basic opens `Spv(A)(f/s) = {v : v f ≤ v s ≠ 0}`; `supp v` (a prime
  ideal), functorial `comap` along ring maps (continuous), and the lifts to quotients
  `Spv (A ⧸ 𝔞)` (for `𝔞 ≤ supp v`) and localizations — the transport lemmas everything later
  uses. (All of this is sorry-free in the provenance.)
- **Spectrality of `Spv A`** (Wedhorn Theorem 4.20-shape; [Hu1] §2): `Spv A` is quasi-compact,
  quasi-sober, prespectral, and quasi-separated — the four Mathlib instances of the
  conventions — with the basic opens quasi-compact, via the patch/constructible topology
  exactly as for `PrimeSpectrum`. This is real work (the provenance's spectrality file is its
  most open frontier) and the model proof to follow is Mathlib's own Hochster development for
  `PrimeSpectrum`.
- **Specialization basics.** Vertical (secondary) and horizontal specializations of valuations,
  enough to serve Layer 2's analysis of `Cont` — pinned to what Layer 2 consumes, not the full
  §4.4 taxonomy.

### Layer 2: continuous valuations, affinoid pairs, and `Spa` (Wedhorn §7; [Hu1] §3)

- **Continuity.** `v.IsContinuous` for `v ∈ Spv A` over a Huber ring: `{a | v a < γ}` is open
  for every `γ` in the value group (equivalently, `supp`-adapted characterizations, Wedhorn
  §7.1–7.2); `Cont A ⊆ Spv A` as a subspace. **`Cont A` is spectral, closed in the
  constructible topology of `Spv A`** ([Hu1] Theorem 3.1-shape; via the retraction
  `Spv A → Spv (A, I)` machinery).
- **Rings of integral elements and affinoid pairs.** `IsRingOfIntegralElements A⁺`: open,
  integrally closed in `A`, contained in `A°` (Definition 7.14, Remark 7.15; sorry-free in the
  provenance); the `A⁺`-carrying class and the affinoid-pair convention. Any open integrally
  closed subring contains `A°°`; `A°` is the maximal ring of integral elements.
- **The adic spectrum.** `Spa (A, A⁺) = {v ∈ Cont A : ∀ a ∈ A⁺, v a ≤ 1}` with the subspace
  topology; **rational subsets** `R(T/s)` for finite `T ⊆ A` with `T·A` open and `s ∈ T`
  (⚠ the openness of the ideal generated by `T` is part of the definition — for a Tate ring it
  is automatic exactly when `T` contains a unit times a pseudo-uniformizer power; do not drop
  it), openness, and stability under finite intersection
  (`R(T₁/s₁) ∩ R(T₂/s₂) = R(T₁T₂/s₁s₂)`, Remark 7.30, Theorem 7.35(2); sorry-free in the
  provenance). **`Spa (A, A⁺)` is spectral with the rational subsets a basis of quasi-compact
  opens** (Theorem 7.35); `Spa (A, A⁺) = ∅` iff `A = 0` for complete `A` (Proposition
  7.32-shape), and the value of the pair: `A⁺ = {f : ∀ v ∈ Spa (A, A⁺), v f ≤ 1}` for complete
  pairs (Proposition 7.52-shape). Functoriality of `Spa` in morphisms of pairs.

### Layer 3: rational localization and the structure presheaf (Wedhorn §7.5–§8.1; [Hu2] §1)

- **Rational localization.** For a rational subset `U = R(T/s)`: the Huber pair
  `(A⟨T/s⟩, A⟨T/s⟩⁺)` — the completion of `A[1/s]` for the topology making `{t/s : t ∈ T}`
  power-bounded, constructed from Layer 0's restricted power series as a quotient of
  `A⟨X_t⟩` — with its **universal property**: initial among complete Huber pairs over `(A, A⁺)`
  in which `s` is invertible and every `t/s` lands in the plus ring (Wedhorn ~7.45, Lemma 7.54
  = [Hu2] Lemma 2.6 for iterated localization: a rational subset of a rational subset is
  rational in `A`). ⚠ The universal property, not the construction, is the API: everything in
  Layers 4–6 must consume `A⟨T/s⟩` only through it.
- **The structure presheaf.** `𝒪_X` on `X = Spa (A, A⁺)`: on rational `U`, `𝒪_X(U) = A⟨T/s⟩`
  (well-defined up to the universal property), extended to all opens by the limit over rational
  subsets inside; `𝒪_X⁺`; the stalks are local rings carrying the residual valuations (the
  point's valuation extends to `𝒪_{X,x}`); `𝒪_X(X) = A` for complete `(A, A⁺)` (the
  degree-zero part of acyclicity, [Hu2] Proposition 1.6-shape). Presheaf values are **complete
  topological rings**, i.e. the presheaf lands in the category of complete topological
  commutative rings.
- **The category `𝒱` and sheafiness.** Presheafed spaces of complete topological rings with
  equivalence-class valuations on the stalks, and their morphisms (ring-map plus
  place-compatibility; Wedhorn Definitions 8.5, 8.7, Remark 8.20 — Mathlib's `PresheafedSpace`
  is the substrate). **The definition of record is `IsSheafOfTopologicalRings`**: the
  structure presheaf, valued in topological commutative rings, satisfies Mathlib's sheaf
  condition *in that category* — every open cover's equalizer diagram is a limit of
  topological rings, so the glued sections carry the right topology too (Mathlib's
  category-valued sheaf conditions and `TopCommRingCat` are the substrate; the name and shape
  follow the Lean 3 perfectoid project's `is_sheaf_of_topological_rings`) — and
  `IsSheafy (A, A⁺) := IsSheafOfTopologicalRings 𝒪_X`. **The equivalence milestone**:
  `IsSheafy` holds iff the equalizer condition holds for **finite rational covers of rational
  subsets**, in the two-part form the provenance works with — the restriction product map is
  a topological embedding, and compatible families glue — (Wedhorn 8.16-shape: rational
  subsets are a basis of quasi-compact opens, so finite rational covers are cofinal). Every
  downstream sheafiness proof (Layers 4 and 6) is discharged in the two-part form and reaches
  the definition of record across this equivalence, which is proved once, here. Sheafiness
  transports along isomorphisms of pairs and is insensitive to completion.

### Layer 4: sheafiness and Tate acyclicity for strongly noetherian Tate rings (Wedhorn §8.2; [Hu2] Theorem 2.2(ii), 2.5; Tate 1971)

The headline layer. Base: `A` a complete Hausdorff strongly noetherian Tate ring, `A⁺` a ring
of integral elements.

- **Cover normalization.** Every open cover of `X = Spa (A, A⁺)` refines to a finite cover by
  rational subsets; every finite rational cover refines to a **standard (Laurent-type) cover**
  generated by finitely many elements (`{R(f_i/f_j)}`-shape covers), via the
  Nullstellensatz-style refinement argument (Wedhorn Lemma 8.31/8.34-shape; the provenance's
  Zavyalov-route `StandardCover` machinery). Acyclicity is thereby reduced to simple Laurent
  covers `{v : v f ≤ 1} ∪ {v : v f ≥ 1}` by induction.
- **Separatedness.** For a strongly noetherian Tate `A`, the restriction map
  `A⟨T/s⟩ → ∏ A⟨T_i/s_i⟩` over a rational cover is injective with closed image, and the
  quotient topologies match (Wedhorn Corollary 8.32, Lemmas 8.33–8.34; inputs: Layer 0's open
  mapping theorem and noetherian flatness of completion, Stacks 00MB — already in Mathlib as
  `AdicCompletion.flat_of_isNoetherian`).
- **The sheafiness theorem.** `IsSheafy (A, A⁺)` for every complete Hausdorff strongly
  noetherian Tate `A` with `A⁺` a ring of integral elements — Wedhorn Theorem 8.28, [Hu2]
  Theorem 2.2(ii) — with **no** domain hypothesis and no discreteness (the provenance's
  `isSheafy_of_stronglyNoetherian_828b` pins exactly this hypothesis bundle, and Layer 6 needs
  the non-reduced case). The proof route is the Laurent-cover induction on the Čech complex,
  Tate's argument in Huber's generality; it lands in the two-part rational-cover form and
  reaches the definition of record across Layer 3's equivalence.
- **Tate acyclicity, in all degrees.** For every rational subset `U ⊆ X` and every finite
  rational cover `𝔘` of `U`, the augmented Čech complex
  `0 → 𝒪_X(U) → ∏ 𝒪_X(U_i) → ∏ 𝒪_X(U_i ∩ U_j) → ⋯` is **exact**: `Ȟ⁰(𝔘, 𝒪_X) = 𝒪_X(U)` and
  `Ȟⁿ(𝔘, 𝒪_X) = 0` for `n ≥ 1` (Wedhorn Theorem 8.28's full statement; [Hu2] Theorem 2.5;
  Tate's original theorem in the rigid case, *Rigid analytic spaces*, Invent. Math. 12 (1971)).
  Stated over Mathlib's `HomologicalComplex` API so the cohomological content is real, not an
  ad-hoc exactness predicate. The sheafiness theorem is its degree-`≤ 1` shadow; state both,
  derive the first from the second.
- **The classical corollary.** For the Tate algebra `ℚ_p⟨T⟩` (unit disc) and its standard
  Laurent covers, the acyclicity instance — Tate's 1971 theorem as a worked corollary, keeping
  the general machine honest against the example every reader knows.

### Layer 5: adic spaces (Wedhorn §8.2–8.3, Definition 8.22; [Hu2] §2)

- **Affinoid adic spaces.** For sheafy `(A, A⁺)`: the space `Spa (A, A⁺)` with `𝒪_X`, `𝒪_X⁺`,
  and the valuations on stalks, as an object of `𝒱` (Layer 3's category).
- **Adic spaces.** An adic space is an object of `𝒱` that is **locally isomorphic in `𝒱`** to
  an affinoid adic space (Definition 8.22). ⚠ Locally isomorphic *in `𝒱`* — carrying the
  presheaf and the stalk valuations — not merely locally homeomorphic; the provenance's current
  `AdicSpace` structure is a homeomorphism-only placeholder and is **not** the specification.
  Morphisms are `𝒱`-morphisms; open adic subspaces; a gluing construction for `𝒱`-spaces along
  open immersions, sufficient to build non-affinoid examples.
- **Examples.** `Spa (K, K°)` for a complete nonarchimedean field `K` (its points classified by
  the rank filtration of `K`'s valuation); the closed unit disc `Spa (ℚ_p⟨T⟩, ℤ_p⟨T⟩)` as an
  adic space via Layer 4; the open disc as an increasing union of closed discs — the first
  genuinely glued, non-affinoid adic space, exercising the gluing API.

### Layer 6: uniformity, Buzzard–Verberkmoes, and the finite-jet stress test ([BV]; [FJP]; [HK])

Uniformity completes the basic theory of Huber pairs; the layer closes with a suggested
worked example exercising everything built above.

- **Uniformity.** `IsUniform A` (`A°` bounded, Wedhorn Definition 7.36) and
  `IsStablyUniform (A, A⁺)` (every rational localization `A⟨T/s⟩` is uniform, Definition 7.37;
  both sorry-free in the provenance); basic stability and the discrete case.
- **Buzzard–Verberkmoes.** Stably uniform complete Tate pairs are sheafy ([BV], J. reine angew.
  Math. 740 (2018), in its bounded-denominator formulation) — the standard sheafiness
  criterion complementary to Layer 4, and this layer's theorem.
- **The finite-jet stress test.** A suggested worked example that exercises Layers 0–4 end to
  end — every definition, and the sheafiness theorem in its full non-reduced generality — from
  [FJP] (references; the construction is specified self-containedly here because the preprint
  is not public). Over `K = F⸨t⸩`: `L = K⟨W, W⁻¹⟩`, `𝓑 = K⟨W, Q⟩/(Q²)`, `𝓒 = L⟨Q⟩`,
  `𝓓 = L⟨Q⟩/(Q²)`, and the pinching algebra **`𝓐 = 𝓑 ×_𝓓 𝓒`** — concretely the closed
  subring of `𝓒` of series whose `Q⁰`- and `Q¹`-coefficients have nonnegative `W`-support —
  with its strict Milnor row `0 → 𝓐 → 𝓑 ⊕ 𝓒 → 𝓓 → 0`, exact with all norm constants `1`. The
  test ([FJP] Theorem 1.3, one conclusion per declaration): `𝓐` is a **uniform**,
  **non-noetherian** **domain**; `(𝓐, 𝓐°)` is **sheafy**, by transferring the sheaf condition
  across the Milnor square from the three vertices — each complete strongly noetherian Tate,
  two of them non-reduced, so each sheafy by exactly Layer 4's theorem as pinned; and `𝓐` is
  **not stably uniform**, witnessed by `𝓐⟨W/ϖ⟩ ≅ K⟨X, Q⟩/(Q²)` (`X = W/ϖ`) — strongly
  noetherian and sheafy but not uniform (`Q·f` is nilpotent hence power-bounded for every `f`,
  so its `A°` is unbounded). The example shows **sheafy ⇏ stably uniform**, answering [HK]
  Remark 3.16, and certifies that Layer 4 and [BV] each cover ground the other does not. Its
  strong-sheafiness refinement ([FJP] Corollary 5.5) is deliberately **not** a target.

---

## Worked examples (acceptance criteria, keeping the theory honest)

- **`ℚ_[p]` is Tate, `ℤ_[p]` is Huber and not Tate, discrete rings are Huber** — the Layer-0
  seeds (`isTateRing_padic`, `isHuberRing_padicInt`, `not_isTateRing_padicInt`,
  `isHuberRing_of_discreteTopology`).
- **`Spa (ℚ_p, ℤ_p)` is a single point**, and `Spa (A, A⁺) = ∅` iff `A = 0` for complete `A` —
  the spectrum sees the ring.
- **The Gauss point.** The closed unit disc `Spa (ℚ_p⟨T⟩, ℤ_p⟨T⟩)` is a nonempty spectral
  space containing the Gauss valuation, and its standard Laurent cover
  `{|T| ≤ |p|} ∪ {|p| ≤ |T|}` is a rational cover with an exact augmented Čech complex —
  Tate's 1971 example, as a computed instance of Layer 4.
- **Sheafiness with a nilpotent.** Layer 4's theorem applied to `K⟨X, Q⟩/(Q²)` — non-reduced,
  strongly noetherian, Tate — produces a sheafy pair that is *not* uniform: the hypotheses of
  the headline were pinned correctly.
- **The finite-jet stress test.** `(𝓐, 𝓐°)` sheafy, `𝓐` uniform non-noetherian domain,
  `𝓐⟨W/ϖ⟩` not uniform (`finiteJet_isSheafy`, `finiteJet_isUniform`,
  `finiteJet_not_noetherian`, `finiteJet_not_stablyUniform`) — the definitions survive a
  worked example that Layer 4 alone and [BV] alone cannot reach, and [HK] Remark 3.16 is
  answered in Lean.
- **A glued adic space.** The open unit disc over `ℚ_p` as an increasing union of closed discs —
  a non-affinoid adic space built by the Layer-5 gluing API.

## Ordering

Layer 0 (Huber/Tate rings, restricted series, completion, the open mapping theorem) is the
foundation. Layer 1 (`Spv` and its spectrality) needs only Mathlib's `ValuativeRel` and Layer
0's vocabulary. Layer 2 (`Cont`, pairs, `Spa`, rational subsets) consumes Layers 0–1. Layer 3
(rational localization, the presheaf, `𝒱`, sheafiness) consumes Layer 2 and Layer 0's
restricted series and completions. Layer 4 (the sheafiness theorem and Tate acyclicity)
consumes Layer 3, Layer 0's open mapping theorem and strong noetherianness, and Mathlib's
noetherian-completion flatness. Layer 5 (adic spaces) consumes Layers 3–4 (sheafy pairs give
affinoids). Layer 6 (uniformity, [BV], and the stress-test example) consumes Layers 3–4 in
full — the example's vertices are Layer-4 instances — and is independent of Layer 5, so it can
proceed in parallel with the headline strand (Layers 4–5) once Layer 3 lands.

## References

- R. Huber, *Continuous valuations*, Math. Z. 212 (1993), 455–477 — [Hu1]: `Spv`, `Cont`,
  spectrality (Layers 1–2).
- R. Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217
  (1994), 513–551 — [Hu2]: `Spa`, rational localization, the presheaf, sheafiness and
  acyclicity for strongly noetherian Tate rings, adic spaces (Layers 2–5).
- R. Huber, *Étale cohomology of rigid analytic varieties and adic spaces*, Aspects of
  Mathematics E30 (Vieweg, 1996) — [Hu3]: the book form of the foundations (background; its
  étale theory is out of scope).
- T. Wedhorn, *Adic Spaces* (arXiv:1910.05934) — the roadmap's coordinate system: §4 (`Spv`),
  §6 (Huber rings), §7 (`Cont`, pairs, `Spa`, rational subsets, uniformity), §8 (presheaf,
  Theorem 8.28, adic spaces).
- J. Tate, *Rigid analytic spaces*, Invent. Math. 12 (1971), 257–289 — the original acyclicity
  theorem (Layer 4's corollary).
- K. Buzzard, A. Verberkmoes, *Stably uniform affinoids are sheafy*, J. reine angew. Math. 740
  (2018), 25–39 — [BV] (Layer 6).
- D. Hansen, K. Kedlaya, *Sheafiness criteria for Huber rings* (preprint, 2025 version) —
  [HK]: Remark 3.16 is the question Layer 6 answers.
- **[FJP]** *Finite-jet pinching: a uniform strongly sheafy domain which is not stably uniform*
  (anonymous preprint, 16 July 2026, 27 pp.) — the Layer-6 stress-test example. ⚠ Unpublished and not
  publicly posted; the PDF is held by the maintainers and available to contributors on request.
  The roadmap therefore specifies the construction and statements **self-containedly above**,
  and the formalization is the referee: the paper's proofs are to be checked adversarially,
  with discrepancies reported.
- L. Henkel, *An Open Mapping Theorem for rings with a zero sequence of units*
  (arXiv:1407.5647) — the Tate-ring open mapping theorem (Layer 0).
- K. Hübner, on separatedness of structure presheaves (arXiv:2405.06435) — the separation
  route the provenance's Layer-4 files follow.
- S. Bosch, U. Güntzer, R. Remmert, *Non-Archimedean Analysis*, Grundlehren 261 (Springer,
  1984) — BGR: classical affinoid algebra inputs (strong noetherianness of `K⟨T⟩`, BGR 5.2.6).
- K. Buzzard, J. Commelin, P. Massot, *Formalising perfectoid spaces* (arXiv:1910.12320) — the
  Lean 3 construction of `Spa` and its presheaf; prior art on design (its bundled-pair style is
  deliberately not followed — conventions above), never a port source.

## Provenance (existing Lean work to migrate into Tau Ceti)

The milestones are specified above intrinsically; this section maps them to Lean work that
already discharges parts of them, as material to migrate and complete — never as the
specification.

**Pinned source.** All claims below were audited at, and only hold for, this revision:
**AINTLIB** (`github.com/CBirkbeck/AINTLIB`; public, currently **no license file** — the
repository belongs to this roadmap's author, and Apache-2.0 licensing of the migrated material
is part of the migration contract): branch `dev/adic-spaces @ 2e5b1cf60a73`, project
`projects/AdicSpaces/` (≈250 Lean files; the audit below counts `sorry` occurrences per file at
that revision). The project's `ScottishBook/`, `FarguesFontaine.lean`, `AlmostMathematics.lean`,
`PerfectoidRing.lean`, `PerfectoidSpace.lean`, and `Tilting.lean` are out of this roadmap's
scope and are not migration targets.

- **Layer 0 (sorry-free at the pin).** `HuberRings.lean` (`PairOfDefinition`, `IsHuberRing`,
  `IsTateRing`, Corollary 6.4/Lemma 6.6 theory), `RestrictedPowerSeries.lean`
  (`IsStronglyNoetherian` via the restricted-`MvPowerSeries` subring, with
  `IsStronglyNoetherian.isNoetherianRing`), `TateAlgebra.lean`/`TateAlgebraTopology.lean`,
  `Uniform.lean` (`IsUniform`, `IsStablyUniform`), `Bounded.lean`, `OpenIdeals.lean`,
  `PseudoUniformizer.lean`, with `BanachOMT.lean`/`OpenMapping.lean` carrying the Henkel-route
  open mapping material (`BanachOMT.lean` has open `sorry`s — the OMT milestone is *not* done).
- **Layer 1.** `ValuationSpectrum.lean` (sorry-free: `Spv` **as the type of Mathlib
  `ValuativeRel` instances**, `basicOpen`, `comap`, `supp`, quotient/localization lifts —
  adopt this design wholesale) and `ValuationSpectrumCompact.lean`/`SpaCompact.lean`
  (sorry-free compactness inputs). ⚠ The spectrality machinery `SpvAITopology.lean` carries
  **36 `sorry`s** — Layer 1's spectrality milestone is genuinely open there.
- **Layer 2.** `ContinuousValuations.lean` (2 `sorry`s), `AffinoidRings.lean` (sorry-free:
  `IsRingOfIntegralElements`, `IsAffinoidRing`, Remark 7.15), `AdicSpectrum.lean` (sorry-free
  `Spa`), `RationalSubsets.lean` (sorry-free: openness, intersection stability 7.30/7.35).
- **Layers 3–4 (the open frontier).** `Presheaf.lean` (**49**), `StructureSheaf.lean` (**38**,
  including the `IsSheafy` class in exactly the embedding+gluing two-part form that Layer 3
  now designates the **equivalent characterization** — the definition of record is
  `IsSheafOfTopologicalRings`, the provenance's class is the other side of the equivalence
  milestone and its machinery discharges it; capstones stated against the two-part class are
  re-expressed through that equivalence on migration — and the `𝒱`-category material over
  `PresheafedSpace CompleteTopCommRingCat`),
  `PresheafTateStructure.lean` (19), `StandardCover.lean` (8), `Cor832.lean` (18),
  `Wedhorn828.lean` (17), `LaurentRefinementCore.lean` (25), `TateAcyclicityResiduals.lean`
  (35), `TateAcyclicity.lean` (6), `TateAcyclicityFinalAssembly.lean` (11), and the ~40
  `Wedhorn*`-prefixed supplier/assembly files of the 8.28 campaign. The capstone
  **`isSheafy_of_stronglyNoetherian_828b`** (`WedhornCechAcyclicity.lean:13373`) exists with
  exactly the hypothesis bundle Layer 4 pins (complete Hausdorff strongly noetherian Tate,
  ring of integral elements, **no domain hypothesis**) — but it lives in a **13,000-line file
  with 9 `sorry`s**, and the older `TateAcyclicity*` route is conditional on explicit supplier
  hypotheses (Zavyalov-refinement, Laurent-overlap "Lane A", separation "Lane B"). ⚠ Migration
  contract: the capstone's dependency cone must be `#print axioms`-audited and the file
  decomposed to TauCeti's CI standards before anything here counts as discharged; the
  full-degree acyclicity statement of Layer 4 is **not** in the provenance at all and is built
  here.
- **Layer 5.** `StructureSheaf.lean` also contains `AffinoidAdicSpace` and an `AdicSpace`
  structure — the latter only asks for local *homeomorphism* to an affinoid and is a
  placeholder, not the Layer-5 specification (local isomorphism in `𝒱` is); `CechCohomology.lean`
  (sorry-free) and `CompleteTopCommRingCat.lean` are the categorical substrate to reuse.
- **Layer 6 (sorry-free at the pin, at file level).** The `FJP/` directory — 11 files, **0
  `sorry`s**: `FiniteJetRings.lean` (the square `𝓐, 𝓑, 𝓒, 𝓓` over `K = LaurentSeries F`, the
  strict Milnor row, the full Huber instance stack), `RestrictedLaurent.lean` (`L`),
  `FiniteJetUniformDomain.lean`, `FiniteJetNoetherianVertices.lean`,
  `FiniteJetStrictLocalization.lean` (`𝓐⟨W/ϖ⟩ ≅ K⟨X,Q⟩/(Q²)`), `FiniteJetSheafTransfer.lean`
  (the Milnor-square sheaf transfer), `FiniteJetChart.lean`, `FiniteJetGraphKoszul.lean`,
  `Milnor/StrictMilnorSquare.lean`, and the capstone exports in `FiniteJetMain.lean`
  (`finiteJet_isSheafy`, `finiteJet_isUniform`, `finiteJet_isDomain`,
  `finiteJet_not_noetherian`, `finiteJet_not_stablyUniform`). ⚠ These consume the 828b
  capstone and the `IsSheafy` infrastructure, so their effective status inherits the Layer-3/4
  audit above; `[FJP] Corollary 5.5` (strong sheafiness) is not attempted there, and is not a
  target here either (§Layer 6). The `[BV]` theorem is absent from the provenance and is built
  here.
- **Vendored inputs.** `Vendored/Coram*`/`Vendored/Xia*` (Gauss-norm and `MvPowerSeries`
  equivalence material) — check for upstream Mathlib overlap (e.g.
  `PowerSeries.IsRestricted`) at migration time rather than porting blindly.

The audit method above is file-level `grep`-counting of `sorry` at the pinned revision: it
over-counts (comments mentioning the word) and cannot see cross-file dependence, which is why
the migration contract for every "sorry-free" claim is a `#print axioms` gate on the actual
capstones in TauCeti CI. The [FJP] PDF itself is deliberately not in the repository; request it
from the maintainers before working on Layer 6.
