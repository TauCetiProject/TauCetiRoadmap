module

public import Mathlib
public import TauCeti.FieldTheory.FunctionField.RiemannRoch.ClassNumber
public import TauCeti.FieldTheory.FunctionField.Elliptic.WeierstrassEquation
public import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount
public import TauCeti.AlgebraicGeometry.EllipticCurve.Supersingular

/-!
# Curves over finite fields: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need (the Weil-polynomial vocabulary of Layer 4: `README.md`,
*Pinned conventions* 7–12).

The carrier of the function-field layers is Tau Ceti's function-field library: `k` and `F` with
`[Finite k]`, `hF : TauCeti.IsFunctionField k F` and `hex : IsIntegrallyClosedIn k F` passed
explicitly, `TauCeti.genus k F`, the class number `TauCeti.Divisor.classNumber hF`, and the
number of degree-one places `Nat.card {P : Place k F // P.degree = 1}`, which is
FunctionFieldArithmetic §5.1's `N_1(F)` (`placeCount 1`). The carrier of the Weil-polynomial layer
is `ℤ[X]` with a natural number `q`.

Headline theorems not statable at the pins, and what each lacks:

* 3.1, the link theorem `IsWeilPolynomial q (weilPolynomial k F)`, 3.4 (the relations among the
  `N_r` for `r ≥ 2`) and 3.5 (maximal and minimal curves), and all of Layer 2: they name the
  `L`-polynomial `L_F` or the counts `N_r` for `r ≥ 2`, which are FunctionFieldArithmetic's
  (`zeta_rationality`, `pointCount`) and not at the pin.
* 4.6's slope statements (slopes in `[0, 1]`, symmetry `s ↦ 1 − s`, the slope–root dictionary,
  the elevation): they need the slope multiset of a Newton polygon, NewtonPolygons §§2.1, 3.3,
  not at the pin; the elementary predicates `pRank`, `IsOrdinary`, `IsSupersingular` and the
  ordinariness test are stated.
* 5.2, the comparison of the zeta function of an elliptic curve: it names
  `WeierstrassCurve.zetaFunction`, not at the pin.
* 5.3, the equivalence of the two Weil-number predicates: it names `IsWeilNumber` of
  DeligneWeightsAndPurity, a roadmap target.

Stated here: Layer 4's headline theorems on `ℤ[X]`; 3.1's class-number bounds and
class-number-one corollary; 3.2 (Serre) and 3.3 (Ihara); and 5.1's identification of `N_1(F)`
with `WeierstrassCurve.pointCount` and its supersingularity comparison over `𝔽_p` and `𝔽_{p²}`.
-/

public section

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

/-- **4.4.** The real Weil polynomial `h_P` of a symmetric `P` of degree `2g`
(`README.md`, convention 8): `P(T) = T^g · h_P(T + q/T)`. -/
def realWeilPolynomial (q g : ℕ) (P : ℤ[X]) : ℤ[X] :=
  C (P.coeff g) + ∑ i ∈ Finset.Icc 1 g, C (P.coeff (g + i)) * dickson 1 (q : ℤ) i

/-- **4.4.** The defining identity of the real Weil polynomial, as a polynomial identity. Needs
`1 ≤ q`: at `q = 0` symmetry says only `P(0) = 0`, and `T⁴ + T` is a countermodel. -/
theorem realWeilPolynomial_spec {q g : ℕ} {P : ℤ[X]} (hq : 0 < q) (hP : IsWeilSymmetric q g P) :
    P = ∑ i ∈ Finset.range (g + 1),
      C ((realWeilPolynomial q g P).coeff i) * (X ^ 2 + C (q : ℤ)) ^ i * X ^ (g - i) := sorry

/-- **4.4.** A symmetric `P` is Weil iff `h_P` has all its roots real in `[−2√q, 2√q]` (for
`1 ≤ q`; `T⁴ + T` at `q = 0` has `h_P = X²` and is not Weil). -/
theorem isWeilPolynomial_iff_realWeilPolynomial {q g : ℕ} {P : ℤ[X]} (hq : 0 < q)
    (hP : IsWeilSymmetric q g P) (hm : P.Monic) :
    IsWeilPolynomial q P ↔
      ∀ z ∈ (realWeilPolynomial q g P).aroots ℂ, z.im = 0 ∧ |z.re| ≤ 2 * Real.sqrt q := sorry

/-- **4.4.** The root multiset of a symmetric polynomial is stable under `α ↦ q/α` (for `1 ≤ q`;
no Weil hypothesis: `T^{2g} P(q/T) = q^g P(T)` and `P(0) = q^g · leadingCoeff P ≠ 0`). -/
theorem IsWeilSymmetric.aroots_map_div {q g : ℕ} {P : ℤ[X]} (hP : IsWeilSymmetric q g P)
    (hq : 0 < q) :
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

/-- **4.6.** Ordinary over `𝔽_q`: `p`-rank `g` at `p := q.minFac` (the three Newton-stratum
predicates all take `q`, as `IsSupersingular` must). -/
def IsOrdinary (q g : ℕ) (P : ℤ[X]) : Prop := pRank q.minFac P = g

/-- **4.6.** Almost ordinary over `𝔽_q`: `p`-rank `g − 1` (Newton elevation `1`). -/
def IsAlmostOrdinary (q g : ℕ) (P : ℤ[X]) : Prop := pRank q.minFac P + 1 = g

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
    IsOrdinary q g P ↔ ¬ (q.minFac : ℤ) ∣ P.coeff g := sorry

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

/-! ## Layer 3: the corollaries of the Riemann hypothesis on the function-field carrier

`N_1(F)`, the number of places of degree one, is `Nat.card {P : Place k F // P.degree = 1}`
(FunctionFieldArithmetic §5.1, `placeCount 1`); `q = Nat.card k`, `g = genus k F`. -/

section FunctionField

variable {k : Type u} {F : Type v} [Field k] [Field F] [Algebra k F]

/-- **3.1.** `(√q − 1)^{2g} ≤ h_F ≤ (√q + 1)^{2g}`, from `h_F = L_F(1) = ∏ (1 − α_i)` and the
Riemann hypothesis `|α_i| = √q` (FunctionFieldArithmetic §§5.3–5.4). -/
theorem classNumber_bounds (hF : IsFunctionField k F) [Finite k]
    (hex : IsIntegrallyClosedIn k F) :
    (Real.sqrt (Nat.card k) - 1) ^ (2 * genus k F) ≤ Divisor.classNumber hF ∧
      (Divisor.classNumber hF : ℝ) ≤ (Real.sqrt (Nat.card k) + 1) ^ (2 * genus k F) := sorry

/-- **3.1.** A function field of positive genus and class number one has `q ≤ 4`
(`(√q − 1)^{2g} ≤ 1`; the rational function field has `h = 1` over every `𝔽_q`, so `1 ≤ g` is
needed). -/
theorem card_le_four_of_classNumber_eq_one (hF : IsFunctionField k F) [Finite k]
    (hex : IsIntegrallyClosedIn k F) (hg : 1 ≤ genus k F) (h : Divisor.classNumber hF = 1) :
    Nat.card k ≤ 4 := sorry

/-- **3.2, Serre's bound.** `|N_1(F) − (q + 1)| ≤ g · ⌊2√q⌋`, with `⌊2√q⌋ = Nat.sqrt (4q)`
(Stichtenoth, Theorem 5.3.1). -/
theorem serre_bound (hF : IsFunctionField k F) [Finite k] (hex : IsIntegrallyClosedIn k F) :
    |(Nat.card {P : Place k F // P.degree = 1} : ℤ) - ((Nat.card k : ℤ) + 1)| ≤
      (genus k F : ℤ) * (Nat.sqrt (4 * Nat.card k) : ℤ) := sorry

/-- **3.3, Ihara's bound.** `N_1(F) ≤ q + 1 + (√((8q + 1) g² + 4 (q² − q) g) − g) / 2`, from
`N_2 ≥ N_1` and Cauchy–Schwarz on the roots of the real Weil polynomial (Ihara 1981). -/
theorem ihara_bound (hF : IsFunctionField k F) [Finite k] (hex : IsIntegrallyClosedIn k F) :
    (Nat.card {P : Place k F // P.degree = 1} : ℝ) ≤
      Nat.card k + 1 +
        (Real.sqrt ((8 * Nat.card k + 1) * (genus k F : ℝ) ^ 2 +
            4 * ((Nat.card k : ℝ) ^ 2 - Nat.card k) * genus k F) - genus k F) / 2 := sorry

end FunctionField

/-! ## Layer 5: comparison with Tau Ceti's elliptic curves -/

section Elliptic

variable {k : Type u} {F : Type v} [Field k] [Field F] [Algebra k F]

/-- **5.1.** For a genus-one function field with Weierstrass coordinates `(x, y)` for `W` at a
place `P` (Tau Ceti `Place.IsWeierstrassCoordinates`; they exist at every degree-one place by
`exists_isWeierstrassCoordinates_of_genus_eq_one`), the number of degree-one places is
`WeierstrassCurve.pointCount W`: the places other than `P` are the affine `k`-points of `W`
and `P` is the point at infinity. Genus one is needed: the cuspidal `y² = x³` with `x = t²`,
`y = t³` has Weierstrass coordinates at the infinite place of `k(t)` for a singular `W`. -/
theorem card_degreeOne_eq_pointCount [Finite k] (hF : IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (hg : genus k F = 1) {P : Place k F}
    {W : WeierstrassCurve k} {x y : F} (hW : P.IsWeierstrassCoordinates W x y) :
    Nat.card {Q : Place k F // Q.degree = 1} = W.pointCount := sorry

/-- **5.1.** Over `𝔽_p` and `𝔽_{p²}` the geometric supersingularity of an elliptic curve (Tau
Ceti `WeierstrassCurve.IsSupersingular`, no nonzero `p`-torsion over the algebraic closure) is
the coefficient criterion `IsSupersingular q (T² − aT + q)` of 4.6 on its Weil polynomial,
`a = frobeniusTrace`: both say `p ∣ a` (EllipticCurves Layer 3's criterion, and `2 v_p(a) ≥ r`
for `r ≤ 2`). For `r ≥ 3` the two still agree on every elliptic curve, but that is a statement
about curves (no supersingular curve over `𝔽_{p^r}` has `0 < v_p(a) < r/2`) and is not a
milestone of this roadmap. -/
theorem isSupersingular_iff_isSupersingular_weilPolynomial [Finite k] (W : WeierstrassCurve k)
    [W.IsElliptic] (hq : Nat.card k = ringChar k ∨ Nat.card k = ringChar k ^ 2) :
    W.IsSupersingular (ringChar k) ↔
      IsSupersingular (Nat.card k) (X ^ 2 - C W.frobeniusTrace * X + C (Nat.card k : ℤ)) :=
  sorry

end Elliptic

end

end TauCetiRoadmap.CurvesOverFiniteFields
