import Mathlib

/-!
# Association schemes: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's API lists, routes and Checks are not
restated.

A symmetric association scheme with `d` classes on a finite type `X` is given by its class
function `rel : X → X → Fin (d + 1)`; class `0` is the diagonal, every class is symmetric and
nonempty, and the number of `z` with `rel x z = i` and `rel z y = j` depends only on `rel x y`.
Matrices are real. A family of primitive idempotents is any complete family of nonzero orthogonal
idempotents of the Bose–Mesner algebra whose member of index `0` is `J / |X|`; the eigenmatrices
`P` and `Q` and the Krein parameters are defined from such a family by explicit formulas, and the
theorems hold for every such family. Quantities that the literature defines as a common value
(valencies, intersection numbers, the value of an idempotent on a class) are defined here as
averages, which equal that common value on a scheme.
-/

noncomputable section

open Finset Matrix

namespace TauCetiRoadmap.AssociationSchemes

variable {X : Type*} [Fintype X] [DecidableEq X] {d : ℕ}

/-! ## Layer 1: schemes and the Bose–Mesner algebra -/

/-- 1.1 A symmetric association scheme with `d` classes, given by its class function: class `0`
is the diagonal, every class is symmetric and nonempty, and for all `i`, `j` the number of `z`
with `rel x z = i` and `rel z y = j` depends only on the class of `(x, y)`. -/
structure IsAssocScheme (rel : X → X → Fin (d + 1)) : Prop where
  rel_eq_zero_iff : ∀ x y, rel x y = 0 ↔ x = y
  rel_comm : ∀ x y, rel x y = rel y x
  exists_rel_eq : ∀ i, ∃ x y, rel x y = i
  card_eq : ∀ i j x y x' y', rel x y = rel x' y' →
    #{z | rel x z = i ∧ rel z y = j} = #{z | rel x' z = i ∧ rel z y' = j}

/-- 1.1 The adjacency matrix `A_i` of class `i`: the real `0/1` matrix of the relation
`rel x y = i`. -/
def adjMat (rel : X → X → Fin (d + 1)) (i : Fin (d + 1)) : Matrix X X ℝ :=
  Matrix.of fun x y => if rel x y = i then 1 else 0

/-- 1.1 The Bose–Mesner algebra: the real span of the adjacency matrices of the classes. -/
def bmAlgebra (rel : X → X → Fin (d + 1)) : Submodule ℝ (Matrix X X ℝ) :=
  Submodule.span ℝ (Set.range (adjMat rel))

/-- 1.1 The valency `v_i` of class `i`: the number of ordered pairs in class `i` divided by
`|X|`. On a scheme it is the number of `y` with `rel x y = i`, for every `x`. -/
def valency (rel : X → X → Fin (d + 1)) (i : Fin (d + 1)) : ℝ :=
  (#{p : X × X | rel p.1 p.2 = i} : ℝ) / Fintype.card X

/-- 1.2 A family of primitive idempotents of the scheme: a complete family of orthogonal
idempotents, all nonzero and all in the Bose–Mesner algebra, the one of index `0` being
`J / |X|`. -/
structure IsPrimitiveIdempotents (rel : X → X → Fin (d + 1))
    (E : Fin (d + 1) → Matrix X X ℝ) : Prop where
  complete : CompleteOrthogonalIdempotents E
  ne_zero : ∀ i, E i ≠ 0
  mem_bmAlgebra : ∀ i, E i ∈ bmAlgebra rel
  eq_zero : E 0 = (Fintype.card X : ℝ)⁻¹ • Matrix.of fun _ _ => 1

/-- 1.2 The Bose–Mesner algebra of a symmetric association scheme with `d` classes has a family
of `d + 1` primitive idempotents, the first being `J / |X|`. -/
theorem exists_isPrimitiveIdempotents {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel) :
    ∃ E, IsPrimitiveIdempotents rel E := by
  sorry

/-! ## Layer 2: the eigenmatrices -/

/-- 2.1 The first eigenmatrix `P`: `P i j = tr (A_j E_i) / tr E_i`, the eigenvalue of `A_j` on
the column space of `E_i`. -/
def eigenmatrix (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ) :
    Matrix (Fin (d + 1)) (Fin (d + 1)) ℝ :=
  Matrix.of fun i j => (adjMat rel j * E i).trace / (E i).trace

/-- 2.1 The second eigenmatrix `Q`: `Q i j = (∑_(x, y) (A_i)_(xy) (E_j)_(xy)) / v_i`, which is
`|X|` times the common value of `E_j` on the pairs of class `i`. -/
def dualEigenmatrix (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ) :
    Matrix (Fin (d + 1)) (Fin (d + 1)) ℝ :=
  Matrix.of fun i j => (∑ x, ∑ y, adjMat rel i x y * E j x y) / valency rel i

/-- 2.1 The two expansions: `A_j = ∑_i P_(ij) E_i` and `E_j = |X|⁻¹ ∑_i Q_(ij) A_i`. -/
theorem adjMat_eq_sum_and_eq_sum_adjMat {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E) (j : Fin (d + 1)) :
    adjMat rel j = ∑ i, eigenmatrix rel E i j • E i ∧
      E j = (Fintype.card X : ℝ)⁻¹ • ∑ i, dualEigenmatrix rel E i j • adjMat rel i := by
  sorry

/-- 2.2 `P Q = Q P = |X| I`, and the orthogonality relations
`∑_i m_i P_(ij) P_(ik) = |X| v_j δ_(jk)` with the multiplicities `m_i = tr E_i`. -/
theorem eigenmatrix_mul_dualEigenmatrix {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E) :
    eigenmatrix rel E * dualEigenmatrix rel E = (Fintype.card X : ℝ) • 1 ∧
      dualEigenmatrix rel E * eigenmatrix rel E = (Fintype.card X : ℝ) • 1 ∧
      ∀ j k, ∑ i, (E i).trace * eigenmatrix rel E i j * eigenmatrix rel E i k =
        if j = k then (Fintype.card X : ℝ) * valency rel j else 0 := by
  sorry

/-- 2.3 The intersection number `p^k_(ij)`: the number of triples `(x, y, z)` with `(x, y)` in
class `k`, `(x, z)` in class `i` and `(z, y)` in class `j`, divided by the number of pairs in
class `k`. On a scheme it is the common number of such `z` for each pair in class `k`. -/
def intersectionNumber (rel : X → X → Fin (d + 1)) (i j k : Fin (d + 1)) : ℝ :=
  (#{t : X × X × X | rel t.1 t.2.1 = k ∧ rel t.1 t.2.2 = i ∧ rel t.2.2 t.2.1 = j} : ℝ) /
    #{p : X × X | rel p.1 p.2 = k}

/-- 2.3 The intersection matrix `L_i`, with entries `(L_i)_(kj) = p^k_(ij)`. -/
def intersectionMatrix (rel : X → X → Fin (d + 1)) (i : Fin (d + 1)) :
    Matrix (Fin (d + 1)) (Fin (d + 1)) ℝ :=
  Matrix.of fun k j => intersectionNumber rel i j k

/-- 2.3 The characteristic polynomial of the intersection matrix `L_j` is `∏_i (t − P_(ij))`: the
eigenvalues of `L_j`, with multiplicity, are the entries of column `j` of `P`. -/
theorem charpoly_intersectionMatrix {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E) (j : Fin (d + 1)) :
    (intersectionMatrix rel j).charpoly =
      ∏ i, (Polynomial.X - Polynomial.C (eigenmatrix rel E i j)) := by
  sorry

/-! ## Layer 3: the Krein parameters -/

/-- 3.1 The Krein parameter
`q^k_(ij) = (∑_l v_l Q_(li) Q_(lj) Q_(lk)) / (|X| m_k)`, with `m_k = tr E_k`. -/
def kreinParam (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ)
    (i j k : Fin (d + 1)) : ℝ :=
  (∑ l, valency rel l * dualEigenmatrix rel E l i * dualEigenmatrix rel E l j *
      dualEigenmatrix rel E l k) / (Fintype.card X * (E k).trace)

/-- 3.1 The Krein conditions: the entrywise product of two primitive idempotents is
`|X|⁻¹ ∑_k q^k_(ij) E_k`, and every Krein parameter is nonnegative. -/
theorem hadamard_eq_sum_kreinParam {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E) (i j : Fin (d + 1)) :
    E i ⊙ E j = (Fintype.card X : ℝ)⁻¹ • ∑ k, kreinParam rel E i j k • E k ∧
      ∀ k, 0 ≤ kreinParam rel E i j k := by
  sorry

/-! ## Layer 4: the linear-programming method -/

/-- 4.1 The inner distribution of a set `Y`: `a_i` is the number of ordered pairs of `Y` in
class `i` divided by `|Y|` (and `0` when `Y` is empty). -/
def innerDistribution (rel : X → X → Fin (d + 1)) (Y : Finset X) (i : Fin (d + 1)) : ℝ :=
  (#{p ∈ Y ×ˢ Y | rel p.1 p.2 = i} : ℝ) / #Y

/-- 4.1 Delsarte's inequalities: `(a Q)_j ≥ 0` for the inner distribution `a` of every subset `Y`,
with equality exactly when `E_j` kills the characteristic vector of `Y`. -/
theorem sum_innerDistribution_mul_dualEigenmatrix_nonneg {rel : X → X → Fin (d + 1)}
    (h : IsAssocScheme rel) {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E)
    (Y : Finset X) (j : Fin (d + 1)) :
    0 ≤ ∑ i, innerDistribution rel Y i * dualEigenmatrix rel E i j ∧
      (∑ i, innerDistribution rel Y i * dualEigenmatrix rel E i j = 0 ↔
        E j *ᵥ (fun x => if x ∈ Y then 1 else 0) = 0) := by
  sorry

omit [DecidableEq X] in
/-- 4.2 Delsarte's clique–coclique bound: for a set `R` of classes, if every two distinct points
of `C` are in a class of `R` and no two distinct points of `D` are, then `|C| |D| ≤ |X|`. -/
theorem card_mul_card_le {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    (R : Finset (Fin (d + 1))) {C D : Finset X} (hC : ∀ x ∈ C, ∀ y ∈ C, x ≠ y → rel x y ∈ R)
    (hD : ∀ x ∈ D, ∀ y ∈ D, x ≠ y → rel x y ∉ R) :
    #C * #D ≤ Fintype.card X := by
  sorry

/-- 4.3 The clique bound: if `P_(ji) < 0`, a set whose distinct points are all in class `i` has
`(|C| − 1) (−P_(ji)) ≤ v_i`, that is `|C| ≤ 1 − v_i / P_(ji)`. -/
theorem card_sub_one_mul_neg_eigenmatrix_le {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E) {i j : Fin (d + 1)}
    (hneg : eigenmatrix rel E j i < 0) {C : Finset X}
    (hC : ∀ x ∈ C, ∀ y ∈ C, x ≠ y → rel x y = i) :
    ((#C : ℝ) - 1) * -eigenmatrix rel E j i ≤ valency rel i := by
  sorry

/-! ## Layer 5: the Johnson scheme and the Erdős–Ko–Rado theorem -/

/-- 5.1 The class function of the Johnson scheme `J(n, k)` on the `k`-subsets of `Fin n`: two
subsets are in class `k − |A ∩ B|`. -/
def johnsonRel (n k : ℕ) (A B : {s : Finset (Fin n) // s.card = k}) : Fin (k + 1) :=
  ⟨k - #(A.1 ∩ B.1), Nat.lt_succ_of_le (Nat.sub_le _ _)⟩

/-- 5.1 The Eberlein value
`E_i(j) = ∑_(h ≤ i) (−1)^h C(j, h) C(k − j, i − h) C(n − k − j, i − h)`. -/
def eberlein (n k i j : ℕ) : ℤ :=
  ∑ h ∈ range (i + 1),
    (-1) ^ h * ((j.choose h * (k - j).choose (i - h) * (n - k - j).choose (i - h) : ℕ) : ℤ)

/-- 5.1 The indicator of the `k`-subsets containing a set `T`. -/
def containsVec {n : ℕ} (k : ℕ) (T : Finset (Fin n)) :
    {s : Finset (Fin n) // s.card = k} → ℝ :=
  fun A => if T ⊆ A.1 then 1 else 0

/-- 5.1 For `2k ≤ n`, the Johnson scheme `J(n, k)` is a symmetric association scheme with `k`
classes, and its primitive idempotents can be ordered so that `P_(ji)` is the Eberlein value
`E_i(j)`, the ranks of `E_0 + ⋯ + E_j` are `C(n, j)`, and their column spaces are spanned by the
indicators of the `k`-subsets containing a fixed `j`-subset. -/
theorem johnson_eigenmatrix {n k : ℕ} (hn : 2 * k ≤ n) :
    IsAssocScheme (johnsonRel n k) ∧
      ∃ E, IsPrimitiveIdempotents (johnsonRel n k) E ∧
        (∀ i j : Fin (k + 1), eigenmatrix (johnsonRel n k) E j i = eberlein n k i j) ∧
        ∀ j : Fin (k + 1), ∑ l ∈ Iic j, (E l).trace = n.choose j ∧
          LinearMap.range (Matrix.toLin' (∑ l ∈ Iic j, E l)) =
            Submodule.span ℝ
              (Set.range fun T : {T : Finset (Fin n) // T.card = j} => containsVec k T.1) := by
  sorry

/-- 5.2 The Erdős–Ko–Rado theorem, uniqueness: for `2k < n`, an intersecting family of
`k`-subsets of `Fin n` with `C(n − 1, k − 1)` members consists of all `k`-subsets through one
point. -/
theorem eq_star_of_intersecting {n k : ℕ} (hn : 2 * k < n) {𝒜 : Finset (Finset (Fin n))}
    (h𝒜 : (𝒜 : Set (Finset (Fin n))).Intersecting) (hk : (𝒜 : Set (Finset (Fin n))).Sized k)
    (hcard : #𝒜 = (n - 1).choose (k - 1)) :
    ∃ a, 𝒜 = Finset.univ.filter fun A : Finset (Fin n) => A.card = k ∧ a ∈ A := by
  sorry

/-! ## Layer 6: distance-regular graphs and metric schemes -/

/-- 6.1 A scheme is metric when the graph of class `1` (two distinct points adjacent when in
class `1`) has graph distance equal to the class index; it is `P`-polynomial (in the ordering
given) when every `A_k` is a polynomial of degree `k` in `A_1`. They are equivalent. -/
theorem metric_iff_pPolynomial {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel) :
    (∀ x y, (SimpleGraph.fromRel fun x y => rel x y = 1).dist x y = rel x y) ↔
      ∃ f : Fin (d + 1) → Polynomial ℝ,
        ∀ k, (f k).natDegree = k ∧ Polynomial.aeval (adjMat rel 1) (f k) = adjMat rel k := by
  sorry

/-- 6.2 A finite graph is distance-regular when it is connected and, for vertices `x`, `y` at
distance `h`, the number `c_h` of neighbours of `y` at distance `h − 1` from `x` and the number
`b_h` of neighbours of `y` at distance `h + 1` from `x` depend only on `h`. -/
def IsDistanceRegular {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  G.Connected ∧ ∀ x y x' y' : V, G.dist x y = G.dist x' y' →
    #{z | G.Adj y z ∧ G.dist x z + 1 = G.dist x y} =
        #{z | G.Adj y' z ∧ G.dist x' z + 1 = G.dist x' y'} ∧
      #{z | G.Adj y z ∧ G.dist x z = G.dist x y + 1} =
        #{z | G.Adj y' z ∧ G.dist x' z = G.dist x' y' + 1}

/-- 6.2 The distance classes of a graph, with values in `Fin (diam + 1)` (a distance is capped at
the diameter, which changes nothing for a connected graph). -/
def distRel {V : Type*} (G : SimpleGraph V) (x y : V) : Fin (G.diam + 1) :=
  ⟨min (G.dist x y) G.diam, Nat.lt_succ_of_le (min_le_right _ _)⟩

/-- 6.2 A finite graph is distance-regular exactly when it is connected and its distance classes
form a symmetric association scheme with `diam` classes. -/
theorem isDistanceRegular_iff {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] :
    IsDistanceRegular G ↔ G.Connected ∧ IsAssocScheme (distRel G) := by
  sorry

end TauCetiRoadmap.AssociationSchemes
