import TauCeti.Algebra.TemperleyLieb.MarkovTrace
import Mathlib.Combinatorics.Graph.Delete
import Mathlib.Combinatorics.Graph.Simple
import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.Finset.Powerset
import Mathlib.Basic.Complex.Basic

/-!
# Finite Potts, loop and ice comparisons: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
In particular its ribbon, boundary-wiring and medial-network constructions are required.
The abstract Euler hypothesis below prototypes the scalar identity after that construction;
it does not define a ribbon embedding or discharge the topological comparison.
-/

noncomputable section

namespace TauCetiRoadmap.TemperleyLiebOperatorAlgebras.PottsIce

open TauCeti

variable {V E : Type*} (G : Graph V E)

/-- Only actual edges are selected; restriction retains all actual vertices. -/
def selectedGraph (A : Finset G.edgeSet) : Graph V E :=
  G.restrict (Subtype.val '' (A : Set G.edgeSet))

/-- The native simple-graph conversion is used only to compute connectivity. -/
def componentCount (A : Finset G.edgeSet) : ℕ :=
  Nat.card (selectedGraph G A).toSimpleGraph.ConnectedComponent

def monochromatic {q : ℕ} (σ : G.vertexSet → Fin q) (e : G.edgeSet) : Prop :=
  ∀ u v : G.vertexSet, G.IsLink e u v → σ u = σ v

variable [Fintype G.vertexSet] [Fintype G.edgeSet]

/-- The factors are `1+v_e` for equal endpoint colors and `1` otherwise. -/
def pottsPartition (q : ℕ) (v : G.edgeSet → ℂ) : ℂ := by
  classical
  exact ∑ σ : G.vertexSet → Fin q,
    ∏ e : G.edgeSet, (1 + if monochromatic G σ e then v e else 0)

def fkPartition (Q : ℂ) (v : G.edgeSet → ℂ) : ℂ := by
  classical
  exact ∑ A ∈ (Finset.univ : Finset G.edgeSet).powerset,
    Q ^ componentCount G A * ∏ e ∈ A, v e

theorem potts_eq_fk (q : ℕ) (v : G.edgeSet → ℂ) :
    pottsPartition G q v = fkPartition G (q : ℂ) v := by
  sorry

theorem componentCount_empty :
    componentCount G ∅ = Fintype.card G.vertexSet := by
  sorry

/-- Euler's relation is in integers: natural-number subtraction is not used. -/
theorem loop_specialization_of_euler (δ : ℂˣ) (v : G.edgeSet → ℂ)
    (ell : Finset G.edgeSet → ℕ)
    (hEuler : ∀ A, (ell A : ℤ) = 2 * componentCount G A +
      (A.card : ℤ) - (Fintype.card G.vertexSet : ℤ)) :
    fkPartition G ((δ : ℂ) ^ 2) v =
      (δ : ℂ) ^ Fintype.card G.vertexSet *
        ∑ A ∈ (Finset.univ : Finset G.edgeSet).powerset,
          (δ : ℂ) ^ ell A * ∏ e ∈ A, (v e / (δ : ℂ)) := by
  sorry

def loop (r : ℂˣ) : ℂ := (r : ℂ) + ((r⁻¹ : ℂˣ) : ℂ)

def negativeRoot (r : ℂˣ) : ℂˣ :=
  Units.mk0 (-(r : ℂ)) (neg_ne_zero.mpr r.ne_zero)

theorem loop_eq_native (r : ℂˣ) :
    loop r = -((negativeRoot r : ℂ) + ((negativeRoot r)⁻¹ : ℂˣ)) := by
  simp [loop, negativeRoot, add_comm]

def spinModel (n : ℕ) (r : ℂˣ) :
    TemperleyLieb ℂ (loop r) n →ₐ[ℂ]
      Matrix (Fin n → Bool) (Fin n → Bool) ℂ :=
  TemperleyLieb.spinRep (negativeRoot r) (loop_eq_native r)

/-- Coefficients stay homogeneous: no division by an individual bond weight. -/
def localOperator (n : ℕ) (r : ℂˣ) (i : Fin (n - 1)) (a b : ℂ) :
    TemperleyLieb ℂ (loop r) n :=
  a • 1 + b • TemperleyLieb.e (loop r) i

def pairBasis : Fin 4 → (Fin 2 → Bool) :=
  ![![false, false], ![false, true], ![true, false], ![true, true]]

theorem local_six_vertex_matrix (r : ℂˣ) (a b : ℂ) :
    (spinModel 2 r (localOperator 2 r 0 a b)).submatrix pairBasis pairBasis =
      !![a, 0, 0, 0;
         0, a + b * ((r⁻¹ : ℂˣ) : ℂ), b, 0;
         0, b, a + b * (r : ℂ), 0;
         0, 0, 0, a] := by
  sorry

theorem cup_cap_snakes (r : ℂˣ) (u v : Bool) :
    (∑ b : Bool, TemperleyLieb.spinCup (negativeRoot r) u b *
      TemperleyLieb.spinCap (negativeRoot r) b v) = (if u = v then 1 else 0) ∧
    (∑ b : Bool, TemperleyLieb.spinCap (negativeRoot r) u b *
      TemperleyLieb.spinCup (negativeRoot r) b v) = (if u = v then 1 else 0) := by
  sorry

theorem cup_cap_circle (r : ℂˣ) :
    (∑ u : Bool, ∑ v : Bool, TemperleyLieb.spinCap (negativeRoot r) u v *
      TemperleyLieb.spinCup (negativeRoot r) u v) = loop r := by
  sorry

/-- Clockwise bending uses the algebraic duality, rather than raw leg permutation. -/
def rotate (r : ℂˣ) (T : Matrix (Fin 2 → Bool) (Fin 2 → Bool) ℂ) :
    Matrix (Fin 2 → Bool) (Fin 2 → Bool) ℂ :=
  fun s t ↦ ∑ u : Bool, ∑ v : Bool,
    TemperleyLieb.spinCup (negativeRoot r) (s 0) u *
      T ![s 1, v] ![u, t 0] * TemperleyLieb.spinCap (negativeRoot r) v (t 1)

theorem rotation_exchanges_resolutions (r : ℂˣ) (a b : ℂ) :
    rotate r (spinModel 2 r (localOperator 2 r 0 a b)) =
      spinModel 2 r (localOperator 2 r 0 b a) := by
  sorry

/-- A fixed-width transfer product; arbitrary medial networks also require cups/caps. -/
theorem transfer_word_closure (n : ℕ) (r : ℂˣ)
    (steps : List (Fin (n - 1) × ℂ × ℂ)) :
    TemperleyLieb.markovTrace (negativeRoot r) (loop_eq_native r)
      ((steps.map fun s ↦ localOperator n r s.1 s.2.1 s.2.2).prod) =
      Matrix.trace (Matrix.diagonal (TemperleyLieb.spinWeight (n := n) (negativeRoot r)) *
        (steps.map fun s ↦ spinModel n r (localOperator n r s.1 s.2.1 s.2.2)).prod) := by
  sorry

end TauCetiRoadmap.TemperleyLiebOperatorAlgebras.PottsIce
