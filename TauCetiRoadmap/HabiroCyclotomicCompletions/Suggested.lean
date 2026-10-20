import Mathlib

/-!
# Habiro cyclotomic completions: representative target signatures

This file is not the roadmap and is not exhaustive. README.md is definitive;
these declarations give suggested forms for definitions and milestone theorems
on the pinned Mathlib and Tau Ceti carriers. Only light definitions on existing
polynomial carriers are retained. The completion objects, completed Taylor maps, exactness theorem,
matrices and arithmetic applications remain README targets until their native
carriers have been formalised. A finite polynomial identity below is an ingredient
of those targets, not a replacement for a completed statement.

The conventions are `P_N = ∏_{i=1}^N (1-q^i)`, additive Taylor variable `q-ζ`,
and multiplicative Taylor variable `q = ζ(1-u)`. All finite identities allow
arbitrary commutative coefficient rings unless a hypothesis says otherwise.
-/

noncomputable section

open scoped Classical
open Polynomial

namespace TauCetiRoadmap.HabiroCyclotomicCompletions

/-! ## Layer 1: finite q-calculus and factorial ideals -/

namespace QToolkit

-- AInfCohomology §AI.3.3 supplies qInteger and qInteger_mul_sub_one.
/-- Polynomial specialization of AInfCohomology's q-integer finite-sum formula. -/
abbrev qInteger (R : Type*) [CommRing R] (n : ℕ) : R[X] :=
  ∑ i ∈ Finset.range n, X ^ i

/-- The product of the first n positive q-integers, with empty value one. -/
def qFactorial (R : Type*) [CommRing R] (n : ℕ) : R[X] :=
  ∏ i ∈ Finset.range n, qInteger R (i + 1)

/-- Finite multiplicative q-shifts in any commutative ring. -/
def pochhammer {A : Type*} [CommRing A] (x q : A) (n : ℕ) : A :=
  ∏ i ∈ Finset.range n, (1 - x * q ^ i)

-- These checks distinguish an integral polynomial from a quotient at q=1.
example : qInteger ℤ 0 = 0 ∧ qInteger ℤ 1 = 1 ∧
    qInteger ℤ 3 = 1 + X + X ^ 2 := by
  norm_num [qInteger, Finset.sum_range_succ]

example : (qInteger (ZMod 2) 2).eval 1 = 0 ∧
    (qInteger ℤ 3).eval 1 = 3 ∧ (qInteger (ZMod 3) 3).eval 1 = 0 := by
  norm_num [qInteger, Finset.sum_range_succ]
  decide

example : qFactorial ℤ 0 = 1 ∧ qFactorial ℤ 3 =
    (1 + X) * (1 + X + X ^ 2) := by
  norm_num [qFactorial, qInteger, Finset.prod_range_succ, Finset.sum_range_succ]

example : (qFactorial ℤ 3).eval 1 = 6 ∧
    (qFactorial (ZMod 2) 2).eval 1 = 0 := by
  norm_num [qFactorial, qInteger, Finset.prod_range_succ, Finset.sum_range_succ]
  decide

example {A : Type*} [CommRing A] (x q : A) :
    pochhammer x q 0 = 1 ∧ pochhammer x q 1 = 1 - x ∧
    pochhammer x q 2 = (1 - x) * (1 - x * q) ∧
    pochhammer x (1 : A) 3 = (1 - x) ^ 3 := by
  simp [pochhammer, Finset.prod_range_succ]

example : pochhammer (2 : ℤ) 3 3 = -85 ∧
    pochhammer (1 : ℤ) 3 2 = 0 := by
  norm_num [pochhammer, Finset.prod_range_succ]

-- O, Definition 1.1 p.2 and Table 1 / Proposition 2.1 p.7;
-- README §1.1 gives the finite-product induction and coefficient convention.
/-- Clearing q-factorial denominators gives the finite factorial product integrally. -/
theorem qFactorial_pochhammer (R : Type*) [CommRing R] (n : ℕ) :
    (1 - X) ^ n * qFactorial R n = pochhammer (X : R[X]) X n := sorry

-- No division by t or 1-q: this also works in characteristic two.
/-- Coefficientwise Jackson derivative; neither `t` nor `1-q` is inverted. -/
def jackson {A : Type*} [CommRing A] (q : A) (f : A[X]) : A[X] :=
  ∑ k ∈ Finset.range f.natDegree,
    C (f.coeff (k + 1) * (qInteger A (k + 1)).eval q) * X ^ k

/-- Jackson derivative scaled by `1-q`; its monomial factor is `1-q^n`. -/
def adaptedJackson {A : Type*} [CommRing A] (q : A) (f : A[X]) : A[X] :=
  C (1 - q) * jackson q f

example {A : Type*} [CommRing A] (q : A) :
    jackson q (X ^ 2) = C (1 + q) * X ∧
    jackson (2 : ℤ) (X ^ 2) = 3 * X ∧
    jackson (1 : ℤ) (X ^ 2) = 2 * X ∧ jackson (2 : ℤ) 1 = 0 ∧
    jackson (1 : ℤ) (X ^ 3) = 3 * X ^ 2 := by
  constructor
  · nontriviality A
    norm_num [jackson, qInteger, Finset.sum_range_succ]
  · norm_num [jackson, qInteger, Finset.sum_range_succ]

example : jackson (1 : ZMod 2) (X ^ 2) = 0 := by
  norm_num [jackson, qInteger, Finset.sum_range_succ]
  decide

example : adaptedJackson (2 : ℤ) (X ^ 2) = -3 * X ∧
    adaptedJackson (2 : ℤ) 1 = 0 ∧
    adaptedJackson (0 : ℤ) (X ^ 3) = X ^ 2 := by
  norm_num [adaptedJackson, jackson, qInteger, Finset.sum_range_succ]

example : adaptedJackson (1 : ℤ) (X ^ 2) = 0 ∧
    jackson (1 : ℤ) (X ^ 2) ≠ 0 := by
  norm_num [adaptedJackson, jackson, qInteger, Finset.sum_range_succ]

-- O, Table 1 p.7; the full series initial-value statements remain in README §1.1.
/-- The Jackson derivative obeys the product rule with q-dilation on the second term. -/
theorem jackson_leibniz {A : Type*} [CommRing A] (q : A) (f g : A[X]) :
    jackson q (f * g) = jackson q f * g + f.comp (C q * X) * jackson q g := sorry

/-- At `q=1` the ordinary Jackson derivative is the polynomial derivative. -/
theorem jackson_at_one {A : Type*} [CommRing A] (f : A[X]) :
    jackson (1 : A) f = f.derivative := sorry

end QToolkit

-- README §§1.2–1.4: actual polynomial indices.
/-- The submonoid of actual cyclotomic products, allowing coincident factors. -/
def cycloIndex (R : Type*) [CommRing R] (S : Set ℕ) : Submonoid R[X] :=
  Submonoid.closure ((fun n => cyclotomic n R) '' S)

/-- The factorial polynomial `P_N = ∏_{i=1}^N (1-X^i)`, with `P_0 = 1`. -/
def factorialPoly (R : Type*) [CommRing R] (N : ℕ) : R[X] :=
  QToolkit.pochhammer (X : R[X]) X N

example (R : Type*) [CommRing R] : cycloIndex R ∅ = ⊥ := by
  simp [cycloIndex]

example : cycloIndex ℤ {1} = Submonoid.closure {X - 1} ∧
    cycloIndex (ZMod 2) {1} = cycloIndex (ZMod 2) {2} ∧
    ∀ n : ℕ, (cyclotomic n ℤ).map (Int.castRingHom ℚ) = cyclotomic n ℚ := by
  refine ⟨?_, ?_, ?_⟩
  · norm_num [cycloIndex, Polynomial.cyclotomic_one]
  · norm_num [cycloIndex, Polynomial.cyclotomic_one, Polynomial.cyclotomic_two]
    have h : (X - 1 : (ZMod 2)[X]) = X + 1 := by
      rw [sub_eq_add_neg, ← Polynomial.C_1, ← Polynomial.C_neg]
      rfl
    rw [h]
  · intro n
    exact Polynomial.map_cyclotomic n (Int.castRingHom ℚ)

example : factorialPoly ℤ 0 = 1 ∧ factorialPoly ℤ 1 = 1 - X ∧
    factorialPoly ℤ 2 = (1 - X) * (1 - X ^ 2) ∧
    ¬ ((X ^ 0 - 1 : ℤ[X]) ^ 1 ∣ factorialPoly ℤ 0) ∧
    (X ^ 2 - 1 : ℤ[X]) ^ 0 ∣ factorialPoly ℤ 0 ∧
    cyclotomic 3 ℤ ^ 2 ∣ factorialPoly ℤ 6 ∧
    ¬ (cyclotomic 3 ℤ ^ 2 ∣ factorialPoly ℤ 5) ∧
    (X ^ 2 - 1 : ℤ[X]) ^ 2 ∣ factorialPoly ℤ 4 := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · simp [factorialPoly, QToolkit.pochhammer]
  · simp [factorialPoly, QToolkit.pochhammer]
  · simp [factorialPoly, QToolkit.pochhammer, Finset.prod_range_succ]
    left
    ring
  · simp [factorialPoly, QToolkit.pochhammer]
  · simp
  · refine ⟨(1 - X) * (1 - X ^ 2) * (1 - X ^ 4) * (1 - X ^ 5) *
      (X - 1) ^ 2 * (X + 1) * (X ^ 2 - X + 1), ?_⟩
    norm_num [factorialPoly, QToolkit.pochhammer, Finset.prod_range_succ,
      Polynomial.cyclotomic_three]
    ring
  · have hm : (cyclotomic 3 ℤ ^ 2).Monic := (Polynomial.cyclotomic.monic 3 ℤ).pow 2
    have hr : factorialPoly ℤ 5 %ₘ (cyclotomic 3 ℤ ^ 2) = 9 - 9 * X ^ 3 := by
      apply (Polynomial.div_modByMonic_unique
        (-8 + 15 * X - 7 * X ^ 2 - 6 * X ^ 3 + 11 * X ^ 4 - 4 * X ^ 5 -
          5 * X ^ 6 + 7 * X ^ 7 - 3 * X ^ 8 - 2 * X ^ 9 + 3 * X ^ 10 - X ^ 11)
        (9 - 9 * X ^ 3) hm ?_).2
      constructor
      · norm_num [factorialPoly, QToolkit.pochhammer, Finset.prod_range_succ,
          Polynomial.cyclotomic_three]
        ring
      · rw [Polynomial.degree_pow, Polynomial.degree_cyclotomic]
        norm_num [Nat.totient_prime Nat.prime_three]
        compute_degree
        norm_num
    intro hd
    have hz := (Polynomial.modByMonic_eq_zero_iff_dvd hm).mpr hd
    rw [hr] at hz
    have hc := congrArg (fun p : ℤ[X] => p.coeff 0) hz
    norm_num at hc
  · refine ⟨(1 - X) * (1 - X ^ 3) * (X ^ 2 + 1), ?_⟩
    norm_num [factorialPoly, QToolkit.pochhammer, Finset.prod_range_succ]
    ring

example (k : ℕ) : factorialPoly ℤ 3 = (1 - X) * (1 - X ^ 2) * (1 - X ^ 3) ∧
    (factorialPoly ℤ 1).leadingCoeff = -1 ∧
    (factorialPoly (ZMod 2) 1).leadingCoeff = 1 ∧
    ((X - 1 : ℤ[X]) ^ k).eval (-1) = (-2 : ℤ) ^ k ∧
    ((X - 1 : ℤ[X]) ^ k).eval (-1) ≠ 0 ∧
    (factorialPoly ℤ 2).eval (-1) = 0 := by
  norm_num [factorialPoly, QToolkit.pochhammer, Finset.prod_range_succ]
  refine ⟨by ring, ?_, ?_⟩
  · have h : (1 - X : ℤ[X]) = -(X - C 1) := by simp
    rw [h, Polynomial.leadingCoeff_neg, Polynomial.leadingCoeff_X_sub_C]
  · have h : (1 - X : (ZMod 2)[X]) = -(X - C 1) := by simp
    rw [h, Polynomial.leadingCoeff_neg, Polynomial.leadingCoeff_X_sub_C]
    decide

-- H₀, §1 p.3; Mathlib cyclotomic product identity; README §1.4.
/-- The cyclotomic factorization of `P_N` includes its leading sign `(-1)^N`. -/
theorem factorialPoly_cyclotomic_factorization (R : Type*) [CommRing R] (N : ℕ) :
    factorialPoly R N =
      C ((-1 : R) ^ N) * ∏ d ∈ Finset.Icc 1 N, cyclotomic d R ^ (N / d) := sorry

/-- Every positive-order cyclotomic factor occurs at least `floor(N/d)` times in `P_N`. -/
theorem cyclotomic_pow_dvd_factorial (R : Type*) [CommRing R] (d N : ℕ) (hd : 0 < d) :
    cyclotomic d R ^ (N / d) ∣ factorialPoly R N := sorry

/-- Every finite cyclotomic index polynomial divides some factorial polynomial. -/
theorem factorial_cofinal (R : Type*) [CommRing R]
    {f : R[X]} (hf : f ∈ cycloIndex R {n | 0 < n}) :
    ∃ N : ℕ, f ∣ factorialPoly R N := sorry

-- Positive m is essential: X^0-1=0 does not divide P_0=1 over ℤ.
/-- Factorial precision `N≥mk` kills the kth power of `X^m-1` for positive `m`. -/
theorem factorial_root_power_dvd (R : Type*) [CommRing R]
    (m k N : ℕ) (hm : 0 < m) (hN : m * k ≤ N) :
    (X ^ m - 1 : R[X]) ^ k ∣ factorialPoly R N := sorry

/-! ## Layer 2: the finite telescope for Laurent extension -/

/-- H, §7.1 Proposition 7.1 pp.1141–1142: the telescope yielding `q` inverse. -/
theorem factorial_telescope (R : Type*) [CommRing R] (N : ℕ) :
    X * (∑ n ∈ Finset.range N, X ^ n * factorialPoly R n) =
      1 - factorialPoly R N := sorry

/-! ## Layer 3: finite ingredients of completed Taylor maps -/

-- The additive Taylor coordinate is X-ζ, so no factorial is divided out.
/-- README §3.1: `P_N` vanishes to the indicated order at any dth root, for `d>0`. -/
theorem factorial_taylor_vanishing {R : Type*} [CommRing R]
    (ζ : R) (d k N : ℕ) (hd : 0 < d) (hζ : ζ ^ d = 1)
    (hN : d * (k + 1) ≤ N) :
    (X - C ζ) ^ (k + 1) ∣ factorialPoly R N := sorry

/-- README §3.1: sufficient factorial precision fixes each additive Taylor coefficient. -/
theorem factorialSum_taylor_stable {R : Type*} [CommRing R]
    (b : ℕ → R[X]) (ζ : R) (d k N M : ℕ) (hd : 0 < d)
    (hζ : ζ ^ d = 1) (hN : d * (k + 1) ≤ N) (hNM : N ≤ M) :
    ((∑ n ∈ Finset.range M, b n * factorialPoly R n).taylor ζ).coeff k =
      ((∑ n ∈ Finset.range N, b n * factorialPoly R n).taylor ζ).coeff k := sorry

/-! ## Layer 4: universal multiplicative Taylor coefficients -/

-- README §4.6: universal root algebra, not a selected embedded root ring.
/-- Universal multiplicative Taylor substitution `q = z_m(1-u)`. -/
def taylorPolynomial (R : Type*) [CommRing R] (m : ℕ) (g : R[X]) :
    (AdjoinRoot (cyclotomic m R))[X] :=
  (g.map (algebraMap R (AdjoinRoot (cyclotomic m R)))).comp
    (C (AdjoinRoot.root (cyclotomic m R)) * (1 - X))

/-- The integer `m^(2l-1)(l-1)!`; the leading-coefficient theorem assumes `m,l>0`. -/
def leadingFactor (m l : ℕ) : ℕ := m ^ (2 * l - 1) * (l - 1).factorial

example (R : Type*) [CommRing R] (m : ℕ) :
    taylorPolynomial R m X = C (AdjoinRoot.root (cyclotomic m R)) * (1 - X) ∧
    taylorPolynomial R m (1 - X) =
      1 - C (AdjoinRoot.root (cyclotomic m R)) +
        C (AdjoinRoot.root (cyclotomic m R)) * X := by
  simp only [taylorPolynomial, Polynomial.map_X, Polynomial.map_sub,
    Polynomial.map_one, Polynomial.X_comp, Polynomial.sub_comp, Polynomial.one_comp]
  exact ⟨trivial, by ring⟩

example (R : Type*) [CommRing R] (m : ℕ) :
    taylorPolynomial R m (X ^ 2) =
      C (AdjoinRoot.root (cyclotomic m R) ^ 2) * (1 - 2 * X + X ^ 2) := by
  simp only [taylorPolynomial, Polynomial.map_pow, Polynomial.map_X, Polynomial.pow_comp,
    Polynomial.X_comp, Polynomial.C_pow]
  ring

example : leadingFactor 1 4 = 6 ∧ leadingFactor 2 2 = 8 := by
  norm_num [leadingFactor]

example (m : ℕ) : leadingFactor m 1 = m := by
  simp [leadingFactor]

-- G, §5.1 (310)–(311) p.61. Vanishing, rather than exact order, holds with torsion.
/-- The first possible multiplicative Taylor coefficient of `P_(ml-1)` is `D_(m,l)`. -/
theorem factorial_taylor_leading (R : Type*) [CommRing R]
    (m l : ℕ) (hm : 0 < m) (hl : 0 < l) :
    (∀ j < l - 1, (taylorPolynomial R m (factorialPoly R (m * l - 1))).coeff j = 0) ∧
      (taylorPolynomial R m (factorialPoly R (m * l - 1))).coeff (l - 1) =
        (leadingFactor m l : AdjoinRoot (cyclotomic m R)) := sorry

/-! ## Layer 5: polynomial-module regularity -/

-- Arbitrary R-modules are allowed, including torsion and the zero module.
/-- README §5.1: the unit leading coefficient of `P_N` gives injectivity on `M[q]`. -/
theorem factorialPoly_smul_injective (R M : Type*) [CommRing R]
    [AddCommGroup M] [Module R M] (N : ℕ) :
    Function.Injective (fun x : PolynomialModule R M => factorialPoly R N • x) := sorry

-- Further basic API specified in README §§1.1 and 1.4:
-- qFactorial_at_one, pochhammer_append,
-- pochhammer_inverse_parameter, factorialPoly_zero.
-- Objects retained in the README, grouped by their mathematical role:
-- §1.1: jacksonSeries, adaptedJacksonSeries, pochhammerInf, reciprocalPochhammer,
-- qBinomialSeries, jacksonExp, integralPochhammerInf, adamsSeries,
-- plethysticLogarithmicSum, plethysticExp.
-- §§1.2–1.4: compatSubalgebra, MonicCompletion (with transition), CycloCompletion
-- (with fromPoly, proj, mapRing, restrict, adicEquivOfFinite, cofinalEquiv),
-- polynomialLimitSubalgebra, PolynomialLimit.equivOfCofinal, FiniteOrders,
-- finiteOrderLimitSubalgebra, FiniteOrderLimit, HabiroRing.factorialEquiv,
-- toAdicXPowSubOne, OrderAdic, orderAdicTransition, orderAdicLimitSubalgebra,
-- OrderAdicLimit, HabiroRing.orderAdicEquiv, finiteDivisorsAdicEquiv,
-- orderAdicMapRing, factorialLimitMapRing.
-- §§2–3: factorialDigit, factorialSeries, factorialCoeff, expansionMul,
-- qInv, fromLaurent, laurentQuotientEquiv, evalAt, evalFamily,
-- taylorAt, taylorAtExpCoord, powSubst, reExpand.
-- §4: adjacencyIndex, Adjacent, IsAdjConnected, cyclotomicPairQuotientEquiv,
-- MonicImplies, MonicPrecedes, RootAdjacent, selectedRootEvaluation,
-- cyclotomicIntegerRoot, FiniteH, hTransition, TaylorProduct (with map),
-- taylorCoeff, gamma, atFourthRoot, hFiltration, hFiltration_quotient_equiv,
-- pFiltration, FiniteP, jetRows, digitAt, jetAt, jetCoordinates, digitCoordinates,
-- iota, factorialGradedEquiv, taylorGradedEquiv, finiteDigitBasis,
-- finiteJetBasis, gradedIota, simultaneousRemainders, finiteIota,
-- rationalTaylorEquiv, taylorMatrix, twoRemainderMatrix, remainderAt,
-- remainderMatrix, D1, D2, gradedMatrix, delta, starMatrix, awayToPadic.
-- §5: polyModQuot, cycloModuleSubmodule, cycloModuleCompletion (with of, proj,
-- selfEquiv, map, restrict, piEquiv, ofTensor, equivPiOfChain), AdjacentModule,
-- LocalizedIntegers, InvertedPrimes, ValuationTuple, valuationOrders,
-- componentEquiv, componentIdempotent, rootAlgebra, unionEquivProd,
-- comaximalSetoid, comaximalComponentOrders, comaximalComponentEquiv,
-- equivPiOfIsUnit, restrictionProjector, restrictionLocalizationEquiv,
-- HabiroFractionField, rationalFunctionsToHabiroFraction,
-- factorialModuleCompletion, completedDirectSum_eq_nullFamilies,
-- factorialDiagonal_nonexact. The last counterexample uses P_k in both its
-- diagonal and its decaying family; its preimage of ones fails finite support
-- modulo P_1. It uses only ordinary completion.
-- §6: the Kontsevich–Zagier series, oddProjector and substituteTwo.
-- HabiroRings §2.4 owns the derived comparison downstream, consuming §1.4,
-- §2.3 and §5.1 here. No derived supplier enters these constructions.

end TauCetiRoadmap.HabiroCyclotomicCompletions
