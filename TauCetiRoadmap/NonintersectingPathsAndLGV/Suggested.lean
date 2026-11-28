import Mathlib
import TauCeti.Combinatorics.Young.SkewTableau

/-!
# Nonintersecting paths and the Lindström–Gessel–Viennot lemma: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the headline theorems of the
roadmap against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need: the path matrix of a weighted quiver, vertex-disjoint path
systems and their total weight, the number of lattice paths with given step counts, and a
verbatim copy of the Hankel determinant of SpecialFunctionsOrthogonalPolynomialsGeneral §2.4.

Every headline theorem of the README is stated here.
-/

namespace TauCetiRoadmap.NonintersectingPathsAndLGV

noncomputable section

open Quiver

/-! ## Layer 1: the lemma -/

section LGV

variable {V : Type*} [Quiver V] {R : Type*} [CommRing R]

/-- 1.1 The path matrix: its `(i, j)` entry is the total weight `∑ᶠ` of the paths from `a i` to
`b j`, the weight of a path being the product of its arrow weights. -/
def pathMatrix {n : ℕ} (w : ∀ {x y : V}, (x ⟶ y) → R) (a b : Fin n → V) :
    Matrix (Fin n) (Fin n) R :=
  Matrix.of fun i j => ∑ᶠ p : Path (a i) (b j), p.weight w

/-- 1.1 A family of paths, the `i`-th from `a i` to `b i`, is vertex-disjoint when no two of its
paths share a vertex, endpoints included. -/
def IsVertexDisjoint {n : ℕ} {a b : Fin n → V} (P : ∀ i, Path (a i) (b i)) : Prop :=
  Pairwise fun i j => (P i).vertices.Disjoint (P j).vertices

/-- 1.1 The total weight of the vertex-disjoint families of paths, the `i`-th from `a i` to
`b i`. -/
def disjointWeight {n : ℕ} (w : ∀ {x y : V}, (x ⟶ y) → R) (a b : Fin n → V) : R :=
  ∑ᶠ (P : ∀ i, Path (a i) (b i)) (_ : IsVertexDisjoint P), ∏ i, (P i).weight w

/-- 1.2 The Lindström–Gessel–Viennot lemma: if there are finitely many paths from each source
to each sink, the determinant of the path matrix is the signed total weight of the
vertex-disjoint families, the family of type `σ` running from `a (σ i)` to `b i`. -/
theorem det_pathMatrix {n : ℕ} (w : ∀ {x y : V}, (x ⟶ y) → R) (a b : Fin n → V)
    (hfin : ∀ i j, Finite (Path (a i) (b j))) :
    (pathMatrix w a b).det =
      ∑ σ : Equiv.Perm (Fin n), Equiv.Perm.sign σ • disjointWeight w (a ∘ σ) b := by
  sorry

end LGV

/-! ## Layer 2: lattice paths and binomial determinants -/

/-- 2.1 The Pascal matrix `(C(i, j))_{i, j ∈ ℕ}` is totally nonnegative. -/
theorem isTotallyNonneg_choose :
    (Matrix.of fun i j : ℕ => (i.choose j : ℤ)).IsTotallyNonneg := by
  sorry

/-- 2.2 For strictly increasing `a` and `b`, the binomial determinant `det (C(aᵢ, bⱼ))` is
positive exactly when `bᵢ ≤ aᵢ` for every `i`. -/
theorem det_choose_pos_iff {n : ℕ} {a b : Fin n → ℕ} (ha : StrictMono a) (hb : StrictMono b) :
    0 < (Matrix.of fun i j => ((a i).choose (b j) : ℤ)).det ↔ ∀ i, b i ≤ a i := by
  sorry

/-! ## Layer 3: Catalan determinants -/

/-- 3.1 The Gessel–Viennot Catalan determinant: for `α : Fin n → ℕ`,
`det (C_{αᵢ + j}) = ∏_{i<j} (αⱼ − αᵢ) · ∏ᵢ (i + n)! (2αᵢ)! / ((2i)! αᵢ! (αᵢ + n)!)`. -/
theorem det_catalan_add {n : ℕ} (α : Fin n → ℕ) :
    (Matrix.of fun i j : Fin n => (catalan (α i + j) : ℚ)).det =
      (∏ i : Fin n, ∏ j ∈ Finset.Ioi i, ((α j : ℚ) - α i)) *
        ∏ i : Fin n, ((((i : ℕ) + n).factorial * (2 * α i).factorial : ℕ) : ℚ) /
          (((2 * (i : ℕ)).factorial * (α i).factorial * (α i + n).factorial : ℕ) : ℚ) := by
  sorry

/-- 3.2 (copied verbatim from SpecialFunctionsOrthogonalPolynomialsGeneral §2.4) The Hankel
determinant `Δ_n = det (m_(i+j))_{i,j<n}` of a sequence; `Δ₀ = 1`. -/
def hankelDet (m : ℕ → ℝ) (n : ℕ) : ℝ :=
  (Matrix.of fun i j : Fin n => m (i.val + j.val)).det

/-- 3.2 The Hankel determinants of the Catalan numbers: `det (C_{i+j}) = 1`,
`det (C_{i+j+1}) = 1` and `det (C_{i+j+2}) = n + 1` in size `n`. -/
theorem hankelDet_catalan (n : ℕ) :
    hankelDet (fun k => (catalan k : ℝ)) n = 1 ∧
      hankelDet (fun k => (catalan (k + 1) : ℝ)) n = 1 ∧
        hankelDet (fun k => (catalan (k + 2) : ℝ)) n = n + 1 := by
  sorry

/-! ## Layer 4: flagged skew tableaux -/

/-- 4.1 The number of lattice paths with `h` east and `v` north unit steps: `C(h + v, h)` when
`h ≥ 0` and `v ≥ 0`, and `0` otherwise. -/
def latticePathCount (h v : ℤ) : ℕ :=
  if 0 ≤ h ∧ 0 ≤ v then (h + v).toNat.choose h.toNat else 0

/-- 4.1 Flagged skew tableaux: for Young diagrams `inner ≤ outer`, `outer` with at most `n`
rows, and weakly increasing flags `b ≤ a`, the semistandard tableaux of shape `outer / inner`
whose entries in row `i` lie in `[b i, a i]` are counted by the determinant of the lattice-path
counts `latticePathCount (λᵢ − μⱼ − i + j) (aᵢ − bⱼ)`. -/
theorem card_flaggedSkewTableaux {n : ℕ} {inner outer : YoungDiagram} (hle : inner ≤ outer)
    (hn : outer.colLen 0 ≤ n) {a b : Fin n → ℕ} (ha : Monotone a) (hb : Monotone b)
    (hba : b ≤ a) :
    (Nat.card {T : TauCeti.SkewSemistandardYoungTableau inner outer //
        ∀ i : Fin n, ∀ j : ℕ, (i.1, j) ∈ outer → (i.1, j) ∉ inner →
          b i ≤ T i j ∧ T i j ≤ a i} : ℤ) =
      (Matrix.of fun i j : Fin n => (latticePathCount
        ((outer.rowLen i : ℤ) - inner.rowLen j - i + j) ((a i : ℤ) - b j) : ℤ)).det := by
  sorry

end

end TauCetiRoadmap.NonintersectingPathsAndLGV
