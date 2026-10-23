import Mathlib

/-!
# Character sums over finite fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for the load-bearing milestones, so that
contributors and reviewers converge on the carrier, the pinned conventions and the shape of the
main theorems. Discharging every declaration here would finish neither a layer nor the roadmap.
`sorry` is permitted in theorem proofs in this human-owned repository: these are targets, not
implementations. Every definition has its real body.

The file states only what can be stated over Mathlib and the pinned Tau Ceti (it needs Mathlib
alone). Every other target, among them the Teichmüller character `teichmuller 𝔓` (6.1) and every
statement about it (6.2, the Jacobi digit-sum formula 6.3, the Gross–Koblitz formula 6.5), is
specified, with its definition and Checks, in `README.md` only.

The carrier is a finite field `F` (`[Field F] [Fintype F]`) with Mathlib's multiplicative
characters `MulChar F ℂ` and additive characters `AddChar F ℂ`; the Gauss and Jacobi sums are
Mathlib's `gaussSum` and `jacobiSum`, never redefined. Four conventions are visible in the
signatures. First, the canonical additive character is `stdAddChar F`, `x ↦ e(Tr_{F/𝔽_p}(x)/p)`,
and `gauss χ` abbreviates `gaussSum χ (stdAddChar F)`; every other additive character is a
`mulShift` of it (`exists_unique_mulShift_eq`). Second, `χ 0 = 0` for every character including
`χ = 1`, so `gauss 1 = -1` and `jacobiSum 1 1 = q - 2`; this is Mathlib's convention and the
LMFDB's. Third, the Kloosterman sum `kloostermanSum χ ψ a b` is a sum over the **units** of an
arbitrary finite commutative ring, so that the finite-field sums of Layer 5 and the integer-modulus
sums `S_χ(m, n; c)` of Layer 7 are one definition, the latter read on `ZMod c` with
`ZMod.stdAddChar` and `DirichletCharacter.changeLevel`. Fourth, the Hasse–Davenport relation and
the root-power identity carry their minus signs: `-g' = (-g)^n` and `S_n = -∑ ω_i^n`.

The exceptions to "every proof is `sorry`" are the bridge checks `gauss_quadChar_sq`,
`gauss_mulShift` and `gauss_one`, which apply Mathlib's `gaussSum_sq`, `gaussSum_mulShift` and
`gaussSum_one_left` with the instances and hypotheses the README promises, so that the elaborator
checks that list.
-/

namespace TauCetiRoadmap.CharacterSumsOverFiniteFields

open Complex Finset Polynomial

noncomputable section

universe u

/-! ## Layer 0: characters of a finite field -/

section Layer0

variable (F : Type u) [Field F] [Fintype F]

/-- The character group of a finite field is finite (Mathlib's `MulChar.finite`); the sums over
it below use this `Fintype` structure. -/
instance instFintypeMulChar : Fintype (MulChar F ℂ) := Fintype.ofFinite _

/-- **0.1.** The canonical additive character `ψ_F(x) = e(Tr_{F/𝔽_p}(x)/p)`
(`README.md`, Layer 0, 0.1). For `F = ZMod p` it is Mathlib's `ZMod.stdAddChar`. -/
def stdAddChar : AddChar F ℂ :=
  letI : Algebra (ZMod (ringChar F)) F := ZMod.algebra F (ringChar F)
  haveI : NeZero (ringChar F) := ⟨(CharP.char_is_prime F (ringChar F)).ne_zero⟩
  (ZMod.stdAddChar : AddChar (ZMod (ringChar F)) ℂ).compAddMonoidHom
    (Algebra.trace (ZMod (ringChar F)) F).toAddMonoidHom

/-- **0.1.** The value formula, with the trace read in `{0, …, p − 1}`. -/
theorem stdAddChar_apply (x : F) :
    letI : Algebra (ZMod (ringChar F)) F := ZMod.algebra F (ringChar F)
    stdAddChar F x =
      Complex.exp (2 * Real.pi * Complex.I *
        ((Algebra.trace (ZMod (ringChar F)) F x).val : ℂ) / (ringChar F : ℂ)) := sorry

/-- **0.1.** The canonical character is primitive (`AddChar.IsPrimitive.of_ne_one` and the
nondegeneracy of the trace). -/
theorem isPrimitive_stdAddChar : (stdAddChar F).IsPrimitive := sorry

/-- **0.1.** On the prime field the canonical character is Mathlib's standard one. -/
theorem stdAddChar_zmod (p : ℕ) [Fact p.Prime] :
    stdAddChar (ZMod p) = ZMod.stdAddChar := sorry

/-- **0.2.** Every additive character of `F` is a unique multiplicative shift of `ψ_F`. -/
theorem exists_unique_mulShift_eq (ψ : AddChar F ℂ) :
    ∃! a : F, (stdAddChar F).mulShift a = ψ := sorry

/-- **0.2.** Mathlib's abstractly chosen primitive character is a shift of `ψ_F` by a unit. -/
theorem primitiveChar_to_Complex_eq_mulShift :
    ∃ u : Fˣ, AddChar.FiniteField.primitiveChar_to_Complex F = (stdAddChar F).mulShift u := sorry

/-- **0.3.** The character group is cyclic of order `q − 1`
(`MulChar.equiv_rootsOfUnity` transported). -/
theorem card_mulChar : Nat.card (MulChar F ℂ) = Fintype.card F - 1 := sorry

/-- **0.3.** Dual orthogonality on `F`: `∑_χ χ(x) = (q − 1)[x = 1]`. -/
theorem sum_mulChar_apply [DecidableEq F] (x : F) :
    ∑ χ : MulChar F ℂ, χ x = if x = 1 then (Fintype.card F - 1 : ℂ) else 0 := sorry

/-- **0.3.** The Fourier expansion of a function on `F^×`. -/
theorem fourier_expansion_units (φ : F → ℂ) {x : F} (hx : x ≠ 0) :
    φ x = (Fintype.card F - 1 : ℂ)⁻¹ *
      ∑ χ : MulChar F ℂ, χ x * ∑ y : F, φ y * χ⁻¹ y := sorry

/-- **0.3.** A character of exact order `q − 1` exists; any such character is a *generator* of
the character group, the parameter `ω` of the finite hypergeometric sums. -/
theorem exists_generator : ∃ ω : MulChar F ℂ, orderOf ω = Fintype.card F - 1 := sorry

/-- **0.3.** Every character is a power of a generator, uniquely modulo `q − 1`. -/
theorem exists_unique_pow_eq {ω : MulChar F ℂ} (hω : orderOf ω = Fintype.card F - 1)
    (χ : MulChar F ℂ) : ∃! m : ℕ, m < Fintype.card F - 1 ∧ ω ^ m = χ := sorry

variable {F}

/-- **0.4.** The quadratic character with complex values; `1` when `ringChar F = 2`. -/
abbrev quadChar [DecidableEq F] : MulChar F ℂ :=
  (quadraticChar F).ringHomComp (Int.castRingHom ℂ)

/-- **0.4.** For odd `q` the quadratic character is the unique character of order two. -/
theorem orderOf_quadChar [DecidableEq F] (hF : ringChar F ≠ 2) : orderOf (quadChar (F := F)) = 2 :=
  sorry

/-- **0.4.** `χ(−1) = (−1)^{(q−1)/orderOf χ}` for a character of even order. -/
theorem apply_neg_one_of_even_orderOf (χ : MulChar F ℂ) (h : Even (orderOf χ)) :
    χ (-1) = (-1 : ℂ) ^ ((Fintype.card F - 1) / orderOf χ) := sorry

/-- **0.5.** The Galois action on values: a ring endomorphism of `ℂ` raising the primitive
`m`-th roots of unity to the power `t` carries `χ` to `χ ^ t` (Tau Ceti's Galois-orbit API, with
the exponent made explicit). -/
theorem ringHomComp_eq_pow (χ : MulChar F ℂ) (σ : ℂ →+* ℂ) {ζ : ℂ}
    (hζ : IsPrimitiveRoot ζ (orderOf χ)) {t : ℕ} (hσ : σ ζ = ζ ^ t) :
    χ.ringHomComp σ = χ ^ t := sorry

variable {E : Type u} [Field E] [Fintype E] [Algebra F E]

/-- **0.6.** The lift of a multiplicative character through the norm, `χ ∘ N_{E/F}`. -/
def _root_.MulChar.liftNorm (χ : MulChar F ℂ) : MulChar E ℂ :=
  MulChar.ofUnitHom (χ.toUnitHom.comp (Units.map (Algebra.norm F : E →* F)))

/-- **0.6.** The lift of an additive character through the trace, `ψ ∘ Tr_{E/F}`. -/
def _root_.AddChar.liftTrace (ψ : AddChar F ℂ) : AddChar E ℂ :=
  ψ.compAddMonoidHom (Algebra.trace F E).toAddMonoidHom

theorem liftNorm_apply (χ : MulChar F ℂ) (x : E) : χ.liftNorm x = χ (Algebra.norm F x) := sorry

theorem liftTrace_apply (ψ : AddChar F ℂ) (x : E) : ψ.liftTrace x = ψ (Algebra.trace F E x) :=
  sorry

/-- **0.6.** Lifting preserves the order (the norm is onto). -/
theorem orderOf_liftNorm (χ : MulChar F ℂ) : orderOf (χ.liftNorm (E := E)) = orderOf χ := sorry

/-- **0.6.** The canonical characters are compatible with lifting (transitivity of the trace). -/
theorem stdAddChar_liftTrace : (stdAddChar F).liftTrace = stdAddChar E := sorry

/-- **0.6.** The characters of `E^×` of order dividing `d ∣ q − 1` are exactly the lifts. -/
theorem exists_liftNorm_eq_of_orderOf_dvd {d : ℕ} (hd : d ∣ Fintype.card F - 1)
    (χ' : MulChar E ℂ) (hχ' : orderOf χ' ∣ d) : ∃ χ : MulChar F ℂ, χ.liftNorm = χ' := sorry

end Layer0

/-! ## Layer 1: Gauss sums -/

section Layer1

variable {F : Type u} [Field F] [Fintype F]

/-- **1.1.** The Gauss sum of record, `g(χ) = ∑_x χ(x) ψ_F(x)`. Mathlib's `gaussSum` against the
canonical additive character; nothing is redefined. -/
abbrev gauss (χ : MulChar F ℂ) : ℂ := gaussSum χ (stdAddChar F)

/-- **1.1.** `g(1) = −1`: a bridge check, Mathlib's `gaussSum_one_left` with the nontriviality
of `ψ_F` from its primitivity. -/
theorem gauss_one : gauss (1 : MulChar F ℂ) = -1 :=
  gaussSum_one_left (ψ := stdAddChar F) (fun h => by
    have := isPrimitive_stdAddChar F
    simp only [AddChar.IsPrimitive] at this
    exact this one_ne_zero (by rw [h, AddChar.mulShift_one]))

/-- **1.1.** The shifted sum `g_a(χ) = χ(a)⁻¹ g(χ)`: a bridge check, Mathlib's
`gaussSum_mulShift`. -/
theorem gauss_mulShift (χ : MulChar F ℂ) (a : Fˣ) :
    gaussSum χ ((stdAddChar F).mulShift a) = χ⁻¹ a * gauss χ :=
  gaussSum_mulShift_eq χ (stdAddChar F) a

/-- **1.2.** `|g(χ)| = √q` for `χ ≠ 1`. -/
theorem norm_gauss {χ : MulChar F ℂ} (hχ : χ ≠ 1) :
    ‖gauss χ‖ = Real.sqrt (Fintype.card F) := sorry

/-- **1.2.** Conjugation: `conj g(χ) = χ(−1) g(χ⁻¹)`. -/
theorem conj_gauss (χ : MulChar F ℂ) : (starRingEnd ℂ) (gauss χ) = χ (-1) * gauss χ⁻¹ := sorry

/-- **1.2.** `g(χ) g(χ⁻¹) = χ(−1) q` for `χ ≠ 1`. -/
theorem gauss_mul_gauss_inv {χ : MulChar F ℂ} (hχ : χ ≠ 1) :
    gauss χ * gauss χ⁻¹ = χ (-1) * Fintype.card F := sorry

/-- **1.3.** `g(χ)^m` lies in `ℤ[ζ_m]`, `m = orderOf χ`, for any primitive `m`-th root `ζ`. -/
theorem gauss_pow_orderOf_mem (χ : MulChar F ℂ) {ζ : ℂ} (hζ : IsPrimitiveRoot ζ (orderOf χ)) :
    gauss χ ^ orderOf χ ∈ Algebra.adjoin ℤ {ζ} := sorry

/-- **1.3.** The Galois action on the `ζ_p`-side: for `c ∈ 𝔽_p^×`, the automorphism
`ζ_p ↦ ζ_p^c` sends `g(χ)` to `χ(c)⁻¹ g(χ)`. Stated as the identity of sums it amounts to. -/
theorem gauss_frobenius_shift (χ : MulChar F ℂ) (c : (ZMod (ringChar F))ˣ) :
    ∑ x : F, χ x * stdAddChar F x ^ (c : ZMod (ringChar F)).val =
      χ ((c : ZMod (ringChar F)).val : F)⁻¹ * gauss χ := sorry

/-- **1.3.** Frobenius invariance `g(χ^p) = g(χ)`. -/
theorem gauss_pow_ringChar (χ : MulChar F ℂ) : gauss (χ ^ ringChar F) = gauss χ := sorry

/-- **1.4.** `g(η)² = η(−1) q` for odd `q`: a bridge check, Mathlib's `gaussSum_sq` with the
instances the README promises (`quadraticChar_isQuadratic`, the nontriviality of `η`, and the
primitivity of `ψ_F`). -/
theorem gauss_quadChar_sq [DecidableEq F] (hF : ringChar F ≠ 2) :
    gauss (quadChar (F := F)) ^ 2 = quadChar (F := F) (-1) * Fintype.card F :=
  gaussSum_sq
    (by
      intro h
      exact quadraticChar_ne_one hF
        ((MulChar.ringHomComp_eq_one_iff (Int.castRingHom ℂ).injective_int).mp h))
    ((quadraticChar_isQuadratic F).comp _) (isPrimitive_stdAddChar F)

/-- **1.4.** The sign of the quadratic Gauss sum over the prime field: `g(η_p) = ε_p √p`
(the classical arithmetic roadmap's 4.19 with Tau Ceti's Gauss evaluation). -/
theorem gauss_quadChar_zmod (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) :
    gauss (quadChar (F := ZMod p)) =
      (if p % 4 = 1 then (1 : ℂ) else Complex.I) * Real.sqrt p := sorry

end Layer1

/-! ## Layer 2: Jacobi and Jacobsthal sums -/

section Layer2

variable {F : Type u} [Field F] [Fintype F]

/-- **2.2.** `|J(χ, ψ)| = √q` when `χ`, `ψ`, `χψ` are nontrivial. -/
theorem norm_jacobiSum {χ ψ : MulChar F ℂ} (hχ : χ ≠ 1) (hψ : ψ ≠ 1) (hχψ : χ * ψ ≠ 1) :
    ‖jacobiSum χ ψ‖ = Real.sqrt (Fintype.card F) := sorry

/-- **2.4.** The `r`-fold Jacobi sum `J(χ₁, …, χ_r) = ∑_{x₁ + ⋯ + x_r = 1} ∏ χ_i(x_i)`. -/
def multiJacobiSum [DecidableEq F] {r : ℕ} (χ : Fin r → MulChar F ℂ) : ℂ :=
  ∑ x ∈ (univ : Finset (Fin r → F)).filter (fun x : Fin r → F => ∑ i, x i = 1), ∏ i, χ i (x i)

/-- **2.4.** The `r`-fold sum with `∑ x_i = 0`. -/
def multiJacobiSum₀ [DecidableEq F] {r : ℕ} (χ : Fin r → MulChar F ℂ) : ℂ :=
  ∑ x ∈ (univ : Finset (Fin r → F)).filter (fun x : Fin r → F => ∑ i, x i = 0), ∏ i, χ i (x i)

theorem multiJacobiSum_two [DecidableEq F] (χ ψ : MulChar F ℂ) : multiJacobiSum ![χ, ψ] = jacobiSum χ ψ := sorry

/-- **2.4.** The Gauss-sum formula for a multiple Jacobi sum. -/
theorem multiJacobiSum_eq_prod_gauss_div [DecidableEq F] {r : ℕ} (χ : Fin r → MulChar F ℂ)
    (h : ∀ i, χ i ≠ 1) (hprod : ∏ i, χ i ≠ 1) :
    multiJacobiSum χ = (∏ i, gauss (χ i)) / gauss (∏ i, χ i) := sorry

/-- **2.4.** `J₀` vanishes unless the product character is trivial. -/
theorem multiJacobiSum₀_eq_zero [DecidableEq F] {r : ℕ} (χ : Fin r → MulChar F ℂ) (hprod : ∏ i, χ i ≠ 1) :
    multiJacobiSum₀ χ = 0 := sorry

/-- **2.4.** The number of solutions of a diagonal equation `∑ aᵢ xᵢ^{dᵢ} = b`, `b ≠ 0`, deviates
from `q^{r−1}` by at most `∏ (dᵢ − 1) · q^{(r−1)/2}`. -/
theorem card_diagonal_sub_le [DecidableEq F] {r : ℕ} (hr : 0 < r) (a : Fin r → Fˣ) (d : Fin r → ℕ)
    (hd : ∀ i, d i ∣ Fintype.card F - 1) {b : F} (hb : b ≠ 0) :
    |(((univ : Finset (Fin r → F)).filter
        (fun x : Fin r → F => ∑ i, (a i : F) * x i ^ d i = b)).card : ℝ) - (Fintype.card F : ℝ) ^ (r - 1)| ≤
      (∏ i, ((d i : ℝ) - 1)) * (Fintype.card F : ℝ) ^ (((r : ℝ) - 1) / 2) := sorry

/-- **2.5.** The Jacobsthal sum `φ_n(a) = ∑_x η(x) η(x^n + a)`. -/
def jacobsthalPhi [DecidableEq F] (n : ℕ) (a : F) : ℂ :=
  ∑ x : F, quadChar (F := F) x * quadChar (F := F) (x ^ n + a)

/-- **2.5.** The Jacobsthal sum `ψ_n(a) = ∑_x η(x^n + a)`. -/
def jacobsthalPsi [DecidableEq F] (n : ℕ) (a : F) : ℂ :=
  ∑ x : F, quadChar (F := F) (x ^ n + a)

/-- **2.5.** `ψ_2(a) = −1` for `a ≠ 0` and odd `q`. -/
theorem jacobsthalPsi_two [DecidableEq F] (hF : ringChar F ≠ 2) {a : F} (ha : a ≠ 0) :
    jacobsthalPsi 2 a = -1 := sorry

/-- **2.5.** The Jacobi-sum expansion of `ψ_n(a)`, over the nontrivial characters of order
dividing `n`. -/
theorem jacobsthalPsi_eq_sum_jacobiSum [DecidableEq F] (hF : ringChar F ≠ 2) (n : ℕ) {a : F}
    (ha : a ≠ 0) :
    jacobsthalPsi n a = quadChar (F := F) a *
      ∑ χ ∈ (univ : Finset (MulChar F ℂ)).filter (fun χ => χ ^ n = 1 ∧ χ ≠ 1),
        χ (-a) * jacobiSum χ (quadChar (F := F)) := sorry

/-- **2.5.** The Jacobi-sum expansion of `φ_n(a)`, over the characters `χ` with `χ^n = η`. -/
theorem jacobsthalPhi_eq_sum_jacobiSum [DecidableEq F] (hF : ringChar F ≠ 2) (n : ℕ) {a : F}
    (ha : a ≠ 0) :
    jacobsthalPhi n a = quadChar (F := F) a *
      ∑ χ ∈ (univ : Finset (MulChar F ℂ)).filter (fun χ => χ ^ n = quadChar (F := F)),
        χ (-a) * jacobiSum χ (quadChar (F := F)) := sorry

/-- **2.5.** Jacobsthal's theorem: for `p ≡ 1 (mod 4)` and `p = a² + b²` with `a ≡ 1 (mod 4)`,
`φ_2(1) = −2a`. -/
theorem jacobsthalPhi_two_one (p : ℕ) [Fact p.Prime] (hp : p % 4 = 1) {a b : ℤ}
    (hab : a ^ 2 + b ^ 2 = p) (ha : a % 4 = 1) :
    jacobsthalPhi (F := ZMod p) 2 1 = -2 * a := sorry

end Layer2

/-! ## Layer 3: the polynomial `L`-series and Hasse–Davenport -/

section Layer3

variable {F : Type u} [Field F] [Fintype F]

/-- The monic polynomial `X^d + ∑_{i<d} c_i X^i` with the given lower coefficients. -/
def monicOfCoeffs {d : ℕ} (c : Fin d → F) : F[X] :=
  X ^ d + ∑ i : Fin d, C (c i) * X ^ (i : ℕ)

/-- **3.1.** A complex-valued function on `F[X]` that is multiplicative on monic polynomials. -/
def IsMonicMultiplicative (lam : F[X] → ℂ) : Prop :=
  lam 1 = 1 ∧ ∀ g h : F[X], g.Monic → h.Monic → lam (g * h) = lam g * lam h

/-- **3.1.** The `L`-series `L(λ, T) = ∑_{g monic} λ(g) T^{deg g}`, coefficientwise the sums
over the `q^d` monic polynomials of degree `d`. -/
def lSeries (lam : F[X] → ℂ) : PowerSeries ℂ :=
  PowerSeries.mk fun d => ∑ c : Fin d → F, lam (monicOfCoeffs c)

/-- **3.1.** The polynomial criterion: vanishing coefficient sums from degree `d₀` on make the
`L`-series a polynomial of degree `< d₀`. -/
theorem lSeries_eq_polynomial {lam : F[X] → ℂ} {d₀ : ℕ}
    (h : ∀ d, d₀ ≤ d → ∑ c : Fin d → F, lam (monicOfCoeffs c) = 0) :
    ∃ P : ℂ[X], P.natDegree < d₀ ∧ lSeries lam = P.toPowerSeries := sorry

variable (E : Type u) [Field E] [Fintype E] [Algebra F E]

/-- **3.2.** The lifted sum `S_n(λ) = ∑_{α ∈ E} λ(minpoly α)^{n / deg α}`, `n = [E : F]`. -/
def extensionSum (lam : F[X] → ℂ) : ℂ :=
  ∑ α : E, lam (minpoly F α) ^ (Module.finrank F E / (minpoly F α).natDegree)

/-- **3.2.** The root-power identity: when `L(λ, T) = ∏ (1 − ωᵢ T)`, the lifted sum of degree `n`
is `−∑ ωᵢ^n`. This is the engine behind 3.3, 4.7, 4.8 and 5.4. -/
theorem extensionSum_eq_neg_sum_pow {lam : F[X] → ℂ} (hlam : IsMonicMultiplicative lam)
    {k : ℕ} (ω : Fin k → ℂ)
    (hL : lSeries lam = ∏ i, (1 - PowerSeries.C (ω i) * PowerSeries.X)) :
    extensionSum E lam = -∑ i, ω i ^ Module.finrank F E := sorry

/-- **3.3.** The Hasse–Davenport lifting relation, with its signs:
`−g(χ ∘ N, ψ ∘ Tr) = (−g(χ, ψ))^{[E:F]}`. It fails for `χ = 1 = ψ` (`g = q − 1`, `g' = q^n − 1`). -/
theorem hasseDavenport_lift (χ : MulChar F ℂ) (ψ : AddChar F ℂ) (h : χ ≠ 1 ∨ ψ ≠ 1) :
    -gaussSum (χ.liftNorm (E := E)) (ψ.liftTrace (E := E)) =
      (-gaussSum χ ψ) ^ Module.finrank F E := sorry

/-- **3.3.** The sign of the quadratic Gauss sum over `𝔽_q`, `q = p^f`:
`g(η) = (−1)^{f−1} (ε_p √p)^f`. -/
theorem gauss_quadChar_eq [DecidableEq F] (hF : ringChar F ≠ 2) {p f : ℕ} [Fact p.Prime]
    (hq : Fintype.card F = p ^ f) :
    gauss (quadChar (F := F)) =
      (-1) ^ (f - 1) * ((if p % 4 = 1 then (1 : ℂ) else Complex.I) * Real.sqrt p) ^ f := sorry

/-- **3.4.** The Hasse–Davenport product formula, for `λ` of exact order `m` and every `χ`:
`∏_{j<m} g(χ λ^j) = χ(m)⁻ᵐ g(χ^m) ∏_{1 ≤ j < m} g(λ^j)`. -/
theorem hasseDavenport_product (χ lam : MulChar F ℂ) {m : ℕ} (hm : orderOf lam = m) (hm0 : 0 < m) :
    ∏ j ∈ range m, gauss (χ * lam ^ j) =
      (χ (m : F))⁻¹ ^ m * gauss (χ ^ m) * ∏ j ∈ Ico 1 m, gauss (lam ^ j) := sorry

/-- **3.4.** The duplication formula, `m = 2`. -/
theorem gauss_sq_eq [DecidableEq F] (hF : ringChar F ≠ 2) (χ : MulChar F ℂ) :
    gauss (χ ^ 2) = χ 4 * gauss χ * gauss (χ * quadChar (F := F)) / gauss (quadChar (F := F)) :=
  sorry

/-- **3.5.** Jacobi sums lift with the same signs as Gauss sums. -/
theorem jacobiSum_lift {χ ψ : MulChar F ℂ} (hχ : χ ≠ 1) (hψ : ψ ≠ 1) :
    -jacobiSum (χ.liftNorm (E := E)) (ψ.liftNorm (E := E)) =
      (-jacobiSum χ ψ) ^ Module.finrank F E := sorry

end Layer3

/-! ## Layer 4: Stepanov's method and Weil's bounds for polynomial sums -/

section Layer4

open scoped Classical

variable {F : Type u} [Field F] [Fintype F]

/-- **4.2.** Stepanov's bound for `y^d = f(x)`, uniform over all finite extensions: constants
`C`, `Q₀` depending only on `d` and `deg f`. The hypothesis says `f` is not a constant times a
`d`-th power over the algebraic closure. -/
theorem stepanov_kummer {d : ℕ} (hd : 2 ≤ d) (f : F[X]) (hf0 : f ≠ 0)
    (hf : ¬ ∃ (c : AlgebraicClosure F) (e : ℕ) (g : (AlgebraicClosure F)[X]),
      1 < e ∧ e ∣ d ∧ f.map (algebraMap F (AlgebraicClosure F)) = C c * g ^ e) :
    ∃ C₀ Q₀ : ℝ, ∀ (E : Type u) [Field E] [Fintype E] [Algebra F E],
      Q₀ ≤ Fintype.card E →
      |(((univ : Finset (E × E)).filter
          (fun z : E × E => z.2 ^ d = (f.map (algebraMap F E)).eval z.1)).card : ℝ) -
          Fintype.card E| ≤
        C₀ * Real.sqrt (Fintype.card E) := sorry

/-- **4.3 (i).** Stepanov's bound for `y^q − y = f(x)`, `p ∤ deg f`, uniform over extensions. -/
theorem stepanov_artinSchreier (f : F[X]) (hf : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) :
    ∃ C₀ Q₀ : ℝ, ∀ (E : Type u) [Field E] [Fintype E] [Algebra F E],
      Q₀ ≤ Fintype.card E →
      |(((univ : Finset (E × E)).filter
          (fun z : E × E => z.2 ^ Fintype.card F - z.2 =
            (f.map (algebraMap F E)).eval z.1)).card : ℝ) -
          Fintype.card E| ≤ C₀ * Real.sqrt (Fintype.card E) := sorry

/-- **4.3 (ii).** Stepanov's bound for the Kloosterman curve `y^q − y = a x^d + b x^{−d}` on
`x ≠ 0`, `p ∤ d`, uniform over extensions. -/
theorem stepanov_kloostermanCurve (a b : Fˣ) {d : ℕ} (hd : 0 < d) (hp : ¬ ringChar F ∣ d) :
    ∃ C₀ Q₀ : ℝ, ∀ (E : Type u) [Field E] [Fintype E] [Algebra F E],
      Q₀ ≤ Fintype.card E →
      |(((univ : Finset (Eˣ × E)).filter
          (fun z : Eˣ × E => z.2 ^ Fintype.card F - z.2 =
            algebraMap F E a * (z.1 : E) ^ d + algebraMap F E b * ((z.1⁻¹ : Eˣ) : E) ^ d)).card :
            ℝ) - (Fintype.card E - 1)| ≤ C₀ * Real.sqrt (Fintype.card E) := sorry

/-- **4.4.** The power-sum lemma: a uniform bound `|∑ ωᵢ^n| ≤ C ρ^n` forces `|ωᵢ| ≤ ρ`. -/
theorem norm_le_of_sum_pow_le {k : ℕ} (ω : Fin k → ℂ) {ρ C₀ : ℝ} (hρ : 0 < ρ) (n₀ : ℕ)
    (h : ∀ n, n₀ ≤ n → ‖∑ i, ω i ^ n‖ ≤ C₀ * ρ ^ n) : ∀ i, ‖ω i‖ ≤ ρ := sorry

/-- **4.5.** The multiplicative function `λ_f(g) = χ(N_{F[X]/(g)}(f))`, the character of the
resultant `∏_{g(α)=0} f(α)` for monic `g`. -/
def mulCharResultant (χ : MulChar F ℂ) (f : F[X]) (g : F[X]) : ℂ :=
  χ (Algebra.norm F (AdjoinRoot.mk g f))

theorem mulCharResultant_X_sub_C (χ : MulChar F ℂ) (f : F[X]) (c : F) :
    mulCharResultant χ f (X - C c) = χ (f.eval c) := sorry

theorem isMonicMultiplicative_mulCharResultant (χ : MulChar F ℂ) (f : F[X]) :
    IsMonicMultiplicative (mulCharResultant χ f) := sorry

/-- **4.5.** The `L`-polynomial of a multiplicative character sum has degree at most `m − 1`,
`m` the number of distinct roots of `f`, when `f` is not a constant times a `d`-th power. -/
theorem lSeries_mulCharResultant {χ : MulChar F ℂ} (hχ : χ ≠ 1) (f : F[X]) (hf0 : f ≠ 0)
    (hf : ¬ ∃ (c : F) (h : F[X]), f = C c * h ^ orderOf χ) :
    ∃ P : ℂ[X], P.natDegree + 1 ≤
        (f.map (algebraMap F (AlgebraicClosure F))).roots.toFinset.card ∧
      lSeries (mulCharResultant χ f) = P.toPowerSeries := sorry

/-- **4.6.** The multiplicative function `μ_f(g) = ψ(∑_{g(α)=0} f(α))`. -/
def addCharTrace (ψ : AddChar F ℂ) (f : F[X]) (g : F[X]) : ℂ :=
  ψ (Algebra.trace F (AdjoinRoot g) (AdjoinRoot.mk g f))

/-- **4.6.** The `L`-polynomial of an additive character sum has degree at most `deg f − 1`. -/
theorem lSeries_addCharTrace {ψ : AddChar F ℂ} (hψ : ψ ≠ 1) (f : F[X]) (hf : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) :
    ∃ P : ℂ[X], P.natDegree + 1 ≤ f.natDegree ∧ lSeries (addCharTrace ψ f) = P.toPowerSeries :=
  sorry

/-- **4.7.** Weil's bound for multiplicative character sums:
`|∑_x χ(f(x))| ≤ (m − 1) √q`, `m` the number of distinct roots of `f` in `F̄`. -/
theorem weil_mulChar_sum_bound {χ : MulChar F ℂ} (hχ : χ ≠ 1) (f : F[X]) (hf0 : f ≠ 0)
    (hf : ¬ ∃ (c : F) (h : F[X]), f = C c * h ^ orderOf χ) :
    ‖∑ x : F, χ (f.eval x)‖ ≤
      (((f.map (algebraMap F (AlgebraicClosure F))).roots.toFinset.card : ℝ) - 1) *
        Real.sqrt (Fintype.card F) := sorry

/-- **4.8.** Weil's bound for additive character sums: `|∑_x ψ(f(x))| ≤ (deg f − 1) √q`
for `p ∤ deg f`. -/
theorem weil_addChar_sum_bound {ψ : AddChar F ℂ} (hψ : ψ ≠ 1) (f : F[X]) (hf : 0 < f.natDegree)
    (hp : ¬ ringChar F ∣ f.natDegree) :
    ‖∑ x : F, ψ (f.eval x)‖ ≤ ((f.natDegree : ℝ) - 1) * Real.sqrt (Fintype.card F) := sorry

/-- **4.9.** The hyperelliptic point count: `|#{y² = f(x)} − q| ≤ (m − 1) √q` for squarefree `f`
of degree `m` and odd `q`. -/
theorem card_hyperelliptic_sub_le [DecidableEq F] (hF : ringChar F ≠ 2) (f : F[X])
    (hf : Squarefree f) (hf0 : 0 < f.natDegree) :
    |(((univ : Finset (F × F)).filter (fun z : F × F => z.2 ^ 2 = f.eval z.1)).card : ℝ) -
        Fintype.card F| ≤ ((f.natDegree : ℝ) - 1) * Real.sqrt (Fintype.card F) := sorry

end Layer4

/-! ## Layer 5: Kloosterman and Salié sums -/

section Layer5

open scoped Classical

variable {R : Type*} [CommRing R] [Fintype R]

/-- **5.1.** The Kloosterman sum `K(χ, ψ; a, b) = ∑_{x ∈ Rˣ} χ(x) ψ(a x + b x⁻¹)` on a finite
commutative ring. On `ZMod c` with `ZMod.stdAddChar` it is `S_χ(a, b; c)`; on a finite field with
`stdAddChar F` it is the Kloosterman sum of Layer 5. On a field with `χ = 1` and `a, b` units it is
the congruence spectral gap roadmap's `hyperKloosterman F 2 ψ (a b)` (§4.2a), an unmerged roadmap
target, so the identification is stated in `README.md` 5.1 only. -/
def kloostermanSum (χ : MulChar R ℂ) (ψ : AddChar R ℂ) (a b : R) : ℂ :=
  ∑ x : Rˣ, χ x * ψ (a * x + b * ((x⁻¹ : Rˣ) : R))

/-- **5.1.** `K(χ; a, 0)` is the shifted Gauss sum `g_a(χ)`. -/
theorem kloostermanSum_zero_right (χ : MulChar R ℂ) (ψ : AddChar R ℂ) (a : R) :
    kloostermanSum χ ψ a 0 = gaussSum χ (ψ.mulShift a) := sorry

/-- **5.1.** Symmetry under `x ↦ x⁻¹`. -/
theorem kloostermanSum_comm (χ : MulChar R ℂ) (ψ : AddChar R ℂ) (a b : R) :
    kloostermanSum χ ψ a b = kloostermanSum χ⁻¹ ψ b a := sorry

/-- **5.1.** Scaling by a unit. -/
theorem kloostermanSum_mul_unit (χ : MulChar R ℂ) (ψ : AddChar R ℂ) (a b : R) (u : Rˣ) :
    kloostermanSum χ ψ (u * a) (((u⁻¹ : Rˣ) : R) * b) = (χ u)⁻¹ * kloostermanSum χ ψ a b := sorry

/-- **5.1.** Conjugation: `conj K(χ, ψ; a, b) = K(χ⁻¹, ψ; −a, −b)`; so `K(1, ψ; a, b)` is real. -/
theorem conj_kloostermanSum (χ : MulChar R ℂ) (ψ : AddChar R ℂ) (a b : R) :
    (starRingEnd ℂ) (kloostermanSum χ ψ a b) = kloostermanSum χ⁻¹ ψ (-a) (-b) := sorry

variable {F : Type u} [Field F] [Fintype F]

/-- **5.2.** The Gauss-sum expansion
`K(χ; a, b) = (q − 1)⁻¹ ∑_θ θ(b)⁻¹ (χθ)(a)⁻¹ g(θ) g(χθ)` for `a b ≠ 0` (at `b = 0` the right side
is `0` and the left is `χ(a)⁻¹ g(χ)`). -/
theorem kloostermanSum_eq_sum_gauss (χ : MulChar F ℂ) (a b : Fˣ) :
    kloostermanSum χ (stdAddChar F) a b = (Fintype.card F - 1 : ℂ)⁻¹ *
      ∑ θ : MulChar F ℂ, (θ b)⁻¹ * ((χ * θ) a)⁻¹ * gauss θ * gauss (χ * θ) := sorry

/-- **5.3.** Salié's evaluation: `K(η; a, b) = η(b) g(η) ∑_{y² = 4ab} ψ_F(y)`. -/
theorem kloostermanSum_quadChar_eq [DecidableEq F] (hF : ringChar F ≠ 2) (a b : Fˣ) :
    kloostermanSum (quadChar (F := F)) (stdAddChar F) a b =
      quadChar (F := F) b * gauss (quadChar (F := F)) *
        ∑ y ∈ (univ : Finset F).filter (fun y : F => y ^ 2 = 4 * a * b), stdAddChar F y := sorry

/-- **5.4.** The Kloosterman `L`-polynomial `1 + K T + χ(−b/a) q T²` and the lifting relation:
`K_E = −(ω₁^n + ω₂^n)` for every extension of degree `n`, with `|ω₁| = |ω₂| = √q` (5.5). -/
theorem kloostermanSum_lift (χ : MulChar F ℂ) (a b : Fˣ) :
    ∃ ω₁ ω₂ : ℂ, ω₁ + ω₂ = -kloostermanSum χ (stdAddChar F) a b ∧
      ω₁ * ω₂ = χ (-(b : F) * (a⁻¹ : Fˣ)) * Fintype.card F ∧
      ‖ω₁‖ = Real.sqrt (Fintype.card F) ∧ ‖ω₂‖ = Real.sqrt (Fintype.card F) ∧
      ∀ (E : Type u) [Field E] [Fintype E] [Algebra F E],
        kloostermanSum (χ.liftNorm (E := E)) ((stdAddChar F).liftTrace (E := E))
            (algebraMap F E a) (algebraMap F E b) =
          -(ω₁ ^ Module.finrank F E + ω₂ ^ Module.finrank F E) := sorry

/-- **5.5.** Weil's bound `|K(χ; a, b)| ≤ 2√q` for `a b ≠ 0`. At `χ = 1` it is the congruence
spectral gap roadmap's `hyperKloosterman_bound` at rank `2` (`README.md` 5.5). -/
theorem norm_kloostermanSum_le (χ : MulChar F ℂ) (a b : Fˣ) :
    ‖kloostermanSum χ (stdAddChar F) a b‖ ≤ 2 * Real.sqrt (Fintype.card F) := sorry

/-- **5.5.** The Kloosterman angle `θ_F(a, b) ∈ [0, π]`, defined by
`K(1; a, b) = −2√q cos θ`. -/
def kloostermanAngle (a b : Fˣ) : ℝ :=
  Real.arccos (-(kloostermanSum (1 : MulChar F ℂ) (stdAddChar F) a b).re /
    (2 * Real.sqrt (Fintype.card F)))

theorem kloostermanSum_eq_cos_kloostermanAngle (a b : Fˣ) :
    kloostermanSum (1 : MulChar F ℂ) (stdAddChar F) a b =
      -2 * Real.sqrt (Fintype.card F) * Real.cos (kloostermanAngle a b) := sorry

/-- **5.6.** The degenerate parameter `a = 0 ≠ b`: `K(χ; 0, b) = χ(b) g(χ⁻¹)` (at `b = 0` the sum
is `(q − 1)[χ = 1]`). -/
theorem kloostermanSum_zero_left (χ : MulChar F ℂ) (b : Fˣ) :
    kloostermanSum χ (stdAddChar F) 0 b = χ b * gauss χ⁻¹ := sorry

end Layer5

/-! ## Layer 6: Morita's `p`-adic Gamma function

The Teichmüller character 6.1, the Stickelberger corollaries 6.2–6.3 and the Gross–Koblitz
formula 6.5 are specified in `README.md` only. -/

section Layer6Padic

open scoped Classical

variable (p : ℕ) [Fact p.Prime]

/-- **6.4.** Morita's `p`-adic Gamma function: `Γ_p(x)` is the limit of
`Γ_p(n) = (−1)^n ∏_{0 < j < n, p ∤ j} j` as the natural number `n` tends to `x` `p`-adically. The
limit exists because of the congruence `Γ_p(n + p^k) ≡ Γ_p(n) (mod p^k)`, so this is the unique
continuous extension of the values on `ℕ` (`padicGamma_natCast`, `continuous_padicGamma`). -/
def padicGamma (x : ℤ_[p]) : ℤ_[p] :=
  Filter.limUnder (Filter.comap ((↑) : ℕ → ℤ_[p]) (nhds x)) fun n =>
    (-1) ^ n * ∏ j ∈ (Finset.range n).filter (fun j => 0 < j ∧ ¬ p ∣ j), (j : ℤ_[p])

/-- **6.4.** The values on `ℕ`; `Γ_p(0) = 1`, `Γ_p(1) = −1`, `Γ_p(2) = 1`. -/
theorem padicGamma_natCast (n : ℕ) :
    padicGamma p n =
      (-1) ^ n * ∏ j ∈ (Finset.range n).filter (fun j => 0 < j ∧ ¬ p ∣ j), (j : ℤ_[p]) := sorry

/-- **6.4.** Continuity (the Lipschitz bound `‖Γ_p x − Γ_p y‖ ≤ ‖x − y‖` for odd `p`). -/
theorem continuous_padicGamma : Continuous (padicGamma p) := sorry

theorem norm_padicGamma_sub_le (hp : p ≠ 2) (x y : ℤ_[p]) :
    ‖padicGamma p x - padicGamma p y‖ ≤ ‖x - y‖ := sorry

/-- **6.4.** `Γ_p` takes unit values. -/
theorem isUnit_padicGamma (x : ℤ_[p]) : IsUnit (padicGamma p x) := sorry

/-- **6.4.** The functional equation: `Γ_p(x + 1) = −x Γ_p(x)` for a unit `x`, `−Γ_p(x)` otherwise. -/
theorem padicGamma_add_one (x : ℤ_[p]) :
    padicGamma p (x + 1) = (if IsUnit x then -x else -1) * padicGamma p x := sorry

/-- **6.4.** The reflection formula for odd `p`: `Γ_p(x) Γ_p(1 − x) = (−1)^{x₀}`, `x₀ ∈ {1, …, p}`
the residue of `x` modulo `p`. -/
theorem padicGamma_mul_padicGamma_one_sub (hp : p ≠ 2) (x : ℤ_[p]) :
    padicGamma p x * padicGamma p (1 - x) =
      (-1) ^ (if (PadicInt.toZMod x).val = 0 then p else (PadicInt.toZMod x).val) := sorry

end Layer6Padic

/-! ## Layer 7: sums modulo an integer -/

section Layer7

/-- **7.1.** The imprimitive formula `τ(χ) = μ(N/f) χ^∗(N/f) τ(χ^∗)`, `f` the conductor. -/
theorem gaussSum_eq_moebius_mul {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N) :
    haveI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
    gaussSum χ ZMod.stdAddChar =
      (ArithmeticFunction.moebius (N / χ.conductor) : ℂ) *
        χ.primitiveCharacter (N / χ.conductor : ℕ) *
          gaussSum χ.primitiveCharacter ZMod.stdAddChar := sorry

variable {c₁ c₂ : ℕ} [NeZero c₁] [NeZero c₂] (h : c₁.Coprime c₂)

/-- **0.7.** The first Chinese-remainder factor of a Dirichlet character modulo `c₁ c₂`. -/
def crtFactorLeft (χ : DirichletCharacter ℂ (c₁ * c₂)) : DirichletCharacter ℂ c₁ :=
  MulChar.ofUnitHom (χ.toUnitHom.comp (Units.map
    ((ZMod.chineseRemainder h).symm.toRingHom.toMonoidHom.comp (MonoidHom.inl _ _))))

/-- **0.7.** The second Chinese-remainder factor. -/
def crtFactorRight (χ : DirichletCharacter ℂ (c₁ * c₂)) : DirichletCharacter ℂ c₂ :=
  MulChar.ofUnitHom (χ.toUnitHom.comp (Units.map
    ((ZMod.chineseRemainder h).symm.toRingHom.toMonoidHom.comp (MonoidHom.inr _ _))))

/-- **0.7.** `χ(x) = χ₁(x₁) χ₂(x₂)` across the Chinese remainder isomorphism. -/
theorem crtFactor_mul (χ : DirichletCharacter ℂ (c₁ * c₂)) (x : ZMod (c₁ * c₂)) :
    χ x = crtFactorLeft h χ (ZMod.chineseRemainder h x).1 *
      crtFactorRight h χ (ZMod.chineseRemainder h x).2 := sorry

/-- **7.1.** The Chinese-remainder formula `τ(χ) = χ₁(c₂) χ₂(c₁) τ(χ₁) τ(χ₂)`. -/
theorem gaussSum_mul_of_coprime (χ : DirichletCharacter ℂ (c₁ * c₂)) :
    gaussSum χ ZMod.stdAddChar =
      crtFactorLeft h χ (c₂ : ZMod c₁) * crtFactorRight h χ (c₁ : ZMod c₂) *
        gaussSum (crtFactorLeft h χ) ZMod.stdAddChar *
          gaussSum (crtFactorRight h χ) ZMod.stdAddChar := sorry

/-- **7.2.** `J(χ, ψ) = τ(χ) τ(ψ) / τ(χψ)` whenever `χψ` is primitive. -/
theorem jacobiSum_eq_gaussSum_div_of_isPrimitive {N : ℕ} [NeZero N]
    (χ ψ : DirichletCharacter ℂ N) (hχψ : (χ * ψ).IsPrimitive) :
    jacobiSum χ ψ = gaussSum χ ZMod.stdAddChar * gaussSum ψ ZMod.stdAddChar /
      gaussSum (χ * ψ) ZMod.stdAddChar := sorry

/-- **7.4.** Twisted multiplicativity of `S_χ(m, n; c)`. The inverses `c̄₂` and `c̄₁` are read
in `ZMod c₁` and `ZMod c₂`. -/
theorem kloostermanSum_zmod_mul (χ : DirichletCharacter ℂ (c₁ * c₂)) (m n : ℤ) :
    kloostermanSum χ ZMod.stdAddChar m n =
      kloostermanSum (crtFactorLeft h χ) ZMod.stdAddChar
          (m * ((ZMod.unitOfCoprime c₂ h.symm)⁻¹ : (ZMod c₁)ˣ))
          (n * ((ZMod.unitOfCoprime c₂ h.symm)⁻¹ : (ZMod c₁)ˣ)) *
        kloostermanSum (crtFactorRight h χ) ZMod.stdAddChar
          (m * ((ZMod.unitOfCoprime c₁ h)⁻¹ : (ZMod c₂)ˣ))
          (n * ((ZMod.unitOfCoprime c₁ h)⁻¹ : (ZMod c₂)ˣ)) := sorry

/-- **7.5.** Salié's prime-power evaluation of `S(m, n; p^k)`, `p` odd, `k ≥ 2`, `p ∤ mn`,
`mn ≡ ℓ² (mod p^k)`: `2 (ℓ/p)^k p^{k/2} Re(ε_{p^k} e(2ℓ/p^k))`. -/
theorem kloostermanSum_zmod_primePow (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {k : ℕ} (hk : 2 ≤ k)
    (m n ℓ : ℤ) (hmn : ¬ (p : ℤ) ∣ m * n) (hℓ : ((ℓ ^ 2 : ℤ) : ZMod (p ^ k)) = m * n) :
    kloostermanSum (1 : DirichletCharacter ℂ (p ^ k)) ZMod.stdAddChar m n =
      2 * (legendreSym p ℓ : ℂ) ^ k * Real.sqrt ((p : ℝ) ^ k) *
        (((if p ^ k % 4 = 1 then (1 : ℂ) else Complex.I) *
          ZMod.stdAddChar ((2 * ℓ : ℤ) : ZMod (p ^ k))).re : ℝ) := sorry

/-- **7.5.** The non-square branch. -/
theorem kloostermanSum_zmod_primePow_eq_zero (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) {k : ℕ}
    (hk : 2 ≤ k) (m n : ℤ) (hmn : ¬ IsSquare ((m * n : ℤ) : ZMod p)) :
    kloostermanSum (1 : DirichletCharacter ℂ (p ^ k)) ZMod.stdAddChar m n = 0 := sorry

/-- **7.5.** The twisted bound at a prime square: `|S_χ(m, n; p²)| ≤ 2 (m, n, p²)^{1/2} p` for
every Dirichlet character `χ` modulo `p²`. -/
theorem norm_kloostermanSum_zmod_primeSq_le (p : ℕ) [Fact p.Prime]
    (χ : DirichletCharacter ℂ (p ^ 2)) (m n : ℤ) :
    ‖kloostermanSum χ ZMod.stdAddChar m n‖ ≤
      2 * Real.sqrt (Nat.gcd (Int.gcd m n) (p ^ 2)) * p := sorry

/-- **7.6.** Weil's bound for a general modulus, trivial character:
`|S(m, n; c)| ≤ τ(c) (m, n, c)^{1/2} c^{1/2}` for every `c`. -/
theorem norm_kloostermanSum_zmod_le {c : ℕ} [NeZero c] (m n : ℤ) :
    ‖kloostermanSum (1 : DirichletCharacter ℂ c) ZMod.stdAddChar m n‖ ≤
      (ArithmeticFunction.sigma 0 c : ℝ) * Real.sqrt (Nat.gcd (Int.gcd m n) c) * Real.sqrt c :=
  sorry

/-- **7.6.** The twisted form with the conductor factor (Knightly–Li, Theorem 9.3):
`|S_χ(m, n; c)| ≤ τ(c) (m, n, c)^{1/2} 𝔠_χ^{1/2} c^{1/2}` for every Dirichlet character `χ` modulo
`c` (a character of a smaller modulus `N ∣ c` enters through `changeLevel`). -/
theorem norm_kloostermanSum_zmod_le_of_char {c : ℕ} [NeZero c] (χ : DirichletCharacter ℂ c)
    (m n : ℤ) :
    ‖kloostermanSum χ ZMod.stdAddChar m n‖ ≤
      (ArithmeticFunction.sigma 0 c : ℝ) * Real.sqrt (Nat.gcd (Int.gcd m n) c) *
        Real.sqrt χ.conductor * Real.sqrt c := sorry

/-- **7.6.** The twisted form without the conductor factor, for cube-free `c`. The hypothesis is
sharp: `|S_χ(1, 15; 17³)| = 289 > τ(17³) · 17^{3/2}` for a primitive `χ` of order `4624`. -/
theorem norm_kloostermanSum_zmod_le_of_cubefree {c : ℕ} [NeZero c]
    (hc : ∀ p : ℕ, p.Prime → ¬ p ^ 3 ∣ c) (χ : DirichletCharacter ℂ c) (m n : ℤ) :
    ‖kloostermanSum χ ZMod.stdAddChar m n‖ ≤
      (ArithmeticFunction.sigma 0 c : ℝ) * Real.sqrt (Nat.gcd (Int.gcd m n) c) * Real.sqrt c :=
  sorry

end Layer7

end

end TauCetiRoadmap.CharacterSumsOverFiniteFields
