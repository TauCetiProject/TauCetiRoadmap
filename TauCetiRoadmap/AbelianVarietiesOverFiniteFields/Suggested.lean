import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.Basic
import TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny
import TauCeti.NumberTheory.NumberField.Global.Orders.Basic

/-!
# Abelian varieties over finite fields: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti; the
other targets, with their definitions and Checks, are specified in `README.md` only. Discharging
every declaration here would finish neither a layer nor the roadmap. Theorem proofs are `sorry`:
these are targets, not implementations.

The carrier is Tau Ceti's `AbelianVariety K` over a finite field `K`, with `IsIsogeny` its notion
of isogeny. The `q`-Frobenius `π_A` and its characteristic polynomial `P_A` are consumed from
*Deligne weights, purity and the Weil bounds* DWP.1 and *Abelian schemes and arithmetic moduli*
A6, which are not importable at the pin, so every statement that mentions `π_A` or `P_A` is in the
README only. What this file pins down:

* the isogeny relation `IsIsogenous` and the isogeny class as a `Setoid` quotient (Layer 1.7);
* orders in a finite-dimensional commutative `ℚ`-algebra `E` (the LMFDB's "orders in an étale
  algebra"), with the maximal order `integralClosure ℤ E`, the index, fractional ideals as
  `Submodule Λ E` with `Submodule.IsLattice ℚ`, colon ideals, multiplier rings, the conductor,
  invertibility, weak equivalence (defined locally, with the colon criterion as a theorem), the
  trace dual, Gorenstein and Bass orders, the Cohen–Macaulay type, and the Picard set of classes of
  invertible ideals with its finiteness (Layer 8); the group law on it is README-only (8.2);
* the Frobenius order `ℤ[π, q/π]` of a unit `π` of `E` and the LMFDB's `zfv_*` invariants
  (8.3), stated for an arbitrary `(E, π, q)` so that they attach to `P_A` through `E = ℚ[T]/(P_A)`
  without naming `π_A`;
* Deligne modules `(M, F)` with the pinned definition (9.1), their characteristic polynomial,
  dimension, morphisms and isogenies, the `ℤ`-module of morphisms, and the group `M/(F − 1)M`
  (9.5). The Verschiebung, the dual module and the ideal dictionary of 9.1 are README-only.

Conventions visible in the signatures: the modulus `q : ℕ` is a parameter everywhere and
`V := q · π⁻¹` is the Verschiebung; "order" means a `ℤ`-subalgebra that is a full `ℚ`-lattice,
and nothing here assumes `E` is a field, so the squarefree reducible case is covered; weak
equivalence is local isomorphism at every maximal ideal (the colon criterion `1 ∈ (I : J)(J : I)`
is `weakEquiv_iff_one_mem`, not the definition); the Picard classes are invertible fractional
ideals modulo `E^×`.

Exceptions to "every proof is `sorry`": `isIsogenous_refl` and `IsIsogenous.trans` are proved from
Tau Ceti's `isIsogeny_id` and `IsIsogeny.comp`, and the two `example`s are bridge checks that the
Mathlib theorems the README leans on (the structure theorem for finite abelian groups in 7.1 and
Kronecker's theorem in 6.3) apply with exactly the promised hypotheses.
-/

universe u v

open CategoryTheory TauCeti.AlgebraicGeometry TauCeti.AlgebraicGeometry.AbelianVariety
  TauCeti.GlobalNumberFields

open scoped TensorProduct

namespace TauCetiRoadmap.AbelianVarietiesOverFiniteFields

/-! ### Layer 1.7: the isogeny relation -/

section Isogeny

variable {K : Type u} [Field K]

/-- `README.md`, Layer 1, 1.7: `A` and `B` are isogenous when some homomorphism `A ⟶ B` is an
isogeny (finite and surjective). Symmetry is the theorem `IsIsogenous.symm`, not a second clause. -/
def IsIsogenous (A B : AbelianVariety K) : Prop :=
  ∃ f : A ⟶ B, IsIsogeny f

/-- `README.md`, Layer 1, 1.7: reflexivity, from Tau Ceti's `isIsogeny_id`. -/
theorem isIsogenous_refl (A : AbelianVariety K) : IsIsogenous A A :=
  ⟨𝟙 A, isIsogeny_id A⟩

/-- `README.md`, Layer 1, 1.7: an isogeny of degree `n` has a quasi-inverse `g` with `g ∘ f = [n]`,
which is again an isogeny. -/
theorem IsIsogenous.symm {A B : AbelianVariety K} (h : IsIsogenous A B) : IsIsogenous B A := by
  sorry

/-- `README.md`, Layer 1, 1.7: transitivity, from Tau Ceti's `IsIsogeny.comp`. -/
theorem IsIsogenous.trans {A B C : AbelianVariety K} (hAB : IsIsogenous A B)
    (hBC : IsIsogenous B C) : IsIsogenous A C := by
  obtain ⟨f, hf⟩ := hAB
  obtain ⟨g, hg⟩ := hBC
  exact ⟨f ≫ g, hf.comp hg⟩

/-- `README.md`, Layer 1, 1.7: the isogeny relation as a `Setoid` on abelian varieties over `K`. -/
def isogenyClassSetoid (K : Type u) [Field K] : Setoid (AbelianVariety K) :=
  ⟨IsIsogenous, ⟨isIsogenous_refl, IsIsogenous.symm, IsIsogenous.trans⟩⟩

/-- `README.md`, Layer 1, 1.7: the isogeny class of an abelian variety is its class in the
quotient; every "invariant of the isogeny class" below is a function on this type. -/
abbrev IsogenyClass (K : Type u) [Field K] : Type (u + 1) :=
  Quotient (isogenyClassSetoid K)

/-- `README.md`, Layer 1, 1.7: isogenous varieties have the same dimension. -/
theorem IsIsogenous.dim_eq {A B : AbelianVariety K} (h : IsIsogenous A B) : A.dim = B.dim := by
  sorry

/-- `README.md`, Layer 1, 1.7: the isogeny relation is preserved by base change
(`IsIsogeny.baseChange`). -/
theorem IsIsogenous.baseChange {A B : AbelianVariety K} (L : Type u) [Field L] [Algebra K L]
    (h : IsIsogenous A B) : IsIsogenous (A.baseChange L) (B.baseChange L) := by
  sorry

end Isogeny

/-! ### Bridge checks (Layers 6.3 and 7.1) -/

/-- `README.md`, Layer 7, 7.1: the group `A(L)` is a finite abelian group, and Mathlib's structure
theorem gives its invariant factors. Bridge check: the theorem applies to any finite additive
commutative group with no further hypothesis. -/
example (G : Type u) [AddCommGroup G] [Finite G] :
    ∃ ι : Type, ∃ _ : Fintype ι, ∃ p : ι → ℕ, ∃ _ : (∀ i, Nat.Prime (p i)), ∃ e : ι → ℕ,
      Nonempty (G ≃+ DirectSum ι fun i => ZMod (p i ^ e i)) :=
  AddCommGroup.equiv_directSum_zmod_of_finite G

/-- `README.md`, Layer 6, 6.3: the step "all slopes `1/2` makes every `α_i / √q` a root of unity"
is Kronecker's theorem applied to the algebraic integer `α_i² / q`. Bridge check: Mathlib's
`NumberField.Embeddings.pow_eq_one_of_norm_eq_one` needs integrality over `ℤ` and modulus one at
every complex embedding, nothing else. -/
example (F : Type v) [Field F] [NumberField F] (x : F) (hx : IsIntegral ℤ x)
    (h : ∀ φ : F →+* ℂ, ‖φ x‖ = 1) : ∃ n : ℕ, ∃ _ : 0 < n, x ^ n = 1 :=
  NumberField.Embeddings.pow_eq_one_of_norm_eq_one F ℂ hx h

/-! ### Layer 8: orders in a finite-dimensional commutative `ℚ`-algebra -/

section Orders

variable (E : Type v) [CommRing E] [Algebra ℚ E] [Module.Finite ℚ E]

/-- `README.md`, Layer 8, 8.1: an order of `E` is a `ℤ`-subalgebra that is a full `ℚ`-lattice
(ClassicalArithmeticCompletion §7.4's `IntegralOrder.IsOrder`, spelled out). -/
def IsOrder (Λ : Subalgebra ℤ E) : Prop :=
  Submodule.IsLattice ℚ (Subalgebra.toSubmodule Λ)

/-- `README.md`, Layer 8, 8.1: the maximal order, the integral closure of `ℤ` in `E`. -/
def maximalOrder : Subalgebra ℤ E :=
  integralClosure ℤ E

/-- `README.md`, Layer 8, 8.1: for reduced `E` (étale over `ℚ`) the maximal order is an order: it lies
in the lattice of ClassicalArithmeticCompletion §7.49 that bounds every overorder of a given order. -/
theorem isOrder_maximalOrder [IsReduced E] : IsOrder E (maximalOrder E) := by
  sorry

/-- `README.md`, Layer 8, 8.1: every order is contained in the maximal order. -/
theorem IsOrder.le_maximalOrder {Λ : Subalgebra ℤ E} (h : IsOrder E Λ) : Λ ≤ maximalOrder E := by
  sorry

/-- `README.md`, Layer 8, 8.1: the index `[𝓞_E : Λ]`, the LMFDB `index` of an order. -/
noncomputable def index (Λ : Subalgebra ℤ E) : ℕ :=
  Nat.card (Subalgebra.toSubmodule (maximalOrder E) ⧸
    (Subalgebra.toSubmodule Λ).comap (Subalgebra.toSubmodule (maximalOrder E)).subtype)

/-- `README.md`, Layer 8, 8.1: the index of an order in a reduced `E` is a positive integer. -/
theorem index_pos [IsReduced E] {Λ : Subalgebra ℤ E} (h : IsOrder E Λ) : 0 < index E Λ := by
  sorry

/-- `README.md`, Layer 8, 8.1: an order is maximal iff its index is `1`
(`zfv_is_maximal`). -/
theorem index_eq_one_iff [IsReduced E] {Λ : Subalgebra ℤ E} (h : IsOrder E Λ) :
    index E Λ = 1 ↔ Λ = maximalOrder E := by
  sorry

/-- `README.md`, Layer 8, 8.1: an order has finitely many overorders, all inside the one lattice
`r⁻¹ ∑ ℤ e_i` of ClassicalArithmeticCompletion §7.49 (one trace-dual lattice bounds every
overorder). -/
theorem finite_overorders [IsReduced E] {Λ : Subalgebra ℤ E} (h : IsOrder E Λ) :
    Set.Finite {Λ' : Subalgebra ℤ E | IsOrder E Λ' ∧ Λ ≤ Λ'} := by
  sorry

/-- `README.md`, Layer 8, 8.1: the comparison with Tau Ceti's orders library: a `NumberFieldOrder`
is an order of its number field in the sense of this file. -/
theorem numberFieldOrder_isOrder {F : Type v} [Field F] [NumberField F] (O : NumberFieldOrder F) :
    IsOrder F O.toSubalgebra := by
  sorry

variable (Λ : Subalgebra ℤ E)

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

/-- `README.md`, Layer 8, 8.2: the conductor `(Λ : 𝓞_E)`, the largest `𝓞_E`-ideal inside `Λ`
(knowl `av.fq.conductor`). -/
def conductor : Submodule Λ E :=
  colon E Λ 1 (Submodule.span Λ (maximalOrder E : Set E))

/-- `README.md`, Layer 8, 8.2: `I` is invertible when `I · (Λ : I) = Λ`. -/
def IsInvertible (I : Submodule Λ E) : Prop :=
  I * colon E Λ 1 I = 1

/-- `README.md`, Layer 8, 8.6: weak equivalence is local isomorphism at every maximal ideal
(knowl `av.fq.weak_equivalence_class`). -/
def WeakEquiv (I J : Submodule Λ E) : Prop :=
  ∀ (𝔪 : Ideal Λ) [𝔪.IsMaximal],
    Nonempty (LocalizedModule 𝔪.primeCompl I ≃ₗ[Localization.AtPrime 𝔪] LocalizedModule 𝔪.primeCompl J)

/-- `README.md`, Layer 8, 8.6: the colon criterion for weak equivalence of fractional ideals. -/
theorem weakEquiv_iff_one_mem {I J : Submodule Λ E} (hI : IsFractionalIdeal E Λ I)
    (hJ : IsFractionalIdeal E Λ J) :
    WeakEquiv E Λ I J ↔ (1 : E) ∈ colon E Λ I J * colon E Λ J I := by
  sorry

/-- `README.md`, Layer 8, 8.6: weakly equivalent ideals have the same multiplier ring. -/
theorem WeakEquiv.multiplierRing_eq {I J : Submodule Λ E} (h : WeakEquiv E Λ I J) :
    multiplierRing E Λ I = multiplierRing E Λ J := by
  sorry

/-- `README.md`, Layer 8, 8.4: the trace dual `Λ^∨ = {x | Tr_{E/ℚ}(x Λ) ⊆ ℤ}`. -/
def traceDual : Submodule Λ E where
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

/-- `README.md`, Layer 8, 8.4: `Λ` is Gorenstein when its trace dual is invertible (Tau Ceti main's
`NumberFieldOrder.IsGorenstein` in the field case). -/
def IsGorenstein : Prop :=
  IsInvertible E Λ (traceDual E Λ)

/-- `README.md`, Layer 8, 8.4: `Λ` is Bass when every overorder is Gorenstein
(knowl `av.fq.bass_zfv`). -/
def IsBass : Prop :=
  ∀ Λ' : Subalgebra ℤ E, IsOrder E Λ' → Λ ≤ Λ' → IsGorenstein E Λ'

/-- `README.md`, Layer 8, 8.4: Gorenstein orders are exactly those all of whose fractional ideals
with multiplier ring `Λ` are invertible. -/
theorem isGorenstein_iff_forall_invertible (h : IsOrder E Λ) :
    IsGorenstein E Λ ↔ ∀ I : Submodule Λ E, IsFractionalIdeal E Λ I →
      multiplierRing E Λ I = 1 → IsInvertible E Λ I := by
  sorry

/-- `README.md`, Layer 8, 8.5: the Cohen–Macaulay type of `Λ` at a maximal ideal `𝔪`, the number
of generators of the canonical module `Λ^∨_𝔪`. -/
noncomputable def cmType (𝔪 : Ideal Λ) : ℕ :=
  Module.finrank (Λ ⧸ 𝔪) ((Λ ⧸ 𝔪) ⊗[Λ] traceDual E Λ)

/-- `README.md`, Layer 8, 8.5: the Cohen–Macaulay type of `Λ`, the supremum over maximal ideals
(a finite supremum: it is `1` away from the conductor). -/
noncomputable def cmTypeSup : ℕ :=
  ⨆ 𝔪 : {𝔪 : Ideal Λ // 𝔪.IsMaximal}, cmType E Λ 𝔪.1

/-- `README.md`, Layer 8, 8.5: Gorenstein means type `1`. -/
theorem isGorenstein_iff_cmTypeSup_eq_one (h : IsOrder E Λ) :
    IsGorenstein E Λ ↔ cmTypeSup E Λ = 1 := by
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
theorem finite_pic [IsReduced E] (h : IsOrder E Λ) : Finite (Pic E Λ) := by
  sorry

end Orders

/-! ### Layer 8.3: the Frobenius order `ℤ[π, q/π]` -/

section FrobeniusOrder

variable (E : Type v) [CommRing E] [Algebra ℚ E] [Module.Finite ℚ E]

/-- `README.md`, Layer 8, 8.3: the Verschiebung `V = q · π⁻¹` of a unit `π` of `E`. -/
def verschiebungOf (q : ℕ) (π : Eˣ) : E :=
  (q : E) * ((π⁻¹ : Eˣ) : E)

/-- `README.md`, Layer 8, 8.3: the Frobenius order `ℤ[π, V]` (knowl `av.fq.frobenius_order`).
For an isogeny class with squarefree `P_A`, `E = ℚ[T]/(P_A)` and `π` the class of `T`. -/
def frobeniusOrder (q : ℕ) (π : Eˣ) : Subalgebra ℤ E :=
  Algebra.adjoin ℤ {(π : E), verschiebungOf E q π}

/-- `README.md`, Layer 8, 8.3: when `π` and `V` are integral and `π` generates `E` over `ℚ`, the
Frobenius order is an order. -/
theorem isOrder_frobeniusOrder (q : ℕ) (π : Eˣ) (hπ : IsIntegral ℤ (π : E))
    (hV : IsIntegral ℤ (verschiebungOf E q π)) (hgen : Algebra.adjoin ℚ {(π : E)} = ⊤) :
    IsOrder E (frobeniusOrder E q π) := by
  sorry

/-- `README.md`, Layer 8, 8.3: `zfv_index = [𝓞_E : ℤ[π, V]]`. -/
noncomputable def zfvIndex (q : ℕ) (π : Eˣ) : ℕ :=
  index E (frobeniusOrder E q π)

/-- `README.md`, Layer 8, 8.3: `zfv_is_maximal`. -/
def zfvIsMaximal (q : ℕ) (π : Eˣ) : Prop :=
  frobeniusOrder E q π = maximalOrder E

/-- `README.md`, Layer 8, 8.4: `zfv_is_bass`. -/
def zfvIsBass (q : ℕ) (π : Eˣ) : Prop :=
  IsBass E (frobeniusOrder E q π)

/-- `README.md`, Layer 8, 8.5: `max_cohen_macaulay_type`, the supremum of the types of the
overorders of `ℤ[π, V]`. -/
noncomputable def maxCohenMacaulayType (q : ℕ) (π : Eˣ) : ℕ :=
  ⨆ Λ' : {Λ' : Subalgebra ℤ E // IsOrder E Λ' ∧ frobeniusOrder E q π ≤ Λ'}, cmTypeSup E Λ'.1

/-- `README.md`, Layer 8, 8.3: `zfv_rel_disc_norm = |N_{E/ℚ}(π − V)|`. -/
noncomputable def zfvRelDiscNorm (q : ℕ) (π : Eˣ) : ℚ :=
  |Algebra.norm ℚ ((π : E) - verschiebungOf E q π)|

/-- `README.md`, Layer 8, 8.4 and 8.5: Bass is the same as maximal Cohen–Macaulay type `1`. -/
theorem zfvIsBass_iff_maxCohenMacaulayType_eq_one (q : ℕ) (π : Eˣ)
    (h : IsOrder E (frobeniusOrder E q π)) :
    zfvIsBass E q π ↔ maxCohenMacaulayType E q π = 1 := by
  sorry

/-- `README.md`, Layer 8, 8.7: an overorder `S` of the Frobenius order is a `ℤ[F, V]`-conductor sum
when `S = ℤ[π, V] + 𝔣_S` (knowl `av.fq.is_zfvconductor_sum`). -/
def IsZfvConductorSum (q : ℕ) (π : Eˣ) (S : Subalgebra ℤ E) : Prop :=
  (Subalgebra.toSubmodule S : Submodule ℤ E) =
    Subalgebra.toSubmodule (frobeniusOrder E q π) ⊔ (conductor E S).restrictScalars ℤ

end FrobeniusOrder

/-! ### Layer 9: Deligne modules -/

/-- `README.md`, Layer 9, 9.1 (pinned convention): a Deligne module for the modulus `q` is a finite
free `ℤ`-module `M` with an endomorphism `F` that is semisimple over `ℚ`, has only `q`-Weil numbers
as eigenvalues, and satisfies `q M ⊆ F M`. -/
structure DeligneModule (q : ℕ) where
  /-- The underlying lattice. -/
  carrier : Type u
  [addCommGroup : AddCommGroup carrier]
  [free : Module.Free ℤ carrier]
  [finite : Module.Finite ℤ carrier]
  /-- The Frobenius. -/
  F : carrier →ₗ[ℤ] carrier
  /-- `F ⊗ ℚ` is semisimple. -/
  isSemisimple : Module.End.IsSemisimple (F.baseChange ℚ)
  /-- Every complex root of the characteristic polynomial has absolute value `√q`. -/
  weil : ∀ z ∈ (LinearMap.charpoly F).aroots ℂ, ‖z‖ = Real.sqrt q
  /-- `q M ⊆ F M`, so that `V = q F⁻¹` preserves `M`. -/
  divisible : ∀ m : carrier, (q : ℤ) • m ∈ LinearMap.range F

namespace DeligneModule

attribute [instance] DeligneModule.addCommGroup DeligneModule.free DeligneModule.finite

variable {q : ℕ} (M : DeligneModule.{u} q)

/-- `README.md`, Layer 9, 9.1: the polynomial of a Deligne module, `charpoly F ∈ ℤ[T]`. -/
noncomputable def charpoly : Polynomial ℤ :=
  LinearMap.charpoly M.F

/-- `README.md`, Layer 9, 9.1: the rank of a Deligne module is even. -/
theorem even_finrank : Even (Module.finrank ℤ M.carrier) := by
  sorry

/-- `README.md`, Layer 9, 9.1: the dimension, half the rank. -/
noncomputable def dim : ℕ :=
  Module.finrank ℤ M.carrier / 2

/-- `README.md`, Layer 9, 9.1: the polynomial is symmetric, `q^j a_{2g−j} = q^g a_j`. -/
theorem charpoly_symmetric (j : ℕ) (hj : j ≤ 2 * M.dim) :
    (q : ℤ) ^ j * M.charpoly.coeff (2 * M.dim - j) = (q : ℤ) ^ M.dim * M.charpoly.coeff j := by
  sorry

/-- `README.md`, Layer 9, 9.1: a Deligne module is ordinary when half the roots of its polynomial
are `p`-adic units, which is the middle-coefficient criterion of 6.2 (`p ∤ a_g`). -/
def IsOrdinary (p : ℕ) : Prop :=
  ¬ (p : ℤ) ∣ M.charpoly.coeff M.dim

/-- `README.md`, Layer 9, 9.1: morphisms of Deligne modules are `ℤ`-linear maps commuting with
`F`. -/
structure Hom (N : DeligneModule.{u} q) where
  /-- The underlying linear map. -/
  toLinearMap : M.carrier →ₗ[ℤ] N.carrier
  /-- It commutes with the Frobenii. -/
  comm : toLinearMap ∘ₗ M.F = N.F ∘ₗ toLinearMap

/-- `README.md`, Layer 9, 9.1: an isogeny of Deligne modules is an injective morphism with finite
cokernel; its degree is the index. -/
def Hom.IsIsogeny {N : DeligneModule.{u} q} (f : M.Hom N) : Prop :=
  Function.Injective f.toLinearMap ∧ Finite (N.carrier ⧸ LinearMap.range f.toLinearMap)

/-- `README.md`, Layer 9, 9.1: the `ℤ`-module of morphisms `M → N`. -/
def homSubmodule (N : DeligneModule.{u} q) : Submodule ℤ (M.carrier →ₗ[ℤ] N.carrier) where
  carrier := {f | f ∘ₗ M.F = N.F ∘ₗ f}
  add_mem' {f g} (hf : f ∘ₗ M.F = N.F ∘ₗ f) (hg : g ∘ₗ M.F = N.F ∘ₗ g) :=
    show (f + g) ∘ₗ M.F = N.F ∘ₗ (f + g) by
      rw [LinearMap.add_comp, LinearMap.comp_add, hf, hg]
  zero_mem' := show (0 : M.carrier →ₗ[ℤ] N.carrier) ∘ₗ M.F = N.F ∘ₗ 0 by simp
  smul_mem' c f (hf : f ∘ₗ M.F = N.F ∘ₗ f) :=
    show (c • f) ∘ₗ M.F = N.F ∘ₗ (c • f) by
      rw [LinearMap.smul_comp, LinearMap.comp_smul, hf]

/-- `README.md`, Layer 9, 9.1: `Hom(M, N)` is a free `ℤ`-module of rank the number of coincidences
of eigenvalues, counted with multiplicity over the root multisets of the two polynomials. -/
theorem finrank_hom_eq (N : DeligneModule.{u} q) :
    Module.finrank ℤ (M.homSubmodule N) =
      Multiset.card (((M.charpoly.aroots ℂ).product (N.charpoly.aroots ℂ)).filter
        fun z => z.1 = z.2) := by
  sorry

/-- `README.md`, Layer 9, 9.5: the group `M / (F − 1) M`, which is `A(𝔽_q)` for the abelian variety
of `M` under Deligne's or Centeleghe–Stix's dictionary. -/
abbrev pointsGroup : Type u :=
  M.carrier ⧸ LinearMap.range (M.F - (LinearMap.id : M.carrier →ₗ[ℤ] M.carrier))

/-- `README.md`, Layer 9, 9.5: `M / (F − 1) M` is finite, of order `|P_M(1)|`. -/
theorem finite_pointsGroup (hq : 1 < q) : Finite M.pointsGroup := by
  sorry

/-- `README.md`, Layer 9, 9.5 and Layer 7, 7.1: `#(M / (F − 1) M) = P_M(1)`. -/
theorem card_pointsGroup (hq : 1 < q) : Nat.card M.pointsGroup = (M.charpoly.eval 1).natAbs := by
  sorry

end DeligneModule

end TauCetiRoadmap.AbelianVarietiesOverFiniteFields
