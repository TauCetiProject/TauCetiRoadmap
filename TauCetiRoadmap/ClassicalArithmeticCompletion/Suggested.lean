import Mathlib

/-!
# ClassicalArithmeticCompletion: representative target signatures

The mathematical roadmap is `README.md`. This file records light definitions and theorem
signatures statable against the pinned Mathlib APIs; it is not exhaustive. In particular it
fixes the direction of radix reading, the positivity of Smith factors, the two Markoff
coefficients, the conjugate-modulus predicates, and the left-module convention. The theorem
proofs are roadmap targets. The source qualifications in the README apply to their signatures.
-/

namespace TauCetiRoadmap.ClassicalArithmeticCompletion

open scoped BigOperators Polynomial
open Polynomial Filter Topology

#check pow_card_eq_one'
#check pow_ne_of_irreducible_X_pow_sub_C

/-! ## Layer 0: divisibility and congruences -/

/-- Integer CRT without coprimality, including negative and zero moduli (Shoup Exercise 2.18). -/
theorem int_exists_modEq_and_modEq_iff (m n a b : ℤ) :
    (∃ x : ℤ, x ≡ a [ZMOD m] ∧ x ≡ b [ZMOD n]) ↔
      a ≡ b [ZMOD (Int.gcd m n : ℤ)] := by
  sorry

/-! ## Layer 1: residues and reciprocity -/

namespace Residues

/-- The d-th powers in a finite cyclic group are the indicated power-map kernel. -/
theorem range_powMonoidHom_eq_ker (G : Type*) [CommGroup G] [IsCyclic G] [Finite G]
    (d : ℕ) :
    (powMonoidHom d : G →* G).range =
      (powMonoidHom (Nat.card G / (Nat.card G).gcd d) : G →* G).ker := by
  sorry

/-- Finite-field Euler criterion for any exponent; the target element is nonzero. -/
theorem exists_pow_eq_iff_pow_eq_one {F : Type*} [Field F] [Fintype F] (n : ℕ)
    {a : F} (ha : a ≠ 0) :
    (∃ b : F, b ^ n = a) ↔
      a ^ ((Fintype.card F - 1) / (Fintype.card F - 1).gcd n) = 1 := by
  sorry

/-- Count nonzero roots, including exponent zero. -/
theorem card_nonzero_pow_roots {F : Type*} [Field F] [Fintype F] (n : ℕ)
    {a : F} (ha : a ≠ 0) (hex : ∃ b : F, b ^ n = a) :
    Nat.card {b : F // b ≠ 0 ∧ b ^ n = a} = (Fintype.card F - 1).gcd n := by
  sorry

/-- A primary Gaussian integer has residue one modulo `(1+i)^3`.
-/
def IsPrimaryGaussian (z : GaussianInt) : Prop :=
  (⟨1, 1⟩ : GaussianInt) ^ 3 ∣ z - 1

end Residues

/-! ## Layer 2: sequences and generating functions -/

namespace Sequences

/-- Rationality has a denominator invertible as a power series and no numerator-degree bound. -/
def IsRational {K : Type*} [Field K] (f : PowerSeries K) : Prop :=
  ∃ P Q : Polynomial K, Q.coeff 0 ≠ 0 ∧ f * (Q : PowerSeries K) = (P : PowerSeries K)

/-- First-kind Lucas sequence, retaining the repeated-root cases.
-/
def lucasU {R : Type*} [CommRing R] (P Q : R) : ℕ → R
  | 0 => 0
  | 1 => 1
  | n + 2 => P * lucasU P Q (n + 1) - Q * lucasU P Q n

/-- Second-kind Lucas sequence with initial values two and P.
-/
def lucasV {R : Type*} [CommRing R] (P Q : R) : ℕ → R
  | 0 => 2
  | 1 => P
  | n + 2 => P * lucasV P Q (n + 1) - Q * lucasV P Q n

/-- Strong divisibility requires coprime integer parameters. -/
theorem gcd_lucasU {P Q : ℤ} (h : IsCoprime P Q) (m n : ℕ) :
    Int.gcd (lucasU P Q m) (lucasU P Q n) =
      (lucasU P Q (Nat.gcd m n)).natAbs := by
  sorry

/-- A finite-output automaton; state finiteness is imposed by automaticity.
-/
structure DFAO (α σ Δ : Type*) where
  /-- Transition from a state on one input letter. -/
  step : σ → α → σ
  /-- Initial state. -/
  start : σ
  /-- Output at a state. -/
  output : σ → Δ

/-- Words are read head first, so transitions are folded from the left. -/
def DFAO.eval {α σ Δ : Type*} (M : DFAO α σ Δ) (w : List α) : σ :=
  w.foldl M.step M.start

/-- Least-significant-first automaticity, using Mathlib's radix digits.
-/
def IsAutomatic (k : ℕ) [NeZero k] {Δ : Type*} (a : ℕ → Δ) : Prop :=
  ∃ (σ : Type) (_ : Fintype σ) (M : DFAO (Fin k) σ Δ),
    ∀ n, a n = M.output (M.eval ((Nat.digits k n).map (Fin.ofNat k)))

/-- The k-kernel consists of all radix subsequences with a valid residue.
-/
def kernel (k : ℕ) {Δ : Type*} (a : ℕ → Δ) : Set (ℕ → Δ) :=
  {b | ∃ e r : ℕ, r < k ^ e ∧ b = fun n => a (k ^ e * n + r)}

/-- Eilenberg's finite-kernel characterisation. -/
theorem isAutomatic_iff_finite_kernel {k : ℕ} [NeZero k] (hk : 2 ≤ k)
    {Δ : Type*} (a : ℕ → Δ) : IsAutomatic k a ↔ (kernel k a).Finite := by
  sorry

/-- Christol's theorem over a finite field, in its prime-characteristic form. -/
theorem christol {K : Type*} [Field K] [Fintype K] {p : ℕ}
    [Fact p.Prime] [CharP K p] (a : ℕ → K) :
    IsAlgebraic K[X] (PowerSeries.mk a) ↔ IsAutomatic p a := by
  sorry

/-- Cobham's equivalence uses multiplicatively independent bases at least two. -/
theorem cobham {a b : ℕ} [NeZero a] [NeZero b] {Δ : Type*}
    (ha : 2 ≤ a) (hb : 2 ≤ b)
    (hind : ∀ m n : ℕ, 0 < m → 0 < n → a ^ m ≠ b ^ n) (f : ℕ → Δ) :
    (IsAutomatic a f ∧ IsAutomatic b f) ↔
      ∃ N p : ℕ, 0 < p ∧ ∀ t, N ≤ t → f (t + p) = f t := by
  sorry

/-- Ward's endpoint includes the singular attached-curve case; see its README proof obligation. -/
theorem ward_strong_divisibility {b c d : ℤ} (hb : b ≠ 0) (hc : c ≠ 0)
    (hcop : IsCoprime c (d * b)) (m n : ℤ) :
    Int.gcd (normEDS b c d m) (normEDS b c d n) =
      (normEDS b c d (Int.gcd m n)).natAbs := by
  sorry

end Sequences

/-! ## Layer 3: polynomial and matrix arithmetic -/

namespace Certificates

/-- A positive invariant-factor list is displayed in the leading rectangular diagonal. -/
def smithDiag (m n : ℕ) {r : ℕ} (d : Fin r → ℕ) : Matrix (Fin m) (Fin n) ℤ :=
  fun i j => if h : (i : ℕ) = j ∧ (i : ℕ) < r then (d ⟨i, h.2⟩ : ℤ) else 0

/-- Every rectangular integer matrix has a positive Smith diagonal, including rank zero. -/
theorem exists_smith_normal_form_rectangular {m n : ℕ}
    (A : Matrix (Fin m) (Fin n) ℤ) :
    ∃ (r : ℕ) (d : Fin r → ℕ)
      (P : Matrix (Fin m) (Fin m) ℤ) (Q : Matrix (Fin n) (Fin n) ℤ),
      r ≤ m ∧ r ≤ n ∧ (∀ i, 0 < d i) ∧
      (∀ i j, i ≤ j → d i ∣ d j) ∧
      IsUnit P.det ∧ IsUnit Q.det ∧ P * A * Q = smithDiag m n d := by
  sorry

/-- A Smith decomposition identifies the cokernel; unit factors contribute zero summands. -/
theorem nonempty_cokernel_equiv_of_smith {m n r : ℕ}
    (A : Matrix (Fin m) (Fin n) ℤ) (d : Fin r → ℕ)
    (P : Matrix (Fin m) (Fin m) ℤ) (Q : Matrix (Fin n) (Fin n) ℤ)
    (hrm : r ≤ m) (hrn : r ≤ n) (hd : ∀ i, 0 < d i)
    (hP : IsUnit P.det) (hQ : IsUnit Q.det) (hdiag : P * A * Q = smithDiag m n d) :
    Nonempty (((Fin m → ℤ) ⧸ LinearMap.range A.mulVecLin) ≃ₗ[ℤ]
      (Π i : Fin r, ZMod (d i)) × (Fin (m - r) → ℤ)) := by
  sorry

/-- Integer-valued means values in the coefficient domain, rather than coefficients in it. -/
def IsIntegerValued {D K : Type*} [CommRing D] [Field K] [Algebra D K]
    (f : Polynomial K) : Prop :=
  ∀ x : D, ∃ y : D, f.eval (algebraMap D K x) = algebraMap D K y

/-- Perron's weak criterion includes both endpoint exclusions and nonzero constant term. -/
theorem perron_irreducible_of_le {f : ℤ[X]} (hmon : f.Monic) (h2 : 2 ≤ f.natDegree)
    (h0 : f.coeff 0 ≠ 0)
    (hP : 1 + ∑ i ∈ Finset.range (f.natDegree - 1), |f.coeff i| ≤
      |f.coeff (f.natDegree - 1)|)
    (hpos : f.eval 1 ≠ 0) (hneg : f.eval (-1) ≠ 0) : Irreducible f := by
  sorry

end Certificates

/-! ## Layer 4: classical Diophantine equations -/

namespace Diophantine

/-- Ordered coefficient-three Markoff triples.
-/
def markoffSet (R : Type*) [CommRing R] : Set (Fin 3 → R) :=
  {x | x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 = 3 * x 0 * x 1 * x 2}

/-- One Vieta move changes only the selected coordinate.
-/
def markoffVieta {R : Type*} [CommRing R] (i : Fin 3) (x : Fin 3 → R) : Fin 3 → R :=
  fun j => if j = i then 3 * ∏ k ∈ Finset.univ.erase i, x k - x i else x j

/-- Every positive Markoff triple descends by one Vieta move unless it is the root. -/
theorem markoff_descent (x : Fin 3 → ℤ) (hx : x ∈ markoffSet ℤ)
    (hpos : ∀ i, 0 < x i) (hroot : x ≠ ![1, 1, 1]) :
    ∃ i, markoffVieta i x ∈ markoffSet ℤ ∧
      (∀ j, 0 < markoffVieta i x j) ∧
      (∑ j, markoffVieta i x j) < ∑ j, x j := by
  sorry

/-- Markoff–Hurwitz sets retain all coordinates, ring characteristics and parameters.
-/
def markoffHurwitzSet {R : Type*} [CommRing R] (n : ℕ) (a k : R) :
    Set (Fin n → R) := {x | ∑ i, x i ^ 2 = a * ∏ i, x i + k}

/-- Generalised Vieta move for coefficient a.
-/
def markoffHurwitzMove {R : Type*} [CommRing R] {n : ℕ} (a : R) (j : Fin n)
    (x : Fin n → R) : Fin n → R :=
  fun i => if i = j then a * ∏ t ∈ Finset.univ.erase j, x t - x j else x i

/-- Three-square classification includes zero and excludes the complete 4-adic obstruction. -/
theorem legendre_three_square (n : ℕ) :
    (∃ x y z : ℤ, x ^ 2 + y ^ 2 + z ^ 2 = n) ↔
      ¬ ∃ a b : ℕ, n = 4 ^ a * (8 * b + 7) := by
  sorry

/-- Numerical semigroups use the existing additive submonoid carrier. -/
structure NumericalSemigroup where
  /-- Additive submonoid of natural numbers. -/
  monoid : AddSubmonoid ℕ
  finite_gaps : ((monoid : Set ℕ)ᶜ).Finite

/-- An Apéry set is defined relative to a positive semigroup element. -/
def aperySet (S : AddSubmonoid ℕ) (n : ℕ) : Set ℕ :=
  {s | s ∈ S ∧ (s < n ∨ s - n ∉ S)}

/-- A finite set of positive denominators whose unit fractions sum to `r`; being a set, it
cannot repeat a denominator.
-/
def IsEgyptianExpansion (r : ℚ) (D : Finset ℕ) : Prop :=
  0 ∉ D ∧ ∑ d ∈ D, (1 : ℚ) / d = r

/-- Every positive rational is a finite sum of distinct unit fractions. -/
theorem exists_egyptianExpansion {r : ℚ} (hr : 0 < r) :
    ∃ D : Finset ℕ, IsEgyptianExpansion r D := by
  sorry

/-- Ramanujan–Nagell: the integer solutions of `x² + 7 = 2ⁿ`, up to the sign of `x`. -/
theorem ramanujan_nagell {x : ℤ} {n : ℕ} :
    x ^ 2 + 7 = 2 ^ n ↔
      (x.natAbs, n) ∈ [(1, 3), (3, 4), (5, 5), (11, 7), (181, 15)] := by
  sorry

end Diophantine

/-! ## Layer 5: number-field presentations and comparisons -/

namespace NumberFieldCertificates

/-- Conjugation in additive unit coordinates; its shear records the norm sign.
-/
def quadraticUnitAction (s : ZMod 2) (x : ℤ × ZMod 2) : ℤ × ZMod 2 :=
  (-x.1, x.2 + s * (x.1 : ZMod 2))

/-- The unit-coordinate action is an involution. -/
theorem quadraticUnitAction_involutive (s : ZMod 2) :
    Function.Involutive (quadraticUnitAction s) := by
  sorry

/-- Full integer-ring units, including squarefree radicands one modulo four. -/
theorem negativePell_iff_norm_neg_one {K : Type*} [Field K] [NumberField K]
    {d : ℤ} {θ : NumberField.RingOfIntegers K}
    (hd : 1 < d) (hsq : Squarefree d)
    (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    (∃ x y : ℤ, x ^ 2 - d * y ^ 2 = -1) ↔
      ∃ u : (NumberField.RingOfIntegers K)ˣ,
        Algebra.norm ℤ (u : NumberField.RingOfIntegers K) = -1 := by
  sorry

/-- Joint relation/unit completeness criterion, with strict margin and every error term retained. -/
theorem relations_units_complete_of_intervals {K : Type*} [Field K] [NumberField K]
    {N : ℕ} (φ : (Fin N → ℤ) →+ Additive (ClassGroup (NumberField.RingOfIntegers K)))
    (hφ : Function.Surjective φ) (A : Matrix (Fin N) (Fin N) ℤ)
    (hA : A.det ≠ 0) (hrel : ∀ j, φ (fun i => A i j) = 0)
    (u : Fin (NumberField.Units.rank K) → (NumberField.RingOfIntegers K)ˣ)
    (hu : NumberField.Units.IsMaxRank u) (Rhat ε a η : ℝ)
    (hε : 0 ≤ ε) (hη : 0 ≤ η)
    (hRu : |Rhat - NumberField.Units.regOfFamily u| ≤ ε)
    (hprod : |a - (NumberField.classNumber K : ℝ) * NumberField.Units.regulator K| ≤ η)
    (hmargin : (A.det.natAbs : ℝ) * (Rhat + ε) < 2 * (a - η)) :
    LinearMap.range A.mulVecLin = φ.ker.toIntSubmodule ∧
      (Subgroup.closure (Set.range u) ⊔ NumberField.Units.torsion K = ⊤) ∧
      A.det.natAbs = NumberField.classNumber K ∧
      NumberField.Units.regOfFamily u = NumberField.Units.regulator K := by
  sorry


section FactorBases

open NumberField
open scoped nonZeroDivisors

/-- The classes of the nonzero prime ideals of absolute norm at most `T` generate the class group
(README §5.1a). The predicate is monotone in `T`, holds below `2` exactly for class number one,
and a bound may be lowered once every prime up to it has its class in the smaller subgroup.
-/
def IsFactorBaseBound (K : Type*) [Field K] [NumberField K] (T : ℝ) : Prop :=
  Subgroup.closure (ClassGroup.mk0 '' {I : (Ideal (𝓞 K))⁰ |
    (I : Ideal (𝓞 K)).IsPrime ∧ (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ T}) = ⊤

/-- Minkowski's bound, in the form of README §5.1, is a factor-base bound. -/
theorem isFactorBaseBound_minkowski (K : Type*) [Field K] [NumberField K] :
    IsFactorBaseBound K ((4 / Real.pi) ^ InfinitePlace.nrComplexPlaces K *
      ((Module.finrank ℚ K).factorial / (Module.finrank ℚ K : ℝ) ^ Module.finrank ℚ K *
        Real.sqrt |(discr K : ℝ)|)) := by
  sorry

/-- Exponents killing every residue-power test are divisible by `p` (README §5.3a).
When `p` is prime, the `P i` are maximal, `p ∣ Ideal.absNorm (P i) - 1`, and `v j ∉ P i`
for every `i` and `j`, this is equivalent to full column rank modulo `p` of the residue
discrete-logarithm matrix.
-/
def PowerResidueIndependent {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]
    {m : ℕ} (p : ℕ) (P : Fin m → Ideal (𝓞 K)) (v : ι → 𝓞 K) : Prop :=
  ∀ e : ι → ℕ, (∀ i, ∏ j, Ideal.Quotient.mk (P i) (v j) ^
      (e j * ((Ideal.absNorm (P i) - 1) / p)) = 1) → ∀ j, p ∣ e j

/-- Residue-character certificate for units when `p` does not divide the torsion order. -/
theorem isMaxRank_and_not_dvd_index_of_powerResidueIndependent {K : Type*} [Field K]
    [NumberField K] {p m : ℕ} (hp : p.Prime) (hpw : ¬ p ∣ Units.torsionOrder K)
    (P : Fin m → Ideal (𝓞 K)) (hP : ∀ i, (P i).IsMaximal)
    (hpP : ∀ i, p ∣ Ideal.absNorm (P i) - 1) (u : Fin (Units.rank K) → (𝓞 K)ˣ)
    (hu : PowerResidueIndependent p P fun j => (u j : 𝓞 K)) :
    Units.IsMaxRank u ∧ ¬ p ∣ (Subgroup.closure (Set.range u) ⊔ Units.torsion K).index := by
  sorry

/-- A generator of the roots of unity joins the test; independence then forces `p` to divide the
torsion order. -/
theorem isMaxRank_and_not_dvd_index_of_powerResidueIndependent_torsion {K : Type*} [Field K]
    [NumberField K] {p m : ℕ} (hp : p.Prime) (P : Fin m → Ideal (𝓞 K)) (hP : ∀ i, (P i).IsMaximal)
    (hpP : ∀ i, p ∣ Ideal.absNorm (P i) - 1) (u : Fin (Units.rank K) → (𝓞 K)ˣ) (ζ : (𝓞 K)ˣ)
    (hζ : Subgroup.zpowers ζ = Units.torsion K)
    (hu : PowerResidueIndependent p P
      (Sum.elim (fun j => (u j : 𝓞 K)) fun _ : Unit => (ζ : 𝓞 K))) :
    Units.IsMaxRank u ∧ ¬ p ∣ (Subgroup.closure (Set.range u) ⊔ Units.torsion K).index := by
  sorry

/-- Residue-character certificate for `p`-saturation of `J i ^ n i = (a i)` (README §5.11a). -/
theorem dvd_of_isPrincipal_prod_pow_of_powerResidueIndependent {K : Type*} [Field K]
    [NumberField K] {N s m p : ℕ} (hp : p.Prime) (J : Fin N → Ideal (𝓞 K)) (n : Fin N → ℕ)
    (a : Fin N → 𝓞 K) (ha0 : ∀ i, a i ≠ 0) (hJ : ∀ i, J i ^ n i = Ideal.span {a i})
    (w : Fin s → (𝓞 K)ˣ)
    (hw : ∀ x : (𝓞 K)ˣ, ∃ c : Fin s → ℤ, ∃ t : (𝓞 K)ˣ, x = (∏ j, w j ^ c j) * t ^ p)
    (P : Fin m → Ideal (𝓞 K)) (hP : ∀ k, (P k).IsMaximal)
    (hpP : ∀ k, p ∣ Ideal.absNorm (P k) - 1) (haP : ∀ k i, p ∣ n i → a i ∉ P k)
    (hind : PowerResidueIndependent p P
      (Sum.elim (fun j => (w j : 𝓞 K)) fun i : {i : Fin N // p ∣ n i} => a i))
    (e : Fin N → ℕ) (he : (∏ i, J i ^ e i).IsPrincipal) (hpe : ∀ i, n i ∣ p * e i) :
    ∀ i, n i ∣ e i := by
  sorry

/-- Generation and `p`-saturation at every prime dividing `∏ n i` determine the class number. -/
theorem classNumber_eq_prod_of_saturated {K : Type*} [Field K] [NumberField K] {N : ℕ}
    (J : Fin N → (Ideal (𝓞 K))⁰) (n : Fin N → ℕ) (hn : ∀ i, n i ≠ 0)
    (hord : ∀ i, ClassGroup.mk0 (J i) ^ n i = 1)
    (hgen : Subgroup.closure (Set.range fun i => ClassGroup.mk0 (J i)) = ⊤)
    (hsat : ∀ p, p.Prime → p ∣ ∏ i, n i → ∀ e : Fin N → ℕ,
      ∏ i, ClassGroup.mk0 (J i) ^ e i = 1 → (∀ i, n i ∣ p * e i) → ∀ i, n i ∣ e i) :
    classNumber K = ∏ i, n i := by
  sorry

/-- An interval for the logarithm of the residue is an interval for `h_K R_K`
(README §5.16a (iii)). -/
theorem classNumber_mul_regulator_bounds_of_abs_log_residue_sub_le {K : Type*} [Field K]
    [NumberField K] {S ε : ℝ} (h : |Real.log (dedekindZeta_residue K) - S| ≤ ε) :
    Units.torsionOrder K * Real.sqrt |(discr K : ℝ)| /
          (2 ^ InfinitePlace.nrRealPlaces K * (2 * Real.pi) ^ InfinitePlace.nrComplexPlaces K) *
          Real.exp (S - ε) ≤ classNumber K * Units.regulator K ∧
      classNumber K * Units.regulator K ≤ Units.torsionOrder K * Real.sqrt |(discr K : ℝ)| /
          (2 ^ InfinitePlace.nrRealPlaces K * (2 * Real.pi) ^ InfinitePlace.nrComplexPlaces K) *
          Real.exp (S + ε) := by
  sorry

end FactorBases

end NumberFieldCertificates

/-! ## Layer 6: special algebraic numbers and Mahler measure -/

namespace SmallHeight

/-- Pisot numbers include degree-one integers at least two, and exclude nonintegral rationals.
-/
def IsPisot (θ : ℝ) : Prop :=
  IsIntegral ℤ θ ∧ 1 < θ ∧
    ∀ z ∈ (minpoly ℤ θ).aroots ℂ, z ≠ (θ : ℂ) → ‖z‖ < 1

/-- Salem numbers have another conjugate on the unit circle.
-/
def IsSalem (τ : ℝ) : Prop :=
  IsIntegral ℤ τ ∧ 1 < τ ∧
    (∀ z ∈ (minpoly ℤ τ).aroots ℂ, z ≠ (τ : ℂ) → ‖z‖ ≤ 1) ∧
    ∃ z ∈ (minpoly ℤ τ).aroots ℂ, ‖z‖ = 1

/-- Positive powers retain the Salem condition. -/
theorem IsSalem.pow {τ : ℝ} (h : IsSalem τ) {n : ℕ} (hn : 0 < n) :
    IsSalem (τ ^ n) := by
  sorry

/-- Positive powers retain the Pisot condition. -/
theorem IsPisot.pow {θ : ℝ} (h : IsPisot θ) {n : ℕ} (hn : 0 < n) :
    IsPisot (θ ^ n) := by
  sorry

/-- The sharp Schinzel–Zassenhaus bound in a carrier-free polynomial form. -/
theorem schinzel_zassenhaus {P : Polynomial ℤ} (hP : P.Monic) (hirr : Irreducible P)
    (hdeg : 0 < P.natDegree) (h0 : P.coeff 0 ≠ 0)
    (hcycl : ∀ n : ℕ, 0 < n → P ≠ cyclotomic n ℤ) :
    ∃ z ∈ P.aroots ℂ, Real.rpow 2 (1 / (4 * (P.natDegree : ℝ))) ≤ ‖z‖ := by
  sorry

/-- Schur sequences have a holomorphic witness and a closed norm bound on the open disc.
-/
def RealSchurSeries (e : ℕ → ℝ) : Prop :=
  ∃ f : ℂ → ℂ, DifferentiableOn ℂ f (Metric.ball 0 1) ∧
    ∀ z ∈ Metric.ball (0 : ℂ) 1,
      HasSum (fun j : ℕ => (e j : ℂ) * z ^ j) (f z) ∧ ‖f z‖ ≤ 1

/-- Finite pair-product diameter, with the unused small indices fixed to zero.
-/
noncomputable def finiteFeketeDiameter (K : Set ℂ) (n : ℕ) : ℝ :=
  if n < 2 then 0 else
    sSup {r : ℝ | ∃ z : Fin n → ℂ, (∀ i, z i ∈ K) ∧
      r = Real.rpow (∏ i : Fin n, ∏ j ∈ Finset.univ.filter (fun j => i < j),
        ‖z i - z j‖) (2 / ((n : ℝ) * ((n : ℝ) - 1)))}

/-- Transfinite diameter is the infimum starting with two points.
-/
noncomputable def transfiniteDiameter (K : Set ℂ) : ℝ :=
  sInf (Set.range (fun n : ℕ => finiteFeketeDiameter K (n + 2)))

/-- A radial hedgehog is the union of the closed radial segments.
-/
def radialHedgehog {n : ℕ} (a : Fin n → ℂ) : Set ℂ :=
  {z | ∃ i : Fin n, ∃ t : ℝ, t ∈ Set.Icc 0 1 ∧ z = (t : ℂ) * a i}

/-- Dubinin's bound allows coincident endpoints and uses the family size. -/
theorem dubinin_hedgehog_bound {n : ℕ} (hn : 1 ≤ n) (a : Fin n → ℂ) :
    transfiniteDiameter (radialHedgehog a) ≤
      sSup (Set.range (fun i => ‖a i‖)) * Real.rpow 4 (-(1 / (n : ℝ))) := by
  sorry

/-- The Hankel convention has a +1 shift, and the empty determinant equals one.
-/
def shiftedHankelDet {R : Type*} [CommRing R] (a : ℕ → R) (n : ℕ) : R :=
  Matrix.det (fun i j : Fin n => a (i.val + j.val + 1))

/-- Exterior continuation includes the actual Laurent germ, not only a holomorphic function. -/
def ExteriorLaurentContinuation (a : ℕ → ℂ) (K : Set ℂ) : Prop :=
  IsCompact K ∧ K.Nonempty ∧ ∃ G : ℂ → ℂ,
    DifferentiableOn ℂ G Kᶜ ∧ ∃ R : ℝ, 0 < R ∧ K ⊆ Metric.closedBall 0 R ∧
      ∀ z : ℂ, R < ‖z‖ → HasSum (fun j : ℕ => a j * (z⁻¹) ^ j) (G z)

/-- Bertrandias's integer-coefficient rationality criterion has strict diameter bound. -/
theorem bertrandias_rationality (a : ℕ → ℤ) (K : Set ℂ)
    (h : ExteriorLaurentContinuation (fun j => (a j : ℂ)) K)
    (hd : transfiniteDiameter K < 1) :
    Sequences.IsRational (PowerSeries.mk fun j => (a j : ℚ)) := by
  sorry

end SmallHeight

/-! ## Layer 7: integral Galois modules and arithmetic orders -/

namespace GaloisModules

/-- Conjugates must be linearly independent and span the full integral module.
-/
def IsNIBGenerator (A B G : Type*) [CommRing A] [CommRing B] [Algebra A B]
    [Group G] [Fintype G] [MulSemiringAction G B] [IsGaloisGroup G A B] (α : B) : Prop :=
  LinearIndependent A (fun g : G => g • α) ∧
    Submodule.span A (Set.range fun g : G => g • α) = ⊤

/-- Existence of one such generator is a normal integral basis. -/
def HasNIB (A B G : Type*) [CommRing A] [CommRing B] [Algebra A B]
    [Group G] [Fintype G] [MulSemiringAction G B] [IsGaloisGroup G A B] : Prop :=
  ∃ α : B, IsNIBGenerator A B G α

/-- Tame residue extensions are separable and have index prime to residue characteristic. -/
def IsTamelyRamifiedAt (A B : Type*) [CommRing A] [CommRing B] [Algebra A B]
    (P : Ideal B) [P.IsPrime] : Prop :=
  Algebra.IsSeparable (A ⧸ P.under A) (B ⧸ P) ∧
    ¬ ringChar (A ⧸ P.under A) ∣ P.ramificationIdx A

/-- Tameness is tested at every nonzero prime. -/
def IsTamelyRamified (A B : Type*) [CommRing A] [CommRing B] [Algebra A B] : Prop :=
  ∀ (P : Ideal B) [P.IsPrime], P ≠ ⊥ → IsTamelyRamifiedAt A B P

/-- Finite integral Dedekind towers detect tameness in both steps through prime lifting. -/
theorem isTamelyRamified_trans_iff (A B C : Type*)
    [CommRing A] [IsDedekindDomain A] [CommRing B] [IsDedekindDomain B]
    [CommRing C] [IsDedekindDomain C] [Algebra A B] [Algebra B C] [Algebra A C]
    [IsScalarTower A B C] [Module.Finite A B] [Module.Finite B C]
    [Module.IsTorsionFree A B] [Module.IsTorsionFree B C]
    (hinjAB : Function.Injective (algebraMap A B))
    (hinjBC : Function.Injective (algebraMap B C)) :
    IsTamelyRamified A C ↔ IsTamelyRamified A B ∧ IsTamelyRamified B C := by
  sorry

/-- Local Noether for a complete DVR with finite residue field and a finite Galois algebra. -/
theorem local_noether (A B G : Type*) [CommRing A] [IsDomain A]
    [IsDiscreteValuationRing A] [IsAdicComplete (IsLocalRing.maximalIdeal A) A]
    [Finite (IsLocalRing.ResidueField A)] [CommRing B] [IsDedekindDomain B]
    [Algebra A B] [Module.Finite A B] [Module.IsTorsionFree A B]
    [Group G] [Fintype G] [MulSemiringAction G B] [IsGaloisGroup G A B] :
    HasNIB A B G ↔ IsTamelyRamified A B := by
  sorry

/-- Stable equivalence adds the same finite free summand to both modules.
-/
def StableEquivalent (R P Q : Type*) [Ring R] [AddCommGroup P] [AddCommGroup Q]
    [Module R P] [Module R Q] : Prop :=
  ∃ n : ℕ, Nonempty ((P × (Fin n → R)) ≃ₗ[R] (Q × (Fin n → R)))

/-- A group element invisible to every linear character has determinant one in every
finite-dimensional representation. The determinant of the representation is a linear
character, so this criterion applies to group-element determinants. -/
theorem groupElement_determinant_eq_one_of_linear_characters
    {Ω G : Type*} [Field Ω] [Group G] (g : G)
    (hlinear : ∀ χ : G →* Ω, χ g = 1)
    (n : ℕ) (ρ : Representation Ω G (Fin n → Ω)) :
    LinearMap.det (ρ g) = 1 := by
  exact hlinear ((LinearMap.det :
    ((Fin n → Ω) →ₗ[Ω] (Fin n → Ω)) →* Ω).comp ρ)

/-- Evaluation in a finite-dimensional representation gives the splitting-field determinant. -/
noncomputable def groupRingDeterminant {R Ω G : Type*} [CommRing R] [Field Ω]
    [Group G] (ι : R →+* Ω) (x : MonoidAlgebra R G) (n : ℕ)
    (ρ : Representation Ω G (Fin n → Ω)) : Ω :=
  LinearMap.det (ρ.asAlgebraHom (MonoidAlgebra.mapRingHom G ι x))

/-- Invariant unit determinants over a totally ramified tame extension descend to the
base integer ring. Inertia acts on coefficients, and equality in every representation
expresses equality of character determinants. -/
theorem tameInertia_determinant_descent
    (R S Ω G : Type*) [CommRing R] [IsDomain R] [CharZero R]
    [IsDiscreteValuationRing R] [IsAdicComplete (IsLocalRing.maximalIdeal R) R]
    [CommRing S] [IsDomain S] [CharZero S] [IsDiscreteValuationRing S]
    [IsAdicComplete (IsLocalRing.maximalIdeal S) S]
    [Algebra R S] [Module.Finite R S] [Module.Free R S]
    [IsLocalHom (algebraMap R S)]
    [Fintype (S ≃ₐ[R] S)] [IsGaloisGroup (S ≃ₐ[R] S) R S]
    [Finite (IsLocalRing.ResidueField R)] [Finite (IsLocalRing.ResidueField S)]
    [Field Ω] [IsAlgClosed Ω] [CharZero Ω] [Group G] [Fintype G]
    (ℓ : ℕ) [Fact ℓ.Prime]
    [CharP (IsLocalRing.ResidueField R) ℓ] [CharP (IsLocalRing.ResidueField S) ℓ]
    (hRS : Function.Injective (algebraMap R S))
    (hres : Function.Bijective (IsLocalRing.ResidueField.map (algebraMap R S)))
    (htame : Nat.Coprime (Fintype.card (S ≃ₐ[R] S)) ℓ)
    (ι : S →+* Ω) (hι : Function.Injective ι) (u : (MonoidAlgebra S G)ˣ)
    (hfixed : ∀ (σ : S ≃ₐ[R] S) (n : ℕ) (ρ : Representation Ω G (Fin n → Ω)),
      groupRingDeterminant (ι.comp σ.toRingHom) (u : MonoidAlgebra S G) n ρ =
        groupRingDeterminant ι (u : MonoidAlgebra S G) n ρ) :
    ∃ v : (MonoidAlgebra R G)ˣ,
      ∀ (n : ℕ) (ρ : Representation Ω G (Fin n → Ω)),
        groupRingDeterminant (ι.comp (algebraMap R S)) (v : MonoidAlgebra R G) n ρ =
          groupRingDeterminant ι (u : MonoidAlgebra S G) n ρ := by
  sorry

end GaloisModules

/-!
The attached-curve identities `eval_preΨ₄_edsCurve` and `eval_Ψ₃_edsCurve` are specified
in README §2.21 on its explicitly constructed Weierstrass curve.

The README also states the interfaces for higher residue symbols, Cartier operators,
matrix normal forms, integer-valued polynomial ideals, numerical semigroups,
number-field presentations, capacity and conformal radius, and integral Galois modules.
Bach's bound `isFactorBaseBound_of_grh`, the Belabas–Diaz y Diaz–Friedman targets
`isFactorBaseBound_of_weil_inequality` (with an admissible even Weil test function) and
`isFactorBaseBound_of_sum_gt`, the explicit prime
ideal theorem and the truncated Euler sum (§§5.1b, 5.1c and 5.16a (i)–(ii)) assume Riemann hypotheses for
continued Dedekind and class-group L-functions, which have no carrier at the pins; they are
README targets.
Their constructions require carriers or comparison theory beyond the light definitions
in this file. In particular, balanced scalar change, the character-idele quotient,
root-number classes and the integral group logarithm remain README targets. The Gauss/root
interfaces of §§7.13 and 7.30 transport ArithmeticGaloisRepresentations' local constants
and completed Artin equation with the stated dual, trace character and self-dual measure;
§7.47 carries the common coefficient-base map through its lattice twist and projection
formula. Sections 7.115 and 7.118 specify the logarithm on the full equivariant,
unit-valued virtual-character Hom group, the residual torsion in that carrier, and the
paired Gauss/determinant congruences that prove integrality. The group-element criterion
`groupElement_determinant_eq_one_of_linear_characters` records its narrower domain;
the quaternion rejection example has trivial linear values without belonging to that domain.
The README also specifies the projective height comparison with its actual point at infinity.
-/

end TauCetiRoadmap.ClassicalArithmeticCompletion
