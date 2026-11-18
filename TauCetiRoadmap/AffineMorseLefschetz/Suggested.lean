module

public import Mathlib
public import TauCeti.Analysis.Calculus.Morse.Index
public import TauCeti.Geometry.RealAlgebraic.Semialgebraic.Basic

/-!
# Affine Morse and Lefschetz theory: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the Levi negative-subspace and Morse
index bounds, the closed holomorphic embedding and q-positive exhaustion CW bounds,
and finite marked-family
semialgebraic triangulation.

The remaining headlines require the following constructions.
* Layer 0 (A0): proper projective incidence and its full-rank holomorphic submersion
  require the supplier's projective atlas and the incidence tangent/normal comparison.
* Layer 4 (A4.0): compact-pair/Borel–Moore comparison and the four noncompact
  Poincare–Lefschetz isomorphisms require locally finite singular chains with local
  coefficients, their relative version, and the supported-cochain comparison.
* Layer 5 (A4.1): the projection-compatible refined lift requires completed face
  stacks, restriction and extension maps, and their simplicial projection. The
  finite marked-family theorem below uses native geometric simplicial complexes;
  the refined construction and complement duality additionally need those stacks
  and the Layer 4 Borel–Moore comparison.
* Layer 6 (A5): homological and relative-homotopy weak Lefschetz require the
  presented projective pair with its projective topology, smooth-complement
  dimension comparison, and relative homotopy interface.
* Layer 7 (A6): Veronese embedding and transported hypersurface Lefschetz require
  the same projective atlas, its line bundles, and the algebraic image comparison.
These constructions are README targets, without substitute predicates here.
-/

public section

noncomputable section
namespace TauCetiRoadmap.AffineMorseLefschetz

open scoped ContDiff Manifold

/-! ## Layer 1: Levi calculus and real index bounds -/

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℂ V]

/-- Real Hessian without a factor 1/2; the Levi diagonal below has factor 1/4. -/
def realHessian (f : V → ℝ) (x : V) : V →L[ℝ] V →L[ℝ] ℝ :=
  fderiv ℝ (fderiv ℝ f) x

/-- The Levi diagonal of a real bilinear form is its J-paired diagonal sum divided by four. -/
def leviDiagonal (B : V →L[ℝ] V →L[ℝ] ℝ) (v : V) : ℝ :=
  (B v v + B (Complex.I • v) (Complex.I • v)) / 4

/-- Strict Levi positivity bounds the real dimension of every negative subspace by the complex dimension. -/
theorem finrank_negative_subspace_le_complex [FiniteDimensional ℂ V]
    (B : V →L[ℝ] V →L[ℝ] ℝ)
    (hlevi : ∀ v : V, v ≠ 0 → 0 < leviDiagonal B v)
    (W : Submodule ℝ V) (hneg : ∀ v ∈ W, v ≠ 0 → B v v < 0) :
    Module.finrank ℝ W ≤ Module.finrank ℂ V := by
  sorry

/-- The pointwise bound uses native negative inertia wherever the Levi diagonal is positive. -/
theorem morseIndex_le_complex_finrank [FiniteDimensional ℂ V] (f : V → ℝ) (x : V)
    (hlevi : ∀ v : V, v ≠ 0 → 0 < leviDiagonal (realHessian f x) v) :
    TauCeti.morseIndex f x ≤ Module.finrank ℂ V := by
  sorry

/-- The n−q positive-direction convention gives the real index bound n+q. -/
theorem morseIndex_le_complex_finrank_add [FiniteDimensional ℂ V] (f : V → ℝ) (x : V)
    (q : ℕ) (hq : q ≤ Module.finrank ℂ V) (P : Submodule ℂ V)
    (hdim : Module.finrank ℂ V - q ≤ Module.finrank ℂ P)
    (hlevi : ∀ v ∈ P, v ≠ 0 → 0 < leviDiagonal (realHessian f x) v) :
    TauCeti.morseIndex f x ≤ Module.finrank ℂ V + q := by
  sorry

/-! ## Layer 2: Closed embeddings and squared-distance exhaustions -/

/-- A closed holomorphic embedding of a Hausdorff second-countable complex
n-manifold into finite-dimensional complex affine space has a CW homotopy model
with no cells in dimensions greater than n (Milnor, Theorem 7.2, p. 39). -/
theorem closed_holomorphic_embedding_cw_bound {n N : ℕ}
    (M : Type) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (Fin n → ℂ) M] [IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ M]
    (i : M → (Fin N → ℂ))
    (hi : Manifold.IsImmersion 𝓘(ℂ, Fin n → ℂ) 𝓘(ℂ, Fin N → ℂ) ∞ i)
    (hc : Topology.IsClosedEmbedding i) :
    ∃ (K : Type) (t : TopologicalSpace K) (c : @Topology.CWComplex K t Set.univ),
      Nonempty (@ContinuousMap.HomotopyEquiv M K _ t) ∧
      ∀ k, n < k → IsEmpty (@Topology.CWComplex.cell K t Set.univ c k) := by
  sorry

/-! ## Layer 3: Pseudoconvex exhaustions and their topology -/

/-- In each extended chart at its centre, the real Hessian of f has positive
Levi diagonal on a complex subspace of dimension at least n−q. For a real C²
function on a complex n-manifold and q≤n this is strong q-pseudoconvexity. -/
def qPositiveLeviInCharts {n : ℕ} (M : Type) [TopologicalSpace M]
    [ChartedSpace (Fin n → ℂ) M] (q : ℕ) (f : M → ℝ) : Prop :=
  ∀ x : M, ∃ P : Submodule ℂ (Fin n → ℂ),
    n - q ≤ Module.finrank ℂ P ∧
    ∀ v ∈ P, v ≠ 0 →
      0 < leviDiagonal
        (realHessian (f ∘ (extChartAt 𝓘(ℂ, Fin n → ℂ) x).symm)
          (extChartAt 𝓘(ℂ, Fin n → ℂ) x x)) v

/-- A proper bounded-below real smooth exhaustion with at least n−q positive
Levi directions everywhere on a complex n-manifold gives a CW homotopy model
with no cells above dimension n+q. Smoothness is expressed in the same complex
charts, with real differentiation of the real-valued function. -/
theorem q_positive_exhaustion_cw_bound {n : ℕ}
    (M : Type) [TopologicalSpace M] [T2Space M] [SecondCountableTopology M]
    [ChartedSpace (Fin n → ℂ) M] [IsManifold 𝓘(ℂ, Fin n → ℂ) ∞ M]
    (q : ℕ) (hq : q ≤ n) (f : M → ℝ)
    (hf : ∀ x : M, ContDiffOn ℝ ∞
      (f ∘ (extChartAt 𝓘(ℂ, Fin n → ℂ) x).symm)
      (extChartAt 𝓘(ℂ, Fin n → ℂ) x).target)
    (hp : IsProperMap f) (hb : BddBelow (Set.range f))
    (hlevi : qPositiveLeviInCharts (n := n) M q f) :
    ∃ (K : Type) (t : TopologicalSpace K) (c : @Topology.CWComplex K t Set.univ),
      Nonempty (@ContinuousMap.HomotopyEquiv M K _ t) ∧
      ∀ k, n + q < k → IsEmpty (@Topology.CWComplex.cell K t Set.univ c k) := by
  sorry

/-! ## Layer 5: Semialgebraic triangulation and compact algebraic pairs -/

/-- A compact semialgebraic set admits a finite semialgebraic triangulation
compatible with any finite family of semialgebraic subsets: membership in each
marked subset is constant on the relative interior of each simplex. -/
theorem finite_semialgebraic_triangulation {n : ℕ} {ι : Type*} [Finite ι]
    (X : Set (Fin n → ℝ)) (hX : IsCompact X) (hsa : TauCeti.IsSemialgebraic X)
    (S : ι → Set (Fin n → ℝ)) (hS : ∀ i, TauCeti.IsSemialgebraic (S i))
    (hsub : ∀ i, S i ⊆ X) :
    ∃ (m : ℕ) (K : Geometry.SimplicialComplex ℝ (Fin m → ℝ))
      (h : K.space ≃ₜ X),
      K.faces.Finite ∧
      TauCeti.IsSemialgebraic
        {z : (Fin m ⊕ Fin n) → ℝ |
          ∃ x : K.space, z = Sum.elim x.val (h x).val} ∧
      ∀ i, ∀ s ∈ K.faces, ∀ x y : K.space,
        x.val ∈ intrinsicInterior ℝ (convexHull ℝ (s : Set (Fin m → ℝ))) →
        y.val ∈ intrinsicInterior ℝ (convexHull ℝ (s : Set (Fin m → ℝ))) →
        ((h x).val ∈ S i ↔ (h y).val ∈ S i) := by
  sorry

end TauCetiRoadmap.AffineMorseLefschetz
