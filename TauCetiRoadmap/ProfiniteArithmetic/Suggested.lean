import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.ProP.PadicPow
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.PadicInt
import TauCeti.Topology.Algebra.Group.Profinite.Completion
import TauCeti.Topology.Algebra.Group.Profinite.Free.ProP
import TauCeti.Topology.Algebra.Group.Generation
import TauCeti.Topology.Algebra.Group.LowerCentralSeries.Graded.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Frattini.Basic
import TauCeti.Topology.Algebra.Group.Profinite.MaximalProP
import TauCeti.GroupTheory.SpecificGroups.Heisenberg

set_option autoImplicit false

/-!
# Profinite integers, profinite powers, and continuous automorphisms: target signatures

**This file is not the roadmap and it is not exhaustive.** The definitive specification is
`README.md`. These declarations pin central names and useful Lean forms; proving every item here
does not by itself complete a layer. `sorry` is allowed in this human-owned roadmap library: these
are goals, not proofs.

Every object this file starts from is a Tau Ceti declaration, used directly: pro-`p` groups and
the pro-`p` kernel (`TauCeti.IsProP`, `TauCeti.proPKernel`), the pro-`p` Frattini subgroup
(`TauCeti.proPFrattini`), topological finite generation
(`TauCeti.IsTopologicallyFinitelyGenerated`), free pro-`p` groups (`TauCeti.freeProP`), the
profinite integers `TauCeti.zHat`, the `ℤ_p`-power
`TauCeti.IsProP.padicPow`, and the lower `p`-series with its graded pieces and bracket
(`TauCeti.pLowerCentralSeries`, `TauCeti.gradedPiece`, `TauCeti.gradedBracket`), whose case
`p = 0` is the closed lower central series. ProfiniteProPGroups specifies the first five; this
file consumes their Tau Ceti implementations and nothing from that roadmap's `Suggested.lean`.

There is one profinite-integers object, `TauCeti.zHat`. Layer 0 puts the ring structure on its
additive presentation `Additive TauCeti.zHat`, written `ẑ`, and Layer 1 defines the profinite
power `x ^ᶻ a` as `TauCeti.zHat.lift x a`. Two declarations here are target signatures for
existing Tau Ceti declarations whose universe is generalized in place:
`ProfiniteCompletion.continuousMonoidHomEquiv` and `zHat.lift`. Everything else under the
`zHat` namespace is new API that belongs in Tau Ceti's `TauCeti.zHat` namespace; this library
cannot extend that namespace, so it pins the API as `TauCetiRoadmap.ProfiniteArithmetic.zHat`.
The rest of the file builds the groups `ContinuousAut G` and `ContinuousOut G` with the congruence
topology, and the `ℤ_p`-linear graded Lie algebra of the closed lower central series with its
spanning theorem.
-/

namespace TauCetiRoadmap.ProfiniteArithmetic

open scoped commutatorElement

universe u v

/-! ## Layer 0: the ring structure on the profinite integers -/

/-- The additive presentation of Tau Ceti's profinite integers `TauCeti.zHat`, the carrier of the
ring of Layer 0. This is notation, not a new type. -/
scoped notation "ẑ" => Additive TauCeti.zHat

/-- **Layer 0.1, the ring structure.** Multiplication by `a` is the continuous endomorphism of
`TauCeti.zHat` that sends the generator to `a`, as multiplication by an integer is on `ℤ`; so
`a * b` is `TauCeti.zHat.lift a b`, read additively. The unit is the generator `TauCeti.zHat.gen`,
the casts of natural numbers and integers are its powers, and the addition is that of
`Additive TauCeti.zHat`, commutative because `TauCeti.zHat` is. -/
noncomputable instance : CommRing ẑ :=
  { (inferInstance : AddGroup ẑ) with
    add_comm := fun a b => mul_comm' (Additive.toMul a) (Additive.toMul b)
    mul := fun a b => Additive.ofMul (TauCeti.zHat.lift (Additive.toMul a) (Additive.toMul b))
    one := Additive.ofMul TauCeti.zHat.gen
    natCast := fun n => Additive.ofMul (TauCeti.zHat.gen ^ n)
    natCast_zero := by simp
    natCast_succ := fun n => by
      show Additive.ofMul (TauCeti.zHat.gen ^ (n + 1))
        = Additive.ofMul (TauCeti.zHat.gen ^ n) + Additive.ofMul TauCeti.zHat.gen
      rw [pow_succ]
      rfl
    intCast := fun n => Additive.ofMul (TauCeti.zHat.gen ^ n)
    intCast_ofNat := fun n => by
      show Additive.ofMul (TauCeti.zHat.gen ^ (n : ℤ)) = Additive.ofMul (TauCeti.zHat.gen ^ n)
      rw [zpow_natCast]
    intCast_negSucc := fun n => by
      show Additive.ofMul (TauCeti.zHat.gen ^ (Int.negSucc n))
        = -Additive.ofMul (TauCeti.zHat.gen ^ (n + 1))
      rw [zpow_negSucc]
      rfl
    mul_assoc := sorry
    one_mul := sorry
    mul_one := sorry
    left_distrib := sorry
    right_distrib := sorry
    zero_mul := sorry
    mul_zero := sorry
    mul_comm := sorry }

/-- **Layer 0.1.** `ẑ` is a topological ring. The additive topological group structure, compactness
and total disconnectedness are those of `TauCeti.zHat`; what is proved is the joint continuity of
the product, which at every finite level `ZMod n` is the product of residues. -/
instance : IsTopologicalRing ẑ := sorry

namespace zHat

/-- **Layer 0.2.** The projection to `ZMod n`: the continuous homomorphism from `TauCeti.zHat` to
the finite group `Multiplicative (ZMod n)` sending the generator to `ofAdd 1`, read additively. It
is a ring homomorphism for the product of 0.1. -/
noncomputable def toZMod (n : ℕ+) : ẑ →+* ZMod (n : ℕ) where
  toFun a := Multiplicative.toAdd
    (TauCeti.zHat.lift (Multiplicative.ofAdd (1 : ZMod (n : ℕ))) (Additive.toMul a))
  map_one' := by
    show Multiplicative.toAdd (TauCeti.zHat.lift _ TauCeti.zHat.gen) = 1
    rw [TauCeti.zHat.lift_gen]
    rfl
  map_mul' := sorry
  map_zero' := by
    show Multiplicative.toAdd (TauCeti.zHat.lift _ 1) = 0
    rw [map_one]
    rfl
  map_add' a b := by
    show Multiplicative.toAdd (TauCeti.zHat.lift _ (Additive.toMul a * Additive.toMul b)) = _
    rw [map_mul]
    rfl

/-- **Layer 0.2.** The projections are continuous. -/
theorem continuous_toZMod (n : ℕ+) : Continuous (toZMod n) :=
  continuous_toAdd.comp ((TauCeti.zHat.lift _).continuous.comp continuous_toMul)

/-- **Layer 0.2.** Compatibility of the projections along divisibility. -/
theorem castHom_toZMod (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (a : ẑ) :
    ZMod.castHom h (ZMod (n : ℕ)) (toZMod m a) = toZMod n a :=
  sorry

/-- **Layer 0.2.** Extensionality: an element of `ẑ` is determined by its projections. -/
theorem ext_iff_toZMod {a b : ẑ} : a = b ↔ ∀ n : ℕ+, toZMod n a = toZMod n b :=
  sorry

/-- **Layer 0.2, the limit property.** A family of ring homomorphisms into the `ZMod n`, compatible
with the reduction maps, assembles into one ring homomorphism into `ẑ`. With `ext_iff_toZMod` this
is the description of `ẑ` as the inverse limit of the `ZMod n`, a characterization of the ring and
not a second carrier. -/
noncomputable def ringLift {R : Type u} [Ring R] (f : ∀ n : ℕ+, R →+* ZMod (n : ℕ))
    (hf : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (r : R),
      ZMod.castHom h (ZMod (n : ℕ)) (f m r) = f n r) :
    R →+* ẑ :=
  sorry

/-- **Layer 0.2.** The computation rule for the lift. -/
theorem toZMod_ringLift {R : Type u} [Ring R] (f : ∀ n : ℕ+, R →+* ZMod (n : ℕ))
    (hf : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (r : R),
      ZMod.castHom h (ZMod (n : ℕ)) (f m r) = f n r) (n : ℕ+) (r : R) :
    toZMod n (ringLift f hf r) = f n r :=
  sorry

/-- **Layer 0.2.** The integers are dense in `ẑ`: Tau Ceti's `TauCeti.zHat.denseRange_ofInt`, read
additively. -/
theorem denseRange_intCast : DenseRange (fun k : ℤ => (k : ẑ)) :=
  sorry

/-- **Layer 0.2.** The integers embed in `ẑ`. -/
theorem intCast_injective : Function.Injective (fun k : ℤ => (k : ẑ)) :=
  sorry

/-- **Layer 0.3.** The `ℓ`-adic component, a **ring** homomorphism: Mathlib's inverse-limit
universal property `PadicInt.lift` applied to the projections to the `ZMod (ℓ ^ k)`, which are
compatible by `castHom_toZMod`. It is characterized by `toZModPow_component` below, uniquely by
`PadicInt.lift_unique`. -/
noncomputable def component (ℓ : ℕ) [Fact ℓ.Prime] : ẑ →+* ℤ_[ℓ] :=
  PadicInt.lift (f := fun k => toZMod ⟨ℓ ^ k, pow_pos (Fact.out : ℓ.Prime).pos k⟩)
    fun k₁ k₂ hk => RingHom.ext fun a =>
      castHom_toZMod ⟨ℓ ^ k₂, pow_pos (Fact.out : ℓ.Prime).pos k₂⟩
        ⟨ℓ ^ k₁, pow_pos (Fact.out : ℓ.Prime).pos k₁⟩ (pow_dvd_pow ℓ hk) a

/-- **Layer 0.3.** The component is continuous. -/
theorem continuous_component (ℓ : ℕ) [Fact ℓ.Prime] : Continuous (component ℓ) :=
  sorry

/-- **Layer 0.3.** The characterizing equation of the component: reducing it modulo `ℓ ^ k` is
the projection to `ZMod (ℓ ^ k)`. This is `PadicInt.lift_spec`. -/
theorem toZModPow_component (ℓ : ℕ) [Fact ℓ.Prime] (k : ℕ) (a : ẑ) :
    PadicInt.toZModPow k (component ℓ a)
      = toZMod ⟨ℓ ^ k, pow_pos (Fact.out : ℓ.Prime).pos k⟩ a :=
  RingHom.congr_fun (PadicInt.lift_spec _ k) a

/-- **Layer 0.3, compatibility with Tau Ceti's pro-`ℓ` quotient.** Tau Ceti's identification
`TauCeti.zHat.maximalProPQuotientEquivPadicInt` of the maximal pro-`ℓ` quotient of `TauCeti.zHat`
with `ℤ_ℓ` sends the class of `a` to its component: the two descriptions of the `ℓ`-adic part of
`ẑ` are one map. -/
theorem maximalProPQuotientEquivPadicInt_mk_eq_component (ℓ : ℕ) [Fact ℓ.Prime] (a : ẑ) :
    TauCeti.zHat.maximalProPQuotientEquivPadicInt ℓ
        (TauCeti.maximalProPQuotient.mk ℓ TauCeti.zHat (Additive.toMul a))
      = Multiplicative.ofAdd (component ℓ a) :=
  sorry

/-- **Layer 0.3, the product decomposition.** `ẑ ≃ ∏_ℓ ℤ_ℓ` as topological rings. -/
theorem nonempty_ringEquiv_pi :
    ∃ e : ẑ ≃+* (∀ ℓ : Nat.Primes, @PadicInt (ℓ : ℕ) ⟨ℓ.2⟩),
      Continuous e ∧ Continuous e.symm ∧
        ∀ (ℓ : Nat.Primes) (a : ẑ), e a ℓ = @component (ℓ : ℕ) ⟨ℓ.2⟩ a :=
  sorry

/-- **Layer 0.3, idempotents.** `ω_ℓ`, the idempotent of the `ℓ`-adic factor. -/
noncomputable def idem (ℓ : ℕ) [Fact ℓ.Prime] : ẑ :=
  sorry

/-- **Layer 0.3.** `ω_ℓ` has `ℓ`-adic component `1` and every other component `0`. -/
theorem component_idem (ℓ ℓ' : ℕ) [Fact ℓ.Prime] [Fact ℓ'.Prime] :
    component ℓ' (idem ℓ) = if ℓ' = ℓ then 1 else 0 :=
  sorry

/-- **Layer 0.3.** `ω_ℓ` is idempotent. -/
theorem idem_mul_idem (ℓ : ℕ) [Fact ℓ.Prime] : idem ℓ * idem ℓ = idem ℓ :=
  sorry

/-- **Layer 0.3.** `ẑ` is not a domain: `ω_2 (1 - ω_2) = 0`. -/
theorem not_isDomain : ¬ IsDomain ẑ :=
  sorry

/-- **Layer 0.4.** The unit criterion, at the finite levels and at the components. -/
theorem isUnit_iff (a : ẑ) : IsUnit a ↔ ∀ n : ℕ+, IsUnit (toZMod n a) :=
  sorry

theorem isUnit_iff_component (a : ẑ) :
    IsUnit a ↔ ∀ (ℓ : ℕ) (_ : Fact ℓ.Prime), IsUnit (component ℓ a) :=
  sorry

/-- **Layer 0.4, assembly of characters.** A compatible system of characters into the `(ZMod n)ˣ`
assembles into one character into `ẑˣ`. This is the form in which the cyclotomic character of
`Gal(ℚ̄/ℚ)` is assembled from Mathlib's finite levels by the successor of BelyiMaps. -/
noncomputable def unitsLift {G : Type u} [Group G] (χ : ∀ n : ℕ+, G →* (ZMod (n : ℕ))ˣ)
    (hχ : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (g : G),
      Units.map (ZMod.castHom h (ZMod (n : ℕ))).toMonoidHom (χ m g) = χ n g) :
    G →* ẑˣ :=
  sorry

theorem map_toZMod_unitsLift {G : Type u} [Group G] (χ : ∀ n : ℕ+, G →* (ZMod (n : ℕ))ˣ)
    (hχ : ∀ (m n : ℕ+) (h : (n : ℕ) ∣ (m : ℕ)) (g : G),
      Units.map (ZMod.castHom h (ZMod (n : ℕ))).toMonoidHom (χ m g) = χ n g)
    (n : ℕ+) (g : G) :
    Units.map (toZMod n).toMonoidHom (unitsLift χ hχ g) = χ n g :=
  sorry

end zHat

/-! ## Layer 1: profinite powers and `ℤ_ℓ`-powers -/

namespace ProfiniteCompletion

/-- **Layer 1.1, the universal property of profinite completion in every universe.** Target
signature for Tau Ceti's `TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv`, generalized in
place from profinite targets in the universe of `G` to profinite targets in any universe. The
restriction comes from Mathlib's `ProfiniteGrp.ProfiniteCompletion.homEquiv`; the generalization
builds the continuous homomorphism level by level, through the finite quotients `P ⧸ U`, with Tau
Ceti's limit description `TauCeti.existsUnique_monoidHom_mk'_comp_eq`. -/
noncomputable def continuousMonoidHomEquiv (G : Type u) [Group G] (P : Type v) [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] :
    (ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of G) →ₜ* P) ≃ (G →* P) :=
  sorry

/-- **Layer 1.1.** The generalized correspondence restricts along the canonical map, as Tau Ceti's
`TauCeti.ProfiniteCompletion.continuousMonoidHomEquiv_apply` does in one universe. -/
theorem continuousMonoidHomEquiv_apply (G : Type u) [Group G] (P : Type v) [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P]
    (f : ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of G) →ₜ* P) (g : G) :
    continuousMonoidHomEquiv G P f g = f (ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of G) g) :=
  sorry

end ProfiniteCompletion

namespace zHat

variable {P : Type v} [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
  [TotallyDisconnectedSpace P]

/-- **Layer 1.1.** Target signature for Tau Ceti's `TauCeti.zHat.lift` after the generalization of
its target universe: the continuous homomorphism from `TauCeti.zHat` to a profinite group in any
universe sending the generator to `a`. It is defined exactly as Tau Ceti defines it, through the
generalized universal property; in Tau Ceti it replaces the `Type`-valued lift, and there is no
second lift. -/
noncomputable def lift (a : P) : TauCeti.zHat →ₜ* P :=
  (ProfiniteCompletion.continuousMonoidHomEquiv (Multiplicative ℤ) P).symm (zpowersHom P a)

/-- **Layer 1.1.** The lift sends the image of `n ∈ ℤ` to `a ^ n`, as Tau Ceti's
`TauCeti.zHat.lift_ofInt`. -/
theorem lift_ofInt (a : P) (z : Multiplicative ℤ) : lift a (TauCeti.zHat.ofInt z) = a ^ z.toAdd :=
  sorry

/-- **Layer 1.1.** The lift sends the generator to `a`, as Tau Ceti's `TauCeti.zHat.lift_gen`. -/
theorem lift_gen (a : P) : lift a TauCeti.zHat.gen = a := by
  rw [TauCeti.zHat.gen, lift_ofInt, toAdd_ofAdd, zpow_one]

/-- **Layer 1.1.** Uniqueness, as Tau Ceti's `TauCeti.zHat.lift_unique`: Tau Ceti's extensionality
`TauCeti.zHat.hom_ext` already allows targets in every universe. -/
theorem lift_unique (a : P) (φ : TauCeti.zHat →ₜ* P) (hφ : φ TauCeti.zHat.gen = a) :
    φ = lift a :=
  TauCeti.zHat.hom_ext (by rw [hφ, lift_gen])

/-- **Layer 1.1.** On targets in `Type` the generalized lift is Tau Ceti's existing
`TauCeti.zHat.lift`: the generalization changes the signature, not the map. -/
theorem lift_eq_tauCeti {Q : Type} [Group Q] [TopologicalSpace Q] [IsTopologicalGroup Q]
    [CompactSpace Q] [TotallyDisconnectedSpace Q] (a : Q) : lift a = TauCeti.zHat.lift a :=
  TauCeti.zHat.lift_unique a (lift a) (lift_gen a)

end zHat

section Powers

variable {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]

/-- **Layer 1.1.** The profinite power `x ^ᶻ a`: the image of `a` under the lift of `x`. It is
Tau Ceti's `TauCeti.zHat.lift x`, in the generalized universe of 1.1, applied to `a` read
multiplicatively; there is no second powering construction. -/
noncomputable def zpowHat (x : G) (a : ẑ) : G :=
  zHat.lift x (Additive.toMul a)

@[inherit_doc] scoped infixl:75 " ^ᶻ " => zpowHat

/-- **Layer 1.1.** The pin on the generator. -/
theorem zpowHat_one (x : G) : x ^ᶻ (1 : ẑ) = x :=
  zHat.lift_gen x

/-- **Layer 1.1.** Agreement with integer powers. -/
theorem zpowHat_intCast (x : G) (n : ℤ) : x ^ᶻ (n : ẑ) = x ^ n := by
  show zHat.lift x (TauCeti.zHat.gen ^ n) = x ^ n
  rw [map_zpow, zHat.lift_gen]

theorem zpowHat_zero (x : G) : x ^ᶻ (0 : ẑ) = 1 :=
  map_one (zHat.lift x)

theorem one_zpowHat (a : ẑ) : (1 : G) ^ᶻ a = 1 :=
  sorry

/-- **Layer 1.1.** The additive law. -/
theorem zpowHat_add (x : G) (a b : ẑ) : x ^ᶻ (a + b) = x ^ᶻ a * x ^ᶻ b :=
  map_mul (zHat.lift x) (Additive.toMul a) (Additive.toMul b)

theorem zpowHat_neg (x : G) (a : ẑ) : x ^ᶻ (-a) = (x ^ᶻ a)⁻¹ :=
  map_inv (zHat.lift x) (Additive.toMul a)

/-- **Layer 1.1.** The multiplicative law, through the ring product of Layer 0. -/
theorem zpowHat_zpowHat (x : G) (a b : ẑ) : (x ^ᶻ a) ^ᶻ b = x ^ᶻ (a * b) :=
  sorry

/-- **Layer 1.1, naturality.** The workhorse: every continuous homomorphism commutes with
profinite powers. -/
theorem map_zpowHat {H : Type v} [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H] (f : G →* H) (hf : Continuous f) (x : G)
    (a : ẑ) : f (x ^ᶻ a) = f x ^ᶻ a :=
  sorry

/-- **Layer 1.1.** The conjugation instance of naturality. -/
theorem zpowHat_conj (g x : G) (a : ẑ) : (g * x * g⁻¹) ^ᶻ a = g * (x ^ᶻ a) * g⁻¹ :=
  sorry

theorem inv_zpowHat (x : G) (a : ẑ) : x⁻¹ ^ᶻ a = (x ^ᶻ a)⁻¹ :=
  sorry

/-- **Layer 1.1.** Powers of `x` commute with each other, `TauCeti.zHat` being commutative. -/
theorem zpowHat_comm (x : G) (a b : ẑ) : x ^ᶻ a * x ^ᶻ b = x ^ᶻ b * x ^ᶻ a := by
  rw [← zpowHat_add, ← zpowHat_add, add_comm]

/-- **Layer 1.1.** Continuity in the exponent, and jointly. -/
theorem continuous_zpowHat (x : G) : Continuous (fun a : ẑ => x ^ᶻ a) :=
  (zHat.lift x).continuous.comp continuous_toMul

theorem continuous_zpowHat_prod : Continuous (fun p : G × ẑ => p.1 ^ᶻ p.2) :=
  sorry

/-- **Layer 1.2.** The closed procyclic subgroup generated by `x`. -/
def closedZpowers (x : G) : Subgroup G := (Subgroup.zpowers x).topologicalClosure

/-- **Layer 1.2.** The powers of `x` fill out its closed procyclic subgroup. -/
theorem range_zpowHat (x : G) : Set.range (fun a : ẑ => x ^ᶻ a) = closedZpowers x :=
  sorry

/-- **Layer 1.2, `ℓ`-parts.** The closed subgroup generated by `x ^ᶻ ω_ℓ` is pro-`ℓ`. -/
theorem isProP_closedZpowers_zpowHat_idem (ℓ : ℕ) [Fact ℓ.Prime] (x : G) :
    TauCeti.IsProP ℓ (closedZpowers (x ^ᶻ zHat.idem ℓ)) :=
  sorry

/-- **Layer 1.2.** On a pro-`ℓ` group the `ℓ`-idempotent acts as the identity exponent. -/
theorem zpowHat_idem_of_isProP (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) :
    x ^ᶻ zHat.idem ℓ = x :=
  sorry

/-- **Layer 1.2.** On a pro-`ℓ` group only the `ℓ`-adic factor of the exponent matters. -/
theorem zpowHat_idem_mul_of_isProP (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (a : ẑ) : x ^ᶻ (zHat.idem ℓ * a) = x ^ᶻ a :=
  sorry

/-- **Layer 1.3.** The `ℤ_ℓ`-power on a pro-`ℓ` group, written `x ^[ℓ] u` in prose: Tau Ceti's
`TauCeti.IsProP.padicPow`, under an alias that orders the arguments as this roadmap's statements
do. The Lean name avoids `^[ ]`, which Mathlib reserves for iterates. -/
noncomputable abbrev padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (u : ℤ_[ℓ]) : G :=
  hG.padicPow x u

/-- **Layer 1.3, the comparison.** The profinite power is the `ℤ_ℓ`-power of the component. -/
theorem zpowHat_eq_padicPow_component (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (a : ẑ) : x ^ᶻ a = padicPow ℓ hG x (zHat.component ℓ a) :=
  sorry

/-- **Layer 1.3.** The calculus of the `ℤ_ℓ`-power is Tau Ceti's; the next statements apply it. -/
theorem padicPow_one (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) :
    padicPow ℓ hG x 1 = x :=
  TauCeti.IsProP.padicPow_one hG x

theorem padicPow_intCast (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) (n : ℤ) :
    padicPow ℓ hG x (n : ℤ_[ℓ]) = x ^ n :=
  TauCeti.IsProP.padicPow_intCast hG x n

theorem padicPow_add (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) (u v : ℤ_[ℓ]) :
    padicPow ℓ hG x (u + v) = padicPow ℓ hG x u * padicPow ℓ hG x v :=
  TauCeti.IsProP.padicPow_add hG x u v

theorem padicPow_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (u v : ℤ_[ℓ]) : padicPow ℓ hG (padicPow ℓ hG x u) v = padicPow ℓ hG x (u * v) :=
  (TauCeti.IsProP.padicPow_mul hG x u v).symm

/-- **Layer 1.3, naturality.** -/
theorem map_padicPow (ℓ : ℕ) [Fact ℓ.Prime] {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : TauCeti.IsProP ℓ G) (hH : TauCeti.IsProP ℓ H) (f : G →* H) (hf : Continuous f) (x : G)
    (u : ℤ_[ℓ]) : f (padicPow ℓ hG x u) = padicPow ℓ hH (f x) u :=
  TauCeti.IsProP.map_padicPow hG hH f hf x u

/-- **Layer 1.3.** The conjugation instance of `map_padicPow`, for `MulAut.conj g`. -/
theorem padicPow_conj (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (g x : G) (u : ℤ_[ℓ]) :
    padicPow ℓ hG (g * x * g⁻¹) u = g * padicPow ℓ hG x u * g⁻¹ :=
  sorry

theorem inv_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G) (u : ℤ_[ℓ]) :
    padicPow ℓ hG x⁻¹ u = (padicPow ℓ hG x u)⁻¹ :=
  TauCeti.IsProP.inv_padicPow hG x u

theorem continuous_padicPow (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) :
    Continuous (fun p : G × ℤ_[ℓ] => padicPow ℓ hG p.1 p.2) :=
  (TauCeti.IsProP.continuous_padicPow hG).comp continuous_swap

/-- **Layer 1.3, unit exponents.** The `u`-th power is undone by the `u⁻¹`-th power. -/
theorem padicPow_units_inv (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (u : ℤ_[ℓ]ˣ) : padicPow ℓ hG (padicPow ℓ hG x u) ↑u⁻¹ = x := by
  rw [padicPow_padicPow, Units.mul_inv, padicPow_one]

/-- **Layer 1.3.** A unit power generates the same closed procyclic subgroup. -/
theorem closedZpowers_padicPow_units (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G) (x : G)
    (u : ℤ_[ℓ]ˣ) : closedZpowers (padicPow ℓ hG x u) = closedZpowers x :=
  sorry

/-- **Layer 1.3.** Unit powers are injective. ⚠ False for a non-unit exponent: `x ↦ x ^ ℓ`
identifies the elements of order `ℓ` with `1`. -/
theorem padicPow_units_injective (ℓ : ℕ) [Fact ℓ.Prime] (hG : TauCeti.IsProP ℓ G)
    (u : ℤ_[ℓ]ˣ) : Function.Injective (fun x : G => padicPow ℓ hG x u) :=
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
quantifies over abstract automorphisms; this is the notion the closed series of Layer 3 and Tau
Ceti's `TauCeti.proPKernel` and `TauCeti.proPFrattini` satisfy. -/
def IsTopCharacteristic (N : Subgroup G) : Prop :=
  ∀ φ : ContinuousAut G, N.map φ.toMulEquiv.toMonoidHom = N

omit [IsTopologicalGroup G] in
/-- **Layer 2.2.** The pro-`p` Frattini subgroup is topologically characteristic, for every
topological group and every `p`: Tau Ceti's `ContinuousMulEquiv.map_proPFrattini_eq`. -/
theorem isTopCharacteristic_proPFrattini (p : ℕ) :
    IsTopCharacteristic G (TauCeti.proPFrattini p G) :=
  fun φ => ContinuousMulEquiv.map_proPFrattini_eq φ

omit [IsTopologicalGroup G] in
/-- **Layer 2.2.** The pro-`p` kernel is topologically characteristic, for every topological
group and every `p`: Tau Ceti's `TauCeti.map_proPKernel_eq`. BelyiMaps Layer 13.1 consumes it. -/
theorem isTopCharacteristic_proPKernel (p : ℕ) : IsTopCharacteristic G (TauCeti.proPKernel p G) :=
  fun φ => TauCeti.map_proPKernel_eq φ

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

/-- **Layer 2.2, the congruence topology.** The initial topology of the maps to the automorphism
groups of the topologically characteristic open normal quotients, each carrying the discrete
topology; these groups are finite when `G` is profinite, and not in general. ⚠ In Mathlib's order on topologies `⊥` is the **discrete** topology and `⊤` the
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
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) : CompactSpace (ContinuousAut G) :=
  sorry

theorem ContinuousAut.t2Space [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) : T2Space (ContinuousAut G) :=
  sorry

theorem ContinuousAut.totallyDisconnectedSpace [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) : TotallyDisconnectedSpace
    (ContinuousAut G) :=
  sorry

/-- **Layer 2.2.** Evaluation is continuous when `G` is a topologically finitely generated
profinite group. -/
theorem ContinuousAut.continuous_eval [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    Continuous (fun p : ContinuousAut G × G => p.1 p.2) :=
  sorry

/-- **Layer 2.2, the conjugacy relation.** In a compact, totally disconnected topological group the
set of conjugate pairs is closed: it is the image of the compact space `G × G` under
`(g, x) ↦ (x, g x g⁻¹)`, and `G × G` is Hausdorff. This is the form a closed-graph argument
consumes, when both arguments of `IsConj` vary. -/
theorem isClosed_isConj_pair [CompactSpace G] [TotallyDisconnectedSpace G] :
    IsClosed {q : G × G | IsConj q.1 q.2} := by
  have hc : Continuous fun gx : G × G => (gx.2, gx.1 * gx.2 * gx.1⁻¹) := by fun_prop
  have hrange : Set.range (fun gx : G × G => (gx.2, gx.1 * gx.2 * gx.1⁻¹))
      = {q : G × G | IsConj q.1 q.2} := by
    ext ⟨a, b⟩
    simp only [Set.mem_range, Prod.mk.injEq, Set.mem_ofPred_eq, isConj_iff, Prod.exists]
    constructor
    · rintro ⟨g, x, rfl, rfl⟩
      exact ⟨g, rfl⟩
    · rintro ⟨c, rfl⟩
      exact ⟨c, a, rfl, rfl⟩
  rw [← hrange]
  exact (isCompact_range hc).isClosed

/-- **Layer 2.2.** The conjugacy condition `IsConj (φ x) y` cuts out a closed set of
automorphisms: the preimage of the closed conjugacy relation `isClosed_isConj_pair` under the
continuous map `φ ↦ (φ x, y)`. -/
theorem ContinuousAut.isClosed_isConj [CompactSpace G] [TotallyDisconnectedSpace G]
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) (x y : G) :
    IsClosed {φ : ContinuousAut G | IsConj (φ x) y} :=
  (isClosed_isConj_pair G).preimage (f := fun φ : ContinuousAut G => ((φ x, y) : G × G))
    (((ContinuousAut.continuous_eval G hfg).comp
      (continuous_id.prodMk (continuous_const : Continuous fun _ : ContinuousAut G => x))).prodMk
      continuous_const)

/-- **Layer 2.3.** The action of the outer group on conjugacy classes. -/
noncomputable instance : MulAction (ContinuousOut G) (ConjClasses G) :=
  sorry

theorem ContinuousOut.mk_smul_mk (φ : ContinuousAut G) (x : G) :
    (ContinuousOut.mk G φ) • ConjClasses.mk x = ConjClasses.mk (φ x) :=
  sorry

/-- **Layer 2.3, descent to a characteristic quotient.** For a closed normal topologically
characteristic subgroup `N`, a continuous automorphism of `G` induces one of `G ⧸ N`. This is the
reusable map for arbitrary closed characteristic quotients; `mapQuotient` of 2.2 is its shadow in
`MulAut (G ⧸ N)`, used for the congruence topology. -/
noncomputable def ContinuousAut.mapClosedQuotient (N : Subgroup G) [N.Normal]
    (_hNc : IsClosed (N : Set G)) (_hN : IsTopCharacteristic G N) :
    ContinuousAut G →* ContinuousAut (G ⧸ N) :=
  sorry

/-- **Layer 2.3.** The induced automorphism sends the class of `x` to the class of `φ x`; since
`QuotientGroup.mk` is surjective, this pins `mapClosedQuotient`. -/
theorem ContinuousAut.mapClosedQuotient_mk (N : Subgroup G) [N.Normal]
    (hNc : IsClosed (N : Set G)) (hN : IsTopCharacteristic G N) (φ : ContinuousAut G) (x : G) :
    ContinuousAut.mapClosedQuotient G N hNc hN φ (QuotientGroup.mk x) = QuotientGroup.mk (φ x) :=
  sorry

/-- **Layer 2.3.** Inner automorphisms go to inner automorphisms: `conj g ↦ conj (g N)`. -/
theorem ContinuousAut.mapClosedQuotient_conj (N : Subgroup G) [N.Normal]
    (hNc : IsClosed (N : Set G)) (hN : IsTopCharacteristic G N) (g : G) :
    ContinuousAut.mapClosedQuotient G N hNc hN (ContinuousAut.conj G g)
      = ContinuousAut.conj (G ⧸ N) (QuotientGroup.mk g) :=
  sorry

/-- **Layer 2.3.** The descent is continuous for the congruence topologies: the preimage in `G` of
a topologically characteristic open normal subgroup of `G ⧸ N` is one of `G`. -/
theorem ContinuousAut.continuous_mapClosedQuotient (N : Subgroup G) [N.Normal]
    (hNc : IsClosed (N : Set G)) (hN : IsTopCharacteristic G N) :
    Continuous (ContinuousAut.mapClosedQuotient G N hNc hN) :=
  sorry

/-- **Layer 2.3.** The induced map of outer automorphism groups, defined from `mapClosedQuotient`,
which carries inner automorphisms to inner automorphisms (`mapClosedQuotient_conj`). -/
noncomputable def ContinuousOut.mapClosedQuotient (N : Subgroup G) [N.Normal]
    (hNc : IsClosed (N : Set G)) (hN : IsTopCharacteristic G N) :
    ContinuousOut G →* ContinuousOut (G ⧸ N) :=
  QuotientGroup.map _ _ (ContinuousAut.mapClosedQuotient G N hNc hN) (by
    rintro _ ⟨g, rfl⟩
    exact Subgroup.mem_comap.2 (MonoidHom.mem_range.2
      ⟨QuotientGroup.mk g, (ContinuousAut.mapClosedQuotient_conj G N hNc hN g).symm⟩))

/-- **Layer 2.3.** The outer map on classes. -/
theorem ContinuousOut.mapClosedQuotient_mk (N : Subgroup G) [N.Normal]
    (hNc : IsClosed (N : Set G)) (hN : IsTopCharacteristic G N) (φ : ContinuousAut G) :
    ContinuousOut.mapClosedQuotient G N hNc hN (ContinuousOut.mk G φ)
      = ContinuousOut.mk (G ⧸ N) (ContinuousAut.mapClosedQuotient G N hNc hN φ) :=
  rfl

/-- **Layer 2.3.** The outer map is continuous for the quotient topologies. -/
theorem ContinuousOut.continuous_mapClosedQuotient (N : Subgroup G) [N.Normal]
    (hNc : IsClosed (N : Set G)) (hN : IsTopCharacteristic G N) :
    Continuous (ContinuousOut.mapClosedQuotient G N hNc hN) :=
  sorry

/-- **Layer 2.3, closed subgroups.** A continuous automorphism carries a closed subgroup (Mathlib's
`ClosedSubgroup G`) to its image, which is closed because the automorphism is a homeomorphism. -/
instance : MulAction (ContinuousAut G) (ClosedSubgroup G) where
  smul φ H := ⟨H.toSubgroup.map φ.toMulEquiv.toMonoidHom, φ.toHomeomorph.isClosedMap _ H.isClosed'⟩
  one_smul := sorry
  mul_smul := sorry

omit [IsTopologicalGroup G] in
/-- **Layer 2.3.** The action on closed subgroups is the image. -/
theorem ContinuousAut.smul_closedSubgroup_toSubgroup (φ : ContinuousAut G) (H : ClosedSubgroup G) :
    (φ • H).toSubgroup = H.toSubgroup.map φ.toMulEquiv.toMonoidHom :=
  rfl

/-- **Layer 2.3.** `G` acts on its closed subgroups by conjugation, through its inner automorphisms;
`ConjAct G` is Mathlib's type for that action. -/
noncomputable instance : MulAction (ConjAct G) (ClosedSubgroup G) :=
  MulAction.compHom (ClosedSubgroup G) ((ContinuousAut.conj G).comp ConjAct.ofConjAct.toMonoidHom)

/-- **Layer 2.3.** Closed subgroups up to conjugacy: the orbits of the conjugation action. -/
abbrev ClosedSubgroupConjClasses : Type u :=
  MulAction.orbitRel.Quotient (ConjAct G) (ClosedSubgroup G)

/-- **Layer 2.3.** The action of the outer group on closed subgroups up to conjugacy: a continuous
automorphism respects conjugacy of closed subgroups, and inner automorphisms fix every class. -/
noncomputable instance : MulAction (ContinuousOut G) (ClosedSubgroupConjClasses G) :=
  sorry

/-- **Layer 2.3.** `ContinuousOut.mk φ` carries the class of `H` to the class of `φ • H`; this pins
the action. -/
theorem ContinuousOut.mk_smul_closedSubgroupConjClass (φ : ContinuousAut G)
    (H : ClosedSubgroup G) :
    ContinuousOut.mk G φ •
        (Quotient.mk (MulAction.orbitRel (ConjAct G) (ClosedSubgroup G)) H :
          ClosedSubgroupConjClasses G)
      = Quotient.mk (MulAction.orbitRel (ConjAct G) (ClosedSubgroup G)) (φ • H) :=
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
    [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G)
    (hfg : TauCeti.IsTopologicallyFinitelyGenerated G) :
    TauCeti.IsProP p (MonoidHom.ker (ContinuousAut.mapQuotient G (TauCeti.proPFrattini p G)
        (isTopCharacteristic_proPFrattini G p))) ∧
      IsOpen ((MonoidHom.ker (ContinuousAut.mapQuotient G (TauCeti.proPFrattini p G)
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
    [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) :
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

/-- **Layer 3.1.** `γ_1(G)` is the closed commutator subgroup, the kernel of Mathlib's
topological abelianization `TopologicalAbelianization G`. -/
theorem closedLowerCentralSeries_one :
    closedLowerCentralSeries G 1 = (commutator G).topologicalClosure := by
  rw [closedLowerCentralSeries_succ, closedLowerCentralSeries_zero]
  rfl

/-- **Layer 3.2.** The degree-zero graded piece is Mathlib's topological abelianization:
`gr_0(G) = γ_0 ⧸ γ_1` with `γ_0 = G` and `γ_1 = closure ⁅G, G⁆` (`closedLowerCentralSeries_one`).
Tau Ceti's `TauCeti.gradedPieceZeroEquiv` is the algebraic part of this isomorphism. -/
noncomputable def lcsGradedPieceZeroEquiv :
    lcsGradedPiece G 0 ≃ₜ+ Additive (TopologicalAbelianization G) :=
  sorry

/-- **Layer 3.2.** The comparison on classes. It pins `lcsGradedPieceZeroEquiv`, because
`lcsGradedMk` is surjective (`TauCeti.gradedMk_surjective`). -/
theorem lcsGradedPieceZeroEquiv_mk (g : G) :
    lcsGradedPieceZeroEquiv G (lcsGradedMk G 0 ⟨g, TauCeti.mem_pLowerCentralSeries_zero 0 g⟩)
      = Additive.ofMul (QuotientGroup.mk g : TopologicalAbelianization G) :=
  sorry

/-- **Layer 3.1.** A `ℤ_p`-power of an element of `γ_n(G)` stays in `γ_n(G)`, the term being
closed (Tau Ceti's `TauCeti.IsProP.padicPow_mem`). -/
theorem padicPow_mem_closedLowerCentralSeries (p : ℕ) [Fact p.Prime] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) {n : ℕ} {x : G}
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
    [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) (j k : ℕ)
    (x : closedLowerCentralSeries G j)
    (y : closedLowerCentralSeries G k) (u : ℤ_[p]) :
    ∃ hx : padicPow p hG (x : G) u ∈ closedLowerCentralSeries G j,
    ∃ hxy : padicPow p hG ⁅(x : G), (y : G)⁆ u ∈ closedLowerCentralSeries G (j + k + 1),
      lcsBracket G j k (lcsGradedMk G j ⟨_, hx⟩) (lcsGradedMk G k y)
        = lcsGradedMk G (j + k + 1) ⟨_, hxy⟩ :=
  sorry

/-- **Layer 3.2, `ℤ_p`-linearity in the second variable.** -/
theorem lcsBracket_padicPow_right (p : ℕ) [Fact p.Prime] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : TauCeti.IsProP p G) (j k : ℕ)
    (x : closedLowerCentralSeries G j)
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

/-- **Layer 3.4, the detecting group.** Tau Ceti's Heisenberg group over `ℤ_p`,
`TauCeti.HeisenbergGroup ℤ_[p]`: triples `(x, y, z)` with
`(x, y, z) (x', y', z') = (x + x', y + y', z + z' + x y')`, with its group law and the commutator
formula `⁅(x, y, z), (x', y', z')⁆ = (0, 0, x y' - x' y)` (`TauCeti.HeisenbergGroup.commutatorElement_eq`).
This roadmap adds only the topology and, over `ℤ_p`, the profinite and pro-`p` structure. -/
abbrev HeisenbergZp (p : ℕ) [Fact p.Prime] : Type := TauCeti.HeisenbergGroup ℤ_[p]

/-- **Layer 3.4.** The topology of `R³` on Tau Ceti's Heisenberg group, through its coordinate
equivalence `TauCeti.HeisenbergGroup.equivProd`. -/
noncomputable instance {R : Type*} [TopologicalSpace R] :
    TopologicalSpace (TauCeti.HeisenbergGroup R) :=
  TopologicalSpace.induced TauCeti.HeisenbergGroup.equivProd inferInstance

instance {R : Type*} [Ring R] [TopologicalSpace R] [IsTopologicalRing R] :
    IsTopologicalGroup (TauCeti.HeisenbergGroup R) :=
  sorry

instance {R : Type*} [TopologicalSpace R] [CompactSpace R] :
    CompactSpace (TauCeti.HeisenbergGroup R) :=
  sorry

instance {R : Type*} [TopologicalSpace R] [TotallyDisconnectedSpace R] :
    TotallyDisconnectedSpace (TauCeti.HeisenbergGroup R) :=
  sorry

/-- **Layer 3.4.** The Heisenberg group over `ℤ_p` is pro-`p`: the triples with all coordinates in
`p ^ n ℤ_p` form an open normal subgroup of index `p ^ (3 n)`, and these subgroups form a basis of
neighbourhoods of `1`. -/
theorem HeisenbergZp.isProP (p : ℕ) [Fact p.Prime] : TauCeti.IsProP p (HeisenbergZp p) :=
  sorry

section FreeGraded

/-- **Layer 3.4, degree zero.** For Tau Ceti's free pro-`p` group `F = TauCeti.freeProP p (Fin r)`,
the classes of the generators form a `ℤ_p`-basis of `gr_0(F)`: `a ↦ Σ_i [x_i ^[p] a_i]` is a
bijection `(Fin r → ℤ_[p]) → gr_0(F)`. Through `lcsGradedPieceZeroEquiv` this identifies the
topological abelianization of `F` with `ℤ_p ^ r`. -/
theorem lcsGradedPiece_zero_freeProP_bijective (p : ℕ) [Fact p.Prime] (r : ℕ) :
    Function.Bijective fun a : Fin r → ℤ_[p] =>
      ∑ i, lcsGradedMk (TauCeti.freeProP p (Fin r)) 0
        ⟨padicPow p (TauCeti.isProP_freeProP p (Fin r)) (TauCeti.freeProP.of i) (a i),
          TauCeti.mem_pLowerCentralSeries_zero 0 _⟩ :=
  sorry

/-- **Layer 3.4, detection.** For `i ≠ j` there is a continuous homomorphism from the free pro-`p`
group to the Heisenberg group with `x_i ↦ (1, 0, 0)`, `x_j ↦ (0, 1, 0)` and every other generator
`↦ 1`: Tau Ceti's universal property `TauCeti.freeProP.lift`, the Heisenberg group being pro-`p`. -/
theorem exists_heisenberg_detect (p : ℕ) [Fact p.Prime] (r : ℕ) (i j : Fin r) (hij : i ≠ j) :
    ∃ f : TauCeti.freeProP p (Fin r) →* HeisenbergZp p, Continuous f ∧
      f (TauCeti.freeProP.of i) = ⟨1, 0, 0⟩ ∧ f (TauCeti.freeProP.of j) = ⟨0, 1, 0⟩ ∧
      ∀ k, k ≠ i → k ≠ j → f (TauCeti.freeProP.of k) = 1 := by
  let m : Fin r → HeisenbergZp p := fun k =>
    if k = i then ⟨1, 0, 0⟩ else if k = j then ⟨0, 1, 0⟩ else 1
  refine ⟨(TauCeti.freeProP.lift (HeisenbergZp.isProP p) m).toMonoidHom,
    (TauCeti.freeProP.lift (HeisenbergZp.isProP p) m).continuous, ?_, ?_, ?_⟩
  · simp [TauCeti.freeProP.lift_of, m]
  · simp [TauCeti.freeProP.lift_of, m, hij.symm]
  · intro k hki hkj
    simp [TauCeti.freeProP.lift_of, m, hki, hkj]

/-- **Layer 3.4, degree one.** For the free pro-`p` group `F` of rank `r`, the classes
`[x̄_i, x̄_j]`, `i < j`, form a `ℤ_p`-basis of `gr_1(F)`: `c ↦ Σ_{i<j} [⁅x_i, x_j⁆ ^[p] c_ij]` is a
bijection. Equivalently `gr_1(F) ≅ Λ² gr_0(F)`, with `x̄_i ∧ x̄_j ↦ [x̄_i, x̄_j]`. Surjectivity is
the spanning theorem of 3.3 with the Lie identities; injectivity reads off each coefficient
`c_ij` through the homomorphism of `exists_heisenberg_detect`, since the Heisenberg group has
`gr_1 = γ_1 ≅ ℤ_p`. -/
theorem lcsGradedPiece_one_freeProP_bijective (p : ℕ) [Fact p.Prime] (r : ℕ) :
    Function.Bijective fun c : {ij : Fin r × Fin r // ij.1 < ij.2} → ℤ_[p] =>
      ∑ ij, lcsGradedMk (TauCeti.freeProP p (Fin r)) 1
        ⟨padicPow p (TauCeti.isProP_freeProP p (Fin r))
            ⁅(TauCeti.freeProP.of ij.1.1 : TauCeti.freeProP p (Fin r)),
              TauCeti.freeProP.of ij.1.2⁆ (c ij),
          padicPow_mem_closedLowerCentralSeries _ p (TauCeti.isProP_freeProP p (Fin r))
            (commutator_mem_closedLowerCentralSeries _ 0 0
              (TauCeti.mem_pLowerCentralSeries_zero 0 _)
              (TauCeti.mem_pLowerCentralSeries_zero 0 _))
            (c ij)⟩ :=
  sorry

/-- **Layer 3.4, nonvanishing.** For the free pro-`p` group of rank `r ≥ 2` the bracket of two
distinct generators is nonzero in `gr_1`: a consequence of `lcsGradedPiece_one_freeProP_bijective`
and the alternation of the bracket. -/
theorem lcsBracket_freeProP_ne_zero (p : ℕ) [Fact p.Prime] (r : ℕ) (i j : Fin r) (hij : i ≠ j) :
    lcsBracket (TauCeti.freeProP p (Fin r)) 0 0
        (lcsGradedMk _ 0 ⟨TauCeti.freeProP.of i, TauCeti.mem_pLowerCentralSeries_zero 0 _⟩)
        (lcsGradedMk _ 0 ⟨TauCeti.freeProP.of j, TauCeti.mem_pLowerCentralSeries_zero 0 _⟩) ≠ 0 :=
  sorry

end FreeGraded

end TauCetiRoadmap.ProfiniteArithmetic
