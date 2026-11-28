import Mathlib
import TauCeti.InformationTheory.Coding.Basic

/-!
# Expander codes: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

A `D`-regular bipartite multigraph with left vertices `U`, right vertices `V` and `D` ports `P`
at every vertex is given by a map `R : V × P → U × P`, bijective in the theorems: the edge at
port `j` of the right vertex `v` is `R (v, j) = (u, i)`, the edge at port `i` of the left vertex
`u`. The edges are the elements of `U × P`, and a word of the Tanner code is a function
`U × P → F`. The biadjacency matrix counts edges, and the spectral parameter is its second
singular value, Mathlib's `LinearMap.singularValues` at index `1`. The double cover of a rotation
map `R : V × P → V × P` (an involution) is `R` itself, read as such a map. Weights are Mathlib's
`hammingNorm`; distance bounds are stated for every nonzero word, so that no statement depends on
the minimum-distance convention for the zero code. Bounds are multiplied out, so that they hold
also for empty port or vertex types.

The definitions of SpectralGraphBounds 1.1 (`adjEigenvalues`) and of ExpanderConstructions 1.1,
1.2, 2.1, 3.1 and 4.1 (rotation maps and the explicit family) are copied verbatim.
-/

noncomputable section

open Finset Matrix

namespace TauCetiRoadmap.ExpanderCodes

universe u

section CopiedSpectralGraphBounds

variable {V : Type*} [Fintype V] [DecidableEq V]

/-- 1.3 (copied verbatim from SpectralGraphBounds 1.1): the adjacency eigenvalues of `G`, with
multiplicity, in nonincreasing order: index `0` carries the largest one. -/
def adjEigenvalues (G : SimpleGraph V) [DecidableRel G.Adj] : Fin (Fintype.card V) → ℝ :=
  (G.isHermitian_adjMatrix ℝ).eigenvalues₀

end CopiedSpectralGraphBounds

section CopiedExpanderConstructions

variable {V P W Q : Type*} [Fintype V] [DecidableEq V] [Fintype P] [Fintype W] [DecidableEq W]
  [Fintype Q]

/-- 1.4 (copied verbatim from ExpanderConstructions 1.1): the number of edges from `v` to `w`:
the number of ports `i` at `v` with `(R (v, i)).1 = w`. A port fixed by `R` is a half-loop and
counts once on the diagonal; two ports at `v` exchanged by `R` form a loop and count twice. -/
def adjCount (R : V × P → V × P) (v w : V) : ℕ :=
  #{i : P | (R (v, i)).1 = w}

/-- 1.4 (copied verbatim from ExpanderConstructions 1.1): the normalized adjacency matrix: the
adjacency counts divided by the degree `Fintype.card P` (the zero matrix when there are no
ports). -/
def normAdj (R : V × P → V × P) : Matrix V V ℝ :=
  fun v w => (adjCount R v w : ℝ) / Fintype.card P

/-- 1.4 (copied verbatim from ExpanderConstructions 1.2): the spectral parameter `λ(R)`: the
supremum of `|xᵀ M x|` over vectors `x` with coordinate sum `0` and `xᵀ x ≤ 1`, for
`M = normAdj R`. For an involutive `R` on at least two vertices this is the largest absolute
value of an eigenvalue of `M` on the orthogonal complement of the constant vectors; on at most
one vertex it is `0`. -/
def secondEigenvalue (R : V × P → V × P) : ℝ :=
  sSup {r : ℝ | ∃ x : V → ℝ, ∑ v, x v = 0 ∧ x ⬝ᵥ x ≤ 1 ∧ r = |x ⬝ᵥ (normAdj R *ᵥ x)|}

/-- 4.1 (copied verbatim from ExpanderConstructions 2.1): the rotation map of the `t`-th power:
from `v`, follow the ports `k 0, k 1, …` for `t` steps; the output is the end vertex together
with the arrival ports listed in reverse order. -/
def rotationPower (R : V × P → V × P) : (t : ℕ) → V × (Fin t → P) → V × (Fin t → P)
  | 0, x => x
  | t + 1, x =>
      let y := R (x.1, x.2 0)
      let z := rotationPower R t (y.1, Fin.tail x.2)
      (z.1, Fin.snoc (α := fun _ => P) z.2 y.2)

/-- 4.1 (copied verbatim from ExpanderConstructions 3.1): the zig-zag product of `R` (vertices
`V`, ports `P`) and `S` (vertices `P`, ports `Q`): a step inside the cloud of `v`, the step of `R`
between clouds, and a second step inside the new cloud; the output ports are the two inner ports
in reverse order. -/
def zigZag (R : V × P → V × P) (S : P × Q → P × Q) :
    (V × P) × (Q × Q) → (V × P) × (Q × Q) :=
  fun x =>
    let a := S (x.1.2, x.2.1)
    let b := R (x.1.1, a.1)
    let c := S (b.2, x.2.2)
    ((b.1, c.1), (c.2, a.2))

/-- 4.1 (copied verbatim from ExpanderConstructions 4.1): relabel the ports of a rotation map
along an equivalence `e : P ≃ P'`. -/
def relabelPorts {P' : Type*} (e : P ≃ P') (R : V × P → V × P) : V × P' → V × P' :=
  fun x =>
    let y := R (x.1, e.symm x.2)
    (y.1, e y.2)

/-- 4.1 (copied verbatim from ExpanderConstructions 4.1): the vertex types of the family:
`W, W × W, (W × W) × W, …`. -/
def zigZagFamilyVertex (W : Type u) : ℕ → Type u
  | 0 => W
  | n + 1 => zigZagFamilyVertex W n × W

/-- 4.1 (copied verbatim from ExpanderConstructions 4.1): the vertex types of the family are
finite. -/
instance instFintypeZigZagFamilyVertex (W : Type u) [Fintype W] :
    ∀ n, Fintype (zigZagFamilyVertex W n)
  | 0 => inferInstanceAs (Fintype W)
  | n + 1 =>
    letI := instFintypeZigZagFamilyVertex W n
    inferInstanceAs (Fintype (zigZagFamilyVertex W n × W))

/-- 4.1 (copied verbatim from ExpanderConstructions 4.1): the vertex types of the family have
decidable equality. -/
instance instDecidableEqZigZagFamilyVertex (W : Type u) [DecidableEq W] :
    ∀ n, DecidableEq (zigZagFamilyVertex W n)
  | 0 => inferInstanceAs (DecidableEq W)
  | n + 1 =>
    letI := instDecidableEqZigZagFamilyVertex W n
    inferInstanceAs (DecidableEq (zigZagFamilyVertex W n × W))

/-- 4.1 (copied verbatim from ExpanderConstructions 4.1): the family `G₀ = H²`,
`G_(n+1) = G_n² ⓩ H` of Reingold, Vadhan and Wigderson: the ports of `G_n²` are identified with
the vertices of `H` along `e`, and those of `H²` with `Q × Q`. -/
def zigZagFamily {W Q : Type u} (H : W × Q → W × Q) (e : (Fin 2 → Q × Q) ≃ W) :
    (n : ℕ) → zigZagFamilyVertex W n × (Q × Q) → zigZagFamilyVertex W n × (Q × Q)
  | 0 => relabelPorts (piFinTwoEquiv fun _ => Q) (rotationPower H 2)
  | n + 1 => zigZag (relabelPorts e (rotationPower (zigZagFamily H e n) 2)) H

end CopiedExpanderConstructions

variable {U V P : Type*} [Fintype U] [DecidableEq U] [Fintype V] [DecidableEq V] [Fintype P]

/-! ## Layer 1: bipartite multigraphs and the bipartite expander mixing lemma -/

/-- 1.1 The biadjacency matrix of `R : V × P → U × P`: the entry at `(u, v)` is the number of
ports `j` of `v` whose edge `R (v, j)` has left end `u`. -/
def biadjMatrix (R : V × P → U × P) : Matrix U V ℝ :=
  fun u v => (#{j : P | (R (v, j)).1 = u} : ℝ)

/-- 1.1 The spectral parameter of `R`: the second singular value of its biadjacency matrix
(Mathlib's singular values are indexed from `0`). -/
def secondSingularValue (R : V × P → U × P) : ℝ :=
  (Matrix.toEuclideanLin (biadjMatrix R)).singularValues 1

/-- 1.2 The bipartite expander mixing lemma. For a bijective `R` with `D` ports, `n` left
vertices and second singular value `σ₂`, the number `e(S, T)` of edges with left end in `S` and
right end in `T` satisfies `|e(S, T) - D |S| |T| / n| ≤ σ₂ √(|S| |T|)`. -/
theorem abs_card_edges_sub_le (R : V × P → U × P) (hR : Function.Bijective R) (S : Finset U)
    (T : Finset V) :
    |(#{p : V × P | (R p).1 ∈ S ∧ p.1 ∈ T} : ℝ) - Fintype.card P * #S * #T / Fintype.card U| ≤
      secondSingularValue R * Real.sqrt (#S * #T) := by
  sorry

/-- 1.3 For a simple graph on `U ⊕ V` with no edge inside `U` or inside `V`, whose edges between
the two sides are counted by `biadjMatrix R`, and with at least two left vertices, the second
singular value of `R` is the second largest adjacency eigenvalue of the graph. -/
theorem secondSingularValue_eq_adjEigenvalues (G : SimpleGraph (U ⊕ V)) [DecidableRel G.Adj]
    (R : V × P → U × P) (hU : ∀ a b, ¬ G.Adj (Sum.inl a) (Sum.inl b))
    (hV : ∀ a b, ¬ G.Adj (Sum.inr a) (Sum.inr b))
    (hB : ∀ u v, biadjMatrix R u v = G.adjMatrix ℝ (Sum.inl u) (Sum.inr v))
    (hn : 2 ≤ Fintype.card U) :
    secondSingularValue R =
      adjEigenvalues G ⟨1, by rw [Fintype.card_sum]; omega⟩ := by
  sorry

/-- 1.4 The double cover of an involutive rotation map `R` with `D` ports: its second singular
value is `D λ(R)`, the degree times the spectral parameter of ExpanderConstructions. -/
theorem secondSingularValue_eq_card_mul_secondEigenvalue (R : V × P → V × P)
    (hR : Function.Involutive R) :
    secondSingularValue R = Fintype.card P * secondEigenvalue R := by
  sorry

/-! ## Layer 2: Tanner codes and their rate -/

/-- 2.1 The Tanner code of `R` with inner code `C₀`: the words `x : U × P → F` on the edges such
that, at every left vertex `u` and at every right vertex `v`, the word read along the ports,
`i ↦ x (u, i)` and `j ↦ x (R (v, j))`, lies in `C₀`. -/
def tannerCode {F : Type*} [Field F] (R : V × P → U × P) (C₀ : TauCeti.LinearCode F P) :
    TauCeti.LinearCode F (U × P) :=
  (⨅ u : U, C₀.comap (LinearMap.funLeft F F fun i : P => (u, i))) ⊓
    ⨅ v : V, C₀.comap (LinearMap.funLeft F F fun j : P => R (v, j))

omit [DecidableEq U] [Fintype V] [DecidableEq V] in
/-- 2.2 The rate bound: for bijective `R` on `n` left vertices with `D` ports and an inner code of
dimension `k₀`, the Tanner code has dimension at least `2 k₀ n - D n`, so rate at least
`2 r₀ - 1`. -/
theorem two_mul_finrank_mul_card_le {F : Type*} [Field F] (R : V × P → U × P)
    (hR : Function.Bijective R) (C₀ : TauCeti.LinearCode F P) :
    2 * Module.finrank F C₀ * Fintype.card U ≤
      Module.finrank F (tannerCode R C₀) + Fintype.card P * Fintype.card U := by
  sorry

/-! ## Layer 3: the distance bound and the edge-set lemma -/

/-- 3.1 The distance bound: let `R` be bijective with `D` ports and `n` left vertices, let every
nonzero word of `C₀` have weight at least `δ₀ D` with `δ₀ ≥ 0`, and let `σ₂ ≤ ε D`. Then every
nonzero word of the Tanner code has weight at least `δ₀ (δ₀ - ε) D n`. -/
theorem mul_le_hammingNorm_of_mem_tannerCode {F : Type*} [Field F] [DecidableEq F]
    (R : V × P → U × P) (hR : Function.Bijective R) (C₀ : TauCeti.LinearCode F P) {δ₀ ε : ℝ}
    (hδ₀ : 0 ≤ δ₀) (hC₀ : ∀ c ∈ C₀, c ≠ 0 → δ₀ * Fintype.card P ≤ hammingNorm c)
    (hσ : secondSingularValue R ≤ ε * Fintype.card P) {x : U × P → F}
    (hx : x ∈ tannerCode R C₀) (hx0 : x ≠ 0) :
    δ₀ * (δ₀ - ε) * Fintype.card P * Fintype.card U ≤ hammingNorm x := by
  sorry

/-- 3.2 The edge-set lemma behind decoding: let `R` be bijective with `D ≥ 1` ports and `n` left
vertices, let `δ₀ > 0`, `σ₂ ≤ ε D` and `ε ≤ δ₀ / 3`. For a set `F` of edges, let `S` be the set of
left ends of edges of `F` and `T` the set of right vertices with at least `δ₀ D / 2` of their
ports on edges of `F`. If `|S| ≤ δ₀ n / 9`, then `|T| ≤ (3/4) |S|`. -/
theorem card_le_of_card_image_fst_le [DecidableEq P] [Nonempty P] (R : V × P → U × P)
    (hR : Function.Bijective R) {δ₀ ε : ℝ} (hδ₀ : 0 < δ₀)
    (hσ : secondSingularValue R ≤ ε * Fintype.card P) (hε : ε ≤ δ₀ / 3) (F : Finset (U × P))
    (hS : (#(F.image Prod.fst) : ℝ) ≤ δ₀ * Fintype.card U / 9) :
    (#{v : V | δ₀ * Fintype.card P / 2 ≤ (#{j : P | R (v, j) ∈ F} : ℝ)} : ℝ) ≤
      3 / 4 * #(F.image Prod.fst) := by
  sorry

/-! ## Layer 4: codes on the zig-zag family -/

/-- 4.1 Tanner codes on the double covers of the zig-zag family of ExpanderConstructions 4.1: for
a base graph `H` with `λ(H) ≤ 1/4` and an inner code `C₀` on the `D = |Q|²` ports whose nonzero
words have weight at least `δ₀ D`, the `n`-th code has length `D N` with `N = |W|^(n+1)`,
dimension at least `2 k₀ N - D N`, and every nonzero word has weight at least
`δ₀ (δ₀ - 1/2) D N`. -/
theorem tannerCode_zigZagFamily {W Q : Type u} [Fintype W] [DecidableEq W] [Fintype Q]
    (H : W × Q → W × Q) (hH : Function.Involutive H) (e : (Fin 2 → Q × Q) ≃ W)
    (hHquarter : secondEigenvalue H ≤ 1 / 4) {F : Type*} [Field F] [DecidableEq F]
    (C₀ : TauCeti.LinearCode F (Q × Q)) {δ₀ : ℝ} (hδ₀ : 0 ≤ δ₀)
    (hC₀ : ∀ c ∈ C₀, c ≠ 0 → δ₀ * Fintype.card (Q × Q) ≤ hammingNorm c) (n : ℕ) :
    2 * Module.finrank F C₀ * Fintype.card W ^ (n + 1) ≤
        Module.finrank F (tannerCode (zigZagFamily H e n) C₀) +
          Fintype.card (Q × Q) * Fintype.card W ^ (n + 1) ∧
      ∀ x ∈ tannerCode (zigZagFamily H e n) C₀, x ≠ 0 →
        δ₀ * (δ₀ - 1 / 2) * Fintype.card (Q × Q) * Fintype.card W ^ (n + 1) ≤ hammingNorm x := by
  sorry

end TauCetiRoadmap.ExpanderCodes
