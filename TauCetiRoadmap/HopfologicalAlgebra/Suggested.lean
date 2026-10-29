import Mathlib
import TauCeti.Algebra.Algebra.Frobenius.Basic
import TauCeti.CategoryTheory.Exact.Abelian
import TauCeti.CategoryTheory.Exact.Frobenius
import TauCeti.Algebra.Coalgebra.Comodule.Basic
import TauCeti.Algebra.HopfAlgebra.FiniteDual.Basic

/-!
# Hopfological algebra: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the simple
definitions they need.

The following headline theorems are not statable at the pins, and nothing is stated in their place:

* The tensor-triangulated structure on `H-StMod` and `H-stmod` and the ring structure on
  `K₀(H-stmod)` (Layer 2 and Layer 6). The pins have no monoidal structure on the category of all
  modules over a Hopf algebra through its coproduct (Mathlib's `ModuleCat.monoidalCategory` needs a
  commutative ring and tensors over it), and no monoidal structure on Tau Ceti's stable category
  of a Frobenius exact structure.
* The relative hopfological categories `C(A,H)` and `D(A,H)` (Layers 4 and 5): the integral
  characterization of the relative null ideal, the relative Frobenius exact structure of `A`-split
  sequences of `A # H`-modules, the derived localization and its Verdier comparison, cofibrant and
  cellular replacement, compact generation, and the `K₀(H-stmod)`-module structure on
  `K₀(Dᶜ(A,H))`. Each needs the diagonal `A # H`-module `M ⊗ H`, a construction the pins lack, and
  the relative exact structure built on it.
* Khovanov's and Laugwitz–Qi's Grothendieck-ring computations (Layers 7 and 8), including
  `K₀(O_n)`. Graded modules over the graded algebra `H_n` exist at the pins as
  `TauCeti.GradedModuleCat`, with its abelian structure and grading shift; what is missing is the
  monoidal structure on graded `H_n`-modules defined through the braided coproduct of `H_n` in
  `q`-graded vector spaces, its descent to the stable category, the Verdier quotient `O_n` as a
  monoidal triangulated category, and a triangulated `K₀` carrying the induced ring structure.
* The equivalence between bicharacter-braided Hopf algebras and Hopf monoid objects (`HopfObj`)
  in the braided category of `G`-graded vector spaces, and the Radford–Majid bosonization (Layer
  7). Mathlib's braiding on graded objects is the symmetric one inherited from the coefficients,
  with no bicharacter twist.
-/

open TauCeti
open CategoryTheory
open scoped Coalgebra TensorProduct

namespace TauCetiRoadmap.HopfologicalAlgebra

universe u v w

/-! ## Layer 1: finite Hopf algebras are Frobenius -/

section Integrals

variable (k : Type u) (H : Type v) [Field k] [Ring H] [HopfAlgebra k H]

/-- The left integrals of `H`: the elements `Λ` with `h * Λ = ε(h) Λ` for every `h`. The zero
vector belongs to this submodule; "a left integral" in the roadmap means a nonzero element. -/
def LeftIntegral : Submodule k H where
  carrier := {Λ | ∀ h : H, h * Λ = Coalgebra.counit (R := k) h • Λ}
  zero_mem' := fun h => by rw [mul_zero, smul_zero]
  add_mem' := fun {a b} ha hb h => by
    change h * (a + b) = _
    rw [mul_add, ha h, hb h, smul_add]
  smul_mem' := fun c Λ hΛ h => by
    change h * (c • Λ) = _
    rw [mul_smul_comm, hΛ h, smul_comm]

/-- The right integrals of `H`: the elements `Λ` with `Λ * h = ε(h) Λ` for every `h`. -/
def RightIntegral : Submodule k H where
  carrier := {Λ | ∀ h : H, Λ * h = Coalgebra.counit (R := k) h • Λ}
  zero_mem' := fun h => by rw [zero_mul, smul_zero]
  add_mem' := fun {a b} ha hb h => by
    change (a + b) * h = _
    rw [add_mul, ha h, hb h, smul_add]
  smul_mem' := fun c Λ hΛ h => by
    change (c • Λ) * h = _
    rw [smul_mul_assoc, hΛ h, smul_comm]

/-- Larson–Sweedler: the left integrals of a finite-dimensional Hopf algebra over a field form a
one-dimensional space (Erdmann–Solberg–Wang, arXiv:1710.11558, §2, p. 4, recalling
Larson–Sweedler). A Hopf algebra over a field is never the zero ring, since `ε(1) = 1`. -/
theorem finrank_leftIntegral [FiniteDimensional k H] :
    Module.finrank k (LeftIntegral k H) = 1 := by
  sorry

/-- Projective and injective left `H`-modules coincide, for all modules and not only the
finite-dimensional ones, so the abelian exact structure on `H-Mod` is Frobenius in Tau Ceti's
sense (Khovanov, arXiv:math/0509083, Proposition 1). With Tau Ceti's Happel triangulation this
makes `H-StMod` triangulated. -/
theorem hMod_abelian_isFrobenius [FiniteDimensional k H] :
    (ExactStructure.abelian (ModuleCat.{v} H)).IsFrobenius := by
  sorry

/-- A right cointegral: a functional `φ` on `H` with `Σ φ(h₁) h₂ = φ(h) 1` for every `h`,
that is, a right integral of the convolution algebra `H*`. -/
def IsRightCointegral (phi : Module.Dual k H) : Prop :=
  ∀ h : H, ∑ i ∈ (ℛ k h).index,
    phi ((ℛ k h).left i) • (ℛ k h).right i = phi h • (1 : H)

/-- Larson–Sweedler: a nonzero right cointegral is a Frobenius functional, that is,
`(x, y) ↦ φ(x * y)` is nondegenerate (Fischman–Montgomery–Schneider, Lemma 1.5, p. 4861). -/
theorem isFrobeniusFunctional_of_isRightCointegral [FiniteDimensional k H]
    (phi : Module.Dual k H) (hphi : IsRightCointegral k H phi) (hphi0 : phi ≠ 0) :
    phi.IsFrobeniusFunctional := by
  sorry

/-- Larson–Sweedler: the antipode of a finite-dimensional Hopf algebra over a field is
bijective. -/
theorem antipode_bijective [FiniteDimensional k H] :
    Function.Bijective (HopfAlgebra.antipode k (A := H)) := by
  sorry

/-- The Nakayama automorphism of a right cointegral. Tau Ceti's `nakayamaAut` is the stable
convention `φ(a * b) = φ(b * ν_S(a))`; its inverse `ν_H = ν_S⁻¹`, characterized by
`φ(x * y) = φ(ν_H(y) * x)`, is the twisted antipode square `ν_H(h) = Σ α(h₁) S²(h₂)`, where `α`
is the modular character of a nonzero left integral `Λ`, `Λ * h = α(h) Λ`
(Fischman–Montgomery–Schneider, Lemma 1.5, p. 4862, written there for `ν_S` through a right
integral). In the Taft algebra with `N = 3` this gives `ν_H(K) = qK`, `ν_S(K) = q⁻¹K`. -/
theorem nakayamaAut_symm_eq_winding [FiniteDimensional k H]
    (phi : Module.Dual k H) (hphi : IsRightCointegral k H phi)
    (hφ : phi.IsFrobeniusFunctional)
    (Λ : H) (hΛ : Λ ∈ LeftIntegral k H) (hΛ0 : Λ ≠ 0)
    (α : H →ₐ[k] k) (hα : ∀ h, Λ * h = α h • Λ) (h : H) :
    hφ.nakayamaAut.symm h =
      ∑ i ∈ (ℛ k h).index,
        α ((ℛ k h).left i) •
          HopfAlgebra.antipode k (HopfAlgebra.antipode k ((ℛ k h).right i)) := by
  sorry

/-- `H` is a symmetric Frobenius algebra: some functional is a symmetric Frobenius functional
in Tau Ceti's sense (`LinearMap.IsSymmetricFrobeniusFunctional`). -/
def IsSymmetricFrobenius : Prop :=
  ∃ phi : Module.Dual k H, phi.IsSymmetricFrobeniusFunctional

/-- `H` is unimodular: its left and right integrals agree. -/
def IsUnimodular : Prop := LeftIntegral k H = RightIntegral k H

/-- The square of the antipode is an inner automorphism. -/
def AntipodeSquareIsInner : Prop :=
  ∃ u : Hˣ, ∀ h,
    HopfAlgebra.antipode k (HopfAlgebra.antipode k h) = (u : H) * h * (↑(u⁻¹) : H)

/-- A finite-dimensional Hopf algebra is symmetric if and only if it is unimodular and the square
of its antipode is inner (Erdmann–Solberg–Wang, arXiv:1710.11558, Theorem 2.2(c)). -/
theorem symmetric_iff_unimodular_and_antipodeSquare_inner [FiniteDimensional k H] :
    IsSymmetricFrobenius k H ↔ IsUnimodular k H ∧ AntipodeSquareIsInner k H := by
  sorry

end Integrals

/-! ## Layer 3: module algebras, comodule algebras and smash products -/

section ModuleAlgebra

variable (k : Type u) (H : Type v) (A : Type w)
variable [Field k] [Ring H] [HopfAlgebra k H] [Ring A] [Algebra k A]

/-- A left action of `H` on a `k`-module, bilinear in both arguments. -/
structure LeftAction (M : Type*) [AddCommGroup M] [Module k M] where
  /-- The action map. -/
  act : H →ₗ[k] M →ₗ[k] M
  one_act : ∀ m, act 1 m = m
  mul_act : ∀ h l m, act (h * l) m = act h (act l m)

/-- A left `H`-module algebra: `h · 1 = ε(h) 1` and `h · (ab) = Σ (h₁ · a)(h₂ · b)`, with the
coproduct written through Mathlib's `Coalgebra.Repr`. -/
structure LeftModuleAlgebra extends LeftAction k H A where
  act_one : ∀ h, act h 1 = algebraMap k A (Coalgebra.counit h)
  act_mul : ∀ h a b,
    act h (a * b) =
      ∑ i ∈ (ℛ k h).index, act ((ℛ k h).left i) a * act ((ℛ k h).right i) b

namespace LeftModuleAlgebra

variable {k H A}

/-- The smash-product formula `(a # h)(b # l) = Σ a (h₁ · b) # h₂ l` on pure tensors. -/
noncomputable def smashMulPure (X : LeftModuleAlgebra k H A)
    (a b : A) (h l : H) : A ⊗[k] H :=
  ∑ i ∈ (ℛ k h).index,
    (a * X.act ((ℛ k h).left i) b) ⊗ₜ[k] ((ℛ k h).right i * l)

/-- A smash product `A # H`: a `k`-algebra linearly equivalent to `A ⊗ H` whose multiplication
on pure tensors is `smashMulPure` and whose unit is `1 # 1`, with the algebra maps from `A` and
`H`. The map from `H` is injective only when `A` is nonzero. -/
structure SmashProduct (X : LeftModuleAlgebra k H A) where
  /-- The underlying type. -/
  Carrier : Type max v w
  [instRing : Ring Carrier]
  [instAlgebra : Algebra k Carrier]
  carrierEquiv : Carrier ≃ₗ[k] A ⊗[k] H
  /-- The element `a # h`. -/
  pure : A → H → Carrier
  pure_equiv : ∀ a h, carrierEquiv (pure a h) = a ⊗ₜ[k] h
  one_eq : (1 : Carrier) = pure 1 1
  mul_pure : ∀ a b h l,
    pure a h * pure b l = carrierEquiv.symm (X.smashMulPure a b h l)
  /-- The algebra map `a ↦ a # 1`. -/
  includeA : A →ₐ[k] Carrier
  /-- The algebra map `h ↦ 1 # h`. -/
  includeH : H →ₐ[k] Carrier
  includeA_apply : ∀ a, includeA a = pure a 1
  includeH_apply : ∀ h, includeH h = pure 1 h

attribute [instance] SmashProduct.instRing SmashProduct.instAlgebra

/-- Every left module algebra has a smash product: the formula extends bilinearly to an
associative unital `k`-algebra structure on `A ⊗ H` (Qi, arXiv:1205.1814, Example 2.8). -/
theorem smashProduct_nonempty (X : LeftModuleAlgebra k H A) : Nonempty (SmashProduct X) := by
  sorry

/-- The covariance relation `fH(h) fA(a) = Σ fA(h₁ · a) fH(h₂)` for a pair of algebra maps out
of `A` and `H`. -/
def SmashCompatible {X : LeftModuleAlgebra k H A} {C : Type*}
    [Ring C] [Algebra k C] (fA : A →ₐ[k] C) (fH : H →ₐ[k] C) : Prop :=
  ∀ h a, fH h * fA a =
    ∑ i ∈ (ℛ k h).index, fA (X.act ((ℛ k h).left i) a) * fH ((ℛ k h).right i)

/-- Universal property of the smash product: a covariant pair of algebra maps factors uniquely
through `A # H`. -/
theorem SmashProduct.lift_unique {X : LeftModuleAlgebra k H A}
    (S : SmashProduct X) {C : Type*} [Ring C] [Algebra k C]
    (fA : A →ₐ[k] C) (fH : H →ₐ[k] C) (hcompat : SmashCompatible (X := X) fA fH) :
    ∃! f : S.Carrier →ₐ[k] C,
      (∀ a, f (S.includeA a) = fA a) ∧ (∀ h, f (S.includeH h) = fH h) := by
  sorry

end LeftModuleAlgebra

end ModuleAlgebra

section ComoduleAlgebra

variable (k : Type u) (C : Type v) (A : Type w)
variable [Field k] [Semiring C] [Bialgebra k C] [Ring A] [Algebra k A]

/-- A right comodule structure on `A` (Tau Ceti's `Comodule`, coaction `A → A ⊗ C`) is a right
comodule algebra when the coaction is unital and multiplicative for the tensor-product algebra
`A ⊗ C`. -/
def IsRightComoduleAlgebra (c : TauCeti.Comodule k C A) : Prop :=
  c.coact 1 = 1 ⊗ₜ[k] 1 ∧ ∀ a b, c.coact (a * b) = c.coact a * c.coact b

end ComoduleAlgebra

section FiniteDual

variable (k : Type u) (H : Type v) (A : Type w)
variable [Field k] [Ring H] [HopfAlgebra k H] [FiniteDimensional k H]
variable [Ring A] [Algebra k A]

/-- Evaluation at `h` on Tau Ceti's finite dual `ConvolutionDual k H`. -/
noncomputable def evalConv (h : H) : ConvolutionDual k H →ₗ[k] k :=
  Module.Dual.eval k H h ∘ₗ (WithConv.linearEquiv k (Module.Dual k H)).toLinearMap

/-- For finite-dimensional `H`, left `H`-module algebra structures on `A` correspond to right
comodule algebra structures over the finite dual Hopf algebra `H*` (Tau Ceti's
`ConvolutionDual.instHopfAlgebra`). The forward coaction is `a ↦ Σ (eᵢ · a) ⊗ eᵢ*` for every basis
`e` of `H`, and the inverse action is `h · a = (id ⊗ ev_h)(ρ(a))`. -/
theorem exists_leftModuleAlgebra_equiv_rightComoduleAlgebra :
    ∃ e : LeftModuleAlgebra k H A ≃
        {c : TauCeti.Comodule k (ConvolutionDual k H) A //
          IsRightComoduleAlgebra k (ConvolutionDual k H) A c},
      (∀ (b : Module.Basis (Fin (Module.finrank k H)) k H) (X : LeftModuleAlgebra k H A) (a : A),
        (e X).1.coact a = ∑ i, X.act (b i) a ⊗ₜ[k] WithConv.toConv (b.dualBasis i)) ∧
      (∀ c h a, (e.symm c).act h a =
        TensorProduct.rid k A (LinearMap.lTensor A (evalConv k H h) (c.1.coact a))) := by
  sorry

end FiniteDual

/-! ## Layer 7: slash homology of `p`-complexes -/

section SlashHomology

variable {k : Type u} [Field k]

/-- A truncated primitive generator of `H`: a primitive `d` with `d ^ p = 0` whose powers
`1, d, …, d^(p-1)` form a basis, so that `H ≅ k[d]/(d^p)` as a Hopf algebra. -/
structure TruncatedPrimitive (H : Type v) [Ring H] [HopfAlgebra k H] (p : ℕ) where
  /-- The generator. -/
  d : H
  comul_d : Coalgebra.comul (R := k) d = d ⊗ₜ[k] 1 + 1 ⊗ₜ[k] d
  pow_d : d ^ p = 0
  /-- The monomial basis. -/
  basis : Module.Basis (Fin p) k H
  basis_apply : ∀ i, basis i = d ^ (i : ℕ)

/-- The differential of an `H`-module: multiplication by the truncated primitive generator. -/
noncomputable def TruncatedPrimitive.moduleDifferential
    {H M : Type*} [Ring H] [HopfAlgebra k H]
    [AddCommGroup M] [Module k M] [Module H M] [IsScalarTower k H M]
    {p : ℕ} (P : TruncatedPrimitive (k := k) H p) : M →ₗ[k] M :=
  DistribSMul.toLinearMap k M P.d

/-- The slash homology `H^{/j}(M) = ker(d^(j+1)) / (im(d^(p-j-1)) + ker(d^j))`, as a quotient
of the slash cycles (Khovanov–Qi, arXiv:1208.0616, §2, p. 14, equation preceding (18)). -/
def SlashHomology {M : Type*} [AddCommGroup M] [Module k M]
    (p : ℕ) (d : M →ₗ[k] M) (j : ℕ) : Type _ :=
  LinearMap.ker (d ^ (j + 1)) ⧸
    (LinearMap.range (d ^ (p - j - 1)) ⊔ LinearMap.ker (d ^ j)).comap
      (LinearMap.ker (d ^ (j + 1))).subtype

/-- Khovanov–Qi: for `p` prime, `char k = p` and a finite-dimensional module over
`H = k[d]/(d^p)`, all slash homology groups `H^{/j}`, `0 ≤ j ≤ p - 2`, vanish if and only if the
module is projective (Khovanov–Qi, arXiv:1208.0616, §2, p. 14, decomposition (20)). -/
theorem slashHomology_subsingleton_iff_projective
    {H M : Type*} [Ring H] [HopfAlgebra k H]
    [AddCommGroup M] [Module k M] [Module H M] [IsScalarTower k H M] [FiniteDimensional k M]
    {p : ℕ} [Fact p.Prime] [CharP k p] (P : TruncatedPrimitive (k := k) H p) :
    (∀ j ≤ p - 2, Subsingleton (SlashHomology p (P.moduleDifferential (M := M)) j)) ↔
      Module.Projective H M := by
  sorry

end SlashHomology

end TauCetiRoadmap.HopfologicalAlgebra
