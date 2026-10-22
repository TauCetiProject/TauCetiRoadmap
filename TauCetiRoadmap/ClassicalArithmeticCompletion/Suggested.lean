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

/-- Zero modulus means equality, so the remaining congruence is a genuine condition. -/
example (a b n : ℤ) :
    (∃ x : ℤ, x ≡ a [ZMOD 0] ∧ x ≡ b [ZMOD n]) ↔ a ≡ b [ZMOD n] := by
  sorry

/-- Compatible noncoprime moduli give a class modulo their lcm. -/
example : ∃ x : ℤ, x ≡ 1 [ZMOD 4] ∧ x ≡ 3 [ZMOD 6] := by
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

/-- The zero-exponent count includes every nonzero element. -/
example : Nat.card {b : ZMod 7 // b ≠ 0 ∧ b ^ 0 = 1} = 6 := by
  sorry

/-- A primary Gaussian integer has residue one modulo `(1+i)^3`.
The full README API includes `IsPrimaryGaussian.div_intCast`,
`IsPrimaryGaussian.exists_prod_primary_primes`, `IsPrimaryGaussian.norm_sub_one_div_four`,
`isPrimaryGaussian_add_mul_iff`, `isPrimaryGaussian_intCast_iff`.
-/
def IsPrimaryGaussian (z : GaussianInt) : Prop :=
  (⟨1, 1⟩ : GaussianInt) ^ 3 ∣ z - 1

/-- This primary norm-five element fixes the choice of associate. -/
example : IsPrimaryGaussian (⟨-1, 2⟩ : GaussianInt) := by
  sorry

/-- Odd real part and even imaginary part alone do not imply the primary congruence. -/
example : ¬ IsPrimaryGaussian (⟨1, 2⟩ : GaussianInt) := by
  sorry

/-- Changing the unit by minus one changes the primary congruence. -/
example : IsPrimaryGaussian 1 ∧ ¬ IsPrimaryGaussian (-1) := by
  sorry

end Residues

/-! ## Layer 2: sequences and generating functions -/

namespace Sequences

/-- Rationality has a denominator invertible as a power series and no numerator-degree bound. -/
def IsRational {K : Type*} [Field K] (f : PowerSeries K) : Prop :=
  ∃ P Q : Polynomial K, Q.coeff 0 ≠ 0 ∧ f * (Q : PowerSeries K) = (P : PowerSeries K)

/-- The geometric series is rational. -/
example : IsRational (PowerSeries.mk fun _ : ℕ => (1 : ℚ)) := by
  sorry

/-- The Fibonacci generating series has denominator `1 - X - X²`. -/
example : IsRational (PowerSeries.mk fun n => (Nat.fib n : ℚ)) := by
  sorry

/-- The exponential series is a non-example in characteristic zero. -/
example : ¬ IsRational (PowerSeries.mk fun n : ℕ => (1 : ℚ) / n.factorial) := by
  sorry

/-- First-kind Lucas sequence, retaining the repeated-root cases.
The full README API includes `lucasU_add_two`, `lucasU_mul_sub`, `lucasU_one`, `lucasU_one_neg_one`,
`lucasU_succ_eq_eval_dickson`, `lucasU_two_mul`, `lucasU_zero`.
-/
def lucasU {R : Type*} [CommRing R] (P Q : R) : ℕ → R
  | 0 => 0
  | 1 => 1
  | n + 2 => P * lucasU P Q (n + 1) - Q * lucasU P Q n

/-- Second-kind Lucas sequence with initial values two and P.

The full README API includes `lucasV_add_two`, `lucasV_eq_add_pow`, `lucasV_eq_eval_dickson`,
`lucasV_one`, `lucasV_sq_sub`, `lucasV_zero`.
-/
def lucasV {R : Type*} [CommRing R] (P Q : R) : ℕ → R
  | 0 => 2
  | 1 => P
  | n + 2 => P * lucasV P Q (n + 1) - Q * lucasV P Q n

/-- Repeated roots give a linear first-kind sequence. -/
example (n : ℕ) : lucasU (2 : ℤ) 1 n = n := by
  sorry

/-- The sign of Q is witnessed by Fibonacci. -/
example (n : ℕ) : lucasU (1 : ℤ) (-1) n = Nat.fib n := by
  sorry

/-- The first-kind parameters three and two give the Mersenne values. -/
example (n : ℕ) : lucasU (3 : ℤ) 2 n = 2 ^ n - 1 := by
  sorry

/-- Second-kind values distinguish the two recurrence parameters. -/
example (n : ℕ) : lucasV (3 : ℤ) 2 n = 2 ^ n + 1 := by
  sorry

/-- The repeated-root second-kind sequence is constant. -/
example (n : ℕ) : lucasV (2 : ℤ) 1 n = 2 := by
  sorry

/-- Doubling the index gives Mathlib's Lucas–Lehmer recurrence. -/
example (i : ℕ) : lucasV (4 : ℤ) 1 (2 ^ i) = LucasLehmer.s i := by
  sorry

/-- Strong divisibility requires coprime integer parameters. -/
theorem gcd_lucasU {P Q : ℤ} (h : IsCoprime P Q) (m n : ℕ) :
    Int.gcd (lucasU P Q m) (lucasU P Q n) =
      (lucasU P Q (Nat.gcd m n)).natAbs := by
  sorry

/-- A finite-output automaton; state finiteness is imposed by automaticity.

The full README API includes `DFAO.evalFrom_append`, `DFAO.evalFrom_cons`, `DFAO.evalFrom_nil`,
`DFAO.eval_mapOutput`, `DFAO.eval_prod`, `DFAO.eval_toDFA`, `DFAO.mem_accepts_toDFA`.
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

/-- Noncommuting transitions detect a mistaken reversal. -/
example :
    (⟨fun q b => if b then 2 * q else q + 1, 0, id⟩ : DFAO Bool (ZMod 3) (ZMod 3)).eval
      [false, true] = 2 ∧
    (⟨fun q b => if b then 2 * q else q + 1, 0, id⟩ : DFAO Bool (ZMod 3) (ZMod 3)).eval
      [true, false] = 1 := by
  sorry

/-- The empty word reads the initial state. -/
example {α σ Δ : Type*} (M : DFAO α σ Δ) : M.eval [] = M.start := by
  sorry

/-- Least-significant-first automaticity, using Mathlib's radix digits.
The full README API includes `IsAutomatic.finite_range`, `isAutomatic_const`,
`isAutomatic_of_eventually_periodic`, `isAutomatic_thueMorse`.
-/
def IsAutomatic (k : ℕ) [NeZero k] {Δ : Type*} (a : ℕ → Δ) : Prop :=
  ∃ (σ : Type) (_ : Fintype σ) (M : DFAO (Fin k) σ Δ),
    ∀ n, a n = M.output (M.eval ((Nat.digits k n).map (Fin.ofNat k)))

/-- The k-kernel consists of all radix subsequences with a valid residue.

The full README API includes `kernel_subset`, `kernel_thueMorse`.
-/
def kernel (k : ℕ) {Δ : Type*} (a : ℕ → Δ) : Set (ℕ → Δ) :=
  {b | ∃ e r : ℕ, r < k ^ e ∧ b = fun n => a (k ^ e * n + r)}

/-- Constant sequences are automatic in every genuine radix. -/
example (k : ℕ) [NeZero k] (hk : 2 ≤ k) (c : ℤ) :
    IsAutomatic k (fun _ : ℕ => c) := by
  sorry

/-- The Thue–Morse sequence, the parity of the binary digit sum, is 2-automatic. -/
example : IsAutomatic 2 (fun n : ℕ => (Nat.digits 2 n).sum % 2) := by
  sorry

/-- An infinite range excludes automaticity with finitely many states. -/
example : ¬ IsAutomatic 2 (fun n : ℕ => n) := by
  sorry

/-- Exponent zero includes the original sequence in its kernel. -/
example {Δ : Type*} (a : ℕ → Δ) : a ∈ kernel 2 a := by
  sorry

/-- A constant sequence has a singleton kernel. -/
example (c : ℤ) : kernel 2 (fun _ : ℕ => c) = {fun _ : ℕ => c} := by
  sorry

/-- The parity kernel contains the sequence and the two constant subsequences. -/
example : kernel 2 (fun n : ℕ => n % 2) =
    {fun n => n % 2, fun _ => 0, fun _ => 1} := by
  sorry

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

/-- The rectangular zero diagonal has no artificial pivot. -/
example : smithDiag 2 3 (fun i : Fin 0 => Fin.elim0 i) = 0 := by
  sorry

/-- The displayed positive chain has the prescribed matrix entries. -/
example : smithDiag 2 2 ![1, 6] = !![(1 : ℤ), 0; 0, 6] := by
  sorry

/-- Positivity and the divisibility chain force the diagonal `(1,6)` for `diag(2,3)`. -/
example {r : ℕ} (d : Fin r → ℕ)
    (P Q : Matrix (Fin 2) (Fin 2) ℤ) (hr : r ≤ 2)
    (hd : ∀ i, 0 < d i) (hchain : ∀ i j, i ≤ j → d i ∣ d j)
    (hP : IsUnit P.det) (hQ : IsUnit Q.det)
    (hdiag : P * !![(2 : ℤ), 0; 0, 3] * Q = smithDiag 2 2 d) :
    List.ofFn d = [1, 6] := by
  sorry

/-- A singular Smith decomposition retains exactly its positive nonzero factor. -/
example {r : ℕ} (d : Fin r → ℕ)
    (P Q : Matrix (Fin 2) (Fin 2) ℤ) (hr : r ≤ 2)
    (hd : ∀ i, 0 < d i) (hchain : ∀ i j, i ≤ j → d i ∣ d j)
    (hP : IsUnit P.det) (hQ : IsUnit Q.det)
    (hdiag : P * !![(2 : ℤ), 0; 0, 0] * Q = smithDiag 2 2 d) :
    List.ofFn d = [2] := by
  sorry

/-- Integer-valued means values in the coefficient domain, rather than coefficients in it. -/
def IsIntegerValued {D K : Type*} [CommRing D] [Field K] [Algebra D K]
    (f : Polynomial K) : Prop :=
  ∀ x : D, ∃ y : D, f.eval (algebraMap D K x) = algebraMap D K y

/-- The binomial polynomial is integer-valued despite its rational coefficients. -/
example : IsIntegerValued (D := ℤ) (C (1 / 2 : ℚ) * X * (X - 1)) := by
  sorry

/-- The cubic difference is divisible by three at every integer. -/
example : IsIntegerValued (D := ℤ) (C (1 / 3 : ℚ) * (X ^ 3 - X)) := by
  sorry

/-- The polynomial X/2 fails at the integer one. -/
example : ¬ IsIntegerValued (D := ℤ) (C (1 / 2 : ℚ) * X) := by
  sorry

/-- Perron's weak criterion includes both endpoint exclusions and nonzero constant term. -/
theorem perron_irreducible_of_le {f : ℤ[X]} (hmon : f.Monic) (h2 : 2 ≤ f.natDegree)
    (h0 : f.coeff 0 ≠ 0)
    (hP : 1 + ∑ i ∈ Finset.range (f.natDegree - 1), |f.coeff i| ≤
      |f.coeff (f.natDegree - 1)|)
    (hpos : f.eval 1 ≠ 0) (hneg : f.eval (-1) ≠ 0) : Irreducible f := by
  sorry

/-- Equality really occurs in this irreducible example. -/
example : Irreducible (X ^ 2 + C (2 : ℤ) * X - 1) := by
  sorry

/-- Reality cannot be dropped from the boundary exclusion argument. -/
example :
    (X ^ 2 - C (2 * Complex.I) * X - 1 : Polynomial ℂ).eval Complex.I = 0 := by
  sorry

end Certificates

/-! ## Layer 4: classical Diophantine equations -/

namespace Diophantine

/-- For discriminants 4m, Pell coordinates double only the first coordinate. -/
example (m x y : ℤ) (h : x ^ 2 - m * y ^ 2 = 1) :
    (2 * x) ^ 2 - (4 * m) * y ^ 2 = 4 := by
  sorry

/-- The discriminant-twelve solution detects doubling the wrong coordinate. -/
example : (4 : ℤ) ^ 2 - 12 * 1 ^ 2 = 4 ∧ (4 : ℤ) ^ 2 - 12 * 2 ^ 2 = -32 := by
  sorry

/-- Ordered coefficient-three Markoff triples.
The full README API includes `markoffSet.comp_perm_mem_iff`, `markoffSet.map_mem`,
`markoffSet.mem_iff`, `markoffSet.ones_mem`, `markoffSet.zero_mem`.
-/
def markoffSet (R : Type*) [CommRing R] : Set (Fin 3 → R) :=
  {x | x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 = 3 * x 0 * x 1 * x 2}

/-- One Vieta move changes only the selected coordinate.

The full README API includes `markoffVieta_add_self`, `markoffVieta_apply_of_ne`,
`markoffVieta_apply_self`, `markoffVieta_map`, `markoffVieta_zero`.
-/
def markoffVieta {R : Type*} [CommRing R] (i : Fin 3) (x : Fin 3 → R) : Fin 3 → R :=
  fun j => if j = i then 3 * ∏ k ∈ Finset.univ.erase i, x k - x i else x j

/-- The initial positive triple. -/
example : ![(1 : ℤ), 1, 1] ∈ markoffSet ℤ := by
  sorry

/-- Modulo three the nonzero locus has the eight sign triples. -/
example : ![(1 : ZMod 3), 1, -1] ∈ markoffSet (ZMod 3) := by
  sorry

/-- The two coefficient conventions have different cardinalities in characteristic three. -/
example :
    Nat.card {x : Fin 3 → ZMod 3 // x ∈ markoffSet (ZMod 3)} = 9 ∧
    Nat.card {x : Fin 3 → ZMod 3 // x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 = x 0 * x 1 * x 2} = 1 := by
  sorry

/-- The largest-coordinate move descends to the root. -/
example : markoffVieta 2 ![(1 : ℤ), 1, 2] = ![1, 1, 1] := by
  sorry

/-- Moving a different coordinate gives the next positive triple. -/
example : markoffVieta 0 ![(1 : ℤ), 1, 2] = ![5, 1, 2] := by
  sorry

/-- Every positive Markoff triple descends by one Vieta move unless it is the root. -/
theorem markoff_descent (x : Fin 3 → ℤ) (hx : x ∈ markoffSet ℤ)
    (hpos : ∀ i, 0 < x i) (hroot : x ≠ ![1, 1, 1]) :
    ∃ i, markoffVieta i x ∈ markoffSet ℤ ∧
      (∀ j, 0 < markoffVieta i x j) ∧
      (∑ j, markoffVieta i x j) < ∑ j, x j := by
  sorry

/-- Markoff–Hurwitz sets retain all coordinates, ring characteristics and parameters.

The full README API includes `markoffHurwitzSet.comp_perm_mem_iff`, `markoffHurwitzSet.map_mem`,
`markoffHurwitzSet.mem_iff`, `markoffHurwitzSet.signChange_mem_iff`, `markoffHurwitzSet_three_one`,
`markoffHurwitzSet_three_three_zero`.
-/
def markoffHurwitzSet {R : Type*} [CommRing R] (n : ℕ) (a k : R) :
    Set (Fin n → R) := {x | ∑ i, x i ^ 2 = a * ∏ i, x i + k}

/-- Generalised Vieta move for coefficient a.

The full README API includes `markoffHurwitzMove_apply_of_ne`, `markoffHurwitzMove_apply_self`,
`markoffHurwitzMove_involutive`, `markoffHurwitzMove_map`, `markoffHurwitzMove_mem`,
`markoffHurwitzMove_three_one`, `markoffHurwitzMove_three_three`.
-/
def markoffHurwitzMove {R : Type*} [CommRing R] {n : ℕ} (a : R) (j : Fin n)
    (x : Fin n → R) : Fin n → R :=
  fun i => if i = j then a * ∏ t ∈ Finset.univ.erase j, x t - x j else x i

/-- Coefficient-one level eight is distinct from coefficient-three level zero. -/
example : ![(2 : ℤ), 3, 5] ∈ markoffHurwitzSet 3 1 8 := by
  sorry

/-- Level three has no point modulo four, so reduction to that target is surjective. -/
example : markoffHurwitzSet (R := ZMod 4) 3 1 3 = ∅ := by
  sorry

/-- The negative fundamental branch uses the minus sign in its quadratic norm reduction. -/
example : ![(3 : ℤ), 3, 4] ∈ markoffHurwitzSet 3 1 (-2) ∧
    (2 * (4 : ℤ) - 3 * 3) ^ 2 - (3 ^ 2 - 4) * 3 ^ 2 = 4 * (-2 - 3 ^ 2) := by
  sorry

/-- Unrestricted quadratic roots can grow as the square root of the modulus parameter. -/
example (p : ℕ) (hp : p.Prime) (hodd : p ≠ 2) :
    Nat.card {b : Fin (2 * p ^ 2) //
      (b.val : ℤ) ^ 2 ≡ ((p : ℤ) ^ 2 + 2) ^ 2 - 4 [ZMOD (4 * (p : ℤ) ^ 2)]} = p := by
  sorry

/-- An even-dimensional example tests the full coordinate product. -/
example : ![(1 : ℤ), 1, 1, 1] ∈ markoffHurwitzSet 4 4 0 := by
  sorry

/-- The generalised move preserves every level. -/
example {R : Type*} [CommRing R] {n : ℕ} (a k : R) (j : Fin n)
    (x : Fin n → R) (hx : x ∈ markoffHurwitzSet n a k) :
    markoffHurwitzMove a j x ∈ markoffHurwitzSet n a k := by
  sorry

/-- Generalised moves are actual involutions, even in small characteristic. -/
example {R : Type*} [CommRing R] {n : ℕ} (a : R) (j : Fin n) :
    Function.Involutive (markoffHurwitzMove a j) := by
  sorry

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

/-- The full semigroup has no gaps. -/
example : (((⊤ : AddSubmonoid ℕ) : Set ℕ)ᶜ).Finite := by
  sorry

/-- Even numbers do not form a numerical semigroup. -/
example : ¬ ((Set.range fun n : ℕ => 2 * n)ᶜ).Finite := by
  sorry

/-- The full semigroup's Apéry set consists of the first n naturals. -/
example (n : ℕ) (hn : 0 < n) : aperySet ⊤ n = {s | s < n} := by
  sorry

/-- For the semigroup generated by 3 and 5, the Apéry set at 3 has maximum ten. -/
example : aperySet (AddSubmonoid.closure ({3, 5} : Set ℕ)) 3 = {0, 5, 10} := by
  sorry

/-- A finite set of positive denominators whose unit fractions sum to `r`; being a set, it
cannot repeat a denominator.
The full README API includes `isEgyptianExpansion_empty_iff`, `isEgyptianExpansion_singleton`.
-/
def IsEgyptianExpansion (r : ℚ) (D : Finset ℕ) : Prop :=
  0 ∉ D ∧ ∑ d ∈ D, (1 : ℚ) / d = r

/-- A classical two-term expansion. -/
example : IsEgyptianExpansion (5 / 6) {2, 3} := by
  sorry

/-- Three distinct positive denominators expand one. -/
example : IsEgyptianExpansion 1 {2, 3, 6} := by
  sorry

/-- The repeated sum `1/3 + 1/3` is not available: `{3}` expands `1/3`, not `2/3`. -/
example : ¬ IsEgyptianExpansion (2 / 3) {3} := by
  sorry

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

The full README API includes `quadraticUnitAction_add`, `quadraticUnitAction_free_generator`,
`quadraticUnitAction_norm`, `quadraticUnitAction_parameter`,
`quadraticUnitAction_torsion_generator`.
-/
def quadraticUnitAction (s : ZMod 2) (x : ℤ × ZMod 2) : ℤ × ZMod 2 :=
  (-x.1, x.2 + s * (x.1 : ZMod 2))

/-- Norm-minus-one generators have nonzero shear. -/
example : quadraticUnitAction 1 (1, 0) = (-1, 1) := by
  sorry

/-- Norm-one generators reverse the free coordinate without a torsion shear. -/
example : quadraticUnitAction 0 (1, 0) = (-1, 0) := by
  sorry

/-- Even exponents kill the shear. -/
example : quadraticUnitAction 1 (2, 1) = (-2, 1) := by
  sorry

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
(README §5.1a).

The full README API includes `IsFactorBaseBound.mono`, `isFactorBaseBound_minkowski`,
`isFactorBaseBound_iff_classNumber_eq_one`, `IsFactorBaseBound.of_mem_closure`.
-/
def IsFactorBaseBound (K : Type*) [Field K] [NumberField K] (T : ℝ) : Prop :=
  Subgroup.closure (ClassGroup.mk0 '' {I : (Ideal (𝓞 K))⁰ |
    (I : Ideal (𝓞 K)).IsPrime ∧ (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ T}) = ⊤

/-- Class number one: every real number, even one below the least prime norm, is a bound. -/
example (T : ℝ) : IsFactorBaseBound ℚ T :=
  haveI := (Fintype.card_le_one_iff_subsingleton (α := ClassGroup (𝓞 ℚ))).mp Rat.classNumber_eq.le
  Subsingleton.elim _ _

/-- A larger bound keeps every generator. -/
theorem IsFactorBaseBound.mono {K : Type*} [Field K] [NumberField K] {T T' : ℝ}
    (h : IsFactorBaseBound K T) (hT : T ≤ T') : IsFactorBaseBound K T' :=
  eq_top_iff.mpr <| (eq_top_iff.mp h).trans <|
    Subgroup.closure_mono <| Set.image_mono fun _ hI => ⟨hI.1, hI.2.trans hT⟩

/-- Minkowski's bound, in the form of README §5.1, is a factor-base bound. -/
theorem isFactorBaseBound_minkowski (K : Type*) [Field K] [NumberField K] :
    IsFactorBaseBound K ((4 / Real.pi) ^ InfinitePlace.nrComplexPlaces K *
      ((Module.finrank ℚ K).factorial / (Module.finrank ℚ K : ℝ) ^ Module.finrank ℚ K *
        Real.sqrt |(discr K : ℝ)|)) := by
  sorry

/-- Below the least prime norm 2 the generating set is empty. -/
theorem isFactorBaseBound_iff_classNumber_eq_one {K : Type*} [Field K] [NumberField K] {T : ℝ}
    (hT : T < 2) : IsFactorBaseBound K T ↔ classNumber K = 1 := by
  sorry

/-- A bound may be lowered once the primes up to the old bound lie in the smaller subgroup. -/
theorem IsFactorBaseBound.of_mem_closure {K : Type*} [Field K] [NumberField K] {T₀ T : ℝ}
    (h : IsFactorBaseBound K T)
    (hmem : ∀ I : (Ideal (𝓞 K))⁰, (I : Ideal (𝓞 K)).IsPrime →
      (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ T →
      ClassGroup.mk0 I ∈ Subgroup.closure (ClassGroup.mk0 '' {J : (Ideal (𝓞 K))⁰ |
        (J : Ideal (𝓞 K)).IsPrime ∧ (Ideal.absNorm (J : Ideal (𝓞 K)) : ℝ) ≤ T₀})) :
    IsFactorBaseBound K T₀ := by
  sorry

/-- The discrete-logarithm matrix modulo `p` of `v` at the primes `P i` has full column rank,
stated without choosing generators: exponents killing every `p`-th power residue character are
divisible by `p` (README §5.3a).

The full README API includes `isMaxRank_and_not_dvd_index_of_powerResidueIndependent`,
`isMaxRank_and_not_dvd_index_of_powerResidueIndependent_torsion`,
`dvd_of_isPrincipal_prod_pow_of_powerResidueIndependent`.
-/
def PowerResidueIndependent {K : Type*} [Field K] [NumberField K] {ι : Type*} [Fintype ι]
    {m : ℕ} (p : ℕ) (P : Fin m → Ideal (𝓞 K)) (v : ι → 𝓞 K) : Prop :=
  ∀ e : ι → ℕ, (∀ i, ∏ j, Ideal.Quotient.mk (P i) (v j) ^
      (e j * ((Ideal.absNorm (P i) - 1) / p)) = 1) → ∀ j, p ∣ e j

/-- The empty family is independent, as for unit rank zero. -/
example {K : Type*} [Field K] [NumberField K] {m : ℕ} (p : ℕ) (P : Fin m → Ideal (𝓞 K)) :
    PowerResidueIndependent p P (Fin.elim0 : Fin 0 → 𝓞 K) :=
  fun _ _ j => j.elim0

/-- A family containing `1`, a `p`-th power, is never independent. -/
example {K : Type*} [Field K] [NumberField K] {m : ℕ} (P : Fin m → Ideal (𝓞 K)) :
    ¬ PowerResidueIndependent 2 P (fun _ : Fin 1 => (1 : 𝓞 K)) := fun h => by
  simpa using h (fun _ => 1) (by simp) 0

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

/-- Polynomial Mahler measure retains every occurrence in the multiset of complex roots. -/
example (p : Polynomial ℂ) :
    p.mahlerMeasure = ‖p.leadingCoeff‖ *
      (p.roots.map (fun z => max 1 ‖z‖)).prod := by
  exact Polynomial.mahlerMeasure_eq_leadingCoeff_mul_prod_roots p

/-- A repeated root contributes twice to the logarithmic measure and twice to the product. -/
example :
    ((X - C 2) ^ 2 : Polynomial ℂ).mahlerMeasure = 4 ∧
    ((X - C 2) ^ 2 : Polynomial ℂ).logMahlerMeasure = 2 * Real.log 2 := by
  sorry

/-- Polynomial Mahler measure is multiplicative, including zero factors and repeated roots. -/
example (p q : Polynomial ℂ) :
    (p * q).mahlerMeasure = p.mahlerMeasure * q.mahlerMeasure := by
  exact Polynomial.mahlerMeasure_mul p q

/-- Logarithmic polynomial Mahler measure is additive for a nonzero product. -/
example (p q : Polynomial ℂ) (hpq : p * q ≠ 0) :
    (p * q).logMahlerMeasure = p.logMahlerMeasure + q.logMahlerMeasure := by
  exact Polynomial.logMahlerMeasure_mul_eq_add_logMahlerMeasure hpq

/-- The zero and unit polynomials distinguish multiplicative and logarithmic conventions. -/
example :
    (0 : Polynomial ℂ).mahlerMeasure = 0 ∧
    (0 : Polynomial ℂ).logMahlerMeasure = 0 ∧
    (1 : Polynomial ℂ).mahlerMeasure = 1 ∧
    (1 : Polynomial ℂ).logMahlerMeasure = 0 := by
  simp

/-!
The scalar power laws and Kronecker criterion of README §§6.15–6.16 are supplied by
HeightsAndUnits §1.3 on Mathlib's absolute-height carriers. These examples fix their
normalization and algebraicity boundary without introducing duplicate scalar theorems.
-/

/-- A fourth root of unity has absolute logarithmic height zero. -/
example : NumberField.absLogHeight₁ Complex.I = 0 := by
  sorry

/-- Unit-circle conjugates of a nonintegral algebraic number can have positive height. -/
example :
    ‖((3 + 4 * Complex.I) / 5 : ℂ)‖ = 1 ∧
    NumberField.absLogHeight₁ ((3 + 4 * Complex.I) / 5 : ℂ) = Real.log 5 / 2 := by
  sorry

/-- Transcendental height zero witnesses the algebraicity boundary of Kronecker's criterion. -/
example (x : ℝ) (hx : ¬ IsAlgebraic ℚ x) :
    NumberField.absLogHeight₁ x = 0 ∧ x ≠ 0 ∧
      ¬ ∃ n : ℕ, 0 < n ∧ x ^ n = 1 := by
  sorry

/-- Pisot numbers include degree-one integers at least two, and exclude nonintegral rationals.

The full README API includes `IsPisot.eq_of_one_le_norm`, `IsPisot.norm_lt_one`, `IsPisot.one_lt`,
`isPisot_iff_minpoly_rat`, `isPisot_natCast_iff`, `isPisot_plasticNumber`.
-/
def IsPisot (θ : ℝ) : Prop :=
  IsIntegral ℤ θ ∧ 1 < θ ∧
    ∀ z ∈ (minpoly ℤ θ).aroots ℂ, z ≠ (θ : ℂ) → ‖z‖ < 1

/-- Salem numbers have another conjugate on the unit circle.

The full README API includes `IsSalem.even_natDegree`, `IsSalem.exists_norm_eq_one`,
`IsSalem.four_le_natDegree`, `IsSalem.isConjRoot_inv`, `IsSalem.norm_le_one`, `IsSalem.not_isPisot`,
`IsSalem.one_lt`.
-/
def IsSalem (τ : ℝ) : Prop :=
  IsIntegral ℤ τ ∧ 1 < τ ∧
    (∀ z ∈ (minpoly ℤ τ).aroots ℂ, z ≠ (τ : ℂ) → ‖z‖ ≤ 1) ∧
    ∃ z ∈ (minpoly ℤ τ).aroots ℂ, ‖z‖ = 1

/-- Degree-one integer Pisot numbers fix the lower endpoint. -/
example : IsPisot 2 ∧ ¬ IsPisot 1 := by
  sorry

/-- Having no other conjugate does not excuse failure of integrality. -/
example : ¬ IsPisot (3 / 2) := by
  sorry

/-- The golden ratio has its other conjugate strictly inside the unit disc. -/
example : IsPisot Real.goldenRatio := by
  sorry

/-- The negative conjugate of square root two lies outside the unit disc. -/
example : ¬ IsPisot (Real.sqrt 2) := by
  sorry

/-- The golden-ratio polynomial has Mahler measure equal to its positive root. -/
example : (X ^ 2 - X - 1 : Polynomial ℂ).mahlerMeasure = Real.goldenRatio := by
  sorry

/-- Quadratic Pisot examples distinguish having one large conjugate from having two. -/
example : IsPisot (1 + Real.sqrt 3) ∧
    ¬ IsPisot (3 + Real.sqrt 2) ∧ ¬ IsSalem (3 + Real.sqrt 2) := by
  sorry

/-- The golden ratio is Pisot rather than Salem. -/
example : ¬ IsSalem Real.goldenRatio := by
  sorry

/-- Integers and reciprocal quadratic units have no conjugate on the unit circle. -/
example : ¬ IsSalem 2 ∧ ¬ IsSalem ((3 + Real.sqrt 5) / 2) := by
  sorry

/-- A reciprocal quartic gives a genuine Salem reference root. -/
example : IsSalem (sSup {x : ℝ | x ^ 4 - 3 * x ^ 3 + 3 * x ^ 2 - 3 * x + 1 = 0}) := by
  sorry

/-- The Salem quartic's Mahler measure is its largest real root. -/
example : (X ^ 4 - C (3 : ℂ) * X ^ 3 + C 3 * X ^ 2 - C 3 * X + 1).mahlerMeasure =
    sSup {x : ℝ | x ^ 4 - 3 * x ^ 3 + 3 * x ^ 2 - 3 * x + 1 = 0} := by
  sorry

/-- Lehmer's largest root gives the degree-ten Salem example. -/
example : IsSalem (sSup {x : ℝ |
    x ^ 10 + x ^ 9 - x ^ 7 - x ^ 6 - x ^ 5 - x ^ 4 - x ^ 3 + x + 1 = 0}) := by
  sorry

/-- Positive powers retain the Salem condition. -/
theorem IsSalem.pow {τ : ℝ} (h : IsSalem τ) {n : ℕ} (hn : 0 < n) :
    IsSalem (τ ^ n) := by
  sorry

/-- Positive powers retain the Pisot condition. -/
theorem IsPisot.pow {θ : ℝ} (h : IsPisot θ) {n : ℕ} (hn : 0 < n) :
    IsPisot (θ ^ n) := by
  sorry

/-- Squaring the golden ratio remains Pisot. -/
example : IsPisot (Real.goldenRatio ^ 2) := by
  sorry

/-- Cubing the plastic number realizes its defining equation and remains Pisot. -/
example :
    let θ := sSup {x : ℝ | x ^ 3 - x - 1 = 0}
    IsPisot (θ ^ 3) ∧ θ ^ 3 = θ + 1 := by
  sorry

/-- Squaring the quartic and degree-ten Salem roots preserves their degrees. -/
example :
    let τ₄ := sSup {x : ℝ | x ^ 4 - 3 * x ^ 3 + 3 * x ^ 2 - 3 * x + 1 = 0}
    let τ₁₀ := sSup {x : ℝ |
      x ^ 10 + x ^ 9 - x ^ 7 - x ^ 6 - x ^ 5 - x ^ 4 - x ^ 3 + x + 1 = 0}
    IsSalem (τ₄ ^ 2) ∧ (minpoly ℤ (τ₄ ^ 2)).natDegree = 4 ∧
      IsSalem (τ₁₀ ^ 2) ∧ (minpoly ℤ (τ₁₀ ^ 2)).natDegree = 10 := by
  sorry

/-- The sharp Schinzel–Zassenhaus bound in a carrier-free polynomial form. -/
theorem schinzel_zassenhaus {P : Polynomial ℤ} (hP : P.Monic) (hirr : Irreducible P)
    (hdeg : 0 < P.natDegree) (h0 : P.coeff 0 ≠ 0)
    (hcycl : ∀ n : ℕ, 0 < n → P ≠ cyclotomic n ℤ) :
    ∃ z ∈ P.aroots ℂ, Real.rpow 2 (1 / (4 * (P.natDegree : ℝ))) ≤ ‖z‖ := by
  sorry

/-- The quadratic and degree-ten examples satisfy their respective house bounds. -/
example : Real.rpow 2 (1 / 8) ≤ Real.goldenRatio ∧
    Real.rpow 2 (1 / 40) ≤ sSup {x : ℝ |
      x ^ 10 + x ^ 9 - x ^ 7 - x ^ 6 - x ^ 5 - x ^ 4 - x ^ 3 + x + 1 = 0} := by
  sorry

/-- Cyclotomic roots have norm one and cannot satisfy the strict house growth conclusion. -/
example (n : ℕ) (hn : 0 < n) (z : ℂ) (hz : z ∈ (cyclotomic n ℤ).aroots ℂ) :
    ‖z‖ = 1 := by
  sorry

/-- Schur sequences have a holomorphic witness and a closed norm bound on the open disc.

The full README API includes `RealSchurSeries.coeff_zero_eq`, `RealSchurSeries.function_unique`.
-/
def RealSchurSeries (e : ℕ → ℝ) : Prop :=
  ∃ f : ℂ → ℂ, DifferentiableOn ℂ f (Metric.ball 0 1) ∧
    ∀ z ∈ Metric.ball (0 : ℂ) 1,
      HasSum (fun j : ℕ => (e j : ℂ) * z ^ j) (f z) ∧ ‖f z‖ ≤ 1

/-- Boundary constant witnesses are permitted. -/
example : RealSchurSeries (fun n => if n = 0 then 1 else 0) := by
  sorry

/-- The other constant on the unit-circle boundary is also Schur. -/
example : RealSchurSeries (fun n => if n = 0 then -1 else 0) := by
  sorry

/-- Positive-degree monomials give Schur series with zero constant coefficient. -/
example (k : ℕ) (hk : 1 ≤ k) :
    RealSchurSeries (fun n => if n = k then 1 else 0) := by
  sorry

/-- A constant outside the closed unit disc is rejected. -/
example : ¬ RealSchurSeries (fun n => if n = 0 then 3 / 2 else 0) := by
  sorry

/-- A disc automorphism supplies the rational Schur example and its first coefficients. -/
example :
    let e : ℕ → ℝ := fun n => if n = 0 then 1 / 2 else (3 / 4) * (-1 / 2) ^ (n - 1)
    RealSchurSeries e ∧ e 0 = 1 / 2 ∧ e 1 = 3 / 4 ∧ e 2 = -3 / 8 ∧
      ∀ z ∈ Metric.ball (0 : ℂ) 1,
        HasSum (fun n => (e n : ℂ) * z ^ n) ((1 / 2 + z) / (1 + z / 2)) := by
  sorry

/-- A nonconstant bounded holomorphic disc witness has strict interior norm bound. -/
example (f : ℂ → ℂ) (hf : DifferentiableOn ℂ f (Metric.ball 0 1))
    (hb : ∀ z ∈ Metric.ball (0 : ℂ) 1, ‖f z‖ ≤ 1)
    (hnonconst : ∃ z ∈ Metric.ball (0 : ℂ) 1,
      ∃ w ∈ Metric.ball (0 : ℂ) 1, f z ≠ f w) :
    ∀ z ∈ Metric.ball (0 : ℂ) 1, ‖f z‖ < 1 := by
  sorry

/-- Finite pair-product diameter, with the unused small indices fixed to zero.
The full README API includes `finiteFeketeDiameter_two`.
-/
noncomputable def finiteFeketeDiameter (K : Set ℂ) (n : ℕ) : ℝ :=
  if n < 2 then 0 else
    sSup {r : ℝ | ∃ z : Fin n → ℂ, (∀ i, z i ∈ K) ∧
      r = Real.rpow (∏ i : Fin n, ∏ j ∈ Finset.univ.filter (fun j => i < j),
        ‖z i - z j‖) (2 / ((n : ℝ) * ((n : ℝ) - 1)))}

/-- Transfinite diameter is the infimum starting with two points.

The full README API includes `transfiniteDiameter_affine`, `transfiniteDiameter_finite`.
-/
noncomputable def transfiniteDiameter (K : Set ℂ) : ℝ :=
  sInf (Set.range (fun n : ℕ => finiteFeketeDiameter K (n + 2)))

/-- The diameter convention is zero at the single-point index. -/
example : finiteFeketeDiameter (Metric.closedBall (0 : ℂ) 1) 1 = 0 := by
  sorry

/-- Two points in the unit disc can have distance two. -/
example : finiteFeketeDiameter (Metric.closedBall (0 : ℂ) 1) 2 = 2 := by
  sorry

/-- The unit disc has transfinite diameter one. -/
example : transfiniteDiameter (Metric.closedBall (0 : ℂ) 1) = 1 := by
  sorry

/-- Finite compact sets have zero transfinite diameter. -/
example : transfiniteDiameter ({0, 1} : Set ℂ) = 0 := by
  sorry

/-- Finite-set examples separate pair diameter from limiting diameter. -/
example : finiteFeketeDiameter ({0, 2} : Set ℂ) 2 = 2 ∧
    finiteFeketeDiameter ({0, 2} : Set ℂ) 3 = 0 ∧
    transfiniteDiameter ({0, 2} : Set ℂ) = 0 := by
  sorry

/-- A singleton has zero finite diameter at every used index. -/
example (n : ℕ) (hn : 2 ≤ n) :
    finiteFeketeDiameter ({7} : Set ℂ) n = 0 ∧ transfiniteDiameter ({7} : Set ℂ) = 0 := by
  sorry

/-- The radius-two disc gives pair diameter four and limiting diameter two. -/
example : finiteFeketeDiameter (Metric.closedBall (0 : ℂ) 2) 2 = 4 ∧
    transfiniteDiameter (Metric.closedBall (0 : ℂ) 2) = 2 := by
  sorry

/-- The segment capacity convention differs from ordinary segment length. -/
example : transfiniteDiameter (segment ℝ (-1 : ℂ) 1) = 1 / 2 ∧
    transfiniteDiameter (segment ℝ (0 : ℂ) 1) = 1 / 4 := by
  sorry

/-- A radial hedgehog is the union of the closed radial segments.
The full README API includes `radialHedgehog_affine_scale`, `radialHedgehog_compact`,
`radialHedgehog_complement`, `radialHedgehog_eq_iUnion_segment`, `radialHedgehog_mem`,
`radialHedgehog_mono_lengths`, `radialHedgehog_norm_le`, `radialHedgehog_zero_mem`.
-/
def radialHedgehog {n : ℕ} (a : Fin n → ℂ) : Set ℂ :=
  {z | ∃ i : Fin n, ∃ t : ℝ, t ∈ Set.Icc 0 1 ∧ z = (t : ℂ) * a i}

/-- A single segment includes its midpoint. -/
example : (2 : ℂ) ∈ radialHedgehog (fun _ : Fin 1 => (4 : ℂ)) := by
  sorry

/-- Its endpoint is included but extension beyond it is not. -/
example : ¬ (5 : ℂ) ∈ radialHedgehog (fun _ : Fin 1 => (4 : ℂ)) := by
  sorry

/-- An empty family and a zero endpoint give different hedgehogs. -/
example : radialHedgehog (fun i : Fin 0 => Fin.elim0 i) = ∅ ∧
    radialHedgehog (fun _ : Fin 1 => (0 : ℂ)) = {0} := by
  sorry

/-- A single spike is its closed radial segment. -/
example : radialHedgehog (fun _ : Fin 1 => (4 : ℂ)) = segment ℝ 0 4 ∧
    transfiniteDiameter (radialHedgehog (fun _ : Fin 1 => (4 : ℂ))) = 1 := by
  sorry

/-- Every single spike attains the one-spike diameter bound, including the zero spike. -/
example (a : ℂ) : transfiniteDiameter (radialHedgehog (fun _ : Fin 1 => a)) = ‖a‖ / 4 := by
  sorry

/-- Opposite endpoints and duplicate endpoints have distinct sharp diameters. -/
example : transfiniteDiameter (radialHedgehog ![(1 : ℂ), -1]) = 1 / 2 ∧
    radialHedgehog ![(1 : ℂ), 1] = segment ℝ 0 1 ∧
    transfiniteDiameter (radialHedgehog ![(1 : ℂ), 1]) = 1 / 4 := by
  sorry

/-- Dubinin's bound allows coincident endpoints and uses the family size. -/
theorem dubinin_hedgehog_bound {n : ℕ} (hn : 1 ≤ n) (a : Fin n → ℂ) :
    transfiniteDiameter (radialHedgehog a) ≤
      sSup (Set.range (fun i => ‖a i‖)) * Real.rpow 4 (-(1 / (n : ℝ))) := by
  sorry

/-- The Hankel convention has a +1 shift, and the empty determinant equals one.

The full README API includes `shiftedHankelDet_integer`, `shiftedHankelDet_map`,
`shiftedHankelDet_monic_basis`, `shiftedHankelDet_one`, `shiftedHankelDet_two`,
`shiftedHankelDet_zero`.
-/
def shiftedHankelDet {R : Type*} [CommRing R] (a : ℕ → R) (n : ℕ) : R :=
  Matrix.det (fun i j : Fin n => a (i.val + j.val + 1))

/-- The empty Hankel determinant is one over every coefficient ring. -/
example {R : Type*} [CommRing R] (a : ℕ → R) : shiftedHankelDet a 0 = 1 := by
  sorry

/-- One-by-one Hankel determinant reads a₁ rather than a₀. -/
example (a : ℕ → ℚ) : shiftedHankelDet a 1 = a 1 := by
  sorry

/-- The two-by-two value pins both shift and determinant sign. -/
example (a : ℕ → ℚ) : shiftedHankelDet a 2 = a 1 * a 3 - a 2 ^ 2 := by
  sorry

/-- Geometric coefficients give rank one from the shifted first entry. -/
example : shiftedHankelDet (fun j => (2 : ℚ) ^ j) 1 = 2 ∧
    shiftedHankelDet (fun j => (2 : ℚ) ^ j) 2 = 0 := by
  sorry

/-- The zeroth coefficient has no effect on the shifted two-by-two example. -/
example (c : ℚ) : shiftedHankelDet
    (fun j => if j = 0 then c else if j = 1 then 2 else if j = 2 then 3 else 5) 2 = 1 := by
  sorry

/-- One zero leading determinant can be followed by a nonzero determinant. -/
example :
    let a : ℕ → ℚ := fun j => if j = 2 then 1 else 0
    shiftedHankelDet a 1 = 0 ∧ shiftedHankelDet a 2 = -1 := by
  sorry

/-- Exterior continuation includes the actual Laurent germ, not only a holomorphic function. -/
def ExteriorLaurentContinuation (a : ℕ → ℂ) (K : Set ℂ) : Prop :=
  IsCompact K ∧ K.Nonempty ∧ ∃ G : ℂ → ℂ,
    DifferentiableOn ℂ G Kᶜ ∧ ∃ R : ℝ, 0 < R ∧ K ⊆ Metric.closedBall 0 R ∧
      ∀ z : ℂ, R < ‖z‖ → HasSum (fun j : ℕ => a j * (z⁻¹) ^ j) (G z)

/-- The geometric Laurent series continues away from its pole at one. -/
example : ExteriorLaurentContinuation (fun _ => (1 : ℂ)) {1} := by
  sorry

/-- The compact exceptional set must be nonempty. -/
example : ¬ ExteriorLaurentContinuation (fun _ => (0 : ℂ)) ∅ := by
  sorry

/-- A pole at two is compatible with the geometric Laurent tail. -/
example : ExteriorLaurentContinuation
    (fun j => if j = 0 then 0 else (2 : ℂ) ^ (j - 1)) {2} ∧
    Sequences.IsRational
      (PowerSeries.mk fun j => if j = 0 then 0 else (2 : ℚ) ^ (j - 1)) := by
  sorry

/-- The square-root Laurent branch has a noninteger first coefficient. -/
example : ExteriorLaurentContinuation (fun j =>
    (∏ i ∈ Finset.range j, ((1 / 2 : ℂ) - i)) / (j.factorial : ℂ) * (-1) ^ j)
      (segment ℝ (0 : ℂ) 1) ∧
    (1 / 2 : ℂ) * (-1) = -1 / 2 := by
  sorry

/-- The exponential cannot have a convergent expansion in nonpositive powers at infinity. -/
example : ¬ ∃ (a : ℕ → ℂ) (R : ℝ), 0 < R ∧
    ∀ z : ℂ, R < ‖z‖ → HasSum (fun j => a j * (z⁻¹) ^ j) (Complex.exp z) := by
  sorry

/-- A constant Laurent germ permits any nonempty compact exceptional set. -/
example (K : Set ℂ) (hK : IsCompact K) (hne : K.Nonempty) :
    ExteriorLaurentContinuation (fun j => if j = 0 then (7 : ℂ) else 0) K := by
  sorry

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

The full README API includes `IntegralGaloisModule.IsNIBGenerator.basis_apply`,
`IntegralGaloisModule.IsNIBGenerator.exists_unit`, `IntegralGaloisModule.IsNIBGenerator.unit_smul`.
-/
def IsNIBGenerator (A B G : Type*) [CommRing A] [CommRing B] [Algebra A B]
    [Group G] [Fintype G] [MulSemiringAction G B] [IsGaloisGroup G A B] (α : B) : Prop :=
  LinearIndependent A (fun g : G => g • α) ∧
    Submodule.span A (Set.range fun g : G => g • α) = ⊤

/-- Existence of one such generator is a normal integral basis. -/
def HasNIB (A B G : Type*) [CommRing A] [CommRing B] [Algebra A B]
    [Group G] [Fintype G] [MulSemiringAction G B] [IsGaloisGroup G A B] : Prop :=
  ∃ α : B, IsNIBGenerator A B G α

/-- In a nontrivial extension the element one has repeated conjugates. -/
example (A B G : Type*) [CommRing A] [CommRing B] [Algebra A B]
    [Group G] [Fintype G] [MulSemiringAction G B] [IsGaloisGroup G A B]
    [Nontrivial A] [Nontrivial G] : ¬ IsNIBGenerator A B G 1 := by
  sorry

/-- Odd prime cyclotomic extensions have the standard integral normal generator. -/
example (p : ℕ) [Fact p.Prime] (hp : p ≠ 2) (L : Type*) [Field L] [NumberField L]
    [IsCyclotomicExtension {p} ℚ L] [IsGalois ℚ L] :
    IsNIBGenerator (NumberField.RingOfIntegers ℚ) (NumberField.RingOfIntegers L)
      (L ≃ₐ[ℚ] L) ((IsCyclotomicExtension.zeta_spec p ℚ L).toInteger) := by
  sorry

/-- Gaussian integers give the rational-versus-integral distinction. -/
example (L : Type*) [Field L] [NumberField L] [IsCyclotomicExtension {4} ℚ L]
    [IsGalois ℚ L] :
    ¬ HasNIB (NumberField.RingOfIntegers ℚ) (NumberField.RingOfIntegers L)
      (L ≃ₐ[ℚ] L) := by
  sorry

/-- Tame residue extensions are separable and have index prime to residue characteristic. -/
def IsTamelyRamifiedAt (A B : Type*) [CommRing A] [CommRing B] [Algebra A B]
    (P : Ideal B) [P.IsPrime] : Prop :=
  Algebra.IsSeparable (A ⧸ P.under A) (B ⧸ P) ∧
    ¬ ringChar (A ⧸ P.under A) ∣ P.ramificationIdx A

/-- Tameness is tested at every nonzero prime. -/
def IsTamelyRamified (A B : Type*) [CommRing A] [CommRing B] [Algebra A B] : Prop :=
  ∀ (P : Ideal B) [P.IsPrime], P ≠ ⊥ → IsTamelyRamifiedAt A B P

/-- Index one gives tameness when the residue extension is separable. -/
example (A B : Type*) [CommRing A] [CommRing B] [Algebra A B]
    (P : Ideal B) [P.IsPrime]
    (hsep : Algebra.IsSeparable (A ⧸ P.under A) (B ⧸ P))
    (he : P.ramificationIdx A = 1) : IsTamelyRamifiedAt A B P := by
  sorry

/-- An inseparable residue extension prevents tameness even at ramification index one. -/
example (A B : Type*) [CommRing A] [CommRing B] [Algebra A B]
    (P : Ideal B) [P.IsPrime]
    (hsep : ¬ Algebra.IsSeparable (A ⧸ P.under A) (B ⧸ P))
    (he : P.ramificationIdx A = 1) : ¬ IsTamelyRamifiedAt A B P := by
  sorry

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

/-- In the self extension, the residue extension and ramification index are trivial. -/
example (A : Type*) [CommRing A] [IsDedekindDomain A] : IsTamelyRamified A A := by
  sorry

/-- The prime-cyclotomic extension has tame ramification, including p=2. -/
example (p : ℕ) [Fact p.Prime] (L : Type*) [Field L] [NumberField L]
    [IsCyclotomicExtension {p} ℚ L] :
    IsTamelyRamified (NumberField.RingOfIntegers ℚ) (NumberField.RingOfIntegers L) := by
  sorry

/-- The Gaussian extension tests wild ramification at two. -/
example (L : Type*) [Field L] [NumberField L] [IsCyclotomicExtension {4} ℚ L] :
    ¬ IsTamelyRamified (NumberField.RingOfIntegers ℚ) (NumberField.RingOfIntegers L) := by
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

The full README API includes `StableEquivalent.of_equiv`.
-/
def StableEquivalent (R P Q : Type*) [Ring R] [AddCommGroup P] [AddCommGroup Q]
    [Module R P] [Module R Q] : Prop :=
  ∃ n : ℕ, Nonempty ((P × (Fin n → R)) ≃ₗ[R] (Q × (Fin n → R)))

/-- Equal modules need no stabilisation. -/
example : StableEquivalent ℤ ℤ ℤ := by
  sorry

/-- Different rational ranks cannot be repaired with a common free summand. -/
example : ¬ StableEquivalent ℤ (Fin 0 → ℤ) ℤ := by
  sorry

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
Bach's bound, the Belabas–Diaz y Diaz–Friedman criterion, the explicit prime ideal theorem
and the truncated Euler sum (§§5.1b, 5.1c and 5.16a (i)–(ii)) assume Riemann hypotheses for
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
