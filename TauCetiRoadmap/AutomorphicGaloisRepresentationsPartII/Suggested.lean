import Mathlib.NumberTheory.NumberField.CMField
import Mathlib.RingTheory.Polynomial.Vieta
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.FinCases
import Mathlib.Data.Matrix.Mul
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Algebra.Field.ZMod
import Mathlib.RepresentationTheory.Irreducible
import Mathlib.RepresentationTheory.Semisimple
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.RingTheory.Ideal.Maps
import Mathlib.RingTheory.Idempotents
import Mathlib.Topology.Algebra.Module.FiniteDimension
import Mathlib.FieldTheory.IntermediateField.Adjoin.Basic
import Mathlib.Analysis.Complex.Basic
import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Tactic.NormNum

/-!
# Automorphic Galois representations, part II: representative target signatures

The README is the definitive roadmap. These are suggested forms, not an exhaustive checklist.
The file records light definitions and milestones statable against the pinned Mathlib APIs.
Automorphic representations, geometric realizations, period comparisons and compatible systems
are specified in the README. Geometric Frobenius and `HT(ε) = −1` fix the numerical conventions.
SmallRamificationAndAbelianVarietyBaseCases §5.0d supplies `AutomorphicSystemData`, its raw
operations and convention adapters. AG2.P provides compatibility predicates on that carrier
and their preservation; AG2.6 provides automorphic systems with the stated branch hypotheses.
AG2.P's `arithmeticPadicMonodromy` constructs the Galois representation/differential equation
bridge used by `potentiallySemistableWD`. Its `finiteCoefficientCorrespondenceTrace` and
`correspondenceTraceCoefficientLimit` extend the rational correspondence trace theorem supplied
by EndoscopicTransferAndUnitaryTraceComparison §7.10a; AG2.1a provides the PEL specialization.
-/

namespace TauCeti.AutomorphicGalois

open Polynomial
open scoped BigOperators Classical

#check NumberField.IsCMField.complexEmbedding_complexConj
#check Multiset.prod_X_sub_C_coeff
#check Matrix.charpoly_map
#check Matrix.charpoly_units_conj

/-! ## Layer AG2.0: dominant coordinates and labelled Hodge weights -/

/-- Embedding-indexed dominant GLₙ coordinates. -/
def DominantWeight (n : ℕ) (ι : Type*) : Type _ := ι → {a : Fin n → ℤ // Antitone a}

namespace DominantWeight

variable {n : ℕ} {ι : Type*}

/-- Conjugate coordinates sum to `w`. -/
def IsInW (c : ι → ι) (w : ℤ) (a : DominantWeight n ι) : Prop :=
  ∀ τ (i : Fin n), (a τ).1 i + (a (c τ)).1 i.rev = w

/-- Pull coordinates back along restriction of embeddings. -/
def baseChange {ι' : Type*} (f : ι' → ι) (a : DominantWeight n ι) : DominantWeight n ι' :=
  fun τ => a (f τ)

/-- Form the weight from antitone coordinates. -/
def mk (a : ι → Fin n → ℤ) (ha : ∀ τ, Antitone (a τ)) : DominantWeight n ι :=
  fun τ => ⟨a τ, ha τ⟩

/-- At some embedding, equal-sized subsets of shifted coordinates have distinct sums. -/
def IsExtremelyRegular (a : DominantWeight n ι) : Prop :=
  ∃ τ, ∀ H H' : Finset (Fin n), H.card = H'.card →
    (∑ i ∈ H, ((a τ).1 i + ((n - 1 - i : ℕ) : ℤ))) = (∑ i ∈ H', ((a τ).1 i + ((n - 1 - i : ℕ) : ℤ))) → H = H'

/-- The isInW baseChange comparison for the stated algebraic data. -/
theorem isInW_baseChange {ι' : Type*} (c : ι → ι) (c' : ι' → ι') (f : ι' → ι)
    (hf : ∀ τ, f (c' τ) = c (f τ)) {w : ℤ} {a : DominantWeight n ι} (h : a.IsInW c w) :
    (a.baseChange f).IsInW c' w := sorry

/-- The ext comparison for the stated algebraic data. -/
@[ext] theorem ext {a b : DominantWeight n ι}
    (h : ∀ τ i, (a τ).1 i = (b τ).1 i) : a = b := sorry

/-- The baseChange id comparison for the stated algebraic data. -/
@[simp] theorem baseChange_id (a : DominantWeight n ι) : a.baseChange id = a := sorry

/-- The baseChange comp comparison for the stated algebraic data. -/
theorem baseChange_comp {ι' ι'' : Type*} (f : ι' → ι) (g : ι'' → ι')
    (a : DominantWeight n ι) : (a.baseChange f).baseChange g = a.baseChange (f ∘ g) := sorry

/-- Powers of two have distinct subset sums. -/
example : IsExtremelyRegular
    (fun _ : Unit => ⟨![5, 2, 1, 1], by
      intro i j hij; fin_cases i <;> fin_cases j <;> simp_all⟩ : DominantWeight 4 Unit) := sorry

/-- Shifted entries `3,2,1,0` fail extreme regularity since `3+0=2+1`. -/
example : ¬ IsExtremelyRegular
    (fun _ : Unit => ⟨(0 : Fin 4 → ℤ), by intro i j _; rfl⟩ : DominantWeight 4 Unit) := sorry

/-- An empty embedding index cannot witness extreme regularity, even in rank zero. -/
example {n : ℕ} (a : DominantWeight n Empty) : ¬ IsExtremelyRegular a := by
  rintro ⟨τ, _⟩
  exact τ.elim

/-- In rank one a nonempty embedding index suffices. -/
example {ι : Type*} [Nonempty ι] (a : DominantWeight 1 ι) : IsExtremelyRegular a := by
  obtain ⟨τ⟩ := ‹Nonempty ι›
  refine ⟨τ, ?_⟩
  intro H H' hcard _
  fin_cases H <;> fin_cases H' <;> simp_all

end DominantWeight

/-- The dominant rank-two vector `(x,y)`, with `y≤x`. -/
def mk2 (x y : ℤ) (h : y ≤ x) : {a : Fin 2 → ℤ // Antitone a} :=
  ⟨![x, y], by intro i j hij; fin_cases i <;> fin_cases j <;> simp_all⟩

/-- Test `DominantWeight.isInW_classical`: the weight `(k − 2, 0)` of a classical weight-`k` form lies in `(ℤ²)_{k−2}`
(one embedding, conjugation trivial). -/
example (k : ℤ) (hk : 2 ≤ k) :
    DominantWeight.IsInW id (k - 2) (fun _ : Unit => mk2 (k - 2) 0 (by omega) : DominantWeight 2 Unit) := by
  intro τ i
  fin_cases i <;> simp [mk2, Fin.rev]

/-- Test `DominantWeight.not_isInW_unpaired`: `a_τ = (1, 0)`, `a_{cτ} = (0, 0)` lies in no `(ℤ²)_w`. -/
example : ¬ ∃ w, DominantWeight.IsInW (fun b => !b) w
    (fun b : Bool => if b then mk2 1 0 (by norm_num) else mk2 0 0 le_rfl : DominantWeight 2 Bool) := by
  rintro ⟨w, h⟩
  have h1 := h true 0
  have h2 := h true 1
  simp [mk2, Fin.rev] at h1 h2
  omega

/-- Test `DominantWeight.not_dominant`: `(0, 1)` is not dominant. -/
example : ¬ Antitone (![0, 1] : Fin 2 → ℤ) := by
  intro h
  have := h (show (0 : Fin 2) ≤ 1 by decide)
  simp at this

/-- Check `DominantWeight.isInW_rank_one`. -/
example {ι : Type*} (c : ι → ι) (w : ℤ) (a : DominantWeight 1 ι) :
    a.IsInW c w ↔ ∀ τ, (a τ).1 0 + (a (c τ)).1 0 = w :=
  sorry

/-- `…:AG2.0/sign-of-the-polarization-multiplier`: with `χ_v(−1) = (−1)^{n+w}` the multiplier
`µ(c_v) = (−1)^{n−1} (−1)^w χ_v(−1)` is `−1`. -/
example (n w : ℕ) (hn : 1 ≤ n) : ((-1 : ℤ)) ^ (n - 1) * (-1) ^ w * (-1) ^ (n + w) = -1 := by
  rw [← pow_add, ← pow_add]
  have : n - 1 + w + (n + w) = 2 * (n + w - 1) + 1 := by omega
  rw [this, pow_succ, pow_mul]
  norm_num

/-- Test `not_totallyOdd_blggt_sign_odd_w` (its arithmetic): with BLGGT's printed `χ_v(−1) = (−1)^n` and `w` odd, the
multiplier is even, `µ(c_v) = +1` (BLGGT §2.1). -/
example (n w : ℕ) (hn : 1 ≤ n) (hw : Odd w) : ((-1 : ℤ)) ^ (n - 1) * (-1) ^ w * (-1) ^ n = 1 := by
  obtain ⟨k, rfl⟩ := hw
  rw [← pow_add, ← pow_add]
  have : n - 1 + (2 * k + 1) + n = 2 * (n + k) := by omega
  rw [this, pow_mul]
  norm_num

/-- The multiset `a(i)+n−1−i`, with `HT(ε)=−1`. -/
def expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) : Multiset ℤ :=
  Multiset.map (fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ)) Finset.univ.val

/-- The expectedHodgeTate strictAnti comparison for the stated algebraic data. -/
theorem expectedHodgeTate_strictAnti {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    StrictAnti fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ) := sorry

/-- The expectedHodgeTate card comparison for the stated algebraic data. -/
@[simp] theorem expectedHodgeTate_card {n : ℕ} (a : Fin n → ℤ) :
    (expectedHodgeTate a).card = n := sorry

/-- The expectedHodgeTate nodup comparison for the stated algebraic data. -/
theorem expectedHodgeTate_nodup {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    (expectedHodgeTate a).Nodup := sorry

/-- The expectedHodgeTate conj comparison for the stated algebraic data. -/
theorem expectedHodgeTate_conj {n : ℕ} {ι : Type*} (c : ι → ι) {w : ℤ} {a : DominantWeight n ι}
    (h : a.IsInW c w) (τ : ι) (i : Fin n) :
    (a (c τ)).1 i + ((n - 1 - i : ℕ) : ℤ) =
      (w + ((n - 1 : ℕ) : ℤ)) - ((a τ).1 i.rev + ((n - 1 - i.rev : ℕ) : ℤ)) := sorry

/-- The expectedHodgeTate twist comparison for the stated algebraic data. -/
theorem expectedHodgeTate_twist {n : ℕ} (a : Fin n → ℤ) (t : ℤ) :
    expectedHodgeTate (fun i => a i - t) = (expectedHodgeTate a).map (· - t) := sorry

/-- Test `expectedHodgeTate_classical`: `n = 2`, `a = (k − 2, 0)` with `k = 12` gives `{11, 0}`. -/
example : expectedHodgeTate ![(10 : ℤ), 0] = {11, 0} := by decide

/-- Check `expectedHodgeTate_zero`. -/
example (n : ℕ) : expectedHodgeTate (0 : Fin n → ℤ) =
    Multiset.map (fun i : Fin n => ((n - 1 - i : ℕ) : ℤ)) Finset.univ.val :=
  sorry

/-- Acceptance, `n = 3` (evaluated): `x³ − t₁x² + q t₂ x − q³ t₃ = ∏ (x − qα_j)` for `t₁ = q e₁`, `t₂ = q e₂`, `t₃ = e₃`. -/
example {R : Type*} [CommRing R] (q a b c x : R) :
    x ^ 3 - (q * (a + b + c)) * x ^ 2 + q * (q * (a * b + b * c + c * a)) * x - q ^ 3 * (a * b * c) =
      (x - q * a) * (x - q * b) * (x - q * c) := by ring

/-- Test `heckePolynomial_arith_vs_geom` (its arithmetic): if `β₁ + β₂ = −24` and `β₁β₂ = 2¹¹` (Δ at `2`), the
reciprocal roots have sum `−24/2¹¹` and product `2⁻¹¹`, so the arithmetic dual `r_R19,arith` has geometric polynomial `X² + 24·2⁻¹¹X + 2⁻¹¹`. -/
example (b1 b2 : ℂ) (hs : b1 + b2 = -24) (hp : b1 * b2 = 2 ^ 11) :
    1 / b1 + 1 / b2 = -24 / 2 ^ 11 ∧ 1 / b1 * (1 / b2) = 1 / 2 ^ 11 := by
  have h1 : b1 ≠ 0 := by rintro rfl; norm_num at hp
  have h2 : b2 ≠ 0 := by rintro rfl; norm_num at hp
  constructor
  · calc
      1 / b1 + 1 / b2 = (b1 + b2) / (b1 * b2) := by field_simp; ring
      _ = -24 / 2 ^ 11 := by rw [hs, hp]
  · rw [div_mul_div_comm, hp]; norm_num

example {R : Type*} [CommRing R] (q : R) (t : ℕ → R) (h0 : t 0 = 1) :
    (∑ i ∈ Finset.range (1 + 1), C ((-1) ^ i * q ^ (i * (i - 1) / 2) * t i) * X ^ (1 - i)) = X - C (t 1) :=
  sorry

example (b1 b2 u x : ℚ) (hu : u ≠ 0) :
    (x - b1 / u) * (x - b2 / u) = (u * x - b1) * (u * x - b2) / u ^ 2 := by
  field_simp

/-- Test `expectedHodgeTate_regular`: the shifted weight function is injective. -/
example {n : ℕ} {a : Fin n → ℤ} (ha : Antitone a) :
    Function.Injective (fun i : Fin n => a i + ((n - 1 - i : ℕ) : ℤ)) :=
  (expectedHodgeTate_strictAnti ha).injective

/-- Test `not_expectedHodgeTate_unshifted`: rank two weight zero has distinct shifted entries. -/
example : expectedHodgeTate (0 : Fin 2 → ℤ) ≠ ({0, 0} : Multiset ℤ) := by decide

/-! ## Layers AG2.0–AG2.1a: algebraic coefficient exponents and corrected selectors -/

namespace Fixtures

/-- Algebraic coefficient weight determined by the central exponent and highest-weight sum. -/
def coefficientWeight (central highestWeightSum : ℤ) : ℤ :=
  -2 * central - highestWeightSum

/-- Formal labelled integer `k−1−highestWeight−central`, before geometric comparison. -/
def labelledInteger (central highestWeight : ℤ) (k : ℕ) : ℤ :=
  (k : ℤ) - 1 - highestWeight - central

/-- The relative-degree factor; geometric use assumes `N≥2` and `y≠1`. -/
def selectorFactor (N : ℚ) (y : ℕ) (eigenvalue : ℚ) : ℚ :=
  (eigenvalue - N ^ y) / (N - N ^ y)

/-- Nontrivial similitude character `ν` shifts weight and labelled integers. -/
example : coefficientWeight 1 0 = -2 ∧ labelledInteger 1 0 1 = -1 := by decide

/-- A trivial central character does not supply a nonzero shift. -/
example : coefficientWeight 0 0 = 0 ∧ labelledInteger 0 0 1 = 0 := by decide

example (t a : ℤ) (k : ℕ) :
    labelledInteger (a + t) 0 k = labelledInteger a 0 k - t := by
  simp [labelledInteger]
  ring

example (c s t : ℤ) : coefficientWeight (c + t) s = coefficientWeight c s - 2 * t := by
  simp [coefficientWeight]
  ring

example (c a t : ℤ) (k : ℕ) :
    labelledInteger c (a + t) k = labelledInteger c a k - t := by
  simp [labelledInteger]
  ring

example : labelledInteger 0 0 2 = 1 := by decide

/-- Test `CoefficientProjector.denominator`, the two denominators. -/
example : (2 : ℚ) - 2 ^ 0 = 1 ∧ (2 : ℚ) - 2 ^ 2 = -2 := by norm_num

/-- Test `CoefficientProjector.degreeSelector`, scalar relative-degree fragment. -/
example : selectorFactor 2 0 1 = 0 ∧ selectorFactor 2 0 2 = 1 ∧
    selectorFactor 2 2 2 = 1 := by norm_num [selectorFactor]

/-- The empty selector product is one. -/
example : (∏ y ∈ (∅ : Finset ℕ), selectorFactor 2 y 2) = 1 := by simp

/-- The forbidden degree-one index has zero denominator and does not select degree one. -/
example : (2 : ℚ) - 2 ^ 1 = 0 ∧ selectorFactor 2 1 2 = 0 := by
  norm_num [selectorFactor]

/-- A filtered operator with graded identity and a nonzero nilpotent error at eigenvalue one. -/
def lerayJordan : Matrix (Fin 2) (Fin 2) ℚ := !![1, 1; 0, 1]

/-- The fifth power still fails idempotence near eigenvalue one. -/
example : (lerayJordan ^ 5) ^ 2 - lerayJordan ^ 5 = !![0, 5; 0, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [lerayJordan, pow_succ, Matrix.mul_apply, Fin.sum_univ_succ, Matrix.one_apply]

example : (lerayJordan ^ 5) ^ 2 ≠ lerayJordan ^ 5 := by
  intro h
  have he := congrFun (congrFun h 0) 1
  norm_num [lerayJordan, pow_succ, Matrix.mul_apply, Fin.sum_univ_succ, Matrix.one_apply] at he

end Fixtures

namespace CoefficientProjector

/-- The polynomial correction `1−(1−T^D)^D` in the endomorphism ring. -/
def correction {R : Type*} [Ring R] (D : ℕ) (T : R) : R :=
  1 - (1 - T ^ D) ^ D

/-- A nilpotent idempotence defect makes the corrected operator idempotent. -/
theorem correction_idempotent {R : Type*} [Ring R] (D : ℕ) (T : R)
    (hdef : (T - T ^ 2) ^ D = 0) : IsIdempotentElem (correction D T) :=
  isIdempotentElem_one_sub_one_sub_pow_pow T D hdef

/-- An operator idempotent on a length-`D` filtration has an idempotent polynomial correction. -/
theorem lerayCorrection {K V : Type*} [Field K] [AddCommGroup V] [Module K V]
    (D : ℕ) (hD : 0 < D) (F : ℕ → Submodule K V) (hF : Monotone F)
    (hzero : F 0 = ⊥) (htop : F D = ⊤) (T : Module.End K V)
    (hpres : ∀ i, ∀ v ∈ F i, T v ∈ F i)
    (hgraded : ∀ i < D, ∀ v ∈ F (i + 1), (T - T ^ 2) v ∈ F i) :
    (T - T ^ 2) ^ D = 0 ∧ IsIdempotentElem (correction D T) := sorry

/-- The corrected Jordan operator is exactly the identity. -/
example : correction 5 Fixtures.lerayJordan = 1 := by
  have hs : (1 - Fixtures.lerayJordan ^ 5) ^ 2 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      norm_num [Fixtures.lerayJordan, pow_succ, Matrix.mul_apply, Fin.sum_univ_succ,
        Matrix.one_apply]
  unfold correction
  rw [show (5 : ℕ) = 2 + 3 from rfl, pow_add, hs, zero_mul, sub_zero]

/-- The same correction kills the nilpotent Jordan block at eigenvalue zero. -/
example : correction 5 (Fixtures.lerayJordan - 1) = 0 := by
  have hs : (Fixtures.lerayJordan - 1) ^ 2 = 0 := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      norm_num [Fixtures.lerayJordan, pow_succ, Matrix.mul_apply, Fin.sum_univ_succ,
        Matrix.one_apply]
  have hp : (Fixtures.lerayJordan - 1) ^ 5 = 0 := by
    rw [show (5 : ℕ) = 2 + 3 from rfl, pow_add, hs, zero_mul]
  simp [correction, hp]

example {R : Type*} [Ring R] (D : ℕ) (hD : 0 < D) :
    correction D (0 : R) = 0 ∧ correction D (1 : R) = 1 := by
  simp [correction, Nat.ne_of_gt hD]

example {R : Type*} [Ring R] (T : R) : correction 1 T = T := by
  simp [correction]

end CoefficientProjector

/-! ## Layer AG2.2: discrete transfer ranks -/

namespace Fixtures

/-- Rank sum over multiplicities and constituent dimensions. -/
def discreteRank (blocks : List (ℕ × ℕ)) : ℕ :=
  (blocks.map fun b => b.1 * b.2).sum

example : discreteRank [] = 0 := rfl

example (a b : List (ℕ × ℕ)) : discreteRank (a ++ b) = discreteRank a + discreteRank b := by
  simp [discreteRank]

example : discreteRank ([(1, 2)] ++ [(1, 3)]) = 5 := by decide

example : discreteRank [(1, 2)] = 2 ∧ discreteRank [(2, 1)] = 2 := by decide

/-- The normalized parameter exponent minus the constituent exponent is `−n−j`. -/
example (n ni j : ℚ) :
    (ni - 1) / 2 - j + (1 - 2 * n) / 2 - ni / 2 = -n - j := by ring

/-- Test `DiscreteAssembly.singleBlock`, the two different scalar exponents. -/
example : (-1 - (0 : ℤ), -1 - (1 : ℤ)) = (-1, -2) := by decide

end Fixtures

/-! ## Layer AG2.4: Hasse weights and Kuga slopes -/

namespace Fixtures

/-- The Hasse increment `(p−1)p^(M−1)j`, for `M≥1`. -/
def hasseShift (p M j : ℕ) : ℕ := (p - 1) * p ^ (M - 1) * j

/-- Add `mn[F:ℚ]` to the section slope. -/
def kugaSlope (sectionSlope : ℚ) (m n fieldDegree : ℕ) : ℚ :=
  sectionSlope + (m * n * fieldDegree : ℕ)

example (p M : ℕ) : hasseShift p M 0 = 0 := by simp [hasseShift]

example (M j : ℕ) (_hM : 1 ≤ M) : hasseShift 2 M j = 2 ^ (M - 1) * j := by
  simp [hasseShift]

example (p M j : ℕ) : hasseShift p M (2 * j) = 2 * hasseShift p M j := by
  simp [hasseShift]
  ring

example : kugaSlope 3 2 1 2 = 7 := by norm_num [kugaSlope]

example : hasseShift 3 1 2 = 4 ∧ hasseShift 3 2 2 = 12 := by decide

/-- A degree-two CM field and one Kuga copy distinguish the two slope directions. -/
example : kugaSlope 3 1 1 2 = 5 ∧
    (5 : ℚ) - (1 * 1 * 2 : ℕ) = 3 ∧ kugaSlope 3 1 1 2 ≠ 1 := by
  norm_num [kugaSlope]

/-- The shift disappears for zero Kuga copies. -/
example (a : ℚ) (n d : ℕ) : kugaSlope a 0 n d = a := by
  simp [kugaSlope]

end Fixtures

/-! ## Layer AG2.5: monodromy partitions and Weil relations -/

namespace Fixtures

/-- Rank of a monodromy power with the given block lengths. -/
def blockPowerRank (blocks : List ℕ) (k : ℕ) : ℕ :=
  (blocks.map fun d => d - k).sum

/-- Diagonal Frobenius for `q=4` with weights `3,1,1,−1,−1,−3`. -/
def frobeniusFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if i.val = j.val then
    if i.val = 0 then 8 else if i.val = 1 ∨ i.val = 2 then 2
    else if i.val = 3 ∨ i.val = 4 then 1 / 2 else 1 / 8
    else 0

/-- Nilpotent strings of lengths 4 and 2. -/
def pureChainFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if (i.val, j.val) ∈ ([(1, 0), (3, 1), (5, 3), (4, 2)] : List (ℕ × ℕ))
    then 1 else 0

/-- Nilpotent strings of lengths 3 and 3. -/
def impureChainFixture : Matrix (Fin 6) (Fin 6) ℚ :=
  fun i j => if (i.val, j.val) ∈ ([(1, 0), (3, 1), (4, 2), (5, 4)] : List (ℕ × ℕ))
    then 1 else 0

example (k : ℕ) : blockPowerRank [] k = 0 := rfl

example : blockPowerRank [1] 0 = 1 ∧ blockPowerRank [1] 1 = 0 ∧
    blockPowerRank [4, 2] 4 = 0 := by decide

example : blockPowerRank [4, 2] 0 = 6 ∧ blockPowerRank [3, 3] 0 = 6 := by decide

example : blockPowerRank [4, 2] 1 = 4 ∧ blockPowerRank [3, 3] 1 = 4 := by decide

example : blockPowerRank [4, 2] 3 = 1 ∧ blockPowerRank [3, 3] 3 = 0 := by decide

/-- Both operators satisfy the geometric Weil relation `F N = q⁻¹ N F` for `q=4`. -/
example : frobeniusFixture * pureChainFixture =
    (1 / 4 : ℚ) • (pureChainFixture * frobeniusFixture) := sorry

example : frobeniusFixture * impureChainFixture =
    (1 / 4 : ℚ) • (impureChainFixture * frobeniusFixture) := sorry

example : (pureChainFixture ^ 3) 5 0 = 1 := sorry

example : impureChainFixture ^ 3 = 0 := sorry

example : pureChainFixture ^ 4 = 0 := by
  let S : Matrix (Fin 6) (Fin 6) ℚ :=
    fun i j => if (i.val, j.val) ∈ ([(3, 0), (5, 1)] : List (ℕ × ℕ)) then 1 else 0
  have hsq : pureChainFixture ^ 2 = S := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      norm_num [pow_two, Matrix.mul_apply, Fin.sum_univ_succ, pureChainFixture, S]
  rw [show (4 : ℕ) = 2 + 2 from rfl, pow_add, hsq]
  ext i j
  change (∑ k : Fin 6, S i k * S k j) = 0
  fin_cases i <;> fin_cases j <;>
    norm_num [Fin.sum_univ_succ, S]

example : impureChainFixture ^ 2 ≠ 0 := by
  intro h
  have he := congrFun (congrFun h 3) 0
  norm_num [pow_two, Matrix.mul_apply, Fin.sum_univ_succ, impureChainFixture] at he

/-- Reciprocal Frobenius violates the geometric Weil relation at entry `(1,0)`. -/
example : (Matrix.diagonal ![(1 / 8 : ℚ), 1 / 2, 1 / 2, 2, 2, 8]) * pureChainFixture ≠
    (1 / 4 : ℚ) • (pureChainFixture *
      Matrix.diagonal ![(1 / 8 : ℚ), 1 / 2, 1 / 2, 2, 2, 8]) := by
  intro h
  have he := congrFun (congrFun h 1) 0
  norm_num [Matrix.mul_apply, Fin.sum_univ_succ, pureChainFixture,
    Matrix.diagonal, Matrix.smul_apply] at he

end Fixtures

/-! ## Layer AG2.6: Hodge and ordinary exponent comparisons -/

theorem sum_expectedHodgeTate {n : ℕ} (a : Fin n → ℤ) :
    ∑ i : Fin n, (a i + ((n - 1 - i : ℕ) : ℤ)) =
    ∑ i : Fin n, a i + ((n * (n - 1) / 2 : ℕ) : ℤ) := sorry

/-- The geometricCoefficientPrimeComparison comparison for the stated algebraic data. -/
theorem geometricCoefficientPrimeComparison {K V W : Type*} [Field K]
    [AddCommGroup V] [Module K V] [AddCommGroup W] [Module K W]
    (u : V ≃ₗ[K] W) (e : Module.End K V) (f : Module.End K W)
    (he : e.comp e = e) (hf : f.comp f = f)
    (hu : u.toLinearMap.comp e = f.comp u.toLinearMap) :
    Nonempty (LinearMap.range e ≃ₗ[K] LinearMap.range f) := sorry

/-- A determinant Hodge sum cannot recover the rank-two multiset. -/
example : ({(0 : ℤ), 3} : Multiset ℤ).sum = ({(1 : ℤ), 2} : Multiset ℤ).sum ∧
    ({(0 : ℤ), 3} : Multiset ℤ) ≠ {(1 : ℤ), 2} := by decide

/-- CG and Pilloni's Hodge recipes agree under this parameter substitution.
Equality of automorphic representations uses the GSp₄ transfer dictionary in AG2.P. -/
example (a b : ℤ) :
    ![0, -(2 - b), -(1 - a), -(1 - a) - (2 - b)] = ![0, b - 2, a - 1, a + b - 3] := by
  ext i
  fin_cases i <;> simp
  ring

/-- CG's ordinary roots have different valuation exponents in the regular range. -/
example (a b : ℤ) (hab : b ≤ a) (hb : 3 ≤ b) :
    0 < b - 2 ∧ b - 2 < a - 1 ∧ a - 1 < a + b - 3 := by
  omega

/-! ## Layer AG2.7: local residual eigenvalue conditions -/

/-- Every ordered ratio of different occurrences avoids `q`. -/
def IsGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  ∀ i j, i ≠ j → (α i : K) / (α j : K) ≠ q

/-- Generic eigenvalues that are pairwise distinct. -/
def IsStrongGenericEigenvalues {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) : Prop :=
  IsGenericEigenvalues α q ∧ Function.Injective α

/-- Generic matrix data with a specified inertia subgroup and Frobenius. -/
def IsGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)

/-- Strong generic matrix data with specified inertia and Frobenius. -/
def IsStrongGeneric {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob : G) (q : k) : Prop :=
  (∀ g ∈ I, r g = 1) ∧
  ∃ α : Fin n → (AlgebraicClosure k)ˣ,
    ((((r frob).val).map (algebraMap k (AlgebraicClosure k))).charpoly =
      ∏ i, (X - C (α i : AlgebraicClosure k))) ∧
    IsStrongGenericEigenvalues α (algebraMap k (AlgebraicClosure k) q)


/-- Primality instance for the finite-field ratio checks. -/
instance prime_five : Fact (Nat.Prime 5) := ⟨Nat.prime_five⟩

/-- Primality instance for the distinct-root finite-field check. -/
instance prime_seven : Fact (Nat.Prime 7) := ⟨by decide⟩

/-- Test TauCeti.AutomorphicGalois.isGeneric_repeated_eigenvalue. -/
example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := by
  intro i j _
  simp
  decide

/-- Test TauCeti.AutomorphicGalois.not_isGeneric_distinct_ratio_q. -/
example : ¬ IsGenericEigenvalues ![(Units.mk0 (2 : ZMod 5) (by decide)), 1] (2 : ZMod 5) := by
  intro h
  exact h 0 1 (by decide) (by simp)

/-- Test TauCeti.AutomorphicGalois.isGeneric_rank_one. -/
example {K : Type*} [Field K] (a : Kˣ) (q : K) :
    IsGenericEigenvalues (fun _ : Fin 1 => a) q := by
  intro i j hij
  exact (hij (Subsingleton.elim i j)).elim

/-- Test TauCeti.AutomorphicGalois.not_isGeneric_repeated_q_one. -/
example : ¬ IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 1 := by
  intro h
  exact h 0 1 (by decide) (by simp)

/-- Test TauCeti.AutomorphicGalois.strongGeneric_not_repeated. -/
example : IsGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 2 := by
  constructor
  · intro i j _
    simp
    decide
  · intro h
    have hh := h.2 (a₁ := 0) (a₂ := 1) rfl
    exact (by decide : (0 : Fin 2) ≠ 1) hh

/-- Test TauCeti.AutomorphicGalois.strongGeneric_distinct_nonratio. -/
example : IsStrongGenericEigenvalues ![1, (Units.mk0 (3 : ZMod 7) (by decide))] (2 : ZMod 7) :=
  sorry

/-- Test TauCeti.AutomorphicGalois.strongGeneric_rank_one. -/
example {K : Type*} [Field K] (a : Kˣ) (q : K) :
    IsStrongGenericEigenvalues (fun _ : Fin 1 => a) q := by
  constructor
  · intro i j hij
    exact (hij (Subsingleton.elim i j)).elim
  · intro i j _
    exact Subsingleton.elim i j

/-- Test TauCeti.AutomorphicGalois.strongGeneric_non_Qp: the arithmetic part
of q=4 for an unramified quadratic extension of Q_2. -/
example : (4 : ZMod 3) = 1 ∧
    ¬ IsStrongGenericEigenvalues (fun _ : Fin 2 => (1 : (ZMod 3)ˣ)) 4 := by
  constructor
  · decide
  · intro h
    have hh := h.2 (a₁ := 0) (a₂ := 1) rfl
    exact (by decide : (0 : Fin 2) ≠ 1) hh

/-- The genericityTransfer comparison for the stated algebraic data. -/
theorem genericityTransfer {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r s : G →* Matrix.GeneralLinearGroup (Fin n) k) (χ : G →* kˣ)
    (hs : ∀ g, s g = Matrix.GeneralLinearGroup.scalar (Fin n) (χ g) * r g)
    (hχ : ∀ g ∈ I, χ g = 1) (frob : G) (q : k) :
    IsGeneric I s frob q ↔ IsGeneric I r frob q := sorry

/-- The residualGenericityOutsideFiniteSet comparison for the stated algebraic data. -/
theorem residualGenericityOutsideFiniteSet {O k : Type*} [CommRing O] [Field k]
    {n : ℕ} (red : O →+* k) (α : Fin n → Oˣ) (q : O)
    (h : ∀ i j, i ≠ j → red ((α i : O) - (α j : O)) ≠ 0 ∧
      red ((α i : O) - q * (α j : O)) ≠ 0) :
    IsStrongGenericEigenvalues (fun i => Units.map red.toMonoidHom (α i)) (red q) := sorry

/-- The isGeneric unramified comparison for the stated algebraic data. -/
theorem isGeneric_unramified {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsGeneric I r frob q) :
    ∀ g ∈ I, r g = 1 := sorry

/-- The isGeneric frobenius independent comparison for the stated algebraic data. -/
theorem isGeneric_frobenius_independent {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k)
    (frob₁ frob₂ : G) (q : k) (h : r frob₁ = r frob₂) :
    IsGeneric I r frob₁ q ↔ IsGeneric I r frob₂ q := sorry

/-- The isGenericEigenvalues smul comparison for the stated algebraic data. -/
theorem isGenericEigenvalues_smul {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (c : Kˣ) :
    IsGenericEigenvalues (fun i => c * α i) q ↔ IsGenericEigenvalues α q := sorry

/-- The isGenericEigenvalues reindex comparison for the stated algebraic data. -/
theorem isGenericEigenvalues_reindex {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) (e : Fin n ≃ Fin n) :
    IsGenericEigenvalues (α ∘ e) q ↔ IsGenericEigenvalues α q := sorry

/-- The isGenericEigenvalues inverse comparison for the stated algebraic data. -/
theorem isGenericEigenvalues_inverse {K : Type*} [Field K] {n : ℕ}
    (α : Fin n → Kˣ) (q : K) :
    IsGenericEigenvalues (fun i => (α i)⁻¹) q ↔ IsGenericEigenvalues α q := sorry

/-- The strongGeneric generic comparison for the stated algebraic data. -/
theorem strongGeneric_generic {G k : Type*} [Group G] [Field k] {n : ℕ}
    {I : Subgroup G} {r : G →* Matrix.GeneralLinearGroup (Fin n) k}
    {frob : G} {q : k} (h : IsStrongGeneric I r frob q) : IsGeneric I r frob q := sorry

/-- The strongGeneric distinct comparison for the stated algebraic data. -/
theorem strongGeneric_distinct {K : Type*} [Field K] {n : ℕ}
    {α : Fin n → Kˣ} {q : K} (h : IsStrongGenericEigenvalues α q) :
    Function.Injective α := sorry

/-- The strongGeneric arbitrary local field comparison for the stated algebraic data. -/
theorem strongGeneric_arbitrary_local_field {G k : Type*} [Group G] [Field k] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) k) (frob : G) (p f : ℕ) :
    IsStrongGeneric I r frob (p ^ f : k) ↔
      (∀ g ∈ I, r g = 1) ∧ ∃ α : Fin n → (AlgebraicClosure k)ˣ,
      ((r frob).val.map (algebraMap k (AlgebraicClosure k))).charpoly =
        ∏ i, (X - C (α i : AlgebraicClosure k)) ∧
      IsGenericEigenvalues α (algebraMap k (AlgebraicClosure k) (p ^ f : k)) ∧
      Function.Injective α := sorry

/-- The dualAndTwistHeckeComparison comparison for the stated algebraic data. -/
theorem dualAndTwistHeckeComparison {k : Type*} [Field k] {n : ℕ} (α : Fin n → kˣ) (q : kˣ) :
    IsGenericEigenvalues (fun i => q ^ (n - 1) * (α i)⁻¹) (q : k) ↔
      IsGenericEigenvalues α (q : k) := sorry

namespace Fixtures

/-- The diagonal representation of the group of tuples of units. -/
def diagonalRep {K : Type*} [Field K] (n : ℕ) :
    (Fin n → Kˣ) →* Matrix.GeneralLinearGroup (Fin n) K where
  toFun α :=
    { val := Matrix.diagonal (fun i => (α i : K))
      inv := Matrix.diagonal (fun i => ((α i)⁻¹ : K))
      val_inv := by simp [Matrix.diagonal_mul_diagonal]
      inv_val := by simp [Matrix.diagonal_mul_diagonal] }
  map_one' := by apply Units.ext; simp
  map_mul' α β := by apply Units.ext; simp [Matrix.diagonal_mul_diagonal]

end Fixtures

/-- A diagonal Frobenius reduces matrix genericity to trivial inertia and the eigenvalue test. -/
theorem isGeneric_matrix_diagonal {G K : Type*} [Group G] [Field K] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) K)
    (frob : G) (q : K) (α : Fin n → Kˣ)
    (hd : (r frob).val = Matrix.diagonal (fun i => (α i : K))) :
    IsGeneric I r frob q ↔ (∀ g ∈ I, r g = 1) ∧ IsGenericEigenvalues α q := sorry

/-- A diagonal Frobenius reduces strong genericity to inertia, ratios and distinctness. -/
theorem isStrongGeneric_matrix_diagonal {G K : Type*} [Group G] [Field K] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) K)
    (frob : G) (q : K) (α : Fin n → Kˣ)
    (hd : (r frob).val = Matrix.diagonal (fun i => (α i : K))) :
    IsStrongGeneric I r frob q ↔
      (∀ g ∈ I, r g = 1) ∧ IsStrongGenericEigenvalues α q := sorry

/-- The trivial rank-two matrix representation is generic at `q=2` but is not strong. -/
example : IsGeneric (⊥ : Subgroup Unit)
    (1 : Unit →* Matrix.GeneralLinearGroup (Fin 2) (ZMod 3)) () 2 ∧
    ¬ IsStrongGeneric (⊥ : Subgroup Unit)
      (1 : Unit →* Matrix.GeneralLinearGroup (Fin 2) (ZMod 3)) () 2 := by
  rw [isGeneric_matrix_diagonal _ _ _ _ (fun _ => 1) (by simp),
    isStrongGeneric_matrix_diagonal _ _ _ _ (fun _ => 1) (by simp)]
  constructor
  · refine ⟨by simp, ?_⟩
    intro i j _
    simp
    decide
  · rintro ⟨_, _, hinj⟩
    exact (by decide : (0 : Fin 2) ≠ 1) (hinj rfl)

/-- At `q=1`, the repeated roots of the trivial rank-two matrix representation fail genericity. -/
example : ¬ IsGeneric (⊥ : Subgroup Unit)
    (1 : Unit →* Matrix.GeneralLinearGroup (Fin 2) (ZMod 3)) () 1 := by
  rw [isGeneric_matrix_diagonal _ _ _ _ (fun _ => 1) (by simp)]
  rintro ⟨_, h⟩
  exact h 0 1 (by decide) (by simp)

/-- Over `𝔽₇`, diagonal Frobenius with entries `1` and `3` is strong generic at `q=2`. -/
example : IsStrongGeneric (⊥ : Subgroup (Fin 2 → (ZMod 7)ˣ))
    (Fixtures.diagonalRep 2) ![1, Units.mk0 (3 : ZMod 7) (by decide)] 2 := by
  rw [isStrongGeneric_matrix_diagonal _ _ _ _ _ rfl]
  refine ⟨?_, ?_⟩
  · intro g hg
    have : g = 1 := by simpa using hg
    subst g
    exact map_one _
  · constructor
    · intro i j hij h
      have hc := (div_eq_iff (Units.ne_zero
        (![1, Units.mk0 (3 : ZMod 7) (by decide)] j))).mp h
      fin_cases i <;> fin_cases j
      · exact hij rfl
      · exact (by decide : (1 : ZMod 7) ≠ 2 * 3) hc
      · exact (by decide : (3 : ZMod 7) ≠ 2 * 1) hc
      · exact hij rfl
    · intro i j h
      have hc := congrArg (fun u : (ZMod 7)ˣ => (u : ZMod 7)) h
      fin_cases i <;> fin_cases j
      · rfl
      · exact False.elim ((by decide : (1 : ZMod 7) ≠ 3) hc)
      · exact False.elim ((by decide : (3 : ZMod 7) ≠ 1) hc)
      · rfl

/-- Every rank-one matrix representation trivial on inertia is strong generic for every `q`. -/
example {G K : Type*} [Group G] [Field K]
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin 1) K)
    (frob : G) (q : K) (hI : ∀ g ∈ I, r g = 1) :
    IsStrongGeneric I r frob q := by
  let α : Fin 1 → (AlgebraicClosure K)ˣ := fun _ =>
    Units.map (algebraMap K (AlgebraicClosure K)).toMonoidHom (r frob).det
  refine ⟨hI, α, ?_, ?_⟩
  · have hd : ((r frob).val.map (algebraMap K (AlgebraicClosure K))) =
        Matrix.diagonal (fun i => (α i : AlgebraicClosure K)) := by
      ext i j
      fin_cases i
      fin_cases j
      simp [α, Matrix.GeneralLinearGroup.det]
    rw [hd, Matrix.charpoly_diagonal]
  · constructor
    · intro i j hij
      exact (hij (Subsingleton.elim i j)).elim
    · intro i j _
      exact Subsingleton.elim i j

/-- Distinct Frobenius eigenvalues with ratio `q` fail matrix genericity. -/
example : ¬ IsGeneric (⊥ : Subgroup (Fin 2 → (ZMod 5)ˣ))
    (Fixtures.diagonalRep 2) ![Units.mk0 (2 : ZMod 5) (by decide), 1] 2 := by
  rw [isGeneric_matrix_diagonal _ _ _ _ _ rfl]
  rintro ⟨_, h⟩
  exact h 0 1 (by decide) (by simp)

/-- A nontrivial inertia image rules out both matrix predicates. -/
example {G K : Type*} [Group G] [Field K] {n : ℕ}
    (I : Subgroup G) (r : G →* Matrix.GeneralLinearGroup (Fin n) K)
    (frob : G) (q : K) (g : G) (hg : g ∈ I) (hr : r g ≠ 1) :
    ¬ IsGeneric I r frob q ∧ ¬ IsStrongGeneric I r frob q := by
  exact ⟨fun h => hr (h.1 g hg), fun h => hr (h.1 g hg)⟩

/-- In the diagonal representation, full inertia containing `diag(2,1)` is nontrivial. -/
example : ¬ IsGeneric (⊤ : Subgroup (Fin 2 → (ZMod 5)ˣ))
    (Fixtures.diagonalRep 2) 1 2 ∧
    ¬ IsStrongGeneric (⊤ : Subgroup (Fin 2 → (ZMod 5)ˣ))
      (Fixtures.diagonalRep 2) 1 2 := by
  have hn : Fixtures.diagonalRep 2 ![Units.mk0 (2 : ZMod 5) (by decide), 1] ≠ 1 := by
    intro h
    have he := congrArg (fun a : Matrix.GeneralLinearGroup (Fin 2) (ZMod 5) => a.val 0 0) h
    change (2 : ZMod 5) = 1 at he
    exact (by decide : (2 : ZMod 5) ≠ 1) he
  exact ⟨fun h => hn (h.1 _ (Subgroup.mem_top _)),
    fun h => hn (h.1 _ (Subgroup.mem_top _))⟩

/-- Diagonal matrices have the polynomial used in the representation predicates. -/
example {K : Type*} [Field K] {n : ℕ} (α : Fin n → Kˣ) :
    (Matrix.diagonal (fun i => (α i : K))).charpoly = ∏ i, (X - C (α i : K)) :=
  Matrix.charpoly_diagonal _

/-! ## Layer AG2.7: two labelled algebraic constituents -/

section Unitary
variable {G K : Type*} [Group G] [Field K] {n₁ n₂ : ℕ}

/-- Algebraic block sum of two representations with specified character twists. -/
structure UnitaryDiscreteExport (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K) (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K)
    (ε₁ ε₂ : G →* Kˣ) where
  rep : G →* Matrix.GeneralLinearGroup (Fin n₁ ⊕ Fin n₂) K
  block : ∀ g, (rep g).val = Matrix.fromBlocks
    ((ε₁ g : K) • (r₁ g).val) 0 0 ((ε₂ g : K) • (r₂ g).val)

/-- The unitaryDiscreteExport constituent comparison for the stated algebraic data. -/
theorem unitaryDiscreteExport_constituent (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K) (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K)
    (ε₁ ε₂ : G →* Kˣ) (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G)
    (v : Fin n₁ → K) :
    (x.rep g).val.mulVec (Sum.elim v 0) =
      Sum.elim (((ε₁ g : K) • (r₁ g).val).mulVec v) 0 := sorry

/-- The unitaryDiscreteExport goodPolynomial comparison for the stated algebraic data. -/
theorem unitaryDiscreteExport_goodPolynomial (r₁ : G →* Matrix.GeneralLinearGroup (Fin n₁) K) (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K)
    (ε₁ ε₂ : G →* Kˣ) (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) :
    (x.rep g).val.charpoly = (((ε₁ g : K) • (r₁ g).val).charpoly) *
      (((ε₂ g : K) • (r₂ g).val).charpoly) := sorry

/-- A zero-dimensional constituent contributes polynomial one. -/
example (r₁ : G →* Matrix.GeneralLinearGroup (Fin 0) K)
    (r₂ : G →* Matrix.GeneralLinearGroup (Fin n₂) K) (ε₁ ε₂ : G →* Kˣ)
    (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) :
    (((ε₁ g : K) • (r₁ g).val).charpoly = 1) ∧
    (x.rep g).val.charpoly = ((ε₂ g : K) • (r₂ g).val).charpoly := by
  have hzero : ((ε₁ g : K) • (r₁ g).val).charpoly = 1 := by
    simp [Matrix.charpoly]
  exact ⟨hzero, by rw [unitaryDiscreteExport_goodPolynomial, hzero, one_mul]⟩

/-- Check `unitaryDiscreteExport_two_characters`: the two linear factors multiply. -/
example (r₁ r₂ : G →* Matrix.GeneralLinearGroup (Fin 1) K) (ε₁ ε₂ : G →* Kˣ)
    (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) :
    (x.rep g).val.charpoly = (X - C ((ε₁ g : K) * (r₁ g).val 0 0)) *
      (X - C ((ε₂ g : K) * (r₂ g).val 0 0)) := sorry

/-- Test TauCeti.AutomorphicGalois.unitaryDiscreteExport_rank_additivity. -/
example : Module.finrank K ((Fin n₁ ⊕ Fin n₂) → K) = n₁ + n₂ := sorry

/-- Check `unitaryDiscreteExport_not_cuspidal_irreducibility`: the first summand is proper. -/
example (r₁ r₂ : G →* Matrix.GeneralLinearGroup (Fin 1) K) (ε₁ ε₂ : G →* Kˣ)
    (x : UnitaryDiscreteExport r₁ r₂ ε₁ ε₂) (g : G) (a : K) :
    ((x.rep g).val.mulVec (Sum.elim (fun _ => a) (fun _ => 0))) (Sum.inr 0) = 0 ∧
    ¬ Representation.IsIrreducible
      (((Units.coeHom _).comp (Matrix.GeneralLinearGroup.toLin.toMonoidHom.comp x.rep)) :
        Representation K G ((Fin 1 ⊕ Fin 1) → K)) := sorry

end Unitary

/-
The README specifies the arithmetic place-fibre targets
IsDecomposedGenericPrime, IsDecomposedGeneric, infinitelyManyDecomposedGenericPrimes;
the compatible-system targets compatibleSystem, IsStrongCoefficientField,
GoodPrimeExport, NonselfdualComparisonExport, PolarizedComparisonExport;
and residualRep and ResidualPolynomialExport on their actual geometric and arithmetic carriers.
-/

end TauCeti.AutomorphicGalois
