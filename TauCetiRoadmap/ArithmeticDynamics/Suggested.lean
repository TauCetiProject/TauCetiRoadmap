import Mathlib

/-!
# ArithmeticDynamics: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs, using only the
simple definitions needed to state them.

The statable headlines are Morton's rational three-cycle uniqueness and four-cycle
exclusion, Flynn–Poonen–Schaefer's five-cycle exclusion, Stoll's full finite-level
Galois groups for his integer families, Ritt's equal-iterate classification,
Ghioca–Tucker–Zieve's affine-line orbit intersection and line return-time theorems,
the whole-field Lech–Cassels embedding theorem, and the uniform bound for common
Legendre torsion images and for elliptic curves with three common branch values,
together with infinitude of algebraic torsion specializations of a constant mark.
Their README sections are respectively §§3.88, 3.57, 3.58, 5.64, 6.23, 6.84,
6.90, 6.86, 6.111, 6.112 and 6.87.

The following headlines are not statable at the pins:
* Milnor's dynamical moduli theorems (§§0.37, 0.40) lack the degree-indexed
  rational-map and geometric moduli carriers.
* Call–Silverman canonical heights and the zero-height criterion (§§1.17, 1.21,
  1.25) lack polarized arithmetic varieties with their line-bundle Weil heights
  and the projective-line rational-map action. The abstract Tate limit is not a
  substitute for those objects.
* The local canonical-measure, Julia-support and maximal-entropy theorems
  (§§2.80, 2.85, 2.90, 2.94) lack rational maps acting on the native analytic
  projective line and their equilibrium measures; the Berkovich carrier and
  measure entropy are missing as well.
* Dynatomic smoothness, irreducibility and genus (§§3.73, 3.87) lack the
  dynatomic polynomial and its regular projective curve models. Stoll's
  conditional six-cycle exclusion (§3.72) and Poonen's conditional preperiodic
  classification (§3.89) also lack the specified Jacobians and their rank data.
* Dynamical equidistribution and the Arakelov–Zhang pairing theorems (§§4.60,
  4.66–4.71) lack adelic dynamical measures and metrized line bundles.
* The generic arboreal image theorems (§§5.59, 5.61) and the continuous
  representation statements lack the rooted preimage tower, its automorphism
  group and its Galois action. The finite polynomial Galois groups used below
  do exist.
* Canonical-height specialization and variation (§§6.24, 6.69, 6.78, 6.85),
  critical-height comparison (§6.81), and hybrid limits (§6.42) lack the
  corresponding arithmetic family, divisor-height, moduli and hybrid carriers.
* The joint-small-point and pairing bounds (§§6.106–6.110) lack the Legendre
  dynamical heights and adelic pairing. The torsion-image endpoint (§6.111)
  and its three-common-branch-value extension (§6.112) need only native
  Weierstrass points and projective coordinate changes, so both are stated below.
* Étale dynamical Mordell–Lang (§6.101) lacks the quasi-projective variety
  over ℂ carrier. Schemes and étale morphisms alone do not supply that datum.

Conjectures in §§3.39, 6.26, 6.43 and 6.50 are not asserted as theorems.
-/

namespace TauCetiRoadmap.ArithmeticDynamics

open Polynomial

/-! ## Layer 0: Iteration, maps and moduli -/

/-- The forward orbit is the range of all nonnegative compositional iterates,
including the starting point at index zero. -/
def forwardOrbit {α : Type*} (f : α → α) (x : α) : Set α :=
  Set.range fun n : ℕ ↦ f^[n] x

/-! ## Layer 3: Periodic equations, dynatomic curves and certified arithmetic -/

/-- Morton: no rational quadratic polynomial has a rational four-cycle. -/
theorem noRationalFourCycle (c x : ℚ) :
    Function.minimalPeriod (fun z : ℚ ↦ z ^ 2 + c) x ≠ 4 := sorry

/-- Flynn–Poonen–Schaefer: no rational quadratic polynomial has a rational five-cycle. -/
theorem noRationalFiveCycle (c x : ℚ) :
    Function.minimalPeriod (fun z : ℚ ↦ z ^ 2 + c) x ≠ 5 := sorry

/-- Any two exact rational period-three points lie on the same cycle (Morton Theorem 3). -/
theorem atMostOneRationalThreeCycle (c x y : ℚ)
    (hx : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) x = 3)
    (hy : Function.minimalPeriod (fun z : ℚ => z ^ 2 + c) y = 3) :
    y = x ∨ y = x ^ 2 + c ∨ y = (x ^ 2 + c) ^ 2 + c := sorry

/-! ## Layer 5: Arboreal Galois representations -/

/-- Stoll's integer families have the full binary-tree Galois-group order at
every finite level (README §5.64; Section 3 of Stoll 1992). -/
theorem stoll_integer_family_card_gal (a : ℤ)
    (ha : (0 < a ∧ (a % 4 = 1 ∨ a % 4 = 2)) ∨
      (a < 0 ∧ a % 4 = 0 ∧ ¬ IsSquare (-a))) (n : ℕ) :
    Nat.card (Polynomial.Gal ((X ^ 2 + C (a : ℚ) : ℚ[X]).comp^[n] X)) =
      2 ^ (2 ^ n - 1) := sorry

/-! ## Layer 6: Families, specialization and orbit intersections -/

/-- Finite unions of arithmetic progressions in the nonnegative integers;
a zero step represents a singleton. -/
def IsFiniteUnionAP (S : Set ℕ) : Prop :=
  ∃ A : Finset (ℕ × ℕ), S = ⋃ ab ∈ A, Set.range fun k : ℕ ↦ ab.1 * k + ab.2

/-- Ritt's equal-iterate classification uses compositional iterates and includes
`s = 0`, the monomial case of the support condition. -/
theorem rittCommonIterate (F G : Polynomial ℂ) (hd : 1 < F.natDegree)
    (n : ℕ) (hn : 0 < n) :
    (fun z : ℂ => F.eval z)^[n] = (fun z : ℂ => G.eval z)^[n] ↔
      ∃ (β γ : ℂ) (H : Polynomial ℂ) (r s : ℕ),
        γ ≠ 0 ∧ (∀ k, H.coeff k ≠ 0 → ∃ m : ℕ, k = r + s * m) ∧
        F = C (-β) + C γ * H.comp (X + C β) ∧
        G = C (-β) + H.comp (X + C β) ∧
        γ ^ s = 1 ∧ γ ^ (∑ k ∈ Finset.range n, F.natDegree ^ k) = 1 := sorry

/-- The x-coordinate projection followed by an invertible projective coordinate
change. Its value is the ratio of the transformed native x-representative, or
infinity when the denominator is zero. For an elliptic curve this is a standard
degree-two projection; the formula also exists on the nonsingular points of a
singular Weierstrass model (README §6.57). -/
noncomputable def ellipticStandardProjection (W : WeierstrassCurve ℂ)
    (A : Matrix.GeneralLinearGroup (Fin 2) ℂ) (P : W.toAffine.Point) : OnePoint ℂ := by
  classical
  let v := (A : Matrix (Fin 2) (Fin 2) ℂ).mulVec P.xRep
  exact if v 1 = 0 then OnePoint.infty else OnePoint.some (v 0 / v 1)

/-- The standard projected torsion set of the Legendre curve over ℂ. Its
Weierstrass coefficients are `(0, -(1+t), 0, t, 0)`; the identity coordinate
change gives x at an affine point and infinity at the zero point
(README §§6.35, 6.111). -/
noncomputable def legendreTorsionImages (t : ℂ) : Set (OnePoint ℂ) := by
  classical
  let W : WeierstrassCurve ℂ := ⟨0, -(1 + t), 0, t, 0⟩
  exact ellipticStandardProjection W 1 '' {P : W.toAffine.Point | IsOfFinAddOrder P}

/-- Infinitely many points of the product of two equal-degree nonlinear
polynomial orbits on a nonvertical, nonhorizontal affine line force that line
to be preserved by a positive iterate (GTZ Theorem 1.5; README §6.84). -/
theorem polynomialOrbits_meetingLine {K : Type*} [Field K] [CharZero K]
    (F G : K[X]) (x y a b : K) (ha : a ≠ 0)
    (hd : F.natDegree = G.natDegree) (hF : 1 < F.natDegree)
    (hcommon : Set.Infinite {p : K × K |
      p.1 ∈ forwardOrbit (fun z : K ↦ F.eval z) x ∧
      p.2 ∈ forwardOrbit (fun z : K ↦ G.eval z) y ∧ p.2 = a * p.1 + b}) :
    ∃ n : ℕ, 0 < n ∧ ∀ z : K,
      (fun w : K ↦ G.eval w)^[n] (a * z + b) =
        a * (fun w : K ↦ F.eval w)^[n] z + b := sorry

/-- Lech–Cassels embedding with finitely many integral marks and arbitrarily large prime. -/
theorem lechIntegralAssembly (L : Type*) [Field L] [Algebra ℚ L]
    [Algebra.EssFiniteType ℚ L] (s : Finset L) (N : ℕ) :
    ∃ p : ℕ, N < p ∧ ∃ _ : Fact p.Prime, ∃ σ : L →+* ℚ_[p],
      ∀ x ∈ s, ‖σ x‖ ≤ 1 := sorry

/-- A nonbranch algebraic constant x-coordinate becomes torsion in infinitely
many smooth algebraic Legendre fibres (DeMarco–Wang–Ye, Theorem 1.2 and its
proof in Section 6.5; README §6.87). -/
theorem legendreTorsionSpecializations_infinite (a : ℂ) (ha : IsAlgebraic ℚ a)
    (ha₀ : a ≠ 0) (ha₁ : a ≠ 1) :
    Set.Infinite {t : ℂ | IsAlgebraic ℚ t ∧ t ≠ 0 ∧ t ≠ 1 ∧
      OnePoint.some a ∈ legendreTorsionImages t} := sorry

/-- Return times to any affine line form finitely many progressions, including when
one or both polynomials are constant (Ghioca–Tucker–Zieve Theorem 1.4; README §6.90). -/
theorem polynomialLine_returnTimes {K : Type*} [Field K] [CharZero K]
    (F G : K[X]) (x y A B C : K) (hline : A ≠ 0 ∨ B ≠ 0) :
    IsFiniteUnionAP {n : ℕ | A * (fun z : K ↦ F.eval z)^[n] x +
      B * (fun z : K ↦ G.eval z)^[n] y = C} := sorry

/-- Distinct smooth Legendre curves have uniformly bounded common standard
projected torsion sets, including infinity (DeMarco–Krieger–Ye, arXiv v2,
Theorem 1.4; README §6.111). Finiteness is asserted separately because the
natural cardinal of an infinite set is zero. -/
theorem uniformLegendreCommonTorsion :
    ∃ B : ℕ, ∀ t₁ t₂ : ℂ, t₁ ≠ 0 → t₁ ≠ 1 → t₂ ≠ 0 → t₂ ≠ 1 → t₁ ≠ t₂ →
      (legendreTorsionImages t₁ ∩ legendreTorsionImages t₂).Finite ∧
      (legendreTorsionImages t₁ ∩ legendreTorsionImages t₂).ncard ≤ B := sorry

open scoped Classical in
/-- Two smooth complex Weierstrass curves whose standard projections have
exactly three common branch values have uniformly bounded common projected
torsion sets (DeMarco–Krieger–Ye, Corollary 8.2; README §6.112). -/
theorem uniformThreeBranchCommonTorsion :
    ∃ B : ℕ, ∀ (W₁ W₂ : WeierstrassCurve ℂ) [W₁.IsElliptic] [W₂.IsElliptic]
      (A₁ A₂ : Matrix.GeneralLinearGroup (Fin 2) ℂ),
      let π₁ := ellipticStandardProjection W₁ A₁
      let π₂ := ellipticStandardProjection W₂ A₂
      ((π₁ '' {P : W₁.toAffine.Point | 2 • P = 0}) ∩
        (π₂ '' {P : W₂.toAffine.Point | 2 • P = 0})).ncard = 3 →
      let S := (π₁ '' {P : W₁.toAffine.Point | IsOfFinAddOrder P}) ∩
        (π₂ '' {P : W₂.toAffine.Point | IsOfFinAddOrder P})
      S.Finite ∧ S.ncard ≤ B := sorry

end TauCetiRoadmap.ArithmeticDynamics
