import Mathlib

/-!
# JacobianChallengePartII: representative target signatures

`README.md` is the roadmap and is definitive. This file is not exhaustive: it records the
definitions, theorem signatures and examples statable against the pinned Mathlib and Tau Ceti.
These are suggested Lean forms, not an exhaustive checklist of any layer.

Design choices made explicit here:
* The Jacobian, its fibre powers and the curve are objects of `Over S`, and the Jacobian is a group
  object there (`GrpObj`), so represented points are morphisms from arbitrary test schemes,
  nonreduced ones included.
* Multiplicative notation is Mathlib's notation for group objects and expresses the additive law of
  the Jacobian: the ordered difference `j(x, y) = [y] − [x]` is the second Abel image divided by the
  first.
* The geometric Abel morphism and the section-free difference of Layer 2 are explicit inputs of the
  Layer 5 constructions. Their construction from the relative Picard scheme, and the finiteness of
  multiplication by a nonzero integer on an abelian scheme, are README targets whose carriers are not
  at the pins; the closing comment lists those targets by name.
-/

namespace TauCetiRoadmap.JacobianChallengePartII

noncomputable section

open CategoryTheory CategoryTheory.Limits AlgebraicGeometry
open scoped CategoryTheory.MonObj

/-! ## Layer 2: Abel maps and section-free differences

The pointed difference `CurveDifference.pointedMap` of README §2.6 is built from a degree-one Abel
morphism; it agrees with the section-free difference of the Picard torsor (README §2.1, §2.6).
Yuan, arXiv:2108.05625v4, §2.2.1, p. 29; Theorem 2.10(2), pp. 37–38.
-/

namespace RelativeJacobian.CurveDifference
open CategoryTheory.MonoidalCategory CategoryTheory.CartesianMonoidalCategory
universe u
variable {S : Scheme.{u}} {A X T U : Over S} [GrpObj A]

/-- The pointed comparison built from the earlier degree-one Abel morphism. -/
def pointedMap (abel : X ⟶ A) : X ⨯ X ⟶ A :=
  (prod.snd ≫ abel) / (prod.fst ≫ abel)

/-- On a pair of test-scheme points, the difference is the second Abel image divided by the first. -/
theorem pointedMap_value (abel : X ⟶ A) (x y : T ⟶ X) :
    prod.lift x y ≫ pointedMap abel = (y ≫ abel) / (x ≫ abel) := by
  sorry

/-- The diagonal maps to the identity section of the group object. -/
theorem pointedMap_diagonal (abel : X ⟶ A) :
    prod.lift (𝟙 X) (𝟙 X) ≫ pointedMap abel = (1 : X ⟶ A) := by
  sorry

/-- Interchanging the two curve factors inverts the difference. -/
theorem pointedMap_swap (abel : X ⟶ A) :
    (prod.braiding X X).hom ≫ pointedMap abel = (pointedMap abel)⁻¹ := by
  sorry

/-- Successive differences multiply to the difference between the first and last points. -/
theorem pointedMap_cocycle [IsCommMonObj A] (abel : X ⟶ A)
    (x y z : T ⟶ X) :
    (prod.lift x y ≫ pointedMap abel) * (prod.lift y z ≫ pointedMap abel) =
      prod.lift x z ≫ pointedMap abel := by
  sorry

/-- A common translation of the Abel morphism leaves the difference unchanged. -/
theorem pointedMap_translate [IsCommMonObj A] (abel : X ⟶ A)
    (b : 𝟙_ (Over S) ⟶ A) :
    pointedMap ((toUnit X ≫ b) * abel) = pointedMap abel := by
  sorry

/-- Precomposing the test-scheme points commutes with taking their difference. -/
theorem pointedMap_natural (abel : X ⟶ A) (h : U ⟶ T) (x y : T ⟶ X) :
    h ≫ (prod.lift x y ≫ pointedMap abel) =
      prod.lift (h ≫ x) (h ≫ y) ≫ pointedMap abel := by
  sorry

/-- Pullback preserves the difference under the canonical binary-product comparison. -/
theorem pointedMap_baseChange {S' : Scheme.{u}} (f : S' ⟶ S) (abel : X ⟶ A) :
    letI : GrpObj ((Over.pullback f).obj A) := Functor.grpObjObj
    (Over.pullback f).map (pointedMap abel) =
      (PreservesLimitPair.iso (Over.pullback f) X X).hom ≫
        pointedMap ((Over.pullback f).map abel) := by
  sorry

-- pointedMap.test_equal: zero on the diagonal of every test scheme.
example (abel : X ⟶ A) (x : T ⟶ X) :
    prod.lift x x ≫ pointedMap abel = (1 : T ⟶ A) := by
  simp [pointedMap, GrpObj.comp_div]

-- pointedMap.test_sign: the identity Abel map has the prescribed orientation.
example (y : T ⟶ A) :
    prod.lift (1 : T ⟶ A) y ≫ pointedMap (𝟙 A) = y ∧
      prod.lift y (1 : T ⟶ A) ≫ pointedMap (𝟙 A) = y⁻¹ := by
  simp [pointedMap, GrpObj.comp_div]

/-- pointedMap.test_triangle: cancellation retains the order of both differences. -/
theorem pointedMap.test_triangle [IsCommMonObj A] (x y z : T ⟶ A) :
    (prod.lift x y ≫ pointedMap (𝟙 A)) *
      (prod.lift y z ≫ pointedMap (𝟙 A)) =
        prod.lift x z ≫ pointedMap (𝟙 A) := by
  sorry

/-- pointedMap.test_translation: a base section changes no fibrewise difference. -/
theorem pointedMap.test_translation [IsCommMonObj A] (abel : X ⟶ A) (b : 𝟙_ (Over S) ⟶ A)
    (x y : T ⟶ X) :
    prod.lift x y ≫ pointedMap ((toUnit X ≫ b) * abel) =
      prod.lift x y ≫ pointedMap abel := by
  sorry
end RelativeJacobian.CurveDifference

/-! ## Layer 5: Fibre powers and shifted Faltings–Zhang maps

The canonical Abel morphism (README §5.1) and the section-free difference (README §2.6) are inputs.
Yuan, arXiv:2108.05625v4, Theorem 2.10(3), p. 37; §4.6.2, pp. 96–98,
and Dimitrov–Gao–Habegger, arXiv:2001.10276v3, §6.1, p. 25.
-/

namespace RelativeJacobian
universe u
variable {S : Scheme.{u}} {A X T : Over S} [GrpObj A]

/-- The universal shift `(y, x) ↦ (y, y + c(x))` of README §5.2, for the canonical Abel morphism
`c = i_ω` of README §5.1. -/
def UniversalShift (canonicalAbel : X ⟶ A) : A ⨯ X ⟶ A ⨯ A :=
  prod.lift prod.fst (prod.fst * (prod.snd ≫ canonicalAbel))

namespace UniversalShift
/-- The universal shift keeps the translation and multiplies it by the Abel image. -/
theorem value (c : X ⟶ A) (y : T ⟶ A) (x : T ⟶ X) :
    prod.lift y x ≫ UniversalShift c = prod.lift y (y * (x ≫ c)) := by
  sorry
/-- The universal shift is a morphism over its first group-scheme factor. -/
theorem overJ (c : X ⟶ A) : UniversalShift c ≫ prod.fst = prod.fst := by
  sorry
/-- The shift commutes with arbitrary base change using the canonical product comparisons. -/
theorem baseChange {S' : Scheme.{u}} (f : S' ⟶ S) (c : X ⟶ A) :
    letI : GrpObj ((Over.pullback f).obj A) := Functor.grpObjObj
    (Over.pullback f).map (UniversalShift c) ≫
        (PreservesLimitPair.iso (Over.pullback f) A A).hom =
      (PreservesLimitPair.iso (Over.pullback f) A X).hom ≫
        UniversalShift ((Over.pullback f).map c) := by
  sorry
-- test_zeroShift
example (c : X ⟶ A) (x : T ⟶ X) :
    prod.lift (1 : T ⟶ A) x ≫ UniversalShift c =
      prod.lift (1 : T ⟶ A) (x ≫ c) := by
  simp [UniversalShift, MonObj.comp_mul]
-- The geometric test_genusOne requires the canonical-bundle identification.
-- Its expressible group-law consequence: zero canonical Abel gives a diagonal shift.
example (y : T ⟶ A) (x : T ⟶ X) :
    prod.lift y x ≫ UniversalShift (1 : X ⟶ A) = prod.lift y y := by
  simp [UniversalShift]
/-- test_firstCoordinate -/
theorem test_firstCoordinate (c : X ⟶ A) (y : T ⟶ A) (x x' : T ⟶ X) :
    prod.lift y x ≫ UniversalShift c ≫ prod.fst =
      prod.lift y x' ≫ UniversalShift c ≫ prod.fst := by
  sorry
end UniversalShift

/-- The Faltings–Zhang morphism `(x₀, …, x_m) ↦ (d(x₀, x₁), …, d(x₀, x_m))` of README §5.3, for the
section-free difference `d = j` of README §2.6. -/
def FaltingsZhang (m : ℕ) (difference : X ⨯ X ⟶ A) :
    (∏ᶜ fun _ : Fin (m + 1) ↦ X) ⟶ (∏ᶜ fun _ : Fin m ↦ A) :=
  Pi.lift (fun i ↦ prod.lift (Pi.π (fun _ : Fin (m + 1) ↦ X) 0)
    (Pi.π (fun _ : Fin (m + 1) ↦ X) i.succ) ≫ difference)

namespace FaltingsZhang
/-- The ith coordinate compares the first curve point with the next ith point. -/
theorem coordinate (m : ℕ) (d : X ⨯ X ⟶ A) (i : Fin m) :
    FaltingsZhang m d ≫ Pi.π (fun _ : Fin m ↦ A) i =
      prod.lift (Pi.π (fun _ : Fin (m + 1) ↦ X) 0)
        (Pi.π (fun _ : Fin (m + 1) ↦ X) i.succ) ≫ d := by
  sorry
/-- The difference-power morphism commutes with arbitrary base change. -/
theorem baseChange {S' : Scheme.{u}} (f : S' ⟶ S) (m : ℕ) (d : X ⨯ X ⟶ A) :
    (Over.pullback f).map (FaltingsZhang m d) ≫
        (PreservesProduct.iso (Over.pullback f) (fun _ : Fin m ↦ A)).hom =
      (PreservesProduct.iso (Over.pullback f) (fun _ : Fin (m + 1) ↦ X)).hom ≫
        FaltingsZhang m
          ((PreservesLimitPair.iso (Over.pullback f) X X).inv ≫ (Over.pullback f).map d) := by
  sorry
/-- The degree-one pointed comparison is an equality of actual scheme morphisms. -/
theorem pointed (m : ℕ) (d : X ⨯ X ⟶ A) (abel : X ⟶ A)
    (hd : d = (prod.snd ≫ abel) / (prod.fst ≫ abel))
    (P : ⊤_ (Over S) ⟶ X) (hP : P ≫ abel = 1) (x : Fin m → (T ⟶ X)) :
    Pi.lift (Fin.cases (terminal.from T ≫ P) x) ≫ FaltingsZhang m d =
      Pi.lift (fun i ↦ x i ≫ abel) := by
  sorry
/-- A proper source over the base and a separated target make the difference-power map proper. -/
theorem proper (m : ℕ) (d : X ⨯ X ⟶ A)
    [IsProper (piObj (fun _ : Fin (m + 1) ↦ X)).hom]
    [IsSeparated (piObj (fun _ : Fin m ↦ A)).hom] :
    IsProper (FaltingsZhang m d).left := by
  sorry
-- test_one
example (d : X ⨯ X ⟶ A) (x₀ x₁ : T ⟶ X) :
    Pi.lift (fun i : Fin 2 ↦ if i = 0 then x₀ else x₁) ≫
        FaltingsZhang 1 d ≫ Pi.π (fun _ : Fin 1 ↦ A) 0 =
      prod.lift x₀ x₁ ≫ d := by
  simp [FaltingsZhang, ← Category.assoc, prod.comp_lift]
/-- test_diagonal, using the diagonal-zero law of the supplied difference morphism. -/
theorem test_diagonal (m : ℕ) (d : X ⨯ X ⟶ A)
    (hd : prod.lift (𝟙 X) (𝟙 X) ≫ d = 1) (x : T ⟶ X) :
    Pi.lift (fun _ : Fin (m + 1) ↦ x) ≫ FaltingsZhang m d =
      Pi.lift (fun _ : Fin m ↦ (1 : T ⟶ A)) := by
  sorry
/-- test_originChange: with any degree-one Abel morphism, every coordinate is a difference of Abel images. -/
theorem test_originChange (m : ℕ) (d : X ⨯ X ⟶ A) (abel : X ⟶ A)
    (hd : d = (prod.snd ≫ abel) / (prod.fst ≫ abel))
    (x : Fin (m + 1) → (T ⟶ X)) :
    Pi.lift x ≫ FaltingsZhang m d =
      Pi.lift (fun i : Fin m ↦ (x i.succ ≫ abel) / (x 0 ≫ abel)) := by
  sorry
end FaltingsZhang

/-- The shifted Faltings–Zhang morphism of README §5.4, with `m = n + 1` and source order `X^m × A`:
the head is `c(x₁) + y` and coordinate `r > 1` is `d(x₁, x_r)`. -/
def ShiftedFaltingsZhang (n : ℕ) (canonicalAbel : X ⟶ A) (difference : X ⨯ X ⟶ A) :
    (∏ᶜ fun _ : Fin (n + 1) ↦ X) ⨯ A ⟶ (∏ᶜ fun _ : Fin (n + 1) ↦ A) :=
  Pi.lift (fun i ↦ if i = 0 then
    ((prod.fst ≫ Pi.π (fun _ : Fin (n + 1) ↦ X) 0) ≫ canonicalAbel) * prod.snd
    else prod.lift (prod.fst ≫ Pi.π (fun _ : Fin (n + 1) ↦ X) 0)
      (prod.fst ≫ Pi.π (fun _ : Fin (n + 1) ↦ X) i) ≫ difference)

namespace ShiftedFaltingsZhang
/-- The head is the canonical Abel image of the first curve point multiplied by the translation. -/
theorem first (n : ℕ) (c : X ⟶ A) (d : X ⨯ X ⟶ A) :
    ShiftedFaltingsZhang n c d ≫ Pi.π (fun _ : Fin (n + 1) ↦ A) 0 =
      ((prod.fst ≫ Pi.π (fun _ : Fin (n + 1) ↦ X) 0) ≫ c) * prod.snd := by
  sorry
/-- Every tail coordinate is the supplied difference from the first curve point. -/
theorem tail (n : ℕ) (c : X ⟶ A) (d : X ⨯ X ⟶ A)
    (i : Fin (n + 1)) (hi : i ≠ 0) :
    ShiftedFaltingsZhang n c d ≫ Pi.π (fun _ : Fin (n + 1) ↦ A) i =
      prod.lift (prod.fst ≫ Pi.π (fun _ : Fin (n + 1) ↦ X) 0)
        (prod.fst ≫ Pi.π (fun _ : Fin (n + 1) ↦ X) i) ≫ d := by
  sorry
/-- The shifted difference-power morphism commutes with arbitrary base change. -/
theorem baseChange {S' : Scheme.{u}} (f : S' ⟶ S) (n : ℕ)
    (c : X ⟶ A) (d : X ⨯ X ⟶ A) :
    letI : GrpObj ((Over.pullback f).obj A) := Functor.grpObjObj
    (Over.pullback f).map (ShiftedFaltingsZhang n c d) ≫
        (PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ A)).hom =
      (PreservesLimitPair.iso (Over.pullback f) (piObj (fun _ : Fin (n + 1) ↦ X)) A).hom ≫
        prod.map (PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ X)).hom
          (𝟙 ((Over.pullback f).obj A)) ≫
        ShiftedFaltingsZhang n ((Over.pullback f).map c)
          ((PreservesLimitPair.iso (Over.pullback f) X X).inv ≫ (Over.pullback f).map d) := by
  sorry
-- test_one
example (c : X ⟶ A) (d : X ⨯ X ⟶ A) (x : T ⟶ X) (y : T ⟶ A) :
    prod.lift (Pi.lift (fun _ : Fin 1 ↦ x)) y ≫
        ShiftedFaltingsZhang 0 c d ≫ Pi.π (fun _ : Fin 1 ↦ A) 0 =
      (x ≫ c) * y := by
  simp [ShiftedFaltingsZhang, MonObj.comp_mul]
-- test_sign
example (c : A ⟶ A) (x₁ x₂ y : T ⟶ A) :
    prod.lift (Pi.lift (fun i : Fin 2 ↦ if i = 0 then x₁ else x₂)) y ≫
        ShiftedFaltingsZhang 1 c (CurveDifference.pointedMap (𝟙 A)) ≫
          Pi.π (fun _ : Fin 2 ↦ A) 1 = x₂ / x₁ := by
  simp [ShiftedFaltingsZhang, CurveDifference.pointedMap, GrpObj.comp_div]
/-- test_diagonal -/
theorem test_diagonal (n : ℕ) (c : X ⟶ A) (d : X ⨯ X ⟶ A)
    (hd : prod.lift (𝟙 X) (𝟙 X) ≫ d = 1) (x : T ⟶ X) (y : T ⟶ A) :
    prod.lift (Pi.lift (fun _ : Fin (n + 1) ↦ x)) y ≫ ShiftedFaltingsZhang n c d =
      Pi.lift (fun i ↦ if i = 0 then (x ≫ c) * y else 1) := by
  sorry
end ShiftedFaltingsZhang
end RelativeJacobian

/-! ### The triangular coordinate change (README §5.5)

Yuan, arXiv:2108.05625v4, proof of Theorem 4.17(5), p. 98. -/

namespace RelativeJacobian
universe u
variable {S : Scheme.{u}} {A T U : Over S} [GrpObj A]

/-- The triangular change on actual T-valued points of a group scheme. -/
def TriangularCoordinateEquivalence (n : ℕ) :
    (Fin (n + 1) → (T ⟶ A)) ≃ (Fin (n + 1) → (T ⟶ A)) where
  toFun q i := if i = 0 then q 0 else q i / q 0
  invFun r i := if i = 0 then r 0 else r i * r 0
  left_inv := by
    intro q
    funext i
    by_cases hi : i = 0 <;> simp [hi]
  right_inv := by
    intro r
    funext i
    by_cases hi : i = 0 <;> simp [hi]

namespace TriangularCoordinateEquivalence
/-- The triangular coordinate change preserves the first coordinate. -/
theorem first (n : ℕ) (q : Fin (n + 1) → (T ⟶ A)) :
    TriangularCoordinateEquivalence n q 0 = q 0 := by
  sorry
/-- Each tail coordinate is divided by the first coordinate. -/
theorem tail (n : ℕ) (q : Fin (n + 1) → (T ⟶ A)) (i : Fin (n + 1))
    (hi : i ≠ 0) : TriangularCoordinateEquivalence n q i = q i / q 0 := by
  sorry
/-- The inverse restores each tail by multiplication on the right by the head. -/
theorem inverse (n : ℕ) (r : Fin (n + 1) → (T ⟶ A)) (i : Fin (n + 1)) :
    (TriangularCoordinateEquivalence n).symm r i =
      if i = 0 then r 0 else r i * r 0 := by
  sorry
/-- The coordinate change commutes with test-scheme precomposition. -/
theorem natural (n : ℕ) (h : U ⟶ T) (q : Fin (n + 1) → (T ⟶ A)) :
    TriangularCoordinateEquivalence n (fun i ↦ h ≫ q i) =
      fun i ↦ h ≫ TriangularCoordinateEquivalence n q i := by
  sorry

/-- The inverse coordinate change also commutes with test-scheme precomposition. -/
theorem inverse_natural (n : ℕ) (h : U ⟶ T) (r : Fin (n + 1) → (T ⟶ A)) :
    (TriangularCoordinateEquivalence n).symm (fun i ↦ h ≫ r i) =
      fun i ↦ h ≫ (TriangularCoordinateEquivalence n).symm r i := by
  sorry

-- test_lengthOne: degenerate one-coordinate transformation.
example (q : Fin 1 → (T ⟶ A)) : TriangularCoordinateEquivalence 0 q = q := by
  ext i
  have hi : i = 0 := Fin.eq_zero i
  simp [TriangularCoordinateEquivalence, hi]
/-- test_lengthTwo: actual morphism pair, including nonreduced test schemes. -/
theorem test_lengthTwo (f g : T ⟶ A) :
    (TriangularCoordinateEquivalence 1).symm
      (fun i : Fin 2 ↦ if i = 0 then f else g / f) =
        (fun i : Fin 2 ↦ if i = 0 then f else g) := by
  sorry
-- test_constant: preserves the head and kills every tail difference.
example (n : ℕ) (f : T ⟶ A) :
    TriangularCoordinateEquivalence n (fun _ ↦ f) =
      fun i ↦ if i = 0 then f else 1 := by
  ext i
  by_cases hi : i = 0 <;> simp [TriangularCoordinateEquivalence, hi]

/-!
The finite product in `Over S` is the actual fibre power of the scheme A.
Its coordinate maps are morphisms over S. No commutativity is needed: the
inverse restores the first coordinate by multiplication on the right.
-/

/-- The scheme isomorphism representing the triangular change on all test schemes. -/
def schemeIso (n : ℕ) :
    (∏ᶜ fun _ : Fin (n + 1) ↦ A) ≅ (∏ᶜ fun _ : Fin (n + 1) ↦ A) where
  hom := Pi.lift (fun i ↦ if i = 0 then Pi.π (fun _ : Fin (n + 1) ↦ A) 0
    else Pi.π (fun _ : Fin (n + 1) ↦ A) i /
      Pi.π (fun _ : Fin (n + 1) ↦ A) 0)
  inv := Pi.lift (fun i ↦ if i = 0 then Pi.π (fun _ : Fin (n + 1) ↦ A) 0
    else Pi.π (fun _ : Fin (n + 1) ↦ A) i *
      Pi.π (fun _ : Fin (n + 1) ↦ A) 0)
  hom_inv_id := by
    apply Pi.hom_ext
    intro i
    by_cases hi : i = 0 <;>
      simp [hi, Category.assoc, MonObj.comp_mul]
  inv_hom_id := by
    apply Pi.hom_ext
    intro i
    by_cases hi : i = 0 <;>
      simp [hi, Category.assoc, GrpObj.comp_div]

/-- On arbitrary test-scheme morphisms, the scheme map is the original point equivalence. -/
theorem schemeIso_hom_coordinates (n : ℕ)
    (q : T ⟶ ∏ᶜ fun _ : Fin (n + 1) ↦ A) :
    (fun i ↦ q ≫ (schemeIso (A := A) n).hom ≫
      Pi.π (fun _ : Fin (n + 1) ↦ A) i) =
        TriangularCoordinateEquivalence n
          (fun i ↦ q ≫ Pi.π (fun _ : Fin (n + 1) ↦ A) i) := by
  sorry

/-- The inverse is represented by the inverse scheme morphism on every test scheme. -/
theorem schemeIso_inv_coordinates (n : ℕ)
    (q : T ⟶ ∏ᶜ fun _ : Fin (n + 1) ↦ A) :
    (fun i ↦ q ≫ (schemeIso (A := A) n).inv ≫
      Pi.π (fun _ : Fin (n + 1) ↦ A) i) =
        (TriangularCoordinateEquivalence n).symm
          (fun i ↦ q ≫ Pi.π (fun _ : Fin (n + 1) ↦ A) i) := by
  sorry

/-- Base extension of the scheme coordinate change uses the canonical fibre-power comparison. -/
theorem schemeIso_baseChange {S' : Scheme.{u}} (f : S' ⟶ S) (n : ℕ) :
    letI : GrpObj ((Over.pullback f).obj A) := Functor.grpObjObj
    (Over.pullback f).map (schemeIso (A := A) n).hom ≫
      (PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ A)).hom =
    (PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ A)).hom ≫
      (schemeIso (A := (Over.pullback f).obj A) n).hom := by
  sorry

/-- The whole isomorphism, including its inverse, commutes with arbitrary base extension. -/
theorem schemeIso_baseChangeIso {S' : Scheme.{u}} (f : S' ⟶ S) (n : ℕ) :
    letI : GrpObj ((Over.pullback f).obj A) := Functor.grpObjObj
    (Over.pullback f).mapIso (schemeIso (A := A) n) ≪≫
        PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ A) =
      PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ A) ≪≫
        schemeIso (A := (Over.pullback f).obj A) n := by
  sorry

-- test_schemeLengthOne: the isomorphism of the actual one-factor fibre power is identity.
example : schemeIso (A := A) 0 = Iso.refl _ := by
  apply Iso.ext
  apply Pi.hom_ext
  intro i
  have hi : i = 0 := Fin.eq_zero i
  simp [schemeIso, hi]

/-- test_schemeLengthTwo: recover the actual pair of morphisms with the prescribed right inverse. -/
theorem test_schemeLengthTwo (f g : T ⟶ A) :
    Pi.lift (fun i : Fin 2 ↦ if i = 0 then f else g / f) ≫
        (schemeIso (A := A) 1).inv =
      Pi.lift (fun i : Fin 2 ↦ if i = 0 then f else g) := by
  sorry

/-- test_schemeDiagonal: the small diagonal has the original head and identity tail. -/
theorem test_schemeDiagonal (n : ℕ) (f : T ⟶ A) :
    Pi.lift (fun _ : Fin (n + 1) ↦ f) ≫ (schemeIso (A := A) n).hom =
      Pi.lift (fun i : Fin (n + 1) ↦ if i = 0 then f else 1) := by
  sorry

/-- test_schemeNoncommutingInverse: left restoration fails when the head and tail do not commute. -/
theorem test_schemeNoncommutingInverse (a b : T ⟶ A) (h : a * b ≠ b * a) :
    Pi.lift (fun i : Fin 2 ↦ if i = 0 then a else b) ≫
        (schemeIso (A := A) 1).inv ≠
      Pi.lift (fun i : Fin 2 ↦ if i = 0 then a else a * b) := by
  sorry

end TriangularCoordinateEquivalence
end RelativeJacobian

/-! ### The shifted-power factorization (README §5.6)

The factorization uses the Abel-difference identity of README §2.6; finite locally free
multiplication by a nonzero integer is AbelianSchemesAndArithmeticModuli A3.2.
Yuan, arXiv:2108.05625v4, proof of Theorem 4.17(5), p. 98. -/

namespace RelativeJacobian
universe u
variable {S : Scheme.{u}} {A X T : Over S} [GrpObj A]

/-- The shifted canonical power `B(x₁, …, x_m, y) = (c(x₁) + y, …, c(x_m) + y)` of README §5.6. -/
def ShiftedCanonicalPower (n : ℕ) (c : X ⟶ A) :
    (∏ᶜ fun _ : Fin (n + 1) ↦ X) ⨯ A ⟶ (∏ᶜ fun _ : Fin (n + 1) ↦ A) :=
  Pi.lift (fun i ↦ ((prod.fst ≫ Pi.π (fun _ : Fin (n + 1) ↦ X) i) ≫ c) * prod.snd)

namespace ShiftedCanonicalPower
/-- Every coordinate is its canonical Abel image multiplied by the same translation. -/
theorem coordinate (n : ℕ) (c : X ⟶ A) (i : Fin (n + 1)) :
    ShiftedCanonicalPower n c ≫ Pi.π (fun _ : Fin (n + 1) ↦ A) i =
      ((prod.fst ≫ Pi.π (fun _ : Fin (n + 1) ↦ X) i) ≫ c) * prod.snd := by
  sorry

-- The single coordinate retains the canonical shift.
example (c : X ⟶ A) (x : T ⟶ X) (y : T ⟶ A) :
    prod.lift (Pi.lift (fun _ : Fin 1 ↦ x)) y ≫ ShiftedCanonicalPower 0 c ≫
      Pi.π (fun _ : Fin 1 ↦ A) 0 = (x ≫ c) * y := by
  simp [ShiftedCanonicalPower, MonObj.comp_mul]

/-- Zero translation gives the product of canonical Abel morphisms. -/
theorem test_zeroTranslation (n : ℕ) (c : X ⟶ A) (x : Fin (n + 1) → (T ⟶ X)) :
    prod.lift (Pi.lift x) (1 : T ⟶ A) ≫ ShiftedCanonicalPower n c =
      Pi.lift (fun i ↦ x i ≫ c) := by
  sorry

/-- A diagonal source gives the same shifted image in every coordinate. -/
theorem test_diagonal (n : ℕ) (c : X ⟶ A) (x : T ⟶ X) (y : T ⟶ A) :
    prod.lift (Pi.lift (fun _ : Fin (n + 1) ↦ x)) y ≫ ShiftedCanonicalPower n c =
      Pi.lift (fun _ ↦ (x ≫ c) * y) := by
  sorry
end ShiftedCanonicalPower

/-- The tail isogeny `D` of README §5.6: fix the head and multiply each tail by `e`. -/
def TailMultiplication (n : ℕ) (e : ℤ) :
    (∏ᶜ fun _ : Fin (n + 1) ↦ A) ⟶ (∏ᶜ fun _ : Fin (n + 1) ↦ A) :=
  Pi.lift (fun i ↦ if i = 0 then Pi.π (fun _ : Fin (n + 1) ↦ A) 0
    else Pi.π (fun _ : Fin (n + 1) ↦ A) i ^ e)

namespace TailMultiplication
/-- Tail multiplication fixes the head coordinate. -/
theorem first (n : ℕ) (e : ℤ) :
    TailMultiplication (A := A) n e ≫ Pi.π (fun _ : Fin (n + 1) ↦ A) 0 =
      Pi.π (fun _ : Fin (n + 1) ↦ A) 0 := by
  sorry
/-- Every tail is raised to the specified integer power. -/
theorem tail (n : ℕ) (e : ℤ) (i : Fin (n + 1)) (hi : i ≠ 0) :
    TailMultiplication (A := A) n e ≫ Pi.π (fun _ : Fin (n + 1) ↦ A) i =
      Pi.π (fun _ : Fin (n + 1) ↦ A) i ^ e := by
  sorry

/-- Separate the head from the tail as actual fibre-power schemes over S. -/
def headTailIso (n : ℕ) :
    (∏ᶜ fun _ : Fin (n + 1) ↦ A) ≅ A ⨯ (∏ᶜ fun _ : Fin n ↦ A) where
  hom := prod.lift (Pi.π (fun _ : Fin (n + 1) ↦ A) 0)
    (Pi.lift (fun i : Fin n ↦ Pi.π (fun _ : Fin (n + 1) ↦ A) i.succ))
  inv := Pi.lift (Fin.cases prod.fst
    (fun i : Fin n ↦ prod.snd ≫ Pi.π (fun _ : Fin n ↦ A) i))
  hom_inv_id := by
    apply Pi.hom_ext
    intro i
    refine Fin.cases ?_ (fun j ↦ ?_) i <;> simp [Category.assoc]
  inv_hom_id := by
    apply prod.hom_ext
    · simp
    · apply Pi.hom_ext
      intro i
      simp [Category.assoc]

omit [GrpObj A] in
/-- The head-tail decomposition places the original first coordinate in the head. -/
theorem headTailIso_first (n : ℕ) :
    (headTailIso (A := A) n).hom ≫ prod.fst =
      Pi.π (fun _ : Fin (n + 1) ↦ A) 0 := by
  sorry

omit [GrpObj A] in
/-- The decomposition retains each successor coordinate in its original tail order. -/
theorem headTailIso_tail (n : ℕ) (i : Fin n) :
    (headTailIso (A := A) n).hom ≫ prod.snd ≫ Pi.π (fun _ : Fin n ↦ A) i =
      Pi.π (fun _ : Fin (n + 1) ↦ A) i.succ := by
  sorry

omit [GrpObj A] in
/-- The inverse decomposition concatenates the given head and tail. -/
theorem headTailIso_inverse (n : ℕ) (a : T ⟶ A) (q : Fin n → (T ⟶ A)) :
    prod.lift a (Pi.lift q) ≫ (headTailIso (A := A) n).inv =
      Pi.lift (Fin.cases a q) := by
  sorry

/-- The decomposition identifies D with identity × the product of [e].
Finite, flat, presentation and surjectivity transfers use product stability
and invariance under this isomorphism, rather than just a pointwise formula. -/
theorem split (n : ℕ) (e : ℤ) :
    TailMultiplication (A := A) n e ≫ (headTailIso (A := A) n).hom =
      (headTailIso (A := A) n).hom ≫
        prod.map (𝟙 A) (CategoryTheory.Limits.Pi.map
          (fun _ : Fin n ↦ ((𝟙 A) ^ e : A ⟶ A))) := by
  sorry

/-- On actual T-valued points D is a group homomorphism when A is commutative.
This condition matters: integer powers need not preserve a noncommutative law. -/
def points [IsCommMonObj A] (n : ℕ) (e : ℤ) :
    (Fin (n + 1) → (T ⟶ A)) →* (Fin (n + 1) → (T ⟶ A)) where
  toFun q i := if i = 0 then q 0 else q i ^ e
  map_one' := by
    funext i
    by_cases hi : i = 0 <;> simp [hi]
  map_mul' := by
    intro q r
    funext i
    by_cases hi : i = 0 <;> simp [hi, mul_zpow]

/-- The fibre-power morphism represents the coordinatewise homomorphism on every test scheme. -/
theorem represented [IsCommMonObj A] (n : ℕ) (e : ℤ)
    (q : Fin (n + 1) → (T ⟶ A)) :
    Pi.lift q ≫ TailMultiplication (A := A) n e =
      Pi.lift (points (T := T) n e q) := by
  sorry

/-- The represented homomorphism commutes with test-scheme precomposition. -/
theorem natural [IsCommMonObj A] {U : Over S} (h : U ⟶ T) (n : ℕ) (e : ℤ)
    (q : Fin (n + 1) → (T ⟶ A)) :
    points (T := U) n e (fun i ↦ h ≫ q i) =
      fun i ↦ h ≫ points (T := T) n e q i := by
  sorry

/-- Arbitrary base change preserves D with the finite-product comparison. -/
theorem baseChange {S' : Scheme.{u}} (f : S' ⟶ S) (n : ℕ) (e : ℤ) :
    letI : GrpObj ((Over.pullback f).obj A) := Functor.grpObjObj
    (Over.pullback f).map (TailMultiplication (A := A) n e) ≫
        (PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ A)).hom =
      (PreservesProduct.iso (Over.pullback f) (fun _ : Fin (n + 1) ↦ A)).hom ≫
        TailMultiplication (A := (Over.pullback f).obj A) n e := by
  sorry

-- headTailIso.test_singleton: the empty tail is the terminal fibre power.
omit [GrpObj A] in
theorem headTailIso.test_singleton (a : T ⟶ A) :
    Pi.lift (fun _ : Fin 1 ↦ a) ≫ (headTailIso (A := A) 0).hom =
      prod.lift a (Pi.lift (fun i : Fin 0 ↦ Fin.elim0 i)) := by
  sorry

-- headTailIso.test_pair: order and absence of scaling in the decomposition.
omit [GrpObj A] in
example (a b : T ⟶ A) :
    Pi.lift (fun i : Fin 2 ↦ if i = 0 then a else b) ≫ (headTailIso (A := A) 1).hom =
      prod.lift a (Pi.lift (fun _ : Fin 1 ↦ b)) := by
  apply prod.hom_ext
  · simp [headTailIso]
  · apply Pi.hom_ext
    intro i
    have hi : i = 0 := Fin.eq_zero i
    simp [headTailIso, hi]

-- headTailIso.test_inversePair: recover the original head and tail, in order.
omit [GrpObj A] in
theorem headTailIso.test_inversePair (a b : T ⟶ A) :
    prod.lift a (Pi.lift (fun _ : Fin 1 ↦ b)) ≫ (headTailIso (A := A) 1).inv =
      Pi.lift (fun i : Fin 2 ↦ if i = 0 then a else b) := by
  sorry

-- points.test_double: the head stays unchanged when the tails are squared.
example [IsCommMonObj A] (a b : T ⟶ A) :
    points (T := T) 1 2 (fun i : Fin 2 ↦ if i = 0 then a else b) =
      fun i : Fin 2 ↦ if i = 0 then a else b * b := by
  ext i
  by_cases hi : i = 0 <;> simp [points, hi, pow_two]

-- points.test_negative: negative integer multiplication inverts the tails.
example [IsCommMonObj A] (n : ℕ) (q : Fin (n + 1) → (T ⟶ A)) :
    points (T := T) n (-1) q = fun i ↦ if i = 0 then q 0 else (q i)⁻¹ := by
  ext i
  by_cases hi : i = 0 <;> simp [points, hi]

/-- points.test_zero: zero multiplication fixes the head and kills each tail. -/
theorem points.test_zero [IsCommMonObj A] (n : ℕ) (q : Fin (n + 1) → (T ⟶ A)) :
    points (T := T) n 0 q = fun i ↦ if i = 0 then q 0 else 1 := by
  sorry
end TailMultiplication

/-- README §5.6: the Abel-difference identity gives `B ≫ R = τ ≫ D` as an S-morphism.
In the geometric application e = 2g - 2 and c = i_ω. -/
theorem shifted_power_factorization [IsCommMonObj A] (n : ℕ) (e : ℤ)
    (c : X ⟶ A) (d : X ⨯ X ⟶ A)
    (hdegree : (prod.snd ≫ c) / (prod.fst ≫ c) = d ^ e) :
    ShiftedCanonicalPower n c ≫ (TriangularCoordinateEquivalence.schemeIso (A := A) n).hom =
      ShiftedFaltingsZhang n c d ≫ TailMultiplication (A := A) n e := by
  sorry

/-- The head-tail product decomposition transfers finiteness of the power morphism to `D`. -/
theorem TailMultiplication.finite (n : ℕ) (e : ℤ)
    [IsFinite (((𝟙 A) ^ e : A ⟶ A).left)] :
    IsFinite (TailMultiplication (A := A) n e).left := by
  sorry

/-- The head-tail product decomposition transfers flatness of the power morphism to `D`. -/
theorem TailMultiplication.flat (n : ℕ) (e : ℤ)
    [Flat (((𝟙 A) ^ e : A ⟶ A).left)] :
    Flat (TailMultiplication (A := A) n e).left := by
  sorry

/-- The head-tail product decomposition transfers local finite presentation of the power morphism. -/
theorem TailMultiplication.finitePresentation (n : ℕ) (e : ℤ)
    [LocallyOfFinitePresentation (((𝟙 A) ^ e : A ⟶ A).left)] :
    LocallyOfFinitePresentation (TailMultiplication (A := A) n e).left := by
  sorry

/-- The head-tail product decomposition transfers surjectivity of the power morphism to `D`. -/
theorem TailMultiplication.surjective (n : ℕ) (e : ℤ)
    [Surjective (((𝟙 A) ^ e : A ⟶ A).left)] :
    Surjective (TailMultiplication (A := A) n e).left := by
  sorry

/-- The m = 1 factorization has no tail isogeny. -/
theorem TailMultiplication.test_singleton (e : ℤ) : TailMultiplication (A := A) 0 e = 𝟙 _ := by
  sorry

-- The m = 2 tail keeps its positive integer scaling; it is not just the coordinate change.
example (e : ℤ) (a b : T ⟶ A) :
    Pi.lift (fun i : Fin 2 ↦ if i = 0 then a else b) ≫ TailMultiplication (A := A) 1 e =
      Pi.lift (fun i : Fin 2 ↦ if i = 0 then a else b ^ e) := by
  apply Pi.hom_ext
  intro i
  by_cases hi : i = 0 <;> simp [TailMultiplication, hi, GrpObj.comp_zpow]

/-- Multiplication by one is identity on every factor. -/
theorem TailMultiplication.test_one (n : ℕ) : TailMultiplication (A := A) n 1 = 𝟙 _ := by
  sorry

/-- Inverting every tail is an isomorphism for any group object, including noncommutative ones. -/
theorem TailMultiplication.test_inversion (n : ℕ) :
    IsIso (TailMultiplication (A := A) n (-1)) := by
  sorry

/-- Multiplication by zero collapses the tails, so no general isogeny theorem is asserted at e = 0. -/
theorem TailMultiplication.test_zero (n : ℕ) (q : Fin (n + 1) → (T ⟶ A)) :
    Pi.lift q ≫ TailMultiplication (A := A) n 0 =
      Pi.lift (fun i ↦ if i = 0 then q 0 else 1) := by
  sorry

end RelativeJacobian


end

end TauCetiRoadmap.JacobianChallengePartII

/-
Targets stated in README.md and not typed here, because their carriers and comparison APIs (the
relative Picard sheaf and scheme, abelian schemes and their duals, polarizations, fibrewise Picard
identity components, relative coherent cohomology and duality, finite-stage sheaf descent, full
level structures) are not in Mathlib or Tau Ceti at the pins:
Layer 0: `RelativeJacobian.lineBundleFiniteStage`, `RelativeJacobian.degreeLocallyConstant`,
  `RelativeJacobian.RelativeDegreeComponents`,
  `RelativeJacobian.picardRepresentability`, `RelativeJacobian.PicardTorsors`.
  The finite-stage checks `RelativeJacobian.lineBundleFiniteStage.test_infinitePolynomial`,
  `RelativeJacobian.lineBundleFiniteStage.test_eventualEquality` and
  `RelativeJacobian.lineBundleFiniteStage.test_graph` require sheaf descent and comparison data.
  SchemeAndStackFoundations §0.9 supplies affine_transition_limits and finite_presentation_limits;
  lineBundleFiniteStage supplies their comparison with invertible sheaves.
Layer 1: `RelativeJacobian.jacobianProper`, `RelativeJacobian.RelativeJacobian`,
  `RelativeJacobian.jacobianBaseChange`, `RelativeJacobian.curveDeterminantOfCohomology`,
  `RelativeJacobian.PrincipalPolarization`.
  The curve determinant and its checks `RelativeJacobian.curveDeterminantOfCohomology.test_field`,
  `RelativeJacobian.curveDeterminantOfCohomology.test_baseTwist`,
  `RelativeJacobian.curveDeterminantOfCohomology.test_jumping` and
  `RelativeJacobian.curveDeterminantOfCohomology.test_divisorSequence` require relative derived
  pushforward and its perfect-complex presentations, beyond the ring-level complex carriers.
Layer 2: `RelativeJacobian.SectionFreeAbelMap`, `RelativeJacobian.DegreeAbelMap`,
  `RelativeJacobian.pointedFactorization`, `RelativeJacobian.degreeOneClosedImmersion`,
  `RelativeJacobian.nonzeroDegreeFinite`, `RelativeJacobian.CurveDifference` (the section-free
  morphism; its pointed companion `pointedMap` is above), `RelativeJacobian.diagonalBaseChange`.
  `RelativeJacobian.CurveDifference.test_noSection` checks the section-free morphism on a
  nontrivial genus-one torsor; it requires the Picard torsor and cannot be expressed by a pointed map.
  `RelativeJacobian.SectionFreeAbelMap.test_ellipticNormalization` and
  `RelativeJacobian.SectionFreeAbelMap.test_tangent` require the relative Picard carrier and the
  tangent/cohomology comparison; they are geometric theorem targets.
Layer 3: `RelativeJacobian.JacobianPoincare`, `RelativeJacobian.DegreeOneTheta`,
  `RelativeJacobian.TwiceTheta`, `RelativeJacobian.thetaInversePullback`,
  `RelativeJacobian.thetaPullback`, `RelativeJacobian.poincareAdditionIdentity`,
  `RelativeJacobian.poincareCurveSquare`, `RelativeJacobian.thetaDoublingFormula`,
  `RelativeJacobian.poincareDiagonal`, `RelativeJacobian.geometricTwiceTheta`,
  `RelativeJacobian.twiceThetaSymmetric`, `RelativeJacobian.twiceThetaZeroRigidified`,
  `RelativeJacobian.twiceThetaRelativelyAmple`.
Layer 4: `RelativeJacobian.ActualPicardZero`, `RelativeJacobian.ActualPicardBizero`,
  `RelativeJacobian.relativeAutodualityPullback`, `RelativeJacobian.actualToRelativeObstruction`,
  `RelativeJacobian.actualPullbackTorsionCokernel`, `RelativeJacobian.bizeroLiftOneFactor`,
  `RelativeJacobian.bizeroPullbackTorsionCokernel`, `RelativeJacobian.AxisNormalizedPicard`,
  `RelativeJacobian.pointedSquarePicardIsomorphism`.
  `RelativeJacobian.AxisNormalizedPicard.test_elliptic` requires the elliptic divisor-class and
  diagonal-degree comparisons to exhibit a nonzero axis-normalized actual Picard class.
Layer 5: `RelativeJacobian.canonicalAbelMap`; the identification of the inputs `c` and `d` of
  `UniversalShift`, `FaltingsZhang`, `ShiftedFaltingsZhang` and `shifted_power_factorization` with
  `i_ω` and `j`, and the instance of multiplication by `2g − 2` on the Jacobian.
Layer 6: `RelativeJacobian.picardLieCohomology`, `RelativeJacobian.curveJacobianHodgeBundles`,
  `RelativeJacobian.hodgeLineIsomorphism`.
Layer 7: `RelativeJacobian.levelJacobian`, `RelativeJacobian.levelFaltingsZhang`.
-/
