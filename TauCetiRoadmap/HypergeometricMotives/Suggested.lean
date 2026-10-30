import Mathlib

/-!
# Hypergeometric motives over `ℚ`: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for the load-bearing milestones, so that
contributors and reviewers converge on the carriers, the pinned conventions and the shape of the
main theorems. Discharging every declaration here would finish neither a layer nor the roadmap.
The file states only what can be stated over Mathlib and the pinned Tau Ceti; every definition
has a real body, and `sorry` appears only as the proof of a theorem. The other targets, among them
the invariant Hermitian form of 3.5 and the signature theorem of 3.6 that reads it, are specified,
with their definitions and Checks, in `README.md` only.

Two carriers are visible in every signature. `HypergeometricParameters` is a pair of disjoint
multisets `α, β` in `AddCircle (1 : ℚ)` of equal cardinality, the generality in which Levelt's
theorem, the Beukers–Heckman form and the finite sums over one field live; `CyclotomicData` is a
pair of disjoint multisets `A, B` of positive integers with equal totient sums, the LMFDB's family
index, and `CyclotomicData.toParameters` is the dictionary (`README.md`, Layer 1). Everything that
needs rationality over `ℚ` (the gamma vector, `M`, the sums at every good prime power, the
Frobenius traces) is stated for cyclotomic data.

The conventions pinned in `README.md` and visible here: `α` comes from `A` and `β` from `B`;
representatives are read in `(0, 1]` through `AddCircle.equivIoc`, so the class of `0` is `1`;
`h_∞ = C(Φ_A)`, `h_0 = C(Φ_B)⁻¹`, `h_1 = h_∞⁻¹ h_0⁻¹` with `C` the companion matrix of
`ClassicalArithmeticCompletion` 2.46, carrying `1` on the subdiagonal and `-coeff` in the last
column, reached through Mathlib's `Algebra.leftMulMatrix` of the root of `AdjoinRoot f`
(`companionMatrix`); the finite sum `hypergeometricSum` is
Beukers–Cohen–Mellit's `H_q` with Mathlib's `gaussSum` and `ω 0 = 0`; the trace of the motive at
the LMFDB's `t` is `q^δ` times the sum at the same `t`, with `δ = (w + 1 - m_A - m_B)/2` the
Hodge-normalisation exponent `hodgeTwist`; the zigzag reads the sorted representatives upward at
`α`, downward at `β`; the Frobenius polynomial is the truncated exponential of the trace series;
the cusp names `inf`, `zero`, `one` are the Levelt matrices `h_∞`, `h_0`, `h_1` whose local
monodromy they carry, so `v_p(t) > 0` is the cusp `zero` (`t → 0`) and `v_p(t) < 0` the cusp `inf`.

The exceptions to "every proof is `sorry`" are bridge checks demanded by the README: the degree
and monicity of `Φ_A` from Mathlib's `natDegree_multiset_prod_of_monic`, `natDegree_cyclotomic`
and `monic_multiset_prod_of_monic` (1.2), and the monicity of `q_∞`, `q_0` that `companionMatrix`
takes (3.2); the swap of a datum, whose fields are inherited (1.1); the fields of the negation
and the shift (1.1) and of the dictionary `toParameters`, whose cardinality is
`Nat.filter_coprime_Ico_eq_totient` and whose disjointness is
`AddCircle.addOrderOf_div_of_gcd_eq_one` (1.3);
and the non-vacuity constructors `legendreDatum`, `dworkDatum`, `tameDatum`, `twistDatum` and
`legendreParameters`, which build four LMFDB families and one parameter pair by `decide` and so
certify that the fields of the two carriers are jointly satisfiable.

No Tau Ceti module is imported: the Tau Ceti objects named in `README.md` are consumed in prose
(the Galois action on Dirichlet Gauss sums as the model for 4.4, `HodgeStructureOn.hodgeNumber`
as the object Fedorov's theorem identifies with 2.2, `EulerProductData` as the downstream carrier
of the L-functions roadmap), and none appears in a signature here. Ono's theorem 6.1 has no
declaration here: its curve is the Legendre equation of `EllipticLegendreCharacterInterfaces` 0.1,
cited in `README.md` only. Three definitions characterise their value through
`Classical.epsilon` by the property the README proves of it: `primitiveData` (the datum with gamma
vector `n ↦ γ(ρ n)`, unique by 1.4), `hypergeometricSumRat` and `frobeniusSum` (the rational number
whose image in `ℂ` is the complex sum). `gamma_primitiveData`, `hypergeometricSumRat_spec` and
`frobeniusSum_spec` are the existence statements. These take their datum explicitly, so that no
section variable is dropped.
-/

namespace TauCetiRoadmap.HypergeometricMotives

open Polynomial Multiset Matrix
open scoped Classical ComplexOrder

noncomputable section

/-! ## Layer 1: hypergeometric data -/

/-- The rational circle `ℚ/ℤ`, Mathlib's `AddCircle (1 : ℚ)`. -/
abbrev QmodZ := AddCircle (1 : ℚ)

instance : Fact ((0 : ℚ) < 1) := ⟨one_pos⟩

/-- **1.1**, the representative in `(0, 1]` of a class in `ℚ/ℤ`, through `AddCircle.equivIoc`.
The class of `0` is represented by `1`, as the LMFDB displays `β = (1, …, 1)`. -/
def rep (x : QmodZ) : ℚ := (AddCircle.equivIoc (1 : ℚ) 0 x : ℚ)

theorem rep_mem_Ioc (x : QmodZ) : rep x ∈ Set.Ioc (0 : ℚ) 1 := by
  simpa [rep] using (AddCircle.equivIoc (1 : ℚ) 0 x).2

theorem coe_rep (x : QmodZ) : ((rep x : ℚ) : QmodZ) = x := sorry

theorem rep_zero : rep 0 = 1 := sorry

theorem rep_injective : Function.Injective rep := sorry

/-- The representative in `[0, 1)`, Beukers–Heckman's normalisation for the signature count 3.6
and Sage's for the zigzag (2.3). -/
def rep0 (x : QmodZ) : ℚ := (AddCircle.equivIco (1 : ℚ) 0 x : ℚ)

/-- The image of a rational number in a field, `num / den`. -/
def ratToField (F : Type*) [Field F] (x : ℚ) : F := (x.num : F) / (x.den : F)

/-- **1.1**, the carrier of Layers 2–4: two disjoint multisets in `ℚ/ℤ` of the same cardinality
`d`. Nothing about the representatives is recorded; the zigzag reads them through `rep`. -/
structure HypergeometricParameters where
  α : Multiset QmodZ
  β : Multiset QmodZ
  card_eq : Multiset.card α = Multiset.card β
  disjoint : ∀ a ∈ α, a ∉ β

/-- **1.1**, non-vacuity: `α = {1/2}`, `β = {0}`, the parameters of the family `A2_B1`. -/
def legendreParameters : HypergeometricParameters :=
  ⟨{((1 / 2 : ℚ) : QmodZ)}, {0}, rfl, by
    intro a ha hb
    rw [Multiset.mem_singleton] at ha hb
    subst ha
    rw [AddCircle.coe_eq_zero_iff] at hb
    obtain ⟨n, hn⟩ := hb
    simp only [zsmul_eq_mul, mul_one] at hn
    have h : (2 * n : ℤ) = 1 := by exact_mod_cast (by linarith : (2 * (n : ℚ)) = 1)
    omega⟩

namespace HypergeometricParameters

variable (P : HypergeometricParameters)

/-- **1.1**, the degree `d`. -/
def degree : ℕ := Multiset.card P.α

/-- **1.1**, the swap `(α, β) ↦ (β, α)`; its fields are inherited, not re-proved. -/
def swap : HypergeometricParameters :=
  ⟨P.β, P.α, P.card_eq.symm, fun _ hb ha => P.disjoint _ ha hb⟩

@[simp] theorem swap_swap : P.swap.swap = P := rfl

@[simp] theorem degree_swap : P.swap.degree = P.degree := P.card_eq.symm

/-- **1.1**, the negation `(α, β) ↦ (-α, -β)`. -/
def neg : HypergeometricParameters :=
  ⟨P.α.map Neg.neg, P.β.map Neg.neg, by simp [P.card_eq], by
    simp only [Multiset.mem_map]
    rintro _ ⟨a, ha, rfl⟩ ⟨b, hb, hba⟩
    exact P.disjoint a ha (by rwa [← neg_injective hba])⟩

/-- **1.1**, the shift `(α, β) ↦ (α + μ, β + μ)`. -/
def shift (μ : QmodZ) : HypergeometricParameters :=
  ⟨P.α.map (· + μ), P.β.map (· + μ), by simp [P.card_eq], by
    simp only [Multiset.mem_map]
    rintro _ ⟨a, ha, rfl⟩ ⟨b, hb, hba⟩
    exact P.disjoint a ha (by rwa [← add_right_cancel hba])⟩

/-- **1.1**, the common denominator `N`: the lcm of the additive orders of the classes in
`α ∪ β` (Mathlib's `addOrderOf_coe_rat` computes each). -/
def denominator : ℕ := (P.α + P.β).toFinset.lcm addOrderOf

theorem denominator_smul_eq_zero : ∀ x ∈ P.α + P.β, P.denominator • x = 0 := sorry

/-- **1.3**, Galois stability: scaling by every unit `u` modulo `N` fixes both multisets. -/
def IsGaloisStable : Prop :=
  ∀ u : ℤ, IsCoprime u (P.denominator : ℤ) → P.α.map (u • ·) = P.α ∧ P.β.map (u • ·) = P.β

/-- **1.8**, the rotation number: the order of the group of translations stabilizing both
multisets, the LMFDB's `imprim` column. -/
def rotationNumber : ℕ :=
  Nat.card {ρ : QmodZ // P.α.map (ρ + ·) = P.α ∧ P.β.map (ρ + ·) = P.β}

/-- **1.8**, for `d > 0`; the empty pair has the whole of `ℚ/ℤ` as stabilizer, so `Nat.card` is `0`. -/
theorem rotationNumber_dvd_denominator (hd : 0 < P.degree) : P.rotationNumber ∣ P.denominator :=
  sorry

/-- **2.1**, the counting function `Z(x) = #{a ∈ α : rep a ≤ x} - #{b ∈ β : rep b ≤ x}`; the
height at which `a ∈ α` is recorded is `Z(rep a) - 1`. -/
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

theorem interlace_swap : P.swap.Interlace ↔ P.Interlace := sorry

theorem interlace_neg : P.neg.Interlace ↔ P.Interlace := sorry

theorem interlace_shift (μ : QmodZ) : (P.shift μ).Interlace ↔ P.Interlace := sorry

end HypergeometricParameters

/-- **1.2**, the LMFDB's family index: disjoint multisets `A`, `B` of positive integers with
equal totient sums. The totient sum is the degree. -/
structure CyclotomicData where
  A : Multiset ℕ
  B : Multiset ℕ
  pos : ∀ n ∈ A + B, 0 < n
  disjoint : ∀ a ∈ A, a ∉ B
  degree_eq : (A.map Nat.totient).sum = (B.map Nat.totient).sum

/-- **1.2**, non-vacuity: the Legendre family `A2.2_B1.1`. -/
def legendreDatum : CyclotomicData := ⟨{2, 2}, {1, 1}, by decide, by decide, by decide⟩

/-- **1.2**, non-vacuity: the family `A2.2.2.2_B1.1.1.1` of the worked example at `t = -1`. -/
def dworkDatum : CyclotomicData :=
  ⟨{2, 2, 2, 2}, {1, 1, 1, 1}, by decide, by decide, by decide⟩

/-- **1.2**, non-vacuity: the family `A4.2.2_B3.1.1` of the tame-prime worked example. -/
def tameDatum : CyclotomicData := ⟨{4, 2, 2}, {3, 1, 1}, by decide, by decide, by decide⟩

/-- **1.2**, non-vacuity: the family `A2.2_B4`, whose Hodge-normalisation exponent is `1`. -/
def twistDatum : CyclotomicData := ⟨{2, 2}, {4}, by decide, by decide, by decide⟩

namespace CyclotomicData

variable (D : CyclotomicData)

/-- **1.2**, the degree `d = ∑_{a ∈ A} φ(a)`. -/
def degree : ℕ := (D.A.map Nat.totient).sum

/-- **1.2**, `Φ_A = ∏_{a ∈ A} Φ_a` over `ℤ`. -/
def PhiA : ℤ[X] := (D.A.map fun a => cyclotomic a ℤ).prod

/-- **1.2**, `Φ_B = ∏_{b ∈ B} Φ_b` over `ℤ`. -/
def PhiB : ℤ[X] := (D.B.map fun b => cyclotomic b ℤ).prod

/-- **1.2**, the defining rational function `Q = Φ_A / Φ_B`. -/
def Q : RatFunc ℚ :=
  algebraMap ℚ[X] (RatFunc ℚ) (D.PhiA.map (Int.castRingHom ℚ)) /
    algebraMap ℚ[X] (RatFunc ℚ) (D.PhiB.map (Int.castRingHom ℚ))

/-- **1.2**, bridge check: `Φ_A` is monic, by Mathlib's `monic_multiset_prod_of_monic`. -/
theorem monic_PhiA : D.PhiA.Monic :=
  monic_multiset_prod_of_monic _ _ fun a _ => cyclotomic.monic a ℤ

theorem monic_PhiB : D.PhiB.Monic :=
  monic_multiset_prod_of_monic _ _ fun b _ => cyclotomic.monic b ℤ

/-- **1.2**, bridge check: `natDegree Φ_A = d`, by Mathlib's `natDegree_multiset_prod_of_monic`
and `natDegree_cyclotomic`. -/
theorem natDegree_PhiA : D.PhiA.natDegree = D.degree := by
  unfold PhiA degree
  rw [natDegree_multiset_prod_of_monic _ fun f hf => by
    obtain ⟨a, -, rfl⟩ := Multiset.mem_map.1 hf
    exact cyclotomic.monic a ℤ]
  simp [Multiset.map_map, natDegree_cyclotomic]

theorem natDegree_PhiB : D.PhiB.natDegree = D.degree := sorry

/-- **1.2**, coprimality of `Φ_A` and `Φ_B` over `ℚ`, from `disjoint` and
`cyclotomic.isCoprime_rat`. -/
theorem isCoprime_PhiA_PhiB :
    IsCoprime (D.PhiA.map (Int.castRingHom ℚ)) (D.PhiB.map (Int.castRingHom ℚ)) := sorry

/-- **1.2**, the multiplicity `m_A` of `1` in `A`. -/
def multOne_A : ℕ := D.A.count 1

/-- **1.2**, the multiplicity `m_B` of `1` in `B`. -/
def multOne_B : ℕ := D.B.count 1

theorem multOne_A_mul_multOne_B : D.multOne_A * D.multOne_B = 0 := sorry

/-- **1.2**, `Φ_A(0) = (-1)^{m_A}`. -/
theorem coeff_zero_PhiA : D.PhiA.coeff 0 = (-1) ^ D.multOne_A := sorry

/-- **1.5**, reciprocity: `X^d Φ_A(1/X) = (-1)^{m_A} Φ_A(X)`, i.e. `reverse Φ_A = (-1)^{m_A} Φ_A`. -/
theorem reverse_PhiA : D.PhiA.reverse = (-1) ^ D.multOne_A * D.PhiA := sorry

/-- **1.3**, the classes `k/a`, `1 ≤ k ≤ a`, `gcd(k, a) = 1`, of a multiset of positive integers:
the arguments of the roots of `∏ Φ_a`. -/
def primitiveClasses (A : Multiset ℕ) : Multiset QmodZ :=
  A.bind fun a =>
    ((Finset.Icc 1 a).filter fun k => Nat.Coprime k a).val.map fun k : ℕ =>
      (((k : ℚ) / a : ℚ) : QmodZ)

/-- **1.3**, the count of `k ∈ [1, a]` coprime to `a` is `φ(a)`, by Mathlib's
`Nat.filter_coprime_Ico_eq_totient`. -/
theorem card_primitiveClasses (A : Multiset ℕ) :
    Multiset.card (primitiveClasses A) = (A.map Nat.totient).sum := by
  rw [primitiveClasses, Multiset.card_bind]
  congr 1
  refine Multiset.map_congr rfl fun a _ => ?_
  have h : Finset.Icc 1 a = Finset.Ico 1 (1 + a) := by
    ext k; simp only [Finset.mem_Icc, Finset.mem_Ico]; omega
  rw [Function.comp_apply, Multiset.card_map, Finset.card_val, h,
    ← Nat.filter_coprime_Ico_eq_totient a 1]
  simp only [Nat.coprime_comm]

/-- **1.3**, a class `k/a` in lowest terms has additive order `a`
(Mathlib's `AddCircle.addOrderOf_div_of_gcd_eq_one`), so it determines `a`. -/
theorem addOrderOf_mem_of_mem_primitiveClasses {A : Multiset ℕ} {x : QmodZ}
    (hx : x ∈ primitiveClasses A) : addOrderOf x ∈ A := by
  obtain ⟨a, ha, hx⟩ := Multiset.mem_bind.1 hx
  obtain ⟨k, hk, rfl⟩ := Multiset.mem_map.1 hx
  rw [Finset.mem_val, Finset.mem_filter, Finset.mem_Icc] at hk
  have h := AddCircle.addOrderOf_div_of_gcd_eq_one (p := (1 : ℚ)) (m := k) (n := a)
    (by omega) hk.2
  rw [mul_one] at h
  rwa [h]

/-- **1.3**, the dictionary: `α` from `A` and `β` from `B`, the LMFDB's reading. -/
def toParameters : HypergeometricParameters :=
  ⟨primitiveClasses D.A, primitiveClasses D.B,
    by rw [card_primitiveClasses, card_primitiveClasses, D.degree_eq],
    fun _ hA hB => D.disjoint _ (addOrderOf_mem_of_mem_primitiveClasses hA)
      (addOrderOf_mem_of_mem_primitiveClasses hB)⟩

@[simp] theorem degree_toParameters : D.toParameters.degree = D.degree :=
  card_primitiveClasses D.A

/-- **1.3**, `Φ_A` splits over `ℂ` as `∏_{x ∈ α} (X - e(x))` with `e(x) = exp(2πi · rep x)`. -/
theorem PhiA_map_eq_prod :
    D.PhiA.map (Int.castRingHom ℂ) =
      (D.toParameters.α.map fun x => X - C (Complex.exp (2 * Real.pi * Complex.I * rep x))).prod :=
  sorry

/-- **1.3**, the dictionary lands in the Galois-stable pairs. -/
theorem isGaloisStable_toParameters : D.toParameters.IsGaloisStable := sorry

/-- **1.3**, conversely every Galois-stable pair comes from a unique cyclotomic datum. -/
theorem exists_unique_of_isGaloisStable (P : HypergeometricParameters) (hP : P.IsGaloisStable) :
    ∃! D : CyclotomicData, D.toParameters = P := sorry

theorem toParameters_injective : Function.Injective toParameters := sorry

/-- **1.3**, the common denominator of `toParameters D` is `lcm (A ∪ B)`. -/
theorem denominator_toParameters : D.toParameters.denominator = (D.A + D.B).toFinset.lcm id :=
  sorry

/-- **1.1**, the swap `(A, B) ↦ (B, A)`; fields inherited. -/
def swap : CyclotomicData :=
  ⟨D.B, D.A, fun n hn => D.pos n (by rwa [add_comm]), fun b hb ha => D.disjoint _ ha hb,
    D.degree_eq.symm⟩

@[simp] theorem swap_swap : D.swap.swap = D := rfl

@[simp] theorem degree_swap : D.swap.degree = D.degree := D.degree_eq.symm

theorem toParameters_swap : D.swap.toParameters = D.toParameters.swap := rfl

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

theorem gamma_eq_zero_of_notMem (n : ℕ) (hn : n ∉ D.gammaSupport) : D.gamma n = 0 := sorry

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

/-- **1.4**, the degree identity `∑_{γ(n) > 0} n γ(n) = ∑_{γ(n) < 0} n (-γ(n))`, i.e. the multiset
sums to `0`. -/
theorem gammaMultiset_sum : D.gammaMultiset.sum = 0 := sorry

theorem zero_notMem_gammaMultiset : (0 : ℤ) ∉ D.gammaMultiset := sorry

/-- **1.4**, `r`, the number of positive entries of the gamma multiset
(Beukers–Cohen–Mellit's `r`). -/
def r : ℕ := (D.gammaMultiset.filter fun n => 0 < n).card

/-- **1.4**, `s`, the number of negative entries. -/
def s : ℕ := (D.gammaMultiset.filter fun n => n < 0).card

/-- **1.4**, `M = ∏_n n^{n γ(n)}`, a positive rational. -/
def M : ℚ := ∏ n ∈ D.gammaSupport, (n : ℚ) ^ ((n : ℤ) * D.gamma n)

theorem M_pos : 0 < D.M := sorry

theorem gamma_swap (n : ℕ) : D.swap.gamma n = -D.gamma n := sorry

theorem M_swap : D.swap.M = D.M⁻¹ := sorry

theorem gammaMultiset_swap : D.swap.gammaMultiset = D.gammaMultiset.map Neg.neg := sorry

/-- **1.4**, the Pochhammer identity of Beukers–Cohen–Mellit §1:
`∏_i (α_i)_n / ∏_j (β_j)_n = M^{-n} ∏_{γ(m) > 0} (m n)!^{γ(m)} / ∏_{γ(m) < 0} (m n)!^{-γ(m)}`,
evaluated on the representatives in `(0, 1]`. -/
theorem pochhammer_identity (n : ℕ) :
    (D.toParameters.α.map fun a => (ascPochhammer ℚ n).eval (rep a)).prod /
        (D.toParameters.β.map fun b => (ascPochhammer ℚ n).eval (rep b)).prod =
      D.M ^ (-(n : ℤ)) *
        ∏ m ∈ D.gammaSupport, ((Nat.factorial (m * n) : ℚ)) ^ D.gamma m := sorry

/-- **1.4**, acceptance: the gamma multiset of `A2.2.2.2_B1.1.1.1` is `[-1^8, 2^4]` and
`M = 256`. -/
theorem gammaMultiset_dworkDatum :
    dworkDatum.gammaMultiset = Multiset.replicate 8 (-1) + Multiset.replicate 4 2 ∧
      dworkDatum.M = 256 := sorry

/-! ### 1.6–1.8: wild primes and the rotation number -/

/-- **1.6**, the wild primes: primes dividing some element of `A ∪ B`. -/
def wildPrimes : Finset ℕ := (D.A + D.B).toFinset.biUnion Nat.primeFactors

/-- **1.6**, `p` is wild. -/
def IsWild (p : ℕ) : Prop := p ∈ D.wildPrimes

theorem isWild_iff_dvd_denominator (p : ℕ) (hp : p.Prime) :
    D.IsWild p ↔ p ∣ D.toParameters.denominator := sorry

theorem isWild_iff_exists_gamma (p : ℕ) (hp : p.Prime) :
    D.IsWild p ↔ ∃ n, D.gamma n ≠ 0 ∧ p ∣ n := sorry

/-- **1.8**, the rotation number of a cyclotomic datum is the gcd of its gamma multiset. -/
theorem rotationNumber_eq_gcd :
    (D.toParameters.rotationNumber : ℤ) = D.gammaMultiset.gcd := sorry

/-- **1.9**, `D` is primitive when its rotation number is `1`. -/
def IsPrimitive : Prop := D.toParameters.rotationNumber = 1

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

theorem isGood_iff (t : ℚ) (p : ℕ) :
    D.IsGood t p ↔ p.Prime ∧ ¬D.IsWild p ∧ cuspAt t p = none := sorry

/-- **1.12**, the cusps of `t` and `1/t` are exchanged between `inf` and `zero` and fixed at
`one`; good and tame primes of `(D, t)` and `(swap D, 1/t)` agree. -/
theorem isGood_swap_inv (t : ℚ) (p : ℕ) : D.swap.IsGood t⁻¹ p ↔ D.IsGood t p := sorry

end CyclotomicData

namespace CyclotomicData

instance : Nonempty CyclotomicData := ⟨legendreDatum⟩

/-- **1.9**, the primitive datum: the cyclotomic datum with gamma function `n ↦ γ(ρ n)`, `ρ` the
rotation number. A datum is determined by its gamma vector (1.4's `gamma_unique` with the
coprimality 1.2), and its existence is `gamma_primitiveData`. -/
def primitiveData (D : CyclotomicData) : CyclotomicData :=
  Classical.epsilon fun D' : CyclotomicData =>
    ∀ n, D'.gamma n = D.gamma (D.toParameters.rotationNumber * n)

theorem gamma_primitiveData (D : CyclotomicData) (n : ℕ) :
    D.primitiveData.gamma n = D.gamma (D.toParameters.rotationNumber * n) := sorry

theorem rotationNumber_primitiveData (D : CyclotomicData) :
    D.primitiveData.toParameters.rotationNumber = 1 := sorry

theorem degree_primitiveData (D : CyclotomicData) :
    D.primitiveData.degree * D.toParameters.rotationNumber = D.degree := sorry

end CyclotomicData

/-! ## Layer 2: the zigzag, weight and Hodge vector -/

namespace HypergeometricParameters

variable (P : HypergeometricParameters)

theorem Z_one : P.Z 1 = 0 := sorry

/-- **2.2**, the multiset of heights at which the `α`'s are recorded. -/
def recordedHeights : Multiset ℤ := P.α.map fun a => P.Z (rep a) - 1

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

/-- **2.2**, the recorded heights fill the interval `[m, m + w]`. -/
theorem hodgeNumber_pos (hd : 0 < P.degree) {p : ℕ} (hp : p ≤ P.weight) : 0 < P.hodgeNumber p :=
  sorry

/-- **2.2**, `∑_{p ≤ w} h^{p, w-p} = d`. -/
theorem sum_hodgeNumber : ∑ p ∈ Finset.range (P.weight + 1), P.hodgeNumber p = P.degree := sorry

/-- **2.2**, shift invariance of the Hodge vector. -/
theorem hodgeVector_shift (μ : QmodZ) : (P.shift μ).hodgeVector = P.hodgeVector := sorry

/-- **2.3**, the sorted-height form of the weight: `max Z - min Z - 1` over the representatives
and the value `0`. -/
theorem weight_eq_sSup_sub_sInf :
    (P.weight : ℤ) =
      sSup (insert 0 ((P.α + P.β).map fun x => P.Z (rep x)).toFinset : Set ℤ) -
        sInf (insert 0 ((P.α + P.β).map fun x => P.Z (rep x)).toFinset : Set ℤ) - 1 := sorry

/-- **2.4**, symmetry `h^{p,w-p} = h^{w-p,p}` for a pair stable under negation (every cyclotomic
datum, 1.5); the combinatorial shadow of Hodge symmetry. -/
theorem hodgeNumber_symm (hneg : P.neg = P) (p : ℕ) (hp : p ≤ P.weight) :
    P.hodgeNumber p = P.hodgeNumber (P.weight - p) := sorry

/-- **2.7**, swap invariance of the weight; the swap reverses the Hodge vector (each up-step from
height `h` is matched by a down-step from `h + 1`, so the new recorded heights are `-(h + 1)`). For
`α = {1/10, 1/5, 1/2}`, `β = {3/10, 3/5, 7/10}` the Hodge vectors are `(1, 2)` and `(2, 1)`. -/
theorem weight_swap : P.swap.weight = P.weight := sorry

theorem hodgeVector_swap : P.swap.hodgeVector = P.hodgeVector.reverse := sorry

/-- **2.8**, weight `0` is interlacing. -/
theorem weight_eq_zero_iff_interlace (hd : 0 < P.degree) : P.weight = 0 ↔ P.Interlace := sorry

/-- **2.9**, the Hodge polygon: the vertices `(∑_{p<k} h^{p,w-p}, ∑_{p<k} p h^{p,w-p})`,
`k = 0, …, w + 1`. -/
def hodgePolygon : List (ℕ × ℕ) :=
  (List.range (P.weight + 2)).map fun k =>
    (∑ p ∈ Finset.range k, P.hodgeNumber p, ∑ p ∈ Finset.range k, p * P.hodgeNumber p)

/-- **2.9**, the Hodge polygon as a function on `[0, d]`: the sum of the `k` smallest slopes,
where the slope `p` occurs `h^{p,w-p}` times. -/
def hodgePolygonFn (k : ℕ) : ℕ :=
  (((List.range (P.weight + 1)).flatMap fun p => List.replicate (P.hodgeNumber p) p).take k).sum

/-- **2.9**, the Hodge polygon ends at `(d, wd/2)`. -/
theorem hodgePolygon_getLast (hd : 0 < P.degree) (hneg : P.neg = P) :
    P.hodgePolygon.getLast? = some (P.degree, P.weight * P.degree / 2) := sorry

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

theorem hodgeTwist_swap : D.swap.hodgeTwist = D.hodgeTwist := sorry

/-- **2.6**, the second parity law: odd weight forces even degree. -/
theorem even_degree_of_odd_weight (hw : Odd D.weight) : Even D.degree := sorry

/-- **2.6**, the type: orthogonal for even weight, symplectic for odd. -/
inductive MotiveType
  | orthogonal
  | symplectic
  deriving DecidableEq

/-- **2.6**, the type of a cyclotomic datum (the LMFDB knowl `hgm.type`). -/
def type : MotiveType := if Even D.weight then .orthogonal else .symplectic

theorem type_swap : D.swap.type = D.type := sorry

/-- **2.6**, the LMFDB's rule "symplectic iff `w` odd and `d` even" agrees with `type`. -/
theorem type_eq_symplectic_iff : D.type = .symplectic ↔ Odd D.weight ∧ Even D.degree := sorry

/-- **2.7**, swap invariance for cyclotomic data: the reversal of the general statement, undone by
the symmetry 2.4. -/
theorem hodgeVector_swap : D.swap.hodgeVector = D.hodgeVector := sorry

/-- **2.2**, acceptance: `A2.2.2.2_B1.1.1.1` has Hodge vector `(1,1,1,1)` and weight `3`;
`A4.2.2_B3.1.1` has Hodge vector `(2,2)` and weight `1`. -/
theorem hodgeVector_dworkDatum :
    dworkDatum.hodgeVector = [1, 1, 1, 1] ∧ dworkDatum.weight = 3 ∧
      tameDatum.hodgeVector = [2, 2] ∧ tameDatum.weight = 1 := sorry

/-- **2.9**, the special Hodge vector at `t = 1`: the middle number drops by `1` for even `w`,
the two middle numbers for odd `w` (LMFDB knowl `hgm.hodge_vector`). -/
def specialHodgeVector : List ℕ :=
  let h := D.hodgeVector
  let m := D.weight / 2
  if Even D.weight then h.set m (h.getD m 0 - 1)
  else (h.set m (h.getD m 0 - 1)).set (m + 1) (h.getD (m + 1) 0 - 1)

theorem sum_specialHodgeVector (hd : 2 ≤ D.degree) :
    D.specialHodgeVector.sum = if Even D.weight then D.degree - 1 else D.degree - 2 := sorry

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

/-- **3.1**, the first basis vector is cyclic for `C(f)`. -/
theorem companion_isCyclic {d : ℕ} {f : R[X]} (hf : f.Monic) (hd : f.natDegree = d)
    (hpos : 0 < d) :
    Submodule.span R (Set.range fun k : ℕ =>
      ((companionMatrix hf hd) ^ k).mulVec (Pi.single ⟨0, hpos⟩ 1)) = ⊤ := sorry

/-- **3.1**, a matrix with characteristic polynomial `f` and a cyclic vector is conjugate to the
companion matrix of `f`, over a field. -/
theorem companion_conj {K : Type*} [Field K] {d : ℕ} (hd : 0 < d) {f : K[X]} (hf : f.Monic)
    (hdeg : f.natDegree = d) (g : Matrix (Fin d) (Fin d) K) (hg : g.charpoly = f)
    (hcyc : Submodule.span K (Set.range fun k : ℕ => (g ^ k).mulVec (Pi.single ⟨0, hd⟩ 1)) = ⊤) :
    ∃ c : Matrix (Fin d) (Fin d) K, IsUnit c ∧ g = c * companionMatrix hf hdeg * c⁻¹ := sorry

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
to `(C(p), C(p)⁻¹ C(q), C(q)⁻¹)` (Beukers–Heckman Theorem 3.5; Qian Lemma 3.4). -/
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

/-- **3.4 (iv)**, the companion normal form: for `p ≠ q` with `p(0) ≠ 0`, `C(q) C(p)⁻¹` fixes
`e_2, …, e_d` and differs from `1` by a matrix of rank one. -/
theorem companion_mul_inv_normalForm (hne : p ≠ q) (h0 : p.coeff 0 ≠ 0) :
    (∀ i : Fin d, 0 < (i : ℕ) →
      (companionMatrix hq hqd * (companionMatrix hp hpd)⁻¹).mulVec (Pi.single i 1) =
        Pi.single i 1) ∧
    (companionMatrix hq hqd * (companionMatrix hp hpd)⁻¹ - 1).rank = 1 := sorry

end Levelt

namespace HypergeometricParameters

variable (P : HypergeometricParameters)

/-- `e(x) = exp(2πi · rep x)`, the root of unity of a class. -/
def e (x : QmodZ) : ℂ := Complex.exp (2 * Real.pi * Complex.I * rep x)

/-- **3.2**, `q_∞ = ∏_{a ∈ α} (X - e(a))`. -/
def qInf : ℂ[X] := (P.α.map fun a => X - C (e a)).prod

/-- **3.2**, `q_0 = ∏_{b ∈ β} (X - e(b))`. -/
def qZero : ℂ[X] := (P.β.map fun b => X - C (e b)).prod

theorem monic_qInf : P.qInf.Monic :=
  monic_multiset_prod_of_monic _ _ fun _ _ => monic_X_sub_C _

theorem monic_qZero : P.qZero.Monic :=
  monic_multiset_prod_of_monic _ _ fun _ _ => monic_X_sub_C _

theorem natDegree_qInf : P.qInf.natDegree = P.degree := sorry

theorem natDegree_qZero : P.qZero.natDegree = P.degree := sorry

/-- **3.2**, `h_∞ = C(q_∞)`. -/
def hInf : Matrix (Fin P.degree) (Fin P.degree) ℂ := companionMatrix P.monic_qInf P.natDegree_qInf

/-- **3.2**, `h_0 = C(q_0)⁻¹`. -/
def hZero : Matrix (Fin P.degree) (Fin P.degree) ℂ :=
  (companionMatrix P.monic_qZero P.natDegree_qZero)⁻¹

/-- **3.2**, `h_1 = h_∞⁻¹ h_0⁻¹`, so that `h_∞ h_1 h_0 = 1`. -/
def hOne : Matrix (Fin P.degree) (Fin P.degree) ℂ := P.hInf⁻¹ * P.hZero⁻¹

theorem hInf_mul_hOne_mul_hZero : P.hInf * P.hOne * P.hZero = 1 := sorry

/-- **3.2**, `h_1 - 1` has rank one (`h_1` is a pseudo-reflection). -/
theorem rank_hOne_sub_one (hd : 0 < P.degree) : (P.hOne - 1).rank = 1 := sorry

theorem charpoly_hInf : P.hInf.charpoly = P.qInf := sorry

/-- **3.2**, the eigenvalues of `h_0` are `e(-β)`. -/
theorem charpoly_hZero : P.hZero.charpoly = (P.β.map fun b => X - C (e (-b))).prod := sorry

theorem det_hOne : P.hOne.det = e (P.β.sum - P.α.sum) := sorry

/-- **3.2**, the hypergeometric group `Γ(α, β) = ⟨h_∞, h_0⟩ ≤ GL_d(ℂ)`. -/
def hypergeometricGroup : Subgroup (GL (Fin P.degree) ℂ) :=
  Subgroup.closure
    {g | (g : Matrix (Fin P.degree) (Fin P.degree) ℂ) = P.hInf ∨
      (g : Matrix (Fin P.degree) (Fin P.degree) ℂ) = P.hZero}

/-- **3.4 (i)**, Levelt's theorem, rigidity, at `K = ℂ`, `p = q_∞`, `q = q_0`
(`levelt_rigidity_field`): a triple `g_∞ g_1 g_0 = 1` with the characteristic polynomials of
`(h_∞, h_0)` and `g_1` a pseudo-reflection is simultaneously conjugate to `(h_∞, h_1, h_0)`. -/
theorem levelt_rigidity (gInf gOne gZero : Matrix (Fin P.degree) (Fin P.degree) ℂ)
    (hrel : gInf * gOne * gZero = 1) (hInf' : gInf.charpoly = P.qInf)
    (hZero' : gZero⁻¹.charpoly = P.qZero) (hunit : IsUnit gZero) (hOne' : (gOne - 1).rank ≤ 1) :
    ∃ c : Matrix (Fin P.degree) (Fin P.degree) ℂ, IsUnit c ∧
      gInf = c * P.hInf * c⁻¹ ∧ gOne = c * P.hOne * c⁻¹ ∧ gZero = c * P.hZero * c⁻¹ := sorry

/-- **3.4 (ii)**, Levelt's theorem, irreducibility, at `K = ℂ` (`levelt_irreducible_field`):
`Γ(α, β)` acts irreducibly on `ℂ^d`. -/
theorem levelt_irreducible (hd : 0 < P.degree) (V : Submodule ℂ (Fin P.degree → ℂ))
    (hV : ∀ g ∈ P.hypergeometricGroup,
      V.map (Matrix.toLin' (g : Matrix (Fin P.degree) (Fin P.degree) ℂ)) ≤ V) :
    V = ⊥ ∨ V = ⊤ := sorry

/-- **3.6**, the Beukers–Heckman signature defect `|∑_j (-1)^{j + m_j}|`, with `α_1 ≤ ⋯ ≤ α_d`
the representatives of `α` in `[0, 1)`, listed with repetition, and `m_j = #{k : β_k < α_j}`. The
index `j` is the position in the sorted list, so equal `α`'s get consecutive indices: for
`α = (1/2, 1/2, 1/2, 1/2)`, `β = (0, 0, 0, 0)` the sum is `0` (signature `(2, 2)`), where counting
`#{α' < α_j}` instead would give `4` and a definite form. ⚠ This is the unsigned invariant of the
monodromy-invariant form; it is not the LMFDB's signed `sig`, which is not owned here
(`README.md`, *Not owned here*). -/
def bhSignatureDefect : ℕ :=
  (((P.α.map rep0).sort).mapIdx fun j a =>
    (-1 : ℤ) ^ (j + 1 + (P.β.filter fun b => rep0 b < a).card)).sum.natAbs

theorem bhSignatureDefect_shift (μ : QmodZ) :
    (P.shift μ).bhSignatureDefect = P.bhSignatureDefect := sorry

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
def hInfInt : Matrix (Fin D.degree) (Fin D.degree) ℤ := companionMatrix D.monic_PhiA D.natDegree_PhiA

/-- **3.2**, the integral Levelt matrix `h_0 = C(Φ_B)⁻¹ ∈ GL_d(ℤ)`; `Φ_B(0) = ±1` makes the
inverse integral. -/
def hZeroInt : Matrix (Fin D.degree) (Fin D.degree) ℤ :=
  (companionMatrix D.monic_PhiB D.natDegree_PhiB)⁻¹

theorem isUnit_hZeroInt : IsUnit D.hZeroInt := sorry

/-- **3.2**, the integral hypergeometric group `⟨h_∞, h_0⟩ ≤ GL_d(ℤ)`. -/
def hypergeometricGroupInt : Subgroup (GL (Fin D.degree) ℤ) :=
  Subgroup.closure
    {g | (g : Matrix (Fin D.degree) (Fin D.degree) ℤ) = D.hInfInt ∨
      (g : Matrix (Fin D.degree) (Fin D.degree) ℤ) = D.hZeroInt}

/-- **3.2**, the complex `h_∞` is the base change of the integral one. -/
theorem hInf_toParameters :
    D.toParameters.hInf =
      (D.hInfInt.map (Int.castRingHom ℂ)).reindex (finCongr D.degree_toParameters.symm)
        (finCongr D.degree_toParameters.symm) := sorry

/-- **3.3**, `det h_∞ = (-1)^{d + m_A}`. -/
theorem det_hInfInt : D.hInfInt.det = (-1) ^ (D.degree + D.multOne_A) := sorry

/-- **3.3**, `det h_0 = (-1)^{d + m_B}`. -/
theorem det_hZeroInt : D.hZeroInt.det = (-1) ^ (D.degree + D.multOne_B) := sorry

/-- **3.3** with **2.5**: `h_1` is a reflection exactly in the orthogonal case. -/
theorem det_hOne_eq_neg_one_iff (hd : 0 < D.degree) :
    D.toParameters.hOne.det = -1 ↔ D.type = .orthogonal := sorry

/-- **3.7** with **2.8**: the monodromy of a cyclotomic datum is finite iff its weight is `0`. -/
theorem finite_hypergeometricGroup_iff_weight_eq_zero (hd : 0 < D.degree) :
    Finite D.toParameters.hypergeometricGroup ↔ D.weight = 0 := sorry

/-- **3.10**, the reduction of the integral monodromy group modulo `ℓ`. -/
def monodromyModL (ℓ : ℕ) [Fact ℓ.Prime] : Subgroup (GL (Fin D.degree) (ZMod ℓ)) :=
  Subgroup.closure
    {g | (g : Matrix (Fin D.degree) (Fin D.degree) (ZMod ℓ)) = D.hInfInt.map (Int.castRingHom _) ∨
      (g : Matrix (Fin D.degree) (Fin D.degree) (ZMod ℓ)) = D.hZeroInt.map (Int.castRingHom _)}

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

theorem bezout_transpose (f g : R[X]) (d : ℕ) : (bezout f g d)ᵀ = bezout f g d := sorry

theorem bezout_swap (f g : R[X]) (d : ℕ) : bezout g f d = -bezout f g d := sorry

theorem bezout_add_left (f₁ f₂ g : R[X]) (d : ℕ) :
    bezout (f₁ + f₂) g d = bezout f₁ g d + bezout f₂ g d := sorry

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

theorem bezoutDeterminant_ne_zero : D.bezoutDeterminant ≠ 0 := sorry

/-- **3.8**, the Bézout module `ℤ^d / B ℤ^d` (LMFDB knowl `hgm.bezout_module`). -/
def BezoutModule : Type := (Fin D.degree → ℤ) ⧸ LinearMap.range (Matrix.toLin' D.bezoutMatrix)

instance : AddCommGroup D.BezoutModule :=
  inferInstanceAs
    (AddCommGroup ((Fin D.degree → ℤ) ⧸ LinearMap.range (Matrix.toLin' D.bezoutMatrix)))

/-- **3.8**, the Bézout module is finite (its order is `card_bezoutModule`). -/
theorem finite_bezoutModule : Finite D.BezoutModule := sorry

theorem card_bezoutModule : Nat.card D.BezoutModule = D.bezoutDeterminant.natAbs := sorry

/-- **3.10**, if the integral group preserves the Bézout form, its reduction modulo `ℓ`
preserves the reduced form. -/
theorem monodromyModL_preserves_bezout (ℓ : ℕ) [Fact ℓ.Prime]
    (hint : ∀ g ∈ D.hypergeometricGroupInt,
      (g : Matrix (Fin D.degree) (Fin D.degree) ℤ)ᵀ * D.bezoutMatrix *
        (g : Matrix (Fin D.degree) (Fin D.degree) ℤ) = D.bezoutMatrix)
    (g : GL (Fin D.degree) (ZMod ℓ)) (hg : g ∈ D.monodromyModL ℓ) :
    (g : Matrix (Fin D.degree) (Fin D.degree) (ZMod ℓ))ᵀ * D.bezoutMatrix.map (Int.castRingHom _) *
      (g : Matrix (Fin D.degree) (Fin D.degree) (ZMod ℓ)) =
      D.bezoutMatrix.map (Int.castRingHom _) := sorry

end CyclotomicData

/-! ## Layer 4: finite hypergeometric sums

Everything is over a finite field `F` with `q` elements, `𝔮 = q - 1`, with a multiplicative
character `ω : MulChar F ℂ` and an additive character `ψ : AddChar F ℂ`. The parameters enter as
integers modulo `𝔮` (4.1); the sums are stated for integer multisets `a, b` of equal cardinality,
and `ω ^ m` is Mathlib's `zpow` on the group `MulChar F ℂ`. -/

section FiniteSums

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]

/-- `𝔮 = q - 1`. -/
abbrev qm (F : Type*) [Fintype F] : ℕ := Fintype.card F - 1

/-- **4.3**, `g(m) = gaussSum (ω ^ m) ψ` for `m : ℤ`. With Mathlib's `ω 0 = 0`, `g(0) = -1` for
nontrivial `ψ`. -/
def gaussSumPow (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (m : ℤ) : ℂ := gaussSum (ω ^ m) ψ

theorem gaussSumPow_zero (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (hψ : ψ ≠ 1) :
    gaussSumPow ω ψ 0 = -1 := sorry

/-- **4.3**, `g(m) g(-m) = ω^m(-1) q` for `ω^m ≠ 1` (from Mathlib's
`gaussSum_mul_gaussSum_eq_card`, whose second factor carries `ψ⁻¹ = ψ(-·)`), and
`g(0) g(0) = 1`: the normalising factor of `H_q` is a unit. -/
theorem gaussSumPow_mul_gaussSumPow_neg (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (m : ℤ) (hm : ω ^ m ≠ 1) :
    gaussSumPow ω ψ m * gaussSumPow ω ψ (-m) = (ω ^ m) (-1) * (Fintype.card F : ℂ) := sorry

theorem gaussSumPow_ne_zero (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (m : ℤ) :
    gaussSumPow ω ψ m ≠ 0 := sorry

/-- **4.1**, the integer parameter `𝔮 · rep x` of an admissible class (`𝔮 • x = 0`); the floor
makes it total. -/
def intParam (𝔮 : ℕ) (x : QmodZ) : ℤ := ⌊(𝔮 : ℚ) * rep x⌋

/-- **4.1**, `(α, β)` is admissible for `q`: `(q - 1) • x = 0` for every class. For a cyclotomic
datum this is `N ∣ q - 1`. -/
def HypergeometricParameters.IsAdmissible (q : ℕ) (P : HypergeometricParameters) : Prop :=
  ∀ x ∈ P.α + P.β, (q - 1) • x = 0

theorem HypergeometricParameters.coe_intParam (q : ℕ) (P : HypergeometricParameters)
    (hP : P.IsAdmissible q) (x : QmodZ) (hx : x ∈ P.α + P.β) :
    ((intParam (q - 1) x : ℚ) : QmodZ) = ((q - 1 : ℕ) : ℤ) • x := sorry

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

/-- **4.3**, Definition 1.1 verbatim:
`H_q = (1/(1-q)) ∑_m ∏_i g(m + a_i) g(-m - b_i) / (g(a_i) g(-b_i)) · ω((-1)^d t)^m`. -/
theorem hypergeometricSum_eq (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (a b : Multiset ℤ) (hab : Multiset.card a = Multiset.card b) (t : F) :
    hypergeometricSum ω ψ a b t =
      (1 - (Fintype.card F : ℂ))⁻¹ * ∑ m ∈ Finset.range (qm F),
        ((a.map fun aᵢ => gaussSumPow ω ψ (m + aᵢ) / gaussSumPow ω ψ aᵢ).prod *
          (b.map fun bᵢ => gaussSumPow ω ψ (-m - bᵢ) / gaussSumPow ω ψ (-bᵢ)).prod) *
          ω ((-1) ^ Multiset.card a * t) ^ m := sorry

/-- **4.2**, Katz's exponential sum over the torus `t ∏ x_i = ∏ y_j`:
`∑ ψ(∑ x_i - ∑ y_j) ∏ ω^{a_i}(x_i) ∏ ω^{-b_j}(y_j)`, the parameters listed. -/
def katzExpSum (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (a b : List ℤ) (t : F) : ℂ :=
  ∑ x : Fin a.length → F, ∑ y : Fin b.length → F,
    if t * ∏ i, x i = ∏ j, y j then
      ψ (∑ i, x i - ∑ j, y j) * ∏ i, (ω ^ a.get i) (x i) * ∏ j, (ω ^ (-b.get j)) (y j)
    else 0

/-- **4.3**, Beukers–Cohen–Mellit Proposition 3.1: `Hyp_q = ω(-1)^{∑ b} S_q(a, b | t)`. -/
theorem katzExpSum_eq (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (a b : List ℤ)
    (hab : a.length = b.length) (t : F) (ht : t ≠ 0) :
    katzExpSum ω ψ a b t = ω (-1) ^ b.sum * katzSum ω ψ (↑a) (↑b) t := sorry

/-- **4.4 (i)**, `H_q` does not depend on `ψ`: Mathlib's `gaussSum_mulShift_eq`. -/
theorem hypergeometricSum_mulShift (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (c : Fˣ)
    (a b : Multiset ℤ) (hab : Multiset.card a = Multiset.card b) (t : F) :
    hypergeometricSum ω (ψ.mulShift c) a b t = hypergeometricSum ω ψ a b t := sorry

/-- **4.4 (ii)**, replacing `ω` by `ω^u`, `u` a unit modulo `𝔮`, scales the parameters. -/
theorem hypergeometricSum_pow (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (u : ℤ)
    (hu : IsCoprime u (qm F : ℤ)) (a b : Multiset ℤ) (t : F) :
    hypergeometricSum (ω ^ u) ψ a b t = hypergeometricSum ω ψ (a.map (u * ·)) (b.map (u * ·)) t :=
  sorry

/-- **4.4 (iv)**, complex conjugation negates the parameters (Mathlib's `star_gaussSum_eq`). -/
theorem hypergeometricSum_conj (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (a b : Multiset ℤ) (hab : Multiset.card a = Multiset.card b) (t : F) :
    (starRingEnd ℂ) (hypergeometricSum ω ψ a b t) =
      hypergeometricSum ω ψ (a.map Neg.neg) (b.map Neg.neg) t := sorry

/-- **4.4 (iii)**, the Galois action: an automorphism of `ℂ` acting on the values of `ω` by
`ζ ↦ ζ^u` and on those of `ψ` arbitrarily sends `H_q(a, b | t)` to `H_q(ua, ub | t)`. -/
theorem hypergeometricSum_galois (σ : ℂ ≃+* ℂ) (ω : MulChar F ℂ) (ψ : AddChar F ℂ)
    (hψ : ψ.IsPrimitive) (hω : orderOf ω = qm F) (u : ℤ) (hu : IsCoprime u (qm F : ℤ))
    (hσ : ω.ringHomComp (σ : ℂ →+* ℂ) = ω ^ u) (a b : Multiset ℤ)
    (hab : Multiset.card a = Multiset.card b) (t : F) :
    σ (hypergeometricSum ω ψ a b t) = hypergeometricSum ω ψ (a.map (u * ·)) (b.map (u * ·)) t :=
  sorry

/-- **4.6**, Beukers–Cohen–Mellit Theorem 3.4, the shift, with the sign their statement drops:
`ω((-1)^d t)^μ S_q(a + μ, b + μ | t) = S_q(a, b | t)` (reindex `m ↦ m - μ` in the definition of
`S_q`, whose character factor is `ω((-1)^d t)^m`). The printed `ω(t)^μ` fails for `d μ` odd: over
`𝔽_5`, `a = {0}`, `b = {2}`, `μ = 1`, `t = 2`. -/
theorem katzSum_shift (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (a b : Multiset ℤ)
    (hab : Multiset.card a = Multiset.card b) (μ : ℤ) (t : F) :
    ω ((-1) ^ Multiset.card a * t) ^ μ * katzSum ω ψ (a.map (· + μ)) (b.map (· + μ)) t =
      katzSum ω ψ a b t := sorry

/-- **4.6**, Beukers–Cohen–Mellit Theorem 3.5, the swap: `H_q(a, b | t) = H_q(-b, -a | 1/t)`. -/
theorem hypergeometricSum_swap (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (a b : Multiset ℤ)
    (hab : Multiset.card a = Multiset.card b) (t : F) (ht : t ≠ 0) :
    hypergeometricSum ω ψ a b t = hypergeometricSum ω ψ (b.map Neg.neg) (a.map Neg.neg) t⁻¹ :=
  sorry

/-- **4.12**, Greene's binomial coefficient `(A over B) = B(-1)/q · J(A, B̄)` (Definition 2.4). -/
def greeneBinom (A B : MulChar F ℂ) : ℂ := B (-1) / Fintype.card F * jacobiSum A B⁻¹

/-- **4.12**, Greene's `_{n+1}F_n(A_0, …, A_n; B_1, …, B_n | x)` (Definition 3.10), the sum over
all characters written as `ω^m`, `m ∈ ℤ/𝔮`, for a generator `ω`. -/
def greeneF (ω : MulChar F ℂ) {n : ℕ} (A : Fin (n + 1) → MulChar F ℂ) (B : Fin n → MulChar F ℂ)
    (x : F) : ℂ :=
  (Fintype.card F : ℂ) / qm F * ∑ m ∈ Finset.range (qm F),
    greeneBinom (A 0 * ω ^ m) (ω ^ m) * (∏ i, greeneBinom (A i.succ * ω ^ m) (B i * ω ^ m)) *
      (ω ^ m) x

/-- **4.12**, the comparison with `S_q`: for `A_i = ω^{a_i}` and `B_j = ω^{b_j}` over the nonzero
entries of `b` (so `0 ∈ b` with multiplicity exactly one),
`_{n+1}F_n(A; B | x) = c · q^{1-d} · (∏_i g(a_i - b_i))⁻¹ · S_q(a, b | x)` for a sign `c`, when
`x ≠ 0` and `a` is disjoint from `{0} ∪ b` modulo `𝔮`. The milestone determines `c` as a function
of `a`, `b`, `q`; the existential is the statement that can be made before it is. Both hypotheses
are needed: at `x = 0` the left side is `0` and the right side is not, and over `𝔽_7` with
`a = (1, 3)`, `b = (3)` the ratio at `x = 2` is not `±1`. -/
theorem greeneF_eq_katzSum (ω : MulChar F ℂ) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive)
    (hω : orderOf ω = qm F) {n : ℕ} (a : Fin (n + 1) → ℤ) (b : Fin n → ℤ)
    (hb : ∀ j, ((b j : ℤ) : ZMod (qm F)) ≠ 0) (ha : ∀ i, ((a i : ℤ) : ZMod (qm F)) ≠ 0)
    (hab : ∀ i j, ((a i : ℤ) : ZMod (qm F)) ≠ ((b j : ℤ) : ZMod (qm F))) (x : F) (hx : x ≠ 0) :
    ∃ c : ℂ, (c = 1 ∨ c = -1) ∧
      greeneF ω (fun i => ω ^ a i) (fun j => ω ^ b j) x =
        c * (Fintype.card F : ℂ) ^ (1 - (n + 1 : ℤ)) *
          ((∏ i : Fin (n + 1),
            gaussSumPow ω ψ (a i - (Fin.cons (0 : ℤ) b : Fin (n + 1) → ℤ) i))⁻¹) *
          katzSum ω ψ (Multiset.map a Finset.univ.val)
            (Multiset.map (Fin.cons (0 : ℤ) b : Fin (n + 1) → ℤ) Finset.univ.val) x := sorry

end FiniteSums

namespace CyclotomicData

section Rational

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]

/-- **4.5**, the rational value of `H_q(α(A), β(B) | t)` for a cyclotomic datum and `N ∣ q - 1`:
the rational number whose image in `ℂ` is the sum of 4.3 for some generator `ω` and primitive `ψ`.
That it exists and does not depend on the choice is `hypergeometricSumRat_spec`. -/
def hypergeometricSumRat (D : CyclotomicData) (F : Type*) [Field F] [Fintype F] [DecidableEq F]
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
  ((-1) ^ (D.r + D.s) / (1 - (Fintype.card F : ℂ))) * ∑ m ∈ Finset.range (qm F),
    (Fintype.card F : ℂ) ^ ((D.commonRootMultiplicity (qm F) m : ℤ) -
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

/-- **4.7**, `s(0) = min(r, s)`. -/
theorem commonRootMultiplicity_zero (D : CyclotomicData) (𝔮 : ℕ) (h𝔮 : 0 < 𝔮) :
    D.commonRootMultiplicity 𝔮 0 = min D.r D.s := sorry

/-- **4.7**, the value of the gamma form at every prime power coprime to the wild primes, as a
rational number: **from here on `H_q(A, B | t)` means this.** It is the rational number whose
image in `ℂ` is `gammaVectorSum` for some generator `ω` and primitive `ψ`; that it exists and does
not depend on the choice is `frobeniusSum_spec`. -/
def frobeniusSum (D : CyclotomicData) (F : Type*) [Field F] [Fintype F] [DecidableEq F]
    (t : F) : ℚ :=
  Classical.epsilon fun x : ℚ => ∃ (ω : MulChar F ℂ) (ψ : AddChar F ℂ),
    orderOf ω = qm F ∧ ψ.IsPrimitive ∧ (x : ℂ) = D.gammaVectorSum ω ψ t

/-- **4.7**, rationality of the gamma form for `p ∤ N`, for every generator `ω` and primitive `ψ`. -/
theorem frobeniusSum_spec (D : CyclotomicData) (hp : ∀ p ∈ D.wildPrimes, ¬p ∣ Fintype.card F)
    (ω : MulChar F ℂ) (hω : orderOf ω = qm F) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (t : F) :
    (D.frobeniusSum F t : ℂ) = D.gammaVectorSum ω ψ t := sorry

/-- **4.7**, when `N ∣ q - 1` the two rational values agree (Assumption 1.4 is a theorem). -/
theorem frobeniusSum_eq_hypergeometricSumRat (D : CyclotomicData)
    (hN : D.toParameters.denominator ∣ qm F) (t : F) :
    D.frobeniusSum F t = D.hypergeometricSumRat F t := sorry

/-- **4.9**, integrality for cyclotomic data: `q^δ H_q(A, B | t) ∈ ℤ` with `δ = hodgeTwist` (2.5),
which is sharp (`A2.2_B4`: `δ = 1`, `H_3(· | 2) = -2/3`) and implies Beukers–Cohen–Mellit's
`q^{min(r,s) - λ} H_q ∈ ℤ`. At `t = 0` the sum is the single term `1/(1 - q)`, hence `t ≠ 0`. -/
theorem frobeniusSum_integral (D : CyclotomicData) (hp : ∀ p ∈ D.wildPrimes, ¬p ∣ Fintype.card F)
    (t : F) (ht : t ≠ 0) :
    ∃ z : ℤ, (Fintype.card F : ℚ) ^ D.hodgeTwist * D.frobeniusSum F t = z := sorry

/-- **4.10**, the swap at the level of traces: `H_q(A, B | t) = H_q(B, A | 1/t)`. -/
theorem frobeniusSum_swap (D : CyclotomicData) (hp : ∀ p ∈ D.wildPrimes, ¬p ∣ Fintype.card F)
    (t : F) (ht : t ≠ 0) :
    D.swap.frobeniusSum F t⁻¹ = D.frobeniusSum F t := sorry

/-- **4.11**, Katz's Kummer pullback at the level of sums: for a datum with rotation number `ρ`
and primitive datum `D'`, `H_q(D | t) = ∑_{c^ρ = t} H_q(D' | c)`, both sides `0` when `t` is not
a `ρ`-th power and `ρ ∣ q - 1`. -/
theorem frobeniusSum_primitiveData (D : CyclotomicData)
    (hp : ∀ p ∈ D.wildPrimes, ¬p ∣ Fintype.card F) (t : F) (ht : t ≠ 0) :
    D.frobeniusSum F t =
      ∑ c ∈ (Finset.univ.filter fun c : F => c ^ D.toParameters.rotationNumber = t),
        D.primitiveData.frobeniusSum F c := sorry

end Rational

end CyclotomicData

/-! ## Layer 5: Frobenius traces, Euler factors and bad primes -/

namespace CyclotomicData

variable (D : CyclotomicData)

/-- **5.1**, the Frobenius trace `a_q(A, B; t) = q^δ H_q(A, B | t)` at `q = p^f`, `δ = hodgeTwist`,
read in Mathlib's `GaloisField p f`: the LMFDB's `t`, not `1/t`, and the Hodge-normalised trace.
Intended for `p` good for `(D, t)` and `f ≥ 1`. -/
def frobeniusTrace (t : ℚ) (p : ℕ) [Fact p.Prime] (f : ℕ) : ℚ :=
  letI : Fintype (GaloisField p f) := Fintype.ofFinite _
  ((p : ℚ) ^ f) ^ D.hodgeTwist * D.frobeniusSum (GaloisField p f) (ratToField _ t)

theorem frobeniusTrace_swap (t : ℚ) (ht : t ≠ 0) (p : ℕ) [Fact p.Prime] (f : ℕ)
    (hp : D.IsGood t p) : D.swap.frobeniusTrace t⁻¹ p f = D.frobeniusTrace t p f := sorry

/-- **5.1**, integrality `a_q ∈ ℤ` (4.9). `IsGood 0 p` holds for every non-wild `p`, so `t ≠ 0` is
a hypothesis. -/
theorem frobeniusTrace_integral (t : ℚ) (ht : t ≠ 0) (p : ℕ) [Fact p.Prime] (f : ℕ)
    (hp : D.IsGood t p) :
    ∃ z : ℤ, D.frobeniusTrace t p f = z := sorry

instance : Fact (Nat.Prime 3) := ⟨by norm_num⟩
instance : Fact (Nat.Prime 5) := ⟨by norm_num⟩
instance : Fact (Nat.Prime 7) := ⟨by norm_num⟩

/-- **5.1**, acceptance: `a_5 = -4` and `a_7 = 0` for the LMFDB motive `A2.2.2.2_B1.1.1.1_t-1.1`. -/
theorem frobeniusTrace_dworkDatum :
    dworkDatum.frobeniusTrace (-1) 5 1 = -4 ∧ dworkDatum.frobeniusTrace (-1) 7 1 = 0 :=
  sorry

/-- **5.1**, acceptance pinning `t` against `1/t`: the LMFDB motives `A2.2_B1.1_t2.1` and
`A2.2_B1.1_t1.2` have `a_5 = -2` and `a_5 = 2`. -/
theorem frobeniusTrace_legendreDatum :
    legendreDatum.frobeniusTrace 2 5 1 = -2 ∧ legendreDatum.frobeniusTrace (1 / 2) 5 1 = 2 :=
  sorry

/-- **5.1**, acceptance pinning the power of `q`: the LMFDB motive `A2.2_B4_t2.1` has `a_3 = -2`,
which is `3 · H_3(· | 2)` with `hodgeTwist = 1`. -/
theorem frobeniusTrace_twistDatum :
    twistDatum.hodgeTwist = 1 ∧ twistDatum.frobeniusTrace 2 3 1 = -2 := sorry

/-- **5.2**, the Frobenius series `exp(-∑_{e ≥ 1} a_{p^e} T^e / e) ∈ ℚ⟦T⟧`. -/
def frobeniusSeries (t : ℚ) (p : ℕ) [Fact p.Prime] : PowerSeries ℚ :=
  PowerSeries.subst
    (-(PowerSeries.mk fun e : ℕ => if e = 0 then (0 : ℚ) else D.frobeniusTrace t p e / e))
    (PowerSeries.exp ℚ)

/-- **5.2**, the Frobenius polynomial, the truncation of the series to degree `d`. -/
def frobeniusPolynomial (t : ℚ) (p : ℕ) [Fact p.Prime] : ℚ[X] :=
  PowerSeries.trunc (D.degree + 1) (D.frobeniusSeries t p)

theorem coeff_zero_frobeniusPolynomial (t : ℚ) (p : ℕ) [Fact p.Prime] :
    (D.frobeniusPolynomial t p).coeff 0 = 1 := sorry

theorem coeff_one_frobeniusPolynomial (hd : 0 < D.degree) (t : ℚ) (p : ℕ) [Fact p.Prime] :
    (D.frobeniusPolynomial t p).coeff 1 = -D.frobeniusTrace t p 1 := sorry

theorem natDegree_frobeniusPolynomial_le (t : ℚ) (p : ℕ) [Fact p.Prime] :
    (D.frobeniusPolynomial t p).natDegree ≤ D.degree := sorry

/-- **5.6**, acceptance: `F_5(T) = 1 + 4T - 130T² + 500T³ + 15625T⁴` and
`F_3(T) = 1 + 6T² + 729T⁴` for the LMFDB motive `A2.2.2.2_B1.1.1.1_t-1.1`. -/
theorem frobeniusPolynomial_dworkDatum :
    dworkDatum.frobeniusPolynomial (-1) 5 =
        (1 + 4 * X - 130 * X ^ 2 + 500 * X ^ 3 + 15625 * X ^ 4 : ℚ[X]) ∧
      dworkDatum.frobeniusPolynomial (-1) 3 = (1 + 6 * X ^ 2 + 729 * X ^ 4 : ℚ[X]) := sorry

/-- **5.3**, the bad primes of `(D, t)`: tame or wild. -/
def IsBad (t : ℚ) (p : ℕ) : Prop := D.IsWild p ∨ D.IsTame t p

theorem finite_setOf_isBad (t : ℚ) (ht : t ≠ 0) : {p | D.IsBad t p}.Finite := sorry

/-- **5.5**, the purity hypothesis: the traces at all powers of `p` are the power sums of `d`
complex numbers of absolute value `p^{w/2}` (Weil `p`-numbers of weight `w`). Katz's theorem
supplies it for the realization; nothing here asserts it. -/
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

/-- **5.5 (ii)**, under purity the Frobenius polynomial has integer coefficients. -/
theorem frobeniusPolynomial_int_of_isPure (t : ℚ) (p : ℕ) [Fact p.Prime] (hpure : D.IsPure t p) :
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

/-- **5.5**, the sign `ε_p = (-1)^d ∏λ / p^{wd/2}` is `+1` in the symplectic case when no `λ`
squares to `p^w`; the unconditional `ε_p = 1` for the realization is Poincaré duality with an
alternating pairing, cited. -/
theorem local_sign_eq_one_of_odd_weight (t : ℚ) (p : ℕ) [Fact p.Prime] (hw : Odd D.weight)
    (Λ : Multiset ℂ) (hcard : Multiset.card Λ = D.degree)
    (hΛ : ∀ z ∈ Λ, ‖z‖ = (p : ℝ) ^ ((D.weight : ℝ) / 2))
    (htr : ∀ e : ℕ, 1 ≤ e → (D.frobeniusTrace t p e : ℂ) = (Λ.map fun z => z ^ e).sum)
    (hsd : Λ.map (fun z => (p : ℂ) ^ D.weight / z) = Λ)
    (hfix : ∀ z ∈ Λ, z ^ 2 ≠ (p : ℂ) ^ D.weight) :
    (-1) ^ D.degree * Λ.prod = (p : ℂ) ^ (D.weight * D.degree / 2) := sorry

/-- **5.4**, the Newton polygon of the Frobenius polynomial at the integer `k`: the lower convex
hull of the points `(j, v_p(coeff j))`, `coeff j ≠ 0`, evaluated at `k` as the supremum of the
supporting lines (real-valued, since `ℚ` has no `sSup`). -/
def newtonPolygonFn (t : ℚ) (p : ℕ) [Fact p.Prime] (k : ℕ) : ℝ :=
  sSup {y : ℝ | ∃ m c : ℝ, (∀ j ≤ D.degree, (D.frobeniusPolynomial t p).coeff j ≠ 0 →
    m * j + c ≤ padicValRat p ((D.frobeniusPolynomial t p).coeff j)) ∧ y = m * k + c}

/-- **5.4**, the Newton polygon starts at `(0, 0)`: the constant term is `1`. -/
theorem newtonPolygonFn_zero (t : ℚ) (p : ℕ) [Fact p.Prime] : D.newtonPolygonFn t p 0 = 0 := sorry

/-- **5.4**, `(D, t)` is ordinary at `p` when the Newton polygon is the Hodge polygon (the LMFDB
family page's "Ordinary?" column). That the Newton polygon lies on or above the Hodge polygon is
Mazur's theorem for the realization, cited. -/
def IsOrdinary (t : ℚ) (p : ℕ) [Fact p.Prime] : Prop :=
  ∀ k ≤ D.degree, D.newtonPolygonFn t p k = D.toParameters.hodgePolygonFn k

/-- **5.7**, the archimedean shifts `(μ, ν)` of a Hodge vector `h` and a signature `σ`
(LMFDB `hodge.mu_nu`, Roberts–Rodriguez-Villegas (12.2)): `ν` carries `(w - 2p)/2` with
multiplicity `h^{p,w-p}` for `p < w/2` and, for even `w`, `0` with multiplicity
`(h^{w/2,w/2} - |σ|)/2`; `μ` carries `|σ|` copies of `0` if `σ > 0`, of `1` if `σ ≤ 0`. -/
def archimedeanShifts (h : List ℕ) (σ : ℤ) : Multiset ℚ × Multiset ℚ :=
  let w := h.length - 1
  (Multiset.replicate σ.natAbs (if 0 < σ then (0 : ℚ) else 1),
    ((Finset.range ((w + 1) / 2)).val.bind fun p =>
      Multiset.replicate (h.getD p 0) (((w : ℚ) - 2 * p) / 2)) +
      if Even w then Multiset.replicate (((h.getD (w / 2) 0 : ℤ) - |σ|).toNat / 2) 0 else 0)

/-- The middle Hodge number `h^{w/2,w/2}` (junk for odd `w`). -/
def hodgeNumberMid : ℤ := D.toParameters.hodgeNumber (D.weight / 2)

/-- **5.7**, `card μ + 2 card ν = d` when `σ` has the parity of the middle Hodge number and
`|σ| ≤ h^{w/2,w/2}` (`σ = 0` for odd `w`). -/
theorem card_archimedeanShifts (σ : ℤ)
    (hσ : if Even D.weight then |σ| ≤ D.hodgeNumberMid ∧ (σ - D.hodgeNumberMid) % 2 = 0
      else σ = 0) :
    Multiset.card (archimedeanShifts D.hodgeVector σ).1 +
      2 * Multiset.card (archimedeanShifts D.hodgeVector σ).2 = D.degree := sorry

/-- The discriminant of a monic polynomial, `(-1)^{d(d-1)/2} Res(f, f')`, through Mathlib's
`Polynomial.resultant` (which has no discriminant of its own). -/
def polyDiscriminant (f : ℤ[X]) : ℤ :=
  (-1) ^ (f.natDegree * (f.natDegree - 1) / 2) * resultant f (derivative f)

/-- **5.8**, the constant `Π = ∏_{v ∈ C} disc Φ_v` of the determinant recipe, over `C := B` when
exactly one of "`d` odd", "`1 ∈ A`" holds and `C := A` otherwise (Watkins; Sage's `_sign_param`). -/
def determinantConstant : ℤ :=
  if (Odd D.degree ↔ 1 ∉ D.A) then (D.B.map fun v => polyDiscriminant (cyclotomic v ℤ)).prod
  else (D.A.map fun v => polyDiscriminant (cyclotomic v ℤ)).prod

/-- **5.8**, the determinant discriminant `D(A, B; t) = Π · f(t)` with `f(t) = 1 - t` when
exactly one of "`d` odd", "`1 ∈ A`" holds and `f(t) = t(t - 1)` otherwise, in the LMFDB's `t`; the
quadratic character of `ℚ(√D(A,B;t))` is the determinant character. The ramification at `0`, `1`,
`∞` it encodes is the theorem `determinantDiscriminant_ramification`; the constant `Π` is a cited
recipe. -/
def determinantDiscriminant (t : ℚ) : ℚ :=
  D.determinantConstant * (if (Odd D.degree ↔ 1 ∉ D.A) then 1 - t else t * (t - 1))

/-- **5.8**, the geometric part: in the orthogonal case the recipe has odd degree in `t` (it is
`1 - t`) iff `d + m_A` is odd, `t - 1` always to an odd power (and `m_A + m_B` is odd), and `t` to an
odd power (it is `t(t - 1)`) iff `d + m_B` is odd: the ramification at `∞`, `1`, `0` is
`det h_∞, det h_1, det h_0` of 3.3. -/
theorem determinantDiscriminant_ramification (hd : 0 < D.degree) (hw : Even D.weight) :
    ((Odd D.degree ↔ 1 ∉ D.A) ↔ Odd (D.degree + D.multOne_A)) ∧
      Odd (D.multOne_A + D.multOne_B) ∧
      ((Odd D.degree ↔ 1 ∉ D.A) ↔ Even (D.degree + D.multOne_B)) := sorry

/-- **5.9**, the tame conductor exponent at a tame prime (Roberts–Rodriguez-Villegas (13.1)):
`rank (h_0^{v_p(t)} - 1)` at the cusp `zero` (`v_p(t) > 0`), `rank (h_∞^{-v_p(t)} - 1)` at the cusp
`inf` (`v_p(t) < 0`), and at the cusp `one` the value `1`, or `0` when the type is orthogonal and
`v_p(t - 1)` is even. -/
def tameConductorExponent (t : ℚ) (p : ℕ) : ℕ :=
  match cuspAt t p with
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

/-- **5.9**, the tame local degree `d - c_p`, the degree of the (cited) tame Euler factor. -/
def tameLocalDegree (t : ℚ) (p : ℕ) : ℕ := D.degree - D.tameConductorExponent t p

/-- **5.9**, acceptance: the tame local degrees of `A4.2.2_B3.1.1` at `p = 7` are `3, 1, 3, 1, 0, 3`
at `t = 7^3, 7, 7^{-4}, 7^{-2}, 7^{-1}, 8`. -/
theorem tameLocalDegree_tameDatum :
    tameDatum.tameLocalDegree (7 ^ 3) 7 = 3 ∧ tameDatum.tameLocalDegree 7 7 = 1 ∧
      tameDatum.tameLocalDegree (1 / 7 ^ 4) 7 = 3 ∧ tameDatum.tameLocalDegree (1 / 49) 7 = 1 ∧
      tameDatum.tameLocalDegree (1 / 7) 7 = 0 ∧ tameDatum.tameLocalDegree 8 7 = 3 := sorry

/-- **5.9**, the conductor `∏_{p tame} p^{c_p} · ∏_{p wild} p^{c_p^{wild}}`, with the wild
exponents a parameter (they are the realization's and are not defined here). -/
def conductor (t : ℚ) (wild : ℕ → ℕ) (hw : {p | D.IsWild p ∧ wild p ≠ 0}.Finite)
    (ht : {p | D.IsTame t p}.Finite) : ℕ :=
  (∏ p ∈ ht.toFinset, p ^ D.tameConductorExponent t p) * ∏ p ∈ hw.toFinset, p ^ wild p

/-- **5.12**, the Galois group of the reversed Frobenius polynomial, the LMFDB's `Gal(F_p(T))`;
its transitive-group label is the polynomial-Galois-groups roadmap's. -/
def frobeniusGaloisGroup (t : ℚ) (p : ℕ) [Fact p.Prime] : Type :=
  Polynomial.Gal (D.frobeniusPolynomial t p).reverse

end CyclotomicData

/-! ## Layer 6: point counts -/

section PointCounts

variable {F : Type*} [Field F] [Fintype F] [DecidableEq F]

/-- **6.2**, the cubic family: `y² + xy + λy = x³`, the image of `y² + xy + y = λx³` under
`(x, y) ↦ (λx, λy)`, so with the same number of points for `λ ≠ 0`. -/
def cubicFamily (lam : F) : WeierstrassCurve F := ⟨1, 0, lam, 0, 0⟩

/-- **6.2**, Beukers–Cohen–Mellit Corollary 1.7: for `q` coprime to `6`, `3 ∣ q - 1`, and
`27λ ≠ 0, 1`, `|E'_λ(F_q)| = q + 1 - H_q(1/3, 2/3; 1, 1 | 27λ)`. -/
theorem cubic_point_count (h6 : Nat.Coprime (Fintype.card F) 6) (hN : 3 ∣ qm F)
    (ω : MulChar F ℂ) (hω : orderOf ω = qm F) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (lam : F)
    (h0 : lam ≠ 0) (h1 : 27 * lam ≠ 1) :
    (Nat.card (cubicFamily lam).toAffine.Point : ℂ) =
      Fintype.card F + 1 -
        hypergeometricSum ω ψ {((qm F / 3 : ℕ) : ℤ), ((2 * (qm F / 3) : ℕ) : ℤ)} {0, 0}
          (27 * lam) := sorry

/-- **4.12** acceptance, the degree-one datum `A = [1]`, `B = [2]`:
`H_q(0; 1/2 | t) = φ(t(t - 1))`, the quadratic character of `t(t - 1)`, which is `0` at `t = 1`;
so the motive `H([1], [2], t)` (`hodgeTwist = 0`) has trace `φ(t(t - 1))`, the determinant
character of 5.8 for `d = 1`, `1 ∈ A`. -/
theorem hypergeometricSum_degree_one (hq : Odd (Fintype.card F)) (ω : MulChar F ℂ)
    (hω : orderOf ω = qm F) (ψ : AddChar F ℂ) (hψ : ψ.IsPrimitive) (t : F) (ht : t ≠ 0) :
    hypergeometricSum ω ψ {0} {((qm F / 2 : ℕ) : ℤ)} t = (quadraticChar F (t * (t - 1)) : ℂ) :=
  sorry

end PointCounts

end

end TauCetiRoadmap.HypergeometricMotives
