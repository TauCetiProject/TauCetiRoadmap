import Mathlib
import TauCetiRoadmap.ProfiniteProPGroups.Suggested
import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicPow
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Basic
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Basic

set_option autoImplicit false

/-!
# Profinite integers, profinite powers, and continuous automorphisms: target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`. These declarations pin central names and useful Lean forms; proving every item here
does not by itself complete a layer. `sorry` is allowed in this human-owned roadmap library: these
are goals, not proofs.

The file consumes `TauCetiRoadmap.ProfiniteProPGroups` for `IsProP`, `maximalProPQuotient`,
`proPFrattini`, `IsTopologicallyFinitelyGenerated` and `freeProP`. It consumes Tau Ceti directly
for three objects Tau Ceti already has: the `ℤ_p`-power on a pro-`p` group
(`TauCeti.IsProP.padicPow`), the profinite completion `TauCeti.zHat` of `ℤ`, and the lower
`p`-series with its graded pieces and bracket (`TauCeti.pLowerCentralSeries`,
`TauCeti.gradedPiece`, `TauCeti.gradedBracket`), whose case `p = 0` is the closed lower central
series. Those are re-exported under this roadmap's names by reducible aliases, never constructed
again. The file builds what neither supplier has: the ring `ProfiniteInt` (`ẑ`), the profinite
power `x ^ᶻ a` in every universe, the groups `ContinuousAut G` and `ContinuousOut G` with the
congruence topology, and the `ℤ_p`-linear graded Lie algebra of the closed lower central series
with its spanning theorem.
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

/-- **Layer 0.3.** The `ℓ`-adic component, a **ring** homomorphism: Mathlib's inverse-limit
universal property `PadicInt.lift` applied to the projections to the `ZMod (ℓ ^ k)`, which are
compatible by `castHom_toZMod`. It is characterized by `toZModPow_component` below, uniquely by
`PadicInt.lift_unique`. -/
noncomputable def ProfiniteInt.component (ℓ : ℕ) [Fact ℓ.Prime] : ProfiniteInt →+* ℤ_[ℓ] :=
  PadicInt.lift (f := fun k => ProfiniteInt.toZMod ⟨ℓ ^ k, pow_pos (Fact.out : ℓ.Prime).pos k⟩)
    fun k₁ k₂ hk => RingHom.ext fun a =>
      ProfiniteInt.castHom_toZMod ⟨ℓ ^ k₂, pow_pos (Fact.out : ℓ.Prime).pos k₂⟩
        ⟨ℓ ^ k₁, pow_pos (Fact.out : ℓ.Prime).pos k₁⟩ (pow_dvd_pow ℓ hk) a

/-- **Layer 0.3.** The component is continuous. -/
theorem ProfiniteInt.continuous_component (ℓ : ℕ) [Fact ℓ.Prime] :
    Continuous (ProfiniteInt.component ℓ) :=
  sorry

/-- **Layer 0.3.** The characterizing equation of the component: reducing it modulo `ℓ ^ k` is
the projection to `ZMod (ℓ ^ k)`. This is `PadicInt.lift_spec`. -/
theorem ProfiniteInt.toZModPow_component (ℓ : ℕ) [Fact ℓ.Prime] (k : ℕ) (a : ProfiniteInt) :
    PadicInt.toZModPow k (ProfiniteInt.component ℓ a)
      = ProfiniteInt.toZMod ⟨ℓ ^ k, pow_pos (Fact.out : ℓ.Prime).pos k⟩ a :=
  RingHom.congr_fun (PadicInt.lift_spec _ k) a

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

/-- **Layer 0.4, the group comparison.** The additive group of `ẑ` is Tau Ceti's profinite
completion `TauCeti.zHat` of `ℤ` (which implements the supplier's `zHat`), by a named isomorphism
pinned on the generator. -/
noncomputable def ProfiniteInt.toZHat : Multiplicative ProfiniteInt ≃ₜ* TauCeti.zHat :=
  sorry

theorem ProfiniteInt.toZHat_ofAdd_one :
    ProfiniteInt.toZHat (Multiplicative.ofAdd (1 : ProfiniteInt)) = TauCeti.zHat.gen :=
  sorry

/-- **Layer 0.4.** Through `component ℓ`, the maximal pro-`ℓ` quotient of the additive group of
`ẑ` is `ℤ_ℓ`; compatible, through `toZHat`, with Tau Ceti's
`TauCeti.zHat.maximalProPQuotientEquivPadicInt`. -/
theorem ProfiniteInt.nonempty_maximalProPQuotient_equiv (ℓ : ℕ) [Fact ℓ.Prime] :
    ∃ e : maximalProPQuotient ℓ (Multiplicative ProfiniteInt) ≃ₜ* Multiplicative ℤ_[ℓ],
      ∀ a : ProfiniteInt,
        e (QuotientGroup.mk (Multiplicative.ofAdd a))
          = Multiplicative.ofAdd (ProfiniteInt.component ℓ a) :=
  sorry

/-! ## Layer 1: profinite powers and `ℤ_ℓ`-powers -/

/-- **Layer 1.3.** The supplier's pro-`ℓ` predicate `IsProP` is Tau Ceti's `TauCeti.IsProP`: both
say that every quotient by an open normal subgroup is an `ℓ`-group. -/
theorem isProP_iff_tauCeti (ℓ : ℕ) (G : Type u) [Group G] [TopologicalSpace G] :
    IsProP ℓ G ↔ TauCeti.IsProP ℓ G :=
  TauCeti.isProP_iff.symm

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

/-- **Layer 1.1, comparison with Tau Ceti.** For a group in `Type`, the profinite power is Tau
Ceti's `TauCeti.zHat.lift`, transported along `toZHat`. The roadmap states `x ^ᶻ a` in every
universe because `TauCeti.zHat.lift`, built on Mathlib's `ProfiniteGrp.ProfiniteCompletion`, is
confined to `Type`. -/
theorem zpowHat_eq_zHat_lift {P : Type} [Group P] [TopologicalSpace P] [IsTopologicalGroup P]
    [CompactSpace P] [TotallyDisconnectedSpace P] (x : P) (a : ProfiniteInt) :
    x ^ᶻ a = TauCeti.zHat.lift x (ProfiniteInt.toZHat (Multiplicative.ofAdd a)) :=
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

/-- **Layer 1.3.** The `ℤ_ℓ`-power on a pro-`ℓ` group, written `x ^[ℓ] u` in prose. It is Tau
Ceti's `TauCeti.IsProP.padicPow`, re-exported under the supplier's pro-`ℓ` hypothesis through
`isProP_iff_tauCeti`; this roadmap does not construct it again. The Lean name avoids `^[ ]`,
which Mathlib reserves for iterates. -/
noncomputable abbrev padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (u : ℤ_[ℓ]) : G :=
  ((isProP_iff_tauCeti ℓ G).1 hG).padicPow x u

/-- **Layer 1.3, the comparison.** The profinite power is the `ℤ_ℓ`-power of the component. -/
theorem zpowHat_eq_padicPow_component (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G)
    (a : ProfiniteInt) : x ^ᶻ a = padicPow ℓ hG x (ProfiniteInt.component ℓ a) :=
  sorry

/-- **Layer 1.3.** The calculus of the `ℤ_ℓ`-power is Tau Ceti's; the next six statements apply it
under the supplier's hypothesis. -/
theorem padicPow_one (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) :
    padicPow ℓ hG x 1 = x :=
  TauCeti.IsProP.padicPow_one _ x

theorem padicPow_intCast (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (n : ℤ) :
    padicPow ℓ hG x (n : ℤ_[ℓ]) = x ^ n :=
  TauCeti.IsProP.padicPow_intCast _ x n

theorem padicPow_add (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (u v : ℤ_[ℓ]) :
    padicPow ℓ hG x (u + v) = padicPow ℓ hG x u * padicPow ℓ hG x v :=
  TauCeti.IsProP.padicPow_add _ x u v

theorem padicPow_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (u v : ℤ_[ℓ]) :
    padicPow ℓ hG (padicPow ℓ hG x u) v = padicPow ℓ hG x (u * v) :=
  (TauCeti.IsProP.padicPow_mul _ x u v).symm

/-- **Layer 1.3, naturality.** -/
theorem map_padicPow (ℓ : ℕ) [Fact ℓ.Prime] {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H] (hG : IsProP ℓ G)
    (hH : IsProP ℓ H) (f : G →* H) (hf : Continuous f) (x : G) (u : ℤ_[ℓ]) :
    f (padicPow ℓ hG x u) = padicPow ℓ hH (f x) u :=
  TauCeti.IsProP.map_padicPow _ _ f hf x u

/-- **Layer 1.3.** The conjugation instance of `map_padicPow`, for `MulAut.conj g`. -/
theorem padicPow_conj (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (g x : G) (u : ℤ_[ℓ]) :
    padicPow ℓ hG (g * x * g⁻¹) u = g * padicPow ℓ hG x u * g⁻¹ :=
  sorry

theorem inv_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (u : ℤ_[ℓ]) :
    padicPow ℓ hG x⁻¹ u = (padicPow ℓ hG x u)⁻¹ :=
  TauCeti.IsProP.inv_padicPow _ x u

theorem continuous_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) :
    Continuous (fun p : G × ℤ_[ℓ] => padicPow ℓ hG p.1 p.2) :=
  (TauCeti.IsProP.continuous_padicPow ((isProP_iff_tauCeti ℓ G).1 hG)).comp continuous_swap

/-- **Layer 1.3, unit exponents.** The `u`-th power is undone by the `u⁻¹`-th power. -/
theorem padicPow_units_inv (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G) (u : ℤ_[ℓ]ˣ) :
    padicPow ℓ hG (padicPow ℓ hG x u) ↑u⁻¹ = x := by
  rw [padicPow_padicPow, Units.mul_inv, padicPow_one]

/-- **Layer 1.3.** A unit power generates the same closed procyclic subgroup. -/
theorem closedZpowers_padicPow_units (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (x : G)
    (u : ℤ_[ℓ]ˣ) : closedZpowers (padicPow ℓ hG x u) = closedZpowers x :=
  sorry

/-- **Layer 1.3.** Unit powers are injective. ⚠ False for a non-unit exponent: `x ↦ x ^ ℓ`
identifies the elements of order `ℓ` with `1`. -/
theorem padicPow_units_injective (ℓ : ℕ) [Fact ℓ.Prime] (hG : IsProP ℓ G) (u : ℤ_[ℓ]ˣ) :
    Function.Injective (fun x : G => padicPow ℓ hG x u) :=
  Function.LeftInverse.injective (g := fun y => padicPow ℓ hG y ↑u⁻¹)
    fun x => padicPow_units_inv ℓ hG x u

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

/-- **Layer 2.2.** The pro-`p` Frattini subgroup is topologically characteristic, for every
topological group and every `p`: a continuous automorphism permutes the open normal subgroups
that define it. -/
theorem isTopCharacteristic_proPFrattini (p : ℕ) : IsTopCharacteristic G (proPFrattini p G) :=
  sorry

/-- **Layer 2.2.** The automorphism of a characteristic quotient induced by a continuous
automorphism, pinned by `ContinuousAut.mapQuotient_mk`. -/
noncomputable def ContinuousAut.mapQuotient (N : Subgroup G) [N.Normal]
    (_hN : IsTopCharacteristic G N) : ContinuousAut G →* MulAut (G ⧸ N) :=
  sorry

/-- **Layer 2.2.** The induced automorphism sends the class of `x` to the class of `φ x`. Since
`QuotientGroup.mk` is surjective, this determines `mapQuotient`, and with it the congruence
topology below. -/
theorem ContinuousAut.mapQuotient_mk (N : Subgroup G) [N.Normal] (hN : IsTopCharacteristic G N)
    (φ : ContinuousAut G) (x : G) :
    ContinuousAut.mapQuotient G N hN φ (QuotientGroup.mk x) = QuotientGroup.mk (φ x) :=
  sorry

/-- **Layer 2.2, the congruence topology.** The initial topology of the maps to the finite
automorphism groups of the topologically characteristic open normal quotients, each carrying the
discrete topology. ⚠ In Mathlib's order on topologies `⊥` is the **discrete** topology and `⊤` the
indiscrete one (`DiscreteTopology α` is `t = ⊥`), so `induced _ ⊥` below is the initial topology
for discrete targets, as intended; `continuous_mapQuotient` records it. -/
noncomputable instance : TopologicalSpace (ContinuousAut G) :=
  ⨅ N : {N : OpenNormalSubgroup G // IsTopCharacteristic G N.1.1},
    TopologicalSpace.induced (ContinuousAut.mapQuotient G N.1.1 N.2) ⊥

omit [IsTopologicalGroup G] in
/-- **Layer 2.2.** Each characteristic quotient map is continuous into the discrete group
`MulAut (G ⧸ N)`. With the indiscrete topology `⊤` on the target this would say nothing. -/
theorem ContinuousAut.continuous_mapQuotient
    (N : {N : OpenNormalSubgroup G // IsTopCharacteristic G N.1.1}) :
    @Continuous _ _ inferInstance ⊥ (ContinuousAut.mapQuotient G N.1.1 N.2) :=
  continuous_iInf_dom (i := N) continuous_induced_dom

instance : IsTopologicalGroup (ContinuousAut G) := sorry

theorem ContinuousAut.continuous_conj : Continuous (ContinuousAut.conj G) :=
  sorry

/-- **Layer 2.2, profiniteness.** For a topologically finitely generated profinite group the
automorphism group is profinite. ⚠ Both hypotheses are needed: for `Multiplicative ℝ`, generated
topologically by `1` and `√2`, the congruence topology is indiscrete; for the discrete group
`Multiplicative (ℤ × ℤ)` it is discrete on the infinite group `GL₂(ℤ)`. -/
theorem ContinuousAut.compactSpace [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : IsTopologicallyFinitelyGenerated G) : CompactSpace (ContinuousAut G) :=
  sorry

theorem ContinuousAut.t2Space [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : IsTopologicallyFinitelyGenerated G) : T2Space (ContinuousAut G) :=
  sorry

theorem ContinuousAut.totallyDisconnectedSpace [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : IsTopologicallyFinitelyGenerated G) : TotallyDisconnectedSpace (ContinuousAut G) :=
  sorry

/-- **Layer 2.2.** Evaluation is continuous when `G` is a topologically finitely generated
profinite group. -/
theorem ContinuousAut.continuous_eval [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : IsTopologicallyFinitelyGenerated G) :
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

/-- **Layer 2.3.** The outer action of `e N` is the class of conjugation by `e`. The conjugating
automorphism `φ` is chosen once, before `n`: with the quantifiers the other way round the
statement only pins the outer action up to class-preserving automorphisms of `N`. -/
theorem outerAction_mk {E : Type u} [Group E] [TopologicalSpace E] [IsTopologicalGroup E]
    (N : Subgroup E) [N.Normal] (hN : IsClosed (N : Set E)) (e : E) :
    ∃ φ : ContinuousAut N, ContinuousOut.mk N φ = outerAction N hN (QuotientGroup.mk e) ∧
      ∀ n : N, (φ n : E) = e * n * e⁻¹ :=
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
    [TotallyDisconnectedSpace G] (hG : IsProP p G) (hfg : IsTopologicallyFinitelyGenerated G) :
    IsProP p (MonoidHom.ker (ContinuousAut.mapQuotient G (proPFrattini p G)
        (isTopCharacteristic_proPFrattini G p))) ∧
      IsOpen ((MonoidHom.ker (ContinuousAut.mapQuotient G (proPFrattini p G)
        (isTopCharacteristic_proPFrattini G p)) :
          Subgroup (ContinuousAut G)) : Set (ContinuousAut G)) :=
  sorry

end Automorphisms

/-! ## Layer 3: the closed lower central series and its graded Lie ring

The series, its graded pieces and the bracket are Tau Ceti's lower `p`-series at `p = 0`
(`TauCeti.pLowerCentralSeries 0`, `TauCeti.gradedPiece 0`, `TauCeti.gradedBracket`): the step
`closure (λᵖ ⬝ [λ, G])` loses its power term when `p = 0`. They are re-exported here under the
names of this roadmap by reducible aliases, and the laws Tau Ceti already proves are applied, not
restated as goals. What this layer owns is what Tau Ceti does not have: the `ℤ_p`-linearity of
the bracket for a pro-`p` group, the spanning theorem, the triviality of `⋂ γ_n` for a pro-`p`
group, the comparison with the lower `p`-series, and the degree-one piece of a free pro-`p`
group. -/

section LowerCentral

variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]

/-- **Layer 3.1.** The closed lower central series, 0-based: `γ_0 = G` and
`γ_{n+1} = closure ⁅γ_n, G⁆`. It is Tau Ceti's lower `p`-series at `p = 0`. -/
abbrev closedLowerCentralSeries (n : ℕ) : Subgroup G := TauCeti.pLowerCentralSeries 0 G n

theorem closedLowerCentralSeries_zero : closedLowerCentralSeries G 0 = ⊤ :=
  TauCeti.pLowerCentralSeries_zero 0 G

/-- **Layer 3.1.** The recursion: at `p = 0` the power term of Tau Ceti's step is trivial. -/
theorem closedLowerCentralSeries_succ (n : ℕ) :
    closedLowerCentralSeries G (n + 1)
      = ⁅closedLowerCentralSeries G n, (⊤ : Subgroup G)⁆.topologicalClosure := by
  show TauCeti.pLowerCentralSeries 0 G (n + 1)
    = ⁅TauCeti.pLowerCentralSeries 0 G n, (⊤ : Subgroup G)⁆.topologicalClosure
  have h1 : (fun x : G => x ^ 0) '' (TauCeti.pLowerCentralSeries 0 G n : Set G) = {1} := by
    simp only [pow_zero]
    exact Set.Nonempty.image_const ⟨1, (TauCeti.pLowerCentralSeries 0 G n).one_mem⟩ 1
  rw [TauCeti.pLowerCentralSeries_succ, TauCeti.pLowerCentralStep_def, h1,
    Subgroup.closure_singleton_one, bot_sup_eq]

/-- **Layer 3.1.** Every term is normal: Tau Ceti's instance `TauCeti.pLowerCentralSeries_normal`
applies through the alias. -/
theorem closedLowerCentralSeries_normal (n : ℕ) : (closedLowerCentralSeries G n).Normal :=
  inferInstance

theorem isClosed_closedLowerCentralSeries (n : ℕ) :
    IsClosed ((closedLowerCentralSeries G n : Subgroup G) : Set G) :=
  TauCeti.isClosed_pLowerCentralSeries n

theorem closedLowerCentralSeries_antitone : Antitone (closedLowerCentralSeries G) :=
  TauCeti.pLowerCentralSeries_antitone

/-- **Layer 3.1.** Every term is topologically characteristic: continuous isomorphisms match the
series term by term. -/
theorem isTopCharacteristic_closedLowerCentralSeries (n : ℕ) :
    IsTopCharacteristic G (closedLowerCentralSeries G n) :=
  fun φ => ContinuousMulEquiv.map_pLowerCentralSeries_eq (p := 0) φ n

/-- **Layer 3.1.** The closed series is the closure of Mathlib's abstract series. -/
theorem closedLowerCentralSeries_eq_topologicalClosure (n : ℕ) :
    closedLowerCentralSeries G n = ((⊤ : Subgroup G).lowerCentralSeries n).topologicalClosure :=
  sorry

/-- **Layer 3.1.** Commutators raise the degree: the statement that makes the bracket below well
defined. -/
theorem commutator_mem_closedLowerCentralSeries (j k : ℕ) {x y : G}
    (hx : x ∈ closedLowerCentralSeries G j) (hy : y ∈ closedLowerCentralSeries G k) :
    ⁅x, y⁆ ∈ closedLowerCentralSeries G (j + k + 1) :=
  TauCeti.commutator_mem_pLowerCentralSeries hx hy

/-- **Layer 3.1, functoriality.** -/
theorem map_closedLowerCentralSeries_le {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] (f : G →* H) (hf : Continuous f) (n : ℕ) :
    (closedLowerCentralSeries G n).map f ≤ closedLowerCentralSeries H n :=
  MonoidHom.map_pLowerCentralSeries_le f hf n

/-- **Layer 3.1.** Comparison with the lower `p`-series, for every `p`. -/
theorem closedLowerCentralSeries_le_pLowerCentralSeries (p : ℕ) (n : ℕ) :
    closedLowerCentralSeries G n ≤ TauCeti.pLowerCentralSeries p G n :=
  sorry

/-- **Layer 3.1.** The series of a pro-`p` group intersects in the identity. ⚠ The terms are
not open, and the quotients `G ⧸ γ_n` are not finite: this is the closed lower central series,
not the lower `p`-series. -/
theorem iInf_closedLowerCentralSeries_eq_bot (p : ℕ) [Fact p.Prime] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : IsProP p G) :
    ⨅ n : ℕ, closedLowerCentralSeries G n = ⊥ :=
  sorry

/-- **Layer 3.2.** The graded pieces `gr_n(G) = γ_n(G) ⧸ γ_{n+1}(G)`, written additively: Tau
Ceti's `TauCeti.gradedPiece 0 G n`. -/
abbrev lcsGradedPiece (n : ℕ) : Type u := TauCeti.gradedPiece 0 G n

/-- **Layer 3.2.** The class of an element of `γ_n(G)`: Tau Ceti's `TauCeti.gradedMk`. -/
abbrev lcsGradedMk (n : ℕ) (x : closedLowerCentralSeries G n) : lcsGradedPiece G n :=
  TauCeti.gradedMk 0 G n x

/-- **Layer 3.2.** Conjugation acts trivially on every graded piece. -/
theorem lcsGradedMk_conj (n : ℕ) (g : G) (x : closedLowerCentralSeries G n) :
    lcsGradedMk G n ⟨g * x * g⁻¹, (closedLowerCentralSeries_normal G n).conj_mem x x.2 g⟩
      = lcsGradedMk G n x :=
  TauCeti.gradedMk_eq_gradedMk_iff.2 (TauCeti.mk_conj_of_mem_pLowerCentralSeries x.2 g)

/-- **Layer 3.1.** `γ_1(G)` is the closed commutator subgroup, the kernel of the supplier's
topological abelianization. -/
theorem closedLowerCentralSeries_one :
    closedLowerCentralSeries G 1 = (commutator G).topologicalClosure := by
  rw [closedLowerCentralSeries_succ, closedLowerCentralSeries_zero]
  rfl

/-- **Layer 3.2.** The degree-zero graded piece is the supplier's topological abelianization:
`gr_0(G) = γ_0 ⧸ γ_1` with `γ_0 = G` and `γ_1 = closure ⁅G, G⁆` (`closedLowerCentralSeries_one`).
Tau Ceti's `TauCeti.gradedPieceZeroEquiv` is the algebraic part of this isomorphism. -/
noncomputable def lcsGradedPieceZeroEquiv :
    lcsGradedPiece G 0 ≃ₜ+ Additive (topAbelianization G) :=
  sorry

/-- **Layer 3.2.** The comparison on classes. It pins `lcsGradedPieceZeroEquiv`, because
`lcsGradedMk` is surjective (`TauCeti.gradedMk_surjective`). -/
theorem lcsGradedPieceZeroEquiv_mk (g : G) :
    lcsGradedPieceZeroEquiv G (lcsGradedMk G 0 ⟨g, TauCeti.mem_pLowerCentralSeries_zero 0 g⟩)
      = Additive.ofMul (QuotientGroup.mk g : topAbelianization G) :=
  sorry

/-- **Layer 3.1.** A `ℤ_p`-power of an element of `γ_n(G)` stays in `γ_n(G)`, the term being
closed (Tau Ceti's `TauCeti.IsProP.padicPow_mem`). -/
theorem padicPow_mem_closedLowerCentralSeries (p : ℕ) [Fact p.Prime] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : IsProP p G) {n : ℕ} {x : G}
    (hx : x ∈ closedLowerCentralSeries G n) (u : ℤ_[p]) :
    padicPow p hG x u ∈ closedLowerCentralSeries G n :=
  TauCeti.IsProP.padicPow_mem _ (TauCeti.isClosed_pLowerCentralSeries n) hx u

/-- **Layer 3.2, the bracket** `gr_j × gr_k → gr_{j+k+1}`, induced by the commutator: Tau Ceti's
`TauCeti.gradedBracket 0 G j k`, which is biadditive, alternating and satisfies the Jacobi
identity (`TauCeti.gradedBracket_self`, `TauCeti.gradedBracket_jacobi`). -/
abbrev lcsBracket (j k : ℕ) (x : lcsGradedPiece G j) (y : lcsGradedPiece G k) :
    lcsGradedPiece G (j + k + 1) :=
  TauCeti.gradedBracket 0 G j k x y

/-- **Layer 3.2.** The defining equation of the bracket on classes. -/
theorem lcsBracket_mk (j k : ℕ) (x : closedLowerCentralSeries G j)
    (y : closedLowerCentralSeries G k) :
    lcsBracket G j k (lcsGradedMk G j x) (lcsGradedMk G k y)
      = lcsGradedMk G (j + k + 1)
          ⟨⁅(x : G), (y : G)⁆, commutator_mem_closedLowerCentralSeries G j k x.2 y.2⟩ :=
  TauCeti.gradedBracket_gradedMk x y

theorem lcsBracket_add_left (j k : ℕ) (x x' : lcsGradedPiece G j) (y : lcsGradedPiece G k) :
    lcsBracket G j k (x + x') y = lcsBracket G j k x y + lcsBracket G j k x' y := by
  simp only [lcsBracket, map_add, AddMonoidHom.add_apply]

theorem lcsBracket_add_right (j k : ℕ) (x : lcsGradedPiece G j) (y y' : lcsGradedPiece G k) :
    lcsBracket G j k x (y + y') = lcsBracket G j k x y + lcsBracket G j k x y' := by
  simp only [lcsBracket, map_add]

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

/-- **Layer 3.2, `ℤ_p`-linearity in the first variable.** For a pro-`p` group the class of
`⁅x ^[p] u, y⁆` is the class of `⁅x, y⁆ ^[p] u`. Together with `lcsBracket_mk` this says
`[u • x̄, ȳ] = u • [x̄, ȳ]` for the `ℤ_p`-module structure of the abelian pro-`p` groups
`gr_n(G)` (Tau Ceti's `TauCeti.IsProP.module`). -/
theorem lcsBracket_padicPow_left (p : ℕ) [Fact p.Prime] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : IsProP p G) (j k : ℕ) (x : closedLowerCentralSeries G j)
    (y : closedLowerCentralSeries G k) (u : ℤ_[p]) :
    ∃ hx : padicPow p hG (x : G) u ∈ closedLowerCentralSeries G j,
    ∃ hxy : padicPow p hG ⁅(x : G), (y : G)⁆ u ∈ closedLowerCentralSeries G (j + k + 1),
      lcsBracket G j k (lcsGradedMk G j ⟨_, hx⟩) (lcsGradedMk G k y)
        = lcsGradedMk G (j + k + 1) ⟨_, hxy⟩ :=
  sorry

/-- **Layer 3.2, `ℤ_p`-linearity in the second variable.** -/
theorem lcsBracket_padicPow_right (p : ℕ) [Fact p.Prime] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : IsProP p G) (j k : ℕ) (x : closedLowerCentralSeries G j)
    (y : closedLowerCentralSeries G k) (u : ℤ_[p]) :
    ∃ hy : padicPow p hG (y : G) u ∈ closedLowerCentralSeries G k,
    ∃ hxy : padicPow p hG ⁅(x : G), (y : G)⁆ u ∈ closedLowerCentralSeries G (j + k + 1),
      lcsBracket G j k (lcsGradedMk G j x) (lcsGradedMk G k ⟨_, hy⟩)
        = lcsGradedMk G (j + k + 1) ⟨_, hxy⟩ :=
  sorry

/-- **Layer 3.3, the spanning theorem, finite form.** Over a finite topological generating set of
a compact group, every element of `gr_{n+1}` is a sum of brackets with one term per generator.
⚠ Compactness is needed: the set of such sums is closed because it is the image of the compact
group `gr_n ^ ι`. Without it the statement fails, for instance for the Heisenberg-type group
`ℤ × ℤ² × ℝ` whose commutator form `a (b₁ + √2 b₂)` has dense image in `gr_1 ≅ ℝ`. -/
theorem lcsGradedPiece_eq_sum_bracket [CompactSpace G] {ι : Type} [Fintype ι] (s : ι → G)
    (hs : (Subgroup.closure (Set.range s)).topologicalClosure = ⊤) (n : ℕ)
    (z : lcsGradedPiece G (0 + n + 1)) :
    ∃ y : Fin (Fintype.card ι) → lcsGradedPiece G n,
      z = (List.ofFn fun i => lcsBracket G 0 n
        (lcsGradedMk G 0 ⟨s ((Fintype.equivFin ι).symm i),
          TauCeti.mem_pLowerCentralSeries_zero 0 _⟩) (y i)).sum :=
  sorry

end LowerCentral

/-! ### Layer 3.4: the free pro-`p` group in degrees zero and one

Both degrees are proved directly, by detecting homomorphisms: to `Multiplicative ℤ_[p]` in degree
zero and to the Heisenberg group over `ℤ_p` in degree one. No comparison with the pro-`p`
completion of a discrete free nilpotent group is needed. -/

/-- **Layer 3.4, the detecting group.** The Heisenberg group over `ℤ_p`: triples `(a, b, c)` with
`(a, b, c) (a', b', c') = (a + a', b + b', c + c' + a b')`, topologized as `ℤ_p³`. Its commutators
are central: `⁅(a, b, c), (a', b', c')⁆ = (0, 0, a b' - a' b)` (`HeisenbergZp.commutatorElement_eq`). -/
@[ext] structure HeisenbergZp (p : ℕ) [Fact p.Prime] where
  /-- The first coordinate. -/
  a : ℤ_[p]
  /-- The second coordinate. -/
  b : ℤ_[p]
  /-- The central coordinate. -/
  c : ℤ_[p]

namespace HeisenbergZp

variable {p : ℕ} [Fact p.Prime]

noncomputable instance : Mul (HeisenbergZp p) := ⟨fun g h => ⟨g.a + h.a, g.b + h.b, g.c + h.c + g.a * h.b⟩⟩

noncomputable instance : One (HeisenbergZp p) := ⟨⟨0, 0, 0⟩⟩

noncomputable instance : Inv (HeisenbergZp p) := ⟨fun g => ⟨-g.a, -g.b, g.a * g.b - g.c⟩⟩

@[simp] theorem mul_a (g h : HeisenbergZp p) : (g * h).a = g.a + h.a := rfl

@[simp] theorem mul_b (g h : HeisenbergZp p) : (g * h).b = g.b + h.b := rfl

@[simp] theorem mul_c (g h : HeisenbergZp p) : (g * h).c = g.c + h.c + g.a * h.b := rfl

@[simp] theorem one_a : (1 : HeisenbergZp p).a = 0 := rfl

@[simp] theorem one_b : (1 : HeisenbergZp p).b = 0 := rfl

@[simp] theorem one_c : (1 : HeisenbergZp p).c = 0 := rfl

@[simp] theorem inv_a (g : HeisenbergZp p) : g⁻¹.a = -g.a := rfl

@[simp] theorem inv_b (g : HeisenbergZp p) : g⁻¹.b = -g.b := rfl

@[simp] theorem inv_c (g : HeisenbergZp p) : g⁻¹.c = g.a * g.b - g.c := rfl

noncomputable instance : Group (HeisenbergZp p) where
  mul := (· * ·)
  one := 1
  inv := (·⁻¹)
  mul_assoc g h k := by ext <;> simp <;> ring
  one_mul g := by ext <;> simp
  mul_one g := by ext <;> simp
  inv_mul_cancel g := by ext <;> simp

/-- The topology of `ℤ_p³`, transported along the coordinates. -/
noncomputable instance : TopologicalSpace (HeisenbergZp p) :=
  TopologicalSpace.induced (fun g : HeisenbergZp p => (g.a, g.b, g.c)) inferInstance

instance : IsTopologicalGroup (HeisenbergZp p) := sorry

instance : CompactSpace (HeisenbergZp p) := sorry

instance : TotallyDisconnectedSpace (HeisenbergZp p) := sorry

/-- **Layer 3.4.** The Heisenberg group over `ℤ_p` is pro-`p`: the triples with all coordinates
in `p ^ n ℤ_p` form an open normal subgroup of index `p ^ (3 n)`, and these subgroups form a
basis of neighbourhoods of `1`. -/
theorem isProP : IsProP p (HeisenbergZp p) :=
  sorry

/-- **Layer 3.4.** Commutators are central, with third coordinate `a b' - a' b`. -/
theorem commutatorElement_eq (g h : HeisenbergZp p) :
    ⁅g, h⁆ = ⟨0, 0, g.a * h.b - h.a * g.b⟩ := by
  ext <;> simp [commutatorElement_def]
  ring

end HeisenbergZp

section FreeGraded

/-- **Layer 3.4, degree zero.** For the free pro-`p` group `F` of rank `r`, the classes of the
generators form a `ℤ_p`-basis of `gr_0(F)`: `a ↦ Σ_i [x_i ^[p] a_i]` is a bijection
`(Fin r → ℤ_[p]) → gr_0(F)`. Through `lcsGradedPieceZeroEquiv` this identifies the topological
abelianization of `F` with `ℤ_p ^ r`. -/
theorem lcsGradedPiece_zero_freeProP_bijective (p : ℕ) [Fact p.Prime] (r : ℕ)
    [CompactSpace (freeProP p (Fin r))] [TotallyDisconnectedSpace (freeProP p (Fin r))]
    (hF : IsProP p (freeProP p (Fin r))) :
    Function.Bijective fun a : Fin r → ℤ_[p] =>
      ∑ i, lcsGradedMk (freeProP p (Fin r)) 0
        ⟨padicPow p hF (freeProP.of p i) (a i), TauCeti.mem_pLowerCentralSeries_zero 0 _⟩ :=
  sorry

/-- **Layer 3.4, detection.** For `i ≠ j` there is a continuous homomorphism from the free pro-`p`
group to the Heisenberg group with `x_i ↦ (1, 0, 0)`, `x_j ↦ (0, 1, 0)` and every other generator
`↦ 1`, by the universal property of `freeProP`, the Heisenberg group being pro-`p`. -/
theorem exists_heisenberg_detect (p : ℕ) [Fact p.Prime] (r : ℕ) (i j : Fin r) (hij : i ≠ j) :
    ∃ f : freeProP p (Fin r) →* HeisenbergZp p, Continuous f ∧
      f (freeProP.of p i) = ⟨1, 0, 0⟩ ∧ f (freeProP.of p j) = ⟨0, 1, 0⟩ ∧
      ∀ k, k ≠ i → k ≠ j → f (freeProP.of p k) = 1 :=
  sorry

/-- **Layer 3.4, degree one.** For the free pro-`p` group `F` of rank `r`, the classes
`[x̄_i, x̄_j]`, `i < j`, form a `ℤ_p`-basis of `gr_1(F)`: `c ↦ Σ_{i<j} [⁅x_i, x_j⁆ ^[p] c_ij]` is a
bijection. Equivalently `gr_1(F) ≅ Λ² gr_0(F)`, with `x̄_i ∧ x̄_j ↦ [x̄_i, x̄_j]`. Surjectivity is
the spanning theorem of 3.3 with the Lie identities; injectivity reads off each coefficient
`c_ij` through the homomorphism of `exists_heisenberg_detect`, since the Heisenberg group has
`gr_1 = γ_1 ≅ ℤ_p`. -/
theorem lcsGradedPiece_one_freeProP_bijective (p : ℕ) [Fact p.Prime] (r : ℕ)
    [CompactSpace (freeProP p (Fin r))] [TotallyDisconnectedSpace (freeProP p (Fin r))]
    (hF : IsProP p (freeProP p (Fin r))) :
    Function.Bijective fun c : {ij : Fin r × Fin r // ij.1 < ij.2} → ℤ_[p] =>
      ∑ ij, lcsGradedMk (freeProP p (Fin r)) 1
        ⟨padicPow p hF ⁅freeProP.of p ij.1.1, freeProP.of p ij.1.2⁆ (c ij),
          padicPow_mem_closedLowerCentralSeries _ p hF
            (commutator_mem_closedLowerCentralSeries _ 0 0
              (TauCeti.mem_pLowerCentralSeries_zero 0 _)
              (TauCeti.mem_pLowerCentralSeries_zero 0 _))
            (c ij)⟩ :=
  sorry

/-- **Layer 3.4, nonvanishing.** For the free pro-`p` group of rank `r ≥ 2` the bracket of two
distinct generators is nonzero in `gr_1`: a consequence of `lcsGradedPiece_one_freeProP_bijective`
and the alternation of the bracket. -/
theorem lcsBracket_freeProP_ne_zero (p : ℕ) [Fact p.Prime] (r : ℕ) (i j : Fin r) (hij : i ≠ j)
    [CompactSpace (freeProP p (Fin r))] [TotallyDisconnectedSpace (freeProP p (Fin r))] :
    lcsBracket (freeProP p (Fin r)) 0 0
        (lcsGradedMk _ 0 ⟨freeProP.of p i, TauCeti.mem_pLowerCentralSeries_zero 0 _⟩)
        (lcsGradedMk _ 0 ⟨freeProP.of p j, TauCeti.mem_pLowerCentralSeries_zero 0 _⟩) ≠ 0 :=
  sorry

end FreeGraded

end TauCetiRoadmap.ProfiniteArithmetic
