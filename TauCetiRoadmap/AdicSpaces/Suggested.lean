import Mathlib

/-!
# Adic spaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The narrative roadmap (the conventions, the layer-by-layer build plan Layers 0–6, the worked
examples, and the references) is in `README.md`. Mathlib has the valuative substrate
(`ValuativeRel`, `Valuation.Compatible`, the valuative topology), nonarchimedean topological
algebra (`NonarchimedeanRing`, `IsAdic`, `IsTopologicallyNilpotent`, `OpenSubgroup`), uniform
completions, valued fields (`ℚ_[p]`, `F⸨t⸩`), and the spectral-space vocabulary
(`PrespectralSpace`, `QuasiSober`, `QuasiSeparatedSpace`). It has **no** Huber rings, **no**
valuation spectrum `Spv`, **no** continuous valuations or adic spectrum `Spa (A, A⁺)`, **no**
rational subsets or rational localization, **no** structure presheaf and hence **no**
sheafiness question, **no** Tate acyclicity, and **no** adic spaces. We build these in
`TauCeti/RingTheory/Huber/` and `TauCeti/AlgebraicGeometry/AdicSpace/`, with Wedhorn
(arXiv:1910.05934) as the numbering coordinate system and Huber's papers as the origin —
cited for the mathematics, not as the specification.

`sorry` is allowed in this human-owned roadmap library — these are goals, not proofs.
Following the roadmap-writing guide, the Layer-0 vocabulary that is fully statable against
pinned Mathlib is **prototyped as honest definitions** below (`PairOfDefinition`,
`IsHuberRing`, `IsTateRing` — suggested forms, not the specification), and first milestones
over it are seeded as `theorem … := sorry`; nothing is a `Prop`-typed placeholder. The layers
whose central objects are new *types* — `Spv` and its topology (Layer 1), `Spa` and rational
subsets (Layer 2), rational localization, the structure presheaf and the category `𝒱`
(Layer 3), the Čech complexes (Layer 4), adic spaces (Layer 5), and the finite-jet pinching
rings (Layer 6) — need the very API those layers introduce; they are specified in `README.md`
with embedded Lean prototypes and built there, not pinned here as `sorry`-typed junk types.

## Provenance (migrate and complete from existing work)

The AINTLIB `dev/adic-spaces` project (revision pinned in `README.md` §Provenance) carries
sorry-free foundations whose shapes these prototypes follow — `PairOfDefinition`,
`IsHuberRing`, `IsTateRing`, `Spv` built on Mathlib's `ValuativeRel`, `Spa`, rational
subsets, `IsStronglyNoetherian`, `IsUniform`/`IsStablyUniform` — a sorry-free formalization
of the finite-jet pinching headlines (`FJP/`), and an in-progress structure-presheaf and
sheafiness campaign (`isSheafy_of_stronglyNoetherian_828b`) whose dependency cone must be
audited on migration. It is material to migrate and complete, never the standard.
-/

namespace TauCetiRoadmap.AdicSpaces

open scoped Classical

/-! ## Layer 0: Huber rings and Tate rings (Wedhorn §6; Huber)

The foundation. A **pair of definition** is an open subring whose subspace topology is
`I`-adic for a finitely generated ideal `I`; a **Huber ring** is a topological ring admitting
one; a **Tate ring** is a Huber ring with a topologically nilpotent unit. Everything below is
statable against pinned Mathlib (`IsAdic`, `IsTopologicallyNilpotent`, subring topology), so
the vocabulary is prototyped honestly here. The rest of the layer — rings of definition are
exactly the open bounded adic subrings, `A°`/`A°°`, pseudo-uniformizers, completions of Huber
rings, restricted power series `A⟨T₁, …, Tₖ⟩` with `IsStronglyNoetherian`, and the open
mapping theorem for complete Tate rings (Henkel, arXiv:1407.5647) — is specified in
`README.md` §Layer 0. -/

/-- A **pair of definition** `(A₀, I)` for a topological ring `A` (Wedhorn, Definition 6.1):
an open subring `A₀ ⊆ A` together with a finitely generated ideal `I ⊆ A₀` such that the
subspace topology of `A₀` is the `I`-adic one. Suggested form; the field names follow the
existing sorry-free development. -/
structure PairOfDefinition (A : Type*) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] where
  /-- The ring of definition, an open subring of `A`. -/
  ringOfDefinition : Subring A
  /-- The ring of definition is open. -/
  isOpen_ringOfDefinition : IsOpen (ringOfDefinition : Set A)
  /-- The ideal of definition, an ideal of the ring of definition. -/
  idealOfDefinition : Ideal ringOfDefinition
  /-- The ideal of definition is finitely generated. -/
  fg_idealOfDefinition : idealOfDefinition.FG
  /-- The subspace topology of the ring of definition is the `I`-adic topology. -/
  isAdic_idealOfDefinition : IsAdic idealOfDefinition

/-- A topological ring is a **Huber ring** (f-adic ring) if it admits a pair of definition
(Wedhorn, Definition 6.1). -/
class IsHuberRing (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] :
    Prop where
  /-- Some pair of definition exists. -/
  nonempty_pairOfDefinition : Nonempty (PairOfDefinition A)

/-- A Huber ring is a **Tate ring** if it has a topologically nilpotent unit — a
*pseudo-uniformizer* (Wedhorn, Definition 6.10). -/
class IsTateRing (A : Type*) [CommRing A] [TopologicalSpace A] [IsTopologicalRing A] :
    Prop extends IsHuberRing A where
  /-- Some unit is topologically nilpotent. -/
  exists_isTopologicallyNilpotent_unit : ∃ u : Aˣ, IsTopologicallyNilpotent (u : A)

/-- **Discrete rings are Huber**: with the discrete topology, `(A, (0))` is a pair of
definition — the `0`-adic topology is discrete. The degenerate example keeping the
definitions honest (Wedhorn, Example 6.2). -/
theorem isHuberRing_of_discreteTopology (A : Type*) [CommRing A] [TopologicalSpace A]
    [IsTopologicalRing A] [DiscreteTopology A] : IsHuberRing A :=
  sorry

/-- **`ℚ_p` is a Tate ring**: `(ℤ_p, (p))` is a pair of definition and `p` is a topologically
nilpotent unit (Wedhorn, Example 6.11-shape). The first nondegenerate example, and the base
point of every worked example in `README.md`. -/
theorem isTateRing_padic (p : ℕ) [Fact p.Prime] : IsTateRing ℚ_[p] :=
  sorry

/-- **`ℤ_p` is a Huber ring**, with itself as ring of definition and `(p)` as ideal of
definition. -/
theorem isHuberRing_padicInt (p : ℕ) [Fact p.Prime] : IsHuberRing ℤ_[p] :=
  sorry

/-- **`ℤ_p` is not Tate**: every unit of `ℤ_p` has norm `1`, so no unit is topologically
nilpotent. The example separating `IsHuberRing` from `IsTateRing`. -/
theorem not_isTateRing_padicInt (p : ℕ) [Fact p.Prime] : ¬ IsTateRing ℤ_[p] :=
  sorry

/-! ## Layer 1: the valuation spectrum (Wedhorn §4; Huber, *Continuous valuations*)

`Spv A` is the type of Mathlib `ValuativeRel` instances on `A` — valuations up to
equivalence, exactly Mathlib's reading — topologized by the basic opens
`Spv(A)(f/s) = {v | v f ≤ v s ≠ 0}`, with `supp`, functorial `comap`, quotient and
localization lifts, and **spectrality** (`CompactSpace` + `QuasiSober` + `PrespectralSpace` +
`QuasiSeparatedSpace`, the conventions' spelling, with `PrimeSpectrum` as the model proof).
The type and its topology are new API, specified in `README.md` §Layer 1 and built there, not
pinned here. -/

/-! ## Layer 2: continuous valuations, affinoid pairs, and `Spa` (Wedhorn §7)

Continuity of a valuation over a Huber ring, `Cont A` spectral; rings of integral elements
(`IsRingOfIntegralElements`: open, integrally closed, inside `A°` — Definition 7.14) and the
`A⁺`-carrying class; `Spa (A, A⁺)` with rational subsets `R(T/s)` (`T` finite, `T·A` open —
the openness is part of the definition), their intersection stability (Remark 7.30, Theorem
7.35(2)), spectrality of `Spa` with rational subsets as quasi-compact basis, emptiness iff
`A = 0` (complete case), and `A⁺` recovered from the spectrum. Specified in `README.md`
§Layer 2. -/

/-! ## Layer 3: rational localization and the structure presheaf (Wedhorn §7.5–§8.1; Huber)

`A⟨T/s⟩` with its universal property (the API everything downstream consumes — the
construction via restricted power series is private), iterated localization (Lemma 7.54 =
Huber's Lemma 2.6), the presheaf `𝒪_X` (values complete topological rings), `𝒪_X⁺`, stalks
with their valuations, the category `𝒱` on Mathlib's `PresheafedSpace`, and the `IsSheafy`
class in the embedding-plus-gluing form over finite rational covers. Specified in `README.md`
§Layer 3. -/

/-! ## Layer 4: sheafiness and Tate acyclicity (Wedhorn §8.2, Theorem 8.28; Huber; Tate 1971)

The headline: for a **complete Hausdorff strongly noetherian Tate** ring with a ring of
integral elements — no domain or reducedness hypothesis — the structure presheaf is a sheaf,
and every finite rational cover of a rational subset has an **exact augmented Čech complex in
all degrees** (`Ȟ⁰ = 𝒪_X(U)`, `Ȟⁿ = 0` for `n ≥ 1`), stated over Mathlib's
`HomologicalComplex`. Cover normalization (standard/Laurent covers), separatedness (Corollary
8.32), and the noetherian-completion flatness input (Stacks 00MB, in Mathlib) are the route.
Specified in `README.md` §Layer 4; the classical Tate 1971 disc example is its acceptance
test. -/

/-! ## Layer 5: adic spaces (Wedhorn §8.2–8.3, Definition 8.22)

Affinoid adic spaces of sheafy pairs as objects of `𝒱`, and **adic spaces**: objects of `𝒱`
locally isomorphic **in `𝒱`** — presheaf and stalk valuations included, not merely
homeomorphic — to affinoids; morphisms, open subspaces, gluing, and the open unit disc as the
first glued non-affinoid example. Specified in `README.md` §Layer 5. -/

/-! ## Layer 6: uniformity and the finite-jet pinching example ([FJP]; Buzzard–Verberkmoes)

`IsUniform` (`A°` bounded) and `IsStablyUniform`; the Buzzard–Verberkmoes theorem (stably
uniform ⇒ sheafy); the finite-jet pinching square over `K = F⸨t⸩` — `𝓐 = 𝓑 ×_𝓓 𝓒` with its
strict Milnor row — and the headline theorems: `𝓐` is a uniform non-noetherian domain,
`(𝓐, 𝓐°)` is **sheafy** by Milnor-square transfer from strongly noetherian vertices, `𝓐` is
**not stably uniform** (`𝓐⟨W/ϖ⟩ ≅ K⟨X, Q⟩/(Q²)` is sheafy but not uniform), and strong
sheafiness (`𝓐⟨T₁, …, Tₙ⟩` sheafy for all `n`). Sheafy ⇏ stably uniform — the answer to
Hansen–Kedlaya Remark 3.16. The rings need Layers 0 and 3, so the statements are specified in
`README.md` §Layer 6 and built there. -/

end TauCetiRoadmap.AdicSpaces
