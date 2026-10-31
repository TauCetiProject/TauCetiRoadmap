import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.Torsion.Structure
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.WeilPairing.Basic

/-!
# Modularity of elliptic curves over imaginary quadratic fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The stated headline results are CM discriminant descent and discriminant coupling
(§0.2). The coupling uses actual finite torsion, its Galois action and the Weil
pairing. Serre's large residual image theorem used in §5.1 is consumed from
AdelicImagesAndModularCurves §4.3 and is not a headline of this roadmap.

The other headline signatures are deferred because their objects are absent at
the pins. Layers 1–3 need the normalized relative cyclic covers, their marked
semistable models and relative Jacobians to state the cover, degeneration and
integral regular-module theorems, including `compact_type_jacobian` and
`integral_regular_module`. Layers 4, 6 and 7 additionally need étale H¹ local
systems, the shared compatible-system carrier and semistable comparison data
to state `prime_switch_congruences`, `character_local_types` and
`simultaneous_specialization`. The automorphic representations and their
attached Galois and local Langlands parameters needed for the lifting and seed
theorems in Layers 0 and 5 and for `three_lift_automorphy` and descent in Layer 8
are absent as well. In particular,
`imaginary_quadratic_modularity`, its full local comparison, complex parameter
and L-function identity cannot be stated here. The elementary matrix formula
for a complex parameter does not supply those objects.
-/

namespace TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic

open Polynomial
open scoped WeierstrassCurve Classical

/-- The splitting field of X^n − a/conjugate(a) is a soluble CM extension
and makes a an n-th power times a nonzero totally real element
(README §0.2, `cm_discriminant_descent`; AKT Corollary 9.4, p.74, stated there
for n ≥ 2; at n = 1 the splitting field is K itself and z = a·conjugate(a)). -/
theorem cm_discriminant_descent {K L : Type*} [Field K] [NumberField K]
    [NumberField.IsCMField K] [Field L] [NumberField L] [Algebra K L]
    (n : ℕ) (hn : 1 ≤ n) (a : Kˣ)
    [Polynomial.IsSplittingField K L
      (X ^ n - C ((a : K) / NumberField.IsCMField.complexConj K (a : K)))] :
    IsGalois K L ∧ Group.IsSolvable (L ≃ₐ[K] L) ∧ NumberField.IsCMField L ∧
      ∃ z : Lˣ, (z : L) ∈ NumberField.maximalRealSubfield L ∧
        ∃ b : Lˣ, algebraMap K L (a : K) / (z : L) = (b : L) ^ n := by
  sorry

variable {K : Type*} [Field K]

local notation "Kbar" => AlgebraicClosure K

/-- Equivariant isomorphisms preserving the actual Weil pairing. -/
def SymplecticTorsionEquiv (A E : WeierstrassCurve K) [A.IsElliptic] [E.IsElliptic]
    (m : ℕ) [NeZero m] (hm : (m : Kbar) ≠ 0) :=
  {e : AddSubgroup.torsionBy (A⁄Kbar).toAffine.Point (m : ℤ) ≃+
      AddSubgroup.torsionBy (E⁄Kbar).toAffine.Point (m : ℤ) //
    (∀ (σ : Kbar ≃ₐ[K] Kbar) P,
      e (Multiplicative.toAdd (A.torsionGaloisAction (m : ℤ) σ) P) =
        Multiplicative.toAdd (E.torsionGaloisAction (m : ℤ) σ) (e P)) ∧
    ∀ P Q, TauCeti.Isogeny.weilPairing (A⁄Kbar) m hm P Q =
      TauCeti.Isogeny.weilPairing (E⁄Kbar) m hm (e P) (e Q)}

/-- Discriminant coupling over any number field, with irreducible `E[3]`:
one elliptic curve realizes both prescribed symplectic torsion modules
(README §0.2; AKT Lemma 9.6, pp.74–75). -/
theorem discriminant_coupling [NumberField K] (A E : WeierstrassCurve K) [A.IsElliptic] [E.IsElliptic]
    (hΔ : ∃ u : Kˣ, A.Δ / E.Δ = (u : K) ^ 6)
    (h_irred : ∀ H : AddSubgroup (AddSubgroup.torsionBy (E⁄Kbar).toAffine.Point (3 : ℤ)),
      (∀ (σ : Kbar ≃ₐ[K] Kbar) P, P ∈ H →
        Multiplicative.toAdd (E.torsionGaloisAction (3 : ℤ) σ) P ∈ H) →
      H = ⊥ ∨ H = ⊤) :
    ∃ (C : WeierstrassCurve K) (_ : C.IsElliptic),
      (∃ u : Kˣ, C.Δ / A.Δ = (u : K) ^ 6) ∧
      Nonempty (SymplecticTorsionEquiv C A 2 (by norm_num)) ∧
      Nonempty (SymplecticTorsionEquiv C E 3 (by norm_num)) := by
  sorry

end TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic
