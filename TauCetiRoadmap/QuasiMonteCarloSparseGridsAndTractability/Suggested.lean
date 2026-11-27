module

public import Mathlib
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.Compact
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.MinMax
public import TauCeti.Analysis.PositiveDefinite.Kernel.MeanEmbedding

/-!
# Quasi-Monte Carlo, sparse grids and tractability: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). Point sets of Layers 1–2 are indexed families
`P : Fin n → Fin s → ℝ` with values in the closed cube `Set.Icc 0 1`, counted with multiplicity;
boxes are closed and anchored at `0`, as in Dick–Kuo–Sloan (3.16). The function spaces of
Layers 3 and 5 live on `Cube s = Fin s → unitInterval` with its product volume, a probability
measure; a reproducing kernel Hilbert space is any `H` with `[RKHS ℝ H (Cube s) ℝ]` and
`[CompleteSpace H]` whose kernel is the one stated, which determines `H` up to isometry
(`RKHS.equiv`). Discrepancies, variations, worst-case errors and sparse-grid errors are
`ℝ≥0∞`-valued; information complexities are `ℕ∞`-valued, so that the minimum over an empty set is
`⊤`. Level vectors of Layer 6 are one-based, as in Bungartz–Griebel.

No declaration is a local copy of another roadmap's definition. The upstream declarations
consumed are Mathlib's `RKHS`, `RKHS.kernel`, `RKHS.eval`, `RKHS.equiv`, `RKHS.OfKernel`,
`MeasureTheory.Measure.pi`, `eVariationOn`, `iteratedFDerivWithin`, `Nat.digits`, `Nat.nth`,
`Nat.totient`, `Int.fract`, and Tau Ceti's `ContinuousLinearMap.singularValue` (approximation
numbers, zero-based) with its min–max formula
`ContinuousLinearMap.singularValue_eq_iInf_nnnorm_comp_orthogonal`, and Tau Ceti's operator form
`TauCeti.positiveDefiniteKernelOperator` of a scalar kernel, with the Kolmogorov space and kernel
mean embeddings of `TauCeti.Analysis.PositiveDefinite.Kernel`. The `#check` block at the end lists
every upstream name the README cites.

Bold headlines of the README not stated here: the integration bounds for Halton, Hammersley and
`(t, s)`-sequence points (2.4), each the composition of a discrepancy bound with
`koksmaHlawka`; the component bounds of the hierarchical expansion (6.1), which need the
hierarchical series of a function; and the interpolation property of the sparse-grid
interpolant (6.2), a Check.

Prior formalization (README): the lean-NASC modules NASC/MonteCarlo.lean and
NASC/ModelReduction.lean state some of these targets with `sorry`.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.QuasiMonteCarloSparseGridsAndTractability

open MeasureTheory Set Filter Real TauCeti
open scoped ENNReal NNReal BigOperators

/-! ## Layer 1: discrepancy and the Koksma–Hlawka inequality -/

section Discrepancy

variable {s n : ℕ}

open Classical in
/-- The local discrepancy `Δ_P(x) = #{i | P i ∈ [0, x]} / n - x₁ ⋯ x_s` (1.1). -/
def localDiscrepancy (P : Fin n → Fin s → ℝ) (x : Fin s → ℝ) : ℝ :=
  ((Finset.univ.filter fun i ↦ P i ∈ Icc (0 : Fin s → ℝ) x).card : ℝ) / n - ∏ j, x j

/-- The star discrepancy `D*(P) = sup_{x ∈ [0,1]^s} |Δ_P(x)|`, in `ℝ≥0∞` (1.1). -/
def starDiscrepancy (P : Fin n → Fin s → ℝ) : ℝ≥0∞ :=
  ⨆ x ∈ Icc (0 : Fin s → ℝ) 1, ENNReal.ofReal |localDiscrepancy P x|

/-- The star discrepancy is at most `1` (1.1). -/
theorem starDiscrepancy_le_one (P : Fin n → Fin s → ℝ) : starDiscrepancy P ≤ 1 := by
  sorry

/-- The equal-weight rule `Q_n(f) = n⁻¹ ∑ f(tᵢ)`. -/
def qmcRule {X : Type*} (P : Fin n → X) (f : X → ℝ) : ℝ :=
  (∑ i, f (P i)) / n

open Classical in
/-- The point `(y_u; 1)`: coordinates in `u` from `y`, the others equal to `1` (1.2). -/
def facePoint (u : Finset (Fin s)) (y : u → ℝ) : Fin s → ℝ :=
  fun j ↦ if h : j ∈ u then y ⟨j, h⟩ else 1

/-- The mixed first derivative `∂^{|u|} f / ∂x_u` within the closed cube (1.2). -/
def faceDerivative (f : (Fin s → ℝ) → ℝ) (u : Finset (Fin s)) (x : Fin s → ℝ) : ℝ :=
  iteratedFDerivWithin ℝ u.card f (Icc 0 1) x (fun k ↦ Pi.single (u.orderEmbOfFin rfl k) 1)

/-- The variation `∑_{u ≠ ∅} ∫_{[0,1]^u} |∂^{|u|} f (y_u; 1)| dy_u` of a smooth function (1.2). -/
def smoothVariation (f : (Fin s → ℝ) → ℝ) : ℝ≥0∞ :=
  ∑ u ∈ (Finset.univ : Finset (Finset (Fin s))).erase ∅,
    ∫⁻ y in Icc (0 : u → ℝ) 1, ‖faceDerivative f u (facePoint u y)‖ₑ

/-- **Hlawka–Zaremba identity** (1.2). -/
theorem hlawkaZaremba (hn : 0 < n) (P : Fin n → Fin s → ℝ)
    (hP : ∀ i, P i ∈ Icc (0 : Fin s → ℝ) 1) (f : (Fin s → ℝ) → ℝ)
    (hf : ContDiffOn ℝ s f (Icc 0 1)) :
    qmcRule P f - ∫ x in Icc (0 : Fin s → ℝ) 1, f x =
      ∑ u ∈ (Finset.univ : Finset (Finset (Fin s))).erase ∅,
        (-1 : ℝ) ^ u.card * ∫ y in Icc (0 : u → ℝ) 1,
          faceDerivative f u (facePoint u y) * localDiscrepancy P (facePoint u y) := by
  sorry

/-- **Koksma–Hlawka inequality for smooth integrands** (1.2). -/
theorem koksmaHlawka_of_contDiffOn (hn : 0 < n) (P : Fin n → Fin s → ℝ)
    (hP : ∀ i, P i ∈ Icc (0 : Fin s → ℝ) 1) (f : (Fin s → ℝ) → ℝ)
    (hf : ContDiffOn ℝ s f (Icc 0 1)) :
    ENNReal.ofReal |qmcRule P f - ∫ x in Icc (0 : Fin s → ℝ) 1, f x| ≤
      starDiscrepancy P * smoothVariation f := by
  sorry

open Classical in
/-- The Vitali variation of `g` on `[0,1]^ι`: the supremum over grids of the sums of absolute
alternating vertex sums over the cells (1.3). -/
def vitaliVariation {ι : Type*} [Fintype ι] (g : (ι → ℝ) → ℝ) : ℝ≥0∞ :=
  ⨆ (m : ι → ℕ) (p : ∀ j, Fin (m j + 1) → ℝ)
    (_ : ∀ j, Monotone (p j) ∧ p j 0 = 0 ∧ p j (Fin.last (m j)) = 1),
    ∑ c : (∀ j, Fin (m j)),
      ‖∑ v : Finset ι, (-1 : ℝ) ^ (Fintype.card ι - v.card) *
        g (fun j ↦ if j ∈ v then p j (c j).succ else p j (c j).castSucc)‖ₑ

/-- The Hardy–Krause variation anchored at `1`: the Vitali variations of the restrictions of `f`
to the faces `{x | x_j = 1 for j ∉ u}`, `u ≠ ∅` (1.3). -/
def hardyKrauseVariation (f : (Fin s → ℝ) → ℝ) : ℝ≥0∞ :=
  ∑ u ∈ (Finset.univ : Finset (Finset (Fin s))).erase ∅,
    vitaliVariation (fun y : u → ℝ ↦ f (facePoint u y))

/-- In one variable the Hardy–Krause variation is `eVariationOn` on `[0,1]` (1.3). -/
theorem hardyKrauseVariation_fin_one (f : (Fin 1 → ℝ) → ℝ) :
    hardyKrauseVariation f = eVariationOn (fun t : ℝ ↦ f (fun _ ↦ t)) (Icc 0 1) := by
  sorry

/-- For smooth integrands the Hardy–Krause variation is the smooth variation (1.3). -/
theorem hardyKrauseVariation_eq_smoothVariation (f : (Fin s → ℝ) → ℝ)
    (hf : ContDiffOn ℝ s f (Icc 0 1)) :
    hardyKrauseVariation f = smoothVariation f := by
  sorry

/-- **Koksma–Hlawka inequality** (1.3). -/
theorem koksmaHlawka (hn : 0 < n) (P : Fin n → Fin s → ℝ)
    (hP : ∀ i, P i ∈ Icc (0 : Fin s → ℝ) 1) (f : (Fin s → ℝ) → ℝ) :
    ENNReal.ofReal |qmcRule P f - ∫ x in Icc (0 : Fin s → ℝ) 1, f x| ≤
      starDiscrepancy P * hardyKrauseVariation f := by
  sorry

end Discrepancy

/-! ## Layer 2: low-discrepancy point sets and sequences -/

section LowDiscrepancy

/-- The radical inverse `φ_b(i) = ∑ a_k b^{-k-1}` of `i = ∑ a_k b^k` (2.1). -/
def radicalInverse (b i : ℕ) : ℝ :=
  ∑ k : Fin (b.digits i).length, ((b.digits i).get k : ℝ) * ((b : ℝ)⁻¹) ^ (k.val + 1)

/-- The radical inverse lies in `[0, 1)` (2.1). -/
theorem radicalInverse_mem_Ico {b : ℕ} (hb : 2 ≤ b) (i : ℕ) : radicalInverse b i ∈ Ico 0 1 := by
  sorry

/-- The Halton sequence in `s` dimensions, in the bases of the first `s` primes (2.1). -/
def halton (s i : ℕ) : Fin s → ℝ :=
  fun j ↦ radicalInverse (Nat.nth Nat.Prime j) i

/-- The Hammersley point set with `n` points in `s` dimensions (2.1). -/
def hammersley (s n : ℕ) : Fin n → Fin s → ℝ :=
  fun i j ↦ if j.val = 0 then (i : ℝ) / n else radicalInverse (Nat.nth Nat.Prime (j.val - 1)) i

/-- A `(t, m, s)`-net in base `b` (2.2). -/
def IsNet (b t m s : ℕ) (P : Fin (b ^ m) → Fin s → ℝ) : Prop :=
  t ≤ m ∧ (∀ i j, P i j ∈ Ico (0 : ℝ) 1) ∧
    ∀ d : Fin s → ℕ, ∑ j, d j = m - t → ∀ a : Fin s → ℕ, (∀ j, a j < b ^ d j) →
      (Finset.univ.filter fun i ↦ ∀ j,
        P i j ∈ Ico ((a j : ℝ) / (b : ℝ) ^ d j) (((a j : ℝ) + 1) / (b : ℝ) ^ d j)).card = b ^ t

/-- A `(t, s)`-sequence in base `b` (2.2). -/
def IsTSSequence (b t s : ℕ) (x : ℕ → Fin s → ℝ) : Prop :=
  (∀ i j, x i j ∈ Ico (0 : ℝ) 1) ∧
    ∀ m, t < m → ∀ ℓ : ℕ, IsNet b t m s (fun i ↦ x (ℓ * b ^ m + i))

/-- The van der Corput sequence is a `(0, 1)`-sequence (2.2). -/
theorem isTSSequence_vanDerCorput {b : ℕ} (hb : 2 ≤ b) :
    IsTSSequence b 0 1 (fun i _ ↦ radicalInverse b i) := by
  sorry

/-- **Halton discrepancy bound** (2.3). -/
theorem starDiscrepancy_halton_le (s : ℕ) :
    ∃ C : ℝ, ∀ n : ℕ, 2 ≤ n →
      starDiscrepancy (fun i : Fin n ↦ halton s i) ≤ ENNReal.ofReal (C * Real.log n ^ s / n) := by
  sorry

/-- **Hammersley discrepancy bound** (2.3). -/
theorem starDiscrepancy_hammersley_le (s : ℕ) :
    ∃ C : ℝ, ∀ n : ℕ, 2 ≤ n →
      starDiscrepancy (hammersley s n) ≤ ENNReal.ofReal (C * Real.log n ^ (s - 1) / n) := by
  sorry

/-- **Discrepancy of nets** (2.3). -/
theorem starDiscrepancy_net_le {b : ℕ} (hb : 2 ≤ b) (t s : ℕ) :
    ∃ C : ℝ, ∀ m : ℕ, 1 ≤ m → ∀ P : Fin (b ^ m) → Fin s → ℝ, IsNet b t m s P →
      starDiscrepancy P ≤ ENNReal.ofReal (C * Real.log ((b : ℝ) ^ m) ^ (s - 1) / (b : ℝ) ^ m) := by
  sorry

/-- **Discrepancy of `(t, s)`-sequences** (2.3). -/
theorem starDiscrepancy_tsSequence_le {b : ℕ} (hb : 2 ≤ b) (t s : ℕ) :
    ∃ C : ℝ, ∀ x : ℕ → Fin s → ℝ, IsTSSequence b t s x → ∀ n : ℕ, 2 ≤ n →
      starDiscrepancy (fun i : Fin n ↦ x i) ≤ ENNReal.ofReal (C * Real.log n ^ s / n) := by
  sorry

end LowDiscrepancy

/-! ## Layer 3: weighted Sobolev spaces and randomly shifted lattice rules -/

section Lattice

/-- The unit cube `[0,1]^s` as a type, with the product volume. -/
abbrev Cube (s : ℕ) : Type := Fin s → unitInterval

/-- The one-dimensional anchored kernel part `η_c` of Dick–Kuo–Sloan (4.1) (3.1). -/
def anchoredEta (c x y : ℝ) : ℝ :=
  if c < x ∧ c < y then min x y - c else if x < c ∧ y < c then c - max x y else 0

/-- The anchored kernel `∏ⱼ (1 + γⱼ η_c(xⱼ, yⱼ))` with product weights (3.1). -/
def anchoredKernel (s : ℕ) (γ : ℕ → ℝ) (c : ℝ) (x y : Cube s) : ℝ :=
  ∏ j : Fin s, (1 + γ j * anchoredEta c (x j) (y j))

/-- The Bernoulli polynomial `B₂(x) = x² - x + 1/6`. -/
def bernoulliTwo (x : ℝ) : ℝ := x ^ 2 - x + 1 / 6

/-- The one-dimensional unanchored kernel part `η(x, y) = B₂(|x - y|)/2 + (x - 1/2)(y - 1/2)`
(3.1). -/
def unanchoredEta (x y : ℝ) : ℝ := bernoulliTwo |x - y| / 2 + (x - 1 / 2) * (y - 1 / 2)

/-- The unanchored kernel `∑_u γ_u ∏_{j ∈ u} η(xⱼ, yⱼ)` with general weights (3.1). -/
def unanchoredKernel (s : ℕ) (γ : Finset (Fin s) → ℝ) (x y : Cube s) : ℝ :=
  ∑ u : Finset (Fin s), γ u * ∏ j ∈ u, unanchoredEta (x j) (y j)

/-- Product weights `γ_u = ∏_{j ∈ u} γⱼ` (3.1). -/
def productWeights (γ : ℕ → ℝ) (s : ℕ) : Finset (Fin s) → ℝ :=
  fun u ↦ ∏ j ∈ u, γ j

/-- The anchored kernel is positive semidefinite, for every real anchor (3.1). -/
theorem posSemidef_anchoredKernel (s : ℕ) {γ : ℕ → ℝ} (hγ : ∀ j, 0 ≤ γ j) (c : ℝ) :
    Matrix.PosSemidef (anchoredKernel s γ c) := by
  sorry

/-- The unanchored kernel is positive semidefinite (3.1). -/
theorem posSemidef_unanchoredKernel (s : ℕ) {γ : Finset (Fin s) → ℝ} (hγ : ∀ u, 0 ≤ γ u) :
    Matrix.PosSemidef (unanchoredKernel s γ) := by
  sorry

/-- The point `c` of `Cube 1`. -/
def cubeOnePoint (c : ℝ) (hc : c ∈ Icc (0 : ℝ) 1) : Cube 1 := fun _ ↦ ⟨c, hc⟩

/-- **The anchored space in one variable** (3.1): absolutely continuous functions with
square-integrable derivative and `‖f‖² = f(c)² + γ⁻¹ ∫ f'²`. -/
theorem anchored_one_range_and_norm {γ : ℕ → ℝ} (hγ : 0 < γ 0) {c : ℝ}
    (hc : c ∈ Icc (0 : ℝ) 1) (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [CompleteSpace H] [RKHS ℝ H (Cube 1) ℝ]
    (hK : RKHS.kernel H = positiveDefiniteKernelOperator (anchoredKernel 1 γ c)) :
    (∀ h : Cube 1 → ℝ, h ∈ Set.range (fun f : H ↦ (f : Cube 1 → ℝ)) ↔
      ∃ g : ℝ → ℝ, MemLp g 2 (volume.restrict (Icc (0 : ℝ) 1)) ∧
        ∀ x : Cube 1, h x = h (cubeOnePoint c hc) + ∫ t in c..(x 0 : ℝ), g t) ∧
    ∀ (f : H) (g : ℝ → ℝ), MemLp g 2 (volume.restrict (Icc (0 : ℝ) 1)) →
      (∀ x : Cube 1, f x = f (cubeOnePoint c hc) + ∫ t in c..(x 0 : ℝ), g t) →
        ‖f‖ ^ 2 = f (cubeOnePoint c hc) ^ 2 + (γ 0)⁻¹ * ∫ t in Icc (0 : ℝ) 1, g t ^ 2 := by
  sorry

/-- **The unanchored space in one variable** (3.1): the same functions, with
`‖f‖² = (∫ f)² + γ⁻¹ ∫ f'²`. -/
theorem unanchored_one_range_and_norm {γ : ℕ → ℝ} (hγ : 0 < γ 0)
    (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [CompleteSpace H] [RKHS ℝ H (Cube 1) ℝ]
    (hK : RKHS.kernel H =
      positiveDefiniteKernelOperator (unanchoredKernel 1 (productWeights γ 1))) :
    (∀ h : Cube 1 → ℝ, h ∈ Set.range (fun f : H ↦ (f : Cube 1 → ℝ)) ↔
      ∃ g : ℝ → ℝ, MemLp g 2 (volume.restrict (Icc (0 : ℝ) 1)) ∧
        ∀ x : Cube 1, h x = h (cubeOnePoint 0 (by simp)) + ∫ t in (0 : ℝ)..(x 0 : ℝ), g t) ∧
    ∀ (f : H) (g : ℝ → ℝ), MemLp g 2 (volume.restrict (Icc (0 : ℝ) 1)) →
      (∀ x : Cube 1, f x = f (cubeOnePoint 0 (by simp)) + ∫ t in (0 : ℝ)..(x 0 : ℝ), g t) →
        ‖f‖ ^ 2 = (∫ x, f x) ^ 2 + (γ 0)⁻¹ * ∫ t in Icc (0 : ℝ) 1, g t ^ 2 := by
  sorry

variable {s n : ℕ}

/-- The worst-case error `sup_{‖f‖ ≤ 1} |I(f) - Q_n(f)|` of the rule on `P` in `H` (3.2). -/
def worstCaseError (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [RKHS ℝ H (Cube s) ℝ] (P : Fin n → Cube s) : ℝ≥0∞ :=
  ⨆ (f : H) (_ : ‖f‖ ≤ 1), ‖(∫ x, f x) - qmcRule P f‖ₑ

/-- The initial error `sup_{‖f‖ ≤ 1} |I(f)|` (3.2). -/
def initialIntegrationError (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [RKHS ℝ H (Cube s) ℝ] : ℝ≥0∞ :=
  ⨆ (f : H) (_ : ‖f‖ ≤ 1), ‖∫ x, f x‖ₑ

/-- **The squared worst-case error formula** (3.2). -/
theorem worstCaseError_sq_eq (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [CompleteSpace H] [RKHS ℝ H (Cube s) ℝ] (k : Cube s → Cube s → ℝ)
    (hk : Continuous fun p : Cube s × Cube s ↦ k p.1 p.2)
    (hK : RKHS.kernel H = positiveDefiniteKernelOperator k) (hn : 0 < n) (P : Fin n → Cube s) :
    worstCaseError H P ^ 2 = ENNReal.ofReal ((∫ x, ∫ y, k x y) -
        2 / n * ∑ i, (∫ y, k (P i) y) + 1 / (n : ℝ) ^ 2 * ∑ i, ∑ l, k (P i) (P l)) ∧
      initialIntegrationError H ^ 2 = ENNReal.ofReal (∫ x, ∫ y, k x y) := by
  sorry

/-- The shifted point set `{tᵢ + Δ}` (3.3). -/
def shiftPoints (P : Fin n → Cube s) (Δ : Cube s) : Fin n → Cube s :=
  fun i j ↦ ⟨Int.fract ((P i j : ℝ) + Δ j), Int.fract_nonneg _, (Int.fract_lt_one _).le⟩

/-- The shift-averaged worst-case error `(∫ e(P + Δ)² dΔ)^{1/2}` (3.3). -/
def shiftAveragedError (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [RKHS ℝ H (Cube s) ℝ] (P : Fin n → Cube s) : ℝ≥0∞ :=
  (∫⁻ Δ, worstCaseError H (shiftPoints P Δ) ^ 2) ^ (1 / 2 : ℝ)

/-- **Mean-square error of a randomly shifted rule** (3.3). -/
theorem lintegral_sq_error_shift_le (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [RKHS ℝ H (Cube s) ℝ] (P : Fin n → Cube s) (f : H) :
    ∫⁻ Δ, ‖(∫ x, f x) - qmcRule (shiftPoints P Δ) f‖ₑ ^ 2 ≤
      shiftAveragedError H P ^ 2 * ‖f‖ₑ ^ 2 := by
  sorry

/-- The rank-one lattice point set `{k z / n}` (3.3). -/
def latticePoints (n : ℕ) (z : Fin s → ℕ) : Fin n → Cube s :=
  fun k j ↦ ⟨Int.fract ((k : ℝ) * z j / n), Int.fract_nonneg _, (Int.fract_lt_one _).le⟩

/-- The lattice criterion `∑_{u ≠ ∅} γ_u n⁻¹ ∑_k ∏_{j ∈ u} B₂({k zⱼ / n})` (3.3). -/
def latticeCriterion (n : ℕ) (γ : Finset (Fin s) → ℝ) (z : Fin s → ℕ) : ℝ :=
  ∑ u ∈ (Finset.univ : Finset (Finset (Fin s))).erase ∅,
    γ u * ((∑ k ∈ Finset.range n, ∏ j ∈ u, bernoulliTwo (Int.fract ((k : ℝ) * z j / n))) / n)

/-- **Shift-averaged error of a lattice rule in the unanchored space** (3.3). -/
theorem shiftAveragedError_latticePoints_sq (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] [CompleteSpace H] [RKHS ℝ H (Cube s) ℝ]
    (γ : Finset (Fin s) → ℝ)
    (hK : RKHS.kernel H = positiveDefiniteKernelOperator (unanchoredKernel s γ))
    (hn : 0 < n) (z : Fin s → ℕ) :
    shiftAveragedError H (latticePoints n z) ^ 2 = ENNReal.ofReal (latticeCriterion n γ z) := by
  sorry

open Classical in
/-- The weights restricted to the first `r` coordinates (3.4). -/
def truncateWeights (γ : Finset (Fin s) → ℝ) (r : ℕ) : Finset (Fin s) → ℝ :=
  fun u ↦ if ∀ j ∈ u, j.val < r then γ u else 0

/-- `z` is a generating vector of the component-by-component construction: `z₁ = 1`, every
component in `Uₙ`, and each subsequent component minimizes the criterion in its dimension over `Uₙ`,
the earlier ones being fixed; every minimizer is allowed at a tie (3.4). -/
def IsCBC (n : ℕ) (γ : Finset (Fin s) → ℝ) (z : Fin s → ℕ) : Prop :=
  (∀ j, 1 ≤ z j ∧ z j < n ∧ (z j).Coprime n) ∧ (∀ j : Fin s, j.val = 0 → z j = 1) ∧
    ∀ j : Fin s, 0 < j.val → ∀ w : ℕ, 1 ≤ w → w < n → w.Coprime n →
      latticeCriterion n (truncateWeights γ (j.val + 1)) z ≤
        latticeCriterion n (truncateWeights γ (j.val + 1)) (Function.update z j w)

/-- The constant `2 ζ(2λ) / (2π²)^λ` (3.4). -/
def cbcConstant (lam : ℝ) : ℝ :=
  2 * (∑' k : ℕ, ((k : ℝ) + 1) ^ (-2 * lam)) / (2 * π ^ 2) ^ lam

/-- **The CBC error bound** (3.4). -/
theorem latticeCriterion_le_of_isCBC {γ : Finset (Fin s) → ℝ}
    (hγ : ∀ u, 0 ≤ γ u) {z : Fin s → ℕ} (hz : IsCBC n γ z) {lam : ℝ}
    (hlam : lam ∈ Ioc (1 / 2 : ℝ) 1) :
    latticeCriterion n γ z ≤
      ((∑ u ∈ (Finset.univ : Finset (Finset (Fin s))).erase ∅,
        γ u ^ lam * cbcConstant lam ^ u.card) / n.totient) ^ (1 / lam) := by
  sorry

/-- **The CBC bound for product weights and prime `n`** (3.4). -/
theorem sqrt_latticeCriterion_le_of_prime {γ : ℕ → ℝ} (hγ : ∀ j, 0 ≤ γ j)
    (hn : n.Prime) {z : Fin s → ℕ} (hz : IsCBC n (productWeights γ s) z) {lam : ℝ}
    (hlam : lam ∈ Ioc (1 / 2 : ℝ) 1) :
    √(latticeCriterion n (productWeights γ s) z) ≤
      ((n : ℝ) - 1) ^ (-1 / (2 * lam)) *
        Real.exp (cbcConstant lam / (2 * lam) * ∑ j : Fin s, γ j ^ lam) := by
  sorry

/-- **Dimension-independent rate of CBC lattice rules** (3.4). -/
theorem exists_sqrt_latticeCriterion_le_rate {γ : ℕ → ℝ} (hγ : ∀ j, 0 ≤ γ j) {δ : ℝ}
    (hδ : δ ∈ Ioc (0 : ℝ) (1 / 2))
    (hsum : Summable fun j ↦ γ j ^ (1 / (2 - 2 * δ))) :
    ∃ C : ℝ, ∀ s n : ℕ, n.Prime → ∀ z : Fin s → ℕ, IsCBC n (productWeights γ s) z →
      √(latticeCriterion n (productWeights γ s) z) ≤ C * (n : ℝ) ^ (-1 + δ) := by
  sorry

end Lattice

/-! ## Layer 4: worst-case complexity and tractability -/

section Complexity

variable {E G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup G] [NormedSpace ℝ G]

/-- The worst-case error `sup_{f ∈ F} ‖S f - φ(L₁ f, …, Lₙ f)‖` of the algorithm `φ ∘ N` (4.1). -/
def algorithmError {n : ℕ} (S : E → G) (F : Set E) (L : Fin n → StrongDual ℝ E)
    (φ : (Fin n → ℝ) → G) : ℝ≥0∞ :=
  ⨆ f ∈ F, ‖S f - φ (fun i ↦ L i f)‖ₑ

/-- The minimal worst-case error of algorithms using `n` functionals from `Λ` (4.1). -/
def minimalError (S : E → G) (F : Set E) (Λ : Set (StrongDual ℝ E)) (n : ℕ) : ℝ≥0∞ :=
  ⨅ (L : Fin n → StrongDual ℝ E) (_ : ∀ i, L i ∈ Λ) (φ : (Fin n → ℝ) → G),
    algorithmError S F L φ

/-- The initial error `sup_{f ∈ F} ‖S f‖` (4.1). -/
def initialError (S : E → G) (F : Set E) : ℝ≥0∞ :=
  ⨆ f ∈ F, ‖S f‖ₑ

/-- The information complexity: the least `n` for which some algorithm using `n` functionals
from `Λ` has error at most `ε`, and `⊤` when there is none (4.1). The normalized criterion is
`informationComplexity S F Λ (ε * initialError S F)`. -/
def informationComplexity (S : E → G) (F : Set E) (Λ : Set (StrongDual ℝ E)) (ε : ℝ≥0∞) : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ∃ L : Fin n → StrongDual ℝ E, (∀ i, L i ∈ Λ) ∧
    ∃ φ : (Fin n → ℝ) → G, algorithmError S F L φ ≤ ε), (n : ℕ∞)

/-- Polynomial tractability of `n(d, ε)` (4.2). -/
def IsPolynomiallyTractable (N : ℕ → ℝ → ℕ∞) : Prop :=
  ∃ C p q : ℝ, 0 ≤ C ∧ 0 ≤ p ∧ 0 ≤ q ∧ ∀ d : ℕ, 1 ≤ d → ∀ ε ∈ Ioo (0 : ℝ) 1,
    (N d ε : ℝ≥0∞) ≤ ENNReal.ofReal (C * (d : ℝ) ^ q * ε ^ (-p))

/-- Strong polynomial tractability of `n(d, ε)` (4.2). -/
def IsStronglyPolynomiallyTractable (N : ℕ → ℝ → ℕ∞) : Prop :=
  ∃ C p : ℝ, 0 ≤ C ∧ 0 ≤ p ∧ ∀ d : ℕ, 1 ≤ d → ∀ ε ∈ Ioo (0 : ℝ) 1,
    (N d ε : ℝ≥0∞) ≤ ENNReal.ofReal (C * ε ^ (-p))

/-- Weak tractability: `log n(d, ε) / (ε⁻¹ + d) → 0`, stated as `n ≤ exp (η (ε⁻¹ + d))`
eventually for every `η > 0` (4.2). -/
def IsWeaklyTractable (N : ℕ → ℝ → ℕ∞) : Prop :=
  ∀ η > 0, ∃ M : ℝ, ∀ d : ℕ, 1 ≤ d → ∀ ε ∈ Ioo (0 : ℝ) 1, M ≤ ε⁻¹ + d →
    (N d ε : ℝ≥0∞) ≤ ENNReal.ofReal (Real.exp (η * (ε⁻¹ + d)))

section Hilbert

variable {H K : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [NormedAddCommGroup K] [InnerProductSpace ℝ K] [CompleteSpace K]

/-- **Minimal error on the unit ball equals the approximation number** (4.1). -/
theorem minimalError_closedBall_eq_singularValue (S : H →L[ℝ] G) (n : ℕ) :
    minimalError S (Metric.closedBall 0 1) Set.univ n = S.singularValue n := by
  sorry

/-- **The truncated singular expansion is optimal** (4.1). -/
theorem exists_linear_algorithmError_eq_singularValue (S : H →L[ℝ] K)
    (hS : IsCompactOperator S) (n : ℕ) :
    ∃ (L : Fin n → StrongDual ℝ H) (Φ : (Fin n → ℝ) →L[ℝ] K),
      algorithmError S (Metric.closedBall 0 1) L Φ = S.singularValue n := by
  sorry

/-- **Information complexity of a compact operator** (4.1). -/
theorem informationComplexity_closedBall_eq (S : H →L[ℝ] K) (hS : IsCompactOperator S)
    (ε : ℝ≥0∞) :
    informationComplexity S (Metric.closedBall 0 1) Set.univ ε =
      ⨅ (n : ℕ) (_ : (S.singularValue n : ℝ≥0∞) ≤ ε), (n : ℕ∞) := by
  sorry

end Hilbert

section Families

variable (E' G' : ℕ → Type*) [∀ d, NormedAddCommGroup (E' d)] [∀ d, InnerProductSpace ℝ (E' d)]
  [∀ d, CompleteSpace (E' d)] [∀ d, NormedAddCommGroup (G' d)] [∀ d, InnerProductSpace ℝ (G' d)]
  [∀ d, CompleteSpace (G' d)]

/-- The absolute-error information complexity `n(d, ε)` of a family of operators on unit balls
with all continuous linear functionals (4.3). -/
def linearComplexity (S : ∀ d, E' d →L[ℝ] G' d) (d : ℕ) (ε : ℝ) : ℕ∞ :=
  informationComplexity (S d) (Metric.closedBall 0 1) Set.univ (ENNReal.ofReal ε)

/-- The constant `C₂ = sup_d (∑_{j ≥ ⌈C₁ d^{q₁}⌉} λ_{d,j}^τ)^{1/τ} d^{-q₂}`, with the one-based
eigenvalues `λ_{d,j} = a_{j-1}(S_d)²` (4.3). -/
def tailConstant (S : ∀ d, E' d →L[ℝ] G' d) (C₁ q₁ q₂ τ : ℝ) : ℝ≥0∞ :=
  ⨆ (d : ℕ) (_ : 1 ≤ d),
    (∑' j : ℕ, if ⌈C₁ * (d : ℝ) ^ q₁⌉₊ ≤ j + 1 then
        ((S d).singularValue j : ℝ≥0∞) ^ (2 * τ) else 0) ^ (1 / τ) * (d : ℝ≥0∞) ^ (-q₂)

/-- **Polynomial tractability criterion** (4.3). -/
theorem isPolynomiallyTractable_iff_tailConstant (S : ∀ d, E' d →L[ℝ] G' d) :
    IsPolynomiallyTractable (linearComplexity E' G' S) ↔
      ∃ C₁ q₁ q₂ τ : ℝ, 0 < C₁ ∧ 0 ≤ q₁ ∧ 0 ≤ q₂ ∧ 0 < τ ∧
        tailConstant E' G' S C₁ q₁ q₂ τ ≠ ⊤ := by
  sorry

/-- **The tractability bound** (4.3). -/
theorem linearComplexity_le_of_tailConstant (S : ∀ d, E' d →L[ℝ] G' d) {C₁ q₁ q₂ τ : ℝ}
    (hC₁ : 0 < C₁) (hq₁ : 0 ≤ q₁) (hq₂ : 0 ≤ q₂) (hτ : 0 < τ)
    (hC₂ : tailConstant E' G' S C₁ q₁ q₂ τ ≠ ⊤) (d : ℕ) (hd : 1 ≤ d) {ε : ℝ}
    (hε : ε ∈ Ioc (0 : ℝ) 1) :
    (linearComplexity E' G' S d ε : ℝ≥0∞) ≤
      (ENNReal.ofReal C₁ + tailConstant E' G' S C₁ q₁ q₂ τ ^ τ) *
        (d : ℝ≥0∞) ^ max q₁ (q₂ * τ) * ENNReal.ofReal (ε ^ (-2 * τ)) := by
  sorry

/-- **Strong polynomial tractability criterion** (4.3). -/
theorem isStronglyPolynomiallyTractable_iff_tailConstant (S : ∀ d, E' d →L[ℝ] G' d) :
    IsStronglyPolynomiallyTractable (linearComplexity E' G' S) ↔
      ∃ C₁ τ : ℝ, 0 < C₁ ∧ 0 < τ ∧ tailConstant E' G' S C₁ 0 0 τ ≠ ⊤ := by
  sorry

end Families

/-- The absolute-error information complexity of the `d`-fold tensor power with one-dimensional
eigenvalues `λ`: the number of multi-indices with `∏ λ_{jₖ} > ε²` (4.4). -/
def tensorComplexity (lam : ℕ → ℝ) (d : ℕ) (ε : ℝ) : ℕ∞ :=
  {j : Fin d → ℕ | ε ^ 2 < ∏ k, lam (j k)}.encard

/-- **Curse of dimensionality for `λ₁ = λ₂ = 1`** (4.4). -/
theorem two_pow_le_tensorComplexity {lam : ℕ → ℝ} (h₀ : lam 0 = 1) (h₁ : lam 1 = 1) :
    (∀ d : ℕ, ∀ ε ∈ Ioo (0 : ℝ) 1, (2 ^ d : ℕ∞) ≤ tensorComplexity lam d ε) ∧
      ¬ IsWeaklyTractable (tensorComplexity lam) := by
  sorry

/-- **Tensor products with `λ₁ < 1`** (4.4). -/
theorem tensorComplexity_tractable_iff {lam : ℕ → ℝ} (hanti : Antitone lam)
    (hnonneg : ∀ j, 0 ≤ lam j) (h₁ : 0 < lam 1) (h₀ : lam 0 < 1) :
    (IsPolynomiallyTractable (tensorComplexity lam) ↔
        IsStronglyPolynomiallyTractable (tensorComplexity lam)) ∧
      (IsStronglyPolynomiallyTractable (tensorComplexity lam) ↔
        ∃ r > (0 : ℝ), ∃ C : ℝ, ∀ j : ℕ, lam j ≤ C * ((j : ℝ) + 1) ^ (-r)) := by
  sorry

end Complexity

/-! ## Layer 5: tractability of integration in weighted spaces -/

section Integration

/-- The integration functional `f ↦ ∫_{[0,1]^s} f` on a space of functions on the cube (5.1). -/
def cubeIntegral {s : ℕ} (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [RKHS ℝ H (Cube s) ℝ] : H → ℝ :=
  fun f ↦ ∫ x, f x

/-- Standard information: the point evaluations (5.1). -/
def standardInformation {s : ℕ} (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [RKHS ℝ H (Cube s) ℝ] : Set (StrongDual ℝ H) :=
  Set.range (RKHS.eval H)

variable (H : ℕ → Type*) [∀ s, NormedAddCommGroup (H s)] [∀ s, InnerProductSpace ℝ (H s)]
  [∀ s, CompleteSpace (H s)] [∀ s, RKHS ℝ (H s) (Cube s) ℝ]

/-- The information complexity `n(s, ε)` of integration with function values, absolute
criterion (5.1). -/
def integrationComplexity (s : ℕ) (ε : ℝ) : ℕ∞ :=
  informationComplexity (cubeIntegral (H s)) (Metric.closedBall 0 1) (standardInformation (H s))
    (ENNReal.ofReal ε)

/-- **Strong polynomial tractability, anchored space** (5.2). -/
theorem isStronglyPolynomiallyTractable_anchored_iff {γ : ℕ → ℝ} (hγ : ∀ j, 0 < γ j) {c : ℝ}
    (hc : c ∈ Icc (0 : ℝ) 1)
    (hK : ∀ s, RKHS.kernel (H s) = positiveDefiniteKernelOperator (anchoredKernel s γ c)) :
    IsStronglyPolynomiallyTractable (integrationComplexity H) ↔ Summable γ := by
  sorry

/-- **Polynomial tractability, anchored space** (5.2). -/
theorem isPolynomiallyTractable_anchored_iff {γ : ℕ → ℝ} (hγ : ∀ j, 0 < γ j) {c : ℝ}
    (hc : c ∈ Icc (0 : ℝ) 1)
    (hK : ∀ s, RKHS.kernel (H s) = positiveDefiniteKernelOperator (anchoredKernel s γ c)) :
    IsPolynomiallyTractable (integrationComplexity H) ↔
      ∃ C : ℝ, ∀ s : ℕ, 1 ≤ s → ∑ j ∈ Finset.range s, γ j ≤ C * Real.log (s + 1) := by
  sorry

/-- **Strong polynomial tractability, unanchored space** (5.2). -/
theorem isStronglyPolynomiallyTractable_unanchored_iff {γ : ℕ → ℝ} (hγ : ∀ j, 0 < γ j)
    (hK : ∀ s, RKHS.kernel (H s) =
      positiveDefiniteKernelOperator (unanchoredKernel s (productWeights γ s))) :
    IsStronglyPolynomiallyTractable (integrationComplexity H) ↔ Summable γ := by
  sorry

/-- **Polynomial tractability, unanchored space** (5.2). -/
theorem isPolynomiallyTractable_unanchored_iff {γ : ℕ → ℝ} (hγ : ∀ j, 0 < γ j)
    (hK : ∀ s, RKHS.kernel (H s) =
      positiveDefiniteKernelOperator (unanchoredKernel s (productWeights γ s))) :
    IsPolynomiallyTractable (integrationComplexity H) ↔
      ∃ C : ℝ, ∀ s : ℕ, 1 ≤ s → ∑ j ∈ Finset.range s, γ j ≤ C * Real.log (s + 1) := by
  sorry

end Integration

/-! ## Layer 6: sparse grids -/

section SparseGrids

variable {d : ℕ}

/-- The hat function `φ(t) = max(1 - |t|, 0)` (6.1). -/
def hat (t : ℝ) : ℝ := max (1 - |t|) 0

/-- The hat function `φ_{l,i}(x) = ∏ⱼ φ(2^{lⱼ} xⱼ - iⱼ)` (6.1). -/
def hatFunction (l i : Fin d → ℕ) (x : Fin d → ℝ) : ℝ :=
  ∏ j, hat ((2 : ℝ) ^ l j * x j - i j)

/-- The index set `I_l` of odd `i` with `1 ≤ iⱼ ≤ 2^{lⱼ} - 1` (6.1). -/
def hierarchicalIndices (l : Fin d → ℕ) : Finset (Fin d → ℕ) :=
  Fintype.piFinset fun j ↦ (Finset.range (2 ^ l j)).filter Odd

/-- The hierarchical increment `W_l` (6.1). -/
def incrementSpace (l : Fin d → ℕ) : Submodule ℝ ((Fin d → ℝ) → ℝ) :=
  Submodule.span ℝ (hatFunction l '' (hierarchicalIndices l : Set (Fin d → ℕ)))

/-- The stencil weights `(-1/2, 1, -1/2)` (6.1). -/
def stencilWeight : Fin 3 → ℝ := ![-1 / 2, 1, -1 / 2]

/-- The hierarchical surplus `v_{l,i}`: the tensor product of the stencils `[-1/2, 1, -1/2]`
at `x_{l,i}` with mesh `2^{-l}` (6.1). -/
def surplus (u : (Fin d → ℝ) → ℝ) (l i : Fin d → ℕ) : ℝ :=
  ∑ σ : Fin d → Fin 3, (∏ j, stencilWeight (σ j)) *
    u (fun j ↦ ((i j : ℝ) + (σ j : ℝ) - 1) / (2 : ℝ) ^ l j)

/-- The mixed derivative `D^{(2,…,2)} u` within the closed cube (6.1). -/
def mixedSecondDerivative (u : (Fin d → ℝ) → ℝ) (x : Fin d → ℝ) : ℝ :=
  iteratedFDerivWithin ℝ (2 * d) u (Icc 0 1) x (fun k ↦ Pi.single ⟨k.val / 2, by omega⟩ 1)

/-- The seminorm `|u|_{2,∞}` (6.1). -/
def mixedSupSeminorm (u : (Fin d → ℝ) → ℝ) : ℝ≥0∞ :=
  ⨆ x ∈ Icc (0 : Fin d → ℝ) 1, ‖mixedSecondDerivative u x‖ₑ

/-- The seminorm `|u|_{2,2}` (6.1). -/
def mixedL2Seminorm (u : (Fin d → ℝ) → ℝ) : ℝ≥0∞ :=
  (∫⁻ x in Icc (0 : Fin d → ℝ) 1, ‖mixedSecondDerivative u x‖ₑ ^ 2) ^ (1 / 2 : ℝ)

/-- `u` vanishes on the boundary of the cube. -/
def VanishesOnBoundary (u : (Fin d → ℝ) → ℝ) : Prop :=
  ∀ x ∈ Icc (0 : Fin d → ℝ) 1, (∃ j, x j = 0 ∨ x j = 1) → u x = 0

/-- **Dimension of a hierarchical increment** (6.1). -/
theorem finrank_incrementSpace (l : Fin d → ℕ) (hl : ∀ j, 1 ≤ l j) :
    Module.finrank ℝ (incrementSpace l) = 2 ^ (∑ j, l j - d) := by
  sorry

/-- **Hierarchical surplus bound** (6.1). No boundary condition is needed: the surplus is a local
functional of `u`, and `i ∈ I_l` forces every `lⱼ ≥ 1`. -/
theorem enorm_surplus_le (u : (Fin d → ℝ) → ℝ)
    (hu : ContDiffOn ℝ (2 * d) u (Icc 0 1)) (l i : Fin d → ℕ) (hi : i ∈ hierarchicalIndices l) :
    ‖surplus u l i‖ₑ ≤
      ENNReal.ofReal ((2 : ℝ) ^ (-(d : ℤ)) * (2 : ℝ) ^ (-2 * ∑ j, (l j : ℤ))) *
        mixedSupSeminorm u := by
  sorry

/-- The sparse-grid levels `{l ≥ 1 | |l|₁ ≤ n + d - 1}` (6.2). -/
def sparseLevels (d n : ℕ) : Finset (Fin d → ℕ) :=
  (Fintype.piFinset fun _ : Fin d ↦ Finset.Icc 1 (n + d - 1)).filter fun l ↦ ∑ j, l j ≤ n + d - 1

/-- The full-grid levels `{l | 1 ≤ lⱼ ≤ n}` (6.2). -/
def fullLevels (d n : ℕ) : Finset (Fin d → ℕ) :=
  Fintype.piFinset fun _ : Fin d ↦ Finset.Icc 1 n

/-- The sparse-grid space `V_n^{(1)}` (6.2). -/
def sparseGridSpace (d n : ℕ) : Submodule ℝ ((Fin d → ℝ) → ℝ) :=
  ⨆ l ∈ sparseLevels d n, incrementSpace l

/-- The full-grid space `V_n^{(∞)}` (6.2). -/
def fullGridSpace (d n : ℕ) : Submodule ℝ ((Fin d → ℝ) → ℝ) :=
  ⨆ l ∈ fullLevels d n, incrementSpace l

/-- The sparse-grid interpolant `u_n^{(1)} = ∑_{|l|₁ ≤ n+d-1} ∑_{i ∈ I_l} v_{l,i} φ_{l,i}` (6.2). -/
def sparseGridInterpolant (d n : ℕ) (u : (Fin d → ℝ) → ℝ) : (Fin d → ℝ) → ℝ :=
  fun x ↦ ∑ l ∈ sparseLevels d n, ∑ i ∈ hierarchicalIndices l, surplus u l i * hatFunction l i x

/-- The constant `A(d, n) = ∑_{k < d} C(n + d - 1, k)` (6.2). -/
def sparseGridConstant (d n : ℕ) : ℝ :=
  ∑ k ∈ Finset.range d, ((n + d - 1).choose k : ℝ)

/-- **Dimension of the sparse-grid space** (6.2). -/
theorem finrank_sparseGridSpace (hd : 1 ≤ d) (n : ℕ) :
    Module.finrank ℝ (sparseGridSpace d n) =
        ∑ i ∈ Finset.range n, 2 ^ i * (d - 1 + i).choose (d - 1) ∧
      (Module.finrank ℝ (sparseGridSpace d n) : ℤ) =
        (-1) ^ d + 2 ^ n * ∑ i ∈ Finset.range d,
          ((n + d - 1).choose i : ℤ) * (-2) ^ (d - 1 - i) := by
  sorry

/-- **Asymptotic dimension of the sparse-grid space** (6.2). -/
theorem isBigO_finrank_sparseGridSpace (hd : 1 ≤ d) :
    (fun n : ℕ ↦ (Module.finrank ℝ (sparseGridSpace d n) : ℝ) / 2 ^ n -
        (n : ℝ) ^ (d - 1) / (d - 1).factorial) =O[atTop]
      fun n : ℕ ↦ (n : ℝ) ^ ((d : ℝ) - 2) := by
  sorry

/-- **Dimension of the full-grid space** (6.2). -/
theorem finrank_fullGridSpace (d n : ℕ) :
    Module.finrank ℝ (fullGridSpace d n) = (2 ^ n - 1) ^ d := by
  sorry

/-- **Sparse-grid interpolation error in `L^∞` and `L²`** (6.3). -/
theorem sparseGrid_sup_l2_error_le (n : ℕ) (u : (Fin d → ℝ) → ℝ)
    (hu : ContDiffOn ℝ (2 * d) u (Icc 0 1)) (hb : VanishesOnBoundary u) :
    (⨆ x ∈ Icc (0 : Fin d → ℝ) 1, ‖u x - sparseGridInterpolant d n u x‖ₑ) ≤
        ENNReal.ofReal (2 / 8 ^ d * (2 : ℝ) ^ (-2 * (n : ℤ)) * sparseGridConstant d n) *
          mixedSupSeminorm u ∧
      (∫⁻ x in Icc (0 : Fin d → ℝ) 1, ‖u x - sparseGridInterpolant d n u x‖ₑ ^ 2) ^ (1 / 2 : ℝ) ≤
        ENNReal.ofReal (2 / 12 ^ d * (2 : ℝ) ^ (-2 * (n : ℤ)) * sparseGridConstant d n) *
          mixedL2Seminorm u := by
  sorry

/-- **Sparse-grid interpolation error in the energy norm** (6.3). -/
theorem sparseGrid_energy_error_le (n : ℕ) (u : (Fin d → ℝ) → ℝ)
    (hu : ContDiffOn ℝ (2 * d) u (Icc 0 1)) (hb : VanishesOnBoundary u) :
    (∀ᵐ x ∂(volume.restrict (Icc (0 : Fin d → ℝ) 1)),
        DifferentiableAt ℝ (fun y ↦ u y - sparseGridInterpolant d n u y) x) ∧
      (∫⁻ x in Icc (0 : Fin d → ℝ) 1, ∑ j : Fin d,
          ‖fderiv ℝ (fun y ↦ u y - sparseGridInterpolant d n u y) x (Pi.single j 1)‖ₑ ^ 2) ^
          (1 / 2 : ℝ) ≤
        ENNReal.ofReal (d / (2 * (3 : ℝ) ^ (((d : ℝ) - 1) / 2) * 4 ^ (d - 1)) *
          (2 : ℝ) ^ (-(n : ℤ))) * mixedSupSeminorm u := by
  sorry

end SparseGrids

/-! ## Upstream declarations named in the README -/

#check @RKHS
#check @RKHS.kernel
#check @RKHS.eval
#check @RKHS.equiv
#check @RKHS.OfKernel
#check @RKHS.OfKernel.kernel_ofKernel
#check @TauCeti.positiveDefiniteKernelOperator
#check @TauCeti.posSemidef_positiveDefiniteKernelOperator
#check @Matrix.PosSemidef.KolmogorovSpace
#check @Matrix.PosSemidef.kernelMeanEmbedding
#check @Matrix.PosSemidef.norm_kernelMeanEmbedding_sub_sq
#check @Matrix.PosSemidef.integrable_kolmogorovFeature
#check @ContinuousLinearMap.singularValue
#check @ContinuousLinearMap.singularValue_eq_iInf_nnnorm_comp_orthogonal
#check @ContinuousLinearMap.isCompactOperator_iff_tendsto_singularValue
#check @IsCompactOperator
#check @MeasureTheory.Measure.pi
#check @unitInterval
#check @eVariationOn
#check @iteratedFDerivWithin
#check @Nat.digits
#check @Nat.nth
#check @Nat.nth_prime_zero_eq_two
#check @Nat.totient
#check @Int.fract
#check @Polynomial.bernoulli
#check @Set.encard
#check @Fintype.piFinset
#check @Module.finrank
#check @Asymptotics.IsBigO

end TauCetiRoadmap.QuasiMonteCarloSparseGridsAndTractability
