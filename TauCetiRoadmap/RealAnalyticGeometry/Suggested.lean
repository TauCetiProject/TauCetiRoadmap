import Mathlib.Analysis.Analytic.Basic
import Mathlib.Analysis.Convex.Intrinsic
import Mathlib.Analysis.Convex.SimplicialComplex.Basic
import Mathlib.Geometry.Manifold.IsManifold.ExtChartAt
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Projectivization.Basic
import Mathlib.Topology.Defs.Induced
import Mathlib.Topology.Maps.Proper.Basic
import TauCeti.Analysis.Analytic.Submanifold.Basic
import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Function

/-!
# Real analytic geometry: suggested target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive specification is
`README.md`. The `sorry`s below are honest theorem targets. In particular, these declarations
only prototype finite-dimensional local models; the README specifies the manifold, Stein, and
triangulation APIs that make them useful.
-/

noncomputable section
open scoped ContDiff Manifold

namespace TauCetiRoadmap.RealAnalyticGeometry

abbrev RealCoordinates (n : ℕ) := Fin n → ℝ
/-- A scalar function analytic on some neighborhood of the fixed point. -/
structure LocalAnalyticFunction (n : ℕ) (x : RealCoordinates n) where
  toFun : RealCoordinates n → ℝ
  radius : ℝ
  radius_pos : 0 < radius
  analyticOnBall : AnalyticOnNhd ℝ toFun (Metric.ball x radius)

inductive SemiAnalyticFormula (n : ℕ) (x : RealCoordinates n) : Type
  | zeroSet : LocalAnalyticFunction n x → SemiAnalyticFormula n x
  | positiveSet : LocalAnalyticFunction n x → SemiAnalyticFormula n x
  | top : SemiAnalyticFormula n x
  | bottom : SemiAnalyticFormula n x
  | compl : SemiAnalyticFormula n x → SemiAnalyticFormula n x
  | inter : SemiAnalyticFormula n x → SemiAnalyticFormula n x → SemiAnalyticFormula n x
  | union : SemiAnalyticFormula n x → SemiAnalyticFormula n x → SemiAnalyticFormula n x

def SemiAnalyticFormula.realize {n : ℕ} {x : RealCoordinates n} :
    SemiAnalyticFormula n x → Set (RealCoordinates n)
  | .zeroSet f => {y | f.toFun y = 0}
  | .positiveSet f => {y | 0 < f.toFun y}
  | .top => Set.univ
  | .bottom => ∅
  | .compl p => (p.realize)ᶜ
  | .inter p q => p.realize ∩ q.realize
  | .union p q => p.realize ∪ q.realize

def SemiAnalyticFormula.radiusBound {n : ℕ} {x : RealCoordinates n} :
    SemiAnalyticFormula n x → ℝ → Prop
  | .zeroSet f, r => r ≤ f.radius
  | .positiveSet f, r => r ≤ f.radius
  | .top, _ => True
  | .bottom, _ => True
  | .compl p, r => p.radiusBound r
  | .inter p q, r => p.radiusBound r ∧ q.radiusBound r
  | .union p q, r => p.radiusBound r ∧ q.radiusBound r

/-- A local finite Boolean analytic presentation of a subset near `x`. -/
structure SemiAnalyticAt {n : ℕ} (s : Set (RealCoordinates n)) (x : RealCoordinates n) where
  radius : ℝ
  radius_pos : 0 < radius
  formula : SemiAnalyticFormula n x
  witnesses_analytic : formula.radiusBound radius
  agrees : ∀ y, dist y x < radius → (y ∈ s ↔ y ∈ formula.realize)

/-- Pulling a local semianalytic set back by an analytic map preserves its local Boolean
presentation; the pointwise analytic witnesses may be used instead of a globally analytic function. -/
theorem semianalytic_preimage_local {n m : ℕ}
    {s : Set (RealCoordinates n)} {x : RealCoordinates m}
    (f : RealCoordinates m → RealCoordinates n)
    (hs : SemiAnalyticAt s (f x))
    (hf : AnalyticAt ℝ f x) :
    Nonempty (SemiAnalyticAt (f ⁻¹' s) x) := by
  sorry

/-- A Nash germ is analytic and satisfies a genuinely nonzero polynomial relation on a
neighborhood. The polynomial may depend on the point; no global graph claim is built in. -/
def IsNashAt {n : ℕ} (f : RealCoordinates n → ℝ) (x : RealCoordinates n) : Prop :=
  AnalyticAt ℝ f x ∧
    ∃ P : MvPolynomial (Fin n ⊕ Unit) ℝ, P ≠ 0 ∧
      ∃ r : ℝ, 0 < r ∧ ∀ y ∈ Metric.ball x r,
        MvPolynomial.eval (Sum.elim y (fun _ => f y)) P = 0

/-- R1.1's graph criterion includes both analyticity and an open semialgebraic neighborhood.
The scalar output uses the native graph carrier's one-coordinate function representation. -/
theorem isNashAt_iff_local_semialgebraic_graph {n : ℕ}
    (f : RealCoordinates n → ℝ) (x : RealCoordinates n) :
    IsNashAt f x ↔ AnalyticAt ℝ f x ∧
      ∃ U : Set (RealCoordinates n), IsOpen U ∧ x ∈ U ∧
        TauCeti.IsSemialgebraicOn (fun y (_ : Unit) => f y) U := by
  sorry

/-- Local semialgebraicity is tested at every ambient point, including points outside the set. -/
def IsLocallySemialgebraic {n : ℕ} (s : Set (RealCoordinates n)) : Prop :=
  ∀ x, ∃ U : Set (RealCoordinates n), IsOpen U ∧ x ∈ U ∧
    TauCeti.IsSemialgebraic U ∧ TauCeti.IsSemialgebraic (s ∩ U)

theorem IsLocallySemialgebraic.isSemialgebraic_of_isBounded {n : ℕ}
    {s : Set (RealCoordinates n)} (hs : IsLocallySemialgebraic s)
    (hb : Bornology.IsBounded s) : TauCeti.IsSemialgebraic s := by
  sorry

/-- A finite affine triangulation with the full bounded theorem's analytic and marked-set
conditions. Total ambient extensions let the native graph/submanifold APIs express the maps;
their values off the support and target are unrestricted. -/
structure FiniteCompatibleAnalyticTriangulation {n k : ℕ}
    (B : Fin k → Set (RealCoordinates n)) where
  complex : Geometry.SimplicialComplex ℝ (RealCoordinates n)
  finite_faces : complex.faces.Finite
  homeomorph : complex.space ≃ₜ (⋃ i, closure (B i))
  forward : RealCoordinates n → RealCoordinates n
  inverse : RealCoordinates n → RealCoordinates n
  forward_agrees : ∀ x : complex.space, forward x = (homeomorph x).val
  inverse_agrees : ∀ y : (⋃ i, closure (B i)), inverse y = (homeomorph.symm y).val
  semialgebraic : TauCeti.IsSemialgebraicOn forward complex.space
  analytic_simplex : ∀ s ∈ complex.faces,
    let U := intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n)))
    TauCeti.IsAnalyticSubmanifold (s.card - 1) U ∧
      TauCeti.IsAnalyticSubmanifold (s.card - 1) (forward '' U) ∧
      TauCeti.AnalyticOnSubmanifold (s.card - 1) forward U ∧
      TauCeti.AnalyticOnSubmanifold (s.card - 1) inverse (forward '' U)
  compatible : ∀ s ∈ complex.faces, ∀ i,
    forward '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ B i ∨
      forward '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ (B i)ᶜ

/-- Theorem 3 retains possibly nonclosed input sets and a finite complex in the original
ambient space. The full Nash lifting proof belongs to R2.1. -/
theorem bounded_semialgebraic_analytic_triangulation {n k : ℕ}
    (B : Fin k → Set (RealCoordinates n))
    (hB : ∀ i, TauCeti.IsSemialgebraic (B i))
    (hb : ∀ i, Bornology.IsBounded (B i)) :
    Nonempty (FiniteCompatibleAnalyticTriangulation B) := by
  sorry

/-- Correct n+1-coordinate projector formula, totalized at zero only for convenient notation. -/
def rankOneProjector {n : ℕ} (x : RealCoordinates (n + 1)) :
    Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ :=
  fun i j => x i * x j / ∑ k, (x k) ^ 2

theorem rankOneProjector_smul {n : ℕ} (t : ℝ) (ht : t ≠ 0)
    (x : RealCoordinates (n + 1)) :
    rankOneProjector (t • x) = rankOneProjector x := by
  sorry

/-- Descent uses the existing linear-projectivization quotient, without a private carrier. -/
def projectiveProjector {n : ℕ}
    (p : Projectivization ℝ (RealCoordinates (n + 1))) :
    Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ :=
  Projectivization.lift (fun x => rankOneProjector x.val) (by
    intro a b t h
    have ht : t ≠ 0 := by
      intro ht
      apply a.property
      simpa [ht] using h
    change rankOneProjector (a : RealCoordinates (n + 1)) =
      rankOneProjector (b : RealCoordinates (n + 1))
    rw [h]
    exact rankOneProjector_smul t ht b.val) p

/-- Symmetric idempotents of trace one are exactly rank-one orthogonal projectors over ℝ. -/
def ProjectorLocus (n : ℕ) : Set (Matrix (Fin (n + 1)) (Fin (n + 1)) ℝ) :=
  {A | A.transpose = A ∧ A * A = A ∧ Matrix.trace A = 1}

theorem range_projectiveProjector (n : ℕ) :
    Set.range (projectiveProjector (n := n)) = ProjectorLocus n := by
  sorry

/-- Matrix entries are flattened to the native coordinate-index semialgebraic carrier. -/
theorem isSemialgebraic_projectorLocus (n : ℕ) :
    TauCeti.IsSemialgebraic
      {a : Fin (n + 1) × Fin (n + 1) → ℝ |
        (fun i j => a (i, j)) ∈ ProjectorLocus n} := by
  sorry

/-- Use a fixed real-linear coordinate equivalence after the native extended charts.
In particular `E` may be a complex vector space restricted to real scalars; the affine
submanifold carrier still uses real coordinates. Chart and coordinate independence are R0
targets, rather than additional assumptions on an untyped analytic atlas. -/
def ChartwiseRealAnalyticSubmanifold
    {n : ℕ} {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [I.Boundaryless] [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ω M]
    (e : E ≃L[ℝ] RealCoordinates n) (d : ℕ) (s : Set M) : Prop :=
  ∀ x ∈ s, ∃ U : Set (RealCoordinates n), IsOpen U ∧
    e (extChartAt I x x) ∈ U ∧
    U ⊆ e '' (extChartAt I x).target ∧
    TauCeti.IsAnalyticSubmanifold d
      (U ∩ ((fun y => e (extChartAt I x y)) ''
        (s ∩ (extChartAt I x).source)))

/-- A proper analytic embedding of a genuine finite-dimensional real-analytic manifold into
real affine space, with chartwise analyticity, injective differential and compact preimages. -/
structure ProperRealAnalyticEmbedding
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ω M]
    (N : ℕ) where
  toFun : M → RealCoordinates N
  closedEmbedding : Topology.IsClosedEmbedding toFun
  analytic_chart : ∀ x : M,
    AnalyticAt ℝ (fun y : E => toFun ((extChartAt I x).symm y)) (extChartAt I x x)
  regular_chart : ∀ x : M,
    Function.Injective
      (fderiv ℝ (fun y : E => toFun ((extChartAt I x).symm y)) (extChartAt I x x))

/-- Native closed embeddings are proper; compact-preimage claims use this API. -/
theorem ProperRealAnalyticEmbedding.isProperMap
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ω M]
    {N : ℕ} (F : ProperRealAnalyticEmbedding (M := M) (I := I) N) :
    IsProperMap F.toFun :=
  F.closedEmbedding.isProperMap

/-- Grauert's theorem in the fixed target dimension used by manifold triangulation. The proof
must handle noncompact manifolds through R3's Stein tube and a proper holomorphic embedding. -/
theorem grauert_proper_real_analytic_embedding
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M]
    [IsManifold I ω M] [SecondCountableTopology M]
    (n : ℕ) [Fact (Module.finrank ℝ E = n)] :
    Nonempty (ProperRealAnalyticEmbedding (M := M) (I := I) (4 * n + 2)) := by
  sorry

end TauCetiRoadmap.RealAnalyticGeometry
