import Mathlib
import TauCeti.Algebra.LinearRecurrence.Nondegenerate
import TauCeti.Algebra.Polynomial.Coeff.ToMvPolynomial
import TauCeti.LinearAlgebra.ExteriorPower.Plucker
import TauCeti.LinearAlgebra.LinearIndependent.GeneralPosition
import TauCeti.NumberTheory.DiophantineApproximation.AlgebraicExponent
import TauCeti.NumberTheory.DiophantineApproximation.Dirichlet
import TauCeti.NumberTheory.DiophantineApproximation.Exponent
import TauCeti.NumberTheory.DiophantineApproximation.Kronecker
import TauCeti.NumberTheory.DiophantineApproximation.LinearFormExponent
import TauCeti.NumberTheory.DiophantineApproximation.Roth.BinaryForm
import TauCeti.NumberTheory.DiophantineApproximation.Roth.SumEstimate
import TauCeti.NumberTheory.DiophantineApproximation.Roth.Theorem
import TauCeti.NumberTheory.DiophantineApproximation.Thue.GapPrinciple
import TauCeti.NumberTheory.Height.Absolute
import TauCeti.NumberTheory.Height.Arakelov.Basic
import TauCeti.NumberTheory.Height.Arakelov.Subspace.Basic
import TauCeti.NumberTheory.Height.House
import TauCeti.NumberTheory.Height.MahlerMeasure
import TauCeti.NumberTheory.Height.Matrix
import TauCeti.NumberTheory.Height.MvPolynomial
import TauCeti.NumberTheory.Height.ProjectiveTuple
import TauCeti.NumberTheory.Height.Subspace.Basic
import TauCeti.NumberTheory.Height.Twisted.Basic
import TauCeti.NumberTheory.Height.Twisted.Determinant
import TauCeti.NumberTheory.NumberField.Global.Places.Extension
import TauCeti.NumberTheory.Transcendental.AlgebraicLogs
import TauCeti.NumberTheory.Transcendental.GelfondSchneider.Theorem
import TauCeti.NumberTheory.Transcendental.Lindemann.Theorem
import TauCeti.NumberTheory.UnitEquation.Nondegenerate
import TauCeti.RingTheory.MvPolynomial.HasseDeriv.DegreeBound
import TauCeti.RingTheory.MvPolynomial.SeparateVariable
import TauCeti.RingTheory.MvPolynomial.WeightedIndex
import TauCeti.RingTheory.Polynomial.HasseWronskian
import TauCeti.RingTheory.PowerSeries.DFinite

/-!
# DiophantineApproximationAndTranscendence: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need. The README carries every construction, API list and Check.

The carriers of Layers 0–2 (approximation exponents, the weighted index, polynomial, matrix,
absolute, affine, Euclidean and subspace heights, Plücker coordinates, general position and
nondegenerate solutions) are pinned Tau Ceti definitions, and the headline statements below use
them directly. The target signatures of the SubspaceTheorem and HeightsAndUnits roadmaps import
some of them from this file under the names of this roadmap; those names are abbreviations of the
Tau Ceti definitions, not second definitions.

Headline theorems that the pinned Tau Ceti already proves are not restated: they are pinned below
by `#check`. These are bounded-degree Northcott finiteness, Kronecker's theorem on Mahler measure
one, the den/house lower bound, Dirichlet's theorem for systems of linear forms, Kronecker's
approximation theorem, the almost-everywhere irrationality exponent, Roth's theorem in its real,
complex and Liouville-exponent forms, the Thue–Roth inequality for binary forms, Thue's
approximation and Thue-equation theorems, the Lindemann–Weierstrass theorem in both forms and the
real Gelfond–Schneider theorem.

Headline theorems of the README that are not statable at the pins, and what each lacks:
* the effectivity of the Layer 4 bounds (a computable constant) is not expressible in a `Prop`; the
  Layer 4 statements below give explicit bounds that carry it, except `tijdeman_catalan`, which
  states only that the bound exists;
* the Picard–Vessiot and differential-Galois comparisons of README §5.4 need a Picard–Vessiot
  extension and its differential Galois group, which neither library has;
* the generated-subgroup and torus-separation statements of README §5.6 need algebraic subgroups
  of `Gₐⁿ × Gₘⁿ` with their character lattices, which neither library has;
* the absolute (`ℚ̄`-rational) forms of the parametric Subspace theorem in README §2.8 need the
  twisted height on `ℚ̄ⁿ`, which neither library has; the `K`-rational forms are stated below. The
  absolute Subspace theorem for systems needs no twisted height and is stated over `ℚ̄`.
-/

namespace TauCetiRoadmap.DiophantineApproximationAndTranscendence

/-! Headline theorems proved in the pinned Tau Ceti. -/

#check @TauCeti.finite_setOf_absMulHeight₁_le
#check @TauCeti.mahlerMeasure_eq_one_iff
#check @TauCeti.inv_norm_le_natDenominator_pow_mul_house_pow
#check @Matrix.dirichlet_linearForms
#check @TauCeti.kronecker_approximation
#check @TauCeti.ae_irrationalityExponent_eq_two
#check @IsAlgebraic.finite_setOfPred_abs_sub_le_mulHeight₁_rpow_neg
#check @IsAlgebraic.exists_pos_mul_mulHeight₁_rpow_neg_le_norm_sub
#check @IsAlgebraic.not_liouvilleWith
#check @MvPolynomial.IsHomogeneous.exists_pos_mul_max_abs_rpow_le_abs_eval
#check @TauCeti.thue_approximation_real
#check @MvPolynomial.IsHomogeneous.finite_setOf_eval_eq_of_three_le_card_roots
#check @TauCeti.linearIndependent_exp
#check @TauCeti.algebraicIndependent_exp
#check @TauCeti.transcendental_rpow

noncomputable section

open Polynomial NumberField Filter
open scoped ENNReal NNReal Topology

/-! ## Layer 0: heights and approximation exponents -/

namespace DiophantineApproximation

/-- The irrationality exponent `μ(ξ) ∈ [1, ∞]`: the supremum of the `p` with `LiouvilleWith p ξ`
(README §0.5). This name abbreviates Tau Ceti's `TauCeti.irrationalityExponent`. -/
abbrev irrationalityExponent (ξ : ℝ) : ℝ≥0∞ := TauCeti.irrationalityExponent ξ

/-- Mahler's exponent `w_n(ξ)`: the supremum of the `w` for which
`0 < |x₀ + x₁ξ + ⋯ + xₙξⁿ| ≤ ‖x‖^(-w)` has infinitely many integer solutions `x`, the sup norm
taken over all `n + 1` coordinates (README §0.5). This name abbreviates Tau Ceti's
`TauCeti.mahlerExponent`. -/
abbrev mahlerExponent (n : ℕ) (ξ : ℝ) : ℝ≥0∞ := TauCeti.mahlerExponent n ξ

/-- The exponent `w*_n(ξ)`: the supremum of the `w` for which infinitely many complex algebraic
`α` of degree at most `n` satisfy `0 < |ξ - α| ≤ H(α)^(-w-1)`, with `H` the naive height
(README §0.5). This name abbreviates Tau Ceti's `TauCeti.algebraicApproximationExponent`. -/
abbrev algebraicApproximationExponent (n : ℕ) (ξ : ℝ) : ℝ≥0∞ :=
  TauCeti.algebraicApproximationExponent n ξ

/-- The absolute projective height of a finite tuple in a field of characteristic zero: the
relative height in the number field generated by the coordinates, to the power one over its
degree; the zero tuple has value one, and a tuple with a transcendental coordinate has the junk
value one (README §0.2). This name abbreviates Tau Ceti's `TauCeti.absoluteProjectiveTupleHeight`.
-/
abbrev absoluteProjectiveTupleHeight {K : Type*} [Field K] [CharZero K] {ι : Type*} [Finite ι]
    (x : ι → K) : ℝ :=
  TauCeti.absoluteProjectiveTupleHeight x

/-- The absolute affine logarithmic height `log H(1, x)` of a tuple in a field of characteristic
zero (README §2.4). This name abbreviates Tau Ceti's `TauCeti.absoluteLogHeightAff`. -/
abbrev absoluteLogHeightAff {K : Type*} [Field K] [CharZero K] {n : ℕ} (x : Fin n → K) : ℝ :=
  TauCeti.absoluteLogHeightAff x

end DiophantineApproximation

/-! ## Layer 1: auxiliary polynomials and Roth’s theorem -/

namespace DiophantineApproximation

/-- The sum `∑ₖ b^(-3^(k+1))` is transcendental for every integer base `b ≥ 2`: its partial sums
approximate it to an order exceeding Roth's exponent (E19, ch. 6, Exercise 6.5). -/
theorem transcendental_tsum_inv_pow_three_pow (b : ℕ) (hb : 2 ≤ b) :
    Transcendental ℚ (∑' k : ℕ, ((b : ℝ)⁻¹) ^ (3 ^ (k + 1))) := sorry

/-- The relative height of a matrix over a field with admissible absolute values: the projective
height of its tuple of entries, not of its maximal minors (README §1.3). This name abbreviates Tau
Ceti's `Matrix.mulHeight`. -/
abbrev matrixMulHeight {K m n : Type*} [Field K] [Height.AdmissibleAbsValues K]
    [Finite m] [Finite n] (A : Matrix m n K) : ℝ :=
  Matrix.mulHeight A

end DiophantineApproximation

namespace MvPolynomial

/-- The index of `P` at the point `a` with respect to the weights `r` (Pottmeyer, Definition
2.6.2): the least value of `∑ⱼ iⱼ / rⱼ` over the `i` whose Hasse derivative `∂^i P` does not
vanish at `a`; it is `⊤` at `P = 0`. This name abbreviates Tau Ceti's `MvPolynomial.weightedIndex`.
-/
abbrev weightedIndex {R σ : Type*} [CommSemiring R] (r : σ → ℕ) (a : σ → R)
    (P : MvPolynomial σ R) : ℝ≥0∞ :=
  _root_.MvPolynomial.weightedIndex r a P

/-- The relative logarithmic height of a multivariate polynomial over a field with admissible
absolute values: the logarithm of the projective height of its coefficient vector (README §1.3).
This name abbreviates Tau Ceti's `MvPolynomial.logHeight`. -/
abbrev logHeight {σ K : Type*} [Field K] [Height.AdmissibleAbsValues K]
    (P : MvPolynomial σ K) : ℝ :=
  _root_.MvPolynomial.logHeight P

end MvPolynomial

/-! README §1.4 consumes Tau Ceti's one-variable Hasse Wronskian and generalized Wronskian with
the API below, together with the separation of one variable, the Kronecker substitution, the
partial-degree and height bounds for Wronskian determinants and the sum estimate of Roth's lemma. -/

#check @_root_.Polynomial.hasseWronskian_fin_zero
#check @_root_.Polynomial.hasseWronskian_fin_one
#check @_root_.Polynomial.hasseWronskian_fin_two
#check @_root_.Polynomial.prod_factorial_mul_hasseWronskian
#check @_root_.Polynomial.hasseWronskian_comp_perm
#check @_root_.Polynomial.hasseWronskian_update_add_smul
#check @_root_.Polynomial.hasseWronskian_map
#check @_root_.Polynomial.hasseWronskian_eq_zero_of_not_linearIndependent
#check @_root_.Polynomial.hasseWronskian_ne_zero_of_linearIndependent
#check @_root_.Polynomial.linearIndependent_iff_hasseWronskian_ne_zero
#check @_root_.Polynomial.degreeOf_toMvPolynomial
#check @_root_.MvPolynomial.genWronskian
#check @_root_.MvPolynomial.genWronskian_fin_zero
#check @_root_.MvPolynomial.genWronskian_fin_one
#check @_root_.MvPolynomial.map_genWronskian
#check @_root_.MvPolynomial.genWronskian_single_toMvPolynomial
#check @_root_.MvPolynomial.genWronskian_eq_zero_of_not_linearIndependent
#check @_root_.MvPolynomial.linearIndependent_iff_exists_genWronskian_ne_zero
#check @_root_.MvPolynomial.exists_sum_mul_linearIndependent
#check @_root_.MvPolynomial.det_hasseDeriv_sum_mul_toMvPolynomial
#check @_root_.MvPolynomial.degreeOf_genWronskian_le
#check @_root_.Finsupp.exists_injOn_weight
#check @_root_.MvPolynomial.linearIndependent_aeval_X_pow
#check @_root_.MvPolynomial.eval_hasseDeriv_aeval_X_pow
#check @_root_.MvPolynomial.coeff_aeval_X_add_C_pow_sub_C_eq_zero
#check @_root_.MvPolynomial.logHeight_det_hasseDeriv_le
#check @_root_.TauCeti.mul_min_le_sum_max_sub_div

namespace WronskianBounds

/-- The degree estimate for a nonzero Hasse Wronskian over any commutative ring: the Wronskian has
degree at most the sum of the degrees of the family minus `0 + 1 + ⋯ + (ℓ - 1)`, because the
`k`-th Hasse derivative lowers the degree by at least `k` or vanishes (derived in README §1.4 from
the Leibniz expansion of the determinant; Mathlib's `Polynomial.natDegree_wronskian_lt_add` is the
case `ℓ = 2`). -/
theorem natDegree_add_derivative_orders_le {R : Type*} [CommRing R] {ℓ : ℕ}
    (g : Fin ℓ → R[X]) (hg : Polynomial.hasseWronskian g ≠ 0) :
    (Polynomial.hasseWronskian g).natDegree + ∑ k : Fin ℓ, (k : ℕ) ≤
      ∑ j, (g j).natDegree := by
  sorry

/-- The summed multiplicity bound for a polynomial space `V` of dimension `ℓ` over a field of
characteristic zero: for distinct points `a ∈ S` and nonzero members `f a ∈ V`, the excesses
`(mult_a (f a) + 1) - ℓ` sum to at most the degree of the Hasse Wronskian of any basis of `V`
(derived in README §1.4; characteristic zero makes that Wronskian nonzero). -/
theorem sum_multiplicity_lower_bounds_le_natDegree {K : Type*} [Field K] [CharZero K]
    {ℓ : ℕ} (V : Submodule K K[X]) (b : Module.Basis (Fin ℓ) K V)
    (S : Finset K) (f : K → V) (hf : ∀ a ∈ S, f a ≠ 0) :
    ∑ a ∈ S, (((f a : K[X]).rootMultiplicity a + 1) - ℓ) ≤
      (Polynomial.hasseWronskian (fun j => (b j : K[X]))).natDegree := by
  sorry

end WronskianBounds

/-! ## Layer 2: subspace theorems and multiplicative groups -/

open Matrix TauCeti.GlobalNumberFields

namespace DiophantineApproximation

/-- The Plücker coordinates of a family `x` of `p` vectors in `ι → R` over a commutative ring:
at a `p`-element subset `s` of the linearly ordered `ι`, the maximal minor on the columns in `s`,
taken in increasing order. This name abbreviates Tau Ceti's `TauCeti.plucker`. -/
abbrev plucker {R ι : Type*} [CommRing R] [LinearOrder ι] {p : ℕ}
    (x : Fin p → ι → R) : Set.powersetCard ι p → R :=
  TauCeti.plucker x

/-- The relative sup height of a subspace `T ≤ K^ι` over a field with admissible absolute
values: the projective height of the Plücker vector of any basis of `T`; the zero subspace and
the whole space have height one (README §2.5). This name abbreviates Tau Ceti's
`Submodule.relativeSubspaceHeight`. -/
abbrev relativeSubspaceHeight {K ι : Type*} [Field K] [Height.AdmissibleAbsValues K]
    [Finite ι] [LinearOrder ι] (T : Submodule K (ι → K)) : ℝ :=
  Submodule.relativeSubspaceHeight T

/-- The relative Euclidean projective height of a tuple over a number field `K`: one at the zero
tuple, and otherwise the `[K : ℚ]`-th power of the absolute Euclidean height `H₂`, which uses
Euclidean norms at the infinite places and max norms at the finite places (README §2.5). This
name abbreviates Tau Ceti's `TauCeti.arakelovMulHeight`. -/
abbrev arakelovMulHeight {K : Type*} [Field K] [NumberField K] {ι : Type*} [Finite ι]
    (y : ι → K) : ℝ :=
  TauCeti.arakelovMulHeight y

/-- The relative Euclidean height of a subspace `T ≤ K^ι` over a number field: the relative
Euclidean projective height of the Plücker vector of any basis of `T` (README §2.5). This name
abbreviates Tau Ceti's `Submodule.relativeSubspaceArakelovHeight`. -/
abbrev relativeSubspaceArakelovHeight {K : Type*} [Field K] [NumberField K] {ι : Type*}
    [Finite ι] [LinearOrder ι] (T : Submodule K (ι → K)) : ℝ :=
  Submodule.relativeSubspaceArakelovHeight T

/-- The absolute Euclidean height of a subspace `T ≤ K^ι` over a number field: the `[K : ℚ]`-th
root of its relative Euclidean height; the zero subspace and the whole space have height one
(README §2.5). This name abbreviates Tau Ceti's `Submodule.subspaceHeight`. -/
abbrev subspaceHeight {K : Type*} [Field K] [NumberField K] {ι : Type*} [Finite ι]
    [LinearOrder ι] (T : Submodule K (ι → K)) : ℝ :=
  Submodule.subspaceHeight T

/-- A family of coefficient vectors in `Fⁿ` is in general position if every subfamily of `n`
distinct members is linearly independent; a family with fewer than `n` members is in general
position (README §2.1). This name abbreviates Tau Ceti's `TauCeti.InGeneralPosition`. -/
abbrev InGeneralPosition {F ι : Type*} [Field F] {n : ℕ} (L : ι → Fin n → F) : Prop :=
  TauCeti.InGeneralPosition L

/-- A nondegenerate solution of `∑ αᵢ xᵢ = 1`: no nonempty subsum `∑_{i ∈ I} αᵢ xᵢ` vanishes
(README §2.3). This name abbreviates Tau Ceti's `TauCeti.IsNondegenerateSolution`. -/
abbrev IsNondegenerateSolution {K ι : Type*} [Field K] [Fintype ι] (α x : ι → K) : Prop :=
  TauCeti.IsNondegenerateSolution α x

/-- A nondegenerate solution of `∑ αᵢ xᵢ = 0`: no proper nonempty subsum vanishes (README §2.3).
This name abbreviates Tau Ceti's `TauCeti.IsNondegenerateHomogeneousSolution`. -/
abbrev IsNondegenerateHomogeneousSolution {K ι : Type*} [Field K] [Fintype ι] (α x : ι → K) :
    Prop :=
  TauCeti.IsNondegenerateHomogeneousSolution α x

/-- **Schmidt's Subspace theorem** (E19, ch. 7, Theorem 7.1): for `n ≥ 2` linearly independent
linear forms `L₁, …, Lₙ` with algebraic coefficients and `C, δ > 0`, the integer points `x` with
`|L₁(x)⋯Lₙ(x)| ≤ C‖x‖^(-δ)` lie in finitely many proper rational subspaces of `ℚⁿ`. -/
theorem subspace_theorem {n : ℕ} (hn : 2 ≤ n) (L : Fin n → Fin n → ℂ)
    (halg : ∀ i j, IsAlgebraic ℚ (L i j)) (hL : LinearIndependent ℂ L) {C δ : ℝ}
    (hC : 0 < C) (hδ : 0 < δ) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ, ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ (-δ) →
        ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

/-- **The Subspace theorem for forms in general position** (E19, ch. 7, Theorem 7.4): for
`r ≥ n ≥ 2` linear forms with algebraic coefficients, every `n` of them linearly independent, and
`C, δ > 0`, the integer points `x` with `|L₁(x)⋯L_r(x)| ≤ C‖x‖^(r-n-δ)` lie in finitely many
proper rational subspaces of `ℚⁿ`. -/
theorem subspace_theorem_general_position {n r : ℕ} (hn : 2 ≤ n) (hr : n ≤ r)
    (L : Fin r → Fin n → ℂ) (halg : ∀ i j, IsAlgebraic ℚ (L i j)) (hL : TauCeti.InGeneralPosition L)
    {C δ : ℝ} (hC : 0 < C) (hδ : 0 < δ) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ, ‖∏ i, L i ⬝ᵥ (fun j ↦ (x j : ℂ))‖ ≤ C * ‖x‖ ^ ((r : ℝ) - n - δ) →
        ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

section PAdic

variable {K : Type*} [Field K] [NumberField K]

/-- **Schlickewei's `p`-adic Subspace theorem** (E19, ch. 8, Theorem 8.7): let `S` be a finite
set of primes and `v` absolute values on the number field `K` extending the ordinary absolute
value of `ℚ` (index `none`) and the `p`-adic absolute values for `p ∈ S` (index `some p`), as in
E19 notation (8.4). If at each of these places `n ≥ 2` linearly independent linear forms with
coefficients in `K` are given and `C, ε > 0`, the integer points `x` with
`∏_v ∏ᵢ |Lᵢᵥ(x)|_v ≤ C‖x‖^(-ε)` lie in finitely many proper rational subspaces of `ℚⁿ`. -/
theorem padic_subspace_theorem {n : ℕ} (hn : 2 ≤ n) (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime)
    (v : Option S → AbsoluteValue K ℝ) (hvInf : ∀ q : ℚ, v none (q : K) = |(q : ℝ)|)
    (hvp : ∀ (p : S) (q : ℚ), v (some p) (q : K) = padicNorm p q)
    (L : Option S → Fin n → Fin n → K) (hL : ∀ p, LinearIndependent K (L p))
    {C ε : ℝ} (hC : 0 < C) (hε : 0 < ε) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ,
        ∏ p, ∏ i, v p (L p i ⬝ᵥ (fun j ↦ (x j : K))) ≤ C * ‖x‖ ^ (-ε) →
          ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

/-- **The `p`-adic Subspace theorem for forms in general position** (E19, ch. 8, Theorem 8.8):
with the places of `padic_subspace_theorem` and, at each place `v`, `r_v ≥ n` linear forms over
`K` in general position, the primitive integer points `x` with
`∏_v ∏ᵢ |Lᵢᵥ(x)|_v ≤ C‖x‖^(r_∞-n-ε)` lie in finitely many proper rational subspaces of `ℚⁿ`. -/
theorem padic_subspace_theorem_general_position {n : ℕ} (hn : 2 ≤ n) (S : Finset ℕ)
    (hS : ∀ p ∈ S, p.Prime) (v : Option S → AbsoluteValue K ℝ)
    (hvInf : ∀ q : ℚ, v none (q : K) = |(q : ℝ)|)
    (hvp : ∀ (p : S) (q : ℚ), v (some p) (q : K) = padicNorm p q)
    (r : Option S → ℕ) (hr : ∀ p, n ≤ r p) (L : (p : Option S) → Fin (r p) → Fin n → K)
    (hL : ∀ p, TauCeti.InGeneralPosition (L p)) {C ε : ℝ} (hC : 0 < C) (hε : 0 < ε) :
    ∃ T : Finset (Submodule ℚ (Fin n → ℚ)), (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x : Fin n → ℤ, Finset.univ.gcd x = 1 →
        ∏ p, ∏ i, v p (L p i ⬝ᵥ (fun j ↦ (x j : K))) ≤ C * ‖x‖ ^ ((r none : ℝ) - n - ε) →
          ∃ V ∈ T, (fun j ↦ (x j : ℚ)) ∈ V := by
  sorry

end PAdic

/-- **Approximation by algebraic numbers of bounded degree** (E19, ch. 7, Theorem 7.8): for
algebraic `α`, `d ∈ ℕ`, `C > 0` and `κ > d + 1`, only finitely many algebraic `ξ` of degree at
most `d` satisfy `|ξ - α| ≤ C·H(ξ)^(-κ)`, `H` the naive height. It is stated in the equivalent
form counting the primitive irreducible integer polynomials `F` with positive leading coefficient
that have such a root, the naive height of a root of `F` being the largest modulus of a
coefficient of `F`. -/
theorem finite_approximation_bounded_degree (α : ℂ) (hα : IsAlgebraic ℚ α) (d : ℕ)
    {C κ : ℝ} (hC : 0 < C) (hκ : (d : ℝ) + 1 < κ) :
    {F : Polynomial ℤ | F.IsPrimitive ∧ Irreducible F ∧ 0 < F.leadingCoeff ∧ F.natDegree ≤ d ∧
      ∃ ξ : ℂ, Polynomial.aeval ξ F = 0 ∧
        ‖ξ - α‖ ≤ C * ((F.support.sup fun i ↦ (F.coeff i).natAbs : ℕ) : ℝ) ^ (-κ)}.Finite := by
  sorry

section NormForm

variable {K : Type*} [Field K] [NumberField K]

/-- **Schmidt's norm form theorem**, finiteness direction (Schmidt 1972; E19, ch. 7, Theorem
7.13, (i) ⇒ (ii)): let `M` be the `ℤ`-module spanned by `ℚ`-linearly independent
`α₁, …, αₙ ∈ K`. If `M` contains no `μ·𝓞_L` with `μ ≠ 0` and `L ≠ ℚ` a subfield of `K` that is
not imaginary quadratic, then for every nonzero rational `c` only finitely many `ξ ∈ M` have norm
`N_{K/ℚ}(ξ) = c`. -/
theorem schmidt_normForm {n : ℕ} (α : Fin n → K) (hα : LinearIndependent ℚ α)
    (h : ¬ ∃ μ : K, μ ≠ 0 ∧ ∃ L : IntermediateField ℚ K, L ≠ ⊥ ∧
      ¬ (Module.finrank ℚ L = 2 ∧ IsTotallyComplex L) ∧
        ∀ y : 𝓞 L, μ * ((y : L) : K) ∈ Submodule.span ℤ (Set.range α))
    (c : ℚ) (hc : c ≠ 0) :
    {ξ : K | ξ ∈ Submodule.span ℤ (Set.range α) ∧ Algebra.norm ℚ ξ = c}.Finite := by
  sorry

end NormForm

/-- **Mahler's theorem on the Thue–Mahler equation** (E19, ch. 8, Theorem 8.10): for a binary
form `F` with integer coefficients, of degree `n ≥ 3` and squarefree over `ℚ`, and a finite set `S`
of primes, the equation `|F(x, y)| = ∏_{p ∈ S} p^(z_p)` has only finitely many solutions with
`x, y` coprime and integer exponents `z_p`. -/
theorem finite_thueMahler (F : MvPolynomial (Fin 2) ℤ) {n : ℕ} (hn : 3 ≤ n)
    (hF : F.IsHomogeneous n) (hsq : Squarefree (MvPolynomial.map (Int.castRingHom ℚ) F))
    (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) :
    {xz : (ℤ × ℤ) × (S → ℤ) | IsCoprime xz.1.1 xz.1.2 ∧
      ((|MvPolynomial.eval ![xz.1.1, xz.1.2] F| : ℤ) : ℚ) =
        ∏ p : S, ((p : ℕ) : ℚ) ^ xz.2 p}.Finite := by
  sorry

/-- **Finiteness of the nondegenerate solutions of a unit equation** (E19, ch. 8, Theorem 8.13):
over a field of characteristic zero, for nonzero `α₁, …, αₙ` and a finitely generated subgroup
`Γ` of `K×`, only finitely many `x ∈ Γⁿ` solve `α₁x₁ + ⋯ + αₙxₙ = 1` with no vanishing subsum. -/
theorem finite_nondegenerate_solutions {K : Type*} [Field K] [CharZero K] {n : ℕ}
    (α : Fin n → K) (hα : ∀ i, α i ≠ 0) (Γ : Subgroup Kˣ) (hΓ : Γ.FG) :
    {x : Fin n → Γ | TauCeti.IsNondegenerateSolution α (fun i ↦ ((x i : Kˣ) : K))}.Finite := by
  sorry

/-- **The Evertse–Schlickewei–Schmidt bound** (ESS02, Theorem 1.1): over a field of
characteristic zero, for nonzero `a₁, …, aₙ` and a subgroup `Γ` of `(K×)ⁿ` of rank at most `r`,
the equation `a₁x₁ + ⋯ + aₙxₙ = 1` has at most `exp((6n)^(3n)(r + 1))` solutions `x ∈ Γ` with no
vanishing subsum. -/
theorem card_nondegenerate_solutions_le {K : Type*} [Field K] [CharZero K] {n : ℕ}
    (Γ : Subgroup (Fin n → Kˣ)) (r : ℕ) (hΓ : Module.rank ℤ (Additive Γ) ≤ r)
    (a : Fin n → Kˣ) (M : Finset (Fin n → Kˣ))
    (hM : ∀ x ∈ M, x ∈ Γ ∧
      TauCeti.IsNondegenerateSolution (fun i ↦ (a i : K)) (fun i ↦ (x i : K))) :
    (M.card : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n) * (r + 1)) := by
  sorry

/-- **The Skolem–Mahler–Lech theorem for simple recurrences** (E19, ch. 8, Theorem 8.18, proved
there in this case): a nonzero complex linear recurrence sequence whose characteristic polynomial
is separable, with nonzero roots and no quotient of distinct roots a root of unity, has only
finitely many zeros. -/
theorem skolem_mahler_lech_simple (E : _root_.LinearRecurrence ℂ)
    (hE : LinearRecurrence.IsNondegenerate E) (hsep : E.charPoly.Separable) (u : ℕ → ℂ)
    (hu : E.IsSolution u) (hu₀ : u ≠ 0) : {h : ℕ | u h = 0}.Finite := by
  sorry

/-- **The uniform bound for zeros of simple recurrences** (ESS02, Theorem 1.2, (1.18)): over a
field of characteristic zero, if `n ≥ 3`, all `aᵢ` and `αᵢ` are nonzero and no quotient `αᵢ/αⱼ`
with `i ≠ j` is a root of unity, the set of `m ∈ ℤ` with `∑ᵢ aᵢαᵢ^m = 0` is finite with at most
`exp((6n)^(3n))` elements. ESS02 state it over an algebraically closed field; embedding `K` into
its algebraic closure keeps the zero set and the hypotheses. -/
theorem ncard_zeros_simple_recurrence_le {K : Type*} [Field K] [CharZero K]
    {n : ℕ} (hn : 3 ≤ n) (a α : Fin n → K) (ha : ∀ i, a i ≠ 0) (hα : ∀ i, α i ≠ 0)
    (hnd : ∀ i j, i ≠ j → ¬ IsOfFinOrder (α i / α j)) :
    {m : ℤ | ∑ i, a i * α i ^ m = 0}.Finite ∧
      ({m : ℤ | ∑ i, a i * α i ^ m = 0}.ncard : ℝ) ≤ Real.exp ((6 * n : ℝ) ^ (3 * n)) := by
  sorry

/-- **The perturbed unit equation** (ESS02, Theorem 2.1, with the perturbation of §11, (11.19)):
for `n ≥ 2` and a subgroup `Γ` of `(ℚ̄×)ⁿ` of rank at most `r`, at most `exp((5n)^(3n)(r + 1))`
proper subspaces of `ℚ̄ⁿ` contain every product `y = x·z` with `x ∈ Γ`, `∑ᵢ yᵢ = 1` and
`h_aff(z) ≤ n⁻¹ exp(-(5n)^(3n)) (1 + h_aff(x))`, where `h_aff` is the absolute affine logarithmic
height `TauCeti.absoluteLogHeightAff`. -/
theorem absolutePerturbedUnitEquation {n : ℕ} (hn : 2 ≤ n)
    (Γ : Subgroup (Fin n → (AlgebraicClosure ℚ)ˣ)) (r : ℕ)
    (hΓ : Module.rank ℤ (Additive Γ) ≤ r) :
    ∃ T : Finset (Submodule (AlgebraicClosure ℚ) (Fin n → AlgebraicClosure ℚ)),
      (T.card : ℝ) ≤ Real.exp ((5 * n : ℝ) ^ (3 * n) * (r + 1)) ∧
      (∀ V ∈ T, V ≠ ⊤) ∧
      ∀ x ∈ Γ, ∀ z : Fin n → (AlgebraicClosure ℚ)ˣ,
        TauCeti.absoluteLogHeightAff (fun i => (z i : AlgebraicClosure ℚ)) ≤
          (n : ℝ)⁻¹ * Real.exp (-((5 * n : ℝ) ^ (3 * n))) *
            (1 + TauCeti.absoluteLogHeightAff (fun i => (x i : AlgebraicClosure ℚ))) →
        (∑ i, (x i : AlgebraicClosure ℚ) * (z i : AlgebraicClosure ℚ)) = 1 →
        ∃ V ∈ T, (fun i => (x i : AlgebraicClosure ℚ) * (z i : AlgebraicClosure ℚ)) ∈ V :=
  by sorry

section TwistedHeight

variable {K : Type*} [Field K] [NumberField K] {n : ℕ}

/-- The data `(L, c)` of the parametric Subspace theorem (EF13, (2.4)–(2.9)): `n ≥ 2`; at every
place `v` the `n` forms `L v` are linearly independent; only finitely many systems of forms occur;
the weights `c v` vanish outside a finite set of places; at every place they sum to zero; and the
maxima `maxᵢ c v i` sum to at most one over all places. -/
structure IsTwistedData (L : Place K → Fin n → Fin n → K) (c : Place K → Fin n → ℝ) : Prop where
  two_le : 2 ≤ n
  linearIndependent : ∀ v, LinearIndependent K (L v)
  finite_forms : (Set.range L).Finite
  finite_support : {v | c v ≠ 0}.Finite
  sum_eq_zero : ∀ v, ∑ i, c v i = 0
  sum_max_le_one : ∑ᶠ v, (⨆ i, c v i) ≤ 1

/-- **The parametric Subspace theorem** (EF13, Theorem 2.1), `K`-rational and qualitative in the
threshold: for data `(L, c)` satisfying `IsTwistedData` with at most `R` distinct forms and
`0 < δ ≤ 1`, there are `Q₀` and at most `10⁶ 2^(2n) n¹⁰ δ⁻³ log(3R/δ) log(log(3R)/δ)` proper
subspaces of `Kⁿ` such that, for every `Q ≥ Q₀`, the points of twisted height at most
`Δ_L^(1/n) Q^(-δ)` lie in one of them. -/
theorem parametric_subspace_theorem (L : Place K → Fin n → Fin n → K)
    (c : Place K → Fin n → ℝ) (hLc : IsTwistedData L c) {δ : ℝ} (hδ : 0 < δ) (hδ1 : δ ≤ 1)
    (R : ℕ) (hR : Nat.card (Set.range fun p : Place K × Fin n ↦ L p.1 p.2) ≤ R) :
    ∃ (Q₀ : ℝ) (T : Finset (Submodule K (Fin n → K))), (∀ V ∈ T, V ≠ ⊤) ∧
      (T.card : ℝ) ≤ 10 ^ 6 * 2 ^ (2 * n) * (n : ℝ) ^ 10 * δ ^ (-3 : ℝ) *
        Real.log (3 * R / δ) * Real.log (Real.log (3 * R) / δ) ∧
      ∀ Q, Q₀ ≤ Q → ∃ V ∈ T,
        {x | TauCeti.twistedHeight L c Q x ≤ TauCeti.deltaL L ^ ((1 : ℝ) / n) * Q ^ (-δ)} ⊆ V := by
  sorry

/-- **Evertse's sharp Roth lemma** (E96, §7, Lemma 23; E95), `K`-rational: let `m ≥ 2`,
`0 < Θ ≤ 1` and positive degrees with `d_h / d_(h+1) ≥ 2m²/Θ`. Let `F ≠ 0` be a polynomial over
`K` in `m` pairs of variables, homogeneous of degree `d_h` in the `h`-th pair, and let the nonzero
pairs `x_h ∈ K²` satisfy `H₂(x_h)^(d_h) ≥ (e^(d₁ + ⋯ + d_m) H₂(F))^((3m²/Θ)^m)`, with `H₂` the
absolute Euclidean height `TauCeti.height2`. Then `F` has index less than `mΘ` at `x`: some
partial derivative `∂^i F` with `∑_h (i_(h,0) + i_(h,1)) / d_h < mΘ` does not vanish at `x`
(dividing by factorials does not affect nonvanishing in characteristic zero). -/
theorem sharp_roths_lemma {m : ℕ} (hm : 2 ≤ m) (d : Fin m → ℕ) (hd : ∀ h, 0 < d h) {Θ : ℝ}
    (hΘ : 0 < Θ) (hΘ1 : Θ ≤ 1)
    (hdd : ∀ h h' : Fin m, h'.val = h.val + 1 → 2 * (m : ℝ) ^ 2 / Θ ≤ (d h : ℝ) / d h')
    (F : MvPolynomial (Fin m × Fin 2) K) (hF : F ≠ 0)
    (hFh : ∀ μ ∈ F.support, ∀ h, μ (h, 0) + μ (h, 1) = d h) (x : Fin m → Fin 2 → K)
    (hx : ∀ h, x h ≠ 0)
    (hH : ∀ h, (Real.exp (∑ h, (d h : ℝ)) *
        TauCeti.height2 (fun μ : F.support ↦ F.coeff μ)) ^
          ((3 * (m : ℝ) ^ 2 / Θ) ^ m) ≤
        TauCeti.height2 (x h) ^ d h) :
    ∃ i : Fin m × Fin 2 → ℕ, ∑ h, ((i (h, 0) + i (h, 1) : ℕ) : ℝ) / d h < m * Θ ∧
      MvPolynomial.eval (fun p ↦ x p.1 p.2)
        (((Finset.univ : Finset (Fin m × Fin 2)).toList.map fun p ↦
          (MvPolynomial.pderiv p).toLinearMap ^ i p).prod F) ≠ 0 := by
  sorry

/-- **The absolute quantitative Subspace theorem for systems** (EF13, Theorem 3.1): fix for every
place `v` of `K` an extension `w v` to `K̄` of the degree-normalized absolute value `‖·‖_v`. Let
`n ≥ 2`, let `S` be a finite set of places and, at each `v ∈ S`, let `L v` be `n` linearly
independent linear forms with coefficients in `K̄`, each of inhomogeneous absolute height
`H(1, L v i) ≤ H*` and generating an extension of `K` of degree at most `D`, with at most `R`
distinct forms in all; let the exponents `d v i ≤ 0` sum to `-n - ε` with `0 < ε ≤ 1`. Then the
points `x ∈ K̄ⁿ` with `H(x) ≥ max((H*)^(1/(3RD)), n^(n/ε))` that satisfy
`‖L v i (σ x)‖_v ≤ ‖σ x‖_v ‖det L v‖_v^(1/n) H(x)^(d v i)` for every `v ∈ S`, every `i` and every
`σ ∈ Gal(K̄/K)` lie in at most `10⁹ 2^(2n) n¹⁴ ε⁻³ log(3RD/ε) log(log(3RD)/ε)` proper subspaces of
`K̄ⁿ` defined over `K`. Here `H` is the absolute projective height
`TauCeti.absoluteProjectiveTupleHeight` and `‖·‖_v` on vectors is the maximum of the coordinates.
-/
theorem subspace_theorem_for_systems [NeZero n] (hn : 2 ≤ n)
    (w : Place K → AbsoluteValue (AlgebraicClosure K) ℝ)
    (hw : ∀ v (a : K), w v (algebraMap K (AlgebraicClosure K) a) = normAbs v a)
    (S : Finset (Place K)) (L : Place K → Fin n → Fin n → AlgebraicClosure K)
    (hL : ∀ v ∈ S, LinearIndependent (AlgebraicClosure K) (L v)) (Hs : ℝ)
    (hHs : ∀ v ∈ S, ∀ i, TauCeti.absoluteProjectiveTupleHeight
      (Fin.cons 1 (L v i) : Fin (n + 1) → AlgebraicClosure K) ≤ Hs)
    (D : ℕ) (hD : ∀ v ∈ S, ∀ i,
      Module.finrank K (IntermediateField.adjoin K (Set.range (L v i))) ≤ D)
    (R : ℕ) (hR : Nat.card (Set.range fun p : S × Fin n ↦ L p.1 p.2) ≤ R)
    (d : Place K → Fin n → ℝ) {ε : ℝ} (hε : 0 < ε) (hε1 : ε ≤ 1)
    (hd : ∑ v ∈ S, ∑ i, d v i = -(n : ℝ) - ε) (hd0 : ∀ v ∈ S, ∀ i, d v i ≤ 0) :
    ∃ T : Finset (Submodule K (Fin n → K)), (∀ V ∈ T, V ≠ ⊤) ∧
      (T.card : ℝ) ≤ 10 ^ 9 * 2 ^ (2 * n) * (n : ℝ) ^ 14 * ε ^ (-3 : ℝ) *
        Real.log (3 * R * D / ε) * Real.log (Real.log (3 * R * D) / ε) ∧
      ∀ x : Fin n → AlgebraicClosure K, x ≠ 0 →
        max (Hs ^ ((1 : ℝ) / (3 * R * D))) ((n : ℝ) ^ ((n : ℝ) / ε)) ≤
          TauCeti.absoluteProjectiveTupleHeight x →
        (∀ v ∈ S, ∀ i, ∀ σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K,
          w v (L v i ⬝ᵥ (fun j ↦ σ (x j))) ≤
            (⨆ j, w v (σ (x j))) * w v (Matrix.of fun i j ↦ L v i j).det ^ ((1 : ℝ) / n) *
              TauCeti.absoluteProjectiveTupleHeight x ^ d v i) →
        ∃ V ∈ T, x ∈ Submodule.span (AlgebraicClosure K)
          ((fun y : Fin n → K ↦ fun j ↦ algebraMap K (AlgebraicClosure K) (y j)) '' V) := by
  sorry

end TwistedHeight

end DiophantineApproximation

/-! ## Layer 3: transcendence and logarithmic forms -/

section Transcendence

open Complex

namespace Transcendence

/-- **The Hermite–Lindemann theorem** (E19, ch. 4, Corollary 4.9(i); W00, Theorem 1.2): the
exponential of a nonzero algebraic number is transcendental. -/
theorem transcendental_exp_of_isAlgebraic {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : α ≠ 0) :
    Transcendental ℚ (exp α) := sorry

/-- **Lindemann's theorem** (E19, ch. 4, Corollary 4.9(ii)): `π` is transcendental. -/
theorem transcendental_pi : Transcendental ℚ Real.pi := sorry

end Transcendence

namespace GelfondSchneider

/-- **The Gelfond–Schneider theorem** for an arbitrary nonzero logarithm (E19, ch. 4,
Theorem 4.16; W00, Theorem 1.4 in its exponential form): if `exp l` is algebraic, `l ≠ 0` and `β`
is algebraic but not rational, then `exp (β l)` is transcendental. The branch of the logarithm is
arbitrary, so `exp l = 1` with `l = 2πi` is allowed. -/
theorem transcendental_exp_mul {l : ℂ} (hl : l ∈ TauCeti.algebraicLogs) (hl0 : l ≠ 0) {β : ℂ}
    (hβ : IsAlgebraic ℚ β) (hβq : ∀ q : ℚ, β ≠ q) : Transcendental ℚ (exp (β * l)) := sorry

end GelfondSchneider

namespace Baker

/-- **The criterion of Schneider–Lang for `ℂ^{d₀} × (ℂ^×)^{d₁}`** (W00, Corollary 4.2): let
`d₀ ≤ n < d₀ + d₁`, let `x₁, …, x_{d₁}` be `ℚ`-linearly independent vectors of algebraic numbers
in `ℂⁿ` and let `y₁, …, yₙ` be a basis of `ℂⁿ`. Then one of the coordinates `y_{hj}` with
`h < d₀`, or one of the exponentials `exp (xᵢ · yⱼ)`, is transcendental. -/
theorem schneiderLang {n d₀ d₁ : ℕ} (hd₀ : d₀ ≤ n) (hn : n < d₀ + d₁)
    (x : Fin d₁ → Fin n → ℂ) (hxalg : ∀ i ν, IsAlgebraic ℚ (x i ν))
    (hx : LinearIndependent ℚ x) (y : Fin n → Fin n → ℂ) (hy : LinearIndependent ℂ y) :
    (∃ (h j : Fin n), (h : ℕ) < d₀ ∧ Transcendental ℚ (y j h)) ∨
      ∃ (i : Fin d₁) (j : Fin n), Transcendental ℚ (exp (∑ ν, x i ν * y j ν)) := sorry

/-- **Baker's theorem**, general case (W00, Theorem 1.6): if the logarithms `l₁, …, lₙ` of
algebraic numbers are linearly independent over `ℚ`, then `1, l₁, …, lₙ` are linearly
independent over the algebraic numbers `integralClosure ℚ ℂ`. -/
theorem linearIndependent_cons_one_of_linearIndependent_rat {n : ℕ} (l : Fin n → ℂ)
    (hl : ∀ i, l i ∈ TauCeti.algebraicLogs) (hind : LinearIndependent ℚ l) :
    LinearIndependent (integralClosure ℚ ℂ) (Fin.cons (1 : ℂ) l : Fin (n + 1) → ℂ) := sorry

end Baker

namespace LogarithmicForms

/-- **Waldschmidt's lower bound for linear forms in logarithms** (W00, Theorem 9.1 with
`C(m) = 2^(m+25) m^(3m+9)`, and Proposition 9.18): for `ℚ`-linearly independent logarithms
`l₁, …, l_m` of algebraic numbers and algebraic `β₀, β₁, …, β_m`, not all zero, generating with the
`exp l_j` a field of degree `D`, and parameters `A_j, B, E, E*` satisfying either the general
height conditions or the integer-coefficient conditions of the theorem, the form
`Λ = β₀ + ∑ⱼ βⱼ lⱼ` is nonzero and
`|Λ| > exp(-C(m) D^(m+2) log B (∏ⱼ log A_j) log E* (log E)^(-m-1))`. -/
theorem waldschmidt_measure {m : ℕ} (hm : 1 ≤ m) (l : Fin m → ℂ) (hl : ∀ j, l j ∈ TauCeti.algebraicLogs)
    (hind : LinearIndependent ℚ l) (β₀ : ℂ) (β : Fin m → ℂ) (hβ₀ : IsAlgebraic ℚ β₀)
    (hβ : ∀ j, IsAlgebraic ℚ (β j)) (hne : β₀ ≠ 0 ∨ β ≠ 0) (D : ℕ)
    (hD : D = Module.finrank ℚ (IntermediateField.adjoin ℚ
      (Set.range (fun j ↦ exp (l j)) ∪ Set.range β ∪ {β₀})))
    (B E Estar : ℝ) (A : Fin m → ℝ) (hB : Real.exp 1 ≤ B) (hE : Real.exp 1 ≤ E)
    (hEstar : Real.exp 1 ≤ Estar)
    (hA : ∀ j, max (absLogHeight₁ (exp (l j))) (max (E * ‖l j‖ / D) (Real.log E / D)) ≤
      Real.log (A j))
    (hEs : max (Real.log E / D) (Real.log (D / Real.log E)) ≤ Real.log Estar) (hBE : Estar ≤ B)
    (hcase : ((∀ j, D * Real.log (A j) / Real.log E ≤ B) ∧ absLogHeight₁ β₀ ≤ Real.log B ∧
        ∀ j, absLogHeight₁ (β j) ≤ Real.log B) ∨
      (β₀ = 0 ∧ (∀ j, ∃ b : ℤ, β j = b) ∧ β ⟨m - 1, by omega⟩ ≠ 0 ∧
        ∀ j : Fin m, (j : ℕ) < m - 1 → (‖β ⟨m - 1, by omega⟩‖ / Real.log (A j) +
          ‖β j‖ / Real.log (A ⟨m - 1, by omega⟩)) * Real.log E / D ≤ B)) :
    β₀ + ∑ j, β j * l j ≠ 0 ∧
      Real.exp (-(2 ^ (m + 25) * (m : ℝ) ^ (3 * m + 9)) * (D : ℝ) ^ (m + 2) * Real.log B *
          (∏ j, Real.log (A j)) * Real.log Estar * Real.log E ^ (-((m : ℤ) + 1))) <
        ‖β₀ + ∑ j, β j * l j‖ := sorry

/-- **Baker's theorem on linear forms in logarithms** (E19, ch. 5, Theorem 5.2): for fixed
logarithms `l₁, …, l_m` of algebraic numbers and a degree bound `D`, there is `C > 0` such that
every nonzero `γ + ∑ᵢ βᵢ lᵢ` with algebraic `γ, βᵢ` of degree at most `D` and absolute heights at
most `B ≥ 1` has modulus at least `(eB)^(-C)`. -/
theorem baker_lower_bound {m : ℕ} (l : Fin m → ℂ) (hl : ∀ j, l j ∈ TauCeti.algebraicLogs) (D : ℕ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (γ : ℂ) (β : Fin m → ℂ) (B : ℝ), IsAlgebraic ℚ γ →
      (∀ i, IsAlgebraic ℚ (β i)) → (minpoly ℚ γ).natDegree ≤ D →
      (∀ i, (minpoly ℚ (β i)).natDegree ≤ D) → 1 ≤ B → absMulHeight₁ γ ≤ B →
      (∀ i, absMulHeight₁ (β i) ≤ B) → γ + ∑ i, β i * l i ≠ 0 →
      (Real.exp 1 * B) ^ (-C) ≤ ‖γ + ∑ i, β i * l i‖ := sorry

open Classical in
/-- **Matveev's theorem** (Matveev, §2, Corollary 2.3): for a number field `K ⊆ ℂ` of degree `D`,
nonzero logarithms `l_j` of `α_j ∈ K×`, integers `b_j` with `Λ = ∑ⱼ b_j l_j ≠ 0` and
`A_j ≥ max(D h(α_j), |l_j|, 0.16)`, one has
`log|Λ| > -C₁(n, κ) D² A₁⋯Aₙ log(eD) log(eB)` with `B = maxⱼ |b_j|`, `κ = 1` for a real field and
`κ = 2` otherwise, and `C₁(n, κ) = min(κ⁻¹ (en/2)^κ 30^(n+3) n^3.5, 2^(6n+20))`. -/
theorem matveev {n : ℕ} (hn : 1 ≤ n) {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ)
    (α : Fin n → K) (l : Fin n → ℂ) (hl : ∀ j, exp (l j) = ι (α j)) (hl0 : ∀ j, l j ≠ 0)
    (b : Fin n → ℤ) (hΛ : ∑ j, (b j : ℂ) * l j ≠ 0) (A : Fin n → ℝ)
    (hA : ∀ j, max (Module.finrank ℚ K * absLogHeight₁ (α j)) (max ‖l j‖ 0.16) ≤ A j)
    (κ : ℕ) (hκ : κ = if ∀ x : K, (ι x).im = 0 then 1 else 2) :
    -(min ((1 / (κ : ℝ)) * (Real.exp 1 * n / 2) ^ κ * 30 ^ (n + 3) * (n : ℝ) ^ (3.5 : ℝ))
          (2 ^ (6 * n + 20))) * (Module.finrank ℚ K : ℝ) ^ 2 * (∏ j, A j) *
        Real.log (Real.exp 1 * Module.finrank ℚ K) *
        Real.log (Real.exp 1 * ((Finset.univ.sup fun j ↦ (b j).natAbs : ℕ) : ℝ)) <
      Real.log ‖∑ j, (b j : ℂ) * l j‖ := sorry

/-- **The Laurent–Mignotte–Nesterenko bound for two logarithms** (E19, ch. 5, Exercise 5.4): for
positive rationals `a₁, a₂ ≠ 1` and nonzero integers `b₁, b₂` with
`Λ = b₁ log a₁ - b₂ log a₂ ≠ 0`,
`log|Λ| ≥ -24.34 (max(log(|b₁|/log H(a₂) + |b₂|/log H(a₁)) + 0.14, 21))² log H(a₁) log H(a₂)`,
with `H` the height of a rational number. -/
theorem laurent_mignotte_nesterenko (a₁ a₂ : ℚ) (h₁ : 0 < a₁) (h₂ : 0 < a₂) (h₁' : a₁ ≠ 1)
    (h₂' : a₂ ≠ 1) (b₁ b₂ : ℤ) (hb₁ : b₁ ≠ 0) (hb₂ : b₂ ≠ 0)
    (hΛ : b₁ * Real.log a₁ - b₂ * Real.log a₂ ≠ 0) :
    let H₁ : ℝ := max a₁.num.natAbs a₁.den
    let H₂ : ℝ := max a₂.num.natAbs a₂.den
    (-24.34) * (max (Real.log (abs (b₁ : ℝ) / Real.log H₂ + abs (b₂ : ℝ) / Real.log H₁) + 0.14) 21) ^ 2 *
        Real.log H₁ * Real.log H₂ ≤ Real.log (abs (b₁ * Real.log a₁ - b₂ * Real.log a₂)) := sorry

/-- Yu's explicit `𝔭`-adic bound (Compositio 91 (1994), §0.1), stated through the `𝔭`-adic
absolute value with base `N𝔭 = p^{f_𝔭}`: `ord_𝔭(Λ) < Φ log(dB)`. -/
theorem yu {K : Type*} [Field K] [NumberField K] (ι : K →+* ℂ) {n : ℕ} (hn : 2 ≤ n)
    (α : Fin n → K) (hα : ∀ j, α j ≠ 0) (hgen : IntermediateField.adjoin ℚ (Set.range α) = ⊤)
    (p : ℕ) [Fact p.Prime] (v : IsDedekindDomain.HeightOneSpectrum (𝓞 K))
    (hv : (p : 𝓞 K) ∈ v.asIdeal) (hb1 : 1 < ((Ideal.absNorm v.asIdeal : ℕ) : NNReal))
    (b : Fin n → ℤ) (hΛ : ∏ j, α j ^ b j ≠ 1) (h : Fin n → ℝ)
    (hh : ∀ j, max (absLogHeight₁ (α j))
      (max (‖Complex.log (ι (α j))‖ / (10 * Module.finrank ℚ K)) (Real.log p)) ≤ h j) :
    let d : ℝ := Module.finrank ℚ K
    let B : ℝ := max ((Finset.univ.sup fun j ↦ (b j).natAbs : ℕ) : ℝ) 3
    let h' : ℝ := max (Finset.univ.sup' ⟨⟨0, by omega⟩, Finset.mem_univ _⟩ h) 1
    let Φ : ℝ := 22000 * (9.5 * (n + 1) * d / Real.sqrt (Real.log p)) ^ (2 * (n + 1)) *
      ((Ideal.absNorm v.asIdeal : ℝ) - 1) * (∏ j, h j) * Real.log (10 * n * d * h')
    ((Ideal.absNorm v.asIdeal : ℕ) : ℝ) ^ (-(Φ * Real.log (d * B))) <
      v.adicAbv hb1 (∏ j, α j ^ b j - 1) := sorry

end LogarithmicForms

namespace Transcendence

/-- Schanuel's conjecture, as a proposition (never assumed). -/
def SchanuelConjecture : Prop :=
  ∀ (n : ℕ) (x : Fin n → ℂ), LinearIndependent ℚ x →
    (n : Cardinal) ≤ Algebra.trdeg ℚ
      (IntermediateField.adjoin ℚ (Set.range x ∪ Set.range (fun i ↦ exp (x i))))

/-- Schanuel's conjecture implies that `e` and `π` are algebraically independent over `ℚ`. -/
theorem SchanuelConjecture.algebraicIndependent_exp_one_pi (h : SchanuelConjecture) :
    AlgebraicIndependent ℚ ![exp 1, (Real.pi : ℂ)] := sorry

/-- Schanuel's conjecture implies that logarithms of algebraic numbers that are linearly
independent over `ℚ` are algebraically independent over `ℚ`. -/
theorem SchanuelConjecture.algebraicIndependent_of_mem_algebraicLogs (h : SchanuelConjecture)
    {n : ℕ} {l : Fin n → ℂ} (hl : ∀ i, l i ∈ TauCeti.algebraicLogs) (hind : LinearIndependent ℚ l) :
    AlgebraicIndependent ℚ l := sorry

end Transcendence

end Transcendence

/-! ## Layer 4: effective Diophantine equations -/

section Effective

open NumberField.Units NumberField.InfinitePlace NumberField.Units.dirichletUnitTheorem
open scoped Classical

namespace DiophantineApproximation

/-- **Exponential equations `a^m - b^n = k`** (E19, ch. 5, Corollary 5.5, made explicit): for
integers `a, b ≥ 2` and `k ≠ 0` the equation has only finitely many solutions in positive
integers, and each satisfies
`max(m, n) ≤ 2(log|k| + C₁)/log 2 + 2(C₁/log 2)(log(2C₁/log 2) - 1)` with
`C₁ = 1 + (e/2) 2^4.5 30⁵ max(1, log a) max(1, log b)`, the constant of Matveev's Corollary 2.3
for two rational numbers (`κ = 1`, `D = 1`) through the rational bound of README §3.6. -/
theorem pow_sub_pow_eq_finite {a b : ℕ} (ha : 2 ≤ a) (hb : 2 ≤ b) {k : ℤ} (hk : k ≠ 0) :
    {mn : ℕ × ℕ | 0 < mn.1 ∧ 0 < mn.2 ∧ (a : ℤ) ^ mn.1 - (b : ℤ) ^ mn.2 = k}.Finite ∧
      ∀ mn ∈ {mn : ℕ × ℕ | 0 < mn.1 ∧ 0 < mn.2 ∧ (a : ℤ) ^ mn.1 - (b : ℤ) ^ mn.2 = k},
        let C₁ : ℝ := 1 + Real.exp 1 / 2 * 2 ^ (4.5 : ℝ) * 30 ^ 5 *
          max 1 (Real.log a) * max 1 (Real.log b)
        (max mn.1 mn.2 : ℝ) ≤ 2 * (Real.log |(k : ℝ)| + C₁) / Real.log 2 +
          2 * (C₁ / Real.log 2) * (Real.log (2 * C₁ / Real.log 2) - 1) := sorry

/-- **Tijdeman's gap theorem** (E19, ch. 5, Theorem 5.6 and its proof, made explicit): for a
finite set `S` of `t` primes put `C = 1 + (e/2) t^4.5 30^(t+3) ∏_{p ∈ S} max(1, log p)`, the
constant of Matveev's Corollary 2.3 for the rationals `p ∈ S` through the rational bound of
README §3.6, plus one for its factor `2/3`. Any two positive integers `x < y` composed of primes
in `S` satisfy `y - x ≥ y (e log y / log 2)^(-C)`, that is `y - x ≥ y / (c₁ (log y)^c₂)` with
`c₁ = (e / log 2)^C` and `c₂ = C`. -/
theorem tijdeman_gap (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) {x y : ℕ}
    (hx : x ∈ Nat.factoredNumbers S) (hy : y ∈ Nat.factoredNumbers S) (hxy : x < y) :
    let C : ℝ := 1 + Real.exp 1 / 2 * (S.card : ℝ) ^ (4.5 : ℝ) * 30 ^ (S.card + 3) *
      ∏ p ∈ S, max 1 (Real.log p)
    (y : ℝ) * (Real.exp 1 * Real.log y / Real.log 2) ^ (-C) ≤ y - x := sorry

/-- **The effective unit equation** (README §4.3): let `K` have unit rank `r ≥ 1` with a system
`u` of `r` independent units, and suppose that for every embedding `σ`, every `γ` that is a
root-of-unity multiple of `α` or `β` and every exponent vector `k` with `σ(γ uᵏ) ≠ 1`, the
Baker-type bound `|σ(γ uᵏ) - 1| ≥ (e·max(1, maxⱼ |kⱼ|))^(-C′)` holds. Then every solution of
`αx + βy = 1` in units `x = ζ_x u^(k_x)`, `y = ζ_y u^(k_y)` has exponents of size at most
`max(1, 2A + 2B(log(2B) - 1))`, where `A` and `B` are explicit in `C′`, the degree, the houses of
`α` and `β` and the norm of the coordinate map of the logarithmic-embedding basis of `u`. -/
theorem unitEquation_exponent_bound {K : Type*} [Field K] [NumberField K]
    {u : Fin (rank K) → (𝓞 K)ˣ} (hu : IsMaxRank u) (hr : 1 ≤ rank K)
    {α β : K} (hα : α ≠ 0) (hβ : β ≠ 0) {C' : ℝ} (hC' : 0 < C')
    (hLB : ∀ (σ : K →+* ℂ) (γ : K), (∃ ζ ∈ torsion K, γ = α * (ζ : K) ∨ γ = β * (ζ : K)) →
      ∀ e : Fin (rank K) → ℤ, σ (γ * ∏ j, ((u j : 𝓞 K) : K) ^ e j) ≠ 1 →
        (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (e j).natAbs : ℕ) : ℝ)) ^ (-C') ≤
          ‖σ (γ * ∏ j, ((u j : 𝓞 K) : K) ^ e j) - 1‖)
    (x y : (𝓞 K)ˣ) (hxy : α * (x : K) + β * (y : K) = 1)
    (ζx ζy : (𝓞 K)ˣ) (hζx : ζx ∈ torsion K) (hζy : ζy ∈ torsion K)
    (ex ey : Fin (rank K) → ℤ) (hx : x = ζx * ∏ j, u j ^ ex j) (hy : y = ζy * ∏ j, u j ^ ey j) :
    let d : ℝ := Module.finrank ℚ K
    let κ : ℝ := 2 * (d - 1) *
      ‖((basisOfIsMaxRank hu).equivFunL : logSpace K →L[ℝ] (Fin (rank K) → ℝ))‖
    let A : ℝ := κ * (d - 1) * (Real.log (max (TauCeti.house α) (TauCeti.house β)) + C')
    let B : ℝ := κ * (d - 1) * C'
    ((Finset.univ.sup fun j => max (ex j).natAbs (ey j).natAbs : ℕ) : ℝ) ≤
      max 1 (2 * A + 2 * B * (Real.log (2 * B) - 1)) := sorry

/-- **Baker's theorem on superelliptic equations** (E19, ch. 5, Theorem 5.14), with the explicit
bounds of Bérczes–Evertse–Győry (BEG13, Theorems 2.1 and 2.2 at `K = ℚ`, `S = {∞}`): for
`f ∈ ℤ[X]` separable over `ℚ` of degree `N`, `n ≥ 2` with `N ≥ 2` if `n ≥ 3` and `N ≥ 3` if
`n = 2`, and an integer `b ≠ 0`, the equation `b yⁿ = f(x)` has only finitely many integer
solutions. With `ĥ = log max(1, |b|, max |coefficients of f|)`, every solution satisfies
`log max(1, |x|), log max(1, |y|) ≤ (6N)^(14 n³ N³) e^(8 n² N³ ĥ)` if `n ≥ 3`, and
`≤ (4N)^(2¹² N⁴) e^(50 N⁴ ĥ)` if `n = 2`. -/
theorem baker_superelliptic {f : Polynomial ℤ} (hsep : (f.map (Int.castRingHom ℚ)).Separable)
    {n : ℕ} (hn : 2 ≤ n) (hdeg : (3 ≤ n → 2 ≤ f.natDegree) ∧ (n = 2 → 3 ≤ f.natDegree))
    {b : ℤ} (hb : b ≠ 0) :
    let N : ℝ := f.natDegree
    let h : ℝ := Real.log (max 1 (max |(b : ℝ)|
      ((f.support.sup fun i ↦ (f.coeff i).natAbs : ℕ) : ℝ)))
    let B : ℝ := if 3 ≤ n then (6 * N) ^ (14 * (n : ℝ) ^ 3 * N ^ 3) *
        Real.exp (8 * (n : ℝ) ^ 2 * N ^ 3 * h)
      else (4 * N) ^ (2 ^ 12 * N ^ 4) * Real.exp (50 * N ^ 4 * h)
    {p : ℤ × ℤ | b * p.2 ^ n = f.eval p.1}.Finite ∧
      ∀ x y : ℤ, b * y ^ n = f.eval x →
        Real.log (max 1 |(x : ℝ)|) ≤ B ∧ Real.log (max 1 |(y : ℝ)|) ≤ B := sorry

/-- **The Schinzel–Tijdeman theorem** (E19, ch. 5, Theorem 5.15), with the explicit bound of
Bérczes–Evertse–Győry (BEG13, Theorem 2.3 at `K = ℚ`, `S = {∞}`): for `f ∈ ℤ[X]` separable over
`ℚ` of degree `N ≥ 2` and an integer `b ≠ 0`, every exponent `n` of an integer solution of
`b yⁿ = f(x)` with `y ∉ {0, 1, -1}` satisfies `n ≤ (10 N²)^(40 N) e^(11 N ĥ)`, where
`ĥ = log max(1, |b|, max |coefficients of f|)`. -/
theorem schinzel_tijdeman {f : Polynomial ℤ} (hsep : (f.map (Int.castRingHom ℚ)).Separable)
    (hdeg : 2 ≤ f.natDegree) {b : ℤ} (hb : b ≠ 0) :
    let N : ℝ := f.natDegree
    let h : ℝ := Real.log (max 1 (max |(b : ℝ)|
      ((f.support.sup fun i ↦ (f.coeff i).natAbs : ℕ) : ℝ)))
    ∀ (n : ℕ) (x y : ℤ), b * y ^ n = f.eval x → y ≠ 0 → y ≠ 1 → y ≠ -1 →
      (n : ℝ) ≤ (10 * N ^ 2) ^ (40 * N) * Real.exp (11 * N * h) := sorry

/-- **Tijdeman's theorem on Catalan's equation** (E19, ch. 5, §5.1, p. 88): there is a constant
`C` with `x^m, y^n ≤ C` for every solution of `x^m - y^n = 1` in integers `x, y, m, n ≥ 2`.
Tijdeman's `C` is effectively computable; this statement records only its existence. -/
theorem tijdeman_catalan :
    ∃ C : ℕ, ∀ x y m n : ℕ, 2 ≤ x → 2 ≤ y → 2 ≤ m → 2 ≤ n →
      (x : ℤ) ^ m - (y : ℤ) ^ n = 1 → x ^ m ≤ C ∧ y ^ n ≤ C := sorry

/-- **The effective rational `S`-unit equation** (README §4.5): if every `±∏_{q ∈ S} q^(b_q) ≠ 1`
with `b_p = 0` satisfies the `p`-adic bound `|±∏ q^(b_q) - 1|_p ≥ (e max(1, |b|))^(-C)` at every
`p ∈ S`, then every solution of `x + y = 1` in `S`-units has
`|v_p(x)|, |v_p(y)| ≤ max(1, (2C/log 2) log(2C/log 2))` at every prime `p`. -/
theorem sUnitEquation_exponent_bound (S : Finset ℕ) (hS : ∀ p ∈ S, p.Prime) {C : ℝ}
    (hC : 0 < C)
    (hLB : ∀ p ∈ S, ∀ (ε : ℤˣ) (b : S → ℤ), (∀ hp : p ∈ S, b ⟨p, hp⟩ = 0) →
      (ε : ℚ) * ∏ q : S, ((q : ℕ) : ℚ) ^ b q ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun q => (b q).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        ((padicNorm p ((ε : ℚ) * ∏ q : S, ((q : ℕ) : ℚ) ^ b q - 1) : ℚ) : ℝ))
    (x y : ℚˣ) (hx : x ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ)) (hy : y ∈ (Set.unit {v : IsDedekindDomain.HeightOneSpectrum (𝓞 ℚ) | (Rat.HeightOneSpectrum.primesEquiv v).1 ∈ S} ℚ)) (hxy : (x : ℚ) + y = 1)
    (p : ℕ) :
    (|padicValRat p (x : ℚ)| : ℝ) ≤ max 1 (2 * C / Real.log 2 * Real.log (2 * C / Real.log 2)) ∧
      (|padicValRat p (y : ℚ)| : ℝ) ≤
        max 1 (2 * C / Real.log 2 * Real.log (2 * C / Real.log 2)) := sorry

/-- **The effective `S`-unit equation over a number field** (README §4.5): let `γ₁, …, γ_t` be
`S`-units of `K` and `κ > 0` with `|z_j| ≤ κ h(ζ γᶻ)` for every root of unity `ζ` and every
exponent vector `z`. Suppose that for every `c` that is a root-of-unity multiple of `a` or `b`
and every `z` with `c γᶻ ≠ 1`, the archimedean bounds `|σ(c γᶻ) - 1| ≥ (e·max(1, maxⱼ |zⱼ|))^(-C)`
and the `v`-adic bounds `|c γᶻ - 1|_v ≥ (e·max(1, maxⱼ |zⱼ|))^(-C)` for `v ∈ S` hold. Then every
solution of `ax + by = 1` with `x = ζ_x γ^(z_x)` and `y = ζ_y γ^(z_y)` has exponents of size at
most `max(1, 2A + 2B(log(2B) - 1))`, with `A` and `B` explicit in `κ`, `C`, the number of places
in `S` and at infinity, and the sizes of `a` and `b`. -/
theorem gyoryEquation_exponent_bound {K : Type*} [Field K] [NumberField K] {t : ℕ}
    (γ : Fin t → K) (hγ0 : ∀ j, γ j ≠ 0) (S : Finset (FinitePlace K))
    (hS : ∀ j, ∀ v : FinitePlace K, v ∉ S → v (γ j) = 1) {κ : ℝ} (hκ : 0 < κ)
    (hκbound : ∀ (ζ : K), (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) → ∀ (z : Fin t → ℤ) (j : Fin t),
      |(z j : ℝ)| ≤ κ * Height.logHeight₁ (ζ * ∏ i, γ i ^ z i))
    {a b : K} (ha : a ≠ 0) (hb : b ≠ 0) {C : ℝ} (hC : 0 < C)
    (hLBinf : ∀ (σ : K →+* ℂ) (c : K), (∃ ζ : K, (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) ∧
        (c = a * ζ ∨ c = b * ζ)) → ∀ z : Fin t → ℤ, c * ∏ j, γ j ^ z j ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (z j).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        ‖σ (c * ∏ j, γ j ^ z j) - 1‖)
    (hLBfin : ∀ v ∈ S, ∀ (c : K), (∃ ζ : K, (∃ n : ℕ, 0 < n ∧ ζ ^ n = 1) ∧
        (c = a * ζ ∨ c = b * ζ)) → ∀ z : Fin t → ℤ, c * ∏ j, γ j ^ z j ≠ 1 →
      (Real.exp 1 * max 1 ((Finset.univ.sup fun j => (z j).natAbs : ℕ) : ℝ)) ^ (-C) ≤
        v (c * ∏ j, γ j ^ z j - 1))
    (ζx ζy : K) (hζx : ∃ n : ℕ, 0 < n ∧ ζx ^ n = 1) (hζy : ∃ n : ℕ, 0 < n ∧ ζy ^ n = 1)
    (zx zy : Fin t → ℤ)
    (hxy : a * (ζx * ∏ j, γ j ^ zx j) + b * (ζy * ∏ j, γ j ^ zy j) = 1) :
    let s : ℝ := S.card + Fintype.card (InfinitePlace K)
    let M : ℝ := max (max (TauCeti.house a) (TauCeti.house b)) (⨆ v ∈ S, max (v a) (v b))
    let A : ℝ := 2 * κ * s * (Real.log M + C)
    let B : ℝ := 2 * κ * s * C
    ((Finset.univ.sup fun j => max (zx j).natAbs (zy j).natAbs : ℕ) : ℝ) ≤
      max 1 (2 * A + 2 * B * (Real.log (2 * B) - 1)) := sorry

end DiophantineApproximation

end Effective

/-! ## Layer 5: special functions and functional transcendence -/

section SpecialFunctions

open scoped RatFunc LaurentSeries Classical
open PowerSeries

namespace DiophantineApproximation

/-- The power series `∑ a n zⁿ / n!`. -/
def ePowerSeries (a : ℕ → ℂ) : PowerSeries ℂ := PowerSeries.mk fun n => a n / n.factorial

/-- The entire function `z ↦ ∑ a n zⁿ / n!`. -/
def eFun (a : ℕ → ℂ) (z : ℂ) : ℂ := ∑' n, a n * z ^ n / n.factorial

/-- Siegel's E-functions (in the geometric normalisation of Shidlovskii, André and Beukers):
algebraic coefficients, a linear differential equation over `Q̄(z)`, and coefficients whose
conjugates and common denominators grow at most geometrically. -/
structure IsEFunction (a : ℕ → ℂ) : Prop where
  isAlgebraic : ∀ n, IsAlgebraic ℚ (a n)
  isDFinite : PowerSeries.IsDFinite (algebraicClosure ℚ ℂ) (ePowerSeries a)
  size_le : ∃ C : ℝ, 0 < C ∧ ∀ n, ∀ z ∈ (minpoly ℚ (a n)).aroots ℂ, ‖z‖ ≤ C ^ (n + 1)
  den_le : ∃ D : ℝ, 0 < D ∧ ∃ d : ℕ → ℕ, ∀ n, 1 ≤ d n ∧ (d n : ℝ) ≤ D ^ (n + 1) ∧
    ∀ m ≤ n, IsIntegral ℤ ((d n : ℂ) * a m)

/-- Siegel's G-functions: `∑ a n zⁿ` with the same arithmetic conditions (no factorials). -/
structure IsGFunction (a : ℕ → ℂ) : Prop where
  isAlgebraic : ∀ n, IsAlgebraic ℚ (a n)
  isDFinite : PowerSeries.IsDFinite (algebraicClosure ℚ ℂ) (PowerSeries.mk a)
  size_le : ∃ C : ℝ, 0 < C ∧ ∀ n, ∀ z ∈ (minpoly ℚ (a n)).aroots ℂ, ‖z‖ ≤ C ^ (n + 1)
  den_le : ∃ D : ℝ, 0 < D ∧ ∃ d : ℕ → ℕ, ∀ n, 1 ≤ d n ∧ (d n : ℝ) ≤ D ^ (n + 1) ∧
    ∀ m ≤ n, IsIntegral ℤ ((d n : ℂ) * a m)

/-- The `ℂ(z)`-algebra structure of the subfield of `ℂ⸨X⸩` generated over `ℂ(z)` by a set of
Laurent series, read off from its subalgebra. It names the instance used by the transcendence
degree over `ℂ(z)` in `siegel_shidlovskii` and `nishioka`, where generic instance search on the
intermediate field does not terminate within the default budget. -/
instance instAlgebraRatFuncAdjoin (S : Set ℂ⸨X⸩) :
    Algebra (RatFunc ℂ) (IntermediateField.adjoin (RatFunc ℂ) S) :=
  (IntermediateField.adjoin (RatFunc ℂ) S).toSubalgebra.algebra

/-- The vector of power series `F` solves `T F' = M F` with polynomial `T`, `M`. -/
def SolvesSystem {ι : Type*} [Fintype ι] (T : Polynomial ℂ) (M : Matrix ι ι (Polynomial ℂ))
    (F : ι → PowerSeries ℂ) : Prop :=
  ∀ i, (T : PowerSeries ℂ) * PowerSeries.derivative (R := ℂ) (F i) =
    ∑ j, (M i j : PowerSeries ℂ) * F j

/-- André's theorem: an E-function satisfies a differential equation whose only singularities
are `0` and `∞`. -/
theorem andre_eFunction_equation {a : ℕ → ℂ} (ha : IsEFunction a) :
    ∃ (m : ℕ) (q : Fin m → Polynomial ℂ), (∀ k, (q k).natDegree ≤ m - (k : ℕ)) ∧
      (∀ k j, IsAlgebraic ℚ ((q k).coeff j)) ∧
      (PowerSeries.X ^ m * (⇑(PowerSeries.derivative (R := ℂ)))^[m] (ePowerSeries a) +
        ∑ k : Fin m, (PowerSeries.X ^ (k : ℕ) * (q k : PowerSeries ℂ)) *
          (⇑(PowerSeries.derivative (R := ℂ)))^[k] (ePowerSeries a) = 0) := sorry

/-- **Beukers' refined Siegel–Shidlovskii theorem** (B06, Theorem 1.3): if E-functions
`f₁, …, fₙ` satisfy `T f' = M f` with algebraic coefficients and `ξ` is algebraic with
`ξ T(ξ) ≠ 0`, every homogeneous polynomial relation `P(f(ξ)) = 0` with algebraic coefficients is
the specialization at `z = ξ` of a homogeneous relation of the same degree among the `fᵢ` with
coefficients in `ℚ̄[z]`. -/
theorem beukers_refined_siegel_shidlovskii {n : ℕ} (a : Fin n → ℕ → ℂ)
    (ha : ∀ i, IsEFunction (a i)) (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT : ∀ j, IsAlgebraic ℚ (T.coeff j)) (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξT : ξ * T.eval ξ ≠ 0) (P : MvPolynomial (Fin n) ℂ) (hPalg : ∀ e, IsAlgebraic ℚ (P.coeff e))
    {d : ℕ} (hPhom : MvPolynomial.IsHomogeneous P d) (hP : MvPolynomial.eval (fun i => eFun (a i) ξ) P = 0) :
    ∃ Q : MvPolynomial (Fin n) (Polynomial ℂ),
      (∀ e j, IsAlgebraic ℚ ((Q.coeff e).coeff j)) ∧ MvPolynomial.IsHomogeneous Q d ∧
      MvPolynomial.eval₂ Polynomial.coeToPowerSeries.ringHom (fun i => ePowerSeries (a i)) Q = 0 ∧
      MvPolynomial.map (Polynomial.evalRingHom ξ) Q = P := sorry

/-- **The Siegel–Shidlovskii theorem** (B06, Theorem 1.1): if E-functions `f₁, …, fₙ` satisfy
`T f' = M f` with algebraic coefficients and `ξ` is algebraic with `ξ T(ξ) ≠ 0`, the transcendence
degree over `ℚ` of the values `fᵢ(ξ)` equals the transcendence degree over `ℂ(z)` of the
functions `fᵢ`. -/
theorem siegel_shidlovskii {n : ℕ} (a : Fin n → ℕ → ℂ) (ha : ∀ i, IsEFunction (a i))
    (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT : ∀ j, IsAlgebraic ℚ (T.coeff j)) (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => ePowerSeries (a i)) {ξ : ℂ} (hξ : IsAlgebraic ℚ ξ)
    (hξT : ξ * T.eval ξ ≠ 0) :
    Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range fun i => eFun (a i) ξ)) =
      Algebra.trdeg (RatFunc ℂ) (IntermediateField.adjoin (RatFunc ℂ)
        (Set.range fun i => ((ePowerSeries (a i) : PowerSeries ℂ) : ℂ⸨X⸩))) := sorry

/-- **The Galochkin–Chudnovsky theorem** (B08, Theorem 4.4.2): for G-functions `f₁, …, fₙ` with
rational coefficients, linearly independent over `ℂ(z)` and solving `T f' = M f` with algebraic
coefficients, there is `C > 0` such that the values `fᵢ(p/q)` are linearly independent over `ℚ`
whenever `p ≠ 0`, `q > 0` and `q > C|p|^(n+1)`. -/
theorem galochkin_chudnovsky {n : ℕ} (a : Fin n → ℕ → ℂ) (ha : ∀ i, IsGFunction (a i))
    (hrat : ∀ i m, ∃ q : ℚ, a i m = q) (T : Polynomial ℂ) (M : Matrix (Fin n) (Fin n) (Polynomial ℂ))
    (hT0 : T ≠ 0) (hT : ∀ j, IsAlgebraic ℚ (T.coeff j))
    (hM : ∀ i k j, IsAlgebraic ℚ ((M i k).coeff j))
    (hsys : SolvesSystem T M fun i => PowerSeries.mk (a i))
    (hind : LinearIndependent (RatFunc ℂ) fun i => ((PowerSeries.mk (a i) : PowerSeries ℂ) : ℂ⸨X⸩)) :
    ∃ C : ℝ, 0 < C ∧ ∀ p q : ℤ, 0 < q → p ≠ 0 → C * |(p : ℝ)| ^ (n + 1) < q →
      LinearIndependent ℚ fun i => ∑' m, a i m * ((p : ℂ) / q) ^ m := sorry

/-- For q≥2 and an invertible rational matrix A, a point of the punctured unit disc
is regular if no `α^{q^ℓ}` is a pole of an entry of A or A⁻¹. Invalid q and singular
matrices fail the predicate. -/
def IsMahlerRegularPoint {n : ℕ} (q : ℕ) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ)) (α : ℂ) : Prop :=
  2 ≤ q ∧ IsUnit A.det ∧ 0 < ‖α‖ ∧ ‖α‖ < 1 ∧ ∀ ℓ : ℕ, ∀ i j,
    (A i j).denom.eval (α ^ q ^ ℓ) ≠ 0 ∧ (A⁻¹ i j).denom.eval (α ^ q ^ ℓ) ≠ 0

/-- **Nishioka's theorem** (AF22, Theorem 1.1): let `f₁, …, fₙ` be power series with algebraic
coefficients, convergent on the disc `|z| < ρ`, with `f(z) = A(z) f(z^q)` for an integer `q ≥ 2`
and a matrix `A` over `ℂ(z)` with algebraic coefficients and nonzero determinant. At an algebraic
point `α` with `|α| < ρ` that is regular for the system, the transcendence degree over `ℚ` of the
values `fᵢ(α)` equals the transcendence degree of the `fᵢ` over `ℂ(z)`. -/
theorem nishioka {n q : ℕ} (hq : 2 ≤ q) (f : Fin n → PowerSeries ℂ)
    (hf : ∀ i m, IsAlgebraic ℚ (coeff m (f i))) (A : Matrix (Fin n) (Fin n) (RatFunc ℂ))
    (hAalg : ∀ i j m, IsAlgebraic ℚ ((A i j).num.coeff m) ∧
      IsAlgebraic ℚ ((A i j).denom.coeff m)) (hA : IsUnit A.det)
    (hsys : (fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩)) =
      (A.map (algebraMap (RatFunc ℂ) ℂ⸨X⸩)).mulVec fun i => ((PowerSeries.subst (PowerSeries.X ^ q) (f i) : PowerSeries ℂ) : ℂ⸨X⸩))
    (ρ : ℝ) (hρ : 0 < ρ) (hconv : ∀ i (z : ℂ), ‖z‖ < ρ → Summable fun m => coeff m (f i) * z ^ m)
    {α : ℂ} (hα : IsAlgebraic ℚ α) (hαρ : ‖α‖ < ρ) (hreg : IsMahlerRegularPoint q A α) :
    Algebra.trdeg ℚ (IntermediateField.adjoin ℚ (Set.range fun i => ∑' m, coeff m (f i) * α ^ m)) =
      Algebra.trdeg (RatFunc ℂ) (IntermediateField.adjoin (RatFunc ℂ)
        (Set.range fun i => ((f i : PowerSeries ℂ) : ℂ⸨X⸩))) := sorry

/-- Mahler (1929): `∑ α^{2ⁿ}` is transcendental for algebraic `0 < |α| < 1`. -/
theorem transcendental_fredholm {α : ℂ} (hα : IsAlgebraic ℚ α) (h0 : 0 < ‖α‖) (h1 : ‖α‖ < 1) :
    Transcendental ℚ (∑' n : ℕ, α ^ 2 ^ n) := sorry

/-- Nesterenko (1996): for `q = e^{2πiτ}`, three of `q, E₂(τ), E₄(τ), E₆(τ)` are algebraically
independent. -/
theorem nesterenko (τ : UpperHalfPlane) :
    ∃ s : Finset (Fin 4), s.card = 3 ∧ AlgebraicIndependent ℚ fun i : s =>
      (![Function.Periodic.qParam 1 τ, EisensteinSeries.E2 τ, ModularForm.E₄ τ, ModularForm.E₆ τ] :
        Fin 4 → ℂ) i := sorry

/-- The real numbers π and exp π are algebraically independent. -/
theorem algebraicIndependent_pi_exp_pi :
    AlgebraicIndependent ℚ ![Real.pi, Real.exp Real.pi] := sorry

/-- **Ax's theorem** (Kirby, §3.3, Theorem 3.8): let `F` be a field of characteristic zero with
derivations `D₁, …, D_k` and common constant field `C`. If `y₁, …, yₙ` are nonzero with
`D_j xᵢ = D_j yᵢ / yᵢ` and no nontrivial `ℚ`-linear combination of the `xᵢ` is constant, then
`trdeg_C C(x, y) ≥ n + rank (D_j xᵢ)`. -/
theorem ax_schanuel {F : Type*} [Field F] [CharZero F] {k : ℕ} (D : Fin k → Derivation ℤ F F)
    (C : Subfield F) (hC : ∀ c, c ∈ C ↔ ∀ j, D j c = 0) {n : ℕ} (x y : Fin n → F)
    (hy : ∀ i, y i ≠ 0) (hxy : ∀ j i, D j (x i) = D j (y i) / y i)
    (hlin : ∀ z : Fin n → ℚ, (∑ i, (z i : F) * x i) ∈ C → z = 0) :
    ((n + (Matrix.of fun j i => D j (x i)).rank : ℕ) : Cardinal) ≤
      Algebra.trdeg C (IntermediateField.adjoin C (Set.range x ∪ Set.range y)) := sorry

/-- **Ax–Schanuel for formal power series**: if `f₁, …, fₙ ∈ zℂ⟦z⟧`, `n ≥ 1`, are linearly
independent over `ℚ`, then `ℂ[f, exp f]` has transcendence degree at least `n + 1` over `ℂ`. -/
theorem ax_schanuel_powerSeries {n : ℕ} (hn : 1 ≤ n) (f : Fin n → PowerSeries ℂ)
    (hf0 : ∀ i, constantCoeff (f i) = 0) (hlin : LinearIndependent ℚ f) :
    ((n + 1 : ℕ) : Cardinal) ≤
      Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range f ∪ Set.range fun i => (exp ℂ).subst (f i))) :=
  sorry

/-- Ax–Lindemann–Weierstrass: if the `fᵢ` generate a field of transcendence degree one (an
algebraic curve germ) and are `ℚ`-linearly independent, their exponentials are algebraically
independent. -/
theorem ax_lindemann_weierstrass {n : ℕ} (hn : 1 ≤ n) (f : Fin n → PowerSeries ℂ)
    (hf0 : ∀ i, constantCoeff (f i) = 0) (hlin : LinearIndependent ℚ f)
    (hcurve : Algebra.trdeg ℂ (Algebra.adjoin ℂ (Set.range f)) = 1) :
    AlgebraicIndependent ℂ fun i => (exp ℂ).subst (f i) := sorry

end DiophantineApproximation

end SpecialFunctions

end

end TauCetiRoadmap.DiophantineApproximationAndTranscendence
