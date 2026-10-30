import Mathlib

/-!
# Reusable infrastructure for torsion in arithmetic cohomology: headline targets

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. Discharging these statements finishes neither a layer nor the roadmap.

The statements here are the twisted-product separation theorem (§3a.2), uniqueness and
polynomiality of finite-weight factorisations (§3a.3), weighted determinant extraction
(§3a.6), and the Laurent coefficient-ideal nilpotence bound (§3a.7). They use Mathlib's
polynomials, power series, Laurent polynomials, ideals and `PolynomialLaw`. The extraction
statement writes unitality, multiplicativity and homogeneity directly at every scalar
extension; `lawCharpoly` evaluates the native law at `1 − Xg`.

The integral formal-model and boundary-support results of Layer 0, the ordinary
boundary-ideal colimit of Layer 2a, and classical section approximation in Layer 1
cannot be stated at the pins: formal schemes, perfectoid spaces, their compactified
Shimura towers, boundary ideals and Hodge–Tate period maps are absent. The perfectoid
compact-support comparison, middle-degree vanishing, Iwasawa bounds and classical
Hecke continuity of Layer 2 also need the completed arithmetic cohomology carriers
and their geometric Hecke actions.

The Levi interior determinant of §3b.9, the finite and integral torsion determinant
theorems (§§4.3–4.4), four-route compatibility (§4.5), and residual and local
representations (§4.6) need locally symmetric spaces, their Borel–Serre boundaries,
cohomological Hecke images and Satake actions. The classical ambient input also needs
automorphic representations and unitary-similitude base change. These objects are
absent at the pins, so those headline statements remain in the README. A polynomial
law alone does not supply their arithmetic hypotheses or coefficient rings.
-/

namespace TauCetiRoadmap.TorsionCohomologyInfrastructure

open Polynomial
open scoped TensorProduct

universe u v

section WeightedProduct

variable {R : Type*} [CommRing R]

/-- The twisted product `P(u⁻¹X) · Q(uX)`, which records the opposite character weights by which a
Levi factor and its dual are separated (Scholze, proof of Lemma 5.3.4, pp.1048–1049). -/
noncomputable def weightedProduct (P Q : R[X]) (u : Rˣ) : R[X] :=
  P.comp (C (↑(u⁻¹) : R) * X) * Q.comp (C (↑u : R) * X)

/-- **Twisted-product separation.** Over any commutative ring, two factorisations into polynomials
of degree at most `n` with constant term `1` that agree untwisted and twisted by `u` are equal,
provided every `1 - u ^ (2j)`, `1 ≤ j ≤ n`, is a unit (Scholze, proof of Lemma 5.3.4,
pp.1048–1049). -/
theorem twisted_product_separation (n : ℕ) (u : Rˣ) (P Q P' Q' : R[X])
    (hP : P.natDegree ≤ n) (hQ : Q.natDegree ≤ n) (hP' : P'.natDegree ≤ n)
    (hQ' : Q'.natDegree ≤ n) (hcP : P.coeff 0 = 1) (hcQ : Q.coeff 0 = 1)
    (hcP' : P'.coeff 0 = 1) (hcQ' : Q'.coeff 0 = 1) (hprod : P * Q = P' * Q')
    (htwist : weightedProduct P Q u = weightedProduct P' Q' u)
    (hsep : ∀ j : ℕ, 1 ≤ j → j ≤ n → IsUnit (1 - (↑u : R) ^ (2 * j))) :
    P = P' ∧ Q = Q' := by
  sorry

end WeightedProduct

section FiniteWeight

variable {S : Type*} [CommRing S]

/-- `weightSubst m F` is the series `F(T^m X)`, with coefficients in `S[T;T⁻¹]`. -/
noncomputable def weightSubst (m : ℤ) (F : PowerSeries S) : PowerSeries (LaurentPolynomial S) :=
  PowerSeries.rescale (LaurentPolynomial.T m) (PowerSeries.map LaurentPolynomial.C F)

/-- **Uniqueness of finite-weight factorisations** (Scholze, Lemma 5.3.10, pp.1053–1054): for a
finite set of distinct weights, the factors `Q m` with constant term `1` are determined by the
product of the `Q m (T^m X)`. -/
theorem finiteWeight_factorization_unique (M : Finset ℤ) (Q Q' : ℤ → PowerSeries S)
    (hQ : ∀ m ∈ M, PowerSeries.constantCoeff (Q m) = 1)
    (hQ' : ∀ m ∈ M, PowerSeries.constantCoeff (Q' m) = 1)
    (h : ∏ m ∈ M, weightSubst m (Q m) = ∏ m ∈ M, weightSubst m (Q' m)) :
    ∀ m ∈ M, Q m = Q' m := by
  sorry

/-- **Polynomiality** (Scholze, Lemma 5.3.10, pp.1053–1054): if the product is a polynomial in `X`
with Laurent coefficients, every factor is a polynomial. -/
theorem finiteWeight_factorization_polynomial (M : Finset ℤ) (Q : ℤ → PowerSeries S)
    (hQ : ∀ m ∈ M, PowerSeries.constantCoeff (Q m) = 1)
    (hpoly : ∃ F : Polynomial (LaurentPolynomial S),
      (F : PowerSeries (LaurentPolynomial S)) = ∏ m ∈ M, weightSubst m (Q m)) :
    ∀ m ∈ M, ∃ q : Polynomial S, (q : PowerSeries S) = Q m := by
  sorry

end FiniteWeight

/-- Evaluation of a group-algebra polynomial law at `1 − Xg`, with scalar-valued output. -/
noncomputable def lawCharpoly {R : Type u} [CommRing R] {G : Type v} [Group G]
    (D : MonoidAlgebra R G →ₚₗ[R] R) (g : G) : R[X] :=
  TensorProduct.rid R R[X]
    (D.toFun' R[X] (1 - X ⊗ₜ[R] MonoidAlgebra.single g 1))

/-- **Weighted determinant extraction** (README §3a.6; Scholze, Lemma 5.3.8 and
Remark 5.3.9, pp.1052–1057). An ambient homogeneous multiplicative law on `G × ℤ`
with the prescribed weighted characteristic polynomials determines a unique homogeneous
multiplicative law on `G` of each prescribed degree. Unitality, multiplicativity and
homogeneity are imposed after every scalar extension, including nonreduced rings. -/
theorem weightedDeterminantFactors {R : Type u} [CommRing R] {G : Type v} [Group G]
    (M : Finset ℤ) (n : ℤ → ℕ) (P : ℤ → G → R[X])
    (hdegree : ∀ m ∈ M, ∀ g, (P m g).natDegree ≤ n m)
    (hconstant : ∀ m ∈ M, ∀ g, (P m g).coeff 0 = 1)
    (D : MonoidAlgebra (LaurentPolynomial R) (G × Multiplicative ℤ) →ₚₗ[LaurentPolynomial R]
      LaurentPolynomial R)
    (hD : ∀ (S : Type u) [CommRing S] [Algebra (LaurentPolynomial R) S],
      D.toFun' S 1 = 1 ∧
      (∀ x y, D.toFun' S (x * y) = D.toFun' S x * D.toFun' S y) ∧
      (∀ (s : S) x, D.toFun' S (s • x) = s ^ (∑ m ∈ M, n m) • D.toFun' S x))
    (hchar : ∀ (g : G) (k : ℤ), lawCharpoly D (g, Multiplicative.ofAdd k) =
      ∏ m ∈ M, ((P m g).map LaurentPolynomial.C).comp
        (C (LaurentPolynomial.T (k * m)) * X)) :
    ∀ m ∈ M, ∃! Dm : MonoidAlgebra R G →ₚₗ[R] R,
      (∀ (S : Type u) [CommRing S] [Algebra R S],
        Dm.toFun' S 1 = 1 ∧
        (∀ x y, Dm.toFun' S (x * y) = Dm.toFun' S x * Dm.toFun' S y) ∧
        (∀ (s : S) x, Dm.toFun' S (s • x) = s ^ n m • Dm.toFun' S x)) ∧
      ∀ g, lawCharpoly Dm g = P m g := by
  sorry

section LaurentCoefficientIdeal

variable {R : Type*} [CommRing R]

/-- The substitution `T ↦ T ^ a` on Laurent polynomials. -/
noncomputable def laurentSubst (a : ℤ) : LaurentPolynomial R →+* LaurentPolynomial R :=
  AddMonoidAlgebra.mapDomainRingHom R (AddMonoidHom.mulLeft a)

/-- The largest ideal `I' = ⋂_a {f | f(T^a) ∈ I}` whose substitutions all lie in `I`. -/
noncomputable def substStableIdeal (I : Ideal (LaurentPolynomial R)) :
    Ideal (LaurentPolynomial R) :=
  ⨅ a : ℤ, I.comap (laurentSubst a)

/-- The ideal of `R` generated by the Laurent coefficients of the elements of `I'`. -/
def laurentCoeffIdeal (I : Ideal (LaurentPolynomial R)) : Ideal R :=
  Ideal.span {c | ∃ f ∈ substStableIdeal I, ∃ k : ℤ, f.coeff k = c}

/-- **Laurent coefficient-ideal bound** (Scholze, proof of Lemma 5.3.7, pp.1051–1052): the
coefficient ideal keeps the nilpotence exponent of `I`. -/
theorem laurentCoeffIdeal_pow_eq_bot (I : Ideal (LaurentPolynomial R)) {N : ℕ} (hN : 1 ≤ N)
    (hI : I ^ N = ⊥) : laurentCoeffIdeal I ^ N = ⊥ := by
  sorry

end LaurentCoefficientIdeal

end TauCetiRoadmap.TorsionCohomologyInfrastructure
