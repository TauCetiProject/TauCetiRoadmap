import Mathlib
import TauCeti.RingTheory.RootsOfUnity.PadicTateTwist

/-!
# PrismaticCohomologyPartIII: representative target signatures

The roadmap is README.md. This file records suggested forms statable against the pinned
Mathlib and Tau Ceti APIs, not an exhaustive checklist.

Derived fixed points use Mathlib's mapping cocone, the mapping cone shifted by −1.
The distinguished triangle, vanishing criterion and identity splitting state §6.1 on module
complexes. The base-change and lattice targets pin the conventions of Layers 6–7.
Frobenius fixed points in README.md are derived fibres. For discrete modules, an ordinary
kernel records their degree-zero part. The comparison and crystal targets retain their full sites,
period coefficients and cohomological shifts there. Laurent coefficients use derived
p-completion for vector bundles as well as perfect complexes; coherent derived quotient
towers retain their morphisms. Ordinary finite projectives describe these coefficients
when the bounded p-power torsion comparison applies.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartIII

open CategoryTheory CategoryTheory.Limits CategoryTheory.Pretriangulated

universe u v

section FixedPoints

variable {Λ : Type u} [CommRing Λ] [HasDerivedCategory.{v} (ModuleCat.{u} Λ)]

/-- The derived fixed points of §6.1, after restriction to the Frobenius-fixed
coefficient ring, are the fibre of `φ − 1` in the module derived category. -/
noncomputable def fixedPoints (K : CochainComplex (ModuleCat.{u} Λ) ℤ) (φ : K ⟶ K) :
    DerivedCategory (ModuleCat.{u} Λ) :=
  DerivedCategory.Q.obj (CochainComplex.mappingCocone (φ - 𝟙 K))

/-- The target `Prismatic.Etale.fixedPointsTriangle` of §6.1: derived fixed points,
the original complex and `φ − 1` form a distinguished triangle. -/
theorem fixedPointsTriangle (K : CochainComplex (ModuleCat.{u} Λ) ℤ) (φ : K ⟶ K) :
    DerivedCategory.Q.mapTriangle.obj (CochainComplex.mappingCocone.triangle (φ - 𝟙 K)) ∈
      distTriang (DerivedCategory (ModuleCat.{u} Λ)) := by
  sorry

/-- The target `Prismatic.Etale.fixedPoints_isZero_of_isIso` of §6.1: derived fixed
points vanish exactly when `φ − 1` is a quasi-isomorphism. -/
theorem fixedPoints_isZero_iff (K : CochainComplex (ModuleCat.{u} Λ) ℤ) (φ : K ⟶ K) :
    IsZero (fixedPoints K φ) ↔ QuasiIso (φ - 𝟙 K) := by
  sorry

/-- The identity case of §6.1 (`pr4_fixed_points_identity`) retains both the original
complex and its shift by −1. -/
theorem fixedPoints_identity (K : CochainComplex (ModuleCat.{u} Λ) ℤ) :
    Nonempty (fixedPoints K (𝟙 K) ≅
      DerivedCategory.Q.obj K ⊞ (DerivedCategory.Q.obj K)⟦(-1 : ℤ)⟧) := by
  sorry

end FixedPoints

/-- The polynomial coordinate survives in the Artin–Schreier cokernel over every prime field. -/
theorem pr4_fixed_points_not_fixed_vectors (p : ℕ) [Fact p.Prime] :
    ¬ ∃ f : Polynomial (ZMod p), f ^ p - f = Polynomial.X := by
  sorry

/-- The imported Tate module has p-th-power transitions between its roots-of-unity levels. -/
theorem pr4_tate_module_transition (p : ℕ) (R : Type*) [CommMonoid R]
    (x : TauCeti.PadicTateTwist p R) (n : ℕ) :
    ((TauCeti.PadicTateTwist.proj (n + 1) x).toMul : Rˣ) ^ p =
      ((TauCeti.PadicTateTwist.proj n x).toMul : Rˣ) := by
  simpa only [TauCeti.PadicTateTwist.coe_proj] using
    TauCeti.PadicTateTwist.coe_tateModuleProj_succ_pow x n

/-- For residue field F₂, Breuil–Kisin Frobenius misses the coordinate u in Z₂[[u]]. -/
theorem pr7_ok_bk_not_perfect :
    ¬ ∃ f : PowerSeries ℤ_[2], PowerSeries.expand 2 (by decide) f = PowerSeries.X := by
  sorry

/-- Residue compatibility for the fixed monic polynomial u − p forces the Frobenius
unit to be −1; replacing it by 1 contradicts nonvanishing of 2p, including at p = 2. -/
theorem pr7_trace_residue_unit (p : ℕ) [Fact p.Prime] (a : ℤ_[p]) :
    ((-(p : ℤ_[p]) = (p : ℤ_[p]) * a) ↔ a = -1) ∧
      (2 : ℤ_[p]) * (p : ℤ_[p]) ≠ 0 := by
  sorry

/-- Compatible Hom numerators across a regular pair have a unique integral common
value, giving extension across the puncture without a Noetherian hypothesis. -/
theorem pr7_punctured_hom_extension (A : Type*) [CommRing A]
    (P Q : Type*) [AddCommGroup P] [Module A P] [Module.Finite A P]
    [Module.Projective A P] [AddCommGroup Q] [Module A Q] [Module.Finite A Q]
    [Module.Projective A Q] (f g : A)
    (hreg : RingTheory.Sequence.IsWeaklyRegular A [f, g])
    (m n : ℕ) (x y : P →ₗ[A] Q)
    (hxy : g ^ n • x = f ^ m • y) :
    ∃! z : P →ₗ[A] Q, f ^ m • z = x ∧ g ^ n • z = y := by
  sorry

/-- The polynomial 1 + x over a prime field cannot be an invertible rank-one multiplier. -/
theorem pr7_etale_rank_one_nonunit (p : ℕ) [Fact p.Prime] :
    ¬ IsUnit (1 + Polynomial.X : Polynomial (ZMod p)) := by
  sorry

/-- Evaluation at 1 identifies scalar extension on rank-one endomorphisms with the
coefficient map, so injectivity holds exactly when that coefficient map is injective. -/
theorem pr7_completion_unit_endomorphisms (R S : Type*) [CommRing R] [CommRing S]
    (g : R →+* S) :
    Function.Injective (fun f : R →ₗ[R] R => g (f 1)) ↔ Function.Injective g := by
  constructor
  · intro h x y hxy
    apply LinearMap.toSpanSingleton_injective R R
    apply h
    simpa only [LinearMap.toSpanSingleton_apply_one] using hxy
  · intro h f f' hff
    exact LinearMap.ext_ring (h hff)

/-- The identity transition satisfies the base-change condition along the identity ring map. -/
theorem pr7_crystal_base_change_id (R : Type*) [CommRing R]
    (M : Type*) [AddCommGroup M] [Module R M] :
    IsBaseChange R (LinearMap.id : M →ₗ[R] M) := by
  sorry

/-- The diagonal transition extends the unit module to both factors of a product ring. -/
theorem pr7_crystal_unit_eval (R : Type*) [CommRing R] :
    IsBaseChange (R × R) (Algebra.linearMap R (R × R)) := by
  sorry

/-- A zero transition on the unit module over a nonzero ring fails the base-change condition. -/
theorem pr7_crystal_zero_transition (R : Type*) [CommRing R] [Nontrivial R] :
    ¬ IsBaseChange R (0 : R →ₗ[R] R) := by
  sorry

/-- The Hodge–Tate quotient of the crystalline prism is not projective over its base ring. -/
theorem pr7_crystal_hodge_tate_quotient_not_projective (p : ℕ) [Fact p.Prime] :
    ¬ Module.Projective ℤ_[p] (ℤ_[p] ⧸ Ideal.span {(p : ℤ_[p])}) := by
  sorry

/-- Rank-two Frobenius with multipliers 1 and p preserves the standard p-adic lattice;
replacing p by its inverse fails to preserve that lattice. -/
theorem pr7_fcrystal_eval_effective (p : ℕ) [Fact p.Prime] :
    (∀ x : ℤ_[p] × ℤ_[p], ∃ y : ℤ_[p] × ℤ_[p],
      ((x.1 : ℚ_[p]), (p : ℚ_[p]) * (x.2 : ℚ_[p])) =
        ((y.1 : ℚ_[p]), (y.2 : ℚ_[p]))) ∧
    ¬ (∀ x : ℤ_[p] × ℤ_[p], ∃ y : ℤ_[p] × ℤ_[p],
      ((x.1 : ℚ_[p]), (p : ℚ_[p])⁻¹ * (x.2 : ℚ_[p])) =
        ((y.1 : ℚ_[p]), (y.2 : ℚ_[p]))) := by
  sorry

/-- Unit Frobenius on the source and multipliers (1,2) on the target do not commute
with the diagonal transition over the crystalline 3-adic prism. -/
theorem pr7_fcrystal_frobenius_transition :
    (fun x : ℤ_[3] => (x, (2 : ℤ_[3]) * x)) ≠ (fun x : ℤ_[3] => (x, x)) := by
  sorry

/-- The dual multiplier p inverse fails to preserve the rank-one p-adic lattice. -/
theorem pr7_fcrystal_dual_not_effective (p : ℕ) [Fact p.Prime] :
    ¬ ∃ x : ℤ_[p], (x : ℚ_[p]) = (p : ℚ_[p])⁻¹ := by
  sorry

/-- A line over the prime field and the product of two such lines have distinct dimensions. -/
theorem pr4_syntomic_scheme_not_product (p : ℕ) [Fact p.Prime] :
    Module.finrank (ZMod p) (ZMod p) = 1 ∧
      Module.finrank (ZMod p) (ZMod p × ZMod p) = 2 := by
  sorry

end TauCetiRoadmap.PrismaticCohomologyPartIII
