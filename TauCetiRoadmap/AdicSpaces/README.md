# Roadmap: adic spaces

Mathlib has the valuations in the way we need — `ValuativeRel R` packages an
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

This roadmap develops that theory: Huber and Tate rings, the valuation spectrum, continuous
valuations and the adic spectrum, rational localization and the structure presheaf, the
**sheafiness** theorem for complete strongly noetherian Tate affinoid pairs together with its
full-strength form **Tate acyclicity** (the augmented Čech complex of every finite rational
cover is exact in all degrees), and the definition of **adic spaces** as objects of Huber's
category `𝒱` that are locally isomorphic *in `𝒱`* to affinoids. As an application, the final
layer uses all of it to construct the **adic Fargues–Fontaine curve** `𝒳 = 𝒴/φ^ℤ` (Layer 7).

AINTLIB has a `sorry`-free Fargues–Fontaine
development that constructs `𝒳`, proves it quasi-compact and `T0`, descends a structure
presheaf that **is a sheaf of topological rings**, and packages the result as an object of `𝒱`.
The *general* machinery underneath it — the structure presheaf for arbitrary Huber pairs, the
sheafiness theorem, acyclicity — still has open gaps, and closing them is most of the work this
roadmap asks for: a formalization that only reached the curve through chart-specific arguments
would not deliver what the rest of the subject needs. Layers 0–6 build the theory; Layer 7
applies it. Layer 6 closes with a worked example — likewise `sorry`-free in provenance: an
interesting Tate ring (uniform, non-noetherian, built as a fibre product of simpler rings) is
proved sheafy, and turns out not to be stably uniform
(answering Hansen–Kedlaya, *Sheafiness criteria for Huber rings*, Remark 3.16). The
construction is a one-off made for this purpose, not a standard object. The sources are
T. Wedhorn, *Adic Spaces* (arXiv:1910.05934) — whose section numbering is this roadmap's shared
coordinate system — and R. Huber's original papers ([Hu1], [Hu2], [Hu3] below); the mathematics
is theirs, but the specification is a **thorough, Mathlib-style API** for each object, not a
transcription of either.

**The existing development.** The AINTLIB `dev/adic-spaces` project (provenance section) has
already carried this program a long way in Lean 4 — sorry-free foundations for Huber rings,
`Spv` **built directly on Mathlib's `ValuativeRel`**, `Spa`, rational subsets, restricted power
series and strong noetherianness, and a sorry-free formalization of interesting examples, like the sheafy ring of §Layer 6
— with the structure presheaf, spectrality, and full acyclicity as its open frontier.
This roadmap specifies the mathematics intrinsically; the provenance section maps each layer to
that code as material to migrate and complete, never as the standard.

**Out of scope.** Perfectoid rings and spaces, tilting, and diamonds — a future roadmap; the
Lean 3 perfectoid project and AINTLIB's partial `PerfectoidRing/PerfectoidSpace` files are its
provenance, not this roadmap's targets — with the exception of exactly what Layer 7 needs
(`A_inf`, the tilting-free perfectoid-field input), which is built here. Almost mathematics.
Derived and condensed approaches to sheafiness (Andreychev, Clausen–Scholze).
The **structure theory** of the Fargues–Fontaine curve beyond its construction — vector
bundles and `𝒪(λ)`, slopes and the Harder–Narasimhan filtration, the Fargues–Fontaine
classification theorem, the fundamental exact sequence, `B_dR`/`B_cris` and completed local
rings, classical points and the untilt dictionary, the curve for general `E` (ramified Witt
vectors), the relative curve and diamonds, and the schematic `Proj` curve with its GAGA
comparison — is the **successor roadmap**; §Layer 7 records the dependency order it should
follow.
The étale site and étale cohomology of adic spaces. Rigid-analytic formal models, Raynaud
generic fibres, and GAGA. Berkovich spaces and the comparison functors. Fibre products of adic
spaces (they need stability theorems for sheafiness that do not exist classically in useful
generality). Huber's *other* sheafiness cases — rings with a noetherian ring of definition
([Hu2] Theorem 2.2(i)) and the stably-uniform-plus refinements beyond Buzzard–Verberkmoes — are
excluded so this roadmap follows one main line: the strongly noetherian Tate case.

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
- **Spectrality is Mathlib's `SpectralSpace`.** Mathlib bundles it
  (`Topology/Spectral/Basic.lean`, Stacks 08YG): `SpectralSpace X` extends `T0Space`,
  `CompactSpace`, `QuasiSober`, `QuasiSeparatedSpace`, and `PrespectralSpace`, with
  `PrimeSpectrum` the worked model. Spectrality milestones assert this class — equivalently
  its five parents, and note `T0Space` is genuinely one of them: quasi-sobriety gives
  *existence* of generic points, `T0` their uniqueness. Do not introduce a rival bundle.
- **Wedhorn's numbering is the coordinate system.** Milestones cite Wedhorn (arXiv:1910.05934)
  by result number — Definition 6.1, Theorem 7.35, Theorem 8.28, … — with Huber's originals
  cited in parallel; the provenance's files are already named this way (`Cor732.lean`,
  `Wedhorn828.lean`), so the numbers are the shared language across the paper sources, this
  roadmap, and the code. Two of Wedhorn's proofs are literally "*Proof.* Missing" (Props
  6.17–6.18, the open-mapping content); the roadmap proves them via Henkel's Tate-ring open
  mapping theorem (arXiv:1407.5647), and they are milestones here, never axioms.
  **The sheafiness theorem is 8.28(b)** — verified against arXiv:1910.05934 itself, which
  has only ever had one version (v1, 14 Oct 2019), so the pin is also the current text:
  Definition 8.26 is "sheafy"/"stably sheafy", **Remark 8.27** is the criterion for a pre-adic
  space to be an adic space, and **Theorem 8.28** is "let `A = (A, A⁺)` be an affinoid ring …
  (b) `A` is a strongly noetherian Tate ring … then `O_X` is a sheaf of complete topological
  rings; moreover `H^q(U, O_X) = 0` for all `q ≥ 1` and all rational subsets `U`". A review
  reading a *different* edition reported this as 8.27(b); it is not, and no citation here or
  in the provenance needs changing. Note also that **8.28 already contains the acyclicity
  clause**: Layer 4's sheafiness and its rational-cover acyclicity are one theorem in the
  source, not two.
- **Pin the hypotheses of the sheafiness theorem exactly.** It is stated for a
  **complete, Hausdorff, strongly noetherian Tate** ring with a ring of integral elements
  `A⁺` — no noetherian ring of definition, no `IsDomain`, no discreteness of the value groups.
  Do not weaken to "uniform" hypotheses silently and do not strengthen to Banach-algebra
  assumptions from the rigid-analytic literature.
- **Sources, not a single specification.** Wedhorn is a careful survey and Huber is the origin;
  neither develops Mathlib-grade API. Where existing Lean work proves a milestone, that is
  provenance (final section), never the standard it is judged against. One layer has no paper
  source at all: the Layer-6 worked example is a one-off, specified **self-containedly in this
  roadmap's own text**, and the `sorry`-free AINTLIB formalisation of it is the provenance
  evidencing that the specification is consistent and provable — cite the formalisation, not
  an unpublished document.

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
  flatness input Layer 4 uses.
- **Valued fields and examples.** `Valued`, `ℚ_[p]`/`ℤ_[p]` with their topology, Laurent series
  `F⸨t⸩` with its `t`-adic valuation, rank-one valuations (`Valuation.RankOne`).
- **The spectral-space vocabulary.** The bundle `SpectralSpace` (Stacks 08YG) with its parents
  `T0Space`, `CompactSpace`, `QuasiSober`, `PrespectralSpace` (compact opens form a basis),
  and `QuasiSeparatedSpace`, with `PrimeSpectrum` as the worked model.
- **Presheaf machinery.** `TopCat.Presheaf`, `PresheafedSpace`, stalks, and the categorical
  limits API; homological algebra (`HomologicalComplex`, exactness) for the Čech complexes of
  Layer 4.
- **Perfectoid and period-ring material.** `Mathlib/RingTheory/Perfectoid/` now carries
  Fontaine's `θ` (`FontaineTheta.lean`, with `fontaineTheta_surjective` and
  `fontaineTheta_teichmuller`), untilts (`Untilt.lean`), and `B_dR⁺`/`B_dR`
  (`BDeRham.lean`), plus `WittVector.Isocrystal` with the one-dimensional classification.
  Layer 7 consumes the Witt-vector API directly (`frobeniusEquiv`, `teichmuller`, `p`-adic
  completeness of `W(k)`); the `θ`/`B_dR` material is **not** on Layer 7's path — it belongs
  to the successor roadmap's period-ring and classical-points milestones — and is recorded
  here so neither is rebuilt.
- **Restricted power series, normed flavour.** `PowerSeries.IsRestricted`
  (`Mathlib/RingTheory/PowerSeries/Restricted.lean`) is the normed-ring cousin of Layer 0's
  adically restricted series. The restricted-power-series development — this Mathlib file and
  the Gauss-norm material vendored in the provenance — is **William Coram's work**;
  coordinate with him and with it rather than duplicating (a shared home upstream is the
  right endgame), but the roadmap's notion is the topological one below.

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
and the Layer-6 example rings — are specified in the narrative below with embedded Lean
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
  Tate rings is open (Henkel, arXiv:1407.5647, the zero-sequence route — the classical
  Banach-space open mapping theorem does not apply verbatim, since a complete Tate ring is not
  in general a Banach space over a valued field; Henkel's zero-sequence-of-units setting is
  the right generality). This discharges
  Wedhorn's "Proof. Missing" Props 6.17–6.18 and is the topological input behind Layer 4's
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
- **Spectrality of `Spv A`** (Wedhorn Theorem 4.20-shape; [Hu1] §2): `SpectralSpace (Spv A)` —
  the conventions' bundled instance, `T0` included — with the basic opens quasi-compact, via
  the patch/constructible topology
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
  (the openness of the ideal generated by `T` is part of the definition — for a Tate ring it
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
  rational in `A`). The universal property, not the construction, is the API: everything in
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

The central theorem of the general theory lives here. Base: `A` a complete Hausdorff strongly
noetherian Tate ring, `A⁺` a ring of integral elements.

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
  ad-hoc exactness predicate. The sheafiness theorem is the degree-`≤ 1` part; state both,
  derive the first from the second.
- **The classical corollary.** For the Tate algebra `ℚ_p⟨T⟩` (unit disc) and its standard
  Laurent covers, the acyclicity instance — Tate's 1971 theorem as a worked corollary, keeping
  the general machine honest against the example every reader knows.

### Layer 5: adic spaces (Wedhorn §8.2–8.3, Definition 8.22; [Hu2] §2)

- **Affinoid adic spaces.** For sheafy `(A, A⁺)`: the space `Spa (A, A⁺)` with `𝒪_X`, `𝒪_X⁺`,
  and the valuations on stalks, as an object of `𝒱` (Layer 3's category).
- **Adic spaces.** An adic space is an object of `𝒱` that is **locally isomorphic in `𝒱`** to
  an affinoid adic space (Definition 8.22). Locally isomorphic *in `𝒱`* — carrying the
  presheaf and the stalk valuations — not merely locally homeomorphic; the provenance's current
  `AdicSpace` structure is a homeomorphism-only placeholder and is **not** the specification.
  Morphisms are `𝒱`-morphisms; open adic subspaces; a gluing construction for `𝒱`-spaces along
  open immersions, sufficient to build non-affinoid examples.
- **Examples.** `Spa (K, K°)` for a complete nonarchimedean field `K` (its points classified by
  the rank filtration of `K`'s valuation); the closed unit disc `Spa (ℚ_p⟨T⟩, ℤ_p⟨T⟩)` as an
  adic space via Layer 4; the open disc as an increasing union of closed discs — the first
  genuinely glued, non-affinoid adic space, exercising the gluing API.

### Layer 6: uniformity, Buzzard–Verberkmoes, and a worked example ([BV]; [HK]; provenance)

Uniformity completes the basic theory of Huber pairs; the layer closes with a suggested
worked example exercising everything built above.

- **Uniformity.** `IsUniform A` (`A°` bounded, Wedhorn Definition 7.36) and
  `IsStablyUniform (A, A⁺)` (every rational localization `A⟨T/s⟩` is uniform, Definition 7.37;
  both sorry-free in the provenance); basic stability and the discrete case.
- **Buzzard–Verberkmoes.** Stably uniform complete Tate pairs are sheafy ([BV], J. reine angew.
  Math. 740 (2018), in its bounded-denominator formulation) — the standard sheafiness
  criterion complementary to Layer 4, and this layer's theorem.
- **A worked example: an interesting ring to prove sheafy.** A suggested example that exercises Layers 0–4 end to
  end — every definition, and the sheafiness theorem in its full non-reduced generality. It
  has **no public paper source**: the construction is specified self-containedly here, and its
  reference is the `sorry`-free **AINTLIB formalisation** (the `FJP/` directory, §Provenance),
  whose capstone exports carry exactly the statements below. Over `K = F⸨t⸩`:
  `L = K⟨W, W⁻¹⟩`, `𝓑 = K⟨W, Q⟩/(Q²)`, `𝓒 = L⟨Q⟩`,
  `𝓓 = L⟨Q⟩/(Q²)`, and the fibre product **`𝓐 = 𝓑 ×_𝓓 𝓒`** — concretely the closed
  subring of `𝓒` of series whose `Q⁰`- and `Q¹`-coefficients have nonnegative `W`-support —
  with its strict Milnor row `0 → 𝓐 → 𝓑 ⊕ 𝓒 → 𝓓 → 0`, exact with all norm constants `1`. The
  test (one conclusion per declaration, matching the formalisation's exports): `𝓐` is a
  **uniform**,
  **non-noetherian** **domain**; `(𝓐, 𝓐°)` is **sheafy**, by transferring the sheaf condition
  across the Milnor square from the three vertices — each complete strongly noetherian Tate,
  two of them non-reduced, so each sheafy by exactly Layer 4's theorem as pinned; and `𝓐` is
  **not stably uniform**, witnessed by `𝓐⟨W/ϖ⟩ ≅ K⟨X, Q⟩/(Q²)` (`X = W/ϖ`) — strongly
  noetherian and sheafy but not uniform (`Q·f` is nilpotent hence power-bounded for every `f`,
  so its `A°` is unbounded). Two steps of this are computations, not formalities, and are
  milestones of the example: the sheaf transfer requires identifying the **localized Milnor
  row** over each rational subset and checking strict exactness is preserved there; and the
  identification `𝓐⟨W/ϖ⟩ ≅ K⟨X, Q⟩/(Q²)` is a completed-localization calculation, not a
  formal localization identity. The example shows **sheafy ⇏ stably uniform**, answering [HK]
  Remark 3.16, and certifies that Layer 4 and [BV] each cover ground the other does not. The
  strong-sheafiness refinement (`𝓐⟨T₁, …, Tₙ⟩` sheafy for every `n`) is deliberately **not**
  a target.

---

### Layer 7: application — the adic Fargues–Fontaine curve

This layer constructs the curve with the theory built above; it is also the test that the
general theory is strong enough. Base case fixed by scope: **`E = Q_p`**
(so `W_{E°}(F°) = W(F°)`, `q = p`; the general `E` needs ramified Witt vectors, which Mathlib
does not have — successor roadmap) and **`F` a perfectoid field of characteristic `p`** with a
chosen pseudouniformizer `ϖ`, **not** assumed algebraically closed. Nothing in the
*construction* needs algebraic closedness; what needs it is the *structure theory* (below), so
the hypothesis is not carried here.

- **`A_inf` as a Huber ring.** `A_inf := W(O_F)` with the `(p, [ϖ])`-adic topology — in the
  Fargues–Fontaine literature this is what "the **weak topology**" means; it is neither the
  `p`-adic nor the Witt-coordinate topology, and the roadmap says so once, here. Milestones:
  `O_F` perfect and `ϖ`-adically complete; `A_inf` a **complete** Huber ring with pair of
  definition `(A_inf, (p, [ϖ]))`; and `A_inf⁺ = A_inf` (every element of an adic ring is
  power-bounded), which is the right plus ring **for `A_inf`** and, emphatically, *not* the
  pattern to copy for the Tate charts below.
- **The space `𝒴`.** `𝒴 := {v ∈ Spa(A_inf, A_inf) : v(p·[ϖ]) ≠ 0}` — open (a basic open),
  `φ`-stable, and **nonempty** (exhibit a Gauss point: the weighted Gauss value `w_ρ` bundled
  as a rank-`1` valuation, continuous for the weak topology, with `w_ρ(p[ϖ]) = ρ|ϖ| > 0`).
  `𝒴` is **not** the analytic locus: `𝒴 = D(p) ∩ D([ϖ])`, whereas the analytic locus of the
  ideal of definition is `D(p) ∪ D([ϖ]) = Spa(A_inf) ∖ V(p, [ϖ])`. Do not conflate them.
- **Frobenius and the windows.** `φ` = the Witt Frobenius, a ring automorphism of `A_inf` with
  `φ(p) = p` and `φ([x]) = [x]^p`, acting on `Spa` and preserving `𝒴`. **Pin both actions
  and the radius convention**: with `κ(v) := log v([ϖ]) / log v(p)` and the point action
  `φ_Spa(v) := v ∘ φ_Witt`, one has `κ ∘ φ_Spa = p·κ`; the inverse point action gives `p⁻¹κ`,
  and half the literature uses each. The **windows** `U_n := {p^n ≤ κ ≤ c·p^n}`,
  `V_n := {c·p^n ≤ κ ≤ p^{n+1}}` are stated rank-freely by clearing denominators
  (`κ ≥ a/b :⇔ v([ϖ])^b ≤ v(p)^a`), so no real-valued `κ` is ever constructed. Any
  `c ∈ (1, p) ∩ ℚ` works and the roadmap fixes `c = (p+1)/2`; this is **our** breakpoint, not
  Kedlaya's — his displayed windows use `1 + 1/p`, and the two agree only at `p = 2`. Say
  "our choice of breakpoint" and do not attribute the constant. Milestones: the windows
  **cover** `𝒴`, `φ` **shifts the index**, windows of the same family at different indices are
  **disjoint** — whence the `φ^ℤ`-action is **free** and **wandering** (Kedlaya's "properly
  discontinuous"), the two facts that make the quotient legitimate.
- **The curve.** `𝒳 := 𝒴 / φ^ℤ` with the quotient topology: the quotient map is an **open
  quotient map**, is **injective on each window**, the images of `U_0` and `V_0` **cover** `𝒳`,
  and `𝒳` is **`T0`** and **quasi-compact**. Quasi-compact does not mean affinoid — that `𝒳`
  is *not* affinoid is a separate structural statement, and the two-chart cover is not a proof
  of it.
- **The charts are strongly noetherian, hence sheafy.** The interval ("Robba") rings `B^I` for
  a closed `I = [s, r] ⊂ (0, ∞)`, `λ_I = max(λ_s, λ_r)`: **`B^I` is strongly noetherian**
  (Kedlaya, *Noetherian properties of Fargues–Fontaine curves*, Thm 4.10 — its hypotheses ask
  only for a perfect complete nonarchimedean `F`, so this is where the no-algebraic-closedness
  scope is used), hence `Spa(B^I, B^{I,+})` is **sheafy by Layer 4**. This is the roadmap's
  own sheafiness theorem in use, and it is the standard route for the *absolute*
  curve; the relative curve over a perfectoid base goes instead through stable uniformity
  (successor roadmap, and the reason Layer 6's [BV] theorem is not a detour).
  Three pins. **(i) The plus ring**: `B^{I,+} := {x : λ_I(x) ≤ 1}`, which since `λ_I` is
  power-multiplicative is exactly the power-bounded subring; that it agrees with the integral
  closure of the image of the localized `A_inf` — the description that makes the chart a
  *rational subset* of `Spa(A_inf, A_inf)` — is a **theorem to prove**, not a definitional
  identification. Sheafiness is insensitive to the choice, but `Spa(B, B⁺)` is not.
  **(ii) The radius dictionary is reciprocal**: in the `ρ`-Gauss convention
  `‖Σ [x_m]p^m‖_ρ = max_m ρ^m |x_m|` with `|ϖ| = p^{-α}` and `r := −log_p ρ`, one computes
  `κ = α/r`, so a `κ`-window `[a, b]` corresponds to `r ∈ [α/b, α/a]`, i.e.
  `ρ ∈ [|ϖ|^{1/a}, |ϖ|^{1/b}]` — the endpoints swap and invert. State the conversion lemma
  and prove it; do not identify the two parameters by notation, and expect sign/reciprocal
  slips to be the failure mode a wrong guess produces. **(iii) The completion model**:
  realising `B^I` as the closure of the diagonal image of the localization in the product of
  the two completed endpoint fields (with the **max** norm) is faithful *provided* the diagonal
  is an isometry for `λ_I` and injective — the checklist is: the algebraic source is dense in
  Kedlaya's `B_{F,Q_p}` for `λ_I`; each endpoint norm matches his normalization exactly; each
  is multiplicative and separated; the product carries the max norm; the diagonal norm is
  `λ_I` on the nose (not merely equivalent); the map from the abstract completion is an
  isometric isomorphism onto the closure; and the model is compatible with restriction
  `B^I → B^J` and with `φ`. One warning the closure model builds in for free: only **finite**
  Witt sums are dense in `B^I` — do not assume every element admits a globally convergent
  Witt expansion, and do not state milestones that would require one.
- **The structure sheaf and the `𝒱`-object.** The presheaf on `𝒳` defined by `φ`-**invariant**
  sections over saturated preimages — a **topological** equalizer, not merely a ring-level
  invariant subring — with the milestone that it **is a sheaf of topological rings**
  (§Layer 3's definition of record), and the packaging of `𝒳` as an object of `𝒱` with
  valuations on stalks. Two clauses that must be proved, not assumed: the stalk valuations
  must be **independent of the orbit representative**, and they must factor through the residue
  fields.
- **The main statement: `𝒳` is an adic space.** Every point has an open neighbourhood **isomorphic in
  `𝒱`** — not merely homeomorphic — to `Spa` of a sheafy complete strongly noetherian Tate
  affinoid. This is the one place where the provenance stops short and the roadmap must be
  read as a specification: what exists there is the **topological** chart (a homeomorphism onto
  the image of a window), and the remaining work is the `𝒱`-upgrade — matching structure
  sheaves *on every subopen* with their restriction maps, the stalks, the valuations, and
  `𝒪⁺`. The expected route is the wandering-slice identity
  `q⁻¹(q(W)) = ⊔_{n ∈ ℤ} φⁿ(W)` together with `𝒪_𝒴(q⁻¹(q(W)))^φ ≅ 𝒪_𝒴(W)`, proved sheafwise
  and topologically. No further global gluing theorem is needed after that: local isomorphism
  in `𝒱` *is* Layer 5's definition. **A second route worth costing before taking the first**:
  Wedhorn **Remark 8.27** says a pre-adic space is an adic space as soon as it has a cover by
  open affinoids `Spa A` with `A` **stably** sheafy — and stable sheafiness of the chart rings
  is exactly what Kedlaya 4.10 gives, since it makes every `B^I⟨T₁, …, T_k⟩` noetherian, hence
  every topologically finite-type `B^I`-algebra sheafy by 8.28(b). Two costs must be priced
  into that trade before choosing it: `𝒳` still has to be exhibited as a **pre-adic space**
  in the first place — charts as morphisms of pre-adic spaces, which is much of route (a)'s
  content returning through the back door — and the stable-sheafiness step needs **quotient
  permanence** spelled out: a topologically finite-type `B^I`-algebra is a complete quotient
  of some `B^I⟨T₁, …, T_k⟩`, noetherianness passes to quotients, and only then does 8.28(b)
  apply. Decide which route before starting, and record the decision here.
- **Independence of choices.** `𝒴` and `𝒳` must be proved independent of the pseudouniformizer
  `ϖ` (the windows are not — they are indexed by the choice, which is exactly why this needs
  saying).

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
  the sheafiness theorem were pinned correctly.
- **The Layer-6 example.** `(𝓐, 𝓐°)` sheafy, `𝓐` uniform non-noetherian domain,
  `𝓐⟨W/ϖ⟩` not uniform (`finiteJet_isSheafy`, `finiteJet_isUniform`,
  `finiteJet_not_noetherian`, `finiteJet_not_stablyUniform`) — the definitions survive a
  worked example that Layer 4 alone and [BV] alone cannot reach, and [HK] Remark 3.16 is
  answered in Lean.
- **The Fargues–Fontaine curve exists and is nonempty.** `𝒴` contains the Gauss point, `𝒳` is
  quasi-compact and `T0`, the images of `U_0` and `V_0` cover it, and its structure presheaf is
  a sheaf of topological rings — the first Layer-7 facts (`Y_nonempty`, `instCompactSpaceCurve`,
  `instT0SpaceCurve`, `curve_eq_image_window_zero`, `xPresheaf_isSheafOfTopologicalRings`).
- **The curve's charts are Layer 4's theorem in action.** `B^I` strongly noetherian
  (Kedlaya 4.10) feeding the sheafiness theorem to give `Spa(B^I, B^{I,+})` sheafy — the
  acceptance test that the general machinery is strong enough for the object it was built for
  (`isStronglyNoetherian_BISub`, `isSheafy_BISub`).
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
affinoids). Layer 6 (uniformity, [BV], and the worked example) consumes Layers 3–4 in
full — the example's vertices are Layer-4 instances — and is independent of Layer 5, so it can
proceed in parallel once Layer 3 lands; its stable-uniformity material is also what a future
*relative* Fargues–Fontaine curve would need, where strong noetherianity fails. Layer 7 (the
curve) consumes the most: Layer 0's Huber/Tate vocabulary and restricted
power series for `A_inf` and the interval rings, Layer 2's `Spa` and rational subsets for `𝒴`
and the charts, Layer 3's presheaf and its sheaf-of-topological-rings definition for the
descended structure sheaf, **Layer 4's sheafiness theorem** for the charts, and Layer 5's
definition of an adic space for its final clause. Its `A_inf` and window strand is independent
of Layers 4–6 and can start as soon as Layer 2 lands, which is why the provenance could get so
far ahead of the general machinery.

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
- K. Kedlaya, *Noetherian properties of Fargues–Fontaine curves*
  ([arXiv:1410.5160](https://arxiv.org/abs/1410.5160)) — Def. 4.2 (the interval rings `B^I`
  and `λ_I`) and Thm 4.10 (`B^I` is strongly noetherian), Layer 7's chart input; its
  hypotheses need only a perfect complete nonarchimedean field.
- L. Fargues, J.-M. Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge p-adique*,
  Astérisque 406 (2018) — the curve and its structure theory (the latter is the successor
  roadmap).
- P. Scholze, J. Weinstein, *Berkeley Lectures on p-adic Geometry*, Annals of Mathematics
  Studies 207 (2020) — §12.2, §13.1, Def. 13.5.1 (`A_inf`, the weak topology, `κ ∘ φ = pκ`,
  and `𝒳_FF = 𝒴_{(0,∞)}/φ^ℤ`).
- K. Kedlaya, *Sheaves, stacks, and shtukas* (Arizona Winter School 2017) — §3.1 and
  Remark 3.1.9: the window covering, proper discontinuity, and the two-chart cover of the
  quotient.
- C. Birkbeck, T. Feng, D. Hansen, S. Hong, Q. Li, A. Wang, L. Ye, *Extensions of vector
  bundles on the Fargues–Fontaine curve*
  ([arXiv:1705.00710](https://arxiv.org/abs/1705.00710)) — Definition 2.1.1, the statement of
  the adic curve that Layer 7 formalizes (specialised to `E = Q_p`).
- The Layer-6 worked example has **no paper reference** — it is a one-off construction for this roadmap, specified self-containedly
  in §Layer 6, and its reference is the `sorry`-free AINTLIB formalisation pinned in
  §Provenance (the `FJP/` directory and its capstone exports).
- L. Henkel, *An Open Mapping Theorem for rings which have a zero sequence of units*
  (arXiv:1407.5647) — the Tate-ring open mapping theorem (Layer 0).
- K. Hübner, *Adic spaces* (lecture notes, arXiv:2405.06435) — the
  separatedness-of-structure-presheaves route the provenance's Layer-4 files follow.
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
**AINTLIB** (`github.com/CBirkbeck/AINTLIB`; public, **Apache-2.0**): branch
`dev/adic-spaces @ 59bbbe8ba14a` (2026-07-28),
project `projects/AdicSpaces/` — **363 Lean files, 507 file-level `sorry` occurrences overall** (≈250 Lean files; the audit below counts `sorry` occurrences per file at
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
  (sorry-free compactness inputs). The spectrality machinery `SpvAITopology.lean` carries
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
  hypotheses (Zavyalov-refinement, Laurent-overlap "Lane A", separation "Lane B"). Migration
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
  `finiteJet_not_noetherian`, `finiteJet_not_stablyUniform`). These consume the 828b
  capstone and the `IsSheafy` infrastructure, so their effective status inherits the Layer-3/4
  audit above; strong sheafiness (`𝓐⟨T₁, …, Tₙ⟩` sheafy for every `n`) is not attempted there, and is not a
  target here either (§Layer 6). The `[BV]` theorem is absent from the provenance and is built
  here.
- **Layer 7 — the Fargues–Fontaine curve (the furthest-advanced strand).** The
  `Adic spaces/FarguesFontaine/` directory: **39 files, `0` `sorry`s at file
  level.** Foundations `WittF.lean`, `PerfectoidFieldCharP.lean`, `AinfHuber.lean` (`A_inf`
  complete Huber, `A_inf⁺ = A_inf`); the space `YSpace.lean` (`Y`, the rank-free `KGE`/`KLE`
  radius predicates, the windows, covering, translation, disjointness), `YCharts`,
  `BigWindows`, `YPresheaf`, `YSheaf` (`yVObj`: `𝒴` as a `𝒱`-object), `YStalks`;
  `GaussNorm`/`GaussPoint` (`Y_nonempty'`); the Frobenius strand
  (`FrobeniusAction/Gauss/Limit/Spa/Valuation`, `UniformizerEquivariance`,
  `UniformizerTwist`); the interval-ring strand (`IntervalRing`, `IntervalCoordinates`,
  `IntervalSplitting`, `ArCompletion`, `GaussNorm`, `Euclidean`, `Groebner`, `Presentation`,
  `RobbaPresentation`, `RobbaCorrespondence`, `RobbaLoc`) culminating in
  `StronglyNoetherianB.lean` (`isStronglyNoetherian_BISub`, Kedlaya 4.10) and `SheafyBI.lean`
  (`isSheafy_BISub`, **through the roadmap's own sheafiness theorem**); `Curve.lean` (the
  curve, freeness, wandering, open quotient map, window injectivity, the two-chart cover,
  `T0Space`, `CompactSpace`); `CurveAdicPresentation.lean` (`curveAdicSpacePresentation`,
  `yAdicSpacePresentation` — **topological charts only**, by their own docstrings); and
  `CurveObject.lean` (`xPresheaf_isSheafOfTopologicalRings`, `xVObj`). **The honest
  reading**: these files are `sorry`-free but sit on the Layer-3/4 machinery that is *not* —
  `isSheafy_BISub` reaches `isSheafy_of_stronglyNoetherian_828b`, whose own dependency cone is
  the audit gate above. So "the curve is done" means "done modulo the general theory this
  roadmap is asking for".
  The `𝒱`-level chart isomorphism (§Layer 7's final clause) is genuinely absent and is
  specification, not migration. A planning packet for this campaign
  (`.mathlib-quality/chatgpt-packet-fargues-fontaine-plan-2026-07-24.md`) records the scope
  decisions and the questions that shaped them.
- **Vendored inputs.** `Vendored/Coram*`/`Vendored/Xia*` — the Gauss-norm and `MvPowerSeries`
  equivalence material; the `Coram*` files are **William Coram's** restricted-power-series
  work, whose Mathlib face is `PowerSeries.IsRestricted` (consume section) — check for
  upstream overlap at migration time, and coordinate with him rather than porting blindly.

The audit method above is file-level `grep`-counting of `sorry` at the pinned revision: it
over-counts (comments mentioning the word) and cannot see cross-file dependence, which is why
the migration contract for every "sorry-free" claim is a `#print axioms` gate on the actual
capstones in TauCeti CI. Layer 6's reference is the formalisation itself — the `FJP/`
directory, whose file docstrings carry the construction and statements — together with this
roadmap's self-contained §Layer 6; there is no paper to consult.
