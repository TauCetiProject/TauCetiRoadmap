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
The Moore-path carrier is the strict-concatenation model; it is not homeomorphic to the
fixed-interval loop space, and the two are compared by a homotopy equivalence (README, standing
conventions). In Layer 4, `P → M` stands for `M ⊗_R K_m`, where `K_m` is the twisted complex of
free left modules of the README; the coefficient `m x y` acts on the right of `α`.
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
source's `∂m_{x,y} = Σ_z (-1)^{ind x - ind z} m_{x,z} m_{z,y}`.

The one-sidedness condition is part of the data: it does not follow from the degree and the
twisting equation over an arbitrary DG algebra (README, Layer 4 item 1), but it is automatic over
a cohomologically nonpositive algebra (`TwistingCocycle.one_sided_of_nonpos`). -/
structure TwistingCocycle (h : TauCeti.IsDGAlgebra 𝒜 d) (P : Type*) [Fintype P] (ind : P → ℤ)
    where
  /-- The coefficient of `y` in the twisted differential of `x`. -/
  m : P → P → A
  mem_graded : ∀ x y, m x y ∈ 𝒜 (ind y - ind x + 1)
  twisting : ∀ x y, d (m x y) = ∑ z, (ind x - ind z).negOnePow • (m x z * m z y)
  /-- Strict upper-triangularity for the order by `ind`. -/
  one_sided : ∀ x y, ind x ≤ ind y → m x y = 0

omit [GradedAlgebra 𝒜] in
/-- Over a cohomologically nonpositive algebra (for instance `C_*(ΩB)` through the grading
bridge), the degree condition alone forces one-sidedness. -/
theorem TwistingCocycle.one_sided_of_nonpos {P : Type*} {ind : P → ℤ} (m : P → P → A)
    (hm : ∀ x y, m x y ∈ 𝒜 (ind y - ind x + 1)) (h𝒜 : ∀ n, 0 < n → 𝒜 n = ⊥) :
    ∀ x y, ind x ≤ ind y → m x y = 0 := by
  intro x y hxy
  have h := hm x y
  rw [h𝒜 _ (by omega)] at h
  exact (Submodule.mem_bot R).1 h

variable {M : Type*} [AddCommGroup M] [Module R M] [Module Aᵐᵒᵖ M] [IsScalarTower R Aᵐᵒᵖ M]

/-- The **grading involution** `α ↦ (-1)^{|α|} α` of an internally graded module, which carries
the Koszul sign of the twisted differential. -/
def gradingInvolution (ℳ : ℤ → Submodule R M) [DirectSum.Decomposition ℳ] : M →ₗ[R] M := sorry

theorem gradingInvolution_of_mem (ℳ : ℤ → Submodule R M) [DirectSum.Decomposition ℳ] {q : ℤ}
    {α : M} (hα : α ∈ ℳ q) : gradingInvolution ℳ α = q.negOnePow • α := sorry

/-- The twisted complex `M ⊗_R K_m`, with `M ⊗ ⟨P⟩` identified with `P → M`, is graded in total
degree `n` by `f x ∈ ℳ (n + ind x)`: the generator `x` sits in cohomological degree `-ind x`. -/
def totalGrading (ℳ : ℤ → Submodule R M) {P : Type*} (ind : P → ℤ) (n : ℤ) :
    Submodule R (P → M) where
  carrier := {f | ∀ x, f x ∈ ℳ (n + ind x)}
  add_mem' hf hg x := add_mem (hf x) (hg x)
  zero_mem' _ := zero_mem _
  smul_mem' c _ hf x := Submodule.smul_mem _ c (hf x)

variable {h : TauCeti.IsDGAlgebra 𝒜 d} {P : Type*} [Fintype P] [DecidableEq P] {ind : P → ℤ}
  {ℳ : ℤ → Submodule R M}
  [SetLike.GradedSMul (TauCeti.InternalGrading.ofDecomposition 𝒜).opposite.piece ℳ]
  [DirectSum.Decomposition ℳ]

/-- The twisted differential on `M ⊗_R K_m`, identified with `P → M`. Its `y`-component is
`(D f) y = ∂(f y) + Σ_x (m_{x,y} acting on the right) (ε (f x))`, where `ε = gradingInvolution ℳ`
carries the Koszul sign. On a homogeneous elementary tensor this is
`D(α ⊗ x) = ∂α ⊗ x + (-1)^{|α|} Σ_y α · m_{x,y} ⊗ y` (`twistedDifferential_single`). The right
`A`-action on `M` enters the construction itself, so the map depends on it: for `A = ℚ × ℚ` acting
on `M = ℚ` through either projection, with `ind x = 1`, `ind y = 0` and `m x y = (1, 0)`, the two
actions give `D(1 ⊗ x) = 1 ⊗ y` and `D(1 ⊗ x) = 0` (acceptance criterion 2).

`R`-linearity needs the two actions on `M` to commute, `[SMulCommClass R Aᵐᵒᵖ M]`; the instance
is bound on the definition and used in `map_smul'`, so it is retained in the signature. -/
def twistedDifferential [SMulCommClass R Aᵐᵒᵖ M] (m : TwistingCocycle h P ind)
    (ℳ : ℤ → Submodule R M) [DirectSum.Decomposition ℳ] (dM : M →ₗ[R] M) :
    (P → M) →ₗ[R] (P → M) where
  toFun f y := dM (f y) + ∑ x, MulOpposite.op (m.m x y) • gradingInvolution ℳ (f x)
  map_add' f g := by
    funext y
    simp only [Pi.add_apply, map_add, smul_add, Finset.sum_add_distrib]
    abel
  map_smul' r f := by
    funext y
    simp only [Pi.smul_apply, map_smul, RingHom.id_apply, smul_add, Finset.smul_sum, smul_comm r]

/-- Evaluation on a homogeneous elementary tensor `α ⊗ x`, with `α` of degree `q`. -/
theorem twistedDifferential_single (m : TwistingCocycle h P ind) (dM : M →ₗ[R] M) (x : P)
    {q : ℤ} {α : M} (hα : α ∈ ℳ q) :
    twistedDifferential m ℳ dM (Pi.single x α) =
      Pi.single x (dM α) + ∑ y, Pi.single y (q.negOnePow • (MulOpposite.op (m.m x y) • α)) :=
  sorry

/-- The twisted differential raises the total degree by one. -/
theorem twistedDifferential_mem_totalGrading (m : TwistingCocycle h P ind) {dM : M →ₗ[R] M}
    (hM : TauCeti.IsDGRightModule h ℳ dM) {n : ℤ} {f : P → M} (hf : f ∈ totalGrading ℳ ind n) :
    twistedDifferential m ℳ dM f ∈ totalGrading ℳ ind (n + 1) := sorry

/-- The twisted differential squares to zero when `M` is a DG right module. -/
theorem twistedDifferential_sq (m : TwistingCocycle h P ind) {dM : M →ₗ[R] M}
    (hM : TauCeti.IsDGRightModule h ℳ dM) (f : P → M) :
    twistedDifferential m ℳ dM (twistedDifferential m ℳ dM f) = 0 := sorry

end Twisting

end TauCetiRoadmap.DGFloer
