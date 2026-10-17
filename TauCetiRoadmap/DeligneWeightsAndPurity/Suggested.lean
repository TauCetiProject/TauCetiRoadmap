import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Complex.Polynomial.Basic
import Mathlib.FieldTheory.IsAlgClosed.Classification
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.FieldTheory.IsAlgClosed.AlgebraicClosure
import Mathlib.FieldTheory.Minpoly.Field
import Mathlib.LinearAlgebra.Charpoly.Basic
import Mathlib.LinearAlgebra.Trace
import Mathlib.LinearAlgebra.Dual.Defs
import Mathlib.LinearAlgebra.Eigenspace.Basic
import Mathlib.Algebra.Order.BigOperators.Ring.Finset
import Mathlib.LinearAlgebra.TensorProduct.Basic
import Mathlib.LinearAlgebra.ExteriorPower.Basis
import Mathlib.RingTheory.Polynomial.Basic
import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.PowerSeries.Derivative
import Mathlib.RingTheory.PowerSeries.Inverse
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.RingTheory.Valuation.Basic
import Mathlib.Data.Multiset.Sort
import Mathlib.RepresentationTheory.Basic
import Mathlib.RepresentationTheory.Invariants
import Mathlib.RingTheory.SimpleModule.Basic
import Mathlib.LinearAlgebra.BilinearForm.Orthogonal
import Mathlib.LinearAlgebra.BilinearForm.Hom
import Mathlib.LinearAlgebra.Matrix.ToLin
import Mathlib.LinearAlgebra.TensorProduct.Map
import Mathlib.LinearAlgebra.Quotient.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank
import Mathlib.RingTheory.IntegralClosure.IsIntegral.Basic
import Mathlib.Algebra.DirectSum.Module
import Mathlib.Order.SupIndep
import Mathlib.LinearAlgebra.TensorPower.Basic
import Mathlib.LinearAlgebra.PiTensorProduct.Finite
import Mathlib.LinearAlgebra.Charpoly.BaseChange
import Mathlib.NumberTheory.Padics.PadicNumbers
import Mathlib.LinearAlgebra.Semisimple

import TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis
import TauCeti.RepresentationTheory.Induction.Clifford.Basic

/-!
# Deligne weights and purity: representative target signatures

These are suggested forms, not an exhaustive checklist. README.md is the definitive roadmap.
This file records light real-bodied definitions and theorem signatures statable against the pinned
Mathlib and Tau Ceti APIs. Geometric sheaves, mixed derived categories, arithmetic models and
compact Weil forms are specified in the README. The signatures retain characteristic-root
multiplicities, geometric Frobenius, inverse-dual actions and the graded primitive-kernel exponent.
-/

#check LinearMap.BilinForm.IsAlt.even_finrank
#check TauCeti.Representation.isSemisimpleRepresentation_comp_subtype
#check Even.pow_nonneg
#check MonoidHom.mrange
#check MonoidHom.mem_mrange

open Polynomial
open scoped TensorProduct

namespace TauCeti.Weights

/-! ## Weil q-numbers (`DeligneWeightsAndPurity:DWP.0/weil-q-number`) -/

section WeilNumber

variable {K : Type*} [Field K] [Algebra ℚ K]

/-- The real-base adapter of ArithmeticGaloisRepresentations §2.6's canonical scalar
`WeilDeligneRep.IsWeilNumber`: it requires `q > 1`, algebraicity over `ℚ`, and modulus
`q ^ (n / 2)` at every complex conjugate (Weil II (1.2.1)). The algebraicity clause
excludes the zero minimal polynomial of a transcendental element. -/
def IsWeilNumber (q : ℝ) (n : ℤ) (α : K) : Prop :=
  1 < q ∧ IsAlgebraic ℚ α ∧ ∀ z ∈ (minpoly ℚ α).aroots ℂ, ‖z‖ = q ^ ((n : ℝ) / 2)

/-- At natural `q ≥ 2`, the real-base adapter agrees with the expanded canonical
scalar predicate of ArithmeticGaloisRepresentations §2.6 (README 0.19). -/
theorem isWeilNumber_natCast_iff (q : ℕ) (hq : 2 ≤ q) (n : ℤ) (α : K) :
    IsWeilNumber (q : ℝ) n α ↔
      IsAlgebraic ℚ α ∧
        ∀ z ∈ (minpoly ℚ α).aroots ℂ, ‖z‖ = (q : ℝ) ^ ((n : ℝ) / 2) := by sorry

/-- At `q = 1`, the canonical scalar condition holds for `1` at every weight,
while the real-base adapter rejects it (README 0.19). -/
example (n : ℤ) : ¬ IsWeilNumber 1 n (1 : ℚ) ∧
    (IsAlgebraic ℚ (1 : ℚ) ∧
      ∀ z ∈ (minpoly ℚ (1 : ℚ)).aroots ℂ, ‖z‖ = (1 : ℝ) ^ ((n : ℝ) / 2)) := by sorry

theorem IsWeilNumber.isAlgebraic {q : ℝ} {n : ℤ} {α : K} (h : IsWeilNumber q n α) : IsAlgebraic ℚ α := by sorry

theorem IsWeilNumber.norm_eq {q : ℝ} {n : ℤ} {α : K} (h : IsWeilNumber q n α) (φ : K →+* ℂ) :
    ‖φ α‖ = q ^ ((n : ℝ) / 2) := by sorry

theorem isWeilNumber_iff_forall_embedding [Algebra.IsAlgebraic ℚ K] {q : ℝ} {n : ℤ} {α : K} :
    IsWeilNumber q n α ↔ 1 < q ∧ ∀ φ : K →+* ℂ, ‖φ α‖ = q ^ ((n : ℝ) / 2) := by sorry

theorem isWeilNumber_map_iff {K' : Type*} [Field K'] [Algebra ℚ K'] (f : K →+* K') {q : ℝ} {n : ℤ} {α : K} :
    IsWeilNumber q n (f α) ↔ IsWeilNumber q n α := by sorry

theorem IsWeilNumber.of_aeval_eq_zero {q : ℝ} {n : ℤ} {α : K} {P : ℚ[X]} (hq : 1 < q) (hP : P ≠ 0) (hα : aeval α P = 0)
    (hroots : ∀ z ∈ P.aroots ℂ, ‖z‖ = q ^ ((n : ℝ) / 2)) : IsWeilNumber q n α := by sorry

theorem IsWeilNumber.ne_zero {q : ℝ} {n : ℤ} {α : K} (h : IsWeilNumber q n α) : α ≠ 0 := by sorry

theorem IsWeilNumber.weight_unique {q : ℝ} (hq : 1 < q) {n m : ℤ} {α : K} (hn : IsWeilNumber q n α)
    (hm : IsWeilNumber q m α) : n = m := by sorry

/-- Test `isWeilNumber_roots_T2_sub_T_add_two`: the roots of `T² − T + 2` are Weil `2`-numbers of weight `1`. -/
example {α : K} (hα : α ^ 2 - α + 2 = 0) : IsWeilNumber 2 1 α := by sorry

/-- Test `isWeilNumber_inv_not_isIntegral`: `q⁻¹` has weight `−2` and is not integral over `ℤ` (here `q = 2`). -/
example : IsWeilNumber 2 (-2) (2⁻¹ : ℚ) ∧ ¬ IsIntegral ℤ (2⁻¹ : ℚ) := by sorry

/-- Test `isWeilNumber_rootOfUnity`: a root of unity has weight `0` for every `q > 1`. -/
example {q : ℝ} (hq : 1 < q) {ζ : K} {k : ℕ} (hk : 0 < k) (hζ : ζ ^ k = 1) : IsWeilNumber q 0 ζ := by sorry

end WeilNumber

/-! ## Products, inverses and base extension (`…/weil-number-arithmetic`, `…/weil-number-base-extension`) -/

section Arithmetic

variable {K : Type*} [Field K] [Algebra ℚ K]

theorem IsWeilNumber.mul {q : ℝ} {n m : ℤ} {α β : K} (hα : IsWeilNumber q n α) (hβ : IsWeilNumber q m β) :
    IsWeilNumber q (n + m) (α * β) := by sorry

theorem IsWeilNumber.inv {q : ℝ} {n : ℤ} {α : K} (hα : IsWeilNumber q n α) : IsWeilNumber q (-n) α⁻¹ := by sorry

theorem IsWeilNumber.weight_nonneg_of_isIntegral {q : ℝ} (hq : 1 < q) {n : ℤ} {α : K} (hα : IsWeilNumber q n α)
    (hint : IsIntegral ℤ α) : 0 ≤ n := by sorry

/-- Weil I (1.7) ⇒ (1.6) style changes of `q`: `α` has weight `n` rel. `q` iff `α ^ r` has weight `n` rel. `q ^ r`. -/
theorem isWeilNumber_pow_iff {q : ℝ} (hq : 1 < q) {n : ℤ} {r : ℕ} (hr : 0 < r) {α : K} :
    IsWeilNumber (q ^ r) n (α ^ r) ↔ IsWeilNumber q n α := by sorry

end Arithmetic

/-! ## ι-weights (`DeligneWeightsAndPurity:DWP.0/iota-weight`) -/

section IotaWeight

variable {E : Type*} [Field E]

/-- The ι-weight `2 log_q |ι α|` of `α` relative to `q` (Weil II (1.2.6.1)); `ι` need not be continuous. -/
noncomputable def iotaWeight (ι : E →+* ℂ) (q : ℝ) (α : E) : ℝ :=
  2 * Real.logb q ‖ι α‖

/-- `α` is ι-pure of the real weight `β`. -/
def IsIotaPure (ι : E →+* ℂ) (q β : ℝ) (α : E) : Prop :=
  α ≠ 0 ∧ iotaWeight ι q α = β

theorem iotaWeight_mul (ι : E →+* ℂ) (q : ℝ) {α β : E} (hα : α ≠ 0) (hβ : β ≠ 0) :
    iotaWeight ι q (α * β) = iotaWeight ι q α + iotaWeight ι q β := by sorry

theorem iotaWeight_inv (ι : E →+* ℂ) (q : ℝ) (α : E) : iotaWeight ι q α⁻¹ = -iotaWeight ι q α := by sorry

theorem iotaWeight_pow_base (ι : E →+* ℂ) {q : ℝ} (hq : 1 < q) {r : ℕ} (hr : 0 < r) (α : E) :
    iotaWeight ι (q ^ r) (α ^ r) = iotaWeight ι q α := by sorry

theorem iotaWeight_comp {E' : Type*} [Field E'] (ι : E' →+* ℂ) (τ : E →+* E') (q : ℝ) (α : E) :
    iotaWeight (ι.comp τ) q α = iotaWeight ι q (τ α) := by sorry

theorem norm_eq_rpow_iotaWeight (ι : E →+* ℂ) {q : ℝ} (hq : 1 < q) {α : E} (hα : α ≠ 0) :
    ‖ι α‖ = q ^ (iotaWeight ι q α / 2) := by sorry

theorem IsWeilNumber.isIotaPure [Algebra ℚ E] {q : ℝ} {n : ℤ} {α : E} (h : IsWeilNumber q n α) (ι : E →+* ℂ) :
    IsIotaPure ι q n α := by sorry

/-- Test `iotaWeight_rootOfUnity`: every root of unity has ι-weight zero. -/
example (ι : E →+* ℂ) (q : ℝ) {ζ : E} {k : ℕ} (hk : 0 < k) (hζ : ζ ^ k = 1) :
    iotaWeight ι q ζ = 0 := by sorry

/-- Test `iotaWeight_q` (for `q = 2`): `w_ι(2) = 2` and `w_ι(2⁻¹) = −2` for every `ι`. -/
example [CharZero E] (ι : E →+* ℂ) : iotaWeight ι 2 2 = 2 ∧ iotaWeight ι 2 (2⁻¹) = -2 := by sorry

/-- Rational bases are fixed by every coefficient embedding (README 0.4). -/
theorem iotaWeight_rat [CharZero E] (ι : E →+* ℂ) (q : ℚ) (hq : 1 < q) :
    iotaWeight ι q (q : E) = 2 ∧ iotaWeight ι q (q⁻¹ : E) = -2 := by sorry

end IotaWeight

/-! ## Weights of an invertible endomorphism (`DeligneWeightsAndPurity:DWP.0/endomorphism-weights`) -/

section Endomorphism

variable {E V : Type*} [Field E] [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- The eigenvalues of `F`: the roots of its characteristic polynomial in `AlgebraicClosure E`, with multiplicity. -/
noncomputable def eigenvalues (F : V →ₗ[E] V) : Multiset (AlgebraicClosure E) :=
  (F.charpoly.map (algebraMap E (AlgebraicClosure E))).roots

/-- `(V, F)` is pure of weight `n` relative to `q`: every eigenvalue is a Weil `q`-number of weight `n`. -/
def IsPure [Algebra ℚ E] (q : ℝ) (n : ℤ) (F : V →ₗ[E] V) : Prop :=
  ∀ α ∈ eigenvalues F, IsWeilNumber q n α

/-- `(V, F)` is ι-pure of the real weight `β`. -/
def IsIotaPureEnd (ι : AlgebraicClosure E →+* ℂ) (q β : ℝ) (F : V →ₗ[E] V) : Prop :=
  ∀ α ∈ eigenvalues F, IsIotaPure ι q β α

/-- The ι-weights of `F`, a finite set of reals. -/
noncomputable def iotaWeights (ι : AlgebraicClosure E →+* ℂ) (q : ℝ) (F : V →ₗ[E] V) : Finset ℝ := by
  classical
  exact ((eigenvalues F).map (iotaWeight ι q)).toFinset

theorem card_eigenvalues (F : V →ₗ[E] V) : Multiset.card (eigenvalues F) = Module.finrank E V := by sorry

theorem count_eigenvalues [DecidableEq (AlgebraicClosure E)] (F : V →ₗ[E] V) (α : AlgebraicClosure E) :
    (eigenvalues F).count α =
      Module.finrank (AlgebraicClosure E)
        (Module.End.maxGenEigenspace (F.baseChange (AlgebraicClosure E)) α) := by sorry

theorem IsPure.isIotaPureEnd [Algebra ℚ E] {q : ℝ} {n : ℤ} {F : V →ₗ[E] V} (h : IsPure q n F)
    (ι : AlgebraicClosure E →+* ℂ) : IsIotaPureEnd ι q n F := by sorry

theorem eigenvalues_map_aut (F : V →ₗ[E] V) (τ : AlgebraicClosure E ≃ₐ[E] AlgebraicClosure E) :
    (eigenvalues F).map τ = eigenvalues F := by sorry

/-- Test `isPure_jordanBlock`: `[[q, 1], [0, q]]` is pure of weight `2` (here `q = 2`, over `ℚ`). -/
example : IsPure (E := ℚ) 2 2 (Matrix.toLin' !![(2 : ℚ), 1; 0, 2]) ∧
    ¬ Module.End.IsSemisimple (Matrix.toLin' !![(2 : ℚ), 1; 0, 2]) := by sorry

/-- Test `not_isPure_diag`: `diag(1, 2)` is not pure relative to `2`. -/
example : (∀ n : ℤ, ¬ IsPure (E := ℚ) 2 n (Matrix.toLin' !![(1 : ℚ), 0; 0, 2])) ∧
    ∀ ι : AlgebraicClosure ℚ →+* ℂ,
      iotaWeights ι 2 (Matrix.toLin' !![(1 : ℚ), 0; 0, 2]) = {0, 2} := by sorry

end Endomorphism

/-! ## Eigenvector and subquotient comparisons for arithmetic purity (README 0.19) -/

section ArithmeticPurityComparison

variable {E V : Type*} [Field E] [CharZero E] [Algebra ℚ E]
  [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- Ordinary purity is the scalar condition on all eigenvectors after algebraic
closure. This is the linear-algebra core of the comparison with `N = 0`. -/
theorem isPure_iff_forall_eigenvector (q : ℝ) (n : ℤ) (F : V →ₗ[E] V) :
    IsPure q n F ↔ ∀ (α : AlgebraicClosure E) (v : AlgebraicClosure E ⊗[E] V),
      v ≠ 0 → F.baseChange (AlgebraicClosure E) v = α • v → IsWeilNumber q n α := by sorry

/-- Purity of the induced operator on `W/U` is detected by nonzero eigenvector
classes after scalar extension. Taking the supplied monodromy steps for `U`
and `W` gives the graded-piece comparison of README 0.19. -/
theorem isPure_subquotient_iff (q : ℝ) (n : ℤ) (F : V →ₗ[E] V)
    (U W : Submodule E V) (hUW : U ≤ W)
    (hU : ∀ x ∈ U, F x ∈ U) (hW : ∀ x ∈ W, F x ∈ W) :
    let U' := U.comap W.subtype
    let F' : W →ₗ[E] W := F.restrict hW
    IsPure q n (U'.mapQ U' F' (fun x hx => hU x hx)) ↔
      ∀ (α : AlgebraicClosure E) (v : AlgebraicClosure E ⊗[E] V),
        v ∈ W.baseChange (AlgebraicClosure E) →
        v ∉ U.baseChange (AlgebraicClosure E) →
        F.baseChange (AlgebraicClosure E) v - α • v ∈ U.baseChange (AlgebraicClosure E) →
        IsWeilNumber q n α := by sorry

/-- For the pure Jordan block with `N = 0`, the sole monodromy grade has weight
`2`, without semisimplicity (README 0.19). -/
example : IsPure 2 2 (Matrix.toLin' !![(2 : ℚ), 1; 0, 2]) ∧
    ¬ Module.End.IsSemisimple (Matrix.toLin' !![(2 : ℚ), 1; 0, 2]) := by sorry

/-- On the Tate line with `N = 0`, the sole monodromy grade has weight `−2`
for geometric Frobenius (README 0.19). -/
example : IsPure 2 (-2) ((2⁻¹ : ℚ) • LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by sorry

/-- For `Sp(2)`, the grades `−1` and `1` have weights `−2` and `0`, giving
pair weight `−1`; the underlying Frobenius module is pure of no weight (README 0.19). -/
example :
    let F := Matrix.toLin' !![(1 : ℚ), 0; 0, 2⁻¹]
    let N := Matrix.toLin' !![(0 : ℚ), 0; 1, 0]
    ∃ hU : ∀ x ∈ LinearMap.ker N, F x ∈ LinearMap.ker N,
      N ^ 2 = 0 ∧ N ∘ₗ F = (2 : ℚ) • (F ∘ₗ N) ∧
      IsPure 2 (-2) (F.restrict hU) ∧
      IsPure 2 0 ((LinearMap.ker N).mapQ (LinearMap.ker N) F hU) ∧
      (∀ w : ℤ, ¬ IsPure 2 w F) ∧
      ∀ ι : AlgebraicClosure ℚ →+* ℂ, iotaWeights ι 2 F = {0, -2} := by sorry

end ArithmeticPurityComparison

/-! ## Stability and separation (`…/purity-under-subquotients-and-extensions`, `…/spectra-of-tensor-products-and-duals`,
`…/finite-field-base-extension-of-weights`, `…/disjoint-spectra-no-intertwiner`) -/

section Stability

variable {E V W : Type*} [Field E] [AddCommGroup V] [Module E V] [AddCommGroup W] [Module E W]


variable [FiniteDimensional E V] [FiniteDimensional E W]

/-- Disjoint spectra have no nonzero intertwiner: if the characteristic polynomials are coprime and `u F = G u`,
then `u = 0`. No extension of scalars is needed. -/
theorem eq_zero_of_isCoprime_charpoly {F : V →ₗ[E] V} {G : W →ₗ[E] W}
    (h : IsCoprime F.charpoly G.charpoly) {u : V →ₗ[E] W} (hu : u ∘ₗ F = G ∘ₗ u) : u = 0 := by sorry

/-- Characteristic polynomial along an invariant subspace (`…/characteristic-polynomial-in-short-exact-sequences`). -/
theorem charpoly_eq_mul_of_mapsTo (F : V →ₗ[E] V) (U : Submodule E V) (hU : ∀ x ∈ U, F x ∈ U) :
    F.charpoly = (F.restrict hU).charpoly * (U.mapQ U F hU).charpoly := by sorry

/-- Eigenvalues of `F ^ r` (`…/spectra-of-polynomials-in-an-endomorphism`). -/
theorem eigenvalues_pow (F : V →ₗ[E] V) (r : ℕ) :
    eigenvalues (F ^ r) = (eigenvalues F).map (· ^ r) := by sorry

/-- Eigenvalues of a tensor product (`…/spectra-of-tensor-products-and-duals`). -/
theorem eigenvalues_tensor (F : V →ₗ[E] V) (G : W →ₗ[E] W) :
    eigenvalues (TensorProduct.map F G) =
      ((eigenvalues F).product (eigenvalues G)).map fun p => p.1 * p.2 := by sorry

/-- The transpose has the eigenvalues of `F` (the contragredient `(F⁻¹)^*` has their inverses). -/
theorem eigenvalues_dualMap (F : V →ₗ[E] V) : eigenvalues F.dualMap = eigenvalues F := by sorry

/-- Reciprocal pairing (`…/reciprocal-pairing-of-eigenvalues`): a perfect pairing with `⟨F x, F' y⟩ = c ⟨x, y⟩`. -/
theorem eigenvalues_of_pairing (F : V →ₗ[E] V) (F' : W →ₗ[E] W) (B : V →ₗ[E] W →ₗ[E] E)
    (hB : Function.Bijective B) (c : E) (hc : c ≠ 0) (hF : Function.Bijective F)
    (hFF' : ∀ x y, B (F x) (F' y) = c * B x y) :
    eigenvalues F' = (eigenvalues F).map fun α => algebraMap E (AlgebraicClosure E) c / α := by sorry

end Stability

/-! ## Twists (`DeligneWeightsAndPurity:DWP.0/twisting-by-rank-one-characters`) -/

section Twist

variable {E V : Type*} [Field E] [AddCommGroup V] [Module E V]

/-- The twist `V^{(b)} = (V, b F)` of Weil II (1.2.7). -/
def twist (b : Eˣ) (F : V →ₗ[E] V) : V →ₗ[E] V := (b : E) • F

/-- The Tate twist `V(r) = V^{(q^{-r})}`, for the geometric Frobenius convention (`ℚ_ℓ(1)` has eigenvalue `q⁻¹`). -/
def tateTwist (q : Eˣ) (r : ℤ) (F : V →ₗ[E] V) : V →ₗ[E] V := twist (q ^ (-r)) F

theorem twist_twist (b c : Eˣ) (F : V →ₗ[E] V) : twist b (twist c F) = twist (b * c) F := by sorry

/-- Test `twist_one`: `twist 1 F = F`. -/
example (F : V →ₗ[E] V) : twist 1 F = F := by sorry

/-- Test `twist_one` (Tate form): `V(0) = V`. -/
example (q : Eˣ) (F : V →ₗ[E] V) : tateTwist q 0 F = F := by sorry

theorem eigenvalues_twist [FiniteDimensional E V] (b : Eˣ) (F : V →ₗ[E] V) :
    eigenvalues (twist b F) = (eigenvalues F).map (algebraMap E (AlgebraicClosure E) (b : E) * ·) := by sorry

theorem IsPure.tateTwist [FiniteDimensional E V] [CharZero E] {q : ℕ} (hq : (q : E) ≠ 0) {n : ℤ}
    {F : V →ₗ[E] V} (h : IsPure (q : ℝ) n F) (r : ℤ) :
    IsPure (q : ℝ) (n - 2 * r) (tateTwist (Units.mk0 (q : E) hq) r F) := by sorry

theorem twist_tensor {W : Type*} [AddCommGroup W] [Module E W] (b c : Eˣ) (F : V →ₗ[E] V)
    (G : W →ₗ[E] W) : TensorProduct.map (twist b F) (twist c G) = twist (b * c) (TensorProduct.map F G) := by sorry

end Twist

/-! ## Numeric positivity core of Weil I §3. Geometric inputs are specified in the README. -/

section WeilI3

open PowerSeries

/-- Lemma 3.5 for two factors: when `f` and `g` have nonnegative coefficients and `g(0) = 1`, the coefficients of `f`
are bounded by those of `f * g`. The countable product follows by induction and passage to the limit. -/
theorem coeff_le_coeff_mul_of_nonneg {f g : PowerSeries ℝ} (hf : ∀ n, 0 ≤ coeff n f)
    (hg : ∀ n, 0 ≤ coeff n g) (hg0 : constantCoeff g = 1) (n : ℕ) :
    coeff n f ≤ coeff n (f * g) := by sorry

/-- The formal exponential of a series with nonnegative coefficients and zero constant
term has nonnegative coefficients over an ordered field, including the rational
case of Weil I (3.4) and the real case of Weil II (1.5.2)(a). -/
theorem coeff_exp_nonneg {R : Type*} [Field R] [LinearOrder R] [IsStrictOrderedRing R]
    {f : PowerSeries R} (hf : ∀ n, 0 ≤ coeff n f) (hf0 : constantCoeff f = 0) (n : ℕ) :
    0 ≤ coeff n (PowerSeries.mk fun m => ∑ j ∈ Finset.range (m + 1),
      coeff m (f ^ j) / (j.factorial : R)) := by sorry

end WeilI3

/-! ## Numeric Hasse compatibility. The curve/Jacobian comparison is specified in the README. -/

section WeilEstimate

/-- The Hasse compatibility (`…/compatibility-with-the-hasse-bound`): if `|α| = √q`, the trace `α + ᾱ` has absolute
value at most `2√q`. -/
theorem norm_add_conj_le {α : ℂ} {q : ℝ} (h : ‖α‖ = Real.sqrt q) :
    ‖α + (starRingEnd ℂ) α‖ ≤ 2 * Real.sqrt q := by sorry

/-- The point count of `y² = x³ − x` over `𝔽₃` from its characteristic polynomial `X² + 3`: `P(1) = 4`. -/
example : ((X ^ 2 + 3 : ℤ[X]).eval 1) = 4 := by sorry

/-- The zeroth exterior factor uses reversal: its ordinary polynomial is X−1
and its Euler polynomial is 1−X (README 1.5). -/
example : (X - 1 : ℚ[X]).reverse = 1 - X := by sorry

/-- The top elliptic exterior factor has Euler polynomial 1−qX, also for q=0
as a polynomial identity (README 1.5). -/
example (q : ℚ) : (X - C q).reverse = 1 - C q * X := by sorry

end WeilEstimate

/-! ## The algebraic power-family input of Weil I §6. -/

section WeilI6

/-- Weil I Lemma 6.7: two finite families of elements of a field whose `n`-th powers agree for every large `n` divisible
by no element of a finite set `K ∌ 1` agree up to order (`powers-of-a-family-determine-the-family`). -/
theorem multiset_eq_of_pow_eq {F : Type*} [Field F] [DecidableEq F] (K : Finset ℕ) (hK : 1 ∉ K)
    (δ ε : Multiset F) (h : ∃ N, ∀ n ≥ N, (∀ k ∈ K, ¬ k ∣ n) → δ.map (· ^ n) = ε.map (· ^ n)) : δ = ε := by sorry

end WeilI6


/-! ## Numerical functoriality and purity. -/
section NumericAPI
variable {E V : Type*} [Field E] [CharZero E] [Algebra ℚ E]
  [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- Compatible algebraically closed coefficient extensions use the same minpoly purity. -/
theorem isPure_baseChange_iff {E' : Type*} [Field E'] [Algebra E E'] [Algebra ℚ E']
    [IsScalarTower ℚ E E'] (F : V →ₗ[E] V) (q : ℝ) (n : ℤ) :
    IsPure q n (F.baseChange E') ↔ IsPure q n F := by sorry

theorem iotaWeights_twist (ι : AlgebraicClosure E →+* ℂ) (q : ℝ) (b : Eˣ)
    (F : V →ₗ[E] V) (hF : Function.Bijective F) :
    iotaWeights ι q (twist b F) =
      (iotaWeights ι q F).image (· + iotaWeight ι q (algebraMap E (AlgebraicClosure E) b)) := by sorry

/-- Exterior roots count subsets of eigenvalue positions, including repeated roots. -/
theorem eigenvalues_exteriorPower (F : V →ₗ[E] V) (k d : ℕ)
    (a : Fin d → AlgebraicClosure E)
    (ha : eigenvalues F = (↑(List.ofFn a) : Multiset (AlgebraicClosure E))) :
    eigenvalues (exteriorPower.map k F) =
      ((Finset.univ : Finset (Fin d)).powersetCard k).val.map
        (fun s => ∏ i ∈ s, a i) := by sorry

theorem IsPure.exteriorPower {q : ℝ} (hq : 1 < q) {n : ℤ} {F : V →ₗ[E] V}
    (hF : IsPure q n F) (k : ℕ) :
    IsPure q ((k : ℤ) * n) (exteriorPower.map k F) := by sorry

/-- Test `iotaWeights_singular_twist_rejection`: the total logarithm at zero has no weight shift. -/
example (ι : AlgebraicClosure ℚ →+* ℂ) :
    iotaWeights ι 2 (0 : ℚ →ₗ[ℚ] ℚ) = {0} ∧
    iotaWeights ι 2 ((2 : ℚ) • (0 : ℚ →ₗ[ℚ] ℚ)) ≠ {2} := by sorry

/-- Test `isPure_zero_space`: the zero-dimensional module has no eigenvalues. -/
example (q : ℝ) (n : ℤ) (ι : AlgebraicClosure E →+* ℂ) :
    IsPure q n (LinearMap.id : (Fin 0 → E) →ₗ[E] (Fin 0 → E)) ∧
      iotaWeights ι q (LinearMap.id : (Fin 0 → E) →ₗ[E] (Fin 0 → E)) = ∅ := by sorry

/-- Test `tateTwist_weight`: geometric q⁻¹ on a line has weight −2. -/
example : IsPure 2 (-2) ((2⁻¹ : ℚ) • LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by sorry

/-- Half-weight modulus core: the two square roots differ by a weight-zero sign. -/
example (q : ℝ) (hq : 1 < q) (b : ℂ) (hb : b ^ 2 = (q : ℂ)) :
    IsIotaPure (RingHom.id ℂ) q (-1) b⁻¹ ∧
    IsIotaPure (RingHom.id ℂ) q (-1) (-b)⁻¹ := by sorry

/-- Characteristic roots of the inverse dual, in contrast to the ordinary transpose. -/
theorem eigenvalues_contragredient (F : V ≃ₗ[E] V) :
    eigenvalues F.symm.toLinearMap.dualMap = (eigenvalues F.toLinearMap).map (·⁻¹) := by sorry

/-- Frobenius-stable subquotients require an actual invariant submodule. -/
theorem IsPure.restrict_quotient {q : ℝ} {n : ℤ} (F : V →ₗ[E] V)
    (U : Submodule E V) (hU : ∀ x ∈ U, F x ∈ U) (h : IsPure q n F) :
    IsPure q n (F.restrict hU) ∧ IsPure q n (U.mapQ U F hU) := by sorry

/-- Purity of both an invariant subspace and its quotient characterizes purity of the
ambient Frobenius module; the extension need not split (README 0.9). -/
theorem isPure_restrict_quotient_iff {q : ℝ} {n : ℤ} (F : V →ₗ[E] V)
    (U : Submodule E V) (hU : ∀ x ∈ U, F x ∈ U) :
    IsPure q n F ↔ IsPure q n (F.restrict hU) ∧ IsPure q n (U.mapQ U F hU) := by sorry

/-- The same extension criterion for one fixed complex embedding and a real weight. -/
theorem isIotaPureEnd_restrict_quotient_iff (ι : AlgebraicClosure E →+* ℂ)
    (q β : ℝ) (F : V →ₗ[E] V) (U : Submodule E V) (hU : ∀ x ∈ U, F x ∈ U) :
    IsIotaPureEnd ι q β F ↔
      IsIotaPureEnd ι q β (F.restrict hU) ∧ IsIotaPureEnd ι q β (U.mapQ U F hU) := by sorry

/-- The weights of an extension are the union of those of its two pieces. -/
theorem iotaWeights_restrict_quotient (ι : AlgebraicClosure E →+* ℂ)
    (q : ℝ) (F : V →ₗ[E] V) (U : Submodule E V) (hU : ∀ x ∈ U, F x ∈ U) :
    iotaWeights ι q F = iotaWeights ι q (F.restrict hU) ∪ iotaWeights ι q (U.mapQ U F hU) := by sorry

/-- A tensor-power error bound tends to exact purity; no geometric input is hidden. -/
theorem norm_eq_of_half_unit_powers {q a : ℝ} (hq : 1 < q) {w : ℝ}
    (h : ∀ k : ℕ, 0 < k → q ^ (w - 1 / (2 * k)) ≤ a ∧ a ≤ q ^ (w + 1 / (2 * k))) :
    a = q ^ w := by sorry

/-- The square-improvement numeric limit. -/
theorem le_one_of_square_improvement {w : ℝ} (h : ∀ k : ℕ, w ≤ 1 + (2 : ℝ) ^ (-(k : ℤ))) :
    w ≤ 1 := by sorry

end NumericAPI

/-! ## The genuine pullback-group core of the Weil group.

`G` is the supplied arithmetic fundamental group, `A` its constant-field
quotient, `d` its quotient map, and `geo` the geometric-Frobenius powers.
Equip G with the supplied profinite topology and Multiplicative ℤ with its
standard discrete topology; this subgroup inherits the product topology.
Identify the scheme and base point through the fundamental-group interface in the README.
-/
section WeilGroupCore
variable {G A : Type*} [Group G] [Group A]

def WeilGroup (d : G →* A) (geo : Multiplicative ℤ →* A) : Subgroup (G × Multiplicative ℤ) :=
  (d.comp (MonoidHom.fst G (Multiplicative ℤ))).eqLocus
    (geo.comp (MonoidHom.snd G (Multiplicative ℤ)))

def WeilGroup.degree (d : G →* A) (geo : Multiplicative ℤ →* A) :
    WeilGroup d geo →* Multiplicative ℤ :=
  (MonoidHom.snd G (Multiplicative ℤ)).comp (WeilGroup d geo).subtype

theorem WeilGroup.geometricKernel (d : G →* A) (geo : Multiplicative ℤ →* A)
    (hgeo : Function.Injective geo) (w : WeilGroup d geo) :
    WeilGroup.degree d geo w = 1 ↔ d w.val.1 = 1 := by sorry

theorem WeilGroup.frobenius_degree (d : G →* A) (geo : Multiplicative ℤ →* A)
    (g : G) (e : ℤ) (hg : d g = geo (Multiplicative.ofAdd e)) :
    WeilGroup.degree d geo ⟨(g, Multiplicative.ofAdd e), hg⟩ = Multiplicative.ofAdd e := by sorry

/-- Pull back the degree map along multiplication by a; the new coordinate is relative degree. -/
def WeilGroup.baseExtension (d : G →* A) (geo : Multiplicative ℤ →* A) (a : ℕ) :
    Subgroup (WeilGroup d geo × Multiplicative ℤ) :=
  WeilGroup (WeilGroup.degree d geo)
    { toFun := fun z => z ^ a, map_one' := by simp, map_mul' := by intros; simp [mul_pow] }

/-- Test `weilGroup_point`: the point's Weil group is the graph of the identity of ℤ. -/
example : Function.Bijective (WeilGroup.degree (MonoidHom.id (Multiplicative ℤ))
    (MonoidHom.id (Multiplicative ℤ))) := by sorry

/-- A pullback element has its geometric degree and the opposite arithmetic
coordinate under the specified constant-field maps (README 5.1).
The integer inversion step is `Multiplicative.toAdd_inv`. -/
theorem WeilGroup.arithmeticCoordinate (d : G →* A)
    (geo arith : Multiplicative ℤ →* A) (harith : Function.Injective arith)
    (hquot : ∀ z, geo z = arith z⁻¹) (g : G) (e a : ℤ)
    (hg : d g = geo (Multiplicative.ofAdd e))
    (ha : d g = arith (Multiplicative.ofAdd a)) :
    Multiplicative.toAdd (WeilGroup.degree d geo
      ⟨(g, Multiplicative.ofAdd e), hg⟩) = e ∧ a = -e := by sorry

/-- Test `weilGroup_degree_sign`: geometric Frobenius of degree one has
arithmetic coordinate minus one in the actual pullback group. -/
example (d : G →* A) (geo arith : Multiplicative ℤ →* A)
    (harith : Function.Injective arith) (hquot : ∀ z, geo z = arith z⁻¹)
    (g : G) (a : ℤ) (hg : d g = geo (Multiplicative.ofAdd 1))
    (ha : d g = arith (Multiplicative.ofAdd a)) :
    Multiplicative.toAdd (WeilGroup.degree d geo
      ⟨(g, Multiplicative.ofAdd 1), hg⟩) = 1 ∧ a = -1 := by sorry

/-- Test `weilGroup_base_extension_two`: original degree is twice relative degree. -/
example (d : G →* A) (geo : Multiplicative ℤ →* A)
    (w : WeilGroup.baseExtension d geo 2) :
    Multiplicative.toAdd (WeilGroup.degree d geo w.val.1) =
      2 * Multiplicative.toAdd w.val.2 := by sorry

end WeilGroupCore

/-! ## Punctual purity as the exact numeric closed-stalk predicate.

`X` must be instantiated by the actual closed-point carrier, `V x` by the
supplied stalk, `q x` by its residue cardinality, and `F x` by geometric
Frobenius. The predicate is polymorphic in this genuine family of modules;
global mixed filtrations are specified in the README.
-/
section PunctualCore
variable {X E : Type*} [Field E] [Algebra ℚ E]
  {V : X → Type*} [∀ x, AddCommGroup (V x)] [∀ x, Module E (V x)]
  [∀ x, FiniteDimensional E (V x)]

def IsPunctuallyPure (q : X → ℝ) (n : ℤ) (F : ∀ x, V x →ₗ[E] V x) : Prop :=
  ∀ x, IsPure (q x) n (F x)

def IsPunctuallyIotaPure (ι : AlgebraicClosure E →+* ℂ) (q : X → ℝ) (β : ℝ)
    (F : ∀ x, V x →ₗ[E] V x) : Prop := ∀ x, IsIotaPureEnd ι (q x) β (F x)

/-- Actual weights on a point are computed from its genuine characteristic-root set. -/
example : iotaWeights (E := ℚ) (IsAlgClosed.lift : AlgebraicClosure ℚ →ₐ[ℚ] ℂ).toRingHom 2
    (Matrix.toLin' !![(1 : ℚ), 0; 0, 2]) = {0, 2} := by sorry

/-- Test `punctual_tate_line`: one closed stalk with the Tate action. -/
example : IsPunctuallyPure (E := ℚ) (X := Unit) (V := fun _ => ℚ) (fun _ => 2) (-2)
    (fun _ => (2⁻¹ : ℚ) • LinearMap.id) := by sorry

/-- Test `punctual_zero_weights`: every closed stalk is zero. -/
example (q : X → ℝ) (n : ℤ) :
    IsPunctuallyPure (E := E) (V := fun _ => Fin 0 → E) q n (fun _ => LinearMap.id) := by sorry

/-- Test `mixed_two_tate_weights`: the actual root set is {0,2}, never one pure weight. -/
example : ∀ n : ℤ, ¬ IsPunctuallyPure (X := Unit) (V := fun _ => Fin 2 → ℚ)
    (fun _ => 2) n (fun _ => Matrix.toLin' !![(1 : ℚ), 0; 0, 2]) := by sorry

/-- Test `punctual_jordan`: no arithmetic semisimplicity condition is added. -/
example : IsPunctuallyPure (X := Unit) (V := fun _ => Fin 2 → ℚ)
    (fun _ => 2) 0 (fun _ => Matrix.toLin' !![(1 : ℚ), 1; 0, 1]) := by sorry

/-- A transcendental point scalar with the prescribed modulus has fixed-ι weight
one half and no integer Weil weight (README 5.3). -/
example (b : E) (hb : b ≠ 0) (htrans : ¬ IsAlgebraic ℚ b)
    (ι : AlgebraicClosure E →+* ℂ)
    (hnorm : ‖ι (algebraMap E (AlgebraicClosure E) b)‖ = (2 : ℝ) ^ (1 / 4 : ℝ)) :
    IsPunctuallyIotaPure (E := E) (X := Unit) (V := fun _ => E) ι (fun _ => 2) (1 / 2)
      (fun _ => b • LinearMap.id) ∧
    ∀ n : ℤ, ¬ IsPunctuallyPure (E := E) (X := Unit) (V := fun _ => E) (fun _ => 2) n
      (fun _ => b • LinearMap.id) := by sorry

/-- Zero stalks satisfy fixed-ι punctual purity at every real weight (README 5.3). -/
example (ι : AlgebraicClosure E →+* ℂ) (q : X → ℝ) (β : ℝ) :
    IsPunctuallyIotaPure (V := fun _ => Fin 0 → E) ι q β
      (fun _ => LinearMap.id) := by sorry

/-- The two point weights 0 and 2 cannot equal one fixed real weight (README 5.3). -/
example (ι : AlgebraicClosure ℚ →+* ℂ) :
    ∀ β : ℝ, ¬ IsPunctuallyIotaPure (X := Unit) (V := fun _ => Fin 2 → ℚ)
      ι (fun _ => 2) β (fun _ => Matrix.toLin' !![(1 : ℚ), 0; 0, 2]) := by sorry

end PunctualCore

/-! ## The actual additive-valuation core of the stalk Newton polygon.

Its input is the nonzero characteristic-root multiset at one closed stalk.
The supplied q is its residue cardinality in K; v(q) must be finite positive.
The vertices below determine the piecewise-linear polygon. No F-isocrystal
category or specialization theorem is assumed by this numeric construction.
-/
section NewtonCore
variable {K : Type*} [Field K]

noncomputable def stalkNewtonPolygon (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) : List (ℕ × ℚ) := by
  classical
  let slopes := (s.map fun α => (v α).untopD 0 / (v q).untopD 0).sort (· ≤ ·)
  exact (List.range (slopes.length + 1)).map fun k => (k, (slopes.take k).sum)

theorem stalkNewtonPolygon_zero (v : AddValuation K (WithTop ℚ)) (q : K) (s : Multiset K) :
    (stalkNewtonPolygon v q s)[0]? = some (0, 0) := by sorry

theorem stalkNewtonPolygon_endpoint (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) :
    (stalkNewtonPolygon v q s).getLast? =
      some (s.card, (s.map fun α => (v α).untopD 0 / (v q).untopD 0).sum) := by sorry

/-- The kth ordinate is the minimum sum of k normalized slopes. With nonzero
roots and finite valuations, additive multiplicativity identifies these with
valuations of kth exterior-power roots. -/
theorem stalkNewtonPolygon_exterior (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) (k : ℕ) (hk : k ≤ s.card) :
    ∃ y : ℚ, (stalkNewtonPolygon v q s)[k]? = some (k, y) ∧
      (∀ t : Multiset K, t ≤ s → t.card = k →
        y ≤ (t.map fun α => (v α).untopD 0 / (v q).untopD 0).sum) ∧
      (∃ t : Multiset K, t ≤ s ∧ t.card = k ∧
        y = (t.map fun α => (v α).untopD 0 / (v q).untopD 0).sum) := by sorry

theorem stalkNewtonPolygon_baseExtension (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) (n : ℕ) (hn : 0 < n) (hq : q ≠ 0) (hs : ∀ α ∈ s, α ≠ 0) :
    stalkNewtonPolygon v (q ^ n) (s.map (· ^ n)) = stalkNewtonPolygon v q s := by sorry

theorem stalkNewtonPolygon_tateTwist (v : AddValuation K (WithTop ℚ)) (q : K)
    (s : Multiset K) (a : ℤ) (hq : q ≠ 0) (hs : ∀ α ∈ s, α ≠ 0)
    (hv : ∃ b : ℚ, 0 < b ∧ v q = b) :
    stalkNewtonPolygon v q (s.map fun α => α * q ^ (-a)) =
      (stalkNewtonPolygon v q s).map fun p => (p.1, p.2 - (p.1 : ℚ) * (a : ℚ)) := by sorry

/-- Test `newton_two_slopes`: the spectrum of diag(1,2), with v(2)=1. -/
example (v : AddValuation ℚ (WithTop ℚ)) (hv : v 2 = 1) :
    stalkNewtonPolygon v 2 {1, 2} = [(0, 0), (1, 0), (2, 1)] := by sorry

/-- Test `newton_empty`: the polygon of the zero-dimensional stalk. -/
example (v : AddValuation K (WithTop ℚ)) (q : K) :
    stalkNewtonPolygon v q 0 = [(0, 0)] := by sorry

/-- Test `newton_base_extension`: power both q and Frobenius, keeping slopes 0,1. -/
example (v : AddValuation ℚ (WithTop ℚ)) (hv : v 2 = 1) :
    stalkNewtonPolygon v 4 {1, 4} = [(0, 0), (1, 0), (2, 1)] := by sorry

end NewtonCore

/-! ## Counterexamples distinguishing integer and fixed-embedding purity. -/
section NumericCounterexamples
/-- Test `not_isWeilNumber_one_add_sqrt_two`: unequal conjugate moduli. -/
example (q : ℝ) (hq : 1 < q) (n : ℤ) :
    ¬ IsWeilNumber q n ((1 : ℝ) + Real.sqrt 2) := by sorry

/-- Test `iotaWeight_depends_on_iota`: the two embeddings of ℚ(√2). -/
example {E : Type*} [Field E] (s : E) (hs : s ^ 2 = 2)
    (iotaPlus iotaMinus : E →+* ℂ) (hPlus : iotaPlus s = (Real.sqrt 2 : ℂ))
    (hMinus : iotaMinus s = -(Real.sqrt 2 : ℂ)) :
    iotaWeight iotaPlus 2 (1 + s) = 2 * Real.logb 2 (1 + Real.sqrt 2) ∧
    iotaWeight iotaMinus 2 (1 + s) = -2 * Real.logb 2 (1 + Real.sqrt 2) := by sorry

/-- Test `iotaWeight_transcendental`: a supplied transcendental image with this modulus.
This tests the definition; it does not assume a Lindemann–Weierstrass theorem. -/
example {E : Type*} [Field E] [Algebra ℚ E] (t : E) (ht : ¬ IsAlgebraic ℚ t)
    (ι : E →+* ℂ) (hi : ‖ι t‖ = Real.sqrt 2) :
    IsIotaPure ι 2 1 t ∧ ∀ n : ℤ, ¬ IsWeilNumber 2 n t := by sorry

/-- Test `eigenvalues_rotation`: a rational operator need not split over ℚ. -/
example : (Matrix.toLin' !![(0 : ℚ), -2; 1, 0]).charpoly = X ^ 2 + 2 ∧
    IsPure (E := ℚ) 2 1 (Matrix.toLin' !![(0 : ℚ), -2; 1, 0]) := by sorry

/-- Test `halfTwist_depends_on_sqrt`: distinct eigenvalues for the two choices. -/
example (b : ℂ) (hb : b ^ 2 = 2) :
    b⁻¹ ≠ (-b)⁻¹ ∧ IsWeilNumber 2 (-1) b⁻¹ ∧ IsWeilNumber 2 (-1) (-b)⁻¹ := by sorry

/-- Test `twist_nonintegral_weight`: integer Weil purity requires algebraicity. -/
example (b : ℂ) (hb : ¬ IsAlgebraic ℚ b) (hnorm : ‖b‖ = (2 : ℝ) ^ (1 / 4 : ℝ)) :
    IsIotaPure (RingHom.id ℂ) 2 (1 / 2) b ∧ ∀ n : ℤ, ¬ IsWeilNumber 2 n b := by sorry

/-- Test `isWeilNumber_rootOfUnity`, zero non-example. -/
example {q : ℝ} (hq : 1 < q) (n : ℤ) : ¬ IsWeilNumber q n (0 : ℚ) := by sorry

/-- Repeated roots remain repeated when a polynomial merges their values
(README 0.11): squaring diag(2,-2) has two roots equal to 4. -/
example : eigenvalues ((Matrix.toLin' !![(2 : ℚ), 0; 0, -2]) ^ 2) = {4, 4} := by sorry

/-- A reciprocal pairing sees the full Jordan block, not just its eigenline
(README 0.16). Here the scalar is 3 and the paired operator is 3 times the inverse transpose. -/
example :
    let F := Matrix.toLin' !![(2 : ℚ), 1; 0, 2]
    let G := Matrix.toLin' !![(3 / 2 : ℚ), 0; -3 / 4, 3 / 2]
    (∀ x y : Fin 2 → ℚ, (∑ i, F x i * G y i) = 3 * ∑ i, x i * y i) ∧
      eigenvalues G = {3 / 2, 3 / 2} ∧
      Module.finrank (AlgebraicClosure ℚ)
        (Module.End.maxGenEigenspace (G.baseChange (AlgebraicClosure ℚ)) (3 / 2)) = 2 := by sorry

/-- Distinct operators on the same line can pair perfectly without reciprocal
symmetry of either spectrum (README 0.16). -/
example :
    (∀ x y : ℚ, (2 * x) * (3 * y) = 6 * (x * y)) ∧
      eigenvalues ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = {2} ∧
      eigenvalues ((3 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) = {3} ∧
      (eigenvalues ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ))).map
        (fun α => 6 / α) ≠ eigenvalues ((2 : ℚ) • (LinearMap.id : ℚ →ₗ[ℚ] ℚ)) := by sorry

/-- Positive traces fail to determine the characteristic polynomial in characteristic
p, even when dimensions agree (README 0.10). -/
example (p : ℕ) [Fact p.Prime] :
    let F : (Fin p → ZMod p) →ₗ[ZMod p] (Fin p → ZMod p) := LinearMap.id
    let G : (Fin p → ZMod p) →ₗ[ZMod p] (Fin p → ZMod p) := 0
    (∀ k : ℕ, 0 < k → LinearMap.trace (ZMod p) (Fin p → ZMod p) (F ^ k) =
      LinearMap.trace (ZMod p) (Fin p → ZMod p) (G ^ k)) ∧ F.charpoly ≠ G.charpoly := by sorry

/-- Purity of the zero space is vacuous but its zeroth exterior power is a line.
This catches an exterior-purity statement that drops `q > 1` (README 0.14). -/
example :
    IsPure 1 0 (LinearMap.id : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℚ)) ∧
      ¬ IsPure 1 0 (exteriorPower.map 0
        (LinearMap.id : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℚ))) := by sorry

/-- The rational operator with eigenvalues 1 ± √2 has no rational stable line;
its fixed-ι weight lines therefore require coefficient extension (README 0.18). -/
example :
    let F := Matrix.toLin' !![(1 : ℚ), 2; 1, 1]
    ∀ U : Submodule ℚ (Fin 2 → ℚ), (∀ x ∈ U, F x ∈ U) → Module.finrank ℚ U ≠ 1 := by sorry

/-- Every complex embedding gives the repeated Jordan root weight two, while
rotation roots have weight one (README 0.7). -/
example (ι : AlgebraicClosure ℚ →+* ℂ) :
    IsIotaPureEnd ι 2 2 (Matrix.toLin' !![(2 : ℚ), 1; 0, 2]) ∧
      IsIotaPureEnd ι 2 1 (Matrix.toLin' !![(0 : ℚ), -2; 1, 0]) ∧
      iotaWeights ι 2 (Matrix.toLin' !![(0 : ℚ), -2; 1, 0]) = {1} := by sorry

end NumericCounterexamples

/-! ## Stalkwise operations. A mixed subsheaf filtration still requires the genuine category. -/
section PunctualOperations
variable {X E : Type*} [Field E] [Algebra ℚ E]
  {V W : X → Type*}
  [∀ x, AddCommGroup (V x)] [∀ x, Module E (V x)] [∀ x, FiniteDimensional E (V x)]
  [∀ x, AddCommGroup (W x)] [∀ x, Module E (W x)] [∀ x, FiniteDimensional E (W x)]

theorem pure_zero (q : X → ℝ) (n : ℤ) :
    IsPunctuallyPure (E := E) (V := fun _ => Fin 0 → E) q n (fun _ => LinearMap.id) := by sorry

theorem pure_subquotient (q : X → ℝ) (n : ℤ) (F : ∀ x, V x →ₗ[E] V x)
    (U : ∀ x, Submodule E (V x)) (hU : ∀ x v, v ∈ U x → F x v ∈ U x)
    (h : IsPunctuallyPure q n F) :
    IsPunctuallyPure q n (fun x => (F x).restrict (hU x)) ∧
      IsPunctuallyPure q n (fun x => (U x).mapQ (U x) (F x) (hU x)) := by sorry

theorem pure_tensor (q : X → ℝ) (n m : ℤ) (F : ∀ x, V x →ₗ[E] V x)
    (H : ∀ x, W x →ₗ[E] W x) (hF : IsPunctuallyPure q n F) (hH : IsPunctuallyPure q m H) :
    IsPunctuallyPure q (n + m) (fun x => TensorProduct.map (F x) (H x)) := by sorry

theorem pure_tateTwist (q : X → ℕ) (hq : ∀ x, (q x : E) ≠ 0) (n : ℤ)
    (F : ∀ x, V x →ₗ[E] V x) (hF : IsPunctuallyPure (fun x => q x) n F) (r : ℤ) :
    IsPunctuallyPure (fun x => q x) (n - 2 * r)
      (fun x => tateTwist (Units.mk0 (q x : E) (hq x)) r (F x)) := by sorry

end PunctualOperations

/-! ## Reality of local characteristic-polynomial coefficients. -/
section RealityCore
variable {X E : Type*} [Field E] [Algebra ℚ E]
  {V : X → Type*} [∀ x, AddCommGroup (V x)] [∀ x, Module E (V x)]
  [∀ x, FiniteDimensional E (V x)]

def IsTotallyReal (F : ∀ x, V x →ₗ[E] V x) : Prop :=
  ∀ x k, IsAlgebraic ℚ ((F x).charpoly.coeff k) ∧
    ∀ z ∈ (minpoly ℚ ((F x).charpoly.coeff k)).aroots ℂ, z.im = 0

def IsIotaReal (ι : E →+* ℂ) (F : ∀ x, V x →ₗ[E] V x) : Prop :=
  ∀ x k, (ι ((F x).charpoly.coeff k)).im = 0

theorem totallyReal_iotaReal (ι : E →+* ℂ) (F : ∀ x, V x →ₗ[E] V x)
    (h : IsTotallyReal F) : IsIotaReal ι F := by sorry

/-- The real envelope on actual stalks; scalar b has the required positive ι-image. -/
theorem pure_real_envelope (ι : AlgebraicClosure E →+* ℂ) (q : X → ℝ) (β : ℝ)
    (F : ∀ x, V x ≃ₗ[E] V x) (b : X → Eˣ) (hq : ∀ x, 1 < q x)
    (hF : IsPunctuallyIotaPure ι q β (fun x => (F x).toLinearMap))
    (hb : ∀ x, ι (algebraMap E (AlgebraicClosure E) (b x)) = ((q x ^ β : ℝ) : ℂ)) :
    IsIotaReal (ι.comp (algebraMap E (AlgebraicClosure E)))
      (fun x => LinearMap.prodMap (F x).toLinearMap (twist (b x) (F x).symm.toLinearMap.dualMap)) := by sorry

/-- Test `real_nonreal_roots`: a real polynomial may have no real root. -/
example : IsTotallyReal (X := Unit) (E := ℚ) (V := fun _ => Fin 2 → ℚ)
    (fun _ => Matrix.toLin' !![(0 : ℚ), -2; 1, 1]) ∧
    (∀ z : ℂ, z ^ 2 - z + 2 = 0 → z.im ≠ 0) := by sorry

/-- Test `real_zero`: the zero stalk has characteristic polynomial one. -/
example : IsTotallyReal (X := Unit) (E := ℚ) (V := fun _ => Fin 0 → ℚ)
    (fun _ => LinearMap.id) := by sorry

/-- Test `real_envelope_line`: the reciprocal-normalized pair has coefficient 6/5. -/
example : IsIotaReal (X := Unit) (E := ℂ) (V := fun _ => Fin 2 → ℂ) (RingHom.id ℂ)
    (fun _ => Matrix.toLin' !![((3 + 4 * Complex.I) / 5 : ℂ), 0;
      0, (3 - 4 * Complex.I) / 5]) ∧
    (Matrix.toLin' !![((3 + 4 * Complex.I) / 5 : ℂ), 0;
      0, (3 - 4 * Complex.I) / 5]).charpoly = Polynomial.X ^ 2 - C (6 / 5) * Polynomial.X + 1 := by sorry

/-- The point line with scalar √2 is totally real and has an irrational coefficient
(README 5.4). -/
example : IsTotallyReal (X := Unit) (E := ℝ) (V := fun _ => ℝ)
    (fun _ => Real.sqrt 2 • LinearMap.id) ∧
    ¬ ∃ r : ℚ, Real.sqrt 2 = (r : ℝ) := by sorry

/-- The real cube root of 2 is real in the usual embedding but not totally real
(README 5.4). -/
example (s : ℝ) (hs : s ^ 3 = 2) :
    IsIotaReal (X := Unit) (E := ℝ) (V := fun _ => ℝ) Complex.ofRealHom
      (fun _ => s • LinearMap.id) ∧
    ¬ IsTotallyReal (X := Unit) (E := ℝ) (V := fun _ => ℝ)
      (fun _ => s • LinearMap.id) := by sorry

/-- The point line with scalar i fails reality in the usual embedding (README 5.4). -/
example : ¬ IsIotaReal (X := Unit) (E := ℂ) (V := fun _ => ℂ) (RingHom.id ℂ)
    (fun _ => Complex.I • LinearMap.id) := by sorry

end RealityCore


/-! ## Spectral mapping and weight decomposition (DWP.0)
-/
section ComplexEmbeddings
variable {E k : Type} [Field E] [CharZero E] [Field k] [Countable k]

/-- Extend a prescribed embedding of a countable subfield; cardinality alone does
not give compatibility with the prescribed embedding. -/
theorem complex_embedding_extends (j : k →+* E) (σ : k →+* ℂ)
    (hcard : Cardinal.mk E ≤ Cardinal.mk ℂ) :
    ∃ ι : E →+* ℂ, ι.comp j = σ := by sorry

theorem complex_isomorphism_extends [IsAlgClosed E] (j : k →+* E) (σ : k →+* ℂ)
    (hcard : Cardinal.mk E = Cardinal.mk ℂ) :
    ∃ ι : E ≃+* ℂ, ι.toRingHom.comp j = σ := by sorry

theorem isWeilNumber_iff_all_complex_embeddings [Algebra ℚ E]
    (hcard : Cardinal.mk E ≤ Cardinal.mk ℂ) {q : ℝ} (hq : 1 < q) {n : ℤ} {α : E} :
    IsWeilNumber q n α ↔ ∀ ι : E →+* ℂ, ‖ι α‖ = q ^ ((n : ℝ) / 2) := by sorry

/-- A prescribed transcendental image can be obtained by first identifying the
rational function subfields (README 0.5(iv); Weil II (1.2.11), p. 156). -/
theorem complex_embedding_prescribed_transcendental [Algebra ℚ E]
    (hcard : Cardinal.mk E ≤ Cardinal.mk ℂ) (α : E) (hα : ¬ IsAlgebraic ℚ α)
    (z : ℂ) (hz : ¬ IsAlgebraic ℚ z) : ∃ ι : E →+* ℂ, ι α = z := by sorry

theorem complex_isomorphism_prescribed_transcendental [Algebra ℚ E] [IsAlgClosed E]
    (hcard : Cardinal.mk E = Cardinal.mk ℂ) (α : E) (hα : ¬ IsAlgebraic ℚ α)
    (z : ℂ) (hz : ¬ IsAlgebraic ℚ z) : ∃ ι : E ≃+* ℂ, ι α = z := by sorry

/-- The cardinality input needed for the chosen p-adic coefficient isomorphism
(README 0.5(iii); Weil II (1.2.11), p. 156). -/
theorem cardinal_padic_and_algebraicClosure (p : ℕ) [Fact p.Prime] :
    Cardinal.mk ℚ_[p] = Cardinal.mk ℂ ∧
      Cardinal.mk (AlgebraicClosure ℚ_[p]) = Cardinal.mk ℂ := by sorry

/-- Specifying the embedding of the countable subfield remains part of the
p-adic coefficient isomorphism, rather than just its cardinality. -/
theorem padic_complex_isomorphism_extends (p : ℕ) [Fact p.Prime]
    (j : k →+* AlgebraicClosure ℚ_[p]) (σ : k →+* ℂ) :
    ∃ ι : AlgebraicClosure ℚ_[p] ≃+* ℂ, ι.toRingHom.comp j = σ := by sorry

/-- For an algebraically closed coefficient field of continuum cardinality, all
isomorphisms suffice in the all-embeddings purity criterion (README 0.6). -/
theorem isWeilNumber_iff_all_complex_isomorphisms [Algebra ℚ E] [IsAlgClosed E]
    (hcard : Cardinal.mk E = Cardinal.mk ℂ) {q : ℝ} (hq : 1 < q) {n : ℤ} {α : E} :
    IsWeilNumber q n α ↔ ∀ ι : E ≃+* ℂ, ‖ι α‖ = q ^ ((n : ℝ) / 2) := by sorry

end ComplexEmbeddings

section FurtherSpectral
variable {E V : Type*} [Field E] [Algebra ℚ E]
    [AddCommGroup V] [Module E V] [FiniteDimensional E V]

theorem eigenvalues_polynomial (F : V →ₗ[E] V) (p : E[X]) :
    eigenvalues (aeval F p) = (eigenvalues F).map
      (fun α => p.eval₂ (algebraMap E (AlgebraicClosure E)) α) := by sorry

/-- The kernel decomposition specifies both existence and uniqueness of the
summands, with genuine rational-polynomial purity. -/
theorem weight_decomposition (F : V ≃ₗ[E] V) {q : ℝ} (hq : 1 < q)
    (hweights : ∀ α ∈ eigenvalues F.toLinearMap, ∃ n : ℤ, IsWeilNumber q n α) :
    ∃ s : Finset ℤ, ∃ p : ℤ → E[X],
      F.toLinearMap.charpoly = ∏ n ∈ s, p n ∧
      (∀ n ∈ s, (p n).Monic ∧
        ∀ α ∈ (p n).aroots (AlgebraicClosure E), IsWeilNumber q n α) ∧
      ∀ v : V, ∃! pieces : s → V,
        (∀ n : s, aeval F.toLinearMap (p n) (pieces n) = 0) ∧
        (∑ n : s, pieces n) = v := by sorry

/-- Newton identities express all positive-power traces by the root multiset. -/
theorem trace_pow_eq_sum_eigenvalues (F : V →ₗ[E] V) (n : ℕ) :
    algebraMap E (AlgebraicClosure E) (LinearMap.trace E V (F ^ n)) =
      ((eigenvalues F).map fun α => α ^ n).sum := by sorry

/-- Finite trace determinacy (README 0.10(iii), Weil I (1.5.3), p. 275).
Equal dimensions are essential: positive traces do not see extra zero roots. -/
theorem charpoly_eq_of_trace_powers [CharZero E]
    {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (F : V →ₗ[E] V) (G : W →ₗ[E] W)
    (hdim : Module.finrank E V = Module.finrank E W)
    (htrace : ∀ k : ℕ, 1 ≤ k → k ≤ Module.finrank E V →
      LinearMap.trace E V (F ^ k) = LinearMap.trace E W (G ^ k)) :
    F.charpoly = G.charpoly ∧ F.charpoly.reverse = G.charpoly.reverse ∧
      eigenvalues F = eigenvalues G := by sorry

/-- Polynomial spectral mapping retains every generalized eigenvector, even when
several characteristic roots have the same polynomial image (README 0.11). -/
theorem maxGenEigenspace_le_polynomial (F : V →ₗ[E] V) (p : E[X])
    (α : AlgebraicClosure E) :
    Module.End.maxGenEigenspace (F.baseChange (AlgebraicClosure E)) α ≤
      Module.End.maxGenEigenspace ((aeval F p).baseChange (AlgebraicClosure E))
        (p.eval₂ (algebraMap E (AlgebraicClosure E)) α) := by sorry

/-- Inverse spectral mapping before taking a dual (README 0.11). -/
theorem eigenvalues_inverse (F : V ≃ₗ[E] V) :
    eigenvalues F.symm.toLinearMap = (eigenvalues F.toLinearMap).map (·⁻¹) := by sorry

/-- Finite constant-field extension reflects purity, including root collisions
(README 0.12; Weil II (1.1.13), p. 152). -/
theorem isPure_pow_iff (F : V ≃ₗ[E] V) {q : ℝ} (hq : 1 < q)
    (n : ℤ) {r : ℕ} (hr : 0 < r) :
    IsPure (q ^ r) n (F.toLinearMap ^ r) ↔ IsPure q n F.toLinearMap := by sorry

theorem isIotaPureEnd_pow_iff (ι : AlgebraicClosure E →+* ℂ)
    (F : V ≃ₗ[E] V) {q : ℝ} (hq : 1 < q) (β : ℝ) {r : ℕ} (hr : 0 < r) :
    IsIotaPureEnd ι (q ^ r) β (F.toLinearMap ^ r) ↔
      IsIotaPureEnd ι q β F.toLinearMap := by sorry

/-- A multiset equality, rather than only the equality of weight sets. -/
theorem iotaWeight_multiset_pow (ι : AlgebraicClosure E →+* ℂ)
    (F : V ≃ₗ[E] V) {q : ℝ} (hq : 1 < q) {r : ℕ} (hr : 0 < r) :
    (eigenvalues (F.toLinearMap ^ r)).map (iotaWeight ι (q ^ r)) =
      (eigenvalues F.toLinearMap).map (iotaWeight ι q) := by sorry

/-- Different integer pure weights have no intertwiner (README 0.17(i)). -/
theorem eq_zero_of_pure_weights
    {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    {q : ℝ} (hq : 1 < q) {n m : ℤ} (hnm : n ≠ m)
    (F : V →ₗ[E] V) (G : W →ₗ[E] W) (hF : IsPure q n F) (hG : IsPure q m G)
    (u : V →ₗ[E] W) (hu : u ∘ₗ F = G ∘ₗ u) : u = 0 := by sorry

theorem eq_zero_of_iotaPure_weights
    {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (ι : AlgebraicClosure E →+* ℂ) {q : ℝ} (hq : 1 < q) {β γ : ℝ} (hβγ : β ≠ γ)
    (F : V →ₗ[E] V) (G : W →ₗ[E] W)
    (hF : IsIotaPureEnd ι q β F) (hG : IsIotaPureEnd ι q γ G)
    (u : V →ₗ[E] W) (hu : u ∘ₗ F = G ∘ₗ u) : u = 0 := by sorry

/-- A distinct-weight extension has a unique stable complement; vector-space
splitting alone would not give uniqueness (README 0.17(ii), Weil I p. 277). -/
theorem existsUnique_invariant_complement_of_pure
    (F : V →ₗ[E] V) (U : Submodule E V) (hU : ∀ x ∈ U, F x ∈ U)
    {q : ℝ} (hq : 1 < q) {n m : ℤ} (hnm : n ≠ m)
    (hsub : IsPure q n (F.restrict hU)) (hquot : IsPure q m (U.mapQ U F hU)) :
    ∃! C : Submodule E V, IsCompl U C ∧ ∀ x ∈ C, F x ∈ C := by sorry

theorem existsUnique_invariant_complement_of_iotaPure
    (ι : AlgebraicClosure E →+* ℂ) (F : V →ₗ[E] V)
    (U : Submodule E V) (hU : ∀ x ∈ U, F x ∈ U)
    {q : ℝ} (hq : 1 < q) {β γ : ℝ} (hβγ : β ≠ γ)
    (hsub : IsIotaPureEnd ι q β (F.restrict hU))
    (hquot : IsIotaPureEnd ι q γ (U.mapQ U F hU)) :
    ∃! C : Submodule E V, IsCompl U C ∧ ∀ x ∈ C, F x ∈ C := by sorry

/-- The descended integer summands are stable, pure, and have precisely the
weight-factor characteristic polynomials (README 0.18(i), Weil I p. 277).
The coefficient field has characteristic zero, so it is perfect. -/
theorem weight_decomposition_stable_pure (F : V ≃ₗ[E] V) {q : ℝ} (hq : 1 < q)
    (hweights : ∀ α ∈ eigenvalues F.toLinearMap, ∃ n : ℤ, IsWeilNumber q n α) :
    ∃ s : Finset ℤ, ∃ p : ℤ → E[X],
      F.toLinearMap.charpoly = ∏ n ∈ s, p n ∧
      (∀ n : ℤ, (p n).Monic) ∧ (∀ n ∉ s, p n = 1) ∧
      let 𝒱 := fun n : ℤ => LinearMap.ker (aeval F.toLinearMap (p n))
      DirectSum.IsInternal 𝒱 ∧
      ∃ hstable : ∀ n : ℤ, ∀ x ∈ 𝒱 n, F x ∈ 𝒱 n,
        ∀ n : ℤ, IsPure q n (F.toLinearMap.restrict (hstable n)) ∧
          (F.toLinearMap.restrict (hstable n)).charpoly = p n := by sorry

/-- Equivariant maps preserve any descended pure-weight decomposition
(README 0.18(iii)); no choice of an eigenbasis or semisimplicity. -/
theorem weight_decomposition_functorial
    {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (F : V →ₗ[E] V) (G : W →ₗ[E] W) {q : ℝ} (hq : 1 < q)
    (𝒱 : ℤ → Submodule E V) (𝒲 : ℤ → Submodule E W)
    (h𝒱 : DirectSum.IsInternal 𝒱) (h𝒲 : DirectSum.IsInternal 𝒲)
    (hF : ∀ n, ∀ x ∈ 𝒱 n, F x ∈ 𝒱 n) (hG : ∀ n, ∀ x ∈ 𝒲 n, G x ∈ 𝒲 n)
    (hpF : ∀ n, IsPure q n (F.restrict (hF n)))
    (hpG : ∀ n, IsPure q n (G.restrict (hG n)))
    (u : V →ₗ[E] W) (hu : u ∘ₗ F = G ∘ₗ u) (n : ℤ) :
    (𝒱 n).map u ≤ 𝒲 n := by sorry

/-- Fixed-ι real summands live over the algebraic closure, unlike the descended
integer summands. Their restriction is pure in the split-field sense: every
characteristic root has that real weight (README 0.18(ii)). -/
theorem iota_weight_decomposition (ι : AlgebraicClosure E →+* ℂ)
    (F : V ≃ₗ[E] V) {q : ℝ} (hq : 1 < q) :
    letI : AddCommGroup (AlgebraicClosure E ⊗[E] V) := TensorProduct.addCommGroup
    let Fbar := F.toLinearMap.baseChange (AlgebraicClosure E)
    let 𝒱 : ℝ → Submodule (AlgebraicClosure E) (AlgebraicClosure E ⊗[E] V) :=
      fun β : ℝ => ⨆ α : AlgebraicClosure E, ⨆ (_ : IsIotaPure ι q β α),
      Module.End.maxGenEigenspace Fbar α
    DirectSum.IsInternal 𝒱 ∧
      (∃ s : Finset ℝ, ∀ β ∉ s, 𝒱 β = ⊥) ∧
      ∃ hstable : ∀ β, ∀ x ∈ 𝒱 β, Fbar x ∈ 𝒱 β,
        ∀ (β : ℝ) (α : AlgebraicClosure E), α ∈ (Fbar.restrict (hstable β)).charpoly.roots → IsIotaPure ι q β α := by sorry

/-- The base-changed intertwiner transports real-weight generalized-eigenspace
sums to the same real weight in the target (README 0.18(iii)). -/
theorem iota_weight_decomposition_functorial
    {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (ι : AlgebraicClosure E →+* ℂ) (q β : ℝ)
    (F : V →ₗ[E] V) (G : W →ₗ[E] W)
    (u : V →ₗ[E] W) (hu : u ∘ₗ F = G ∘ₗ u) :
    (⨆ α : AlgebraicClosure E, ⨆ (_ : IsIotaPure ι q β α),
      Module.End.maxGenEigenspace (F.baseChange (AlgebraicClosure E)) α).map
        (u.baseChange (AlgebraicClosure E)) ≤
      ⨆ α : AlgebraicClosure E, ⨆ (_ : IsIotaPure ι q β α),
        Module.End.maxGenEigenspace (G.baseChange (AlgebraicClosure E)) α := by sorry

/-- The pairing identifies the second operator with the scalar times the inverse dual
of the first (README 0.16(i); Weil I (2.5), p. 281). -/
theorem pairing_dual_identification (F : V ≃ₗ[E] V) {W : Type*}
    [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (F' : W →ₗ[E] W) (B : V →ₗ[E] W →ₗ[E] E) (hB : Function.Bijective B)
    (c : E) (hc : c ≠ 0) (hFF' : ∀ x y, B (F x) (F' y) = c * B x y) :
    Function.Bijective B.flip ∧
      B.flip.comp F' = (c • F.symm.toLinearMap.dualMap).comp B.flip := by sorry

/-- A polynomial version of the reciprocal characteristic identity, avoiding a rational
function variable (README 0.16(ii)). The degree is the dimension even in dimension zero. -/
theorem charpoly_of_pairing (F : V ≃ₗ[E] V) {W : Type*}
    [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (F' : W →ₗ[E] W) (B : V →ₗ[E] W →ₗ[E] E) (hB : Function.Bijective B)
    (c : E) (hc : c ≠ 0) (hFF' : ∀ x y, B (F x) (F' y) = c * B x y) :
    F'.charpoly =
      C (((-1 : E) ^ Module.finrank E V * c ^ Module.finrank E V) /
        LinearMap.det F.toLinearMap) *
        F.toLinearMap.charpoly.reverse.comp (C c⁻¹ * X) := by sorry

/-- After extension to a splitting field, nonreciprocal maximal generalized eigenspaces
are orthogonal and reciprocal ones pair perfectly (README 0.16(iii)).
This statement applies to the scalar extension of the original perfect pairing. -/
theorem pairing_maxGenEigenspaces [IsAlgClosed E] (F : V ≃ₗ[E] V) {W : Type*}
    [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (F' : W →ₗ[E] W) (B : V →ₗ[E] W →ₗ[E] E) (hB : Function.Bijective B)
    (c : E) (hc : c ≠ 0) (hFF' : ∀ x y, B (F x) (F' y) = c * B x y) :
    (∀ α β : E, α * β ≠ c →
      ∀ x ∈ Module.End.maxGenEigenspace F.toLinearMap α,
      ∀ y ∈ Module.End.maxGenEigenspace F' β, B x y = 0) ∧
    (∀ α : E, α ≠ 0 → Function.Bijective
      (B.compl₁₂ (Module.End.maxGenEigenspace F.toLinearMap α).subtype
        (Module.End.maxGenEigenspace F' (c / α)).subtype)) := by sorry

/-- The target scalar contributes its weight and inverse duality subtracts the first
weight (README 0.16(iv); Weil I (2.5), p. 281). -/
theorem isPure_of_pairing (F : V ≃ₗ[E] V) {W : Type*}
    [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (F' : W →ₗ[E] W) (B : V →ₗ[E] W →ₗ[E] E) (hB : Function.Bijective B)
    (c : E) (hc : c ≠ 0) (hFF' : ∀ x y, B (F x) (F' y) = c * B x y)
    {q : ℝ} {n w : ℤ} (hF : IsPure q n F.toLinearMap) (hcw : IsWeilNumber q w c) :
    IsPure q (w - n) F' := by sorry

theorem isIotaPureEnd_of_pairing (ι : AlgebraicClosure E →+* ℂ)
    (F : V ≃ₗ[E] V) {W : Type*}
    [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (F' : W →ₗ[E] W) (B : V →ₗ[E] W →ₗ[E] E) (hB : Function.Bijective B)
    (c : E) (hc : c ≠ 0) (hFF' : ∀ x y, B (F x) (F' y) = c * B x y)
    {q β γ : ℝ} (hF : IsIotaPureEnd ι q β F.toLinearMap)
    (hcw : IsIotaPure ι q γ (algebraMap E (AlgebraicClosure E) c)) :
    IsIotaPureEnd ι q (γ - β) F' := by sorry

/-- Tensor and Hom Frobenius weights, including multiplicities through the root formulas
above (README 0.13; Weil II (1.2.5)(ii), p. 154). Hom acts by `u ↦ G ∘ u ∘ F⁻¹`. -/
theorem IsPure.tensor {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    {q : ℝ} {n m : ℤ} {F : V →ₗ[E] V} {G : W →ₗ[E] W}
    (hF : IsPure q n F) (hG : IsPure q m G) :
    IsPure q (n + m) (TensorProduct.map F G) := by sorry

theorem IsIotaPureEnd.tensor {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] {ι : AlgebraicClosure E →+* ℂ} {q β γ : ℝ}
    {F : V →ₗ[E] V} {G : W →ₗ[E] W}
    (hF : IsIotaPureEnd ι q β F) (hG : IsIotaPureEnd ι q γ G) :
    IsIotaPureEnd ι q (β + γ) (TensorProduct.map F G) := by sorry

theorem IsPure.contragredient {q : ℝ} {n : ℤ} (F : V ≃ₗ[E] V)
    (hF : IsPure q n F.toLinearMap) :
    IsPure q (-n) F.symm.toLinearMap.dualMap := by sorry

theorem IsIotaPureEnd.contragredient {ι : AlgebraicClosure E →+* ℂ} {q β : ℝ}
    (F : V ≃ₗ[E] V) (hF : IsIotaPureEnd ι q β F.toLinearMap) :
    IsIotaPureEnd ι q (-β) F.symm.toLinearMap.dualMap := by sorry

theorem IsPure.hom {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    {q : ℝ} {n m : ℤ} (F : V ≃ₗ[E] V) (G : W →ₗ[E] W)
    (hF : IsPure q n F.toLinearMap) (hG : IsPure q m G) :
    IsPure q (m - n) ((LinearMap.llcomp E V W W G).comp (LinearMap.lcomp E W F.symm.toLinearMap)) := by sorry

theorem IsIotaPureEnd.hom {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] {ι : AlgebraicClosure E →+* ℂ} {q β γ : ℝ}
    (F : V ≃ₗ[E] V) (G : W →ₗ[E] W)
    (hF : IsIotaPureEnd ι q β F.toLinearMap) (hG : IsIotaPureEnd ι q γ G) :
    IsIotaPureEnd ι q (γ - β) ((LinearMap.llcomp E V W W G).comp (LinearMap.lcomp E W F.symm.toLinearMap)) := by sorry

/-- The zeroth tensor power is the unit line of weight zero. -/
theorem IsPure.tensorPower {q : ℝ} (hq : 1 < q) {n : ℤ} {F : V →ₗ[E] V}
    (hF : IsPure q n F) (k : ℕ) :
    IsPure q ((k : ℤ) * n) (PiTensorProduct.map (fun _ : Fin k => F)) := by sorry

theorem IsIotaPureEnd.tensorPower {ι : AlgebraicClosure E →+* ℂ} {q β : ℝ}
    (hq : 1 < q) {F : V →ₗ[E] V} (hF : IsIotaPureEnd ι q β F) (k : ℕ) :
    IsIotaPureEnd ι q ((k : ℝ) * β) (PiTensorProduct.map (fun _ : Fin k => F)) := by sorry

/-- Exterior powers add the weights of distinct eigenvalue positions (README 0.14). -/
theorem IsIotaPureEnd.exteriorPower {ι : AlgebraicClosure E →+* ℂ} {q β : ℝ}
    (hq : 1 < q) {F : V →ₗ[E] V} (hF : IsIotaPureEnd ι q β F) (k : ℕ) :
    IsIotaPureEnd ι q ((k : ℝ) * β) (exteriorPower.map k F) := by sorry

/-- The root multiset of a block sum includes both summands, including zero roots
(README 0.8–0.9; Weil I (1.5.3), p. 276). -/
theorem eigenvalues_prodMap {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] (F : V →ₗ[E] V) (G : W →ₗ[E] W) :
    eigenvalues (LinearMap.prodMap F G) = eigenvalues F + eigenvalues G := by sorry

theorem iotaWeights_prodMap {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] (ι : AlgebraicClosure E →+* ℂ) (q : ℝ)
    (F : V →ₗ[E] V) (G : W →ₗ[E] W) :
    iotaWeights ι q (LinearMap.prodMap F G) = iotaWeights ι q F ∪ iotaWeights ι q G := by sorry

/-- The determinant, reverse characteristic polynomial and root multiset all
factor along a stable subspace (README 0.8). -/
theorem spectral_factorization_of_mapsTo (F : V →ₗ[E] V) (U : Submodule E V)
    (hU : ∀ x ∈ U, F x ∈ U) :
    F.charpoly.reverse = (F.restrict hU).charpoly.reverse * (U.mapQ U F hU).charpoly.reverse ∧
    LinearMap.det F = LinearMap.det (F.restrict hU) * LinearMap.det (U.mapQ U F hU) ∧
    eigenvalues F = eigenvalues (F.restrict hU) + eigenvalues (U.mapQ U F hU) := by sorry

/-- Compatible algebraic-closure embeddings transport the actual root multiset
(README 0.7). No arbitrary identification of the two closures is implicit. -/
theorem eigenvalues_baseChange {E' : Type*} [Field E'] [Algebra E E']
    (ρ : AlgebraicClosure E →+* AlgebraicClosure E')
    (hρ : ρ.comp (algebraMap E (AlgebraicClosure E)) =
      (algebraMap E' (AlgebraicClosure E')).comp (algebraMap E E')) (F : V →ₗ[E] V) :
    eigenvalues (F.baseChange E') = (eigenvalues F).map ρ := by sorry

theorem isIotaPureEnd_baseChange_iff {E' : Type*} [Field E'] [Algebra E E']
    (ρ : AlgebraicClosure E →+* AlgebraicClosure E')
    (hρ : ρ.comp (algebraMap E (AlgebraicClosure E)) =
      (algebraMap E' (AlgebraicClosure E')).comp (algebraMap E E'))
    (ι' : AlgebraicClosure E' →+* ℂ) (q β : ℝ) (F : V →ₗ[E] V) :
    IsIotaPureEnd ι' q β (F.baseChange E') ↔ IsIotaPureEnd (ι'.comp ρ) q β F := by sorry

/-- Hom roots retain every pair of eigenvalue positions (README 0.13(iii)). -/
theorem eigenvalues_hom {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] (F : V ≃ₗ[E] V) (G : W →ₗ[E] W) :
    eigenvalues ((LinearMap.llcomp E V W W G).comp
      (LinearMap.lcomp E W F.symm.toLinearMap)) =
      ((eigenvalues F.toLinearMap).product (eigenvalues G)).map
        (fun p => p.2 / p.1) := by sorry

/-- Enumerate eigenvalue positions before taking tensor products, so repeated roots
contribute separately and the empty product gives the zeroth tensor power. -/
theorem eigenvalues_tensorPower (F : V →ₗ[E] V) (k d : ℕ)
    (a : Fin d → AlgebraicClosure E)
    (ha : eigenvalues F = (↑(List.ofFn a) : Multiset (AlgebraicClosure E))) :
    eigenvalues (PiTensorProduct.map (fun _ : Fin k => F)) =
      (Finset.univ : Finset (Fin k → Fin d)).val.map (fun indices => ∏ j, a (indices j)) := by sorry

/-- This is the root-multiset notation for the native determinant/root-product
identity `Matrix.det_eq_prod_roots_charpoly` after scalar extension (README 0.13(iv)). -/
theorem det_eq_prod_eigenvalues (F : V →ₗ[E] V) :
    algebraMap E (AlgebraicClosure E) (LinearMap.det F) = (eigenvalues F).prod := by sorry

/-- The reverse characteristic polynomial is the product of the linear local
factors, including factors equal to one for zero roots (README 0.10(i)).
Its determinant interpretation is Mathlib's `Matrix.reverse_charpoly`. -/
theorem reverse_charpoly_eq_prod_eigenvalues (F : V →ₗ[E] V) :
    F.charpoly.reverse.map (algebraMap E (AlgebraicClosure E)) =
      ((eigenvalues F).map (fun α => (1 - C α * X : (AlgebraicClosure E)[X]))).prod := by sorry

/-- The exterior endpoints and vanishing beyond the dimension (README 0.14). -/
theorem eigenvalues_exteriorPower_endpoints (F : V →ₗ[E] V) :
    eigenvalues (exteriorPower.map 0 F) = {1} ∧
    eigenvalues (exteriorPower.map (Module.finrank E V) F) =
      {algebraMap E (AlgebraicClosure E) (LinearMap.det F)} ∧
    ∀ k : ℕ, Module.finrank E V < k → eigenvalues (exteriorPower.map k F) = 0 := by sorry

/-- Arbitrary exterior ι-weights are sums over subsets of positions, without
assuming purity (README 0.14). Invertibility excludes the total logarithm at zero. -/
theorem iotaWeight_multiset_exteriorPower (ι : AlgebraicClosure E →+* ℂ) (q : ℝ)
    (F : V ≃ₗ[E] V) (k d : ℕ) (a : Fin d → AlgebraicClosure E)
    (ha : eigenvalues F.toLinearMap = (↑(List.ofFn a) : Multiset (AlgebraicClosure E))) :
    (eigenvalues (exteriorPower.map k F.toLinearMap)).map (iotaWeight ι q) =
      ((Finset.univ : Finset (Fin d)).powersetCard k).val.map
        (fun s => ∑ i ∈ s, iotaWeight ι q (a i)) := by sorry

/-- The scalar-extension pairing is uniquely characterized by its values on pure
tensors. It stays perfect and carries the same Frobenius similitude (README 0.16).
Apply `pairing_maxGenEigenspaces` to these genuine algebraic-closure modules. -/
theorem pairing_baseChange (F : V ≃ₗ[E] V) {W : Type*}
    [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    (F' : W →ₗ[E] W) (B : V →ₗ[E] W →ₗ[E] E) (hB : Function.Bijective B)
    (c : E) (hc : c ≠ 0) (hFF' : ∀ x y, B (F x) (F' y) = c * B x y) :
    ∃! Bbar : (AlgebraicClosure E ⊗[E] V) →ₗ[AlgebraicClosure E]
        (AlgebraicClosure E ⊗[E] W) →ₗ[AlgebraicClosure E] AlgebraicClosure E,
      (∀ a b x y, Bbar (a ⊗ₜ[E] x) (b ⊗ₜ[E] y) =
        a * b * algebraMap E (AlgebraicClosure E) (B x y)) ∧
      Function.Bijective Bbar ∧
      ∀ x y, Bbar (F.toLinearMap.baseChange (AlgebraicClosure E) x)
        (F'.baseChange (AlgebraicClosure E) y) =
        algebraMap E (AlgebraicClosure E) c * Bbar x y := by sorry

/-- Scalar twist compatibility with an intertwiner (README 0.15). -/
theorem twist_comp_of_comp {W : Type*} [AddCommGroup W] [Module E W]
    (b : Eˣ) (F : V →ₗ[E] V) (G : W →ₗ[E] W) (u : V →ₗ[E] W)
    (hu : u ∘ₗ F = G ∘ₗ u) : u ∘ₗ twist b F = twist b G ∘ₗ u := by sorry

/-- The contragredient of a scalar twist has the inverse scalar (README 0.15). -/
theorem twist_contragredient (b : Eˣ) (F : V ≃ₗ[E] V)
    (G : V ≃ₗ[E] V) (hG : G.toLinearMap = twist b F.toLinearMap) :
    G.symm.toLinearMap.dualMap = twist b⁻¹ F.symm.toLinearMap.dualMap := by sorry

/-- Purity is detected on each direct summand (README 0.9). -/
theorem isPure_prodMap_iff {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] (q : ℝ) (n : ℤ) (F : V →ₗ[E] V) (G : W →ₗ[E] W) :
    IsPure q n (LinearMap.prodMap F G) ↔ IsPure q n F ∧ IsPure q n G := by sorry

theorem isIotaPureEnd_prodMap_iff {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] (ι : AlgebraicClosure E →+* ℂ) (q β : ℝ)
    (F : V →ₗ[E] V) (G : W →ₗ[E] W) :
    IsIotaPureEnd ι q β (LinearMap.prodMap F G) ↔
      IsIotaPureEnd ι q β F ∧ IsIotaPureEnd ι q β G := by sorry

/-- The tensor formula also transports arbitrary weight multisets, rather than
just pure factors (README 0.13). -/
theorem iotaWeight_multiset_tensor {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] (ι : AlgebraicClosure E →+* ℂ) (q : ℝ)
    (F : V ≃ₗ[E] V) (G : W ≃ₗ[E] W) :
    (eigenvalues (TensorProduct.map F.toLinearMap G.toLinearMap)).map (iotaWeight ι q) =
      (((eigenvalues F.toLinearMap).map (iotaWeight ι q)).product
        ((eigenvalues G.toLinearMap).map (iotaWeight ι q))).map (fun p => p.1 + p.2) := by sorry

theorem iotaWeight_multiset_hom {W : Type*} [AddCommGroup W] [Module E W]
    [FiniteDimensional E W] (ι : AlgebraicClosure E →+* ℂ) (q : ℝ)
    (F : V ≃ₗ[E] V) (G : W ≃ₗ[E] W) :
    (eigenvalues ((LinearMap.llcomp E V W W G.toLinearMap).comp
      (LinearMap.lcomp E W F.symm.toLinearMap))).map (iotaWeight ι q) =
      (((eigenvalues F.toLinearMap).map (iotaWeight ι q)).product
        ((eigenvalues G.toLinearMap).map (iotaWeight ι q))).map (fun p => p.2 - p.1) := by sorry

theorem iotaWeight_multiset_contragredient (ι : AlgebraicClosure E →+* ℂ) (q : ℝ)
    (F : V ≃ₗ[E] V) :
    (eigenvalues F.symm.toLinearMap.dualMap).map (iotaWeight ι q) =
      ((eigenvalues F.toLinearMap).map (iotaWeight ι q)).map (fun β => -β) := by sorry

/-- Twisting preserves precisely the invariant subspaces, as well as all
intertwiners; underlying vector-space exact sequences are unchanged (README 0.15). -/
theorem twist_mapsTo_iff (b : Eˣ) (F : V →ₗ[E] V) (U : Submodule E V) :
    (∀ x ∈ U, twist b F x ∈ U) ↔ ∀ x ∈ U, F x ∈ U := by sorry

end FurtherSpectral


section AllEmbeddingsEndomorphism
variable {E V : Type} [Field E] [Algebra ℚ E] [AddCommGroup V] [Module E V]
    [FiniteDimensional E V]

/-- The all-embeddings scalar criterion detects endomorphism purity, including
algebraicity of the characteristic roots (README 0.6; Weil II (1.2.6), p. 154). -/
theorem isPure_iff_all_iotaPureEnd (hcard : Cardinal.mk E ≤ Cardinal.mk ℂ)
    {q : ℝ} (hq : 1 < q) (n : ℤ) (F : V →ₗ[E] V) :
    IsPure q n F ↔ ∀ ι : AlgebraicClosure E →+* ℂ, IsIotaPureEnd ι q n F := by sorry

end AllEmbeddingsEndomorphism

section ArithmeticComplements
variable {K : Type*} [Field K] [Algebra ℚ K]

theorem IsWeilNumber.rootOfUnity_of_integral {q : ℝ} (hq : 1 < q) {α : K}
    (hα : IsWeilNumber q 0 α) (hint : IsIntegral ℤ α) :
    ∃ k : ℕ, 0 < k ∧ α ^ k = 1 := by sorry

theorem rational_pow_weil (q : ℚ) (hq : 1 < q) (k : ℤ) :
    IsWeilNumber (q : ℝ) (2 * k) (q ^ k) := by sorry

theorem IsWeilNumber.conjugate {q : ℚ} (hq : 1 < q) {n : ℤ} {α : K}
    (hα : IsWeilNumber (q : ℝ) n α) (σ : K →+* ℂ) :
    star (σ α) = (q : ℂ) ^ n / σ α := by sorry

/-- Integer powers use inverses for negative exponents (README 0.2(i)). -/
theorem IsWeilNumber.zpow {q : ℝ} {n : ℤ} {α : K} (hα : IsWeilNumber q n α) (k : ℤ) :
    IsWeilNumber q (k * n) (α ^ k) := by sorry

/-- Rational reciprocal conjugation also identifies the totally real sum
(README 0.2(iii); Weil II (1.2.12), p. 156). -/
theorem IsWeilNumber.reciprocal_sum_totallyReal {q : ℚ} (hq : 1 < q) {n : ℤ} {α : K}
    (hα : IsWeilNumber (q : ℝ) n α) :
    IsAlgebraic ℚ (α + (q : K) ^ n / α) ∧
      (∀ z ∈ (minpoly ℚ (α + (q : K) ^ n / α)).aroots ℂ, z.im = 0) ∧
      ∀ σ : K →+* ℂ, (σ (α + (q : K) ^ n / α)).im = 0 := by sorry

end ArithmeticComplements

section CharacteristicSeries
variable {E V : Type*} [Field E]
    [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- The logarithmic derivative of det(1−tF) has coefficients −Tr(F^(n+1)). -/
theorem characteristic_series_log_derivative (F : V →ₗ[E] V) (n : ℕ) :
    let P : PowerSeries E := F.charpoly.reverse
    PowerSeries.coeff n (PowerSeries.derivative P * P⁻¹) =
      -LinearMap.trace E V (F ^ (n + 1)) := by sorry

end CharacteristicSeries

end TauCeti.Weights


namespace TauCeti.Weights

/-! ## Integral Frobenius modules (`DeligneWeightsAndPurity:DWP.7/integral-sheaf`)

A sheaf on a scheme of finite type over `ℤ[1/ℓ]` is integral when every Frobenius element at
every closed point acts on the stalk with algebraic-integer eigenvalues; on `Spec 𝔽_q` a sheaf is
a Frobenius module and the predicate is `IsIntegralEnd` of the geometric Frobenius. The tests are
stated on rational models of the Frobenius modules. -/

section IntegralEnd

variable {E V : Type*} [Field E] [AddCommGroup V] [Module E V] [FiniteDimensional E V]

/-- `IsIntegralEnd F`: every root of the characteristic polynomial of `F` in an algebraic
closure is integral over `ℤ` (Weil II (3.3.2)). The roots are DWP.0's eigenvalue multiset. -/
def IsIntegralEnd (F : V →ₗ[E] V) : Prop :=
  ∀ α ∈ (F.charpoly.map (algebraMap E (AlgebraicClosure E))).roots, IsIntegral ℤ α

/-- For a rational Frobenius module, integrality is integrality of the characteristic
polynomial's coefficients. -/
theorem isIntegralEnd_iff_charpoly {W : Type*} [AddCommGroup W] [Module ℚ W]
    [FiniteDimensional ℚ W] (F : W →ₗ[ℚ] W) :
    IsIntegralEnd F ↔ ∀ n, ∃ m : ℤ, F.charpoly.coeff n = m := by sorry

/-- Integrality is detected on an invariant subspace and the quotient. -/
theorem IsIntegralEnd.of_extension (F : V →ₗ[E] V) (U : Submodule E V)
    (hU : U ≤ U.comap F) :
    IsIntegralEnd F ↔
      IsIntegralEnd (F.restrict (p := U) (q := U) (fun _ hx => hU hx)) ∧
        IsIntegralEnd (U.mapQ U F hU) := by sorry

/-- An algebraic number with an integral power is integral, and conversely. -/
theorem IsIntegralEnd.pow (F : V →ₗ[E] V) {r : ℕ} (hr : 0 < r) :
    IsIntegralEnd (F ^ r) ↔ IsIntegralEnd F := by sorry

/-- Eigenvalues of a tensor product are products of eigenvalues. -/
theorem IsIntegralEnd.tensor {W : Type*} [AddCommGroup W] [Module E W] [FiniteDimensional E W]
    {F : V →ₗ[E] V} {G : W →ₗ[E] W} (hF : IsIntegralEnd F) (hG : IsIntegralEnd G) :
    IsIntegralEnd (TensorProduct.map F G) := by sorry

end IntegralEnd

/-- Test `isIntegralEnd_tate_neg_one`: `ℚ̄_ℓ(−1)` on `Spec 𝔽_q` (here `q = 2`), where `F` acts
by `q`, is integral. -/
example : IsIntegralEnd ((2 : ℚ) • LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by sorry

/-- Test `not_isIntegralEnd_tate_one`: `ℚ̄_ℓ(1)` (`F` acts by `q⁻¹`, `q = 2`) is pure of weight
`−2` but not integral. -/
example : ¬ IsIntegralEnd ((2 : ℚ)⁻¹ • LinearMap.id : ℚ →ₗ[ℚ] ℚ) := by sorry

/-- Test `not_isIntegralEnd_weight_zero`: the rotation with eigenvalues `(3 ± 4i)/5` (all
complex absolute values `1`, weight `0`) is not integral. -/
example : ¬ IsIntegralEnd (Matrix.toLin' !![(3 / 5 : ℚ), -4 / 5; 4 / 5, 3 / 5]) := by sorry

/-- Test `isIntegralEnd_zero`: the zero Frobenius module is integral. -/
example : IsIntegralEnd (0 : (Fin 0 → ℚ) →ₗ[ℚ] (Fin 0 → ℚ)) := by sorry

/-- Test `isIntegralEnd_jordan`: the Jordan block `[[2, 1], [0, 2]]` is integral; integrality
reads the characteristic polynomial `(T − 2)²`. -/
example : IsIntegralEnd (Matrix.toLin' !![(2 : ℚ), 1; 0, 2]) := by sorry

/-! ## The p-adic couple of a pure number (`DeligneWeightsAndPurity:DWP.7/newton-couples-3-3-7`) -/

section NewtonCouple

variable {K : Type*} [Field K]

/-- The couple `(v(α), v(q^n α⁻¹))` of Weil II (3.3.7), for an additive valuation `v` normalised
by `v q = 1`. -/
def newtonCouple (v : AddValuation K (WithTop ℚ)) (q : K) (n : ℤ) (α : K) :
    WithTop ℚ × WithTop ℚ :=
  (v α, v (q ^ n * α⁻¹))

theorem newtonCouple_fst_add_snd (v : AddValuation K (WithTop ℚ)) {q : K} (hq : v q = 1)
    (n : ℤ) {α : K} (hα : α ≠ 0) :
    (newtonCouple v q n α).1 + (newtonCouple v q n α).2 = ((n : ℚ) : WithTop ℚ) := by sorry

theorem newtonCouple_nonneg (v : AddValuation K (WithTop ℚ))
    (hv : ∀ x : K, IsIntegral ℤ x → 0 ≤ v x) (q : K) (n : ℤ) {α : K} (hα : IsIntegral ℤ α)
    (hα' : IsIntegral ℤ (q ^ n * α⁻¹)) :
    0 ≤ (newtonCouple v q n α).1 ∧ 0 ≤ (newtonCouple v q n α).2 := by sorry

theorem newtonCouple_swap_conj (v : AddValuation K (WithTop ℚ)) {q : K} (hq : q ≠ 0) (n : ℤ)
    {α : K} (hα : α ≠ 0) :
    newtonCouple v q n (q ^ n * α⁻¹) = (newtonCouple v q n α).swap := by sorry

theorem newtonCouple_galois (v : AddValuation K (WithTop ℚ)) (τ : K ≃+* K) {q : K}
    (hq : τ q = q) (n : ℤ) (α : K) :
    newtonCouple (v.comap (τ : K →+* K)) q n α = newtonCouple v q n (τ α) := by sorry

theorem newtonCouple_mul (v : AddValuation K (WithTop ℚ)) {q : K} (hq : q ≠ 0)
    (n m : ℤ) (α β : K) :
    newtonCouple v q (n + m) (α * β) = newtonCouple v q n α + newtonCouple v q m β := by sorry

theorem newtonCouple_div_pow (v : AddValuation K (WithTop ℚ)) {q : K} (hq : v q = 1)
    (hq0 : q ≠ 0) (n m : ℤ) (α : K) :
    newtonCouple v q n α =
      newtonCouple v q (n - 2 * m) (α * (q ^ m)⁻¹) + (((m : ℚ) : WithTop ℚ), ((m : ℚ) : WithTop ℚ)) := by sorry

end NewtonCouple

/-- Test `newtonCouple_fst_add_snd`: for `v q = 1` and `α ≠ 0`, `r + s = n`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (q α : K) (hq : v q = 1)
    (hα : α ≠ 0) :
    (newtonCouple v q 1 α).1 + (newtonCouple v q 1 α).2 = ((1 : ℚ) : WithTop ℚ) := by sorry

/-- Test `newtonCouple_supersingular`: if `α² = −p` and `v p = 1`, the couple of `α` (weight
`1`, `q = p`) is `(1/2, 1/2)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (p α : K) (hp : v p = 1)
    (hα : α ^ 2 = -p) :
    newtonCouple v p 1 α = (((1 / 2 : ℚ) : WithTop ℚ), ((1 / 2 : ℚ) : WithTop ℚ)) := by sorry

/-- Test `newtonCouple_ordinary`: `q = 5`, `α = 1 + 2i` with `v α = 1` at the place over `5`
dividing it: the couple is `(1, 0)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (α : K) (h5 : v 5 = 1)
    (hα : v α = 1) (hα0 : α ≠ 0) :
    newtonCouple v 5 1 α = (((1 : ℚ) : WithTop ℚ), ((0 : ℚ) : WithTop ℚ)) := by sorry

/-- Test `newtonCouple_tate`: `α = q^m` (weight `2m`) has couple `(m, m)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (q : K) (hq : v q = 1)
    (hq0 : q ≠ 0) (m : ℕ) :
    newtonCouple v q (2 * m) (q ^ m) = (((m : ℚ) : WithTop ℚ), ((m : ℚ) : WithTop ℚ)) := by sorry

/-- Test `newtonCouple_nonintegral`: `α = q⁻¹` (weight `−2`) has couple `(−1, −1)`. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) (q : K) (hq : v q = 1)
    (hq0 : q ≠ 0) :
    newtonCouple v q (-2) q⁻¹ = (((-1 : ℚ) : WithTop ℚ), ((-1 : ℚ) : WithTop ℚ)) := by sorry

/-- Test `newtonCouple_zero_base`: the multiplication formula fails for a zero base and
integer weights `1` and `−1`. This catches the missing `q ≠ 0` hypothesis. -/
example {K : Type*} [Field K] (v : AddValuation K (WithTop ℚ)) :
    newtonCouple v 0 (1 + (-1)) (1 * 1) ≠
      newtonCouple v 0 1 1 + newtonCouple v 0 (-1) 1 := by sorry

/-! ## Geometric semisimplicity (`DeligneWeightsAndPurity:DWP.8/geometric-semisimplicity`)

A lisse sheaf on a normal connected `X₀` over `𝔽_q` is a representation `ρ` of the Weil group
`W(X₀, x̄)`; geometric semisimplicity is semisimplicity of its restriction to the geometric
fundamental group `π₁(X, x̄)`. -/

section GeometricSemisimplicity

variable {E W V : Type*} [Field E] [Group W] [AddCommGroup V] [Module E V]

/-- `ρ` restricted to the subgroup `G` (the geometric fundamental group) is semisimple. -/
def IsGeometricallySemisimple (ρ : Representation E W V) (G : Subgroup W) : Prop :=
  IsSemisimpleModule (MonoidAlgebra E G) (Representation.asModule (ρ.comp G.subtype))


/-- A finite-dimensional semisimple representation restricts semisimply to a normal subgroup.
The irreducible case already exists at the Tau Ceti pin as
`TauCeti.Representation.isSemisimpleRepresentation_comp_subtype` in
`TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean`; apply it to each irreducible summand.
Apply the existing Clifford theorem summandwise. -/
theorem IsGeometricallySemisimple.of_isSemisimple [FiniteDimensional E V] (ρ : Representation E W V)
    (G : Subgroup W) [G.Normal] (h : IsSemisimpleModule (MonoidAlgebra E W) ρ.asModule) :
    IsGeometricallySemisimple ρ G := by sorry

end GeometricSemisimplicity

/-- Test `isGeometricallySemisimple_jordan`: on `Spec 𝔽_q` (trivial geometric group) the Weil
sheaf on which `F` acts by `[[1, 1], [0, 1]]` is geometrically semisimple but not arithmetically
semisimple. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hρ : ρ (Multiplicative.ofAdd 1) = Matrix.toLin' !![(1 : ℚ), 1; 0, 1]) :
    IsGeometricallySemisimple ρ ⊥ ∧
      ¬ IsSemisimpleModule (MonoidAlgebra ℚ (Multiplicative ℤ)) ρ.asModule := by sorry

/-- Test `not_isGeometricallySemisimple_kummer`: a geometric monodromy group generated by a
nontrivial unipotent element (the Kummer extension of `ℚ̄_ℓ` by `ℚ̄_ℓ(1)` on `𝔾_m`) is not
semisimple. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hρ : ρ (Multiplicative.ofAdd 1) = Matrix.toLin' !![(1 : ℚ), 1; 0, 1]) :
    ¬ IsGeometricallySemisimple ρ ⊤ := by sorry

/-- Test `isGeometricallySemisimple_point`: with trivial geometric group every representation is
geometrically semisimple. -/
example {W V : Type*} [Group W] [AddCommGroup V] [Module ℚ V] (ρ : Representation ℚ W V) :
    IsGeometricallySemisimple ρ ⊥ := by sorry

/-- Test `isGeometricallySemisimple_of_semisimple`: semisimple implies semisimple on a normal
subgroup. -/
example {W V : Type*} [Group W] [AddCommGroup V] [Module ℚ V] [FiniteDimensional ℚ V]
    (ρ : Representation ℚ W V) (G : Subgroup W) [G.Normal]
    (h : IsSemisimpleModule (MonoidAlgebra ℚ W) ρ.asModule) : IsGeometricallySemisimple ρ G := by sorry

end TauCeti.Weights

namespace TauCeti.HardLefschetz

/-! ## Linear algebra of hard Lefschetz (`DWP.9/invariant-form-on-invariants-4-1-4`,
`DWP.9/lefschetz-decomposition-of-a-graded-operator`) -/

section InvariantForm

variable {K G V : Type*} [Field K] [Group G] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- Weil II (4.1.4): an invariant nondegenerate bilinear form on a completely reducible
representation is nondegenerate on the invariants. -/
theorem restrict_invariants_nondegenerate (ρ : Representation K G V)
    [IsSemisimpleModule (MonoidAlgebra K G) ρ.asModule] (B : LinearMap.BilinForm K V)
    (hB : ∀ g x y, B (ρ g x) (ρ g y) = B x y) (hnd : B.Nondegenerate) :
    (B.restrict ρ.invariants).Nondegenerate := by sorry

end InvariantForm

/-- Complete reducibility is necessary in (4.1.4): for the unipotent
action of `ℤ` on `ℚ²` and `B = det`, the invariant line is isotropic. -/
example (ρ : Representation ℚ (Multiplicative ℤ) (Fin 2 → ℚ))
    (hρ : ρ (Multiplicative.ofAdd 1) = Matrix.toLin' !![(1 : ℚ), 1; 0, 1])
    (B : LinearMap.BilinForm ℚ (Fin 2 → ℚ)) (hB : ∀ x y, B x y = x 0 * y 1 - x 1 * y 0) :
    ¬ (B.restrict ρ.invariants).Nondegenerate := by sorry


section LefschetzDecomposition

variable {K V : Type*} [Field K] [AddCommGroup V] [Module K V] [FiniteDimensional K V]

/-- The primitive part `P^{n−r} = V^{n−r} ∩ ker λ^{r+1}` of a graded operator, indexed by `ℤ`. -/
def primitivePiece (𝒱 : ℤ → Submodule K V) (lam : V →ₗ[K] V) (n : ℤ) (r : ℕ) :
    Submodule K V :=
  𝒱 (n - r) ⊓ LinearMap.ker (lam ^ (r + 1))

/-- Deligne (1968) (1.5)–(1.6): for a grading `V = ⊕ V^j` (`V^j = 0` outside `[0, 2n]`) and a
degree-2 operator `λ` with `λ^r : V^{n−r} ≅ V^{n+r}` for `0 ≤ r ≤ n`, each `V^{n−r}` is the
internal direct sum of the `λ^k P^{n−r−2k}`. -/
theorem iSupIndep_lefschetzDecomposition (𝒱 : ℤ → Submodule K V) (h𝒱 : DirectSum.IsInternal 𝒱)
    (n : ℕ) (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (r : ℕ) (hr : r ≤ n) :
    iSupIndep (fun k : ℕ => (primitivePiece 𝒱 lam n (r + 2 * k)).map (lam ^ k)) ∧
      (⨆ k : ℕ, (primitivePiece 𝒱 lam n (r + 2 * k)).map (lam ^ k)) = 𝒱 ((n : ℤ) - r) := by sorry

/-- The dimension count `dim P^{n−r} = dim V^{n−r} − dim V^{n−r−2}`. -/
theorem finrank_primitivePiece (𝒱 : ℤ → Submodule K V) (h𝒱 : DirectSum.IsInternal 𝒱) (n : ℕ)
    (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (r : ℕ) (hr : r ≤ n) :
    (Module.finrank K (primitivePiece 𝒱 lam n r) : ℤ) =
      Module.finrank K (𝒱 ((n : ℤ) - r)) - Module.finrank K (𝒱 ((n : ℤ) - r - 2)) := by sorry

/-- The Lefschetz pairings `ψ_r(x, y) = B(λ^r x, y)` are nondegenerate on `V^{n−r}` when `B` is a
nondegenerate form pairing `V^a` with `V^{2n−a}` for which `λ` is self-adjoint. -/
theorem lefschetzPairing_nondegenerate (𝒱 : ℤ → Submodule K V) (h𝒱 : DirectSum.IsInternal 𝒱)
    (n : ℕ) (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (B : LinearMap.BilinForm K V) (hB : B.Nondegenerate)
    (hdeg : ∀ a b : ℤ, a + b ≠ 2 * n → ∀ x ∈ 𝒱 a, ∀ y ∈ 𝒱 b, B x y = 0)
    (hadj : ∀ x y, B (lam x) y = B x (lam y)) (r : ℕ) (hr : r ≤ n) :
    ((B.comp (lam ^ r) LinearMap.id).restrict (𝒱 ((n : ℤ) - r))).Nondegenerate ∧
      ((B.comp (lam ^ r) LinearMap.id).restrict (primitivePiece 𝒱 lam n r)).Nondegenerate := by sorry

/-- The upper-degree decomposition has exponent `r + k`, rather than `k`
(README 9.7; Deligne (1968), (1.5)–(1.6), p. 108). -/
theorem iSupIndep_lefschetzDecomposition_upper (𝒱 : ℤ → Submodule K V)
    (h𝒱 : DirectSum.IsInternal 𝒱) (n : ℕ)
    (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (r : ℕ) (hr : r ≤ n) :
    iSupIndep (fun k : ℕ => (primitivePiece 𝒱 lam n (r + 2 * k)).map (lam ^ (r + k))) ∧
      (⨆ k : ℕ, (primitivePiece 𝒱 lam n (r + 2 * k)).map (lam ^ (r + k))) =
        𝒱 ((n : ℤ) + r) := by sorry

/-- Different primitive images in `V^{n-r}` are orthogonal for `ψ_r`.
No semisimplicity of the degree-two operator is assumed (README 9.7). -/
theorem lefschetzPairing_primitive_orthogonal (𝒱 : ℤ → Submodule K V)
    (h𝒱 : DirectSum.IsInternal 𝒱) (n : ℕ)
    (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (B : LinearMap.BilinForm K V) (hB : B.Nondegenerate)
    (hdeg : ∀ a b : ℤ, a + b ≠ 2 * n → ∀ x ∈ 𝒱 a, ∀ y ∈ 𝒱 b, B x y = 0)
    (hadj : ∀ x y, B (lam x) y = B x (lam y)) (r : ℕ) (hr : r ≤ n)
    (k l : ℕ) (hkl : k ≠ l)
    (x : V) (hx : x ∈ (primitivePiece 𝒱 lam n (r + 2 * k)).map (lam ^ k))
    (y : V) (hy : y ∈ (primitivePiece 𝒱 lam n (r + 2 * l)).map (lam ^ l)) :
    B ((lam ^ r) x) y = 0 := by sorry

/-- A graded-symmetric ambient pairing induces the sign of degree `n-r` on `ψ_r`
and on its primitive restriction (README 9.7; Weil II (4.1.5), p. 218).
Symmetry is an additional hypothesis, independent of perfectness. -/
theorem lefschetzPairing_gradedSymmetry (𝒱 : ℤ → Submodule K V)
    (h𝒱 : DirectSum.IsInternal 𝒱) (n : ℕ)
    (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (B : LinearMap.BilinForm K V) (hB : B.Nondegenerate)
    (hdeg : ∀ a b : ℤ, a + b ≠ 2 * n → ∀ x ∈ 𝒱 a, ∀ y ∈ 𝒱 b, B x y = 0)
    (hadj : ∀ x y, B (lam x) y = B x (lam y))
    (hsym : ∀ a : ℤ, ∀ x ∈ 𝒱 a, ∀ y : V,
      B y x = (-1 : K) ^ a * B x y) (r : ℕ) (hr : r ≤ n) :
    ∀ x ∈ 𝒱 ((n : ℤ) - r), ∀ y ∈ 𝒱 ((n : ℤ) - r),
      B ((lam ^ r) y) x = (-1 : K) ^ ((n : ℤ) - r) * B ((lam ^ r) x) y := by sorry

/-- The two families of primitive-image maps are injective on their primitive
sources; together with the independent spanning images they give the two
isomorphisms in README 9.7(i). -/
theorem injOn_lefschetzDecomposition (𝒱 : ℤ → Submodule K V)
    (h𝒱 : DirectSum.IsInternal 𝒱) (n : ℕ)
    (hout : ∀ j : ℤ, (j < 0 ∨ 2 * (n : ℤ) < j) → 𝒱 j = ⊥) (lam : V →ₗ[K] V)
    (hlam : ∀ j : ℤ, ∀ x ∈ 𝒱 j, lam x ∈ 𝒱 (j + 2))
    (hHL : ∀ r : ℕ, r ≤ n → Set.BijOn (lam ^ r) (𝒱 ((n : ℤ) - r)) (𝒱 ((n : ℤ) + r)))
    (r : ℕ) (hr : r ≤ n) (k : ℕ) :
    Set.InjOn (lam ^ k) (primitivePiece 𝒱 lam n (r + 2 * k)) ∧
      Set.InjOn (lam ^ (r + k)) (primitivePiece 𝒱 lam n (r + 2 * k)) := by sorry

/-- On a three-step Lefschetz chain, only the bottom vector is primitive.
The upper decomposition sends it to degree four by λ² (README 9.7). -/
example :
    let 𝒱 : ℤ → Submodule ℚ (Fin 3 → ℚ) := fun j =>
      if j = 0 then Submodule.span ℚ {![1, 0, 0]} else
      if j = 2 then Submodule.span ℚ {![0, 1, 0]} else
      if j = 4 then Submodule.span ℚ {![0, 0, 1]} else ⊥
    let lam := Matrix.toLin' !![(0 : ℚ), 0, 0; 1, 0, 0; 0, 1, 0]
    primitivePiece 𝒱 lam 2 2 = 𝒱 0 ∧
      primitivePiece 𝒱 lam 2 0 = ⊥ ∧
      (primitivePiece 𝒱 lam 2 2).map (lam ^ 2) = 𝒱 4 := by sorry

/-- The primitive kernel has exponent r+1: replacing it by r discards the
bottom vector of this length-three chain. -/
example :
    let 𝒱 : ℤ → Submodule ℚ (Fin 3 → ℚ) := fun j =>
      if j = 0 then Submodule.span ℚ {![1, 0, 0]} else ⊥
    let lam := Matrix.toLin' !![(0 : ℚ), 0, 0; 1, 0, 0; 0, 1, 0]
    primitivePiece 𝒱 lam 2 2 ≠ 𝒱 0 ⊓ LinearMap.ker (lam ^ 2) := by sorry

/-- The primitive construction uses the specified degree even when the operator
is zero: only degree zero exists in this one-dimensional grading. -/
example :
    let 𝒱 : ℤ → Submodule ℚ ℚ := fun j => if j = 0 then ⊤ else ⊥
    primitivePiece 𝒱 0 0 0 = ⊤ ∧ primitivePiece 𝒱 0 0 1 = ⊥ := by sorry

end LefschetzDecomposition

end TauCeti.HardLefschetz

/-
The geometric signatures isGeometricallySemisimple_iff_restrict_open,
isGeometricallySemisimple_baseExtension and isGeometricallySemisimple_iff_reductive
are specified in README §8.14: they use the actual sheaf, base-change and algebraic
Zariski-closure carriers supplied there. The module predicate above is their
numerical restriction interface. Mixed filtrations, derived weights and geometric
hard Lefschetz remain the README targets of DWP.5 and DWP.7–DWP.9.
-/
