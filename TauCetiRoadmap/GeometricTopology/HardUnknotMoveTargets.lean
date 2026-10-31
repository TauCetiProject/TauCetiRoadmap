import TauCeti.KnotTheory.PDCode.Reidemeister.Three.Basic
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
This enumerates only the native normalized triangle charts. The complete
geometric move list also requires chart changes and the plane/sphere support
and region-placement comparisons specified in the README.
-/
namespace TauCetiRoadmap.GeometricTopology.HardUnknotMove
open TauCeti

instance triangleDecidable {n : ℕ} (D : PDCode n) (c : Fin 3 ↪ Fin n) :
    Decidable (D.HasReidemeisterThreeTriangle c) := by
  unfold PDCode.HasReidemeisterThreeTriangle PDCode.HasReidemeisterThreeTriangleArcs
  infer_instance

local instance embeddingFintype (n : ℕ) : Fintype (Fin 3 ↪ Fin n) :=
  Fintype.ofEquiv {f : Fin 3 → Fin n // Function.Injective f}
    (Equiv.subtypeInjectiveEquivEmbedding (Fin 3) (Fin n))

def triangleCharts {n : ℕ} (D : PDCode n) : Finset (Fin 3 ↪ Fin n) :=
  Finset.univ.filter fun c => D.HasReidemeisterThreeTriangle c

theorem mem_triangleCharts {n : ℕ} (D : PDCode n) (c : Fin 3 ↪ Fin n) :
    c ∈ triangleCharts D ↔ D.HasReidemeisterThreeTriangle c := by
  simp [triangleCharts]

theorem triangleCharts_empty_iff {n : ℕ} (D : PDCode n) :
    triangleCharts D = ∅ ↔ ∀ c : Fin 3 ↪ Fin n, ¬D.HasReidemeisterThreeTriangle c := by
  simp [Finset.eq_empty_iff_forall_notMem, mem_triangleCharts]

/-- Closed finite vertex sets certify nonreachability without trusting a search oracle. -/
theorem closed_set_separates {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) (S : Finset V) (x y : V)
    (hx : x ∈ S) (hy : y ∉ S)
    (hclosed : ∀ u ∈ S, ∀ v, G.Adj u v → v ∈ S) :
    ¬G.Reachable x y := by
  sorry

end TauCetiRoadmap.GeometricTopology.HardUnknotMove
