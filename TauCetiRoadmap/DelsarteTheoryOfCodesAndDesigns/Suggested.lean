import Mathlib
import TauCeti.InformationTheory.Coding.Krawtchouk

/-!
# Delsarte theory of codes and designs: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's routes, remarks and Checks are not
restated.

Schemes are those of AssociationSchemes: a class function `rel : X → X → Fin (d + 1)` satisfying
`IsAssocScheme`, with a family `E` of primitive idempotents satisfying `IsPrimitiveIdempotents`,
the eigenmatrices `P = eigenmatrix rel E` and `Q = dualEigenmatrix rel E`, the Krein parameters
and inner distributions. These definitions, the Johnson scheme `johnsonRel` and the vectors
`containsVec` are copied verbatim from AssociationSchemes, which owns them; `lovaszTheta` is
copied verbatim from LovaszThetaFunction 1.1, `hahn` from SpecialFunctionsClebschGordan 4.1, and
`polynomialsOfDegreeLE` and `IsSphericalDesign` from LatticePackingsAndPerfectForms 5.1. The
multiplicity `m_j` of `E j` is its trace. Suprema of semidefinite and linear programs are stated
as `IsGreatest` or `IsLeast` facts, so that no junk value of `sSup` is used. The routes and remarks
of the README use declared theorems of the suppliers, among them AssociationSchemes'
`adjMat_eq_sum_and_eq_sum_adjMat` and `eigenmatrix_mul_dualEigenmatrix` (routes of Layer 1) and
LovaszThetaFunction's `lovaszTheta_mul_le` (a remark of Layer 1), which are not restated here.
-/

noncomputable section

open Finset Matrix

namespace TauCetiRoadmap.DelsarteTheoryOfCodesAndDesigns

section CopiedAssociationSchemes

variable {X : Type*} [Fintype X] [DecidableEq X] {d : ℕ}

/-- 1.1 (copied verbatim from AssociationSchemes 1.1) A symmetric association scheme with `d`
classes, given by its class function: class `0` is the diagonal, every class is symmetric and
nonempty, and for all `i`, `j` the number of `z` with `rel x z = i` and `rel z y = j` depends
only on the class of `(x, y)`. -/
structure IsAssocScheme (rel : X → X → Fin (d + 1)) : Prop where
  rel_eq_zero_iff : ∀ x y, rel x y = 0 ↔ x = y
  rel_comm : ∀ x y, rel x y = rel y x
  exists_rel_eq : ∀ i, ∃ x y, rel x y = i
  card_eq : ∀ i j x y x' y', rel x y = rel x' y' →
    #{z | rel x z = i ∧ rel z y = j} = #{z | rel x' z = i ∧ rel z y' = j}

/-- 1.1 (copied verbatim from AssociationSchemes 1.1) The adjacency matrix `A_i` of class `i`:
the real `0/1` matrix of the relation `rel x y = i`. -/
def adjMat (rel : X → X → Fin (d + 1)) (i : Fin (d + 1)) : Matrix X X ℝ :=
  Matrix.of fun x y => if rel x y = i then 1 else 0

/-- 1.1 (copied verbatim from AssociationSchemes 1.1) The Bose–Mesner algebra: the real span of
the adjacency matrices of the classes. -/
def bmAlgebra (rel : X → X → Fin (d + 1)) : Submodule ℝ (Matrix X X ℝ) :=
  Submodule.span ℝ (Set.range (adjMat rel))

/-- 1.1 (copied verbatim from AssociationSchemes 1.1) The valency `v_i` of class `i`: the number
of ordered pairs in class `i` divided by `|X|`. -/
def valency (rel : X → X → Fin (d + 1)) (i : Fin (d + 1)) : ℝ :=
  (#{p : X × X | rel p.1 p.2 = i} : ℝ) / Fintype.card X

/-- 1.1 (copied verbatim from AssociationSchemes 1.2) A family of primitive idempotents of the
scheme: a complete family of orthogonal idempotents, all nonzero and all in the Bose–Mesner
algebra, the one of index `0` being `J / |X|`. -/
structure IsPrimitiveIdempotents (rel : X → X → Fin (d + 1))
    (E : Fin (d + 1) → Matrix X X ℝ) : Prop where
  complete : CompleteOrthogonalIdempotents E
  ne_zero : ∀ i, E i ≠ 0
  mem_bmAlgebra : ∀ i, E i ∈ bmAlgebra rel
  eq_zero : E 0 = (Fintype.card X : ℝ)⁻¹ • Matrix.of fun _ _ => 1

/-- 2.1 (copied verbatim from AssociationSchemes 2.1) The first eigenmatrix `P`:
`P i j = tr (A_j E_i) / tr E_i`, the eigenvalue of `A_j` on the column space of `E_i`. -/
def eigenmatrix (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ) :
    Matrix (Fin (d + 1)) (Fin (d + 1)) ℝ :=
  Matrix.of fun i j => (adjMat rel j * E i).trace / (E i).trace

/-- 1.1 (copied verbatim from AssociationSchemes 2.1) The second eigenmatrix `Q`:
`Q i j = (∑_(x, y) (A_i)_(xy) (E_j)_(xy)) / v_i`, which is `|X|` times the common value of `E_j`
on the pairs of class `i`. -/
def dualEigenmatrix (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ) :
    Matrix (Fin (d + 1)) (Fin (d + 1)) ℝ :=
  Matrix.of fun i j => (∑ x, ∑ y, adjMat rel i x y * E j x y) / valency rel i

/-- 4.1 (copied verbatim from AssociationSchemes 3.1) The Krein parameter
`q^k_(ij) = (∑_l v_l Q_(li) Q_(lj) Q_(lk)) / (|X| m_k)`, with `m_k = tr E_k`. -/
def kreinParam (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ)
    (i j k : Fin (d + 1)) : ℝ :=
  (∑ l, valency rel l * dualEigenmatrix rel E l i * dualEigenmatrix rel E l j *
      dualEigenmatrix rel E l k) / (Fintype.card X * (E k).trace)

/-- 3.1 (copied verbatim from AssociationSchemes 4.1) The inner distribution of a set `Y`: `a_i`
is the number of ordered pairs of `Y` in class `i` divided by `|Y|` (and `0` when `Y` is empty). -/
def innerDistribution (rel : X → X → Fin (d + 1)) (Y : Finset X) (i : Fin (d + 1)) : ℝ :=
  (#{p ∈ Y ×ˢ Y | rel p.1 p.2 = i} : ℝ) / #Y

/-- 3.1 (copied verbatim from AssociationSchemes 5.1) The class function of the Johnson scheme
`J(n, k)` on the `k`-subsets of `Fin n`: two subsets are in class `k − |A ∩ B|`. -/
def johnsonRel (n k : ℕ) (A B : {s : Finset (Fin n) // s.card = k}) : Fin (k + 1) :=
  ⟨k - #(A.1 ∩ B.1), Nat.lt_succ_of_le (Nat.sub_le _ _)⟩

/-- 3.1 (copied verbatim from AssociationSchemes 5.1) The indicator of the `k`-subsets
containing a set `T`. -/
def containsVec {n : ℕ} (k : ℕ) (T : Finset (Fin n)) :
    {s : Finset (Fin n) // s.card = k} → ℝ :=
  fun A => if T ⊆ A.1 then 1 else 0

end CopiedAssociationSchemes

section CopiedLovaszTheta

variable {V : Type*} [Fintype V]

/-- 1.2 (copied verbatim from LovaszThetaFunction 1.1) The Lovász theta function in its
semidefinite form: the supremum of the sum of the entries of `B` over positive semidefinite real
matrices `B` with trace `1` and `B i j = 0` whenever `i` and `j` are adjacent. -/
def lovaszTheta (G : SimpleGraph V) : ℝ :=
  sSup {s : ℝ | ∃ B : Matrix V V ℝ, B.PosSemidef ∧ B.trace = 1 ∧
    (∀ i j, G.Adj i j → B i j = 0) ∧ ∑ i, ∑ j, B i j = s}

end CopiedLovaszTheta

/-- 4.3 (copied verbatim from SpecialFunctionsClebschGordan 4.1) The Hahn polynomial
`Q_n(x; α, β, N) = ₃F₂(-n, n + α + β + 1, -x; α + 1, -N; 1)` (DLMF 18.20.5), as the terminating
sum. -/
def hahn (N n : ℕ) (α β x : ℝ) : ℝ :=
  ∑ k ∈ Finset.range (n + 1),
    (ascPochhammer ℝ k).eval (-(n : ℝ)) * (ascPochhammer ℝ k).eval (n + α + β + 1) *
        (ascPochhammer ℝ k).eval (-x) /
      ((ascPochhammer ℝ k).eval (α + 1) * (ascPochhammer ℝ k).eval (-(N : ℝ)) * k.factorial)

section CopiedSphericalDesigns

open MeasureTheory
open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 5.1 (copied verbatim from LatticePackingsAndPerfectForms 5.1) Polynomial functions of degree
`≤ t` on a real inner product space: the span of the powers `⟪a, ·⟫^k`, `k ≤ t`. -/
def polynomialsOfDegreeLE (E : Type*) [NormedAddCommGroup E] [InnerProductSpace ℝ E] (t : ℕ) :
    Submodule ℝ (E → ℝ) :=
  Submodule.span ℝ {f | ∃ (a : E) (k : ℕ), k ≤ t ∧ f = fun x => ⟪a, x⟫_ℝ ^ k}

/-- 5.1 (copied verbatim from LatticePackingsAndPerfectForms 5.1) A finite nonempty set on the
sphere of radius `r` is a spherical `t`-design when every polynomial of degree `≤ t` has the same
average over the set and over the sphere, the latter for the normalized `toSphere` measure
transported to radius `r`. -/
def IsSphericalDesign (t : ℕ) (X : Finset E) (r : ℝ) : Prop :=
  X.Nonempty ∧ (∀ x ∈ X, ‖x‖ = r) ∧
    ∀ f ∈ polynomialsOfDegreeLE E t,
      (∑ x ∈ X, f x) / X.card =
        (∫ y, f (r • Subtype.val y) ∂((volume : Measure E).toSphere)) /
          ((volume : Measure E).toSphere).real Set.univ

end CopiedSphericalDesigns

variable {X : Type*} [Fintype X] [DecidableEq X] {d : ℕ}

/-! ## Layer 1: Schrijver's theorem -/

/-- 1.1 The graph of a set `R` of classes: two distinct points are adjacent when their class lies
in `R` (class `0` never joins two distinct points). Its independent sets are the `R`-cocliques,
the codes avoiding the classes of `R`. -/
def classGraph (rel : X → X → Fin (d + 1)) (R : Finset (Fin (d + 1))) : SimpleGraph X :=
  SimpleGraph.fromRel fun x y => rel x y ∈ R

/-- 1.1 Schrijver's variant `ϑ′` of the theta function: the supremum of the sum of the entries of
`B` over entrywise nonnegative, positive semidefinite real matrices `B` with trace `1` and
`B i j = 0` whenever `i` and `j` are adjacent. -/
def thetaPrime {V : Type*} [Fintype V] (G : SimpleGraph V) : ℝ :=
  sSup {s : ℝ | ∃ B : Matrix V V ℝ, B.PosSemidef ∧ B.trace = 1 ∧
    (∀ i j, G.Adj i j → B i j = 0) ∧ (∀ i j, 0 ≤ B i j) ∧ ∑ i, ∑ j, B i j = s}

/-- 1.1 The feasible points of Delsarte's linear program for `R`: vectors `a` indexed by the
classes with `a 0 = 1`, all `a i ≥ 0`, `a i = 0` for the nonzero classes of `R`, and
`(a Q)_j ≥ 0` for every `j`. Its objective is `∑ i, a i`. -/
def IsDelsarteFeasible (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ)
    (R : Finset (Fin (d + 1))) (a : Fin (d + 1) → ℝ) : Prop :=
  a 0 = 1 ∧ (∀ i, 0 ≤ a i) ∧ (∀ i ∈ R, i ≠ 0 → a i = 0) ∧
    ∀ j, 0 ≤ ∑ i, a i * dualEigenmatrix rel E i j

/-- 1.1 **Schrijver's theorem.** For a symmetric association scheme, a family of primitive
idempotents and any set `R` of classes, the semidefinite program defining `ϑ′` of the graph of
`R` attains its supremum, and `ϑ′` is the maximum of Delsarte's linear program for `R`, which is
attained as well. -/
theorem isGreatest_thetaPrime_classGraph {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E)
    (R : Finset (Fin (d + 1))) :
    IsGreatest {s : ℝ | ∃ B : Matrix X X ℝ, B.PosSemidef ∧ B.trace = 1 ∧
        (∀ x y, (classGraph rel R).Adj x y → B x y = 0) ∧ (∀ x y, 0 ≤ B x y) ∧
          ∑ x, ∑ y, B x y = s} (thetaPrime (classGraph rel R)) ∧
      IsGreatest {s : ℝ | ∃ a, IsDelsarteFeasible rel E R a ∧ ∑ i, a i = s}
        (thetaPrime (classGraph rel R)) := by
  sorry

/-- 1.2 **Schrijver's theorem for `ϑ`.** For a symmetric association scheme, a family of
primitive idempotents and any set `R` of classes, `ϑ` of the graph of `R` is the maximum of the
sign-free linear program: `∑ i, a i` over `a` with `a 0 = 1`, `a i = 0` for the nonzero classes
of `R` and `(a Q)_j ≥ 0` for every `j`, with no sign condition on the other `a i`. -/
theorem isGreatest_lovaszTheta_classGraph {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E)
    (R : Finset (Fin (d + 1))) :
    IsGreatest {s : ℝ | ∃ a : Fin (d + 1) → ℝ, a 0 = 1 ∧ (∀ i ∈ R, i ≠ 0 → a i = 0) ∧
        (∀ j, 0 ≤ ∑ i, a i * dualEigenmatrix rel E i j) ∧ ∑ i, a i = s}
      (lovaszTheta (classGraph rel R)) := by
  sorry

/-! ## Layer 2: the Hamming scheme -/

section Hamming

variable {ι α : Type*} [Fintype ι] [DecidableEq ι] [Fintype α] [DecidableEq α]

/-- 2.1 The class function of the Hamming scheme `H(n, q)` on the words `ι → α`, `n = |ι|`,
`q = |α|`: two words are in the class of their Hamming distance. -/
def hammingRel (x y : ι → α) : Fin (Fintype.card ι + 1) :=
  ⟨hammingDist x y, Nat.lt_succ_of_le hammingDist_le_card_fintype⟩

/-- 2.1 The span of the real functions on the words that depend on at most `t` coordinates. -/
def juntaSpan (t : ℕ) : Submodule ℝ ((ι → α) → ℝ) :=
  Submodule.span ℝ {f | ∃ S : Finset ι, #S ≤ t ∧ ∀ x y : ι → α, (∀ i ∈ S, x i = y i) → f x = f y}

/-- 2.1 **The Hamming scheme.** For an alphabet with at least two letters: (a) the Hamming
distance classes form a symmetric association scheme with `n` classes; (b) it has a family of
primitive idempotents for which `P` and `Q` are both the table of Krawtchouk values,
`P_(ij) = Q_(ij) = K_j(i)`; (c) for that family the column space of `E_0 + ⋯ + E_t` is the span
of the functions depending on at most `t` coordinates. -/
theorem hamming_scheme [Nontrivial α] :
    IsAssocScheme (hammingRel (ι := ι) (α := α)) ∧
      ∃ E, IsPrimitiveIdempotents (hammingRel (ι := ι) (α := α)) E ∧
        (∀ i j : Fin (Fintype.card ι + 1), eigenmatrix hammingRel E i j =
          TauCeti.krawtchouk (Fintype.card α) (Fintype.card ι) j i) ∧
        (∀ i j : Fin (Fintype.card ι + 1), dualEigenmatrix hammingRel E i j =
          TauCeti.krawtchouk (Fintype.card α) (Fintype.card ι) j i) ∧
        ∀ t : Fin (Fintype.card ι + 1), LinearMap.range (Matrix.toLin' (∑ l ∈ Iic t, E l)) =
          juntaSpan (ι := ι) (α := α) t := by
  sorry

/-- 2.2 **`ϑ′` of the Hamming graphs.** For an alphabet with at least two letters and `1 ≤ δ`,
`ϑ′` of the graph joining distinct words at distance less than `δ` is the least value
`f(0)/f_0` of the certificates `f = ∑_k f_k K_k` with `f_0 > 0`, `f_k ≥ 0` for `1 ≤ k ≤ n` and
`f(i) ≤ 0` for `δ ≤ i ≤ n`. -/
theorem isLeast_thetaPrime_hamming [Nontrivial α] {δ : ℕ} (hδ : 1 ≤ δ) :
    IsLeast {u : ℝ | ∃ f : ℕ → ℝ, 0 < f 0 ∧
        (∀ k, 1 ≤ k → k ≤ Fintype.card ι → 0 ≤ f k) ∧
        (∀ i, δ ≤ i → i ≤ Fintype.card ι →
          ∑ k ∈ range (Fintype.card ι + 1),
            f k * TauCeti.krawtchouk (Fintype.card α) (Fintype.card ι) k i ≤ 0) ∧
        u = (∑ k ∈ range (Fintype.card ι + 1),
            f k * TauCeti.krawtchouk (Fintype.card α) (Fintype.card ι) k 0) / f 0}
      (thetaPrime (classGraph (hammingRel (ι := ι) (α := α)) {i | (i : ℕ) < δ})) := by
  sorry

end Hamming

/-! ## Layer 3: designs in the Johnson and Hamming schemes -/

/-- 3.1 A Delsarte `t`-design: `(a Q)_j = 0` for every class index `1 ≤ j ≤ t`, where `a` is the
inner distribution of `Y`. The notion depends on the order of the idempotents. -/
def IsDesign (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ) (t : ℕ)
    (Y : Finset X) : Prop :=
  ∀ j : Fin (d + 1), 1 ≤ (j : ℕ) → (j : ℕ) ≤ t →
    ∑ i, innerDistribution rel Y i * dualEigenmatrix rel E i j = 0

/-- 3.1 **Designs in the Johnson scheme.** For `2k ≤ n`, `t ≤ k` and the idempotents of the
Johnson scheme in their standard order (the column space of `E_0 + ⋯ + E_j` spanned by the
indicators of the `k`-sets through a `j`-set), a family `Y` of `k`-subsets of `Fin n` is a
Delsarte `t`-design exactly when every `t`-subset lies in the same number of members of `Y`. -/
theorem isDesign_johnson_iff {n k t : ℕ} (hn : 2 * k ≤ n) (ht : t ≤ k)
    {E : Fin (k + 1) → Matrix {s : Finset (Fin n) // s.card = k}
      {s : Finset (Fin n) // s.card = k} ℝ}
    (hE : IsPrimitiveIdempotents (johnsonRel n k) E)
    (hspan : ∀ j : Fin (k + 1), LinearMap.range (Matrix.toLin' (∑ l ∈ Iic j, E l)) =
      Submodule.span ℝ (Set.range fun T : {T : Finset (Fin n) // T.card = j} => containsVec k T.1))
    (Y : Finset {s : Finset (Fin n) // s.card = k}) :
    IsDesign (johnsonRel n k) E t Y ↔
      ∃ c : ℕ, ∀ T : Finset (Fin n), #T = t → #{B ∈ Y | T ⊆ B.1} = c := by
  sorry

/-- 3.1 **Designs in the Hamming scheme.** For an alphabet with at least two letters, `t ≤ n` and
the idempotents of 2.1 (the column space of `E_0 + ⋯ + E_j` is the span of the functions depending
on at most `j` coordinates), a set `Y` of words is a Delsarte `t`-design exactly when it is an
orthogonal array of strength `t`: for every set `S` of `t` coordinates, every pattern of letters
on `S` occurs in the same number of words of `Y`. -/
theorem isDesign_hamming_iff {ι α : Type*} [Fintype ι] [DecidableEq ι] [Fintype α] [DecidableEq α]
    [Nontrivial α]
    {t : ℕ} (ht : t ≤ Fintype.card ι)
    {E : Fin (Fintype.card ι + 1) → Matrix (ι → α) (ι → α) ℝ}
    (hE : IsPrimitiveIdempotents hammingRel E)
    (hspan : ∀ j : Fin (Fintype.card ι + 1),
      LinearMap.range (Matrix.toLin' (∑ l ∈ Iic j, E l)) = juntaSpan (ι := ι) (α := α) j)
    (Y : Finset (ι → α)) :
    IsDesign hammingRel E t Y ↔
      ∀ S : Finset ι, #S = t → ∀ u v : ι → α,
        #{y ∈ Y | ∀ i ∈ S, y i = u i} = #{y ∈ Y | ∀ i ∈ S, y i = v i} := by
  sorry

/-! ## Layer 4: cometric schemes -/

/-- 4.1 A scheme is cometric (`Q`-polynomial) for the given order of its idempotents when
`q^k_(1j) = 0` for `k > j + 1` and `q^(j+1)_(1j) ≠ 0` for every `j < d`. -/
def IsCometric (rel : X → X → Fin (d + 1)) (E : Fin (d + 1) → Matrix X X ℝ) : Prop :=
  (∀ j k : Fin (d + 1), (j : ℕ) + 1 < k → kreinParam rel E 1 j k = 0) ∧
    ∀ j k : Fin (d + 1), (k : ℕ) = j + 1 → kreinParam rel E 1 j k ≠ 0

/-- 4.1 **The Johnson scheme is cometric.** For `2k ≤ n`, the Johnson scheme with its
idempotents in the standard order is cometric. -/
theorem isCometric_johnson {n k : ℕ} (hn : 2 * k ≤ n)
    {E : Fin (k + 1) → Matrix {s : Finset (Fin n) // s.card = k}
      {s : Finset (Fin n) // s.card = k} ℝ}
    (hE : IsPrimitiveIdempotents (johnsonRel n k) E)
    (hspan : ∀ j : Fin (k + 1), LinearMap.range (Matrix.toLin' (∑ l ∈ Iic j, E l)) =
      Submodule.span ℝ
        (Set.range fun T : {T : Finset (Fin n) // T.card = j} => containsVec k T.1)) :
    IsCometric (johnsonRel n k) E := by
  sorry

/-- 4.1 **The Hamming scheme is cometric.** For an alphabet with at least two letters, the
Hamming scheme with the idempotents of 2.1 is cometric. -/
theorem isCometric_hamming {ι α : Type*} [Fintype ι] [DecidableEq ι] [Fintype α] [DecidableEq α]
    [Nontrivial α]
    {E : Fin (Fintype.card ι + 1) → Matrix (ι → α) (ι → α) ℝ}
    (hE : IsPrimitiveIdempotents hammingRel E)
    (hspan : ∀ j : Fin (Fintype.card ι + 1),
      LinearMap.range (Matrix.toLin' (∑ l ∈ Iic j, E l)) = juntaSpan (ι := ι) (α := α) j) :
    IsCometric hammingRel E := by
  sorry

/-- 4.2 **The Fisher-type bound.** In a cometric scheme, a nonempty Delsarte `2e`-design has at
least `m_0 + m_1 + ⋯ + m_e` points. -/
theorem sum_trace_le_card_of_isDesign {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E)
    (hc : IsCometric rel E) {e : ℕ} {Y : Finset X} (hY : Y.Nonempty)
    (hdes : IsDesign rel E (2 * e) Y) :
    ∑ j ∈ univ.filter (fun j : Fin (d + 1) => (j : ℕ) ≤ e), (E j).trace ≤ #Y := by
  sorry

/-- 4.2 **The absolute bound.** In a cometric scheme, a set whose pairs of distinct points fall
into at most `s` classes has at most `m_0 + m_1 + ⋯ + m_s` points. -/
theorem card_le_sum_trace_of_degree {rel : X → X → Fin (d + 1)} (h : IsAssocScheme rel)
    {E : Fin (d + 1) → Matrix X X ℝ} (hE : IsPrimitiveIdempotents rel E)
    (hc : IsCometric rel E) {s : ℕ} {Y : Finset X}
    (hs : #{i | i ≠ 0 ∧ innerDistribution rel Y i ≠ 0} ≤ s) :
    (#Y : ℝ) ≤ ∑ j ∈ univ.filter (fun j : Fin (d + 1) => (j : ℕ) ≤ s), (E j).trace := by
  sorry

/-- 4.3 **The Johnson `Q`-matrix in Hahn form.** For `2k ≤ n` and the idempotents of the
Johnson scheme in their standard order, `Q_(ij) = m_j Q_j(i; k − n − 1, −k − 1, k)`, with the
Hahn polynomial `Q_j(x; α, β, N)` of DLMF 18.20.5. -/
theorem dualEigenmatrix_johnson_eq_hahn {n k : ℕ} (hn : 2 * k ≤ n)
    {E : Fin (k + 1) → Matrix {s : Finset (Fin n) // s.card = k}
      {s : Finset (Fin n) // s.card = k} ℝ}
    (hE : IsPrimitiveIdempotents (johnsonRel n k) E)
    (hspan : ∀ j : Fin (k + 1), LinearMap.range (Matrix.toLin' (∑ l ∈ Iic j, E l)) =
      Submodule.span ℝ (Set.range fun T : {T : Finset (Fin n) // T.card = j} => containsVec k T.1))
    (i j : Fin (k + 1)) :
    dualEigenmatrix (johnsonRel n k) E i j =
      (E j).trace * hahn k j ((k : ℝ) - n - 1) (-(k : ℝ) - 1) i := by
  sorry

/-! ## Layer 5: designs and few-distance sets on the sphere -/

section Sphere

open scoped InnerProductSpace

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 5.1 **The Delsarte–Goethals–Seidel lower bound.** For `e ≥ 1`, a spherical `2e`-design on the
unit sphere of a real inner product space of dimension `n` has at least
`C(n + e − 1, e) + C(n + e − 2, e − 1)` points. -/
theorem multichoose_add_multichoose_le_card {e : ℕ} (he : 1 ≤ e) {Y : Finset E}
    (hY : IsSphericalDesign (2 * e) Y 1) :
    (Module.finrank ℝ E).multichoose e + (Module.finrank ℝ E).multichoose (e - 1) ≤ #Y := by
  sorry

omit [MeasurableSpace E] [BorelSpace E] in
/-- 5.1 **The absolute bound for few-distance sets.** A set of unit vectors in a real inner
product space of dimension `n` whose distinct members have at most `s` inner products has at most
`C(n + s − 1, s) + C(n + s − 2, s − 1)` points. -/
theorem card_le_multichoose_add_multichoose {s : ℕ} {Y : Finset E} (hY : ∀ y ∈ Y, ‖y‖ = 1)
    {A : Finset ℝ} (hA : #A ≤ s) (hYA : ∀ x ∈ Y, ∀ y ∈ Y, x ≠ y → ⟪x, y⟫_ℝ ∈ A) :
    #Y ≤ (Module.finrank ℝ E).multichoose s + (Module.finrank ℝ E).multichoose (s - 1) := by
  sorry

end Sphere

end TauCetiRoadmap.DelsarteTheoryOfCodesAndDesigns
