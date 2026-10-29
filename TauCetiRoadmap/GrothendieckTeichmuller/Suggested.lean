import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.Free.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Pow
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Ring
import TauCeti.Topology.Algebra.Group.ContinuousAut.Basic
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic

set_option autoImplicit false

/-!
# The profinite Grothendieck–Teichmüller group: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for particular milestones, so that contributors and
reviewers converge on names and signatures; discharging all of them finishes neither a layer nor
the roadmap. `sorry` is allowed in this human-owned roadmap library: these are goals, not proofs.

Every object this file starts from is a Tau Ceti declaration, used directly: the free profinite
group `TauCeti.freeProfiniteGroup` with `of` and `lift`, the profinite integers `TauCeti.zHat`
with the ring structure on `Additive TauCeti.zHat`, the profinite power `TauCeti.zpowHat`
(`x ^ᶻ a`), `TauCeti.ContinuousAut` and `TauCeti.ContinuousOut`, and the braid group
`TauCeti.BraidGroup` with `sigma` and `pureSubgroup`. Definitions have real bodies; only theorem
statements are `sorry`. Relation (III), the groups `GT̂₀` and `GT̂`, and the character are
defined outright, since their vocabulary exists.

Conventions (README §Conventions): `β_{λ,f}(x) = x^λ`, `β_{λ,f}(y) = f⁻¹ y^λ f`;
`(λ, f) · (μ, g) = (λμ, f · β_{λ,f}(g))`; `x₁₂ = σ₀²`, `x₂₃ = σ₁²`, `x₃₄ = σ₂²`,
`x₁₃ = σ₁ σ₀² σ₁⁻¹`, `x₂₄ = σ₂ σ₁² σ₂⁻¹`, `x₁₄ = σ₂ σ₁ σ₀² σ₁⁻¹ σ₂⁻¹`.
-/

namespace TauCetiRoadmap.GrothendieckTeichmuller

open TauCeti
open scoped zHat

set_option quotPrecheck false in
/-- The profinite integers as a ring: notation for Tau Ceti's `Additive TauCeti.zHat.{0}`, not a
new type. -/
scoped notation "ẑ" => Additive TauCeti.zHat.{0}

/-! ## Layer 0: pro-words in two variables -/

/-- The free profinite group on two generators. -/
noncomputable abbrev F2 : ProfiniteGrp.{0} := freeProfiniteGroup (Fin 2)

/-- The first generator `x`. -/
noncomputable def x : F2 := freeProfiniteGroup.of 0

/-- The second generator `y`. -/
noncomputable def y : F2 := freeProfiniteGroup.of 1

/-- The third loop `z = (x y)⁻¹`, so that `x y z = 1`. -/
noncomputable def z : F2 := (x * y)⁻¹

/-- **Layer 0.1.** Substitution `f(a, b)` of two elements of a profinite group into a pro-word. -/
noncomputable def subst {P : Type} [Group P] [TopologicalSpace P] [IsTopologicalGroup P]
    [CompactSpace P] [TotallyDisconnectedSpace P] (f : F2) (a b : P) : P :=
  freeProfiniteGroup.lift ![a, b] f

theorem subst_x_y (f : F2) : subst f x y = f := by
  sorry

theorem map_subst {P Q : Type} [Group P] [TopologicalSpace P] [IsTopologicalGroup P]
    [CompactSpace P] [TotallyDisconnectedSpace P] [Group Q] [TopologicalSpace Q]
    [IsTopologicalGroup Q] [CompactSpace Q] [TotallyDisconnectedSpace Q]
    (φ : P →ₜ* Q) (f : F2) (a b : P) : φ (subst f a b) = subst f (φ a) (φ b) := by
  sorry

theorem subst_subst (f g h : F2) {P : Type} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (a b : P) :
    subst f (subst g a b) (subst h a b) = subst (subst f g h) a b := by
  sorry

theorem subst_zpowHat (f : F2) (c : ẑ) {P : Type} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (a b : P) :
    subst (f ^ᶻ c) a b = subst f a b ^ᶻ c := by
  sorry

/-- **Layer 0.2.** The closed commutator subgroup `F̂₂'`. -/
noncomputable def commutatorClosure : Subgroup F2 :=
  (commutator F2).topologicalClosure

theorem x_not_mem_commutatorClosure : x ∉ commutatorClosure := by
  sorry

/-! ## Layer 1: parameters and their action -/

/-- A parameter `(λ, f) ∈ ẑ × F̂₂`. -/
@[ext]
structure Param where
  /-- The exponent `λ`. -/
  lam : ẑ
  /-- The pro-word `f`. -/
  f : F2

/-- **Layer 1.1.** The continuous endomorphism `β_{λ,f}`: `x ↦ x^λ`, `y ↦ f⁻¹ y^λ f`. -/
noncomputable def beta (p : Param) : F2 →ₜ* F2 :=
  freeProfiniteGroup.lift ![x ^ᶻ p.lam, p.f⁻¹ * y ^ᶻ p.lam * p.f]

theorem beta_x (p : Param) : beta p x = x ^ᶻ p.lam := by
  sorry

theorem beta_y (p : Param) : beta p y = p.f⁻¹ * y ^ᶻ p.lam * p.f := by
  sorry

/-- **Layer 1.2.** The product of parameters, making `p ↦ β_p` multiplicative. -/
noncomputable instance : Mul Param where
  mul p q := ⟨p.lam * q.lam, p.f * beta p q.f⟩

noncomputable instance : One Param where
  one := ⟨1, 1⟩

theorem beta_mul (p q : Param) : beta (p * q) = (beta p).comp (beta q) := by
  sorry

theorem beta_one : beta 1 = ContinuousMonoidHom.id F2 := by
  sorry

theorem param_mul_assoc (p q r : Param) : p * q * r = p * (q * r) := by
  sorry

theorem param_one_mul (p : Param) : 1 * p = p := by
  sorry

theorem param_mul_one (p : Param) : p * 1 = p := by
  sorry

noncomputable instance : Monoid Param where
  mul_assoc := param_mul_assoc
  one_mul := param_one_mul
  mul_one := param_mul_one

/-- **Layer 1.4.** Uniqueness of `f` given `β`, for unit exponents. Without `IsUnit p.lam` it is
false: `(0, 1)` and `(0, [x, y])` have the same `β`. -/
theorem eq_of_beta_eq {p q : Param} (hlam : IsUnit p.lam) (hp : p.f ∈ commutatorClosure)
    (hq : q.f ∈ commutatorClosure) (h : beta p = beta q) : p = q := by
  sorry

/-! ## Layer 2: the profinite pure braid group on four strands -/

/-- The pure braid group on four strands, as a type. -/
abbrev P4 : Type := BraidGroup.pureSubgroup 4

/-- The elementary braids of `B₄`, 0-indexed as in Tau Ceti. -/
noncomputable abbrev s0 : BraidGroup 4 := BraidGroup.sigma 0
noncomputable abbrev s1 : BraidGroup 4 := BraidGroup.sigma 1
noncomputable abbrev s2 : BraidGroup 4 := BraidGroup.sigma 2

theorem conj_mem_pure (g b : BraidGroup 4) (hb : b ∈ BraidGroup.pureSubgroup 4) :
    g * b * g⁻¹ ∈ BraidGroup.pureSubgroup 4 :=
  (inferInstance : (BraidGroup.pureSubgroup 4).Normal).conj_mem b hb g

/-- **Layer 2.1.** The Artin generators of `P₄`: the `n = 4` case of GeometricTopology's
`A_(i,j)` (#903, GT4), written out here until that roadmap's general generators exist; the
implementation uses those and does not define a second family. -/
noncomputable def a12 : P4 := ⟨s0 ^ 2, BraidGroup.sigma_sq_mem_pureSubgroup 0⟩
noncomputable def a23 : P4 := ⟨s1 ^ 2, BraidGroup.sigma_sq_mem_pureSubgroup 1⟩
noncomputable def a34 : P4 := ⟨s2 ^ 2, BraidGroup.sigma_sq_mem_pureSubgroup 2⟩
noncomputable def a13 : P4 := ⟨s1 * s0 ^ 2 * s1⁻¹, conj_mem_pure _ _ (BraidGroup.sigma_sq_mem_pureSubgroup 0)⟩
noncomputable def a24 : P4 := ⟨s2 * s1 ^ 2 * s2⁻¹, conj_mem_pure _ _ (BraidGroup.sigma_sq_mem_pureSubgroup 1)⟩
noncomputable def a14 : P4 :=
  ⟨s2 * (s1 * s0 ^ 2 * s1⁻¹) * s2⁻¹,
    conj_mem_pure _ _ (conj_mem_pure _ _ (BraidGroup.sigma_sq_mem_pureSubgroup 0))⟩

theorem closure_artin :
    Subgroup.closure {a12, a13, a14, a23, a24, a34} = (⊤ : Subgroup P4) := by
  sorry

/-- **Layer 2.3.** The profinite completion `P̂₄`. -/
noncomputable abbrev P4hat : ProfiniteGrp.{0} :=
  ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of P4)

/-- The image in `P̂₄` of an element of `P₄`. -/
noncomputable def toHat (g : P4) : P4hat :=
  (ProfiniteGrp.ProfiniteCompletion.eta (GrpCat.of P4)).hom g

/-! ## Layer 3: Drinfeld's relations and the groups `GT̂₀ ⊇ GT̂` -/

/-- Relation (I): `f(y, x) f = 1`. -/
def RelI (f : F2) : Prop := subst f y x * f = 1

/-- Relation (II) with `m = (λ − 1)/2`, stated with `m` as the unique solution of `2m = λ − 1`. -/
def RelII (lam : ẑ) (f : F2) : Prop :=
  ∃ m : ẑ, 2 * m = lam - 1 ∧
    subst f z x * z ^ᶻ m * subst f y z * y ^ᶻ m * f * x ^ᶻ m = 1

theorem existsUnique_two_mul_eq_sub_one (u : ẑˣ) : ∃! m : ẑ, 2 * m = (u : ẑ) - 1 := by
  sorry

/-- Relation (III), Drinfeld's pentagon in `P̂₄`:
`f(x₁₂, x₂₃x₂₄) f(x₁₃x₂₃, x₃₄) = f(x₂₃, x₃₄) f(x₁₂x₁₃, x₂₄x₃₄) f(x₁₂, x₂₃)`. -/
def RelIII (f : F2) : Prop :=
  subst f (toHat a12) (toHat (a23 * a24)) * subst f (toHat (a13 * a23)) (toHat a34) =
    subst f (toHat a23) (toHat a34) * subst f (toHat (a12 * a13)) (toHat (a24 * a34)) *
      subst f (toHat a12) (toHat a23)

/-- The defining conditions of `GT̂^{mon}`. -/
def IsGT (p : Param) : Prop :=
  IsUnit p.lam ∧ p.f ∈ commutatorClosure ∧ RelI p.f ∧ RelII p.lam p.f ∧ RelIII p.f

theorem isGT_one : IsGT 1 := by
  sorry

theorem IsGT.mul {p q : Param} (hp : IsGT p) (hq : IsGT q) : IsGT (p * q) := by
  sorry

/-- **Layer 3.3.** Drinfeld's semigroup `GT̂^{mon}`, as a submonoid of `Param`. -/
def gtMonoid : Submonoid Param where
  carrier := {p | IsGT p}
  mul_mem' := IsGT.mul
  one_mem' := isGT_one

/-- **Layer 3.3.** The profinite Grothendieck–Teichmüller group: the units of `GT̂^{mon}`. -/
abbrev GTHat : Type := (gtMonoid)ˣ

theorem isUnit_iff_bijective_beta (p : gtMonoid) :
    IsUnit p ↔ Function.Bijective (beta (p : Param)) := by
  sorry

/-- The swap `θ : x ↦ y, y ↦ x`, as a continuous endomorphism. -/
noncomputable def thetaHom : F2 →ₜ* F2 := freeProfiniteGroup.lift ![y, x]

/-- Guillot's `δ : x ↦ x⁻¹ y⁻¹, y ↦ y`, as a continuous endomorphism. -/
noncomputable def deltaHom : F2 →ₜ* F2 := freeProfiniteGroup.lift ![x⁻¹ * y⁻¹, y]

/-- Two endomorphisms commute up to an inner automorphism. -/
def CommutesUpToInner (φ ψ : F2 →ₜ* F2) : Prop :=
  ∃ c : F2, ∀ g : F2, φ (ψ g) = c * ψ (φ g) * c⁻¹

/-- **Layer 3.2.** Guillot's conditions for `GT̂₀`. -/
def IsGT0 (p : Param) : Prop :=
  IsUnit p.lam ∧ p.f ∈ commutatorClosure ∧ Function.Bijective (beta p) ∧
    CommutesUpToInner (beta p) thetaHom ∧ CommutesUpToInner (beta p) deltaHom

/-- **Layer 3.4.** Drinfeld's form of `GT̂₀`. -/
theorem isGT0_iff (p : Param) :
    IsGT0 p ↔ IsUnit p.lam ∧ p.f ∈ commutatorClosure ∧ Function.Bijective (beta p) ∧
      RelI p.f ∧ RelII p.lam p.f := by
  sorry

/-! ## Layer 4: structure -/

/-- The exponent `λ` as a monoid homomorphism to the multiplicative monoid of `ẑ`. -/
noncomputable def lamHom : Param →* ẑ where
  toFun := Param.lam
  map_one' := rfl
  map_mul' _ _ := rfl

/-- **Layer 4.1.** The character `χ : GT̂ → ẑˣ`. -/
noncomputable def chi : GTHat →* ẑˣ :=
  Units.map (lamHom.comp gtMonoid.subtype)

/-- **Layer 4.2.** The action on `F̂₂` is faithful. -/
theorem beta_injective_on_GTHat {g h : GTHat}
    (hgh : beta ((g : gtMonoid) : Param) = beta ((h : gtMonoid) : Param)) : g = h := by
  sorry

/-- **Layer 4.3.** Complex conjugation `(−1, 1)`. -/
noncomputable def complexConj : Param := ⟨-1, 1⟩

theorem isGT_complexConj : IsGT complexConj := by
  sorry

theorem complexConj_mul_self : complexConj * complexConj = 1 := by
  sorry

/-- **Layer 4.3, Check.** Among the parameters `(λ, 1)` with `λ ≡ 3 (mod 4)`, only complex
conjugation satisfies relation (II) (dihedral quotients). -/
theorem eq_neg_one_of_relII_one {lam : ẑ} (h3 : ∃ k : ẑ, lam = 4 * k + 3) (h : RelII lam 1) :
    lam = -1 := by
  sorry

end TauCetiRoadmap.GrothendieckTeichmuller
