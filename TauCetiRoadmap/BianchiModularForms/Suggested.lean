import Mathlib

/-!
# Bianchi modular forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
level groups `Γ₀(𝔫)`, `Γ(𝔫)`, `Γ₀ˢᴸ(𝔫)`, the component groups `Γ₀(𝔫, 𝔞)` and their cusps
(Layer 0), the cohomology `H¹(Γ, ℂ)`, its cuspidal part and the total space over the ideal
classes (Layer 1), the ideal class of a prime (4.1), the exact-divisor hypothesis of the
Atkin–Lehner operators (5.5), and level-one vanishing (9.3). The other targets, with their
definitions and Checks, are specified in `README.md` only: the central operators and the
trivial-central-character subspace (1.5), the Hecke operators, eigenforms and Hecke fields
(Layer 4), old and new subspaces, newforms and the Atkin–Lehner operators and eigenvalues
(Layer 5), the coefficients, `L`-function, completed `L`-function, sign, analytic rank and
`L`-ratio (Layer 6), twists, base change and CM (Layer 7), and the elliptic-curve predicates
(Layer 8). Each needs a construction that is itself a milestone of this roadmap.

`sorry` is permitted in the proofs of this human-owned repository: these are targets, not
implementations. The exceptions are the closure proofs of `Gamma0` and `Gamma0Component` and
the bridge checks `homEquiv`, `cuspidalHom`, `classRep_ne_bot`, `mk0_classRep` and
`self_exactDivisor`, whose proofs and bodies are real applications of Mathlib declarations.

The carrier is the **cuspidal cohomology over the ideal classes**,
`totalCuspidal K 𝔫 = Π_{c ∈ Cl(K)} H¹_cusp(Γ₀(𝔫, 𝔞_c), ℂ)`, built from Mathlib's
`groupCohomology.H1` of the trivial representation of the component group
`Gamma0Component K 𝔫 𝔞 ≤ GL (Fin 2) K` (the stabilizer of the lattice pair
`𝓞_K ⊕ 𝔞 ⊃ 𝓞_K ⊕ 𝔞𝔫`), with cuspidality the vanishing on every cusp stabilizer for the action
on Mathlib's `Projectivization K (Fin 2 → K)`. The LMFDB's forms are its
trivial-central-character part (`README.md`, 1.5), the whole space when `h_K = 1`. The analytic
carrier of `README.md` Layer 2 (ℂ³-valued harmonic functions on `H3`) and the
Eichler–Shimura–Harder comparison of Layer 3 are stated against the Kleinian-groups roadmap's
`H3` and are not declared here.

Conventions visible in the signatures (`README.md`, *Pinned conventions*). `K : Type` is an
imaginary quadratic field, `[IsTotallyComplex K] [Fact (Module.finrank ℚ K = 2)]` as the
Kleinian-groups roadmap states it; `K` lives in `Type` because `Rep ℂ Γ` puts the group and
`ℂ : Type` in one universe. The level is the `GL₂`-level `Gamma0 K 𝔫 = {γ : γ₂₁ ∈ 𝔫}`; the
`SL₂`-level of the `sl2_dims` tables is `Gamma0SL`. Representatives of the ideal classes are the
integral ideals `classRep K c`, chosen through `ClassGroup.mk0_surjective`, and every statement
about the total space comes with its independence of the representatives.
-/

namespace TauCetiRoadmap.BianchiModularForms

open NumberField IsDedekindDomain Matrix
open scoped MatrixGroups nonZeroDivisors

noncomputable section

variable (K : Type) [Field K] [NumberField K] [IsTotallyComplex K]
  [Fact (Module.finrank ℚ K = 2)]

/-! ## Layer 0: the groups and the cusps -/

/-- `README.md`, Layer 0, 0.1. The `GL₂`-level `Γ₀(𝔫) = {γ ∈ GL₂(𝓞_K) : γ₂₁ ∈ 𝔫}`. The
closure proofs are real: the lower-left entry of a product is `γ₂₁ δ₁₁ + γ₂₂ δ₂₁`, and that of an
inverse is `det⁻¹ · (-γ₂₁)` by `Matrix.adjugate_fin_two`. -/
def Gamma0 (𝔫 : Ideal (𝓞 K)) : Subgroup (GL (Fin 2) (𝓞 K)) where
  carrier := {γ | (γ : Matrix (Fin 2) (Fin 2) (𝓞 K)) 1 0 ∈ 𝔫}
  one_mem' := by simp
  mul_mem' {γ δ} hγ hδ := by
    simp only [Set.mem_ofPred_eq, Units.val_mul, Matrix.mul_apply, Fin.sum_univ_two] at *
    exact 𝔫.add_mem (𝔫.mul_mem_right _ hγ) (𝔫.mul_mem_left _ hδ)
  inv_mem' {γ} hγ := by
    simp only [Set.mem_ofPred_eq] at *
    rw [Matrix.coe_units_inv, Matrix.inv_def, Matrix.smul_apply, Matrix.adjugate_fin_two]
    simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_one, Matrix.cons_val_zero,
      Matrix.empty_val', Matrix.cons_val_fin_one, smul_eq_mul]
    exact 𝔫.mul_mem_left _ (𝔫.neg_mem_iff.mpr hγ)

/-- `README.md`, Layer 0, 0.1. Reduction of `GL₂(𝓞_K)` modulo `𝔫`. -/
def reduction (𝔫 : Ideal (𝓞 K)) : GL (Fin 2) (𝓞 K) →* GL (Fin 2) (𝓞 K ⧸ 𝔫) :=
  Units.map (RingHom.mapMatrix (Ideal.Quotient.mk 𝔫)).toMonoidHom

/-- `README.md`, Layer 0, 0.1. The principal congruence subgroup `Γ(𝔫)`, the kernel of
reduction modulo `𝔫`. -/
def Gamma (𝔫 : Ideal (𝓞 K)) : Subgroup (GL (Fin 2) (𝓞 K)) := (reduction K 𝔫).ker

/-- `README.md`, Layer 0, 0.1. The `SL₂`-level `Γ₀ˢᴸ(𝔫) = Γ₀(𝔫) ∩ SL₂(𝓞_K)`, the group of the
LMFDB's `sl2_dims` tables. -/
def Gamma0SL (𝔫 : Ideal (𝓞 K)) : Subgroup SL(2, 𝓞 K) :=
  (Gamma0 K 𝔫).comap Matrix.SpecialLinearGroup.toGL

/-- `README.md`, Layer 0, 0.1. `Γ(𝔫) ≤ Γ₀(𝔫)`. -/
theorem Gamma_le_Gamma0 (𝔫 : Ideal (𝓞 K)) : Gamma K 𝔫 ≤ Gamma0 K 𝔫 := by
  sorry

/-- `README.md`, Layer 0, 0.1. The index of `Γ₀(𝔭)` at a prime is `N𝔭 + 1`, the cardinality of
`ℙ¹(𝓞_K/𝔭)`. -/
theorem Gamma0_index_prime (𝔭 : HeightOneSpectrum (𝓞 K)) :
    (Gamma0 K 𝔭.asIdeal).index = Ideal.absNorm 𝔭.asIdeal + 1 := by
  sorry

/-- `README.md`, Layer 0, 0.1. The index formula
`[GL₂(𝓞_K) : Γ₀(𝔫)] = N𝔫 · ∏_{𝔭 ∣ 𝔫} (1 + 1/N𝔭)`, by surjectivity of `SL₂(𝓞_K) → SL₂(𝓞_K/𝔫)`
and the transitive action of `SL₂(𝓞_K/𝔫)` on `ℙ¹(𝓞_K/𝔫)` (reduction on `GL₂` is not onto when
`𝓞_Kˣ → (𝓞_K/𝔫)ˣ` is not). -/
theorem Gamma0_index (𝔫 : Ideal (𝓞 K)) (h𝔫 : 𝔫 ≠ ⊥) :
    ((Gamma0 K 𝔫).index : ℚ) = Ideal.absNorm 𝔫 *
      ∏ 𝔭 ∈ (UniqueFactorizationMonoid.normalizedFactors 𝔫).toFinset,
        (1 + 1 / (Ideal.absNorm 𝔭 : ℚ)) := by
  sorry

/-- `README.md`, Layer 0, 0.1. The **level bad primes**, the rational primes dividing the level
norm; an LMFDB search filter. -/
def levelBadPrimes (𝔫 : Ideal (𝓞 K)) : Finset ℕ := (Ideal.absNorm 𝔫).primeFactors

/-- `README.md`, Layer 0, 0.1. The **field bad primes**, the rational primes dividing the
discriminant of `K`; an LMFDB search filter. -/
def fieldBadPrimes : Finset ℕ := (discr K).natAbs.primeFactors

/-- `README.md`, Layer 0, 0.2. The inclusion `GL₂(𝓞_K) → GL₂(K)`. -/
def toGLK : GL (Fin 2) (𝓞 K) →* GL (Fin 2) K :=
  Units.map (RingHom.mapMatrix (algebraMap (𝓞 K) K)).toMonoidHom

/-- `README.md`, Layer 0, 0.2. The **component group**
`Γ₀(𝔫, 𝔞) = {γ ∈ GL₂(K) : γ₁₁, γ₂₂ ∈ 𝓞_K, γ₁₂ ∈ 𝔞⁻¹, γ₂₁ ∈ 𝔞𝔫, det γ ∈ 𝓞_Kˣ}`, the
stabilizer of the lattice pair `𝓞_K ⊕ 𝔞 ⊃ 𝓞_K ⊕ 𝔞𝔫` (`mem_Gamma0Component_iff`). The
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

/-- `README.md`, Layer 0, 0.2. The `𝓞_K`-lattice `𝔞 ⊕ 𝔟 ⊂ K²`. -/
def latticeOf (𝔞 𝔟 : Ideal (𝓞 K)) : Submodule (𝓞 K) (Fin 2 → K) :=
  Submodule.pi Set.univ
    ![Submodule.map (Algebra.linearMap (𝓞 K) K) 𝔞, Submodule.map (Algebra.linearMap (𝓞 K) K) 𝔟]

/-- `README.md`, Layer 0, 0.2. The image of an `𝓞_K`-lattice in `K²` under `γ ∈ GL₂(K)`. -/
def mapLattice (γ : GL (Fin 2) K) (L : Submodule (𝓞 K) (Fin 2 → K)) :
    Submodule (𝓞 K) (Fin 2 → K) :=
  L.map (((Matrix.GeneralLinearGroup.toLin γ : LinearMap.GeneralLinearGroup K (Fin 2 → K)) :
    (Fin 2 → K) →ₗ[K] (Fin 2 → K)).restrictScalars (𝓞 K))

/-- `README.md`, Layer 0, 0.2. `Γ₀(𝔫, 𝔞)` is the stabilizer in `GL₂(K)` of the level-`𝔫` pair
`(𝓞_K ⊕ 𝔞, 𝓞_K ⊕ 𝔞𝔫)`. -/
theorem mem_Gamma0Component_iff (𝔫 𝔞 : Ideal (𝓞 K)) (h𝔞 : 𝔞 ≠ ⊥) (γ : GL (Fin 2) K) :
    γ ∈ Gamma0Component K 𝔫 𝔞 ↔
      mapLattice K γ (latticeOf K 1 𝔞) = latticeOf K 1 𝔞 ∧
        mapLattice K γ (latticeOf K 1 (𝔞 * 𝔫)) = latticeOf K 1 (𝔞 * 𝔫) := by
  sorry

/-- `README.md`, Layer 0, 0.2. `Γ₀(𝔫, 𝓞_K)` is the image of `Γ₀(𝔫)` in `GL₂(K)`. -/
theorem Gamma0_map_toGLK (𝔫 : Ideal (𝓞 K)) :
    (Gamma0 K 𝔫).map (toGLK K) = Gamma0Component K 𝔫 1 := by
  sorry

/-- `README.md`, Layer 0, 0.2. All component groups are commensurable. -/
theorem commensurable_Gamma0Component (𝔫 𝔞 𝔫' 𝔞' : Ideal (𝓞 K)) (h𝔫 : 𝔫 ≠ ⊥) (h𝔞 : 𝔞 ≠ ⊥)
    (h𝔫' : 𝔫' ≠ ⊥) (h𝔞' : 𝔞' ≠ ⊥) :
    Subgroup.Commensurable (Gamma0Component K 𝔫 𝔞) (Gamma0Component K 𝔫' 𝔞') := by
  sorry

/-- `README.md`, Layer 0, 0.4. The **cusps** of `Γ ≤ GL₂(K)`: the orbits of `Γ` on
`ℙ¹(K) = Projectivization K (Fin 2 → K)`, Mathlib's action of `GL₂(K)` restricted to `Γ`. The
cusp stabilizer of `c` is `MulAction.stabilizer Γ c`. -/
abbrev cusps (Γ : Subgroup (GL (Fin 2) K)) : Type :=
  MulAction.orbitRel.Quotient Γ (Projectivization K (Fin 2 → K))

/-- `README.md`, Layer 0, 0.4. The cusp `∞ = [1 : 0]`. -/
def infty : Projectivization K (Fin 2 → K) := Projectivization.mk K ![1, 0] (by simp)

/-- `README.md`, Layer 0, 0.4. The stabilizer of `∞` in `Γ₀(𝔫, 𝔞)` is its upper-triangular
part, `{(a, b; 0, d) : a, d ∈ 𝓞_Kˣ, b ∈ 𝔞⁻¹}`; the units and the ideal are the membership
conditions of `Gamma0Component`, so only `γ₂₁ = 0` is new. -/
theorem mem_stabilizer_infty_iff (𝔫 𝔞 : Ideal (𝓞 K)) (γ : Gamma0Component K 𝔫 𝔞) :
    γ ∈ MulAction.stabilizer (Gamma0Component K 𝔫 𝔞) (infty K) ↔
      ((γ : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) 1 0 = 0 := by
  sorry

/-- `README.md`, Layer 0, 0.4. `Γ₀(𝔫, 𝔞)` has finitely many cusps. -/
theorem finite_cusps (𝔫 𝔞 : Ideal (𝓞 K)) (h𝔫 : 𝔫 ≠ ⊥) (h𝔞 : 𝔞 ≠ ⊥) :
    Finite (cusps K (Gamma0Component K 𝔫 𝔞)) := by
  sorry

/-- `README.md`, Layer 0, 0.5. For class number one, `Γ₀(𝔭)` has two cusps at every prime
`𝔭`; the general count is the sum over `𝔡 ∣ 𝔫` of `#((𝓞_K/(𝔡 + 𝔫𝔡⁻¹))ˣ / im 𝓞_Kˣ)`. -/
theorem card_cusps_prime (hK : classNumber K = 1) (𝔭 : HeightOneSpectrum (𝓞 K)) :
    Nat.card (cusps K (Gamma0Component K 𝔭.asIdeal 1)) = 2 := by
  sorry

/-- `README.md`, Layer 0, 0.6. `Γ₀(𝔫, 𝔞)` is finitely generated (finite-sidedness of a
fundamental polyhedron of a finite-index subgroup, then Schreier's lemma
`Subgroup.fg_of_index_ne_zero`). -/
theorem fg_Gamma0Component (𝔫 𝔞 : Ideal (𝓞 K)) (h𝔫 : 𝔫 ≠ ⊥) (h𝔞 : 𝔞 ≠ ⊥) :
    Group.FG (Gamma0Component K 𝔫 𝔞) := by
  sorry

/-! ## Layer 1: cohomological Bianchi forms -/

/-- `README.md`, Layer 1, 1.1. `H¹(Γ, ℂ)` with trivial coefficients, Mathlib's
`groupCohomology.H1` of `Rep.trivial ℂ Γ ℂ`. -/
abbrev H1 (Γ : Type) [Group Γ] := groupCohomology.H1 (Rep.trivial ℂ Γ ℂ)

/-- `README.md`, Layer 1, 1.1. The comparison `H¹(Γ, ℂ) ≃ₗ[ℂ] Hom(Γ, ℂ)`, Mathlib's
`groupCohomology.H1IsoOfIsTrivial`; a bridge check with a real body. -/
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

/-- `README.md`, Layer 1, 1.2. It suffices to kill the translation subgroups: for a subgroup of
some `Γ₀(𝔫, 𝔞)`, a class is cuspidal exactly when it vanishes on the unipotent elements of every
cusp stabilizer. Every other element of `Γ_c` is a scalar unit times a unipotent or has finite
order (its eigenvalues are units of `𝓞_K`), and a homomorphism to `ℂ` kills both kinds. A
unipotent `γ ≠ 1` fixes only its own cusp, so no coordinate change to `c` is needed. -/
theorem mem_cuspidalH1_iff (𝔫 𝔞 : Ideal (𝓞 K)) (Γ : Subgroup (GL (Fin 2) K))
    (hΓ : Γ ≤ Gamma0Component K 𝔫 𝔞) (x : H1 Γ) :
    x ∈ cuspidalH1 K Γ ↔ ∀ c : Projectivization K (Fin 2 → K), ∀ γ ∈ MulAction.stabilizer Γ c,
      (((γ : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) - 1) ^ 2 = 0 →
      homEquiv Γ x (Additive.ofMul γ) = 0 := by
  sorry

/-- `README.md`, Layer 1, 1.4. Finite dimensionality, from finite generation (0.6). -/
theorem finiteDimensional_H1 (𝔫 𝔞 : Ideal (𝓞 K)) (h𝔫 : 𝔫 ≠ ⊥) (h𝔞 : 𝔞 ≠ ⊥) :
    FiniteDimensional ℂ (H1 (Gamma0Component K 𝔫 𝔞)) := by
  sorry

/-- `README.md`, Layer 1, 1.2 and 1.4. The Eisenstein dimension: `dim H¹ - dim H¹_cusp` is the
number of cusps whose stabilizer acts on `H3` by translations alone, i.e. every element is a
scalar times a unipotent, `tr² = 4 det` (a rotation kills `H¹(Γ_c, ℂ)`). The condition is
invariant under conjugation, so it does not depend on the representative `c.out`. For the
`GL₂`-groups the cusps `∞` and `0` never count: `diag(-1, 1)` fixes both and rotates by `π`. -/
theorem finrank_H1_sub_cuspidal (𝔫 𝔞 : Ideal (𝓞 K)) (h𝔫 : 𝔫 ≠ ⊥) (h𝔞 : 𝔞 ≠ ⊥) :
    Module.finrank ℂ (H1 (Gamma0Component K 𝔫 𝔞)) -
        Module.finrank ℂ (cuspidalH1 K (Gamma0Component K 𝔫 𝔞)) =
      Nat.card {c : cusps K (Gamma0Component K 𝔫 𝔞) //
        ∀ γ ∈ MulAction.stabilizer (Gamma0Component K 𝔫 𝔞) c.out,
          Matrix.trace ((γ : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K) ^ 2 =
            4 * Matrix.det ((γ : GL (Fin 2) K) : Matrix (Fin 2) (Fin 2) K)} := by
  sorry

/-- `README.md`, Layer 1, 1.5. An integral ideal in each ideal class, through
`ClassGroup.mk0_surjective`; a real body. -/
def classRep (c : ClassGroup (𝓞 K)) : Ideal (𝓞 K) :=
  (Function.surjInv (ClassGroup.mk0_surjective (R := 𝓞 K)) c).1

omit [IsTotallyComplex K] [Fact (Module.finrank ℚ K = 2)] in
/-- `README.md`, Layer 1, 1.5. The representatives are nonzero. -/
theorem classRep_ne_bot (c : ClassGroup (𝓞 K)) : classRep K c ≠ ⊥ := by
  have := (Function.surjInv (ClassGroup.mk0_surjective (R := 𝓞 K)) c).2
  rw [← Ideal.zero_eq_bot]
  exact nonZeroDivisors.ne_zero this

omit [IsTotallyComplex K] [Fact (Module.finrank ℚ K = 2)] in
/-- `README.md`, Layer 1, 1.5. The representative lies in its class. -/
theorem mk0_classRep (c : ClassGroup (𝓞 K)) :
    ClassGroup.mk0 ⟨classRep K c,
      (Function.surjInv (ClassGroup.mk0_surjective (R := 𝓞 K)) c).2⟩ = c :=
  Function.surjInv_eq _ _

/-- `README.md`, Layer 1, 1.5. The component group of the class `c`, `Γ₀(𝔫)_c = Γ₀(𝔫, 𝔞_c)`. -/
abbrev Gamma0Class (𝔫 : Ideal (𝓞 K)) (c : ClassGroup (𝓞 K)) : Subgroup (GL (Fin 2) K) :=
  Gamma0Component K 𝔫 (classRep K c)

/-- `README.md`, Layer 1, 1.5. **The carrier**: the cuspidal cohomology over all ideal classes,
`H¹_cusp(𝔫) = ⊕_{c ∈ Cl(K)} H¹_cusp(Γ₀(𝔫)_c, ℂ)`, a finite product since `ClassGroup (𝓞 K)`
is finite. For `h_K = 1` it is `H¹_cusp(Γ₀(𝔫), ℂ)`. -/
abbrev totalCuspidal (𝔫 : Ideal (𝓞 K)) : Type :=
  (c : ClassGroup (𝓞 K)) → cuspidalH1 K (Gamma0Class K 𝔫 c)

/-- `README.md`, Layer 1, 1.5. Independence of the representatives: two integral ideals in the
same class give isomorphic cuspidal cohomology, by conjugation with `diag(1, x)`. -/
theorem nonempty_cuspidalH1_equiv (𝔫 𝔞 𝔞' : Ideal (𝓞 K)) (h𝔞 : 𝔞 ∈ (Ideal (𝓞 K))⁰)
    (h𝔞' : 𝔞' ∈ (Ideal (𝓞 K))⁰) (h : ClassGroup.mk0 ⟨𝔞, h𝔞⟩ = ClassGroup.mk0 ⟨𝔞', h𝔞'⟩) :
    Nonempty (cuspidalH1 K (Gamma0Component K 𝔫 𝔞) ≃ₗ[ℂ]
      cuspidalH1 K (Gamma0Component K 𝔫 𝔞')) := by
  sorry

/-- `README.md`, Layer 1, 1.5. The total space is finite-dimensional. -/
theorem finiteDimensional_totalCuspidal (𝔫 : Ideal (𝓞 K)) (h𝔫 : 𝔫 ≠ ⊥) :
    FiniteDimensional ℂ (totalCuspidal K 𝔫) := by
  sorry

/-! ## Layer 4: Hecke operators -/

/-- `README.md`, Layer 4, 4.1. The ideal class of a prime. -/
def primeClass (𝔭 : HeightOneSpectrum (𝓞 K)) : ClassGroup (𝓞 K) :=
  ClassGroup.mk0 ⟨𝔭.asIdeal, mem_nonZeroDivisors_of_ne_zero (by
    rw [Ideal.zero_eq_bot]; exact 𝔭.ne_bot)⟩

/-! ## Layer 5: Atkin–Lehner operators -/

omit [NumberField K] [IsTotallyComplex K] [Fact (Module.finrank ℚ K = 2)] in
/-- `README.md`, Layer 5, 5.5. The exact-divisor hypothesis `𝔮 ‖ 𝔫` an Atkin–Lehner operator
needs, written out: `𝔫 = 𝔮𝔫'` with `𝔮 + 𝔫' = 𝓞_K`. The level itself is an exact divisor,
which is the Fricke case. -/
theorem self_exactDivisor (𝔫 : Ideal (𝓞 K)) : ∃ 𝔫', 𝔫 = 𝔫 * 𝔫' ∧ 𝔫 ⊔ 𝔫' = ⊤ :=
  ⟨1, (mul_one 𝔫).symm, by simp [Ideal.one_eq_top]⟩

/-! ## Layer 9: level one -/

/-- `README.md`, Layer 9, 9.3. The image of `SL₂(𝓞_K)` in `GL₂(K)`; its cuspidal cohomology
with `ℂ`-coefficients is that of `PSL₂(𝓞_K)`. -/
def sl2Image : Subgroup (GL (Fin 2) K) :=
  (⊤ : Subgroup SL(2, 𝓞 K)).map ((toGLK K).comp Matrix.SpecialLinearGroup.toGL)

/-- `README.md`, Layer 9, 9.3. **Level-one vanishing** for the nine class-number-one fields
(Vogtmann): `H¹_cusp(PSL₂(𝓞_K), ℂ) = 0` exactly for `d_K ∈ {-3, -4, -7, -8, -11, -19}`, and
`≠ 0` for `d_K ∈ {-43, -67, -163}`. -/
theorem cuspidalH1_sl2Image_eq_bot_iff (hK : classNumber K = 1) :
    cuspidalH1 K (sl2Image K) = ⊥ ↔ discr K ∈ ({-3, -4, -7, -8, -11, -19} : Finset ℤ) := by
  sorry

end

end TauCetiRoadmap.BianchiModularForms
