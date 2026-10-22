import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Hom.Add
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.Torsion.Structure
import TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.MulByInt.WeilPairing.Basic

/-!
# Modularity of elliptic curves over imaginary quadratic fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for particular milestones;
discharging them finishes neither a layer nor the roadmap.

The stated headline results are CM discriminant descent and discriminant coupling
(§0.2), and Serre's large residual image theorem for non-CM elliptic curves over
arbitrary number fields (§5.1). The coupling uses actual finite torsion, its
Galois action and the Weil pairing. Geometric non-CM means that every endomorphism
over the algebraic closure is an integer multiple of the identity.

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
(README §0.2, `cm_discriminant_descent`; AKT Corollary 9.4, p.74). -/
theorem cm_discriminant_descent {K L : Type*} [Field K] [NumberField K]
    [NumberField.IsCMField K] [Field L] [NumberField L] [Algebra K L]
    (n : ℕ) (hn : 2 ≤ n) (a : Kˣ)
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

/-- Serre's large residual image theorem over any number field. In every torsion
basis the image contains `SL₂(𝔽_p)` for all sufficiently large primes; the bound
may depend on the curve and the field (README §5.1; Serre §4.2, Théorème 2, p.294). -/
theorem nonCM_elliptic_large_residual_primes [NumberField K] (E : WeierstrassCurve K) [E.IsElliptic]
    (h_nonCM : ∀ φ : TauCeti.Isogeny.Hom (E⁄Kbar).toAffine (E⁄Kbar).toAffine,
      ∃ n : ℤ, φ = n • TauCeti.Isogeny.Hom.id (E⁄Kbar).toAffine) :
    ∃ N : ℕ, ∀ p : ℕ, p.Prime → N < p →
      ∀ b : Module.Basis (Fin 2) (ZMod p)
        (AddSubgroup.torsionBy (E⁄Kbar).toAffine.Point (p : ℤ)),
      ∀ g : Matrix.SpecialLinearGroup (Fin 2) (ZMod p),
      ∃ σ : Kbar ≃ₐ[K] Kbar, ∀ P,
        b.equivFun (Multiplicative.toAdd (E.torsionGaloisAction (p : ℤ) σ) P) =
          Matrix.mulVec (g : Matrix (Fin 2) (Fin 2) (ZMod p)) (b.equivFun P) := by
  sorry

end TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic
