import Mathlib.Analysis.Analytic.Basic
import Mathlib.Geometry.Manifold.IsManifold.ExtChartAt
import Mathlib.Topology.Defs.Induced
import Mathlib.Topology.Maps.Proper.Basic
import TauCeti.Analysis.Analytic.Submanifold.Basic

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
