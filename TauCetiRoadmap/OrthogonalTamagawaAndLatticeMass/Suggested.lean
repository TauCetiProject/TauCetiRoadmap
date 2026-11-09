import Mathlib
import TauCeti.LinearAlgebra.IntegralLattice.Basic
import TauCeti.LinearAlgebra.IntegralLattice.Isometry.Group
import TauCeti.LinearAlgebra.IntegralLattice.Even
import TauCeti.LinearAlgebra.IntegralLattice.Unimodular

/-!
# Orthogonal Tamagawa comparison and lattice masses: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the headline theorems of the positive-definite lane: the numerical mass formula for
an arbitrary positive definite integral genus of rank at least three (1.3), the even-unimodular
mass formula (3.1) and the unconditional class counts in ranks 16, 24, 32 and 40, over a small
Gram-matrix presentation of native integral-lattice isometry classes (no second lattice or
orthogonal-group carrier).

Not statable at the pins, and therefore not stated here:
* the structure theorems of 0.1 (Spin of an arbitrary nondegenerate form is a semisimple simply
  connected central μ₂-cover of SO for rank at least three): Tau Ceti has the form-preserving
  and standard special orthogonal group schemes, but no Spin group scheme attached to an arbitrary nondegenerate form;
* the measure identities of 1.1–1.3 (the decomposition of the orthogonal quotient into lattice
  classes, the gauge and Jacobian transport, and the identity of the full genus mass with
  `τ(SO)/(2 v_∞ ∏_p v_p)`): there is no adelic orthogonal quotient with its Tamagawa measure.
  The numerical form of 1.3 is stated below as `genusMass_eq`;
* the quadratic residue-group comparison of 0.1a: the symmetric-bilinear equation schemes
  do not supply the quadratic-preserving scheme and its reduction in characteristic two;
* Cho's smooth dyadic model and density formula of 2.1–2.2: there is no smooth integral model
  attached to a Jordan splitting over an unramified extension of `ℤ₂`;
* the away-S Spin approximation and Eichler applications of 0.3: the algebraic Spin group
  with its almost-simple factors and its comparison with the native restricted product is
  missing, as is the proper spinor-genus class carrier needed by the Eichler conclusion;
* the same-form binary analytic and order/genus comparisons of 1.4: the native characters,
  quadratic fields and order Picard groups exist, but the comparison from an integral lattice
  to its primitive quadratic order, signed character and local-density genus has not been
  constructed. No theorem on unrelated character and scalar variables stands in for it.
-/

noncomputable section
open scoped BigOperators
open TauCeti

namespace TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass

/-! ## Layer 0: Gram presentations and native lattices -/

/-- Integral `n × n` matrices, indexed by `Fin n`. -/
abbrev GramMatrix (n : ℕ) := Matrix (Fin n) (Fin n) ℤ

/-- Symmetric integral `n × n` matrices that are positive definite over `ℚ`; for `n = 0` the
empty matrix. -/
abbrev PositiveGram (n : ℕ) :=
  {G : GramMatrix n // G.IsSymm ∧ (G.map (algebraMap ℤ ℚ)).PosDef}

/-- The native rational integral lattice with Gram matrix `G` in the standard basis. -/
def nativeLattice {n : ℕ} (G : PositiveGram n) :
    IntegralLattice (Fin n → ℚ) :=
  IntegralLattice.ofGramMatrix (Pi.basisFun ℚ (Fin n)) G.1 G.2.1

/-- Integral congruence: `AᵀGA = H` for an integral matrix `A` with unit determinant, that is
`A ∈ GLₙ(ℤ)`. -/
def GramEquivalent {n : ℕ} (G H : PositiveGram n) : Prop :=
  ∃ A : GramMatrix n, IsUnit A.det ∧ A.transpose * G.1 * A = H.1

/-- Integral congruence of Gram matrices is an equivalence relation. -/
def gramSetoid (n : ℕ) : Setoid (PositiveGram n) where
  r := GramEquivalent
  iseqv :=
    { refl := fun G => ⟨1, by simp, by simp⟩
      symm := fun {G H} ⟨A, hA, hAGH⟩ => by
        refine ⟨A⁻¹, Matrix.isUnit_nonsing_inv_det A hA, ?_⟩
        rw [← hAGH, Matrix.transpose_nonsing_inv]
        calc A.transpose⁻¹ * (A.transpose * G.1 * A) * A⁻¹
            = (A.transpose⁻¹ * A.transpose) * G.1 * (A * A⁻¹) := by
              simp only [Matrix.mul_assoc]
          _ = G.1 := by
              rw [Matrix.nonsing_inv_mul _ (by rwa [Matrix.det_transpose]),
                Matrix.mul_nonsing_inv _ hA, Matrix.one_mul, Matrix.mul_one]
      trans := fun {G H K} ⟨A, hA, hAGH⟩ ⟨B, hB, hBHK⟩ => by
        refine ⟨A * B, by rw [Matrix.det_mul]; exact hA.mul hB, ?_⟩
        rw [← hBHK, ← hAGH, Matrix.transpose_mul]
        simp only [Matrix.mul_assoc] }

/-- Positive integral Gram forms modulo invertible integral change of basis. -/
abbrev GramClass (n : ℕ) := Quotient (gramSetoid n)

/-- The integral isometry class represented by a positive Gram matrix. -/
def classOf {n : ℕ} (G : PositiveGram n) : GramClass n :=
  Quotient.mk (gramSetoid n) G

/-- The order of the full native integral isometry group of a Gram lattice. -/
def fullAutomorphismOrder {n : ℕ} (G : PositiveGram n) : ℕ :=
  Nat.card (IntegralLattice.Isometry (nativeLattice G) (nativeLattice G))

/-- The order of the full integral isometry group `O(L)` of the native lattice `L` of the chosen
Gram representative `Quotient.out c` of the class `c`. -/
def classAutomorphismOrder {n : ℕ} (c : GramClass n) : ℕ :=
  fullAutomorphismOrder (Quotient.out c)

/-! ## Layer 1: quotient and gauge transport -/

/-- Two positive Gram matrices of rank `n` lie in one genus when, for every prime `p`, some
`A ∈ Mₙ(ℤ_p)` with unit determinant satisfies `AᵀGA = H` over `ℤ_p` (IntegralLattices §3F);
both being positive definite of rank `n`, their real classes agree. -/
def SameGenus {n : ℕ} (G H : PositiveGram n) : Prop :=
  ∀ (p : ℕ) [Fact p.Prime], ∃ A : Matrix (Fin n) (Fin n) ℤ_[p], IsUnit A.det ∧
    A.transpose * G.1.map (Int.cast : ℤ → ℤ_[p]) * A = H.1.map (Int.cast : ℤ → ℤ_[p])

/-- The full mass of the genus of `G`: the sum of `1/|O(L)|`, with `O(L)` the full integral
isometry group, over the integral isometry classes of positive Gram matrices in the genus of `G`
(IntegralLattices §7A). -/
def genusMass {n : ℕ} (G : PositiveGram n) : ℚ :=
  ∑' c : {c : GramClass n // ∃ H : PositiveGram n, classOf H = c ∧ SameGenus G H},
    (classAutomorphismOrder c.1 : ℚ)⁻¹

/-- The local density
`α_p(G) = lim_{r → ∞} p^(−r·n(n−1)/2) · #{X ∈ Mₙ(ℤ/p^r) : XᵀGX ≡ G (mod p^r)}`
(IntegralLattices §7C). -/
def localDensity {n : ℕ} (G : GramMatrix n) (p : ℕ) : ℝ :=
  Filter.limUnder Filter.atTop fun r : ℕ =>
    (Nat.card {X : Matrix (Fin n) (Fin n) (ZMod (p ^ r)) //
        X.transpose * G.map (Int.cast : ℤ → ZMod (p ^ r)) * X =
          G.map (Int.cast : ℤ → ZMod (p ^ r))} : ℝ) /
      (p : ℝ) ^ (r * (n * (n - 1) / 2))

/-- Siegel's mass formula, the numerical form of 1.3: for a positive definite integral Gram
matrix `G` of rank `n ≥ 3`, the full mass of its genus is
`2 π^(−n(n+1)/4) ∏_{j=1}^{n} Γ(j/2) · (det G)^((n+1)/2) · ∏_p (α_p(G)/2)⁻¹`,
the product over all primes converging absolutely (Conway–Sloane, equations (2), (3), (6)). -/
theorem genusMass_eq {n : ℕ} (hn : 3 ≤ n) (G : PositiveGram n) :
    (genusMass G : ℝ) =
      2 * Real.pi ^ (-((n : ℝ) * (n + 1)) / 4) *
        (∏ j ∈ Finset.Icc 1 n, Real.Gamma ((j : ℝ) / 2)) *
        (G.1.det : ℝ) ^ (((n : ℝ) + 1) / 2) *
        ∏' p : Nat.Primes, (localDensity G.1 p / 2)⁻¹ := by
  sorry

/-! ## Layer 3: The even-unimodular mass -/

/-- The classes of positive definite Gram matrices of rank `n` whose native lattice is even and
unimodular. -/
def evenUnimodularClasses (n : ℕ) : Set (GramClass n) :=
  {c | ∃ G : PositiveGram n, classOf G = c ∧
    (nativeLattice G).IsEven ∧ (nativeLattice G).IsUnimodular}

/-- The rational sum of reciprocal full automorphism orders over even unimodular classes. -/
def evenUnimodularMass (n : ℕ) : ℚ :=
  ∑' c : evenUnimodularClasses n, (classAutomorphismOrder c.1 : ℚ)⁻¹

/-- `|B_m/(2m)| · ∏_{j=1}^{m−1} |B_{2j}/(4j)|`, with Mathlib's Bernoulli numbers `bernoulli`
(`B₁ = −1/2`); at `m = 0` the division by zero makes it `0`. -/
def bernoulliFullMass (m : ℕ) : ℚ :=
  |bernoulli m / (2 * (m : ℚ))| *
    ∏ j ∈ Finset.Ico 1 m, |bernoulli (2 * j) / (4 * (j : ℚ))|

/-- The mass formula for even unimodular lattices: for `n > 0` divisible by `8`, the sum of
`1/|O(L)|` over the classes of positive definite even unimodular lattices `L` of rank `n` is
`|B_{n/2}/n| · ∏_{j=1}^{n/2−1} |B_{2j}/(4j)|` (Belolipetsky–Gan, Theorem 3.1, p.4, with the
dyadic correction `λ₂ = 1` of §5, Corollary 5.3, p.7; Conway–Sloane, §9(iv), p.274). -/
theorem evenUnimodularMass_eq (n : ℕ) (hn : 0 < n) (h8 : 8 ∣ n) :
    evenUnimodularMass n = bernoulliFullMass (n / 2) := by
  sorry

/-! ## Layer 4: Classification and class-count bounds -/

/-- There are exactly two positive definite even unimodular integral isometry classes in rank 16. -/
theorem rank16_classNumber : Nat.card (evenUnimodularClasses 16) = 2 := by
  sorry

/-- There are exactly twenty-four positive definite even unimodular integral classes in rank 24. -/
theorem rank24_classNumber : Nat.card (evenUnimodularClasses 24) = 24 := by
  sorry

/-- The rank-32 positive definite even unimodular class number exceeds ten million. -/
theorem rank32_classNumber_lower_bound : 10 ^ 7 < Nat.card (evenUnimodularClasses 32) := by
  sorry

/-- The rank-40 positive definite even unimodular class number exceeds ten to the fifty-first power. -/
theorem rank40_classNumber_lower_bound : 10 ^ 51 < Nat.card (evenUnimodularClasses 40) := by
  sorry

end TauCetiRoadmap.OrthogonalTamagawaAndLatticeMass
