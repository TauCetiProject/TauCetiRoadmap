import Mathlib

/-!
# Strongly regular and Moore graphs: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Graphs are Mathlib's `SimpleGraph V` on a `Fintype` with decidable equality and decidable
adjacency. Strong regularity is Mathlib's `SimpleGraph.IsSRGWith n k ℓ μ`, which the complete
graph satisfies for every `μ` and the graph without edges for every `ℓ`; the spectral statements
therefore assume `G ≠ ⊤` and `0 < μ`. Eigenvalues are those of the real adjacency matrix
`G.adjMatrix ℝ`, and the multiplicity of an eigenvalue is the dimension of its eigenspace. The
diameter is Mathlib's `SimpleGraph.diam`, which is `0` for a graph that is not connected, and the
girth enters through Mathlib's `SimpleGraph.egirth`, which is `⊤` for a graph without cycles.
-/

noncomputable section

open SimpleGraph Finset

namespace TauCetiRoadmap.StronglyRegularAndMooreGraphs

variable {V : Type*} [Fintype V] [DecidableEq V]

/-! ## Layer 1: the spectrum of a strongly regular graph -/

/-- 1.2 The discriminant `(ℓ − μ)² + 4(k − μ)` of the quadratic `x² − (ℓ − μ)x − (k − μ)` whose
roots are the eigenvalues of a strongly regular graph other than its degree. -/
def srgDiscriminant (k ℓ μ : ℕ) : ℝ :=
  ((ℓ : ℝ) - μ) ^ 2 + 4 * ((k : ℝ) - μ)

/-- 1.2 The larger root `r = ((ℓ − μ) + √Δ) / 2` of `x² − (ℓ − μ)x − (k − μ)`. -/
def srgEigenvalueR (k ℓ μ : ℕ) : ℝ :=
  (((ℓ : ℝ) - μ) + Real.sqrt (srgDiscriminant k ℓ μ)) / 2

/-- 1.2 The smaller root `s = ((ℓ − μ) − √Δ) / 2` of `x² − (ℓ − μ)x − (k − μ)`. -/
def srgEigenvalueS (k ℓ μ : ℕ) : ℝ :=
  (((ℓ : ℝ) - μ) - Real.sqrt (srgDiscriminant k ℓ μ)) / 2

/-- 1.3 The multiplicity of `θ` as an eigenvalue of the real adjacency matrix of `G`: the
dimension of the eigenspace of `θ`, which is `0` when `θ` is not an eigenvalue. -/
def adjEigenMultiplicity (G : SimpleGraph V) [DecidableRel G.Adj] (θ : ℝ) : ℕ :=
  Module.finrank ℝ (Module.End.eigenspace (Matrix.toLin' (G.adjMatrix ℝ)) θ)

/-- 1.2 A strongly regular graph with `0 < μ` that is not complete has exactly the three
eigenvalues `k > r > s`, where `r` and `s` are the roots of `x² − (ℓ − μ)x − (k − μ)`. -/
theorem spectrum_adjMatrix_of_isSRGWith {G : SimpleGraph V} [DecidableRel G.Adj]
    {n k ℓ μ : ℕ} (h : G.IsSRGWith n k ℓ μ) (hμ : 0 < μ) (hG : G ≠ ⊤) :
    spectrum ℝ (G.adjMatrix ℝ) = {(k : ℝ), srgEigenvalueR k ℓ μ, srgEigenvalueS k ℓ μ} ∧
      srgEigenvalueS k ℓ μ < srgEigenvalueR k ℓ μ ∧ srgEigenvalueR k ℓ μ < k := by
  sorry

/-- 1.3 The multiplicities of the eigenvalues of a strongly regular graph with `0 < μ` that is not
complete: the degree `k` is simple, and the multiplicities `f` of `r` and `g` of `s` are
`((n − 1) ∓ (2k + (n − 1)(ℓ − μ)) / √Δ) / 2`, stated multiplied by `2√Δ`. Since `f` and `g` are
natural numbers, these are the rationality conditions on the parameters. -/
theorem adjEigenMultiplicity_of_isSRGWith {G : SimpleGraph V} [DecidableRel G.Adj]
    {n k ℓ μ : ℕ} (h : G.IsSRGWith n k ℓ μ) (hμ : 0 < μ) (hG : G ≠ ⊤) :
    adjEigenMultiplicity G k = 1 ∧
      2 * (adjEigenMultiplicity G (srgEigenvalueR k ℓ μ) : ℝ) *
          Real.sqrt (srgDiscriminant k ℓ μ) =
        ((n : ℝ) - 1) * Real.sqrt (srgDiscriminant k ℓ μ) -
          (2 * k + ((n : ℝ) - 1) * ((ℓ : ℝ) - μ)) ∧
      2 * (adjEigenMultiplicity G (srgEigenvalueS k ℓ μ) : ℝ) *
          Real.sqrt (srgDiscriminant k ℓ μ) =
        ((n : ℝ) - 1) * Real.sqrt (srgDiscriminant k ℓ μ) +
          (2 * k + ((n : ℝ) - 1) * ((ℓ : ℝ) - μ)) := by
  sorry

/-- 1.4 A strongly regular graph with `0 < μ` that is not complete is a conference graph, with
parameters `(4μ + 1, 2μ, μ − 1, μ)`, or its eigenvalues `r` and `s` are integers. -/
theorem conference_or_integral_of_isSRGWith {G : SimpleGraph V} [DecidableRel G.Adj]
    {n k ℓ μ : ℕ} (h : G.IsSRGWith n k ℓ μ) (hμ : 0 < μ) (hG : G ≠ ⊤) :
    (n = 4 * μ + 1 ∧ k = 2 * μ ∧ ℓ + 1 = μ) ∨
      ∃ r s : ℤ, (r : ℝ) = srgEigenvalueR k ℓ μ ∧ (s : ℝ) = srgEigenvalueS k ℓ μ := by
  sorry

/-- 1.5 Seidel's absolute bound. For a primitive strongly regular graph (not complete, with
`0 < μ < k`) the multiplicities `f` of `r` and `g` of `s` satisfy `n ≤ f(f + 3)/2` and
`n ≤ g(g + 3)/2`. -/
theorem two_mul_card_le_of_isSRGWith {G : SimpleGraph V} [DecidableRel G.Adj]
    {n k ℓ μ : ℕ} (h : G.IsSRGWith n k ℓ μ) (hμ : 0 < μ) (hμk : μ < k) (hG : G ≠ ⊤) :
    2 * n ≤ adjEigenMultiplicity G (srgEigenvalueR k ℓ μ) *
        (adjEigenMultiplicity G (srgEigenvalueR k ℓ μ) + 3) ∧
      2 * n ≤ adjEigenMultiplicity G (srgEigenvalueS k ℓ μ) *
        (adjEigenMultiplicity G (srgEigenvalueS k ℓ μ) + 3) := by
  sorry

/-! ## Layer 2: the friendship theorem -/

/-- 2.1 The friendship theorem. A graph on a nonempty finite vertex set in which any two distinct
vertices have exactly one common neighbour is a windmill: some vertex `c` is adjacent to every
other vertex, and every other vertex has exactly one neighbour besides `c`; and conversely. -/
theorem friendship_iff_windmill [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj] :
    (∀ v w : V, v ≠ w → Fintype.card (G.commonNeighbors v w) = 1) ↔
      ∃ c : V, (∀ w, w ≠ c → G.Adj c w) ∧ ∀ w, w ≠ c → ∃! u, u ≠ c ∧ G.Adj w u := by
  sorry

/-! ## Layer 3: Moore bounds and Moore graphs -/

/-- 3.1 The Moore number `1 + k ∑_(i < d) (k − 1)^i = 1 + k + k(k − 1) + ⋯ + k(k − 1)^(d − 1)`,
with natural-number subtraction (for `k = 0` it is `1`). -/
def mooreBound (k d : ℕ) : ℕ :=
  1 + k * ∑ i ∈ range d, (k - 1) ^ i

/-- 3.1 The Moore bound for the diameter. A connected finite graph whose degrees are at most `k`
has at most `1 + k + k(k − 1) + ⋯ + k(k − 1)^(D − 1)` vertices, where `D` is its diameter. -/
theorem card_le_mooreBound {G : SimpleGraph V} [DecidableRel G.Adj] {k : ℕ}
    (hconn : G.Connected) (hdeg : ∀ v, G.degree v ≤ k) :
    Fintype.card V ≤ mooreBound k G.diam := by
  sorry

/-- 3.2 The Moore bound for the girth. A finite graph on a nonempty vertex set whose degrees are at
least `d` and which has no cycle of length at most `2t` has at least
`1 + d + d(d − 1) + ⋯ + d(d − 1)^(t − 1)` vertices. -/
theorem mooreBound_le_card {G : SimpleGraph V} [DecidableRel G.Adj] [Nonempty V] {d t : ℕ}
    (hdeg : ∀ v, d ≤ G.degree v) (hgirth : ((2 * t + 1 : ℕ) : ℕ∞) ≤ G.egirth) :
    mooreBound d t ≤ Fintype.card V := by
  sorry

/-- 3.3 The graphs attaining the Moore bound. A connected finite graph of diameter `D ≥ 1` whose
degrees are at most `k` has exactly `mooreBound k D` vertices if and only if it is `k`-regular and
has no cycle of length at most `2D`. -/
theorem card_eq_mooreBound_iff {G : SimpleGraph V} [DecidableRel G.Adj] {k : ℕ}
    (hconn : G.Connected) (hdeg : ∀ v, G.degree v ≤ k) (hD : 1 ≤ G.diam) :
    Fintype.card V = mooreBound k G.diam ↔
      G.IsRegularOfDegree k ∧ ((2 * G.diam + 1 : ℕ) : ℕ∞) ≤ G.egirth := by
  sorry

/-- 3.4 A `k`-regular graph of diameter two with `mooreBound k 2 = 1 + k²` vertices is strongly
regular with parameters `(1 + k², k, 0, 1)`. -/
theorem isSRGWith_of_diam_eq_two {G : SimpleGraph V} [DecidableRel G.Adj] {k : ℕ}
    (hreg : G.IsRegularOfDegree k) (hdiam : G.diam = 2)
    (hcard : Fintype.card V = mooreBound k 2) :
    G.IsSRGWith (Fintype.card V) k 0 1 := by
  sorry

/-- 3.5 The Hoffman–Singleton theorem. A strongly regular graph with parameters `(n, k, 0, 1)`
that is not complete has `(n, k)` equal to `(5, 2)`, `(10, 3)`, `(50, 7)` or `(3250, 57)`. With
`isSRGWith_of_diam_eq_two` it gives the degrees `2`, `3`, `7`, `57` of Moore graphs of diameter
two. -/
theorem hoffman_singleton {G : SimpleGraph V} [DecidableRel G.Adj] {n k : ℕ}
    (h : G.IsSRGWith n k 0 1) (hG : G ≠ ⊤) :
    (n = 5 ∧ k = 2) ∨ (n = 10 ∧ k = 3) ∨ (n = 50 ∧ k = 7) ∨ (n = 3250 ∧ k = 57) := by
  sorry

end TauCetiRoadmap.StronglyRegularAndMooreGraphs
