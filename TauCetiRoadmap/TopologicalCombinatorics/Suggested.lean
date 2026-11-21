import Mathlib

/-!
# Topological combinatorics: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining route steps, API lists and
Checks are not restated.

Points of the `N`-th subdivision of the standard `n`-simplex are integer vectors on `Fin (n + 1)`
with nonnegative coordinates summing to `N`; its cells are Kuhn's cells, indexed by a base point
and a permutation of `Fin n`. Signed sets on `Fin n` are sign vectors `Fin n → SignType`. Kneser
graphs live on subtypes of `Finset α`, two sets adjacent when they are distinct and disjoint.
Spheres are Mathlib's `Metric.sphere (0 : E) r` with its antipodal negation; half-spaces are
written with `inner ℝ`.
-/

noncomputable section

open Finset MeasureTheory

namespace TauCetiRoadmap.TopologicalCombinatorics

/-! ## Layer 1: Sperner's lemma on the Kuhn subdivision -/

/-- 1.1 The points of the `N`-th subdivision of the standard `n`-simplex: integer vectors on
`Fin (n + 1)` with nonnegative coordinates summing to `N`. -/
def simplexGrid (n N : ℕ) : Finset (Fin (n + 1) → ℤ) :=
  (Fintype.piFinset fun _ => Finset.Icc (0 : ℤ) N).filter fun x => ∑ i, x i = N

/-- 1.1 The `t`-th vertex of the Kuhn cell with base point `v` and order `σ`: the point reached
from `v` by the steps `e_(σ s) − e_(σ s + 1)` for `s < t`. -/
def kuhnVertex {n : ℕ} (v : Fin (n + 1) → ℤ) (σ : Equiv.Perm (Fin n)) (t : Fin (n + 1)) :
    Fin (n + 1) → ℤ :=
  v + ∑ s ∈ Finset.univ.filter (fun s : Fin n => (s : ℕ) < t),
    ((Pi.single (σ s).castSucc 1 : Fin (n + 1) → ℤ) - Pi.single (σ s).succ 1)

/-- 1.1 The Kuhn cells of the `N`-th subdivision: pairs of a base point and an order whose
`n + 1` vertices all lie in the subdivided simplex. -/
def kuhnCells (n N : ℕ) : Finset ((Fin (n + 1) → ℤ) × Equiv.Perm (Fin n)) :=
  (simplexGrid n N ×ˢ Finset.univ).filter fun p => ∀ t, kuhnVertex p.1 p.2 t ∈ simplexGrid n N

/-- 1.1 A Sperner labelling: every point of the subdivision is labelled by the index of one of
its positive coordinates. -/
def IsSpernerLabelling (n N : ℕ) (lab : (Fin (n + 1) → ℤ) → Fin (n + 1)) : Prop :=
  ∀ x ∈ simplexGrid n N, x (lab x) ≠ 0

open Classical in
/-- 1.1 The fully labelled Kuhn cells: those whose vertices carry all `n + 1` labels. -/
def fullyLabelledCells (n N : ℕ) (lab : (Fin (n + 1) → ℤ) → Fin (n + 1)) :
    Finset ((Fin (n + 1) → ℤ) × Equiv.Perm (Fin n)) :=
  (kuhnCells n N).filter fun p => Function.Bijective fun t => lab (kuhnVertex p.1 p.2 t)

/-- 1.2 Sperner's lemma on the Kuhn subdivision: a Sperner labelling has an odd number of fully
labelled cells. -/
theorem odd_card_fullyLabelledCells (n N : ℕ) (lab : (Fin (n + 1) → ℤ) → Fin (n + 1))
    (hlab : IsSpernerLabelling n N lab) : Odd (fullyLabelledCells n N lab).card := by
  sorry

/-- 1.3 Sperner's lemma with owners: for `n + 1` Sperner labellings `L p`, there are `n + 1`
points of the subdivision, pairwise within one in every coordinate, at which the labellings,
each read at its own point, take `n + 1` distinct values. -/
theorem exists_close_bijective_labels (n N : ℕ)
    (L : Fin (n + 1) → (Fin (n + 1) → ℤ) → Fin (n + 1))
    (hL : ∀ p, IsSpernerLabelling n N (L p)) :
    ∃ x : Fin (n + 1) → Fin (n + 1) → ℤ, (∀ p, x p ∈ simplexGrid n N) ∧
      (∀ p q i, |x p i - x q i| ≤ 1) ∧ Function.Bijective fun p => L p (x p) := by
  sorry

/-! ## Layer 2: Tucker's lemma -/

/-- 2.1 Tucker's lemma for a flag of hemispheres, in combinatorial form. `H d` lists the
simplices of the `d`-th hemisphere as finite sets of vertices, `ι` is the antipodal involution.
For `d < n`: deleting a vertex of a simplex of `H (d + 1)` stays in `H (d + 1)`; `H d` and its
image under `ι` lie in `H (d + 1)`; no `d`-simplex of `H d` has its image in `H d`; a
`d`-simplex of `H (d + 1)` is a facet of one `(d + 1)`-simplex of `H (d + 1)` when it or its
image lies in `H d`, and of two otherwise. If `H 0` has one vertex, and the vertices of `H n`
carry nonzero labels of absolute value at most `n`, antisymmetric on the vertices of the `H d`
with `d < n`, then a simplex of `H n` has two distinct vertices with opposite labels. -/
theorem flag_tucker {V : Type*} [DecidableEq V] (n : ℕ) (H : ℕ → Finset (Finset V))
    (ι : V → V) (hι : Function.Involutive ι)
    (hdown : ∀ d < n, ∀ τ ∈ H (d + 1), ∀ v ∈ τ, τ.erase v ∈ H (d + 1))
    (hmono : ∀ d < n, ∀ σ ∈ H d, σ ∈ H (d + 1) ∧ σ.image ι ∈ H (d + 1))
    (hdisj : ∀ d < n, ∀ σ ∈ H d, σ.card = d + 1 → σ.image ι ∉ H d)
    (hinc : ∀ d < n, ∀ ρ ∈ H (d + 1), ρ.card = d + 1 →
      ((H (d + 1)).filter fun τ => ρ ⊆ τ ∧ τ.card = d + 2).card =
        if ρ ∈ H d ∨ ρ.image ι ∈ H d then 1 else 2)
    (hH₀ : ((H 0).filter fun σ => σ.card = 1).card = 1)
    (lab : V → ℤ) (hlab : ∀ σ ∈ H n, ∀ v ∈ σ, lab v ≠ 0 ∧ |lab v| ≤ n)
    (hodd : ∀ d < n, ∀ σ ∈ H d, ∀ v ∈ σ, lab (ι v) = -lab v) :
    ∃ σ ∈ H n, ∃ u ∈ σ, ∃ w ∈ σ, u ≠ w ∧ lab u = -lab w := by
  sorry

/-- 2.2 The octahedral Tucker lemma: an antipodal labelling of the nonzero sign vectors of length
`n ≥ 1` by nonzero integers of absolute value less than `n` has signed sets `A ≤ B` with opposite
labels. -/
theorem octahedral_tucker {n : ℕ} (hn : 0 < n) (lab : (Fin n → SignType) → ℤ)
    (hlab : ∀ X, X ≠ 0 → lab X ≠ 0 ∧ |lab X| < n)
    (hodd : ∀ X, X ≠ 0 → lab (-X) = -lab X) :
    ∃ A B : Fin n → SignType, A ≠ 0 ∧ (∀ i, A i ≠ 0 → B i = A i) ∧ lab A = -lab B := by
  sorry

/-- 2.3 Tucker's lemma on the lattice cross-polytope: a labelling of the integer points of the
`ℓ¹`-ball of radius `m` in `ℤⁿ` by nonzero integers of absolute value at most `n`, antipodal on
the boundary sphere, has two points within one in every coordinate with opposite labels. -/
theorem lattice_tucker {n : ℕ} (m : ℕ) (lab : (Fin n → ℤ) → ℤ)
    (hlab : ∀ x : Fin n → ℤ, ∑ i, |x i| ≤ m → lab x ≠ 0 ∧ |lab x| ≤ n)
    (hodd : ∀ x : Fin n → ℤ, ∑ i, |x i| = m → lab (-x) = -lab x) :
    ∃ x y : Fin n → ℤ, ∑ i, |x i| ≤ m ∧ ∑ i, |y i| ≤ m ∧ (∀ i, |x i - y i| ≤ 1) ∧
      lab x = -lab y := by
  sorry

/-! ## Layer 3: Kneser graphs -/

/-- 3.1 The Kneser graph of a family `𝓕` of finite sets: its vertices are the members of `𝓕`,
two of them adjacent when they are distinct and disjoint. -/
def kneserGraphOf {α : Type*} (𝓕 : Set (Finset α)) : SimpleGraph 𝓕 where
  Adj A B := A ≠ B ∧ Disjoint (A : Finset α) B
  symm := ⟨fun _ _ h => ⟨h.1.symm, h.2.symm⟩⟩
  loopless := ⟨fun _ h => h.1 rfl⟩

/-- 3.1 The Kneser graph `KG(α, k)`: the `k`-element subsets of `α`, two adjacent when they are
distinct and disjoint. -/
def kneserGraph (α : Type*) (k : ℕ) : SimpleGraph {s : Finset α | s.card = k} :=
  kneserGraphOf {s : Finset α | s.card = k}

/-- 3.2 Dol'nikov's theorem: if the Kneser graph of a family of nonempty subsets of a finite set
is `r`-colourable, then deleting some set `Y` of at most `r` points leaves a ground set with a
2-colouring in which no member of the family that avoids `Y` is monochromatic. -/
theorem dolnikov {α : Type*} [Finite α] (𝓕 : Set (Finset α)) (h𝓕 : ∀ A ∈ 𝓕, A.Nonempty)
    {r : ℕ} (hr : (kneserGraphOf 𝓕).Colorable r) :
    ∃ Y : Finset α, Y.card ≤ r ∧ ∃ c : α → Bool,
      ∀ A ∈ 𝓕, Disjoint A Y → ∃ i ∈ A, ∃ j ∈ A, c i ≠ c j := by
  sorry

/-- 3.3 Kneser's conjecture, Lovász's theorem: for `k ≥ 1` and `2k − 1 ≤ n = |α|`, the Kneser
graph `KG(α, k)` has chromatic number `n − 2k + 2`. -/
theorem chromaticNumber_kneserGraph {α : Type*} [Fintype α] {k : ℕ} (hk : 0 < k)
    (hn : 2 * k ≤ Fintype.card α + 1) :
    (kneserGraph α k).chromaticNumber = (Fintype.card α + 2 - 2 * k : ℕ) := by
  sorry

/-! ## Layer 4: the Borsuk–Ulam theorem -/

/-- 4.1 The Borsuk–Ulam theorem: a continuous map from a sphere `‖x‖ = r ≥ 0` of a real normed
space `E` to a finite-dimensional real normed space of smaller dimension takes the same value at
some pair of antipodal points. The dimension condition is asked only for finite-dimensional `E`,
since Mathlib's `finrank` of an infinite-dimensional space is `0`. -/
theorem borsuk_ulam {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
    (hEF : FiniteDimensional ℝ E → Module.finrank ℝ F < Module.finrank ℝ E) {r : ℝ} (hr : 0 ≤ r)
    {f : Metric.sphere (0 : E) r → F} (hf : Continuous f) : ∃ x, f (-x) = f x := by
  sorry

/-! ## Layer 5: the ham sandwich theorem -/

/-- 5.1 The ham sandwich theorem: `d = dim E ≥ 1` finite measures on a real inner product space
`E`, each vanishing on every affine hyperplane, are simultaneously bisected by one hyperplane. -/
theorem ham_sandwich {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [MeasurableSpace E] [OpensMeasurableSpace E] (hE : 0 < Module.finrank ℝ E)
    (μ : Fin (Module.finrank ℝ E) → Measure E) [∀ i, IsFiniteMeasure (μ i)]
    (hμ : ∀ i (a : E), a ≠ 0 → ∀ b : ℝ, μ i {x | inner ℝ a x = b} = 0) :
    ∃ a : E, a ≠ 0 ∧ ∃ b : ℝ, ∀ i, μ i {x | inner ℝ a x < b} = μ i {x | b < inner ℝ a x} := by
  sorry

end TauCetiRoadmap.TopologicalCombinatorics
