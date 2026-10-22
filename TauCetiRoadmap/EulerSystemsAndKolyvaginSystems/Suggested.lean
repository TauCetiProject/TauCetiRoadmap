import Mathlib

/-!
# EulerSystemsAndKolyvaginSystems: representative target signatures

**This file records suggested forms, not an exhaustive checklist.** The definitive roadmap is
`README.md`, which states every target, its hypotheses, sources and Checks. It records light definitions and theorem signatures on carriers supplied by
Mathlib and Tau Ceti at the pinned baseline. It does not construct arithmetic classes.
The admitted theorems are proposed statements; all data definitions have real bodies.
-/

namespace TauCetiRoadmap.EulerSystemsAndKolyvaginSystems

open Polynomial

namespace KolyvaginSystems

/-! ## Layer 0: a finite coefficient ring's additive trace generator -/

/-- An additive character whose kernel contains no nonzero ideal.
For a finite local ring the character lands in the torsion of its residue characteristic. -/
def IsMatlisGenerator {R : Type*} [CommRing R] (lam : R →+ UnitAddCircle) : Prop :=
  ∀ I : Ideal R, (∀ x ∈ I, lam x = 0) → I = ⊥

/-- The zero character fails even when the coefficient ring is a field. -/
example {R : Type*} [CommRing R] [Nontrivial R] :
    ¬ IsMatlisGenerator (0 : R →+ UnitAddCircle) :=
  fun h => top_ne_bot (h ⊤ fun _ _ => rfl)

/-- The standard character of ℤ/Nℤ for N≠0 is a generator, including the zero ring at N=1. -/
example (N : ℕ) [NeZero N] :
    IsMatlisGenerator (ZMod.toAddCircle : ZMod N →+ UnitAddCircle) := by
  intro I hI
  rw [eq_bot_iff]
  intro x hx
  exact (Ideal.mem_bot).2 (ZMod.toAddCircle_injective N (by rw [hI x hx, map_zero]))

/-- Finite local self-injectivity is equivalent to existence of a trace generator (README 0.2). -/
theorem injective_iff_exists_isMatlisGenerator {R : Type*} [CommRing R] [Finite R]
    [IsLocalRing R] :
    Module.Injective R R ↔ ∃ lam : R →+ UnitAddCircle, IsMatlisGenerator lam := by
  sorry

/-- The finite local ring `𝔽_p[x,y]/(x,y)²` has a two-dimensional socle, so no additive character
is a trace generator (`not_isSelfInjectiveCoefficient_square`, README 0.2). -/
theorem not_exists_isMatlisGenerator_square (p : ℕ) [Fact p.Prime] :
    ¬ ∃ lam : (MvPolynomial (Fin 2) (ZMod p) ⧸
        (Ideal.span {MvPolynomial.X 0, MvPolynomial.X 1} :
          Ideal (MvPolynomial (Fin 2) (ZMod p))) ^ 2) →+ UnitAddCircle,
        IsMatlisGenerator lam := by
  sorry

end KolyvaginSystems

namespace ErrorTolerant

/-! ## Layer 1: exponents, orders and the abundance exponent of Liu–Tian–Xiao–Zhang–Zhu

`exp_ϖ(x) = min{d : ϖᵈ x = 0}` and `ord_ϖ(x) = sup{d : x ∈ ϖᵈ M}` (Definition 2.1.6), and the
sequence `𝔣(0) = 𝔣(1) = 1`, `𝔣(r + 2) = 2(𝔣(r + 1) + 1)` of the saturation lemma 2.3.4. -/

section Exponents

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M]

/-- `exp_ϖ(x, M)`, valued in `ℕ∞` (`⊤` if no power of `ϖ` kills `x`). -/
noncomputable def expAt (ϖ : R) (x : M) : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ϖ ^ n • x = 0), (n : ℕ∞)

/-- `ord_ϖ(x, M)`, valued in `ℕ∞` (`⊤` for `x = 0`). -/
noncomputable def ordAt (ϖ : R) (x : M) : ℕ∞ :=
  ⨆ (n : ℕ) (_ : ∃ y : M, x = ϖ ^ n • y), (n : ℕ∞)

/-- The zero class has annihilator exponent zero (`expAt_zero`, README §1.3). -/
example (ϖ : R) : expAt ϖ (0 : M) = 0 := by
  refine le_antisymm ?_ bot_le
  exact (iInf₂_le 0 (by simp)).trans (by simp)

/-- The zero class is divisible by every power. -/
example (ϖ : R) : ordAt ϖ (0 : M) = ⊤ := by
  simp only [ordAt]
  refine ENat.eq_top_iff_forall_ge.2 fun n => ?_
  exact le_iSup₂_of_le (f := fun (k : ℕ) (_ : ∃ y : M, (0 : M) = ϖ ^ k • y) => (k : ℕ∞)) n
    ⟨0, by simp⟩ le_rfl

/-- Multiplication by three on ℤ/9 distinguishes annihilator exponent from divisibility. -/
theorem expAt_ordAt_zmod_nine : expAt (3 : ℤ) (3 : ZMod 9) = 1 ∧
    ordAt (3 : ℤ) (3 : ZMod 9) = 1 ∧ expAt (3 : ℤ) (1 : ZMod 9) = 2 := by
  sorry

/-- In `R/(ϖⁿ)` the class of `ϖᵈ`, `d < n`, has annihilator exponent `n − d`
(`expAt_uniformizer_quotient`, README §1.3). -/
theorem expAt_uniformizer_quotient {R : Type*} [CommRing R] [IsDomain R]
    [IsDiscreteValuationRing R] {ϖ : R} (hϖ : Irreducible ϖ) {n d : ℕ} (hd : d < n) :
    expAt ϖ (Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ d)) = ((n - d : ℕ) : ℕ∞) := by
  sorry

end Exponents

/-- The abundance exponent `𝔣` of Liu–Tian–Xiao–Zhang–Zhu, §2.3. -/
def abundanceExponent : ℕ → ℕ
  | 0 => 1
  | 1 => 1
  | r + 2 => 2 * (abundanceExponent (r + 1) + 1)

end ErrorTolerant

namespace KolyvaginSystems

/-! ## Layer 1: the error constant `C_α` of Castella–Grossi–Lee–Skinner

As a function of `u = α(γ) ∈ ℤ_pˣ`: `C_α = v_p(u − u⁻¹)` if `u ≠ u⁻¹` and `0` otherwise. -/

open scoped Classical in
/-- `C_α` for `α(γ) = u`. -/
noncomputable def charError (p : ℕ) [Fact p.Prime] (u : ℤ_[p]ˣ) : ℕ :=
  if (u : ℤ_[p]) = ((u⁻¹ : ℤ_[p]ˣ) : ℤ_[p]) then 0
  else PadicInt.valuation ((u : ℤ_[p]) - ((u⁻¹ : ℤ_[p]ˣ) : ℤ_[p]))

/-- The trivial character contributes no character error (`charError_trivial`, README §1.14). -/
example (p : ℕ) [Fact p.Prime] : charError p 1 = 0 := by
  simp [charError]

/-- A character close to `1`, `α(γ) = 1 + pᵐv` with `v` a unit, `p` odd and `m ≥ 1`, has
`C_α = m` (`charError_close_to_one`, README §1.14). -/
theorem charError_close_to_one (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (u : ℤ_[p]ˣ) {m : ℕ}
    (hm : 1 ≤ m) (v : ℤ_[p]ˣ) (hu : (u : ℤ_[p]) = 1 + (p : ℤ_[p]) ^ m * v) :
    charError p u = m := by
  sorry

/-- For `ℤ_p`-valued characters, `p` odd and `u ≡ 1 (mod p)`, the
error constant vanishes only for the trivial character: there is no nontrivial quadratic
`Γ`-character (`charError_no_quadratic_twist`, README §1.14). -/
theorem charError_no_quadratic_twist (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (u : ℤ_[p]ˣ)
    (hu : ‖(u : ℤ_[p]) - 1‖ < 1) : charError p u = 0 ↔ u = 1 := by
  sorry

end KolyvaginSystems

namespace EulerSystems

/-! ## Layer 2: Euler polynomials

Rubin's Euler polynomial at an unramified prime `q` is `det(1 − Fr_q⁻¹ x | T*)`; Mazur–Rubin's is
`det(1 − Fr_q x | T)`. Both are `det(1 − f x)` for an endomorphism `f` of a finite free module,
which is the reverse of the characteristic polynomial. -/

section EulerPolynomial

variable {R M : Type*} [CommRing R] [AddCommGroup M] [Module R M] [Module.Free R M]
  [Module.Finite R M]

/-- `det(1 − f x)` for an endomorphism `f` of a finite free module. -/
noncomputable def eulerPoly (f : Module.End R M) : R[X] :=
  (LinearMap.charpoly f).reverse

/-- A zero endomorphism has Euler polynomial one even on a nonzero rank-two module. -/
example : eulerPoly (0 : Module.End ℤ (Fin 2 → ℤ)) = 1 := by
  have h1 : (1 : ℤ[X]).reverse = 1 := by
    simpa only [Polynomial.C_1] using Polynomial.reverse_C (1 : ℤ)
  simpa [eulerPoly, LinearMap.charpoly_zero, h1] using
    (Polynomial.reverse_X_pow_mul (1 : ℤ[X]) (Module.finrank ℤ (Fin 2 → ℤ)))

/-- The constant coefficient of `det(1 − f x)` is `1`. -/
theorem eulerPoly_eval_zero [Nontrivial R] (f : Module.End R M) : (eulerPoly f).eval 0 = 1 := by
  sorry

/-- Cayley–Hamilton in Rubin's normalisation: `det(1 − f x)` evaluated at `f⁻¹` kills the module.
This is the step behind Rubin's Lemma IV.1.2(ii)–(iv). -/
theorem aeval_inv_eulerPoly_eq_zero (f : M ≃ₗ[R] M) :
    Polynomial.aeval (f.symm : Module.End R M) (eulerPoly (f : Module.End R M)) = 0 := by
  sorry

/-- For the identity of a rank-one module, `det(1 − x) = 1 − X`, not the characteristic polynomial
`X − 1`: the convention is the reversed one. -/
theorem eulerPoly_id_rank_one [Nontrivial R] : eulerPoly (LinearMap.id : Module.End R R) = 1 - X := by
  sorry

/-- Rank-one Frobenius multiplication by `n` has `det(1 − n x) = 1 − n X`; for `n = N(q)` this is
the Mazur–Rubin polynomial of `ℤ_p(1)` (`eulerPoly_zp_one`, README §2.1). -/
theorem eulerPoly_zp_one (n : R) :
    eulerPoly (n • LinearMap.id : Module.End R R) = 1 - C n * X := by
  sorry

/-- Every endomorphism of a zero module has Euler polynomial `1` (`eulerPoly_rank_zero`,
README §2.1). -/
theorem eulerPoly_rank_zero [Nontrivial R] [Subsingleton M] (f : Module.End R M) :
    eulerPoly f = 1 := by
  have h1 : LinearMap.charpoly f = 1 := by
    rw [← Polynomial.Monic.natDegree_eq_zero (LinearMap.charpoly_monic f),
      LinearMap.charpoly_natDegree, Module.finrank_zero_of_subsingleton]
  rw [eulerPoly, h1]
  simpa only [map_one] using Polynomial.reverse_C (1 : R)

end EulerPolynomial


/-- The polynomial identity behind Rubin's Example IV.8.2 (`T = ℤ_p(1)`, `P(x) = 1 − x`):
`P(x) − P(N x) = (N − 1) x`. -/
theorem eulerPoly_gm_congruence {R : Type*} [CommRing R] (n : R) :
    ((1 - X : R[X]) - (1 - C n * X)) = C (n - 1) * X := by
  rw [C_sub, C_1]
  ring

end EulerSystems

namespace KolyvaginSystems

/-! ## Layer 3: Kolyvagin's derivative operators

For `σ` of order `m` in a cyclic group, `D = Σ_{i<m} i σⁱ` and `N = Σ_{i=1}^{m} σⁱ` satisfy
`(σ − 1) D = m − N`. Inside a decomposition group the lift of `σ` need not have order `m`, and the
identity becomes `(σ − 1) D = m σᵐ − N` (Rubin, identity (9) of IV §7). -/

section Derivative

variable {G : Type*} [Group G]

/-- Kolyvagin's derivative `D_σ = Σ_{i<m} i σⁱ` in `ℤ[G]`. -/
noncomputable def kolyvaginDerivative (σ : G) (m : ℕ) : MonoidAlgebra ℤ G :=
  ∑ i ∈ Finset.range m, (i : ℤ) • MonoidAlgebra.of ℤ G (σ ^ i)

/-- The norm `N = Σ_{i=1}^{m} σⁱ`, indexed as in Rubin IV §7. -/
noncomputable def liftedNorm (σ : G) (m : ℕ) : MonoidAlgebra ℤ G :=
  ∑ i ∈ Finset.range m, MonoidAlgebra.of ℤ G (σ ^ (i + 1))

/-- The lifted telescoping identity `(σ − 1) D = m σᵐ − N`, with no condition on the order of `σ`. -/
theorem sub_one_mul_kolyvaginDerivative_lifted (σ : G) (m : ℕ) :
    (MonoidAlgebra.of ℤ G σ - 1) * kolyvaginDerivative σ m =
      (m : ℤ) • MonoidAlgebra.of ℤ G (σ ^ m) - liftedNorm σ m := by
  sorry

/-- The telescoping identity `(σ − 1) D = m − N` when `σᵐ = 1`. -/
theorem sub_one_mul_kolyvaginDerivative_of_pow_eq_one (σ : G) (m : ℕ) (h : σ ^ m = 1) :
    (MonoidAlgebra.of ℤ G σ - 1) * kolyvaginDerivative σ m = (m : MonoidAlgebra ℤ G) - liftedNorm σ m := by
  sorry

/-- At order two the derivative is the chosen generator
(`kolyvaginDerivative_order_two`, README §3.1). -/
example (σ : G) : kolyvaginDerivative σ 2 = MonoidAlgebra.of ℤ G σ := by
  simp [kolyvaginDerivative, Finset.sum_range_succ]

/-- The order-three derivative has two nonzero coefficients, with increasing weights
(`kolyvaginDerivative_order_three`, README §3.1). -/
example (σ : G) : kolyvaginDerivative σ 3 =
    MonoidAlgebra.of ℤ G σ + (2 : ℤ) • MonoidAlgebra.of ℤ G (σ ^ 2) := by
  simp [kolyvaginDerivative, Finset.sum_range_succ]

/-- The lifted norm begins at exponent one. -/
example (σ : G) : liftedNorm σ 1 = MonoidAlgebra.of ℤ G σ := by
  simp [liftedNorm]

/-- In the trivial cyclic group (`m = 1`) the derivative vanishes, whatever the chosen element
(`kolyvaginDerivative_trivial`, README §3.1). -/
theorem kolyvaginDerivative_trivial (σ : G) : kolyvaginDerivative σ 1 = 0 := by
  simp [kolyvaginDerivative]

/-- At `m = 0` both the lifted norm and the derivative are zero (`liftedNorm_zero`,
README §3.1). -/
theorem liftedNorm_zero (σ : G) : liftedNorm σ 0 = 0 ∧ kolyvaginDerivative σ 0 = 0 := by
  simp [liftedNorm, kolyvaginDerivative]

/-- For `σ` of order `n ≥ 2`, `(σ − 1) D_σ = n − N` is nonzero: its coefficient at the identity
is `n − 1` (`kolyvaginDerivative_not_norm_multiple`, README §3.1). -/
theorem kolyvaginDerivative_not_norm_multiple (σ : G) {n : ℕ} (hn : 2 ≤ n)
    (hσ : orderOf σ = n) :
    (MonoidAlgebra.of ℤ G σ - 1) * kolyvaginDerivative σ n ≠ 0 := by
  sorry

end Derivative


/-! ## Layer 3: the finite–singular polynomial

At a prime `q` with `M ∣ P(1)`, Rubin's `Q_q` is the quotient of `P(x) − P(1)` by `x − 1`
(Lemma IV.5.2), and the finite–singular comparison is `Q_q(Fr_q⁻¹)` (Definition IV.5.3). -/

/-- `Q` with `(X − 1) Q = P − P(1)`. When
`P(1) = 0` this is the `Q` of the finite–singular comparison, with `(X − 1) Q = P`. -/
noncomputable def fsQuotientPoly {R : Type*} [CommRing R] (P : R[X]) : R[X] :=
  (P - C (P.eval 1)) /ₘ (X - C 1)

/-- Division by the monic linear factor gives an integral identity. -/
theorem fsQuotientPoly_spec {R : Type*} [CommRing R] (P : R[X]) :
    (X - C 1) * fsQuotientPoly P = P - C (P.eval 1) :=
  mul_divByMonic_eq_iff_isRoot.2 (by simp [IsRoot])

/-- The quotient polynomial of 1−X is −1; reversing the denominator changes this sign. -/
example : fsQuotientPoly (1 - X : ℤ[X]) = -1 := by
  have h := fsQuotientPoly_spec (1 - X : ℤ[X])
  have heq : (X - C (1 : ℤ)) * fsQuotientPoly (1 - X) =
      (X - C 1) * (-1) := by
    rw [h]
    simp
  exact mul_left_cancel₀ (X_sub_C_ne_zero 1) heq

/-- A constant polynomial has quotient zero (`fsQuotientPoly_C`, README §1.8). -/
theorem fsQuotientPoly_C {R : Type*} [CommRing R] (c : R) : fsQuotientPoly (C c) = 0 := by
  simp [fsQuotientPoly]

/-- Subtracting `P(1)` removes the constant of `X² − a`, over every commutative ring. -/
example {R : Type*} [CommRing R] (a : R) : fsQuotientPoly (X ^ 2 - C a) = X + 1 := by
  have h := fsQuotientPoly_spec (X ^ 2 - C a)
  have heq : (X - C (1 : R)) * fsQuotientPoly (X ^ 2 - C a) = (X - C 1) * (X + 1) := by
    rw [h]
    simp only [eval_sub, eval_pow, eval_X, eval_C, one_pow]
    rw [C_sub, C_1]
    ring
  exact (monic_X_sub_C (1 : R)).isRegular.left heq

/-- A rank-two Frobenius with eigenvalues `1` and `a` keeps the second factor:
the quotient of `(1 − X)(1 − aX)` is `−(1 − aX)` (`finiteSingular_rank_two`, README §1.8). -/
theorem fsQuotientPoly_rank_two {R : Type*} [CommRing R] (a : R) :
    fsQuotientPoly ((1 - X) * (1 - C a * X)) = -(1 - C a * X) := by
  have h := fsQuotientPoly_spec ((1 - X) * (1 - C a * X))
  have heq : (X - C (1 : R)) * fsQuotientPoly ((1 - X) * (1 - C a * X)) =
      (X - C 1) * (-(1 - C a * X)) := by
    rw [h]
    simp only [eval_mul, eval_sub, eval_one, eval_X, sub_self, zero_mul, map_zero, sub_zero]
    rw [C_1]
    ring
  exact (monic_X_sub_C (1 : R)).isRegular.left heq

/-- At the double root of `(1 − X)²` the quotient polynomial vanishes at `1`, so the comparison
is not an isomorphism there (`finiteSingular_not_iso`, README §1.8). -/
theorem fsQuotientPoly_double_root {R : Type*} [CommRing R] :
    (fsQuotientPoly ((1 - X : R[X]) ^ 2)).eval 1 = 0 := by
  have h := fsQuotientPoly_spec ((1 - X : R[X]) ^ 2)
  have heq : (X - C (1 : R)) * fsQuotientPoly ((1 - X : R[X]) ^ 2) = (X - C 1) * (X - C 1) := by
    rw [h]
    simp only [eval_pow, eval_sub, eval_one, eval_X, sub_self, ne_eq, OfNat.ofNat_ne_zero,
      not_false_eq_true, zero_pow, map_zero, sub_zero]
    rw [C_1]
    ring
  rw [(monic_X_sub_C (1 : R)).isRegular.left heq]
  simp

end KolyvaginSystems

namespace EulerSystems

/-! ## Layer 3: the selected bounded descent

For a linear restriction map `f` whose kernel and cokernel are killed by `a`, the
selected class is `a² • b`, where `f b = a • x`. The factorization statement compares
it with the cyclic cocycle in an intermediate *global* cohomology group. It does not
assume that restriction at a ramified local prime has a bounded kernel.
-/

section SelectedDescent

variable {R A B C : Type*} [CommRing R]
  [AddCommGroup A] [AddCommGroup B] [AddCommGroup C]
  [Module R A] [Module R B] [Module R C]

/-- A choice-based formula over existing modules; independence is a theorem below. -/
noncomputable def selectedDescent (f : A →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, f b = a • x) (x : B) : A :=
  a ^ 2 • Classical.choose (hc x)

/-- A witness gives the same selected element when `a` kills the kernel. -/
theorem selectedDescent_eq (f : A →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, f b = a • x)
    (hk : ∀ y : A, f y = 0 → a • y = 0)
    (x : B) (b : A) (hb : f b = a • x) :
    selectedDescent f a hc x = a ^ 2 • b := by
  sorry

/-- Restriction of the selected class has the prescribed cubic scale. -/
theorem selectedDescent_spec (f : A →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, f b = a • x) (x : B) :
    f (selectedDescent f a hc x) = a ^ 3 • x := by
  sorry

/-- When `a` kills the kernel, the selected descent of a restricted class is `a³` times that
class. -/
theorem selectedDescent_comp_self (f : A →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, f b = a • x)
    (hk : ∀ y : A, f y = 0 → a • y = 0) (y : A) :
    selectedDescent f a hc (f y) = a ^ 3 • y := by
  sorry

/-- The cyclic class `z` need not be selected uniquely; the cubic scale agrees. -/
theorem selectedDescent_factor (r : A →ₗ[R] C) (s : C →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, (s.comp r) b = a • x)
    (hs : ∀ y : C, s y = 0 → a • y = 0)
    (x : B) (z : C) (hz : s z = x) :
    r (selectedDescent (s.comp r) a hc x) = a ^ 3 • z := by
  sorry

/-- At unit scale, identity restriction has identity descent. -/
example (x : A) :
    selectedDescent (LinearMap.id : A →ₗ[R] A) 1
      (fun y => ⟨y, by simp⟩) x = x := by
  simp [selectedDescent]

/-- For restriction given by multiplication by five, descent has scale twenty-five. -/
example : selectedDescent (5 • LinearMap.id : ℤ →ₗ[ℤ] ℤ) 5
    (fun y => ⟨y, by simp⟩) 3 = 75 := by
  let hc : ∀ y : ℤ, ∃ b : ℤ, (5 • LinearMap.id : ℤ →ₗ[ℤ] ℤ) b = 5 • y :=
    fun y => ⟨y, by simp⟩
  have h : 5 * Classical.choose (hc 3) = 15 := by
    simpa using Classical.choose_spec (hc 3)
  change 5 ^ 2 * Classical.choose (hc 3) = 75
  nlinarith

/-- The selected descent of zero is zero even when the kernel is nonzero. -/
theorem selectedDescent_zero (f : A →ₗ[R] B) (a : R)
    (hc : ∀ x : B, ∃ b : A, f b = a • x)
    (hk : ∀ y : A, f y = 0 → a • y = 0) :
    selectedDescent f a hc 0 = 0 := by
  sorry

/-- For reduction `ℤ/25 → ℤ/5` and `a = 5` the selected descent is zero, while the fibre over
zero contains a nonzero class: selection is not uniqueness (`selected_kernel_not_unique`,
README §3.5). -/
theorem selectedDescent_fibre_not_unique :
    let f : ZMod 25 →ₗ[ℤ] ZMod 5 :=
      (ZMod.castHom (by norm_num : 5 ∣ 25) (ZMod 5)).toAddMonoidHom.toIntLinearMap
    ∃ hc : ∀ x : ZMod 5, ∃ b : ZMod 25, f b = (5 : ℤ) • x,
      (∀ x, selectedDescent f 5 hc x = 0) ∧ ∃ y : ZMod 25, y ≠ 0 ∧ f y = 0 := by
  intro f
  refine ⟨fun x => ⟨0, ?_⟩, fun x => ?_, ⟨5, by decide, ?_⟩⟩
  · rw [map_zero, zsmul_eq_mul]
    have : ((5 : ℤ) : ZMod 5) = 0 := by decide
    rw [this, zero_mul]
  · simp only [selectedDescent, zsmul_eq_mul]
    have : (((5 : ℤ) ^ 2 : ℤ) : ZMod 25) = 0 := by decide
    rw [this, zero_mul]
  · rfl

end SelectedDescent

end EulerSystems

namespace ErrorTolerant

/-! ## Layer 4: bounded-image matrices over a truncated discrete valuation ring

The linear algebra behind the corrected Proposition 2.6.7 of Liu–Tian–Xiao–Zhang–Zhu: if a square
matrix over `R/ϖⁿ` has image containing `ϖᶜ (R/ϖⁿ)ʳ`, it has a two-sided scaled inverse (for
`c ≥ n` the scalar is zero and `C = 0` works). It need not be diagonalisable by column operations
alone. -/

/-- The scaled inverse of README §4.4`(b)`. -/
theorem scaled_inverse {R : Type*} [CommRing R] [IsDomain R] [IsDiscreteValuationRing R]
    {ϖ : R} (hϖ : Irreducible ϖ) {r n c : ℕ}
    (A : Matrix (Fin r) (Fin r) (R ⧸ Ideal.span {ϖ ^ n}))
    (hA : ∀ v : Fin r → R ⧸ Ideal.span {ϖ ^ n},
      ∃ w, A.mulVec w = Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ c) • v) :
    ∃ C : Matrix (Fin r) (Fin r) (R ⧸ Ideal.span {ϖ ^ n}),
      A * C = Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ c) • (1 : Matrix (Fin r) (Fin r) _) ∧
      C * A = Ideal.Quotient.mk (Ideal.span {ϖ ^ n}) (ϖ ^ c) • (1 : Matrix (Fin r) (Fin r) _) := by
  sorry

end ErrorTolerant

namespace KolyvaginSystems

/-! ## Layer 4: sheaves on graphs, surjective paths and hubs

Mazur–Rubin's sheaves on a graph (Definition 3.1.1) and their hub criterion (Proposition 3.4.4):
a global section is determined by its value at a hub. For a locally cyclic sheaf, every value
there extends exactly when the monodromy is trivial. -/

universe u v w

/-- A sheaf of `R`-modules on a simple graph: vertex stalks `S(v)`, edge modules `S(e)` and maps
`ψ_v^e : S(v) → S(e)` for each endpoint `v` of `e`. -/
structure GraphSheaf (R : Type u) [CommRing R] {V : Type v} (G : SimpleGraph V) where
  /-- The vertex stalks. -/
  stalk : V → Type w
  [instAddCommGroupStalk : ∀ x, AddCommGroup (stalk x)]
  [instModuleStalk : ∀ x, Module R (stalk x)]
  /-- The edge modules. -/
  edge : G.edgeSet → Type w
  [instAddCommGroupEdge : ∀ e, AddCommGroup (edge e)]
  [instModuleEdge : ∀ e, Module R (edge e)]
  /-- The vertex-to-edge maps. -/
  res : ∀ (e : G.edgeSet) (x : V), x ∈ (e : Sym2 V) → stalk x →ₗ[R] edge e

attribute [instance] GraphSheaf.instAddCommGroupStalk GraphSheaf.instModuleStalk
  GraphSheaf.instAddCommGroupEdge GraphSheaf.instModuleEdge

namespace GraphSheaf

variable {R : Type u} [CommRing R] {V : Type v} {G : SimpleGraph V}

/-- The global sections `Γ(S)`: families of stalk elements agreeing in every edge module. -/
def sections (S : GraphSheaf.{u, v, w} R G) : Submodule R (∀ x, S.stalk x) where
  carrier := {κ | ∀ (e : G.edgeSet) (x y : V) (hx : x ∈ (e : Sym2 V)) (hy : y ∈ (e : Sym2 V)),
    S.res e x hx (κ x) = S.res e y hy (κ y)}
  add_mem' {a b} ha hb e x y hx hy := by
    simp only [Pi.add_apply, map_add, ha e x y hx hy, hb e x y hx hy]
  zero_mem' e x y hx hy := by simp
  smul_mem' c a ha e x y hx hy := by
    simp only [Pi.smul_apply, map_smul, ha e x y hx hy]

/-- All stalks and edge modules are cyclic and all vertex-to-edge maps are surjective. -/
def IsLocallyCyclic (S : GraphSheaf.{u, v, w} R G) : Prop :=
  (∀ x, (⊤ : Submodule R (S.stalk x)).IsPrincipal) ∧
    (∀ e, (⊤ : Submodule R (S.edge e)).IsPrincipal) ∧
    ∀ (e : G.edgeSet) (x : V) (hx : x ∈ (e : Sym2 V)), Function.Surjective (S.res e x hx)

/-- A surjective path: each step `x → y` along an edge `e` has `ψ_y^e` bijective. -/
inductive SurjPath (S : GraphSheaf.{u, v, w} R G) : V → V → Type (max v w)
  | nil (x : V) : SurjPath S x x
  | cons {x y z : V} (h : G.Adj x y)
      (hb : Function.Bijective (S.res ⟨s(x, y), G.mem_edgeSet.2 h⟩ y (Sym2.mem_mk_right x y)))
      (p : SurjPath S y z) : SurjPath S x z

/-- The transport `ψ_P`, composing `(ψ_y^e)⁻¹ ∘ ψ_x^e` along the steps of a surjective path. -/
noncomputable def SurjPath.transport {S : GraphSheaf.{u, v, w} R G} :
    ∀ {x y : V}, S.SurjPath x y → (S.stalk x →ₗ[R] S.stalk y)
  | _, _, .nil _ => LinearMap.id
  | _, _, .cons h hb p =>
      p.transport ∘ₗ ((LinearEquiv.ofBijective _ hb).symm : _ →ₗ[R] _) ∘ₗ
        S.res ⟨_, G.mem_edgeSet.2 h⟩ _ (Sym2.mem_mk_left _ _)

/-- `x` is a hub: every vertex is the end of a surjective path from `x`. -/
def IsHub (S : GraphSheaf.{u, v, w} R G) (x : V) : Prop :=
  ∀ y, Nonempty (S.SurjPath x y)

/-- Trivial monodromy: transports along surjective paths with the same ends agree, and transports
to the two ends of an edge agree in its edge module. -/
def HasTrivialMonodromy (S : GraphSheaf.{u, v, w} R G) : Prop :=
  (∀ {x y : V} (P P' : S.SurjPath x y), P.transport = P'.transport) ∧
    ∀ {x y y' : V} (P : S.SurjPath x y) (P' : S.SurjPath x y') (e : G.edgeSet)
      (hy : y ∈ (e : Sym2 V)) (hy' : y' ∈ (e : Sym2 V)),
      S.res e y hy ∘ₗ P.transport = S.res e y' hy' ∘ₗ P'.transport

/-- Evaluation at a hub is injective on global sections (Mazur–Rubin, Proposition 3.4.4(i)). -/
theorem eval_injective_of_isHub (S : GraphSheaf.{u, v, w} R G) {x : V} (hx : S.IsHub x) :
    Function.Injective fun κ : S.sections => (κ : ∀ y, S.stalk y) x := by
  sorry

/-- For a locally cyclic sheaf, evaluation at a hub is surjective exactly when the monodromy
is trivial (Mazur–Rubin, Proposition 3.4.4(i)). -/
theorem eval_surjective_iff (S : GraphSheaf.{u, v, w} R G) (hS : S.IsLocallyCyclic)
    {x : V} (hx : S.IsHub x) :
    Function.Surjective (fun κ : S.sections => (κ : ∀ y, S.stalk y) x) ↔
      S.HasTrivialMonodromy := by
  sorry

/-- On a triangle over `𝔽₂`, a zero hub can have surjective evaluation while transport around
the nonzero stalk has nontrivial monodromy (README §4.11). -/
theorem hub_surjective_not_trivialMonodromy :
    ∃ S : GraphSheaf (ZMod 2) (⊤ : SimpleGraph (Fin 3)), S.IsHub 0 ∧
      Function.Surjective (fun κ : S.sections => (κ : ∀ y, S.stalk y) 0) ∧
      ¬ S.HasTrivialMonodromy := by
  sorry

end GraphSheaf

end KolyvaginSystems

namespace StarkSystems

/-! ## Layer 6: the shared exterior bidual and its finite-projective comparison

IntegralIwasawaTheory §12.6 owns `⋂^r_R X = Hom_R(⋀^r Hom_R(X, R), R)` and determinant
evaluation. The transparent aliases below record that common carrier on Mathlib's dual and
exterior power; the finite-projective comparison belongs to this roadmap. -/

/-- The shared exterior bidual `⋂^r_R X` of IntegralIwasawaTheory §12.6. -/
abbrev exteriorBidual (R : Type*) [CommRing R] (r : ℕ) (X : Type*) [AddCommGroup X]
    [Module R X] : Type _ :=
  Module.Dual R (⋀[R]^r (Module.Dual R X))

/-- The shared determinant evaluation `⋀^r_R X → ⋂^r_R X`, `x ↦ (φ ↦ ⟨φ, x⟩)`.
In the functional-first convention of README §§6.3 and 6.9, contraction evaluates at `v ∧ Φ`;
the published Stark comparison uses this evaluation without an additional degree sign. -/
noncomputable abbrev toExteriorBidual (R : Type*) [CommRing R] (r : ℕ) (X : Type*)
    [AddCommGroup X] [Module R X] : ⋀[R]^r X →ₗ[R] exteriorBidual R r X :=
  (exteriorPower.pairingDual R X r).flip

/-- For finite projective `X` determinant evaluation is an isomorphism (README §6.1). -/
theorem toExteriorBidual_bijective_of_projective (R : Type*) [CommRing R] (r : ℕ) (X : Type*)
    [AddCommGroup X] [Module R X] [Module.Projective R X] [Module.Finite R X] :
    Function.Bijective (toExteriorBidual R r X) := by
  sorry

end StarkSystems

/- Further arithmetic definitions and constructions specified in the README:
KolyvaginSystems.SelmerTriple, KolyvaginSystems.QuotCat, KolyvaginSystems.IsCartesian,
KolyvaginSystems.coreRankInt, KolyvaginSystems.canonicalStructure, KolyvaginSystems.MR04Hypotheses,
KolyvaginSystems.MR16Hypotheses, KolyvaginSystems.rayPExtension, KolyvaginSystems.conductorIdeal,
KolyvaginSystems.mr04Primes, KolyvaginSystems.kolyvaginPrimes, KolyvaginSystems.transverse,
KolyvaginSystems.SelmerTriple.modify, KolyvaginSystems.SelfDual.finiteSingular,
ErrorTolerant.gammaAssociated, EulerSystems.EulerSystem, EulerSystems.EulerSystem.twist,
EulerSystems.Universal.X, EulerSystems.IsRigid, KolyvaginSystems.normElement,
KolyvaginSystems.derivativeClass, KolyvaginSystems.KolyvaginSystem, KolyvaginSystems.correctedClass,
KolyvaginSystems.conductorGraph, KolyvaginSystems.selmerLength,
KolyvaginSystems.stubSheaf, EulerSystems.HypKT, KolyvaginSystems.KolyvaginSystem.divIndex,
KolyvaginSystems.kolyvaginDualSelmer, KolyvaginSystems.SelfDual.Hypotheses,
StarkSystems.selmerBidual,
StarkSystems.stalk, StarkSystems.BSSHypothesis32, StarkSystems.KolyvaginSystemRank,
RubinStark.modifiedUnits, EulerSystems.HigherEulerSystem, EulerSystems.rawHigherDerivative,
RubinStark.rubinBrumerStark, EulerSystem.ZpdExtension, EulerSystem.IwasawaHypT,
EulerSystem.LeopoldtTowerHyp, EulerSystem.restrictedSelmerInf, EulerSystem.iwasawaClass,
EulerSystem.lambdaIndex, EulerSystem.trueSelmerInf, EulerSystem.twistGamma,
EulerSystem.evalStar, EulerSystem.UnramifiedAtSplitPrimes, KolyvaginSystem.lambdaRep,
KolyvaginSystem.lambdaKS, KolyvaginSystem.exceptionalSet, KolyvaginSystem.specRing,
KolyvaginSystem.ind, KolyvaginSystems.TwistData,
EulerSystems.RingClassEulerSystem, EulerSystems.RingClassEulerSystem.admissiblePrimes, KolyvaginSystems.SelfDual.index.
Further coefficient, local and system data accompanying these definitions are
KolyvaginSystems.IsCoefficientRing, KolyvaginSystems.residueChar,
KolyvaginSystems.IsCompactCoefficient, KolyvaginSystems.IsDiscreteCoefficient,
KolyvaginSystems.IsArithmeticCoefficient, KolyvaginSystems.SelmerStructure,
KolyvaginSystems.dualRep, KolyvaginSystems.UnramifiedLocalLayer,
KolyvaginSystems.unramifiedCor, KolyvaginSystems.universalNormSubgroup,
KolyvaginSystems.saturation, KolyvaginSystems.unramifiedCondition,
KolyvaginSystems.unramifiedStructure, KolyvaginSystems.coreRank,
KolyvaginSystems.gammaPrime, KolyvaginSystems.tameGroup, KolyvaginSystems.finitePart,
ErrorTolerant.reducibilityDepth, ErrorTolerant.frobeniusSet, ErrorTolerant.IsAbundant,
KolyvaginSystems.frobeniusPrimes, KolyvaginSystems.rubinPrimes,
KolyvaginSystems.finiteSingular, KolyvaginSystems.scalarError, KolyvaginSystems.spanError,
EulerSystems.eulerPolyAt, EulerSystems.eulerPolyMR, EulerSystems.IsAdmissibleTower,
EulerSystems.Universal.gen,
EulerSystems.FiniteDepthEulerSystem, EulerSystems.AnticyclotomicEulerSystem,
EulerSystems.EulerSystem.IsTrivialAt, KolyvaginSystems.WeakKolyvaginSystem,
KolyvaginSystems.GeneralizedKolyvaginSystem, KolyvaginSystems.moduleOfLValues,
KolyvaginSystems.blindSpot,
KolyvaginSystems.selmerSheaf, EulerSystems.HypKV, EulerSystems.indexOfDivisibility,
EulerSystems.errorTerm, KolyvaginSystems.GraphSheaf.IsPrimitive,
KolyvaginSystems.GraphSheaf.generates_of_generates, KolyvaginSystems.GraphSheaf.mem_sections,
KolyvaginSystems.IsCoreVertex, KolyvaginSystems.IsLeadingVertex,
KolyvaginSystems.divisibilityIndex, KolyvaginSystems.KolyvaginSystem.elementaryDivisor,
KolyvaginSystems.KolyvaginSystem.divIndexInfty, EulerSystems.deltaCorrection,
KolyvaginSystems.KolyvaginSystem.IsPrimitive, KolyvaginSystems.SelfDual.inertPrimes,
KolyvaginSystems.SelfDual.minIndex, KolyvaginSystems.SelfDual.stableIndex,
KolyvaginSystems.SelfDual.coreDivisibility, KolyvaginSystems.SelfDual.IsPrimitive,
StarkSystems.BSSHypothesis33, StarkSystems.BSSHypothesis42, StarkSystems.BSSHypothesis47,
RubinStark.ordG, RubinStark.rubinLattice, StarkSystems.transition,
StarkSystems.StarkSystem, StarkSystems.regulator, EulerSystems.BSSHypothesis61,
EulerSystems.higherDerivative, RubinStark.RubinConjecture, EulerSystem.Xinf,
EulerSystem.IwasawaHypV, EulerSystem.iwasawaClassAt, EulerSystem.singularLocalInf,
EulerSystem.locSingularInf, EulerSystem.rubinEval, EulerSystem.evalAt, EulerSystem.aTau,
KolyvaginSystem.LambdaSelmerStructure, KolyvaginSystem.lambdaKSBar,
KolyvaginSystem.bottomClass, KolyvaginSystem.specRep, KolyvaginSystem.specialize,
KolyvaginSystem.perturb, KolyvaginSystem.indKS and KolyvaginSystem.IsLambdaPrimitive.
FiniteSelmerDuality.traceComparison, FiniteSelmerDuality.pairing,
FiniteSelmerDuality.orthogonal_propagate, FiniteSelmerDuality.selmer_change,
FiniteSelmerDuality.coefficient_naturality, FiniteSelmerDuality.gorensteinOrderDual,
EulerSystems.ChiRayLocalData,
EulerSystems.ChiRayLowerData, EulerSystems.chiRayCongruenceLift,
EulerSystems.chiRayTorsionCongruence, EulerSystems.chiRayIntegralClassComparison,
EulerSystems.chiUniversalPresentation, EulerSystems.chiRefinedPrimes,
EulerSystems.chiUniversalDerivativeDescent, EulerSystems.chiCompatibleCochainLifts,
KolyvaginSystems.MR16Hypotheses.frobeniusRefinement,
KolyvaginSystems.MR16Hypotheses.detect,
OrdinaryCoefficientPrime.local, OrdinaryCoefficientPrime.corrections and
OrdinaryCoefficientPrime.change also have arithmetic carriers specified in the README.
KolyvaginSystems.IsSelfInjectiveCoefficient records the finite local coefficient data.
The local-order carriers divisionValuation, divisionIntegers, the rectangular
bimodule normal form, centralizerLatticeOrder and pairingCorner, and the
ordinaryFiltration, ordinaryLocalCondition and anticyclotomicSelmerStructure
carriers are likewise README targets. Their statements specify the module sides,
fullness, finite arithmetic support and coefficient-prime hypotheses there.
The arithmetic Frobenius criterion KolyvaginSystems.mem_rubinPrimes_of_frobenius
of README §1.7 requires q outside N and tau fixing the finite compositum of F(1),
cyclotomic roots and unit radicals, as well as nonzero tau-invariants and Frobenius
conjugacy on the further compositum with W_M.
The ring-class restriction condition of §5.2 is defined at every inert prime away
from p and ramification. Its local maximal-tame identification also requires
p not dividing ell - 1 and the CM-unit index; for odd p these hold at the active
primes under the stated unit hypothesis. A nonzero coefficient quotient killed
by ell + 1 already forces the required residue congruence.
StarkSystems.KolyvaginSystemRank, StarkSystems.regulator and the structure results
of §§6.7–6.8 have positive rank at finite level and in every order limit;
StarkSystems.StarkSystem in §§6.5–6.6 retains rank zero. The negative exterior
degree in the Kolyvagin edge relation has no instance at rank zero.
The arithmetic determinant targets of §7.5a are
EulerSystems.verticalDeterminantSystem, EulerSystems.basicEulerSystemMap,
EulerSystems.basicEulerSystems, EulerSystems.horizontalDeterminantSystem,
EulerSystems.verticalToHorizontal_surjective, EulerSystems.determinantRegulatorSquare,
EulerSystems.higherDerivative_surjective and EulerSystems.higherDerivative_order_surjective.
They construct Euler families from the actual compact-support determinants and
compare their derivatives with horizontal Stark systems and the regulator, under
the archimedean freeness and local vanishing hypotheses stated there.
KolyvaginSystem.exceptionalSet_twist in §8.13 uses direct images of ideals under
Tw_rho for the positive tautological action of §8.5. The inverse transport in
§8.9 instead concerns Rubin's conjugation action. The inert-prime splitting
statement in §§8.1 and 8.28 applies to primes away from p.
These targets, the arithmetic Iwasawa comparison of Layer 8, the coinduced
Euler-system lift and the higher-rank regulator need arithmetic carriers absent
at the pin. The README Checks sections_zero_hub, sections_one_vertex
and sections_ne_product concern the sections of GraphSheaf above. -/

end TauCetiRoadmap.EulerSystemsAndKolyvaginSystems
