import Mathlib.Topology.Homotopy.HomotopyGroup
import Mathlib.Topology.CompactOpen
import TauCeti.Algebra.Homology.DG.Module.Right.Defs
import TauCeti.Topology.Homotopy.HomotopyGroup.LoopSpace

/-!
# Morse and Floer homology with DG coefficients: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Only Layer 0 (singular cubes), Layer 2 (Moore paths) and Layer 4 (twisting cocycles over a
DG algebra) are prototyped: they rest on material that exists in Mathlib and Tau Ceti today.
The twisting equation is written in the source's homological sign convention on a
cohomologically graded algebra, through the grading bridge `C^{-n} = C_n` of the README; its
comparison with the DG roadmap's `(MC)` is acceptance criterion 2.
-/

namespace TauCetiRoadmap.DGFloer

open scoped unitInterval

/-! ## Layer 0: cubical singular chains -/

/-- A **singular `n`-cube** in `X`: a continuous map from the cube `Iⁿ`. -/
abbrev SingularCube (X : Type*) [TopologicalSpace X] (n : ℕ) := C(Fin n → I, X)

namespace SingularCube

variable {X Y : Type*} [TopologicalSpace X] [TopologicalSpace Y]

/-- A singular cube is **degenerate** when it does not depend on at least one coordinate
(Massey's convention; it is closed under the cross product, unlike Serre's). -/
def IsDegenerate {n : ℕ} (s : SingularCube X n) : Prop :=
  ∃ i : Fin n, ∀ x y : Fin n → I, (∀ j, j ≠ i → x j = y j) → s x = s y

/-- The **cross product** of singular cubes: the first `p` coordinates feed `s`, the last `q`
feed `t`. It is strictly associative up to the canonical identification of index types. -/
def prod {p q : ℕ} (s : SingularCube X p) (t : SingularCube Y q) :
    SingularCube (X × Y) (p + q) :=
  ⟨fun x ↦ (s fun i ↦ x (Fin.castAdd q i), t fun j ↦ x (Fin.natAdd p j)), by fun_prop⟩

/-- The cross product of a degenerate cube with any cube is degenerate. -/
theorem IsDegenerate.prod_left {p q : ℕ} {s : SingularCube X p} (hs : s.IsDegenerate)
    (t : SingularCube Y q) : (s.prod t).IsDegenerate := sorry

/-- The cross product of any cube with a degenerate cube is degenerate. -/
theorem IsDegenerate.prod_right {p q : ℕ} (s : SingularCube X p) {t : SingularCube Y q}
    (ht : t.IsDegenerate) : (s.prod t).IsDegenerate := sorry

end SingularCube

/-! ## Layer 2: Moore paths -/

/-- A **Moore path** in `X`: a length `L ≥ 0` and a path on `[0, ∞)` that is stopped at time
`L`. Concatenation of Moore paths is strictly associative with strict units. -/
structure MoorePath (X : Type*) [TopologicalSpace X] where
  /-- The length of the path. -/
  length : ℝ
  length_nonneg : 0 ≤ length
  /-- The path, parametrized by `[0, ∞)`. -/
  toFun : C(Set.Ici (0 : ℝ), X)
  /-- The path is stopped from time `length` on. -/
  stopped : ∀ t : Set.Ici (0 : ℝ), length ≤ t →
    toFun t = toFun ⟨length, length_nonneg⟩

namespace MoorePath

variable {X : Type*} [TopologicalSpace X]

/-- The starting point of a Moore path. -/
def source (γ : MoorePath X) : X := γ.toFun ⟨0, Set.mem_Ici.2 le_rfl⟩

/-- The end point of a Moore path. -/
def target (γ : MoorePath X) : X := γ.toFun ⟨γ.length, γ.length_nonneg⟩

/-- Concatenation of Moore paths: lengths add, and the second path starts where the first
stops. -/
def trans (γ δ : MoorePath X) (h : γ.target = δ.source) : MoorePath X := sorry

theorem length_trans (γ δ : MoorePath X) (h : γ.target = δ.source) :
    (γ.trans δ h).length = γ.length + δ.length := sorry

/-- Concatenation of Moore paths is strictly associative. -/
theorem trans_assoc (γ δ ε : MoorePath X) (h₁ : γ.target = δ.source)
    (h₂ : δ.target = ε.source) (h₁₂ : (γ.trans δ h₁).target = ε.source)
    (h₂₃ : γ.target = (δ.trans ε h₂).source) :
    (γ.trans δ h₁).trans ε h₁₂ = γ.trans (δ.trans ε h₂) h₂₃ := sorry

end MoorePath

/-! ## Layer 4: twisting cocycles and the twisted complex -/

section Twisting

variable {R A : Type*} [CommRing R] [Ring A] [Algebra R A]
  {𝒜 : ℤ → Submodule R A} [GradedAlgebra 𝒜] {d : A →ₗ[R] A}

/-- A **twisting cocycle** over the DG algebra `(𝒜, d)` on a finite set `P` of generators
graded by `ind`. In homological notation `m x y` has degree `ind x - ind y - 1`, so under the
grading bridge it lies in cohomological degree `ind y - ind x + 1`. The twisting equation is the
source's `∂m_{x,y} = Σ_z (-1)^{ind x - ind z} m_{x,z} m_{z,y}`. -/
structure TwistingCocycle (h : TauCeti.IsDGAlgebra 𝒜 d) (P : Type*) [Fintype P] (ind : P → ℤ)
    where
  /-- The coefficient of `y` in the twisted differential of `x`. -/
  m : P → P → A
  mem_graded : ∀ x y, m x y ∈ 𝒜 (ind y - ind x + 1)
  twisting : ∀ x y, d (m x y) = ∑ z, (ind x - ind z).negOnePow • (m x z * m z y)

/-- The twisted differential on `M ⊗ ⟨P⟩`, identified with `P → M`:
`D(α ⊗ x) = ∂α ⊗ x + (-1)^{|α|} Σ_y α · m_{x,y} ⊗ y`. -/
def twistedDifferential {h : TauCeti.IsDGAlgebra 𝒜 d} {P : Type*} [Fintype P] {ind : P → ℤ}
    (_m : TwistingCocycle h P ind)
    {M : Type*} [AddCommGroup M] [Module R M] [Module Aᵐᵒᵖ M] [IsScalarTower R Aᵐᵒᵖ M]
    (_dM : M →ₗ[R] M) : (P → M) →ₗ[R] (P → M) := sorry

/-- The twisted differential squares to zero when `M` is a DG right module. -/
theorem twistedDifferential_sq {h : TauCeti.IsDGAlgebra 𝒜 d} {P : Type*} [Fintype P]
    {ind : P → ℤ} (m : TwistingCocycle h P ind)
    {M : Type*} [AddCommGroup M] [Module R M] [Module Aᵐᵒᵖ M] [IsScalarTower R Aᵐᵒᵖ M]
    {ℳ : ℤ → Submodule R M}
    [SetLike.GradedSMul (TauCeti.InternalGrading.ofDecomposition 𝒜).opposite.piece ℳ]
    [DirectSum.Decomposition ℳ] {dM : M →ₗ[R] M}
    (_hM : TauCeti.IsDGRightModule h ℳ dM) (f : P → M) :
    twistedDifferential m dM (twistedDifferential m dM f) = 0 := sorry

end Twisting

end TauCetiRoadmap.DGFloer
