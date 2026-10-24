import Mathlib

/-!
# Successive minima and Minkowski's theorems: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`, which numbers the milestones as Layer `n.m`. The declarations below suggest Lean forms
for particular milestones, so that contributors and reviewers converge on names and signatures;
discharging all of them finishes neither a layer nor the roadmap. `sorry` marks goals, not results.

Design choices made explicit here:

* lattices are Mathlib's `IsZLattice` submodules and covolumes are `ZLattice.covolume`, taken
  with an explicit additive Haar measure in Minkowski's second theorem;
* `MeasureTheory.successiveMin` is the definition of Mathlib's successive-minima proposal, on
  arbitrary sets with natural indices and `ℝ≥0` values;
* `successiveMin` is its real-valued adapter on a `ConvexBody`, indexed by
  `Fin (finrank ℝ E)`, with `i` meaning the `(i+1)`-st minimum;
* central symmetry of the body is a separate hypothesis, assumed only where it is needed;
* Gram matrices are Mathlib's `Matrix.gram`, conjugate-linear in the first argument.
-/

noncomputable section
open scoped BigOperators Pointwise NNReal Topology
open MeasureTheory Module

/-- The nonnegative dilation threshold at which the real span has dimension greater than `i`, for
an arbitrary set and natural index (1.1). This is the definition of Mathlib's successive-minima
proposal. -/
noncomputable def MeasureTheory.successiveMin {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] (L : Submodule ℤ E) (s : Set E) (i : ℕ) : ℝ≥0 :=
  sInf {r : ℝ≥0 | i < Set.finrank ℝ (r • s ∩ (L : Set E))}

/-! ## The proposal's lemmas on the foundational definition (1.1b)

Names and hypotheses are those of the proposal, so that adopting it is a deletion plus an import.
-/

section ProposalAuxiliary

/-- A set of vectors of a discrete `ℤ`-submodule has equal real and integral rank (1.1b). -/
theorem setFinrank_real_eq_setFinrank_int_of_subset_discreteTopology {E : Type*}
    [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E] (L : Submodule ℤ E)
    [DiscreteTopology L] {s : Set E} (hs : s ⊆ L) :
    Set.finrank ℝ s = Set.finrank ℤ s := by sorry

/-- The real rank of a discrete `ℤ`-submodule is its integral rank (1.1b). -/
@[simp] theorem setFinrank_real_eq_finrank_int {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] (L : Submodule ℤ E) [DiscreteTopology L] :
    Set.finrank ℝ (L : Set E) = finrank ℤ L := by sorry

/-- A positive gauge sublevel of a convex neighbourhood of zero is the closure of its dilate
(1.1b). -/
theorem setOf_gauge_le_eq_closure_smul_of_pos {E : Type*} [AddCommGroup E] [Module ℝ E]
    [TopologicalSpace E] [IsTopologicalAddGroup E] [ContinuousSMul ℝ E] {s : Set E} {a : ℝ}
    (hc : Convex ℝ s) (hs₀ : s ∈ 𝓝 0) (ha : 0 < a) :
    {x | gauge s x ≤ a} = closure (a • s) := by sorry

/-- A nonnegative gauge sublevel of a bounded convex neighbourhood of zero is the closure of its
dilate (1.1b). -/
theorem setOf_gauge_le_eq_closure_smul {E : Type*} [AddCommGroup E] [Module ℝ E]
    [TopologicalSpace E] [IsTopologicalAddGroup E] [ContinuousSMul ℝ E] [T1Space E]
    {s : Set E} {a : ℝ} (hc : Convex ℝ s) (hb : Bornology.IsVonNBounded ℝ s) (hs₀ : s ∈ 𝓝 0)
    (ha : 0 ≤ a) : {x | gauge s x ≤ a} = closure (a • s) := by sorry

/-- Dilates of a convex set containing zero increase with the factor (1.1b). -/
theorem Convex.smul_mono_of_zero_mem {𝕜 E : Type*} [Field 𝕜] [LinearOrder 𝕜]
    [IsStrictOrderedRing 𝕜] [AddCommGroup E] [Module 𝕜 E] {s : Set E} (h_conv : Convex 𝕜 s)
    (zero_mem : (0 : E) ∈ s) {p q : 𝕜} (hp : 0 ≤ p) (hpq : p ≤ q) : p • s ⊆ q • s := by sorry

end ProposalAuxiliary

namespace MeasureTheory

section ProposalLemmas
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {L : Submodule ℤ E} {s : Set E} {i j : ℕ}

/-- At and beyond the ambient dimension the foundational minimum is the junk value `0` (1.1b). -/
@[simp] theorem successiveMin_of_finrank_le (hi : finrank ℝ E ≤ i) :
    successiveMin L s i = 0 := by sorry

/-- At and beyond the real rank of `L` the foundational minimum is `0` (1.1b). -/
@[simp] theorem successiveMin_of_setFinrank_le (hi : Set.finrank ℝ (L : Set E) ≤ i) :
    successiveMin L s i = 0 := by sorry

/-- At and beyond the integral rank of a discrete `L` the foundational minimum is `0` (1.1b). -/
theorem successiveMin_of_finrank_int_le [DiscreteTopology L] (hi : finrank ℤ L ≤ i) :
    successiveMin L s i = 0 := by sorry

/-- Below the rank, the threshold set of an absorbent set is nonempty (1.1b). -/
theorem exists_lt_setFinrank_smul_inter [DiscreteTopology L] (hs : Absorbent ℝ s)
    (hi : i < finrank ℤ L) : ∃ r : ℝ≥0, i < Set.finrank ℝ (r • s ∩ L) := by sorry

/-- Below the dimension, the threshold set of an absorbent set for a lattice is nonempty
(1.1b). -/
theorem exists_lt_setFinrank_smul_inter_zLattice [DiscreteTopology L] [IsZLattice ℝ L]
    (hs : Absorbent ℝ s) (hi : i < finrank ℝ E) :
    ∃ r : ℝ≥0, i < Set.finrank ℝ (r • s ∩ L) := by sorry

/-- Below the rank, the foundational minima are monotone in the index (1.1b). -/
@[gcongr] theorem successiveMin_mono [DiscreteTopology L] (hs : Absorbent ℝ s) (hij : i ≤ j)
    (hj : j < finrank ℤ L) : successiveMin L s i ≤ successiveMin L s j := by sorry

/-- Above the `i`-th minimum, the dilate contains `i + 1` integrally independent lattice vectors
(1.1b). -/
theorem exists_linearIndependent_of_successiveMin_lt [DiscreteTopology L] {r : ℝ≥0}
    (hsc : Convex ℝ s) (hs₀ : s ∈ 𝓝 0) (hi : i < finrank ℤ L) (hr : successiveMin L s i < r) :
    ∃ v : Fin (i + 1) → L, (∀ j, (v j : E) ∈ r • s ∩ L) ∧ LinearIndependent ℤ v := by sorry

/-- For a compact convex neighbourhood of zero the threshold set is closed (1.1b). -/
theorem isClosed_setOf_lt_setFinrank_smul_inter [DiscreteTopology L] (hsc : Convex ℝ s)
    (hs : IsCompact s) (hs₀ : s ∈ 𝓝 0) (hi : i < finrank ℤ L) :
    IsClosed {r : ℝ≥0 | i < Set.finrank ℝ (r • s ∩ L)} := by sorry

/-- The `i`-th minimum is attained: its own dilate meets `L` in rank greater than `i` (1.1b). -/
theorem lt_setFinrank_successiveMin_smul [DiscreteTopology L] (hsc : Convex ℝ s)
    (hs : IsCompact s) (hs₀ : s ∈ 𝓝 0) (hi : i < finrank ℤ L) :
    i < Set.finrank ℝ (successiveMin L s i • s ∩ L) := by sorry

variable (L) in
/-- A real-independent family of lattice vectors, the `j`-th in the dilate by the `j`-th minimum
(1.1b). -/
theorem exists_directional_set' [DiscreteTopology L] (hsc : Convex ℝ s) (hs : IsCompact s)
    (hs₀ : s ∈ 𝓝 0) :
    ∃ v : Fin (finrank ℤ L) → E,
      (∀ j, (v j : E) ∈ successiveMin L s j.val • s ∩ L) ∧ LinearIndependent ℝ v := by sorry

variable (L) in
/-- The directional family as an integrally independent family in `L` (1.1b). -/
theorem exists_directional_set [DiscreteTopology L] (hsc : Convex ℝ s) (hs : IsCompact s)
    (hs₀ : s ∈ 𝓝 0) :
    ∃ v : Fin (finrank ℤ L) → L,
      (∀ j, (v j : E) ∈ successiveMin L s j.val • s) ∧ LinearIndependent ℤ v := by sorry

variable (L) in
/-- For a lattice, the directional family is a real basis of `E`; it need not be an integral
basis (1.1b). -/
theorem exists_directional_basis [DiscreteTopology L] [IsZLattice ℝ L] (hsc : Convex ℝ s)
    (hs : IsCompact s) (hs₀ : s ∈ 𝓝 0) :
    ∃ b : Basis (Fin (finrank ℝ E)) ℝ E, ∀ i, b i ∈ successiveMin L s i.val • s ∩ L := by sorry

end ProposalLemmas

end MeasureTheory

namespace TauCetiRoadmap.SuccessiveMinima

section MinimaConvention
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- The real-valued, zero-based `Fin` adapter of the foundational successive minima (1.1).
Its geometric laws need `L` discrete and full and `0 ∈ interior K`. -/
def successiveMin (L : Submodule ℤ E) (K : ConvexBody E) (i : Fin (finrank ℝ E)) : ℝ :=
  (MeasureTheory.successiveMin L (K : Set E) i.val : ℝ)

end MinimaConvention

/-! ## Headline theorems -/

section MinkowskiSecond
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- **Minkowski's second theorem, lower half** (2.1.4):
`(2^d/d!) covol L ≤ (∏ λ_i) μ(K)` for any additive Haar measure and a symmetric convex body
with `0` in its interior in a finite-dimensional real normed space, including dimension zero. -/
theorem minkowski_second_lower (L : Submodule ℤ E) [DiscreteTopology L]
    [IsZLattice ℝ L] (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) (μ : Measure E)
    [Measure.IsAddHaarMeasure μ] :
    ((2 : ℝ) ^ (finrank ℝ E) / (Nat.factorial (finrank ℝ E) : ℝ)) * ZLattice.covolume L μ ≤
      (∏ i : Fin (finrank ℝ E), successiveMin L K i) * μ.real (K : Set E) := by sorry

/-- **Minkowski's second theorem, upper half** (3.21, Henk's proof):
`(∏ λ_i) μ(K) ≤ 2^d covol L` for any additive Haar measure on a finite-dimensional real
normed space and a symmetric convex body with `0` in its interior, including dimension zero. -/
theorem minkowski_second_upper
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) (μ : Measure E)
    [Measure.IsAddHaarMeasure μ] :
    (∏ i : Fin (finrank ℝ E), successiveMin L K i) * μ.real (K : Set E) ≤
      2 ^ finrank ℝ E * ZLattice.covolume L μ := by sorry

end MinkowskiSecond

/-! ## Layer 0: Gram determinants and integral bases with a prescribed flag -/

section Gram
variable {𝕜 E : Type*} [RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] {n : ℕ}

/-- **Hadamard's inequality in orthonormal coordinates** (0.1.1); dependent families and `n = 0`
are allowed. -/
theorem orthonormal_coordinate_hadamard (b : OrthonormalBasis (Fin n) 𝕜 E) (v : Fin n → E) :
    ‖b.toBasis.det v‖ ≤ ∏ i, ‖v i‖ := by sorry

/-- **Gram–Hadamard** (0.1.2): the hermitian Gram determinant is real, nonnegative and bounded by
the product of the squared norms; the empty family is allowed. -/
theorem hermitian_gram_hadamard (v : Fin n → E) :
    (Matrix.gram 𝕜 v).det = (RCLike.re (Matrix.gram 𝕜 v).det : 𝕜) ∧
    0 ≤ RCLike.re (Matrix.gram 𝕜 v).det ∧
    RCLike.re (Matrix.gram 𝕜 v).det ≤ ∏ i, ‖v i‖ ^ 2 := by sorry

/-- A uniform bound on the squared norms bounds the Gram determinant (0.1.3). -/
theorem gram_uniform_bound (v : Fin n → E) (D : ℝ) (hD : 0 ≤ D) (hv : ∀ i, ‖v i‖ ^ 2 ≤ D) :
    RCLike.re (Matrix.gram 𝕜 v).det ≤ D ^ n := by sorry

end Gram

section SameFlag
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- Every real basis of lattice vectors has the same real prefix flags as an integral basis
of the lattice (0.2.1); the prescribed vectors need not generate the lattice over `ℤ`, and the
lattice is full as a consequence. -/
theorem exists_integral_basis_same_flag
    (L : Submodule ℤ E) [DiscreteTopology L]
    (w : Basis (Fin (finrank ℝ E)) ℝ E) (hw : ∀ i, w i ∈ L) :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L, ∀ k : Fin (finrank ℝ E + 1),
      w.flag k = Submodule.span ℝ {x : E | ∃ i, i.castSucc < k ∧ (b i : E) = x} := by sorry

end SameFlag

/-! ## Layer 1: Successive minima -/

section SuccessiveMinima
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- In finite dimension the rank-threshold adapter equals the positive-dilation infimum of
independent families, without geometric hypotheses on the lattice or body (1.1). -/
theorem successiveMin_def [FiniteDimensional ℝ E]
    (L : Submodule ℤ E) (K : ConvexBody E) (i : Fin (finrank ℝ E)) :
    successiveMin L K i = sInf {t : ℝ | 0 < t ∧ ∃ v : Fin (i.val + 1) → E,
      (∀ j, v j ∈ (t • (K : Set E)) ∩ (L : Set E)) ∧ LinearIndependent ℝ v} := by sorry

/-- The zero-based natural-index extension of the successive minima, with value zero at and
beyond the ambient dimension (1.1a). -/
def successiveMinNat (L : Submodule ℤ E) (K : ConvexBody E) (i : ℕ) : ℝ :=
  if hi : i < finrank ℝ E then successiveMin L K ⟨i, hi⟩ else 0

/-- Below the ambient dimension the natural-index extension agrees with the `Fin`-indexed
minimum (1.1a). -/
theorem successiveMinNat_of_lt (L : Submodule ℤ E) (K : ConvexBody E) (i : ℕ)
    (hi : i < finrank ℝ E) :
    successiveMinNat L K i = successiveMin L K ⟨i, hi⟩ := by
  simp [successiveMinNat, hi]

/-- At and beyond the ambient dimension the natural-index extension is zero (1.1a). -/
theorem successiveMinNat_of_le (L : Submodule ℤ E) (K : ConvexBody E) (i : ℕ)
    (hi : finrank ℝ E ≤ i) : successiveMinNat L K i = 0 := by
  simp [successiveMinNat, Nat.not_lt.mpr hi]

variable [FiniteDimensional ℝ E]

/-- The natural-index adapter equals the foundational minimum, including the zero values at
and beyond the ambient dimension (1.1a). -/
theorem successiveMinNat_eq (L : Submodule ℤ E) (K : ConvexBody E) (i : ℕ) :
    successiveMinNat L K i = (MeasureTheory.successiveMin L (K : Set E) i : ℝ) := by sorry

variable (L : Submodule ℤ E) [hLdis : DiscreteTopology L] [hLfull : IsZLattice ℝ L]
  (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))

include hLdis hLfull hK

/-- Every bounded gauge sublevel of a full discrete lattice is finite (1.2). -/
theorem finite_gauge_sublevel (r : ℝ) :
    Set.Finite {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r} := by sorry

/-- The successive minimum is the least gauge threshold at which the lattice vectors of gauge at
most the threshold span `i + 1` dimensions (1.3); no symmetry of `K` is needed. -/
theorem successiveMin_isLeast (i : Fin (finrank ℝ E)) :
    IsLeast {r : ℝ | 0 ≤ r ∧ i.val + 1 ≤
      finrank ℝ (Submodule.span ℝ {x : E | x ∈ L ∧ gauge (K : Set E) x ≤ r})}
      (successiveMin L K i) := by sorry

/-- Every successive minimum of a full lattice is positive (1.4). -/
theorem successiveMin_pos (i : Fin (finrank ℝ E)) : 0 < successiveMin L K i := by sorry

/-- Successive minima increase with the index, allowing repeated values (1.5). -/
theorem successiveMin_monotone : Monotone (successiveMin L K) := by sorry

/-- `λ_i ≤ r` exactly when the lattice vectors in `r K` span `i + 1` dimensions (1.6). -/
theorem successiveMin_le_iff (i : Fin (finrank ℝ E)) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K i ≤ r ↔ i.val + 1 ≤
      finrank ℝ (Submodule.span ℝ ((L : Set E) ∩ r • (K : Set E))) := by sorry

/-- One real basis of lattice vectors attains all successive minima, with the strict-sublevel
flags (1.7); it need not be an integral basis, and `K` need not be symmetric. The greedy
construction behind it extends independent families one vector at a time through Mathlib's
`linearIndependent_finSnoc`. -/
theorem exists_successiveMin_witnesses :
    ∃ b : Basis (Fin (finrank ℝ E)) ℝ E,
      (∀ i, b i ∈ L) ∧
      (∀ i, gauge (K : Set E) (b i) = successiveMin L K i) ∧
      (∀ i, b i ∈ successiveMin L K i • (K : Set E)) ∧
      ∀ i, ∀ x : L, gauge (K : Set E) x < successiveMin L K i → (x : E) ∈ b.flag i.castSucc := by
  sorry

/-- Enlarging the body decreases every successive minimum (1.8). -/
theorem successiveMin_antitone_body (K' : ConvexBody E)
    (hK' : (0 : E) ∈ interior (K' : Set E)) (hKK' : K ≤ K')
    (i : Fin (finrank ℝ E)) : successiveMin L K' i ≤ successiveMin L K i := by sorry

/-- Passing to a full superlattice decreases every successive minimum (1.9). -/
theorem successiveMin_monotone_lattice (M : Submodule ℤ E)
    [DiscreteTopology M] [IsZLattice ℝ M] (hLM : L ≤ M)
    (i : Fin (finrank ℝ E)) : successiveMin M K i ≤ successiveMin L K i := by sorry

/-- `λ_i(L, cK) = λ_i(L, K)/c` for `c > 0` (1.10). -/
theorem successiveMin_smul_body (c : ℝ) (hc : 0 < c) (i : Fin (finrank ℝ E)) :
    successiveMin L (c • K) i = successiveMin L K i / c := by sorry

/-- Transporting lattice and body by the same linear equivalence preserves the minima (1.11).
The image lattice is discrete and full, and `0` is interior to the image body, as consequences of
`hL'` and `heK`. -/
theorem successiveMin_linearEquiv
    {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    (e : E ≃ₗ[ℝ] F) (L' : Submodule ℤ F) (K' : ConvexBody F)
    (hL' : L' = L.map (e.toLinearMap.restrictScalars ℤ))
    (heK : (K' : Set F) = e '' (K : Set E))
    (i : Fin (finrank ℝ E)) (j : Fin (finrank ℝ F)) (hij : i.val = j.val) :
    successiveMin L' K' j = successiveMin L K i := by sorry

/-- `λ_0 ≤ r` exactly when `r K` contains a nonzero lattice vector (1.12). -/
theorem successiveMin_first_le_iff (hd : 0 < finrank ℝ E) (r : ℝ) (hr : 0 ≤ r) :
    successiveMin L K ⟨0, hd⟩ ≤ r ↔
      ∃ x : E, x ∈ L ∧ x ≠ 0 ∧ x ∈ r • (K : Set E) := by sorry

/-- An integral basis whose real flags contain the strict sublevels of the minima (1.13); no bound
on its vectors is claimed, and `K` need not be symmetric. -/
theorem exists_integral_minimum_flag :
    ∃ b : Basis (Fin (finrank ℝ E)) ℤ L, ∀ i, ∀ x : E, x ∈ L →
      gauge (K : Set E) x < successiveMin L K i →
        x ∈ Submodule.span ℝ {y : E | ∃ j, j < i ∧ (b j : E) = y} := by sorry

end SuccessiveMinima

section MinimaChecks

/-- For `L = ℤ ⊂ ℝ` and `K = [−2, 2]`, `λ_0 = 1/2` (Checks of 1.1). -/
theorem successiveMin_int_Icc (K : ConvexBody ℝ) (hK : (K : Set ℝ) = Set.Icc (-2) 2) :
    successiveMin (Submodule.span ℤ {(1 : ℝ)}) K ⟨0, by simp⟩ = 1 / 2 := by sorry

/-- For `ℤ²` and `K₂₃ = [−1/2, 1/2] × [−1/3, 1/3]`, `(λ_0, λ_1) = (2, 3)` (Checks of 1.1). -/
theorem successiveMin_box_two_three (K : ConvexBody (Fin 2 → ℝ))
    (hK : (K : Set (Fin 2 → ℝ)) = {x | 2 * |x 0| ≤ 1 ∧ 3 * |x 1| ≤ 1}) :
    successiveMin (Submodule.span ℤ (Set.range (Pi.basisFun ℝ (Fin 2)))) K ⟨0, by simp⟩ = 2 ∧
      successiveMin (Submodule.span ℤ (Set.range (Pi.basisFun ℝ (Fin 2)))) K ⟨1, by simp⟩ = 3 := by
  sorry

/-- For `ℤ²` and `K₂₃`, the natural-index values at `0, 1, 2` are `2, 3, 0`; index `2` is not a
third positive minimum (Checks of 1.1a). -/
theorem successiveMinNat_box_two_three (K : ConvexBody (Fin 2 → ℝ))
    (hK : (K : Set (Fin 2 → ℝ)) = {x | 2 * |x 0| ≤ 1 ∧ 3 * |x 1| ≤ 1}) :
    successiveMinNat (Submodule.span ℤ (Set.range (Pi.basisFun ℝ (Fin 2)))) K 0 = 2 ∧
      successiveMinNat (Submodule.span ℤ (Set.range (Pi.basisFun ℝ (Fin 2)))) K 1 = 3 ∧
      successiveMinNat (Submodule.span ℤ (Set.range (Pi.basisFun ℝ (Fin 2)))) K 2 = 0 := by
  obtain ⟨h0, h1⟩ := successiveMin_box_two_three K hK
  refine ⟨?_, ?_, successiveMinNat_of_le _ _ _ (by simp)⟩
  · rw [successiveMinNat_of_lt _ _ _ (by simp)]
    exact h0
  · rw [successiveMinNat_of_lt _ _ _ (by simp)]
    exact h1

/-- For the standard lattice in `ℝ⁶` and the box with weights `1, …, 6`, the natural index
`2 = 2 · 1` denotes the third minimum, `3` (Checks of 1.1a). -/
theorem successiveMinNat_box_six (K : ConvexBody (Fin 6 → ℝ))
    (hK : (K : Set (Fin 6 → ℝ)) = {x | ∀ j : Fin 6, ((j : ℕ) + 1 : ℝ) * |x j| ≤ 1}) :
    successiveMinNat (Submodule.span ℤ (Set.range (Pi.basisFun ℝ (Fin 6)))) K (2 * 1) = 3 := by
  sorry

/-- In `ℝ⁶` the natural index `6 = 2 · 3` is the dimension, where the value is zero for every
lattice and body (Checks of 1.1a). -/
example (L : Submodule ℤ (Fin 6 → ℝ)) (K : ConvexBody (Fin 6 → ℝ)) :
    successiveMinNat L K (2 * 3) = 0 :=
  successiveMinNat_of_le L K _ (by simp)

end MinimaChecks

/-! ## Layer 2: Minkowski's lower inequality and the linear forms theorem -/

section PrescribedMinima
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  (b : Basis (Fin (finrank ℝ E)) ℝ E) (K : ConvexBody E) (a : Fin (finrank ℝ E) → ℝ)
  (ha : ∀ i, 0 < a i) (ham : Monotone a)

include ha ham

/-- A weighted coordinate box has successive minima its increasing weights (2.1.5): the upper
bound of Minkowski's second theorem is attained. -/
theorem successiveMin_box
    (hK : (K : Set E) = {x : E | ∀ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

/-- A weighted cross-polytope has successive minima its increasing weights (2.1.6): the lower
bound of Minkowski's second theorem is attained. -/
theorem successiveMin_crosspolytope
    (hK : (K : Set E) = {x : E | ∑ j, a j * |b.repr x j| ≤ 1})
    (i : Fin (finrank ℝ E)) :
    successiveMin (Submodule.span ℤ (Set.range b)) K i = a i := by sorry

end PrescribedMinima

/-- **Minkowski's linear forms theorem** (2.2.2): if `|det A| ≤ ∏ a_i`, some nonzero integer vector
satisfies every closed inequality `|(Az)_i| ≤ a_i`. -/
theorem minkowski_linear_forms {n : ℕ} (hn : 0 < n)
    (A : Matrix (Fin n) (Fin n) ℝ) (hA : A.det ≠ 0)
    (a : Fin n → ℝ) (ha : ∀ i, 0 < a i) (hprod : |A.det| ≤ ∏ i, a i) :
    ∃ z : Fin n → ℤ, z ≠ 0 ∧ ∀ i, |∑ j, A i j * (z j : ℝ)| ≤ a i := by sorry

/-! ## Layer 3: Minkowski's upper inequality -/

section UpperInequality

/-- Interior-disjoint translates of a compact convex set have total measure the number of
translates times its measure (3.1). -/
theorem finite_interior_disjoint_translate_volume
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
    [MeasurableSpace E] [BorelSpace E] (μ : Measure E) [Measure.IsAddHaarMeasure μ]
    {ι : Type*} [Fintype ι] (K : Set E) (hKc : IsCompact K) (hKv : Convex ℝ K) (v : ι → E)
    (hv : Pairwise fun i j ↦ Disjoint (v i +ᵥ interior K) (v j +ᵥ interior K)) :
    μ (⋃ i, v i +ᵥ K) = Fintype.card ι * μ K := by sorry

/-- The gauge is invariant under transporting both the set and the point along a linear
equivalence (3.8). -/
theorem gauge_linearEquiv {E F : Type*} [AddCommGroup E] [Module ℝ E] [AddCommGroup F]
    [Module ℝ F] (e : E ≃ₗ[ℝ] F) (K : Set E) (x : E) :
    gauge (e '' K) (e x) = gauge K x := by sorry

/-- The telescoping product behind Henk's volume chain (3.17). -/
theorem weighted_ratio_product (n : ℕ) (a : Fin (n + 1) → ℝ) (ha : ∀ j, 0 < a j) :
    a 0 ^ (n + 1) * ∏ i : Fin n, (a i.succ / a i.castSucc) ^ (n - i.val) = ∏ j, a j := by
  sorry

/-- **Henk's coordinate form of the upper inequality** (3.20): increasing thresholds satisfying
the strict flag condition for `ℤ^d` bound the volume of a symmetric convex body. -/
theorem coordinate_flag_upper {d : ℕ} (K : ConvexBody (Fin d → ℝ))
    (hK : (0 : Fin d → ℝ) ∈ interior (K : Set (Fin d → ℝ))) (hsym : ∀ x ∈ K, -x ∈ K)
    (a : Fin d → ℝ) (ha : ∀ i, 0 < a i) (ham : Monotone a)
    (hflag : ∀ (i : Fin d) (z : Fin d → ℤ),
      gauge (K : Set (Fin d → ℝ)) (fun j ↦ (z j : ℝ)) < a i → ∀ j, i ≤ j → z j = 0) :
    (∏ i, a i) * volume.real (K : Set (Fin d → ℝ)) ≤ 2 ^ d := by sorry

/-- **Minkowski's first theorem on successive minima** (3.22):
`λ_0^d μ(K) ≤ 2^d covol L` in positive dimension. -/
theorem minkowski_first_successiveMin {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
    (K : ConvexBody E) (hK : (0 : E) ∈ interior (K : Set E))
    (hsym : ∀ x ∈ K, -x ∈ K) (μ : Measure E) [Measure.IsAddHaarMeasure μ]
    (hd : 0 < finrank ℝ E) :
    successiveMin L K ⟨0, hd⟩ ^ finrank ℝ E * μ.real (K : Set E) ≤
      2 ^ finrank ℝ E * ZLattice.covolume L μ := by sorry

end UpperInequality

end TauCetiRoadmap.SuccessiveMinima
