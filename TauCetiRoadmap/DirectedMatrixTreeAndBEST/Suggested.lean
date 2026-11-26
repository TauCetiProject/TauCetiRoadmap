import Mathlib
import TauCeti.Combinatorics.Network.Walk

/-!
# The directed matrix-tree theorem and the BEST theorem: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Weighted digraphs are weight functions `w : V → V → R` on a finite vertex type, `w u v` being the
weight of the arcs from `u` to `v`; loops (`w v v`) are allowed. A spanning arborescence converging
to a root `r` is recorded by its parent function `p : V → V`, with `p r = r` and every vertex
reaching `r` under iteration of `p`; its weight is the product of `w v (p v)` over `v ≠ r`. The
out-degree Laplacian is `diag(∑ᵤ w v u) − w`, in which loops cancel. Multidigraphs are arrow
families `Q : V → V → Type*` with finitely many arrows, walks along them are Tau Ceti's
`TauCeti.ArrowWalk`, and degrees count loops.
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.DirectedMatrixTreeAndBEST

variable {V : Type*} [Fintype V] [DecidableEq V]

/-! ## Layer 1: the out-degree Laplacian and arborescences -/

/-- 1.1 The out-degree Laplacian of a weight function: the diagonal matrix of out-weights
`∑ u, w v u` minus the matrix of weights. A loop weight `w v v` cancels on the diagonal. -/
def outLaplacian {R : Type*} [CommRing R] (w : V → V → R) : Matrix V V R :=
  Matrix.diagonal (fun v => ∑ u, w v u) - Matrix.of w

/-- 1.2 The parent function `p` is a spanning arborescence converging to the root `r`: the root is
fixed, and every vertex reaches the root under iteration of `p`. -/
def IsArborescence (r : V) (p : V → V) : Prop :=
  p r = r ∧ ∀ v, ∃ k : ℕ, p^[k] v = r

open Classical in
/-- 1.2 The weighted arborescence sum at the root `r`: the sum over all spanning arborescences
converging to `r` of the product of the weights `w v (p v)` of their arcs. -/
def arborescenceSum {R : Type*} [CommSemiring R] (w : V → V → R) (r : V) : R :=
  ∑ p ∈ univ.filter (IsArborescence r), ∏ v ∈ univ.erase r, w v (p v)

/-! ## Layer 2: the directed matrix-tree theorem -/

/-- 2.1 **The directed matrix-tree theorem** (Tutte). Over any commutative ring, the principal
minor of the out-degree Laplacian obtained by deleting the row and the column of `r` is the
weighted sum of the spanning arborescences converging to `r`. -/
theorem det_submatrix_outLaplacian {R : Type*} [CommRing R] (w : V → V → R) (r : V) :
    ((outLaplacian w).submatrix (fun v : {v // v ≠ r} => (v : V))
      (fun v : {v // v ≠ r} => (v : V))).det = arborescenceSum w r := by
  sorry

/-- 2.2 **All first cofactors.** Over any commutative ring, the adjugate of the out-degree
Laplacian has every entry of its column `j` equal to the arborescence sum at `j`. -/
theorem adjugate_outLaplacian {R : Type*} [CommRing R] (w : V → V → R) :
    (outLaplacian w).adjugate = Matrix.of fun _ j => arborescenceSum w j := by
  sorry

/-! ## Layer 3: the Markov chain tree theorem -/

/-- 3.1 **The Markov chain tree theorem.** For an irreducible row-stochastic matrix `P` on a
nonempty finite state space, a vector is a stationary probability vector if and only if it is the
vector of arborescence sums of `P`, normalized to total mass one. -/
theorem stationary_iff_eq_arborescenceSum_div [Nonempty V] {P : Matrix V V ℝ}
    (hP : P ∈ Matrix.rowStochastic ℝ V) (hirr : P.IsIrreducible) (π : V → ℝ) :
    ((∀ v, 0 ≤ π v) ∧ ∑ v, π v = 1 ∧ Matrix.vecMul π P = π) ↔
      π = fun v => arborescenceSum (fun a b => P a b) v /
        ∑ u, arborescenceSum (fun a b => P a b) u := by
  sorry

/-! ## Layer 4: Eulerian digraphs -/

section Arrows

variable (Q : V → V → Type*) [∀ u v, Fintype (Q u v)]

/-- 4.1 The out-degree of `v`: the number of arrows with source `v`, loops included. -/
def outDegree (v : V) : ℕ :=
  Fintype.card (Σ u, Q v u)

/-- 4.1 The in-degree of `v`: the number of arrows with target `v`, loops included. -/
def inDegree (v : V) : ℕ :=
  Fintype.card (Σ u, Q u v)

variable {Q} in
/-- 4.1 An Eulerian circuit: a closed walk along `Q` that traverses every arrow exactly once. -/
def IsEulerianCircuit {s : V} (c : TauCeti.ArrowWalk Q s s) : Prop :=
  c.arrows.Nodup ∧ ∀ e : Σ x y, Q x y, e ∈ c.arrows

/-- 4.2 **Euler's theorem for digraphs** (Good). On a nonempty finite vertex type, a finite arrow
family has an Eulerian circuit if and only if every in-degree equals the out-degree and any two
vertices of positive out-degree are joined by a zigzag of arrows. -/
theorem exists_isEulerianCircuit_iff [Nonempty V] :
    (∃ s, ∃ c : TauCeti.ArrowWalk Q s s, IsEulerianCircuit c) ↔
      (∀ v, inDegree Q v = outDegree Q v) ∧
        ∀ u v, 0 < outDegree Q u → 0 < outDegree Q v →
          Relation.ReflTransGen (fun a b => Nonempty (Q a b) ∨ Nonempty (Q b a)) u v := by
  sorry

/-! ## Layer 5: the BEST theorem and de Bruijn sequences -/

/-- 5.1 **The BEST theorem** (van Aardenne-Ehrenfest and de Bruijn). If every in-degree equals
the out-degree and every vertex has positive out-degree, the number of Eulerian circuits whose
first arrow is a given arrow `e` out of `s` is the number of spanning arborescences converging to
`s` times the product of `(outdeg v − 1)!` over all vertices. -/
theorem card_isEulerianCircuit_head_eq (hbal : ∀ v, inDegree Q v = outDegree Q v)
    (hpos : ∀ v, 0 < outDegree Q v) {s t : V} (e : Q s t) :
    Nat.card {c : TauCeti.ArrowWalk Q s s //
        IsEulerianCircuit c ∧ c.arrows.head? = some ⟨s, t, e⟩} =
      arborescenceSum (fun a b => Fintype.card (Q a b)) s *
        ∏ v, (outDegree Q v - 1).factorial := by
  sorry

end Arrows

/-- 5.2 A de Bruijn sequence of order `n` on `k` letters: a word of length `kⁿ` in which every
word of length `n` occurs exactly once as a cyclic factor. -/
def IsDeBruijn (k n : ℕ) (s : Fin (k ^ n) → Fin k) : Prop :=
  ∀ u : Fin n → Fin k, ∃! i : Fin (k ^ n),
    ∀ j : Fin n, s ⟨((i : ℕ) + j) % k ^ n, Nat.mod_lt _ i.pos⟩ = u j

/-- 5.2 **The number of de Bruijn sequences** (van Aardenne-Ehrenfest and de Bruijn). For `n ≥ 1`
there are `(k!)^(k^(n − 1))` de Bruijn sequences of order `n` on `k` letters. -/
theorem card_isDeBruijn (k n : ℕ) (hn : 1 ≤ n) :
    Nat.card {s : Fin (k ^ n) → Fin k // IsDeBruijn k n s} = k.factorial ^ k ^ (n - 1) := by
  sorry

end TauCetiRoadmap.DirectedMatrixTreeAndBEST
