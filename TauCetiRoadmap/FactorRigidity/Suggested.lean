/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Approximation, deformation and rigidity of finite factors: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions on native carriers that their statements need.

Unitary representations of a discrete group are Mathlib's `ContRepresentation ℂ Γ H` on a complex
Hilbert space whose operators preserve norms, which is Tau Ceti's `IsUnitary` for continuous
representations through its `isUnitary_iff_norm_map`; a discrete group needs no continuity
hypothesis.

Stated here:

* relative property (T) of the pair `(ℤ² ⋊ SL₂(ℤ), ℤ²)`, and of `(ℤ² ⋊ G, ℤ²)` for every
  nonamenable subgroup `G ≤ SL₂(ℤ)` (Layer 3);
* the Haagerup property of the free group of every countable rank (Layer 4).

Not statable at the pins, and therefore not stated:

* `F(L(ℤ² ⋊ F_n)) = {1}` for a finite-index free subgroup `F_n ≤ SL₂(ℤ)` (Layer 7): the pins have
  no group von Neumann algebra `L(Γ)` with its trace and no amplification `M^t` of a II₁ factor;
* Bernoulli strong rigidity (Layer 9): the pins have no group-measure-space crossed product
  `L∞(X) ⋊ Γ` and no amplification;
* solidity and primeness of `L(F_n)` (Layer 10): the pins have no group von Neumann algebra, no
  relative commutant notion for von Neumann subalgebras with amenability of finite von Neumann
  algebras, and no spatial tensor product of von Neumann algebras.
-/

noncomputable section

open Filter Topology
open scoped ComplexOrder ENNReal

namespace TauCetiRoadmap.FactorRigidity

/-! ## Layer 3: relative property (T) and spectral gap -/

/-- A representation of a discrete group has almost invariant vectors when for every finite set
`F` of group elements and every `ε > 0` some unit vector is moved by less than `ε` by each element
of `F`. -/
def HasAlmostInvariantVectors {Γ H : Type*} [Group Γ] [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] (ρ : ContRepresentation ℂ Γ H) : Prop :=
  ∀ (F : Finset Γ) (ε : ℝ), 0 < ε → ∃ ξ : H, ‖ξ‖ = 1 ∧ ∀ g ∈ F, ‖ρ g ξ - ξ‖ < ε

/-- A subgroup `Λ` of a discrete group `Γ` has relative property (T) in `Γ` when every unitary
representation of `Γ` on a complex Hilbert space (in universe `u`) with almost invariant vectors
has a nonzero `Λ`-invariant vector (Anantharaman–Popa, Definition 14.1.1). -/
def RelativePropertyT.{u, v} {Γ : Type v} [Group Γ] (Λ : Subgroup Γ) : Prop :=
  ∀ (H : Type u) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (ρ : ContRepresentation ℂ Γ H), (∀ g v, ‖ρ g v‖ = ‖v‖) → HasAlmostInvariantVectors ρ →
      ∃ ξ : H, ξ ≠ 0 ∧ ∀ h ∈ Λ, ρ h ξ = ξ

/-- The action of `SL₂(ℤ)` on `ℤ²` by matrix multiplication on column vectors, as automorphisms
of the multiplicative copy of `ℤ²` used by `SemidirectProduct`. -/
def slTwoAction :
    Matrix.SpecialLinearGroup (Fin 2) ℤ →* MulAut (Multiplicative (Fin 2 → ℤ)) where
  toFun g := AddEquiv.toMultiplicative (Matrix.SpecialLinearGroup.toLin' g).toAddEquiv
  map_one' := by
    ext v
    simp
  map_mul' g h := by
    ext v
    simp

/-- A discrete group is amenable when the bounded real functions on it carry a left-invariant
mean: a positive linear functional taking the value `1` on the constant function `1` and
unchanged under left translation `f ↦ (x ↦ f(g⁻¹x))`. -/
def IsAmenableDiscrete (G : Type*) [Group G] : Prop :=
  ∃ m : lp (fun _ : G => ℝ) ∞ →ₗ[ℝ] ℝ,
    (∀ f : lp (fun _ : G => ℝ) ∞, (∀ x, 0 ≤ f x) → 0 ≤ m f) ∧
    (∀ f : lp (fun _ : G => ℝ) ∞, (∀ x, f x = 1) → m f = 1) ∧
    ∀ (g : G) (f f' : lp (fun _ : G => ℝ) ∞), (∀ x, f' x = f (g⁻¹ * x)) → m f' = m f

/-- Kazhdan–Margulis: the pair `(ℤ² ⋊ SL₂(ℤ), ℤ²)` has relative property (T)
(Anantharaman–Popa, Example 14.2.8). -/
theorem relativePropertyT_inl_slTwo.{u} :
    RelativePropertyT.{u, 0}
      (SemidirectProduct.inl (G := Matrix.SpecialLinearGroup (Fin 2) ℤ)
        (φ := slTwoAction)).range := by
  sorry

/-- Burger: for every nonamenable subgroup `G ≤ SL₂(ℤ)` the pair `(ℤ² ⋊ G, ℤ²)` has relative
property (T) (Anantharaman–Popa, Example 14.2.8). -/
theorem relativePropertyT_inl_of_not_isAmenableDiscrete.{u}
    (G : Subgroup (Matrix.SpecialLinearGroup (Fin 2) ℤ)) (hG : ¬ IsAmenableDiscrete G) :
    RelativePropertyT.{u, 0}
      (SemidirectProduct.inl (G := G) (φ := slTwoAction.comp G.subtype)).range := by
  sorry

/-! ## Layer 4: Haagerup approximation -/

/-- A function `φ : G → ℂ` on a group is positive definite when
`Σᵢ Σⱼ conj(cᵢ) cⱼ φ(gᵢ⁻¹ gⱼ) ≥ 0` for all finite families `gᵢ ∈ G`, `cᵢ ∈ ℂ`. -/
def IsPositiveDefinite {G : Type*} [Group G] (φ : G → ℂ) : Prop :=
  ∀ (n : ℕ) (g : Fin n → G) (c : Fin n → ℂ),
    0 ≤ ∑ i, ∑ j, star (c i) * c j * φ ((g i)⁻¹ * g j)

/-- A discrete group has the Haagerup property when normalized positive-definite functions
vanishing at infinity approximate the constant function `1` uniformly on every finite set
(the net formulation of Anantharaman–Popa, Definition 16.1.1). -/
def HasHaagerupProperty (G : Type*) [Group G] : Prop :=
  ∀ (F : Finset G) (ε : ℝ), 0 < ε → ∃ φ : G → ℂ, IsPositiveDefinite φ ∧ φ 1 = 1 ∧
    Tendsto φ cofinite (𝓝 0) ∧ ∀ g ∈ F, ‖φ g - 1‖ < ε

/-- Haagerup: the free group on any countable set of generators, in particular `F_n` for
`2 ≤ n ≤ ∞`, has the Haagerup property (Anantharaman–Popa, Examples 16.1.2). -/
theorem hasHaagerupProperty_freeGroup (ι : Type*) [Countable ι] :
    HasHaagerupProperty (FreeGroup ι) := by
  sorry

end TauCetiRoadmap.FactorRigidity
