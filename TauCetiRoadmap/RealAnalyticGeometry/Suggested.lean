import Mathlib
import TauCeti.Analysis.Analytic.Submanifold.Basic
import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Function
import TauCeti.Geometry.RealAnalytic.Semianalytic.Basic
import TauCeti.Geometry.RealAnalytic.Semianalytic.PartiallySemialgebraic

/-!
# Real-analytic geometry and semianalytic triangulation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`, which is the definitive
specification; this file states the roadmap's headline theorems against the pinned Mathlib and
Tau Ceti APIs, each with `sorry`, and is read as suggested forms, never as an exhaustive checklist.

Stated here:

* Łojasiewicz's triangulation theorem in affine space (Theorem 1, README §2.0h),
  `exists_affine_semianalytic_triangulation`;
* the bounded semialgebraic triangulation theorem (Theorem 3, README §2.1),
  `bounded_semialgebraic_analytic_triangulation`, with the structure
  `FiniteCompatibleAnalyticTriangulation` it produces;
* Grauert's proper real-analytic embedding theorem (README §4.2),
  `grauert_proper_real_analytic_embedding`, with the structure `ProperRealAnalyticEmbedding`.

Not statable at the pins:

* Łojasiewicz's manifold theorem (Theorem 2, README §5.2): the libraries have no notion of an
  analytic submanifold of an abstract real-analytic manifold, of a map analytic on such a
  submanifold, or of partial semialgebraicity over a manifold base (property (A) for maps into a
  manifold); README §0.2 and §5.2 build them.
* The real multiprojective triangulation theorem (Theorem 4, README §2.1b): there is no notion of
  semialgebraic subsets of, or semialgebraic maps into, real projective spaces, and Tau Ceti's
  analytic atlas of projective space is built on Tau Ceti's own copy of the quotient topology, which
  cannot be imported together with Mathlib's.
* The Stein property of the strictly plurisubharmonic tube around a real-analytic manifold in its
  complexification (README §§3.0–3.1): there is no complexification of a real-analytic manifold and
  no Stein predicate.
* Hörmander's weighted `L²` estimate for `∂̄` on complete Kähler manifolds (README §3.1): there are
  no square-integrable bundle-valued `(n, k)`-forms on a Kähler manifold, no curvature operator
  `[iΘ(E) + i∂∂̄φ, Λ]` and no maximal `∂̄` with its Hilbert adjoint.
* Cartan's theorems A and B on Stein manifolds (README §3.2): there is no holomorphic structure
  sheaf of a complex manifold, hence no coherent analytic sheaf, and no Stein predicate.
-/

noncomputable section
open scoped ContDiff Manifold

namespace TauCetiRoadmap.RealAnalyticGeometry

/-- Real affine coordinates `ℝⁿ`, the coordinate space on which the analytic-submanifold,
semianalytic and semialgebraic carriers of Tau Ceti are stated. -/
abbrev RealCoordinates (n : ℕ) := Fin n → ℝ

/-! ## Layer 2: Łojasiewicz's theorem in affine space and the semialgebraic theorems -/

/-- **Łojasiewicz's triangulation theorem in affine space** (Łojasiewicz 1964, §3, Theorem 1,
printed p. 463), in affine coordinates `ℝⁿ`. For a locally finite family `B` of semianalytic
subsets of `ℝⁿ` there are a locally finite simplicial complex `K` in `ℝⁿ` with `|K| = ℝⁿ` and a
homeomorphism `τ` of `ℝⁿ` with property (A), that is, its graph `{(y, x) | y = τ x}`, with base
the target and fibre the source, is partially semialgebraic, such that `τ` maps every open simplex
(the intrinsic interior of a face) analytically isomorphically onto an analytic submanifold of the
same dimension, contained in or disjoint from each `B ν`. -/
theorem exists_affine_semianalytic_triangulation {n : ℕ} {ι : Type*}
    (B : ι → Set (RealCoordinates n)) (hB : ∀ ν, TauCeti.IsSemianalytic (B ν))
    (hlf : LocallyFinite B) :
    ∃ (K : Geometry.SimplicialComplex ℝ (RealCoordinates n))
      (τ : RealCoordinates n ≃ₜ RealCoordinates n),
      K.space = Set.univ ∧
      LocallyFinite (fun s : K.faces => convexHull ℝ (s : Set (RealCoordinates n))) ∧
      TauCeti.IsPartiallySemialgebraic {p : RealCoordinates n × (Fin n → ℝ) | p.1 = τ p.2} ∧
      ∀ s ∈ K.faces,
        TauCeti.IsAnalyticSubmanifold (s.card - 1)
            (τ '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n)))) ∧
          TauCeti.AnalyticOnSubmanifold (s.card - 1) τ
            (intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n)))) ∧
          TauCeti.AnalyticOnSubmanifold (s.card - 1) τ.symm
            (τ '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n)))) ∧
          ∀ ν, τ '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ B ν ∨
            τ '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ (B ν)ᶜ := by
  sorry

/-- A finite affine triangulation of `⋃ i, closure (B i)` with the conditions of the bounded
theorem: a finite simplicial complex in `ℝⁿ`, a homeomorphism from its support onto the union of
the closures whose graph is semialgebraic, analytic isomorphisms of the open simplices onto
analytic submanifolds of the same dimension, and compatibility with every `B i`. The total maps
`forward` and `inverse` extend the homeomorphism and its inverse so that the graph and
submanifold APIs apply; their values off the support and off the union are unrestricted. -/
structure FiniteCompatibleAnalyticTriangulation {n k : ℕ}
    (B : Fin k → Set (RealCoordinates n)) where
  /-- The simplicial complex, in the original coordinates. -/
  complex : Geometry.SimplicialComplex ℝ (RealCoordinates n)
  /-- The complex is finite. -/
  finite_faces : complex.faces.Finite
  /-- The triangulating homeomorphism from the support onto the union of the closures. -/
  homeomorph : complex.space ≃ₜ (⋃ i, closure (B i))
  /-- A total extension of the homeomorphism. -/
  forward : RealCoordinates n → RealCoordinates n
  /-- A total extension of its inverse. -/
  inverse : RealCoordinates n → RealCoordinates n
  /-- `forward` agrees with the homeomorphism on the support. -/
  forward_agrees : ∀ x : complex.space, forward x = (homeomorph x).val
  /-- `inverse` agrees with the inverse homeomorphism on the union of the closures. -/
  inverse_agrees : ∀ y : (⋃ i, closure (B i)), inverse y = (homeomorph.symm y).val
  /-- The homeomorphism has semialgebraic graph over the support. -/
  semialgebraic : TauCeti.IsSemialgebraicOn forward complex.space
  /-- Each open simplex and its image are analytic submanifolds of dimension `card s - 1`, and the
  homeomorphism and its inverse are analytic on them. -/
  analytic_simplex : ∀ s ∈ complex.faces,
    let U := intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n)))
    TauCeti.IsAnalyticSubmanifold (s.card - 1) U ∧
      TauCeti.IsAnalyticSubmanifold (s.card - 1) (forward '' U) ∧
      TauCeti.AnalyticOnSubmanifold (s.card - 1) forward U ∧
      TauCeti.AnalyticOnSubmanifold (s.card - 1) inverse (forward '' U)
  /-- The image of each open simplex lies in `B i` or in its complement. -/
  compatible : ∀ s ∈ complex.faces, ∀ i,
    forward '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ B i ∨
      forward '' intrinsicInterior ℝ (convexHull ℝ (s : Set (RealCoordinates n))) ⊆ (B i)ᶜ

/-- **The bounded semialgebraic triangulation theorem** (Łojasiewicz 1964, §3, Theorem 3, printed
p. 464). For finitely many bounded semialgebraic subsets `B i` of `ℝⁿ`, not necessarily closed,
the union of their closures has a finite triangulation by a complex in `ℝⁿ` itself, through a
homeomorphism with semialgebraic graph that is an analytic isomorphism on every open simplex and is
compatible with every `B i`. -/
theorem bounded_semialgebraic_analytic_triangulation {n k : ℕ}
    (B : Fin k → Set (RealCoordinates n))
    (hB : ∀ i, TauCeti.IsSemialgebraic (B i))
    (hb : ∀ i, Bornology.IsBounded (B i)) :
    Nonempty (FiniteCompatibleAnalyticTriangulation B) := by
  sorry

/-! ## Layer 4: Grauert's proper real-analytic embedding -/

/-- A regular proper analytic embedding of a finite-dimensional real-analytic manifold into
`ℝᴺ`: a closed embedding whose expression in every extended chart is analytic with injective
differential. Closed embeddings are proper maps (`Topology.IsClosedEmbedding.isProperMap`). -/
structure ProperRealAnalyticEmbedding
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ω M]
    (N : ℕ) where
  /-- The embedding. -/
  toFun : M → RealCoordinates N
  /-- It is a closed embedding. -/
  closedEmbedding : Topology.IsClosedEmbedding toFun
  /-- It is analytic in every extended chart. -/
  analytic_chart : ∀ x : M,
    AnalyticAt ℝ (fun y : E => toFun ((extChartAt I x).symm y)) (extChartAt I x x)
  /-- Its differential in every extended chart is injective. -/
  regular_chart : ∀ x : M,
    Function.Injective
      (fderiv ℝ (fun y : E => toFun ((extChartAt I x).symm y)) (extChartAt I x x))

/-- **Grauert's embedding theorem** (Grauert 1958), in the fixed target dimension `4n + 2`: every
Hausdorff, second-countable real-analytic manifold of dimension `n` without boundary has a regular
proper analytic embedding into `ℝ^(4n+2)`. The proof handles noncompact manifolds through the
Stein tube of the complexification and a proper holomorphic embedding into `ℂ^(2n+1)`. -/
theorem grauert_proper_real_analytic_embedding
    {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
    [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M]
    [IsManifold I ω M] [SecondCountableTopology M]
    (n : ℕ) [Fact (Module.finrank ℝ E = n)] :
    Nonempty (ProperRealAnalyticEmbedding (M := M) (I := I) (4 * n + 2)) := by
  sorry

end TauCetiRoadmap.RealAnalyticGeometry
