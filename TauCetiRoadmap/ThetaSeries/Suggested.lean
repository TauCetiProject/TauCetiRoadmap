import Mathlib
import TauCeti.Algebra.Module.ZLattice.GaussSum
import TauCeti.Algebra.Module.ZLattice.RealModel
import TauCeti.Algebra.Module.ZLattice.Shell
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeA.Basic
import TauCeti.LinearAlgebra.IntegralLattice.RootLattice.TypeD.Basic
import TauCeti.NumberTheory.LegendreSymbol.KroneckerSymbol
import TauCeti.NumberTheory.ModularForms.DiamondOperators
import TauCeti.NumberTheory.ModularForms.ThetaSeries.Basic

/-!
# Theta series of lattices: target signatures

**This file is not the roadmap.** The definitive specification is `README.md`. This file states
the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`; the
README carries every target, its API and its Checks.

The carrier is Tau Ceti's real lattice model: `L : Submodule ℤ E` in a finite-dimensional real
inner product space `E`, with `[DiscreteTopology L] [IsZLattice ℝ L]`, its dual `ZLattice.dual L`,
the predicates `ZLattice.IsEven` and `ZLattice.IsUnimodular`, the discriminant group
`ZLattice.DiscriminantGroup L = L^∨ ⧸ L`, the level `ZLattice.level L`, and the theta series
`ZLattice.thetaSeries L τ = ∑' v : L, exp (π i ‖v‖² τ)` and `ZLattice.thetaCoset L γ`. An even
lattice of rank `2k` has weight `k`, and its signed discriminant is
`D_L = (-1)^k |L^∨ / L|`.

The headline theorems stated here are:

* Gauss-sum reciprocity for an even lattice of even rank (`gaussSum_eq_mul_dualGaussSum`), the
  evaluation of the Gauss sum at an odd coefficient and a modulus divisible by the level
  (`gaussSum_eq_sqrt_card_mul_jacobiSym`), and Milgram's formula on the real model
  (`sum_cexp_norm_sq_discriminantGroup`);
* the conductor theorem (`conductor_kroneckerChar_dvd_level`), which makes the nebentypus
  `nebentypus` a Dirichlet character modulo the level;
* the Hecke–Schoeneberg theorem (`thetaSeries_slash_of_mem_Gamma0`) and its character-space form
  (`exists_modularForm_coe_eq_thetaSeries`);
* the modularity of every coset theta series on `Γ(N)` (`thetaCoset_slash_of_mem_Gamma`,
  `exists_modularForm_coe_eq_thetaCoset`);
* the representation numbers of `A₂` and `D₄`
  (`representationNumber_realModel_typeARootLattice_two`,
  `representationNumber_realModel_checkerboardLattice_four`).

Every headline theorem of the roadmap is statable at the pins. Those whose statements Tau Ceti
already proves (lattice Poisson summation, the transformation laws, the level-one theorem, the
identification of the theta series of even unimodular lattices of rank `8`, `16` and `24` and of
the Leech lattice, the rank-`16` pair, the Fricke identity) are not restated here; `README.md`
names them under *Exact supplier contracts*.
-/

namespace TauCetiRoadmap.ThetaSeries

open Complex Module ZLattice
open scoped Real MatrixGroups ModularForm Pointwise

noncomputable section

/-! ## Layer 6: Gauss sums of a lattice -/

/-- **Reciprocity for the Gauss sums of an even lattice** (Layer 6.2). For an even full lattice
`L` of rank `2k` and coprime positive integers `a` and `c`,
`G_L(a, c) = (c/a)^k (det L)^{-1/2} e(n/8) ∑_{y ∈ L^∨ / aL} e(-c ‖y‖² / (2a))`, where
`e(x) = exp (2 π i x)`, `det L = |L^∨ / L|` and `e(n/8) = i^k`. Proved by computing the limit of
`t^k Θ_L(a/c + i t)` as `t → 0⁺` in two ways (Milnor–Husemoller, Appendix 4; Turaev, 1998). -/
theorem gaussSum_eq_mul_dualGaussSum {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] {L : Submodule ℤ E} [DiscreteTopology L] [IsZLattice ℝ L]
    (hL : ZLattice.IsEven L) {k : ℕ} (hk : finrank ℝ E = 2 * k) {a c : ℕ} [NeZero a] [NeZero c]
    (hac : a.Coprime c) [Fintype (L ⧸ ((c : ℝ) • L).submoduleOf L)]
    [Fintype (dual L ⧸ ((a : ℝ) • L).submoduleOf (dual L))] :
    gaussSum L hL a c =
      ((c : ℂ) / a) ^ k * ((√(Nat.card (DiscriminantGroup L) : ℝ) : ℝ) : ℂ)⁻¹ * I ^ k *
        dualGaussSum L hL (-(c : ℤ)) a := sorry

/-- **Milgram's formula for a positive definite even lattice** (Layer 6.3). For an even full
lattice `L` of rank `2k`, `∑_{γ ∈ L^∨ / L} e(q_L(γ)) = |L^∨ / L|^{1/2} e(n/8)`, where
`e(q_L(γ)) = exp (π i ‖γ‖²)` is computed on any representative of `γ` in `L^∨` and
`e(n/8) = i^k` (Milnor–Husemoller, Appendix 4). -/
theorem sum_cexp_norm_sq_discriminantGroup {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {L : Submodule ℤ E} [DiscreteTopology L]
    [IsZLattice ℝ L] (hL : ZLattice.IsEven L) {k : ℕ} (hk : finrank ℝ E = 2 * k)
    [Fintype (DiscriminantGroup L)] :
    ∑ γ : DiscriminantGroup L, cexp (π * I * (‖((Quotient.out γ : dual L) : E)‖ ^ 2 : ℝ)) =
      ((√(Nat.card (DiscriminantGroup L) : ℝ) : ℝ) : ℂ) * I ^ k := sorry

/-- **The Gauss sum at an odd coefficient** (Layer 6.5). For an even full lattice `L` of rank `2k`
and level `N`, an odd positive integer `a` and a positive integer `c` prime to `a` with `N ∣ c`,
`G_L(a, c) = c^k (det L)^{1/2} e(n/8) (D_L / a)`, with `D_L = (-1)^k det L`, `det L = |L^∨ / L|`
and `(D_L / a)` the Jacobi symbol (Ogg, Chapter VI; Iwaniec, Chapter 10; Ebeling, Chapter 3). -/
theorem gaussSum_eq_sqrt_card_mul_jacobiSym {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {L : Submodule ℤ E} [DiscreteTopology L]
    [IsZLattice ℝ L] (hL : ZLattice.IsEven L) {k : ℕ} (hk : finrank ℝ E = 2 * k) {a c : ℕ}
    [NeZero c] [Fintype (L ⧸ ((c : ℝ) • L).submoduleOf L)] (ha : Odd a) (hac : a.Coprime c)
    (hN : level L ∣ c) :
    gaussSum L hL a c =
      (c : ℂ) ^ k * ((√(Nat.card (DiscriminantGroup L) : ℝ) : ℝ) : ℂ) * I ^ k *
        (jacobiSym ((-1) ^ k * (Nat.card (DiscriminantGroup L) : ℤ)) a : ℂ) := sorry

/-- **The conductor theorem** (Layer 6.6). For an even full lattice `L` of rank `2k`, the
conductor of the Kronecker character `(D_L / ·)` of the signed discriminant
`D_L = (-1)^k |L^∨ / L|` divides the level of `L`. The character is Tau Ceti's
`TauCeti.kroneckerChar` at modulus `|D_L|`; the level need not divide `D_L` (Ebeling, Chapter 3). -/
theorem conductor_kroneckerChar_dvd_level {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {L : Submodule ℤ E} [DiscreteTopology L]
    [IsZLattice ℝ L] (hL : ZLattice.IsEven L) {k : ℕ} (hk : finrank ℝ E = 2 * k) :
    (TauCeti.kroneckerChar ℂ ((-1) ^ k * (Nat.card (DiscriminantGroup L) : ℤ))
        (hL.neg_one_pow_mul_card_discriminantGroup_modEq_zero_or_one hk)
        (mul_ne_zero (pow_ne_zero k (by norm_num)) (Nat.cast_ne_zero.mpr
          (Nat.pos_of_dvd_of_pos card_discriminantGroup_dvd_level_pow
            (pow_pos hL.isIntegral.level_pos _)).ne'))).conductor ∣
      level L := sorry

/-- **The nebentypus** `χ_L` of an even full lattice `L` of rank `2k` (Layer 6.6): the primitive
character attached to the Kronecker character `(D_L / ·)` of `D_L = (-1)^k |L^∨ / L|`, induced up
to the level of `L`, which its conductor divides by `conductor_kroneckerChar_dvd_level`. -/
def nebentypus {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
    {L : Submodule ℤ E} [DiscreteTopology L] [IsZLattice ℝ L] (hL : ZLattice.IsEven L) {k : ℕ}
    (hk : finrank ℝ E = 2 * k) : DirichletCharacter ℂ (level L) :=
  DirichletCharacter.changeLevel (conductor_kroneckerChar_dvd_level hL hk)
    (TauCeti.kroneckerChar ℂ ((-1) ^ k * (Nat.card (DiscriminantGroup L) : ℤ))
      (hL.neg_one_pow_mul_card_discriminantGroup_modEq_zero_or_one hk)
      (mul_ne_zero (pow_ne_zero k (by norm_num)) (Nat.cast_ne_zero.mpr
        (Nat.pos_of_dvd_of_pos card_discriminantGroup_dvd_level_pow
          (pow_pos hL.isIntegral.level_pos _)).ne'))).primitiveCharacter

/-! ## Layer 7: general level -/

/-- **The Hecke–Schoeneberg theorem** (Layer 7.3). Let `L` be an even full lattice of rank `2k`
and level `N`. For every `A = !![a, b; c, d] ∈ Γ₀(N)`, `Θ_L ∣[k] A = χ_L(d) Θ_L`, where `χ_L` is
the nebentypus (Schoeneberg, Chapter IX; Ebeling, Chapter 3; Ogg, Chapter VI). -/
theorem thetaSeries_slash_of_mem_Gamma0 {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {L : Submodule ℤ E} [DiscreteTopology L]
    [IsZLattice ℝ L] (hL : ZLattice.IsEven L) {k : ℕ} (hk : finrank ℝ E = 2 * k) {A : SL(2, ℤ)}
    (hA : A ∈ CongruenceSubgroup.Gamma0 (level L)) :
    thetaSeries L ∣[(k : ℤ)] A = nebentypus hL hk (A 1 1 : ZMod (level L)) • thetaSeries L :=
  sorry

/-- **The theta series as a modular form with character** (Layer 7.4). For an even full lattice
`L` of rank `2k` and level `N`, `Θ_L` is the underlying function of a modular form of weight `k`
on `Γ₁(N)` lying in the nebentypus space `M_k(Γ₁(N), χ_L)`, Tau Ceti's `modFormCharSpace` at the
unit-homomorphism face of `χ_L` (Ebeling, Chapter 3; Miyake, §4.9). -/
theorem exists_modularForm_coe_eq_thetaSeries {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {L : Submodule ℤ E} [DiscreteTopology L]
    [IsZLattice ℝ L] (hL : ZLattice.IsEven L) {k : ℕ} (hk : finrank ℝ E = 2 * k) :
    ∃ F : ModularForm
        ((CongruenceSubgroup.Gamma1 (level L)).map (Matrix.SpecialLinearGroup.mapGL ℝ)) k,
      ⇑F = thetaSeries L ∧ F ∈ modFormCharSpace (k : ℤ) (nebentypus hL hk).toUnitHom :=
  sorry

/-- **The coset theta series on `Γ(N)`** (Layer 7.5). For an even full lattice `L` of rank `2k`
and level `N` and every `γ` in the dual lattice, `θ_{γ+L} ∣[k] A = θ_{γ+L}` for every `A` in the
principal congruence subgroup `Γ(N)` (Ebeling, Chapter 3; Schoeneberg, Chapter IX). -/
theorem thetaCoset_slash_of_mem_Gamma {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] {L : Submodule ℤ E} [DiscreteTopology L] [IsZLattice ℝ L]
    (hL : ZLattice.IsEven L) {k : ℕ} (hk : finrank ℝ E = 2 * k) {γ : E} (hγ : γ ∈ dual L)
    {A : SL(2, ℤ)} (hA : A ∈ CongruenceSubgroup.Gamma (level L)) :
    thetaCoset L γ ∣[(k : ℤ)] A = thetaCoset L γ := sorry

/-- **The coset theta series as a modular form** (Layer 7.5). For an even full lattice `L` of rank
`2k` and level `N` and every `γ` in the dual lattice, `θ_{γ+L}` is the underlying function of a
modular form of weight `k` on `Γ(N)`. -/
theorem exists_modularForm_coe_eq_thetaCoset {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] {L : Submodule ℤ E} [DiscreteTopology L]
    [IsZLattice ℝ L] (hL : ZLattice.IsEven L) {k : ℕ} (hk : finrank ℝ E = 2 * k) {γ : E}
    (hγ : γ ∈ dual L) :
    ∃ F : ModularForm
        ((CongruenceSubgroup.Gamma (level L)).map (Matrix.SpecialLinearGroup.mapGL ℝ)) k,
      ⇑F = thetaCoset L γ := sorry

/-! ## Layer 8: identification of the classical theta series -/

/-- **The representation numbers of `A₂`** (Layer 8.6). In the real model of Tau Ceti's root
lattice `A₂`, the number of vectors of squared norm `2m`, `m ≥ 1`, is `6 ∑_{d ∣ m} (-3 / d)`:
`Θ_{A₂}` is the weight-one Eisenstein series with character `(-3 / ·)` on `Γ₀(3)`, normalized to
constant term `1` (Conway–Sloane, Chapter 2, §2.3). -/
theorem representationNumber_realModel_typeARootLattice_two {m : ℕ} (hm : m ≠ 0) :
    (representationNumber
        ((TauCeti.IntegralLattice.typeARootLattice 2).realModel
          (TauCeti.IntegralLattice.isPosDef_typeARootLattice 2)) (2 * m) : ℤ) =
      6 * ∑ d ∈ m.divisors, TauCeti.kroneckerSym (-3) d := sorry

/-- **The representation numbers of `D₄`** (Layer 8.6). In the real model of Tau Ceti's root
lattice `D₄`, the number of vectors of squared norm `2m`, `m ≥ 1`, is `24` times the sum of the
odd divisors of `m`: `Θ_{D₄} = 2 E₂(2τ) - E₂(τ)` on `Γ₀(2)` (Conway–Sloane, Chapter 2, §2.3). -/
theorem representationNumber_realModel_checkerboardLattice_four {m : ℕ} (hm : m ≠ 0) :
    representationNumber
        ((TauCeti.IntegralLattice.checkerboardLattice 4).realModel
          (TauCeti.IntegralLattice.isPosDef_checkerboardLattice 4)) (2 * m) =
      24 * ∑ d ∈ m.divisors with Odd d, d := sorry

end

end TauCetiRoadmap.ThetaSeries
