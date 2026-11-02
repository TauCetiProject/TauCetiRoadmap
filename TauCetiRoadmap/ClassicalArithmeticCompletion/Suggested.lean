import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Hopf.Map
import TauCeti.Algebra.AlgebraicGroup.SimplyConnected.Basic
import TauCeti.NumberTheory.NumberField.Global.Adeles.LocallyCompact

/-!
# ClassicalArithmeticCompletion: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorem targets against the pinned Mathlib and Tau Ceti APIs, using simple definitions only
where they are needed to state those targets.

The headline inventory comprises compatible CRT and power residues; Lucas and Ward strong
divisibility, Christol and Cobham; rectangular Smith forms and cokernels, Perron and Capelli;
Markoff descent, three squares, Egyptian fractions and Ramanujan–Nagell; negative Pell,
factor-base generation and class-number/unit completeness; Smyth, explicit and asymptotic
Dobrowolski, the smallest Pisot number, Salem-field generators, Schinzel–Zassenhaus,
Dubinin and Bertrandias; reduced-norm existence, local Noether, Hilbert–Speiser,
strong approximation and tame determinant descent.
These have signatures below, in README layer order.

The remaining headline theorems are not statable at the pins on their intended carriers:
* Higher reciprocity (Layer 1) lacks the general higher residue symbols and their
  invariant-normalised comparison with local Artin symbols.
* Bach's GRH factor-base bound (§5.1b) lacks the continued Dedekind zeta function with its
  Dedekind-ERH predicate. The Belabas–Diaz y Diaz–Friedman criteria (§5.1c) additionally lack
  the continued class-character L-functions and the admissible Weil-test-function interface.
  The explicit prime-ideal and truncated Euler-sum bounds (§5.16a(i)–(ii)) lack those same
  continued functions; the residue-to-class-number comparison is stated below.
* The Fröhlich–Taylor identity and its class-group consequences (§§7.120–7.123) lack the
  character-idele quotient, root-number class and their comparison with the locally free
  class group of an arithmetic order. Its logarithmic proof inputs (§§7.115–7.118) lack
  the integral group logarithm on the equivariant virtual-character Hom group.
* Tate's local functional equation and Deligne–Langlands existence (§§7.12a–7.12b)
  lack the local zeta-integral/epsilon-constant constructions and their virtual Weil-character
  interface. Finite-image Artin continuation and its equation (§7.12c) lack the ramified
  Artin Euler product and its completed meromorphic function.
No free predicates or substitute theorems stand for these missing constructions.
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

/-- Perron's weak criterion includes both endpoint exclusions and nonzero constant term. -/
theorem perron_irreducible_of_le {f : ℤ[X]} (hmon : f.Monic) (h2 : 2 ≤ f.natDegree)
    (h0 : f.coeff 0 ≠ 0)
    (hP : 1 + ∑ i ∈ Finset.range (f.natDegree - 1), |f.coeff i| ≤
      |f.coeff (f.natDegree - 1)|)
    (hpos : f.eval 1 ≠ 0) (hneg : f.eval (-1) ≠ 0) : Irreducible f := by
  sorry

/-- Capelli's binomial criterion over any field, including positive characteristic
(README §3.29; Szechtman, Irreducibility Criterion (C)). -/
theorem capelli (K : Type*) [Field K] (a : K) (n : ℕ) (hn : 0 < n) :
    Irreducible (X ^ n - C a : Polynomial K) ↔
      (∀ p : ℕ, p.Prime → p ∣ n → ¬ ∃ b : K, b ^ p = a) ∧
      (4 ∣ n → ¬ ∃ b : K, -(4 : K) * b ^ 4 = a) := by
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

/-- Three-square classification includes zero and excludes the complete 4-adic obstruction. -/
theorem legendre_three_square (n : ℕ) :
    (∃ x y z : ℤ, x ^ 2 + y ^ 2 + z ^ 2 = n) ↔
      ¬ ∃ a b : ℕ, n = 4 ^ a * (8 * b + 7) := by
  sorry

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

/-- The explicit Dobrowolski bound for primitive minimal polynomials, including
nonmonic ones (README §6.60; Berrevoets, Theorem 4.1). -/
theorem dobrowolski {P : Polynomial ℤ} (hprim : P.IsPrimitive)
    (hlead : 0 < P.leadingCoeff) (hirr : Irreducible P)
    (hdeg : 2 ≤ P.natDegree) (h0 : P.coeff 0 ≠ 0)
    (hcycl : ∀ n : ℕ, 0 < n → P ≠ cyclotomic n ℤ) :
    1 + (1 / 11700 : ℝ) * (Real.log (Real.log P.natDegree) / Real.log P.natDegree) ^ 3 ≤
      Polynomial.mahlerMeasure (P.map (Int.castRingHom ℂ)) := by
  sorry

/-- The Salem numbers in a Salem-generated real field are exactly the positive powers
of one Salem number (README §6.66; Smyth, Proposition 3(iii)). -/
theorem salem_field_generator (K : Subfield ℝ) (τ : ℝ) (hτ : IsSalem τ)
    (hK : K = Subfield.closure ({τ} : Set ℝ)) :
    ∃ σ : ℝ, σ ∈ K ∧ IsSalem σ ∧
      ∀ x : ℝ, x ∈ K → (IsSalem x ↔ ∃ n : ℕ, 0 < n ∧ x = σ ^ n) := by
  sorry

/-- Smyth's sharp bound for nonreciprocal algebraic integers (README §6.70;
Smyth's Mahler-measure survey, §5.1, equation (15)). -/
theorem smyth {P : Polynomial ℤ} (hmon : P.Monic) (hirr : Irreducible P)
    (h0 : P.coeff 0 ≠ 0) (hrec : P.reverse ≠ P ∧ P.reverse ≠ -P) :
    Polynomial.mahlerMeasure ((X ^ 3 - X - 1 : Polynomial ℤ).map (Int.castRingHom ℂ)) ≤
      Polynomial.mahlerMeasure (P.map (Int.castRingHom ℂ)) := by
  sorry

/-- The Mahler measure of the plastic polynomial is itself Pisot and is the least
Pisot number (README §6.73; Siegel's theorem). -/
theorem smallest_pisot :
    IsPisot (Polynomial.mahlerMeasure
      ((X ^ 3 - X - 1 : Polynomial ℤ).map (Int.castRingHom ℂ))) ∧
    ∀ θ : ℝ, IsPisot θ →
      Polynomial.mahlerMeasure ((X ^ 3 - X - 1 : Polynomial ℤ).map (Int.castRingHom ℂ)) ≤ θ := by
  sorry

/-- The asymptotic Dobrowolski estimate with its bounded-degree completion
(README §6.77). The cutoff exceeds e, so both logarithms in the upper branch are positive. -/
theorem asymptoticDobrowolskiBound :
    ∃ C c : ℝ, Real.exp 1 < C ∧ 1 ≤ c ∧
      ∀ P : Polynomial ℤ, P.Monic → Irreducible P → P.coeff 0 ≠ 0 →
        0 < P.natDegree → (∀ n : ℕ, 0 < n → P ≠ cyclotomic n ℤ) →
        Real.exp (1 / (if C < (P.natDegree : ℝ)
          then 2 * (Real.log P.natDegree / Real.log (Real.log P.natDegree)) ^ 3 else c)) ≤
          Polynomial.mahlerMeasure (P.map (Int.castRingHom ℂ)) := by
  sorry

end SmallHeight

/-! ## Layer 7: integral Galois modules and arithmetic orders -/

namespace GaloisModules

open scoped TensorProduct

/-- A reduced-norm law agrees with the determinant after every faithfully flat
matrix splitting, including scalar extensions with nilpotents (README §7.10). -/
def IsReducedNormLaw {A R : Type u} [CommRing A] [Ring R] [Algebra A R]
    (d : ℕ) (N : PolynomialLaw A R A) : Prop :=
  ∀ (B : Type u) [CommRing B] [Algebra A B] [Module.FaithfullyFlat A B]
    (e : B ⊗[A] R ≃ₐ[B] Matrix (Fin d) (Fin d) B) (x : B ⊗[A] R),
    Algebra.TensorProduct.rid A B B (N.toFun' B x) = Matrix.det (e x)

/-- Reduced norm descends uniquely for every constant-rank Azumaya algebra
(README §7.10; Grothendieck, Brauer I, §5.13). -/
theorem existsUnique_reducedNormLaw {A R : Type u} [CommRing A] [Ring R]
    [Algebra A R] [IsAzumaya A R] (d : ℕ) (hd : 0 < d)
    (hrank : Module.rankAtStalk (R := A) R = d * d) :
    ∃! N : PolynomialLaw A R A, IsReducedNormLaw d N := by
  sorry


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

/-- Hilbert–Speiser: for an abelian number field, a normal integral basis is equivalent
to tameness and to embedding in a cyclotomic field of positive odd squarefree level
(README §7.89; Johnston, Theorem 8.4). -/
theorem hilbert_speiser (K : Type*) [Field K] [NumberField K]
    (G : Type*) [CommGroup G] [Fintype G] [MulSemiringAction G (NumberField.RingOfIntegers K)]
    [IsGaloisGroup G ℤ (NumberField.RingOfIntegers K)] :
    (HasNIB ℤ (NumberField.RingOfIntegers K) G ↔
      IsTamelyRamified ℤ (NumberField.RingOfIntegers K)) ∧
    (IsTamelyRamified ℤ (NumberField.RingOfIntegers K) ↔
      ∃ n : ℕ, 0 < n ∧ Odd n ∧ Squarefree n ∧ Nonempty (K →ₐ[ℚ] CyclotomicField n ℚ)) := by
  sorry

/-- The Gauss period at any positive odd squarefree cyclotomic level containing K
is an integral normal basis generator (README §7.89; Johnston, Proposition 6.6 and Theorem 8.4). -/
theorem hilbert_speiser_gauss_period (K L : Type*) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L] [IsScalarTower ℚ K L]
    (G : Type*) [CommGroup G] [Fintype G] [MulSemiringAction G (NumberField.RingOfIntegers K)]
    [IsGaloisGroup G ℤ (NumberField.RingOfIntegers K)]
    (n : ℕ) (hn : 0 < n) (hodd : Odd n) (hsq : Squarefree n)
    [IsCyclotomicExtension {n} ℚ L] (ζ : L) (hζ : IsPrimitiveRoot ζ n) :
    ∃ α : NumberField.RingOfIntegers K,
      (α : K) = Algebra.trace K L ζ ∧ IsNIBGenerator ℤ (NumberField.RingOfIntegers K) G α := by
  sorry

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

namespace Approximation

noncomputable section

open scoped NumberField

/-- The affine point functor of a commutative Hopf algebra with convolution group
structure (README §7.44). -/
abbrev Points (F : Type) [Field F] (H : Type) [CommRing H] [HopfAlgebra F H]
    (R : Type) [CommRing R] [Algebra F R] := WithConv (H →ₐ[F] R)

/-- The evaluation topology on affine group points (README §7.44). -/
scoped instance evaluationTopology (F : Type) [Field F] (H : Type) [CommRing H]
    [HopfAlgebra F H] (R : Type) [CommRing R] [Algebra F R] [TopologicalSpace R] :
    TopologicalSpace (Points F H R) :=
  ⨅ h : H, TopologicalSpace.induced (fun x : Points F H R => x.ofConv h) inferInstance

/-- Density of rational points times the points supported at infinity and S_f,
equivalently strong approximation away from those places (README §7.44). -/
def HasStrongApproximation (F : Type) [Field F] [NumberField F]
    (H : Type) [CommRing H] [HopfAlgebra F H]
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F))) : Prop :=
  Dense {x : Points F H (NumberField.AdeleRing (𝓞 F) F) |
    ∃ g : Points F H F, ∃ y : Points F H (NumberField.AdeleRing (𝓞 F) F),
      (∀ v ∉ Sf, ∀ h : H,
        (TauCeti.AlgHom.mapValue (AlgHom.snd F _ _) y).ofConv h v =
          (1 : Points F H (IsDedekindDomain.FiniteAdeleRing (𝓞 F) F)).ofConv h v) ∧
      x = TauCeti.AlgHom.mapValue (Algebra.ofId F _) g * y}

/-- Strong approximation for simply connected semisimple groups, with noncompact
S-points in every nontrivial semisimple quotient (README §7.44; Rapinchuk,
Theorem 2.3 and its semisimple reduction). -/
theorem strongApproximation (F : Type) [Field F] [NumberField F]
    (G : TauCeti.SemisimpleCommHopfAlgCat F)
    (hsc : TauCeti.simplyConnectedSemisimpleCommHopfAlgProperty F G)
    (Sf : Finset (IsDedekindDomain.HeightOneSpectrum (𝓞 F)))
    (hS : ∀ (Q : TauCeti.SemisimpleCommHopfAlgCat F) (f : Q.obj →ₐc[F] G.obj),
      Function.Injective f → ¬ Function.Surjective (algebraMap F Q.obj) →
        ¬ IsCompact (Set.univ : Set
          (Points F Q.obj (NumberField.InfiniteAdeleRing F) ×
            ∀ v : Sf, Points F Q.obj (v.val.adicCompletion F)))) :
    HasStrongApproximation F (G.obj : Type) Sf := by
  sorry

end

end Approximation

end TauCetiRoadmap.ClassicalArithmeticCompletion
