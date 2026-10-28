import TauCetiRoadmap.TensorProductCombinatorics.Suggested
import TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Basic

/-!
Suggested target forms, not an exhaustive checklist. The README is definitive.
H2.1's product-chart reconstruction on the native signed GT carrier.
The three theorem admissions specify future work, including the actual equivalence.
-/

noncomputable section
open scoped BigOperators

namespace TensorProductCombinatorics

/-- Partial boundary sum; j is a row length, not a zero-indexed weight position. -/
def gtBoundaryPrefix {n : ℕ} (l : Fin n → ℤ) (j : ℕ) : ℤ :=
  ∑ r : Fin n, if r.val < j then l r else 0

/-- The inverse chart formula at 0 ≤ i ≤ j ≤ n. -/
def gtCompletion {n : ℕ} (l : TauCeti.DominantWeight n)
    (P : TauCeti.GTPattern n) (i j : ℕ) : ℤ :=
  gtBoundaryPrefix l.1 j + ∑ k ∈ Finset.range i, P.entry k j

/-- Successive sums of native rows, with the empty row having sum zero. -/
def gtRowWeight {n : ℕ} (P : TauCeti.GTPattern n) : Fin n → ℤ := fun r =>
  (∑ k ∈ Finset.range (r.val + 1), P.entry k (r.val + 1)) -
    (∑ k ∈ Finset.range r.val, P.entry k r.val)

/-- The remaining rhombi are exactly the obstruction to reconstructing a hive.
All vertices of the barycentric carrier are identified with the specified chart. -/
theorem gt_reconstruction_iff {n : ℕ} (l m g : TauCeti.DominantWeight n)
    (P : TauCeti.GTPattern n) (hTop : P.topRow = m.1)
    (hWeight : gtRowWeight P = g.1 - l.1) :
    (∃! h : FixedIntegerHive (productBoundary l m g),
      ∀ v : Vertex n, h.1.value v =
        gtCompletion l P (v.1 2).val (n - (v.1 0).val)) ↔
    ∀ i j : ℕ, i ≤ j → j + 2 ≤ n →
      gtCompletion l P i j + gtCompletion l P (i + 1) (j + 2) ≤
        gtCompletion l P i (j + 1) + gtCompletion l P (i + 1) (j + 1) := by
  sorry

/-- Interlacing bounds the lost sum by the width of the top row.
The gap is on l, the input supplying the reconstructed left boundary. -/
theorem gt_completion_of_uniform_input_gap {n : ℕ}
    (l m : TauCeti.DominantWeight (n + 1)) (P : TauCeti.GTPattern (n + 1))
    (hTop : P.topRow = m.1)
    (hGap : ∀ r : Fin n,
      m.1 0 - m.1 (Fin.last n) ≤ l.1 r.castSucc - l.1 r.succ) :
    ∀ i j : ℕ, i ≤ j → j + 2 ≤ n + 1 →
      gtCompletion l P i j + gtCompletion l P (i + 1) (j + 2) ≤
        gtCompletion l P i (j + 1) + gtCompletion l P (i + 1) (j + 1) := by
  sorry

/-- The stable equivalence is specified together with its inverse's entries;
no selection from an equality of cardinalities discharges this target. -/
theorem exists_stable_gt_equiv {n : ℕ} (l m g : TauCeti.DominantWeight (n + 1))
    (hGap : ∀ r : Fin n,
      m.1 0 - m.1 (Fin.last n) ≤ l.1 r.castSucc - l.1 r.succ) :
    ∃ e : FixedIntegerHive (productBoundary l m g) ≃
      {P : TauCeti.GTPattern (n + 1) //
        P.topRow = m.1 ∧ gtRowWeight P = g.1 - l.1},
      ∀ h v, h.1.value v =
        gtCompletion l (e h).1 (v.1 2).val (n + 1 - (v.1 0).val) := by
  sorry

end TensorProductCombinatorics
