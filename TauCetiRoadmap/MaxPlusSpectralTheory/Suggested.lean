import Mathlib

/-!
# Max-plus spectral theory: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need, each with a real body. Every headline theorem of the README is statable at
the pins and is stated here.

A max-plus matrix is a square matrix with entries in `WithBot ℝ` on a finite index type,
`⊥` playing the role of `ε = −∞`. Mathlib's `MaxTropical (WithBot ℝ)` carries no semiring
structure at the pin, so the max-plus product, its powers and its action on vectors are defined
directly: `(A ⊗ B) i j = max_k (A i k + B k j)`. A walk `i₀ → i₁ → ⋯ → i_k` has weight
`A i₀ i₁ + ⋯ + A i_{k-1} i_k`; a closed walk of length `k + 1` is a map `Fin (k + 1) → n`, read
cyclically. Eigenvalues are real numbers, and an eigenvector has at least one finite entry.
Irreducibility is Mathlib's `Matrix.IsIrreducible` of the real `0/1` pattern matrix. The period
of an index of a real matrix is copied verbatim from PeriodicNonnegativeMatrices 1.1; the routes of
Layer 4 rest on that roadmap's `period_eq_period_of_isIrreducible`, `exists_cyclicClasses`,
`isPrimitive_iff_period_eq_one` and `pow_period_block`, applied to pattern matrices.
-/

noncomputable section

open Matrix Finset

namespace TauCetiRoadmap.MaxPlusSpectralTheory

variable {n : Type*} [Fintype n] [DecidableEq n]

/-! ## Layer 1: Max-plus matrices, walks and cycle means -/

/-- 1.1 The max-plus product: `(mpMul A B) i j = max_k (A i k + B k j)`, the maximum of the
empty family being `⊥`. -/
def mpMul (A B : Matrix n n (WithBot ℝ)) : Matrix n n (WithBot ℝ) :=
  Matrix.of fun i j => univ.sup fun k => A i k + B k j

/-- 1.1 The max-plus identity matrix: `0` on the diagonal and `⊥` elsewhere. -/
def mpOne : Matrix n n (WithBot ℝ) :=
  Matrix.of fun i j => if i = j then 0 else ⊥

/-- 1.1 Max-plus powers: `mpPow A 0 = mpOne` and `mpPow A (k + 1) = mpMul (mpPow A k) A`. -/
def mpPow (A : Matrix n n (WithBot ℝ)) : ℕ → Matrix n n (WithBot ℝ)
  | 0 => mpOne
  | k + 1 => mpMul (mpPow A k) A

/-- 1.1 The max-plus action on vectors: `(mpMulVec A x) i = max_j (A i j + x j)`. -/
def mpMulVec (A : Matrix n n (WithBot ℝ)) (x : n → WithBot ℝ) : n → WithBot ℝ :=
  fun i => univ.sup fun j => A i j + x j

/-- 1.2 The weight of the walk `w 0 → w 1 → ⋯ → w k` of length `k`. -/
def walkWeight (A : Matrix n n (WithBot ℝ)) {k : ℕ} (w : Fin (k + 1) → n) : WithBot ℝ :=
  ∑ t : Fin k, A (w t.castSucc) (w t.succ)

/-- 1.2 The entry `(i, j)` of the `k`-th max-plus power is the largest weight of a walk of length
`k` from `i` to `j` (and `⊥` when there is no such walk of finite weight). -/
theorem mpPow_apply (A : Matrix n n (WithBot ℝ)) (k : ℕ) (i j : n) :
    mpPow A k i j =
      (univ.filter fun w : Fin (k + 1) → n => w 0 = i ∧ w (Fin.last k) = j).sup
        (walkWeight A) := by
  sorry

/-- 1.3 The weight of the closed walk `c 0 → c 1 → ⋯ → c k → c 0` of length `k + 1`. -/
def cycleWeight (A : Matrix n n (WithBot ℝ)) {k : ℕ} (c : Fin (k + 1) → n) : WithBot ℝ :=
  ∑ t : Fin (k + 1), A (c t) (c (t + 1))

/-- 1.3 The cycle means of `A`: the real numbers `m` such that some closed walk of length `k + 1`
has weight `(k + 1) * m`. -/
def cycleMeans (A : Matrix n n (WithBot ℝ)) : Set ℝ :=
  {m | ∃ (k : ℕ) (c : Fin (k + 1) → n), cycleWeight A c = (((k + 1 : ℝ) * m : ℝ) : WithBot ℝ)}

/-- 1.4 The real `0/1` pattern matrix of `A`: `1` where `A` is finite and `0` where it is `⊥`. -/
def pattern (A : Matrix n n (WithBot ℝ)) : Matrix n n ℝ :=
  Matrix.of fun i j => if A i j = ⊥ then 0 else 1

/-- 1.5 The max-plus Kleene plus `A⁺ = A ⊕ A² ⊕ ⋯ ⊕ A^N`, `N` the number of indices. -/
def kleenePlus (A : Matrix n n (WithBot ℝ)) : Matrix n n (WithBot ℝ) :=
  Matrix.of fun i j => (Icc 1 (Fintype.card n)).sup fun k => mpPow A k i j

/-! ## Layer 2: The eigenvalue -/

/-- 2.1 `x` is a max-plus eigenvector of `A` for the real eigenvalue `μ`: some entry of `x` is
finite and `mpMulVec A x = μ + x` entrywise. -/
def IsEigenpair (A : Matrix n n (WithBot ℝ)) (μ : ℝ) (x : n → WithBot ℝ) : Prop :=
  (∃ i, x i ≠ ⊥) ∧ mpMulVec A x = fun i => (μ : WithBot ℝ) + x i

/-- 2.2 Every real eigenvalue of a max-plus matrix is a cycle mean. -/
theorem mem_cycleMeans_of_isEigenpair {A : Matrix n n (WithBot ℝ)} {μ : ℝ}
    {x : n → WithBot ℝ} (h : IsEigenpair A μ x) : μ ∈ cycleMeans A := by
  sorry

/-- 2.2 If `A` has a closed walk of finite weight, the cycle means have a greatest element, and
it is the greatest eigenvalue of `A`. -/
theorem exists_isGreatest_cycleMeans_eigenvalues {A : Matrix n n (WithBot ℝ)}
    (h : (cycleMeans A).Nonempty) :
    ∃ μ, IsGreatest (cycleMeans A) μ ∧ IsGreatest {ν | ∃ x, IsEigenpair A ν x} μ := by
  sorry

/-- 2.3 An irreducible max-plus matrix on a nonempty index type has exactly one eigenvalue, the
maximum cycle mean, and every eigenvector has all entries finite. -/
theorem eigenvalue_eq_maxCycleMean [Nonempty n] {A : Matrix n n (WithBot ℝ)}
    (hA : (pattern A).IsIrreducible) :
    ∃ μ, IsGreatest (cycleMeans A) μ ∧ {ν | ∃ x, IsEigenpair A ν x} = {μ} ∧
      ∀ ν x, IsEigenpair A ν x → ∀ i, x i ≠ ⊥ := by
  sorry

/-! ## Layer 3: The critical graph and the eigenspace -/

/-- 3.1 A critical closed walk: its weight is finite and its mean is at least the mean of every
closed walk, the means being compared through `(k + 1) • w' ≤ (k' + 1) • w`. -/
def IsCriticalCycle (A : Matrix n n (WithBot ℝ)) {k : ℕ} (c : Fin (k + 1) → n) : Prop :=
  cycleWeight A c ≠ ⊥ ∧
    ∀ (k' : ℕ) (c' : Fin (k' + 1) → n), (k + 1) • cycleWeight A c' ≤ (k' + 1) • cycleWeight A c

/-- 3.1 A critical arc: an arc `i → j` traversed by some critical closed walk. -/
def IsCriticalArc (A : Matrix n n (WithBot ℝ)) (i j : n) : Prop :=
  ∃ (k : ℕ) (c : Fin (k + 1) → n), IsCriticalCycle A c ∧ ∃ t, c t = i ∧ c (t + 1) = j

/-- 3.1 A critical node: the tail of a critical arc. -/
def IsCriticalNode (A : Matrix n n (WithBot ℝ)) (i : n) : Prop :=
  ∃ j, IsCriticalArc A i j

open Classical in
/-- 3.1 The spectral projector `Q j l = max_{i critical} (A⁺ j i + A⁺ i l)`. -/
def spectralProjector (A : Matrix n n (WithBot ℝ)) : Matrix n n (WithBot ℝ) :=
  Matrix.of fun j l =>
    (univ.filter (IsCriticalNode A)).sup fun i => kleenePlus A j i + kleenePlus A i l

/-- 3.2 Every closed walk of the critical graph is critical. -/
theorem isCriticalCycle_of_isCriticalArc {A : Matrix n n (WithBot ℝ)} {k : ℕ}
    (c : Fin (k + 1) → n) (hc : ∀ t, IsCriticalArc A (c t) (c (t + 1))) :
    IsCriticalCycle A c := by
  sorry

/-- 3.3 For a normalized matrix (maximum cycle mean `0`), two walks of the critical graph with
the same endpoints have the same weight. -/
theorem walkWeight_eq_of_isCriticalArc {A : Matrix n n (WithBot ℝ)}
    (h0 : IsGreatest (cycleMeans A) 0) {k k' : ℕ} (p : Fin (k + 1) → n)
    (q : Fin (k' + 1) → n) (h₀ : p 0 = q 0) (hlast : p (Fin.last k) = q (Fin.last k'))
    (hp : ∀ t : Fin k, IsCriticalArc A (p t.castSucc) (p t.succ))
    (hq : ∀ t : Fin k', IsCriticalArc A (q t.castSucc) (q t.succ)) :
    walkWeight A p = walkWeight A q := by
  sorry

open Classical in
/-- 3.4 For a normalized matrix, every eigenvector for the eigenvalue `0` is the max-plus
combination `x l = max_{i critical} (A⁺ l i + x i)` of the critical columns of `A⁺`. -/
theorem eq_sup_kleenePlus_of_isEigenpair {A : Matrix n n (WithBot ℝ)}
    (h0 : IsGreatest (cycleMeans A) 0) {x : n → WithBot ℝ} (hx : IsEigenpair A 0 x) :
    x = fun l => (univ.filter (IsCriticalNode A)).sup fun i => kleenePlus A l i + x i := by
  sorry

/-- 3.5 For a normalized matrix, the column of `A⁺` at a critical node is an eigenvector for the
eigenvalue `0`. -/
theorem isEigenpair_kleenePlus_col {A : Matrix n n (WithBot ℝ)}
    (h0 : IsGreatest (cycleMeans A) 0) {i : n} (hi : IsCriticalNode A i) :
    IsEigenpair A 0 (fun l => kleenePlus A l i) := by
  sorry

/-- 3.5 For a normalized matrix, the columns of `A⁺` at two critical nodes joined in the critical
graph are proportional: `A⁺ l j = A⁺ l i + A⁺ i j` for every `l`. -/
theorem kleenePlus_col_eq_of_reflTransGen {A : Matrix n n (WithBot ℝ)}
    (h0 : IsGreatest (cycleMeans A) 0) {i j : n} (hi : IsCriticalNode A i)
    (hij : Relation.ReflTransGen (IsCriticalArc A) i j) (l : n) :
    kleenePlus A l j = kleenePlus A l i + kleenePlus A i j := by
  sorry

/-! ## Layer 4: Cyclicity and convergence of the powers -/

/-- 4.1 (Copied verbatim from PeriodicNonnegativeMatrices 1.1.) The period of the index `i` of a
real square matrix: the gcd of the `k ≥ 1` with `0 < (A ^ k) i i`, and `0` when there is no such
`k`. -/
def period (A : Matrix n n ℝ) (i : n) : ℕ :=
  Nat.setGcd {k : ℕ | 0 < k ∧ 0 < (A ^ k) i i}

open Classical in
/-- 4.1 The real `0/1` pattern matrix of the critical graph: `1` on critical arcs, `0` elsewhere. -/
def criticalPattern (A : Matrix n n (WithBot ℝ)) : Matrix n n ℝ :=
  Matrix.of fun i j => if IsCriticalArc A i j then 1 else 0

open Classical in
/-- 4.1 The cyclicity of the critical graph: the lcm, over the critical nodes `i`, of the period
of `i` in the critical pattern matrix (the gcd of the lengths of the critical closed walks through
`i`); it is `1` when there is no critical node. -/
def criticalCyclicity (A : Matrix n n (WithBot ℝ)) : ℕ :=
  (univ.filter (IsCriticalNode A)).lcm (period (criticalPattern A))

/-- 4.2 The cyclicity theorem: for an irreducible max-plus matrix with maximum cycle mean `μ`
and critical cyclicity `σ ≥ 1`, eventually `A ^ (k + σ) = σ μ + A ^ k` entrywise. -/
theorem cyclicity {A : Matrix n n (WithBot ℝ)} (hA : (pattern A).IsIrreducible)
    {μ : ℝ} (hμ : IsGreatest (cycleMeans A) μ) :
    0 < criticalCyclicity A ∧ ∃ N, ∀ k ≥ N, mpPow A (k + criticalCyclicity A) =
      Matrix.of fun i j => (((criticalCyclicity A : ℝ) * μ : ℝ) : WithBot ℝ) + mpPow A k i j := by
  sorry

/-- 4.3 Every eventual period of the max-plus powers is a multiple of the critical cyclicity: if
eventually `A ^ (k + p) = p μ + A ^ k` for some real `μ`, then `σ ∣ p`. -/
theorem criticalCyclicity_dvd {A : Matrix n n (WithBot ℝ)} {μ : ℝ} {p : ℕ}
    (hp : ∃ N, ∀ k ≥ N, mpPow A (k + p) =
      Matrix.of fun i j => (((p : ℝ) * μ : ℝ) : WithBot ℝ) + mpPow A k i j) :
    criticalCyclicity A ∣ p := by
  sorry

/-- 4.4 The convergence criterion: the powers of an irreducible normalized max-plus matrix are
eventually equal to the spectral projector if and only if the critical cyclicity is `1`. -/
theorem eventually_eq_spectralProjector_iff {A : Matrix n n (WithBot ℝ)}
    (hA : (pattern A).IsIrreducible) (h0 : IsGreatest (cycleMeans A) 0) :
    (∃ K, ∀ k ≥ K, mpPow A k = spectralProjector A) ↔ criticalCyclicity A = 1 := by
  sorry

end TauCetiRoadmap.MaxPlusSpectralTheory
