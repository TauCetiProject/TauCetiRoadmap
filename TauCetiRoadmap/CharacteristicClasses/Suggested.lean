module

public import Mathlib

/-!
# Characteristic classes and Chern–Weil theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the few definitions those statements need.

Not statable at the pins, and therefore not stated here:
* the Thom isomorphism, the Euler class and the Gysin sequence (C2.1–C2.2):
  there is no Thom-class carrier, no bundle disk/sphere cell structure and
  no orientation local system on a vector bundle at the pins;
* the classification of numerable principal bundles by the join classifier
  `B_join(G)` (C1.1b) and the identification `RP∞≃K(ℤ/2,1)`, `CP∞≃K(ℤ,2)`
  (C1.5a): there is no join classifier and no infinite projective carrier
  with its weak CW topology at the pins;
* the universal rings `H*(BU(r);ℤ)=ℤ[c₁,…,c_r]`, `H*(BO(n);𝔽₂)` and the BSO
  rings away from 2 (C3.4, C3.6): there is no classifying-space or
  universal-bundle carrier, and no Chern, Stiefel–Whitney or Pontryagin
  class, at the pins;
* `e(TM)[M]=χ(M)` (C2.3): there is no Euler class and no fundamental class
  of a manifold at the pins;
* the singular/de Rham Chern–Weil comparison (C4.2), Borel's theorem
  `H*(BG;ℚ)≃H*(BT;ℚ)^W` with the universal Chern–Weil isomorphism (C5.2)
  and the exterior Hopf isomorphism `H*(K;ℚ)=Λ(z₁,…,z_r)` (C5a.5): no
  curvature form on a principal bundle, no Chern–Weil map and no
  classifying space exist at the pins;
* the nonimmersion of `RP^(2^k)` in `ℝ^(2^(k+1)−2)` (C7.3a): there is no
  Stiefel–Whitney class at the pins.

What is statable is the formal-series part of C3.3, C6.1 and C7.1: the
L-series is even, the 2-torsion correction behind the integral Pontryagin
Whitney formula, and the degree-four Todd and degree-eight Hirzebruch
coefficients in Chern and Pontryagin root values.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.CharacteristicClasses

/-- Elementary symmetric values of formal Chern roots: `chernRootValue x j` is
the `j`-th elementary symmetric polynomial evaluated at the roots `x`, the
root expression of `c_j` in C3.4; it is `0` for `j` above the rank. -/
def chernRootValue {A : Type*} [CommRing A] {r : ℕ} (x : Fin r → A) (j : ℕ) : A :=
  MvPolynomial.eval x (MvPolynomial.esymm (Fin r) A j)

/-- Pontryagin root values: the elementary symmetric values of the squares of
the roots, one root per oriented plane (`p(E)=∏(1+x_i²)`, C6.1). -/
def pontryaginRootValue {A : Type*} [CommRing A] {r : ℕ}
    (x : Fin r → A) (j : ℕ) : A :=
  chernRootValue (fun i ↦ x i ^ 2) j

/-- Todd's series `x/(1−e^(−x))`, Mathlib's Bernoulli series with `B'₁=1/2`
(C6.1). -/
abbrev toddSeries : PowerSeries ℚ := bernoulli'PowerSeries ℚ

/-- The L-series `x coth x = x/tanh x`, written without dividing by `x`:
rescaling Todd's series by `2` gives `2x/(1−e^(−2x)) = x coth x + x` (C6.1). -/
def lSeries : PowerSeries ℚ := PowerSeries.rescale 2 toddSeries - PowerSeries.X

/-- C6.1: the L-series is even, so `∏ L(x_i)` descends to the elementary
symmetric polynomials in the `x_i²`, the Pontryagin root values. -/
theorem lSeries_even : PowerSeries.evalNegHom lSeries = lSeries := by
  sorry

/-- C3.3: the 2-torsion correction behind the integral Pontryagin Whitney
formula. If the odd coefficients of `P` are killed by `2`, then twice the
difference between an even coefficient of `P * Q` and the convolution of the
even coefficients of `P` and `Q` vanishes; clean multiplicativity of the even
parts holds after inverting `2`, not integrally. -/
theorem twice_even_product_correction_eq_zero
    {R : Type*} [CommRing R] (P Q : PowerSeries R)
    (hodd : ∀ j : ℕ, 2 * PowerSeries.coeff (2 * j + 1) P = 0) (k : ℕ) :
    2 * (PowerSeries.coeff (2 * k) (P * Q) -
      ∑ i ∈ Finset.range (k + 1),
        PowerSeries.coeff (2 * i) P * PowerSeries.coeff (2 * (k - i)) Q) = 0 := by
  sorry

/-- C7.1: the degree-two coefficient of `∏ Td(x_i T)` is the degree-four Todd
class `(c₁²+c₂)/12` in the Chern root values. The statement is universal over
commutative `ℚ`-algebras and includes ranks below two, where the absent
values are `0`. -/
theorem toddSeries_root_coefficient_two
    {A : Type*} [CommRing A] [Algebra ℚ A] {r : ℕ} (x : Fin r → A) :
    PowerSeries.coeff 2
      (∏ i, PowerSeries.rescale (x i)
        (PowerSeries.map (algebraMap ℚ A) toddSeries)) =
      (1 / 12 : ℚ) • (chernRootValue x 1 ^ 2 + chernRootValue x 2) := by
  sorry

/-- C7.1: the degree-four coefficient of `∏ L(x_i T)` is the degree-eight
Hirzebruch L-class `(7p₂ − p₁²)/45` in the Pontryagin root values. The
statement is universal over commutative `ℚ`-algebras and includes ranks
below two, where the absent values are `0`. -/
theorem lSeries_root_coefficient_four
    {A : Type*} [CommRing A] [Algebra ℚ A] {r : ℕ} (x : Fin r → A) :
    PowerSeries.coeff 4
      (∏ i, PowerSeries.rescale (x i)
        (PowerSeries.map (algebraMap ℚ A) lSeries)) =
      (1 / 45 : ℚ) • (7 * pontryaginRootValue x 2 - pontryaginRootValue x 1 ^ 2) := by
  sorry

end TauCetiRoadmap.CharacteristicClasses
