import TauCeti.KnotTheory.PDCode.Kauffman
import TauCeti.KnotTheory.PDCode.Planar
import Mathlib.Data.Setoid.Basic
import Mathlib.Algebra.Polynomial.Laurent
import Mathlib.RingTheory.Polynomial.Chebyshev
import TauCeti.KnotTheory.PDCode.Oriented.Reidemeister.Equivalence

/-!
# Adequate diagrams and colored cabling: suggested targets

**This file is not the roadmap and is not exhaustive.** The README is definitive.
Definitions use native PD codes, setoid joins, Laurent support and Chebyshev S.
The parallel construction, framing comparison and all admitted conclusions are
future theorem targets, not completed proofs or assumptions about arbitrary drawings.
-/
noncomputable section
namespace TauCetiRoadmap.GeometricTopology.AdequacyCabling
open TauCeti LaurentPolynomial

variable {n : ℕ}

def stateSetoid (D : PDCode n) (s : Fin n → Bool) : Setoid (Fin (4 * n)) :=
  Equiv.Perm.SameCycle.setoid D.edgePair.val ⊔
    Equiv.Perm.SameCycle.setoid (D.smoothingTurn (D.smoothingChoice s))

abbrev StateCircle (D : PDCode n) (s : Fin n → Bool) :=
  Quotient (stateSetoid D s) ⊕ Fin D.crossinglessComponentCount

def localCircle (D : PDCode n) (s : Fin n → Bool) (i : Fin n) (right : Bool) :
    StateCircle D s :=
  Sum.inl (Quotient.mk (stateSetoid D s) (D.crossing i (if right then 2 else 0)))

def IsAdequateState (D : PDCode n) (s : Fin n → Bool) : Prop :=
  ∀ i, localCircle D s i false ≠ localCircle D s i true

theorem circle_card (D : PDCode n) (s : Fin n → Bool) :
    Nat.card (StateCircle D s) = D.stateLoopCount s := by sorry

theorem distinct_local_change (D : PDCode n) (s : Fin n → Bool) (i : Fin n)
    (h : localCircle D s i false ≠ localCircle D s i true) :
    D.stateLoopCount (Function.update s i (!(s i))) + 1 = D.stateLoopCount s := by sorry

theorem planar_change (D : PDCode n) (hD : D.IsPlanar) (s : Fin n → Bool) (i : Fin n) :
    D.stateLoopCount (Function.update s i (!(s i))) + 1 = D.stateLoopCount s ∨
    D.stateLoopCount (Function.update s i (!(s i))) = D.stateLoopCount s + 1 := by sorry

theorem adequate_first_change (D : PDCode n) (a : Bool)
    (h : IsAdequateState D (fun _ ↦ a)) (i : Fin n) :
    D.stateLoopCount (Function.update (fun _ ↦ a) i (!a)) + 1 =
      D.stateLoopCount (fun _ ↦ a) := by sorry

def bracket (D : PDCode n) : LaurentPolynomial ℤ :=
  D.kauffmanBracket (isUnit_T (R := ℤ) 1).unit

def upper (D : PDCode n) : ℤ := n + 2 * (D.stateLoopCount (fun _ ↦ true) : ℤ) - 2
def lower (D : PDCode n) : ℤ := -(n : ℤ) - 2 * (D.stateLoopCount (fun _ ↦ false) : ℤ) + 2

theorem A_extreme (D : PDCode n) (hD : D.IsPlanar) (hne : 0 < D.componentCount)
    (h : IsAdequateState D (fun _ ↦ true)) :
    (bracket D).degree = (upper D : WithBot ℤ) ∧
    (bracket D).coeff (upper D) = (-1 : ℤ) ^ (D.stateLoopCount (fun _ ↦ true) - 1) := by sorry

theorem B_extreme (D : PDCode n) (hD : D.IsPlanar) (hne : 0 < D.componentCount)
    (h : IsAdequateState D (fun _ ↦ false)) :
    (LaurentPolynomial.invert (bracket D)).degree = ((-lower D : ℤ) : WithBot ℤ) ∧
    (bracket D).coeff (lower D) = (-1 : ℤ) ^ (D.stateLoopCount (fun _ ↦ false) - 1) := by sorry



/-- Explicit r-by-r crossing grid with the blackboard framing; r=0 is empty. -/
def parallel (D : PDCode n) (r : ℕ) : PDCode (r * r * n) := by
  sorry

theorem parallel_state_counts (D : PDCode n) (hD : D.IsPlanar) (r : ℕ) (a : Bool) :
    (parallel D r).stateLoopCount (fun _ ↦ a) = r * D.stateLoopCount (fun _ ↦ a) := by
  sorry

theorem parallel_adequate (D : PDCode n) (hD : D.IsPlanar) (r : ℕ) (a : Bool)
    (ha : IsAdequateState D (fun _ ↦ a)) :
    IsAdequateState (parallel D r) (fun _ ↦ a) := by
  sorry

abbrev Coeff := LaurentPolynomial ℤ

def variableUnit : Coeffˣ := (isUnit_T (R := ℤ) 1).unit

def loopValue : Coeff := -(T 2 + T (-2))

/-- Independent unreduced state sum, including empty=1. -/
def unreduced (D : PDCode n) : Coeff :=
  ∑ s : Fin n → Bool, (PDCode.stateWeight s variableUnit : Coeff) *
    loopValue ^ D.stateLoopCount s

theorem unreduced_of_nonempty (D : PDCode n) (hne : 0 < D.componentCount) :
    unreduced D = loopValue * bracket D := by
  sorry

/-- Coefficient-linear satellite evaluation, rather than scalar polynomial evaluation. -/
def coloredBracket (D : PDCode n) (r : ℕ) : Coeff :=
  let P := Polynomial.Chebyshev.S ℤ (r : ℤ)
  ∑ j ∈ P.support, C (P.coeff j) * unreduced (parallel D j)

def twist (r : ℕ) : Coeffˣ := (-1) ^ r * variableUnit ^ (r * (r + 2))

def colored (D : OrientedPDCode n) (r : ℕ) : Coeff :=
  ((twist r ^ (-D.writhe) : Coeffˣ) : Coeff) * coloredBracket D.toPDCode r

def coloredUpper (D : OrientedPDCode n) (r : ℕ) : ℤ :=
  (r : ℤ) ^ 2 * ((n : ℤ) - D.writhe) +
    2 * r * ((D.stateLoopCount (fun _ ↦ true) : ℤ) - D.writhe)

def coloredLower (D : OrientedPDCode n) (r : ℕ) : ℤ :=
  -(r : ℤ) ^ 2 * ((n : ℤ) + D.writhe) -
    2 * r * ((D.stateLoopCount (fun _ ↦ false) : ℤ) + D.writhe)

theorem colored_invariant {m : ℕ} (D : OrientedPDCode n) (E : OrientedPDCode m)
    (hD : D.IsPlanar) (hE : E.IsPlanar) (hDK : D.componentCount = 1)
    (hEK : E.componentCount = 1) (h : D.ReidemeisterEquiv E) (r : ℕ) :
    colored D r = colored E r := by
  sorry

theorem colored_at_one (D : OrientedPDCode n) (hD : D.IsPlanar)
    (hK : D.componentCount = 1) (r : ℕ) :
    LaurentPolynomial.eval₂ (RingHom.id ℤ) (1 : ℤˣ) (colored D r) =
      (-1 : ℤ) ^ r * (r + 1) := by
  sorry

theorem colored_support_bounds (D : OrientedPDCode n) (hD : D.IsPlanar)
    (hK : D.componentCount = 1) (r : ℕ) (hr : 1 ≤ r)
    (k : ℤ) (hk : k ∈ (colored D r).coeff.support) :
    coloredLower D r ≤ k ∧ k ≤ coloredUpper D r := by
  sorry

theorem colored_A_extreme (D : OrientedPDCode n) (hD : D.IsPlanar)
    (hK : D.componentCount = 1) (r : ℕ) (hr : 1 ≤ r)
    (ha : IsAdequateState D.toPDCode (fun _ ↦ true)) :
    (colored D r).degree = (coloredUpper D r : WithBot ℤ) ∧
      (colored D r).coeff (coloredUpper D r) ∈ ({-1, 1} : Set ℤ) := by
  sorry

theorem colored_B_extreme (D : OrientedPDCode n) (hD : D.IsPlanar)
    (hK : D.componentCount = 1) (r : ℕ) (hr : 1 ≤ r)
    (ha : IsAdequateState D.toPDCode (fun _ ↦ false)) :
    (LaurentPolynomial.invert (colored D r)).degree =
      ((-coloredLower D r : ℤ) : WithBot ℤ) ∧
      (colored D r).coeff (coloredLower D r) ∈ ({-1, 1} : Set ℤ) := by
  sorry

theorem adequate_signed_minimality {m : ℕ} (D : OrientedPDCode n)
    (E : OrientedPDCode m) (hD : D.IsPlanar) (hE : E.IsPlanar)
    (hDK : D.componentCount = 1) (hEK : E.componentCount = 1)
    (h : D.ReidemeisterEquiv E)
    (ha : IsAdequateState D.toPDCode (fun _ ↦ true))
    (hb : IsAdequateState D.toPDCode (fun _ ↦ false)) :
    (n : ℤ) - D.writhe ≤ (m : ℤ) - E.writhe ∧
    (n : ℤ) + D.writhe ≤ (m : ℤ) + E.writhe := by
  sorry

end TauCetiRoadmap.GeometricTopology.AdequacyCabling
