import Mathlib
import TauCeti.FieldTheory.FunctionField.RiemannRoch.ClassNumber

/-!
# Curves over finite fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for the load-bearing milestones — the
Weil-polynomial vocabulary that the sibling `AbelianVarietiesOverFiniteFields` consumes, and the
corollaries of the Riemann hypothesis that need no consumed object — so that contributors and
reviewers converge on the carrier and the conventions. Discharging every declaration here would
finish neither a layer nor the roadmap. `sorry` is permitted in this human-owned repository: these
are targets, not implementations.

The carrier of the function-field layers is Tau Ceti's function-field library: `k` and `F` with
`[Finite k]`, `hF : TauCeti.IsFunctionField k F` and `hex : IsIntegrallyClosedIn k F` passed
explicitly, `TauCeti.genus k F` and the class number `TauCeti.Divisor.classNumber hF` — nothing of
that theory is restated here. The point counts `N_r`, the zeta function and the `L`-polynomial `L_F`
are FunctionFieldArithmetic's (`README.md`, *Consumed, not redefined*) and are not restated here
either, so every milestone whose statement names one of them is specified in `README.md` alone. The
carrier of the Weil-polynomial layer is `ℤ[X]` with a natural number `q`.

Conventions visible in the signatures (`README.md`, *Pinned conventions*): `q := Nat.card k`;
`IsWeilPolynomial q P` is the LMFDB's `nf.weil_polynomial` and `IsWeilSymmetric q g P` the
functional-equation shape `q^j a_j = q^g a_{2g−j}` (conventions 6–7); the real Weil polynomial is
built from Mathlib's Dickson polynomials with parameter `q` (convention 8); the `p`-rank and the
Newton strata have elementary coefficient definitions (convention 9); Frobenius angles lie in
`[0, 1]` and the angle rank is an exact `ℚ`-dimension (convention 10); Weil powers and power sums
are characteristic polynomials and traces on `AdjoinRoot P` (convention 11).

The exceptions to "every proof is `sorry`" are the bridge checks: the finiteness of Weil
`q`-polynomials of a given degree (from Mathlib's Mahler-measure Northcott theorem, `README.md` 4.3),
the root count of a Weil polynomial, and the small non-vacuity examples.
-/

namespace TauCetiRoadmap.CurvesOverFiniteFields

open TauCeti Polynomial
open scoped Polynomial

noncomputable section

universe u v

/-! ## Layer 4: Weil polynomials as combinatorics on `ℤ[T]`

Independent of the function-field layers, which state their results in this vocabulary. -/

section WeilPolynomial

/-- **4.1.** A Weil `q`-polynomial: monic with integer coefficients, every complex root of
absolute value `√q` (`README.md`, Layer 4, 4.1; convention 7). -/
def IsWeilPolynomial (q : ℕ) (P : ℤ[X]) : Prop :=
  P.Monic ∧ ∀ z ∈ P.aroots ℂ, ‖z‖ = Real.sqrt q

/-- **4.4.** The functional-equation shape of a Weil polynomial of degree `2g`:
`q^j a_j = q^g a_{2g−j}` for all `j ≤ 2g` (`README.md`, Layer 4, 4.4; convention 7). -/
def IsWeilSymmetric (q g : ℕ) (P : ℤ[X]) : Prop :=
  P.natDegree = 2 * g ∧ ∀ j ≤ 2 * g, (q : ℤ) ^ j * P.coeff j = (q : ℤ) ^ g * P.coeff (2 * g - j)

/-- Non-vacuity: the unit polynomial is a Weil `q`-polynomial of degree `0` for every `q`. -/
example (q : ℕ) : IsWeilPolynomial q 1 := ⟨monic_one, by simp⟩

/-- **4.1.** A Weil polynomial is nonzero and splits over `ℂ` with exactly `natDegree P` roots. -/
theorem IsWeilPolynomial.card_aroots {q : ℕ} {P : ℤ[X]} (h : IsWeilPolynomial q P) :
    Multiset.card (P.aroots ℂ) = P.natDegree := by
  simpa [aroots_def] using
    IsAlgClosed.card_roots_map_eq_natDegree_of_isUnit_leadingCoeff (algebraMap ℤ ℂ)
      (p := P) (by rw [h.1.leadingCoeff]; exact isUnit_one)

/-- **4.1.** Every root of a Weil polynomial is an algebraic integer. -/
theorem IsWeilPolynomial.isIntegral {q : ℕ} {P : ℤ[X]} (h : IsWeilPolynomial q P) {z : ℂ}
    (hz : z ∈ P.aroots ℂ) : IsIntegral ℤ z := sorry

/-- **4.1.** The modulus is determined by a Weil polynomial of positive degree. -/
theorem IsWeilPolynomial.coeff_zero_sq {q : ℕ} {P : ℤ[X]} (h : IsWeilPolynomial q P) :
    (P.coeff 0) ^ 2 = (q : ℤ) ^ P.natDegree := sorry

/-- **4.2.** Products of Weil `q`-polynomials are Weil `q`-polynomials. -/
theorem IsWeilPolynomial.mul {q : ℕ} {P Q : ℤ[X]} (hP : IsWeilPolynomial q P)
    (hQ : IsWeilPolynomial q Q) : IsWeilPolynomial q (P * Q) := sorry

/-- **4.2.** A monic factor in `ℤ[X]` of a Weil `q`-polynomial is a Weil `q`-polynomial. -/
theorem IsWeilPolynomial.of_dvd {q : ℕ} {P Q : ℤ[X]} (hP : IsWeilPolynomial q P) (hQ : Q.Monic)
    (hdvd : Q ∣ P) : IsWeilPolynomial q Q := sorry

/-- **4.3, bridge check.** Weil `q`-polynomials of a fixed degree are finite in number: the
Mahler measure of such a polynomial is `max 1 √q ^ n`, and Mathlib's Northcott theorem
`Polynomial.finite_mahlerMeasure_le` does the rest. The same statement is R28.5.1
`finite_weilPolynomials` of `FaltingsFinitenessAndIsogenyTheorems` with modulus `√q`. -/
theorem finite_setOf_isWeilPolynomial (q n : ℕ) :
    {P : ℤ[X] | IsWeilPolynomial q P ∧ P.natDegree = n}.Finite := by
  refine (Polynomial.finite_mahlerMeasure_le n ⟨max 1 (Real.sqrt q) ^ n, by positivity⟩).subset ?_
  rintro P ⟨⟨hmonic, hroots⟩, hdeg⟩
  refine ⟨hdeg.le, ?_⟩
  show (P.map (Int.castRingHom ℂ)).mahlerMeasure ≤ max 1 (Real.sqrt q) ^ n
  rw [mahlerMeasure_eq_leadingCoeff_mul_prod_roots, (hmonic.map (Int.castRingHom ℂ)).leadingCoeff,
    norm_one, one_mul]
  have hcard : (P.map (Int.castRingHom ℂ)).roots.card = n := by
    rw [IsAlgClosed.card_roots_map_eq_natDegree_of_isUnit_leadingCoeff _
      (by rw [hmonic.leadingCoeff]; exact isUnit_one), hdeg]
  have hmap : ∀ a ∈ (P.map (Int.castRingHom ℂ)).roots, max 1 ‖a‖ = max 1 (Real.sqrt q) := by
    intro a ha
    rw [hroots a (by simpa [aroots_def] using ha)]
  rw [Multiset.map_congr rfl hmap, Multiset.map_const', Multiset.prod_replicate, hcard]

/-- **4.4, the Dickson identity with parameter `a`.** Mathlib has the case `a = 1`
(`Polynomial.dickson_one_one_eval_add_inv`); the general case follows from the same recursion
`D_{n+2} = X · D_{n+1} − a · D_n`. -/
theorem dickson_one_eval_add {R : Type*} [CommRing R] (a x y : R) (h : x * y = a) (n : ℕ) :
    (dickson 1 a n).eval (x + y) = x ^ n + y ^ n := sorry

/-- **4.4.** The real Weil polynomial `h_P` of a symmetric `P` of degree `2g`
(`README.md`, convention 8): `P(T) = T^g · h_P(T + q/T)`. -/
def realWeilPolynomial (q g : ℕ) (P : ℤ[X]) : ℤ[X] :=
  C (P.coeff g) + ∑ i ∈ Finset.Icc 1 g, C (P.coeff (g + i)) * dickson 1 (q : ℤ) i

/-- **4.4.** The defining identity of the real Weil polynomial, as a polynomial identity. Needs
`1 ≤ q`: at `q = 0` symmetry says only `P(0) = 0`, and `T⁴ + T` is a countermodel. -/
theorem realWeilPolynomial_spec {q g : ℕ} {P : ℤ[X]} (hq : 0 < q) (hP : IsWeilSymmetric q g P) :
    P = ∑ i ∈ Finset.range (g + 1),
      C ((realWeilPolynomial q g P).coeff i) * (X ^ 2 + C (q : ℤ)) ^ i * X ^ (g - i) := sorry

/-- **4.4.** `h_P` is monic of degree `g`. -/
theorem realWeilPolynomial_monic {q g : ℕ} {P : ℤ[X]} (hP : IsWeilSymmetric q g P)
    (hm : P.Monic) : (realWeilPolynomial q g P).Monic ∧ (realWeilPolynomial q g P).natDegree = g :=
  sorry

/-- **4.4.** A symmetric `P` is Weil iff `h_P` has all its roots real in `[−2√q, 2√q]` (for
`1 ≤ q`; `T⁴ + T` at `q = 0` has `h_P = X²` and is not Weil). -/
theorem isWeilPolynomial_iff_realWeilPolynomial {q g : ℕ} {P : ℤ[X]} (hq : 0 < q)
    (hP : IsWeilSymmetric q g P) (hm : P.Monic) :
    IsWeilPolynomial q P ↔
      ∀ z ∈ (realWeilPolynomial q g P).aroots ℂ, z.im = 0 ∧ |z.re| ≤ 2 * Real.sqrt q := sorry

/-- **4.4.** The root multiset of a symmetric Weil polynomial is stable under `α ↦ q/α`. -/
theorem IsWeilSymmetric.aroots_map_div {q g : ℕ} {P : ℤ[X]} (hP : IsWeilSymmetric q g P)
    (hW : IsWeilPolynomial q P) (hq : 0 < q) :
    (P.aroots ℂ).map (fun z => (q : ℂ) / z) = P.aroots ℂ := sorry

/-- **4.5.** The only monic irreducible Weil `q`-polynomials with a real root are `T² − q` when
`q` is not a square, and `T ∓ √q` when it is. -/
theorem irreducible_real_root {q : ℕ} {P : ℤ[X]} (hW : IsWeilPolynomial q P)
    (hirr : Irreducible (P.map (Int.castRingHom ℚ))) {z : ℂ} (hz : z ∈ P.aroots ℂ)
    (hre : z.im = 0) :
    P = X ^ 2 - C (q : ℤ) ∨ ∃ s : ℕ, s ^ 2 = q ∧ (P = X - C (s : ℤ) ∨ P = X + C (s : ℤ)) := sorry

/-- **4.6.** The `p`-rank of `P`: `natDegree P` minus the least index of a coefficient not
divisible by `p` (`README.md`, convention 9); for the `L`-polynomial `reverse P` this is the
largest index of a coefficient prime to `p`, the length of the slope-`0` segment of the Newton
polygon. -/
def pRank (p : ℕ) (P : ℤ[X]) : ℕ :=
  P.natDegree - sInf {j : ℕ | ¬ (p : ℤ) ∣ P.coeff j}

/-- **4.6.** Ordinary: `p`-rank `g`. -/
def IsOrdinary (p g : ℕ) (P : ℤ[X]) : Prop := pRank p P = g

/-- **4.6.** Almost ordinary: `p`-rank `g − 1` (Newton elevation `1`). -/
def IsAlmostOrdinary (p g : ℕ) (P : ℤ[X]) : Prop := pRank p P + 1 = g

/-- **4.6.** Supersingular, by the coefficient criterion of convention 9: with `q = p^r`, every
nonzero coefficient `a_j` has `2 v_p(a_j) ≥ r (natDegree P − j)`, i.e. every point of the Newton
polygon of the `L`-polynomial lies on or above the line of slope `1/2`. For `g = 1` this is
`a = 0 ∨ 2 v_p(a) ≥ r`, which is `p ∣ a` only for `r ≤ 2`: `T² − 2T + 8` is rejected. -/
def IsSupersingular (q : ℕ) (P : ℤ[X]) : Prop :=
  ∀ j, P.coeff j = 0 ∨
    q.factorization q.minFac * (P.natDegree - j) ≤ 2 * padicValInt q.minFac (P.coeff j)

/-- **4.6.** The elementary ordinariness test: a symmetric Weil polynomial is ordinary iff its
middle coefficient is prime to `p`. -/
theorem isOrdinary_iff_not_dvd_coeff {q g : ℕ} {P : ℤ[X]} (hq : IsPrimePow q)
    (hP : IsWeilSymmetric q g P) (hm : P.Monic) :
    IsOrdinary q.minFac g P ↔ ¬ (q.minFac : ℤ) ∣ P.coeff g := sorry

/-- **4.6.** `p`-ranks add in products. -/
theorem pRank_mul (p : ℕ) [Fact p.Prime] {P Q : ℤ[X]} (hP : P.Monic) (hQ : Q.Monic) :
    pRank p (P * Q) = pRank p P + pRank p Q := sorry

/-- **4.6.** Worked example `2.2.ab_a`: `T⁴ − T³ − 2T + 4` over `𝔽₂` has `p`-rank `1`, so it is
almost ordinary of genus `2`. -/
theorem pRank_example : pRank 2 (X ^ 4 - X ^ 3 - 2 * X + 4 : ℤ[X]) = 1 := sorry

/-- **4.7.** The Frobenius angles `θ ∈ [0, 1]`: `arg z / π` over the roots with `0 ≤ im z`, one
per pair of non-real conjugate roots and one per real root, with multiplicity — the LMFDB's
`angles` list, which stores `[0, 0]` for `1.4.ae` with `g = 1` (`README.md`, convention 10). -/
def frobeniusAngles (P : ℤ[X]) : Multiset ℝ :=
  ((P.aroots ℂ).filter fun z => 0 ≤ z.im).map fun z => Complex.arg z / Real.pi

/-- **4.7.** The angle rank: `dim_ℚ Span_ℚ({θ_i} ∪ {1}) − 1`. -/
def angleRank (P : ℤ[X]) : ℕ :=
  Module.finrank ℚ (Submodule.span ℚ (insert (1 : ℝ) {θ | θ ∈ frobeniusAngles P})) - 1

/-- **4.7.** A symmetric Weil polynomial of degree `2g` with `m` real roots has `g + m/2`
Frobenius angles (`m` is even, 4.5): exactly `g` when it has no real root. -/
theorem card_frobeniusAngles {q g : ℕ} {P : ℤ[X]} (hW : IsWeilPolynomial q P)
    (hP : IsWeilSymmetric q g P) :
    2 * Multiset.card (frobeniusAngles P) =
      2 * g + Multiset.card ((P.aroots ℂ).filter fun z => z.im = 0) := sorry

/-- **4.7.** `0 ≤ δ ≤ g`. -/
theorem angleRank_le {q g : ℕ} {P : ℤ[X]} (hW : IsWeilPolynomial q P)
    (hP : IsWeilSymmetric q g P) : angleRank P ≤ g := sorry

/-- **4.7.** Angle rank zero is supersingularity (Kronecker's theorem,
`NumberField.Embeddings.pow_eq_one_of_norm_eq_one`, applied to `α²/q`). -/
theorem angleRank_eq_zero_iff {q g : ℕ} {P : ℤ[X]} (hq : IsPrimePow q)
    (hW : IsWeilPolynomial q P) (hP : IsWeilSymmetric q g P) :
    angleRank P = 0 ↔ IsSupersingular q P := sorry

/-- **4.8.** The Galois group of a Weil polynomial: Mathlib's `Polynomial.Gal` of `P` over `ℚ`. -/
abbrev weilGaloisGroup (P : ℤ[X]) := (P.map (Int.castRingHom ℚ)).Gal

/-- **4.8.** The number field `ℚ(π)` of an irreducible Weil polynomial. -/
abbrev weilNumberField (P : ℤ[X]) := AdjoinRoot (P.map (Int.castRingHom ℚ))

/-- **4.8.** `ℚ(π)` is a CM field when `P` is a symmetric Weil polynomial without real roots:
`ℚ(π + q/π)` is totally real and `ℚ(π)` is a totally complex quadratic extension of it. -/
theorem isCMField_weilNumberField {q g : ℕ} {P : ℤ[X]}
    [Fact (Irreducible (P.map (Int.castRingHom ℚ)))] (hW : IsWeilPolynomial q P)
    (hP : IsWeilSymmetric q g P) (hreal : ∀ z ∈ P.aroots ℂ, z.im ≠ 0) :
    NumberField.IsCMField (weilNumberField P) := sorry

/-- **4.8.** The degree of `ℚ(π)` is the degree of `P`. -/
theorem finrank_weilNumberField {P : ℤ[X]} [Fact (Irreducible (P.map (Int.castRingHom ℚ)))] :
    Module.finrank ℚ (weilNumberField P) = P.natDegree := sorry

/-- **4.9.** Isotypic: a power of an irreducible polynomial over `ℚ` (the polynomial-level
reading of the LMFDB's `is_simple`). -/
def IsIsotypic (P : ℤ[X]) : Prop :=
  ∃ (m : ℚ[X]) (e : ℕ), Irreducible m ∧ 1 ≤ e ∧ P.map (Int.castRingHom ℚ) = m ^ e

/-- **4.10.** The Weil power `P^{(r)}`, whose roots are the `r`-th powers of the roots of `P`:
the characteristic polynomial of multiplication by `root^r` on `AdjoinRoot P` in the power basis
(`README.md`, convention 11). -/
def weilPower {P : ℤ[X]} (hP : P.Monic) (r : ℕ) : ℤ[X] :=
  (LinearMap.toMatrix (AdjoinRoot.powerBasis' hP).basis (AdjoinRoot.powerBasis' hP).basis
    (Algebra.lmul ℤ (AdjoinRoot P) (AdjoinRoot.root P ^ r))).charpoly

/-- **4.10.** The power sum `s_r = ∑ α_i^r`, as the trace of multiplication by `root^r`. -/
def weilPowerSum {P : ℤ[X]} (hP : P.Monic) (r : ℕ) : ℤ :=
  Matrix.trace (LinearMap.toMatrix (AdjoinRoot.powerBasis' hP).basis
    (AdjoinRoot.powerBasis' hP).basis (Algebra.lmul ℤ (AdjoinRoot P) (AdjoinRoot.root P ^ r)))

/-- **4.10.** The roots of `P^{(r)}` are the `r`-th powers of the roots of `P`. -/
theorem aroots_weilPower {P : ℤ[X]} (hP : P.Monic) (r : ℕ) :
    (weilPower hP r).aroots ℂ = (P.aroots ℂ).map (· ^ r) := sorry

/-- **4.10.** The power sum is the sum of the `r`-th powers of the roots. -/
theorem weilPowerSum_eq {P : ℤ[X]} (hP : P.Monic) (r : ℕ) :
    (weilPowerSum hP r : ℂ) = ((P.aroots ℂ).map (· ^ r)).sum := sorry

/-- **4.10.** `P^{(1)} = P`. -/
theorem weilPower_one {P : ℤ[X]} (hP : P.Monic) : weilPower hP 1 = P := sorry

/-- **4.10.** A Weil `q`-polynomial's `r`-th power is a Weil `q^r`-polynomial, and conversely. -/
theorem isWeilPolynomial_weilPower_iff {q : ℕ} {P : ℤ[X]} (hP : P.Monic) {r : ℕ} (hr : 0 < r) :
    IsWeilPolynomial (q ^ r) (weilPower hP r) ↔ IsWeilPolynomial q P := sorry

/-- **4.10.** The product formula `∏_{ζ^r=1} P(ζT) = (−1)^{(r−1) n} P^{(r)}(T^r)` in `ℂ[T]`. -/
theorem prod_rootsOfUnity_comp_weilPower {P : ℤ[X]} (hP : P.Monic) {r : ℕ} (hr : 0 < r) :
    ∏ ζ ∈ (nthRootsFinset r (1 : ℂ)), (P.map (algebraMap ℤ ℂ)).comp (C ζ * X) =
      (-1) ^ ((r - 1) * P.natDegree) * ((weilPower hP r).map (algebraMap ℤ ℂ)).comp (X ^ r) :=
  sorry

/-- **4.10.** Polynomial twists over `𝔽_{q^r}`: equal `r`-th Weil powers. The LMFDB's `twists`
ranges over realized isogeny classes and is the sibling roadmap's 5.6; this relation decides
membership there. -/
def IsTwistOver (r : ℕ) {P₁ P₂ : ℤ[X]} (h₁ : P₁.Monic) (h₂ : P₂.Monic) : Prop :=
  weilPower h₁ r = weilPower h₂ r

/-- **4.10.** The least `r ≥ 1` with `IsTwistOver r` (the LMFDB's extension degree of a twist);
`0` when there is none. It need not divide every `r` with `IsTwistOver r`: `T² − 3T + 3` and
`T² + 3T + 3` (`q = 3`) have equal Weil powers for `r = 2` and `r = 3`. -/
def twistDegree {P₁ P₂ : ℤ[X]} (h₁ : P₁.Monic) (h₂ : P₂.Monic) : ℕ :=
  sInf {r : ℕ | 0 < r ∧ IsTwistOver r h₁ h₂}

/-- **4.10.** The Weil roots of `P`: the monic `Q` with `weilPower hQ r = P`, the polynomial side
of base change. Which of them is the characteristic polynomial of an abelian variety is Honda–Tate,
so the LMFDB's `is_primitive` is the sibling roadmap's 5.5 and no predicate here. -/
def weilRoots (r : ℕ) (P : ℤ[X]) : Set ℤ[X] :=
  {Q | ∃ hQ : Q.Monic, weilPower hQ r = P}

/-- **4.10.** Finitely many Weil roots: the roots of `Q` are `r`-th roots of the roots of `P`. -/
theorem weilRoots_finite {r : ℕ} (hr : 0 < r) (P : ℤ[X]) : (weilRoots r P).Finite := sorry

/-- **4.10.** Geometrically irreducible: every Weil power is irreducible over `ℚ`; a sufficient
condition for the sibling roadmap's `is_geometrically_simple` (its 5.3). -/
def IsGeometricallyIrreducible {P : ℤ[X]} (hP : P.Monic) : Prop :=
  ∀ r, 0 < r → Irreducible ((weilPower hP r).map (Int.castRingHom ℚ))

/-- **4.10.** The least `r ≥ 1` killing every root-of-unity ratio of roots; the sibling roadmap's
5.4 proves it is the degree of the field of definition of all endomorphisms, the LMFDB's
`geometric_extension_degree`. -/
def geometricExtensionDegree (P : ℤ[X]) : ℕ :=
  sInf {r : ℕ | 0 < r ∧ ∀ α ∈ P.aroots ℂ, ∀ β ∈ P.aroots ℂ, IsOfFinOrder (α / β) → (α / β) ^ r = 1}

/-- **4.11.** The point counts of the virtual curve of `P`: `N_r = q^r + 1 − s_r`. -/
def virtualCurveCount (q : ℕ) {P : ℤ[X]} (hP : P.Monic) (r : ℕ) : ℤ :=
  (q : ℤ) ^ r + 1 - weilPowerSum hP r

/-- **4.11.** The point counts of the virtual abelian variety of `P`: `A_r = P^{(r)}(1)`. -/
def virtualAbvarCount {P : ℤ[X]} (hP : P.Monic) (r : ℕ) : ℤ := (weilPower hP r).eval 1

/-- **4.11, 3.10.** The Jacobian-compatibility conditions on the virtual counts: nonnegativity,
monotonicity under divisibility, and nonnegative integral Möbius transforms. -/
def IsJacobianCompatible (q : ℕ) {P : ℤ[X]} (hP : P.Monic) : Prop :=
  (∀ r, 0 < r → 0 ≤ virtualCurveCount q hP r) ∧
  (∀ d r, 0 < r → d ∣ r → virtualCurveCount q hP d ≤ virtualCurveCount q hP r) ∧
  (∀ r, 0 < r → 0 ≤ ∑ d ∈ r.divisors, ArithmeticFunction.moebius (r / d) * virtualCurveCount q hP d ∧
    (r : ℤ) ∣ ∑ d ∈ r.divisors, ArithmeticFunction.moebius (r / d) * virtualCurveCount q hP d)

/-- **4.11.** The Hasse–Weil bound for the virtual counts of any symmetric Weil polynomial. -/
theorem virtualCurveCount_sub_sq_le {q g : ℕ} {P : ℤ[X]} (hm : P.Monic)
    (hW : IsWeilPolynomial q P) (hP : IsWeilSymmetric q g P) {r : ℕ} (hr : 0 < r) :
    (virtualCurveCount q hm r - ((q : ℤ) ^ r + 1)) ^ 2 ≤ 4 * (g : ℤ) ^ 2 * (q : ℤ) ^ r := sorry

end WeilPolynomial

/-! ## Layer 3: a corollary of the Riemann hypothesis that needs no consumed object -/

section FunctionField

variable {k : Type u} {F : Type v} [Field k] [Field F] [Algebra k F]

/-- **3.6.** `(√q − 1)^{2g} ≤ h_F ≤ (√q + 1)^{2g}`, from `h_F = L_F(1) = ∏ (1 − α_i)` and the
Riemann hypothesis `|α_i| = √q` (FunctionFieldArithmetic §§5.3–5.4). -/
theorem classNumber_bounds (hF : IsFunctionField k F) [Finite k]
    (hex : IsIntegrallyClosedIn k F) :
    (Real.sqrt (Nat.card k) - 1) ^ (2 * genus k F) ≤ Divisor.classNumber hF ∧
      (Divisor.classNumber hF : ℝ) ≤ (Real.sqrt (Nat.card k) + 1) ^ (2 * genus k F) := sorry

end FunctionField

end

end TauCetiRoadmap.CurvesOverFiniteFields
