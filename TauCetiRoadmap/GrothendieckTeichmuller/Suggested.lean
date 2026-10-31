import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.Free.Basic
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Pow
import TauCeti.Topology.Algebra.Group.Profinite.ZHat.Ring
import TauCeti.Topology.Algebra.Group.ContinuousAut.Basic
import TauCeti.Topology.Algebra.Group.ContinuousAut.Congruence
import TauCeti.GroupTheory.SpecificGroups.Braid.Basic

/-!
# The profinite Grothendieck–Teichmüller group: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti APIs,
each with `sorry`, together with the few definitions their statements need. The API of each
definition and the Checks stay in the README.

Every carrier is a Tau Ceti declaration, used directly: `TauCeti.freeProfiniteGroup` with `of` and
`lift`, the ring `Additive TauCeti.zHat` and the power `TauCeti.zpowHat` (`x ^ᶻ a`),
`TauCeti.ContinuousAut` with its congruence topology, `TauCeti.ContinuousOut`, and
`TauCeti.BraidGroup` with `sigma` and `pureSubgroup`.

Headline theorems stated here:

* README 1.4, `eq_of_beta_eq`: a parameter with unit exponent and `f ∈ F̂₂'` is determined by its
  endomorphism.
* README 2.2, `closure_artin`: the six words `x_{ij}` generate `pureSubgroup 4`.
* README 3.3, `isUnit_iff_bijective_beta`: an element of `GT̂^{mon}` is a unit iff its
  endomorphism is bijective.
* README 3.4, `isGT0_iff`: Guillot's and Drinfeld's forms of `GT̂₀` agree.
* README 4.1, `GTHat.isGT0`: `GT̂ ⊆ GT̂₀`.
* README 4.2, `GTHat.injective_mk_betaEquiv`: `GT̂` injects into `ContinuousOut F̂₂`.
* README 4.5, `isClosed_setOf_isGT` and `GTHat.isClosedEmbedding_betaEquiv`: `GT̂^{mon}` is closed
  in `ẑ × F̂₂`, and `GT̂` is a closed topological subgroup of `ContinuousAut F̂₂` with its
  congruence topology. The topology on `Param` is the one induced from `Additive zHat × F̂₂`.

Not stated here: README 3.5, the five-term form of relation (III) in the profinite completion of
`K(0,5) = P₄ / Z(P₄)`. Its statement needs the words in `σ₀, σ₁, σ₂` that represent `x₄₅` and `x₅₁`
in `P₄ / Z(P₄)`; README 3.5 pins them from Schneps 1997, §1, as a definition of Layer 3, and the
equivalence is stated there. The monoid laws of `Param` and `beta_mul`, `beta_one`, `isGT_one`,
`IsGT.mul` are not headlines: they are stated because the instance `Monoid Param`, the submonoid
`gtMonoid` and `GTHat.betaEquiv` use them, so these definitions rest on `sorry`'d proofs.

Conventions (README §Conventions): `β_{λ,f}(x) = x^λ`, `β_{λ,f}(y) = f⁻¹ y^λ f`;
`(λ, f) · (μ, g) = (λμ, f · β_{λ,f}(g))`; `x₁₂ = σ₀²`, `x₂₃ = σ₁²`, `x₃₄ = σ₂²`,
`x₁₃ = σ₁ σ₀² σ₁⁻¹`, `x₂₄ = σ₂ σ₁² σ₂⁻¹`, `x₁₄ = σ₂ σ₁ σ₀² σ₁⁻¹ σ₂⁻¹`.
-/

namespace TauCetiRoadmap.GrothendieckTeichmuller

open TauCeti
open scoped zHat

/-! ## Layer 0: pro-words in two variables -/

/-- The free profinite group `F̂₂` on two generators. -/
noncomputable abbrev F2 : ProfiniteGrp.{0} := freeProfiniteGroup (Fin 2)

/-- The first generator `x` of `F̂₂`. -/
noncomputable def x : F2 := freeProfiniteGroup.of 0

/-- The second generator `y` of `F̂₂`. -/
noncomputable def y : F2 := freeProfiniteGroup.of 1

/-- The third loop `z = (x y)⁻¹`, so that `x y z = 1`. -/
noncomputable def z : F2 := (x * y)⁻¹

/-- Substitution `f(a, b)` of two elements of a profinite group into a pro-word `f ∈ F̂₂`: the
image of `f` under the continuous homomorphism `F̂₂ → P` sending `x ↦ a`, `y ↦ b`. -/
noncomputable def subst {P : Type} [Group P] [TopologicalSpace P] [IsTopologicalGroup P]
    [CompactSpace P] [TotallyDisconnectedSpace P] (f : F2) (a b : P) : P :=
  freeProfiniteGroup.lift ![a, b] f

/-- The closed commutator subgroup `F̂₂'`, the closure of the commutator subgroup of `F̂₂`. -/
noncomputable def commutatorClosure : Subgroup F2 :=
  (commutator F2).topologicalClosure

/-! ## Layer 1: parameters and their action -/

/-- A parameter `(λ, f) ∈ ẑ × F̂₂`. -/
@[ext]
structure Param where
  /-- The exponent `λ ∈ ẑ`. -/
  lam : Additive zHat.{0}
  /-- The pro-word `f ∈ F̂₂`. -/
  f : F2

/-- The continuous endomorphism `β_{λ,f}` of `F̂₂`: `x ↦ x^λ`, `y ↦ f⁻¹ y^λ f`. -/
noncomputable def beta (p : Param) : F2 →ₜ* F2 :=
  freeProfiniteGroup.lift ![x ^ᶻ p.lam, p.f⁻¹ * y ^ᶻ p.lam * p.f]

/-- The product of parameters, `(λ, f) · (μ, g) = (λμ, f · β_{λ,f}(g))`. -/
noncomputable instance : Mul Param where
  mul p q := ⟨p.lam * q.lam, p.f * beta p q.f⟩

/-- The unit parameter `(1, 1)`. -/
noncomputable instance : One Param where
  one := ⟨1, 1⟩

/-- `β` turns the product of parameters into composition: `β_{p·q} = β_p ∘ β_q`. -/
theorem beta_mul (p q : Param) : beta (p * q) = (beta p).comp (beta q) := by
  sorry

/-- `β_{1,1}` is the identity. -/
theorem beta_one : beta 1 = ContinuousMonoidHom.id F2 := by
  sorry

/-- The product of parameters is associative. -/
theorem param_mul_assoc (p q r : Param) : p * q * r = p * (q * r) := by
  sorry

/-- `(1, 1)` is a left unit. -/
theorem param_one_mul (p : Param) : 1 * p = p := by
  sorry

/-- `(1, 1)` is a right unit. -/
theorem param_mul_one (p : Param) : p * 1 = p := by
  sorry

/-- The monoid of parameters. -/
noncomputable instance : Monoid Param where
  mul_assoc := param_mul_assoc
  one_mul := param_one_mul
  mul_one := param_mul_one

/-- The topology of `Param`, induced from the product topology of `Additive zHat × F̂₂`. -/
noncomputable instance : TopologicalSpace Param :=
  TopologicalSpace.induced (fun p : Param => (p.lam, p.f)) inferInstance

/-- **Uniqueness of `f`** (README 1.4). If `λ` is a unit and `f, g ∈ F̂₂'`, then `β_{λ,f} = β_{μ,g}`
forces `(λ, f) = (μ, g)`. Without the unit hypothesis it is false: `(0, 1)` and `(0, [x, y])` have
the same `β` (Guillot 2014, Proposition 5.17, uniqueness). -/
theorem eq_of_beta_eq {p q : Param} (hlam : IsUnit p.lam) (hp : p.f ∈ commutatorClosure)
    (hq : q.f ∈ commutatorClosure) (h : beta p = beta q) : p = q := by
  sorry

/-! ## Layer 2: the profinite pure braid group on four strands -/

/-- The pure braid group `P₄ = pureSubgroup 4`, as a type. -/
abbrev P4 : Type := BraidGroup.pureSubgroup 4

/-- `x₁₂ = σ₀²`. -/
noncomputable def a12 : P4 := ⟨BraidGroup.sigma 0 ^ 2, BraidGroup.sigma_sq_mem_pureSubgroup 0⟩

/-- `x₂₃ = σ₁²`. -/
noncomputable def a23 : P4 := ⟨BraidGroup.sigma 1 ^ 2, BraidGroup.sigma_sq_mem_pureSubgroup 1⟩

/-- `x₃₄ = σ₂²`. -/
noncomputable def a34 : P4 := ⟨BraidGroup.sigma 2 ^ 2, BraidGroup.sigma_sq_mem_pureSubgroup 2⟩

/-- `x₁₃ = σ₁ σ₀² σ₁⁻¹`. -/
noncomputable def a13 : P4 :=
  ⟨BraidGroup.sigma 1 * BraidGroup.sigma 0 ^ 2 * (BraidGroup.sigma 1)⁻¹,
    (inferInstance : (BraidGroup.pureSubgroup 4).Normal).conj_mem _
      (BraidGroup.sigma_sq_mem_pureSubgroup 0) _⟩

/-- `x₂₄ = σ₂ σ₁² σ₂⁻¹`. -/
noncomputable def a24 : P4 :=
  ⟨BraidGroup.sigma 2 * BraidGroup.sigma 1 ^ 2 * (BraidGroup.sigma 2)⁻¹,
    (inferInstance : (BraidGroup.pureSubgroup 4).Normal).conj_mem _
      (BraidGroup.sigma_sq_mem_pureSubgroup 1) _⟩

/-- `x₁₄ = σ₂ σ₁ σ₀² σ₁⁻¹ σ₂⁻¹`, the conjugate of `x₁₃` by `σ₂`. -/
noncomputable def a14 : P4 :=
  ⟨BraidGroup.sigma 2 * (a13 : BraidGroup 4) * (BraidGroup.sigma 2)⁻¹,
    (inferInstance : (BraidGroup.pureSubgroup 4).Normal).conj_mem _ a13.2 _⟩

/-- **Generation** (README 2.2). The six `x_{ij}` generate `P₄` (Lochak–Schneps 1994, §2;
Drinfeld 1990, (4.6)). -/
theorem closure_artin :
    Subgroup.closure {a12, a13, a14, a23, a24, a34} = (⊤ : Subgroup P4) := by
  sorry

/-- The profinite completion `P̂₄`. -/
noncomputable abbrev P4hat : ProfiniteGrp.{0} :=
  ProfiniteGrp.ProfiniteCompletion.completion (GrpCat.of P4)

/-- The image in `P̂₄` of an element of `P₄`. -/
noncomputable def toHat (g : P4) : P4hat :=
  (ProfiniteGrp.ProfiniteCompletion.eta (GrpCat.of P4)).hom g

/-! ## Layer 3: Drinfeld's relations and the groups `GT̂₀ ⊇ GT̂` -/

/-- Relation (I): `f(y, x) f = 1`. -/
def RelI (f : F2) : Prop := subst f y x * f = 1

/-- Relation (II): `f(z, x) z^m f(y, z) y^m f x^m = 1` for some `m ∈ ẑ` with `2m = λ − 1`. -/
def RelII (lam : Additive zHat.{0}) (f : F2) : Prop :=
  ∃ m : Additive zHat.{0}, 2 * m = lam - 1 ∧
    subst f z x * z ^ᶻ m * subst f y z * y ^ᶻ m * f * x ^ᶻ m = 1

/-- Relation (III), Drinfeld's pentagon in `P̂₄`:
`f(x₁₂, x₂₃x₂₄) f(x₁₃x₂₃, x₃₄) = f(x₂₃, x₃₄) f(x₁₂x₁₃, x₂₄x₃₄) f(x₁₂, x₂₃)`. -/
def RelIII (f : F2) : Prop :=
  subst f (toHat a12) (toHat (a23 * a24)) * subst f (toHat (a13 * a23)) (toHat a34) =
    subst f (toHat a23) (toHat a34) * subst f (toHat (a12 * a13)) (toHat (a24 * a34)) *
      subst f (toHat a12) (toHat a23)

/-- The defining conditions of `GT̂^{mon}`: `λ ∈ ẑˣ`, `f ∈ F̂₂'`, (I), (II), (III). -/
def IsGT (p : Param) : Prop :=
  IsUnit p.lam ∧ p.f ∈ commutatorClosure ∧ RelI p.f ∧ RelII p.lam p.f ∧ RelIII p.f

/-- `(1, 1)` satisfies the conditions of `GT̂^{mon}`. -/
theorem isGT_one : IsGT 1 := by
  sorry

/-- The conditions of `GT̂^{mon}` are stable under the product (Schneps 1997, §1.2). -/
theorem IsGT.mul {p q : Param} (hp : IsGT p) (hq : IsGT q) : IsGT (p * q) := by
  sorry

/-- Drinfeld's monoid `GT̂^{mon}`, as a submonoid of `Param`. -/
def gtMonoid : Submonoid Param where
  carrier := {p | IsGT p}
  mul_mem' := IsGT.mul
  one_mem' := isGT_one

/-- The profinite Grothendieck–Teichmüller group `GT̂`: the units of `GT̂^{mon}`. -/
abbrev GTHat : Type := (gtMonoid)ˣ

/-- **Units of `GT̂^{mon}`** (README 3.3). An element of `GT̂^{mon}` is a unit iff its
endomorphism is bijective (Drinfeld 1990, §4; Schneps 1997, §1). -/
theorem isUnit_iff_bijective_beta (p : gtMonoid) :
    IsUnit p ↔ Function.Bijective (beta (p : Param)) := by
  sorry

/-- The swap `θ : x ↦ y, y ↦ x`, as a continuous endomorphism of `F̂₂`. -/
noncomputable def thetaHom : F2 →ₜ* F2 := freeProfiniteGroup.lift ![y, x]

/-- Guillot's `δ : x ↦ x⁻¹ y⁻¹, y ↦ y`, as a continuous endomorphism of `F̂₂`. -/
noncomputable def deltaHom : F2 →ₜ* F2 := freeProfiniteGroup.lift ![x⁻¹ * y⁻¹, y]

/-- Two endomorphisms of `F̂₂` commute up to an inner automorphism. -/
def CommutesUpToInner (φ ψ : F2 →ₜ* F2) : Prop :=
  ∃ c : F2, ∀ g : F2, φ (ψ g) = c * ψ (φ g) * c⁻¹

/-- Guillot's conditions for `GT̂₀` (Guillot 2014, §5.6): `λ ∈ ẑˣ`, `f ∈ F̂₂'`, `β_{λ,f}`
bijective and commuting with `θ` and with `δ` up to inner automorphisms. -/
def IsGT0 (p : Param) : Prop :=
  IsUnit p.lam ∧ p.f ∈ commutatorClosure ∧ Function.Bijective (beta p) ∧
    CommutesUpToInner (beta p) thetaHom ∧ CommutesUpToInner (beta p) deltaHom

/-- **Drinfeld's form of `GT̂₀`** (README 3.4). For a bijective parameter, Guillot's two
commutation conditions together are equivalent to relations (I) and (II) together (Schneps 1997,
§1.2, Theorem: (I) iff `θ`-commuting; given (I), (II) iff `δ`-commuting). -/
theorem isGT0_iff (p : Param) :
    IsGT0 p ↔ IsUnit p.lam ∧ p.f ∈ commutatorClosure ∧ Function.Bijective (beta p) ∧
      RelI p.f ∧ RelII p.lam p.f := by
  sorry

/-! ## Layer 4: structure of `GT̂` -/

/-- **`GT̂ ⊆ GT̂₀`** (README 4.1). Every element of `GT̂` satisfies Guillot's conditions. -/
theorem GTHat.isGT0 (g : GTHat) : IsGT0 ((g : gtMonoid) : Param) := by
  sorry

/-- The continuous automorphism `β_g` of `F̂₂` attached to `g ∈ GT̂`, with inverse `β_{g⁻¹}`. -/
noncomputable def GTHat.betaEquiv (g : GTHat) : ContinuousAut F2 where
  toFun := beta ((g : gtMonoid) : Param)
  invFun := beta (((g⁻¹ : GTHat) : gtMonoid) : Param)
  left_inv w := by
    have h := congrArg (fun p : gtMonoid => beta (p : Param) w) g.inv_mul
    simp only [Submonoid.coe_mul, OneMemClass.coe_one, beta_mul, beta_one] at h
    simpa using h
  right_inv w := by
    have h := congrArg (fun p : gtMonoid => beta (p : Param) w) g.mul_inv
    simp only [Submonoid.coe_mul, OneMemClass.coe_one, beta_mul, beta_one] at h
    simpa using h
  map_mul' := map_mul _
  continuous_toFun := (beta _).continuous
  continuous_invFun := (beta _).continuous

/-- **Injection into outer automorphisms** (README 4.2). Two elements of `GT̂` whose automorphisms
of `F̂₂` have the same class in `ContinuousOut F̂₂` are equal (Guillot 2014, Propositions 5.17 and
5.20). -/
theorem GTHat.injective_mk_betaEquiv :
    Function.Injective fun g : GTHat => ContinuousOut.mk (GTHat.betaEquiv g) := by
  sorry

/-- **`GT̂^{mon}` is closed** (README 4.5) in `ẑ × F̂₂`. -/
theorem isClosed_setOf_isGT : IsClosed {p : Param | IsGT p} := by
  sorry

/-- **`GT̂` as a closed subgroup of `ContinuousAut F̂₂`** (README 4.5). With the topology of the
units of `GT̂^{mon}` and the congruence topology on `ContinuousAut F̂₂`, `g ↦ β_g` is a closed
embedding. -/
theorem GTHat.isClosedEmbedding_betaEquiv : Topology.IsClosedEmbedding GTHat.betaEquiv := by
  sorry

end TauCetiRoadmap.GrothendieckTeichmuller
