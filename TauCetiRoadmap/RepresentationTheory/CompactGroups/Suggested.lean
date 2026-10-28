/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.RepresentationTheory.Compact.UnitaryModel
import TauCeti.RepresentationTheory.Compact.PeterWeyl
import TauCeti.RepresentationTheory.Compact.Character.Basis
import TauCeti.RepresentationTheory.Compact.FrobeniusSchur.InvariantForm
import TauCeti.RepresentationTheory.Compact.FrobeniusSchur.StructureMap
import TauCeti.RepresentationTheory.SU2.Exhaustion
import TauCeti.RepresentationTheory.SU2.Weyl.Integration

/-!
# Representations of compact groups and Peter-Weyl: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.

The individual Tau Ceti imports supply normalized Haar, unitarity, matrix coefficients,
Schur orthogonality, Peter–Weyl models and bases, characters, Frobenius–Schur indicators,
and symmetric-power models of `SU(2)`. Definitions below are aliases of those actual
objects. Other admitted statements suggest the specified comparison interfaces.
README Layer 5.1 consumes the G-finite predicate, its submodule and the Banach density
theorem `gFiniteSubmodule_dense` from AutomorphicFormsOnReductiveGroups §2.1, which owns
and states them; they are not restated here.

`ContRepresentation` bundles continuity of each operator only. Every analytic interface
below carries `hπ : Continuous π` explicitly. Algebraic consequences of unitarity do not
need parameter continuity.

The design follows `README.md`'s layers: normalized Haar and averaging (Layer 0); the unitarity
predicate and unitarizability (Layer 1); complete reducibility (Layer 2); matrix coefficients
(Layer 3); Schur orthogonality (Layer 4); the Peter-Weyl `HilbertBasis` (Layer 5); characters
(Layer 6); and the `SU(2)`/torus engine with its own irreducible-classification layer. The
Hilbert-basis assembly is cited from `Completed/OrthogonalL2Bases`; the finite-group specialization is
`../CharacterTheory`. `README.md` remains the definitive document.
-/

universe u v

namespace TauCetiRoadmap.RepresentationTheory.CompactGroups

open MeasureTheory
open scoped InnerProductSpace

/- Needed for instance resolution in the signatures below (checked: the file does not elaborate
without it). Roadmap-file only: the built library under `TauCeti/` textually bans `set_option`,
so the implementation must thread the transparency through explicit instances instead. -/
set_option backward.isDefEq.respectTransparency false

/-! ### Layer 0: normalized Haar measure and averaging -/

/-- **The Haar probability measure** on a compact (Hausdorff, hence locally compact) group: the
canonical `MeasureTheory.Measure.haar` rescaled to total mass `1`. On a compact group Haar is finite
(`CompactSpace.isFiniteMeasure`), so this is well defined; uniqueness among Haar probability measures
is `isHaarMeasure_eq_of_isProbabilityMeasure`, making `haarProb` convention-independent. -/
noncomputable def haarProb (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] : Measure G :=
 TauCeti.haarProb G

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
 [CompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G]

/-- The total Haar mass of a compact group is **finite** (`CompactSpace.isFiniteMeasure`); needed to
know the rescaling in `haarProb` is by a finite scalar. -/
theorem haar_univ_lt_top : Measure.haar (G := G) Set.univ < ⊤ :=
 TauCeti.haar_univ_lt_top G

/-- The total Haar mass is **nonzero** (Haar is `IsOpenPosMeasure` and `Set.univ` is a nonempty
open set); needed to know `(Measure.haar univ)⁻¹` is not `0`, so `haarProb` is genuinely normalized.
The README flags this as a milestone in its own right. -/
theorem haar_univ_ne_zero : Measure.haar (G := G) Set.univ ≠ 0 :=
 TauCeti.haar_univ_ne_zero G

/-- `haarProb G` is a probability measure. -/
theorem isProbabilityMeasure_haarProb : IsProbabilityMeasure (haarProb G) :=
 by change IsProbabilityMeasure (TauCeti.haarProb G); infer_instance

/-- `haarProb G` assigns mass `1` to the whole group. -/
theorem haarProb_apply_univ : haarProb G Set.univ = 1 :=
 TauCeti.haarProb_apply_univ G

/-- `haarProb G` is left-invariant (inherited from `Measure.haar`). -/
theorem isMulLeftInvariant_haarProb : Measure.IsMulLeftInvariant (haarProb G) :=
 by change Measure.IsMulLeftInvariant (TauCeti.haarProb G); infer_instance

/-- A compact group is **unimodular**: normalized Haar is right-invariant as well as left-invariant.
The averaging arguments (unitarian trick, Schur orthogonality) use both invariances. -/
theorem isMulRightInvariant_haarProb : Measure.IsMulRightInvariant (haarProb G) :=
 by change Measure.IsMulRightInvariant (TauCeti.haarProb G); infer_instance

/-- **Inversion invariance** of normalized Haar on a compact group: `g ↦ g⁻¹` preserves `haarProb`
(`Measure.IsInvInvariant`, i.e. `map Inv.inv (haarProb G) = haarProb G`). The coefficient
involution `conj (matrixCoeff π hcont v w g) = matrixCoeff π hcont w v g⁻¹` is compatible with this invariance. -/
theorem isInvInvariant_haarProb : Measure.IsInvInvariant (haarProb G) :=
 by change Measure.IsInvInvariant (TauCeti.haarProb G); infer_instance

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V] [FiniteDimensional ℂ V]
variable {W : Type*} [NormedAddCommGroup W] [InnerProductSpace ℂ W] [FiniteDimensional ℂ W]

/-! ### Layer 1: unitarizability (Weyl's unitarian trick) -/

/-- **Unitarity** of a continuous representation: every `π g` preserves the inner product. This is the native
`TauCeti.ContRepresentation.IsUnitary` predicate on Mathlib's one-field wrapper
`ContRepresentation ℂ G V` around `G →* (V →L[ℂ] V)`. -/
abbrev IsUnitary (π : ContRepresentation ℂ G V) : Prop :=
 TauCeti.ContRepresentation.IsUnitary π

/-- **The unitarian trick (averaged positive form).** Averaging any inner product against Haar
produces a `G`-invariant inner product on the *same* space `V`. That invariant form is
`⟪v, w⟫_G = ⟪S v, w⟫` for a positive-definite self-adjoint operator `S` (the averaged Gram operator),
and `G`-invariance is exactly `(π g)† ∘ S ∘ (π g) = S`. This is the correct statement of
unitarizability: returning a bare `InnerProductSpace.Core` does **not** make `π` unitary under Lean's
fixed `InnerProductSpace ℂ V` instance. From `S` one recovers a unitary
representation on the retopologized space, or conjugates by `S ^ (1/2)` to unitarize `π` on the
original Hilbert space. Everything downstream may therefore assume `IsUnitary`. -/
theorem isUnitarizable (π : ContRepresentation ℂ G V) (hcont : Continuous π) :
  ∃ S : V →L[ℂ] V,
   IsSelfAdjoint S ∧ (∀ v : V, v ≠ 0 → 0 < (⟪S v, v⟫_ℂ).re) ∧
   ∀ g : G, (ContinuousLinearMap.adjoint (π g)).comp (S.comp (π g)) = S :=
 TauCeti.ContRepresentation.isUnitarizable π hcont

/-! ### Layer 2: complete reducibility -/

/-- A subspace is **`G`-invariant** for `π` when every `π g` maps it into itself. -/
def IsInvariant (π : ContRepresentation ℂ G V) (U : Submodule ℂ V) : Prop :=
 ∀ g : G, ∀ v ∈ U, π g v ∈ U

/-- For a **unitary** representation, the orthogonal complement of a `G`-invariant subspace is again
`G`-invariant, so it is an invariant complement. This is the averaging-free half of complete
reducibility, once Layer 1 supplies a unitary structure. -/
theorem orthogonal_invariant (π : ContRepresentation ℂ G V) (hπ : IsUnitary π) (U : Submodule ℂ V)
  (hU : IsInvariant π U) : IsInvariant π Uᗮ := sorry

/-- **Complete reducibility, primary (internal) form.** A unitary
finite-dimensional continuous representation is an **orthogonal direct sum of irreducible invariant
subspaces**: a finite family `U : Fin k → Submodule ℂ V` of invariant subspaces, each minimal
(nonzero, with no proper nonzero invariant subspace -- topological irreducibility of the block), that
is an internal direct sum and pairwise orthogonal. This is the geometric statement the roadmap
promises; `isCompletelyReducible` below is its algebraic shadow. -/
theorem exists_orthogonal_irreducible_decomposition (π : ContRepresentation ℂ G V) (hπ : IsUnitary π) :
  ∃ (k : ℕ) (U : Fin k → Submodule ℂ V),
   (∀ i, IsInvariant π (U i)) ∧
   (∀ i, U i ≠ ⊥ ∧ ∀ Wsub : Submodule ℂ V, Wsub ≤ U i → IsInvariant π Wsub →
    Wsub = ⊥ ∨ Wsub = U i) ∧
   DirectSum.IsInternal U ∧
   (∀ i j, i ≠ j → ∀ v ∈ U i, ∀ w ∈ U j, ⟪v, w⟫_ℂ = 0) := sorry

/-- **Complete reducibility, algebraic corollary.** Semisimplicity of the group-algebra module. This
is the specialization-compatible shadow of `exists_orthogonal_irreducible_decomposition`: for
`[Finite G]` it *specializes to* Maschke's `IsSemisimpleModule`, but it is a corollary of the internal
decomposition above (via an explicit correspondence lemma), not literally Mathlib's Maschke theorem. -/
theorem isCompletelyReducible (π : ContRepresentation ℂ G V) (hcont : Continuous π) :
  IsSemisimpleModule (MonoidAlgebra ℂ G) π.toRepresentation.asModule := sorry

/-! ### Layer 3: matrix coefficients -/

/-- **The matrix coefficient** `g ↦ ⟪π g v, w⟫`, a continuous function on `G`. -/
noncomputable def matrixCoeff (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (v w : V) : C(G, ℂ) := TauCeti.ContRepresentation.matrixCoeff π hcont v w

/-- Element-level characterization (anti-vacuity pin). -/
theorem matrixCoeff_apply (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (v w : V) (g : G) :
  matrixCoeff π hcont v w g = ⟪π g v, w⟫_ℂ := rfl

/-- The image of a matrix coefficient in `L²(G)` (via `ContinuousMap.toLp`, using finiteness of
Haar). -/
noncomputable def matrixCoeffLp (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (v w : V) : Lp ℂ 2 (haarProb G) :=
 TauCeti.ContRepresentation.matrixCoeffLp π hcont v w

/-- **The representative ring as a linear span** `𝓡(G) ⊆ C(G)`: the `ℂ`-span of all matrix
coefficients of all finite-dimensional continuous representations. -/
noncomputable def representativeSubmodule (G : Type*) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] : Submodule ℂ C(G, ℂ) :=
 TauCeti.representativeSubmodule ℂ G

/-- **The representative ring as a `*`-subalgebra**. The span of matrix
coefficients is closed under multiplication (via `π ⊗ ρ`), contains the constants (the trivial
representation), and is closed under complex conjugation (via the contragredient). Pin it as a
`StarSubalgebra` so the algebraic structure Peter-Weyl density relies on is not lost; the underlying
set agrees with `representativeSubmodule`. -/
noncomputable def representativeStarSubalgebra (G : Type*) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] : StarSubalgebra ℂ C(G, ℂ) :=
 TauCeti.representativeStarSubalgebra ℂ G

/-- The actual star-subalgebra has the prescribed underlying coefficient span. -/
theorem representativeStarSubalgebra_toSubmodule :
  (representativeStarSubalgebra G).toSubalgebra.toSubmodule = representativeSubmodule G := rfl

/-- Conjugation swaps the defining vectors and inverts the group element. -/
theorem matrixCoeff_conj_inv (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (hu : IsUnitary π) (v w : V) (g : G) :
  (starRingEnd ℂ) (matrixCoeff π hcont v w g) = matrixCoeff π hcont w v g⁻¹ := sorry

/-! ### Layer 4: Schur orthogonality in L²(G) -/

/-- **Schur orthogonality, one irreducible (coordinate-free).** For a unitary irreducible `π` of
dimension `d`, the `L²` inner product of two matrix coefficients is
`d⁻¹ · conj⟪v₁,v₂⟫ · ⟪w₁,w₂⟫` — equivalently `d⁻¹ ⟪v₂,v₁⟫ ⟪w₁,w₂⟫`. The conjugation sits on the
**first** factor: with Mathlib's convention (inner conjugate-linear in the first slot,
`⟪F, H⟫_{L²} = ∫ conj F · H`), the `S¹` scalar check `π_n(g) = e^{2πing}` fixes this placement; the
opposite placement gives the complex conjugate and fails for non-real data.
Proved by averaging a rank-one operator into a self-intertwiner and applying Schur;
`schur_orthogonality_basis` pins the convention at the basis level (where the misplacement is
invisible — Kronecker deltas are real) and the README asks that it be checked against
`fourierBasis`. -/
theorem schur_orthogonality_self (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (hπ : IsUnitary π)
  (hirr : Representation.IsIrreducible π.toRepresentation) (v₁ w₁ v₂ w₂ : V) :
  ⟪matrixCoeffLp π hcont v₁ w₁, matrixCoeffLp π hcont v₂ w₂⟫_ℂ
   = (Module.finrank ℂ V : ℂ)⁻¹ * ((starRingEnd ℂ) ⟪v₁, v₂⟫_ℂ * ⟪w₁, w₂⟫_ℂ) :=
 TauCeti.ContRepresentation.schur_orthogonality_self π hcont hπ hirr v₁ w₁ v₂ w₂

/-- **Schur orthogonality, basis form (convention pin).** With
`π_{ij}(g) = ⟪π g eⱼ, eᵢ⟫ = matrixCoeff π (e j) (e i)`, the `L²` inner product of `π_{ij}` and
`π_{kl}` is `d⁻¹ δ_{jl} δ_{ik}` in Mathlib's exact inner-product convention. This is the equation to
verify against `fourierBasis` on `AddCircle` before trusting the coordinate-free form. -/
theorem schur_orthogonality_basis (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (hπ : IsUnitary π)
  (hirr : Representation.IsIrreducible π.toRepresentation)
  {d : ℕ} (e : OrthonormalBasis (Fin d) ℂ V) (i j k l : Fin d) :
  ⟪matrixCoeffLp π hcont (e j) (e i), matrixCoeffLp π hcont (e l) (e k)⟫_ℂ
   = (d : ℂ)⁻¹ * ((if j = l then (1 : ℂ) else 0) * (if i = k then (1 : ℂ) else 0)) :=
 TauCeti.ContRepresentation.schur_orthogonality_basis π hcont hπ hirr e i j k l

/-- **Schur orthogonality, inequivalent irreducibles.** If there is no nonzero continuous
intertwiner `π → ρ`, every matrix coefficient of `π` is `L²`-orthogonal to every matrix coefficient
of `ρ`. -/
theorem schur_orthogonality_distinct (π : ContRepresentation ℂ G V) (ρ : ContRepresentation ℂ G W)
  (hcont : Continuous π) (hcontρ : Continuous ρ) (hπ : IsUnitary π) (hρ : IsUnitary ρ)
  (hdistinct : ∀ f : ContIntertwiningMap π ρ, f.toContinuousLinearMap = 0)
  (v w : V) (v' w' : W) :
  ⟪matrixCoeffLp π hcont v w, matrixCoeffLp ρ hcontρ v' w'⟫_ℂ = 0 := sorry

/-! ### Layer 5: the Peter-Weyl theorem

The analytic core is proved by the **non-circular convolution-operator route**:
the compact self-adjoint convolution operators on `L²(G)` have finite-dimensional nonzero
eigenspaces, those eigenspaces carry continuous finite-dimensional representations built from matrix
coefficients, and an approximate identity makes convolution approximate the identity uniformly. Point
separation of `𝓡(G)` is a **corollary** of this (see `representativeStarSubalgebra_separatesPoints`),
never an input; Stone-Weierstrass separation is only invoked *after* Peter-Weyl has produced enough
finite-dimensional representations. -/

/-- **The convolution operator** `f ↦ k * f` on `L²(G)` for a kernel `k ∈ C(G)`. -/
noncomputable def convolutionOperator (k : C(G, ℂ)) :
  Lp ℂ 2 (haarProb G) →L[ℂ] Lp ℂ 2 (haarProb G) := TauCeti.convolutionOperator k

/-- **Compactness of the convolution operator.** The load-bearing analytic input; Mathlib supplies
the spectral theorem for compact self-adjoint operators
(`ContinuousLinearMap.finite_dimensional_eigenspace`). -/
-- Native compactness factors through `C(G)` using Arzelà–Ascoli. The README also
-- asks for the continuous-kernel Hilbert–Schmidt comparison as reusable kernel theory.
theorem convolutionOperator_isCompact (k : C(G, ℂ)) :
  IsCompactOperator (convolutionOperator k) :=
 TauCeti.isCompactOperator_convolutionOperator k

/-- **Self-adjointness for a symmetric kernel** `k g⁻¹ = conj (k g)`. -/
theorem convolutionOperator_isSelfAdjoint (k : C(G, ℂ))
  (hk : ∀ g : G, k g⁻¹ = (starRingEnd ℂ) (k g)) :
  IsSelfAdjoint (convolutionOperator k) :=
 TauCeti.isSelfAdjoint_convolutionOperator k hk

/-- **Finite-dimensionality of a nonzero eigenspace** (via Mathlib's compact-operator spectral
theorem). Each such eigenspace is invariant under `R_g f(x) = f(xg)`, hence carries
a continuous finite-dimensional representation. Evaluation realizes its functions
as conjugates of coefficients, and star closure puts them in `𝓡(G)` -- the honest, non-circular
source of the finite-dimensional representations. The invariance / "eigenfunctions
are matrix coefficients" step is named in the README as `nonzero_eigenspace_finite_dim_continuous_rep`
and is proved *before* any point-separation is claimed. -/
theorem convolutionOperator_eigenspace_finiteDimensional (k : C(G, ℂ)) (μ : ℂ) (hμ : μ ≠ 0) :
  FiniteDimensional ℂ (Module.End.eigenspace (convolutionOperator k).toLinearMap μ) :=
 TauCeti.finiteDimensional_eigenspace_convolutionOperator k hμ

/-- **Density in `C(G)` (the analytic core), on the `*`-subalgebra.** The
representative `*`-subalgebra is dense in `C(G)` for the uniform norm. Proved via the compact
self-adjoint convolution operators plus an approximate identity, **not** via a prior separation
hypothesis. -/
theorem representativeStarSubalgebra_dense (G : Type*) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] :
  (representativeStarSubalgebra G).topologicalClosure = ⊤ :=
 TauCeti.representativeStarSubalgebra_dense ℂ G

/-- **Point separation is a corollary, not an input.** Once density is proved, the
representative ring separates points. This is stated *downstream* of
`representativeStarSubalgebra_dense`; it must never be assumed to prove it. -/
theorem representativeStarSubalgebra_separatesPoints (x y : G) (hxy : x ≠ y) :
  ∃ f ∈ representativeStarSubalgebra G, f x ≠ f y :=
 TauCeti.representativeStarSubalgebra_separatesPoints x y hxy

/-- **A model of a finite-dimensional unitary irreducible.** A chosen carrier with
its Hilbert structure, the representation, unitarity, irreducibility, and its dimension. A Peter-Weyl
index requires a whole *skeleton* of these -- one per equivalence class -- and that choice is part of
the theorem, not free; `IsIrrepSkeleton` packages "pairwise inequivalent and exhaustive up to
isomorphism". -/
abbrev IrrepModel (G : Type*) [Group G] [TopologicalSpace G] := TauCeti.IrrepModel ℂ G

/-- The native skeleton quantifies continuous test actions on standard finite-dimensional
Hilbert spaces. Transport along an orthonormal basis gives the arbitrary-carrier formulation.
It records inequivalence and exhaustion by actual unitary equivalences. -/
abbrev IsIrrepSkeleton {ι : Type v} (models : ι → IrrepModel G) : Prop :=
 TauCeti.IsIrrepSkeleton models

/-- **The Peter-Weyl predicate (element-level).** Holds when the Hilbert basis `b`
is the family of normalized matrix coefficients `√dᵢ · (models i)_{jk}`: `b ⟨i, j, k⟩` equals
`(√(models i).dim) • matrixCoeffLp (models i).rep eⱼ eₖ` for chosen orthonormal bases of the model
carriers. Because the summit theorem quantifies the basis existentially, all the element-level
content must live *here* (a bundled `HilbertBasis` without its `coe_*` is near-vacuous). -/
def IsPeterWeylBasis {ι : Type v} (models : ι → IrrepModel G)
  (b : HilbertBasis (Σ i : ι, Fin (models i).dim × Fin (models i).dim) ℂ (Lp ℂ 2 (haarProb G))) :
  Prop :=
  ∃ e : ∀ i : ι, OrthonormalBasis (Fin (models i).dim) ℂ (EuclideanSpace ℂ (Fin (models i).dim)),
    ∀ (i : ι) (j k : Fin (models i).dim),
      (b ⟨i, (j, k)⟩ : Lp ℂ 2 (haarProb G))
        = (Real.sqrt (models i).dim : ℂ) • matrixCoeffLp (models i).rep (models i).continuous_rep (e i j) (e i k)

/-- **The Peter-Weyl theorem (the summit).** There is a skeleton of finite-dimensional unitary
irreducibles whose normalized matrix coefficients form a Hilbert basis of `L²(G)`, indexed by
`Σ i, Fin dᵢ × Fin dᵢ`. Assembled from Layer 4's orthonormal system and Layer 5's `L²`-density via
`HilbertBasis.mkOfOrthogonalEqBot` (the `Completed/OrthogonalL2Bases` pattern); the skeleton and bases are
chosen data. For the circle this specializes to Mathlib's `fourierBasis`. -/
theorem peterWeylBasis (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] :
  ∃ (ι : Type u) (models : ι → IrrepModel G) (_ : IsIrrepSkeleton models)
   (b : HilbertBasis (Σ i : ι, Fin (models i).dim × Fin (models i).dim) ℂ
    (Lp ℂ 2 (haarProb G))),
   IsPeterWeylBasis models b := by
  refine ⟨TauCeti.IrrepClass ℂ G,
    TauCeti.IrrepClass.model (𝕜 := ℂ) (G := G),
    TauCeti.isIrrepSkeleton_model ℂ G, TauCeti.stdPeterWeylBasis ℂ G, ?_⟩
  refine ⟨fun i => (TauCeti.IrrepClass.model (𝕜 := ℂ) (G := G) i).basis, ?_⟩
  intro i j k
  change (TauCeti.stdPeterWeylBasis ℂ G) ⟨i, (j, k)⟩ = _
  exact congrFun (TauCeti.coe_stdPeterWeylBasis ℂ G) ⟨i, (j, k)⟩

/-! ### Layer 6: characters of compact groups -/

/-- **The character** `g ↦ trace (π g)`, a continuous class function; reuses `FDRep.character`'s
algebraic identities. -/
noncomputable def character (π : ContRepresentation ℂ G V) (hcont : Continuous π) : C(G, ℂ) :=
 TauCeti.ContRepresentation.character π hcont

/-- The trace is the conjugate of the diagonal sum for this coefficient convention. -/
theorem star_character_eq_sum_matrixCoeff (π : ContRepresentation ℂ G V)
  (hcont : Continuous π) {d : ℕ} (e : OrthonormalBasis (Fin d) ℂ V) (g : G) :
  (starRingEnd ℂ) (character π hcont g) = ∑ i, matrixCoeff π hcont (e i) (e i) g := sorry

/-- The character is a **class function** (`char_conj` transported). -/
theorem character_conj (π : ContRepresentation ℂ G V) (hcont : Continuous π) (g h : G) :
  character π hcont (h * g * h⁻¹) = character π hcont g :=
 TauCeti.ContRepresentation.character_conj π hcont g h

/-- The image of the character in `L²(G)`. -/
noncomputable def characterLp (π : ContRepresentation ℂ G V) (hcont : Continuous π) :
  Lp ℂ 2 (haarProb G) := TauCeti.ContRepresentation.characterLp π hcont

/-- **The `L²` class functions (central subspace).** The closed subspace of
`L²(G)` fixed (a.e., not pointwise) by every conjugation `f ↦ f ∘ (h · h⁻¹)`. Characters span this
subspace; stating "characters span the class functions" needs a genuine closed submodule of the a.e.
equivalence classes, not a pointwise-invariance slogan. -/
noncomputable def centralLp (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] :
  Submodule ℂ (Lp ℂ 2 (haarProb G)) := TauCeti.classFunctionLp ℂ ℂ 2 (TauCeti.haarProb G)

/-- Each character lands in the central subspace. -/
theorem characterLp_mem_centralLp (π : ContRepresentation ℂ G V) (hcont : Continuous π) :
  characterLp π hcont ∈ centralLp G :=
 TauCeti.ContRepresentation.characterLp_mem_classFunctionLp π hcont

/-- **Character orthonormality, diagonal.** For a unitary irreducible, `∫ |χ_π|² dμ = 1`; the
`[Finite G]` shadow is Mathlib's `char_orthonormal`. -/
theorem character_orthonormal_self (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (hπ : IsUnitary π)
  (hirr : Representation.IsIrreducible π.toRepresentation) :
  ⟪characterLp π hcont, characterLp π hcont⟫_ℂ = 1 :=
 TauCeti.ContRepresentation.character_orthonormal_self π hcont hπ hirr

/-- **Character orthonormality, off-diagonal.** Characters of inequivalent irreducibles are
orthogonal in `L²(G)`. -/
theorem character_orthonormal_distinct (π : ContRepresentation ℂ G V) (ρ : ContRepresentation ℂ G W)
  (hcont : Continuous π) (hcontρ : Continuous ρ) (hπ : IsUnitary π) (hρ : IsUnitary ρ)
  (hdistinct : ∀ f : ContIntertwiningMap π ρ, f.toContinuousLinearMap = 0) :
  ⟪characterLp π hcont, characterLp ρ hcontρ⟫_ℂ = 0 := sorry

/-! ### Layer 6b: the Frobenius-Schur reality trichotomy for compact groups

The reality invariant (real / quaternionic / complex type) is
built for finite groups in `../CharacterTheory` Layer 7 but is needed for compact groups — spinor
reality types (Majorana / symplectic-Majorana / Dirac) and matter-representation reality generally.
The Haar integral replaces the finite average; every prerequisite (characters, Haar probability
measure, invariant forms) is already in this roadmap. Wording deliberately restricted to **compact**
groups: the Haar-integral route does not apply to noncompact `Spin(p, q)`; the Lie-algebra side
(`−w₀` self-duality and the Tits sign) is pinned in `../LieHighestWeight`. -/

/-- **The Frobenius-Schur indicator** of a finite-dimensional continuous representation of a compact
group: `ν₂(π) = ∫_G χ_π(g²) dμ`, the Haar form of the finite-group average. -/
noncomputable def frobeniusSchurIndicator (π : ContRepresentation ℂ G V)
  (hcont : Continuous π) : ℂ := _root_.ContRepresentation.frobeniusSchurIndicator π hcont

/-- **The trichotomy**: for a unitary irreducible, the indicator is `+1`, `0`, or `-1`. -/
theorem frobeniusSchurIndicator_trichotomy (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (hπ : IsUnitary π)
  (hirr : Representation.IsIrreducible π.toRepresentation) :
  frobeniusSchurIndicator π hcont = 1 ∨ frobeniusSchurIndicator π hcont = 0
    ∨ frobeniusSchurIndicator π hcont = -1 :=
 _root_.ContRepresentation.frobeniusSchurIndicator_trichotomy π hcont hπ hirr

/-- **`ν₂ = +1` iff orthogonal type**: a nonzero invariant symmetric nondegenerate bilinear form
exists (mirror of the finite-group `frobeniusSchurIndicatorRep_eq_one_iff`). -/
theorem frobeniusSchurIndicator_eq_one_iff (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (hπ : IsUnitary π)
  (hirr : Representation.IsIrreducible π.toRepresentation) :
  frobeniusSchurIndicator π hcont = 1 ↔
    ∃ B : LinearMap.BilinForm ℂ V, B ≠ 0 ∧ B.IsSymm ∧ B.Nondegenerate ∧
      ∀ (g : G) (v w : V), B (π g v) (π g w) = B v w := sorry

/-- **`ν₂ = -1` iff symplectic (quaternionic) type**: a nonzero invariant alternating nondegenerate
bilinear form exists. -/
theorem frobeniusSchurIndicator_eq_neg_one_iff (π : ContRepresentation ℂ G V) (hcont : Continuous π)
  (hπ : IsUnitary π)
  (hirr : Representation.IsIrreducible π.toRepresentation) :
  frobeniusSchurIndicator π hcont = -1 ↔
    ∃ B : LinearMap.BilinForm ℂ V, B ≠ 0 ∧ B.IsAlt ∧ B.Nondegenerate ∧
      ∀ (g : G) (v w : V), B (π g v) (π g w) = B v w := sorry

/-- **`ν₂ = +1` iff realizable over `ℝ`**, in structure-map form: there is a conjugate-linear
`J : V →ₗ⋆[ℂ] V` with `J² = 1` commuting with the action (its fixed points are the real form); the
quaternionic case `ν₂ = -1` is `J² = -1`. This is the operational reality criterion the spinor
applications consume. -/
theorem frobeniusSchurIndicator_eq_one_iff_exists_structureMap (π : ContRepresentation ℂ G V)
  (hcont : Continuous π) (hπ : IsUnitary π) (hirr : Representation.IsIrreducible π.toRepresentation) :
  frobeniusSchurIndicator π hcont = 1 ↔
    ∃ J : V →ₗ⋆[ℂ] V, (∀ v, J (J v) = v) ∧ ∀ (g : G) (v : V), J (π g v) = π g (J v) :=
 _root_.ContRepresentation.frobeniusSchurIndicator_eq_one_iff_exists_structureMap π hcont hπ hirr

/-! ### The engine case: `SU(2)`, the maximal torus, and the irreducible classification

`SU(2)` is `Matrix.specialUnitaryGroup (Fin 2) ℂ`. The native imports supply the compact-group topology and Borel instances;
the abstract theory above is
validated on this concrete group.

**The classification is proved, not assumed.** Peter-Weyl gives a Hilbert-space
decomposition into *some* irreducibles; it does not identify them as the `Symⁿ(ℂ²)`. The
classification includes torus conjugacy, the weight/string and highest-weight development,
irreducibility, inequivalence, and exhaustion. The native exhaustion argument uses independent
uniform density of the explicit symmetric-power characters plus Schur orthogonality; it assumes
neither exhaustion nor completeness of all irreducible characters. -/

section SU2

/-- `SU(2)`, the special unitary group of `2×2` complex matrices. -/
abbrev SU2 : Type := TauCeti.SU2

variable {E : Type} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]

/-- **The irreducibles of `SU(2)`**: the representation on `Sym^n(ℂ²)` (degree-`n` homogeneous
polynomials in two variables), of dimension `n+1`, modelled on `EuclideanSpace ℂ (Fin (n+1))`.
This native monomial model is not unitary in its Euclidean norm for n≥2. Pass
through `exists_isUnitary_congr` for unitary coefficient applications; trace
characters are unchanged by that equivalence. -/
noncomputable def su2Irrep (n : ℕ) : ContRepresentation ℂ SU2 (EuclideanSpace ℂ (Fin (n + 1))) :=
 TauCeti.SU2.symPowerModel n

/-- Parameter continuity comes from the native symmetric-power construction. -/
theorem continuous_su2Irrep (n : ℕ) : Continuous (su2Irrep n) :=
 TauCeti.SU2.continuous_symPowerModel n

/-- Each `su2Irrep n` is irreducible. -/
theorem su2Irrep_irreducible (n : ℕ) :
  Representation.IsIrreducible (su2Irrep n).toRepresentation :=
 TauCeti.SU2.isIrreducible_symPowerModel n

/-- The character at the identity is the dimension `n+1`. -/
theorem su2Irrep_character_one (n : ℕ) :
  character (su2Irrep n) (continuous_su2Irrep n) 1 = (n + 1 : ℂ) := sorry

/-- The **maximal torus** element `diag(e^{iθ}, e^{-iθ}) ∈ SU(2)`. -/
noncomputable def su2Torus (θ : ℝ) : SU2 := TauCeti.SU2.torusExp θ

/-- **Torus conjugacy (classification input).** Every element of `SU(2)` is
conjugate into the maximal torus (unitary diagonalization). This reduces class functions and
characters to the torus. -/
theorem su2_conjugate_into_torus (g : SU2) :
  ∃ (h : SU2) (θ : ℝ), h * g * h⁻¹ = su2Torus θ := sorry

/-- **Weight/string decomposition (classification input).** The character of
`su2Irrep n` on the torus is the weight string `e^{inθ} + e^{i(n-2)θ} + ⋯ + e^{-inθ}`; the weights
are `{n, n-2, …, -n}`, each with multiplicity one. This is computed directly from the diagonal
action and is what the highest-weight argument runs on. -/
theorem su2Irrep_character_torus (n : ℕ) (θ : ℝ) :
  character (su2Irrep n) (continuous_su2Irrep n) (su2Torus θ)
   = ∑ k ∈ Finset.range (n + 1),
     Complex.exp (Complex.I * ((n - 2 * (k : ℤ) : ℤ) : ℂ) * (θ : ℂ)) := sorry

/-- The sine quotient requires a nonzero denominator. The weight sum above is global. -/
theorem su2Irrep_character_sin_quotient (n : ℕ) (θ : ℝ) (hθ : Real.sin θ ≠ 0) :
  character (su2Irrep n) (continuous_su2Irrep n) (su2Torus θ) =
    ((Real.sin ((n + 1 : ℝ) * θ) / Real.sin θ : ℝ) : ℂ) := sorry

/-- The global endpoint formula at every integral multiple of π. -/
theorem su2Irrep_character_endpoint (n : ℕ) (k : ℤ) :
  character (su2Irrep n) (continuous_su2Irrep n) (su2Torus ((k : ℝ) * Real.pi)) =
    (n + 1 : ℂ) * (-1 : ℂ) ^ ((n : ℤ) * k) := sorry

/-- **Pairwise inequivalence (classification).** For `m ≠ n` there is no nonzero
intertwiner `su2Irrep m → su2Irrep n` (distinct highest weights). -/
theorem su2Irrep_inequiv {m n : ℕ} (hmn : m ≠ n)
  (f : ContIntertwiningMap (su2Irrep m) (su2Irrep n)) :
  f.toContinuousLinearMap = 0 := sorry

/-- **Exhaustion (classification).** Every finite-dimensional continuous *unitary
irreducible* representation of `SU(2)` admits a nonzero intertwiner from some `su2Irrep n` (hence, by
Schur, is isomorphic to it). Use the independent native character-density exhaustion
argument described above; this is a classification theorem beyond general Peter–Weyl. -/
theorem su2Irrep_exhaust (π : ContRepresentation ℂ SU2 E) (hcont : Continuous π)
  (hπ : IsUnitary π)
  (hirr : Representation.IsIrreducible π.toRepresentation) :
  ∃ (n : ℕ) (f : ContIntertwiningMap (su2Irrep n) π), f.toContinuousLinearMap ≠ 0 := sorry

/-- **Weyl integration formula for `SU(2)`.** Integration of a class function over `SU(2)` reduces to
the maximal torus with Weyl factor `|Δ(θ)|² = 4 sin²θ`. The normalization is pinned so that the
`f = 1` test gives mass `1` (see `weyl_integration_formula_normalized`); the interval `[0, π]` is the
Weyl chamber and `(1/(2π))·4 sin²θ` the transported torus density. -/
theorem weyl_integration_formula (f : C(SU2, ℂ)) (hf : ∀ g h : SU2, f (h * g * h⁻¹) = f g) :
  ∫ g, f g ∂(haarProb SU2)
   = (1 / (2 * Real.pi) : ℂ)
     * ∫ θ in (0 : ℝ)..Real.pi, f (su2Torus θ) * ((4 * Real.sin θ ^ 2 : ℝ) : ℂ) := sorry

/-- **Normalization test for the Weyl integration formula.** The `f = 1` case:
`(1/(2π)) ∫₀^π 4 sin²θ dθ = 1`, confirming `weyl_integration_formula` is correctly normalized against
the Haar probability measure. -/
theorem weyl_integration_formula_normalized :
  (1 / (2 * Real.pi) : ℂ) * ∫ θ in (0 : ℝ)..Real.pi, ((4 * Real.sin θ ^ 2 : ℝ) : ℂ) = 1 :=
 TauCeti.SU2.weyl_integration_formula_normalized

/-- **Character orthonormality for `SU(2)`, via the Weyl integration formula.** The concrete form of
`character_orthonormal_self`/`_distinct` for `SU(2)`, computed on the torus. -/
theorem su2Character_orthonormal (m n : ℕ) :
  ∫ g, character (su2Irrep m) (continuous_su2Irrep m) g * (starRingEnd ℂ) (character (su2Irrep n) (continuous_su2Irrep n) g) ∂(haarProb SU2)
   = if m = n then 1 else 0 := sorry

end SU2

/-!
Acceptance criteria (see `README.md`):
* **Finite groups** recover `../CharacterTheory`: for `[Finite G]` with the discrete topology,
 `exists_orthogonal_irreducible_decomposition` specializes to Maschke and `character_orthonormal_self`
 to the first orthogonality relation.
* **The circle** `AddCircle 1`: `peterWeylBasis` specializes to Mathlib's `fourierBasis`,
 `schur_orthogonality_basis` matches Mathlib's inner-product convention against `orthonormal_fourier`,
 and `character_orthonormal_self` to `orthonormal_fourier`.
* **`SU(2)`** (its own deliverable): the classification
 (`su2Irrep_inequiv`, `su2Irrep_exhaust`) includes the weight development and independent
 character-density exhaustion argument, and
 `su2Character_orthonormal` is derived through `weyl_integration_formula`, matching the abstract
 `character_orthonormal_self`. `SU(2)` exhaustion is **not** an acceptance criterion for the general
 compact-group layers.
-/

end TauCetiRoadmap.RepresentationTheory.CompactGroups
