import Mathlib
import TauCeti.Algebra.Group.PowMonoidHom
import TauCeti.FieldTheory.Trace
import TauCeti.NumberTheory.EffectiveBounds.ClassNumber.Basic
import TauCeti.NumberTheory.EffectiveBounds.Discriminant.Basic
import TauCeti.NumberTheory.EffectiveBounds.HermiteCount.Basic
import TauCeti.NumberTheory.EffectiveBounds.IdealCount.Basic
import TauCeti.NumberTheory.EffectiveBounds.UnitSquares.Basic
import TauCeti.NumberTheory.EffectiveBounds.WorkedExamples
import TauCeti.NumberTheory.GeometryOfNumbers.Doubling
import TauCeti.NumberTheory.GeometryOfNumbers.RankTwoDoubling
import TauCeti.NumberTheory.NumberField.Discriminant.OfIntegralBasis

/-!
# Effective arithmetic bounds and geometry of numbers: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Every milestone of Layers 0, 1 and 2 of `README.md`, and each of its worked examples, has a
statement here, in the form the roadmap asks for, closed by the Tau Ceti declaration that
realizes it, so the correspondence is checked by the Lean kernel rather than asserted in prose.
No statement is left as `sorry`. That is evidence for completion, not its criterion: completion
is judged by a milestone-by-milestone audit against `README.md`, which a `sorry`-free file of
suggested forms cannot replace.

Layer 3 (explicit lower bounds on the regulator and the volume computations feeding the analytic
class number formula) and the long-horizon Brauer–Siegel aspiration have no statement here: Tau
Ceti realizes only the rank-zero base case of Layer 3 (`R_K = 1`), which is not the effective
lower bound the roadmap asks for.

The Layer-1 bounds are migrated from
[kim-em/erdos-unit-distance](https://github.com/kim-em/erdos-unit-distance); the ported
`TauCeti/` files credit it.
-/

namespace TauCetiRoadmap.EffectiveBounds

open scoped NumberField

/-! ## Layer 0: the geometry-of-numbers engine -/

section Layer0

open TauCeti.GeometryOfNumbers

variable {ι : Type*}

/-- The polydisc `box r c ⊆ ι → ℂ` is the set of points whose `i`-th coordinate has norm at most
`c · r i`. The engine is stated for an arbitrary additive subgroup of `ι → ℂ` and these boxes,
without a measure. -/
theorem mem_box {r : ι → ℝ} {c : ℝ} {x : ι → ℂ} :
    x ∈ box r c ↔ ∀ i, ‖x i‖ ≤ c * r i :=
  TauCeti.GeometryOfNumbers.mem_box

/-- **Layer 0, packing.** A subset of `box r c` whose distinct points are `ε`-separated in some
coordinate (relative to `r`) is finite, of cardinality at most `(4c/ε)^(2·#ι)`. -/
theorem finite_and_ncard_le_of_subset_box_of_separated [Fintype ι] (r : ι → ℝ)
    (hr : ∀ i, 0 < r i) {c ε : ℝ} (hε : 0 < ε) (hεc : ε ≤ c) {S : Set (ι → ℂ)} (hS : S ⊆ box r c)
    (hsep : ∀ x ∈ S, ∀ y ∈ S, x ≠ y → ∃ i, ε * r i < ‖x i - y i‖) :
    S.Finite ∧ (S.ncard : ℝ) ≤ (4 * c / ε) ^ (2 * Fintype.card ι) :=
  TauCeti.GeometryOfNumbers.finite_and_ncard_le_of_subset_box_of_separated r hr hε hεc hS hsep

/-- **Layer 0, doubling.** `#(Λ ∩ box r 2) ≤ 49^#ι · #(Λ ∩ box r 1)` for an additive subgroup
`Λ` of `ι → ℂ`, given that `Λ ∩ box r 2` is finite (which the packing bound supplies for a
separated `Λ`). -/
theorem ncard_inter_box_two_le_pow_mul_ncard_inter_box_one [Fintype ι] (r : ι → ℝ)
    (hr : ∀ i, 0 < r i) (Λ : AddSubgroup (ι → ℂ)) (hfin : ((Λ : Set (ι → ℂ)) ∩ box r 2).Finite) :
    (((Λ : Set (ι → ℂ)) ∩ box r 2).ncard : ℝ) ≤
      49 ^ Fintype.card ι * ((Λ : Set (ι → ℂ)) ∩ box r 1).ncard :=
  TauCeti.GeometryOfNumbers.ncard_inter_box_two_le_pow_mul_ncard_inter_box_one r hr Λ hfin

end Layer0

/-! ## Layer 1: effective upper bounds -/

section Layer1

/-- **Layer 1, discriminant from an integral basis.** For any `ℚ`-basis `b` of a number
field consisting of algebraic integers, `|d_K| ≤ |disc b|` (the index of `b` in a maximal
order is a nonzero integer, and `disc b = index² · d_K`). -/
theorem abs_discr_le_of_basis_isIntegral {K : Type*} [Field K] [NumberField K] {ι : Type*}
    [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℚ K) (hb : ∀ i, IsIntegral ℤ (b i)) :
    |(NumberField.discr K : ℚ)| ≤ |Algebra.discr ℚ (b : ι → K)| :=
  NumberField.abs_discr_le_of_basis_isIntegral b hb

/-- An actual integral basis (one whose `ℤ`-span is `𝓞 K`) attains the bound. -/
theorem abs_discr_eq_of_basis_isIntegral_of_span_eq_top {K : Type*} [Field K] [NumberField K]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι ℚ K)
    (hb : ∀ i, IsIntegral ℤ (b i))
    (hspan : Submodule.span ℤ (Set.range fun i => (⟨b i, hb i⟩ : 𝓞 K)) = ⊤) :
    |(NumberField.discr K : ℚ)| = |Algebra.discr ℚ (b : ι → K)| :=
  NumberField.abs_discr_eq_of_basis_isIntegral_of_span_eq_top b hb hspan

/-- The trace-form helper: an element `x ∉ ℚ` with `x² ∈ ℚ` has trace zero. It diagonalises
the trace form on square-root bases. -/
theorem trace_eq_zero_of_sq_ratCast {K : Type*} [Field K] [NumberField K] {x : K} {r : ℚ}
    (hx2 : x ^ 2 = algebraMap ℚ K r) (hx : x ∉ (algebraMap ℚ K).range) :
    Algebra.trace ℚ K x = 0 :=
  NumberField.trace_eq_zero_of_sq_ratCast hx2 hx

/-- **Layer 1, explicit ideal count.** For `X ≥ 1` the nonzero integral ideals of norm at most
`X` form a finite set of cardinality at most `X² · 2^[F:ℚ]`. -/
theorem card_ideal_absNorm_le (F : Type*) [Field F] [NumberField F] {X : ℝ} (hX : 1 ≤ X) :
    {I : Ideal (𝓞 F) | I ≠ ⊥ ∧ (Ideal.absNorm I : ℝ) ≤ X}.Finite ∧
      (({I : Ideal (𝓞 F) | I ≠ ⊥ ∧ (Ideal.absNorm I : ℝ) ≤ X}.ncard : ℝ)) ≤
        X ^ 2 * 2 ^ Module.finrank ℚ F :=
  NumberField.card_ideal_absNorm_le F hX

/-- **Layer 1, class number bound.** `h_F ≤ |d_F| · 4^[F:ℚ]`. By Mathlib's
`NumberField.exists_ideal_in_class_of_norm_le` every ideal class contains an integral
ideal of norm `≤ (4/π)^r₂ · (n!/nⁿ) · √|d_F|` (the Minkowski constant, `≤ √|d_F|`), and
the classes inject into the ideals of that norm, counted by the explicit ideal count above
as `≤ |d_F|·2ⁿ`. -/
theorem classNumber_le_bound (F : Type*) [Field F] [NumberField F] :
    (NumberField.classNumber F : ℝ) ≤
      |(NumberField.discr F : ℝ)| * 4 ^ Module.finrank ℚ F :=
  NumberField.classNumber_le_bound F

/-- The abstract group lemma behind the unit-square index: in a commutative group generated by
a finite set `S`, the squares have index at most `2^#S`. -/
theorem index_powMonoidHom_two_le_of_closure {G : Type*} [CommGroup G] {S : Finset G}
    (hS : Subgroup.closure (S : Set G) = ⊤) :
    (MonoidHom.range (powMonoidHom 2 : G →* G)).index ≤ 2 ^ S.card := by
  rw [← TauCeti.square_eq_range_powMonoidHom]
  exact TauCeti.index_square_le_of_closure_eq_top hS

/-- **Layer 1, unit-square index.** `[O_F^× : (O_F^×)²] ≤ 2^[F:ℚ]`. By Dirichlet's unit
theorem `O_F^× ≅ μ_F × ℤ^rank` with `rank = r₁ + r₂ − 1 < [F:ℚ]` and `μ_F` cyclic of even
order, so the squaring map has index `2^(rank+1) ≤ 2^[F:ℚ]`. -/
theorem units_sq_index_le (F : Type*) [Field F] [NumberField F] :
    (MonoidHom.range
        (powMonoidHom 2 :
          (NumberField.RingOfIntegers F)ˣ →* (NumberField.RingOfIntegers F)ˣ)).index ≤
      2 ^ Module.finrank ℚ F := by
  rw [← TauCeti.square_eq_range_powMonoidHom]
  exact NumberField.units_sq_index_le F

end Layer1

/-! ## Layer 2: effective Hermite–Minkowski -/

section Layer2

open NumberField.hermiteTheorem

/-- **Layer 2, the effective count.** Inside a fixed extension `A / ℚ`, the number fields `K`
with `|d_K| ≤ N` number at most `(2C + 1)^(D + 1) · D`, where `D = rankOfDiscrBdd N` is
Mathlib's degree bound and `C = coeffBoundOfDiscrBdd N` is an explicit coefficient height. This
upgrades Mathlib's finiteness theorem `NumberField.finite_of_discr_bdd` to an explicit count. -/
theorem ncard_setOf_finiteDimensional_abs_discr_le_le (A : Type*) [Field A] [CharZero A]
    (N : ℕ) :
    {K : {F : IntermediateField ℚ A // FiniteDimensional ℚ F} |
        haveI : NumberField K := @NumberField.mk _ _ inferInstance K.prop
        |NumberField.discr K| ≤ (N : ℤ)}.ncard ≤
      (2 * NumberField.coeffBoundOfDiscrBdd N + 1) ^ (rankOfDiscrBdd N + 1) *
        rankOfDiscrBdd N :=
  NumberField.ncard_setOf_finiteDimensional_abs_discr_le_le A N

/-- The explicit coefficient height `C` is a closed-form function of `N`: the ceiling of
`M ^ D · (D choose ⌊D/2⌋)`, where `D = rankOfDiscrBdd N` and
`M = max √(1 + boundOfDiscBdd N ^ 2) 1`. -/
theorem coeffBoundOfDiscrBdd_eq (N : ℕ) :
    NumberField.coeffBoundOfDiscrBdd N =
      ⌈(max (Real.sqrt (1 + (boundOfDiscBdd N : ℝ) ^ 2)) 1) ^ rankOfDiscrBdd N
          * ((rankOfDiscrBdd N).choose (rankOfDiscrBdd N / 2) : ℝ)⌉₊ :=
  rfl

end Layer2

/-! ## Worked examples -/

section WorkedExamples

/-- The class number bound is non-vacuous on `ℚ(√−5)` (`d = −20`, `n = 2`): `h ≤ 20 · 16`,
with the field modelled as `AdjoinRoot (X² + 5)`. -/
theorem classNumber_adjoinRoot_sqrt_neg_five_le :
    NumberField.classNumber (AdjoinRoot (Polynomial.X ^ 2 - Polynomial.C (-5 : ℚ))) ≤ 20 * 16 :=
  NumberField.WorkedExamples.classNumber_adjoinRoot_sqrt_neg_five_le

/-- A concrete doubling instance for the rank-two Gaussian lattice `ℤ + ℤi ⊆ ℂ ≅ ℝ²`:
`#(Λ ∩ box 2) ≤ 49 · #(Λ ∩ box 1)`. -/
theorem gaussianLattice_ncard_inter_box_two_le :
    (((TauCeti.GeometryOfNumbers.gaussianLattice : Set (Fin 1 → ℂ)) ∩
        TauCeti.GeometryOfNumbers.box (fun _ => 1) 2).ncard : ℝ) ≤
      49 * (((TauCeti.GeometryOfNumbers.gaussianLattice : Set (Fin 1 → ℂ)) ∩
        TauCeti.GeometryOfNumbers.box (fun _ => 1) 1).ncard : ℝ) :=
  TauCeti.GeometryOfNumbers.gaussianLattice_ncard_inter_box_two_le_fortyNine_mul_ncard_inter_box_one

/-- The discriminant bound recovers `|d_{ℚ(i)}| = 4` from the basis `{1, i}` of the fourth
cyclotomic field. -/
theorem abs_discr_cyclotomicField_four :
    |NumberField.discr (CyclotomicField 4 ℚ)| = 4 :=
  NumberField.WorkedExamples.abs_discr_cyclotomicField_four

end WorkedExamples

end TauCetiRoadmap.EffectiveBounds
