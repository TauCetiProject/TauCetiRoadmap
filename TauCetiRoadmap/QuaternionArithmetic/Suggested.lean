module
import Mathlib
import TauCeti.Algebra.Quaternion.NormForm
import TauCeti.NumberTheory.HilbertSymbol.Basic
import TauCeti.NumberTheory.HilbertSymbol.Archimedean
import TauCeti.NumberTheory.NumberField.Global.Orders.Picard
import TauCeti.NumberTheory.NumberField.Global.Orders.Discriminant

/-!
# Arithmetic of quaternion algebras and Shimura curves: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
arithmetic theorems against the pinned Mathlib and Tau Ceti APIs: the maximality criterion,
unique Gorenstein saturation, the Bass property of Eichler orders, finiteness of ideal classes, Eichler's indefinite
class-number and conjugacy theorems, the normalizer index, the rational mass and class-number
formulas, Deuring's type formula, principal-polarization existence, and the polarized-automorphism classification.
Only native bundles and definitions needed by those statements are included.

The Clifford correspondence cannot be stated here without the ideal-valued ternary quadratic
module and twisted-similarity carrier of README §2.1. The general mass formula requires the
local order residue-algebra/Eichler-symbol carrier of §2.4; the embedding trace formula requires
the completed-order and local optimal-embedding carriers of §§6.2–6.4. Brandt multiplicativity,
trace and theta comparison require the norm-indexed ideal correspondence of §7.1 and its
Brandt module. The Shimura genus and CM-point theorems require the arithmetic subgroup
attached to an order and real splitting (§8.1); the enhanced-curve genus and torsion theorems
require its conjugation action and reduction maps (§9.4). These constructions are README
targets, not arbitrary predicates standing in for them here. The integral torsion and
endomorphism-field comparisons of §§9.7–9.8 additionally require a polarized QM abelian
surface, its geometric endomorphism order and a marked rank-one integral torsion module;
these arithmetic carriers and their compatibility are not supplied by the imported APIs.

The symbol carrier is ℍ[F,a,b], with nonzero parameters. RightIdeal O requires that the
right multiplier order is exactly O. Reduced discriminants here take orders, not arbitrary
lattices. The definitions carry only the hypotheses their construction needs; every theorem
over a general fraction field states the characteristic-zero hypothesis explicitly.
-/

open scoped MatrixGroups Quaternion
open NumberField IsDedekindDomain QuaternionAlgebra TauCeti.GlobalNumberFields

namespace TauCetiRoadmap.QuaternionArithmetic

noncomputable section

/-! ## Layer 0: reduced trace and norm, local ramification, the discriminant -/

section Layer0

variable {F : Type*} [Field F] (a b : Fˣ)

/-- **0.1** The reduced trace `trd x = 2·re x` on the symbol carrier (`README.md`, Layer 0, 0.1).
It satisfies `x + star x = trd x` and `x² − trd(x)·x + nrd(x) = 0`. -/
def trd (x : ℍ[F,(a : F),(b : F)]) : F := 2 * x.re

/-- **0.1** The reduced norm is Tau Ceti's norm form of `ℍ[F,a,0,b]`, consumed, not redefined
(`README.md`, Layer 0, 0.1; Conventions, Algebra). -/
abbrev nrd : QuadraticForm F ℍ[F,(a : F),(b : F)] := normForm (a : F) 0 (b : F)

end Layer0

/-! ### Layer 0 over `ℚ`: the integer `D` -/

section Rational

variable (a b : ℚˣ)

/-- **0.2** over `ℚ`: ramification at the prime `p` (`README.md`, Layer 0, 0.2, 0.4). -/
def IsRamifiedAtPrime (p : ℕ) [Fact p.Prime] : Prop :=
  TauCeti.hilbertSymbol (Units.map (algebraMap ℚ ℚ_[p]).toMonoidHom a)
    (Units.map (algebraMap ℚ ℚ_[p]).toMonoidHom b) = -1

/-- **0.5** over `ℚ`: `B` is definite when the real Hilbert symbol of `(a, b)` is `-1`
(`README.md`, Layer 0, 0.5). -/
def IsDefinite : Prop :=
  TauCeti.hilbertSymbol (Units.map (algebraMap ℚ ℝ).toMonoidHom a)
    (Units.map (algebraMap ℚ ℝ).toMonoidHom b) = -1

/-- The integer `2·num(a)·den(a)·num(b)·den(b)` outside whose prime divisors `B` is unramified
(`README.md`, Layer 0, 0.4). -/
def ramificationBound : ℕ :=
  2 * (a : ℚ).num.natAbs * (a : ℚ).den * (b : ℚ).num.natAbs * (b : ℚ).den

open Classical in
/-- **0.4** over `ℚ`: `D = ∏_{p ∈ Ram_f B} p`, a `Finset` product over the primes dividing
`ramificationBound` (`README.md`, Layer 0, 0.4; Conventions, Discriminant of `B`). -/
def discNat : ℕ :=
  ∏ p ∈ (Nat.primesBelow (ramificationBound a b + 1)).filter
    (fun p => ∃ hp : p.Prime, @IsRamifiedAtPrime a b p ⟨hp⟩), p

end Rational

/-! ## Layer 1: lattices and orders -/

section Layer1

variable {F : Type*} [Field F] [CharZero F] (a b : Fˣ)
variable (R : Type*) [CommRing R] [IsDedekindDomain R] [Algebra R F] [IsFractionRing R F]

/-- **1.1** An `R`-order in `ℍ[F,a,b]`: a subalgebra that is an `R`-lattice (`README.md`,
Layer 1, 1.1; Conventions, Order). -/
structure QuatOrder where
  /-- The order as an `R`-subalgebra of the quaternion algebra. -/
  toSubalgebra : Subalgebra R ℍ[F,(a : F),(b : F)]
  /-- The subalgebra is a full `R`-lattice, in Mathlib's sense. -/
  isLattice : Submodule.IsLattice F (Subalgebra.toSubmodule toSubalgebra)

variable {a b R}

/-- Membership of an order is membership of its native subalgebra. -/
instance instSetLikeQuatOrder : SetLike (QuatOrder a b R) ℍ[F,(a : F),(b : F)] where
  coe O := O.toSubalgebra
  coe_injective O O' h := by
    cases O; cases O'
    congr
    exact SetLike.coe_injective h

/-- Orders are ordered by inclusion; `IsMax` below is maximality for this order. -/
instance instPartialOrderQuatOrder : PartialOrder (QuatOrder a b R) := .ofSetLike (QuatOrder a b R)

/-- The underlying `R`-submodule of an order. -/
abbrev QuatOrder.toSubmodule (O : QuatOrder a b R) : Submodule R ℍ[F,(a : F),(b : F)] :=
  Subalgebra.toSubmodule O.toSubalgebra

/-- **1.1** The left order `O_L(I) = {α : αI ⊆ I}` of a submodule, as a subalgebra
(`README.md`, Layer 1, 1.1). -/
def leftOrderSubalgebra (I : Submodule R ℍ[F,(a : F),(b : F)]) :
    Subalgebra R ℍ[F,(a : F),(b : F)] where
  carrier := {α | ∀ x ∈ I, α * x ∈ I}
  mul_mem' {α β} hα hβ x hx := by
    rw [mul_assoc]; exact hα _ (hβ x hx)
  one_mem' x hx := by rwa [one_mul]
  add_mem' {α β} hα hβ x hx := by
    rw [add_mul]; exact I.add_mem (hα x hx) (hβ x hx)
  zero_mem' x _ := by rw [zero_mul]; exact I.zero_mem
  algebraMap_mem' r x hx := by
    rw [← Algebra.smul_def]; exact I.smul_mem r hx

/-- **1.1** The right order `O_R(I) = {α : Iα ⊆ I}` of a submodule, as a subalgebra
(`README.md`, Layer 1, 1.1). -/
def rightOrderSubalgebra (I : Submodule R ℍ[F,(a : F),(b : F)]) :
    Subalgebra R ℍ[F,(a : F),(b : F)] where
  carrier := {α | ∀ x ∈ I, x * α ∈ I}
  mul_mem' {α β} hα hβ x hx := by
    rw [← mul_assoc]; exact hβ _ (hα x hx)
  one_mem' x hx := by rwa [mul_one]
  add_mem' {α β} hα hβ x hx := by
    rw [mul_add]; exact I.add_mem (hα x hx) (hβ x hx)
  zero_mem' x _ := by rw [mul_zero]; exact I.zero_mem
  algebraMap_mem' r x hx := by
    rw [← Algebra.commutes, ← Algebra.smul_def]; exact I.smul_mem r hx

/-- **1.2** The unit group `Oˣ`, as the subgroup of `Bˣ` of units lying in `O` together with
their inverses (`README.md`, Layer 1, 1.2). -/
def units (O : QuatOrder a b R) : Subgroup ℍ[F,(a : F),(b : F)]ˣ where
  carrier := {γ | (γ : ℍ[F,(a : F),(b : F)]) ∈ O ∧ ((γ⁻¹ : _ˣ) : ℍ[F,(a : F),(b : F)]) ∈ O}
  one_mem' := by
    show ((1 : ℍ[F,(a : F),(b : F)]ˣ) : ℍ[F,(a : F),(b : F)]) ∈ O ∧
      (((1 : ℍ[F,(a : F),(b : F)]ˣ)⁻¹ : _ˣ) : ℍ[F,(a : F),(b : F)]) ∈ O
    rw [inv_one, Units.val_one]
    exact ⟨O.toSubalgebra.one_mem, O.toSubalgebra.one_mem⟩
  mul_mem' := by
    rintro γ δ ⟨hγ, hγ'⟩ ⟨hδ, hδ'⟩
    refine ⟨?_, ?_⟩
    · rw [Units.val_mul]; exact O.toSubalgebra.mul_mem hγ hδ
    · rw [mul_inv_rev, Units.val_mul]; exact O.toSubalgebra.mul_mem hδ' hγ'
  inv_mem' := by
    rintro γ ⟨hγ, hγ'⟩
    exact ⟨hγ', by rwa [inv_inv]⟩

/-- **1.2** The norm-one group `O¹ = {γ ∈ Oˣ : nrd γ = 1}` (`README.md`, Layer 1, 1.2). -/
def normOne (O : QuatOrder a b R) : Subgroup ℍ[F,(a : F),(b : F)]ˣ where
  carrier := {γ | γ ∈ units O ∧ nrd a b (γ : ℍ[F,(a : F),(b : F)]) = 1}
  one_mem' := ⟨(units O).one_mem, by rw [Units.val_one, ← QuaternionAlgebra.coe_one, normForm_coe, one_pow]⟩
  mul_mem' := by
    rintro γ δ ⟨hγ, h⟩ ⟨hδ, h'⟩
    exact ⟨(units O).mul_mem hγ hδ, by rw [Units.val_mul, normForm_mul, h, h', one_mul]⟩
  inv_mem' := by
    rintro γ ⟨hγ, h⟩
    refine ⟨(units O).inv_mem hγ, ?_⟩
    have he : nrd a b ((γ⁻¹ : _ˣ) : ℍ[F,(a : F),(b : F)]) *
        nrd a b (γ : ℍ[F,(a : F),(b : F)]) = 1 := by
      rw [← normForm_mul, Units.inv_mul]
      rw [← QuaternionAlgebra.coe_one, normForm_coe, one_pow]
    rwa [h, mul_one] at he

/-- **1.5** The reduced discriminant of an order is the cubic trace ideal generated by
`m(α₁,α₂,α₃) = trd((α₁α₂ − α₂α₁)α₃)` over triples in the order (`README.md`, Layer 1, 1.3;
`[V, 15.4.4]`). -/
def discrd (O : QuatOrder a b R) : Submodule R F :=
  Submodule.span R {m | ∃ α₁ α₂ α₃, α₁ ∈ O ∧ α₂ ∈ O ∧ α₃ ∈ O ∧
    m = trd a b ((α₁ * α₂ - α₂ * α₁) * α₃)}

/-- **1.4** The trace dual `I^♯ = {α : trd(αI) ⊆ R}` (`README.md`, Layer 1, 1.4). -/
def traceDual (I : Submodule R ℍ[F,(a : F),(b : F)]) : Submodule R ℍ[F,(a : F),(b : F)] where
  carrier := {α | ∀ x ∈ I, ∃ t : R, trd a b (α * x) = algebraMap R F t}
  add_mem' {α β} hα hβ x hx := by
    obtain ⟨s, hs⟩ := hα x hx
    obtain ⟨t, ht⟩ := hβ x hx
    refine ⟨s + t, ?_⟩
    simp only [trd] at hs ht ⊢
    rw [add_mul, QuaternionAlgebra.re_add, mul_add, hs, ht, map_add]
  zero_mem' x _ := ⟨0, by simp [trd]⟩
  smul_mem' r α hα x hx := by
    obtain ⟨t, ht⟩ := hα x hx
    refine ⟨r * t, ?_⟩
    simp only [trd] at ht ⊢
    rw [smul_mul_assoc, show (r • (α * x)).re = r • (α * x).re from rfl, Algebra.smul_def, map_mul,
      ← ht]
    ring

/-- **1.4** The codifferent of an order is its trace dual (`README.md`, Layer 1, 1.4). -/
abbrev codiff (O : QuatOrder a b R) : Submodule R ℍ[F,(a : F),(b : F)] := traceDual O.toSubmodule

/-- **1.9** An Eichler order is the intersection of two maximal orders (`README.md`, Layer 1,
1.9; Conventions, Maximal, Eichler, level; `[V, 23.4.1]`). -/
def IsEichler (O : QuatOrder a b R) : Prop :=
  ∃ O₁ O₂ : QuatOrder a b R, IsMax O₁ ∧ IsMax O₂ ∧ O.toSubalgebra = O₁.toSubalgebra ⊓ O₂.toSubalgebra

/-- **1.13** A lattice is invertible when a lattice `I'` satisfies `II' = O_L(I)` and
`I'I = O_R(I)` (`README.md`, Layer 1, 1.13; `[V, 16.5.1]`). Products are Mathlib's
`Submodule.mul`. -/
def IsInvertible (I : Submodule R ℍ[F,(a : F),(b : F)]) : Prop :=
  Submodule.IsLattice F I ∧ ∃ I' : Submodule R ℍ[F,(a : F),(b : F)], Submodule.IsLattice F I' ∧
    I * I' = Subalgebra.toSubmodule (leftOrderSubalgebra I) ∧
    I' * I = Subalgebra.toSubmodule (rightOrderSubalgebra I)

end Layer1

/-! ### Layer 1 over `ℤ`: the integers `discrd O`, `D`, `N`, and the worked orders -/

section IntegralOrders

variable {a b : ℚˣ}

/-- **1.5, 1.11** The reduced discriminant of an order over `ℤ` as a natural number: the least
positive integer in `discrd O`, which is a nonzero ideal of `ℤ` inside `ℚ` and so is generated by
it; the LMFDB's `discO` (`README.md`, Layer 1, 1.5, 1.11). -/
def discrdNat (O : QuatOrder a b ℤ) : ℕ :=
  sInf {n : ℕ | 0 < n ∧ (n : ℚ) ∈ discrd O}

/-- **1.8** The maximality criterion over `ℤ`: `O` is maximal iff `discrd O = D` (`README.md`,
Layer 1, 1.8; `[V, 15.5.5]`). -/
theorem isMax_iff_discrdNat_eq (O : QuatOrder a b ℤ) : IsMax O ↔ discrdNat O = discNat a b := sorry

/-- **1.10** The level of an Eichler order over `ℤ`: `N = discrd O / D` (`README.md`, Layer 1,
1.10; Conventions, Maximal, Eichler, level). -/
def level (O : QuatOrder a b ℤ) : ℕ := discrdNat O / discNat a b

/-- **1.10** `ψ(N) = N ∏_{p | N}(1 + 1/p)`, the index of the unit groups of an Eichler order of
level `N` in those of a maximal order containing it (`README.md`, Layer 1, 1.10). -/
def psi (N : ℕ) : ℕ := ∏ p ∈ N.primeFactors, p ^ (N.factorization p - 1) * (p + 1)

/-- **1.10, 8.2** `[O(1)¹ : O¹] = ψ(N)` for `O ⊆ O(1)` Eichler of level `N` inside a maximal order
of an **indefinite** algebra, where strong approximation (4.3) makes the global index the product
of the local ones of 1.10 (`README.md`, Layer 1, 1.10; Layer 8, 8.2). In a definite algebra the
global index is smaller: the level-`7` Eichler orders of `ℍ[ℚ,-1,-1]` have `6` units against the
Hurwitz order's `24`, index `4 ≠ ψ(7) = 8` (`README.md`, Off-hypothesis checks). -/
theorem relindex_normOne_eq_psi (O O₁ : QuatOrder a b ℤ) (hind : ¬ IsDefinite a b)
    (h : IsEichler O) (h₁ : IsMax O₁) (hle : O ≤ O₁) :
    (normOne O).relIndex (normOne O₁) = psi (level O) := sorry

end IntegralOrders

/-! ## Layer 2: Gorenstein and Bass orders -/

section Layer2

variable {F : Type*} [Field F] [charZeroF : CharZero F] {a b : Fˣ}
variable {R : Type*} [CommRing R] [IsDedekindDomain R] [Algebra R F] [IsFractionRing R F]

/-- **2.2** `O` is Gorenstein when its codifferent is invertible (`README.md`, Layer 2, 2.2;
`[V, 24.2.1]`). -/
def IsGorenstein (O : QuatOrder a b R) : Prop := IsInvertible (codiff O)

include charZeroF in
/-- **2.3** Every quaternion order over a characteristic-zero Dedekind fraction field has
unique nonzero conductor and Gorenstein saturation, with `O = R + f G` (Voight 24.2.15). -/
theorem existsUnique_gorenstein_saturation (O : QuatOrder a b R) :
    ∃! P : Ideal R × QuatOrder a b R, P.1 ≠ ⊥ ∧ IsGorenstein P.2 ∧
      O.toSubmodule = Submodule.span R ({1} : Set ℍ[F,(a : F),(b : F)]) ⊔
        P.1 • P.2.toSubmodule := sorry

/-- **2.5** `O` is Bass when every superorder is Gorenstein (`README.md`, Layer 2, 2.5;
`[V, 24.5.1]`). -/
def IsBass (O : QuatOrder a b R) : Prop := ∀ O' : QuatOrder a b R, O ≤ O' → IsGorenstein O'

/-- **2.5** Eichler orders are Bass (`README.md`, Layer 2, 2.5). -/
theorem IsEichler.isBass (O : QuatOrder a b R) (h : IsEichler O) : IsBass O := sorry

end Layer2

/-! ## Layer 3: invertible right ideals, the class set, the type set, the normalizer -/

section Layer3

variable {F : Type*} [Field F] [CharZero F] {a b : Fˣ}
variable {R : Type*} [CommRing R] [IsDedekindDomain R] [Algebra R F] [IsFractionRing R F]

/-- **3.1** A proper invertible right fractional `O`-ideal: an invertible lattice with right order O
(`README.md`, Layer 3, 3.1; 1.13). -/
structure RightIdeal (O : QuatOrder a b R) where
  /-- The ideal as an `R`-submodule of the algebra. -/
  toSubmodule : Submodule R ℍ[F,(a : F),(b : F)]
  /-- It is stable under right multiplication by `O`. -/
  mul_le : toSubmodule * O.toSubmodule ≤ toSubmodule
  /-- Its full right multiplier order equals the specified order. -/
  rightOrder_eq : rightOrderSubalgebra toSubmodule = O.toSubalgebra
  /-- It is invertible (equivalently, over a Dedekind domain, locally principal). -/
  isInvertible : IsInvertible toSubmodule

/-- Proper invertible ideals are full lattices. -/
instance instIsLatticeRightIdeal (O : QuatOrder a b R) (I : RightIdeal O) : Submodule.IsLattice F I.toSubmodule :=
  I.isInvertible.1

/-- **3.2** Two invertible right ideals are equivalent when `αI = J` for a unit `α`
(`README.md`, Layer 3, 3.2; Conventions, Right class set). -/
def ClassRel (O : QuatOrder a b R) (I J : RightIdeal O) : Prop :=
  ∃ α : ℍ[F,(a : F),(b : F)]ˣ,
    I.toSubmodule.map (LinearMap.mulLeft R (α : ℍ[F,(a : F),(b : F)])) = J.toSubmodule

/-- **3.2** The right class set `Cls O` (`README.md`, Layer 3, 3.2; `[V, 17.3.4]`). -/
def ClassSet (O : QuatOrder a b R) : Type _ := Quot (ClassRel O)

/-- **3.2** The class number `# Cls O` (`README.md`, Layer 3, 3.2). -/
def classNumber (O : QuatOrder a b R) : ℕ := Nat.card (ClassSet O)

/-- **3.3** Two right ideals are of the same type when their left orders are conjugate
(`README.md`, Layer 3, 3.3; Conventions, Type set). -/
def TypeRel (O : QuatOrder a b R) (I J : RightIdeal O) : Prop :=
  ∃ α : ℍ[F,(a : F),(b : F)]ˣ, ∀ x, x ∈ leftOrderSubalgebra I.toSubmodule ↔
    ((α⁻¹ : _ˣ) : ℍ[F,(a : F),(b : F)]) * x * α ∈ leftOrderSubalgebra J.toSubmodule

/-- **3.3** The type set `Typ O`: the conjugacy classes of the left orders of the invertible right
`O`-ideals (`README.md`, Layer 3, 3.3; `[V, 17.4.8]`). -/
def TypeSet (O : QuatOrder a b R) : Type _ := Quot (TypeRel O)

/-- **3.3** The type number `# Typ O` (`README.md`, Layer 3, 3.3). -/
def typeNumber (O : QuatOrder a b R) : ℕ := Nat.card (TypeSet O)

/-- **3.5** Class sets of orders over the ring of integers of a number field are finite
(`README.md`, Layer 3, 3.5; `[V, 17.7.1]`, through the adelic algebraic groups roadmap
AA.3.4). -/
theorem finite_classSet [NumberField F] (O : QuatOrder a b (𝓞 F)) : Finite (ClassSet O) := sorry

/-- **3.6** The normalizer `N_{Bˣ}(O) = {γ : γ⁻¹Oγ = O}` (`README.md`, Layer 3, 3.6). -/
def normalizer (O : QuatOrder a b R) : Subgroup ℍ[F,(a : F),(b : F)]ˣ where
  carrier := {γ | ∀ x, x ∈ O ↔ ((γ⁻¹ : _ˣ) : ℍ[F,(a : F),(b : F)]) * x * γ ∈ O}
  one_mem' x := by simp
  mul_mem' {γ δ} hγ hδ x := by
    rw [hγ x, hδ]
    simp only [mul_inv_rev, Units.val_mul, mul_assoc]
  inv_mem' {γ} hγ x := by
    have h := hγ ((γ : ℍ[F,(a : F),(b : F)]) * x * ((γ⁻¹ : _ˣ) : ℍ[F,(a : F),(b : F)]))
    have e : ((γ⁻¹ : _ˣ) : ℍ[F,(a : F),(b : F)]) *
        ((γ : ℍ[F,(a : F),(b : F)]) * x * ((γ⁻¹ : _ˣ) : ℍ[F,(a : F),(b : F)])) * γ = x := by
      simp [mul_assoc]
    rw [e] at h
    rw [inv_inv]
    exact h.symm

/-- **3.6** The subgroup `Fˣ·Oˣ` of the normalizer (`README.md`, Layer 3, 3.6). -/
def scalarUnits (O : QuatOrder a b R) : Subgroup (normalizer O) :=
  Subgroup.comap (normalizer O).subtype
    ((Units.map (algebraMap F ℍ[F,(a : F),(b : F)]).toMonoidHom).range ⊔ units O)

/-- **4.5** The normalizer quotient `N_{Bˣ}(O)/(ℚˣOˣ)`, which for `B` indefinite over `ℚ` and `O`
Eichler is the Atkin–Lehner group `AL(O)` of 3.7 (`README.md`, Layer 3, 3.7; Layer 4, 4.5;
`[V, 28.9.17]`). -/
abbrev atkinLehnerGroup {a b : ℚˣ} (O : QuatOrder a b ℤ) : Type _ := normalizer O ⧸ scalarUnits O

/-- **4.5** For `B` indefinite and `O` Eichler over `ℤ`, `N_{Bˣ}(O)/(ℚˣOˣ) ≅ (ℤ/2)^{ω(DN)}`
(`README.md`, Layer 4, 4.5). Indefiniteness is needed: in a definite algebra a two-sided ideal of
prime norm need not be principal and the quotient is then smaller (the level-`7` Eichler orders of
`ℍ[ℚ,-1,-1]`, which contain no element of norm `2`; the two maximal orders of `D = 37` whose class
`P_37` moves; `README.md`, Off-hypothesis checks). -/
theorem card_atkinLehnerGroup {a b : ℚˣ} (O : QuatOrder a b ℤ) (hind : ¬ IsDefinite a b)
    (h : IsEichler O) : Nat.card (atkinLehnerGroup O) = 2 ^ (discrdNat O).primeFactors.card := sorry

end Layer3

/-! ## Layer 4: Eichler's theorems for indefinite algebras over `ℚ` -/

section Layer4

variable {a b : ℚˣ}

/-- **4.3** An Eichler order in an indefinite algebra over `ℚ` has class number one
(`README.md`, Layer 4, 4.3; `[V, 28.5.5]`, from the adelic algebraic groups roadmap AA.4.2). -/
theorem classNumber_eq_one_of_not_isDefinite (O : QuatOrder a b ℤ) (hO : IsEichler O)
    (h : ¬ IsDefinite a b) : classNumber O = 1 := sorry

/-- **4.3** Any two Eichler orders of the same level in an indefinite algebra over `ℚ` are
conjugate (`README.md`, Layer 4, 4.3). -/
theorem exists_conj_of_level_eq (O O' : QuatOrder a b ℤ) (hO : IsEichler O) (hO' : IsEichler O')
    (h : ¬ IsDefinite a b) (hl : level O = level O') :
    ∃ α : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ, ∀ x, x ∈ O ↔ ((α⁻¹ : _ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) * x * α ∈ O' :=
  sorry

/-- **4.4** An Eichler order in an indefinite algebra over `ℚ` has a unit of reduced norm `-1`
(`README.md`, Layer 4, 4.4; `[V, 28.6.10]`). -/
theorem exists_unit_nrd_eq_neg_one (O : QuatOrder a b ℤ) (hO : IsEichler O) (h : ¬ IsDefinite a b) :
    ∃ u ∈ units O, nrd a b (u : ℍ[ℚ,(a : ℚ),(b : ℚ)]) = -1 := sorry

end Layer4

/-! ## Layer 5: the Eichler mass formula over `ℚ` -/

section Layer5

variable {a b : ℚˣ}

/-- **5.5** A maximal order in a definite algebra over `ℚ` has class number one exactly for
`D ∈ {2, 3, 5, 7, 13}` (`README.md`, Layer 5, 5.5; `[V, 25.4.1]`). -/
theorem classNumber_eq_one_iff (O : QuatOrder a b ℤ) (hdef : IsDefinite a b) (hmax : IsMax O) :
    classNumber O = 1 ↔ discNat a b ∈ ({2, 3, 5, 7, 13} : Finset ℕ) := sorry

/-- **5.2** The rational Eichler mass formula for a complete finite set of proper right-ideal
class representatives. In the definite case each left-order unit group is finite and contains
±1, so every denominator is nonzero (Voight 25.3.18). -/
theorem eichler_mass_formula (O : QuatOrder a b ℤ) (hdef : IsDefinite a b)
    (hO : IsEichler O) (n : ℕ) (reps : Fin n → RightIdeal O)
    (hreps : Function.Bijective (fun i => (Quot.mk (ClassRel O) (reps i) : ClassSet O))) :
    (∑ i : Fin n, (2 : ℚ) / Nat.card ((leftOrderSubalgebra (reps i).toSubmodule)ˣ)) =
      (Nat.totient (discNat a b) : ℚ) * psi (level O) / 12 := sorry

end Layer5

/-! ## Layer 6: optimal embeddings and embedding numbers over `ℚ` -/

section Layer6

variable {a b : ℚˣ} {K : Type*} [Field K] [NumberField K] [Algebra ℚ K]

/-- **6.1** An `F`-algebra map `φ : K → B` is optimal for the quadratic order `S` when
`φ(K) ∩ O = φ(S)` (`README.md`, Layer 6, 6.1; Conventions, Optimal embedding;
`[V, 30.3.2]`). The quadratic order is Tau Ceti's `NumberFieldOrder K`. -/
def IsOptimalEmbedding (O : QuatOrder a b ℤ) (S : NumberFieldOrder K)
    (φ : K →ₐ[ℚ] ℍ[ℚ,(a : ℚ),(b : ℚ)]) : Prop :=
  ∀ x : K, φ x ∈ O ↔ x ∈ S.toSubalgebra

/-- **6.1** The optimal embeddings `Emb(S, O)` (`README.md`, Layer 6, 6.1). -/
def OptimalEmbedding (O : QuatOrder a b ℤ) (S : NumberFieldOrder K) : Type _ :=
  {φ : K →ₐ[ℚ] ℍ[ℚ,(a : ℚ),(b : ℚ)] // IsOptimalEmbedding O S φ}

/-- **6.1** Conjugacy of optimal embeddings by a subgroup `Γ ≤ Bˣ`, acting by
`φ ↦ γ⁻¹φγ` (`README.md`, Layer 6, 6.1). -/
def EmbRel (O : QuatOrder a b ℤ) (S : NumberFieldOrder K) (Γ : Subgroup ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ)
    (φ ψ : OptimalEmbedding O S) : Prop :=
  ∃ γ ∈ Γ, ∀ x, ψ.1 x = ((γ⁻¹ : _ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) * φ.1 x * γ

/-- **6.1** The embedding number `m(S, O; Γ) = # Emb(S, O; Γ)` (`README.md`, Layer 6, 6.1;
`[V, 30.3.12]`). -/
def embeddingNumber (O : QuatOrder a b ℤ) (S : NumberFieldOrder K)
    (Γ : Subgroup ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℕ :=
  Nat.card (Quot (EmbRel O S Γ))

/-- **6.5** The Kronecker symbol `(d | p)` at a prime `p`: Mathlib's `jacobiSym d p` for `p` odd,
and at `p = 2` the value `0, 1, −1` according as `d` is even, `d ≡ ±1 (mod 8)`, `d ≡ ±3 (mod 8)`
(`README.md`, Layer 6, 6.5). Mathlib's `jacobiSym d 2` is
`legendreSym 2 d = quadraticChar (ZMod 2) d ∈ {0, 1}` and is not this symbol. -/
def kroneckerSym (d : ℤ) (p : ℕ) : ℤ :=
  if p = 2 then (if 2 ∣ d then 0 else if d % 8 = 1 ∨ d % 8 = 7 then 1 else -1) else jacobiSym d p

/-- **6.5** The embedding-number product `∏_{p | D}(1 − (d | p)) ∏_{p | N}(1 + (d | p))` for the
Kronecker symbol of `d`, with the vanishing at `c² | N` (`README.md`, Layer 6, 6.5). -/
def kroneckerProduct (d : ℤ) (c D N : ℕ) : ℤ :=
  if c ^ 2 ∣ N then 0 else
    (∏ p ∈ D.primeFactors, (1 - kroneckerSym d p)) * ∏ p ∈ N.primeFactors, (1 + kroneckerSym d p)

/-- **6.5** For `O` Eichler in an indefinite algebra over `ℚ`, `m(ℤ[i], O; Oˣ)` is the Kronecker
product of `d = −4` (`README.md`, Layer 6, 6.5; `[V, 30.7.7, 39.4.20]`). The order `ℤ[i]` is the
ring of integers of `ℚ(i) = CyclotomicField 4 ℚ`. -/
theorem embeddingNumber_gaussian (O : QuatOrder a b ℤ) (hO : IsEichler O) (h : ¬ IsDefinite a b)
    (S : NumberFieldOrder (CyclotomicField 4 ℚ)) (hS : S.toSubalgebra = integralClosure ℤ _) :
    (embeddingNumber O S (units O) : ℤ) = kroneckerProduct (-4) 2 (discNat a b) (level O) := sorry

/-- **6.5** `m(ℤ[ω], O; Oˣ)` is the Kronecker product of `d = −3`, for `ℤ[ω]` the ring of
integers of `ℚ(√−3) = CyclotomicField 3 ℚ` (`README.md`, Layer 6, 6.5). -/
theorem embeddingNumber_eisenstein (O : QuatOrder a b ℤ) (hO : IsEichler O) (h : ¬ IsDefinite a b)
    (S : NumberFieldOrder (CyclotomicField 3 ℚ)) (hS : S.toSubalgebra = integralClosure ℤ _) :
    (embeddingNumber O S (units O) : ℤ) = kroneckerProduct (-3) 3 (discNat a b) (level O) := sorry

/-- **6.6** The Eichler class number formula over `ℚ`:
`# Cls O = φ(D)ψ(N)/12 + ε₂/4 + ε₃/3` (`README.md`, Layer 6, 6.6; `[V, 30.1.5]`). -/
theorem classNumber_eq_mass_add (O : QuatOrder a b ℤ) (hdef : IsDefinite a b) (hO : IsEichler O) :
    (classNumber O : ℚ) = (Nat.totient (discNat a b) * psi (level O) : ℚ) / 12 +
      (kroneckerProduct (-4) 2 (discNat a b) (level O) : ℚ) / 4 +
      (kroneckerProduct (-3) 3 (discNat a b) (level O) : ℚ) / 3 := sorry

/-- **6.8** Deuring's type number formula for prime discriminant `p ≥ 5` (`README.md`, Layer 6,
6.8; `[V, 30.9.2]`): `t = h/2 + [p ≡ 3 (4)]·h(−p)/4 + h(−4p)/4`, with the class numbers of the
imaginary quadratic orders of discriminants `−p` and `−4p` as `Nat.card (Pic S)` for Tau Ceti's
`NumberFieldOrder`. -/
theorem typeNumber_prime (O : QuatOrder a b ℤ) (hdef : IsDefinite a b) (hmax : IsMax O)
    (p : ℕ) (hp : p.Prime) (hp5 : 5 ≤ p) (hD : discNat a b = p)
    {L : Type*} [Field L] [NumberField L] (hL : Module.finrank ℚ L = 2)
    (Smax S' : NumberFieldOrder L)
    (hmax' : Smax.toSubalgebra = integralClosure ℤ L) (hdisc : Smax.discr = -(p : ℤ) ∨
      Smax.discr = -4 * (p : ℤ)) (hS' : S'.discr = -4 * (p : ℤ)) :
    (typeNumber O : ℚ) = (classNumber O : ℚ) / 2 +
      (if p % 4 = 3 then (Nat.card (Pic Smax) : ℚ) / 4 else 0) +
      (Nat.card (Pic S') : ℚ) / 4 := sorry

end Layer6

/-! ## Layer 9: polarized orders and `Aut_{±μ}(O)` -/

section Layer9

variable {a b : ℚˣ}

/-- **9.1** A polarization of `O`: `μ ∈ Bˣ` with `μ² ∈ ℤ_{<0}` and `trd(μO) ⊆ ℤ` (`README.md`,
Layer 9, 9.1; Conventions, Polarization). -/
def IsPolarization (O : QuatOrder a b ℤ) (μ : ℍ[ℚ,(a : ℚ),(b : ℚ)]) : Prop :=
  (∃ n : ℤ, n < 0 ∧ μ * μ = (n : ℍ[ℚ,(a : ℚ),(b : ℚ)])) ∧
    ∀ x ∈ O, ∃ t : ℤ, trd a b (μ * x) = t

/-- **9.1** Every maximal order in an indefinite rational quaternion algebra admits an
integral principal polarization with square `-D` (Voight 43.6.6–7). -/
theorem exists_principal_polarization (O : QuatOrder a b ℤ) (hind : ¬ IsDefinite a b)
    (hmax : IsMax O) :
    ∃ μ : ℍ[ℚ,(a : ℚ),(b : ℚ)], μ ∈ O ∧ IsPolarization O μ ∧
      μ * μ = algebraMap ℚ ℍ[ℚ,(a : ℚ),(b : ℚ)] (-(discNat a b : ℚ)) := sorry

/-- **9.2** `Aut_{±μ}(O) = {γ ∈ N_{Bˣ}(O)/ℚˣ : γ⁻¹μγ = ±μ}` (`README.md`, Layer 9, 9.2; *Pinned
conventions*, `Aut_{±μ}(O)`). The quotient by `ℚˣ` is the quotient by the (normal) image of the
scalar units in `normalizer O`. -/
def scalars (O : QuatOrder a b ℤ) : Subgroup (normalizer O) :=
  Subgroup.comap (normalizer O).subtype
    (Units.map (algebraMap ℚ ℍ[ℚ,(a : ℚ),(b : ℚ)]).toMonoidHom).range

/-- **9.2** The scalars are central, hence normal in the normalizer (`README.md`, Layer 9, 9.2). -/
instance instNormalScalars (O : QuatOrder a b ℤ) : (scalars O).Normal := by
  refine Subgroup.normal_of_le_center fun γ hγ => Subgroup.mem_center_iff.mpr fun δ => ?_
  obtain ⟨c, hc⟩ := hγ
  have hγc : ((γ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) = algebraMap ℚ _ (c : ℚ) :=
    (congrArg Units.val hc).symm
  apply Subtype.ext
  apply Units.ext
  simp only [Subgroup.coe_mul, Units.val_mul, hγc]
  exact (Algebra.commutes (c : ℚ) _).symm

/-- **9.2** `γ ∈ N_{Bˣ}(O)` conjugates `μ` to `±μ` (`README.md`, Layer 9, 9.2). -/
def ConjugatesPmMu (O : QuatOrder a b ℤ) (μ : ℍ[ℚ,(a : ℚ),(b : ℚ)]) (γ : normalizer O) : Prop :=
  let g : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ := γ
  ((g⁻¹ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) * μ * (g : ℍ[ℚ,(a : ℚ),(b : ℚ)]) = μ ∨
    ((g⁻¹ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) * μ * (g : ℍ[ℚ,(a : ℚ),(b : ℚ)]) = -μ

/-- **9.2** `Aut_{±μ}(O)` as a subgroup of `N_{Bˣ}(O)/ℚˣ` (`README.md`, Layer 9, 9.2). -/
def autPmMu (O : QuatOrder a b ℤ) (μ : ℍ[ℚ,(a : ℚ),(b : ℚ)]) : Subgroup (normalizer O ⧸ scalars O)
    where
  carrier := {g | ∃ γ : normalizer O, QuotientGroup.mk γ = g ∧ ConjugatesPmMu O μ γ}
  one_mem' := ⟨1, rfl, Or.inl (by simp)⟩
  mul_mem' := by
    rintro _ _ ⟨γ, rfl, hγ⟩ ⟨δ, rfl, hδ⟩
    refine ⟨γ * δ, rfl, ?_⟩
    simp only [ConjugatesPmMu, Subgroup.coe_mul, mul_inv_rev, Units.val_mul] at hγ hδ ⊢
    have e : ((((δ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ))⁻¹ : _ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) *
        ((((γ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ))⁻¹ : _ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) * μ *
        (((γ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) *
          ((δ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)])) =
        ((((δ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ))⁻¹ : _ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) *
          (((((γ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ))⁻¹ : _ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) * μ *
            ((γ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)])) *
          ((δ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) := by
      simp only [mul_assoc]
    rw [e]
    rcases hγ with h | h <;> rw [h]
    · exact hδ
    · rw [mul_neg, neg_mul]
      rcases hδ with h' | h' <;> rw [h']
      · exact Or.inr rfl
      · exact Or.inl (neg_neg μ)
  inv_mem' := by
    rintro _ ⟨γ, rfl, hγ⟩
    refine ⟨γ⁻¹, rfl, ?_⟩
    simp only [ConjugatesPmMu, InvMemClass.coe_inv, inv_inv] at hγ ⊢
    have e : ((γ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) *
        (((((γ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ))⁻¹ : _ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) * μ *
          ((γ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)])) *
        ((((γ : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ))⁻¹ : _ˣ) : ℍ[ℚ,(a : ℚ),(b : ℚ)]) = μ := by
      simp [mul_assoc]
    rcases hγ with h | h
    · rw [h] at e; exact Or.inl e
    · rw [h, mul_neg, neg_mul] at e
      exact Or.inr (neg_eq_iff_eq_neg.mp e)

/-- **9.2** For a normalizing polarization in an indefinite division algebra, the group has
order `2, 4, 6, 8` or `12` (`README.md`, Layer 9, 9.2). -/
theorem card_autPmMu (O : QuatOrder a b ℤ) (μ : ℍ[ℚ,(a : ℚ),(b : ℚ)]) (hO : IsEichler O)
    (h : ¬ IsDefinite a b) (hdiv : ∀ x : ℍ[ℚ,(a : ℚ),(b : ℚ)], x ≠ 0 → IsUnit x)
    (hμ : IsPolarization O μ)
    (hnormal : ∃ u : ℍ[ℚ,(a : ℚ),(b : ℚ)]ˣ, (u : ℍ[ℚ,(a : ℚ),(b : ℚ)]) = μ ∧ u ∈ normalizer O) :
    Nat.card (autPmMu O μ) ∈ ({2, 4, 6, 8, 12} : Finset ℕ) := sorry

/-- **9.2** Without a normalizing hypothesis the polarization stabilizer can be trivial or
cyclic of order three, as well as the larger cyclic and dihedral cases. -/
theorem card_autPmMu_general (O : QuatOrder a b ℤ) (μ : ℍ[ℚ,(a : ℚ),(b : ℚ)])
    (hO : IsEichler O) (h : ¬ IsDefinite a b)
    (hdiv : ∀ x : ℍ[ℚ,(a : ℚ),(b : ℚ)], x ≠ 0 → IsUnit x) (hμ : IsPolarization O μ) :
    Nat.card (autPmMu O μ) ∈ ({1, 2, 3, 4, 6, 8, 12} : Finset ℕ) := sorry

end Layer9

end

end TauCetiRoadmap.QuaternionArithmetic
