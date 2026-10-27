import Mathlib
import TauCeti.RepresentationTheory.ClassicalGroups.DominantWeight
import TauCeti.Analysis.Convex.Polyhedron
import TauCeti.LinearAlgebra.RootSystem.Positive
import TauCeti.LinearAlgebra.RootSystem.KostantPartition.Basic

/-!
# Tensor product combinatorics: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states headline
theorems of the roadmap against the pinned Mathlib and Tau Ceti APIs, with only
the simple definitions those statements need.

The following constructions are data whose construction is itself the work of
the roadmap, so they are README targets and are not declared here: the map from
hives to native Gelfand–Tsetlin patterns (H2.1), the excavation associator and
the hive commutor as bijections (H3, H9; their count consequences
`hiveCount_comm` and `card_leftPair_eq_card_rightPair` are stated), the
hive–honeycomb correspondence and its dual-edge directions (H4), the type-A path
raising operators (H8), puzzle pieces with their edge labels and the puzzle
boundary word (H6), the chamber polynomials as functions of the chamber (H1.5;
their existence and wall agreement are stated) and the fibre equivalence with
native Kostant partitions (H2.6; the count identity is stated).
-/

noncomputable section
open scoped BigOperators
namespace TensorProductCombinatorics

/-- Finite barycentric lattice, with all three coordinates retained. -/
abbrev Vertex (n : ℕ) := {v : Fin 3 → Fin (n + 1) // ∑ i, (v i).val = n}

def origin (n : ℕ) : Vertex n :=
  ⟨![⟨n, by omega⟩, 0, 0], by simp [Fin.sum_univ_succ]⟩

def sqDist {n : ℕ} (a b : Vertex n) : ℤ :=
  ∑ i, (((a.1 i).val : ℤ) - ((b.1 i).val : ℤ))^2

/-- Corners0/2 lie on the short diagonal; corners1/3 on the long diagonal. -/
def IsRhombus {n : ℕ} (q : Fin 4 → Vertex n) : Prop :=
  sqDist (q 0) (q 1) = 2 ∧ sqDist (q 1) (q 2) = 2 ∧
  sqDist (q 2) (q 3) = 2 ∧ sqDist (q 3) (q 0) = 2 ∧
  sqDist (q 0) (q 2) = 2 ∧ sqDist (q 1) (q 3) = 6

structure Hive (n : ℕ) (R : Type*) [AddCommGroup R] [PartialOrder R] where
  value : Vertex n → R
  normalized : value (origin n) = 0
  rhombus : ∀ q : Fin 4 → Vertex n, IsRhombus q →
    value (q 1) + value (q 3) ≤ value (q 0) + value (q 2)

abbrev IntegerHive (n : ℕ) := Hive n ℤ
abbrev RealHive (n : ℕ) := Hive n ℝ

/-- Three cyclic edge paths A→B→C→A. -/
def edgePoint (n : ℕ) (s : Fin 3) (k : Fin (n + 1)) : Vertex n := by
  by_cases hs : s.val = 0
  · exact ⟨![⟨n-k.val, by omega⟩, k, 0], by simp [Fin.sum_univ_succ]; omega⟩
  by_cases hs₁ : s.val = 1
  · exact ⟨![0, ⟨n-k.val, by omega⟩, k], by simp [Fin.sum_univ_succ]; omega⟩
  · exact ⟨![k, 0, ⟨n-k.val, by omega⟩], by simp [Fin.sum_univ_succ]; omega⟩

def boundary {n : ℕ} {R : Type*} [AddCommGroup R] [PartialOrder R]
    (h : Hive n R) : Fin 3 → Fin n → R := fun s i =>
  h.value (edgePoint n s ⟨i.val+1, by omega⟩) -
    h.value (edgePoint n s ⟨i.val, by omega⟩)

theorem boundary_antitone {n : ℕ} (h : IntegerHive n) (s : Fin 3) :
    Antitone (boundary h s) := by sorry

theorem boundary_antitone_real {n : ℕ} (h : RealHive n) (s : Fin 3) :
    Antitone (boundary h s) := by sorry

theorem boundary_trace {n : ℕ} (h : IntegerHive n) :
    ∑ s, ∑ i, boundary h s i = 0 := by sorry

abbrev FixedIntegerHive {n : ℕ} (B : Fin 3 → Fin n → ℤ) :=
  {h : IntegerHive n // boundary h = B}

/-- Each fixed-boundary fibre of integer hives is finite. -/
theorem finite_fixedIntegerHive {n : ℕ} (B : Fin 3 → Fin n → ℤ) :
    Finite (FixedIntegerHive B) := by sorry

def hiveCount {n : ℕ} (B : Fin 3 → Fin n → ℤ) : ℕ :=
  Nat.card (FixedIntegerHive B)

/-- The actual cast comparison, including the inequality proof. -/
def castReal {n : ℕ} (h : IntegerHive n) : RealHive n where
  value v := (h.value v : ℝ)
  normalized := by simp [h.normalized]
  rhombus q hq := by exact_mod_cast h.rhombus q hq

theorem boundary_castReal {n : ℕ} (h : IntegerHive n) (s : Fin 3) (i : Fin n) :
    boundary (castReal h) s i = ((boundary (R := ℤ) h s i : ℤ) : ℝ) := by
  simp [boundary, castReal]

/-- Saturation requires the entire boundary to be integral. -/
theorem integral_witness_iff_real_witness {n : ℕ} (B : Fin 3 → Fin n → ℤ) :
    Nonempty (FixedIntegerHive B) ↔
      ∃ h : RealHive n, boundary h = fun s i => (B s i : ℝ) := by sorry

/-- Ambient real fibre predicate, using native polyhedron vocabulary. -/
def realFibre {n : ℕ} (B : Fin 3 → Fin n → ℝ) : Set (Vertex n → ℝ) :=
  {v | ∃ h : RealHive n, h.value = v ∧ boundary h = B}

theorem realFibre_polyhedron {n : ℕ} (B : Fin 3 → Fin n → ℝ) :
    TauCeti.IsConvexPolyhedron (realFibre B) := by sorry

theorem realFibre_compact {n : ℕ} (B : Fin 3 → Fin n → ℝ) :
    IsCompact (realFibre B) := by sorry

/-- Local octahedron move; all five input labels are visible. -/
def octahedronMove (a b c d e : ℤ) : ℤ := max (a+c) (b+d) - e

theorem octahedronMove_involutive (a b c d e : ℤ) :
    octahedronMove a b c d (octahedronMove a b c d e) = e := by
  unfold octahedronMove
  omega

def dualWeight {n : ℕ} (lam : TauCeti.DominantWeight n) : TauCeti.DominantWeight n := by
  refine ⟨fun i => -lam.1 i.rev, ?_⟩
  intro i j hij
  apply neg_le_neg
  exact lam.2 (by simpa using hij)

def productBoundary {n : ℕ} (lam μ γ : TauCeti.DominantWeight n) :
    Fin 3 → Fin n → ℤ := ![lam.1, μ.1, (dualWeight γ).1]

def LeftPair {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :=
  Σ σ : TauCeti.DominantWeight n,
    FixedIntegerHive (productBoundary lam μ σ) ×
    FixedIntegerHive (productBoundary σ ν π)

def RightPair {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :=
  Σ τ : TauCeti.DominantWeight n,
    FixedIntegerHive (productBoundary μ ν τ) ×
    FixedIntegerHive (productBoundary lam τ π)

/-- Associativity of the hive ring (H2, H3): both bracketings count the
multiplicity of `V_π` in `V_λ ⊗ V_μ ⊗ V_ν`, as
`Σ_σ c^σ_(λ,μ) c^π_(σ,ν) = Σ_τ c^τ_(μ,ν) c^π_(λ,τ)`. -/
theorem card_leftPair_eq_card_rightPair {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :
    Nat.card (LeftPair lam μ ν π) = Nat.card (RightPair lam μ ν π) := by sorry

/-- Commutativity of the hive ring (H2, H9): `c^γ_(λ,μ) = c^γ_(μ,λ)` for hive counts. -/
theorem hiveCount_comm {n : ℕ} (l m p : TauCeti.DominantWeight n) :
    hiveCount (productBoundary l m p) = hiveCount (productBoundary m l p) := by sorry

/-- Finite binary-word index; positions are the Grassmannian subspace convention. -/
abbrev BinaryWord (N k : ℕ) :=
  {w : Fin N → Bool // (Finset.univ.filter fun i => w i = true).card = k}

/-- Native finite module underlying the puzzle ring. -/
abbrev PuzzleModule (N k : ℕ) := BinaryWord N k →₀ ℤ

/-- Reindex the native sorted matrix spectrum to Fin n; no private spectral construction. -/
def nativeMatrixSpectrum {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ)
    (hA : A.IsHermitian) : Fin n → ℝ := fun i =>
  hA.eigenvalues₀ (Fin.cast (by simp) i)

def HasSpectrum {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) (α : Fin n → ℝ) : Prop :=
  ∃ hA : A.IsHermitian, α = nativeMatrixSpectrum A hA

theorem hasSpectrum_iff_charpoly {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ)
    (α : Fin n → ℝ) :
    HasSpectrum A α ↔ A.IsHermitian ∧ Antitone α ∧
      A.charpoly = ∏ i, (Polynomial.X - Polynomial.C (α i : ℂ)) := by sorry

/-- Native matrix objects, sorted real spectra and a genuine zero-sum condition. -/
def HermitianTripleFeasible {n : ℕ} (B : Fin 3 → Fin n → ℝ) : Prop :=
  ∃ A : Fin 3 → Matrix (Fin n) (Fin n) ℂ,
    (∀ s, HasSpectrum (A s) (B s)) ∧ ∑ s, A s = 0

theorem hermitian_iff_hive {n : ℕ} (B : Fin 3 → Fin n → ℝ) :
    HermitianTripleFeasible B ↔ ∃ h : RealHive n, boundary h = B := by sorry


/-- A finite rational path presentation; H8 constructs the reparametrization quotient. -/
structure RationalPath (n : ℕ) where
  segments : ℕ
  time : Fin (segments+1) → ℚ
  vertex : Fin (segments+1) → Fin n → ℚ
  time_strict : StrictMono time
  time_start : time 0 = 0
  time_end : time (Fin.last segments) = 1
  vertex_start : vertex 0 = 0
  end_integral : ∀ i, ∃ z : ℤ, vertex (Fin.last segments) i = (z : ℚ)

def pathEndpoint {n : ℕ} (p : RationalPath n) : Fin n → ℚ :=
  p.vertex (Fin.last p.segments)

end TensorProductCombinatorics

/-! ## H1.5 / H2.6: pointed unimodular counting and the native type-A adapter
 -/
namespace TensorProductCombinatorics.ChamberCounting
open scoped BigOperators

variable {r : ℕ} {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The actual nonnegative integer solutions, not a postulated finite set. -/
abbrev Fibre (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ) :=
  {c : ι → ℕ // ∀ i, ∑ j, A i j * (c j : ℤ) = b i}

def count (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ) : ℕ :=
  Nat.card (Fibre A b)

def realFibre (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℝ) : Set (ι → ℝ) :=
  {x | (∀ j, 0 ≤ x j) ∧ ∀ i, ∑ j, (A i j : ℝ) * x j = b i}

def supportCone (A : Matrix (Fin r) ι ℤ) : Set (Fin r → ℝ) :=
  {b | ∃ x : ι → ℝ, x ∈ realFibre A b}

theorem realFibre_polyhedron (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℝ) :
    TauCeti.IsConvexPolyhedron (realFibre A b) := by sorry

theorem finite_fibre (A : Matrix (Fin r) ι ℤ) (h : Fin r → ℤ)
    (hpos : ∀ j, 0 < ∑ i, h i * A i j) (b : Fin r → ℤ) :
    Finite (Fibre A b) := by sorry

theorem realFibre_compact (A : Matrix (Fin r) ι ℤ) (h : Fin r → ℤ)
    (hpos : ∀ j, 0 < ∑ i, h i * A i j) (b : Fin r → ℝ) :
    IsCompact (realFibre A b) := by sorry

theorem exists_integer_height (A : Matrix (Fin r) ι ℤ)
    (hpointed : ∀ x : ι → ℝ, (∀ j, 0 ≤ x j) →
      (∀ i, ∑ j, (A i j : ℝ) * x j = 0) → x = 0) :
    ∃ h : Fin r → ℤ, ∀ j, 0 < ∑ i, h i * A i j := by sorry

/-- Every ordered independent column basis is retained as actual data. -/
abbrev ColumnBasis (A : Matrix (Fin r) ι ℤ) :=
  {e : Fin r → ι // Function.Injective e ∧ (A.submatrix id e).det ≠ 0}

def basisCoordinates (A : Matrix (Fin r) ι ℤ) (B : ColumnBasis A)
    (x : Fin r → ℝ) : Fin r → ℝ :=
  Matrix.mulVec ((A.submatrix id B.1).map (Int.castRingHom ℝ))⁻¹ x

abbrev WallIndex (A : Matrix (Fin r) ι ℤ) := ColumnBasis A × Fin r

def chamberCell (A : Matrix (Fin r) ι ℤ) (s : WallIndex A → Bool) :
    Set (Fin r → ℝ) :=
  {x | x ∈ supportCone A ∧ ∀ B : ColumnBasis A, ∀ i,
    if s (B, i) then 0 ≤ basisCoordinates A B x i
    else basisCoordinates A B x i ≤ 0}

/-- Full-dimensional closed cells INSIDE support; exterior zero is not a cell here. -/
abbrev Chamber (A : Matrix (Fin r) ι ℤ) :=
  {s : WallIndex A → Bool // (interior (chamberCell A s)).Nonempty}

omit [DecidableEq ι] in
theorem finite_chambers (A : Matrix (Fin r) ι ℤ) : Finite (Chamber A) := by
  classical
  infer_instance

theorem chamber_polyhedron (A : Matrix (Fin r) ι ℤ) (D : Chamber A) :
    TauCeti.IsConvexPolyhedron (chamberCell A D.1) := by sorry

theorem support_covered (A : Matrix (Fin r) ι ℤ)
    (hfull : Function.Surjective (fun x : ι → ℚ =>
      fun i => ∑ j, (A i j : ℚ) * x j)) :
    ∀ x ∈ supportCone A, ∃ D : Chamber A, x ∈ chamberCell A D.1 := by sorry

omit [Fintype ι] [DecidableEq ι] in
theorem unit_maximal_minors_of_totallyUnimodular
    (A : Matrix (Fin r) ι ℤ) (hA : A.IsTotallyUnimodular)
    (e : Fin r → ι) (he : Function.Injective e) :
    (A.submatrix id e).det = 0 ∨ (A.submatrix id e).det = 1 ∨
      (A.submatrix id e).det = -1 := by
  rcases hA r id e Function.injective_id he with ⟨s, hs⟩
  cases s <;> simp_all

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

theorem count_eq_zero_outside (A : Matrix (Fin r) ι ℤ) (b : Fin r → ℤ)
    (hb : (fun i => (b i : ℝ)) ∉ supportCone A) : count A b = 0 := by sorry

/-- Intervals index actual positive roots e_i-e_j, including the simple intervals. -/
abbrev PositiveInterval (N : ℕ) := {p : Fin N × Fin N // p.1 < p.2}

def intervalMatrix (N : ℕ) : Matrix (Fin (N-1)) (PositiveInterval N) ℤ :=
  fun k p => if p.1.1.val ≤ k.val ∧ k.val < p.1.2.val then 1 else 0

theorem intervalMatrix_totallyUnimodular (N : ℕ) :
    (intervalMatrix N).IsTotallyUnimodular := by sorry

theorem intervalMatrix_height (N : ℕ) (p : PositiveInterval N) :
    0 < ∑ k, intervalMatrix N k p := by sorry

theorem intervalMatrix_fullrank (N : ℕ) :
    Function.Surjective (fun x : PositiveInterval N → ℚ =>
      fun i => ∑ p, (intervalMatrix N i p : ℚ) * x p) := by sorry

def typeACount (N : ℕ) (b : Fin (N-1) → ℤ) : ℕ := count (intervalMatrix N) b

theorem typeA_support (N : ℕ) : supportCone (intervalMatrix N) =
    {b | ∀ i, 0 ≤ b i} := by sorry

theorem typeA_degree_arithmetic (N : ℕ) (hN : 2 ≤ N) :
    Fintype.card (PositiveInterval N) - (N-1) = (N-1)*(N-2)/2 := by sorry

theorem typeA_rank_one (a : ℤ) :
    typeACount 2 ![a] = if 0 ≤ a then 1 else 0 := by sorry

theorem typeA_A2 (a b : ℤ) :
    typeACount 3 ![a,b] = if 0 ≤ a ∧ 0 ≤ b then (min a b + 1).toNat else 0 := by sorry

/-- Chamberwise polynomiality of the type-A Kostant partition function: on each
chamber of the interval matrix the count is a polynomial in the simple-root
coordinates of total degree at most `(N-1)(N-2)/2`. -/
theorem typeA_exists_chamberPolynomial (N : ℕ) (hN : 2 ≤ N)
    (D : Chamber (intervalMatrix N)) :
    ∃ P : MvPolynomial (Fin (N-1)) ℚ, P.totalDegree ≤ (N-1)*(N-2)/2 ∧
      ∀ b : Fin (N-1) → ℤ, (fun i => (b i : ℝ)) ∈ chamberCell (intervalMatrix N) D.1 →
        MvPolynomial.eval (fun i => (b i : ℚ)) P = (typeACount N b : ℚ) := by sorry

theorem typeA_empty (N : ℕ) (hN : N ≤ 1) : typeACount N 0 = 1 := by sorry

section NativeComparison
variable {κ M M' : Type*} [Finite κ]
  [AddCommGroup M] [Module ℚ M] [AddCommGroup M'] [Module ℚ M']

/-- Constructed from the specified type-A realization; NOT an assumption about counts. -/
structure RootCoordinates (N : ℕ) (P : RootPairing κ ℚ M M') (b : P.Base) where
  embed : (Fin (N-1) → ℤ) →+ M
  embed_injective : Function.Injective embed
  positiveIndex : PositiveInterval N ≃ {i : κ // i ∈ TauCeti.posRoots P b}
  column_eq : ∀ p, embed (fun k => intervalMatrix N k p) = P.root (positiveIndex p).1

/-- The interval-matrix count is the native Kostant partition function of the
type-A root pairing, through the simple-root coordinates. -/
theorem typeACount_eq_native {N : ℕ} {P : RootPairing κ ℚ M M'} {b : P.Base}
    (D : RootCoordinates N P b) (c : Fin (N-1) → ℤ) :
    typeACount N c = TauCeti.kostantPartition P b (D.embed c) := by sorry

end NativeComparison
end TensorProductCombinatorics.ChamberCounting
