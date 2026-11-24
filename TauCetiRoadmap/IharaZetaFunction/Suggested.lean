import Mathlib

/-!
# The Ihara zeta function of a graph: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's API lists, routes and Checks are not
restated.

Graphs are Mathlib's `SimpleGraph V` on a `Fintype` with decidable equality, and decidable
adjacency wherever a matrix is formed. The Hashimoto matrix is indexed by Mathlib's darts. The
zeta function is a power series with rational coefficients, the exponential of the series of
walk counts `N_m / m` (its constant coefficient is `N₀ / 0 = 0`); the determinant `det(1 − uB)` is
Mathlib's `Matrix.charpolyRev`. Bass's formula is stated multiplied out, so that it holds for
every finite simple graph, forests included. Adjacency eigenvalues are Mathlib's
`Matrix.IsHermitian.eigenvalues` of the real adjacency matrix, with multiplicity and unsorted.
-/

noncomputable section

open SimpleGraph Finset Polynomial

namespace TauCetiRoadmap.IharaZetaFunction

variable {V : Type*} [Fintype V] [DecidableEq V]

/-! ## Layer 1: The Hashimoto matrix and non-backtracking cycles -/

/-- 1.1 The Hashimoto (non-backtracking edge) matrix on darts: the entry at `(a, b)` is `1` when
`a` ends where `b` starts and `b` is not the reversal of `a`, and `0` otherwise. -/
def hashimotoMatrix (R : Type*) [Zero R] [One R] (G : SimpleGraph V) [DecidableRel G.Adj] :
    Matrix G.Dart G.Dart R :=
  Matrix.of fun a b => if a.snd = b.fst ∧ b ≠ a.symm then 1 else 0

/-- 1.2 A closed walk is a non-backtracking cycle when no dart of `p.darts ++ p.darts.take 1` is
followed by its reversal: no backtracking and no tail. -/
def IsNonBacktrackingCycle {G : SimpleGraph V} {u : V} (p : G.Walk u u) : Prop :=
  (p.darts ++ p.darts.take 1).IsChain fun d d' => d' ≠ d.symm

/-- 1.2 The number `N_m` of closed non-backtracking cycles of length `m`, each counted with its
starting vertex. -/
def closedNonBacktrackingCount (G : SimpleGraph V) (m : ℕ) : ℕ :=
  Nat.card {c : Σ u : V, G.Walk u u // c.2.length = m ∧ IsNonBacktrackingCycle c.2}

/-- 1.2 The trace formula: for `m ≥ 1`, `tr Bᵐ = N_m`. -/
theorem trace_hashimotoMatrix_pow (G : SimpleGraph V) [DecidableRel G.Adj] {m : ℕ}
    (hm : 1 ≤ m) :
    (hashimotoMatrix ℤ G ^ m).trace = closedNonBacktrackingCount G m := by
  sorry

/-! ## Layer 2: The zeta function -/

/-- 2.1 The Ihara zeta function `ζ(u) = exp(Σ_m N_m u^m / m)` in `ℚ⟦u⟧`. -/
def iharaZeta (G : SimpleGraph V) : PowerSeries ℚ :=
  (PowerSeries.exp ℚ).subst
    (PowerSeries.mk fun m => (closedNonBacktrackingCount G m : ℚ) / m)

/-- 2.1 The determinant formula: `ζ(u) · det(1 − uB) = 1`. -/
theorem iharaZeta_mul_charpolyRev (G : SimpleGraph V) [DecidableRel G.Adj] :
    iharaZeta G * ((hashimotoMatrix ℚ G).charpolyRev : PowerSeries ℚ) = 1 := by
  sorry

/-! ## Layer 3: Bass's determinant formula -/

/-- 3.1 Bass's three-term formula, multiplied out:
`(1 − X²)ⁿ det(1 − XB) = (1 − X²)ᵉ det(1 − XA + X²(D − 1))` for every finite simple graph. -/
theorem bass_determinant_formula (G : SimpleGraph V) [DecidableRel G.Adj] :
    (1 - X ^ 2 : ℤ[X]) ^ Fintype.card V * (hashimotoMatrix ℤ G).charpolyRev =
      (1 - X ^ 2) ^ #G.edgeFinset *
        Matrix.det (1 - (X : ℤ[X]) • (G.adjMatrix ℤ).map C +
          (X ^ 2 : ℤ[X]) • (G.degMatrix ℤ - 1).map C) := by
  sorry

/-! ## Layer 4: The structure of the Hashimoto matrix -/

/-- 4.1 Horton's singular values, multiplied out:
`(X − 1)ⁿ charpoly(BᵀB) = ∏_v (X − (deg v − 1)²) (X − 1)^(deg v)`. -/
theorem charpoly_transpose_mul_hashimotoMatrix (G : SimpleGraph V) [DecidableRel G.Adj] :
    (X - 1 : ℤ[X]) ^ Fintype.card V *
        ((hashimotoMatrix ℤ G).transpose * hashimotoMatrix ℤ G).charpoly =
      ∏ v, (X - C (((G.degree v : ℤ) - 1) ^ 2)) * (X - 1) ^ G.degree v := by
  sorry

/-- 4.2 For a graph with a vertex and no isolated vertex, the Hashimoto matrix is irreducible iff
the graph is connected, has minimum degree at least `2` and is not a cycle (`n < e`). -/
theorem isIrreducible_hashimotoMatrix_iff [Nonempty V] (G : SimpleGraph V) [DecidableRel G.Adj]
    (hdeg : ∀ v, 1 ≤ G.degree v) :
    (hashimotoMatrix ℝ G).IsIrreducible ↔
      G.Connected ∧ (∀ v, 2 ≤ G.degree v) ∧ Fintype.card V < #G.edgeFinset := by
  sorry

/-! ## Layer 5: Regular graphs -/

/-- 5.1 For a `(q + 1)`-regular graph with `q ≥ 1`,
`charpoly(B) = (X² − 1)^(e − n) ∏_v (X² − λ_v X + q)`. -/
theorem charpoly_hashimotoMatrix_of_isRegularOfDegree (G : SimpleGraph V) [DecidableRel G.Adj]
    {q : ℕ} (hq : 1 ≤ q) (hG : G.IsRegularOfDegree (q + 1)) :
    (hashimotoMatrix ℝ G).charpoly =
      (X ^ 2 - 1) ^ (#G.edgeFinset - Fintype.card V) *
        ∏ v, (X ^ 2 - C ((G.isHermitian_adjMatrix ℝ).eigenvalues v) * X + C (q : ℝ)) := by
  sorry

/-- 5.2 The functional equation `ξ(u) = ξ(1/(qu))` for a `(q + 1)`-regular graph with `q ≥ 1`,
with `ξ(u) = (1 + u)^(e − n) (1 − u)^e (1 − qu)^n ζ(u)`, cross-multiplied. At `u = 0` both sides
are `1`, since `0⁻¹ = 0`. -/
theorem functional_equation_of_isRegularOfDegree (G : SimpleGraph V) [DecidableRel G.Adj]
    {q : ℕ} (hq : 1 ≤ q) (hG : G.IsRegularOfDegree (q + 1)) (u : ℂ) :
    (1 + u) ^ (#G.edgeFinset - Fintype.card V) * (1 - u) ^ #G.edgeFinset *
        (1 - q * u) ^ Fintype.card V * Matrix.det (1 - (q * u)⁻¹ • hashimotoMatrix ℂ G) =
      (1 + (q * u)⁻¹) ^ (#G.edgeFinset - Fintype.card V) * (1 - (q * u)⁻¹) ^ #G.edgeFinset *
        (1 - u⁻¹) ^ Fintype.card V * Matrix.det (1 - u • hashimotoMatrix ℂ G) := by
  sorry

/-- 5.3 The Ramanujan property: every adjacency eigenvalue `λ` with `|λ| ≠ q + 1` has
`|λ| ≤ 2√q`. -/
def IsRamanujan (q : ℕ) (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  ∀ v, |(G.isHermitian_adjMatrix ℝ).eigenvalues v| ≠ q + 1 →
    |(G.isHermitian_adjMatrix ℝ).eigenvalues v| ≤ 2 * Real.sqrt q

/-- 5.3 The Riemann hypothesis for `ζ(q^(−s))`: every `s` with `0 < Re s < 1` and
`det(1 − q^(−s) B) = 0` has `Re s = 1/2`. -/
def SatisfiesRiemannHypothesis (q : ℕ) (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  ∀ s : ℂ, 0 < s.re → s.re < 1 →
    Matrix.det (1 - (q : ℂ) ^ (-s) • hashimotoMatrix ℂ G) = 0 → s.re = 1 / 2

/-- 5.3 Ihara's theorem: a `(q + 1)`-regular graph with `q ≥ 2` is Ramanujan iff its zeta
function satisfies the Riemann hypothesis. -/
theorem isRamanujan_iff_satisfiesRiemannHypothesis (G : SimpleGraph V) [DecidableRel G.Adj]
    {q : ℕ} (hq : 2 ≤ q) (hG : G.IsRegularOfDegree (q + 1)) :
    IsRamanujan q G ↔ SatisfiesRiemannHypothesis q G := by
  sorry

end TauCetiRoadmap.IharaZetaFunction
