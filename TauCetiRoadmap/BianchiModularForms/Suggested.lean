module
import Mathlib

/-!
# Bianchi modular forms: target signatures

The roadmap is README.md; this file is not the roadmap. It states its headline theorems
against the pinned APIs: the boundary contribution to degree-one cohomology (§1.2) and
Vogtmann's complete level-one vanishing classification (§9.3).

The other headlines are not statable at the pins: Eichler–Shimura–Harder requires the
Bianchi harmonic-form carrier and its adelization; the Fourier and Mellin comparisons need
that carrier and the complex-place Whittaker function; newform decomposition and multiplicity
one need the total Hecke module with its central action and degeneracy maps; the functional
equation, rational period theorem, base change, CM and elliptic-curve comparison need the
Bianchi newform carrier and its normalized coefficients. The cellular presentation theorem
needs the Bianchi compactification and its equivariant cell complex. Their constructions
and full statements are targets in README.md, not substitute predicates here.

Only the concrete group and cohomology definitions needed by the two stated headlines remain.
Definitions work for number fields; the theorems explicitly require an imaginary quadratic
field. The coefficient field is ℂ and K lives in Type, as required by Rep's universe.
-/

namespace TauCetiRoadmap.BianchiModularForms

open NumberField IsDedekindDomain Matrix
open scoped MatrixGroups nonZeroDivisors

noncomputable section

variable (K : Type) [Field K] [NumberField K]

/-! ## Layer 0: the groups and the cusps -/

/-- `README.md`, Layer 0, 0.2. The inclusion `GL₂(𝓞_K) → GL₂(K)`. -/
def toGLK : GL (Fin 2) (𝓞 K) →* GL (Fin 2) K :=
  Units.map (RingHom.mapMatrix (algebraMap (𝓞 K) K)).toMonoidHom

/-- `README.md`, Layer 0, 0.2. The **component group**
`Γ₀(𝔫, 𝔞) = {γ ∈ GL₂(K) : γ₁₁, γ₂₂ ∈ 𝓞_K, γ₁₂ ∈ 𝔞⁻¹, γ₂₁ ∈ 𝔞𝔫, det γ ∈ 𝓞_Kˣ}`, the
stabilizer of the lattice pair `𝓞_K ⊕ 𝔞 ⊃ 𝓞_K ⊕ 𝔞𝔫`. The
fractional ideal `𝔞⁻¹` is Mathlib's junk `0` when `𝔞 = ⊥`; every theorem assumes `𝔞 ≠ ⊥`. The
closure proofs are real: the off-diagonal products land in `𝔞⁻¹ · 𝔞𝔫 ≤ 𝓞_K`, and the inverse is
`det⁻¹ · adjugate` with `det⁻¹ ∈ 𝓞_Kˣ`. -/
def Gamma0Component (𝔫 𝔞 : Ideal (𝓞 K)) : Subgroup (GL (Fin 2) K) where
  carrier := {γ | (γ : Matrix (Fin 2) (Fin 2) K) 0 0 ∈ (1 : FractionalIdeal (𝓞 K)⁰ K) ∧
    (γ : Matrix (Fin 2) (Fin 2) K) 1 1 ∈ (1 : FractionalIdeal (𝓞 K)⁰ K) ∧
    (γ : Matrix (Fin 2) (Fin 2) K) 0 1 ∈ ((𝔞 : FractionalIdeal (𝓞 K)⁰ K)⁻¹) ∧
    (γ : Matrix (Fin 2) (Fin 2) K) 1 0 ∈ ((𝔞 * 𝔫 : Ideal (𝓞 K)) : FractionalIdeal (𝓞 K)⁰ K) ∧
    ∃ u : (𝓞 K)ˣ, algebraMap (𝓞 K) K u = Matrix.det (γ : Matrix (Fin 2) (Fin 2) K)}
  one_mem' := by
    have z {I : FractionalIdeal (𝓞 K)⁰ K} : (0 : K) ∈ I :=
      FractionalIdeal.mem_coe.mp (zero_mem (I : Submodule (𝓞 K) K))
    refine ⟨?_, ?_, ?_, ?_, 1, by simp⟩ <;> simp [z]
  mul_mem' {γ δ} hγ hδ := by
    obtain ⟨g00, g11, g01, g10, u, hu⟩ := hγ
    obtain ⟨d00, d11, d01, d10, v, hv⟩ := hδ
    have hAB : (𝔞 : FractionalIdeal (𝓞 K)⁰ K)⁻¹ *
        ((𝔞 * 𝔫 : Ideal (𝓞 K)) : FractionalIdeal (𝓞 K)⁰ K) ≤ 1 := by
      rw [FractionalIdeal.coeIdeal_mul, ← mul_assoc, mul_comm _ (𝔞 : FractionalIdeal (𝓞 K)⁰ K),
        FractionalIdeal.inv_eq]
      calc _ ≤ (1 : FractionalIdeal (𝓞 K)⁰ K) * 1 := by
            gcongr
            · exact FractionalIdeal.mul_one_div_le_one
            · exact FractionalIdeal.coeIdeal_le_one
        _ = 1 := mul_one 1
    have hBA := (mul_comm ((𝔞 * 𝔫 : Ideal (𝓞 K)) : FractionalIdeal (𝓞 K)⁰ K)
      (𝔞 : FractionalIdeal (𝓞 K)⁰ K)⁻¹).le.trans hAB
    have m {I J L : FractionalIdeal (𝓞 K)⁰ K} (h : I * J ≤ L) {x y : K} (hx : x ∈ I)
        (hy : y ∈ J) : x * y ∈ L := h (FractionalIdeal.mul_mem_mul hx hy)
    have a {I : FractionalIdeal (𝓞 K)⁰ K} {x y : K} (hx : x ∈ I) (hy : y ∈ I) : x + y ∈ I :=
      FractionalIdeal.mem_coe.mp (add_mem (FractionalIdeal.mem_coe.mpr hx)
        (FractionalIdeal.mem_coe.mpr hy))
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two,
      Matrix.det_mul] at *
    refine ⟨a (m (one_mul 1).le g00 d00) (m hAB g01 d10),
      a (m hBA g10 d01) (m (one_mul 1).le g11 d11),
      a (m (one_mul _).le g00 d01) (m (mul_one _).le g01 d11),
      a (m (mul_one _).le g10 d00) (m (one_mul _).le g11 d10), u * v, ?_⟩
    rw [Units.val_mul, map_mul, hu, hv]
  inv_mem' {γ} hγ := by
    obtain ⟨g00, g11, g01, g10, u, hu⟩ := hγ
    have hu' : (algebraMap (𝓞 K) K ↑u⁻¹) ∈ (1 : FractionalIdeal (𝓞 K)⁰ K) :=
      (FractionalIdeal.mem_one_iff (𝓞 K)⁰).mpr ⟨_, rfl⟩
    have m {J : FractionalIdeal (𝓞 K)⁰ K} {y : K} (hy : y ∈ J) :
        algebraMap (𝓞 K) K ↑u⁻¹ * y ∈ J := (one_mul J).le (FractionalIdeal.mul_mem_mul hu' hy)
    have n {J : FractionalIdeal (𝓞 K)⁰ K} {y : K} (hy : y ∈ J) : -y ∈ J :=
      FractionalIdeal.mem_coe.mp (neg_mem (FractionalIdeal.mem_coe.mpr hy))
    have hdet : (Matrix.det (γ : Matrix (Fin 2) (Fin 2) K))⁻¹ = algebraMap (𝓞 K) K ↑u⁻¹ := by
      rw [← hu, map_units_inv]
    refine ⟨?_, ?_, ?_, ?_, u⁻¹, ?_⟩
    rotate_right
    · rw [Matrix.coe_units_inv, Matrix.det_nonsing_inv, Ring.inverse_eq_inv', hdet]
    all_goals simp only [Matrix.coe_units_inv, Matrix.inv_def, Matrix.smul_apply,
      Matrix.adjugate_fin_two, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_one,
      Matrix.cons_val_zero, Matrix.empty_val', Matrix.cons_val_fin_one, smul_eq_mul,
      Ring.inverse_eq_inv', hdet]
    exacts [m g11, m g00, m (n g01), m (n g10)]

/-- `README.md`, Layer 0, 0.4. The **cusps** of `Γ ≤ GL₂(K)`: the orbits of `Γ` on
`ℙ¹(K) = Projectivization K (Fin 2 → K)`, Mathlib's action of `GL₂(K)` restricted to `Γ`. The
cusp stabilizer of `c` is `MulAction.stabilizer Γ c`. -/
abbrev cusps (Γ : Subgroup (GL (Fin 2) K)) : Type :=
  MulAction.orbitRel.Quotient Γ (Projectivization K (Fin 2 → K))

/-! ## Layer 1: cohomological Bianchi forms -/

/-- `README.md`, Layer 1, 1.1. `H¹(Γ, ℂ)` with trivial coefficients, Mathlib's
`groupCohomology.H1` of `Rep.trivial ℂ Γ ℂ`. -/
abbrev H1 (Γ : Type) [Group Γ] := groupCohomology.H1 (Rep.trivial ℂ Γ ℂ)

/-- `README.md`, Layer 1, 1.1. The comparison `H¹(Γ, ℂ) ≃ₗ[ℂ] Hom(Γ, ℂ)`, Mathlib's
`groupCohomology.H1IsoOfIsTrivial`. -/
def homEquiv (Γ : Type) [Group Γ] : H1 Γ ≃ₗ[ℂ] (Additive Γ →+ ℂ) :=
  (groupCohomology.H1IsoOfIsTrivial (Rep.trivial ℂ Γ ℂ)).toLinearEquiv

/-- `README.md`, Layer 1, 1.2. The homomorphisms `Γ → ℂ` vanishing on every cusp stabilizer:
the cuspidal condition on the `Hom` model. The closure proofs are real. -/
def cuspidalHom (Γ : Subgroup (GL (Fin 2) K)) : Submodule ℂ (Additive Γ →+ ℂ) where
  carrier := {φ | ∀ c : Projectivization K (Fin 2 → K), ∀ γ ∈ MulAction.stabilizer Γ c,
    φ (Additive.ofMul γ) = 0}
  zero_mem' := by intro c γ hγ; rfl
  add_mem' {φ ψ} hφ hψ c γ hγ := by
    simp only [AddMonoidHom.add_apply, hφ c γ hγ, hψ c γ hγ, add_zero]
  smul_mem' a {φ} hφ c γ hγ := by
    simp only [AddMonoidHom.smul_apply, hφ c γ hγ, smul_zero]

/-- `README.md`, Layer 1, 1.2. The **cuspidal cohomology**
`H¹_cusp(Γ, ℂ) = ⋂_c ker(H¹(Γ, ℂ) → H¹(Γ_c, ℂ))`, the LMFDB's `cuspidal` condition, transported
from `cuspidalHom` along `homEquiv`. -/
def cuspidalH1 (Γ : Subgroup (GL (Fin 2) K)) : Submodule ℂ (H1 Γ) :=
  (cuspidalHom K Γ).comap (homEquiv Γ).toLinearMap

/-- `README.md`, Layer 1, 1.2 and 1.4. The Eisenstein dimension: `dim H¹ - dim H¹_cusp` is the
number of cusps whose stabilizer acts on `H3` by translations alone, i.e. every element is a
scalar times a unipotent, `tr² = 4 det` (a rotation kills `H¹(Γ_c, ℂ)`). The condition is
invariant under conjugation, so it does not depend on the representative `c.out`. For the
`GL₂`-groups the cusps `∞` and `0` never count: `diag(-1, 1)` fixes both and rotates by `π`. -/
theorem finrank_H1_sub_cuspidal [IsTotallyComplex K] [Fact (Module.finrank ℚ K = 2)]
    (𝔫 𝔞 : Ideal (𝓞 K)) (h𝔫 : 𝔫 ≠ ⊥) (h𝔞 : 𝔞 ≠ ⊥) :
    Module.finrank ℂ (H1 (Gamma0Component K 𝔫 𝔞)) -
        Module.finrank ℂ (cuspidalH1 K (Gamma0Component K 𝔫 𝔞)) =
      Nat.card {c : cusps K (Gamma0Component K 𝔫 𝔞) //
        ∀ γ ∈ MulAction.stabilizer (Gamma0Component K 𝔫 𝔞) c.out,
          Matrix.trace ((γ : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) ^ 2 =
            4 * Matrix.det ((γ : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K)} := by
  sorry

/-! ## Layer 9: level one -/

/-- `README.md`, Layer 9, 9.3. The image of `SL₂(𝓞_K)` in `GL₂(K)`; its cuspidal cohomology
with `ℂ`-coefficients is that of `PSL₂(𝓞_K)`. -/
def sl2Image : Subgroup (GL (Fin 2) K) :=
  (⊤ : Subgroup SL(2, 𝓞 K)).map ((toGLK K).comp Matrix.SpecialLinearGroup.toGL)

/-- Vogtmann's complete classification (1985, p. 399): cuspidal degree-one
cohomology of SL₂(𝓞_K), equivalently PSL₂(𝓞_K), vanishes exactly at these fourteen
imaginary quadratic discriminants. -/
theorem cuspidalH1_sl2Image_eq_bot_iff
    [IsTotallyComplex K] [Fact (Module.finrank ℚ K = 2)] :
    cuspidalH1 K (sl2Image K) = ⊥ ↔
      discr K ∈ ({-4, -8, -3, -20, -24, -7, -11, -15, -19, -23, -31, -39, -47, -71} :
        Finset ℤ) := by
  sorry

end

end TauCetiRoadmap.BianchiModularForms
