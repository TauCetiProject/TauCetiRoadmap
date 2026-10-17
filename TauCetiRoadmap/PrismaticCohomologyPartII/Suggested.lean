import Mathlib

/-!
# PrismaticCohomologyPartII: representative target signatures

The roadmap is README.md. These are suggested forms, not an exhaustive checklist.
This file records the convention checks statable against the pinned APIs.

AInfCohomology §AI.3.3 supplies q-integers; their polynomial values, including at q = 1,
are checked here using Mathlib finite sums. These signatures and
examples fix the coefficient, cochain sign and derivative-thickening conventions of
Layers 3–5; the complete Nygaard, stack and q-PD constructions are specified in README.md.

AInfCohomology §AI.0:integral.1 supplies `AInf.bkTwist` on A_inf coefficients.
README §3.9 specifies `Prismatic.BKTwist.ainfTwistIso`, identifying the general prism
twist on `(A_inf, (ξ̃))` with that line, including conormal projections, integer powers,
duals and Frobenius. Transport to `(ξ)` includes extension of scalars along φ.
README §4.7 constructs the prism points and their naturality; §4.8 applies them to
the algebraic coproduct cocones imported in §4.6.
-/

namespace TauCetiRoadmap.PrismaticCohomologyPartII

open scoped BigOperators

namespace QCrys

variable {R : Type*} [CommRing R]

-- Mathlib supplies the denominator-free geometric-series identity.
#check geom_sum_mul

/-- The distinguished generator specializes to p. -/
example (p : ℕ) : (∑ i ∈ Finset.range p, (1 : ℤ) ^ i) = p := by
  sorry

/-- The empty sum is zero, including at q=0. -/
example (q : R) : (∑ i ∈ Finset.range 0, q ^ i) = 0 := by simp

/-- A dyadic q-integer has two terms, not one. -/
example (q : R) : (∑ i ∈ Finset.range 2, q ^ i) = 1 + q := by
  simp [Finset.sum_range_succ]

/-- A nontrivial specialization distinguishes the polynomial from the constant n. -/
example : (∑ i ∈ Finset.range 3, (2 : ℤ) ^ i) = 7 := by
  norm_num [Finset.sum_range_succ]

/-- The two-endomorphism cochain Koszul convention `d⁰ m = (D₁ m, D₂ m)`,
`d¹ (a, b) = D₂ a - D₁ b`: commuting operators give `d¹ ∘ d⁰ = 0`. -/
example {M : Type*} [AddCommGroup M] [Module R M] (D₁ D₂ : M →ₗ[R] M)
    (h : D₁ ∘ₗ D₂ = D₂ ∘ₗ D₁) (m : M) : D₂ (D₁ m) - D₁ (D₂ m) = 0 := by
  rw [← LinearMap.comp_apply, ← h, LinearMap.comp_apply, sub_self]

/-- Replacing subtraction by addition fails already at the integer unit. -/
example : 3 * (2 * (1 : ℤ)) + 2 * (3 * 1) = 12 := by norm_num

/-- In the dyadic derivative thickening, the epsilon-square term changes the coefficient.
This pins the Frobenius formula without cancelling the coordinate. -/
example (t x e : R) (he : e ^ 2 = t * x * e) :
    (x + e) ^ 2 = x ^ 2 + (2 + t) * x * e := by
  calc
    (x + e) ^ 2 = x ^ 2 + 2 * x * e + e ^ 2 := by ring
    _ = x ^ 2 + (2 + t) * x * e := by rw [he]; ring

/-- Characteristic-p coefficients identify the crystalline divisor with the eta divisor
(`pr5_ht_p_eq_verschiebung_one`). -/
example (p : ℕ) [Fact p.Prime] [CharP R p] :
    (p : WittVector p R) = WittVector.verschiebung (1 : WittVector p R) := by
  simpa using (WittVector.verschiebung_frobenius (1 : WittVector p R)).symm

/-- The Witt projection formula gives the action on the eta divisor
(`pr5_ht_unit_times_v_one`). -/
example (p : ℕ) [Fact p.Prime] (u : WittVector p R) :
    u * WittVector.verschiebung (1 : WittVector p R) =
      WittVector.verschiebung (WittVector.frobenius u) := by
  simpa [mul_comm] using (WittVector.verschiebung_mul_frobenius
    (1 : WittVector p R) u).symm

/-- Frobenius kills a square-zero Teichmüller representative over any coefficient ring
(`pr5_sen_teichmuller_frobenius`). -/
example (p : ℕ) [Fact p.Prime] (ε : R) (hε : ε ^ 2 = 0) :
    WittVector.frobenius (WittVector.teichmuller p ε) = 0 := by
  sorry

/-- The infinitesimal Teichmüller unit acts trivially on every Verschiebung image
(`Prismatic.WCart.one_add_teichmuller_eps_mul_verschiebung`). -/
example (p : ℕ) [Fact p.Prime] (ε : R) (hε : ε ^ 2 = 0)
    (y : WittVector p R) :
    (1 + WittVector.teichmuller p ε) * WittVector.verschiebung y =
      WittVector.verschiebung y := by
  have hF : WittVector.frobenius (WittVector.teichmuller p ε) = 0 := by sorry
  rw [mul_comm, ← WittVector.verschiebung_mul_frobenius]
  simp [hF]

/-- Frobenius carries the eta divisor to the crystalline divisor over every ring
(`pr5_frob_eta_is_p`). -/
example (p : ℕ) [Fact p.Prime] :
    WittVector.frobenius (WittVector.verschiebung (1 : WittVector p R)) = p := by
  simpa using (WittVector.frobenius_verschiebung (1 : WittVector p R))

/-- The dyadic crystalline divided-Frobenius normalization divides 6 by 2
(`pr5_frob_filtered_index`). -/
example : (6 : ℤ) / 2 = 3 := by norm_num

/-- Coordinate scaling satisfies the denominator-free polynomial q-derivative identity
(`pr6_qdr_polynomial_nabla`). -/
example (q : R) (n : ℕ) :
    ((Polynomial.X : Polynomial R) ^ (n + 1)).comp (Polynomial.C q * Polynomial.X) -
        Polynomial.X ^ (n + 1) =
      Polynomial.C (q - 1) * Polynomial.X *
        (Polynomial.C (∑ i ∈ Finset.range (n + 1), q ^ i) * Polynomial.X ^ n) := by
  have h : Polynomial.C (q - 1) *
      Polynomial.C (∑ i ∈ Finset.range (n + 1), q ^ i) =
        (Polynomial.C q : Polynomial R) ^ (n + 1) - 1 := by
    rw [← Polynomial.C_mul, mul_comm (q - 1), geom_sum_mul]
    simp
  calc
    _ = ((Polynomial.C q) ^ (n + 1) - 1) * Polynomial.X ^ (n + 1) := by
      simp only [Polynomial.pow_comp, Polynomial.X_comp, mul_pow]
      ring
    _ = _ := by rw [← h, pow_succ]; ring

/-- At q = 1, the coefficient formula is Mathlib's polynomial derivative
(`pr6_qdr_at_q_one_derivative`). -/
example (f : Polynomial R) :
    f.sum (fun n a => Polynomial.C (a * ∑ i ∈ Finset.range n, (1 : R) ^ i) *
      Polynomial.X ^ (n - 1)) = Polynomial.derivative f := by
  simp [Polynomial.derivative_apply]

/-
The q-PD operation and its laws are README §5.1 targets: gamma_add, gamma_mul,
pAnalog_mul_gamma and delta_pAnalog_sub_one_mem need the constructed δ-ring interface.
The envelope laws in §5.7 are envelopeMap_delta, envelope_frobenius_mem,
envelopeMap_mem, envelopeLift_comp, envelopeLift_unique, envelopeLift_isDeltaHom,
envelopeLift_map_I and envelopePair_q; the q-PD envelope is a construction target.
The site and comparison laws in §§5.9–5.10 are qCrystallineMap_id,
qCrystallineMap_comp, qCrystallineEval_natural, qCrystallineEval_frobenius and
cechAlexanderZero_weaklyInitial. Their q-crystalline carriers are specified in the README.
-/

end QCrys

end TauCetiRoadmap.PrismaticCohomologyPartII
