import Mathlib

/-!
# Characteristic classes and Chern–Weil theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the few definitions those statements need.

Not statable at the pins, and therefore not stated here:
* the Thom isomorphism and the Euler class (C2.1–C2.2): there is no
  Thom-class carrier, no bundle disk/sphere cell structure and no
  orientation local system on a vector bundle at the pins;
* the universal rings `H*(BU(r);ℤ)=ℤ[c₁,…,c_r]`, `H*(BO(n);𝔽₂)` and the
  BSO rings (C3.4, C3.6): there is no classifying-space or universal-bundle
  carrier, and no Chern or Stiefel–Whitney class, at the pins;
* `e(TM)[M]=χ(M)` (C2.3) and the Euler-pullback identity for a self-map:
  there is no Euler class or fundamental class of a manifold at the pins;
* Borel's theorem `H*(BG;ℚ)≃H*(BT;ℚ)^W` and the universal Chern–Weil
  isomorphism (C5.2): no classifying space and no Chern–Weil map exist at
  the pins;
* the singular/de Rham Chern–Weil comparison (C4.2): no characteristic
  class, curvature form or de Rham comparison for bundles at the pins.

What is statable is the formal-series part of C3.3 and C7.1: the
degree-twelve coefficient of the Hirzebruch L-series in Pontryagin root
values, and the 2-torsion correction behind the integral Pontryagin
Whitney formula.
-/

noncomputable section
namespace TauCetiRoadmap.CharacteristicClasses

/-- Elementary symmetric values of formal Chern roots: `chernRootValue x j` is
the `j`-th elementary symmetric polynomial evaluated at the roots `x`. -/
def chernRootValue {A : Type*} [CommRing A] {r : ℕ} (x : Fin r → A) (j : ℕ) : A :=
  MvPolynomial.eval x (MvPolynomial.esymm (Fin r) A j)

/-- Pontryagin root values: the elementary symmetric values of the squares of
the roots, one root per oriented plane (`p(E)=∏(1+x_i²)`). -/
def pontryaginRootValue {A : Type*} [CommRing A] {r : ℕ}
    (x : Fin r → A) (j : ℕ) : A :=
  chernRootValue (fun i ↦ x i ^ 2) j

/-- Todd's series `x/(1−e^(−x))`, Mathlib's Bernoulli series with `B'₁=1/2`. -/
abbrev toddSeries : PowerSeries ℚ := bernoulli'PowerSeries ℚ

/-- The L-series `x coth x = x/tanh x`, written without dividing by `x`:
rescaling Todd's series by `2` gives `2x/(1−e^(−2x)) = x coth x + x`. -/
def lSeries : PowerSeries ℚ := PowerSeries.rescale 2 toddSeries - PowerSeries.X

/-- C7.1: the degree-six coefficient of `∏ L(x_i T)` is the degree-twelve
Hirzebruch L-class `(62p₃ − 13p₁p₂ + 2p₁³)/945` in the Pontryagin root values
(Milnor–Stasheff §19). The statement is universal over commutative
`ℚ`-algebras and includes ranks below three, where the absent values are `0`. -/
theorem lSeries_root_coefficient_six
    {A : Type*} [CommRing A] [Algebra ℚ A] {r : ℕ} (x : Fin r → A) :
    PowerSeries.coeff 6
      (∏ i, PowerSeries.rescale (x i)
        (PowerSeries.map (algebraMap ℚ A) lSeries)) =
      (1 / 945 : ℚ) •
        (62 * pontryaginRootValue x 3 -
          13 * pontryaginRootValue x 1 * pontryaginRootValue x 2 +
          2 * pontryaginRootValue x 1 ^ 3) := by
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

end TauCetiRoadmap.CharacteristicClasses
