import Mathlib
import TauCeti.Algebra.Homology.DG.Module.Right.Defs

/-!
# Morse and Floer homology with DG coefficients: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The Layer 4 declarations below illustrate only the finite-generator algebraic complex.
Layer 4.5 additionally constructs an arbitrary-small-CW, finite-support semi-free Brown
resolution, its path-space augmentation comparison and the resulting derived tensor maps.
Those topological and infinite-basis targets are specified in README.md; neither finite
matrix Maurer--Cartan data nor the finite `P → M` prototype supplies their resolution proof.

Only the Layer 1 homotopy-theoretic headlines (the degree-one Hurewicz theorem, mod-2
vanishing, Lemma 3.41 and the existence of `K(A, n)`) and the twisted square-zero theorem
(Layer 4, over a DG algebra) are stated: they rest on material that exists in Mathlib and Tau
Ceti today. The other headlines lack carriers (Moore loop spaces, the Serre-fibration carrier,
Liouville domains, Floer chain complexes); they are
specified in README.md. In Layer 4, `P → M` stands for `M ⊗_A K_m`, where `K_m` is the twisted
complex of free left modules of the README; the coefficient `m x y` acts on the right of `α`.
The twisting equation is written in the source's homological sign convention on a
cohomologically graded algebra, through the grading bridge `C^{-n} = C_n` of the README; its
comparison with the DG roadmap's `(MC)` is acceptance criterion 2.
-/

namespace TauCetiRoadmap.DGFloer

open scoped Topology

/-! ## Layer 1: the Hurewicz theorem in degree one -/

/-- **Hurewicz in degree one**: for a path-connected space, the abelianization of the fundamental
group is isomorphic to the first singular homology group. This states only the existence of an
isomorphism; the canonical natural comparison is a target of README.md, Layer 1 item 1. -/
theorem hurewiczOne (X : Type) [TopologicalSpace X] [PathConnectedSpace X] (x : X) :
    Nonempty (Additive (Abelianization (FundamentalGroup X x)) ≃+
      ((AlgebraicTopology.singularHomologyFunctor.{0, 0, 1}
        (ModuleCat.{0} ℤ) 1).obj (ModuleCat.of ℤ ℤ)).obj (TopCat.of X)) := by
  sorry

/-- **Mod-2 vanishing**: if `Y` is simply connected and `H_{i+1}(Y; ℤ/2) = 0` for all `i`, then
squaring `g ↦ g * g` is a bijection of `π_{n+1}(Y)` for every `n`. This is the roadmap's own
form of the source's Theorem 5.15 step; it feeds Theorem C. -/
theorem mod2Vanishing (Y : Type) [TopologicalSpace Y] [SimplyConnectedSpace Y] (y : Y)
    (hY : ∀ i : ℕ, Subsingleton
      (((AlgebraicTopology.singularHomologyFunctor.{0, 0, 1} (ModuleCat.{0} (ZMod 2)) (i + 1)).obj
        (@ModuleCat.of (ZMod 2) _ (ZMod 2) _ (@Semiring.toModule (ZMod 2) _))).obj
          (TopCat.of Y))) :
    ∀ n : ℕ, Function.Bijective (fun g : π_ (n + 1) Y y => g * g) := by
  sorry

/-- **Lemma 3.41**: a path-connected space is aspherical exactly when its double loop space has
the homology of a point, for the fixed-interval loop model. -/
theorem aspherical_iff_homology_loopSpace_loopSpace (Q : Type) [TopologicalSpace Q] (q : Q) :
    (PathConnectedSpace Q ∧ ∀ n : ℕ, Subsingleton (π_ (n + 2) Q q)) ↔
      ∀ i : ℕ, Subsingleton
        (((AlgebraicTopology.singularHomologyFunctor.{0, 0, 1} (ModuleCat.{0} ℤ) (i + 1)).obj
          (ModuleCat.of ℤ ℤ)).obj
            (TopCat.of (LoopSpace (LoopSpace Q q) (Path.refl q)))) := by
  sorry

/-- **Existence of `K(A, n + 1)`**: every abelian group is the unique nonvanishing homotopy group
of a path-connected space. -/
theorem exists_eilenbergMacLane (A : Type) [AddCommGroup A] (n : ℕ) :
    ∃ (X : Type) (_ : TopologicalSpace X) (x : X), PathConnectedSpace X ∧
      Nonempty (Additive (π_ (n + 1) X x) ≃+ A) ∧ ∀ k ≠ n, Subsingleton (π_ (k + 1) X x) := by
  sorry

/-! ## Layer 4: twisting cocycles and the twisted complex -/

section Twisting

variable {R A : Type*} [CommRing R] [Ring A] [Algebra R A]
  {𝒜 : ℤ → Submodule R A} [GradedAlgebra 𝒜] {d : A →ₗ[R] A}

/-- A **twisting cocycle** over the DG algebra `(𝒜, d)` on a finite set `P` of generators
graded by `ind`. In homological notation `m x y` has degree `ind x - ind y - 1`, so under the
grading bridge it lies in cohomological degree `ind y - ind x + 1`. The twisting equation is the
source's `∂m_{x,y} = Σ_z (-1)^{ind x - ind z} m_{x,z} m_{z,y}`.

The one-sidedness condition is part of the data: it does not follow from the degree and the
twisting equation over an arbitrary DG algebra (README, Layer 4 item 1). -/
structure TwistingCocycle (h : TauCeti.IsDGAlgebra 𝒜 d) (P : Type*) [Fintype P] (ind : P → ℤ)
    where
  /-- The coefficient of `y` in the twisted differential of `x`. -/
  m : P → P → A
  mem_graded : ∀ x y, m x y ∈ 𝒜 (ind y - ind x + 1)
  twisting : ∀ x y, d (m x y) = ∑ z, (ind x - ind z).negOnePow • (m x z * m z y)
  /-- Strict upper-triangularity for the order by `ind`. -/
  one_sided : ∀ x y, ind x ≤ ind y → m x y = 0

variable {M : Type*} [AddCommGroup M] [Module R M] [Module Aᵐᵒᵖ M] [IsScalarTower R Aᵐᵒᵖ M]

/-- The **grading involution** `α ↦ (-1)^{|α|} α` of an internally graded module, which carries
the Koszul sign of the twisted differential. -/
def gradingInvolution (ℳ : ℤ → Submodule R M) [DirectSum.Decomposition ℳ] : M →ₗ[R] M :=
  DirectSum.toModule R ℤ M (fun q ↦ ((q.negOnePow : ℤˣ) : ℤ) • (ℳ q).subtype) ∘ₗ
    (DirectSum.decomposeLinearEquiv ℳ).toLinearMap

/-- The twisted complex `M ⊗_A K_m`, with `M ⊗ ⟨P⟩` identified with `P → M`, is graded in total
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

/-- The twisted differential on `M ⊗_A K_m`, identified with `P → M`. Its `y`-component is
`(D f) y = ∂(f y) + Σ_x (m_{x,y} acting on the right) (ε (f x))`, where `ε = gradingInvolution ℳ`
carries the Koszul sign.  On a homogeneous elementary tensor this is
`D(α ⊗ x) = ∂α ⊗ x + (-1)^{|α|} Σ_y α · m_{x,y} ⊗ y`. The right
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

/-- The twisted differential squares to zero when `M` is a DG right module. -/
theorem twistedDifferential_sq (m : TwistingCocycle h P ind) {dM : M →ₗ[R] M}
    (hM : TauCeti.IsDGRightModule h ℳ dM) (f : P → M) :
    twistedDifferential m ℳ dM (twistedDifferential m ℳ dM f) = 0 := sorry

end Twisting

end TauCetiRoadmap.DGFloer
