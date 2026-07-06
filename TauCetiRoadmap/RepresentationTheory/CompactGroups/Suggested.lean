/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Representations of compact groups and Peter-Weyl: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

Mathlib has **Haar measure** in full (`MeasureTheory.Measure.haar`, `IsHaarMeasure`, left
invariance, regularity, and the uniqueness theorem `isHaarMeasure_eq_of_isProbabilityMeasure`), the
complete **Hilbert-basis** API (`HilbertBasis`, `mkOfOrthogonalEqBot`, `tsum_inner_mul_inner`), the
`L²` inner product (`L2.innerProductSpace`), density of continuous functions
(`ContinuousMap.toLp_denseRange`), and **one worked instance of the whole theory** -- the Fourier
basis `fourierBasis : HilbertBasis ℤ ℂ (Lp ℂ 2 haarAddCircle)` of `L²(S¹)`. It has **no Peter-Weyl
theorem, no continuous unitary-representation theory, no Haar averaging / unitarian trick, no matrix
coefficients, no Schur orthogonality in `L²(G)`, no compact-group characters, and no `SU(2)`
representation theory** (see `README.md` for the file-by-file map).

The design follows `README.md`'s layers: normalized Haar and averaging (Layer 0); the unitarity
predicate and unitarizability (Layer 1); complete reducibility (Layer 2); matrix coefficients
(Layer 3); Schur orthogonality (Layer 4); the Peter-Weyl `HilbertBasis` (Layer 5); characters
(Layer 6); and the `SU(2)`/torus engine. The Hilbert-basis assembly is cited from
`../OrthogonalL2Bases`; the finite-group specialization is `../CharacterTheory`. `README.md` remains
the definitive document.
-/

namespace TauCetiRoadmap.RepresentationTheory.CompactGroups

open MeasureTheory
open scoped InnerProductSpace

set_option backward.isDefEq.respectTransparency false

/-! ### Layer 0: normalized Haar measure and averaging -/

/-- **The Haar probability measure** on a compact (Hausdorff, hence locally compact) group: the
canonical `MeasureTheory.Measure.haar` rescaled to total mass `1`. On a compact group Haar is finite
(`CompactSpace.isFiniteMeasure`), so this is well defined; uniqueness among Haar probability measures
is `isHaarMeasure_eq_of_isProbabilityMeasure`, making `haarProb` convention-independent. -/
noncomputable def haarProb (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] : Measure G :=
  (Measure.haar (G := G) Set.univ)⁻¹ • Measure.haar (G := G)

variable {G : Type*} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G]

/-- `haarProb G` is a probability measure. -/
theorem isProbabilityMeasure_haarProb : IsProbabilityMeasure (haarProb G) := sorry

/-- A compact group is **unimodular**: normalized Haar is right-invariant as well as left-invariant.
The averaging arguments (unitarian trick, Schur orthogonality) use both invariances. -/
theorem isMulRightInvariant_haarProb : Measure.IsMulRightInvariant (haarProb G) := sorry

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V] [FiniteDimensional ℂ V]
variable {W : Type*} [NormedAddCommGroup W] [InnerProductSpace ℂ W] [FiniteDimensional ℂ W]

/-! ### Layer 1: unitarizability (Weyl's unitarian trick) -/

/-- **Unitarity** of a continuous representation: every `π g` preserves the inner product. The one
new bundling is this `Prop`; the carrier stays Mathlib's `ContRepresentation ℂ G V = G →* V →L[ℂ] V`. -/
def IsUnitary (π : ContRepresentation ℂ G V) : Prop :=
  ∀ (g : G) (v w : V), ⟪π g v, π g w⟫_ℂ = ⟪v, w⟫_ℂ

/-- **The unitarian trick.** Averaging any inner product against Haar produces a `G`-invariant inner
product, so every finite-dimensional continuous representation of a compact group is
**unitarizable**. This is the compact-group replacement for the invertibility of `|G|` in Maschke. -/
theorem isUnitarizable (π : ContRepresentation ℂ G V) :
    ∃ core : InnerProductSpace.Core ℂ V,
      ∀ (g : G) (v w : V), core.inner (π g v) (π g w) = core.inner v w := sorry

/-! ### Layer 2: complete reducibility -/

/-- For a **unitary** representation, the orthogonal complement of a `G`-invariant subspace is again
`G`-invariant, so it is an invariant complement. -/
theorem orthogonal_invariant (π : ContRepresentation ℂ G V) (hπ : IsUnitary π) (U : Submodule ℂ V)
    (hU : ∀ (g : G), ∀ v ∈ U, π g v ∈ U) :
    ∀ (g : G), ∀ v ∈ Uᗮ, π g v ∈ Uᗮ := sorry

/-- **Complete reducibility (compact Maschke).** Every finite-dimensional continuous representation
of a compact group is semisimple -- an orthogonal direct sum of irreducibles. Stated through the
Mathlib module mirror `Representation.asModule`; specializing to `[Finite G]` recovers Maschke's
`IsSemisimpleModule` of `../CharacterTheory`. -/
theorem isCompletelyReducible (π : ContRepresentation ℂ G V) :
    IsSemisimpleModule (MonoidAlgebra ℂ G) π.toRepresentation.asModule := sorry

/-! ### Layer 3: matrix coefficients -/

/-- **The matrix coefficient** `g ↦ ⟪π g v, w⟫`, a continuous function on `G`. -/
noncomputable def matrixCoeff (π : ContRepresentation ℂ G V) (v w : V) : C(G, ℂ) := sorry

/-- Element-level characterization (anti-vacuity pin). -/
theorem matrixCoeff_apply (π : ContRepresentation ℂ G V) (v w : V) (g : G) :
    matrixCoeff π v w g = ⟪π g v, w⟫_ℂ := sorry

/-- The image of a matrix coefficient in `L²(G)` (via `ContinuousMap.toLp`, using finiteness of
Haar). -/
noncomputable def matrixCoeffLp (π : ContRepresentation ℂ G V) (v w : V) :
    Lp ℂ 2 (haarProb G) := sorry

/-- **The representative ring** `𝓡(G) ⊆ C(G)`: the `ℂ`-span of all matrix coefficients of all
finite-dimensional continuous representations. A `*`-subalgebra; Peter-Weyl proves it dense. -/
noncomputable def representativeRing (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] : Submodule ℂ C(G, ℂ) := sorry

/-! ### Layer 4: Schur orthogonality in L²(G) -/

/-- **Schur orthogonality, one irreducible.** For a unitary irreducible `π` of dimension `d`, the
`L²` inner product of two matrix coefficients is `d⁻¹ ⟪v₁,v₂⟫ · conj⟪w₁,w₂⟫`. The continuous
analogue of `char_orthonormal`, proved by averaging a rank-one operator into a self-intertwiner and
applying Schur. -/
theorem schur_orthogonality_self (π : ContRepresentation ℂ G V) (hπ : IsUnitary π)
    (hirr : Representation.IsIrreducible π.toRepresentation) (v₁ w₁ v₂ w₂ : V) :
    ⟪matrixCoeffLp π v₁ w₁, matrixCoeffLp π v₂ w₂⟫_ℂ
      = (Module.finrank ℂ V : ℂ)⁻¹ * (⟪v₁, v₂⟫_ℂ * (starRingEnd ℂ) ⟪w₁, w₂⟫_ℂ) := sorry

/-- **Schur orthogonality, inequivalent irreducibles.** If there is no nonzero continuous
intertwiner `π → ρ`, every matrix coefficient of `π` is `L²`-orthogonal to every matrix coefficient
of `ρ`. -/
theorem schur_orthogonality_distinct (π : ContRepresentation ℂ G V) (ρ : ContRepresentation ℂ G W)
    (hπ : IsUnitary π) (hρ : IsUnitary ρ)
    (hdistinct : ∀ f : ContIntertwiningMap π ρ, f.toContinuousLinearMap = 0)
    (v w : V) (v' w' : W) :
    ⟪matrixCoeffLp π v w, matrixCoeffLp ρ v' w'⟫_ℂ = 0 := sorry

/-! ### Layer 5: the Peter-Weyl theorem -/

/-- **The analytic core of Peter-Weyl.** The representative ring is dense in `C(G)` for the uniform
norm. Proved (README, Layer 5) via the spectral theorem for a compact self-adjoint convolution
operator on `L²(G)` plus an approximate identity; the compact-operator input is the substantial
prerequisite. -/
theorem representativeRing_dense (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] :
    (representativeRing G).topologicalClosure = ⊤ := sorry

/-- **The Peter-Weyl predicate**: a Hilbert basis of `L²(G)` whose elements are the normalized
matrix coefficients `√(dim V_π) · π_{ij}` of the irreducibles. Source-agnostic; the element-level
content lives here, so the bundled basis below is not vacuous. -/
def IsPeterWeylBasis {ι : Type} (b : HilbertBasis ι ℂ (Lp ℂ 2 (haarProb G))) : Prop := sorry

/-- **The Peter-Weyl theorem (the summit).** The normalized matrix coefficients of the irreducibles
form a Hilbert basis of `L²(G)`. Assembled from Layer 4's orthonormal system and Layer 5's
`L²`-density via `HilbertBasis.mkOfOrthogonalEqBot` (the `../OrthogonalL2Bases` pattern). For the
circle this specializes to Mathlib's `fourierBasis`. -/
theorem peterWeylBasis (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] :
    ∃ (ι : Type) (b : HilbertBasis ι ℂ (Lp ℂ 2 (haarProb G))), IsPeterWeylBasis b := sorry

/-! ### Layer 6: characters of compact groups -/

/-- **The character** `g ↦ trace (π g)`, a continuous class function; reuses `FDRep.character`'s
algebraic identities. -/
noncomputable def character (π : ContRepresentation ℂ G V) : C(G, ℂ) := sorry

/-- The character is a **class function** (`char_conj` transported). -/
theorem character_conj (π : ContRepresentation ℂ G V) (g h : G) :
    character π (h * g * h⁻¹) = character π g := sorry

/-- The image of the character in `L²(G)`. -/
noncomputable def characterLp (π : ContRepresentation ℂ G V) : Lp ℂ 2 (haarProb G) := sorry

/-- **Character orthonormality, diagonal.** For a unitary irreducible, `∫ |χ_π|² dμ = 1`; the
`[Finite G]` shadow is Mathlib's `char_orthonormal`. -/
theorem character_orthonormal_self (π : ContRepresentation ℂ G V) (hπ : IsUnitary π)
    (hirr : Representation.IsIrreducible π.toRepresentation) :
    ⟪characterLp π, characterLp π⟫_ℂ = 1 := sorry

/-- **Character orthonormality, off-diagonal.** Characters of inequivalent irreducibles are
orthogonal in `L²(G)`. -/
theorem character_orthonormal_distinct (π : ContRepresentation ℂ G V) (ρ : ContRepresentation ℂ G W)
    (hπ : IsUnitary π) (hρ : IsUnitary ρ)
    (hdistinct : ∀ f : ContIntertwiningMap π ρ, f.toContinuousLinearMap = 0) :
    ⟪characterLp π, characterLp ρ⟫_ℂ = 0 := sorry

/-! ### The engine case: `SU(2)` and the maximal torus

`SU(2)` is `Matrix.specialUnitaryGroup (Fin 2) ℂ`. The compact-group setup (topological group,
compactness, Borel structure) is taken as given here (it is genuine, and proving it is itself part of
this milestone); the abstract theory above is validated on this concrete group. -/

section SU2

/-- `SU(2)`, the special unitary group of `2×2` complex matrices. -/
abbrev SU2 : Type := Matrix.specialUnitaryGroup (Fin 2) ℂ

variable [IsTopologicalGroup SU2] [CompactSpace SU2] [T2Space SU2]
  [MeasurableSpace SU2] [BorelSpace SU2] [LocallyCompactSpace SU2]

/-- **The irreducibles of `SU(2)`**: the representation on `Sym^n(ℂ²)` (degree-`n` homogeneous
polynomials in two variables), of dimension `n+1`, modelled on `EuclideanSpace ℂ (Fin (n+1))`. -/
noncomputable def su2Irrep (n : ℕ) : ContRepresentation ℂ SU2 (EuclideanSpace ℂ (Fin (n + 1))) :=
  sorry

/-- Each `su2Irrep n` is irreducible. -/
theorem su2Irrep_irreducible (n : ℕ) :
    Representation.IsIrreducible (su2Irrep n).toRepresentation := sorry

/-- The character at the identity is the dimension `n+1`. -/
theorem su2Irrep_character_one (n : ℕ) :
    character (su2Irrep n) 1 = (n + 1 : ℂ) := sorry

/-- The **maximal torus** element `diag(e^{iθ}, e^{-iθ}) ∈ SU(2)`. -/
noncomputable def su2Torus (θ : ℝ) : SU2 := sorry

/-- **The Weyl integration formula for `SU(2)`.** Integration of a class function over `SU(2)`
reduces to the maximal torus with Weyl factor `|Δ(θ)|² = 4 sin²θ`. -/
theorem weyl_integration_formula (f : C(SU2, ℂ)) (hf : ∀ g h : SU2, f (h * g * h⁻¹) = f g) :
    ∫ g, f g ∂(haarProb SU2)
      = (1 / (2 * Real.pi) : ℂ)
          * ∫ θ in (0 : ℝ)..Real.pi, f (su2Torus θ) * ((4 * Real.sin θ ^ 2 : ℝ) : ℂ) := sorry

/-- **Character orthonormality for `SU(2)`, via the Weyl integration formula.** The concrete form of
`character_orthonormal_self`/`_distinct` for `SU(2)`, computed on the torus. -/
theorem su2Character_orthonormal (m n : ℕ) :
    ∫ g, character (su2Irrep m) g * (starRingEnd ℂ) (character (su2Irrep n) g) ∂(haarProb SU2)
      = if m = n then 1 else 0 := sorry

end SU2

/-!
Acceptance criteria (see `README.md`):
* **Finite groups** recover `../CharacterTheory`: for `[Finite G]` with the discrete topology,
  `isCompletelyReducible` is Maschke and `character_orthonormal_self` is the first orthogonality
  relation.
* **The circle** `AddCircle 1`: `peterWeylBasis` specializes to Mathlib's `fourierBasis`, and
  `character_orthonormal_self` to `orthonormal_fourier`.
* **`SU(2)`**: `su2Character_orthonormal` is proved through `weyl_integration_formula`, matching the
  abstract `character_orthonormal_self`.
-/

end TauCetiRoadmap.RepresentationTheory.CompactGroups
