import Mathlib

/-!
# Linear systems and control: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's Checks and proof routes are not restated.

A linear time-invariant system has state matrix `A : Matrix n n K`, input matrix
`B : Matrix n m K` and output matrix `C : Matrix p n K`, for finite index types `n`, `m`, `p`,
any of which may be empty. The algebraic statements (Layers 1 to 3) hold over an arbitrary field
`K`; the statements about the continuous-time system, the Lyapunov and Stein equations and
stability (Layers 4 and 5) are over `ℝ`, with eigenvalues taken in `ℂ` and transposes in place of
adjoints. The matrix exponential is Mathlib's `NormedSpace.exp`, and the closed loop under the
state feedback `u = F x` is `A + B * F`.
-/

noncomputable section

open Matrix Polynomial Filter Topology

namespace TauCetiRoadmap.LinearSystemsAndControl

variable {K : Type*} [Field K] {n m p : Type*} [Fintype n] [DecidableEq n] [Fintype m]
  [Fintype p]

/-! ## Layer 1: controllability over a field -/

/-- 1.1 The reachable subspace of the pair `(A, B)`: the span of the columns of `A ^ k * B` for
all `k : ℕ`, that is, the smallest `A`-invariant subspace containing the columns of `B`. -/
def reachableSubspace (A : Matrix n n K) (B : Matrix n m K) : Submodule K (n → K) :=
  ⨆ k : ℕ, LinearMap.range (A ^ k * B).mulVecLin

/-- 1.1 The pair `(A, B)` is controllable when its reachable subspace is the whole state
space. -/
def IsControllable (A : Matrix n n K) (B : Matrix n m K) : Prop :=
  reachableSubspace A B = ⊤

/-- 1.1 The controllability matrix `[B, A B, …, A ^ (N - 1) B]`, `N = Fintype.card n`, with
columns indexed by pairs `(k, j)`: its column `(k, j)` is column `j` of `A ^ k * B`. -/
def ctrbMatrix (A : Matrix n n K) (B : Matrix n m K) :
    Matrix n (Fin (Fintype.card n) × m) K :=
  Matrix.of fun i kj => (A ^ (kj.1 : ℕ) * B) i kj.2

/-- 1.2 The Kalman rank condition: `(A, B)` is controllable if and only if its controllability
matrix has rank `Fintype.card n`; by Cayley–Hamilton the powers `A ^ k` with
`k ≥ Fintype.card n` add nothing to the reachable subspace. -/
theorem isControllable_iff_rank_ctrbMatrix (A : Matrix n n K) (B : Matrix n m K) :
    IsControllable A B ↔ (ctrbMatrix A B).rank = Fintype.card n := by
  sorry

/-- 1.3 The state of the discrete-time system `x (k + 1) = A x k + B u k` with initial state
`x₀` and input sequence `u`. -/
def discreteState (A : Matrix n n K) (B : Matrix n m K) (x₀ : n → K) (u : ℕ → m → K) :
    ℕ → n → K
  | 0 => x₀
  | k + 1 => A *ᵥ discreteState A B x₀ u k + B *ᵥ u k

/-- 1.3 The states reachable from the origin in exactly `k` steps form the span of the columns
of `A ^ j * B` for `j < k`. -/
theorem setOf_discreteState_zero (A : Matrix n n K) (B : Matrix n m K) (k : ℕ) :
    {x | ∃ u : ℕ → m → K, discreteState A B 0 u k = x} =
      ((⨆ j : Fin k, LinearMap.range (A ^ (j : ℕ) * B).mulVecLin : Submodule K (n → K)) :
        Set (n → K)) := by
  sorry

/-- 1.3 `(A, B)` is controllable if and only if the discrete-time system can be steered from
every state to every state in `Fintype.card n` steps. -/
theorem isControllable_iff_forall_exists_discreteState (A : Matrix n n K) (B : Matrix n m K) :
    IsControllable A B ↔
      ∀ x₀ x₁ : n → K, ∃ u : ℕ → m → K, discreteState A B x₀ u (Fintype.card n) = x₁ := by
  sorry

/-- 1.4 State feedback does not change the reachable subspace:
`reachableSubspace (A + B * F) B = reachableSubspace A B` for every `F`. -/
theorem reachableSubspace_add_mul (A : Matrix n n K) (B : Matrix n m K) (F : Matrix m n K) :
    reachableSubspace (A + B * F) B = reachableSubspace A B := by
  sorry

/-- 1.4 Controllability is invariant under a change of state coordinates `P`, an invertible
change of input coordinates `G` and state feedback `F`. -/
theorem isControllable_units_conj_iff [DecidableEq m] (A : Matrix n n K) (B : Matrix n m K)
    (P : (Matrix n n K)ˣ) (G : (Matrix m m K)ˣ) (F : Matrix m n K) :
    IsControllable ((P : Matrix n n K) * (A + B * F) * ((P⁻¹ : (Matrix n n K)ˣ) : Matrix n n K))
        ((P : Matrix n n K) * B * (G : Matrix m m K)) ↔
      IsControllable A B := by
  sorry

/-- 1.5 The Hautus test: for an algebraically closed field `L` containing `K`, the pair
`(A, B)` is controllable if and only if `[μ I - A, B]` has rank `Fintype.card n` for every
`μ : L`. -/
theorem isControllable_iff_forall_rank_fromCols {L : Type*} [Field L] [IsAlgClosed L]
    [Algebra K L] (A : Matrix n n K) (B : Matrix n m K) :
    IsControllable A B ↔
      ∀ μ : L, (fromCols (μ • (1 : Matrix n n L) - A.map (algebraMap K L))
        (B.map (algebraMap K L))).rank = Fintype.card n := by
  sorry

/-- 1.6 The Kalman controllability decomposition: in suitable coordinates `P` and an ordering
`e` of the state indices, `P⁻¹ A P` is block upper triangular and `P⁻¹ B` vanishes below the
first block, whose size `r` is the dimension of the reachable subspace, and the first diagonal
block is controllable with the first block of `P⁻¹ B`. -/
theorem exists_kalmanDecomposition (A : Matrix n n K) (B : Matrix n m K) :
    ∃ (r s : ℕ) (e : Fin r ⊕ Fin s ≃ n) (P : (Matrix n n K)ˣ)
      (A₁₁ : Matrix (Fin r) (Fin r) K) (A₁₂ : Matrix (Fin r) (Fin s) K)
      (A₂₂ : Matrix (Fin s) (Fin s) K) (B₁ : Matrix (Fin r) m K),
      r = Module.finrank K (reachableSubspace A B) ∧
      reindex e.symm e.symm (((P⁻¹ : (Matrix n n K)ˣ) : Matrix n n K) * A * (P : Matrix n n K)) =
        fromBlocks A₁₁ A₁₂ 0 A₂₂ ∧
      reindex e.symm (Equiv.refl m) (((P⁻¹ : (Matrix n n K)ˣ) : Matrix n n K) * B) =
        fromRows B₁ 0 ∧
      IsControllable A₁₁ B₁ := by
  sorry

/-! ## Layer 2: observability and duality -/

/-- 2.1 The unobservable subspace of `(A, C)`: the states `x` with `C * A ^ k * x = 0` for all
`k : ℕ`. -/
def unobservableSubspace (A : Matrix n n K) (C : Matrix p n K) : Submodule K (n → K) :=
  ⨅ k : ℕ, LinearMap.ker (C * A ^ k).mulVecLin

/-- 2.1 The pair `(A, C)` is observable when its unobservable subspace is zero. -/
def IsObservable (A : Matrix n n K) (C : Matrix p n K) : Prop :=
  unobservableSubspace A C = ⊥

/-- 2.2 Duality: `(A, C)` is observable if and only if `(Aᵀ, Cᵀ)` is controllable. -/
theorem isObservable_iff_isControllable_transpose (A : Matrix n n K) (C : Matrix p n K) :
    IsObservable A C ↔ IsControllable Aᵀ Cᵀ := by
  sorry

/-- 2.2 `(A, C)` is observable if and only if the first `Fintype.card n` outputs
`C * A ^ k * x` of the free discrete-time system determine the initial state `x`. -/
theorem isObservable_iff_injective (A : Matrix n n K) (C : Matrix p n K) :
    IsObservable A C ↔
      Function.Injective fun x : n → K => fun k : Fin (Fintype.card n) => (C * A ^ (k : ℕ)) *ᵥ x := by
  sorry

/-! ## Layer 3: feedback and the characteristic polynomial -/

/-- 3.1 Ackermann's formula, without inverses. Let `q` satisfy `q ⬝ᵥ A ^ j b = 0` for
`j + 1 < N` and `q ⬝ᵥ A ^ (N - 1) b = 1`, where `N = Fintype.card n`. Then for every monic `χ` of
degree `N` the feedback row `f = -(q ᵥ* χ(A))` gives `charpoly (A + b fᵀ) = χ`. -/
theorem charpoly_add_vecMulVec_ackermann (A : Matrix n n K) (b q : n → K)
    (hq : ∀ j : ℕ, j < Fintype.card n →
      q ⬝ᵥ ((A ^ j) *ᵥ b) = if j + 1 = Fintype.card n then 1 else 0)
    (χ : K[X]) (hχ : χ.Monic) (hdeg : χ.natDegree = Fintype.card n) :
    (A + vecMulVec b (-(q ᵥ* aeval A χ))).charpoly = χ := by
  sorry

/-- 3.2 Single-input pole placement: if `(A, b)` is controllable, every monic polynomial of
degree `Fintype.card n` is the characteristic polynomial of `A + b fᵀ` for exactly one row
`f`. -/
theorem existsUnique_charpoly_add_vecMulVec (A : Matrix n n K) (b : n → K)
    (hc : IsControllable A (replicateCol Unit b)) (χ : K[X]) (hχ : χ.Monic)
    (hdeg : χ.natDegree = Fintype.card n) :
    ∃! f : n → K, (A + vecMulVec b f).charpoly = χ := by
  sorry

/-- 3.3 The pole-shifting theorem: `(A, B)` is controllable if and only if every monic
polynomial of degree `Fintype.card n` is the characteristic polynomial of `A + B * F` for some
`F`. -/
theorem isControllable_iff_forall_exists_charpoly (A : Matrix n n K) (B : Matrix n m K) :
    IsControllable A B ↔
      ∀ χ : K[X], χ.Monic → χ.natDegree = Fintype.card n →
        ∃ F : Matrix m n K, (A + B * F).charpoly = χ := by
  sorry

/-! ## Layer 4: the continuous-time system -/

/-- 4.1 The controllability Gramian `W(t) = ∫₀ᵗ exp (s A) B Bᵀ exp (s Aᵀ) ds`, integrated
entrywise. -/
def ctrbGramian (A : Matrix n n ℝ) (B : Matrix n m ℝ) (t : ℝ) : Matrix n n ℝ :=
  Matrix.of fun i j =>
    ∫ s in (0 : ℝ)..t, (NormedSpace.exp (s • A) * B * Bᵀ * NormedSpace.exp (s • Aᵀ)) i j

/-- 4.1 For `t > 0`, the controllability Gramian `W(t)` is positive definite if and only if
`(A, B)` is controllable. -/
theorem posDef_ctrbGramian_iff (A : Matrix n n ℝ) (B : Matrix n m ℝ) {t : ℝ} (ht : 0 < t) :
    (ctrbGramian A B t).PosDef ↔ IsControllable A B := by
  sorry

/-- 4.2 For `T > 0`, `(A, B)` is controllable if and only if every state `x₀` can be steered to
every state `x₁` at time `T` along a solution of `x' = A x + B u` with a continuous input `u`. -/
theorem isControllable_iff_forall_exists_steer (A : Matrix n n ℝ) (B : Matrix n m ℝ) {T : ℝ}
    (hT : 0 < T) :
    IsControllable A B ↔
      ∀ x₀ x₁ : n → ℝ, ∃ u : ℝ → m → ℝ, Continuous u ∧ ∃ x : ℝ → n → ℝ,
        x 0 = x₀ ∧ (∀ s, HasDerivAt x (A *ᵥ x s + B *ᵥ u s) s) ∧ x T = x₁ := by
  sorry

/-! ## Layer 5: stability, the Lyapunov and Stein equations, stabilizability -/

/-- 5.1 `A` is Hurwitz when every complex eigenvalue of `A` has negative real part. -/
def IsHurwitz (A : Matrix n n ℝ) : Prop :=
  ∀ μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), μ.re < 0

/-- 5.1 `A` is Schur stable when every complex eigenvalue of `A` has modulus less than one. -/
def IsSchurStable (A : Matrix n n ℝ) : Prop :=
  ∀ μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), ‖μ‖ < 1

/-- 5.1 `A` is Hurwitz if and only if `exp (t A) → 0` as `t → ∞`. -/
theorem isHurwitz_iff_tendsto_exp (A : Matrix n n ℝ) :
    IsHurwitz A ↔ Tendsto (fun t : ℝ => NormedSpace.exp (t • A)) atTop (𝓝 0) := by
  sorry

/-- 5.2 Lyapunov's theorem: `A` is Hurwitz if and only if for every positive definite `Q` the
Lyapunov equation `Aᵀ P + P A = -Q` has a positive definite solution `P`. -/
theorem isHurwitz_iff_forall_posDef_exists_posDef (A : Matrix n n ℝ) :
    IsHurwitz A ↔
      ∀ Q : Matrix n n ℝ, Q.PosDef → ∃ P : Matrix n n ℝ, P.PosDef ∧ Aᵀ * P + P * A = -Q := by
  sorry

/-- 5.2 `A` is Hurwitz if and only if some positive definite `P` makes `-(Aᵀ P + P A)` positive
definite. -/
theorem isHurwitz_iff_exists_posDef (A : Matrix n n ℝ) :
    IsHurwitz A ↔ ∃ P : Matrix n n ℝ, P.PosDef ∧ (-(Aᵀ * P + P * A)).PosDef := by
  sorry

/-- 5.2 For Hurwitz `A` and any `Q`, the Lyapunov equation `Aᵀ P + P A = -Q` has exactly one
solution, `P = ∫₀^∞ exp (t Aᵀ) Q exp (t A) dt`, integrated entrywise. -/
theorem lyapunov_eq_iff (A : Matrix n n ℝ) (hA : IsHurwitz A) (P Q : Matrix n n ℝ) :
    Aᵀ * P + P * A = -Q ↔
      P = Matrix.of fun i j =>
        ∫ t in Set.Ioi (0 : ℝ), (NormedSpace.exp (t • Aᵀ) * Q * NormedSpace.exp (t • A)) i j := by
  sorry

/-- 5.3 If `(A, C)` is observable, `A` is Hurwitz if and only if the Lyapunov equation
`Aᵀ P + P A = -(Cᵀ C)` has a positive definite solution. -/
theorem isHurwitz_iff_exists_posDef_of_isObservable (A : Matrix n n ℝ) (C : Matrix p n ℝ)
    (hC : IsObservable A C) :
    IsHurwitz A ↔ ∃ P : Matrix n n ℝ, P.PosDef ∧ Aᵀ * P + P * A = -(Cᵀ * C) := by
  sorry

/-- 5.4 `A` is Schur stable if and only if for every positive definite `Q` the Stein equation
`Aᵀ P A - P = -Q` has a positive definite solution `P`. -/
theorem isSchurStable_iff_forall_posDef_exists_posDef (A : Matrix n n ℝ) :
    IsSchurStable A ↔
      ∀ Q : Matrix n n ℝ, Q.PosDef → ∃ P : Matrix n n ℝ, P.PosDef ∧ Aᵀ * P * A - P = -Q := by
  sorry

/-- 5.4 For Schur stable `A` and any `Q`, the Stein equation `Aᵀ P A - P = -Q` has exactly one
solution, `P = ∑ₖ (Aᵀ) ^ k Q A ^ k`. -/
theorem stein_eq_iff (A : Matrix n n ℝ) (hA : IsSchurStable A) (P Q : Matrix n n ℝ) :
    Aᵀ * P * A - P = -Q ↔ P = ∑' k : ℕ, Aᵀ ^ k * Q * A ^ k := by
  sorry

/-- 5.5 Stabilizability: some state feedback `F` makes `A + B * F` Hurwitz if and only if
`[μ I - A, B]` has rank `Fintype.card n` for every complex `μ` with `0 ≤ re μ`. -/
theorem exists_isHurwitz_add_mul_iff (A : Matrix n n ℝ) (B : Matrix n m ℝ) :
    (∃ F : Matrix m n ℝ, IsHurwitz (A + B * F)) ↔
      ∀ μ : ℂ, 0 ≤ μ.re →
        (fromCols (μ • (1 : Matrix n n ℂ) - A.map (algebraMap ℝ ℂ))
          (B.map (algebraMap ℝ ℂ))).rank = Fintype.card n := by
  sorry

end TauCetiRoadmap.LinearSystemsAndControl
