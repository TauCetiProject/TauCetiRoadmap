/-
Suggested target forms, not an exhaustive checklist. The README is definitive.
New constructions and unproved targets use `sorry` honestly; native weights,
GT patterns, tableaux, Schur polynomials and polyhedral predicates are imported.
-/
import TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Tableau
import TauCeti.RepresentationTheory.ClassicalGroups.GelfandTsetlin.Count
import TauCeti.RingTheory.MvPolynomial.Symmetric.Schur.Basic
import TauCeti.Topology.PL.Map
import TauCeti.Geometry.Convex.Cone.Alternative
import Mathlib.Analysis.InnerProductSpace.Spectrum
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.LinearAlgebra.Matrix.Hermitian
import Mathlib.Topology.Instances.Int
import Mathlib.Tactic
import TauCeti.LinearAlgebra.RootSystem.KostantPartition.Basic
import Mathlib.LinearAlgebra.Matrix.Determinant.TotallyUnimodular
import Mathlib.LinearAlgebra.Matrix.NonsingularInverse
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.Algebra.MvPolynomial.Degrees

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

noncomputable instance {n : ℕ} (B : Fin 3 → Fin n → ℤ) :
    Finite (FixedIntegerHive B) := by sorry

def hiveCount {n : ℕ} (B : Fin 3 → Fin n → ℤ) : ℕ :=
  Nat.card (FixedIntegerHive B)

/-- The actual cast comparison, including the inequality proof. -/
def castReal {n : ℕ} : IntegerHive n → RealHive n := by sorry

theorem boundary_castReal {n : ℕ} (h : IntegerHive n) (s : Fin 3) (i : Fin n) :
    boundary (castReal h) s i = ((boundary (R := ℤ) h s i : ℤ) : ℝ) := by sorry

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

/-- Native GT carrier: the image constraints and boundary formulas belong in the README. -/
def hiveToGT {n : ℕ} : IntegerHive n → TauCeti.GTPattern n := by sorry

theorem hiveToGT_injective_on_boundary {n : ℕ} (h k : IntegerHive n)
    (hB : boundary h = boundary k) (hP : hiveToGT h = hiveToGT k) : h = k := by sorry

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

/-- Must be built by the complete excavation, not selected from equal cardinalities. -/
def excavationAssociator {n : ℕ} (lam μ ν π : TauCeti.DominantWeight n) :
    LeftPair lam μ ν π ≃ RightPair lam μ ν π := by sorry

/-- The bounded-recurrence map, after the tableau comparison in H9. -/
def hiveCommutor {n : ℕ} (l m p : TauCeti.DominantWeight n) :
    FixedIntegerHive (productBoundary l m p) ≃
    FixedIntegerHive (productBoundary m l p) := by sorry

theorem hiveCommutor_twice {n : ℕ} (l m p : TauCeti.DominantWeight n)
    (h : FixedIntegerHive (productBoundary l m p)) :
    hiveCommutor m l p (hiveCommutor l m p h) = h := by sorry

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


/-- An unordered unit triangle in the same finite lattice. -/
abbrev UnitTriangle (n : ℕ) := {t : Finset (Vertex n) //
  t.card = 3 ∧ ∀ a ∈ t, ∀ b ∈ t, a ≠ b → sqDist a b = 2}

/-- Signed dual-edge normal in the integral coordinate-direction plane.
The construction assigns zero to non-adjacent triangles. -/
def finiteEdgeDirection {n : ℕ} : UnitTriangle n → UnitTriangle n → Fin 3 → ℤ := by sorry

structure HoneycombConfiguration (n : ℕ) where
  position : UnitTriangle n → Fin 3 → ℝ
  sum_zero : ∀ t, ∑ k, position t k = 0
  oriented_edge : ∀ t u, (t.1 ∩ u.1).card = 2 →
    ∃ r : ℝ, 0 ≤ r ∧ ∀ k,
      position u k - position t k = r * (finiteEdgeDirection t u k : ℝ)

/-- Fixed dual graph, before contractions and coincident-edge diagram quotient. -/
def hiveHoneycombEquiv (n : ℕ) : RealHive n ≃ HoneycombConfiguration n := by sorry

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

/-- Ambient running-extremum operator on the canonical representative. -/
def pathRaise {n : ℕ} : Fin (n-1) → RationalPath n →
    Option (RationalPath n) := by sorry

def simpleRoot {n : ℕ} (i : Fin (n-1)) : Fin n → ℚ := fun j =>
  (if j.val = i.val then 1 else 0) - (if j.val = i.val+1 then 1 else 0)

theorem pathRaise_endpoint {n : ℕ} (i : Fin (n-1)) (p q : RationalPath n)
    (h : pathRaise i p = some q) :
    pathEndpoint q = pathEndpoint p + simpleRoot i := by sorry

abbrev FixedRealHive {n : ℕ} (B : Fin 3 → Fin n → ℝ) :=
  {h : RealHive n // boundary h = B}

/-- Antitone real boundary weights retain all continuous intermediate labels. -/
abbrev RealDominantWeight (n : ℕ) := {w : Fin n → ℝ // Antitone w}

def dualRealWeight {n : ℕ} (l : RealDominantWeight n) : RealDominantWeight n := by
  refine ⟨fun i => -l.1 i.rev, ?_⟩
  intro i j hij
  apply neg_le_neg
  exact l.2 (by simpa using hij)

def realProductBoundary {n : ℕ} (l m p : RealDominantWeight n) :
    Fin 3 → Fin n → ℝ := ![l.1, m.1, (dualRealWeight p).1]

/-- The real associator includes real intermediate weights, even at integral outer boundary. -/
def realExcavationAssociator {n : ℕ} (l m v p : RealDominantWeight n) :
    (Σ s : RealDominantWeight n,
      FixedRealHive (realProductBoundary l m s) ×
      FixedRealHive (realProductBoundary s v p)) ≃
    (Σ t : RealDominantWeight n,
      FixedRealHive (realProductBoundary m v t) ×
      FixedRealHive (realProductBoundary l t p)) := by sorry

/-- Orientation determinant in coordinates (z,y); negative is clockwise. -/
def orientation {n : ℕ} (a b c : Vertex n) : ℤ :=
  (((b.1 2).val : ℤ)-((a.1 2).val : ℤ))*(((c.1 1).val : ℤ)-((a.1 1).val : ℤ)) -
  (((b.1 1).val : ℤ)-((a.1 1).val : ℤ))*(((c.1 2).val : ℤ)-((a.1 2).val : ℤ))

def vertexCode {n : ℕ} (a : Vertex n) : ℕ :=
  (a.1 0).val + (n+1)*(a.1 1).val + (n+1)^2*(a.1 2).val

/-- Choose the smaller obtuse corner as corner0, eliminating rotational duplicates. -/
abbrev PuzzleRhombus (n : ℕ) := {q : Fin 4 → Vertex n //
  IsRhombus q ∧ orientation (q 0) (q 1) (q 2) < 0 ∧
    vertexCode (q 0) < vertexCode (q 2)}

abbrev PuzzlePiece (n : ℕ) := (UnitTriangle n × Bool) ⊕ PuzzleRhombus n

/-- One monochromatic triangle or the two triangles on a rhombus's short diagonal. -/
def pieceCells {n : ℕ} : PuzzlePiece n → Finset (UnitTriangle n) := by sorry

/-- Some0/1 only on outer edges of the piece; every other edge returns none.
Rhombus labels alternate true,false,true,false clockwise from its corner0. -/
def pieceLabel {n : ℕ} : PuzzlePiece n → Finset (Vertex n) → Option Bool := by sorry

structure Puzzle (n : ℕ) where
  tiles : Finset (PuzzlePiece n)
  covers_once : ∀ t : UnitTriangle n, ∃! p,
    p ∈ tiles ∧ t ∈ pieceCells p
  edge_matches : ∀ p ∈ tiles, ∀ q ∈ tiles, ∀ e, ∀ a b : Bool,
    pieceLabel p e = some a → pieceLabel q e = some b → a = b

/-- Reads each outer edge along the cyclic edgePoint s path. -/
def puzzleBoundary {n : ℕ} : Puzzle n → Fin 3 → Fin n → Bool := by sorry

theorem puzzle_boundary_balance {n : ℕ} (p : Puzzle n) (s t : Fin 3) :
    (Finset.univ.filter fun i => puzzleBoundary p s i = true).card =
    (Finset.univ.filter fun i => puzzleBoundary p t i = true).card := by sorry

end TensorProductCombinatorics

/-! ## H1.5 / H2.6: pointed unimodular counting and the native type-A adapter

These are prospective target signatures, not an exhaustive checklist or compiled proof.
All data-valued admissions have whole-function types retaining the actual inputs.
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

/-- The actual rational coefficient family. Height, matrix and chamber are retained. -/
def chamberPolynomial : (A : Matrix (Fin r) ι ℤ) →
    (h : Fin r → ℤ) → (∀ j, 0 < ∑ i, h i * A i j) →
    Function.Surjective (fun x : ι → ℚ => fun i => ∑ j, (A i j : ℚ) * x j) →
    (∀ e : Fin r → ι, Function.Injective e →
      (A.submatrix id e).det = 0 ∨ (A.submatrix id e).det = 1 ∨
        (A.submatrix id e).det = -1) →
    Chamber A → MvPolynomial (Fin r) ℚ := by sorry

theorem chamberPolynomial_eval (A : Matrix (Fin r) ι ℤ)
    (h : Fin r → ℤ) (hpos : ∀ j, 0 < ∑ i, h i * A i j)
    (hfull : Function.Surjective (fun x : ι → ℚ =>
      fun i => ∑ j, (A i j : ℚ) * x j))
    (hunit : ∀ e : Fin r → ι, Function.Injective e →
      (A.submatrix id e).det = 0 ∨ (A.submatrix id e).det = 1 ∨
        (A.submatrix id e).det = -1)
    (D : Chamber A) (b : Fin r → ℤ)
    (hb : (fun i => (b i : ℝ)) ∈ chamberCell A D.1) :
    MvPolynomial.eval (fun i => (b i : ℚ))
      (chamberPolynomial A h hpos hfull hunit D) = (count A b : ℚ) := by sorry

theorem chamberPolynomial_degree (A : Matrix (Fin r) ι ℤ)
    (h : Fin r → ℤ) (hpos : ∀ j, 0 < ∑ i, h i * A i j)
    (hfull : Function.Surjective (fun x : ι → ℚ =>
      fun i => ∑ j, (A i j : ℚ) * x j))
    (hunit : ∀ e : Fin r → ι, Function.Injective e →
      (A.submatrix id e).det = 0 ∨ (A.submatrix id e).det = 1 ∨
        (A.submatrix id e).det = -1) (D : Chamber A) :
    (chamberPolynomial A h hpos hfull hunit D).totalDegree ≤ Fintype.card ι - r := by sorry

theorem chamberPolynomial_wall (A : Matrix (Fin r) ι ℤ)
    (h : Fin r → ℤ) (hpos : ∀ j, 0 < ∑ i, h i * A i j)
    (hfull : Function.Surjective (fun x : ι → ℚ =>
      fun i => ∑ j, (A i j : ℚ) * x j))
    (hunit : ∀ e : Fin r → ι, Function.Injective e →
      (A.submatrix id e).det = 0 ∨ (A.submatrix id e).det = 1 ∨
        (A.submatrix id e).det = -1)
    (D E : Chamber A) (x : Fin r → ℝ)
    (hD : x ∈ chamberCell A D.1) (hE : x ∈ chamberCell A E.1) :
    MvPolynomial.eval₂ (algebraMap ℚ ℝ) x (chamberPolynomial A h hpos hfull hunit D) =
      MvPolynomial.eval₂ (algebraMap ℚ ℝ) x
        (chamberPolynomial A h hpos hfull hunit E) := by sorry

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

abbrev RootLattice (N : ℕ) := {z : Fin N → ℤ // ∑ i, z i = 0}

def simpleCoordinates {N : ℕ} (z : RootLattice N) : Fin (N-1) → ℤ :=
  fun k => ∑ i : Fin N, if i.val ≤ k.val then z.1 i else 0

def rootVector (N : ℕ) (c : Fin (N-1) → ℤ) : RootLattice N :=
  ⟨fun j => ∑ k, c k * ((if j.val = k.val then 1 else 0) -
    (if j.val = k.val+1 then 1 else 0)), by sorry⟩

def rootLatticeEquiv (N : ℕ) : RootLattice N ≃ (Fin (N-1) → ℤ) where
  toFun := simpleCoordinates
  invFun := rootVector N
  left_inv := by sorry
  right_inv := by sorry

def typeACount (N : ℕ) (b : Fin (N-1) → ℤ) : ℕ := count (intervalMatrix N) b

theorem typeA_support (N : ℕ) : supportCone (intervalMatrix N) =
    {b | ∀ i, 0 ≤ b i} := by sorry

theorem typeA_degree_arithmetic (N : ℕ) (hN : 2 ≤ N) :
    Fintype.card (PositiveInterval N) - (N-1) = (N-1)*(N-2)/2 := by sorry

theorem typeA_rank_one (a : ℤ) :
    typeACount 2 ![a] = if 0 ≤ a then 1 else 0 := by sorry

theorem typeA_A2 (a b : ℤ) :
    typeACount 3 ![a,b] = if 0 ≤ a ∧ 0 ≤ b then (min a b + 1).toNat else 0 := by sorry

/-- The specialization is defined by the generic family, not admitted again. -/
def typeAPolynomial (N : ℕ) (D : Chamber (intervalMatrix N)) :
    MvPolynomial (Fin (N-1)) ℚ :=
  chamberPolynomial (intervalMatrix N) (fun _ => 1)
    (fun p => by simpa using intervalMatrix_height N p)
    (intervalMatrix_fullrank N)
    (unit_maximal_minors_of_totallyUnimodular (intervalMatrix N)
      (intervalMatrix_totallyUnimodular N)) D

theorem typeAPolynomial_eval (N : ℕ) (D : Chamber (intervalMatrix N))
    (b : Fin (N-1) → ℤ)
    (hb : (fun i => (b i : ℝ)) ∈ chamberCell (intervalMatrix N) D.1) :
    MvPolynomial.eval (fun i => (b i : ℚ)) (typeAPolynomial N D) =
      (typeACount N b : ℚ) := by sorry

theorem typeAPolynomial_degree (N : ℕ) (hN : 2 ≤ N)
    (D : Chamber (intervalMatrix N)) :
    (typeAPolynomial N D).totalDegree ≤ (N-1)*(N-2)/2 := by sorry

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

/-- The full fibre equivalence extends by zero on negative roots. All data remain inputs. -/
def nativePartitionEquiv {N : ℕ} {P : RootPairing κ ℚ M M'} {b : P.Base} :
    (D : RootCoordinates N P b) → (c : Fin (N-1) → ℤ) →
    Fibre (intervalMatrix N) c ≃
      {d : κ → ℕ // TauCeti.IsKostantPartition P b (D.embed c) d} := by sorry

theorem typeACount_eq_native {N : ℕ} {P : RootPairing κ ℚ M M'} {b : P.Base}
    (D : RootCoordinates N P b) (c : Fin (N-1) → ℤ) :
    typeACount N c = TauCeti.kostantPartition P b (D.embed c) := by
  exact Nat.card_congr (nativePartitionEquiv D c)

end NativeComparison
end TensorProductCombinatorics.ChamberCounting
