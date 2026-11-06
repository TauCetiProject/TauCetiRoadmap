module

import Mathlib

/-!
# Hypergeometric motives over `ℚ`: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each with `sorry`, together with the few definitions with
real bodies that make them statable: the two carriers `HypergeometricParameters` (disjoint
multisets `α, β` in `ℚ/ℤ` of equal cardinality) and `CyclotomicData` (the LMFDB's `(A, B)`), the
zigzag invariants, the Levelt matrices, the Bézout matrix, the finite sums of Katz, Greene and
Beukers–Cohen–Mellit, the Frobenius trace and polynomial, and the tame conductor exponent.
Every API fact, Check and worked value is in `README.md` only.

Three definitions characterise a value through `Classical.epsilon` by the property the README
proves of it: `primitiveData`, `hypergeometricSumRat` and `frobeniusSum`; the existence statements
are headlines (`frobeniusSum_primitiveData` reads the first, `hypergeometricSumRat_spec` and
`frobeniusSum_spec` are the other two).

Headline theorems that are not statable at the pins, and what each lacks:

* Katz's identification of `q^δ H_q` with the Frobenius trace of the hypergeometric ℓ-adic sheaf
  and of the motive `H(A, B, t)` (5.0, 6.4): the hypergeometric sheaf, geometric
  compact-support motive and its realization comparisons are absent at the pins.
* Fedorov's theorem that the zigzag numbers are the Hodge numbers of the family (2.2, 5.0): no
  filtered geometric realization attached to the hypergeometric equation exists at the pins,
  although Tau Ceti supplies abstract Hodge structures.
* The sign `ε_p = (-1)^d χ_Disc(p)` of the local functional equation (5.8): it reads the
  determinant of Frobenius on the realization, and `kroneckerChar` is a roadmap target.
* The all-prime local-invariant comparison, signed real signature and special-fibre theorem
  of 5.0 and 5.9–5.10 lack the constructed geometric realization.
* The L-function card of 5.13 lacks that realization and `ArithmeticLFunctionData`; its
  all-prime rational compatibility and analytic hypotheses remain explicit in the README.
* Beukers–Cohen–Mellit Theorem 1.5 (the point count of the smooth completion, 6.3): the smooth
  completion is not constructed.
-/

namespace TauCetiRoadmap.HypergeometricMotives

open Polynomial Multiset Matrix
open scoped Classical ComplexOrder

noncomputable section

/-! ## Layer 1: hypergeometric data -/

/-- The rational circle `ℚ/ℤ`, Mathlib's `AddCircle (1 : ℚ)`. -/
abbrev QmodZ := AddCircle (1 : ℚ)

/-- Positivity of the rational circle period. -/
instance instPositivePeriod : Fact ((0 : ℚ) < 1) := ⟨one_pos⟩

/-- **1.1**, the representative in `(0, 1]` of a class in `ℚ/ℤ`, through `AddCircle.equivIoc`.
The class of `0` is represented by `1`, as the LMFDB displays `β = (1, …, 1)`. -/
def rep (x : QmodZ) : ℚ := (AddCircle.equivIoc (1 : ℚ) 0 x : ℚ)

/-- **1.1**, the representative in `[0, 1)`, Beukers–Heckman's normalisation for the signature
count 3.6. -/
def rep0 (x : QmodZ) : ℚ := (AddCircle.equivIco (1 : ℚ) 0 x : ℚ)

/-- The image of a rational number in a field, `num / den` (junk `0` when `den` vanishes there). -/
def ratToField (F : Type*) [Field F] (x : ℚ) : F := (x.num : F) / (x.den : F)

/-- **1.1**, the carrier of Layers 2–4: two disjoint multisets in `ℚ/ℤ` of the same cardinality
`d`. Nothing about the representatives is recorded; the zigzag reads them through `rep`. -/
structure HypergeometricParameters where
  α : Multiset QmodZ
  β : Multiset QmodZ
  card_eq : Multiset.card α = Multiset.card β
  disjoint : ∀ a ∈ α, a ∉ β

namespace HypergeometricParameters

variable (P : HypergeometricParameters)

/-- **1.1**, the degree `d`. -/
def degree : ℕ := Multiset.card P.α

/-- **1.1**, the negation `(α, β) ↦ (-α, -β)`. -/
def neg : HypergeometricParameters :=
  ⟨P.α.map Neg.neg, P.β.map Neg.neg, by simp [P.card_eq], by
    simp only [Multiset.mem_map]
    rintro _ ⟨a, ha, rfl⟩ ⟨b, hb, hba⟩
    exact P.disjoint a ha (by rwa [← neg_injective hba])⟩

/-- **1.1**, the common denominator `N`: the lcm of the additive orders of the classes in
`α ∪ β` (Mathlib's `addOrderOf_coe_rat` computes each). -/
def denominator : ℕ := (P.α + P.β).toFinset.lcm addOrderOf

/-- **1.3**, Galois stability: scaling by every unit `u` modulo `N` fixes both multisets. -/
def IsGaloisStable : Prop :=
  ∀ u : ℤ, IsCoprime u (P.denominator : ℤ) → P.α.map (u • ·) = P.α ∧ P.β.map (u • ·) = P.β

/-- **1.8**, the rotation number: the order of the group of translations stabilizing both
multisets, the LMFDB's `imprim` column. -/
def rotationNumber : ℕ :=
  Nat.card {ρ : QmodZ // P.α.map (ρ + ·) = P.α ∧ P.β.map (ρ + ·) = P.β}

/-- **2.1**, the counting function `Z(x) = #{a ∈ α : rep a ≤ x} - #{b ∈ β : rep b ≤ x}`, copies
counted with multiplicity. -/
def Z (x : ℚ) : ℤ :=
  ((P.α.filter fun a => rep a ≤ x).card : ℤ) - (P.β.filter fun b => rep b ≤ x).card

/-- **1.10**, interlacing of two multisets of classes: in the increasing list of all
representatives the colours alternate, i.e. the counting function of 2.1 takes only the values
`{0, 1}` or only the values `{0, -1}`. -/
def InterlaceMultisets (α β : Multiset QmodZ) : Prop :=
  (∀ x : ℚ, ((α.filter fun a => rep a ≤ x).card : ℤ) - (β.filter fun b => rep b ≤ x).card ∈
    ({0, 1} : Set ℤ)) ∨
  ∀ x : ℚ, ((α.filter fun a => rep a ≤ x).card : ℤ) - (β.filter fun b => rep b ≤ x).card ∈
    ({0, -1} : Set ℤ)

/-- **1.10**, interlacing of the pair. -/
def Interlace : Prop := InterlaceMultisets P.α P.β

end HypergeometricParameters

/-- **1.2**, the LMFDB's family index: disjoint multisets `A`, `B` of positive integers with
equal totient sums. The totient sum is the degree. -/
structure CyclotomicData where
  A : Multiset ℕ
  B : Multiset ℕ
  pos : ∀ n ∈ A + B, 0 < n
  disjoint : ∀ a ∈ A, a ∉ B
  degree_eq : (A.map Nat.totient).sum = (B.map Nat.totient).sum

namespace CyclotomicData

variable (D : CyclotomicData)

/-- **1.2**, the degree `d = ∑_{a ∈ A} φ(a)`. -/
def degree : ℕ := (D.A.map Nat.totient).sum

/-- **1.2**, `Φ_A = ∏_{a ∈ A} Φ_a` over `ℤ`. -/
def PhiA : ℤ[X] := (D.A.map fun a => cyclotomic a ℤ).prod

/-- **1.2**, `Φ_B = ∏_{b ∈ B} Φ_b` over `ℤ`. -/
def PhiB : ℤ[X] := (D.B.map fun b => cyclotomic b ℤ).prod

/-- **1.2**, the multiplicity `m_A` of `1` in `A`. -/
def multOne_A : ℕ := D.A.count 1

/-- **1.2**, the multiplicity `m_B` of `1` in `B`. -/
def multOne_B : ℕ := D.B.count 1

/-- **1.3**, the classes `k/a`, `1 ≤ k ≤ a`, `gcd(k, a) = 1`, of a multiset of positive integers:
the arguments of the roots of `∏ Φ_a`. -/
def primitiveClasses (A : Multiset ℕ) : Multiset QmodZ :=
  A.bind fun a =>
    ((Finset.Icc 1 a).filter fun k => Nat.Coprime k a).val.map fun k : ℕ =>
      (((k : ℚ) / a : ℚ) : QmodZ)

/-- **1.3**, the dictionary: `α` from `A` and `β` from `B`, the LMFDB's reading. -/
def toParameters : HypergeometricParameters := by
  have card_classes (A : Multiset ℕ) :
      Multiset.card (primitiveClasses A) = (A.map Nat.totient).sum := by
    rw [primitiveClasses, Multiset.card_bind]
    congr 1
    refine Multiset.map_congr rfl fun a _ => ?_
    have h : Finset.Icc 1 a = Finset.Ico 1 (1 + a) := by
      ext k; simp only [Finset.mem_Icc, Finset.mem_Ico]; omega
    rw [Function.comp_apply, Multiset.card_map, Finset.card_val, h,
      ← Nat.filter_coprime_Ico_eq_totient a 1]
    simp only [Nat.coprime_comm]
  have order_mem {A : Multiset ℕ} {x : QmodZ}
      (hx : x ∈ primitiveClasses A) : addOrderOf x ∈ A := by
    obtain ⟨a, ha, hx⟩ := Multiset.mem_bind.1 hx
    obtain ⟨k, hk, rfl⟩ := Multiset.mem_map.1 hx
    rw [Finset.mem_val, Finset.mem_filter, Finset.mem_Icc] at hk
    have h := AddCircle.addOrderOf_div_of_gcd_eq_one (p := (1 : ℚ)) (m := k) (n := a)
      (by omega) hk.2
    rw [mul_one] at h
    rwa [h]
  exact ⟨primitiveClasses D.A, primitiveClasses D.B,
    by rw [card_classes, card_classes, D.degree_eq],
    fun _ hA hB => D.disjoint _ (order_mem hA) (order_mem hB)⟩

/-- **1.3**, every Galois-stable pair comes from a unique cyclotomic datum (and `toParameters D`
is Galois stable). -/
theorem exists_unique_of_isGaloisStable (P : HypergeometricParameters) (hP : P.IsGaloisStable) :
    ∃! D : CyclotomicData, D.toParameters = P := sorry

/-- **1.1**, the swap `(A, B) ↦ (B, A)`; fields inherited. -/
def swap : CyclotomicData :=
  ⟨D.B, D.A, fun n hn => D.pos n (by rwa [add_comm]), fun b hb ha => D.disjoint _ ha hb,
    D.degree_eq.symm⟩

/-! ### 1.4: the gamma vector and `M` -/

/-- The finite set of `n` at which the gamma vector can be nonzero: divisors of elements of
`A ∪ B`. -/
def gammaSupport : Finset ℕ := (D.A + D.B).toFinset.biUnion Nat.divisors

/-- **1.4**, the gamma vector `γ(n) = ∑_{a ∈ A, n ∣ a} μ(a/n) - ∑_{b ∈ B, n ∣ b} μ(b/n)`,
with `γ(0) = 0`. -/
def gamma (n : ℕ) : ℤ :=
  if n = 0 then 0 else
    ((D.A.filter fun a => n ∣ a).map fun a => ArithmeticFunction.moebius (a / n)).sum -
      ((D.B.filter fun b => n ∣ b).map fun b => ArithmeticFunction.moebius (b / n)).sum

/-- **1.4**, the defining identity
`Φ_A · ∏_{γ(n) < 0} (X^n - 1)^{-γ(n)} = Φ_B · ∏_{γ(n) > 0} (X^n - 1)^{γ(n)}` in `ℤ[X]`. -/
theorem gamma_defining_identity :
    D.PhiA * ∏ n ∈ D.gammaSupport, (X ^ n - 1) ^ (-D.gamma n).toNat =
      D.PhiB * ∏ n ∈ D.gammaSupport, (X ^ n - 1) ^ (D.gamma n).toNat := sorry

/-- **1.4**, uniqueness: a finitely supported exponent function with the defining identity is the
gamma vector. -/
theorem gamma_unique (g : ℕ → ℤ) (S : Finset ℕ) (hS : ∀ n ∉ S, g n = 0) (h0 : g 0 = 0)
    (hg : D.PhiA * ∏ n ∈ S, (X ^ n - 1) ^ (-g n).toNat =
      D.PhiB * ∏ n ∈ S, (X ^ n - 1) ^ (g n).toNat) :
    g = D.gamma := sorry

/-- **1.4**, the gamma vector as the LMFDB's multiset of nonzero integers: `n` with multiplicity
`γ(n)` when `γ(n) > 0`, `-n` with multiplicity `-γ(n)` when `γ(n) < 0`. -/
def gammaMultiset : Multiset ℤ :=
  D.gammaSupport.val.bind fun n =>
    if 0 ≤ D.gamma n then Multiset.replicate (D.gamma n).toNat (n : ℤ)
    else Multiset.replicate (-D.gamma n).toNat (-(n : ℤ))

/-- **1.4**, `r`, the number of positive entries of the gamma multiset
(Beukers–Cohen–Mellit's `r`). -/
def r : ℕ := (D.gammaMultiset.filter fun n => 0 < n).card

/-- **1.4**, `s`, the number of negative entries. -/
def s : ℕ := (D.gammaMultiset.filter fun n => n < 0).card

/-- **1.4**, `M = ∏_n n^{n γ(n)}`, a positive rational. -/
def M : ℚ := ∏ n ∈ D.gammaSupport, (n : ℚ) ^ ((n : ℤ) * D.gamma n)

/-- **1.4**, the Pochhammer identity of Beukers–Cohen–Mellit §1:
`∏_i (α_i)_n / ∏_j (β_j)_n = M^{-n} ∏_{γ(m) > 0} (m n)!^{γ(m)} / ∏_{γ(m) < 0} (m n)!^{-γ(m)}`,
evaluated on the representatives in `(0, 1]`. -/
theorem pochhammer_identity (n : ℕ) :
    (D.toParameters.α.map fun a => (ascPochhammer ℚ n).eval (rep a)).prod /
        (D.toParameters.β.map fun b => (ascPochhammer ℚ n).eval (rep b)).prod =
      D.M ^ (-(n : ℤ)) *
        ∏ m ∈ D.gammaSupport, ((Nat.factorial (m * n) : ℚ)) ^ D.gamma m := sorry

/-! ### 1.6–1.8: wild primes and the rotation number -/

/-- **1.6**, the wild primes: primes dividing some element of `A ∪ B`. -/
def wildPrimes : Finset ℕ := (D.A + D.B).toFinset.biUnion Nat.primeFactors

/-- **1.6**, `p` is wild. -/
def IsWild (p : ℕ) : Prop := p ∈ D.wildPrimes

/-- **1.8**, the rotation number of a cyclotomic datum is the gcd of its gamma multiset. -/
theorem rotationNumber_eq_gcd :
    (D.toParameters.rotationNumber : ℤ) = D.gammaMultiset.gcd := sorry

/-! ### 1.11: specialization points and cusps -/

/-- **1.11**, the three cusps, named by the Levelt matrix whose local monodromy they carry:
`zero` for `v_p(t) > 0` (`t → 0`, `h_0 = C(Φ_B)⁻¹`, the `B`-side), `inf` for `v_p(t) < 0`
(`t → ∞`, `h_∞ = C(Φ_A)`, the `A`-side), `one` for `v_p(t - 1) > 0`. -/
inductive Cusp
  | inf
  | zero
  | one
  deriving DecidableEq

/-- **1.11**, the cusp of `t` at `p`, if any. -/
def cuspAt (t : ℚ) (p : ℕ) : Option Cusp :=
  if 0 < padicValRat p t then some .zero
  else if padicValRat p t < 0 then some .inf
  else if 0 < padicValRat p (t - 1) then some .one
  else none

/-- **1.11**, `p` is tame for `(D, t)`: not wild, and `t` has a cusp at `p`. For `t = 1`,
`padicValRat p 0 = 0`, so no prime is tame. -/
def IsTame (t : ℚ) (p : ℕ) : Prop := p.Prime ∧ ¬D.IsWild p ∧ (cuspAt t p).isSome

/-- **1.11**, `p` is good for `(D, t)`: neither wild nor tame. -/
def IsGood (t : ℚ) (p : ℕ) : Prop := p.Prime ∧ ¬D.IsWild p ∧ ¬D.IsTame t p

/-- The empty pair is a cyclotomic datum. -/
instance instNonemptyCyclotomicData : Nonempty CyclotomicData := ⟨⟨0, 0, by simp, by simp, rfl⟩⟩

/-- **1.9**, the primitive datum: the cyclotomic datum with gamma function `n ↦ γ(ρ n)`, `ρ` the
rotation number. A datum is determined by its gamma vector (1.4, `gamma_unique`), and the README
proves that this one exists. -/
def primitiveData : CyclotomicData :=
  Classical.epsilon fun D' : CyclotomicData =>
    ∀ n, D'.gamma n = D.gamma (D.toParameters.rotationNumber * n)

end CyclotomicData

/-! ## Layer 2: the zigzag, weight and Hodge vector -/

namespace HypergeometricParameters

variable (P : HypergeometricParameters)

/-- **2.2**, the multiset of heights at which the zigzag records the `α`'s, in block form: the
`c` copies of a class `a ∈ α` of multiplicity `c` are recorded at `Z(rep a) - c, …, Z(rep a) - 1`.
For `α = (1/2, 1/2)`, `β = (1, 1)` this is `{0, 1}`; reading every copy at `Z(rep a) - 1` would
give `{1, 1}`. -/
def recordedHeights : Multiset ℤ :=
  P.α.toFinset.val.bind fun a =>
    (Multiset.range (P.α.count a)).map fun j => P.Z (rep a) - 1 - j

/-- **2.2**, the least recorded height `m`. -/
def minHeight : ℤ := sInf (↑P.recordedHeights.toFinset : Set ℤ)

/-- **2.2**, the greatest recorded height `m + w`. -/
def maxHeight : ℤ := sSup (↑P.recordedHeights.toFinset : Set ℤ)

/-- **2.2**, the weight `w`. -/
def weight : ℕ := (P.maxHeight - P.minHeight).toNat

/-- **2.2**, the Hodge number `h^{p, w-p}`: the number of `α`'s recorded at height `m + p`. -/
def hodgeNumber (p : ℕ) : ℕ := P.recordedHeights.count (P.minHeight + p)

/-- **2.2**, the Hodge vector `(h^{0,w}, …, h^{w,0})`. -/
def hodgeVector : List ℕ := (List.range (P.weight + 1)).map P.hodgeNumber

/-- **2.3**, Sage's and Magma's form of the weight: `max Z - min Z - 1` over the representatives
and the value `0`, for `d > 0` (the empty pair has weight `0` and right side `-1`). -/
theorem weight_eq_sSup_sub_sInf (hd : 0 < P.degree) :
    (P.weight : ℤ) =
      sSup (insert 0 ((P.α + P.β).map fun x => P.Z (rep x)).toFinset : Set ℤ) -
        sInf (insert 0 ((P.α + P.β).map fun x => P.Z (rep x)).toFinset : Set ℤ) - 1 := sorry

/-- **2.4**, symmetry `h^{p,w-p} = h^{w-p,p}` for a pair stable under negation (every cyclotomic
datum, 1.5); the combinatorial shadow of Hodge symmetry. -/
theorem hodgeNumber_symm (hneg : P.neg = P) (p : ℕ) (hp : p ≤ P.weight) :
    P.hodgeNumber p = P.hodgeNumber (P.weight - p) := sorry

/-- **2.8**, weight `0` is interlacing. -/
theorem weight_eq_zero_iff_interlace (hd : 0 < P.degree) : P.weight = 0 ↔ P.Interlace := sorry

end HypergeometricParameters

namespace CyclotomicData

variable (D : CyclotomicData)

/-- **2.2**, the weight of a cyclotomic datum. -/
def weight : ℕ := D.toParameters.weight

/-- **2.2**, the Hodge vector of a cyclotomic datum. -/
def hodgeVector : List ℕ := D.toParameters.hodgeVector

/-- **2.5**, the first parity law: `w` is even iff `m_A + m_B` is odd. -/
theorem even_weight_iff (hd : 0 < D.degree) : Even D.weight ↔ Odd (D.multOne_A + D.multOne_B) :=
  sorry

/-- **2.5**, the Hodge-normalisation exponent `δ = (w + 1 - m_A - m_B)/2`: the power of `q` that
turns the finite sum `H_q` into the Frobenius trace of the Hodge-normalised motive (5.1). -/
def hodgeTwist : ℕ := (D.weight + 1 - D.multOne_A - D.multOne_B) / 2

/-- **2.5**, the division is exact and nothing is truncated: `2δ + m_A + m_B = w + 1`. -/
theorem two_mul_hodgeTwist (hd : 0 < D.degree) :
    2 * D.hodgeTwist + D.multOne_A + D.multOne_B = D.weight + 1 := sorry

/-- **2.5**, for `1 ∉ A`, `δ` is minus the least recorded height of the zigzag. -/
theorem hodgeTwist_eq_neg_minHeight (hA : 1 ∉ D.A) :
    (D.hodgeTwist : ℤ) = -D.toParameters.minHeight := sorry

/-- **2.6**, the second parity law: odd weight forces even degree. -/
theorem even_degree_of_odd_weight (hw : Odd D.weight) : Even D.degree := sorry

/-- **2.6**, the type: orthogonal for even weight, symplectic for odd. -/
inductive MotiveType
  | orthogonal
  | symplectic
  deriving DecidableEq

/-- **2.6**, the type of a cyclotomic datum (the LMFDB knowl `hgm.type`). -/
def type : MotiveType := if Even D.weight then .orthogonal else .symplectic

end CyclotomicData

/-! ## Layer 3: monodromy -/

section Companion

variable {R : Type*} [CommRing R]

/-- **3.1**, the companion matrix `C(f)` of `ClassicalArithmeticCompletion` 2.46
(`Polynomial.companion f`: `1` on the subdiagonal, `-coeff f i` in the last column), reached
through Mathlib: for monic `f` it is the matrix of multiplication by the root of `AdjoinRoot f` in
`AdjoinRoot.powerBasis'`, which is 2.46's `leftMulMatrix_root_eq_companion`, reindexed to `Fin d`
along `f.natDegree = d`. This reducible alias declares no matrix of its own; its characteristic
polynomial is Mathlib's `charpoly_leftMulMatrix` (2.60), its determinant 2.46's `det_companion`. -/
abbrev companionMatrix {d : ℕ} {f : R[X]} (hf : f.Monic) (hd : f.natDegree = d) :
    Matrix (Fin d) (Fin d) R :=
  (Algebra.leftMulMatrix (AdjoinRoot.powerBasis' hf).basis (AdjoinRoot.root f)).reindex
    (finCongr hd) (finCongr hd)

/-- **3.1**, the rank formula: `rank (C(f)^k - 1) = d - #{distinct roots ζ of f with ζ^k = 1}`
over a field of characteristic `0` in which `f` splits, for `k ≥ 1`. This is what 5.9 evaluates.
Both hypotheses are needed: over `ZMod 2`, `C(X² + 1)² = 1` has rank `0` at `k = 2`, and at
`k = 0` the left side is `0` while a repeated root makes the right side positive. -/
theorem rank_companion_pow_sub_one {K : Type*} [Field K] [CharZero K] {d : ℕ} {f : K[X]}
    (hf : f.Monic) (hd : f.natDegree = d) (hs : f.Splits) (k : ℕ) (hk : 0 < k) :
    ((companionMatrix hf hd) ^ k - 1).rank =
      d - (f.roots.toFinset.filter fun ζ => ζ ^ k = 1).card := sorry

end Companion

section Levelt

variable {K : Type*} [Field K] {d : ℕ} {p q : K[X]} (hp : p.Monic) (hq : q.Monic)
  (hpd : p.natDegree = d) (hqd : q.natDegree = d)

/-- **3.4 (i)**, Levelt's theorem over any field `K`, rigidity: if `p, q` are monic of degree `d`
with no common root in `K̄` (`IsCoprime p q`), a triple `g_∞ g_1 g_0 = 1` in `GL_d(K)` with
`charpoly g_∞ = p`, `charpoly g_0⁻¹ = q` and `g_1` a pseudo-reflection is simultaneously conjugate
to `(C(p), C(p)⁻¹ C(q), C(q)⁻¹)` (the field generalization of Beukers–Heckman Theorem 3.5; Qian Lemma 3.4 supplies the
companion convention in a cyclotomic setting). -/
theorem levelt_rigidity_field (hcop : IsCoprime p q) (gInf gOne gZero : Matrix (Fin d) (Fin d) K)
    (hrel : gInf * gOne * gZero = 1) (hInf : gInf.charpoly = p) (hZero : gZero⁻¹.charpoly = q)
    (hunit : IsUnit gZero) (hOne : (gOne - 1).rank ≤ 1) :
    ∃ c : Matrix (Fin d) (Fin d) K, IsUnit c ∧
      gInf = c * companionMatrix hp hpd * c⁻¹ ∧ gZero = c * (companionMatrix hq hqd)⁻¹ * c⁻¹ :=
  sorry

/-- **3.4 (ii)**, Levelt's theorem over any field, irreducibility: a subspace of `K^d` stable under
`C(p)` and `C(q)` is `⊥` or `⊤`. Applied over `K̄`, where `p, q` stay coprime, this is absolute
irreducibility. -/
theorem levelt_irreducible_field (hcop : IsCoprime p q) (V : Submodule K (Fin d → K))
    (hInf : V.map (Matrix.toLin' (companionMatrix hp hpd)) ≤ V)
    (hZero : V.map (Matrix.toLin' (companionMatrix hq hqd)) ≤ V) :
    V = ⊥ ∨ V = ⊤ := sorry

end Levelt

namespace HypergeometricParameters

variable (P : HypergeometricParameters)

/-- `e(x) = exp(2πi · rep x)`, the root of unity of a class. -/
def e (x : QmodZ) : ℂ := Complex.exp (2 * Real.pi * Complex.I * rep x)

/-- **3.2**, `q_∞ = ∏_{a ∈ α} (X - e(a))`. -/
def qInf : ℂ[X] := (P.α.map fun a => X - C (e a)).prod

/-- **3.2**, `q_0 = ∏_{b ∈ β} (X - e(b))`. -/
def qZero : ℂ[X] := (P.β.map fun b => X - C (e b)).prod

/-- **3.2**, `h_∞ = C(q_∞)`. -/
def hInf : Matrix (Fin P.degree) (Fin P.degree) ℂ :=
  companionMatrix (f := P.qInf)
    (monic_multiset_prod_of_monic _ _ fun _ _ => monic_X_sub_C _)
    (by simpa [qInf, degree, Multiset.map_map] using
      natDegree_multiset_prod_X_sub_C_eq_card (P.α.map e))

/-- **3.2**, `h_0 = C(q_0)⁻¹`. -/
def hZero : Matrix (Fin P.degree) (Fin P.degree) ℂ :=
  (companionMatrix (f := P.qZero)
    (monic_multiset_prod_of_monic _ _ fun _ _ => monic_X_sub_C _)
    (by simpa [qZero, degree, Multiset.map_map, P.card_eq] using
      natDegree_multiset_prod_X_sub_C_eq_card (P.β.map e)))⁻¹

/-- **3.2**, the hypergeometric group `Γ(α, β) = ⟨h_∞, h_0⟩ ≤ GL_d(ℂ)`. -/
def hypergeometricGroup : Subgroup (GL (Fin P.degree) ℂ) :=
  Subgroup.closure
    {g | (g : Matrix (Fin P.degree) (Fin P.degree) ℂ) = P.hInf ∨
      (g : Matrix (Fin P.degree) (Fin P.degree) ℂ) = P.hZero}

/-- **3.5**, Beukers–Heckman Theorem 4.3: `Γ(α, β)` preserves a nondegenerate Hermitian form
`S` (`hᴴ S h = S` for `h = h_∞, h_0`), and every Hermitian form it preserves is a real multiple
of `S`. -/
theorem exists_invariantForm :
    ∃ S : Matrix (Fin P.degree) (Fin P.degree) ℂ, S.IsHermitian ∧ S.det ≠ 0 ∧
      P.hInfᴴ * S * P.hInf = S ∧ P.hZeroᴴ * S * P.hZero = S ∧
      ∀ T : Matrix (Fin P.degree) (Fin P.degree) ℂ, T.IsHermitian →
        P.hInfᴴ * T * P.hInf = T → P.hZeroᴴ * T * P.hZero = T →
          ∃ c : ℝ, T = (c : ℂ) • S := sorry

/-- **3.6**, the Beukers–Heckman signature defect `|∑_j (-1)^{j + m_j}|`, with `α_1 ≤ ⋯ ≤ α_d`
the representatives of `α` in `[0, 1)`, listed with repetition, and `m_j = #{k : β_k < α_j}`. The
index `j` is the position in the sorted list, so equal `α`'s get consecutive indices: for
`α = (1/2, 1/2, 1/2, 1/2)`, `β = (0, 0, 0, 0)` the sum is `0` (signature `(2, 2)`), where counting
`#{α' < α_j}` instead would give `4` and a definite form. ⚠ This is the unsigned invariant of the
monodromy-invariant form; it is distinct from the signed real signature constructed in 5.0. -/
def bhSignatureDefect : ℕ :=
  (((P.α.map rep0).sort).mapIdx fun j a =>
    (-1 : ℤ) ^ (j + 1 + (P.β.filter fun b => rep0 b < a).card)).sum.natAbs

/-- **3.6**, Beukers–Heckman Theorem 4.5 and Corollary 4.7: for every nondegenerate Hermitian form
preserved by `Γ(α, β)`, the numbers of positive and of negative eigenvalues differ by
`bhSignatureDefect` in absolute value. -/
theorem signature_invariantForm (S : Matrix (Fin P.degree) (Fin P.degree) ℂ)
    (hS : S.IsHermitian) (hdet : S.det ≠ 0) (hInfS : P.hInfᴴ * S * P.hInf = S)
    (hZeroS : P.hZeroᴴ * S * P.hZero = S) :
    (((Finset.univ.filter fun i => 0 < hS.eigenvalues i).card : ℤ) -
      (Finset.univ.filter fun i => hS.eigenvalues i < 0).card).natAbs = P.bhSignatureDefect :=
  sorry

/-- **3.7**, Beukers–Heckman Theorem 4.8: `Γ(α, β)` is finite iff every Galois conjugate
`(uα, uβ)`, `gcd(u, N) = 1`, interlaces. -/
theorem finite_hypergeometricGroup_iff (hd : 0 < P.degree) :
    Finite P.hypergeometricGroup ↔
      ∀ u : ℤ, IsCoprime u (P.denominator : ℤ) →
        InterlaceMultisets (P.α.map (u • ·)) (P.β.map (u • ·)) := sorry

/-- **3.9**, imprimitivity: a decomposition `ℂ^d = V_1 ⊕ ⋯ ⊕ V_k`, `k ≥ 2`, into nonzero
subspaces permuted by `Γ`. Without `V i ≠ ⊥`, `V = ![⊤, ⊥]` would make every group imprimitive. -/
def IsImprimitive : Prop :=
  ∃ (k : ℕ) (V : Fin k → Submodule ℂ (Fin P.degree → ℂ)), 2 ≤ k ∧ (∀ i, V i ≠ ⊥) ∧
    iSupIndep V ∧ (⨆ i, V i) = ⊤ ∧
    ∀ g ∈ P.hypergeometricGroup, ∀ i, ∃ j,
      (V i).map (Matrix.toLin' (g : Matrix (Fin P.degree) (Fin P.degree) ℂ)) = V j

/-- **3.9**, a rotation number `ρ > 1` makes `Γ(α, β)` imprimitive with `k = ρ` blocks: the
subspaces spanned by the basis vectors `e_j`, `j ≡ i (mod ρ)`, are permuted cyclically by both
companion matrices because `q_∞, q_0 ∈ ℂ[X^ρ]` (1.8). -/
theorem isImprimitive_of_rotationNumber (hd : 0 < P.degree) (hρ : 1 < P.rotationNumber) :
    P.IsImprimitive := sorry

end HypergeometricParameters

namespace CyclotomicData

variable (D : CyclotomicData)

/-- **3.2**, the integral Levelt matrix `h_∞ = C(Φ_A) ∈ GL_d(ℤ)`. -/
def hInfInt : Matrix (Fin D.degree) (Fin D.degree) ℤ := companionMatrix (f := D.PhiA)
    (monic_multiset_prod_of_monic _ _ fun a _ => cyclotomic.monic a ℤ)
    (by
      unfold PhiA degree
      rw [natDegree_multiset_prod_of_monic _ fun f hf => by
        obtain ⟨a, -, rfl⟩ := Multiset.mem_map.1 hf
        exact cyclotomic.monic a ℤ]
      simp [Multiset.map_map, natDegree_cyclotomic])

/-- **3.2**, the integral Levelt matrix `h_0 = C(Φ_B)⁻¹ ∈ GL_d(ℤ)`; `Φ_B(0) = ±1` makes the
inverse integral. -/
def hZeroInt : Matrix (Fin D.degree) (Fin D.degree) ℤ :=
  (companionMatrix (f := D.PhiB)
    (monic_multiset_prod_of_monic _ _ fun b _ => cyclotomic.monic b ℤ)
    (by
      unfold PhiB degree
      rw [natDegree_multiset_prod_of_monic _ fun f hf => by
        obtain ⟨b, -, rfl⟩ := Multiset.mem_map.1 hf
        exact cyclotomic.monic b ℤ]
      simpa [Multiset.map_map, natDegree_cyclotomic] using D.degree_eq.symm))⁻¹

/-- **3.5**, the rational invariant bilinear form for cyclotomic data: nondegenerate,
symmetric in even weight and alternating in odd weight. Multiplication by `i` in the latter
case gives the complex invariant Hermitian form (Beukers–Heckman, Theorem 4.3 and §6). -/
theorem exists_invariantBilinearForm :
    ∃ B : Matrix (Fin D.degree) (Fin D.degree) ℚ, B.det ≠ 0 ∧
      B.transpose = (if Even D.weight then B else -B) ∧
      (D.hInfInt.map (Int.castRingHom ℚ)).transpose * B *
        D.hInfInt.map (Int.castRingHom ℚ) = B ∧
      (D.hZeroInt.map (Int.castRingHom ℚ)).transpose * B *
        D.hZeroInt.map (Int.castRingHom ℚ) = B := sorry

/-- **3.7** with **2.8**: the monodromy of a cyclotomic datum is finite iff its weight is `0`. -/
theorem finite_hypergeometricGroup_iff_weight_eq_zero (hd : 0 < D.degree) :
    Finite D.toParameters.hypergeometricGroup ↔ D.weight = 0 := sorry

end CyclotomicData

section Bezout

variable {R : Type*} [CommRing R]

/-- **3.8**, the Bézout matrix of `f, g` at size `d`:
`b_{ij} = ∑_{k ≤ min(i,j)} (f_{i+j+1-k} g_k - f_k g_{i+j+1-k})`, the coefficients of
`(f(X) g(Y) - f(Y) g(X)) / (X - Y)`. -/
def bezout (f g : R[X]) (d : ℕ) : Matrix (Fin d) (Fin d) R :=
  Matrix.of fun i j =>
    ∑ k ∈ Finset.range (min (i : ℕ) j + 1),
      (f.coeff (i + j + 1 - k) * g.coeff k - f.coeff k * g.coeff (i + j + 1 - k))

/-- **3.8**, `det (bezout f g d) = (-1)^{d(d-1)/2} · resultant f g` for `f, g` of degree exactly
`d`. The sign is the one Sage reports for `A = [6,4,4,4,3]`, `B = [10,2,2,2,2,2,2]`
(`-191102976 = (-1)^{45} Res`). -/
theorem det_bezout (f g : R[X]) {d : ℕ} (hf : f.natDegree = d) (hg : g.natDegree = d) :
    (bezout f g d).det = (-1) ^ (d * (d - 1) / 2) * resultant f g := sorry

end Bezout

namespace CyclotomicData

variable (D : CyclotomicData)

/-- **3.8**, the Bézout matrix of a cyclotomic datum (LMFDB knowl `hgm.bezout_matrix`). -/
def bezoutMatrix : Matrix (Fin D.degree) (Fin D.degree) ℤ := bezout D.PhiA D.PhiB D.degree

/-- **3.8**, the Bézout determinant. -/
def bezoutDeterminant : ℤ := D.bezoutMatrix.det

/-- **3.8**, the Bézout module `ℤ^d / B ℤ^d` (LMFDB knowl `hgm.bezout_module`). -/
def BezoutModule : Type := (Fin D.degree → ℤ) ⧸ LinearMap.range (Matrix.toLin' D.bezoutMatrix)

/-- The additive group on the integral Bézout cokernel. -/
instance instBezoutModuleAddCommGroup : AddCommGroup D.BezoutModule :=
  inferInstanceAs
    (AddCommGroup ((Fin D.degree → ℤ) ⧸ LinearMap.range (Matrix.toLin' D.bezoutMatrix)))

/-- **3.8**, the Bézout module is finite of order `|det B|`, nonzero by the coprimality of `Φ_A`
and `Φ_B` over `ℚ`. -/
theorem card_bezoutModule : Nat.card D.BezoutModule = D.bezoutDeterminant.natAbs := sorry

end CyclotomicData

/-! ## Layer 4: finite hypergeometric sums

Everything is over a finite field `F` with `q` elements, `𝔮 = q - 1`, with a multiplicative
character `ω : MulChar F ℂ` and an additive character `ψ : AddChar F ℂ`. The parameters enter as
integers modulo `𝔮` (4.1); the sums are stated for integer multisets `a, b` of equal cardinality,
and `ω ^ m` is Mathlib's `zpow` on the group `MulChar F ℂ`. -/

section FiniteSums

variable {F : Type*} [Field F] [Finite F] [DecidableEq F]

/-- `𝔮 = q - 1`. -/
abbrev qm (F : Type*) [Finite F] : ℕ := Nat.card F - 1

/-- **4.3**, `g(m) = gaussSum (ω ^ m) ψ` for `m : ℤ`. With Mathlib's `ω 0 = 0`, `g(0) = -1` for
nontrivial `ψ`. -/
def gaussSumPow (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (m : ℤ) : ℂ :=
  letI := Fintype.ofFinite F
  gaussSum (ω ^ m) ψ

/-- **4.1**, the integer parameter `𝔮 · rep x` of an admissible class (`𝔮 • x = 0`); the floor
makes it total. -/
def intParam (𝔮 : ℕ) (x : QmodZ) : ℤ := ⌊(𝔮 : ℚ) * rep x⌋

/-- **4.1**, the integer parameter vectors `a = 𝔮 α`, `b = 𝔮 β`. -/
def HypergeometricParameters.intParams (𝔮 : ℕ) (P : HypergeometricParameters) :
    Multiset ℤ × Multiset ℤ :=
  (P.α.map (intParam 𝔮), P.β.map (intParam 𝔮))

/-- **4.3**, the unnormalised sum
`S_q(a, b | t) = 𝔮⁻¹ ∑_{m ∈ ℤ/𝔮} ∏_i g(m + a_i) g(-m - b_i) · ω((-1)^d t)^m`. -/
def katzSum (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (a b : Multiset ℤ) (t : F) : ℂ :=
  (qm F : ℂ)⁻¹ * ∑ m ∈ Finset.range (qm F),
    ((a.map fun aᵢ => gaussSumPow ω ψ (m + aᵢ)).prod *
      (b.map fun bᵢ => gaussSumPow ω ψ (-m - bᵢ)).prod) *
      ω ((-1) ^ Multiset.card a * t) ^ m

/-- **4.3**, Beukers–Cohen–Mellit's `H_q(a, b | t) = -(∏_i g(a_i) g(-b_i))⁻¹ · S_q(a, b | t)`,
Definition 1.1 since `-1/𝔮 = 1/(1 - q)`. **This is the sum that enters the arithmetic layer.** -/
def hypergeometricSum (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (a b : Multiset ℤ) (t : F) : ℂ :=
  -((a.map fun aᵢ => gaussSumPow ω ψ aᵢ).prod * (b.map fun bᵢ => gaussSumPow ω ψ (-bᵢ)).prod)⁻¹ *
    katzSum ω ψ a b t

/-- **4.2**, Katz's exponential sum over the torus `t ∏ x_i = ∏ y_j`:
`∑ ψ(∑ x_i - ∑ y_j) ∏ ω^{a_i}(x_i) ∏ ω^{-b_j}(y_j)`, the parameters listed. -/
def katzExpSum (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (a b : List ℤ) (t : F) : ℂ :=
  letI := Fintype.ofFinite F
  ∑ x : Fin a.length → F, ∑ y : Fin b.length → F,
    if t * ∏ i, x i = ∏ j, y j then
      ψ (∑ i, x i - ∑ j, y j) * ∏ i, (ω ^ a.get i) (x i) * ∏ j, (ω ^ (-b.get j)) (y j)
    else 0

/-- **4.3**, Beukers–Cohen–Mellit Proposition 3.1: `Hyp_q = ω(-1)^{∑ b} S_q(a, b | t)`. -/
theorem katzExpSum_eq (ω : MulChar F ℂ) (hω : orderOf ω = qm F) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (a b : List ℤ)
    (hab : a.length = b.length) (t : F) (ht : t ≠ 0) :
    katzExpSum ω ψ a b t = ω (-1) ^ b.sum * katzSum ω ψ (↑a) (↑b) t := sorry

/-- **4.4 (iii)**, the Galois action: an automorphism of `ℂ` acting on the values of `ω` by
`ζ ↦ ζ^u` and on those of `ψ` arbitrarily sends `H_q(a, b | t)` to `H_q(ua, ub | t)`. -/
theorem hypergeometricSum_galois (σ : ℂ ≃+* ℂ) (ω : MulChar F ℂ) (ψ : AddChar F ℂ)
    (hψ : ψ.IsPrimitive) (hω : orderOf ω = qm F) (u : ℤ) (hu : IsCoprime u (qm F : ℤ))
    (hσ : ω.ringHomComp (σ : ℂ →+* ℂ) = ω ^ u) (a b : Multiset ℤ)
    (hab : Multiset.card a = Multiset.card b) (t : F) :
    σ (hypergeometricSum ω ψ a b t) = hypergeometricSum ω ψ (a.map (u * ·)) (b.map (u * ·)) t :=
  sorry

/-- **4.6**, Beukers–Cohen–Mellit Theorem 3.4, the shift, for `t ≠ 0` and with the sign their
statement drops: `ω((-1)^d t)^μ S_q(a + μ, b + μ | t) = S_q(a, b | t)` (reindex `m ↦ m - μ`, which
needs `ω((-1)^d t)^m` periodic modulo `𝔮`). The printed `ω(t)^μ` fails for `d μ` odd: over `𝔽_5`,
`a = {0}`, `b = {2}`, `μ = 1`, `t = 2`; at `t = 0` the left side is `0` and the right side is
not. -/
theorem katzSum_shift (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (a b : Multiset ℤ)
    (hab : Multiset.card a = Multiset.card b) (μ : ℤ) (t : F) (ht : t ≠ 0) :
    ω ((-1) ^ Multiset.card a * t) ^ μ * katzSum ω ψ (a.map (· + μ)) (b.map (· + μ)) t =
      katzSum ω ψ a b t := sorry

/-- **4.6**, Beukers–Cohen–Mellit Theorem 3.5, the swap: `H_q(a, b | t) = H_q(-b, -a | 1/t)`. -/
theorem hypergeometricSum_swap (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (a b : Multiset ℤ)
    (hab : Multiset.card a = Multiset.card b) (t : F) (ht : t ≠ 0) :
    hypergeometricSum ω ψ a b t = hypergeometricSum ω ψ (b.map Neg.neg) (a.map Neg.neg) t⁻¹ :=
  sorry

/-- **4.12**, Greene's binomial coefficient `(A over B) = B(-1)/q · J(A, B̄)` (Definition 2.4). -/
def greeneBinom (A B : MulChar F ℂ) : ℂ :=
  letI := Fintype.ofFinite F
  B (-1) / Nat.card F * jacobiSum A B⁻¹

/-- **4.12**, Greene's `_{n+1}F_n(A_0, …, A_n; B_1, …, B_n | x)` (Definition 3.10), the sum over
all characters written as `ω^m`, `m ∈ ℤ/𝔮`, for a generator `ω`. -/
def greeneF (ω : MulChar F ℂ) {n : ℕ} (A : Fin (n + 1) → MulChar F ℂ) (B : Fin n → MulChar F ℂ)
    (x : F) : ℂ :=
  (Nat.card F : ℂ) / qm F * ∑ m ∈ Finset.range (qm F),
    greeneBinom (A 0 * ω ^ m) (ω ^ m) * (∏ i, greeneBinom (A i.succ * ω ^ m) (B i * ω ^ m)) *
      (ω ^ m) x

/-- **4.12**, the comparison with `S_q`: for `A_i = ω^{a_i}` and `B_j = ω^{b_j}` over the nonzero
entries of `b` (so `0 ∈ b` with multiplicity exactly one),
`_{n+1}F_n(A; B | x) = ω(-1)^{∑ b_j} · q^{1-d} · (∏_i g(a_i - b_i))⁻¹ · S_q(a, b | x)` when
`x ≠ 0` and `a` is disjoint from `{0} ∪ b` modulo `𝔮`; the sign comes from the factors `B_j(-1)`
of Greene's binomial coefficients. Both hypotheses are needed: at `x = 0` the left side is `0`
and the right side is not, and over `𝔽_7` with `a = (1, 3)`, `b = (3)` the ratio at `x = 2` is not
`±1`. -/
theorem greeneF_eq_katzSum (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (hω : orderOf ω = qm F) {n : ℕ} (a : Fin (n + 1) → ℤ) (b : Fin n → ℤ)
    (hb : ∀ j, ((b j : ℤ) : ZMod (qm F)) ≠ 0) (ha : ∀ i, ((a i : ℤ) : ZMod (qm F)) ≠ 0)
    (hab : ∀ i j, ((a i : ℤ) : ZMod (qm F)) ≠ ((b j : ℤ) : ZMod (qm F))) (x : F) (hx : x ≠ 0) :
    greeneF ω (fun i => ω ^ a i) (fun j => ω ^ b j) x =
      (ω ^ (∑ j, b j)) (-1) * (Nat.card F : ℂ) ^ (1 - (n + 1 : ℤ)) *
        ((∏ i : Fin (n + 1),
          gaussSumPow ω ψ (a i - (Fin.cons (0 : ℤ) b : Fin (n + 1) → ℤ) i))⁻¹) *
        katzSum ω ψ (Multiset.map a Finset.univ.val)
          (Multiset.map (Fin.cons (0 : ℤ) b : Fin (n + 1) → ℤ) Finset.univ.val) x := sorry

end FiniteSums

namespace CyclotomicData

section Rational

variable {F : Type*} [Field F] [Finite F] [DecidableEq F]

/-- **4.5**, the rational value of `H_q(α(A), β(B) | t)` for a cyclotomic datum and `N ∣ q - 1`:
the rational number whose image in `ℂ` is the sum of 4.3 for some generator `ω` and primitive `ψ`.
That it exists and does not depend on the choice is `hypergeometricSumRat_spec`. -/
def hypergeometricSumRat (D : CyclotomicData) (F : Type*) [Field F] [Finite F] [DecidableEq F]
    (t : F) : ℚ :=
  Classical.epsilon fun x : ℚ => ∃ (ω : MulChar F ℂ) (ψ : AddChar F ℂ),
    orderOf ω = qm F ∧ ψ.IsPrimitive ∧
      (x : ℂ) = hypergeometricSum ω ψ (D.toParameters.intParams (qm F)).1
        (D.toParameters.intParams (qm F)).2 t

/-- **4.5**, rationality and independence of `ω`: for every generator `ω` and primitive `ψ`, the
complex sum of 4.3 is the rational number `hypergeometricSumRat`. -/
theorem hypergeometricSumRat_spec (D : CyclotomicData) (hN : D.toParameters.denominator ∣ qm F)
    (ω : MulChar F ℂ) (hω : orderOf ω = qm F) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (t : F) :
    (D.hypergeometricSumRat F t : ℂ) =
      hypergeometricSum ω ψ (D.toParameters.intParams (qm F)).1
        (D.toParameters.intParams (qm F)).2 t := sorry

/-- **4.7**, the multiplicity `s(m)` of `ζ_𝔮^m` as a root of
`D(X) = gcd(∏_{γ(n)>0} (X^n - 1)^{γ(n)}, ∏_{γ(n)<0} (X^n - 1)^{-γ(n)})` over `ℂ`. -/
def commonRootMultiplicity (D : CyclotomicData) (𝔮 : ℕ) (m : ℕ) : ℕ :=
  Polynomial.rootMultiplicity (Complex.exp (2 * Real.pi * Complex.I * (m : ℂ) / (𝔮 : ℂ)))
    (gcd (∏ n ∈ D.gammaSupport, ((X : ℂ[X]) ^ n - 1) ^ (D.gamma n).toNat)
      (∏ n ∈ D.gammaSupport, ((X : ℂ[X]) ^ n - 1) ^ (-D.gamma n).toNat))

/-- **4.7**, `ε = (-1)^{∑_{γ(n)<0} (-n γ(n))}`. -/
def epsilon (D : CyclotomicData) : ℤ := (-1) ^ (∑ n ∈ D.gammaSupport, n * (-D.gamma n).toNat)

/-- **4.7**, the gamma-vector form of Beukers–Cohen–Mellit Theorem 1.3:
`H_q^γ(A, B | t) = ((-1)^{r+s}/(1-q)) ∑_m q^{-s(0)+s(m)} ∏_{γ(n)>0} g(nm)^{γ(n)}
∏_{γ(n)<0} g(-nm)^{-γ(n)} · ω(ε M⁻¹ t)^m`, which needs no congruence on `q`. -/
def gammaVectorSum (D : CyclotomicData) (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (t : F) : ℂ :=
  ((-1) ^ (D.r + D.s) / (1 - (Nat.card F : ℂ))) * ∑ m ∈ Finset.range (qm F),
    (Nat.card F : ℂ) ^ ((D.commonRootMultiplicity (qm F) m : ℤ) -
      D.commonRootMultiplicity (qm F) 0) *
    (∏ n ∈ D.gammaSupport, gaussSumPow ω ψ (n * m) ^ (D.gamma n).toNat) *
    (∏ n ∈ D.gammaSupport, gaussSumPow ω ψ (-(n * m)) ^ (-D.gamma n).toNat) *
    ω ((D.epsilon : F) * ratToField F D.M⁻¹ * t) ^ m

/-- **4.7**, Beukers–Cohen–Mellit Theorem 1.3: when `N ∣ q - 1` the gamma form is `H_q`. -/
theorem gammaVectorSum_eq_hypergeometricSum (D : CyclotomicData)
    (hN : D.toParameters.denominator ∣ qm F) (ω : MulChar F ℂ) (hω : orderOf ω = qm F)
    (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (t : F) :
    D.gammaVectorSum ω ψ t =
      hypergeometricSum ω ψ (D.toParameters.intParams (qm F)).1
        (D.toParameters.intParams (qm F)).2 t := sorry

/-- **4.7**, the value of the gamma form at every prime power coprime to the wild primes, as a
rational number: **from here on `H_q(A, B | t)` means this.** It is the rational number whose
image in `ℂ` is `gammaVectorSum` for some generator `ω` and primitive `ψ`; that it exists and does
not depend on the choice is `frobeniusSum_spec`. -/
def frobeniusSum (D : CyclotomicData) (F : Type*) [Field F] [Finite F] [DecidableEq F]
    (t : F) : ℚ :=
  Classical.epsilon fun x : ℚ => ∃ (ω : MulChar F ℂ) (ψ : AddChar F ℂ),
    orderOf ω = qm F ∧ ψ.IsPrimitive ∧ (x : ℂ) = D.gammaVectorSum ω ψ t

/-- **4.7**, rationality of the gamma form for `p ∤ N`, for every generator `ω` and primitive `ψ`. -/
theorem frobeniusSum_spec (D : CyclotomicData) (hp : ∀ p ∈ D.wildPrimes, ¬p ∣ Nat.card F)
    (ω : MulChar F ℂ) (hω : orderOf ω = qm F) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (t : F) :
    (D.frobeniusSum F t : ℂ) = D.gammaVectorSum ω ψ t := sorry

/-- **4.9**, integrality for cyclotomic data: `q^δ H_q(A, B | t) ∈ ℤ` with `δ = hodgeTwist` (2.5),
which is sharp (`A2.2_B4`: `δ = 1`, `H_3(· | 2) = -2/3`) and implies Beukers–Cohen–Mellit's
`q^{min(r,s) - λ} H_q ∈ ℤ`. At `t = 0` the sum is the single term `1/(1 - q)`, hence `t ≠ 0`. -/
theorem frobeniusSum_integral (D : CyclotomicData) (hp : ∀ p ∈ D.wildPrimes, ¬p ∣ Nat.card F)
    (t : F) (ht : t ≠ 0) :
    ∃ z : ℤ, (Nat.card F : ℚ) ^ D.hodgeTwist * D.frobeniusSum F t = z := sorry

/-- **4.10**, the swap at the level of traces: `H_q(A, B | t) = H_q(B, A | 1/t)`. -/
theorem frobeniusSum_swap (D : CyclotomicData) (hp : ∀ p ∈ D.wildPrimes, ¬p ∣ Nat.card F)
    (t : F) (ht : t ≠ 0) :
    D.swap.frobeniusSum F t⁻¹ = D.frobeniusSum F t := sorry

/-- **4.11**, Katz's Kummer pullback at the level of sums: for a datum with rotation number `ρ`
and primitive datum `D'`, `H_q(D | t) = ∑_{c^ρ = t} H_q(D' | c)`, both sides `0` when `t` is not
a `ρ`-th power, for `ρ ∣ q - 1`. -/
theorem frobeniusSum_primitiveData (D : CyclotomicData)
    (hp : ∀ p ∈ D.wildPrimes, ¬p ∣ Nat.card F) (hρ : D.toParameters.rotationNumber ∣ qm F)
    (t : F) (ht : t ≠ 0) :
    D.frobeniusSum F t =
      ∑ᶠ c : {c : F // c ^ D.toParameters.rotationNumber = t},
        D.primitiveData.frobeniusSum F c := sorry

end Rational

end CyclotomicData

/-! ## Layer 5: Frobenius traces, Euler factors and bad primes -/

namespace CyclotomicData

variable (D : CyclotomicData)

/-- **5.1**, the Frobenius trace `a_q(A, B; t) = q^δ H_q(A, B | t)` at `q = p^f`, `δ = hodgeTwist`,
read in Mathlib's `GaloisField p f`: the LMFDB's `t`, not `1/t`, and the Hodge-normalised trace.
It is `a_q` for `p` good for `(D, t)` and `f ≥ 1`; at `f = 0` the field is `ZMod p` and the
prefactor `1`, so the value is not `a_1`. -/
def frobeniusTrace (t : ℚ) (p : ℕ) [Fact p.Prime] (f : ℕ) : ℚ :=
  ((p : ℚ) ^ f) ^ D.hodgeTwist * D.frobeniusSum (GaloisField p f) (ratToField _ t)

/-- **5.1**, integrality `a_q ∈ ℤ` (4.9) for `t ≠ 0`, `p` good and `f ≥ 1`. For `A2.2_B4`,
`t = 2`, `p = 3`, `f = 0` the value is `H_3 = -2/3`, which is why `f ≥ 1` is a hypothesis. -/
theorem frobeniusTrace_integral (t : ℚ) (ht : t ≠ 0) (p : ℕ) [Fact p.Prime] (f : ℕ)
    (hf : 0 < f) (hp : D.IsGood t p) :
    ∃ z : ℤ, D.frobeniusTrace t p f = z := sorry

/-- **5.2**, the Frobenius series `exp(-∑_{e ≥ 1} a_{p^e} T^e / e) ∈ ℚ⟦T⟧`. -/
def frobeniusSeries (t : ℚ) (p : ℕ) [Fact p.Prime] : PowerSeries ℚ :=
  PowerSeries.subst
    (-(PowerSeries.mk fun e : ℕ => if e = 0 then (0 : ℚ) else D.frobeniusTrace t p e / e))
    (PowerSeries.exp ℚ)

/-- **5.2**, the Frobenius polynomial, the truncation of the series to degree `d`. -/
def frobeniusPolynomial (t : ℚ) (p : ℕ) [Fact p.Prime] : ℚ[X] :=
  PowerSeries.trunc (D.degree + 1) (D.frobeniusSeries t p)

/-- **5.5**, the purity hypothesis: the traces at all powers of `p` are the power sums of `d`
complex numbers of absolute value `p^{w/2}` (Weil `p`-numbers of weight `w`). Katz's theorem
supplies it for the realization in README 5.0; that geometric carrier is absent at the pins. -/
def IsPure (t : ℚ) (p : ℕ) [Fact p.Prime] : Prop :=
  ∃ Λ : Multiset ℂ, Multiset.card Λ = D.degree ∧
    (∀ z ∈ Λ, ‖z‖ = (p : ℝ) ^ ((D.weight : ℝ) / 2)) ∧
    ∀ e : ℕ, 1 ≤ e → (D.frobeniusTrace t p e : ℂ) = (Λ.map fun z => z ^ e).sum

/-- **5.5 (i)**, under purity the Frobenius series is `∏_{λ ∈ Λ} (1 - λT)`, a polynomial of
degree exactly `d`. -/
theorem frobeniusPolynomial_of_isPure (t : ℚ) (p : ℕ) [Fact p.Prime] (Λ : Multiset ℂ)
    (hcard : Multiset.card Λ = D.degree)
    (hΛ : ∀ z ∈ Λ, ‖z‖ = (p : ℝ) ^ ((D.weight : ℝ) / 2))
    (htr : ∀ e : ℕ, 1 ≤ e → (D.frobeniusTrace t p e : ℂ) = (Λ.map fun z => z ^ e).sum) :
    (D.frobeniusPolynomial t p).map (algebraMap ℚ ℂ) = (Λ.map fun z => 1 - C z * X).prod ∧
      (D.frobeniusPolynomial t p).natDegree = D.degree := sorry

/-- **5.5 (ii)**, for `t ≠ 0` and `p` good, under purity the Frobenius polynomial has integer
coefficients: the series `1 + ∑_e a_{p^e} T^e = 1 - T F'/F` is rational with integral
coefficients (5.1), so Fatou's lemma makes its reduced denominator integral and the `λ ∈ Λ`
algebraic integers. At a wild
prime the traces are unconstrained values of `Classical.epsilon`, and purity alone does not make
a multiset integral. -/
theorem frobeniusPolynomial_int_of_isPure (t : ℚ) (ht : t ≠ 0) (p : ℕ) [Fact p.Prime]
    (hp : D.IsGood t p) (hpure : D.IsPure t p) :
    ∃ G : ℤ[X], G.map (Int.castRingHom ℚ) = D.frobeniusPolynomial t p := sorry

/-- **5.5 (iii)**, the Weil bound `|coeff k| ≤ C(d, k) p^{kw/2}` on the coefficients. -/
theorem abs_coeff_frobeniusPolynomial_le (t : ℚ) (p : ℕ) [Fact p.Prime] (hpure : D.IsPure t p)
    (k : ℕ) :
    (|(D.frobeniusPolynomial t p).coeff k| : ℝ) ≤
      (Nat.choose D.degree k : ℝ) * (p : ℝ) ^ ((k * D.weight : ℝ) / 2) := sorry

/-- **5.5**, the self-duality hypothesis `Λ = {p^w / λ}` on a pure multiset. -/
def IsSelfDual (t : ℚ) (p : ℕ) [Fact p.Prime] : Prop :=
  ∃ Λ : Multiset ℂ, Multiset.card Λ = D.degree ∧
    (∀ z ∈ Λ, ‖z‖ = (p : ℝ) ^ ((D.weight : ℝ) / 2)) ∧
    (∀ e : ℕ, 1 ≤ e → (D.frobeniusTrace t p e : ℂ) = (Λ.map fun z => z ^ e).sum) ∧
    Λ.map (fun z => (p : ℂ) ^ D.weight / z) = Λ

/-- **5.5**, the local functional equation under purity and self-duality:
`coeff (d - k) · p^{wk} = ε_p · p^{wd/2} · coeff k` with `ε_p = (-1)^d ∏λ / p^{wd/2} ∈ {±1}`,
i.e. `p^{wd/2} T^d F_p(1/(p^w T)) = ε_p F_p(T)`. `wd` is even by 2.6. -/
theorem local_functional_equation (t : ℚ) (p : ℕ) [Fact p.Prime] (hsd : D.IsSelfDual t p) :
    ∃ ε : ℤ, (ε = 1 ∨ ε = -1) ∧ ∀ k ≤ D.degree,
      (D.frobeniusPolynomial t p).coeff (D.degree - k) * (p : ℚ) ^ (D.weight * k) =
        ε * (p : ℚ) ^ (D.weight * D.degree / 2) * (D.frobeniusPolynomial t p).coeff k := sorry

/-- **5.5**, the symplectic sign: when `w` is odd and each of the two square roots `±p^{w/2}`
occurs in the pure self-dual multiset `Λ` with even multiplicity (in particular when none occurs),
the top coefficient of the Frobenius polynomial is `coeff d = p^{wd/2}`, i.e. `ε_p = +1` in the
local functional equation. Through 5.5 (i) the coefficient is `(-1)^d ∏λ`, and the involution
`λ ↦ p^w/λ` pairs off the elements other than `±p^{w/2}`. `Λ = {√p, -√p}` is the instance with
odd multiplicities, where `coeff 2 = -p`. For the realization the alternating Poincaré pairing
supplies the even multiplicities, a target of README 5.0. -/
theorem local_sign_eq_one_of_odd_weight (t : ℚ) (p : ℕ) [Fact p.Prime] (hw : Odd D.weight)
    (Λ : Multiset ℂ) (hcard : Multiset.card Λ = D.degree)
    (hΛ : ∀ z ∈ Λ, ‖z‖ = (p : ℝ) ^ ((D.weight : ℝ) / 2))
    (htr : ∀ e : ℕ, 1 ≤ e → (D.frobeniusTrace t p e : ℂ) = (Λ.map fun z => z ^ e).sum)
    (hsd : Λ.map (fun z => (p : ℂ) ^ D.weight / z) = Λ)
    (hfix : ∀ z : ℂ, z ^ 2 = (p : ℂ) ^ D.weight → Even (Λ.count z)) :
    (D.frobeniusPolynomial t p).coeff D.degree = (p : ℚ) ^ (D.weight * D.degree / 2) := sorry

/-- **5.9**, the tame conductor exponent at a tame prime (Roberts–Rodriguez-Villegas (13.1)):
`rank (h_0^{v_p(t)} - 1)` at the cusp `zero` (`v_p(t) > 0`), `rank (h_∞^{-v_p(t)} - 1)` at the cusp
`inf` (`v_p(t) < 0`), and at the cusp `one` the value `1`, or `0` when the type is orthogonal and
`v_p(t - 1)` is even. The zero datum has exponent zero at every cusp. -/
def tameConductorExponent (t : ℚ) (p : ℕ) : ℕ :=
  if D.degree = 0 then 0 else match cuspAt t p with
  | some .zero => (D.hZeroInt ^ (padicValRat p t).toNat - 1).rank
  | some .inf => (D.hInfInt ^ (-padicValRat p t).toNat - 1).rank
  | some .one => if D.type = .orthogonal ∧ Even (padicValRat p (t - 1)) then 0 else 1
  | none => 0

/-- **5.9**, evaluated by the rank formula 3.1 at the cusp `inf`:
`c_p = d - #{distinct roots ζ of Φ_A with ζ^{-v_p(t)} = 1}`. -/
theorem tameConductorExponent_inf (t : ℚ) (p : ℕ) (hp : D.IsTame t p)
    (hc : cuspAt t p = some .inf) :
    D.tameConductorExponent t p =
      D.degree - ((D.PhiA.map (Int.castRingHom ℂ)).roots.toFinset.filter
        fun ζ => ζ ^ (-padicValRat p t).toNat = 1).card := sorry

/-- **5.9**, evaluated by the rank formula 3.1 at the cusp `zero`:
`c_p = d - #{distinct roots ζ of Φ_B with ζ^{v_p(t)} = 1}` (the roots of `Φ_B` are closed under
inversion, so `h_0 = C(Φ_B)⁻¹` and `C(Φ_B)` give the same count). -/
theorem tameConductorExponent_zero (t : ℚ) (p : ℕ) (hp : D.IsTame t p)
    (hc : cuspAt t p = some .zero) :
    D.tameConductorExponent t p =
      D.degree - ((D.PhiB.map (Int.castRingHom ℂ)).roots.toFinset.filter
        fun ζ => ζ ^ (padicValRat p t).toNat = 1).card := sorry

end CyclotomicData

/-! ## Layer 6: point counts -/

section PointCounts

variable {F : Type*} [Field F] [Finite F] [DecidableEq F]

/-- **6.1**, the Legendre curve `y² = x(x - 1)(x - λ)`, with Weierstrass coefficients
`(0, -(1 + λ), 0, λ, 0)`. -/
def legendreFamily (lam : F) : WeierstrassCurve F := ⟨0, -(1 + lam), 0, lam, 0⟩

/-- **6.1**, Ono's count (Beukers–Cohen–Mellit Theorem 1.2): for odd `q` and `λ ≠ 0, 1`,
`|E_λ(𝔽_q)| = q + 1 - (-1)^{(q-1)/2} H_q(1/2, 1/2; 1, 1 | λ)`, the count being Mathlib's point type
(the affine solutions and the point at infinity). -/
theorem legendre_point_count (hq : Odd (Nat.card F)) (ω : MulChar F ℂ)
    (hω : orderOf ω = qm F) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (lam : F) (h0 : lam ≠ 0)
    (h1 : lam ≠ 1) :
    (Nat.card (legendreFamily lam).toAffine.Point : ℂ) =
      Nat.card F + 1 - (-1) ^ ((Nat.card F - 1) / 2) *
        hypergeometricSum ω ψ {((qm F / 2 : ℕ) : ℤ), ((qm F / 2 : ℕ) : ℤ)} {0, 0} lam := sorry

/-- **6.2**, the cubic family `y² + xy + λy = x³`, the image of `y² + xy + y = λx³` under
`(x, y) ↦ (λx, λy)`, so with the same number of points for `λ ≠ 0`. -/
def cubicFamily (lam : F) : WeierstrassCurve F := ⟨1, 0, lam, 0, 0⟩

/-- **6.2**, the datum `A3_B1.1`, `A = [3]`, `B = [1, 1]`. -/
def cubicDatum : CyclotomicData := ⟨{3}, {1, 1}, by decide, by decide, by decide⟩

/-- **6.2**, Beukers–Cohen–Mellit Corollary 1.7 at every `q` coprime to `6`, with `H_q` the value
of the gamma form of 4.7 (no congruence on `q`): for `λ ≠ 0` and `27λ ≠ 1`,
`|E'_λ(𝔽_q)| = q + 1 - H_q(1/3, 2/3; 1, 1 | 27λ)`. -/
theorem cubic_point_count (h6 : Nat.Coprime (Nat.card F) 6) (lam : F) (h0 : lam ≠ 0)
    (h1 : 27 * lam ≠ 1) :
    (Nat.card (cubicFamily lam).toAffine.Point : ℚ) =
      Nat.card F + 1 - cubicDatum.frobeniusSum F (27 * lam) := sorry

/-- **6.2**, the cubic root-count datum `([3], [1,2])`, distinct from the elliptic datum. -/
def cubicRootDatum : CyclotomicData := ⟨{3}, {1, 2}, by decide, by decide, by decide⟩

/-- **6.2**, Beukers–Cohen–Mellit Corollary 1.6: the zeros of `x³ + 3x² - 4t` over
any finite field of cardinality coprime to six are counted by `1 + H_q(1/3,2/3;1,1/2 | t)`. -/
theorem cubic_root_count (h6 : Nat.Coprime (Nat.card F) 6) (t : F)
    (h0 : t ≠ 0) (h1 : t ≠ 1) :
    (Nat.card {x : F // x ^ 3 + 3 * x ^ 2 - 4 * t = 0} : ℚ) =
      1 + cubicRootDatum.frobeniusSum F t := sorry

/-- **6.3**, the projective torus in the chart `y₀ = 1`: every coordinate is a unit,
`∑ xᵢ = ∑ yⱼ` and `t ∏ xᵢ^{pᵢ} = ∏ yⱼ^{qⱼ}`. Balanced exponents make these equations
homogeneous; every projective orbit has exactly one representative in this chart. -/
def weightedTorusPoints {r s : ℕ} (p : Fin (r + 1) → ℕ) (q : Fin (s + 1) → ℕ)
    (t : F) :=
  {xy : (Fin (r + 1) → Fˣ) × (Fin (s + 1) → Fˣ) //
    xy.2 0 = 1 ∧ (∑ i, (xy.1 i : F)) = ∑ j, (xy.2 j : F) ∧
    t * ∏ i, (xy.1 i : F) ^ p i = ∏ j, (xy.2 j : F) ^ q j}

/-- **6.3**, Beukers–Cohen–Mellit Proposition 4.3, pp. 13–14: the weighted projective
open-torus count, including singular parameters, with primitive balanced positive exponents. -/
theorem weighted_torus_point_count {r s : ℕ} (p : Fin (r + 1) → ℕ)
    (q : Fin (s + 1) → ℕ) (hp : ∀ i, 0 < p i) (hq : ∀ j, 0 < q j)
    (hbal : ∑ i, p i = ∑ j, q j)
    (hprim : Nat.gcd (Finset.univ.gcd p) (Finset.univ.gcd q) = 1)
    (ω : MulChar F ℂ) (hω : orderOf ω = qm F) (ψ : AddChar F ℂ)
    (hψ : ψ.IsPrimitive) (t : F) (ht : t ≠ 0) :
    (Nat.card (weightedTorusPoints p q t) : ℂ) =
      (qm F : ℂ) ^ (r + s) / Nat.card F +
        (1 / ((Nat.card F : ℂ) * qm F)) *
          ∑ m ∈ Finset.range (qm F),
            (∏ i, gaussSumPow ω ψ ((p i : ℤ) * m)) *
            (∏ j, gaussSumPow ω ψ (-((q j : ℤ) * m))) *
            ω ((-1) ^ (∑ j, q j) * t) ^ m := sorry

end PointCounts

end

end TauCetiRoadmap.HypergeometricMotives
