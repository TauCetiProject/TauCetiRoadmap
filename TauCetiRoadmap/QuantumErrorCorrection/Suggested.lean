import Mathlib
import TauCeti.InformationTheory.Coding.EuclideanDual
import TauCeti.InformationTheory.Coding.MinimumDistance.Basic

/-!
# Quantum error correction: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's API lists and Checks are not restated.

The state space of `n` qubits is `(Fin n → ZMod 2) → ℂ`, with one basis vector for each
configuration `s : Fin n → ZMod 2`, and operators are matrices indexed by configurations. The
inner product of `ψ` and `φ` is `star ψ ⬝ᵥ φ`, linear in the second argument. A quantum code is
a complex subspace of the state space. The Pauli operator `pauliOp a b`, for `a b : Fin n → ZMod 2`,
is `X(a) Z(b)`: it sends the basis vector of `s` to `(-1)^(b ⬝ᵥ s)` times the basis vector of
`s + a`. The Pauli group consists of the operators `c • pauliOp a b` with `c ^ 4 = 1`. Binary
linear codes are Tau Ceti's linear codes over `ZMod 2`, with Tau Ceti's Euclidean dual and minimum
distance.
-/

noncomputable section

open Matrix Module

namespace TauCetiRoadmap.QuantumErrorCorrection

/-! ## Layer 1: Pauli operators and the symplectic form -/

section Pauli

variable {n : ℕ}

/-- 1.1 The Pauli operator `X(a) Z(b)` on `n` qubits: its entry in row `s` and column `t` is
`(-1)^(b ⬝ᵥ t)` when `s = t + a` and `0` otherwise. -/
def pauliOp (a b : Fin n → ZMod 2) : Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ :=
  fun s t => if s = t + a then (-1) ^ (b ⬝ᵥ t).val else 0

/-- 1.1 The product rule: `X(a) Z(b) X(a') Z(b') = (-1)^(b ⬝ᵥ a') X(a + a') Z(b + b')`. -/
theorem pauliOp_mul_pauliOp (a b a' b' : Fin n → ZMod 2) :
    pauliOp a b * pauliOp a' b' = (-1 : ℂ) ^ (b ⬝ᵥ a').val • pauliOp (a + a') (b + b') := by
  sorry

/-- 1.2 The symplectic form on `𝔽₂^n × 𝔽₂^n`: `ω((a, b), (a', b')) = a ⬝ᵥ b' + b ⬝ᵥ a'`. -/
def symplecticForm (u v : (Fin n → ZMod 2) × (Fin n → ZMod 2)) : ZMod 2 :=
  u.1 ⬝ᵥ v.2 + u.2 ⬝ᵥ v.1

/-- 1.2 Two Pauli operators commute if and only if their symplectic form vanishes. -/
theorem commute_pauliOp_iff (u v : (Fin n → ZMod 2) × (Fin n → ZMod 2)) :
    Commute (pauliOp u.1 u.2) (pauliOp v.1 v.2) ↔ symplecticForm u v = 0 := by
  sorry

/-- 1.3 The `4 ^ n` Pauli operators form a basis of the space of operators on `n` qubits. -/
theorem linearIndependent_pauliOp_and_span_eq_top :
    LinearIndependent ℂ (fun v : (Fin n → ZMod 2) × (Fin n → ZMod 2) ↦ pauliOp v.1 v.2) ∧
      Submodule.span ℂ (Set.range fun v : (Fin n → ZMod 2) × (Fin n → ZMod 2) ↦
        pauliOp v.1 v.2) = ⊤ := by
  sorry

/-- 1.4 The weight of `X(a) Z(b)`: the number of qubits `i` with `a i ≠ 0` or `b i ≠ 0`. -/
def pauliWeight (a b : Fin n → ZMod 2) : ℕ :=
  (Finset.univ.filter fun i ↦ a i ≠ 0 ∨ b i ≠ 0).card

end Pauli

/-! ## Layer 2: detection, correction and the Knill–Laflamme conditions -/

section KnillLaflamme

variable {ι κ : Type*} [Fintype ι] [DecidableEq ι]

/-- 2.1 An operator `E` is detectable by the code `Q` when `P E P = c P` for the orthogonal
projection `P` onto `Q`, written without the projection: `⟨ψ, E φ⟩ = c ⟨ψ, φ⟩` on `Q`. -/
def IsDetectable (Q : Submodule ℂ (ι → ℂ)) (E : Matrix ι ι ℂ) : Prop :=
  ∃ c : ℂ, ∀ ψ ∈ Q, ∀ φ ∈ Q, star ψ ⬝ᵥ (E *ᵥ φ) = c * (star ψ ⬝ᵥ φ)

/-- 2.1 A family of errors `E` is correctable on `Q` when some finite family of operators `R r`
with `∑ r, (R r)ᴴ * R r = 1` (the Kraus operators of a recovery channel) makes every `R r * E k`
act on `Q` as a scalar. -/
def IsCorrectable (Q : Submodule ℂ (ι → ℂ)) (E : κ → Matrix ι ι ℂ) : Prop :=
  ∃ (m : ℕ) (R : Fin m → Matrix ι ι ℂ) (l : Fin m → κ → ℂ),
    ∑ r, (R r)ᴴ * R r = 1 ∧ ∀ r k, ∀ ψ ∈ Q, R r *ᵥ (E k *ᵥ ψ) = l r k • ψ

/-- 2.2 The Knill–Laflamme theorem: a family of errors is correctable on `Q` if and only if
`P (E k)ᴴ (E l) P = c k l • P` for some scalars `c k l`. -/
theorem isCorrectable_iff (Q : Submodule ℂ (ι → ℂ)) (E : κ → Matrix ι ι ℂ) :
    IsCorrectable Q E ↔ ∃ c : κ → κ → ℂ, ∀ k l, ∀ ψ ∈ Q, ∀ φ ∈ Q,
      star (E k *ᵥ ψ) ⬝ᵥ (E l *ᵥ φ) = c k l * (star ψ ⬝ᵥ φ) := by
  sorry

end KnillLaflamme

section Distance

variable {n : ℕ}

/-- 2.3 The code `Q` detects every Pauli error of weight at most `t`; a code has distance at
least `d` when it detects every Pauli error of weight at most `d - 1`. -/
def DetectsUpTo (Q : Submodule ℂ ((Fin n → ZMod 2) → ℂ)) (t : ℕ) : Prop :=
  ∀ a b : Fin n → ZMod 2, pauliWeight a b ≤ t → IsDetectable Q (pauliOp a b)

/-- 2.3 A code corrects all Pauli errors of weight at most `t` if and only if it detects all Pauli
errors of weight at most `2 t`. -/
theorem isCorrectable_pauliOp_iff (Q : Submodule ℂ ((Fin n → ZMod 2) → ℂ)) (t : ℕ) :
    IsCorrectable Q
        (fun v : {v : (Fin n → ZMod 2) × (Fin n → ZMod 2) // pauliWeight v.1 v.2 ≤ t} ↦
          pauliOp v.1.1 v.1.2) ↔
      DetectsUpTo Q (2 * t) := by
  sorry

end Distance

/-! ## Layer 3: stabilizer codes -/

section Stabilizer

variable {n : ℕ}

/-- 3.1 A stabilizer group: a subgroup of the invertible operators on `n` qubits all of whose
elements lie in the Pauli group, that is, are `c • pauliOp a b` with `c ^ 4 = 1`, and which does
not contain `-1`. -/
def IsStabilizerGroup (G : Subgroup (Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ)ˣ) : Prop :=
  (∀ g ∈ G, ∃ c : ℂ, c ^ 4 = 1 ∧
      ∃ a b : Fin n → ZMod 2, (g : Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ) = c • pauliOp a b) ∧
    (-1) ∉ G

/-- 3.1 The stabilizer code of `G`: the vectors fixed by every element of `G`. -/
def stabilizerCode (G : Subgroup (Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ)ˣ) :
    Submodule ℂ ((Fin n → ZMod 2) → ℂ) :=
  ⨅ g ∈ G, LinearMap.ker
    ((g : Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ).mulVecLin - LinearMap.id)

/-- 3.1 The dimension of a stabilizer code: `dim Q · |G| = 2 ^ n`. -/
theorem finrank_stabilizerCode_mul_natCard
    {G : Subgroup (Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ)ˣ} (hG : IsStabilizerGroup G) :
    finrank ℂ (stabilizerCode G) * Nat.card G = 2 ^ n := by
  sorry

/-- 3.2 A subspace of `𝔽₂^n × 𝔽₂^n` is isotropic when the symplectic form vanishes on it. -/
def IsIsotropic (V : Submodule (ZMod 2) ((Fin n → ZMod 2) × (Fin n → ZMod 2))) : Prop :=
  ∀ u ∈ V, ∀ v ∈ V, symplecticForm u v = 0

/-- 3.2 `V` is the symplectic image of `G`: every element of `G` is a scalar multiple of
`pauliOp v.1 v.2` for some `v ∈ V`, and every `v ∈ V` arises in this way. -/
def IsSymplecticImage (G : Subgroup (Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ)ˣ)
    (V : Submodule (ZMod 2) ((Fin n → ZMod 2) × (Fin n → ZMod 2))) : Prop :=
  (∀ g ∈ G, ∃ c : ℂ, ∃ v ∈ V,
      (g : Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ) = c • pauliOp v.1 v.2) ∧
    ∀ v ∈ V, ∃ g ∈ G, ∃ c : ℂ,
      (g : Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ) = c • pauliOp v.1 v.2

/-- 3.2 The symplectic image of a stabilizer group is an isotropic subspace with as many elements
as the group. -/
theorem exists_isIsotropic_of_isStabilizerGroup
    {G : Subgroup (Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ)ˣ} (hG : IsStabilizerGroup G) :
    ∃ V : Submodule (ZMod 2) ((Fin n → ZMod 2) × (Fin n → ZMod 2)),
      IsIsotropic V ∧ IsSymplecticImage G V ∧ Nat.card G = 2 ^ finrank (ZMod 2) V := by
  sorry

/-- 3.2 Every isotropic subspace `V` is the symplectic image of a stabilizer group, whose code has
dimension `2 ^ (n - dim V)`. -/
theorem exists_isStabilizerGroup_of_isIsotropic
    {V : Submodule (ZMod 2) ((Fin n → ZMod 2) × (Fin n → ZMod 2))} (hV : IsIsotropic V) :
    ∃ G : Subgroup (Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ)ˣ,
      IsStabilizerGroup G ∧ IsSymplecticImage G V ∧
        finrank ℂ (stabilizerCode G) * 2 ^ finrank (ZMod 2) V = 2 ^ n := by
  sorry

/-- 3.3 A Pauli error is detectable by a stabilizer code if and only if a scalar multiple of it
lies in `G` or it fails to commute with some element of `G`. -/
theorem isDetectable_stabilizerCode_iff
    {G : Subgroup (Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ)ˣ} (hG : IsStabilizerGroup G)
    (a b : Fin n → ZMod 2) :
    IsDetectable (stabilizerCode G) (pauliOp a b) ↔
      (∃ g ∈ G, ∃ c : ℂ, (g : Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ) = c • pauliOp a b) ∨
        ∃ g ∈ G, ¬ Commute (g : Matrix (Fin n → ZMod 2) (Fin n → ZMod 2) ℂ) (pauliOp a b) := by
  sorry

end Stabilizer

/-! ## Layer 4: CSS codes -/

section CSS

variable {n : ℕ}

/-- 4.1 The CSS code of two binary linear codes `C₁` and `C₂`: the vectors fixed by `X(a)` for
every `a` in the dual of `C₂` and by `Z(b)` for every `b` in the dual of `C₁`. -/
def cssCode (C₁ C₂ : Submodule (ZMod 2) (Fin n → ZMod 2)) :
    Submodule ℂ ((Fin n → ZMod 2) → ℂ) :=
  (⨅ a ∈ C₂.euclideanDual, LinearMap.ker ((pauliOp a 0).mulVecLin - LinearMap.id)) ⊓
    ⨅ b ∈ C₁.euclideanDual, LinearMap.ker ((pauliOp 0 b).mulVecLin - LinearMap.id)

/-- 4.1 The coset state of `v` modulo a binary linear code `D`: the sum of the basis vectors of
the words of `v + D`. -/
def cosetState (D : Submodule (ZMod 2) (Fin n → ZMod 2)) (v : Fin n → ZMod 2) :
    (Fin n → ZMod 2) → ℂ :=
  Set.indicator {s | s - v ∈ D} fun _ ↦ 1

/-- 4.1 If `C₂^⊥ ≤ C₁`, the CSS code is spanned by the coset states of the words of `C₁` modulo
`C₂^⊥`. -/
theorem cssCode_eq_span {C₁ C₂ : Submodule (ZMod 2) (Fin n → ZMod 2)}
    (h : C₂.euclideanDual ≤ C₁) :
    cssCode C₁ C₂ = Submodule.span ℂ (cosetState C₂.euclideanDual '' (C₁ : Set (Fin n → ZMod 2))) := by
  sorry

/-- 4.1 If `C₂^⊥ ≤ C₁`, the CSS code has dimension `2 ^ (k₁ + k₂ - n)`. -/
theorem finrank_cssCode_mul_two_pow {C₁ C₂ : Submodule (ZMod 2) (Fin n → ZMod 2)}
    (h : C₂.euclideanDual ≤ C₁) :
    finrank ℂ (cssCode C₁ C₂) * 2 ^ n = 2 ^ (finrank (ZMod 2) C₁ + finrank (ZMod 2) C₂) := by
  sorry

/-- 4.2 The CSS code detects every Pauli error of weight below both minimum distances. -/
theorem detectsUpTo_cssCode (C₁ C₂ : Submodule (ZMod 2) (Fin n → ZMod 2)) {t : ℕ}
    (h₁ : t < (C₁ : Set (Fin n → ZMod 2)).hammingMinDist)
    (h₂ : t < (C₂ : Set (Fin n → ZMod 2)).hammingMinDist) :
    DetectsUpTo (cssCode C₁ C₂) t := by
  sorry

end CSS

/-! ## Layer 5: the quantum Hamming and Singleton bounds -/

section Bounds

variable {n : ℕ}

/-- 5.1 The code `Q` is nondegenerate for the Pauli errors of weight at most `t` when the vectors
`pauliOp a b *ᵥ ψ`, for these errors and `ψ ∈ Q`, are linearly independent in the strong sense
that a sum of them, one from each translate of `Q`, vanishes only when every term is zero. -/
def IsNondegenerate (Q : Submodule ℂ ((Fin n → ZMod 2) → ℂ)) (t : ℕ) : Prop :=
  ∀ ψ : (Fin n → ZMod 2) × (Fin n → ZMod 2) → (Fin n → ZMod 2) → ℂ, (∀ v, ψ v ∈ Q) →
    ∑ v ∈ Finset.univ.filter (fun v : (Fin n → ZMod 2) × (Fin n → ZMod 2) ↦
        pauliWeight v.1 v.2 ≤ t), pauliOp v.1 v.2 *ᵥ ψ v = 0 →
      ∀ v : (Fin n → ZMod 2) × (Fin n → ZMod 2), pauliWeight v.1 v.2 ≤ t → ψ v = 0

/-- 5.1 The quantum Hamming bound for nondegenerate codes:
`dim Q · ∑_{j ≤ t} (n choose j) 3 ^ j ≤ 2 ^ n`. -/
theorem finrank_mul_sum_le_of_isNondegenerate {Q : Submodule ℂ ((Fin n → ZMod 2) → ℂ)} {t : ℕ}
    (hQ : IsNondegenerate Q t) :
    finrank ℂ Q * ∑ j ∈ Finset.range (t + 1), n.choose j * 3 ^ j ≤ 2 ^ n := by
  sorry

/-- 5.2 The quantum Singleton bound: a code of dimension at least `2` that detects every Pauli
error of weight at most `t` has `dim Q · 4 ^ t ≤ 2 ^ n`, that is, `n - k ≥ 2 t`. -/
theorem finrank_mul_four_pow_le {Q : Submodule ℂ ((Fin n → ZMod 2) → ℂ)} {t : ℕ}
    (hK : 2 ≤ finrank ℂ Q) (hQ : DetectsUpTo Q t) :
    finrank ℂ Q * 4 ^ t ≤ 2 ^ n := by
  sorry

end Bounds

end TauCetiRoadmap.QuantumErrorCorrection
