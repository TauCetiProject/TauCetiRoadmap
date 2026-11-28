import Mathlib
import TauCeti.Combinatorics.DenseGraphLimits.HomDensity.Basic
import TauCeti.Combinatorics.DenseGraphLimits.HomDensity.Finite

/-!
# Quasirandom graphs: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
five definitions they need; every definition has a real body. Every headline theorem of the
README is statable at the pins and is stated here. The README's remaining targets, API lists and
Checks are not restated.

Graphs are Mathlib's `SimpleGraph V` on a `Fintype`, with `n = Fintype.card V`. The density
parameter `p` lies in Mathlib's `unitInterval`. Every quasirandom property is an explicit
inequality with a tolerance `ε` for one finite graph: no sequence of graphs and no `o(1)` term
enters a definition. The edge density and the 4-cycle density are Tau Ceti's homomorphism
densities `homDensityFin (⊤ : SimpleGraph (Fin 2)) G` and `homDensityFin (cycleGraph 4) G`,
which count homomorphisms (closed walks for the cycle), not labelled copies. `e(X, Y)` is the
number of ordered adjacent pairs, the cardinality of Mathlib's `G.interedges X Y`. The adjacency
eigenvalues are copied verbatim from SpectralGraphBounds 1.1; Layer 5 uses Tau Ceti's graphons
and Mathlib's binomial random graph.
-/

noncomputable section

open SimpleGraph Finset MeasureTheory ProbabilityTheory Filter TauCeti.DenseGraphLimits
open scoped unitInterval

namespace TauCetiRoadmap.QuasirandomGraphs

section Copied

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.3 (copied verbatim from SpectralGraphBounds 1.1) The adjacency eigenvalues of `G`, with
multiplicity, in nonincreasing order: index `0` carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

end Copied

variable {V : Type*} [Fintype V]

/-! ## Layer 1: the quasirandom properties -/

/-- 1.1 DISC with tolerance `ε`: for all vertex sets `X` and `Y`,
`|e(X, Y) - p |X| |Y|| ≤ ε n²`, where `e(X, Y)` counts ordered adjacent pairs. -/
def IsDisc (G : SimpleGraph V) [DecidableRel G.Adj] (p : I) (ε : ℝ) : Prop :=
  ∀ X Y : Finset V,
    |(#(G.interedges X Y) : ℝ) - p * #X * #Y| ≤ ε * (Fintype.card V : ℝ) ^ 2

/-- 1.1 DISC′ with tolerance `ε`: for every vertex set `X`, `|e(X, X) - p |X|²| ≤ ε n²`. -/
def IsDiscSelf (G : SimpleGraph V) [DecidableRel G.Adj] (p : I) (ε : ℝ) : Prop :=
  ∀ X : Finset V, |(#(G.interedges X X) : ℝ) - p * #X ^ 2| ≤ ε * (Fintype.card V : ℝ) ^ 2

/-- 1.2 CODEG with tolerance `ε`: the codegrees `codeg(u, v) = |N(u) ∩ N(v)|` satisfy
`∑ u, ∑ v, |codeg(u, v) - p² n| ≤ ε n³`, the sum running over all ordered pairs, `u = v`
included. -/
def IsCodeg [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (p : I) (ε : ℝ) : Prop :=
  ∑ u, ∑ v, |(#(G.neighborFinset u ∩ G.neighborFinset v) : ℝ) - (p : ℝ) ^ 2 * Fintype.card V|
    ≤ ε * (Fintype.card V : ℝ) ^ 3

/-- 1.3 EIG with tolerance `ε`: the largest adjacency eigenvalue is within `ε n` of `p n` and
every other one, by index, has absolute value at most `ε n`. No regularity is assumed. -/
def IsEig [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] (p : I) (ε : ℝ) : Prop :=
  ∀ i : Fin (Fintype.card V),
    |adjEigenvalues G i - (if (i : ℕ) = 0 then (p : ℝ) * Fintype.card V else 0)| ≤
      ε * Fintype.card V

/-! ## Layer 2: discrepancy and counting -/

/-- 2.1 DISC′ implies DISC with twice the tolerance (polarization). -/
theorem isDisc_of_isDiscSelf (G : SimpleGraph V) [DecidableRel G.Adj] {p : I} {ε : ℝ}
    (h : IsDiscSelf G p ε) : IsDisc G p (2 * ε) := by
  sorry

/-- 2.2 DISC implies COUNT: on a nonempty vertex type, if `G` satisfies DISC with tolerance `δ`,
then for every finite graph `F` the homomorphism density satisfies
`|t(F, G) - p ^ e(F)| ≤ e(F) δ`. -/
theorem abs_homDensityFin_sub_pow_le_of_isDisc [Nonempty V] (G : SimpleGraph V)
    [DecidableRel G.Adj] {p : I} {δ : ℝ} (h : IsDisc G p δ) {U : Type*} [Fintype U]
    (F : SimpleGraph U) [DecidableRel F.Adj] :
    |homDensityFin F G - (p : ℝ) ^ #F.edgeFinset| ≤ #F.edgeFinset * δ := by
  sorry

/-! ## Layer 3: codegrees -/

/-- 3.1 C4 implies CODEG: if `t(K₂, G) ≥ p - δ` and `t(C₄, G) ≤ p⁴ + δ`, then `G` satisfies
CODEG with tolerance `√(5δ)`. -/
theorem isCodeg_of_cycleGraph_four [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
    {p : I} {δ : ℝ} (h₂ : (p : ℝ) - δ ≤ homDensityFin (⊤ : SimpleGraph (Fin 2)) G)
    (h₄ : homDensityFin (cycleGraph 4) G ≤ (p : ℝ) ^ 4 + δ) :
    IsCodeg G p (Real.sqrt (5 * δ)) := by
  sorry

/-- 3.2 CODEG implies DISC: if `t(K₂, G) ≥ p - δ` and `G` satisfies CODEG with tolerance `δ`,
then `G` satisfies DISC with tolerance `√(δ + 2√(3δ))`. -/
theorem isDisc_of_isCodeg [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj] {p : I}
    {δ : ℝ} (h₂ : (p : ℝ) - δ ≤ homDensityFin (⊤ : SimpleGraph (Fin 2)) G)
    (h : IsCodeg G p δ) :
    IsDisc G p (Real.sqrt (δ + 2 * Real.sqrt (3 * δ))) := by
  sorry

/-! ## Layer 4: eigenvalues -/

/-- 4.1 For `k ≥ 2` the number of homomorphisms from the `k`-cycle to `G`, which is the number
of closed walks of length `k`, is the sum of the `k`-th powers of the adjacency eigenvalues. -/
theorem card_hom_cycleGraph_eq_sum_pow [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
    {k : ℕ} (hk : 2 ≤ k) :
    (Nat.card (cycleGraph k →g G) : ℝ) = ∑ i, adjEigenvalues G i ^ k := by
  sorry

/-- 4.2 C4 implies EIG: if `t(K₂, G) ≥ p - δ` and `t(C₄, G) ≤ p⁴ + δ`, then `G` satisfies EIG
with tolerance `(5δ)^(1/4)`, written `√(√(5δ))`. -/
theorem isEig_of_cycleGraph_four [DecidableEq V] (G : SimpleGraph V) [DecidableRel G.Adj]
    {p : I} {δ : ℝ} (h₂ : (p : ℝ) - δ ≤ homDensityFin (⊤ : SimpleGraph (Fin 2)) G)
    (h₄ : homDensityFin (cycleGraph 4) G ≤ (p : ℝ) ^ 4 + δ) :
    IsEig G p (Real.sqrt (Real.sqrt (5 * δ))) := by
  sorry

/-- 4.3 EIG implies C4: if `G` satisfies EIG with tolerance `δ`, then
`t(C₄, G) ≤ (p + δ)⁴ + δ²`. -/
theorem homDensityFin_cycleGraph_four_le_of_isEig [DecidableEq V] (G : SimpleGraph V)
    [DecidableRel G.Adj] {p : I} {δ : ℝ} (h : IsEig G p δ) :
    homDensityFin (cycleGraph 4) G ≤ ((p : ℝ) + δ) ^ 4 + δ ^ 2 := by
  sorry

/-! ## Layer 5: graphons and random graphs -/

/-- 5.1 The 4-cycle forces the constant graphon: a graphon on any probability space has
`t(C₄, W) = t(K₂, W)⁴` exactly when `W` equals the constant `t(K₂, W)` almost everywhere. -/
theorem homDensity_cycleGraph_four_eq_pow_iff {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    [IsProbabilityMeasure μ] (W : Graphon Ω μ) :
    homDensity (cycleGraph 4) W = homDensity (⊤ : SimpleGraph (Fin 2)) W ^ 4 ↔
      ∀ᵐ q ∂(μ.prod μ), W q.1 q.2 = homDensity (⊤ : SimpleGraph (Fin 2)) W := by
  sorry

open Classical in
/-- 5.2 Binomial random graphs are quasirandom almost surely: if each `Gs n` is a random graph
on `Fin n` with law `G(n, p)`, all on one probability space, then almost surely, for every
`ε > 0`, `Gs n` satisfies DISC with tolerance `ε` for all large `n`. -/
theorem ae_eventually_isDisc_of_hasLaw_binomialRandom {Ω : Type*} [MeasurableSpace Ω]
    {P : Measure Ω} [IsProbabilityMeasure P] (p : I) (Gs : (n : ℕ) → Ω → SimpleGraph (Fin n))
    (hG : ∀ n, HasLaw (Gs n) (binomialRandom (Fin n) p) P) :
    ∀ᵐ ω ∂P, ∀ ε > 0, ∀ᶠ n in atTop, IsDisc (Gs n ω) p ε := by
  sorry

end TauCetiRoadmap.QuasirandomGraphs
