import Mathlib
import TauCeti.InformationTheory.Coding.Krawtchouk
import TauCeti.InformationTheory.Coding.InformationSet
import TauCeti.InformationTheory.Coding.Binary.Golay.Punctured
import TauCeti.InformationTheory.Coding.TernaryGolay

/-!
# Bounds on codes: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Words of length `n` over an alphabet `α` with `q` letters are functions `ι → α` on a finite
coordinate type `ι` with `n` elements; distance and weight are Mathlib's `hammingDist` and
`hammingNorm`. A code is a `Finset` of words when its number of words is counted, and a linear
code is Tau Ceti's `TauCeti.LinearCode F ι`, a submodule of `ι → F`. Minimum distance is Tau
Ceti's `Set.hammingMinDist`, which is `0` for a set with at most one word; statements that use it
either carry a hypothesis that excludes such sets or hold for them as well. Separation conditions
on codes that are not linear are written as conditions on pairs of distinct words, so that no
statement depends on that convention.
-/

noncomputable section

open Finset

namespace TauCetiRoadmap.BoundsOnCodes

variable {ι α : Type*} [Fintype ι] [Fintype α] [DecidableEq α]

/-! ## Layer 1: Hamming balls, the sphere-packing bound and the Gilbert–Varshamov bound -/

/-- 1.1 The number of words of length `n` over `q` letters within distance `t` of a fixed word:
`∑_{i ≤ t} (n choose i) (q - 1)^i`. -/
def hammingBallVolume (q n t : ℕ) : ℕ :=
  ∑ i ∈ range (t + 1), n.choose i * (q - 1) ^ i

/-- 1.1 The Hamming ball of radius `t` about any word has `hammingBallVolume q n t` elements. -/
theorem card_hammingBall [DecidableEq ι] (x : ι → α) (t : ℕ) :
    #{y | hammingDist x y ≤ t} =
      hammingBallVolume (Fintype.card α) (Fintype.card ι) t := by
  sorry

/-- 1.2 A set of words is a perfect code of radius `t` when every word lies within distance `t`
of exactly one of its words. -/
def IsPerfect (C : Set (ι → α)) (t : ℕ) : Prop :=
  ∀ y : ι → α, ∃! c, c ∈ C ∧ hammingDist y c ≤ t

/-- 1.2 The sphere-packing (Hamming) bound: if distinct words of `C` are at distance more than
`2 t`, then `#C * V_q(n, t) ≤ q ^ n`. -/
theorem card_mul_hammingBallVolume_le (C : Finset (ι → α)) (t : ℕ)
    (hC : ∀ x ∈ C, ∀ y ∈ C, x ≠ y → 2 * t < hammingDist x y) :
    #C * hammingBallVolume (Fintype.card α) (Fintype.card ι) t ≤
      Fintype.card α ^ Fintype.card ι := by
  sorry

/-- 1.2 Equality holds in the sphere-packing bound exactly for perfect codes. -/
theorem card_mul_hammingBallVolume_eq_iff (C : Finset (ι → α)) (t : ℕ)
    (hC : ∀ x ∈ C, ∀ y ∈ C, x ≠ y → 2 * t < hammingDist x y) :
    #C * hammingBallVolume (Fintype.card α) (Fintype.card ι) t =
        Fintype.card α ^ Fintype.card ι ↔ IsPerfect (C : Set (ι → α)) t := by
  sorry

/-- 1.3 The Gilbert–Varshamov bound: for every radius `r` there is a code whose distinct words
are at distance more than `r` and with `q ^ n ≤ #C * V_q(n, r)`. -/
theorem exists_card_mul_hammingBallVolume_ge (r : ℕ) :
    ∃ C : Finset (ι → α),
      Fintype.card α ^ Fintype.card ι ≤
          #C * hammingBallVolume (Fintype.card α) (Fintype.card ι) r ∧
        ∀ x ∈ C, ∀ y ∈ C, x ≠ y → r < hammingDist x y := by
  sorry

/-- 1.4 The Gilbert–Varshamov bound for linear codes: over a finite field with `q` elements, if
`(q ^ k - 1) * V_q(n, r) < q ^ n` there is a linear code of dimension `k` all of whose nonzero
words have weight more than `r`. -/
theorem exists_linearCode_finrank_eq {F : Type*} [Field F] [Finite F] [DecidableEq F]
    (k r : ℕ)
    (h : (Nat.card F ^ k - 1) * hammingBallVolume (Nat.card F) (Fintype.card ι) r <
      Nat.card F ^ Fintype.card ι) :
    ∃ C : TauCeti.LinearCode F ι, Module.finrank F C = k ∧
      ∀ x ∈ C, x ≠ 0 → r < hammingNorm x := by
  sorry

/-! ## Layer 2: perfect codes -/

section Hamming

variable (F : Type*) [Field F] [Finite F] [DecidableEq F]

/-- 2.1 The coordinates of the `q`-ary Hamming code of redundancy `r`: the nonzero vectors of
`F ^ r` whose first nonzero entry is `1`, one on each line through the origin. -/
def HammingPoint (r : ℕ) : Type _ :=
  {v : Fin r → F // ∃ i, v i = 1 ∧ ∀ j, j < i → v j = 0}

/-- 2.1 There are finitely many points. -/
instance (r : ℕ) : Finite (HammingPoint F r) :=
  inferInstanceAs (Finite {v : Fin r → F // ∃ i, v i = 1 ∧ ∀ j, j < i → v j = 0})

/-- 2.1 The points as a finite coordinate type. -/
noncomputable instance (r : ℕ) : Fintype (HammingPoint F r) :=
  Fintype.ofFinite _

/-- 2.1 The `q`-ary Hamming code of redundancy `r`: the words `x` on `HammingPoint F r` with
`∑_p x p • p = 0`, that is, the code checked by the matrix whose columns are the points. -/
def hammingCode (r : ℕ) : TauCeti.LinearCode F (HammingPoint F r) :=
  Matrix.checkedBy (fun (i : Fin r) (p : HammingPoint F r) ↦ p.1 i)

omit [DecidableEq F] in
/-- 2.1 There are `1 + q + ⋯ + q ^ (r - 1)` points. -/
theorem card_hammingPoint (r : ℕ) :
    Nat.card (HammingPoint F r) = ∑ i ∈ range r, Nat.card F ^ i := by
  sorry

/-- 2.1 The Hamming code has redundancy `r`: its dimension plus `r` is its length. -/
theorem finrank_hammingCode_add (r : ℕ) :
    Module.finrank F (hammingCode F r) + r = Nat.card (HammingPoint F r) := by
  sorry

/-- 2.1 For `r ≥ 2` the Hamming code has minimum distance `3`. -/
theorem hammingMinDist_hammingCode {r : ℕ} (hr : 2 ≤ r) :
    Set.hammingMinDist (hammingCode F r : Set (HammingPoint F r → F)) = 3 := by
  sorry

/-- 2.1 The Hamming code is perfect of radius `1`. -/
theorem isPerfect_hammingCode (r : ℕ) :
    IsPerfect (hammingCode F r : Set (HammingPoint F r → F)) 1 := by
  sorry

end Hamming

/-- 2.2 Deleting any coordinate of the extended binary Golay code gives a binary Golay code of
length `23`, which is perfect of radius `3`. -/
theorem isPerfect_punctureAt_binaryGolay (i : Fin 24) :
    IsPerfect (TauCeti.punctureAt TauCeti.BinaryGolay.code i :
      Set (({i}ᶜ : Set (Fin 24)) → ZMod 2)) 3 := by
  sorry

/-- 2.3 Deleting a coordinate of the extended ternary Golay code gives minimum distance `5`. -/
theorem hammingMinDist_punctureAt_ternaryGolay (i : Fin 12) :
    Set.hammingMinDist (TauCeti.punctureAt TauCeti.TernaryGolay.code i :
      Set (({i}ᶜ : Set (Fin 12)) → ZMod 3)) = 5 := by
  sorry

/-- 2.3 Deleting any coordinate of the extended ternary Golay code gives a ternary Golay code of
length `11`, which is perfect of radius `2`. -/
theorem isPerfect_punctureAt_ternaryGolay (i : Fin 12) :
    IsPerfect (TauCeti.punctureAt TauCeti.TernaryGolay.code i :
      Set (({i}ᶜ : Set (Fin 12)) → ZMod 3)) 2 := by
  sorry

/-! ## Layer 3: the Singleton, Plotkin and Griesmer bounds -/

/-- 3.1 The Singleton bound: a code with at least two words and minimum distance `d` has at most
`q ^ (n - d + 1)` words. -/
theorem card_le_pow_of_nontrivial (C : Finset (ι → α)) (hC : (C : Set (ι → α)).Nontrivial) :
    #C ≤ Fintype.card α ^ (Fintype.card ι - Set.hammingMinDist (C : Set (ι → α)) + 1) := by
  sorry

/-- 3.1 The Singleton bound for linear codes over any field: `k + d ≤ n + 1`. -/
theorem finrank_add_hammingMinDist_le {F : Type*} [Field F] [DecidableEq F]
    (C : TauCeti.LinearCode F ι) :
    Module.finrank F C + Set.hammingMinDist (C : Set (ι → F)) ≤ Fintype.card ι + 1 := by
  sorry

/-- 3.2 The Plotkin bound: if distinct words of `C` are at distance at least `d` and
`(q - 1) n < q d`, then `#C ≤ q d / (q d - (q - 1) n)`. -/
theorem card_le_plotkin (C : Finset (ι → α)) (d : ℕ)
    (hC : ∀ x ∈ C, ∀ y ∈ C, x ≠ y → d ≤ hammingDist x y)
    (hd : ((Fintype.card α : ℝ) - 1) * Fintype.card ι < Fintype.card α * d) :
    (#C : ℝ) ≤ Fintype.card α * d /
      (Fintype.card α * d - ((Fintype.card α : ℝ) - 1) * Fintype.card ι) := by
  sorry

/-- 3.3 The Griesmer bound: a linear code of dimension `k` and minimum distance `d` over a field
with `q` elements has length at least `∑_{i < k} ⌈d / q ^ i⌉`. For an infinite field `q` is
`Nat.card F = 0` and, for `k ≥ 1`, the statement reduces to `d ≤ n`. -/
theorem sum_ceil_div_pow_le {F : Type*} [Field F] [DecidableEq F]
    (C : TauCeti.LinearCode F ι) :
    ∑ i ∈ range (Module.finrank F C),
        ⌈(Set.hammingMinDist (C : Set (ι → F)) : ℚ) / Nat.card F ^ i⌉₊ ≤
      Fintype.card ι := by
  sorry

/-! ## Layer 4: MDS codes, generalized Reed–Solomon codes and the BCH bound -/

section MDS

variable {F : Type*} [Field F] [DecidableEq F]

/-- 4.1 A linear code is maximum distance separable when it attains the Singleton bound:
`k + d = n + 1`. The zero code, whose minimum distance is `0` by convention, is not MDS. -/
def IsMDS (C : TauCeti.LinearCode F ι) : Prop :=
  Module.finrank F C + Set.hammingMinDist (C : Set (ι → F)) = Fintype.card ι + 1

/-- 4.1 A nonzero linear code of dimension `k` is MDS if and only if every set of `k`
coordinates is an information set. -/
theorem isMDS_iff_forall_isInformationSet (C : TauCeti.LinearCode F ι)
    (hk : 1 ≤ Module.finrank F C) :
    IsMDS C ↔ ∀ s : Finset ι, #s = Module.finrank F C →
      TauCeti.IsInformationSet C (s : Set ι) := by
  sorry

/-- 4.1 The dual of an MDS code of dimension less than the length is MDS. -/
theorem IsMDS.euclideanDual {C : TauCeti.LinearCode F ι} (hC : IsMDS C)
    (hk : Module.finrank F C < Fintype.card ι) :
    IsMDS (Submodule.euclideanDual C) := by
  sorry

/-- 4.2 The generalized Reed–Solomon code with evaluation points `a`, column multipliers `v`
and dimension parameter `k`: the words `(v i * p (a i))_i` for the polynomials `p` of degree less
than `k`. The Reed–Solomon code is the case `v = 1`. -/
def grsCode (a v : ι → F) (k : ℕ) : TauCeti.LinearCode F ι :=
  (Polynomial.degreeLT F k).map (LinearMap.pi fun i ↦ v i • Polynomial.leval (a i))

omit [DecidableEq F] in
/-- 4.2 With distinct points, nonzero multipliers and `k ≤ n`, the code has dimension `k`. -/
theorem finrank_grsCode {a v : ι → F} (ha : Function.Injective a) (hv : ∀ i, v i ≠ 0)
    {k : ℕ} (hk : k ≤ Fintype.card ι) :
    Module.finrank F (grsCode a v k) = k := by
  sorry

/-- 4.2 Generalized Reed–Solomon codes with `1 ≤ k ≤ n` are MDS. -/
theorem isMDS_grsCode {a v : ι → F} (ha : Function.Injective a) (hv : ∀ i, v i ≠ 0)
    {k : ℕ} (hk₀ : 1 ≤ k) (hk : k ≤ Fintype.card ι) :
    IsMDS (grsCode a v k) := by
  sorry

omit [DecidableEq F] in
/-- 4.3 The dual of a generalized Reed–Solomon code is the generalized Reed–Solomon code on the
same points of dimension parameter `n - k`, with multipliers
`u i = (v i * ∏_{j ≠ i} (a i - a j))⁻¹`. -/
theorem euclideanDual_grsCode [DecidableEq ι] {a v : ι → F} (ha : Function.Injective a)
    (hv : ∀ i, v i ≠ 0) (k : ℕ) :
    Submodule.euclideanDual (grsCode a v k) =
      grsCode a (fun i ↦ (v i * ∏ j ∈ univ.erase i, (a i - a j))⁻¹) (Fintype.card ι - k) := by
  sorry

end MDS

/-- 4.4 The BCH bound: let `β` be a primitive `n`-th root of unity in a field. A nonzero word
`c` of length `n` with `∑_i c i * β ^ (i * (b + j)) = 0` for the `δ - 1` consecutive exponents
`j = 0, …, δ - 2` has weight at least `δ`. -/
theorem le_hammingNorm_of_isPrimitiveRoot {K : Type*} [Field K] [DecidableEq K] {n : ℕ} {β : K}
    (hβ : IsPrimitiveRoot β n) (b δ : ℕ) {c : Fin n → K} (hc : c ≠ 0)
    (h : ∀ j, j + 1 < δ → ∑ i : Fin n, c i * β ^ ((i : ℕ) * (b + j)) = 0) :
    δ ≤ hammingNorm c := by
  sorry

/-! ## Layer 5: Delsarte's linear-programming bound -/

/-- 5.1 The (unnormalized) distance distribution of a code: the number of ordered pairs of words
of `C`, equal or not, at distance `i`. Dividing by `#C` gives the usual `A_i`. -/
def distanceDistribution (C : Finset (ι → α)) (i : ℕ) : ℕ :=
  #{p ∈ C ×ˢ C | hammingDist p.1 p.2 = i}

/-- 5.1 Delsarte's inequalities: for every code and every `k`, the Krawtchouk transform of the
distance distribution is nonnegative. -/
theorem sum_distanceDistribution_mul_krawtchouk_nonneg (C : Finset (ι → α)) (k : ℕ) :
    0 ≤ ∑ i ∈ range (Fintype.card ι + 1),
      (distanceDistribution C i : ℤ) * TauCeti.krawtchouk (Fintype.card α) (Fintype.card ι) k i := by
  sorry

/-- 5.2 Delsarte's linear-programming bound in dual form. Let `f = ∑_k f k * K_k` with
`f 0 > 0`, `f k ≥ 0` for `1 ≤ k ≤ n` and `f(i) ≤ 0` for `d ≤ i ≤ n`. A nonempty code whose
distinct words are at distance at least `d` has `#C * f 0 ≤ f(0)`. -/
theorem card_mul_le_of_krawtchouk (C : Finset (ι → α)) (hC : C.Nonempty) (d : ℕ)
    (hd : ∀ x ∈ C, ∀ y ∈ C, x ≠ y → d ≤ hammingDist x y) (f : ℕ → ℝ) (hf₀ : 0 < f 0)
    (hf : ∀ k, 1 ≤ k → k ≤ Fintype.card ι → 0 ≤ f k)
    (hneg : ∀ i, d ≤ i → i ≤ Fintype.card ι →
      ∑ k ∈ range (Fintype.card ι + 1),
        f k * TauCeti.krawtchouk (Fintype.card α) (Fintype.card ι) k i ≤ 0) :
    (#C : ℝ) * f 0 ≤ ∑ k ∈ range (Fintype.card ι + 1),
      f k * TauCeti.krawtchouk (Fintype.card α) (Fintype.card ι) k 0 := by
  sorry

end TauCetiRoadmap.BoundsOnCodes
