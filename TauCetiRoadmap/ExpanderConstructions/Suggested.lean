import Mathlib

/-!
# Expander constructions: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

A regular multigraph with loops on a finite vertex type `V`, with its edges at each vertex
labelled by a finite port type `P`, is given by its rotation map, an involution
`R : V × P → V × P`: `R (v, i) = (w, j)` says that the `i`-th edge at `v` leads to `w` and is the
`j`-th edge at `w`. The degree is `Fintype.card P`. Involutivity is a hypothesis of the theorems,
not part of the data, so that the products below are plain functions. The spectral parameter
`secondEigenvalue R` is the largest value of `|xᵀ M x|` over real vectors `x` with coordinate sum
`0` and `xᵀ x ≤ 1`, where `M` is the adjacency count matrix divided by the degree.
-/

noncomputable section

open Finset Matrix

namespace TauCetiRoadmap.ExpanderConstructions

universe u

variable {V P W Q : Type*} [Fintype V] [DecidableEq V] [Fintype P] [Fintype W] [DecidableEq W]
  [Fintype Q]

/-! ## Layer 1: rotation maps and the spectral parameter -/

/-- 1.1 The number of edges from `v` to `w`: the number of ports `i` at `v` with
`(R (v, i)).1 = w`. A port fixed by `R` is a half-loop and counts once on the diagonal; two ports
at `v` exchanged by `R` form a loop and count twice. -/
def adjCount (R : V × P → V × P) (v w : V) : ℕ :=
  #{i : P | (R (v, i)).1 = w}

/-- 1.1 The normalized adjacency matrix: the adjacency counts divided by the degree
`Fintype.card P` (the zero matrix when there are no ports). -/
def normAdj (R : V × P → V × P) : Matrix V V ℝ :=
  fun v w => (adjCount R v w : ℝ) / Fintype.card P

/-- 1.1 Every symmetric matrix of natural numbers whose rows all sum to `Fintype.card P` is the
adjacency count matrix of an involutive rotation map with ports `P`. -/
theorem exists_involutive_adjCount_eq (A : Matrix V V ℕ) (hA : A.IsSymm)
    (hrow : ∀ v, ∑ w, A v w = Fintype.card P) :
    ∃ R : V × P → V × P, Function.Involutive R ∧ ∀ v w, adjCount R v w = A v w := by
  sorry

/-- 1.2 The spectral parameter `λ(R)`: the supremum of `|xᵀ M x|` over vectors `x` with
coordinate sum `0` and `xᵀ x ≤ 1`, for `M = normAdj R`. For an involutive `R` on at least two
vertices this is the largest absolute value of an eigenvalue of `M` on the orthogonal complement
of the constant vectors; on at most one vertex it is `0`. -/
def secondEigenvalue (R : V × P → V × P) : ℝ :=
  sSup {r : ℝ | ∃ x : V → ℝ, ∑ v, x v = 0 ∧ x ⬝ᵥ x ≤ 1 ∧ r = |x ⬝ᵥ (normAdj R *ᵥ x)|}

/-- 1.3 For a rotation map whose adjacency counts are the adjacency matrix of a simple graph `G`
on at least two vertices, the degree times `λ(R)` is the larger of `|λ₂|` and `|λₙ|`, the second
largest and the smallest adjacency eigenvalues of `G` in Mathlib's nonincreasing order. -/
theorem card_mul_secondEigenvalue_eq (G : SimpleGraph V) [DecidableRel G.Adj]
    (R : V × P → V × P) (hA : ∀ v w, (adjCount R v w : ℝ) = G.adjMatrix ℝ v w)
    (hn : 2 ≤ Fintype.card V) :
    (Fintype.card P : ℝ) * secondEigenvalue R =
      max |(G.isHermitian_adjMatrix ℝ).eigenvalues₀ ⟨1, hn⟩|
        |(G.isHermitian_adjMatrix ℝ).eigenvalues₀ ⟨Fintype.card V - 1, by omega⟩| := by
  sorry

/-! ## Layer 2: powers and tensor products -/

/-- 2.1 The rotation map of the `t`-th power: from `v`, follow the ports `k 0, k 1, …` for `t`
steps; the output is the end vertex together with the arrival ports listed in reverse order. -/
def rotationPower (R : V × P → V × P) : (t : ℕ) → V × (Fin t → P) → V × (Fin t → P)
  | 0, x => x
  | t + 1, x =>
      let y := R (x.1, x.2 0)
      let z := rotationPower R t (y.1, Fin.tail x.2)
      (z.1, Fin.snoc (α := fun _ => P) z.2 y.2)

/-- 2.1 For an involutive rotation map and `t ≥ 1`, `λ(Rᵗ) = λ(R)ᵗ`. -/
theorem secondEigenvalue_rotationPower {R : V × P → V × P} (hR : Function.Involutive R)
    {t : ℕ} (ht : 0 < t) :
    secondEigenvalue (rotationPower R t) = secondEigenvalue R ^ t := by
  sorry

/-- 2.2 The rotation map of the tensor product: both coordinates move at once. -/
def rotationTensor (R : V × P → V × P) (S : W × Q → W × Q) :
    (V × W) × (P × Q) → (V × W) × (P × Q) :=
  fun x =>
    let a := R (x.1.1, x.2.1)
    let b := S (x.1.2, x.2.2)
    ((a.1, b.1), (a.2, b.2))

/-- 2.2 For involutive rotation maps with nonempty vertex and port types,
`λ(R ⊗ S) = max (λ(R), λ(S))`. -/
theorem secondEigenvalue_rotationTensor [Nonempty V] [Nonempty W] [Nonempty P] [Nonempty Q]
    {R : V × P → V × P} {S : W × Q → W × Q} (hR : Function.Involutive R)
    (hS : Function.Involutive S) :
    secondEigenvalue (rotationTensor R S) = max (secondEigenvalue R) (secondEigenvalue S) := by
  sorry

/-! ## Layer 3: the zig-zag and replacement products -/

/-- 3.1 The zig-zag product of `R` (vertices `V`, ports `P`) and `S` (vertices `P`, ports `Q`):
a step inside the cloud of `v`, the step of `R` between clouds, and a second step inside the new
cloud; the output ports are the two inner ports in reverse order. -/
def zigZag (R : V × P → V × P) (S : P × Q → P × Q) :
    (V × P) × (Q × Q) → (V × P) × (Q × Q) :=
  fun x =>
    let a := S (x.1.2, x.2.1)
    let b := R (x.1.1, a.1)
    let c := S (b.2, x.2.2)
    ((b.1, c.1), (c.2, a.2))

/-- 3.1 The function `f(a, b) = (1 - b²) a / 2 + √((1 - b²)² a² + 4 b²) / 2` of the zig-zag
theorem. -/
def zigZagBound (a b : ℝ) : ℝ :=
  (1 - b ^ 2) * a / 2 + Real.sqrt ((1 - b ^ 2) ^ 2 * a ^ 2 + 4 * b ^ 2) / 2

/-- 3.1 The zig-zag theorem: for involutive `R` and `S` with `a = λ(R)` and `b = λ(S)`,
`λ(R ⓩ S) ≤ f(a, b)`, `λ(R ⓩ S) ≤ a + b` and `λ(R ⓩ S) ≤ 1 - (1 - b²)(1 - a)/2`. -/
theorem secondEigenvalue_zigZag_le [DecidableEq P] {R : V × P → V × P} {S : P × Q → P × Q}
    (hR : Function.Involutive R) (hS : Function.Involutive S) :
    secondEigenvalue (zigZag R S) ≤ zigZagBound (secondEigenvalue R) (secondEigenvalue S) ∧
      secondEigenvalue (zigZag R S) ≤ secondEigenvalue R + secondEigenvalue S ∧
      secondEigenvalue (zigZag R S) ≤
        1 - (1 - secondEigenvalue S ^ 2) * (1 - secondEigenvalue R) / 2 := by
  sorry

/-- 3.2 The replacement product: the ports `some i` follow `S` inside the cloud, and the port
`none` follows `R` between clouds. -/
def replacement (R : V × P → V × P) (S : P × Q → P × Q) :
    (V × P) × Option Q → (V × P) × Option Q
  | (x, some i) => let a := S (x.2, i); ((x.1, a.1), some a.2)
  | (x, none) => (R x, none)

/-- 3.2 For involutive `R` and `S`, with `D = Fintype.card Q` and `p = D² / (D + 1)³`,
`λ(R ⓡ S)³ ≤ p f(λ(R), λ(S)) + (1 - p)`. -/
theorem secondEigenvalue_replacement_pow_three_le [DecidableEq P] {R : V × P → V × P}
    {S : P × Q → P × Q}
    (hR : Function.Involutive R) (hS : Function.Involutive S) :
    secondEigenvalue (replacement R S) ^ 3 ≤
      (Fintype.card Q : ℝ) ^ 2 / ((Fintype.card Q : ℝ) + 1) ^ 3 *
          zigZagBound (secondEigenvalue R) (secondEigenvalue S) +
        (1 - (Fintype.card Q : ℝ) ^ 2 / ((Fintype.card Q : ℝ) + 1) ^ 3) := by
  sorry

/-! ## Layer 4: an explicit family of expanders -/

/-- 4.1 Relabel the ports of a rotation map along an equivalence `e : P ≃ P'`. -/
def relabelPorts {P' : Type*} (e : P ≃ P') (R : V × P → V × P) : V × P' → V × P' :=
  fun x =>
    let y := R (x.1, e.symm x.2)
    (y.1, e y.2)

/-- 4.1 The vertex types of the family: `W, W × W, (W × W) × W, …`. -/
def zigZagFamilyVertex (W : Type u) : ℕ → Type u
  | 0 => W
  | n + 1 => zigZagFamilyVertex W n × W

/-- 4.1 The vertex types of the family are finite. -/
instance instFintypeZigZagFamilyVertex (W : Type u) [Fintype W] :
    ∀ n, Fintype (zigZagFamilyVertex W n)
  | 0 => inferInstanceAs (Fintype W)
  | n + 1 =>
    letI := instFintypeZigZagFamilyVertex W n
    inferInstanceAs (Fintype (zigZagFamilyVertex W n × W))

/-- 4.1 The vertex types of the family have decidable equality. -/
instance instDecidableEqZigZagFamilyVertex (W : Type u) [DecidableEq W] :
    ∀ n, DecidableEq (zigZagFamilyVertex W n)
  | 0 => inferInstanceAs (DecidableEq W)
  | n + 1 =>
    letI := instDecidableEqZigZagFamilyVertex W n
    inferInstanceAs (DecidableEq (zigZagFamilyVertex W n × W))

/-- 4.1 The family `G₀ = H²`, `G_(n+1) = G_n² ⓩ H` of Reingold, Vadhan and Wigderson: the ports
of `G_n²` are identified with the vertices of `H` along `e`, and those of `H²` with `Q × Q`. -/
def zigZagFamily {W Q : Type u} (H : W × Q → W × Q) (e : (Fin 2 → Q × Q) ≃ W) :
    (n : ℕ) → zigZagFamilyVertex W n × (Q × Q) → zigZagFamilyVertex W n × (Q × Q)
  | 0 => relabelPorts (piFinTwoEquiv fun _ => Q) (rotationPower H 2)
  | n + 1 => zigZag (relabelPorts e (rotationPower (zigZagFamily H e n) 2)) H

/-- 4.1 If `H` is an involutive rotation map with `λ(H) ≤ 1/4` and `e` identifies the ports of a
square with the vertices of `H`, then every member of the family is an involutive rotation map
of degree `(Fintype.card Q)²` on `(Fintype.card W)^(n+1)` vertices with `λ ≤ 1/2`. -/
theorem zigZagFamily_spec {W Q : Type u} [Fintype W] [DecidableEq W] [Fintype Q]
    (H : W × Q → W × Q) (hH : Function.Involutive H)
    (e : (Fin 2 → Q × Q) ≃ W) (hHquarter : secondEigenvalue H ≤ 1 / 4) (n : ℕ) :
    Function.Involutive (zigZagFamily H e n) ∧
      Fintype.card (zigZagFamilyVertex W n) = Fintype.card W ^ (n + 1) ∧
      secondEigenvalue (zigZagFamily H e n) ≤ 1 / 2 := by
  sorry

end TauCetiRoadmap.ExpanderConstructions
