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
(`ContinuousMap.toLp_denseRange`), the **compact-operator spectral theorem**
(`IsCompactOperator`, `IsCompactOperator.finite_dimensional_eigenspace`,
`ContinuousLinearMap.adjoint`), and **one worked instance of the whole theory** -- the Fourier
basis `fourierBasis : HilbertBasis ℤ ℂ (Lp ℂ 2 haarAddCircle)` of `L²(S¹)`. It has **no Peter-Weyl
theorem, no continuous unitary-representation theory, no Haar averaging / unitarian trick, no matrix
coefficients, no Schur orthogonality in `L²(G)`, no compact-group characters, and no `SU(2)`
representation theory** (see `README.md` for the file-by-file map).

The design follows `README.md`'s layers: normalized Haar and averaging (Layer 0); the unitarity
predicate and unitarizability (Layer 1); complete reducibility (Layer 2); matrix coefficients
(Layer 3); Schur orthogonality (Layer 4); the Peter-Weyl `HilbertBasis` (Layer 5); characters
(Layer 6); and the `SU(2)`/torus engine with its own irreducible-classification layer. The
Hilbert-basis assembly is cited from `../OrthogonalL2Bases`; the finite-group specialization is
`../CharacterTheory`. `README.md` remains the definitive document.
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

/-- The total Haar mass of a compact group is **finite** (`CompactSpace.isFiniteMeasure`); needed to
know the rescaling in `haarProb` is by a finite scalar. -/
theorem haar_univ_lt_top : Measure.haar (G := G) Set.univ < ⊤ := sorry

/-- The total Haar mass is **nonzero** (Haar is `IsOpenPosMeasure` and `Set.univ` is a nonempty
open set); needed to know `(Measure.haar univ)⁻¹` is not `0`, so `haarProb` is genuinely normalized.
The README flags this as a milestone in its own right. -/
theorem haar_univ_ne_zero : Measure.haar (G := G) Set.univ ≠ 0 := sorry

/-- `haarProb G` is a probability measure. -/
theorem isProbabilityMeasure_haarProb : IsProbabilityMeasure (haarProb G) := sorry

/-- `haarProb G` assigns mass `1` to the whole group. -/
theorem haarProb_apply_univ : haarProb G Set.univ = 1 := sorry

/-- `haarProb G` is left-invariant (inherited from `Measure.haar`). -/
theorem isMulLeftInvariant_haarProb : Measure.IsMulLeftInvariant (haarProb G) := sorry

/-- A compact group is **unimodular**: normalized Haar is right-invariant as well as left-invariant.
The averaging arguments (unitarian trick, Schur orthogonality) use both invariances. -/
theorem isMulRightInvariant_haarProb : Measure.IsMulRightInvariant (haarProb G) := sorry

/-- **Inversion invariance** of normalized Haar on a compact group: `g ↦ g⁻¹` preserves `haarProb`
(`Measure.IsInvInvariant`, i.e. `map Inv.inv (haarProb G) = haarProb G`). The Schur-orthogonality
involution `conj (matrixCoeff π v w) = matrixCoeff π̄ w v` runs on this. Present in the README but
previously missing from the pinned signatures. -/
theorem isInvInvariant_haarProb : Measure.IsInvInvariant (haarProb G) := sorry

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℂ V] [FiniteDimensional ℂ V]
variable {W : Type*} [NormedAddCommGroup W] [InnerProductSpace ℂ W] [FiniteDimensional ℂ W]

/-! ### Layer 1: unitarizability (Weyl's unitarian trick) -/

/-- **Unitarity** of a continuous representation: every `π g` preserves the inner product. The one
new bundling is this `Prop`; the carrier stays Mathlib's `ContRepresentation ℂ G V = G →* V →L[ℂ] V`. -/
def IsUnitary (π : ContRepresentation ℂ G V) : Prop :=
 ∀ (g : G) (v w : V), ⟪π g v, π g w⟫_ℂ = ⟪v, w⟫_ℂ

/-- **The unitarian trick (averaged positive form).** Averaging any inner product against Haar
produces a `G`-invariant inner product on the *same* space `V`. That invariant form is
`⟪v, w⟫_G = ⟪S v, w⟫` for a positive-definite self-adjoint operator `S` (the averaged Gram operator),
and `G`-invariance is exactly `(π g)† ∘ S ∘ (π g) = S`. This is the correct statement of
unitarizability: returning a bare `InnerProductSpace.Core` does **not** make `π` unitary under Lean's
fixed `InnerProductSpace ℂ V` instance. From `S` one recovers a unitary
representation on the retopologized space, or conjugates by `S ^ (1/2)` to unitarize `π` on the
original Hilbert space. Everything downstream may therefore assume `IsUnitary`. -/
theorem isUnitarizable (π : ContRepresentation ℂ G V) :
  ∃ S : V →L[ℂ] V,
   IsSelfAdjoint S ∧ (∀ v : V, v ≠ 0 → 0 < (⟪S v, v⟫_ℂ).re) ∧
   ∀ g : G, (ContinuousLinearMap.adjoint (π g)).comp (S.comp (π g)) = S := sorry

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

/-- **The representative ring as a linear span** `𝓡(G) ⊆ C(G)`: the `ℂ`-span of all matrix
coefficients of all finite-dimensional continuous representations. -/
noncomputable def representativeSubmodule (G : Type*) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] : Submodule ℂ C(G, ℂ) := sorry

/-- **The representative ring as a `*`-subalgebra**. The span of matrix
coefficients is closed under multiplication (via `π ⊗ ρ`), contains the constants (the trivial
representation), and is closed under complex conjugation (via the contragredient). Pin it as a
`StarSubalgebra` so the algebraic structure Peter-Weyl density relies on is not lost; the underlying
set agrees with `representativeSubmodule`. -/
noncomputable def representativeStarSubalgebra (G : Type*) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] : StarSubalgebra ℂ C(G, ℂ) := sorry

/-! ### Layer 4: Schur orthogonality in L²(G) -/

/-- **Schur orthogonality, one irreducible (coordinate-free).** For a unitary irreducible `π` of
dimension `d`, the `L²` inner product of two matrix coefficients is
`d⁻¹ ⟪v₁,v₂⟫ · conj⟪w₁,w₂⟫`. Proved by averaging a rank-one operator into a self-intertwiner and
applying Schur. The exact placement of the conjugation is convention-sensitive against Mathlib's `L2`
inner product; `schur_orthogonality_basis` pins it at the basis level and the README asks that it be
checked against `fourierBasis`. -/
theorem schur_orthogonality_self (π : ContRepresentation ℂ G V) (hπ : IsUnitary π)
  (hirr : Representation.IsIrreducible π.toRepresentation) (v₁ w₁ v₂ w₂ : V) :
  ⟪matrixCoeffLp π v₁ w₁, matrixCoeffLp π v₂ w₂⟫_ℂ
   = (Module.finrank ℂ V : ℂ)⁻¹ * (⟪v₁, v₂⟫_ℂ * (starRingEnd ℂ) ⟪w₁, w₂⟫_ℂ) := sorry

/-- **Schur orthogonality, basis form (convention pin).** With
`π_{ij}(g) = ⟪π g eⱼ, eᵢ⟫ = matrixCoeff π (e j) (e i)`, the `L²` inner product of `π_{ij}` and
`π_{kl}` is `d⁻¹ δ_{jl} δ_{ik}` in Mathlib's exact inner-product convention. This is the equation to
verify against `fourierBasis` on `AddCircle` before trusting the coordinate-free form. -/
theorem schur_orthogonality_basis (π : ContRepresentation ℂ G V) (hπ : IsUnitary π)
  (hirr : Representation.IsIrreducible π.toRepresentation)
  {d : ℕ} (e : OrthonormalBasis (Fin d) ℂ V) (i j k l : Fin d) :
  ⟪matrixCoeffLp π (e j) (e i), matrixCoeffLp π (e l) (e k)⟫_ℂ
   = (d : ℂ)⁻¹ * ((if j = l then (1 : ℂ) else 0) * (if i = k then (1 : ℂ) else 0)) := sorry

/-- **Schur orthogonality, inequivalent irreducibles.** If there is no nonzero continuous
intertwiner `π → ρ`, every matrix coefficient of `π` is `L²`-orthogonal to every matrix coefficient
of `ρ`. -/
theorem schur_orthogonality_distinct (π : ContRepresentation ℂ G V) (ρ : ContRepresentation ℂ G W)
  (hπ : IsUnitary π) (hρ : IsUnitary ρ)
  (hdistinct : ∀ f : ContIntertwiningMap π ρ, f.toContinuousLinearMap = 0)
  (v w : V) (v' w' : W) :
  ⟪matrixCoeffLp π v w, matrixCoeffLp ρ v' w'⟫_ℂ = 0 := sorry

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
  Lp ℂ 2 (haarProb G) →L[ℂ] Lp ℂ 2 (haarProb G) := sorry

/-- **Compactness of the convolution operator.** The load-bearing analytic input; Mathlib supplies
the spectral theorem for compact self-adjoint operators
(`IsCompactOperator.finite_dimensional_eigenspace`). -/
theorem convolutionOperator_isCompact (k : C(G, ℂ)) :
  IsCompactOperator (convolutionOperator k) := sorry

/-- **Self-adjointness for a symmetric kernel** `k g⁻¹ = conj (k g)`. -/
theorem convolutionOperator_isSelfAdjoint (k : C(G, ℂ))
  (hk : ∀ g : G, k g⁻¹ = (starRingEnd ℂ) (k g)) :
  IsSelfAdjoint (convolutionOperator k) := sorry

/-- **Finite-dimensionality of a nonzero eigenspace** (via Mathlib's compact-operator spectral
theorem). Each such eigenspace is translation-invariant, hence carries a continuous
finite-dimensional representation of `G` whose functions lie in `𝓡(G)` -- the honest, non-circular
source of the finite-dimensional representations. The invariance / "eigenfunctions
are matrix coefficients" step is named in the README as `nonzero_eigenspace_finite_dim_continuous_rep`
and is proved *before* any point-separation is claimed. -/
theorem convolutionOperator_eigenspace_finiteDimensional (k : C(G, ℂ)) (μ : ℂ) (hμ : μ ≠ 0) :
  FiniteDimensional ℂ (Module.End.eigenspace (convolutionOperator k).toLinearMap μ) := sorry

/-- **Density in `C(G)` (the analytic core), on the `*`-subalgebra.** The
representative `*`-subalgebra is dense in `C(G)` for the uniform norm. Proved via the compact
self-adjoint convolution operators plus an approximate identity, **not** via a prior separation
hypothesis. -/
theorem representativeStarSubalgebra_dense (G : Type*) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] :
  (representativeStarSubalgebra G).topologicalClosure = ⊤ := sorry

/-- **Point separation is a corollary, not an input.** Once density is proved, the
representative ring separates points. This is stated *downstream* of
`representativeStarSubalgebra_dense`; it must never be assumed to prove it. -/
theorem representativeStarSubalgebra_separatesPoints (x y : G) (hxy : x ≠ y) :
  ∃ f ∈ representativeStarSubalgebra G, f x ≠ f y := sorry

/-- **A model of a finite-dimensional unitary irreducible.** A chosen carrier with
its Hilbert structure, the representation, unitarity, irreducibility, and its dimension. A Peter-Weyl
index requires a whole *skeleton* of these -- one per equivalence class -- and that choice is part of
the theorem, not free; `IsIrrepSkeleton` packages "pairwise inequivalent and exhaustive up to
isomorphism". -/
structure IrrepModel (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] where
 carrier : Type
 [normedAddCommGroup : NormedAddCommGroup carrier]
 [innerProductSpace : InnerProductSpace ℂ carrier]
 [finiteDimensional : FiniteDimensional ℂ carrier]
 rep : ContRepresentation ℂ G carrier
 isUnitary : IsUnitary rep
 isIrreducible : Representation.IsIrreducible rep.toRepresentation
 dim : ℕ
 dim_eq : dim = Module.finrank ℂ carrier

/-- **A skeleton of the unitary dual**: the family `models` is pairwise inequivalent and hits every
finite-dimensional continuous irreducible up to isomorphism. This is the chosen data the Peter-Weyl
index `Σ i, Fin dᵢ × Fin dᵢ` rests on. -/
def IsIrrepSkeleton {ι : Type} (models : ι → IrrepModel G) : Prop := sorry

/-- **The Peter-Weyl predicate (element-level).** Holds when the Hilbert basis `b`
is the family of normalized matrix coefficients `√dᵢ · (models i)_{jk}`: `b ⟨i, j, k⟩` equals
`(√(models i).dim) • matrixCoeffLp (models i).rep eⱼ eₖ` for chosen orthonormal bases of the model
carriers. Because the summit theorem quantifies the basis existentially, all the element-level
content must live *here* (a bundled `HilbertBasis` without its `coe_*` is near-vacuous). -/
def IsPeterWeylBasis {ι : Type} (models : ι → IrrepModel G)
  (b : HilbertBasis (Σ i : ι, Fin (models i).dim × Fin (models i).dim) ℂ (Lp ℂ 2 (haarProb G))) :
  Prop := sorry

/-- **The Peter-Weyl theorem (the summit).** There is a skeleton of finite-dimensional unitary
irreducibles whose normalized matrix coefficients form a Hilbert basis of `L²(G)`, indexed by
`Σ i, Fin dᵢ × Fin dᵢ`. Assembled from Layer 4's orthonormal system and Layer 5's `L²`-density via
`HilbertBasis.mkOfOrthogonalEqBot` (the `../OrthogonalL2Bases` pattern); the skeleton and bases are
chosen data. For the circle this specializes to Mathlib's `fourierBasis`. -/
theorem peterWeylBasis (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] :
  ∃ (ι : Type) (models : ι → IrrepModel G) (_ : IsIrrepSkeleton models)
   (b : HilbertBasis (Σ i : ι, Fin (models i).dim × Fin (models i).dim) ℂ
    (Lp ℂ 2 (haarProb G))),
   IsPeterWeylBasis models b := sorry

/-! ### Layer 6: characters of compact groups -/

/-- **The character** `g ↦ trace (π g)`, a continuous class function; reuses `FDRep.character`'s
algebraic identities. -/
noncomputable def character (π : ContRepresentation ℂ G V) : C(G, ℂ) := sorry

/-- The character is a **class function** (`char_conj` transported). -/
theorem character_conj (π : ContRepresentation ℂ G V) (g h : G) :
  character π (h * g * h⁻¹) = character π g := sorry

/-- The image of the character in `L²(G)`. -/
noncomputable def characterLp (π : ContRepresentation ℂ G V) : Lp ℂ 2 (haarProb G) := sorry

/-- **The `L²` class functions (central subspace).** The closed subspace of
`L²(G)` fixed (a.e., not pointwise) by every conjugation `f ↦ f ∘ (h · h⁻¹)`. Characters span this
subspace; stating "characters span the class functions" needs a genuine closed submodule of the a.e.
equivalence classes, not a pointwise-invariance slogan. -/
noncomputable def centralLp (G : Type*) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [T2Space G] [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] :
  Submodule ℂ (Lp ℂ 2 (haarProb G)) := sorry

/-- Each character lands in the central subspace. -/
theorem characterLp_mem_centralLp (π : ContRepresentation ℂ G V) :
  characterLp π ∈ centralLp G := sorry

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

/-! ### The engine case: `SU(2)`, the maximal torus, and the irreducible classification

`SU(2)` is `Matrix.specialUnitaryGroup (Fin 2) ℂ`. The compact-group setup (topological group,
compactness, Borel structure) is taken as given here (it is genuine, and proving it is itself part of
this milestone -- see the README's "build here" note); the abstract theory above is
validated on this concrete group.

**The classification is proved, not assumed.** Peter-Weyl gives a Hilbert-space
decomposition into *some* irreducibles; it does not identify them as the `Symⁿ(ℂ²)`. The
classification below -- torus conjugacy, weight/string decomposition, and the highest-weight argument
-- is what proves that the `su2Irrep n` are irreducible, pairwise inequivalent, and **exhaust** the
finite-dimensional irreducibles. Only then is character orthonormality used as validation. -/

section SU2

/-- `SU(2)`, the special unitary group of `2×2` complex matrices. -/
abbrev SU2 : Type := Matrix.specialUnitaryGroup (Fin 2) ℂ

variable [IsTopologicalGroup SU2] [CompactSpace SU2] [T2Space SU2]
 [MeasurableSpace SU2] [BorelSpace SU2] [LocallyCompactSpace SU2]

variable {E : Type} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]

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
  character (su2Irrep n) (su2Torus θ)
   = ∑ k ∈ Finset.range (n + 1),
     Complex.exp (Complex.I * ((n - 2 * (k : ℤ) : ℤ) : ℂ) * (θ : ℂ)) := sorry

/-- **Pairwise inequivalence (classification).** For `m ≠ n` there is no nonzero
intertwiner `su2Irrep m → su2Irrep n` (distinct highest weights). -/
theorem su2Irrep_inequiv {m n : ℕ} (hmn : m ≠ n)
  (f : ContIntertwiningMap (su2Irrep m) (su2Irrep n)) :
  f.toContinuousLinearMap = 0 := sorry

/-- **Exhaustion (classification).** Every finite-dimensional continuous *unitary
irreducible* representation of `SU(2)` admits a nonzero intertwiner from some `su2Irrep n` (hence, by
Schur, is isomorphic to it). This is the real classification statement -- proved by the
weight/highest-weight argument -- **not** an immediate consequence of Peter-Weyl. -/
theorem su2Irrep_exhaust (π : ContRepresentation ℂ SU2 E) (hπ : IsUnitary π)
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
  (1 / (2 * Real.pi) : ℂ) * ∫ θ in (0 : ℝ)..Real.pi, ((4 * Real.sin θ ^ 2 : ℝ) : ℂ) = 1 := sorry

/-- **Character orthonormality for `SU(2)`, via the Weyl integration formula.** The concrete form of
`character_orthonormal_self`/`_distinct` for `SU(2)`, computed on the torus. -/
theorem su2Character_orthonormal (m n : ℕ) :
  ∫ g, character (su2Irrep m) g * (starRingEnd ℂ) (character (su2Irrep n) g) ∂(haarProb SU2)
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
 (`su2Irrep_inequiv`, `su2Irrep_exhaust`) is proved from the weight argument, and
 `su2Character_orthonormal` is derived through `weyl_integration_formula`, matching the abstract
 `character_orthonormal_self`. `SU(2)` exhaustion is **not** an acceptance criterion for the general
 compact-group layers.
-/

end TauCetiRoadmap.RepresentationTheory.CompactGroups
