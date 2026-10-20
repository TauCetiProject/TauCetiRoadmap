import Mathlib

/-!
# PadicHodgeTheory: representative target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive
specification is `README.md`. These are suggested forms: definitions and theorem
signatures statable against the pinned Mathlib and Tau Ceti APIs.
The coordinate matrices describe Kummer extension actions and the Tate normal
form with covariant period Frobenius and arithmetic Weil Frobenius.
Their algebraic identities describe the coordinates of the period comparisons
in README §9; existence of those comparisons is a separate assertion.
README §§4.4 and 7.5–7.6 use the Wach modules and relative period objects
of PhiGammaModulesAndIwasawaCohomology on their supplied carriers. Their
integral-image and classical comparison adapters remain README targets;
the required arithmetic carriers are not present in the pinned libraries.
-/

noncomputable section

open Matrix

namespace TauCetiRoadmap.PadicHodgeTheory

/-! ## Layer 2: Local period sheaves -/

/-- A Teichmüller lift is a unit when its untilt is a unit, provided theta is
surjective and its source is complete for the theta kernel. -/
theorem deRhamTeichmuller_isUnit {B R X : Type*} [CommRing B] [CommRing R]
    (theta : B →+* R) (hTheta : Function.Surjective theta)
    [IsAdicComplete (RingHom.ker theta) B]
    (teichmuller : X → B) (untilt : X → R)
    (hTeichmuller : ∀ x, theta (teichmuller x) = untilt x)
    (x : X) (hx : IsUnit (untilt x)) : IsUnit (teichmuller x) := by
  sorry

/-! ## Layer 9: Kummer and Tate coordinates -/

/-- Coordinates of an extension action with character `a` and cocycle value `c`. -/
def kummerMatrix {R : Type*} [CommRing R] (a c : R) : Matrix (Fin 2) (Fin 2) R :=
  !![a, c; 0, 1]

/-- The cocycle equation is precisely this multiplication formula. -/
theorem kummerMatrix_mul {R : Type*} [CommRing R] (a c b d : R) :
    kummerMatrix a c * kummerMatrix b d = kummerMatrix (a * b) (c + a * d) := by
  sorry

/-- The determinant realizes the cyclotomic character when `a = χ_p(g)`. -/
theorem kummerMatrix_det {R : Type*} [CommRing R] (a c : R) :
    (kummerMatrix a c).det = a := by
  sorry

/-- Changing the cocycle by a coboundary is a unipotent change of basis. -/
theorem kummerMatrix_coboundary {R : Type*} [CommRing R] (a c b : R) :
    kummerMatrix 1 (-b) * kummerMatrix a c * kummerMatrix 1 b =
      kummerMatrix a (c + (a - 1) * b) := by
  sorry

/-- The zero cocycle gives the split diagonal action. -/
example {R : Type*} [CommRing R] (a : R) :
    kummerMatrix a 0 = !![a, 0; 0, 1] := by
  rfl

/-- The character line is stable and the quotient action is trivial. -/
example {R : Type*} [CommRing R] (a c x y : R) :
    kummerMatrix a c *ᵥ ![x, 0] = ![a * x, 0] ∧
      (kummerMatrix a c *ᵥ ![x, y]) 1 = y := by
  constructor
  · ext i
    fin_cases i <;> simp [kummerMatrix, Matrix.mulVec, dotProduct, Fin.sum_univ_two]
  · simp [kummerMatrix, Matrix.mulVec, dotProduct, Fin.sum_univ_two]

/-- The coordinate formula for the normalized Tate L-invariant. -/
noncomputable def tateLInvariant {R : Type*} [Field R] (v ell : R) : R := ell / v

/-- The Frobenius matrix in the covariant Tate normal form. -/
noncomputable def tatePhiMatrix {R : Type*} [Field R] (r : R) :
    Matrix (Fin 2) (Fin 2) R := !![r⁻¹, 0; 0, 1]

/-- The monodromy matrix with `N(y) = v x`. -/
def tateMonodromyMatrix {R : Type*} [CommRing R] (v : R) :
    Matrix (Fin 2) (Fin 2) R := !![0, v; 0, 0]

/-- The generator `y + ell x` of the filtration line. -/
def tateFiltrationVector {R : Type*} [CommRing R] (ell : R) : Fin 2 → R := ![ell, 1]

/-- README §9.2: Tate monodromy is square-zero over every commutative ring. -/
theorem tateMonodromyMatrix_square {R : Type*} [CommRing R] (v : R) :
    tateMonodromyMatrix v * tateMonodromyMatrix v = 0 := by
  sorry

/-- README §9.2: the valuation coordinate detects vanishing of Tate monodromy. -/
theorem tateMonodromyMatrix_eq_zero_iff {R : Type*} [CommRing R] (v : R) :
    tateMonodromyMatrix v = 0 ↔ v = 0 := by
  sorry

/-- README §9.2: covariant period Frobenius has reciprocal determinant. -/
theorem tatePhiMatrix_det {R : Type*} [Field R] (r : R) :
    (tatePhiMatrix r).det = r⁻¹ := by
  sorry

/-- README §9.2: when monodromy is nonzero, the filtration line complements its kernel. -/
theorem tateFiltrationVector_isCompl_ker {R : Type*} [Field R] (v ell : R)
    (hv : v ≠ 0) :
    IsCompl (Submodule.span R ({tateFiltrationVector ell} : Set (Fin 2 → R)))
      (LinearMap.ker (Matrix.toLin' (tateMonodromyMatrix v))) := by
  sorry

/-- A common nonzero scaling preserves the invariant. -/
theorem tateLInvariant_scale {R : Type*} [Field R] (v ell c : R)
    (hv : v ≠ 0) (hc : c ≠ 0) :
    tateLInvariant (c * v) (c * ell) = tateLInvariant v ell := by
  sorry

/-- A changed logarithm branch shifts the invariant by its value on `p`. -/
theorem tateLInvariant_branch {R : Type*} [Field R] (v ell b : R) (hv : v ≠ 0) :
    tateLInvariant v (ell + b * v) = tateLInvariant v ell + b := by
  sorry

/-- Isomorphisms of the unframed normal forms are classified by the ratio. -/
theorem tateNormalForm_iso {R : Type*} [Field R] (v ell v' ell' : R)
    (hv : v ≠ 0) (hv' : v' ≠ 0) :
    (∃ a b : R, a ≠ 0 ∧ b ≠ 0 ∧ v * a = b * v' ∧ ell * a = b * ell') ↔
      tateLInvariant v ell = tateLInvariant v' ell' := by
  sorry

/-- The orientation of the period Frobenius–monodromy relation. -/
theorem tateMonodromy_frobenius {R : Type*} [Field R] (r v : R) (hr : r ≠ 0) :
    tateMonodromyMatrix v * tatePhiMatrix r =
      r • (tatePhiMatrix r * tateMonodromyMatrix v) := by
  sorry

/-- In the semistable Tate normal form, arithmetic Frobenius is inverse to period Frobenius. -/
theorem tateMonodromy_arithmeticFrobenius {R : Type*} [Field R] (r v : R)
    (hr : r ≠ 0) :
    !![r, 0; 0, 1] * tateMonodromyMatrix v =
      r • (tateMonodromyMatrix v * !![r, 0; 0, 1]) := by
  sorry

end TauCetiRoadmap.PadicHodgeTheory
