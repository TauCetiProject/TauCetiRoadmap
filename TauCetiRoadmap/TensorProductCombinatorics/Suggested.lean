import Mathlib
import TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight
import TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Basic
import TauCeti.RepresentationTheory.ClassicalGroups.WeylModule.Rational
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Basic
import TauCeti.Analysis.Convex.Polyhedron.Basic
import TauCeti.LinearAlgebra.RootSystem.Positive
import TauCeti.LinearAlgebra.RootSystem.KostantPartition.Basic

/-!
# Tensor product combinatorics: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, with
only the simple definitions those statements need.

Headline theorems stated here, in README order: the antitonicity of hive boundaries
and the finiteness of fixed-boundary hive fibres, which make the hive count a count of
dominant-weight triples (Layer 1); the chamberwise polynomiality of pointed unimodular
vector partition functions and its wall agreement (1.5); the polarized Abel series of
a lattice list, its absolute convergence and its rational function, and the cone
identity (1.6); the reconstruction of a hive from its Gelfand–Tsetlin pattern, the
uniform-gap bound and the stable equivalence (2.1); the hive model of the
Littlewood–Richardson rule in its Schur-polynomial form and in its
representation-theoretic form on the pinned rational Weyl modules (the intertwiner
and invariant dimensions), and the commutativity of hive counts (2.3); the type-A
Kostant partition function as an interval-matrix count, its total unimodularity and
chamber polynomiality (2.6); associativity of the hive ring (3.2); the type-A PRV
theorem and saturation (4.4, 4.6); multiplicity-one stretching (6.8); the Hermitian
spectral characterization of real hive feasibility (7.4). The infrastructure lemmas
of the README (polyhedrality and compactness of fibres, integral heights, chamber
covering, growth bounds, the spectrum through the characteristic polynomial) are
README targets and are not stated here.

Not statable at the pins, with the carrier each lacks: the hive–honeycomb correspondence and the honeycomb overlay (Layer 4: no honeycomb
carrier); the puzzle rule, the integral Schubert ring of the complex Grassmannian and
the Grassmannian cup-product theorem (Layers 5–6: no puzzle carrier and no integral
Schubert cohomology of the finite Grassmannian); the Fourier boundary-value,
wall-crossing and Todd reconstruction theorems (1.6: the tempered lattice sum
`Σ_b c(b) δ_b` is a construction target, not a declaration); the diagonal overgroup
restriction comparison (2.7: the overgroup carriers are a declared ClassicalGroups
gap); the excavation associator and the hive commutor as bijections and their cactus
coherence (Layers 3 and 9: only their count consequences are stated); the Kempf–Ness
bridge (7.3: no projective flag orbits with moment maps); the Horn recursion (7.5:
the Horn triples are a recursive construction target); and every type-A path and
crystal theorem (Layer 8: no root operators on paths at the pins).
-/

noncomputable section
open scoped BigOperators
open MeasureTheory

namespace TauCetiRoadmap.TensorProductCombinatorics

/-! ## Layer 1: lattices, rhombi, boundaries and finite polytope operations -/

/-- The barycentric lattice `Δₙ = {(x, y, z) ∈ ℕ³ : x + y + z = n}`, with all three
coordinates retained. -/
abbrev Vertex (n : ℕ) := {v : Fin 3 → Fin (n + 1) // ∑ i, (v i).val = n}

/-- The corner `A = (n, 0, 0)`, at which hives are normalized to `0`. -/
def origin (n : ℕ) : Vertex n :=
  ⟨![⟨n, by omega⟩, 0, 0], by simp [Fin.sum_univ_succ]⟩

/-- Squared Euclidean distance of two lattice points in barycentric coordinates
(a unit edge has squared distance `2`, a long rhombus diagonal `6`). -/
def sqDist {n : ℕ} (a b : Vertex n) : ℤ :=
  ∑ i, (((a.1 i).val : ℤ) - ((b.1 i).val : ℤ))^2

/-- A unit rhombus listed cyclically: corners `0` and `2` lie on the short diagonal
(the obtuse corners), corners `1` and `3` on the long diagonal. -/
def IsRhombus {n : ℕ} (q : Fin 4 → Vertex n) : Prop :=
  sqDist (q 0) (q 1) = 2 ∧ sqDist (q 1) (q 2) = 2 ∧
  sqDist (q 2) (q 3) = 2 ∧ sqDist (q 3) (q 0) = 2 ∧
  sqDist (q 0) (q 2) = 2 ∧ sqDist (q 1) (q 3) = 6

/-- A normalized hive with values in an ordered abelian group: the sum at the two
obtuse corners of every unit rhombus is at least the sum at the two acute corners. -/
structure Hive (n : ℕ) (R : Type*) [AddCommGroup R] [PartialOrder R] where
  value : Vertex n → R
  normalized : value (origin n) = 0
  rhombus : ∀ q : Fin 4 → Vertex n, IsRhombus q →
    value (q 1) + value (q 3) ≤ value (q 0) + value (q 2)

abbrev IntegerHive (n : ℕ) := Hive n ℤ
abbrev RealHive (n : ℕ) := Hive n ℝ

/-- The `k`-th point of the edge `A→B` (`s = 0`), `B→C` (`s = 1`) or `C→A` (`s = 2`). -/
def edgePoint (n : ℕ) (s : Fin 3) (k : Fin (n + 1)) : Vertex n := by
  by_cases hs : s.val = 0
  · exact ⟨![⟨n-k.val, by omega⟩, k, 0], by simp [Fin.sum_univ_succ]; omega⟩
  by_cases hs₁ : s.val = 1
  · exact ⟨![0, ⟨n-k.val, by omega⟩, k], by simp [Fin.sum_univ_succ]; omega⟩
  · exact ⟨![k, 0, ⟨n-k.val, by omega⟩], by simp [Fin.sum_univ_succ]; omega⟩

/-- The cyclic boundary of a hive: the successive edge differences along `A→B→C→A`. -/
def boundary {n : ℕ} {R : Type*} [AddCommGroup R] [PartialOrder R]
    (h : Hive n R) : Fin 3 → Fin n → R := fun s i =>
  h.value (edgePoint n s ⟨i.val+1, by omega⟩) -
    h.value (edgePoint n s ⟨i.val, by omega⟩)

/-- Each boundary edge of a hive is a dominant weight: the two unit rhombi sharing the
triangle at an edge point sum to the concavity of the edge values. -/
theorem boundary_antitone {n : ℕ} {R : Type*} [AddCommGroup R] [PartialOrder R]
    [IsOrderedAddMonoid R] (h : Hive n R) (s : Fin 3) :
    Antitone (boundary h s) := by sorry

/-- The integer hives with a prescribed cyclic boundary. -/
abbrev FixedIntegerHive {n : ℕ} (B : Fin 3 → Fin n → ℤ) :=
  {h : IntegerHive n // boundary h = B}

/-- Each fixed-boundary fibre of integer hives is finite (1.2). -/
theorem finite_fixedIntegerHive {n : ℕ} (B : Fin 3 → Fin n → ℤ) :
    Finite (FixedIntegerHive B) := by sorry

/-- The number of integer hives with cyclic boundary `B`. -/
def hiveCount {n : ℕ} (B : Fin 3 → Fin n → ℤ) : ℕ :=
  Nat.card (FixedIntegerHive B)

/-! ## Layer 1.5: pointed unimodular counting -/

namespace ChamberCounting
open scoped BigOperators

variable {r : ℕ} {ι : Type*} [Fintype ι]

/-- The nonnegative integer solutions of `A c = b`. -/
abbrev Fibre (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ) :=
  {c : ι → ℕ // ∀ i, ∑ j, A i j * (c j : ℤ) = b i}

/-- The vector partition function of `A`. -/
def count (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ) : ℕ :=
  Nat.card (Fibre A b)

/-- The real polytope `P_A(b) = {x ≥ 0 : A x = b}`. -/
def realFibre (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℝ) : Set (ι → ℝ) :=
  {x | (∀ j, 0 ≤ x j) ∧ ∀ i, ∑ j, (A i j : ℝ) * x j = b i}

/-- The column cone `C_A`. -/
def supportCone (A : Matrix (Fin r) ι ℤ) : Set (Fin r → ℝ) :=
  {b | ∃ x : ι → ℝ, x ∈ realFibre A b}

/-- An ordered invertible column basis of `A`. -/
abbrev ColumnBasis (A : Matrix (Fin r) ι ℤ) :=
  {e : Fin r → ι // Function.Injective e ∧ (A.submatrix id e).det ≠ 0}

/-- The coordinates of `x` in the column basis `B`, that is `A_B⁻¹ x`. -/
def basisCoordinates (A : Matrix (Fin r) ι ℤ) (B : ColumnBasis A)
    (x : Fin r → ℝ) : Fin r → ℝ :=
  Matrix.mulVec ((A.submatrix id B.1).map (Int.castRingHom ℝ))⁻¹ x

abbrev WallIndex (A : Matrix (Fin r) ι ℤ) := ColumnBasis A × Fin r

/-- The closed cell of the basis-coordinate arrangement with sign pattern `s`, inside
the column cone. -/
def chamberCell (A : Matrix (Fin r) ι ℤ) (s : WallIndex A → Bool) :
    Set (Fin r → ℝ) :=
  {x | x ∈ supportCone A ∧ ∀ B : ColumnBasis A, ∀ i,
    if s (B, i) then 0 ≤ basisCoordinates A B x i
    else basisCoordinates A B x i ≤ 0}

/-- The full-dimensional closed chambers inside the support; the exterior is not a
chamber. -/
abbrev Chamber (A : Matrix (Fin r) ι ℤ) :=
  {s : WallIndex A → Bool // (interior (chamberCell A s)).Nonempty}

/-- Chamberwise polynomiality of unimodular vector partition functions
(De Loera–Sturmfels, Theorem 1.1): on each closed chamber the count is a rational
polynomial of total degree at most `|ι| - r`. -/
theorem exists_chamberPolynomial (A : Matrix (Fin r) ι ℤ)
    (h : Fin r → ℤ) (hpos : ∀ j, 0 < ∑ i, h i * A i j)
    (hfull : Function.Surjective (fun x : ι → ℚ =>
      fun i => ∑ j, (A i j : ℚ) * x j))
    (hunit : ∀ e : Fin r → ι, Function.Injective e →
      (A.submatrix id e).det = 0 ∨ (A.submatrix id e).det = 1 ∨
        (A.submatrix id e).det = -1)
    (D : Chamber A) :
    ∃ P : MvPolynomial (Fin r) ℚ, P.totalDegree ≤ Fintype.card ι - r ∧
      ∀ b : Fin r → ℤ, (fun i => (b i : ℝ)) ∈ chamberCell A D.1 →
        MvPolynomial.eval (fun i => (b i : ℚ)) P = (count A b : ℚ) := by sorry

/-- Wall agreement (De Loera–Sturmfels, end of §3): polynomials representing the
count on two chambers agree as real functions on the intersection of the chambers. -/
theorem chamberPolynomial_wall (A : Matrix (Fin r) ι ℤ)
    (h : Fin r → ℤ) (hpos : ∀ j, 0 < ∑ i, h i * A i j)
    (hfull : Function.Surjective (fun x : ι → ℚ =>
      fun i => ∑ j, (A i j : ℚ) * x j))
    (hunit : ∀ e : Fin r → ι, Function.Injective e →
      (A.submatrix id e).det = 0 ∨ (A.submatrix id e).det = 1 ∨
        (A.submatrix id e).det = -1)
    (D E : Chamber A) (P Q : MvPolynomial (Fin r) ℚ)
    (hP : ∀ b : Fin r → ℤ, (fun i => (b i : ℝ)) ∈ chamberCell A D.1 →
      MvPolynomial.eval (fun i => (b i : ℚ)) P = (count A b : ℚ))
    (hQ : ∀ b : Fin r → ℤ, (fun i => (b i : ℝ)) ∈ chamberCell A E.1 →
      MvPolynomial.eval (fun i => (b i : ℚ)) Q = (count A b : ℚ))
    (x : Fin r → ℝ) (hD : x ∈ chamberCell A D.1) (hE : x ∈ chamberCell A E.1) :
    MvPolynomial.eval₂ (algebraMap ℚ ℝ) x P = MvPolynomial.eval₂ (algebraMap ℚ ℝ) x Q := by
  sorry

end ChamberCounting

/-! ## Layer 1.6: rational cone series, Fourier boundary values and lattice endpoints -/

namespace FourierCones

abbrev Lattice (r : ℕ) := Fin r → ℤ
abbrev Ambient (r : ℕ) := EuclideanSpace ℝ (Fin r)
abbrev Torus (r : ℕ) := UnitAddTorus (Fin r)

/-- The lattice point `b` as a point of the ambient Euclidean space. -/
def embed {r : ℕ} (b : Lattice r) : Ambient r :=
  WithLp.toLp 2 (fun i => (b i : ℝ))

/-- The height `⟨h, b⟩` of a lattice point for a real covector `h`. -/
def height {r : ℕ} (h : Fin r → ℝ) (b : Lattice r) : ℝ :=
  ∑ i, h i * (b i : ℝ)

/-- The columns of `A` on which the height is negative. -/
def negativeColumns {r m : ℕ} (A : Matrix (Fin r) (Fin m) ℤ)
    (h : Fin r → ℝ) : Finset (Fin m) :=
  Finset.univ.filter (fun j => height h (fun i => A i j) < 0)

/-- The matrix with every negative-height column negated. -/
def polarizedMatrix {r m : ℕ} (A : Matrix (Fin r) (Fin m) ℤ)
    (h : Fin r → ℝ) : Matrix (Fin r) (Fin m) ℤ :=
  fun i j => if height h (fun k => A k j) < 0 then -A i j else A i j

/-- The polarization shift `s_h = −Σ_{j ∈ B} a_j`. -/
def polarizationShift {r m : ℕ} (A : Matrix (Fin r) (Fin m) ℤ)
    (h : Fin r → ℝ) : Lattice r :=
  fun i => -∑ j ∈ negativeColumns A h, A i j

/-- The polarized coefficient function `P_A^h(b) = (−1)^|B| · #{c ∈ ℕ^m : A^h c = b − s_h}`;
its finiteness and growth need a regular height. -/
def polarizedCoefficient {r m : ℕ} (A : Matrix (Fin r) (Fin m) ℤ)
    (h : Fin r → ℝ) (b : Lattice r) : ℤ :=
  (-1 : ℤ) ^ (negativeColumns A h).card *
    (ChamberCounting.count (polarizedMatrix A h) (b - polarizationShift A h) : ℤ)

/-- The Abel-regularized torus series of a coefficient function. -/
def abelSeries {r : ℕ} (c : Lattice r → ℂ) (h : Fin r → ℝ)
    (ε : ℝ) (θ : Torus r) : ℂ :=
  ∑' b : Lattice r,
    c b * (Real.exp (-ε * height h b) : ℂ) * UnitAddTorus.mFourier b θ

/-- For a regular height and `ε > 0` the polarized Abel series converges absolutely. -/
theorem polarized_abel_summable {r m : ℕ}
    (A : Matrix (Fin r) (Fin m) ℤ) (h : Fin r → ℝ)
    (hreg : ∀ j, height h (fun i => A i j) ≠ 0)
    (ε : ℝ) (hε : 0 < ε) (θ : Torus r) :
    Summable (fun b : Lattice r => (polarizedCoefficient A h b : ℂ) *
      (Real.exp (-ε * height h b) : ℂ) * UnitAddTorus.mFourier b θ) := by
  sorry

/-- The polarized Abel series is the rational function `∏_j (1 − z^{a_j})⁻¹` at
`z^a = exp(2πi⟨a, θ⟩ − ε h(a))` (1.6.2). -/
theorem polarized_abel_rational {r m : ℕ}
    (A : Matrix (Fin r) (Fin m) ℤ) (h : Fin r → ℝ)
    (hreg : ∀ j, height h (fun i => A i j) ≠ 0)
    (ε : ℝ) (hε : 0 < ε) (θ : Torus r) :
    abelSeries (fun b => (polarizedCoefficient A h b : ℂ)) h ε θ =
      ∏ j, (1 - (Real.exp (-ε * height h (fun i => A i j)) : ℂ) *
        UnitAddTorus.mFourier (fun i => A i j) θ)⁻¹ := by
  sorry

/-- The linear map `t ↦ Σ_j t_j a_j` into the ambient space. -/
def boxMap {r m : ℕ} (A : Matrix (Fin r) (Fin m) ℤ)
    (t : Fin m → ℝ) : Ambient r :=
  WithLp.toLp 2 (fun i => ∑ j, (A i j : ℝ) * t j)

/-- The box measure `B_X`: Lebesgue measure on the unit cube pushed forward. -/
def boxMeasure {r m : ℕ} (A : Matrix (Fin r) (Fin m) ℤ) : Measure (Ambient r) :=
  Measure.map (boxMap A) (volume.restrict {t : Fin m → ℝ | ∀ j, 0 ≤ t j ∧ t j ≤ 1})

/-- The cone measure `T_X`: Lebesgue measure on the orthant pushed forward. -/
def coneMeasure {r m : ℕ} (A : Matrix (Fin r) (Fin m) ℤ) : Measure (Ambient r) :=
  Measure.map (boxMap A) (volume.restrict {t : Fin m → ℝ | ∀ j, 0 ≤ t j})

/-- The cone identity (1.6.3): tiling the orthant by half-open unit cubes,
`T_X = Σ_b P_X(b) · translate_b B_X` for a positive-height list. -/
theorem coneMeasure_eq_sum {r m : ℕ} (A : Matrix (Fin r) (Fin m) ℤ) (h : Fin r → ℝ)
    (hpos : ∀ j, 0 < height h (fun i => A i j)) :
    coneMeasure A = Measure.sum (fun b : Lattice r =>
      (ChamberCounting.count A b : ENNReal) •
        (boxMeasure A).map (fun x => x + embed b)) := by
  sorry

end FourierCones

/-! ## Layer 2: native GT and LR comparisons and the hive ring -/

/-- The dual weight `λ*ᵢ = −λ_{n−1−i}`. -/
def dualWeight {n : ℕ} (lam : TauCeti.DominantWeight n) : TauCeti.DominantWeight n := by
  refine ⟨fun i => -lam.1 i.rev, ?_⟩
  intro i j hij
  apply neg_le_neg
  exact lam.2 (by simpa using hij)

/-- The cyclic boundary `(λ, μ, γ*)` whose hives count the multiplicity of `V_γ` in
`V_λ ⊗ V_μ`. -/
def productBoundary {n : ℕ} (lam μ γ : TauCeti.DominantWeight n) :
    Fin 3 → Fin n → ℤ := ![lam.1, μ.1, (dualWeight γ).1]

/-- The partial boundary sum `Σ_{r < j} l_r`; `j` is a row length. -/
def gtBoundaryPrefix {n : ℕ} (l : Fin n → ℤ) (j : ℕ) : ℤ :=
  ∑ r : Fin n, if r.val < j then l r else 0

/-- The inverse chart formula `h(i, j) = Σ_{r ≤ j} λ_r + Σ_{k < i} P(k, j)` at
`0 ≤ i ≤ j ≤ n`. -/
def gtCompletion {n : ℕ} (l : TauCeti.DominantWeight n)
    (P : TauCeti.GTPattern n) (i j : ℕ) : ℤ :=
  gtBoundaryPrefix l.1 j + ∑ k ∈ Finset.range i, P.entry k j

/-- The weight of a Gelfand–Tsetlin pattern as successive row-sum differences, the
empty row having sum zero. -/
def gtRowWeight {n : ℕ} (P : TauCeti.GTPattern n) : Fin n → ℤ := fun r =>
  (∑ k ∈ Finset.range (r.val + 1), P.entry k (r.val + 1)) -
    (∑ k ∈ Finset.range r.val, P.entry k r.val)

/-- Reconstruction (2.1): a pattern with top row `μ` and weight `γ − λ` is the
difference pattern of a hive with boundary `(λ, μ, γ*)` exactly when the remaining
rhombus family holds on its chart completion. -/
theorem gt_reconstruction_iff {n : ℕ} (l m g : TauCeti.DominantWeight n)
    (P : TauCeti.GTPattern n) (hTop : P.topRow = m.1)
    (hWeight : gtRowWeight P = g.1 - l.1) :
    (∃ h : FixedIntegerHive (productBoundary l m g),
      ∀ v : Vertex n, h.1.value v =
        gtCompletion l P (v.1 2).val (n - (v.1 0).val)) ↔
    ∀ i j : ℕ, i ≤ j → j + 2 ≤ n →
      gtCompletion l P i j + gtCompletion l P (i + 1) (j + 2) ≤
        gtCompletion l P i (j + 1) + gtCompletion l P (i + 1) (j + 1) := by
  sorry

/-- The uniform input gap `λ_r − λ_{r+1} ≥ μ_1 − μ_n` makes the remaining rhombus
family automatic (2.1). -/
theorem gt_completion_of_uniform_input_gap {n : ℕ}
    (l m : TauCeti.DominantWeight (n + 1)) (P : TauCeti.GTPattern (n + 1))
    (hTop : P.topRow = m.1)
    (hGap : ∀ r : Fin n,
      m.1 0 - m.1 (Fin.last n) ≤ l.1 r.castSucc - l.1 r.succ) :
    ∀ i j : ℕ, i ≤ j → j + 2 ≤ n + 1 →
      gtCompletion l P i j + gtCompletion l P (i + 1) (j + 2) ≤
        gtCompletion l P i (j + 1) + gtCompletion l P (i + 1) (j + 1) := by
  sorry

/-- In the stable range the difference map is an equivalence onto the whole
weight-`(γ − λ)` Gelfand–Tsetlin fibre over `μ`, with the chart formula as inverse (2.1). -/
theorem exists_stable_gt_equiv {n : ℕ} (l m g : TauCeti.DominantWeight (n + 1))
    (hGap : ∀ r : Fin n,
      m.1 0 - m.1 (Fin.last n) ≤ l.1 r.castSucc - l.1 r.succ) :
    ∃ e : FixedIntegerHive (productBoundary l m g) ≃
      {P : TauCeti.GTPattern (n + 1) //
        P.topRow = m.1 ∧ gtRowWeight P = g.1 - l.1},
      ∀ h v, h.1.value v =
        gtCompletion l (e h).1 (v.1 2).val (n + 1 - (v.1 0).val) := by
  sorry

/-- The hive model of the Littlewood–Richardson rule (Knutson–Tao–Woodward, *A positive
proof*, Theorem 1): for polynomial dominant weights the
product of Schur polynomials in `n` variables expands in Schur polynomials with hive
counts as coefficients (Knutson–Tao I, Theorem 4 with Appendix 2, Proposition 4, for
the hive form). The support is finite (1.2) and non-polynomial `γ` have count
zero. In more than `n` variables the identity fails: for `n = 1` and two variables
`s₍₁₎² = s₍₂₎ + s₍₁,₁₎`, while the rank-one hive count sees only `γ = (2)`. -/
theorem schur_mul_eq_finsum_hiveCount {n : ℕ} (lam μ : TauCeti.DominantWeight n)
    (hl : lam.IsPolynomial) (hm : μ.IsPolynomial) :
    TauCeti.diagramSchurPoly n ℤ lam.shape * TauCeti.diagramSchurPoly n ℤ μ.shape =
      ∑ᶠ γ : TauCeti.DominantWeight n,
        (hiveCount (productBoundary lam μ γ) : ℤ) •
          TauCeti.diagramSchurPoly n ℤ γ.shape := by
  sorry

open CategoryTheory MonoidalCategory in
/-- The hive model of the Littlewood–Richardson rule on the pinned rational Weyl modules
(Knutson–Tao–Woodward, *A positive proof*, Theorem 1; Knutson–Tao I, Theorem 4 with
Appendix 2): for all dominant weights `λ, μ, γ` of `GLₙ(ℂ)`, the dimension of the space
of intertwiners from `V_γ` to `V_λ ⊗ V_μ` in `FDRep ℂ (GL (Fin n) ℂ)` is the number of
integer hives with boundary `(λ, μ, γ*)`. The pin builds `TauCeti.rationalWeylFDRep ℂ n γ`
as an irreducible rational representation without identifying it as the irreducible of
highest weight `γ`; the statement is on the native objects as they are. -/
theorem finrank_hom_eq_hiveCount {n : ℕ} (lam μ γ : TauCeti.DominantWeight n) :
    Module.finrank ℂ (TauCeti.rationalWeylFDRep ℂ n γ ⟶
        TauCeti.rationalWeylFDRep ℂ n lam ⊗ TauCeti.rationalWeylFDRep ℂ n μ) =
      hiveCount (productBoundary lam μ γ) := by sorry

open CategoryTheory MonoidalCategory in
/-- The invariant form of the hive model (2.3; Knutson–Tao I, Theorem 4 with Appendix 2):
for all dominant weights `λ, μ, ν` of `GLₙ(ℂ)`, the dimension of the `GLₙ(ℂ)`-invariants of
`V_λ ⊗ V_μ ⊗ V_ν`, the space of morphisms from the unit object of
`FDRep ℂ (GL (Fin n) ℂ)`, is the number of integer hives with cyclic boundary `(λ, μ, ν)`. -/
theorem finrank_invariants_eq_hiveCount {n : ℕ} (lam μ ν : TauCeti.DominantWeight n) :
    Module.finrank ℂ (𝟙_ (FDRep ℂ (GL (Fin n) ℂ)) ⟶
        TauCeti.rationalWeylFDRep ℂ n lam ⊗ TauCeti.rationalWeylFDRep ℂ n μ ⊗
          TauCeti.rationalWeylFDRep ℂ n ν) =
      hiveCount ![lam.1, μ.1, ν.1] := by sorry

/-- Commutativity of the hive ring (2.3, 9.1): `c^γ_(λ,μ) = c^γ_(μ,λ)` for hive counts. -/
theorem hiveCount_comm {n : ℕ} (l m p : TauCeti.DominantWeight n) :
    hiveCount (productBoundary l m p) = hiveCount (productBoundary m l p) := by sorry

/-! ## Layer 2.6: the type-A Kostant partition function -/

namespace ChamberCounting

/-- The positive roots `e_i − e_j`, `i < j`, of type `A_{N−1}`, the simple intervals
included. -/
abbrev PositiveInterval (N : ℕ) := {p : Fin N × Fin N // p.1 < p.2}

/-- The consecutive-ones matrix: column `(i, j)` is `1` in simple-root positions
`i, …, j − 1`. -/
def intervalMatrix (N : ℕ) : Matrix (Fin (N-1)) (PositiveInterval N) ℤ :=
  fun k p => if p.1.1.val ≤ k.val ∧ k.val < p.1.2.val then 1 else 0

/-- The interval matrix is totally unimodular (2.6). -/
theorem intervalMatrix_totallyUnimodular (N : ℕ) :
    (intervalMatrix N).IsTotallyUnimodular := by sorry

/-- The type-A Kostant partition function in simple-root coordinates. -/
def typeACount (N : ℕ) (b : Fin (N-1) → ℤ) : ℕ := count (intervalMatrix N) b

/-- Chamberwise polynomiality of the type-A Kostant partition function: on each
chamber of the interval matrix the count is a polynomial in the simple-root
coordinates of total degree at most `(N-1)(N-2)/2`. -/
theorem typeA_exists_chamberPolynomial (N : ℕ) (hN : 2 ≤ N)
    (D : Chamber (intervalMatrix N)) :
    ∃ P : MvPolynomial (Fin (N-1)) ℚ, P.totalDegree ≤ (N-1)*(N-2)/2 ∧
      ∀ b : Fin (N-1) → ℤ, (fun i => (b i : ℝ)) ∈ chamberCell (intervalMatrix N) D.1 →
        MvPolynomial.eval (fun i => (b i : ℚ)) P = (typeACount N b : ℚ) := by sorry

section NativeComparison
variable {κ M M' : Type*} [Finite κ]
  [AddCommGroup M] [Module ℚ M] [AddCommGroup M'] [Module ℚ M']

/-- Simple-root coordinates for a root pairing of type `A_{N−1}`: an embedding of
`ℤ^{N−1}` whose columns are the positive roots, with the interval indexing. This is
data constructed from the type-A realization, not an assumption about counts. -/
structure RootCoordinates (N : ℕ) (P : RootPairing κ ℚ M M') (b : P.Base) where
  embed : (Fin (N-1) → ℤ) →+ M
  embed_injective : Function.Injective embed
  positiveIndex : PositiveInterval N ≃ {i : κ // i ∈ TauCeti.posRoots P b}
  column_eq : ∀ p, embed (fun k => intervalMatrix N k p) = P.root (positiveIndex p).1

/-- The interval-matrix count is the native Kostant partition function of the
type-A root pairing, through the simple-root coordinates (2.6). -/
theorem typeACount_eq_native {N : ℕ} {P : RootPairing κ ℚ M M'} {b : P.Base}
    (D : RootCoordinates N P b) (c : Fin (N-1) → ℤ) :
    typeACount N c = TauCeti.kostantPartition P b (D.embed c) := by sorry

end NativeComparison
end ChamberCounting

/-! ## Layer 3: octahedron recurrence and the excavation bijection -/

/-- Pairs of hives through an intermediate weight `σ`: the left bracketing. -/
def LeftPair {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :=
  Σ σ : TauCeti.DominantWeight n,
    FixedIntegerHive (productBoundary lam μ σ) ×
    FixedIntegerHive (productBoundary σ ν π)

/-- Pairs of hives through an intermediate weight `τ`: the right bracketing. -/
def RightPair {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :=
  Σ τ : TauCeti.DominantWeight n,
    FixedIntegerHive (productBoundary μ ν τ) ×
    FixedIntegerHive (productBoundary lam τ π)

/-- Associativity of the hive ring (3.2): both bracketings count the multiplicity of
`V_π` in `V_λ ⊗ V_μ ⊗ V_ν`, as `Σ_σ c^σ_(λ,μ) c^π_(σ,ν) = Σ_τ c^τ_(μ,ν) c^π_(λ,τ)`
(Knutson–Tao–Woodward, *A positive proof*, Theorem 2). -/
theorem card_leftPair_eq_card_rightPair {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :
    Nat.card (LeftPair lam μ ν π) = Nat.card (RightPair lam μ ν π) := by sorry

/-! ## Layer 4: honeycombs, overlay and saturation -/

/-- The type-A PRV theorem (4.4), by honeycomb overlay: for permutations `σ`, `τ` the
dominant rearrangement of `λ∘σ + μ∘τ` occurs in `V_λ ⊗ V_μ`. -/
theorem hiveCount_pos_prv {n : ℕ} (lam μ : TauCeti.DominantWeight n)
    (σ τ : Equiv.Perm (Fin n)) :
    0 < hiveCount (productBoundary lam μ
      (TauCeti.dominantWeightOf fun i => lam.1 (σ i) + μ.1 (τ i))) := by sorry

/-- Saturation (4.6; Knutson–Tao I, §6, Corollary to Theorem 3): an integral boundary with
a real hive has an integer hive. -/
theorem integral_witness_iff_real_witness {n : ℕ} (B : Fin 3 → Fin n → ℤ) :
    Nonempty (FixedIntegerHive B) ↔
      ∃ h : RealHive n, boundary h = fun s i => (B s i : ℝ) := by sorry

/-! ## Layer 6: Grassmannian cohomology and the puzzle rule -/

/-- Multiplicity-one stretching (6.8; Knutson–Tao–Woodward II, §6.1, Fulton's
conjecture): a boundary with exactly one hive keeps exactly one hive after dilation by
every `d ≥ 1`. -/
theorem hiveCount_smul_eq_one {n : ℕ} (B : Fin 3 → Fin n → ℤ) (hB : hiveCount B = 1)
    (d : ℕ) (hd : 1 ≤ d) : hiveCount (d • B) = 1 := by sorry

/-! ## Layer 7: Hermitian spectra and the weighted-flag bridge -/

/-- The sorted real spectrum of a Hermitian matrix, reindexed to `Fin n`. -/
def nativeMatrixSpectrum {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ)
    (hA : A.IsHermitian) : Fin n → ℝ := fun i =>
  hA.eigenvalues₀ (Fin.cast (by simp) i)

/-- `A` is Hermitian with sorted spectrum `α`. -/
def HasSpectrum {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) (α : Fin n → ℝ) : Prop :=
  ∃ hA : A.IsHermitian, α = nativeMatrixSpectrum A hA

/-- A zero-sum Hermitian triple with the prescribed sorted spectra exists. -/
def HermitianTripleFeasible {n : ℕ} (B : Fin 3 → Fin n → ℝ) : Prop :=
  ∃ A : Fin 3 → Matrix (Fin n) (Fin n) ℂ,
    (∀ s, HasSpectrum (A s) (B s)) ∧ ∑ s, A s = 0

/-- The Hermitian form of the Horn problem (7.4): a zero-sum Hermitian triple with
spectra `B` exists exactly when `B` is the boundary of a real hive. -/
theorem hermitian_iff_hive {n : ℕ} (B : Fin 3 → Fin n → ℝ) :
    HermitianTripleFeasible B ↔ ∃ h : RealHive n, boundary h = B := by sorry

end TauCetiRoadmap.TensorProductCombinatorics
