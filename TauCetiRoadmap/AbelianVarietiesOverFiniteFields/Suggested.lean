module

public import Mathlib
public import TauCeti.AlgebraicGeometry.EllipticCurve.PointCount

/-!
# Abelian varieties over finite fields: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned APIs, with proofs left as `sorry`.

The statable headlines are Waterhouse's existence classification of elliptic Frobenius traces
(Layer 4), the local criterion for weak equivalence, the Gorenstein ideal criterion, and finiteness
of the Picard group for orders in finite étale rational algebras (Layer 8).

The Frobenius point-count and endomorphism-field theorems (Layers 1–7) lack an abelian-variety
Frobenius and its characteristic-polynomial API at the pins. The geometric decomposition and
Honda–Tate applications additionally lack the simple-isogeny-class carrier. Deligne's ordinary
equivalence lacks canonical lifts and their integral homology functor; the Centeleghe–Stix
anti-equivalence lacks its representing abelian varieties and category functor (Layer 9).
The polarization comparisons and principal-polarizability criteria lack the dual-abelian-variety
and polarization carriers; the Howe–Nart–Ritzenthaler classification and curve-count finiteness
also lack the curve-to-Jacobian functor (Layer 10). The intrinsic label classification (Layer 11)
lacks the Frobenius polynomial. None is replaced here by an arbitrary polynomial or a free
predicate standing for the missing geometry.
-/

public section

universe u v

namespace TauCetiRoadmap.AbelianVarietiesOverFiniteFields

/-! ## Layer 4: Waterhouse's elliptic list -/

/-- Over a finite field of cardinality `p ^ r`, an integer is an elliptic Frobenius trace
exactly in the five cases of Waterhouse, Theorem 4.1, pp. 536–538. -/
theorem waterhouse (K : Type u) [Field K] [Finite K] (p r : ℕ)
    (hp : p.Prime) [CharP K p] (hr : 0 < r) (hq : Nat.card K = p ^ r) (a : ℤ) :
    (∃ W : WeierstrassCurve K, W.IsElliptic ∧ W.frobeniusTrace = a) ↔
      a ^ 2 ≤ 4 * (p : ℤ) ^ r ∧
      (¬ (p : ℤ) ∣ a ∨
       (Even r ∧ a ^ 2 = 4 * (p : ℤ) ^ r) ∨
       (Even r ∧ p % 3 ≠ 1 ∧ a ^ 2 = (p : ℤ) ^ r) ∨
       (Odd r ∧ (p = 2 ∨ p = 3) ∧ a ^ 2 = (p : ℤ) ^ (r + 1)) ∨
       (a = 0 ∧ (Odd r ∨ (Even r ∧ p % 4 ≠ 1)))) := by
  sorry

/-! ## Layer 8: ideal theory of orders in finite étale rational algebras -/

section Orders

variable (E : Type v) [CommRing E] [Algebra ℚ E]
variable (Λ : Subalgebra ℤ E)

/-- `README.md`, Layer 8, 8.1: an order of `E` is a `ℤ`-subalgebra that is a full `ℚ`-lattice
(ClassicalArithmeticCompletion §7.4's `IntegralOrder.IsOrder`, spelled out). -/
def IsOrder (Λ : Subalgebra ℤ E) : Prop :=
  Submodule.IsLattice ℚ (Subalgebra.toSubmodule Λ)

/-- `README.md`, Layer 8, 8.2: a fractional `Λ`-ideal is a `Λ`-submodule of `E` that is a full
`ℚ`-lattice. -/
def IsFractionalIdeal (I : Submodule Λ E) : Prop :=
  Submodule.IsLattice ℚ (I.restrictScalars ℤ)

/-- `README.md`, Layer 8, 8.2: the colon ideal `(I : J) = {x | x J ⊆ I}`. -/
def colon (I J : Submodule Λ E) : Submodule Λ E where
  carrier := {x | ∀ y ∈ J, x * y ∈ I}
  add_mem' ha hb y hy := by rw [add_mul]; exact I.add_mem (ha y hy) (hb y hy)
  zero_mem' y _ := by rw [zero_mul]; exact I.zero_mem
  smul_mem' c x hx y hy := by rw [smul_mul_assoc]; exact I.smul_mem c (hx y hy)

/-- `README.md`, Layer 8, 8.2: the multiplier ring `(I : I)` of a fractional ideal. -/
def multiplierRing (I : Submodule Λ E) : Submodule Λ E :=
  colon E Λ I I

/-- `README.md`, Layer 8, 8.2: `I` is invertible when `I · (Λ : I) = Λ`. -/
def IsInvertible (I : Submodule Λ E) : Prop :=
  I * colon E Λ 1 I = 1

/-- `README.md`, Layer 8, 8.6: weak equivalence is local isomorphism at every maximal ideal
(knowl `av.fq.weak_equivalence_class`). -/
def WeakEquiv (I J : Submodule Λ E) : Prop :=
  ∀ (𝔪 : Ideal Λ) [𝔪.IsMaximal],
    Nonempty (LocalizedModule 𝔪.primeCompl I ≃ₗ[Localization.AtPrime 𝔪] LocalizedModule 𝔪.primeCompl J)

/-- `README.md`, Layer 8, 8.6: the colon criterion for weak equivalence of fractional ideals. -/
theorem weakEquiv_iff_one_mem [Module.Finite ℚ E] [IsReduced E] (hΛ : IsOrder E Λ) {I J : Submodule Λ E} (hI : IsFractionalIdeal E Λ I)
    (hJ : IsFractionalIdeal E Λ J) :
    WeakEquiv E Λ I J ↔ (1 : E) ∈ colon E Λ I J * colon E Λ J I := by
  sorry

/-- `README.md`, Layer 8, 8.4: the trace dual `Λ^∨ = {x | Tr_{E/ℚ}(x Λ) ⊆ ℤ}`. -/
def traceDual [Module.Finite ℚ E] : Submodule Λ E where
  carrier := {x | ∀ y ∈ Λ, ∃ n : ℤ, Algebra.trace ℚ E (x * y) = n}
  add_mem' {a b} ha hb y hy := by
    obtain ⟨m, hm⟩ := ha y hy
    obtain ⟨n, hn⟩ := hb y hy
    exact ⟨m + n, by rw [add_mul, map_add, hm, hn]; push_cast; rfl⟩
  zero_mem' y _ := ⟨0, by simp⟩
  smul_mem' c x hx y hy := by
    obtain ⟨n, hn⟩ := hx _ (Λ.mul_mem c.2 hy)
    refine ⟨n, ?_⟩
    rw [smul_mul_assoc, Subalgebra.smul_def, smul_eq_mul, mul_left_comm]
    exact hn

/-- `README.md`, Layer 8, 8.4: `Λ` is Gorenstein when its trace dual is invertible (Tau Ceti's
`NumberFieldOrder.IsGorenstein` in the field case). -/
def IsGorenstein [Module.Finite ℚ E] : Prop :=
  IsInvertible E Λ (traceDual E Λ)

/-- `README.md`, Layer 8, 8.4: Gorenstein orders are exactly those all of whose fractional ideals
with multiplier ring `Λ` are invertible. -/
theorem isGorenstein_iff_forall_invertible [Module.Finite ℚ E] [IsReduced E] (h : IsOrder E Λ) :
    IsGorenstein E Λ ↔ ∀ I : Submodule Λ E, IsFractionalIdeal E Λ I →
      multiplierRing E Λ I = 1 → IsInvertible E Λ I := by
  sorry

/-- `README.md`, Layer 8, 8.2: an invertible fractional ideal, the carrier of the Picard group. -/
structure InvertibleIdeal where
  /-- The ideal. -/
  I : Submodule Λ E
  /-- It is a full lattice. -/
  isFractionalIdeal : IsFractionalIdeal E Λ I
  /-- It is invertible. -/
  isInvertible : IsInvertible E Λ I

/-- `README.md`, Layer 8, 8.2: two invertible ideals are equivalent when they differ by a unit of
`E`. -/
def picSetoid : Setoid (InvertibleIdeal E Λ) where
  r I J := ∃ x : Eˣ, I.I = J.I.map (LinearMap.mulLeft Λ (x : E))
  iseqv := by
    refine ⟨fun I => ⟨1, ?_⟩, fun {I J} ⟨x, hx⟩ => ⟨x⁻¹, ?_⟩,
      fun {I J K} ⟨x, hx⟩ ⟨y, hy⟩ => ⟨x * y, ?_⟩⟩
    · rw [Units.val_one, LinearMap.mulLeft_one, Submodule.map_id]
    · rw [hx, ← Submodule.map_comp, ← LinearMap.mulLeft_mul, Units.inv_mul,
        LinearMap.mulLeft_one, Submodule.map_id]
    · rw [hx, hy, ← Submodule.map_comp, ← LinearMap.mulLeft_mul, Units.val_mul]

/-- `README.md`, Layer 8, 8.2: the Picard group of an order, invertible fractional ideals modulo
principal ones (knowl `av.fq.picard_group`). Mathlib's `ClassGroup` needs a domain; `E` may be a
product of fields. -/
def Pic : Type v :=
  Quotient (picSetoid E Λ)

/-- `README.md`, Layer 8, 8.2: the Picard group of an order of a reduced `E` is finite. -/
theorem finite_pic [Module.Finite ℚ E] [IsReduced E] (h : IsOrder E Λ) : Finite (Pic E Λ) := by
  sorry

end Orders

end TauCetiRoadmap.AbelianVarietiesOverFiniteFields
