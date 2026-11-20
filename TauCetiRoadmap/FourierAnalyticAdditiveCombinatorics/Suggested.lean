import Mathlib

/-!
# Fourier-analytic additive combinatorics: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the three
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

Characters of a finite abelian group `G` are Mathlib's `AddChar G ℂ`; the trivial character is
`0`. A set is a `Finset`, and "free of three-term progressions" is Mathlib's `ThreeAPFree`, under
which `a + c = b + b` forces `a = b`. Character sums are not normalized: the character sum of `A`
at `ψ` is `∑ a ∈ A, ψ a`, and three-term progressions are counted with the trivial ones.
-/

noncomputable section

open Finset
open scoped Pointwise

namespace TauCetiRoadmap.FourierAnalyticAdditiveCombinatorics

/-! ## Layer 1: character sums and the count of three-term progressions -/

section Count

variable {G : Type*} [AddCommGroup G] [Fintype G] [DecidableEq G]

/-- 1.1 The character sum of a finite set `A` at a character `ψ`: `∑ a ∈ A, ψ a`, the
unnormalized Fourier coefficient of the indicator of `A` at the conjugate character. -/
def charSum (A : Finset G) (ψ : AddChar G ℂ) : ℂ :=
  ∑ a ∈ A, ψ a

/-- 1.1 Parseval's identity for a set: `∑_ψ |∑_{a ∈ A} ψ a|² = |G| |A|`. -/
theorem sum_norm_charSum_sq (A : Finset G) :
    ∑ ψ : AddChar G ℂ, ‖charSum A ψ‖ ^ 2 = (Fintype.card G : ℝ) * #A := by
  sorry

/-- 1.2 The number of triples `(x, y, z) ∈ A³` with `x + z = y + y`, trivial ones included;
equivalently the number of pairs `(x, d)` with `x, x + d, x + 2d ∈ A`. -/
def threeAPCount (A : Finset G) : ℕ :=
  #{t ∈ A ×ˢ A ×ˢ A | t.1 + t.2.2 = t.2.1 + t.2.1}

/-- 1.2 The counting identity: `|G| · N₃(A) = ∑_ψ S_A(ψ)² · ∑_{y ∈ A} ψ(−2y)`. -/
theorem card_mul_threeAPCount (A : Finset G) :
    (Fintype.card G : ℂ) * threeAPCount A =
      ∑ ψ : AddChar G ℂ, charSum A ψ ^ 2 * ∑ y ∈ A, ψ (-(y + y)) := by
  sorry

/-- 1.3 The counting lemma: if every nontrivial character sum of `A` has modulus at most
`M ≥ 0`, then `|A|³ ≤ |G| (N₃(A) + M |A|)`. -/
theorem card_pow_three_le (A : Finset G) {M : ℝ} (hM₀ : 0 ≤ M)
    (hM : ∀ ψ : AddChar G ℂ, ψ ≠ 0 → ‖charSum A ψ‖ ≤ M) :
    (#A : ℝ) ^ 3 ≤ Fintype.card G * (threeAPCount A + M * #A) := by
  sorry

/-- 1.4 A set without nontrivial three-term progressions in a nontrivial finite abelian group
has a nontrivial character sum of modulus at least `|A|² / |G| − 1`. -/
theorem exists_ne_zero_norm_charSum_ge [Nontrivial G] (A : Finset G)
    (hA : ThreeAPFree (A : Set G)) :
    ∃ ψ : AddChar G ℂ, ψ ≠ 0 ∧ (#A : ℝ) ^ 2 / Fintype.card G - 1 ≤ ‖charSum A ψ‖ := by
  sorry

end Count

/-! ## Layer 2: Meshulam's theorem in `𝔽₃ⁿ` -/

/-- 2.1 Density increment: if `A ⊆ 𝔽₃ⁿ` has no nontrivial three-term progression and
`2 · 3ⁿ ≤ |A|²`, then on some coset of a hyperplane `A` has density at least `α + α²/4`, where
`α = |A| / 3ⁿ`; the coset `{φ = c}` has `3ⁿ⁻¹` points. -/
theorem exists_hyperplane_density_increment {n : ℕ} (A : Finset (Fin n → ZMod 3))
    (hA : ThreeAPFree (A : Set (Fin n → ZMod 3))) (hN : 2 * 3 ^ n ≤ #A ^ 2) :
    ∃ φ : Module.Dual (ZMod 3) (Fin n → ZMod 3), φ ≠ 0 ∧ ∃ c : ZMod 3,
      (#A : ℝ) / 3 ^ n + ((#A : ℝ) / 3 ^ n) ^ 2 / 4 ≤
        3 * (#{a ∈ A | φ a = c} : ℝ) / 3 ^ n := by
  sorry

/-- 2.2 Meshulam's theorem with an explicit constant: a subset of `𝔽₃ⁿ` without nontrivial
three-term progressions has `n · |A| ≤ 6 · 3ⁿ`. -/
theorem card_mul_le_six_mul {n : ℕ} (A : Finset (Fin n → ZMod 3))
    (hA : ThreeAPFree (A : Set (Fin n → ZMod 3))) :
    (#A : ℝ) * n ≤ 6 * 3 ^ n := by
  sorry

/-! ## Layer 3: the polynomial method -/

/-- 3.1 The number `m_d` of monomials in `n` variables in which each variable has degree at most
`q - 1` and whose total degree is at most the real number `d`: the exponent vectors
`e : Fin n → Fin q` with `∑ i, e i ≤ d`. -/
def monomialCount (q n : ℕ) (d : ℝ) : ℕ :=
  #{e : Fin n → Fin q | ((∑ i, (e i : ℕ) : ℕ) : ℝ) ≤ d}

section PolynomialMethod

variable {F : Type*} [Field F] [Finite F] [DecidableEq F] {n : ℕ}

/-- 3.2 The Croot–Lev–Pach lemma in the form of Ellenberg and Gijswijt: let `α + β + γ = 0`
and let `P` have total degree at most `d`. If `P (α a + β b) = 0` for all distinct `a, b ∈ A`,
then `P (−γ a) ≠ 0` for at most `2 m_{d/2}` elements `a ∈ A`. -/
theorem card_filter_eval_ne_zero_le (A : Finset (Fin n → F)) {α β γ : F}
    (hsum : α + β + γ = 0) (P : MvPolynomial (Fin n) F) {d : ℕ} (hP : P.totalDegree ≤ d)
    (hvan : ∀ a ∈ A, ∀ b ∈ A, a ≠ b → MvPolynomial.eval (α • a + β • b) P = 0) :
    #{a ∈ A | MvPolynomial.eval (-γ • a) P ≠ 0} ≤
      2 * monomialCount (Nat.card F) n ((d : ℝ) / 2) := by
  sorry

/-- 3.3 The Ellenberg–Gijswijt theorem: let `α + β + γ = 0`. If the only solutions of
`α a₁ + β a₂ + γ a₃ = 0` in `A³` have `a₁ = a₂ = a₃`, then `|A| ≤ 3 m_{(q - 1) n / 3}`. -/
theorem card_le_three_mul_monomialCount (A : Finset (Fin n → F)) {α β γ : F}
    (hsum : α + β + γ = 0)
    (hA : ∀ a₁ ∈ A, ∀ a₂ ∈ A, ∀ a₃ ∈ A, α • a₁ + β • a₂ + γ • a₃ = 0 → a₁ = a₂ ∧ a₂ = a₃) :
    #A ≤ 3 * monomialCount (Nat.card F) n (((Nat.card F : ℝ) - 1) * n / 3) := by
  sorry

/-- 3.4 The bound for sets without three-term progressions over every finite field, the case
`α = β = 1`, `γ = -2` of 3.3: such a subset of `𝔽_qⁿ` has at most `3 m_{(q - 1) n / 3}`
elements. -/
theorem card_le_of_threeAPFree (A : Finset (Fin n → F)) (hA : ThreeAPFree (A : Set (Fin n → F))) :
    #A ≤ 3 * monomialCount (Nat.card F) n (((Nat.card F : ℝ) - 1) * n / 3) := by
  sorry

end PolynomialMethod

/-- 3.5 The exponential cap set bound in `𝔽₃ⁿ`: for every `x > 0`,
`|A| ≤ 3 (1 + x + x²)ⁿ / x^(2n/3)`; at `x = (√33 − 1)/8` the base is below `2.756`. -/
theorem card_le_of_threeAPFree_zmod_three {n : ℕ} (A : Finset (Fin n → ZMod 3))
    (hA : ThreeAPFree (A : Set (Fin n → ZMod 3))) {x : ℝ} (hx : 0 < x) :
    (#A : ℝ) ≤ 3 * (1 + x + x ^ 2) ^ n / x ^ ((2 * n : ℝ) / 3) := by
  sorry

/-! ## Layer 4: Bogolyubov's lemma -/

section Bogolyubov

variable {G : Type*} [AddCommGroup G] [Fintype G] [DecidableEq G]

/-- 4.1 Bogolyubov's lemma in a finite abelian group: for nonempty `A` there is a set `R` of
characters with `|R| |A|² < |G|²` such that every `x` with `Re ψ(x) ≥ 0` for all `ψ ∈ R` lies in
`A + A − A − A`. -/
theorem exists_bohr_subset_add_sub (A : Finset G) (hA : A.Nonempty) :
    ∃ R : Finset (AddChar G ℂ), #R * #A ^ 2 < Fintype.card G ^ 2 ∧
      ∀ x : G, (∀ ψ ∈ R, 0 ≤ (ψ x).re) → x ∈ A + A - A - A := by
  sorry

end Bogolyubov

/-- 4.2 Bogolyubov's lemma in a finite vector space over `𝔽_p`: for nonempty `A`, the set
`A + A − A − A` contains a subspace `W` with `codim W · |A|² < |V|²`. -/
theorem exists_submodule_subset_add_sub {p : ℕ} [Fact p.Prime] {V : Type*} [AddCommGroup V]
    [Module (ZMod p) V] [Fintype V] [DecidableEq V] (A : Finset V) (hA : A.Nonempty) :
    ∃ W : Submodule (ZMod p) V, (W : Set V) ⊆ ((A + A - A - A : Finset V) : Set V) ∧
      (Module.finrank (ZMod p) V - Module.finrank (ZMod p) W) * #A ^ 2 <
        Fintype.card V ^ 2 := by
  sorry

end TauCetiRoadmap.FourierAnalyticAdditiveCombinatorics
