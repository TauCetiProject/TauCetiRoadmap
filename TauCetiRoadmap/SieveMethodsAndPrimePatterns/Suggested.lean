import Mathlib

/-!
# Sieve methods and prime patterns: target signatures

README.md is the roadmap; this file is not the roadmap. It states its headline
theorems against the pinned Mathlib and Tau Ceti APIs, with only their simple definitions.
The headlines are the Selberg weighted Gram, Brun fundamental and upper-sieve inequalities; interval,
progression and twin/Goldbach upper bounds; Brun convergence; additive, primitive and
polynomial Farey large sieves; the prime quadratic-symbol bilinear bound;
Jutila’s real-character mean; Linnik's exceptional-prime bound; Smith's bilinear bound and the
Koymans–Pagano row mean; Vaughan's identity; Bombieri–Vinogradov and its maximal and
second-moment forms; Maynard clusters and variational growth; and Chen's two theorems.

The finite-character
Gram bound from lattice discrepancies and binary convex sieve lack the L-domain
carrier; the weighted general sieve endpoints lack their sieve-function carriers.
The joint-spin sign-distribution endpoint lacks the ideal spin and generator-domain carriers;
its analytic chain is supplied by ArithmeticStatisticsPartV §3.30. Affine
saturation and squarefree expansion lack the word-population and congruence-mixing
interfaces. Their full statements remain README targets, without proxy predicates.

Cutoffs are strict where stated; remainders include the term at one. Inner products are
conjugate-linear in the first variable. Prime indices start at zero. Almost-primality
counts factors with multiplicity. Conjectures remain explicit hypotheses.
-/

noncomputable section
open scoped BigOperators ArithmeticFunction.Moebius
namespace TauCetiRoadmap.SieveMethodsAndPrimePatterns
attribute [local instance] Classical.propDecidable

/-! ## Layer 0: finite weighted sieves and local data -/

namespace SieveGram
open scoped InnerProductSpace
variable {𝕜 E ι : Type*} [RCLike 𝕜] [NormedAddCommGroup E]
  [InnerProductSpace 𝕜 E] [Fintype ι]

/-- Selberg’s weighted finite Gram inequality, allowing zero rows and dependent vectors. -/

theorem selberg_weighted_inner (y : ι → E) (x : E) :
    (∑ i, ‖⟪x, y i⟫_𝕜‖ ^ 2 / (∑ j, ‖⟪y i, y j⟫_𝕜‖)) ≤ ‖x‖ ^ 2 := by sorry

end SieveGram

namespace SieveBrun

/-- The Euler-product dimension bound on the prime factors of the native sieve product. -/
def HasProductDimension (s : BoundingSieve) (κ K : ℝ) : Prop :=
  ∀ w z : ℝ, 2 ≤ w → w ≤ z →
    (∏ p ∈ s.prodPrimes.primeFactors.filter (fun p : ℕ => w ≤ (p : ℝ) ∧ (p : ℝ) < z),
      (1 - s.nu p)⁻¹) ≤ K * (Real.log z / Real.log w) ^ κ

/-- Absolute native remainders on positive divisors strictly below the cutoff, including one. -/
def remainderMass (s : BoundingSieve) (D : ℝ) : ℝ :=
  ∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ => (d : ℝ) < D), |s.rem d|

end SieveBrun
namespace SieveRealCharacters

/-- The numerical discriminant symbol on naturals, with explicit dyadic values and zero extension. -/
def discriminantValue (D : ℤ) (n : ℕ) : ℝ :=
  if n = 0 then 0 else
    ∏ p ∈ n.primeFactors,
      (if p = 2 then
        if D % 8 = 1 ∨ D % 8 = 7 then (1 : ℝ)
        else if D % 8 = 3 ∨ D % 8 = 5 then -1 else 0
      else (jacobiSym D p : ℝ)) ^ n.factorization p

end SieveRealCharacters

/-! ## Layer 1: Brun and Selberg sieves and polynomial values -/

namespace SieveBrun

/-- Brun’s fundamental estimate with product dimension and strict remainder cutoff;
Kedlaya Theorem 12.2, with the lower main-term sign corrected. -/
theorem fundamental_estimate (s : BoundingSieve) (κ K y u : ℝ)
    (hX : 0 ≤ s.totalMass) (hκ : 0 < κ) (hK : 1 < K) (hy : 1 < y)
    (hu : 9 * κ + 1 ≤ u) (hdim : HasProductDimension s κ K)
    (hprimes : ∀ p ∈ s.prodPrimes.primeFactors, (p : ℝ) < y ^ (1 / u)) :
    let V := ∏ p ∈ s.prodPrimes.primeFactors, (1 - s.nu p)
    let δ := Real.exp (9 * κ + 1 - u) * K ^ 10
    (1 - δ) * V * s.totalMass - remainderMass s y ≤ s.siftedSum ∧
      s.siftedSum ≤ (1 + δ) * V * s.totalMass + remainderMass s y := by sorry

end SieveBrun
namespace SieveSelberg

/-- The Selberg denominator sums native diagonal terms on d<z. -/

def diagonalMass (s : BoundingSieve) (z : ℝ) : ℝ :=
  ∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ => (d : ℝ) < z), s.selbergTerms d

/-- The optimized upper bound with strict z² remainder cutoff and lcm multiplicity 3^ω(d). -/

theorem selberg_upper_bound (s : BoundingSieve) (z : ℝ) (hz : 1 < z) :
    s.siftedSum ≤ s.totalMass / diagonalMass s z +
      ∑ d ∈ s.prodPrimes.divisors.filter (fun d : ℕ => (d : ℝ) < z ^ 2),
        (3 : ℝ) ^ ArithmeticFunction.cardDistinctFactors d * |s.rem d| := by sorry

end SieveSelberg
namespace SieveApplications
attribute [local instance] Classical.propDecidable

/-- A uniform Selberg bound on primes in an interval of length y≥2. -/

theorem prime_interval_upper : ∃ C : ℝ, 0 < C ∧ ∀ x y : ℝ, 2 ≤ x → 2 ≤ y →
    (Nat.primeCounting (Nat.floor (x+y)) : ℝ) - Nat.primeCounting (Nat.floor x) ≤
      2*y/Real.log y + C*y*Real.log (Real.log (3*y))/(Real.log y)^2 := by sorry

/-- Twin-prime and even Goldbach upper bounds, retaining the local product. -/

theorem twin_goldbach_upper : ∃ C : ℝ, 0 < C ∧
    (∀ x : ℕ, 3 ≤ x → (((Finset.Icc 1 x).filter (fun p => p.Prime ∧ (p+2).Prime)).card : ℝ) ≤ C*x/(Real.log x)^2) ∧
    (∀ N : ℕ, 4 ≤ N → Even N →
      (((Finset.Icc 2 (N-2)).filter (fun p => p.Prime ∧ (N-p).Prime)).card : ℝ) ≤
        C*N/(Real.log N)^2 * ∏ p ∈ N.primeFactors.filter (fun p => p ≠ 2), (p-1 : ℕ)/(p-2 : ℝ)) := by sorry

/-- A uniform Brun–Titchmarsh bound for primes in a reduced residue class,
including modulus one; Heath-Brown, Lectures on sieves, (3.5)–(3.6). -/
theorem progression_upper : ∃ C : ℝ, 0 < C ∧ ∀ (k a : ℕ) (x : ℝ),
    1 ≤ k → Nat.Coprime a k → 4 * (k : ℝ) ≤ x →
    (((Finset.range (⌊x⌋₊ + 1)).filter (fun p => p.Prime ∧ p ≡ a [MOD k])).card : ℝ) ≤
      C * x / ((k.totient : ℝ) * Real.log (x / k)) := by sorry

/-- Brun’s convergence of the two twin-prime reciprocal sums. -/

theorem brun_reciprocals : Summable (fun p : {p : ℕ // p.Prime ∧ (p+2).Prime} => (p.val : ℝ)⁻¹) ∧
    Summable (fun p : {p : ℕ // p.Prime ∧ (p+2).Prime} => (p.val+2 : ℝ)⁻¹) := by sorry

end SieveApplications

/-! ## Layer 2: large sieves and Vaughan decomposition -/

namespace SieveTaper
local notation "phase" => (fun x : ℝ => (Real.fourierChar x : ℂ))
local notation "dist₁" => (fun t : ℝ => ‖(t : UnitAddCircle)‖)

/-- The separated additive large sieve on an arbitrary integer interval, including H=0. -/

theorem additive_largeSieve {ι : Type*} [Fintype ι] [DecidableEq ι]
    (M : ℤ) (H : ℕ) (a : Fin H → ℂ) (x : ι → ℝ) (δ : ℝ) (hδ : 0 < δ)
    (hsep : ∀ i j, i ≠ j → δ ≤ dist₁ (x i-x j)) :
    (∑ i, ‖∑ j, a j * phase (((M : ℝ)+(j.val : ℝ)+1)*x i)‖^2) ≤
      ((H : ℝ)+2/δ) * ∑ j, ‖a j‖^2 := by sorry

/-- The sharp additive bound for H≥1 and 0<δ≤1/2. -/

theorem sharp_additive_largeSieve {ι : Type*} [Fintype ι] [DecidableEq ι]
    (M : ℤ) (H : ℕ) (hH : 1 ≤ H) (a : Fin H → ℂ) (x : ι → ℝ)
    (δ : ℝ) (hδ : 0 < δ) (hδ' : δ ≤ 1/2)
    (hsep : ∀ i j, i ≠ j → δ ≤ dist₁ (x i - x j)) :
    (∑ i, ‖∑ j, a j * phase (((M : ℝ) + (j.val : ℝ) + 1) * x i)‖ ^ 2) ≤
      ((H : ℝ) - 1 + 1/δ) * ∑ j, ‖a j‖ ^ 2 := by sorry

end SieveTaper
namespace SieveCharacters

/-- The primitive character large sieve includes modulus one. -/

theorem primitive_largeSieve (Q H : ℕ) (M : ℤ) (a : Fin H → ℂ) :
    (∑ q : Fin Q, (((q.val+1 : ℕ) : ℝ)/(q.val+1).totient) *
      ∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ (q.val+1))).filter
        DirichletCharacter.IsPrimitive,
        ‖∑ j, a j * χ ((M+j.val+1 : ℤ) : ZMod (q.val+1))‖^2) ≤
      ((H : ℝ)+2*(Q : ℝ)^2) * ∑ j, ‖a j‖^2 := by sorry

end SieveCharacters
namespace SieveApplications

/-- The sharp primitive bound, with positive modulus and interval cutoffs.
At Q=1 its constant is H, supplied directly by Cauchy–Schwarz. -/

theorem sharp_primitive_largeSieve (Q H : ℕ) (hQ : 1 ≤ Q) (hH : 1 ≤ H) (M : ℤ) (a : Fin H → ℂ) :
    (∑ q : Fin Q, (((q.val+1 : ℕ) : ℝ)/(q.val+1).totient) *
      ∑ χ ∈ (Finset.univ : Finset (DirichletCharacter ℂ (q.val+1))).filter DirichletCharacter.IsPrimitive,
        ‖∑ j, a j * χ ((M+j.val+1 : ℤ) : ZMod (q.val+1))‖^2) ≤
      ((H : ℝ)-1+(Q : ℝ)^2) * ∑ j, ‖a j‖^2 := by sorry

attribute [local instance] Classical.propDecidable

/-- The least positive quadratic nonresidue at an odd prime; invalid denominators return zero. -/

def leastNonresidue (p : ℕ) : ℕ :=
  if p.Prime ∧ p ≠ 2 then
    if h : ∃ n : ℕ, 0 < n ∧ jacobiSym (n : ℤ) p = -1 then Nat.find h else 0
  else 0

/-- For fixed ε>0, the number of primes up to N with least nonresidue>N^ε is bounded uniformly in N. -/

theorem linnik_exceptional (ε : ℝ) (hε : 0 < ε) : ∃ C : ℝ, 0 < C ∧ ∀ N : ℕ, 2 ≤ N →
    (((Finset.Icc 1 N).filter (fun p => p.Prime ∧ p ≠ 2 ∧ (N : ℝ)^ε < leastNonresidue p)).card : ℝ) ≤ C := by sorry

end SieveApplications
namespace SieveQuadratic
open Finset

/-- The prime-denominator convention at two is one on odd numerators, rather than Kronecker. -/

def primeDenominatorSymbol (a : ℤ) (p : ℕ) : ℤ :=
  if p = 2 then if Even a then 0 else 1 else jacobiSym a p

/-- The prime quadratic estimate permits arbitrary numerators and any nonnegative coefficient bounds A,B. -/

theorem prime_quadratic_bilinear (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ K L : ℕ, 1 ≤ K → 1 ≤ L → ∀ a b : ℕ → ℂ,
      ∀ A B : ℝ, 0 ≤ A → 0 ≤ B →
      (∀ k ∈ Icc 1 K, ‖a k‖ ≤ A) →
      (∀ p ∈ Icc 1 L, p.Prime → ‖b p‖ ≤ B) →
      ‖∑ k ∈ Icc 1 K, ∑ p ∈ (Icc 1 L).filter Nat.Prime,
        a k * b p * (primeDenominatorSymbol (k : ℤ) p : ℂ)‖ ≤
        C * A * B * (Real.rpow ((K : ℝ) * L) (1+ε) /
          Real.sqrt (min (K : ℝ) L) + K) := by sorry

/-- Jutila’s mean-value lemma on all nonsquare discriminants, including nonfundamental ones;
Lemma 3, equation (12), printed p.194, with its sixth power of log N. -/
theorem jutila_mean_value : ∃ C : ℝ, 0 < C ∧ ∀ X N : ℕ, 3 ≤ X → 2 ≤ N →
    ∀ a : ℕ → ℂ,
      (∑ D ∈ (Icc (-(X : ℤ)) (X : ℤ)).filter
          (fun D => (D % 4 = 0 ∨ D % 4 = 1) ∧ ¬ IsSquare D),
        ‖∑ n ∈ Icc 1 N, a n * (SieveRealCharacters.discriminantValue D n : ℂ)‖ ^ 2) ≤
        C * ((X : ℝ) * (∑ m ∈ Icc 1 N, ∑ n ∈ (Icc 1 N).filter
          (fun n => IsSquare (m * n)), ‖a m‖ * ‖a n‖) +
          Real.sqrt X * (N : ℝ) ^ (7 / 4 : ℝ) *
            (∑ n ∈ Icc 1 N, ‖a n‖ ^ 8) ^ (1 / 4 : ℝ) * (Real.log N) ^ 6) := by sorry

/-- Smith's Legendre-symbol row bound on disjoint finite sets of odd primes;
Proposition 6.6 of the cited preprint. The constant is chosen after epsilon. -/
theorem smith_prime_legendre_bilinear (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (X₁ X₂ : Finset ℕ) (t₁ t₂ : ℝ),
      2 ≤ t₁ → 2 ≤ t₂ → Disjoint X₁ X₂ →
      (∀ p ∈ X₁, p.Prime ∧ Odd p ∧ (p : ℝ) ≤ t₁) →
      (∀ q ∈ X₂, q.Prime ∧ Odd q ∧ (q : ℝ) ≤ t₂) →
      (∑ p ∈ X₁, |∑ q ∈ X₂, (jacobiSym (p : ℤ) q : ℝ)|) ≤
        C * (t₁ * t₂ ^ (3/4 + ε) + t₂ * t₁ ^ (3/4 + ε)) := by sorry

/-- Koymans–Pagano's normalized row mean, with fixed growth and cardinality
parameters preceding epsilon and the uniform constant; equation (7.11), arXiv v1. -/
theorem koymans_pagano_row_mean (c₂ c₄ a : ℝ)
    (hc₂ : 0 < c₂) (hc₄ : 0 < c₄) (ha : 0 < a) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (X₁ X₂ : Finset ℕ) (t₁ t₂ : ℝ),
      3 ≤ t₁ → t₁ ≤ t₂ → Disjoint X₁ X₂ →
      (∀ p ∈ X₁, p.Prime ∧ Odd p ∧ (p : ℝ) ≤ t₁) →
      (∀ q ∈ X₂, q.Prime ∧ Odd q ∧ (q : ℝ) ≤ t₂) →
      Real.log t₂ ≤ t₁ ^ c₂ →
      a * t₁ / (Real.log t₁) ^ c₄ ≤ (X₁.card : ℝ) →
      a * t₂ / (Real.log t₂) ^ c₄ ≤ (X₂.card : ℝ) →
      (∑ p ∈ X₁, |∑ q ∈ X₂, (jacobiSym (p : ℤ) q : ℝ)|) ≤
        C * X₁.card * X₂.card * t₁ ^ (-1/4 + c₂*c₄ + ε) := by sorry

end SieveQuadratic
namespace SievePolynomialFarey

/-- Coefficient of T^(-j-1) in G/H at infinity for monic H of degree ℓ;
the numerator is reversed at the denominator degree. -/
def coefficient {p : ℕ} [Fact p.Prime] (ℓ : ℕ) (G H : Polynomial (ZMod p)) (j : ℕ) : ZMod p :=
  PowerSeries.coeff j
    ((∑ i ∈ Finset.range ℓ, PowerSeries.monomial i (G.coeff (ℓ - 1 - i))) *
      PowerSeries.invOfUnit (H.reverse : PowerSeries (ZMod p)) 1)

/-- The polynomial Farey large sieve on all monic degree-ℓ denominators and reduced numerators;
BSKK Lemma 6.2, including ℓ=m=0 and the fraction 0/1. -/
theorem large_sieve (p ℓ m : ℕ) [Fact p.Prime] (hm : m ≤ 2 * ℓ)
    (f : Fin m → ZMod p → ℝ) (hf : ∀ j x, 0 ≤ f j x) :
    let numerators := (Finset.univ : Finset (Fin ℓ → ZMod p)).image (Polynomial.ofFn ℓ)
    let denominators := numerators.image (fun H => Polynomial.X ^ ℓ + H)
    (∑ H ∈ denominators, ∑ G ∈ numerators.filter (fun G => IsCoprime G H),
      ∏ j : Fin m, f j (coefficient ℓ G H j)) ≤
        (p : ℝ) ^ (2 * ℓ - m) * ∏ j : Fin m, ∑ x : ZMod p, f j x := by sorry

end SievePolynomialFarey
namespace SieveVaughan
open Finset
open scoped ArithmeticFunction

/-- Vaughan’s identity keeps the Λ≤V term and allows zero cutoffs. -/

theorem vaughan_identity (U V n : ℕ) :
    Λ n = (if n ≤ V then Λ n else 0) +
      (∑ b ∈ n.divisors with b ≤ U, (μ b : ℝ) * Real.log (n / b : ℕ)) -
      (∑ b ∈ n.divisors with b ≤ U,
        (μ b : ℝ) * ∑ c ∈ (n / b).divisors with c ≤ V, Λ c) +
      (∑ b ∈ n.divisors with U < b,
        (μ b : ℝ) * ∑ c ∈ (n / b).divisors with V < c, Λ c) := by
  sorry

end SieveVaughan

/-! ## Layer 3: maximal prime distribution -/

namespace SieveDistribution
open Filter Asymptotics
attribute [local instance] Classical.propDecidable

/-- Inclusive prime count in a natural residue class. -/

def primeCountAP (x : ℝ) (q a : ℕ) : ℕ :=
  ((Finset.range (⌊x⌋₊ + 1)).filter (fun p => p.Prime ∧ p ≡ a [MOD q])).card

/-- The maximum reduced-residue prime-count discrepancy, centred at π(x)/φ(q). -/

def discrepancy (x : ℝ) (q : ℕ) : ℝ :=
  ⨆ a : {a : Fin q // Nat.Coprime a q},
    |(primeCountAP x q a.1 : ℝ) - (Nat.primeCounting ⌊x⌋₊ : ℝ) / (q.totient : ℝ)|

/-- Maynard’s level predicate, with all logarithmic savings and no positivity imposed on θ. -/

def PrimesHaveLevel (θ : ℝ) : Prop :=
  ∀ A : ℝ, 0 < A →
    (fun x : ℝ => ∑ q ∈ Finset.Icc 1 ⌊x ^ θ⌋₊, discrepancy x q) =O[atTop]
      fun x : ℝ => x / Real.log x ^ A

/-- Elliott–Halberstam requires every real level below one and is used only
as an explicit hypothesis of the conditional gap theorem. -/
def ElliottHalberstam : Prop := ∀ θ : ℝ, θ < 1 → PrimesHaveLevel θ

/-- Bombieri–Vinogradov gives every θ<1/2 in Maynard’s normalization. -/

theorem primesHaveLevel_of_lt_half {θ : ℝ} (hθ : θ < 1 / 2) : PrimesHaveLevel θ := by
  sorry

end SieveDistribution
namespace SieveArithmeticDistribution
open Finset
attribute [local instance] Classical.propDecidable

/-- Maximal von Mangoldt distribution: the supremum includes both residue and cutoff.
The centre y/φ(q) includes prime powers. -/
theorem bombieri_vinogradov_maximal (A : ℝ) (hA : 0 < A) :
    ∃ B C x₀ : ℝ, 0 < B ∧ 0 < C ∧ 3 ≤ x₀ ∧ ∀ x Q : ℝ,
      x₀ ≤ x → 1 ≤ Q → Q ≤ Real.sqrt x / Real.log x ^ B →
      (∑ q ∈ Icc 1 ⌊Q⌋₊,
        sSup {v : ℝ | ∃ a : ℕ, a < q ∧ a.Coprime q ∧
          ∃ y : ℝ, 0 ≤ y ∧ y ≤ x ∧ v =
            |(∑ n ∈ (Icc 1 ⌊y⌋₊).filter (fun n => n ≡ a [MOD q]),
              ArithmeticFunction.vonMangoldt n) - y / (q.totient : ℝ)|}) ≤
        C * x / Real.log x ^ A := by sorry

/-- The second moment sums all reduced residues, with its own logarithmic modulus cutoff. -/
theorem barban_davenport_halberstam (A : ℝ) (hA : 0 < A) :
    ∃ B C x₀ : ℝ, 0 < B ∧ 0 < C ∧ 3 ≤ x₀ ∧ ∀ x Q : ℝ,
      x₀ ≤ x → 1 ≤ Q → Q ≤ x / Real.log x ^ B →
      (∑ q ∈ Icc 1 ⌊Q⌋₊, ∑ a ∈ (range q).filter (fun a => a.Coprime q),
        ((∑ n ∈ (Icc 1 ⌊x⌋₊).filter (fun n => n ≡ a [MOD q]),
          ArithmeticFunction.vonMangoldt n) - x / (q.totient : ℝ)) ^ 2) ≤
        C * x ^ 2 / Real.log x ^ A := by sorry
end SieveArithmeticDistribution

/-! ## Layer 4: prime tuples and Maynard clusters -/

namespace SieveMaynard
open Filter Topology MeasureTheory SieveDistribution
attribute [local instance] Classical.propDecidable

/-- A finite tuple misses a residue class modulo every prime. -/

def IsAdmissible (H : Finset ℕ) : Prop :=
  ∀ p : ℕ, p.Prime → ∃ a : ℕ, ∀ h ∈ H, ¬ h ≡ a [MOD p]

/-- The natural shifts making every entry prime. -/

def primeTranslates (H : Finset ℕ) : Set ℕ :=
  {n | ∀ h ∈ H, (n + h).Prime}

/-- The nonnegative simplex with sum at most one. -/

def maynardSimplex (k : ℕ) : Set (Fin k → ℝ) :=
  {t | (∀ i, 0 ≤ t i) ∧ ∑ i, t i ≤ 1}

/-- The squared L² integral on the unit cube. -/

def maynardI (k : ℕ) (F : (Fin k → ℝ) → ℝ) : ℝ :=
  ∫ t in Set.univ.pi (fun _ : Fin k => Set.Icc (0 : ℝ) 1), F t ^ 2

/-- The squared coordinate-fibre integral, integrated on the remaining cube. -/

def maynardJ (k : ℕ) (m : Fin k) (F : (Fin k → ℝ) → ℝ) : ℝ :=
  ∫ t in Set.univ.pi (fun _ : Fin k => Set.Icc (0 : ℝ) 1),
    (∫ s in (0 : ℝ)..1, F (Function.update t m s)) ^ 2

/-- Simplex support, square integrability and nonzero I and every J. -/

def IsMaynardAdmissible (k : ℕ) (F : (Fin k → ℝ) → ℝ) : Prop :=
  (∀ t, t ∉ maynardSimplex k → F t = 0) ∧
    MemLp F 2 (volume.restrict (Set.univ.pi fun _ : Fin k => Set.Icc (0 : ℝ) 1)) ∧
    maynardI k F ≠ 0 ∧ ∀ m, maynardJ k m F ≠ 0

/-- The sum of coordinate functionals divided by I, using totalized real division. -/

def maynardRatio (k : ℕ) (F : (Fin k → ℝ) → ℝ) : ℝ :=
  (∑ m, maynardJ k m F) / maynardI k F

/-- The supremum of the variational ratio over admissible functions. -/

def maynardM (k : ℕ) : ℝ :=
  sSup {r | ∃ F, IsMaynardAdmissible k F ∧ r = maynardRatio k F}

/-- A positive level θ≤1 gives infinitely many shifts with at least ceil(θM_k/2) primes. -/

theorem infinite_many_primes_of_level (θ : ℝ) (hθ : 0 < θ) (hθ1 : θ ≤ 1)
    (hlevel : PrimesHaveLevel θ) (k : ℕ) (h : Fin k → ℕ) (hinj : Function.Injective h)
    (hH : IsAdmissible (Finset.univ.image h)) :
    {n : ℕ | ⌈θ * maynardM k / 2⌉ ≤
      ((Finset.univ.filter fun i => (n + h i).Prime).card : ℤ)}.Infinite := by
  sorry

/-- Maynard’s large-k lower bound, with k tending to infinity. -/

theorem eventually_log_sub_lt_maynardM :
    ∀ᶠ k : ℕ in atTop,
      Real.log k - 2 * Real.log (Real.log k) - 2 < maynardM k := by
  sorry

/-- The exact rational polynomial witness gives M₅≥1417255/708216>2. -/

theorem maynardM_five_ge : (1417255 / 708216 : ℝ) ≤ maynardM 5 := by
  sorry

/-- The exact rational 42-coefficient witness gives M₁₀₅>4. -/

theorem four_lt_maynardM_105 : 4 < maynardM 105 := by
  sorry

/-- Infinitely many consecutive prime gaps are at most six hundred. -/

theorem frequently_nth_prime_succ_sub_le_600 :
    ∃ᶠ n in atTop, Nat.nth Nat.Prime (n + 1) - Nat.nth Nat.Prime n ≤ 600 := by
  sorry

/-- Assuming Elliott–Halberstam, the consecutive and three-prime diameters are bounded. -/

theorem elliottHalberstam_gaps (hEH : ElliottHalberstam) :
    (∃ᶠ n in atTop, Nat.nth Nat.Prime (n + 1) - Nat.nth Nat.Prime n ≤ 12) ∧
      ∃ᶠ n in atTop, Nat.nth Nat.Prime (n + 2) - Nat.nth Nat.Prime n ≤ 600 := by
  sorry

/-- The m+1-prime diameter is uniformly bounded by C m³ exp(4m), for m≥1. -/

theorem exists_frequently_nth_prime_sub_le :
    ∃ C : ℝ, ∀ m : ℕ, 1 ≤ m →
      ∃ᶠ n in atTop, ((Nat.nth Nat.Prime (n + m) - Nat.nth Nat.Prime n : ℕ) : ℝ) ≤
        C * m ^ 3 * Real.exp (4 * m) := by
  sorry

/-- A positive proportion of m-subsets of a sufficiently large finite set have infinitely many prime shifts. -/

theorem positive_proportion_prime_tuples (m : ℕ) (hm : 1 ≤ m) :
    ∃ (r₀ : ℕ) (c : ℝ), 0 < c ∧ ∀ A : Finset ℕ, r₀ ≤ A.card →
      c * (A.card.choose m : ℝ) ≤
        (({B | B ∈ A.powersetCard m ∧ (primeTranslates B).Infinite} : Set (Finset ℕ)).ncard : ℝ) := by
  sorry

end SieveMaynard

/-! ## Layer 5: weighted almost primes, joint spins and affine saturation -/

namespace SieveWeighted
attribute [local instance] Classical.propDecidable

/-- Every sufficiently large even integer has quantitatively many prime-plus-P₂ representations; the P₂ factor is not a unit. -/

theorem chen_goldbach : ∃ c : ℝ, 0 < c ∧ ∃ N₀ : ℕ, ∀ N : ℕ, N₀ ≤ N → Even N →
    c*N/(Real.log N)^2 ≤ (((Finset.Icc 2 (N-2)).filter
      (fun p => p.Prime ∧ 1 ≤ ArithmeticFunction.cardFactors (N-p) ∧ ArithmeticFunction.cardFactors (N-p) ≤ 2)).card : ℝ) := by sorry

/-- For a fixed positive even shift, quantitatively many primes have a nonunit P₂ translate. -/

theorem chen_prime_shift (h : ℕ) (hh : 0 < h) (hh2 : Even h) : ∃ c : ℝ, 0 < c ∧ ∃ x₀ : ℕ,
    ∀ x : ℕ, x₀ ≤ x → c*x/(Real.log x)^2 ≤ (((Finset.Icc 1 x).filter
      (fun p => p.Prime ∧ 1 ≤ ArithmeticFunction.cardFactors (p+h) ∧ ArithmeticFunction.cardFactors (p+h) ≤ 2)).card : ℝ) := by sorry

end SieveWeighted

end TauCetiRoadmap.SieveMethodsAndPrimePatterns
