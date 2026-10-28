import Mathlib

/-!
# Elliptic-curve factorization: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few simple definitions they need: the monic model of a Montgomery curve, raw coordinate pairs,
the scaled doubling and differential-addition formulas, the coordinate pair of a native point,
and Suyama's coefficients.

The headline theorems stated here are the correctness of Montgomery doubling and differential
addition on Mathlib's point group (Layer 3), the stage-2 cross-difference criterion (Layer 4),
Suyama's ellipticity criterion (Layer 5) and stage-1 detection at a prime divisor of a composite
modulus (Layer 6).

Every headline theorem of the README is statable at the pins and is stated here. The other README
targets (the `Projectivization`-valued `x`-coordinate map and its fibres, the ladder recurrences,
compatibility with ring homomorphisms, the gcd classification and batching) are library API and
supporting results; they are specified in the README and not restated here.
-/

namespace TauCetiRoadmap.ECM

/-! ## Layer 1: Montgomery models -/

/-- The monic Weierstrass model `y'² = x'³ + AB x'² + B² x'` obtained from the Montgomery
equation `B y² = x³ + A x² + x` by `x' = Bx`, `y' = B²y`. -/
def model {R : Type*} [CommRing R] (A B : R) : WeierstrassCurve R :=
  ⟨0, A * B, 0, B ^ 2, 0⟩

/-- The discriminant of the Montgomery model is `16 B⁶ (A² − 4)`. -/
example {R : Type*} [CommRing R] (A B : R) :
    (model A B).Δ = 16 * B ^ 6 * (A ^ 2 - 4) := by
  simp only [model, WeierstrassCurve.Δ, WeierstrassCurve.b₂, WeierstrassCurve.b₄,
    WeierstrassCurve.b₆, WeierstrassCurve.b₈]
  ring

/-! ## Layer 2: raw pairs and the coordinate pair of a point -/

/-- Raw coordinates `(X, Z)` for `x = X / Z`; `(0, 0)` is allowed as data, never as a point
of the projective line. -/
structure Pair (R : Type*) where
  /-- The numerator coordinate. -/
  x : R
  /-- The denominator coordinate. -/
  z : R

/-- The image of a raw pair under a ring homomorphism, coordinate by coordinate. -/
def Pair.map {R S : Type*} [CommRing R] [CommRing S] (f : R →+* S) (P : Pair R) : Pair S :=
  ⟨f P.x, f P.z⟩

/-- The coordinate pair of a native point of the monic model: the point at infinity goes to
`(1, 0)` and the affine point `(x', y')` to `(x', B)`, which represents the Montgomery
`x`-coordinate `x'/B`. -/
def coordinates {R : Type*} [CommRing R] (A B : R) : (model A B).toAffine.Point → Pair R
  | .zero => ⟨1, 0⟩
  | .some x _ _ => ⟨x, B⟩

/-! ## Layer 3: doubling and differential addition -/

/-- Scaled Montgomery doubling `(D U V, C (D V + N C))` with `U = (X + Z)²`, `V = (X − Z)²`,
`C = U − V`, for scalars with `N / D = (A + 2) / 4` (Montgomery 1987, §10.3.1, p. 261). -/
def double {R : Type*} [CommRing R] (N D : R) (P : Pair R) : Pair R :=
  let U := (P.x + P.z) ^ 2
  let V := (P.x - P.z) ^ 2
  let C := U - V
  ⟨D * U * V, C * (D * V + N * C)⟩

/-- Montgomery differential addition `(Z_R (a + b)², X_R (a − b)²)` with
`a = (X_P + Z_P)(X_Q − Z_Q)` and `b = (X_P − Z_P)(X_Q + Z_Q)`, where the third pair represents
`P − Q` (Montgomery 1987, §10.3.1, p. 261). -/
def diffAdd {R : Type*} [CommRing R] (P Q S : Pair R) : Pair R :=
  let a := (P.x + P.z) * (Q.x - Q.z)
  let b := (P.x - P.z) * (Q.x + Q.z)
  ⟨S.z * (a + b) ^ 2, S.x * (a - b) ^ 2⟩

/-- **Doubling is correct.** On the monic model of a Montgomery curve with `B ≠ 0` over a field
of characteristic other than `2`, and for scalars `N, D` with `D ≠ 0` and `4N = (A + 2)D`, the
scaled doubling of the coordinate pair of any native point `P` is a nonzero pair representing
the same point of the projective line as the coordinate pair of `P + P`. No nonsingularity
hypothesis on the model is needed: native points are nonsingular points
(Montgomery 1987, §10.3.1, p. 261). -/
theorem double_coordinates {K : Type*} [Field K] [DecidableEq K] {A B N D : K}
    (h2 : (2 : K) ≠ 0) (hB : B ≠ 0) (hD : D ≠ 0) (hND : 4 * N = (A + 2) * D)
    (P : (model A B).toAffine.Point) :
    let out := double N D (coordinates A B P)
    let target := coordinates A B (P + P)
    (out.x ≠ 0 ∨ out.z ≠ 0) ∧ out.x * target.z = target.x * out.z := by
  sorry

/-- **Differential addition is correct, with its exact exceptional set.** On the monic model of
a Montgomery curve with `B ≠ 0` over a field of characteristic other than `2`, for native points
`P, Q`, differential addition of the coordinate pairs of `P`, `Q` and `P − Q` represents the
coordinate pair of `P + Q`; and its output is nonzero exactly when the coordinate pair of
`P − Q` has both coordinates nonzero, that is, when `P − Q` is neither the point at infinity
(pair `(1, 0)`) nor the distinguished `2`-torsion point `(0, 0)` (pair `(0, B)`)
(Montgomery 1987, §10.3.1, pp. 260–261). -/
theorem diffAdd_coordinates {K : Type*} [Field K] [DecidableEq K] {A B : K}
    (h2 : (2 : K) ≠ 0) (hB : B ≠ 0) (P Q : (model A B).toAffine.Point) :
    let out := diffAdd (coordinates A B P) (coordinates A B Q) (coordinates A B (P - Q))
    let target := coordinates A B (P + Q)
    out.x * target.z = target.x * out.z ∧
      ((out.x ≠ 0 ∨ out.z ≠ 0) ↔
        (coordinates A B (P - Q)).x ≠ 0 ∧ (coordinates A B (P - Q)).z ≠ 0) := by
  sorry

/-! ## Layer 4: scalar multiples and the stage-2 criterion -/

/-- **Stage-2 cross-difference criterion.** On the monic model of a Montgomery curve with
`B ≠ 0` over a field, for a native point `Q` and integers `m, n`, the cross difference
`X_m Z_n − X_n Z_m` of the coordinate pairs of `m • Q` and `n • Q` vanishes exactly when
`(m − n) • Q = 0` or `(m + n) • Q = 0`. -/
theorem coordinates_cross_eq_zero_iff {K : Type*} [Field K] [DecidableEq K] {A B : K}
    (hB : B ≠ 0) (Q : (model A B).toAffine.Point) (m n : ℤ) :
    (coordinates A B (m • Q)).x * (coordinates A B (n • Q)).z -
        (coordinates A B (n • Q)).x * (coordinates A B (m • Q)).z = 0 ↔
      (m - n) • Q = 0 ∨ (m + n) • Q = 0 := by
  sorry

/-! ## Layer 5: Suyama's family -/

/-- Suyama's Montgomery coefficient `A = (v − u)³ (3u + v) / (4 u³ v) − 2` with `u = σ² − 5`
and `v = 4σ` (Zimmermann 2006, §1, p. 3). -/
def suyamaA {K : Type*} [Field K] (σ : K) : K :=
  let u := σ ^ 2 - 5
  let v := 4 * σ
  (v - u) ^ 3 * (3 * u + v) / (4 * u ^ 3 * v) - 2

/-- Suyama's Montgomery coefficient `B = x³ + A x² + x` at `x = u³ / v³`, chosen so that
`(x, 1)` lies on `B y² = x³ + A x² + x`. -/
def suyamaB {K : Type*} [Field K] (σ : K) : K :=
  let x := (σ ^ 2 - 5) ^ 3 / (4 * σ) ^ 3
  x ^ 3 + suyamaA σ * x ^ 2 + x

/-- **Suyama's ellipticity criterion.** Over a field of characteristic other than `2`, for a
parameter `σ` with `σ ≠ 0` and `σ² ≠ 5` (so that Suyama's denominators are nonzero), the monic
model of Suyama's Montgomery curve is elliptic exactly when
`(σ² − 1)(σ² − 9)(σ² − 25)(9σ² − 25)(σ² + 5) ≠ 0`. -/
theorem isElliptic_model_suyama_iff {K : Type*} [Field K] (h2 : (2 : K) ≠ 0) {σ : K}
    (hσ : σ ≠ 0) (hu : σ ^ 2 ≠ 5) :
    (model (suyamaA σ) (suyamaB σ)).IsElliptic ↔
      (σ ^ 2 - 1) * (σ ^ 2 - 9) * (σ ^ 2 - 25) * (9 * σ ^ 2 - 25) * (σ ^ 2 + 5) ≠ 0 := by
  sorry

/-! ## Layer 6: reduction modulo a prime divisor and detection -/

/-- **Stage-1 detection at a prime divisor.** Let `p` be a prime dividing `n`, let `P` be a
native point of the monic model of a Montgomery curve over `ZMod p`, and let `m` be a multiple
of the number of native points. If a raw pair `R` over `ZMod n` reduces modulo `p` to a pair
representing the coordinate pair of `m • P`, then `p` divides `gcd(Z, n)` for the natural
representative `Z` of the second coordinate of `R` (Lenstra 1987, §2; Zimmermann 2006, §1.1,
p. 3). -/
theorem prime_dvd_gcd_of_card_dvd {n p : ℕ} [Fact p.Prime] (hpn : p ∣ n) {A B : ZMod p}
    (P : (model A B).toAffine.Point) {m : ℕ} (hm : Nat.card (model A B).toAffine.Point ∣ m)
    (R : Pair (ZMod n))
    (hR : (R.map (ZMod.castHom hpn (ZMod p))).x * (coordinates A B (m • P)).z =
      (coordinates A B (m • P)).x * (R.map (ZMod.castHom hpn (ZMod p))).z) :
    p ∣ Nat.gcd R.z.val n := by
  sorry

end TauCetiRoadmap.ECM
