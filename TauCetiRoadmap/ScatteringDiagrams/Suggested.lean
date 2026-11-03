module

import Mathlib
import TauCeti.Algebra.Lie.UniversalEnveloping.HopfAlgebra
import TauCeti.Algebra.HopfAlgebra.HopfIdeal.Augmentation

/-!
# Scattering diagrams, wall crossing and theta functions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states, with `sorry`, the roadmap's headline theorems that are statable against the
pinned Mathlib and Tau Ceti, with only the definitions they need, and one supporting theorem of
Layer 1:

* the universal BCH element (README §0.4): `comap_freeAugmentation_pow_ι` and
  `exists_bch_exp_mul_exp`;
* symmetrization PBW over commutative `ℚ`-algebras (§0.4): `exists_pbwSymmetrizationEquiv`;
* the focus-focus product formula on the model algebra (§6.3):
  `FocusFocus.modelTheta_mul`;
* Minkowski–Weyl for pointed cones in a finite-dimensional real vector space (§1.1):
  `PointedCone.fg_iff_dualFG`.

The other headlines are about carriers that this roadmap constructs and that neither pin has, so
the README states them: the BCH group (§0.4, *BCHGroup*, whose product is defined from
*bchElement*), the Kontsevich–Soibelman reconstruction (§2.3, *reconstructionEquiv*), existence
and uniqueness of outgoing completions (§§3.3–3.4, *exists_outgoingCompletion*,
*outgoingCompletion_unique*), theta functions and their transport (§5.5,
*probeWall_eq_brokenLineSum*, *theta_transport*), and the positivity theorems (§§7.2, 7.5, 7.7,
*ordinaryWall_positiveRepresentative*, *polynomialWall_positiveRepresentative*,
*theta_coefficients_nonnegative*).
-/

namespace TauCetiRoadmap.ScatteringDiagrams

/-! ## Layer 0: positive gradings, completions and actions -/

/-! ### Algebraic exponential groups (README §0.4) -/

section FreeBCH

attribute [local instance 100] LieRing.ofAssociativeRing

open UniversalEnvelopingAlgebra

/-- The free Lie algebra `𝔣` over `ℚ` on the generators `X = of 0` and `Y = of 1`
(`README §0.4`). -/
abbrev FreeLieTwo : Type := FreeLieAlgebra ℚ (Fin 2)

/-- `U⁺`, the augmentation ideal of `U(𝔣)` for the Hopf structure of
`TauCeti.UniversalEnvelopingAlgebra.instHopfAlgebra` (`README §0.4`). -/
noncomputable abbrev freeAugmentation : Ideal (UniversalEnvelopingAlgebra ℚ FreeLieTwo) :=
  (TauCeti.HopfIdeal.augmentation ℚ (UniversalEnvelopingAlgebra ℚ FreeLieTwo)).carrier

instance : freeAugmentation.IsTwoSided :=
  (TauCeti.HopfIdeal.augmentation ℚ (UniversalEnvelopingAlgebra ℚ FreeLieTwo)).isTwoSided'

/-- `ι_c` is injective: `ι⁻¹((U⁺)^{c+1})` is `lowerCentralSeries c` (`README §0.4`). -/
theorem comap_freeAugmentation_pow_ι (c : ℕ) :
    ((freeAugmentation ^ (c + 1)).restrictScalars ℚ).comap
        (ι ℚ : FreeLieTwo →ₗ⁅ℚ⁆ UniversalEnvelopingAlgebra ℚ FreeLieTwo).toLinearMap =
      (LieModule.lowerCentralSeries ℚ FreeLieTwo FreeLieTwo c).toSubmodule := by
  sorry

/-- The universal BCH element of class `c` exists: `exp(X) exp(Y) = exp(ι b)` in
`U(𝔣)/(U⁺)^{c+1}` (`README §0.4`, *bchElement*). By `comap_freeAugmentation_pow_ι`, `b` is
unique modulo `lowerCentralSeries c`. -/
theorem exists_bch_exp_mul_exp (c : ℕ) :
    ∃ b : FreeLieTwo,
      IsNilpotent.exp (Ideal.Quotient.mk (freeAugmentation ^ (c + 1)) (ι ℚ b)) =
        IsNilpotent.exp (Ideal.Quotient.mk (freeAugmentation ^ (c + 1))
            (ι ℚ (FreeLieAlgebra.of ℚ 0))) *
          IsNilpotent.exp (Ideal.Quotient.mk (freeAugmentation ^ (c + 1))
            (ι ℚ (FreeLieAlgebra.of ℚ 1))) := by
  sorry

end FreeBCH

section PBW

attribute [local instance 100] LieRing.ofAssociativeRing

/-- Symmetrization PBW over a commutative `ℚ`-algebra, for an arbitrary Lie algebra: a product
of `d` elements goes to `1/d!` times the sum of their products in all orders (`README §0.4`,
*pbwSymmetrizationEquiv*; PET Corollary 8.1). -/
theorem exists_pbwSymmetrizationEquiv (R g : Type*) [CommRing R] [Algebra ℚ R]
    [LieRing g] [LieAlgebra R g] :
    ∃ β : SymmetricAlgebra R g ≃ₗ[R] UniversalEnvelopingAlgebra R g,
      ∀ (d : ℕ) (x : Fin d → g),
        β (∏ j, SymmetricAlgebra.ι R g (x j)) =
          algebraMap ℚ R (d.factorial : ℚ)⁻¹ • ∑ σ : Equiv.Perm (Fin d),
            (List.ofFn fun j => UniversalEnvelopingAlgebra.ι R (x (σ j))).prod := by
  sorry

end PBW

/-! ## Layer 1: polyhedral geometry and paths -/

/-- Minkowski–Weyl (`README §1.1`): a pointed cone in a finite-dimensional real vector space,
lineality allowed, is finitely generated iff it is the set where finitely many linear forms are
nonnegative. -/
theorem PointedCone.fg_iff_dualFG {V : Type*} [AddCommGroup V] [Module ℝ V]
    [FiniteDimensional ℝ V] (C : PointedCone ℝ V) :
    C.FG ↔ C.DualFG (LinearMap.id : Module.Dual ℝ V →ₗ[ℝ] Module.Dual ℝ V) := by
  sorry

/-! ## Layer 6: integral-affine covariance, descent and a worked example -/

/-! ### The focus-focus model algebra (README §6.3) -/

namespace FocusFocus

noncomputable section

/-- Coordinates for `K[t,w,w⁻¹,x,y]`, with the inverse relation imposed in the quotient. -/
inductive Coordinate where
  | t | w | wInv | x | y
  deriving DecidableEq

open Coordinate

variable (K : Type*) [CommRing K]

/-- The polynomial ring `K[t,w,w⁻¹,x,y]` before the relations. -/
abbrev Ambient := MvPolynomial Coordinate K

/-- The model relation `XY=t(1+w)` with `t^(k+1)=0` and `w w⁻¹ = 1`. -/
def modelIdeal (k : ℕ) : Ideal (Ambient K) :=
  Ideal.span {MvPolynomial.X w * MvPolynomial.X wInv - 1,
    MvPolynomial.X t ^ (k + 1),
    MvPolynomial.X x * MvPolynomial.X y - MvPolynomial.X t * (1 + MvPolynomial.X w)}

/-- The model algebra `K[t,w^{±1},X,Y]/(t^{k+1}, XY − t(1+w))` at order `k`. -/
abbrev ModelAlgebra (k : ℕ) := Ambient K ⧸ modelIdeal K k

/-- A coordinate class in a quotient of the ambient ring. -/
def coordinate (I : Ideal (Ambient K)) (c : Coordinate) : Ambient K ⧸ I :=
  Ideal.Quotient.mk I (MvPolynomial.X c)

/-- `W` is a unit of the model algebra, with inverse `w⁻¹`. -/
noncomputable def modelW (k : ℕ) : (ModelAlgebra K k)ˣ where
  val := coordinate K (modelIdeal K k) w
  inv := coordinate K (modelIdeal K k) wInv
  val_inv := by
    rw [coordinate, coordinate, ← map_mul, ← map_one (Ideal.Quotient.mk _), Ideal.Quotient.eq]
    exact Ideal.subset_span (Set.mem_insert _ _)
  inv_val := by
    rw [coordinate, coordinate, ← map_mul, ← map_one (Ideal.Quotient.mk _), Ideal.Quotient.eq,
      mul_comm]
    exact Ideal.subset_span (Set.mem_insert _ _)

/-- The model form of the theta element `ϑ_{n,b}`: `X^{-n}W^b` for `n < 0`, `W^b` for `n = 0`
and `Y^nW^b` for `n > 0`, with `X = x` and `Y = y` (`README §6.3`). -/
noncomputable def modelTheta (k : ℕ) (n b : ℤ) : ModelAlgebra K k :=
  (if n < 0 then coordinate K (modelIdeal K k) x ^ n.natAbs
    else coordinate K (modelIdeal K k) y ^ n.natAbs) * ((modelW K k ^ b : (ModelAlgebra K k)ˣ) :
      ModelAlgebra K k)

/-- The model form of *focusFocusTheta_mul* (`README §6.3`): for
`r = (|n| + |m| - |n + m|)/2`, `ϑ_{n,b} ϑ_{m,c} = t^r Σ_{j ≤ r} binom(r,j) ϑ_{n+m,b+c+j}`. -/
theorem modelTheta_mul (k : ℕ) (n m b c : ℤ) :
    let r := (n.natAbs + m.natAbs - (n + m).natAbs) / 2
    modelTheta K k n b * modelTheta K k m c =
      coordinate K (modelIdeal K k) t ^ r *
        ∑ j ∈ Finset.range (r + 1), (r.choose j : ModelAlgebra K k) *
          modelTheta K k (n + m) (b + c + j) := by
  sorry

end

end FocusFocus

end TauCetiRoadmap.ScatteringDiagrams
