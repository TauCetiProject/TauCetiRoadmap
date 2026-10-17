import Mathlib

/-!
# Periods of elliptic curves and the Grothendieck period conjecture: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap.

Everything is stated on Mathlib's `PeriodPair` (a pair of `ℝ`-linearly independent complex
numbers, `Mathlib/Analysis/SpecialFunctions/Elliptic/Weierstrass.lean`) and its `lattice`,
`weierstrassP`, `derivWeierstrassP`, `G`, `g₂`, `g₃`. The new objects — the Weierstrass `ζ`
function, the quasi-period map, the period field, complex multiplication of a lattice and the
conjecture itself — are **defined outright** below, since their Mathlib vocabulary exists. Only
theorem statements are `sorry`. The conjecture is a `def … : Prop` and is never assumed by a
theorem of this roadmap except as an explicit hypothesis.

Conventions (README §Conventions): a basis `(ω₁, ω₂)` is *positive* when `0 < (ω₂ / ω₁).im`;
the quasi-period map `η` satisfies `ζ(z + l) = ζ(z) + η(l)`; Legendre's relation reads
`η(ω₁) ω₂ − η(ω₂) ω₁ = 2πi` for a positive basis; transcendence degrees are taken over `ℚ`
(they agree with those over `ℚ̄`); "algebraic" means `IsAlgebraic ℚ` inside `ℂ`.

The Nesterenko statement used in Layer 5 is owned and proved by the
DiophantineApproximationAndTranscendence roadmap (§5.6, `nesterenko`); it is restated here as
`NesterenkoStatement` only so that the bridge theorem `chudnovsky_of_nesterenko` can be stated
without importing that roadmap's file.
-/

open Complex

namespace TauCetiRoadmap.GrothendieckPeriodConjecture

/-! ## Layer 0: period pairs — scaling and the upper half-plane -/

/-- `c • L` for a unit `c : ℂˣ`: the period pair `(c ω₁, c ω₂)`. -/
noncomputable instance : SMul ℂˣ PeriodPair where
  smul c L :=
    { ω₁ := c * L.ω₁
      ω₂ := c * L.ω₂
      indep := by
        have h := L.indep.map' ((LinearMap.mulLeft ℝ (c : ℂ)))
          (LinearMap.ker_eq_bot.mpr (mul_right_injective₀ c.ne_zero))
        convert h using 1
        ext i
        fin_cases i <;> rfl }

@[simp] lemma smul_ω₁ (c : ℂˣ) (L : PeriodPair) : (c • L).ω₁ = c * L.ω₁ := rfl
@[simp] lemma smul_ω₂ (c : ℂˣ) (L : PeriodPair) : (c • L).ω₂ = c * L.ω₂ := rfl

/-- The period pair `(1, τ)` of a point of the upper half-plane; it is a positive basis. -/
noncomputable def ofUpperHalfPlane (τ : UpperHalfPlane) : PeriodPair where
  ω₁ := 1
  ω₂ := τ
  indep := by
    rw [LinearIndependent.pair_iff]
    intro s t h
    have him := congrArg Complex.im h
    simp only [Complex.real_smul, Complex.add_im, Complex.mul_im, Complex.ofReal_re,
      Complex.ofReal_im, Complex.one_im, Complex.one_re, zero_mul, add_zero, mul_zero,
      zero_add, Complex.zero_im] at him
    have ht : t = 0 := by
      rcases mul_eq_zero.mp him with h' | h'
      · exact h'
      · exact absurd h' (ne_of_gt τ.im_pos)
    subst ht
    simpa using h

lemma lattice_smul (c : ℂˣ) (L : PeriodPair) :
    (c • L).lattice = (L.lattice).map (LinearMap.mulLeft ℤ (c : ℂ)) := sorry

lemma G_smul (c : ℂˣ) (L : PeriodPair) (k : ℕ) : (c • L).G k = (c : ℂ)⁻¹ ^ k * L.G k := sorry

lemma g₂_smul (c : ℂˣ) (L : PeriodPair) : (c • L).g₂ = (c : ℂ)⁻¹ ^ 4 * L.g₂ := sorry

lemma g₃_smul (c : ℂˣ) (L : PeriodPair) : (c • L).g₃ = (c : ℂ)⁻¹ ^ 6 * L.g₃ := sorry

lemma weierstrassP_smul (c : ℂˣ) (L : PeriodPair) (z : ℂ) :
    (c • L).weierstrassP (c * z) = (c : ℂ)⁻¹ ^ 2 * L.weierstrassP z := sorry

/-- `℘` depends only on the lattice. -/
lemma weierstrassP_congr {L L' : PeriodPair} (h : L.lattice = L'.lattice) :
    L.weierstrassP = L'.weierstrassP := sorry

/-! ## Layer 1: elliptic functions for a period pair -/

/-- A meromorphic function on `ℂ` admitting every lattice vector as a period
(junk values at poles are allowed, as for Mathlib's `weierstrassP`). -/
def IsEllipticFunction (L : PeriodPair) (f : ℂ → ℂ) : Prop :=
  Meromorphic f ∧ ∀ l ∈ L.lattice, Function.Periodic f l

theorem isEllipticFunction_weierstrassP (L : PeriodPair) :
    IsEllipticFunction L L.weierstrassP := sorry

/-- Liouville for elliptic functions: an entire elliptic function is constant. -/
theorem IsEllipticFunction.exists_eq_const {L : PeriodPair} {f : ℂ → ℂ}
    (hf : IsEllipticFunction L f) (hd : Differentiable ℂ f) : ∃ c, f = fun _ ↦ c := sorry

/-- Zeros and poles balance over a fundamental parallelogram. -/
theorem IsEllipticFunction.finsum_meromorphicOrderAt_eq_zero {L : PeriodPair} {f : ℂ → ℂ}
    (hf : IsEllipticFunction L f) (hne : ¬ ∀ᶠ z in Filter.codiscrete ℂ, f z = 0) :
    ∑ᶠ p ∈ ZSpan.fundamentalDomain L.basis, meromorphicOrderAt f p = 0 := sorry

/-- Every even elliptic function is a rational function of `℘`, off a discrete set. -/
theorem IsEllipticFunction.exists_eq_div_weierstrassP {L : PeriodPair} {f : ℂ → ℂ}
    (hf : IsEllipticFunction L f) (heven : Function.Even f) :
    ∃ P Q : Polynomial ℂ, Q ≠ 0 ∧ ∀ᶠ z in Filter.codiscrete ℂ,
      f z * Q.eval (L.weierstrassP z) = P.eval (L.weierstrassP z) := sorry

/-- The cubic `4X³ − g₂X − g₃` has distinct roots. -/
theorem discriminant_ne_zero (L : PeriodPair) : L.g₂ ^ 3 - 27 * L.g₃ ^ 2 ≠ 0 := sorry

/-- The Laurent expansion `℘(z) = z⁻² + ∑_{k ≥ 1} (2k + 1) G_{2k+2} z^{2k}` near `0`. -/
theorem hasSum_weierstrassP_laurent (L : PeriodPair) :
    ∀ᶠ z in nhdsWithin (0 : ℂ) {0}ᶜ,
      HasSum (fun k : ℕ ↦ (2 * (k + 1) + 1 : ℂ) * L.G (2 * (k + 1) + 2) * z ^ (2 * (k + 1)))
        (L.weierstrassP z - z⁻¹ ^ 2) := sorry

/-- The Eisenstein sums `G_{2k}` (`k ≥ 2`) are polynomials over `ℚ` in `g₂, g₃`. -/
theorem G_mem_adjoin (L : PeriodPair) {k : ℕ} (hk : 2 ≤ k) :
    L.G (2 * k) ∈ Algebra.adjoin ℚ ({L.g₂, L.g₃} : Set ℂ) := sorry

/-! ## Layer 2: the Weierstrass ζ function and the quasi-periods -/

open Classical in
/-- The Weierstrass `ζ` function `ζ(z) = 1/z + ∑'_{l ≠ 0} (1/(z − l) + 1/l + z/l²)`
(DLMF 23.2.5), with junk value at lattice points. -/
noncomputable def weierstrassZeta (L : PeriodPair) (z : ℂ) : ℂ :=
  z⁻¹ + ∑' l : L.lattice, if (l : ℂ) = 0 then 0 else (z - l)⁻¹ + (l : ℂ)⁻¹ + z / (l : ℂ) ^ 2

/-- The quasi-period map: `η(l) = ζ(z + l) − ζ(z)`, evaluated at the base point `ω₁ / 2`, which
is not a lattice point (`PeriodPair.ω₁_div_two_notMem_lattice`); `weierstrassZeta_add_coe`
shows that any base point off the lattice gives the same value. -/
noncomputable def quasiPeriod (L : PeriodPair) (l : ℂ) : ℂ :=
  weierstrassZeta L (L.ω₁ / 2 + l) - weierstrassZeta L (L.ω₁ / 2)

theorem weierstrassZeta_neg (L : PeriodPair) (z : ℂ) :
    weierstrassZeta L (-z) = -weierstrassZeta L z := sorry

theorem meromorphic_weierstrassZeta (L : PeriodPair) : Meromorphic (weierstrassZeta L) := sorry

theorem hasDerivAt_weierstrassZeta (L : PeriodPair) {z : ℂ} (hz : z ∉ L.lattice) :
    HasDerivAt (weierstrassZeta L) (-L.weierstrassP z) z := sorry

theorem weierstrassZeta_add_coe (L : PeriodPair) {z : ℂ} (hz : z ∉ L.lattice) {l : ℂ}
    (hl : l ∈ L.lattice) : weierstrassZeta L (z + l) = weierstrassZeta L z + quasiPeriod L l :=
  sorry

theorem quasiPeriod_add (L : PeriodPair) {l l' : ℂ} (hl : l ∈ L.lattice)
    (hl' : l' ∈ L.lattice) : quasiPeriod L (l + l') = quasiPeriod L l + quasiPeriod L l' := sorry

theorem quasiPeriod_smul (c : ℂˣ) (L : PeriodPair) {l : ℂ} (hl : l ∈ L.lattice) :
    quasiPeriod (c • L) (c * l) = (c : ℂ)⁻¹ * quasiPeriod L l := sorry

/-- `ζ` and `η` depend only on the lattice. -/
theorem quasiPeriod_congr {L L' : PeriodPair} (h : L.lattice = L'.lattice) {l : ℂ}
    (hl : l ∈ L.lattice) : quasiPeriod L l = quasiPeriod L' l := sorry

/-- **Legendre's relation** for a positive basis. -/
theorem legendre (L : PeriodPair) (hL : 0 < (L.ω₂ / L.ω₁).im) :
    quasiPeriod L L.ω₁ * L.ω₂ - quasiPeriod L L.ω₂ * L.ω₁ = 2 * π * I := sorry

/-- The Eisenstein dictionary at `(1, τ)`: `g₂ = (4π⁴/3) E₄(τ)`. -/
theorem g₂_ofUpperHalfPlane (τ : UpperHalfPlane) :
    (ofUpperHalfPlane τ).g₂ = 4 * (π : ℂ) ^ 4 / 3 * ModularForm.E₄ τ := sorry

/-- The Eisenstein dictionary at `(1, τ)`: `g₃ = (8π⁶/27) E₆(τ)`. -/
theorem g₃_ofUpperHalfPlane (τ : UpperHalfPlane) :
    (ofUpperHalfPlane τ).g₃ = 8 * (π : ℂ) ^ 6 / 27 * ModularForm.E₆ τ := sorry

/-- The Eisenstein dictionary at `(1, τ)`: `η(1) = G₂(τ) = (π²/3) E₂(τ)`, with Mathlib's
`EisensteinSeries.G2` (rows `m` summed symmetrically). -/
theorem quasiPeriod_ofUpperHalfPlane_one (τ : UpperHalfPlane) :
    quasiPeriod (ofUpperHalfPlane τ) 1 = EisensteinSeries.G2 τ ∧
      EisensteinSeries.G2 τ = (π : ℂ) ^ 2 / 3 * EisensteinSeries.E2 τ := sorry

/-! ## Layer 3: the period field -/

/-- The field generated over `ℚ` by the periods and quasi-periods of `L`. -/
noncomputable def periodField (L : PeriodPair) : IntermediateField ℚ ℂ :=
  IntermediateField.adjoin ℚ ((L.lattice : Set ℂ) ∪ quasiPeriod L '' L.lattice)

/-- The period matrix: the comparison between the de Rham basis `(dx/y, x dx/y)` and the Betti
basis `(γ₁, γ₂)` of `H¹`, read through the uniformisation, rows `(ω₁, ω₂)` and `(η₁, η₂)`. -/
noncomputable def periodMatrix (L : PeriodPair) : Matrix (Fin 2) (Fin 2) ℂ :=
  !![L.ω₁, L.ω₂; quasiPeriod L L.ω₁, quasiPeriod L L.ω₂]

/-- Legendre's relation as the Tate normalisation of the determinant (`H²` is `ℚ(−1)`). -/
theorem det_periodMatrix (L : PeriodPair) (hL : 0 < (L.ω₂ / L.ω₁).im) :
    (periodMatrix L).det = -(2 * π * I) := sorry

/-- The ideal of polynomial relations over `ℚ` among the entries of the period matrix: the
ideal of the Zariski closure of the comparison point. -/
noncomputable def periodIdeal (L : PeriodPair) : Ideal (MvPolynomial (Fin 2 × Fin 2) ℚ) :=
  RingHom.ker (MvPolynomial.aeval fun ij : Fin 2 × Fin 2 ↦ periodMatrix L ij.1 ij.2).toRingHom

/-- The dimension of the Zariski closure of the period matrix is the transcendence degree of
the period field. -/
theorem ringKrullDim_periodIdeal (L : PeriodPair) :
    ringKrullDim (MvPolynomial (Fin 2 × Fin 2) ℚ ⧸ periodIdeal L) =
      (Algebra.trdeg ℚ (periodField L)).toNat := sorry

theorem periodField_eq_adjoin (L : PeriodPair) :
    periodField L = IntermediateField.adjoin ℚ
      ({L.ω₁, L.ω₂, quasiPeriod L L.ω₁, quasiPeriod L L.ω₂} : Set ℂ) := sorry

theorem periodField_congr {L L' : PeriodPair} (h : L.lattice = L'.lattice) :
    periodField L = periodField L' := sorry

theorem two_pi_I_mem_periodField (L : PeriodPair) : 2 * (π : ℂ) * I ∈ periodField L := sorry

theorem trdeg_periodField_le (L : PeriodPair) : Algebra.trdeg ℚ (periodField L) ≤ 4 := sorry

theorem trdeg_periodField_smul (L : PeriodPair) {c : ℂˣ} (hc : IsAlgebraic ℚ (c : ℂ)) :
    Algebra.trdeg ℚ (periodField (c • L)) = Algebra.trdeg ℚ (periodField L) := sorry

/-- A homothety between two lattices with algebraic invariants has an algebraic ratio. -/
theorem isAlgebraic_of_smul (L : PeriodPair) (c : ℂˣ) (h₂ : IsAlgebraic ℚ L.g₂)
    (h₃ : IsAlgebraic ℚ L.g₃) (h₂' : IsAlgebraic ℚ (c • L).g₂) (h₃' : IsAlgebraic ℚ (c • L).g₃) :
    IsAlgebraic ℚ (c : ℂ) := sorry

/-! ## Layer 4: complex multiplication -/

/-- `L` has complex multiplication: some non-real `α` satisfies `α Λ ⊆ Λ`. -/
def HasCM (L : PeriodPair) : Prop :=
  ∃ α : ℂ, α.im ≠ 0 ∧ ∀ l ∈ L.lattice, α * l ∈ L.lattice

theorem hasCM_iff (L : PeriodPair) :
    HasCM L ↔ ∃ a b c : ℤ, a ≠ 0 ∧ a * (L.ω₂ / L.ω₁) ^ 2 + b * (L.ω₂ / L.ω₁) + c = 0 := sorry

theorem HasCM.smul {L : PeriodPair} (h : HasCM L) (c : ℂˣ) : HasCM (c • L) := sorry

/-- For `α Λ ⊆ Λ` and algebraic invariants, `℘(αz)` is a rational function of `℘(z)` with
algebraic coefficients. -/
theorem exists_weierstrassP_mul_eq {L : PeriodPair} (h₂ : IsAlgebraic ℚ L.g₂)
    (h₃ : IsAlgebraic ℚ L.g₃) {α : ℂ} (hα : α ≠ 0) (hαL : ∀ l ∈ L.lattice, α * l ∈ L.lattice) :
    ∃ P Q : Polynomial ℂ, Q ≠ 0 ∧ (∀ n, IsAlgebraic ℚ (P.coeff n)) ∧
      (∀ n, IsAlgebraic ℚ (Q.coeff n)) ∧ ∀ᶠ z in Filter.codiscrete ℂ,
        L.weierstrassP (α * z) * Q.eval (L.weierstrassP z) = P.eval (L.weierstrassP z) := sorry

/-- **The CM quasi-period relation** `η(α l) = ᾱ η(l) + b l`, with `b` algebraic. -/
theorem exists_quasiPeriod_mul {L : PeriodPair} (h₂ : IsAlgebraic ℚ L.g₂)
    (h₃ : IsAlgebraic ℚ L.g₃) {α : ℂ} (hα : α.im ≠ 0) (hαL : ∀ l ∈ L.lattice, α * l ∈ L.lattice) :
    ∃ b : ℂ, IsAlgebraic ℚ b ∧ ∀ l ∈ L.lattice,
      quasiPeriod L (α * l) = (starRingEnd ℂ) α * quasiPeriod L l + b * l := sorry

theorem trdeg_periodField_le_two_of_hasCM {L : PeriodPair} (h₂ : IsAlgebraic ℚ L.g₂)
    (h₃ : IsAlgebraic ℚ L.g₃) (hL : HasCM L) : Algebra.trdeg ℚ (periodField L) ≤ 2 := sorry

/-! ## Layer 5: lower bounds — Chudnovsky's theorem from Nesterenko's -/

/-- Nesterenko's theorem as stated by DiophantineApproximationAndTranscendence §5.6
(`nesterenko`), restated so that the bridge below needs no import of that file. -/
def NesterenkoStatement : Prop :=
  ∀ τ : UpperHalfPlane, ∃ s : Finset (Fin 4), s.card = 3 ∧ AlgebraicIndependent ℚ fun i : s =>
    (![Function.Periodic.qParam 1 τ, EisensteinSeries.E2 τ, ModularForm.E₄ τ, ModularForm.E₆ τ] :
      Fin 4 → ℂ) i

/-- The bridge: Nesterenko's theorem implies Chudnovsky's — for algebraic invariants and a
nonzero period `l`, the numbers `l / π` and `η(l) / π` are algebraically independent. -/
theorem chudnovsky_of_nesterenko (hN : NesterenkoStatement) {L : PeriodPair}
    (h₂ : IsAlgebraic ℚ L.g₂) (h₃ : IsAlgebraic ℚ L.g₃) {l : ℂ} (hl : l ∈ L.lattice)
    (hl0 : l ≠ 0) :
    AlgebraicIndependent ℚ ![l / (π : ℂ), quasiPeriod L l / (π : ℂ)] := sorry

/-- **Chudnovsky's theorem** (unconditional, consuming DiophantineApproximationAndTranscendence
§5.6 `nesterenko`). -/
theorem chudnovsky {L : PeriodPair} (h₂ : IsAlgebraic ℚ L.g₂) (h₃ : IsAlgebraic ℚ L.g₃)
    {l : ℂ} (hl : l ∈ L.lattice) (hl0 : l ≠ 0) :
    AlgebraicIndependent ℚ ![l / (π : ℂ), quasiPeriod L l / (π : ℂ)] := sorry

theorem two_le_trdeg_periodField {L : PeriodPair} (h₂ : IsAlgebraic ℚ L.g₂)
    (h₃ : IsAlgebraic ℚ L.g₃) : 2 ≤ Algebra.trdeg ℚ (periodField L) := sorry

/-- The CM case of the period conjecture (Chudnovsky). -/
theorem trdeg_periodField_eq_two_of_hasCM {L : PeriodPair} (h₂ : IsAlgebraic ℚ L.g₂)
    (h₃ : IsAlgebraic ℚ L.g₃) (hL : HasCM L) : Algebra.trdeg ℚ (periodField L) = 2 := sorry

/-! ## Layer 6: the conjecture -/

/-- **The Grothendieck period conjecture for elliptic curves, transcendence-degree form.**
For a lattice with algebraic invariants and no complex multiplication, the periods and
quasi-periods generate a field of transcendence degree `4`. Never assumed. -/
def EllipticPeriodConjecture : Prop :=
  ∀ L : PeriodPair, IsAlgebraic ℚ L.g₂ → IsAlgebraic ℚ L.g₃ → ¬ HasCM L →
    Algebra.trdeg ℚ (periodField L) = 4

theorem ellipticPeriodConjecture_iff_algebraicIndependent :
    EllipticPeriodConjecture ↔ ∀ L : PeriodPair, IsAlgebraic ℚ L.g₂ → IsAlgebraic ℚ L.g₃ →
      ¬ HasCM L →
        AlgebraicIndependent ℚ ![L.ω₁, L.ω₂, quasiPeriod L L.ω₁, quasiPeriod L L.ω₂] := sorry

open Classical in
/-- Under the conjecture the transcendence degree is `2` or `4` according to CM. -/
theorem EllipticPeriodConjecture.trdeg_eq (h : EllipticPeriodConjecture) {L : PeriodPair}
    (h₂ : IsAlgebraic ℚ L.g₂) (h₃ : IsAlgebraic ℚ L.g₃) :
    Algebra.trdeg ℚ (periodField L) = if HasCM L then 2 else 4 := sorry

/-- Under the conjecture, `ω₁, ω₂, η(ω₁)` and `π` are algebraically independent (no CM). -/
theorem EllipticPeriodConjecture.algebraicIndependent_pi (h : EllipticPeriodConjecture)
    {L : PeriodPair} (h₂ : IsAlgebraic ℚ L.g₂) (h₃ : IsAlgebraic ℚ L.g₃) (hL : ¬ HasCM L) :
    AlgebraicIndependent ℚ ![L.ω₁, L.ω₂, quasiPeriod L L.ω₁, (π : ℂ)] := sorry

/-- The non-CM hypothesis cannot be dropped: a CM lattice with `g₂ = 1`, `g₃ = 0`. -/
theorem exists_hasCM_g₂_eq_one :
    ∃ L : PeriodPair, L.g₂ = 1 ∧ L.g₃ = 0 ∧ HasCM L ∧ Algebra.trdeg ℚ (periodField L) ≤ 2 :=
  sorry

theorem not_forall_trdeg_periodField_eq_four :
    ¬ ∀ L : PeriodPair, IsAlgebraic ℚ L.g₂ → IsAlgebraic ℚ L.g₃ →
      Algebra.trdeg ℚ (periodField L) = 4 := sorry

end TauCetiRoadmap.GrothendieckPeriodConjecture
