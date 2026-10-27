/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Algebra.TemperleyLieb.MarkovTrace
/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
The prototype uses the actual native TL presentation. The Jones tower and
module dimension are construction targets in the README; an opaque index
or a Prop field asserting the index theorem does not stand in for them.
-/

noncomputable section
open scoped ENNReal
namespace Subfactors

variable {B : Type*} [CStarAlgebra B]

/-- Relations satisfied by a finite segment of the actual Jones tower.
This supplies an algebra action, with no assumption of faithfulness.
A native index i is the one-based prose label i+1. -/
structure JonesProjectionFamily (d : ℝ) (n : ℕ) where
  projection : Fin (n - 1) → B
  isProjection : ∀ i, IsStarProjection (projection i)
  adjacent : ∀ i j : Fin (n - 1), (i : ℕ) + 1 = j ∨ (j : ℕ) + 1 = i →
    projection i * projection j * projection i = (d⁻¹ : ℂ) • projection i
  distant : ∀ i j : Fin (n - 1), (i : ℕ) + 2 ≤ j ∨ (j : ℕ) + 2 ≤ i →
    projection i * projection j = projection j * projection i

def scaledGenerator {d : ℝ} {n : ℕ}
    (P : JonesProjectionFamily (B := B) d n) (i : Fin (n - 1)) : B :=
  (Real.sqrt d : ℂ) • P.projection i

theorem scaledGenerator_self {d : ℝ} (hd : 0 ≤ d) {n : ℕ}
    (P : JonesProjectionFamily (B := B) d n) (i : Fin (n - 1)) :
    scaledGenerator P i * scaledGenerator P i =
      (Real.sqrt d : ℂ) • scaledGenerator P i := by sorry

theorem scaledGenerator_adjacent {d : ℝ} (hd : 0 < d) {n : ℕ}
    (P : JonesProjectionFamily (B := B) d n) (i j : Fin (n - 1))
    (h : (i : ℕ) + 1 = j ∨ (j : ℕ) + 1 = i) :
    scaledGenerator P i * scaledGenerator P j * scaledGenerator P i =
      scaledGenerator P i := by sorry

theorem scaledGenerator_distant {d : ℝ} {n : ℕ}
    (P : JonesProjectionFamily (B := B) d n) (i j : Fin (n - 1))
    (h : (i : ℕ) + 2 ≤ j ∨ (j : ℕ) + 2 ≤ i) :
    scaledGenerator P i * scaledGenerator P j =
      scaledGenerator P j * scaledGenerator P i := by sorry

/-- Apply this to S2's tower; the independent positivity theorem follows only
once the normalized tower trace is compared with the closure trace. -/
def jonesAction {d : ℝ} (hd : 0 < d) {n : ℕ}
    (P : JonesProjectionFamily (B := B) d n) :
    TauCeti.TemperleyLieb ℂ (Real.sqrt d : ℂ) n →ₐ[ℂ] B :=
  TauCeti.TemperleyLieb.lift (scaledGenerator P)
    (scaledGenerator_self hd.le P) (fun {i j} => scaledGenerator_adjacent hd P i j)
    (fun {i j} => scaledGenerator_distant P i j)

@[simp] theorem jonesAction_generator {d : ℝ} (hd : 0 < d) {n : ℕ}
    (P : JonesProjectionFamily (B := B) d n) (i : Fin (n - 1)) :
    jonesAction hd P (TauCeti.TemperleyLieb.e (Real.sqrt d : ℂ) i) =
      (Real.sqrt d : ℂ) • P.projection i :=
  TauCeti.TemperleyLieb.lift_e _ _ _ _ i

/-- Compatibility uses the actual strand inclusion and the actual tower map. -/
theorem jonesAction_strandIncl {C : Type*} [CStarAlgebra C]
    {d : ℝ} (hd : 0 < d) {n : ℕ}
    (P : JonesProjectionFamily (B := B) d (n + 1))
    (Q : JonesProjectionFamily (B := C) d (n + 2)) (ι : B →ₐ[ℂ] C)
    (h : ∀ i : Fin n, ι (P.projection i) = Q.projection i.castSucc) :
    (jonesAction hd Q).comp TauCeti.TemperleyLieb.strandIncl =
      ι.comp (jonesAction hd P) := by
  apply TauCeti.TemperleyLieb.hom_ext
  intro i
  simp only [AlgHom.comp_apply, TauCeti.TemperleyLieb.strandIncl_e,
    jonesAction_generator, map_smul, h]

section Adjoint
variable {d : ℝ} {n : ℕ}
  [StarRing (TauCeti.TemperleyLieb ℂ (Real.sqrt d : ℂ) n)]
  [StarModule ℂ (TauCeti.TemperleyLieb ℂ (Real.sqrt d : ℂ) n)]

/-- Instantiate these star hypotheses with A1's constructed analytic fiber.
The algebraic coefficient-fixing diagram reflection is not this star. -/
theorem jonesAction_map_star (hd : 0 < d)
    (P : JonesProjectionFamily (B := B) d n)
    (he : ∀ i : Fin (n - 1),
      star (TauCeti.TemperleyLieb.e (Real.sqrt d : ℂ) i) =
        TauCeti.TemperleyLieb.e (Real.sqrt d : ℂ) i)
    (x : TauCeti.TemperleyLieb ℂ (Real.sqrt d : ℂ) n) :
    jonesAction hd P (star x) = star (jonesAction hd P x) := by sorry

def jonesStarAction (hd : 0 < d)
    (P : JonesProjectionFamily (B := B) d n)
    (he : ∀ i : Fin (n - 1),
      star (TauCeti.TemperleyLieb.e (Real.sqrt d : ℂ) i) =
        TauCeti.TemperleyLieb.e (Real.sqrt d : ℂ) i) :
    TauCeti.TemperleyLieb ℂ (Real.sqrt d : ℂ) n →⋆ₐ[ℂ] B :=
  { jonesAction hd P with map_star' := jonesAction_map_star hd P he }
end Adjoint

inductive Shading | plus | minus

/-- Apply to S2's actual tower T_n=M_n; degree zero consists of scalar boxes. -/
def shadedBox (N M : StarSubalgebra ℂ B) (T : ℕ → StarSubalgebra ℂ B) :
    ℕ → Shading → StarSubalgebra ℂ B
  | 0, _ => ⊥
  | n + 1, .plus => T n ⊓ StarSubalgebra.centralizer ℂ (N : Set B)
  | n + 1, .minus => T (n + 1) ⊓ StarSubalgebra.centralizer ℂ (M : Set B)

/-- Actual graded carrier for a given family of positive-shaded box modules;
its contracted and concatenated products are distinct constructions in S8. -/
abbrev GradedCarrier (P : ℕ → Type*) [∀ n, AddCommMonoid (P n)] (k : ℕ) :=
  DirectSum ℕ (fun n => P (n + k))

/-- Positive half-weight parametrization; w=root² is invertible and the
trace equality is precisely the rigid equal-circle-modulus normalization. -/
structure RigidWeight (τ : B →ₗ[ℂ] ℂ) where
  root : Bˣ
  positive : ∃ b : B, star b * b = (root : B)
  trace_balance : τ (root : B) = τ ((root⁻¹ : Bˣ) : B)

/-- The extended value set is distinct from its finite realization subset. -/
def JonesIndexValues : Set ℝ≥0∞ :=
  {d | d = ∞ ∨ (∃ m : ℕ, 3 ≤ m ∧
    d = ENNReal.ofReal (4 * Real.cos (Real.pi / (m : ℝ)) ^ 2)) ∨
    ∃ r : ℝ, 4 ≤ r ∧ d = ENNReal.ofReal r}

theorem infinite_mem_indexValues : (∞ : ℝ≥0∞) ∈ JonesIndexValues := Or.inl rfl

end Subfactors
end

/-!
These non-exhaustive interfaces use the actual CFC and positive finite partitions.
The maps τ and E are raw continuous linear maps. VonNeumannAlgebras V6/V11 construct the trace and normal trace-preserving
expectation; S2 develops their inclusion APIs and S2a defines H from them.
No trace or conditional-expectation law is asserted by these definitions.
-/
noncomputable section
open scoped BigOperators ENNReal
namespace SubfactorsEntropyPrototype
variable {A : Type*} [CStarAlgebra A] [PartialOrder A] [StarOrderedRing A]

/-- A finite positive partition of unity in the actual C⋆-algebra carrier. -/
structure PositivePartition (A : Type*) [CStarAlgebra A] [PartialOrder A]
    [StarOrderedRing A] (n : ℕ) where
  term : Fin n → A
  nonneg : ∀ i, 0 ≤ term i
  sum_one : ∑ i, term i = 1

/-- One partition's real trace-entropy expression, using Mathlib's CFC directly. -/
def partitionValue (τ : A →L[ℂ] ℂ) (E : A →L[ℂ] A)
    {n : ℕ} (p : PositivePartition A n) : ℝ :=
  ∑ i, (τ (cfc Real.negMulLog (E (p.term i)) -
      cfc Real.negMulLog (p.term i))).re

/-- The extended supremum. Positivity of E ensures its inputs to CFC are self-adjoint.
For raw τ and E, ofReal truncates negative expressions. S2a proves nonnegativity
for its normalized trace and actual trace-preserving conditional expectation;
only then is this identified with relative inclusion entropy. -/
def relativeEntropyCandidate (τ : A →L[ℂ] ℂ) (E : A →L[ℂ] A)
    (_E_nonneg : ∀ x : A, (0 : A) ≤ x → (0 : A) ≤ E x) : ℝ≥0∞ :=
  sSup {v : ℝ≥0∞ | ∃ n : ℕ, ∃ p : PositivePartition A n,
    v = ENNReal.ofReal (partitionValue τ E p)}

theorem partitionValue_id (τ : A →L[ℂ] ℂ) {n : ℕ}
    (p : PositivePartition A n) :
    partitionValue τ (ContinuousLinearMap.id ℂ A) p = 0 := by
  simp [partitionValue]

theorem relativeEntropyCandidate_id (τ : A →L[ℂ] ℂ) :
    relativeEntropyCandidate τ (ContinuousLinearMap.id ℂ A) (fun _ hx => hx) = 0 := by
  unfold relativeEntropyCandidate
  apply le_antisymm
  · apply sSup_le
    rintro v ⟨n,p,rfl⟩
    rw [partitionValue_id]
    simp
  · exact bot_le

theorem partitionValue_le_relativeEntropyCandidate (τ : A →L[ℂ] ℂ) (E : A →L[ℂ] A)
    (E_nonneg : ∀ x : A, (0 : A) ≤ x → (0 : A) ≤ E x)
    {n : ℕ} (p : PositivePartition A n) :
    ENNReal.ofReal (partitionValue τ E p) ≤ relativeEntropyCandidate τ E E_nonneg := by
  exact le_sSup ⟨n,p,rfl⟩

/-
Target for S2a's constructed trace τ and trace-preserving normal expectation E_N:
for every positive finite partition p, 0 ≤ partitionValue τ E_N p.
Use that nonnegativity to remove the ofReal truncation in S2a's definition of H.
Trace, expectation and normality structures come from V6/V11 and S2; this file
does not replace them with unnamed Prop fields or assumed entropy conclusions.
-/
end SubfactorsEntropyPrototype
end
