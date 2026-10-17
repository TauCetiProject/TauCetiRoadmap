import Mathlib

/-!
# PerfectoidQuotients: representative target signatures

The mathematical roadmap is README.md. This file records definitions and theorem
signatures statable against the pinned Mathlib APIs and is not exhaustive.
Ambient root closure keeps its actual subring and localization. Characteristic-p
quotients use the actual perfect-ring, radical and inverse-Frobenius interfaces.
The integral-perfectoid predicate and universal perfectoidization have a single
owner, PerfectoidSpaces; targets on those unavailable supplier carriers remain
in the README, as do the finite Witt maps and the derived and almost constructions.
-/

namespace TauCetiRoadmap.PerfectoidQuotients
noncomputable section
universe u v

/-! ## Layer 0: integral perfectoid algebra -/

/-! ### §0.0: concrete witnesses for the Tor and δ-extension Checks

The full theorems need the suppliers' derived, perfectoid and δ carriers and
are stated in the README. These examples retain actual polynomial and Witt
carriers; they do not replace a derived tensor or a p-derivation by a predicate.
-/

-- perfectoidTensorHypothesis: the free resolution differential is injective
-- before specializing X to zero; after specialization the differential is zero.
example : Function.Injective (fun f : Polynomial (ZMod 2) => Polynomial.X * f) := by sorry

example :
    (Polynomial.evalRingHom (0 : ZMod 2)) (Polynomial.X : Polynomial (ZMod 2)) = 0 ∧
      (1 : ZMod 2) ≠ 0 := by sorry

-- fontaineSquareCharP: the characteristic-p Fontaine resolution stays exact.
example (p : ℕ) [Fact p.Prime] (k : Type*) [CommRing k]
    [CharP k p] [PerfectRing k p] :
    Function.Injective (fun x : WittVector p k => (p : WittVector p k) * x) := by sorry

-- deltaEtaleIdentity: the canonical Witt Frobenius fixes 2, and δ(2)=-1.
-- This is the numerator identity, without pretending there is a pinned δ carrier.
example :
    WittVector.frobenius (2 : WittVector 2 (ZMod 2)) = 2 ∧
      (2 : WittVector 2 (ZMod 2)) - 2 ^ 2 = 2 * (-1) := by sorry

-- deltaEtaleHypothesis: two lifts agree modulo 2 but differ over the integers.
example :
    (Polynomial.X ^ 2 : Polynomial ℤ) ≠ Polynomial.X ^ 2 + 2 ∧
      Polynomial.map (Int.castRingHom (ZMod 2))
        (Polynomial.X ^ 2 : Polynomial ℤ) =
      Polynomial.map (Int.castRingHom (ZMod 2))
        (Polynomial.X ^ 2 + 2 : Polynomial ℤ) := by sorry

-- deltaWittKernel: V(C) need not be square zero in mixed characteristic.
example :
    ((WittVector.verschiebung (1 : WittVector 2 ℤ)) ^ 2).coeff 1 = 2 := by sorry

-- The truncated Witt ring is not its pair of ghost coordinates over F₂.
example :
    (2 : TruncatedWittVector 2 2 (ZMod 2)) ≠ 0 ∧
      (2 : TruncatedWittVector 2 2 (ZMod 2)) ^ 2 = 0 := by sorry

section IntegralAlgebra
variable (p : ℕ) [Fact p.Prime]
variable (R : Type u) [CommRing R]

section Units
variable [hchar : CharP R p]
include hchar

-- BMS1 Lemma 3.10: detection in the inverse perfection, not direct perfection.
/-- A unit in inverse perfection is detected by its zeroth coordinate, without surjective Frobenius on R. -/
theorem perfection_isUnit_iff (x : Perfection R p) :
    IsUnit x ↔ IsUnit (Perfection.coeff R p 0 x) := by sorry

-- General-ring replacement for the pinned field-only Witt unit criterion.
/-- A Witt vector over a perfect characteristic-p ring is a unit exactly when its constant coordinate is. -/
theorem witt_isUnit_iff [PerfectRing R p] (x : WittVector p R) :
    IsUnit x ↔ IsUnit (x.coeff 0) := by sorry

/-- In characteristic p, Witt coordinate one of a product is x₀^p y₁ + x₁ y₀^p. -/
theorem witt_mul_coeff_one (x y : WittVector p R) :
    (x * y).coeff 1 = x.coeff 0 ^ p * y.coeff 1 +
      x.coeff 1 * y.coeff 0 ^ p := by sorry

-- wittPNonunit
example [PerfectRing R p] : ¬ IsUnit (p : WittVector p R) := by sorry
-- wittOnePlusPUnit
example [PerfectRing R p] : IsUnit (1 + p : WittVector p R) := by sorry
-- tiltUnit
example (x : Perfection R p) (h : Perfection.coeff R p 0 x = 1) :
    IsUnit x := by sorry
/-- At p=2 the first two coordinates of p are (0,1), and p² has coordinate one zero. -/
example :
    (2 : WittVector 2 (ZMod 2)).coeff 0 = 0 ∧
      (2 : WittVector 2 (ZMod 2)).coeff 1 = 1 ∧
      ((2 : WittVector 2 (ZMod 2)) ^ 2).coeff 1 = 0 := by sorry

/-- The Witt coordinate of p[T] is T², while its first Teichmüller digit is T. -/
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let t : A := PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X
    ((2 : WittVector 2 A) * WittVector.teichmuller 2 t).coeff 1 = t ^ 2 := by sorry

end Units

section CharacteristicP
variable [hchar : CharP R p] [Fact (¬ IsUnit (p : R))]
variable [IsAdicComplete (Ideal.span {(p : R)}) R]
include hchar

-- The theta modulo p formula is the existing WittVector.mk_fontaineTheta.

/-- In characteristic p, a principal Fontaine kernel is (p), without an extra Frobenius-surjectivity premise. -/
theorem theta_kernel_charP
    (h : ∃ ξ : WittVector p (PreTilt R p),
      RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    RingHom.ker (WittVector.fontaineTheta R p) =
      Ideal.span {(p : WittVector p (PreTilt R p))} := by sorry

/-- A principal Fontaine kernel in characteristic p makes the zeroth tilt projection injective. -/
theorem tilt_projection_injective_charP
    (h : ∃ ξ : WittVector p (PreTilt R p),
      RingHom.ker (WittVector.fontaineTheta R p) = Ideal.span {ξ}) :
    Function.Injective (PreTilt.coeff (O := R) (p := p) 0) := by sorry

end CharacteristicP

section Naturality
variable [Fact (¬ IsUnit (p : R))]
variable [IsAdicComplete (Ideal.span {(p : R)}) R]
variable (S : Type v) [CommRing S] [Fact (¬ IsUnit (p : S))]
variable [IsAdicComplete (Ideal.span {(p : S)}) S]
variable (f : R →+* S) (g : ModP R p →+* ModP S p)
variable (hg : g.comp (Ideal.Quotient.mk (Ideal.span {(p : R)})) =
  (Ideal.Quotient.mk (Ideal.span {(p : S)})).comp f)
include hg

/-- Sharp commutes with a ring map and its explicitly compatible reduction modulo p. -/
theorem untilt_natural (x : PreTilt R p) :
    f x.untilt = PreTilt.untilt (O := S) (p := p) (Perfection.map p g x) := by sorry

/-- Fontaine’s map commutes with the induced Witt map of tilts. -/
theorem theta_natural (x : WittVector p (PreTilt R p)) :
    f (WittVector.fontaineTheta R p x) =
      WittVector.fontaineTheta S p (WittVector.map (Perfection.map p g) x) := by sorry
end Naturality

/-- The length-zero Witt ring has only the zero element. -/
example (x : TruncatedWittVector 2 0 ℤ) : x = 0 := by sorry

/-- The length-two Frobenius convention uses x₀^p + p x₁, whose value is 3 on (1,1) over ℤ at p=2. -/
example :
    (WittVector.frobenius (WittVector.mk 2 (fun n => if n < 2 then (1 : ℤ) else 0))).coeff 0 = 3 := by sorry

/-- The same coefficient formula over F₂ discards the second coordinate. -/
example :
    (WittVector.frobenius (WittVector.mk 2 (fun n => if n = 1 then (1 : ZMod 2) else 0))).coeff 0 = 0 := by sorry

-- finiteThetaSharpConvention
/-- The Teichmüller representative of T has coordinates (T,0), as does θ₂([a]) when a♯=T. -/
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let t : A := PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X
    (WittVector.teichmuller 2 t).coeff 0 = t ∧
      (WittVector.teichmuller 2 t).coeff 1 = 0 := by sorry

/-- A generator with sharp equal to 2 fixes the minus sign in [a]−2: changing it to plus gives 4. -/
example [CharZero R] (a : PreTilt R 2) [Fact (¬ IsUnit (2 : R))]
    [IsAdicComplete (Ideal.span {(2 : R)}) R] (ha : a.untilt = 2) :
    WittVector.fontaineTheta R 2 (WittVector.teichmuller 2 a - 2) = 0 ∧
      WittVector.fontaineTheta R 2 (WittVector.teichmuller 2 a + 2) = 4 ∧
      (4 : R) ≠ 0 := by sorry

end IntegralAlgebra

namespace Witt
variable (p : ℕ) [Fact p.Prime]
variable {k : Type*} [CommRing k] [CharP k p] [PerfectRing k p]

/-- All p-power torsion in this quotient is killed by p. -/
theorem witt_principal_quotient_p_torsion (xi : WittVector p k)
    (hxi : IsUnit (xi.coeff 1)) (n : ℕ)
    (x : WittVector p k ⧸ Ideal.span {xi})
    (hx : (p : WittVector p k ⧸ Ideal.span {xi}) ^ n * x = 0) :
    (p : WittVector p k ⧸ Ideal.span {xi}) * x = 0 := by sorry

-- witt_torsion_prime_detection
example (g : WittVector p k) :
    ((p : WittVector p k) ^ 2 ∣ (p : WittVector p k) * g) ↔
      (p : WittVector p k) ∣ g := by sorry

-- witt_torsion_quotient_by_prime
example (x : WittVector p k ⧸ Ideal.span {(p : WittVector p k)}) :
    (p : WittVector p k ⧸ Ideal.span {(p : WittVector p k)}) * x = 0 := by sorry

-- Negative control: omitting the first-coordinate condition admits W(F_2)/(4).
-- witt_torsion_hypothesis_required
example [Fact (Nat.Prime 2)] :
    let A := WittVector 2 (ZMod 2)
    let I : Ideal A := Ideal.span {(2 : A) ^ 2}
    (2 : A ⧸ I) ^ 2 * (1 : A ⧸ I) = 0 ∧
      (2 : A ⧸ I) * (1 : A ⧸ I) ≠ 0 := by sorry


end Witt

section ClosureAndOperations
variable (p : ℕ) [Fact p.Prime]
/-- The infimum formulation equals the successive root-adjunction union. -/
def pIntegralClosure (B : Type u) [CommRing B] (A : Subring B) : Subring B :=
  sInf {C : Subring B | A ≤ C ∧ ∀ b : B, b ^ p ∈ C → b ∈ C}

variable (B : Type u) [CommRing B] (A : Subring B)
/-- The source subring lies in its ambient p-integral closure. -/
theorem pIntegralClosure.le : A ≤ pIntegralClosure p B A := by sorry

/-- The ambient p-integral closure is closed under pth roots inside B. -/
theorem pIntegralClosure.isClosed (b : B) (h : b ^ p ∈ pIntegralClosure p B A) :
    b ∈ pIntegralClosure p B A := by sorry

/-- Root closure is contained in every root-closed intermediate subring containing A. -/
theorem pIntegralClosure.minimal (C : Subring B) (hAC : A ≤ C)
    (hC : ∀ b : B, b ^ p ∈ C → b ∈ C) : pIntegralClosure p B A ≤ C := by sorry

-- pClosureIdentity
example (h : ∀ b : B, b ^ p ∈ A → b ∈ A) : pIntegralClosure p B A = A := by sorry
-- pClosureZero
example : pIntegralClosure p (ZMod 1) ⊥ = ⊤ := by sorry

/-- The actual polynomial subring F₂[T^n] inside F₂[T]. -/
private def powerPolynomialSubring (n : ℕ) : Subring (Polynomial (ZMod 2)) :=
  (Polynomial.eval₂RingHom (Polynomial.C : ZMod 2 →+* Polynomial (ZMod 2))
    (Polynomial.X ^ n)).range

-- pClosureRoot
/-- The subring generated by T¹ already contains every polynomial; this fixes the ambient polynomial model. -/
example : powerPolynomialSubring 1 = ⊤ := by sorry

example : pIntegralClosure 2 (Polynomial (ZMod 2)) (powerPolynomialSubring 2) = ⊤ := by sorry
-- pClosureNotOrdinary
example :
    pIntegralClosure 2 (Polynomial (ZMod 2)) (powerPolynomialSubring 3) =
      powerPolynomialSubring 3 ∧
    (integralClosure (powerPolynomialSubring 3) (Polynomial (ZMod 2))).toSubring = ⊤ ∧
    powerPolynomialSubring 3 ≠ ⊤ := by sorry

end ClosureAndOperations

section RootClosure
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]

/-- For regular π, the kernel condition for R/(π) → R/(π^p) is ambient p-root closedness in R[1/π]. -/
theorem perfectoid_p_integral_closedness (π : R)
    (hπ : ∃ a : R, π ^ p * a = (p : R))
    (hreg : ∀ x : R, π * x = 0 → x = 0) :
    (∀ x : R, π ^ p ∣ x ^ p → π ∣ x) ↔
      ∀ b : Localization.Away π,
        b ^ p ∈ (algebraMap R (Localization.Away π)).range →
        b ∈ (algebraMap R (Localization.Away π)).range := by sorry

/-- At π=1 all representatives satisfy the quotient-kernel condition and localization changes nothing. -/
example :
    (∀ x : ℤ, (1 : ℤ) ^ 2 ∣ x ^ 2 → (1 : ℤ) ∣ x) ∧
    (∀ b : Localization.Away (1 : ℤ),
      b ^ 2 ∈ (algebraMap ℤ (Localization.Away (1 : ℤ))).range →
      b ∈ (algebraMap ℤ (Localization.Away (1 : ℤ))).range) := by sorry

/-- At π=0 over F₂ the power map modulo zero is the identity. -/
example : Function.Bijective (fun x : ZMod 2 => x ^ 2) := by sorry

-- quotientPowerDirection
/-- The class of T modulo T² has no square preimage over F₂, so the cross-quotient power map is not surjective. -/
example :
    let R := Polynomial (ZMod 2)
    let I : Ideal R := Ideal.span {(Polynomial.X : R) ^ 2}
    ¬ ∃ f : R, Ideal.Quotient.mk I (f ^ 2) =
      Ideal.Quotient.mk I Polynomial.X := by sorry

end RootClosure

-- rootQuotientUnitGenerator
/-- A root of X²+X+1 in characteristic two is a unit and is not fixed by squaring. -/
example {k : Type*} [Field k] [CharP k 2] (ω : k)
    (hω : ω ^ 2 + ω + 1 = 0) :
    IsUnit ω ∧ ω ^ 2 ≠ ω := by sorry

/-- In cohomological notation M[1] has M in degree −1 and zero in degree 0. -/
example :
    let M := ModuleCat.of ℤ ℤ
    let K := (HomologicalComplex.single (ModuleCat ℤ) (ComplexShape.up ℤ) 0).obj M
    ((CochainComplex.shiftFunctor (ModuleCat ℤ) 1).obj K).X (-1) = M ∧
      CategoryTheory.Limits.IsZero (((CochainComplex.shiftFunctor (ModuleCat ℤ) 1).obj K).X 0) := by sorry

/-! ## Layer 1: relative covers and almost root extensions -/

-- rootNeighborhoodZeroRadiusIndex
/-- Two elements of the nonarchimedean unit ball differ by an element of the unit ball, giving U₀=Y. -/
example {K : Type*} [NormedField K] [IsUltrametricDist K]
    (x y : K) (hx : ‖x‖ ≤ 1) (hy : ‖y‖ ≤ 1) :
    ‖x - y‖ ≤ 1 := by sorry

/-- At a rank-one point T=t, the radii t and t² put U₂ inside U₁. -/
example {K : Type*} [NormedField K] (t : K) (hpos : 0 < ‖t‖) (hlt : ‖t‖ < 1) :
    0 < ‖t‖ ^ 2 ∧ ‖t‖ ^ 2 < ‖t‖ := by sorry

/-- At g=1, the point T=0 lies outside the radius-‖t‖ neighborhood. -/
example {K : Type*} [NormedField K] (t : K) (hlt : ‖t‖ < 1) :
    ¬ ‖(0 : K) - 1‖ ≤ ‖t‖ := by sorry

/-- A monic-root assertion excludes the degree-zero monic polynomial 1. -/
example : ¬ ∃ x : ZMod 3, Polynomial.eval x (1 : Polynomial (ZMod 3)) = 0 := by sorry

/-- Compatible cube roots do not supply roots of all monic polynomials: X²+1 has no root in F₃. -/
example : (∀ x : ZMod 3, x ^ 3 = x) ∧ ¬ ∃ x : ZMod 3, x ^ 2 + 1 = 0 := by sorry

/-! ## Layer 2: characteristic-p quotients and radicals -/

section CharacteristicPQuotients
variable (p : ℕ) [Fact p.Prime] (R : Type u) [CommRing R]
section Quotients
variable [hchar : CharP R p]
include hchar

omit hchar in
/-- A surjective power function remains surjective on every ring quotient. -/
theorem quotient_pow_surjective (h : Function.Surjective (fun x : R => x ^ p))
    (I : Ideal R) : Function.Surjective (fun x : R ⧸ I => x ^ p) := by sorry

/-- A quotient of a perfect characteristic-p ring is perfect exactly for radical ideals, including the unit ideal. -/
theorem quotient_perfect_iff_radical [PerfectRing R p] (I : Ideal R) :
    PerfectRing (R ⧸ I) p ↔ I.IsRadical := by sorry

omit hchar in
/-- Every map killing I into a reduced target factors uniquely through the radical quotient. -/
theorem radical_quotient_universal (I : Ideal R)
    (T : Type v) [CommRing T] [IsReduced T]
    (f : R →+* T) (hf : I ≤ RingHom.ker f) :
    ∃! g : R ⧸ I.radical →+* T, g.comp (Ideal.Quotient.mk I.radical) = f := by sorry

/-- The unit ideal gives a zero perfect quotient, without a CharP instance on that quotient. -/
example [PerfectRing R p] : PerfectRing (R ⧸ (⊤ : Ideal R)) p := by sorry

/-- The zero ideal recovers the original perfect ring. -/
example [PerfectRing R p] : PerfectRing (R ⧸ (⊥ : Ideal R)) p := by sorry

/-- A nonradical defining ideal gives a quotient with noninjective Frobenius. -/
example [PerfectRing R p] (I : Ideal R) (h : ¬ I.IsRadical) :
    ¬ PerfectRing (R ⧸ I) p := by sorry

-- EnhancedDerivedSheaves §E1.6 supplies frobeniusRootIdeal_radical.
-- Its zero, unit and quotient cases have concrete pinned-carrier witnesses.
-- rootZero
example [PerfectRing R p] :
    Ideal.span (Set.range (fun n : ℕ => ((frobeniusEquiv R p).symm^[n]) (0 : R))) = ⊥ := by sorry
-- rootOne
example [PerfectRing R p] :
    Ideal.span (Set.range (fun n : ℕ => ((frobeniusEquiv R p).symm^[n]) (1 : R))) = ⊤ := by sorry
-- rootKilled
example [PerfectRing R p] (f : R) (n : ℕ) :
    Ideal.Quotient.mk (Ideal.span {f}).radical
      (((frobeniusEquiv R p).symm^[n]) f) = 0 := by sorry
end Quotients
/-- The first three roots go in the inverse-Frobenius direction: r₀=t, r₁²=t, r₂⁴=t. -/
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let t : A := PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X
    (((frobeniusEquiv A 2).symm^[0]) t) = t ∧
      (((frobeniusEquiv A 2).symm^[1]) t) ^ 2 = t ∧
      (((frobeniusEquiv A 2).symm^[2]) t) ^ 4 = t := by sorry

/-- The nonradical quotient kills t but retains its nonzero square-zero root. -/
example :
    let A := PerfectClosure (Polynomial (ZMod 2)) 2
    let t : A := PerfectClosure.of (Polynomial (ZMod 2)) 2 Polynomial.X
    let I := Ideal.span {t}
    Ideal.Quotient.mk I t = 0 ∧
      Ideal.Quotient.mk I ((frobeniusEquiv A 2).symm t) ≠ 0 ∧
      (Ideal.Quotient.mk I ((frobeniusEquiv A 2).symm t)) ^ 2 = 0 := by sorry

end CharacteristicPQuotients

/- The further README targets are:
§0.0 perfectoid_tor_independence, fontaine_tor_independence,
delta_etale_extension, delta_derivedCompletion for discrete derived completion,
completeEtale_algebraization,
delta_witt2_etale,
perfectPrism_completeEtale_lift, with their hypotheses, proof routes and Checks;
§0.2 finiteFontaineTheta with its API and Checks, using
CrystallineCohomology §CR.4.4's truncatedFrobenius,
frobenius_surjectivity_equivalences, theta_generator_iff_unit_coeff_one,
theta_generator_nonzerodivisor, theta_generator_normal_form,
theta_map_preserves_generator;
§0.3 Witt.witt_p_sq_dvd_mul_detects_p, Witt.witt_principal_p_saturation,
perfectoid_p_torsion_killed_by_p, perfectoid_cotangent_mod_p_vanishes,
perfectoid_absolute_cotangent;
§0.4 compatible_root_annihilator, compatible_root_power_torsion,
perfectoid_torsion_free_quotient with tilt and fibre-product comparisons,
perfectoid_compatible_roots_iterated_frobenius;
§0.5 pIntegralClosure.idempotent, pIntegralClosure.mono,
pIntegralClosure.le_integralClosure, quotientPowerMap with its representative
formula and Checks, completion_pIntegralClosure_perfectoid, and the ordinary
integral-closure completion criterion completion_integrally_closed_perfectoid;
§0.6 perfectoid_completely_etale_henselization,
perfectoid_completed_root_polynomial, perfectoid_completed_tensor,
perfectoid_completed_root_quotient with the tilt ideal lim_F J₁ for the generated
ideal J₁ in A/(ϖ), integralPerfectoid_pi_iff,
perfectoid_sharp_ideal_completion, including their tilt comparisons;
§0.7 bhatt_integral_model_comparison;
§1.1 relative_perfectoid_cover_smooth_site, frobenius_flat_prism_perfection_cover;
§1.2 andre_ind_syntomic_mod_p;
§1.3 bhatt_root_neighborhoods and bhattRootExtension with its API and Checks;
§1.4 bhatt_root_extension_almost_faithfully_flat, monicRootPair with its API and Checks and functorial_almost_aic_extension;
§2.1 radical_quotient_integralPerfectoid, quotient_perfectoid_iff_radical,
and the comparison of the explicit radical quotient with the supplied universal ring. -/

end
end TauCetiRoadmap.PerfectoidQuotients
