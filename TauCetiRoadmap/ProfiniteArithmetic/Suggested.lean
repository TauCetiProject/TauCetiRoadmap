import Mathlib
import TauCetiRoadmap.ProfiniteProPGroups.Suggested

set_option autoImplicit false

/-!
# Profinite integers, profinite powers, and continuous automorphisms: target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`. These declarations pin central names and useful Lean forms; proving every item here
does not by itself complete a layer. `sorry` is allowed in this human-owned roadmap library: these
are goals, not proofs.

The file consumes `TauCetiRoadmap.ProfiniteProPGroups` directly for `IsProP`, `zHat`,
`maximalProPQuotient`, `proPFrattini`, `IsTopologicallyFinitelyGenerated`, `freeProP` and the
lower `p`-series. It builds the four generic objects that roadmap names as the exact charge of
`ProfiniteArithmetic`: the ring `ProfiniteInt` (`ẑ`), the profinite power `x ^ᶻ a` with its
`ℤ_ℓ`-comparison `padicPow`, the groups `ContinuousAut G` and `ContinuousOut G` with the
congruence topology, and the closed lower central series with its graded Lie ring.
-/

namespace TauCetiRoadmap.ProfiniteArithmetic

open TauCetiRoadmap.ProfiniteProPGroups
open scoped commutatorElement

universe u v

/-! ## Layer 0: the profinite integers as a topological ring -/

/-- **Layer 0.1.** The profinite integers as the subring of compatible systems inside
`∀ n : ℕ+, ZMod n`. ⚠ The index runs over `ℕ+`: `ZMod 0` is `ℤ`, every `n` divides `0`, and
including it would collapse the limit to `ℤ`. -/
def profiniteIntSubring : Subring (∀ n : ℕ+, ZMod (n : ℕ)) where
  carrier := {f | ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)),
    ZMod.castHom h (ZMod (n : ℕ)) (f m) = f n}
  zero_mem' := by intro m n h; simp
  one_mem' := by intro m n h; simpa using map_one (ZMod.castHom h (ZMod (n : ℕ)))
  add_mem' ha hb := by intro m n h; simp [map_add, ha m n h, hb m n h]
  mul_mem' ha hb := by intro m n h; simp [map_mul, ha m n h, hb m n h]
  neg_mem' ha := by intro m n h; simp [map_neg, ha m n h]

/-- **Layer 0.1.** The carrier `ẑ`. An `abbrev`, so that the `CommRing` and `TopologicalSpace`
instances of the ambient product restrict without transport. -/
abbrev ProfiniteInt : Type := profiniteIntSubring

/-- **Layer 0.1.** `ẑ` is a topological ring, compact and totally disconnected; Hausdorffness is
inherited from the product of the discrete rings `ZMod n`. -/
instance : IsTopologicalRing ProfiniteInt := sorry

instance : CompactSpace ProfiniteInt := sorry

instance : TotallyDisconnectedSpace ProfiniteInt := sorry

/-- **Layer 0.2.** The projection to the finite ring `ZMod n`. -/
def ProfiniteInt.toZMod (n : ℕ+) : ProfiniteInt →+* ZMod (n : ℕ) where
  toFun a := (a : ∀ m : ℕ+, ZMod (m : ℕ)) n
  map_one' := rfl
  map_mul' _ _ := rfl
  map_zero' := rfl
  map_add' _ _ := rfl

/-- **Layer 0.2.** Compatibility of the projections along divisibility. -/
theorem ProfiniteInt.castHom_toZMod (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (a : ProfiniteInt) :
    ZMod.castHom h (ZMod (n : ℕ)) (ProfiniteInt.toZMod m a) = ProfiniteInt.toZMod n a :=
  a.2 m n h

/-- **Layer 0.2.** The projections are continuous. -/
theorem ProfiniteInt.continuous_toZMod (n : ℕ+) : Continuous (ProfiniteInt.toZMod n) :=
  sorry

/-- **Layer 0.2.** Extensionality: an element of `ẑ` is determined by its projections. -/
theorem ProfiniteInt.ext_iff' {a b : ProfiniteInt} :
    a = b ↔ ∀ n : ℕ+, ProfiniteInt.toZMod n a = ProfiniteInt.toZMod n b :=
  sorry

/-- **Layer 0.2, the limit property.** A family of ring homomorphisms into the `ZMod n`,
compatible with the reduction maps, assembles into one ring homomorphism into `ẑ`. -/
noncomputable def ProfiniteInt.lift {R : Type u} [Ring R] (f : ∀ n : ℕ+, R →+* ZMod (n : ℕ))
    (hf : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (r : R),
      ZMod.castHom h (ZMod (n : ℕ)) (f m r) = f n r) :
    R →+* ProfiniteInt :=
  sorry

/-- **Layer 0.2.** The computation rule for the lift. -/
theorem ProfiniteInt.toZMod_lift {R : Type u} [Ring R] (f : ∀ n : ℕ+, R →+* ZMod (n : ℕ))
    (hf : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (r : R),
      ZMod.castHom h (ZMod (n : ℕ)) (f m r) = f n r) (n : ℕ+) (r : R) :
    ProfiniteInt.toZMod n (ProfiniteInt.lift f hf r) = f n r :=
  sorry

/-- **Layer 0.2.** The integers are dense in `ẑ`. -/
theorem ProfiniteInt.denseRange_intCast : DenseRange (fun k : ℤ => (k : ProfiniteInt)) :=
  sorry

/-- **Layer 0.2.** The integers embed in `ẑ`. -/
theorem ProfiniteInt.intCast_injective : Function.Injective (fun k : ℤ => (k : ProfiniteInt)) :=
  sorry

/-- **Layer 0.3.** The `ℓ`-adic component, a **ring** homomorphism, characterized by
`toZModPow_component` below. -/
noncomputable def ProfiniteInt.component (ℓ : ℕ) [Fact ℓ.Prime] : ProfiniteInt →+* ℤ_[ℓ] :=
  sorry

/-- **Layer 0.3.** The component is continuous. -/
theorem ProfiniteInt.continuous_component (ℓ : ℕ) [Fact ℓ.Prime] :
    Continuous (ProfiniteInt.component ℓ) :=
  sorry

/-- **Layer 0.3.** The characterizing equation of the component: reducing it modulo `ℓ ^ k` is
the projection to `ZMod (ℓ ^ k)`. -/
theorem ProfiniteInt.toZModPow_component (ℓ : ℕ) [Fact ℓ.Prime] (k : ℕ) (a : ProfiniteInt) :
    PadicInt.toZModPow k (ProfiniteInt.component ℓ a)
      = ProfiniteInt.toZMod ⟨ℓ ^ k, pow_pos (Fact.out : ℓ.Prime).pos k⟩ a :=
  sorry

/-- **Layer 0.3, the product decomposition.** `ẑ ≃ ∏_ℓ ℤ_ℓ` as topological rings. -/
theorem ProfiniteInt.nonempty_ringEquiv_pi :
    ∃ e : ProfiniteInt ≃+* (∀ ℓ : Nat.Primes, @PadicInt (ℓ : ℕ) ⟨ℓ.2⟩),
      Continuous e ∧ Continuous e.symm ∧
        ∀ (ℓ : Nat.Primes) (a : ProfiniteInt),
          e a ℓ = @ProfiniteInt.component (ℓ : ℕ) ⟨ℓ.2⟩ a :=
  sorry

/-- **Layer 0.3, idempotents.** `ω_ℓ`, the idempotent of the `ℓ`-adic factor. -/
noncomputable def ProfiniteInt.idem (ℓ : ℕ) [Fact ℓ.Prime] : ProfiniteInt :=
  sorry

/-- **Layer 0.3.** `ω_ℓ` has `ℓ`-adic component `1` and every other component `0`. -/
theorem ProfiniteInt.component_idem (ℓ ℓ' : ℕ) [Fact ℓ.Prime] [Fact ℓ'.Prime] :
    ProfiniteInt.component ℓ' (ProfiniteInt.idem ℓ) = if ℓ' = ℓ then 1 else 0 :=
  sorry

/-- **Layer 0.3.** `ω_ℓ` is idempotent. -/
theorem ProfiniteInt.idem_mul_idem (ℓ : ℕ) [Fact ℓ.Prime] :
    ProfiniteInt.idem ℓ * ProfiniteInt.idem ℓ = ProfiniteInt.idem ℓ :=
  sorry

/-- **Layer 0.3.** `ẑ` is not a domain: `ω_2 (1 - ω_2) = 0`. -/
theorem ProfiniteInt.not_isDomain : ¬ IsDomain ProfiniteInt :=
  sorry

/-- **Layer 0.4.** The unit criterion, at the finite levels and at the components. -/
theorem ProfiniteInt.isUnit_iff (a : ProfiniteInt) :
    IsUnit a ↔ ∀ n : ℕ+, IsUnit (ProfiniteInt.toZMod n a) :=
  sorry

theorem ProfiniteInt.isUnit_iff_component (a : ProfiniteInt) :
    IsUnit a ↔ ∀ (ℓ : ℕ) (_ : Fact ℓ.Prime), IsUnit (ProfiniteInt.component ℓ a) :=
  sorry

/-- **Layer 0.4, assembly of characters.** A compatible system of characters into the `(ZMod n)ˣ`
assembles into one character into `ẑˣ`. This is the form in which the cyclotomic character of
`Gal(ℚ̄/ℚ)` is assembled from Mathlib's finite levels by the successor of BelyiMaps. -/
noncomputable def ProfiniteInt.unitsLift {G : Type u} [Group G]
    (χ : ∀ n : ℕ+, G →* (ZMod (n : ℕ))ˣ)
    (hχ : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (g : G),
      Units.map (ZMod.castHom h (ZMod (n : ℕ))).toMonoidHom (χ m g) = χ n g) :
    G →* ProfiniteIntˣ :=
  sorry

theorem ProfiniteInt.map_toZMod_unitsLift {G : Type u} [Group G]
    (χ : ∀ n : ℕ+, G →* (ZMod (n : ℕ))ˣ)
    (hχ : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (g : G),
      Units.map (ZMod.castHom h (ZMod (n : ℕ))).toMonoidHom (χ m g) = χ n g)
    (n : ℕ+) (g : G) :
    Units.map (ProfiniteInt.toZMod n).toMonoidHom (ProfiniteInt.unitsLift χ hχ g) = χ n g :=
  sorry

/-- **Layer 0.4, the group comparison.** The additive group of `ẑ` is the supplier's profinite
completion of `ℤ`, by a named isomorphism pinned on the generator. -/
noncomputable def ProfiniteInt.toZHat : Multiplicative ProfiniteInt ≃ₜ* zHat :=
  sorry

theorem ProfiniteInt.toZHat_ofAdd_one :
    ProfiniteInt.toZHat (Multiplicative.ofAdd (1 : ProfiniteInt))
      = ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (Multiplicative ℤ))
          (Multiplicative.ofAdd (1 : ℤ)) :=
  sorry

/-- **Layer 0.4.** Through `component ℓ`, the maximal pro-`ℓ` quotient of the additive group of
`ẑ` is `ℤ_ℓ`; compatible with the supplier's `maximalProPQuotient_zHat_equiv_padicInt`. -/
theorem ProfiniteInt.nonempty_maximalProPQuotient_equiv (ℓ : ℕ) [Fact ℓ.Prime] :
    ∃ e : maximalProPQuotient ℓ (Multiplicative ProfiniteInt) ≃ₜ* Multiplicative ℤ_[ℓ],
      ∀ a : ProfiniteInt,
        e (QuotientGroup.mk (Multiplicative.ofAdd a))
          = Multiplicative.ofAdd (ProfiniteInt.component ℓ a) :=
  sorry

/-! ## Layer 1: profinite powers and `ℤ_ℓ`-powers -/

section Powers

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]

/-- **Layer 1.1.** The powering homomorphism: the unique continuous homomorphism
`Multiplicative ẑ →* G` sending `ofAdd 1` to `x`. -/
noncomputable def zpowHatHom (x : G) : Multiplicative ProfiniteInt →* G :=
  sorry

/-- **Layer 1.1.** The profinite power `x ^ᶻ a`. -/
noncomputable def zpowHat (x : G) (a : ProfiniteInt) : G :=
  zpowHatHom x (Multiplicative.ofAdd a)

@[inherit_doc] scoped infixl:75 " ^ᶻ " => zpowHat

theorem continuous_zpowHatHom (x : G) : Continuous (zpowHatHom x) :=
  sorry

/-- **Layer 1.1.** The pin on the generator. -/
theorem zpowHat_one (x : G) : x ^ᶻ (1 : ProfiniteInt) = x :=
  sorry

/-- **Layer 1.1, uniqueness.** Any continuous homomorphism out of `Multiplicative ẑ` sending
`ofAdd 1` to `x` is the powering homomorphism. -/
theorem zpowHatHom_unique (x : G) (f : Multiplicative ProfiniteInt →* G) (hf : Continuous f)
    (h : f (Multiplicative.ofAdd 1) = x) : f = zpowHatHom x :=
  sorry

/-- **Layer 1.1.** Agreement with integer powers. -/
theorem zpowHat_intCast (x : G) (n : ℤ) : x ^ᶻ (n : ProfiniteInt) = x ^ n :=
  sorry

theorem zpowHat_zero (x : G) : x ^ᶻ (0 : ProfiniteInt) = 1 :=
  sorry

theorem one_zpowHat (a : ProfiniteInt) : (1 : G) ^ᶻ a = 1 :=
  sorry

/-- **Layer 1.1.** The additive law. -/
theorem zpowHat_add (x : G) (a b : ProfiniteInt) : x ^ᶻ (a + b) = x ^ᶻ a * x ^ᶻ b :=
  sorry

theorem zpowHat_neg (x : G) (a : ProfiniteInt) : x ^ᶻ (-a) = (x ^ᶻ a)⁻¹ :=
  sorry

/-- **Layer 1.1.** The multiplicative law, through the ring product of Layer 0. -/
theorem zpowHat_zpowHat (x : G) (a b : ProfiniteInt) : (x ^ᶻ a) ^ᶻ b = x ^ᶻ (a * b) :=
  sorry

/-- **Layer 1.1, naturality.** The workhorse: every continuous homomorphism commutes with
profinite powers. -/
theorem map_zpowHat {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H] (f : G →* H) (hf : Continuous f) (x : G)
    (a : ProfiniteInt) : f (x ^ᶻ a) = f x ^ᶻ a :=
  sorry

/-- **Layer 1.1.** The conjugation instance of naturality. -/
theorem zpowHat_conj (g x : G) (a : ProfiniteInt) :
    (g * x * g⁻¹) ^ᶻ a = g * (x ^ᶻ a) * g⁻¹ :=
  sorry

theorem inv_zpowHat (x : G) (a : ProfiniteInt) : x⁻¹ ^ᶻ a = (x ^ᶻ a)⁻¹ :=
  sorry

/-- **Layer 1.1.** Powers of `x` commute with each other. -/
theorem zpowHat_comm (x : G) (a b : ProfiniteInt) : x ^ᶻ a * x ^ᶻ b = x ^ᶻ b * x ^ᶻ a :=
  sorry

/-- **Layer 1.1.** Continuity in the exponent, and jointly. -/
theorem continuous_zpowHat (x : G) : Continuous (fun a : ProfiniteInt => x ^ᶻ a) :=
  sorry

theorem continuous_zpowHat_prod : Continuous (fun p : G × ProfiniteInt => p.1 ^ᶻ p.2) :=
  sorry

/-- **Layer 1.2.** The closed procyclic subgroup generated by `x`. -/
def closedZpowers (x : G) : Subgroup G := (Subgroup.zpowers x).topologicalClosure

/-- **Layer 1.2.** The powers of `x` fill out its closed procyclic subgroup. -/
theorem range_zpowHat (x : G) : Set.range (fun a : ProfiniteInt => x ^ᶻ a) = closedZpowers x :=
  sorry

/-- **Layer 1.2, `ℓ`-parts.** The closed subgroup generated by `x ^ᶻ ω_ℓ` is pro-`ℓ`. -/
theorem isProP_closedZpowers_zpowHat_idem (ℓ : ℕ) [Fact ℓ.Prime] (x : G) :
    IsProP ℓ (closedZpowers (x ^ᶻ ProfiniteInt.idem ℓ)) :=
  sorry

/-- **Layer 1.2.** On a pro-`ℓ` group the `ℓ`-idempotent acts as the identity exponent. -/
theorem zpowHat_idem_of_isProP (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) :
    x ^ᶻ ProfiniteInt.idem ℓ = x :=
  sorry

/-- **Layer 1.2.** On a pro-`ℓ` group only the `ℓ`-adic factor of the exponent matters. -/
theorem zpowHat_idem_mul_of_isProP (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G)
    (a : ProfiniteInt) : x ^ᶻ (ProfiniteInt.idem ℓ * a) = x ^ᶻ a :=
  sorry

/-- **Layer 1.3.** The `ℤ_ℓ`-power on a pro-`ℓ` group, written `x ^[ℓ] u` in prose. The Lean
name avoids `^[ ]`, which Mathlib reserves for iterates. -/
noncomputable def padicPow (ℓ : ℕ) [Fact ℓ.Prime] (_hG : IsProP ℓ G) (x : G) (u : ℤ_[ℓ]) : G :=
  sorry

/-- **Layer 1.3, the comparison.** The profinite power is the `ℤ_ℓ`-power of the component. -/
theorem zpowHat_eq_padicPow_component (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G)
    (a : ProfiniteInt) : x ^ᶻ a = padicPow ℓ hG x (ProfiniteInt.component ℓ a) :=
  sorry

theorem padicPow_one (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) :
    padicPow ℓ hG x 1 = x :=
  sorry

theorem padicPow_intCast (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (n : ℤ) :
    padicPow ℓ hG x (n : ℤ_[ℓ]) = x ^ n :=
  sorry

theorem padicPow_add (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (u v : ℤ_[ℓ]) :
    padicPow ℓ hG x (u + v) = padicPow ℓ hG x u * padicPow ℓ hG x v :=
  sorry

theorem padicPow_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (u v : ℤ_[ℓ]) :
    padicPow ℓ hG (padicPow ℓ hG x u) v = padicPow ℓ hG x (u * v) :=
  sorry

/-- **Layer 1.3, naturality.** -/
theorem map_padicPow (ℓ : ℕ) [Fact ℓ.Prime] {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H] (hG : IsProP ℓ G)
    (hH : IsProP ℓ H) (f : G →* H) (hf : Continuous f) (x : G) (u : ℤ_[ℓ]) :
    f (padicPow ℓ hG x u) = padicPow ℓ hH (f x) u :=
  sorry

theorem padicPow_conj (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (g x : G) (u : ℤ_[ℓ]) :
    padicPow ℓ hG (g * x * g⁻¹) u = g * padicPow ℓ hG x u * g⁻¹ :=
  sorry

theorem inv_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (u : ℤ_[ℓ]) :
    padicPow ℓ hG x⁻¹ u = (padicPow ℓ hG x u)⁻¹ :=
  sorry

theorem continuous_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) :
    Continuous (fun p : G × ℤ_[ℓ] => padicPow ℓ hG p.1 p.2) :=
  sorry

/-- **Layer 1.3, unit exponents.** The `u`-th power is undone by the `u⁻¹`-th power. -/
theorem padicPow_units_inv (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (u : ℤ_[ℓ]ˣ) :
    padicPow ℓ hG (padicPow ℓ hG x u) ↑u⁻¹ = x :=
  sorry

/-- **Layer 1.3.** A unit power generates the same closed procyclic subgroup. -/
theorem closedZpowers_padicPow_units (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G)
    (u : ℤ_[ℓ]ˣ) : closedZpowers (padicPow ℓ hG x u) = closedZpowers x :=
  sorry

/-- **Layer 1.3.** Unit powers are injective. ⚠ False for a non-unit exponent: `x ↦ x ^ ℓ`
identifies the elements of order `ℓ` with `1`. -/
theorem padicPow_units_injective (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (u : ℤ_[ℓ]ˣ) :
    Function.Injective (fun x : G => padicPow ℓ hG x u) :=
  sorry

end Powers

/-! ## Layer 2: continuous automorphisms and outer automorphisms -/

section AutomorphismGroup

variable (G : Type u) [Group G] [TopologicalSpace G]

/-- **Layer 2.1.** The continuous automorphism group. Multiplication is composition of functions,
`(φ * ψ) x = φ (ψ x)`, matching Mathlib's `MulAut`. -/
abbrev ContinuousAut : Type u := G ≃ₜ* G

instance : Group (ContinuousAut G) where
  mul φ ψ := ψ.trans φ
  one := ContinuousMulEquiv.refl G
  inv φ := φ.symm
  mul_assoc _ _ _ := ContinuousMulEquiv.ext fun _ => rfl
  one_mul _ := ContinuousMulEquiv.ext fun _ => rfl
  mul_one _ := ContinuousMulEquiv.ext fun _ => rfl
  inv_mul_cancel φ := ContinuousMulEquiv.ext fun x => φ.symm_apply_apply x

variable {G}

theorem ContinuousAut.mul_apply (φ ψ : ContinuousAut G) (x : G) : (φ * ψ) x = φ (ψ x) := rfl

theorem ContinuousAut.one_apply (x : G) : (1 : ContinuousAut G) x = x := rfl

variable (G)

/-- **Layer 2.1.** The forgetful homomorphism to the abstract automorphism group, injective. -/
def ContinuousAut.toMulAut : ContinuousAut G →* MulAut G where
  toFun φ := φ.toMulEquiv
  map_one' := rfl
  map_mul' _ _ := rfl

theorem ContinuousAut.toMulAut_injective : Function.Injective (ContinuousAut.toMulAut G) :=
  sorry

end AutomorphismGroup

section Automorphisms

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 2.1.** Inner automorphisms, `conj g x = g * x * g⁻¹`, lifting `MulAut.conj`. -/
noncomputable def ContinuousAut.conj : G →* ContinuousAut G :=
  sorry

theorem ContinuousAut.conj_apply (g x : G) : ContinuousAut.conj G g x = g * x * g⁻¹ :=
  sorry

theorem ContinuousAut.toMulAut_conj (g : G) :
    ContinuousAut.toMulAut G (ContinuousAut.conj G g) = MulAut.conj g :=
  sorry

/-- **Layer 2.1.** The inner automorphisms form a normal subgroup. -/
instance ContinuousAut.conj_range_normal : (ContinuousAut.conj G).range.Normal :=
  sorry

/-- **Layer 2.1.** The continuous outer automorphism group. -/
abbrev ContinuousOut : Type u := ContinuousAut G ⧸ (ContinuousAut.conj G).range

/-- **Layer 2.1.** The quotient map. -/
noncomputable abbrev ContinuousOut.mk : ContinuousAut G →* ContinuousOut G :=
  QuotientGroup.mk' _

/-- **Layer 2.1, inner is inner.** An automorphism that is inner as an abstract automorphism is
the continuous inner automorphism. -/
theorem ContinuousAut.eq_conj_of_toMulAut_eq_conj (φ : ContinuousAut G) (g : G)
    (h : ContinuousAut.toMulAut G φ = MulAut.conj g) : φ = ContinuousAut.conj G g :=
  sorry

/-- **Layer 2.2.** A subgroup is topologically characteristic when every *continuous*
automorphism maps it onto itself. ⚠ Weaker than Mathlib's `Subgroup.Characteristic`, which
quantifies over abstract automorphisms; this is the notion the closed series of Layer 3 and the
supplier's `proPKernel` and `proPFrattini` satisfy. -/
def IsTopCharacteristic (N : Subgroup G) : Prop :=
  ∀ φ : ContinuousAut G, N.map φ.toMulEquiv.toMonoidHom = N

/-- **Layer 2.2.** The automorphism of a characteristic quotient induced by a continuous
automorphism. -/
noncomputable def ContinuousAut.mapQuotient (N : Subgroup G) [N.Normal]
    (_hN : IsTopCharacteristic G N) : ContinuousAut G →* MulAut (G ⧸ N) :=
  sorry

/-- **Layer 2.2, the congruence topology.** The initial topology of the maps to the finite
automorphism groups of the topologically characteristic open normal quotients. -/
noncomputable instance : TopologicalSpace (ContinuousAut G) :=
  ⨅ N : {N : OpenNormalSubgroup G // IsTopCharacteristic G N.1.1},
    TopologicalSpace.induced (ContinuousAut.mapQuotient G N.1.1 N.2) ⊥

instance : IsTopologicalGroup (ContinuousAut G) := sorry

theorem ContinuousAut.continuous_conj : Continuous (ContinuousAut.conj G) :=
  sorry

/-- **Layer 2.2, profiniteness.** Under topological finite generation the automorphism group is
profinite. ⚠ Stated under that hypothesis only. -/
theorem ContinuousAut.compactSpace (hfg : IsTopologicallyFinitelyGenerated G) :
    CompactSpace (ContinuousAut G) :=
  sorry

theorem ContinuousAut.t2Space (hfg : IsTopologicallyFinitelyGenerated G) :
    T2Space (ContinuousAut G) :=
  sorry

theorem ContinuousAut.totallyDisconnectedSpace (hfg : IsTopologicallyFinitelyGenerated G) :
    TotallyDisconnectedSpace (ContinuousAut G) :=
  sorry

/-- **Layer 2.2.** Evaluation is continuous when `G` is topologically finitely generated. -/
theorem ContinuousAut.continuous_eval (hfg : IsTopologicallyFinitelyGenerated G) :
    Continuous (fun p : ContinuousAut G × G => p.1 p.2) :=
  sorry

/-- **Layer 2.2.** The conjugacy condition `IsConj (φ x) y` cuts out a closed set of
automorphisms; this is what makes the peripheral automorphisms of a free pro-`p` group a closed
subgroup. -/
theorem ContinuousAut.isClosed_isConj [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : IsTopologicallyFinitelyGenerated G) (x y : G) :
    IsClosed {φ : ContinuousAut G | IsConj (φ x) y} :=
  sorry

/-- **Layer 2.3.** The action of the outer group on conjugacy classes. -/
noncomputable instance : MulAction (ContinuousOut G) (ConjClasses G) :=
  sorry

theorem ContinuousOut.mk_smul_mk (φ : ContinuousAut G) (x : G) :
    (ContinuousOut.mk G φ) • ConjClasses.mk x = ConjClasses.mk (φ x) :=
  sorry

/-- **Layer 2.3, the outer action of an extension.** Conjugation of `E` on a closed normal
subgroup `N`, descended to `E ⧸ N`. -/
noncomputable def outerAction {E : Type u} [Group E] [TopologicalSpace E] [IsTopologicalGroup E]
    (N : Subgroup E) [N.Normal] (_hN : IsClosed (N : Set E)) :
    E ⧸ N →* ContinuousOut N :=
  sorry

theorem outerAction_mk {E : Type u} [Group E] [TopologicalSpace E] [IsTopologicalGroup E]
    (N : Subgroup E) [N.Normal] (hN : IsClosed (N : Set E)) (e : E) (n : N) :
    ∃ φ : ContinuousAut N, ContinuousOut.mk N φ = outerAction N hN (QuotientGroup.mk e) ∧
      (φ n : E) = e * n * e⁻¹ :=
  sorry

/-- **Layer 2.4, the finite theorem.** The automorphisms of a finite `p`-group acting trivially on
its Frattini quotient form a `p`-group: they act freely on the generating tuples over a basis of
the Frattini quotient. The subgroup is stated by its membership condition. -/
def frattiniKernel (P : Type u) [Group P] : Subgroup (MulAut P) where
  carrier := {φ | ∀ x : P, (φ x)⁻¹ * x ∈ frattini P}
  one_mem' := sorry
  mul_mem' := sorry
  inv_mem' := sorry

theorem isPGroup_frattiniKernel (p : ℕ) [Fact p.Prime] (P : Type u) [Group P] [Finite P]
    (hP : IsPGroup p P) : IsPGroup p (frattiniKernel P) :=
  sorry

/-- **Layer 2.4, the pro-`p` theorem.** For a topologically finitely generated pro-`p` group the
automorphisms acting trivially on the Frattini quotient form an open pro-`p` subgroup. -/
theorem isProP_ker_toFrattiniQuotient (p : ℕ) [Fact p.Prime] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : IsProP p G) (hfg : IsTopologicallyFinitelyGenerated G)
    (hchar : IsTopCharacteristic G (proPFrattini p G)) :
    IsProP p (MonoidHom.ker (ContinuousAut.mapQuotient G (proPFrattini p G) hchar)) ∧
      IsOpen ((MonoidHom.ker (ContinuousAut.mapQuotient G (proPFrattini p G) hchar) :
        Subgroup (ContinuousAut G)) : Set (ContinuousAut G)) :=
  sorry

end Automorphisms

/-! ## Layer 3: the closed lower central series and its graded Lie ring -/

section LowerCentral

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 3.1.** The closed lower central series, 0-based: `γ_0 = G` and
`γ_{n+1} = closure ⁅γ_n, G⁆`. -/
def closedLowerCentralSeries : ℕ → Subgroup G
  | 0 => ⊤
  | n + 1 => ⁅closedLowerCentralSeries n, (⊤ : Subgroup G)⁆.topologicalClosure

theorem closedLowerCentralSeries_zero : closedLowerCentralSeries G 0 = ⊤ := rfl

theorem closedLowerCentralSeries_succ (n : ℕ) :
    closedLowerCentralSeries G (n + 1)
      = ⁅closedLowerCentralSeries G n, (⊤ : Subgroup G)⁆.topologicalClosure :=
  rfl

/-- **Layer 3.1.** Every term is normal. -/
instance closedLowerCentralSeries_normal : ∀ n : ℕ, (closedLowerCentralSeries G n).Normal
  | 0 => inferInstanceAs (⊤ : Subgroup G).Normal
  | n + 1 =>
    haveI := closedLowerCentralSeries_normal n
    Subgroup.is_normal_topologicalClosure _

theorem isClosed_closedLowerCentralSeries (n : ℕ) :
    IsClosed ((closedLowerCentralSeries G n : Subgroup G) : Set G) :=
  sorry

theorem closedLowerCentralSeries_antitone : Antitone (closedLowerCentralSeries G) :=
  sorry

/-- **Layer 3.1.** Every term is topologically characteristic. -/
theorem isTopCharacteristic_closedLowerCentralSeries (n : ℕ) :
    IsTopCharacteristic G (closedLowerCentralSeries G n) :=
  sorry

/-- **Layer 3.1.** The closed series is the closure of Mathlib's abstract series. -/
theorem closedLowerCentralSeries_eq_topologicalClosure (n : ℕ) :
    closedLowerCentralSeries G n = ((⊤ : Subgroup G).lowerCentralSeries n).topologicalClosure :=
  sorry

/-- **Layer 3.1.** Commutators raise the degree: the statement that makes the bracket below well
defined. -/
theorem commutator_mem_closedLowerCentralSeries (j k : ℕ) {x y : G}
    (hx : x ∈ closedLowerCentralSeries G j) (hy : y ∈ closedLowerCentralSeries G k) :
    ⁅x, y⁆ ∈ closedLowerCentralSeries G (j + k + 1) :=
  sorry

/-- **Layer 3.1, functoriality.** -/
theorem map_closedLowerCentralSeries_le {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] (f : G →* H) (hf : Continuous f) (n : ℕ) :
    (closedLowerCentralSeries G n).map f ≤ closedLowerCentralSeries H n :=
  sorry

/-- **Layer 3.1.** Comparison with the supplier's lower `p`-series. -/
theorem closedLowerCentralSeries_le_pLowerCentralSeries (p : ℕ) (n : ℕ) :
    closedLowerCentralSeries G n ≤ pLowerCentralSeries p G n :=
  sorry

/-- **Layer 3.1.** The series of a pro-`p` group intersects in the identity. ⚠ The terms are
not open, and the quotients `G ⧸ γ_n` are not finite: this is the closed lower central series,
not the lower `p`-series. -/
theorem iInf_closedLowerCentralSeries_eq_bot (p : ℕ) [Fact p.Prime] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : IsProP p G) :
    ⨅ n : ℕ, closedLowerCentralSeries G n = ⊥ :=
  sorry

/-- **Layer 3.2.** The graded pieces `gr_n(G) = γ_n(G) ⧸ γ_{n+1}(G)`, written additively. -/
abbrev lcsGradedPiece (n : ℕ) : Type u :=
  Additive (closedLowerCentralSeries G n ⧸
    (closedLowerCentralSeries G (n + 1)).subgroupOf (closedLowerCentralSeries G n))

/-- **Layer 3.2.** The class of an element of `γ_n(G)`. -/
def lcsGradedMk (n : ℕ) (x : closedLowerCentralSeries G n) : lcsGradedPiece G n :=
  Additive.ofMul (QuotientGroup.mk x)

/-- **Layer 3.2.** The graded pieces are abelian. -/
theorem lcsGradedPiece_add_comm (n : ℕ) (x y : lcsGradedPiece G n) : x + y = y + x :=
  sorry

/-- **Layer 3.2.** Conjugation acts trivially on every graded piece. -/
theorem lcsGradedMk_conj (n : ℕ) (g : G) (x : closedLowerCentralSeries G n) :
    lcsGradedMk G n ⟨g * x * g⁻¹, by
      simpa using (closedLowerCentralSeries_normal G n).conj_mem x x.2 g⟩ = lcsGradedMk G n x :=
  sorry

/-- **Layer 3.2, the bracket** `gr_j × gr_k → gr_{j+k+1}`, induced by the commutator. -/
def lcsBracket (j k : ℕ) :
    lcsGradedPiece G j → lcsGradedPiece G k → lcsGradedPiece G (j + k + 1) :=
  sorry

/-- **Layer 3.2.** The defining equation of the bracket on classes. -/
theorem lcsBracket_mk (j k : ℕ) (x : closedLowerCentralSeries G j)
    (y : closedLowerCentralSeries G k) :
    lcsBracket G j k (lcsGradedMk G j x) (lcsGradedMk G k y)
      = lcsGradedMk G (j + k + 1)
          ⟨⁅(x : G), (y : G)⁆, commutator_mem_closedLowerCentralSeries G j k x.2 y.2⟩ :=
  sorry

theorem lcsBracket_add_left (j k : ℕ) (x x' : lcsGradedPiece G j) (y : lcsGradedPiece G k) :
    lcsBracket G j k (x + x') y = lcsBracket G j k x y + lcsBracket G j k x' y :=
  sorry

theorem lcsBracket_add_right (j k : ℕ) (x : lcsGradedPiece G j) (y y' : lcsGradedPiece G k) :
    lcsBracket G j k x (y + y') = lcsBracket G j k x y + lcsBracket G j k x y' :=
  sorry

/-- **Layer 3.2, naturality.** -/
theorem lcsBracket_natural {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    (f : G →* H) (hf : Continuous f) (j k : ℕ) (x : closedLowerCentralSeries G j)
    (y : closedLowerCentralSeries G k) :
    lcsBracket H j k
        (lcsGradedMk H j ⟨f x, map_closedLowerCentralSeries_le G f hf j ⟨x, x.2, rfl⟩⟩)
        (lcsGradedMk H k ⟨f y, map_closedLowerCentralSeries_le G f hf k ⟨y, y.2, rfl⟩⟩)
      = lcsGradedMk H (j + k + 1)
          ⟨f ⁅(x : G), (y : G)⁆, map_closedLowerCentralSeries_le G f hf (j + k + 1)
            ⟨⁅(x : G), (y : G)⁆, commutator_mem_closedLowerCentralSeries G j k x.2 y.2, rfl⟩⟩ :=
  sorry

/-- **Layer 3.2, `ℤ_p`-bilinearity.** For a pro-`p` group the class of a `ℤ_p`-power is the
`ℤ_p`-multiple of the class, and the bracket is `ℤ_p`-bilinear; stated through `padicPow` on the
graded piece, which is an abelian pro-`p` group. -/
theorem lcsBracket_padicPow (p : ℕ) [Fact p.Prime] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsProP p G) (j k : ℕ) (x : closedLowerCentralSeries G j)
    (y : closedLowerCentralSeries G k) (u : ℤ_[p]) :
    ∃ hx : padicPow p hG (x : G) u ∈ closedLowerCentralSeries G j,
    ∃ hy : padicPow p hG (y : G) u ∈ closedLowerCentralSeries G k,
      lcsBracket G j k (lcsGradedMk G j ⟨_, hx⟩) (lcsGradedMk G k y)
        = lcsBracket G j k (lcsGradedMk G j x) (lcsGradedMk G k ⟨_, hy⟩) :=
  sorry

/-- **Layer 3.3, the spanning theorem, finite form.** Over a finite topological generating set,
every element of `gr_{n+1}` is a sum of brackets with one term per generator. -/
theorem lcsGradedPiece_eq_sum_bracket {ι : Type} [Fintype ι] (s : ι → G)
    (hs : (Subgroup.closure (Set.range s)).topologicalClosure = ⊤) (n : ℕ)
    (z : lcsGradedPiece G (0 + n + 1)) :
    ∃ y : Fin (Fintype.card ι) → lcsGradedPiece G n,
      z = (List.ofFn fun i => lcsBracket G 0 n
        (lcsGradedMk G 0 ⟨s ((Fintype.equivFin ι).symm i), Subgroup.mem_top _⟩) (y i)).sum :=
  sorry

/-- **Layer 3.4.** For the free pro-`p` group of rank `r ≥ 2` the bracket of two distinct
generators is nonzero in `gr_1`. -/
theorem lcsBracket_freeProP_ne_zero (p : ℕ) [Fact p.Prime] (r : ℕ) (i j : Fin r) (hij : i ≠ j)
    [CompactSpace (freeProP p (Fin r))] [TotallyDisconnectedSpace (freeProP p (Fin r))] :
    lcsBracket (freeProP p (Fin r)) 0 0
        (lcsGradedMk _ 0 ⟨freeProP.of p i, Subgroup.mem_top _⟩)
        (lcsGradedMk _ 0 ⟨freeProP.of p j, Subgroup.mem_top _⟩) ≠ 0 :=
  sorry

end LowerCentral

end TauCetiRoadmap.ProfiniteArithmetic
