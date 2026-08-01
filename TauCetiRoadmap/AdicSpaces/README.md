# Roadmap: foundations of adic spaces

This roadmap develops the foundations of Huber's theory of adic spaces in Lean. It begins with
Huber rings and Tate rings, constructs the valuation spectrum `Spv A` and the adic spectrum
`Spa (A, A⁺)`, defines rational localizations and the structure presheaf, and proves the
sheafiness theorem with Čech acyclicity for strongly noetherian Tate rings. It then defines
adic spaces and applies the theory to construct the adic Fargues–Fontaine curve for `E = ℚ_p`
and a perfectoid field `F` of characteristic `p`.

Parts of this development already exist in AINTLIB. The provenance section records the exact
commit and distinguishes results proved without additional axioms from results whose dependency
cones still contain `sorry`. Several closely related APIs are currently under review in
Mathlib, and this roadmap follows those decisions rather than introducing competing
definitions (see *Coordination with Mathlib*).

The roadmap does not treat: étale cohomology of adic spaces; rigid-analytic formal models,
Raynaud generic fibres, or GAGA; Berkovich spaces and the comparison functors; fibre products
of adic spaces; almost mathematics; derived and condensed approaches to sheafiness
(Andreychev, Clausen–Scholze); perfectoid rings, spaces, tilting, and diamonds beyond the
tilting-free perfectoid-field input Layer 7 needs; Huber's other sheafiness cases (noetherian
ring of definition, [Hu2] Theorem 2.2(i)); or the structure theory of the Fargues–Fontaine
curve beyond its construction — vector bundles and `𝒪(λ)`, Harder–Narasimhan, the
classification theorem, `B_dR`/`B_cris`, classical points, the curve for general `E`, the
relative curve, and the schematic curve are all left to a successor roadmap, and §Layer 7
records the dependency order such a roadmap should follow.

Suggested home: `TauCeti/RingTheory/Huber/` for the ring-level theory,
`TauCeti/AlgebraicGeometry/AdicSpace/` for `Spv`/`Spa`/presheaf/spaces.

## Coordination with Mathlib

Mathlib now has open PRs developing exactly this material: mathlib4#38009 (the valuation
spectrum `Spv A` and its topology, built on `ValuativeRel`), mathlib4#42312 (Huber rings), and
mathlib4#42315 (`Spa (A, A⁺)` as a topological space, with continuous valuations), with more
of the series expected. Three consequences for this roadmap.

1. The intended final form of `Spa` is a subspace of `Spv A`, so points are valuations up to
   equivalence — the `ValuativeRel` design. Layers 1–2 are stated in that form.
2. The Layer-0–2 names and structures will follow the upstream decisions once those PRs are
   reviewed; where prototypes here or in `Suggested.lean` differ from what lands, upstream
   wins at migration time.
3. Nothing in Layers 3–7 depends on the unsettled parts of the upstream API beyond the
   existence of `Spv`, `Spa`, and rational subsets, so those layers can be specified now.

## Standing conventions

- **Valuations up to equivalence are Mathlib's `ValuativeRel`.** The valuation spectrum is the
  type of `ValuativeRel` instances on `A`; facts about a single representative valuation go
  through `Valuation.Compatible`.
- **`A⁺` is explicit data, not a typeclass.** A ring of integral elements is not canonical:
  one Huber ring has many, and the theory compares them, quantifies over them, and changes
  them under localization. So: properties of the underlying ring (`IsHuberRing A`,
  `IsTateRing A`, `IsStronglyNoetherian A`, `IsUniform A`) are `Prop`-valued mixins over
  `[CommRing A] [TopologicalSpace A] [IsTopologicalRing A]`; ordinary theorems take
  `Aplus : Subring A` with `IsRingOfIntegralElements Aplus` as explicit arguments; and where
  the pair is genuinely a categorical object there is a bundled structure

  ```lean
  structure HuberPair (A : Type u) [CommRing A] [TopologicalSpace A] where
    plus : Subring A
    isRingOfIntegralElements : IsRingOfIntegralElements plus
  ```

  with morphisms of pairs carrying continuity and `f(A⁺) ⊆ B⁺`. This matches the direction of
  the upstream `Spa` PR, which passes the plus subring explicitly. Neither the Lean 3
  perfectoid project's globally bundled pair nor a global `A⁺`-typeclass is followed.
- **Completeness.** A topological ring is complete when `CompleteSpace A` holds for the
  canonical uniformity `IsTopologicalAddGroup.rightUniformSpace A`. Note the convention gap:
  Wedhorn's "complete" includes Hausdorff, Lean's `CompleteSpace` does not. Every milestone
  says explicitly whether Hausdorff is assumed.
- **Spectrality is Mathlib's `SpectralSpace`** (`Topology/Spectral/Basic.lean`, Stacks 08YG),
  which extends `T0Space`, `CompactSpace`, `QuasiSober`, `QuasiSeparatedSpace`, and
  `PrespectralSpace`, with `PrimeSpectrum` the worked model.
- **Wedhorn's numbering is the shared coordinate system.** Milestones cite Wedhorn
  (arXiv:1910.05934, v1 — the only version) by result number, with Huber's originals in
  parallel. The sheafiness theorem is Theorem 8.28(b); Definition 8.26 is sheafy/stably
  sheafy; Remark 8.27 is the stable-sheafiness criterion for a pre-adic space to be adic.
  Wedhorn's Propositions 6.17–6.18 have no printed proofs; they are proved here via Henkel's
  open mapping theorem.
- **Sources.** Wedhorn is a survey and Huber is the origin; neither is Mathlib-grade API, so
  the specification here is its own document. Where existing Lean work proves a milestone,
  that is provenance, not the standard it is judged against.

## What Mathlib already has (consume)

- **Valuative relations.** `ValuativeRel R`, the canonical valuation into
  `ValueGroupWithZero R`, `Valuation.Compatible`, `ValuativeExtension`, the induced topology,
  `DiscreteValuativeRel`.
- **Nonarchimedean topological algebra.** `NonarchimedeanRing`, `OpenSubgroup`, adic
  topologies and `IsAdic`, `IsTopologicallyNilpotent`, boundedness, topological
  subring/quotient instances.
- **Completions.** `UniformSpace.Completion` for topological rings; the algebraic
  `AdicCompletion` with `AdicCompletion.flat_of_isNoetherian` (Stacks 00MB), the flatness
  input of Layer 4.
- **Valued fields and examples.** `Valued`, `ℚ_[p]`/`ℤ_[p]`, Laurent series `F⸨t⸩`,
  `Valuation.RankOne`.
- **Spectral spaces.** The `SpectralSpace` bundle and its parents, with `PrimeSpectrum`.
- **Presheaf machinery.** `TopCat.Presheaf`, `PresheafedSpace`, stalks, categorical limits;
  `HomologicalComplex` and exactness for Layer 4's Čech complexes.
- **Perfectoid and period-ring material.** `Mathlib/RingTheory/Perfectoid/` has Fontaine's
  `θ`, untilts, and `B_dR`; `WittVector` has Frobenius, Teichmüller lifts, and `p`-adic
  completeness of `W(k)`. Layer 7 consumes the Witt-vector API; the `θ`/`B_dR` material
  belongs to the successor roadmap and is recorded so neither is rebuilt.
- **Restricted power series, normed flavour.** `PowerSeries.IsRestricted` is William Coram's
  work and the normed-ring cousin of Layer 0's adically restricted series; coordinate with him
  and with it rather than duplicating.

## The build, in layers

### Layer 0: Huber rings and Tate rings (Wedhorn §6; [Hu1] §1, [Hu2] §1)

**Definitions.** A ring of definition of a topological ring `A` is an open subring `A₀ ⊆ A`
whose subspace topology is `I`-adic for a finitely generated ideal `I ⊆ A₀`. A Huber ring is a
topological ring admitting a ring of definition; a Tate ring is a Huber ring with a
topologically nilpotent unit (a pseudouniformizer). Define the topologically nilpotent
elements `A°°`, the power-bounded subring `A°`, restricted power series `A⟨T₁, …, Tₖ⟩` (the
completed algebra: coefficients tending to `0`, with its Huber topology), and strong
noetherianness: `A` is strongly noetherian when every completed algebra `A⟨T₁, …, Tₖ⟩` is
noetherian.

**Main results.**

- Basic theory of rings of definition (Corollary 6.4, Lemma 6.6): powers of `I` are open,
  elements of `I` are topologically nilpotent, rings of definition are exactly the open,
  bounded, adically topologized subrings. A Huber ring is nonarchimedean. `A°` is open and
  integrally closed. In a Tate ring, a pseudouniformizer lies in every ring of definition
  after a power, and `(ϖⁿA₀)ₙ` is a neighbourhood basis of `0`.
- **Completion.** The completion of a Huber ring is a complete Hausdorff Huber ring, with a
  pair of definition induced from any pair for `A`, and completion preserves the Tate
  property. The canonical map `A → Â` has dense image and kernel `closure {0}`. If `A` is
  Hausdorff, it is a topological embedding with dense image. ([Hu2] Lemma 1.6, Wedhorn §6.4.)
- **Strong noetherianness.** The `k = 0` case says that `Â` is noetherian; in particular a
  complete strongly noetherian Tate ring is noetherian. Complete nonarchimedean fields with a
  rank-one valuation are strongly noetherian (BGR 5.2.6) — stated and proved at rank one,
  which is what the examples (`ℚ_p`, `F⸨t⸩`) and Layer 7's interval rings need; it is not
  claimed for higher-rank valued fields.
- **The open mapping theorem** (Henkel, arXiv:1407.5647). State Henkel's theorem with its
  hypotheses: over a topological ring admitting a zero sequence of units, a continuous
  surjective linear map between complete, Hausdorff, first-countable topological modules is
  open. Derive the corollary used later: a continuous surjective map between completely
  metrisable topological modules over a complete Tate ring is strict (equivalently, open onto
  its image with the quotient topology). This discharges Wedhorn's Propositions 6.17–6.18 and
  is the topological input to Layer 4's separatedness argument.
- **Examples.** Discrete rings are Huber (`(A, (0))`); `ℚ_[p]` is Tate; `ℤ_[p]` is Huber and
  not Tate; `F⸨t⸩` is Tate; `ℚ_p⟨T⟩` is Tate and strongly noetherian.

**Dependencies.** Mathlib only.

**Status.** Huber rings are under review in mathlib4#42312. The AINTLIB Layer-0 files are
listed in the status table; the open-mapping files are incomplete.

### Layer 1: the valuation spectrum (Wedhorn §4; [Hu1])

**Definitions.** `Spv A` is the type of `ValuativeRel` instances on `A`, with the topology
generated by the basic opens `{v : v f ≤ v s ≠ 0}`; the support `supp v` (a prime ideal);
functorial `comap` along ring maps; lifts to quotients `Spv (A ⧸ 𝔞)` for `𝔞 ≤ supp v` and to
localizations.

**Main results — spectrality, as a theorem-level plan.**

1. Define the constructible (patch) topology, in which each basic open and its complement are
   open.
2. Prove compactness of the constructible space.
3. Deduce quasi-compactness of each basic open in the spectral topology.
4. Prove the basic opens form a basis closed under finite intersections.
5. Prove `T0`.
6. Construct generic points of irreducible closed subsets (quasi-sobriety), and conclude
   `SpectralSpace (Spv A)`.

The model is Mathlib's Hochster development for `PrimeSpectrum`. The same machinery then
yields, in Layer 2: `Cont A` is proconstructible in `Spv A`, hence spectral; `Spa (A, A⁺)` is
proconstructible in `Cont A`, hence spectral; rational subsets form a basis of quasi-compact
opens.

Also: vertical and horizontal specialization of valuations, in the amount Layer 2's analysis
of `Cont` uses.

**Dependencies.** Layer 0 vocabulary; Mathlib's `ValuativeRel`.

**Status.** `Spv` and its topology are under review in mathlib4#38009. The AINTLIB
spectrality file is the least complete part of the existing development (36 direct `sorry`s).

### Layer 2: continuous valuations, pairs, and `Spa` (Wedhorn §7; [Hu1] §3)

**Definitions.** `v.IsContinuous` over a Huber ring (`{a | v a < γ}` open for every `γ` in
the value group); `Cont A ⊆ Spv A` as a subspace. `IsRingOfIntegralElements (Aplus : Subring A)`:
open, integrally closed, contained in `A°` (Definition 7.14). The bundled `HuberPair` and
morphisms of pairs (continuous ring maps with `f(A⁺) ⊆ B⁺`), per the conventions.
`Spa (A, A⁺) = {v ∈ Cont A : ∀ a ∈ A⁺, v a ≤ 1}` with the subspace topology. Rational
subsets `R(T/s)` for finite `T ⊆ A` with `s ∈ T` and the ideal `T·A` open — for a Tate ring,
the openness condition is equivalent to the elements of `T` generating the unit ideal,
`(T)A = A`. (It does not require any element of `T` to be a unit: in `K⟨X⟩` the set
`{X, 1 − X}` generates the unit ideal with both members nonunits.)

**Main results.** Any open integrally closed subring contains `A°°`; `A°` is the maximal ring
of integral elements. `Cont A` is spectral ([Hu1] Theorem 3.1 shape). `Spa (A, A⁺)` is
spectral with the rational subsets a basis of quasi-compact opens (Theorem 7.35); rational
subsets are stable under finite intersection (Remark 7.30);
`Spa (A, A⁺) = ∅ ↔ A = 0` for complete `A` (Proposition 7.32 shape);
`A⁺ = {f : ∀ v ∈ Spa (A, A⁺), v f ≤ 1}` for complete pairs (Proposition 7.52 shape).
Functoriality of `Spa` in morphisms of pairs.

**Dependencies.** Layers 0–1.

**Status.** `Spa` as a topological space is under review in mathlib4#42315. AINTLIB's files
here are close to complete (see the table).

### Layer 3: rational localization, the structure presheaf, and the categories (Wedhorn §7.5–§8.1; [Hu2] §1)

**Definitions.**

- **Rational localization, by its universal property.** For a rational subset `U = R(T/s)` of
  `X = Spa (A, A⁺)`, the localization is a complete Huber pair `(A⟨T/s⟩, A⟨T/s⟩⁺)` together
  with a morphism of pairs `(A, A⁺) → (A⟨T/s⟩, A⟨T/s⟩⁺)` such that: the map is continuous;
  `s` becomes invertible; `t/s ∈ A⟨T/s⟩⁺` for every `t ∈ T`; and the pair is initial among
  complete pairs over `(A, A⁺)` with these properties — every such morphism of pairs factors
  through it uniquely, by a continuous morphism of pairs. The plus ring is defined: the
  integral closure in `A⟨T/s⟩` of the image of the subring generated by `A⁺` and the
  fractions `t/s`. The construction is a quotient of Layer 0's restricted power series
  `A⟨X_t⟩`; the universal property, not the construction, is the public interface. Iterated
  localization: a rational subset of a rational subset is rational in `A` (Lemma 7.54 =
  [Hu2] Lemma 2.6).
- **Strictification.** The universal property determines the ring only up to canonical
  isomorphism, and a presheaf needs actual restriction maps. Milestones: the canonical
  isomorphism between the localizations of two presentations of the same rational subset;
  compatibility of these isomorphisms over triples of presentations; the restriction maps for
  inclusions of rational subsets; the identity and composition laws.
- **The structure presheaf.** On rational `U`, `𝒪_X(U) = A⟨T/s⟩`; on an arbitrary open, the
  limit over the rational subsets it contains. Values are complete topological rings. Define
  `𝒪_X⁺(U) = {f ∈ 𝒪_X(U) : v_x(f_x) ≤ 1 for every x ∈ U}`, with its stalk description.
  Stalks `𝒪_{X,x}` are formed as colimits of rings — they carry no useful topology and none
  is claimed; they are local rings, and each point's valuation extends to the stalk and
  factors through its residue field.
- **The category ladder** (Wedhorn §8.1–8.2). `𝒱^pre`: topological spaces with a presheaf of
  complete topological rings and an equivalence class of valuations on each stalk; morphisms
  are continuous maps with presheaf maps compatible with the valuations. Affinoid pre-adic
  spaces: objects of `𝒱^pre` isomorphic to some `Spa (A, A⁺)` with its presheaf (Remark and
  Definition 8.10). Pre-adic spaces: objects of `𝒱^pre` admitting an open cover by affinoid
  pre-adic spaces, with the presheaf adapted to that affinoid basis. `𝒱`: the full
  subcategory of `𝒱^pre` whose structure presheaf is a sheaf of topological rings. Mathlib's
  `PresheafedSpace` is the substrate.
- **Sheafiness, three notions with three names.** `IsSheafyPair A Aplus`: the structure
  presheaf of this `Spa (A, A⁺)` is a sheaf of topological rings (every open cover's
  equalizer diagram is a limit in the category of topological commutative rings, so glued
  sections carry the right topology). `IsSheafyRing A`: Wedhorn's ring-level notion
  (Definition 8.26), which quantifies over the rings of integral elements of the completion.
  `IsStablySheafyRing A`: sheafy after every topologically finite-type extension. State the
  implications between the three; they are not interchangeable, and each later use names the
  one it means.

**Main results.** `𝒪_X(X) = A` for complete `(A, A⁺)` ([Hu2] Proposition 1.6 shape). The
finite-cover criterion: `IsSheafyPair A Aplus` holds if and only if the equalizer condition
holds for finite rational covers of rational subsets. The proof needs, as named steps:
rational subsets form a basis closed under finite intersections; rational subsets are
quasi-compact; every open cover of a rational subset refines to a finite rational cover; the
basis-sheaf criterion for presheaves valued in topological rings; the identification of the
equalizer topology (products and equalizers in the category of topological rings are created
by the forgetful functor and preserve completeness); and the extension from the rational
basis to the limit-extended presheaf on all opens. Sheafiness transports along isomorphisms
of pairs and is insensitive to completion.

**Dependencies.** Layer 2; Layer 0's restricted series and completions.

**Status.** This is the largest open part of the existing development (see the table).

### Layer 4: sheafiness and Čech acyclicity for strongly noetherian Tate rings (Wedhorn §8.2; [Hu2] Theorem 2.2(ii), 2.5; Tate 1971)

Base hypotheses, fixed for the layer: `A` a complete Hausdorff strongly noetherian Tate ring,
`Aplus` a ring of integral elements. No domain hypothesis, no noetherian ring of definition,
no discreteness of value groups. (Wedhorn states 8.28 for the completion; the complete
Hausdorff version proved here recovers his formulation through Layer 3's
completion-insensitivity.)

**Main results.**

- **Cover normalization.** Every open cover of `X` refines to a finite rational cover; every
  finite rational cover refines to a standard (Laurent-type) cover; acyclicity reduces to
  simple Laurent covers `{v f ≤ 1} ∪ {v f ≥ 1}` by induction (Wedhorn Lemma 8.31/8.34 shape).
- **The flatness bridge, in five named steps.** (i) The algebraic prelocalization
  `A[1/s]`-algebra from which the rational localization is completed; (ii) the finitely
  generated ideal defining its topology; (iii) the theorem that the rational localization is
  the adic completion of that algebra along that ideal; (iv) the noetherian hypotheses,
  supplied by strong noetherianness; (v) the application of Mathlib's
  `AdicCompletion.flat_of_isNoetherian`. Without steps (i)–(iv) the Mathlib lemma does not
  attach to the construction.
- **Separatedness.** Over a rational cover, the restriction map into the product of the cover
  rings is injective with closed image and the quotient topologies match (Wedhorn Corollary
  8.32, Lemmas 8.33–8.34), using the open-mapping corollary from Layer 0.
- **The sheafiness theorem.** `IsSheafyPair A Aplus` under the layer's hypotheses — Wedhorn
  Theorem 8.28(b), [Hu2] Theorem 2.2(ii) — by Laurent-cover induction on the Čech complex,
  Tate's argument in Huber's generality.
- **Čech acyclicity, in all degrees.** For every rational subset `U` and finite rational cover
  `𝔘` of `U`, the augmented Čech complex `0 → 𝒪_X(U) → ∏ 𝒪_X(U_i) → ∏ 𝒪_X(U_ij) → ⋯` is
  exact, over Mathlib's `HomologicalComplex` API. This is the Čech-level version used by all
  later applications. Wedhorn's own statement of 8.28 is the sheaf property together with the
  vanishing `H^q(U, 𝒪_X) = 0` for `q ≥ 1`; deducing that form requires a Čech-to-sheaf-
  cohomology comparison, and this roadmap does not develop sheaf cohomology. The claim made
  and proved here is the Čech-acyclicity theorem, and the text says so rather than calling it
  verbatim 8.28.
- **The classical corollary.** Tate's 1971 acyclicity for `ℚ_p⟨T⟩` and its standard Laurent
  covers, as a worked instance.

**Dependencies.** Layer 3; Layer 0's open mapping theorem and strong noetherianness;
Mathlib's completion flatness.

**Status.** The AINTLIB capstone exists with exactly this hypothesis bundle but sits in a
13,000-line file with 9 direct `sorry`s; the dependency cone must be audited and the file
decomposed before anything counts as discharged. The all-degrees statement is new.

### Layer 5: adic spaces (Wedhorn §8.2–8.3, Definition 8.22; [Hu2] §2)

**Definitions.** Affinoid adic spaces: objects of `𝒱` isomorphic to `Spa (A, A⁺)` for a pair
with `IsSheafyPair`. Adic spaces: objects of `𝒱` locally isomorphic in `𝒱` to affinoid adic
spaces — carrying the presheaf and the stalk valuations, not merely locally homeomorphic.
Morphisms are `𝒱`-morphisms; open adic subspaces.

**Gluing, specified.** Gluing data: an index set, objects of `𝒱`, open subobjects, transition
isomorphisms, and the cocycle condition. Construction: the quotient topological space; the
glued presheaf and the sheaf property; the glued stalk valuations; the universal property of
the glued object; preservation of the pre-adic and adic conditions.

**Examples.** `Spa (K, K°)` for a complete nonarchimedean field, with points classified by
the rank filtration. The closed unit disc `Spa (ℚ_p⟨T⟩, ℤ_p⟨T⟩)`, an adic space by Layer 4.
The open unit disc: the union of the increasing family of rational closed discs
`{v : v(Tⁿ) ≤ v(p)}` for `n ≥ 1`, whose radii `|p|^{1/n}` increase to `1`, with the affinoid
rings `ℚ_p⟨T, Tⁿ/p⟩` and the evident transition maps; glued by the construction above. It is
not affinoid: it is not quasi-compact, and every affinoid adic spectrum is quasi-compact.

**Dependencies.** Layers 3–4.

**Status.** The existing `AdicSpace` structure in provenance asks only local homeomorphism
and is a placeholder; this layer's definition is the specification.

### Layer 6: uniformity, Buzzard–Verberkmoes, and a new counterexample ([BV]; [HK])

**Definitions.** `IsUniform A` (`A°` bounded, Definition 7.36); `IsStablyUniform A Aplus`
(every rational localization is uniform, Definition 7.37).

**Main results.** Stably uniform complete Tate pairs are sheafy ([BV], in the
bounded-denominator formulation) — the sheafiness criterion complementary to Layer 4.

**A new counterexample.** Hansen–Kedlaya (April 2025) record as open whether a uniform
sheafy Huber ring must be stably uniform ([HK] Remark 3.16). The following construction
answers that question negatively, and the proof is the AINTLIB formalisation (the `FJP/`
directory, eleven files, no direct `sorry` at the pin). Its formal status carries the same
caveat as everything downstream of Layer 4: the files consume the sheafiness capstone, so
the machine-checked claim is complete once the Layer-4 dependency cone is closed and the
`#print axioms` audit passes — the standard migration gate, applied here as elsewhere.

Over `K = F⸨t⸩`: let `L = K⟨W, W⁻¹⟩`, `𝓑 = K⟨W, Q⟩/(Q²)`, `𝓒 = L⟨Q⟩`, `𝓓 = L⟨Q⟩/(Q²)`, and
`𝓐 = 𝓑 ×_𝓓 𝓒` — concretely, the closed subring of `𝓒` of series whose `Q⁰`- and
`Q¹`-coefficients have nonnegative `W`-support. The claims: `𝓐` is a uniform non-noetherian
domain; `(𝓐, 𝓐°)` is sheafy, by transferring the sheaf condition across the strict Milnor
square `0 → 𝓐 → 𝓑 ⊕ 𝓒 → 𝓓 → 0` from the three vertices, each a complete strongly noetherian
Tate ring (two non-reduced), hence sheafy by Layer 4; and `𝓐` is not stably uniform,
witnessed by the completed localization `𝓐⟨W/ϖ⟩ ≅ K⟨X, Q⟩/(Q²)`, which is not uniform.

The migration decomposes into the components the AINTLIB proof already carries: the four
rings and the maps of the Milnor square; the fibre product as a complete Tate ring; the
uniform non-noetherian domain properties; the localized Milnor square over each rational
subset in the sheaf argument, with strict exactness including the topologies; the transfer
of the sheaf condition across the square; the completed-localization computation
`𝓐⟨W/ϖ⟩ ≅ K⟨X, Q⟩/(Q²)`; the non-uniformity of the right-hand side; and the `#print axioms`
audit of the exported capstones. The detailed construction lives in the `FJP/` file
docstrings; this layer records the statement and its dependencies. The strong-sheafiness
refinement (`𝓐⟨T₁, …, Tₙ⟩` sheafy for every `n`) is not a target.

**Dependencies.** Layers 3–4 in full; independent of Layer 5.

**Status.** [BV] is new here. The counterexample is proved in AINTLIB (`FJP/`, no direct
`sorry`), inheriting the Layer-3/4 cone like every downstream result.

### Layer 7: application — the adic Fargues–Fontaine curve

Scope: `E = ℚ_p` (so `W_{E°}(F°) = W(F°)` and `q = p`; general `E` needs ramified Witt
vectors, which Mathlib lacks — successor roadmap), and `F` a perfectoid field of
characteristic `p` with a chosen pseudouniformizer `ϖ`, not assumed algebraically closed
(the construction needs no algebraic closedness; the structure theory that does is out of
scope).

**Perfectoid input, specified.** Layer 7 consumes exactly: a complete nonarchimedean field
`F` of characteristic `p` with a rank-one valuation; perfection of `F` and of `𝒪_F`; a
pseudouniformizer `ϖ` with `|ϖ| < 1`; completeness of `𝒪_F`; Witt vectors `W(𝒪_F)` with
Frobenius and Teichmüller lifts; and the `(p, [ϖ])`-adic topology on `W(𝒪_F)`. These are
built here (an `IsPerfectoidField p F` predicate packaging them does not yet exist in
Mathlib); the Witt-vector API is Mathlib's.

**Definitions and main results.**

- **`A_inf`.** `A_inf := W(𝒪_F)` with the `(p, [ϖ])`-adic topology (the "weak topology" of
  the Fargues–Fontaine literature — neither `p`-adic nor Witt-coordinate). Milestones: `𝒪_F`
  perfect and `ϖ`-adically complete; `A_inf` a complete Huber ring with pair of definition
  `(A_inf, (p, [ϖ]))`; `A_inf⁺ = A_inf` (every element power-bounded) — the right plus ring
  for `A_inf` and not a pattern for the Tate charts below.
- **The space `𝒴`.** `𝒴 := {v ∈ Spa (A_inf, A_inf) : v(p·[ϖ]) ≠ 0}` — open, `φ`-stable,
  nonempty (a Gauss point, exhibited as a rank-one valuation continuous for the weak
  topology). `𝒴` is not the analytic locus: `𝒴 = D(p) ∩ D([ϖ])`, while the analytic locus is
  `D(p) ∪ D([ϖ])`.
- **Power-comparability.** The lemma the window covering rests on, absent from the informal
  sources because it is automatic at rank one: for `v ∈ 𝒴`, continuity for the
  `(p, [ϖ])`-adic topology forces `v(p)` and `v([ϖ])` to be power-comparable — for every
  `a > 0` there is `b > 0` with `v([ϖ])^b ≤ v(p)^a`, and symmetrically. (In an arbitrary
  ordered group two elements below `1` need not be comparable in this sense.) Only with this
  lemma do the rational windows below cover points of every rank.
- **Frobenius and the windows.** `φ` is the Witt Frobenius, acting on `Spa` by
  `φ_Spa(v) = v ∘ φ`; with `κ(v) = log v([ϖ]) / log v(p)` as mnemonic, `κ ∘ φ_Spa = p·κ`
  (the inverse action gives `p⁻¹κ`; both conventions occur in the literature, this one is
  fixed here). The windows `U_n`, `V_n` are defined rank-freely by clearing denominators
  (`κ ≥ a/b :⇔ v([ϖ])^b ≤ v(p)^a`); no real-valued `κ` is constructed. The breakpoint
  `c = (p+1)/2` is this roadmap's choice (Kedlaya's displayed windows use `1 + 1/p`).
  Milestones: each window is a rational subset, hence quasi-compact; the windows cover `𝒴`
  (via power-comparability); `φ` shifts the window index; same-family windows at different
  indices are disjoint; hence the `φ^ℤ`-action is free and wandering.
- **The curve as a topological space.** `𝒳 := 𝒴 / φ^ℤ`: the quotient map is open, injective
  on each window; the images of `U_0` and `V_0` cover `𝒳`; `𝒳` is `T0` and quasi-compact.
  (Quasi-compactness does not make it affinoid; non-affinoidness is a separate statement and
  not claimed here.)
- **The chart rings.** For a closed interval `I = [s, r] ⊂ (0, ∞)`, the interval ring `B^I`
  with Kedlaya's norm `λ_I = max(λ_s, λ_r)`. To apply Layer 4 to `Spa (B^I, B^{I,+})`, each
  of the following is a named milestone, none implied by the others: `B^I` is complete; `B^I`
  is Hausdorff; `B^I` is Tate; `B^I` is strongly noetherian (Kedlaya, *Noetherian properties
  of Fargues–Fontaine curves*, Theorem 4.10 — hypotheses: perfect complete nonarchimedean
  `F`, which is why algebraic closedness is not needed); `B^{I,+}` is specified (the unit
  ball of `λ_I`, which is the power-bounded subring since `λ_I` is power-multiplicative); and
  `B^{I,+}` is a ring of integral elements. The identification of `B^{I,+}` with the integral
  closure of the image of the localized `A_inf` — the description making the chart a rational
  subset of `Spa (A_inf, A_inf)` — is a theorem. The radius dictionary is reciprocal: with
  `|ϖ| = p^{-α}` and `r = −log_p ρ` one computes `κ = α/r`, so a `κ`-window `[a, b]`
  corresponds to `ρ ∈ [|ϖ|^{1/a}, |ϖ|^{1/b}]`; the conversion is a lemma, and the endpoint
  completions are Banach rings (no theorem that they are fields is cited, and none is used).
  The realisation of `B^I` inside the product of the two endpoint completions is an
  implementation device; its isometric universal property, if used, is a theorem in the
  implementation notes, not part of this specification.
- **The structure sheaf on `𝒳`.** The presheaf of `φ`-invariant sections over saturated
  preimages — a topological equalizer — with the theorem that it is a sheaf of topological
  rings; stalk valuations independent of the orbit representative, factoring through residue
  fields.
- **The main theorem, by the direct route.** Every point of `𝒳` has an open neighbourhood
  isomorphic in `𝒱^pre` — then in `𝒱`, once sheafiness is known — to `Spa (B^I, B^{I,+})`.
  The proof route is fixed (the wandering-slice route); the steps:
  1. for a wandering window `W ⊆ 𝒴`, prove `q⁻¹(q(W)) = ⨆_{n ∈ ℤ} φⁿ(W)` and that `q|_W` is
     a homeomorphism onto the open `q(W)`;
  2. identify `W`, as an affinoid pre-adic space, with `Spa (B^I, B^{I,+})`;
  3. for every open `V ⊆ W`, prove `𝒪_𝒳(q(V)) ≅ 𝒪_𝒴(V)` topologically, by extending
     sections equivariantly over the disjoint translates;
  4. check compatibility with all restriction maps;
  5. identify `𝒪⁺`;
  6. prove compatibility of the stalk valuations and independence of the orbit
     representative;
  7. conclude the chart is an isomorphism in `𝒱^pre`, hence in `𝒱` after sheafiness.
  Kedlaya's Theorem 4.10 also makes every `B^I⟨T₁, …, T_k⟩` noetherian, so the chart rings
  are stably sheafy; that is retained as a supporting theorem (it feeds Wedhorn Remark 8.27
  and the successor roadmap), not as an alternative construction of the charts — it does not
  by itself produce the morphism of pre-adic spaces or identify the quotient presheaf with
  the affinoid structure sheaf.
- **Independence of `ϖ`.** A theorem, in five steps: compare the ideals `(p, [ϖ])` and
  `(p, [ϖ'])`; prove they define the same topology on `A_inf`; identify the opens `𝒴_ϖ` and
  `𝒴_{ϖ'}`; show the Frobenius actions agree under the identification; construct the
  induced isomorphism of quotient presheafed spaces, and of adic spaces once both sides are
  adic. (The windows are indexed by the choice and are not independent of it.)

**Dependencies.** Layer 0 (Huber/Tate vocabulary, restricted series), Layer 2 (`Spa`,
rational subsets), Layer 3 (presheaf, `𝒱^pre`/`𝒱`), Layer 4 (sheafiness of the charts),
Layer 5 (the definition the main theorem instantiates). The `A_inf`/window strand depends
only on Layers 0–2.

**Status.** The quotient-curve topology, the window combinatorics, the interval-ring strand
through Kedlaya 4.10, and the descended sheaf of topological rings exist in AINTLIB without
direct `sorry`s (inheriting the Layer-3/4 cone); the chart isomorphism in `𝒱^pre` is absent
everywhere and is this layer's principal new theorem.

## Worked examples (acceptance criteria)

- `ℚ_[p]` is Tate; `ℤ_[p]` is Huber and not Tate; discrete rings are Huber (Layer 0).
- `Spa (ℚ_p, ℤ_p)` is a single point; `Spa (A, A⁺) = ∅ ↔ A = 0` for complete `A` (Layer 2).
- The closed unit disc contains the Gauss point, and its standard Laurent cover has an exact
  augmented Čech complex — Tate's 1971 example as an instance of Layer 4.
- `K⟨X, Q⟩/(Q²)` is sheafy and not uniform — the non-reduced case the Layer-4 hypotheses were
  pinned to include.
- The Layer-6 counterexample's exported claims, conditional on the Layer-4 audit.
- `𝒴` is nonempty; `𝒳` is quasi-compact and `T0`; the two window images cover it; its
  structure presheaf is a sheaf of topological rings (Layer 7).
- `B^I` strongly noetherian feeding the Layer-4 theorem: `Spa (B^I, B^{I,+})` sheafy.
- The open unit disc as a glued non-affinoid adic space (Layer 5).

## Ordering

Layer 0 → Layer 1 → Layer 2 → Layer 3 → Layer 4 → Layer 5, in dependency order. Layer 6 needs
Layers 3–4 and is independent of Layer 5. Layer 7's `A_inf`/window strand needs only Layers
0–2 and can start early; its charts need Layer 4, and its final clause needs Layer 5.

## References

- R. Huber, *Continuous valuations*, Math. Z. 212 (1993), 455–477 — [Hu1].
- R. Huber, *A generalization of formal schemes and rigid analytic varieties*, Math. Z. 217
  (1994), 513–551 — [Hu2].
- R. Huber, *Étale cohomology of rigid analytic varieties and adic spaces*, Vieweg 1996 —
  [Hu3] (background; its étale theory is out of scope).
- T. Wedhorn, *Adic Spaces* (arXiv:1910.05934) — the coordinate system: §4 (`Spv`), §6
  (Huber rings), §7 (`Cont`, pairs, `Spa`, rational subsets, uniformity), §8 (presheaf,
  `𝒱^pre`/`𝒱`, pre-adic and adic spaces, Theorem 8.28).
- J. Tate, *Rigid analytic spaces*, Invent. Math. 12 (1971), 257–289.
- K. Buzzard, A. Verberkmoes, *Stably uniform affinoids are sheafy*, J. reine angew. Math.
  740 (2018), 25–39 — [BV].
- D. Hansen, K. Kedlaya, *Sheafiness criteria for Huber rings* (preprint, April 2025
  version) — [HK]; Remark 3.16 is the open question Layer 6 addresses.
- K. Kedlaya, *Noetherian properties of Fargues–Fontaine curves* (arXiv:1410.5160) —
  Definition 4.2 (`B^I`, `λ_I`), Theorem 4.10.
- L. Fargues, J.-M. Fontaine, *Courbes et fibrés vectoriels en théorie de Hodge p-adique*,
  Astérisque 406 (2018).
- P. Scholze, J. Weinstein, *Berkeley Lectures on p-adic Geometry*, Ann. of Math. Studies 207
  (2020) — §12.2, §13.1, Definition 13.5.1.
- K. Kedlaya, *Sheaves, stacks, and shtukas* (Arizona Winter School 2017) — §3.1, Remark
  3.1.9 (windows, proper discontinuity, the two-chart cover).
- C. Birkbeck, T. Feng, D. Hansen, S. Hong, Q. Li, A. Wang, L. Ye, *Extensions of vector
  bundles on the Fargues–Fontaine curve* (arXiv:1705.00710) — Definition 2.1.1, the adic
  curve specialised to `E = ℚ_p`.
- L. Henkel, *An Open Mapping Theorem for rings which have a zero sequence of units*
  (arXiv:1407.5647).
- K. Hübner, *Adic spaces* (lecture notes, arXiv:2405.06435).
- S. Bosch, U. Güntzer, R. Remmert, *Non-Archimedean Analysis*, Grundlehren 261 (1984) —
  BGR 5.2.6.
- K. Buzzard, J. Commelin, P. Massot, *Formalising perfectoid spaces* (arXiv:1910.12320) —
  Lean 3 prior art on design; not a port source.
- The Layer-6 counterexample has no paper reference; §Layer 6 states the construction, and
  the AINTLIB `FJP/` directory is its proof.

## Provenance and status

Source: AINTLIB (`github.com/CBirkbeck/AINTLIB`, Apache-2.0), branch
`dev/adic-spaces @ 59bbbe8ba14a` (2026-07-28), project `projects/AdicSpaces/`. Direct `sorry`
counts are file-level grep counts at that revision; they over-count (comments match) and see
no cross-file dependence, so they are recorded separately from the transitive audit, which is
a `#print axioms` gate on the actual capstones in TauCeti CI. The project's `ScottishBook/`,
`FarguesFontaine.lean`, `AlmostMathematics.lean`, `PerfectoidRing.lean`,
`PerfectoidSpace.lean`, and `Tilting.lean` are out of scope and not migration targets.

| Milestone | AINTLIB source | Direct `sorry` | Transitive audit | Upstream | Status |
|---|---|---:|---|---|---|
| Huber/Tate definitions, basic theory | `HuberRings.lean`, `Bounded.lean`, `OpenIdeals.lean`, `PseudoUniformizer.lean` | 0 | pending | mathlib4#42312 | migrate, align with upstream |
| Restricted series, strong noetherianness | `RestrictedPowerSeries.lean`, `TateAlgebra*.lean` | 0 | pending | — | migrate |
| Open mapping theorem | `BanachOMT.lean`, `OpenMapping.lean` | open | — | — | incomplete |
| `Spv`, basic opens, functoriality | `ValuationSpectrum.lean` | 0 | pending | mathlib4#38009 | upstream in review |
| `Spv` spectrality | `SpvAITopology.lean` | 36 | 36+ | — | incomplete |
| `Cont` | `ContinuousValuations.lean` | 2 | pending | — | near-complete |
| Pairs, `Spa`, rational subsets | `AffinoidRings.lean`, `AdicSpectrum.lean`, `RationalSubsets.lean` | 0 | pending | mathlib4#42315 | migrate, align with upstream |
| Compactness inputs | `ValuationSpectrumCompact.lean`, `SpaCompact.lean` | 0 | pending | — | migrate |
| Presheaf, `𝒱^pre` substrate | `Presheaf.lean`, `StructureSheaf.lean`, `CompleteTopCommRingCat.lean` | 49 + 38 | — | — | incomplete |
| Sheafiness theorem (8.28(b)) | `WedhornCechAcyclicity.lean` and ~40 supplier files | 9 in capstone file | audit required | — | incomplete |
| Čech acyclicity, all degrees | — | — | — | — | new |
| Buzzard–Verberkmoes | — | — | — | — | new |
| Uniformity definitions | `Uniform.lean` | 0 | pending | — | migrate |
| Layer-6 counterexample | `FJP/` (11 files) | 0 | inherits Layers 3–4 | — | implemented |
| Quotient curve topology, windows | `YSpace.lean`, `Curve.lean`, Frobenius strand | 0 | inherits Layers 3–4 | — | implemented |
| Interval rings through Kedlaya 4.10 | interval-ring strand, `StronglyNoetherianB.lean`, `SheafyBI.lean` | 0 | inherits Layers 3–4 | — | implemented |
| Descended sheaf on `𝒳` | `YPresheaf.lean`, `YSheaf.lean`, `CurveObject.lean` | 0 | inherits Layers 3–4 | — | implemented |
| Chart isomorphism in `𝒱^pre` | absent | — | — | — | new theorem |
| Gluing, open disc | absent | — | — | — | new |

Vendored inputs: `Vendored/Coram*` (William Coram's restricted-power-series and Gauss-norm
work; its Mathlib face is `PowerSeries.IsRestricted`) and `Vendored/Xia*` — check upstream
overlap at migration and coordinate rather than porting blindly.
