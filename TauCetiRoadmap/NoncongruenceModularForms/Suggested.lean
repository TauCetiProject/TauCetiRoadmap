module

import Mathlib
import TauCeti.Algebra.GroupAction.PermutationRepresentation
import TauCeti.Combinatorics.PermutationTriple.EulerCharacteristic
import TauCeti.Combinatorics.PermutationTriple.IsoClass
import TauCeti.GroupTheory.Perm.OrbitCount.Basic
import TauCeti.GroupTheory.Perm.Partition
import TauCeti.GroupTheory.TriangleGroup.Basic
import TauCeti.NumberTheory.ModularForms.Cusps.Basic
import TauCeti.NumberTheory.ModularForms.SturmBound
import TauCeti.NumberTheory.ModularForms.HeckeSlash.ModularForm

/-!
# Noncongruence modular forms: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs: the modular triangle presentation,
Millington's correspondence, the cusp and genus dictionary, the strict form of Wohlfahrt's
theorem, Hsu's criterion, Kulkarni's Farey correspondence, dimensions, algebraicity and
denominator transport.
Definitions have real bodies and the headline proofs are `sorry`.

The geometric Belyi identification with the mirror of the modular triple needs the
analytic/algebraic Belyi-pair comparison carrier of BelyiMaps §§8–11. The Scholl
headline, with original Fourier coefficients and the prescribed p-adic coordinate
factors in the rescaled formula, needs the arithmetic model of that pair together with its
parabolic symmetric-power cohomology and integral comparison;
none is a pinned carrier. The Farey polygon presentation needs the special-polygon
carrier, but its generated group, finite index and realization are statable below.
Berger's factorization below uses native Hecke double cosets and an explicit trace
sum; it requires no replacement operator carrier.
-/

open Matrix MatrixGroups ModularGroup CongruenceSubgroup TauCeti UpperHalfPlane Equiv
open scoped ModularForm Pointwise

namespace TauCetiRoadmap.NoncongruenceModularForms

/-! ## Layer 0: the modular group as a triangle group -/

/-- `README.md`, Layer 0, 0.1. The projection `SL(2, ℤ) → PSL(2, ℤ)`. -/
abbrev toPSL : SL(2, ℤ) →* PSL(2, ℤ) := QuotientGroup.mk' (Subgroup.center SL(2, ℤ))

/-- `README.md`, Layer 0, 0.1. `U := S * T⁻¹`, of order three in `SL(2, ℤ)`; its image fixes
`e^{πi/3}`. -/
def U : SL(2, ℤ) := S * T⁻¹

/-- `README.md`, Layer 0, 0.1. The image of `S`. -/
def Sbar : PSL(2, ℤ) := toPSL S

/-- `README.md`, Layer 0, 0.1. The image of `T`. -/
def Tbar : PSL(2, ℤ) := toPSL T

/-- `README.md`, Layer 0, 0.1. The image of `U = S * T⁻¹`. -/
def Ubar : PSL(2, ℤ) := toPSL U

/-- The modular triangle homomorphism sends the branch generators to ST⁻¹, S and T. -/
def modularHom : TriangleGroup 3 2 0 →* PSL(2, ℤ) :=
  TriangleGroup.lift Ubar Sbar Tbar
    (by
      rw [Ubar, ← map_pow]
      have h : U ^ 3 = 1 := by decide
      rw [h, map_one])
    (by
      rw [Sbar, ← map_pow]
      have h : S ^ 2 = -1 := by decide
      rw [h, QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
      exact Subgroup.mem_center_iff.mpr fun g ↦ by simp)
    (pow_zero _)
    (by
      rw [Tbar, Sbar, Ubar, ← map_mul, ← map_mul]
      have h : T * S * U = -1 := by decide
      rw [h, QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
      exact Subgroup.mem_center_iff.mpr fun g ↦ by simp)

/-- The modular group has the triangle presentation Δ(3,2,∞), equivalently C₃ ∗ C₂. -/
theorem modularHom_bijective : Function.Bijective modularHom := sorry

/-- `README.md`, Layer 0, 0.3. A torsion-free subgroup of finite index `n` is free of rank
`1 + n / 6`, and `6 ∣ n`. -/
theorem exists_freeGroupBasis_of_torsionFree (Γ' : Subgroup PSL(2, ℤ)) [Γ'.FiniteIndex]
    (h : ∀ g ∈ Γ', IsOfFinOrder g → g = 1) :
    6 ∣ Γ'.index ∧ Nonempty (FreeGroupBasis (Fin (1 + Γ'.index / 6)) Γ') := sorry

/-- `README.md`, Layer 0, 0.4. The lift `±Γ'` of a subgroup of `PSL(2, ℤ)` to `SL(2, ℤ)`. -/
def lift (Γ' : Subgroup PSL(2, ℤ)) : Subgroup SL(2, ℤ) := Γ'.comap toPSL

/-! ## Layer 1: the coset dictionary -/

section CosetDictionary
variable (Γ' : Subgroup PSL(2, ℤ)) {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n)

/-- `README.md`, Layer 1, 1.1. The permutation representation of `PSL(2, ℤ)` on the left cosets
of `Γ'`, numbered by `e`: `ρ h (e (g Γ')) = e ((h g) Γ')`. -/
noncomputable abbrev ρ : PSL(2, ℤ) →* Perm (Fin n) := Equiv.permutationRepresentation (G := PSL(2, ℤ)) e

/-- `README.md`, Layer 1, 1.1. **The modular triple** `(σ0, σ1, σinf) = (ρ Ū, ρ S̄, ρ T̄)` of a
finite-index subgroup, a permutation triple in Tau Ceti's sense because `T̄ S̄ Ū = 1`. -/
noncomputable def modularTriple : PermutationTriple n where
  σ0 := ρ Γ' e Ubar
  σ1 := ρ Γ' e Sbar
  σinf := ρ Γ' e Tbar
  product_eq_one := by
    rw [← map_mul, ← map_mul]
    have h : Tbar * Sbar * Ubar = 1 := by
      rw [Tbar, Sbar, Ubar, ← map_mul, ← map_mul]
      have h : T * S * U = -1 := by decide
      rw [h, QuotientGroup.mk'_apply, QuotientGroup.eq_one_iff]
      exact Subgroup.mem_center_iff.mpr fun g ↦ by simp
    rw [h, map_one]

/-- `README.md`, Layer 1, 1.1. The LMFDB's `permS`. -/
noncomputable abbrev permS : Perm (Fin n) := (modularTriple Γ' e).σ1

/-- `README.md`, Layer 1, 1.1. The LMFDB's `permT`. -/
noncomputable abbrev permT : Perm (Fin n) := (modularTriple Γ' e).σinf

/-- `README.md`, Layer 1, 1.2. **Millington's theorem**: modular triples are isomorphic iff the
subgroups are conjugate. -/
theorem millington (Γ₁ Γ₂ : Subgroup PSL(2, ℤ)) [Γ₁.FiniteIndex] [Γ₂.FiniteIndex]
    (e₁ : PSL(2, ℤ) ⧸ Γ₁ ≃ Fin n) (e₂ : PSL(2, ℤ) ⧸ Γ₂ ≃ Fin n) :
    (modularTriple Γ₁ e₁).Equivalent (modularTriple Γ₂ e₂) ↔
      ∃ g : ConjAct PSL(2, ℤ), g • Γ₁ = Γ₂ := sorry

/-- `README.md`, Layer 1, 1.2. Every connected triple with `σ0 ^ 3 = σ1 ^ 2 = 1` is a modular
triple. -/
theorem exists_modularTriple_equivalent (t : PermutationTriple n) (ht : t.IsConnected)
    (h0 : t.σ0 ^ 3 = 1) (h1 : t.σ1 ^ 2 = 1) :
    ∃ (Γ'' : Subgroup PSL(2, ℤ)) (_ : Γ''.FiniteIndex) (e'' : PSL(2, ℤ) ⧸ Γ'' ≃ Fin n),
      (modularTriple Γ'' e'').Equivalent t := sorry

/-- `README.md`, Layer 1, 1.2. The number of subgroups of index `n` with a given modular triple
class is `n / #Aut`. -/
theorem card_subgroups_of_class :
    Nat.card {Γ'' : Subgroup PSL(2, ℤ) // ∃ e'' : PSL(2, ℤ) ⧸ Γ'' ≃ Fin n,
        (modularTriple Γ'' e'').Equivalent (modularTriple Γ' e)} *
      Nat.card (modularTriple Γ' e).automorphismGroup = n := sorry

end CosetDictionary

/-! ## Layer 2: the invariants read from permutations -/

section Invariants
variable (Γ' : Subgroup PSL(2, ℤ)) {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n)

/-- `README.md`, Layer 2, 2.1. The cusp widths: cycle lengths of `σinf`, fixed points included
as cusps of width `1`. -/
noncomputable def cuspWidths : Multiset ℕ :=
  (permT Γ' e).fullCycleType

/-- `README.md`, Layer 2, 2.1. The number of cusps, Tau Ceti's `orbitCount` of `σinf`. -/
noncomputable def cuspCount : ℕ := orbitCount (permT Γ' e)

/-- `README.md`, Layer 2, 2.1. The cycle of `σinf` through `e ⟦σ̄⁻¹⟧` has length the least
`h > 0` with `σ T^h σ⁻¹ ∈ ±Γ'`: the width of the cusp `σ ∞`. -/
theorem period_permT_coset (σ : SL(2, ℤ)) :
    MulAction.period (permT Γ' e) (e (toPSL σ⁻¹ : PSL(2, ℤ))) =
      sInf {h : ℕ | 0 < h ∧ σ * T ^ h * σ⁻¹ ∈ lift Γ'} := sorry

/-- `README.md`, Layer 2, 2.1. **Cusps are cusp orbits**: the number of cycles of `σinf` is the
number of `±Γ'`-orbits of cusps in Mathlib's sense. -/
theorem cuspCount_eq_card_cuspOrbits :
    cuspCount Γ' e = Nat.card (CuspOrbits ((lift Γ').map (SpecialLinearGroup.mapGL ℝ))) := sorry

/-- `README.md`, Layer 2, 2.2. The number of elliptic points of order two: fixed points of `σ1`. -/
noncomputable def ellipticTwo : ℕ := (Finset.univ.filter fun i ↦ permS Γ' e i = i).card

/-- `README.md`, Layer 2, 2.2. The number of elliptic points of order three: fixed points of
`σ0`. -/
noncomputable def ellipticThree : ℕ :=
  (Finset.univ.filter fun i ↦ (modularTriple Γ' e).σ0 i = i).card

/-- `README.md`, Layer 2, 2.3. The genus, Tau Ceti's genus of the modular triple. -/
noncomputable def genus : ℕ := (modularTriple Γ' e).genus

/-- `README.md`, Layer 2, 2.3. **The genus formula** in integral form
(Diamond–Shurman Theorem 3.1.1, read on the permutations). -/
theorem genus_formula :
    12 * genus Γ' e + 3 * ellipticTwo Γ' e + 4 * ellipticThree Γ' e + 6 * cuspCount Γ' e =
      12 + n := sorry

end Invariants

/-- `README.md`, Layer 2, 2.5. `[PSL₂(ℤ) : Γ̄(N)] = |SL₂(ℤ/N)| / 2` for `N ≥ 3`. -/
theorem index_Gamma_map_toPSL (N : ℕ) (hN : 3 ≤ N) :
    2 * ((Gamma N).map toPSL).index = Nat.card SL(2, ZMod N) := sorry

/-! ## Layer 3: permutation levels -/

/-- The permutation level is the order of cusp monodromy, compared with the geometric level. -/
noncomputable def generalLevel (Γ' : Subgroup PSL(2, ℤ)) {n : ℕ}
    (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n) : ℕ := orderOf (permT Γ' e)

/-- `README.md`, Layer 3, 3.1. The **strict level** of a subgroup of `SL(2, ℤ)`: the least `N > 0`
with `σ T^N σ⁻¹ ∈ Γ` for every `σ`. -/
noncomputable def strictLevel (Γ : Subgroup SL(2, ℤ)) : ℕ :=
  sInf {N : ℕ | 0 < N ∧ ∀ σ : SL(2, ℤ), σ * T ^ N * σ⁻¹ ∈ Γ}

/-- `README.md`, Layer 3, 3.3. **Wohlfahrt's theorem in strict form**: a finite-index subgroup
of `SL(2, ℤ)`, whether or not it contains `−1`, is a congruence subgroup iff it contains the
principal congruence subgroup of its strict level (Kiming–Schütt–Verrill's matrix reduction
with the strict translations; Wohlfahrt's theorem when `−1 ∈ Γ`). Finite index makes
`strictLevel Γ` positive, which the backward direction needs. -/
theorem wohlfahrt_strict (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] :
    IsCongruenceSubgroup Γ ↔ Gamma (strictLevel Γ) ≤ Γ := sorry

/-- `README.md`, Layer 3, 3.5. **The composition-factor obstruction**: when `±Γ'` is congruence,
every nonabelian simple composition factor `H ⧸ K` of the monodromy group (`H` subnormal, `K`
normal in `H`) is `PSL₂(𝔽_ℓ)` for a prime `ℓ ≥ 5` dividing the level. -/
theorem compositionFactor_of_isCongruenceSubgroup
    (Γ' : Subgroup PSL(2, ℤ)) {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n) (h : IsCongruenceSubgroup (lift Γ'))
    {H K : Subgroup (modularTriple Γ' e).monodromyGroup} (hH : H.IsSubnormal) (hKH : K ≤ H)
    [(K.subgroupOf H).Normal] [IsSimpleGroup (H ⧸ K.subgroupOf H)]
    (hnc : ¬ IsMulCommutative (H ⧸ K.subgroupOf H)) :
    ∃ ℓ : ℕ, ℓ.Prime ∧ 5 ≤ ℓ ∧ ℓ ∣ generalLevel Γ' e ∧
      Nonempty ((H ⧸ K.subgroupOf H) ≃* PSL(2, ZMod ℓ)) := sorry


/-! ## Layer 4: Hsu's relation criterion -/

section Hsu
variable {n : ℕ}

/-- Hsu's three sets of relations. Inverses are taken in ZMod and mixed exponents
are CRT residues; N is positive in both headline applications. -/
noncomputable def hsuTest (L RH : Perm (Fin n)) (N : ℕ) : Prop :=
  let e := 2 ^ N.factorization 2
  let m := N / e
  if e = 1 then
    (RH ^ 2 * (L ^ ((2 : ZMod N)⁻¹).val)⁻¹) ^ 3 = 1
  else if m = 1 then
    let SH := L ^ 20 * RH ^ ((5 : ZMod N)⁻¹).val * (L ^ 4)⁻¹ * RH⁻¹
    let X := L * RH⁻¹ * L
    X⁻¹ * SH * X * SH = 1 ∧ SH⁻¹ * RH * SH = RH ^ 25 ∧ (SH * RH ^ 5 * X) ^ 3 = X ^ 2
  else
    let c := e * ((e : ZMod m)⁻¹).val
    let d := m * ((m : ZMod e)⁻¹).val
    let a := L ^ c
    let b := RH ^ c
    let l := L ^ d
    let r := RH ^ d
    let s := l ^ 20 * r ^ ((5 : ZMod e)⁻¹).val * (l ^ 4)⁻¹ * r⁻¹
    let Y := l * r⁻¹ * l
    a⁻¹ * r⁻¹ * a * r = 1 ∧ (a * b⁻¹ * a) ^ 4 = 1 ∧
      (a * b⁻¹ * a) ^ 2 * (a⁻¹ * b) ^ 3 = 1 ∧
      (a * b⁻¹ * a) ^ 2 = (b ^ 2 * (a ^ ((2 : ZMod m)⁻¹).val)⁻¹) ^ 3 ∧
      Y⁻¹ * s * Y * s = 1 ∧ s⁻¹ * r * s = r ^ 25 ∧ Y ^ 2 = (s * r ^ 5 * Y) ^ 3

variable (Γ' : Subgroup PSL(2, ℤ)) [Γ'.FiniteIndex] (e : PSL(2, ℤ) ⧸ Γ' ≃ Fin n)

/-- `README.md`, Layer 4, 4.2. **Hsu's theorem**: `±Γ'` is a congruence subgroup iff its
permutations pass the test at its level. -/
theorem hsu :
    IsCongruenceSubgroup (lift Γ') ↔
      hsuTest (permT Γ' e) ((modularTriple Γ' e).σ0 * permS Γ' e) (generalLevel Γ' e) :=
  sorry

/-- `README.md`, Layer 4, 4.4. **Subgroups not containing `−1`** (Hamilton–Loeffler): the test
applies, with its relations unchanged, at the even modulus `2 · strictLevel Γ` to the
permutations of `T` and `S⁻¹ T⁻¹ S` on `SL(2, ℤ) ⧸ Γ`. At the strict level itself the statement
is false when that level is odd (`Γ₁(5)`), because Hsu's odd-modulus relation is a relator of
`SL₂(ℤ/N)/⟨−I⟩` only. -/
theorem hsu_strict (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] (f : SL(2, ℤ) ⧸ Γ ≃ Fin n) :
    IsCongruenceSubgroup Γ ↔
      hsuTest (Equiv.permutationRepresentation (G := SL(2, ℤ)) f T)
        (Equiv.permutationRepresentation (G := SL(2, ℤ)) f (S⁻¹ * T⁻¹ * S))
        (2 * strictLevel Γ) := sorry

end Hsu

/-! ## Layer 5: admissible Farey symbols -/

/-- `README.md`, Layer 5, 5.1. The label of a side of a Farey symbol. -/
inductive SideLabel
  | even
  | odd
  | free (j : ℕ)
  deriving DecidableEq, Repr

/-- `README.md`, Layer 5, 5.1. **A Farey symbol**: reduced fractions `x_0 < ⋯ < x_m` with
`x_0`, `x_m` integers (unimodularity with the ends `−∞ = (−1)/0` and `∞ = 1/0`), consecutive
terms unimodular, and a label on each of the `m + 2` sides, every free label occurring exactly
twice. -/
structure FareySymbol where
  /-- The fractions `x_0 < ⋯ < x_m`. -/
  xs : List ℚ
  /-- The labels of the sides `(x_{i−1}, x_i)`, `0 ≤ i ≤ m + 1`. -/
  labels : List SideLabel
  ne_nil : xs ≠ []
  labels_length : labels.length = xs.length + 1
  sorted : xs.Pairwise (· < ·)
  head_den : (xs.head ne_nil).den = 1
  last_den : (xs.getLast ne_nil).den = 1
  unimodular : ∀ (i : ℕ) (h : i + 1 < xs.length),
    (xs[i + 1]'h).num * (xs[i]'(by omega)).den - (xs[i]'(by omega)).num * (xs[i + 1]'h).den = 1
  nondegenerate : 1 < xs.length ∨ SideLabel.odd ∈ labels
  free_twice : ∀ j, labels.count (.free j) = 0 ∨ labels.count (.free j) = 2

namespace FareySymbol

/-- `README.md`, Layer 5, 5.1. The number `e₂` of even sides. -/
def evenCount (F : FareySymbol) : ℕ := F.labels.count .even

/-- `README.md`, Layer 5, 5.1. The number `e₃` of odd sides. -/
def oddCount (F : FareySymbol) : ℕ := F.labels.count .odd

/-- `README.md`, Layer 5, 5.1. The number `r` of free pairs. -/
def freePairs (F : FareySymbol) : ℕ := (F.labels.filter fun l ↦ l matches .free _).length / 2

/-- `README.md`, Layer 5, 5.2. The even generator of a side `(a/b, c/d)`:
`M S M⁻¹` for `M = !![a, c; b, d]`. -/
def evenGenerator (a b c d : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![-(a * b + c * d), a ^ 2 + c ^ 2; -(b ^ 2 + d ^ 2), a * b + c * d]

/-- `README.md`, Layer 5, 5.2. The odd generator of a side `(a/b, c/d)`:
`M !![1, -1; 1, 0] M⁻¹`. -/
def oddGenerator (a b c d : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![-(a * b + a * d + c * d), a ^ 2 + a * c + c ^ 2;
     -(b ^ 2 + b * d + d ^ 2), a * b + b * c + c * d]

/-- `README.md`, Layer 5, 5.2. The generator pairing the free sides `(a/b, c/d)` and
`(a'/b', c'/d')`: `M' S M⁻¹`. -/
def freeGenerator (a b c d a' b' c' d' : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![-(a' * b + c' * d), a * a' + c * c'; -(b * b' + d * d'), a * b' + c * d']

/-- Homogeneous endpoints, with the two signed representatives of infinity. -/
def endpoints (F : FareySymbol) : List (ℤ × ℤ) :=
  [(-1, 0)] ++ F.xs.map (fun x ↦ (x.num, (x.den : ℤ))) ++ [(1, 0)]

/-- The subgroup generated by the side matrices, projected to PSL₂(ℤ).
The matrix equality selects actual determinant-one matrices, not arbitrary generators. -/
def group (F : FareySymbol) : Subgroup PSL(2, ℤ) :=
  Subgroup.closure (toPSL '' {g : SL(2, ℤ) | ∃ i : Fin F.labels.length,
    let a := F.endpoints[i.val]!
    let b := F.endpoints[i.val + 1]!
    (F.labels[i] = .even ∧ (g : Matrix (Fin 2) (Fin 2) ℤ) =
      evenGenerator a.1 a.2 b.1 b.2) ∨
    (F.labels[i] = .odd ∧ (g : Matrix (Fin 2) (Fin 2) ℤ) =
      oddGenerator a.1 a.2 b.1 b.2) ∨
    (∃ j : Fin F.labels.length, ∃ l : ℕ, i ≠ j ∧
      F.labels[i] = .free l ∧ F.labels[j] = .free l ∧
      (g : Matrix (Fin 2) (Fin 2) ℤ) =
        freeGenerator a.1 a.2 b.1 b.2
          (F.endpoints[j.val]!).1 (F.endpoints[j.val]!).2
          (F.endpoints[j.val + 1]!).1 (F.endpoints[j.val + 1]!).2)})

/-- Every nondegenerate Farey symbol generates a finite-index modular subgroup. -/
theorem group_finiteIndex (F : FareySymbol) : F.group.FiniteIndex := sorry

/-- Kulkarni's realization theorem: every finite-index projective modular subgroup
is generated by the sides of an admissible Farey symbol. -/
theorem exists_group_eq (Γ' : Subgroup PSL(2, ℤ)) [Γ'.FiniteIndex] :
    ∃ F : FareySymbol, F.group = Γ' := sorry

/-- The special polygon's area computes the index, including singleton symbols. -/
theorem group_index (F : FareySymbol) :
    F.group.index + 6 = 6 * F.freePairs + 3 * F.evenCount + 4 * F.oddCount := sorry

end FareySymbol

/-! ## Layer 7: modular forms on finite-index subgroups -/

section Forms
variable (Γ : Subgroup SL(2, ℤ)) [hΓfinite : Γ.FiniteIndex] (k : ℤ)
include hΓfinite

/-- `README.md`, Layer 7, 7.2. **The expansion at the cusp `σ ∞`**: the `q`-expansion at `∞`, in
the strict width of the conjugate `σ⁻¹ Γ σ`, of `f ∣[k] σ` (Mathlib's `ModularForm.translate`). -/
noncomputable def cuspExpansion (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) (σ : SL(2, ℤ)) :
    PowerSeries ℂ :=
  qExpansion (ConjAct.toConjAct (SpecialLinearGroup.mapGL ℝ σ)⁻¹ •
      Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty
    (ModularForm.translate f (SpecialLinearGroup.mapGL ℝ σ))

/-- `README.md`, Layer 7, 7.3. **The dimension of `S_k(Γ)`** for even `k ≥ 4` and every
finite-index `Γ` (ModularForms Layer 10C's argument, run here at finite index), on the invariants
of Layer 2. -/
theorem finrank_cuspForm {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) (hk : Even k) (hk4 : 4 ≤ k) :
    (Module.finrank ℂ (CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) : ℤ) =
      (k - 1) * (genus (Γ.map toPSL) e - 1) + (k / 4) * ellipticTwo (Γ.map toPSL) e +
        (k / 3) * ellipticThree (Γ.map toPSL) e + (k / 2 - 1) * cuspCount (Γ.map toPSL) e := sorry

/-- `README.md`, Layer 7, 7.3. **The dimension of `M_k(Γ)`** for even `k ≥ 2`. -/
theorem finrank_modularForm {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) (hk : Even k)
    (hk2 : 2 ≤ k) :
    (Module.finrank ℂ (ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) : ℤ) =
      (k - 1) * (genus (Γ.map toPSL) e - 1) + (k / 4) * ellipticTwo (Γ.map toPSL) e +
        (k / 3) * ellipticThree (Γ.map toPSL) e + (k / 2) * cuspCount (Γ.map toPSL) e := sorry

/-- `README.md`, Layer 7, 7.3. `dim S_2(Γ) = g`. -/
theorem finrank_cuspForm_two {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) :
    Module.finrank ℂ (CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) 2) = genus (Γ.map toPSL) e := sorry

/-- The number of regular cusp orbits, using the integral scaling at each rational cusp. -/
noncomputable def regularCuspCount (Γ : Subgroup SL(2, ℤ)) [Γ.FiniteIndex] : ℕ :=
  Nat.card {c : CuspOrbits (Γ.map (SpecialLinearGroup.mapGL ℝ)) //
    ∃ σ : SL(2, ℤ),
      cosetToCuspOrbit (Γ.map (SpecialLinearGroup.mapGL ℝ)) ⟦σ⁻¹⟧ = c ∧
      (ConjAct.toConjAct (SpecialLinearGroup.mapGL ℝ σ)⁻¹ •
        Γ.map (SpecialLinearGroup.mapGL ℝ)).IsRegularAtInfty}

/-- Odd-weight dimensions, with the half-integral cusp contributions expressed
by doubling the equality; no regular-cusp contribution is rounded down. -/
theorem finrank_odd (hneg : (-1 : SL(2, ℤ)) ∉ Γ) (hk : Odd k) (hk3 : 3 ≤ k)
    {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) :
    let r : ℤ := regularCuspCount Γ
    let c : ℤ := cuspCount (Γ.map toPSL) e
    let a : ℤ := (k - 1) * ((genus (Γ.map toPSL) e : ℤ) - 1) +
      (k / 3) * ellipticThree (Γ.map toPSL) e
    2 * (Module.finrank ℂ (ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) : ℤ) =
      2 * a + k * r + (k - 1) * (c - r) ∧
    2 * (Module.finrank ℂ (CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) : ℤ) =
      2 * a + (k - 2) * r + (k - 1) * (c - r) := sorry

/-- In weight one, the Eisenstein difference is half the regular cusp count;
when that count exceeds 2g−2 there are no cusp forms, and otherwise Clifford gives the stated bound. -/
theorem finrank_one (hneg : (-1 : SL(2, ℤ)) ∉ Γ)
    {n : ℕ} (e : PSL(2, ℤ) ⧸ Γ.map toPSL ≃ Fin n) :
    2 * ((Module.finrank ℂ (ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) 1) : ℤ) -
      Module.finrank ℂ (CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) 1)) = regularCuspCount Γ ∧
    ((2 * (genus (Γ.map toPSL) e : ℤ) - 2 < regularCuspCount Γ) →
      Module.finrank ℂ (CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) 1) = 0) ∧
    ((regularCuspCount Γ : ℤ) ≤ 2 * (genus (Γ.map toPSL) e : ℤ) - 2 →
      4 * (Module.finrank ℂ (CuspForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) 1) : ℤ) ≤
        2 * (genus (Γ.map toPSL) e : ℤ) + 2 - regularCuspCount Γ) := sorry

/-- The congruence closure is the intersection of all congruence overgroups. -/
def congruenceClosure (Γ : Subgroup SL(2, ℤ)) : Subgroup SL(2, ℤ) :=
  sInf {Δ | IsCongruenceSubgroup Δ ∧ Γ ≤ Δ}

/-- Berger's factorization: the double-coset operator at a prime away from the
strict level is the congruence-closure operator applied to the unnormalized trace.
The representatives enumerate right cosets of Γ in its actual congruence closure. -/
theorem berger {ι : Type*} [Fintype ι] (a : ι → SL(2, ℤ))
    (hcover : (congruenceClosure Γ : Set SL(2, ℤ)) =
      ⋃ i, MulOpposite.op (a i) • (Γ : Set SL(2, ℤ)))
    (hinj : Function.Injective fun i ↦ MulOpposite.op (a i) • (Γ : Set SL(2, ℤ)))
    (p : ℕ) (hp : p.Prime) (hlevel : ¬ p ∣ strictLevel Γ)
    (α : GL (Fin 2) ℚ) (hα : (α : Matrix (Fin 2) (Fin 2) ℚ) = !![1, 0; 0, (p : ℚ)])
    {Δ : Submonoid (GL (Fin 2) ℚ)}
    (D : HeckeCoset Δ (Γ.map (SpecialLinearGroup.mapGL ℚ))
      (Γ.map (SpecialLinearGroup.mapGL ℚ)))
    (Dc : HeckeCoset Δ ((congruenceClosure Γ).map (SpecialLinearGroup.mapGL ℚ))
      ((congruenceClosure Γ).map (SpecialLinearGroup.mapGL ℚ)))
    (hDset : D.toSet = DoubleCoset.doubleCoset α (Γ.map (SpecialLinearGroup.mapGL ℚ))
      (Γ.map (SpecialLinearGroup.mapGL ℚ)))
    (hDcset : Dc.toSet = DoubleCoset.doubleCoset α
      ((congruenceClosure Γ).map (SpecialLinearGroup.mapGL ℚ))
      ((congruenceClosure Γ).map (SpecialLinearGroup.mapGL ℚ)))
    [Finite (DoubleCoset.DecompQuotient (Γ.map (SpecialLinearGroup.mapGL ℚ))
      (Γ.map (SpecialLinearGroup.mapGL ℚ)) (D.out : GL (Fin 2) ℚ)⁻¹)]
    [Finite (DoubleCoset.DecompQuotient ((congruenceClosure Γ).map (SpecialLinearGroup.mapGL ℚ))
      ((congruenceClosure Γ).map (SpecialLinearGroup.mapGL ℚ)) (Dc.out : GL (Fin 2) ℚ)⁻¹)]
    [((congruenceClosure Γ).map (SpecialLinearGroup.mapGL ℝ)).IsArithmetic]
    (hD : (D.out : GL (Fin 2) ℚ) ∈ Matrix.GLPos (Fin 2) ℚ)
    (hDc : (Dc.out : GL (Fin 2) ℚ) ∈ Matrix.GLPos (Fin 2) ℚ)
    (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) :
    ∃ g : ModularForm ((congruenceClosure Γ).map (SpecialLinearGroup.mapGL ℝ)) k,
      (⇑g : ℍ → ℂ) = ∑ i, ((⇑f : ℍ → ℂ) ∣[k] (SpecialLinearGroup.mapGL ℝ (a i))) ∧
      (⇑(HeckeRing.GL2.heckeSlashModularFormEnd k D hD f) : ℍ → ℂ) =
        ⇑(HeckeRing.GL2.heckeSlashModularFormEnd k Dc hDc g) := sorry

/-- `README.md`, Layer 7, 7.5. **Algebraic coefficients**: a basis of `M_k(Γ)` whose expansions
at every cusp have coefficients in a number field. -/
theorem exists_basis_coeff_mem_numberField :
    ∃ (K : IntermediateField ℚ ℂ) (_ : FiniteDimensional ℚ K) (ι : Type)
      (b : Module.Basis ι ℂ (ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k)),
      ∀ i (σ : SL(2, ℤ)) (m : ℕ), PowerSeries.coeff m (cuspExpansion Γ k (b i) σ) ∈ K := sorry

end Forms

/-! ## Layer 8: denominator transport -/

section Denominators
variable (Γ : Subgroup SL(2, ℤ)) [hΓfinite : Γ.FiniteIndex] (k : ℤ)
include hΓfinite

/-- `README.md`, Layer 8, 8.1. **Bounded denominators for congruence forms** with coefficients
in a number field `K`. The rational case is AlgebraicModularFormsAndSerreWeights §2.9's
`TauCetiRoadmap.AlgebraicModularFormsAndSerreWeights.KatzModularForms.boundedDenominators`, consumed and not restated here. -/
theorem exists_bounded_denominators_numberField (hΓ : IsCongruenceSubgroup Γ)
    (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K]
    (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k)
    (hf : ∀ m, PowerSeries.coeff m (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f) ∈ K) :
    ∃ D : ℕ, D ≠ 0 ∧ ∀ m, ∃ z : NumberField.RingOfIntegers K,
      (D : ℂ) * PowerSeries.coeff m (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f) = z := sorry

/-- `README.md`, Layer 8, 8.2. **The unbounded-denominators theorem** (Calegari–Dimitrov–Tang,
Theorem 1.0.1), transported from ModularFormsPartII W6.4: a form on a finite-index subgroup whose coefficients at `∞` have bounded
denominators is a form on a congruence subgroup. -/
theorem unbounded_denominators (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) (D : ℕ) (hD : D ≠ 0)
    (h : ∀ m, ∃ z : ℤ,
      (D : ℂ) * PowerSeries.coeff m (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f) = z) :
    ∃ (Γ₂ : Subgroup SL(2, ℤ)) (_ : IsCongruenceSubgroup Γ₂)
      (g : ModularForm (Γ₂.map (SpecialLinearGroup.mapGL ℝ)) k), ⇑g = ⇑f := sorry

/-- `README.md`, Layer 8, 8.2. The number-field form: coefficients in a number field `K` with
denominators bounded at every place. -/
theorem unbounded_denominators_numberField (K : IntermediateField ℚ ℂ) [FiniteDimensional ℚ K]
    (f : ModularForm (Γ.map (SpecialLinearGroup.mapGL ℝ)) k) (D : NumberField.RingOfIntegers K) (hD : D ≠ 0)
    (h : ∀ m, ∃ z : NumberField.RingOfIntegers K,
      (D : ℂ) * PowerSeries.coeff m (qExpansion (Γ.map (SpecialLinearGroup.mapGL ℝ)).strictWidthInfty f) = z) :
    ∃ (Γ₂ : Subgroup SL(2, ℤ)) (_ : IsCongruenceSubgroup Γ₂)
      (g : ModularForm (Γ₂.map (SpecialLinearGroup.mapGL ℝ)) k), ⇑g = ⇑f := sorry

end Denominators

end TauCetiRoadmap.NoncongruenceModularForms
