import Mathlib
import TauCeti.RepresentationTheory.ProjectiveRepresentation.Extension
import TauCeti.LinearAlgebra.BilinearForm.Isometry

/-!
# MetaplecticAutomorphicForms: representative target signatures

The roadmap is `README.md`. This file records the definitions and theorem signatures of the
roadmap that can be stated against the pinned Mathlib and Tau Ceti APIs; it is not exhaustive.
The oscillator normalizer and its metaplectic double cover, the Weil index, oscillator actions on
Schwartz–Bruhat spaces, local theta modules, adelic covers, genuine automorphic forms, the
Siegel–Weil and Rallis identities, half-integral-weight Maass spaces and the genus-two Eisenstein
families are README targets: their carriers are not available at the pins.

The design choices made explicit here:

* A Heisenberg extension uses coefficient-first coordinates `(t, w)` with law
  `(t, w)(s, v) = (t + s + B(w, v), w + v)`. It is Tau Ceti's factor-set extension of
  `Multiplicative W` by `Multiplicative C` for the trivial action. The symplectic model takes
  `B = ω/2` and so needs `2` invertible.
* A bilinear isometry acts on the extension through the vector coordinate. In the isometry group
  the product `e * f` applies `f` first.
* The Schrödinger operator of `(t, x, y)` multiplies by `ψ(t + B(u, y) + B(x, y)/2)` and
  translates by `x`.
* The finite Weil operators use the `ω_L` convention: `T` multiplies `e_μ` by `e(−q(μ))`, and
  `S` is the discriminant-pairing Fourier transform with the positive exponent.
* Genus-two Gaussian integrals use ordinary Lebesgue measure. The theta pairing then has diagonal
  value `√det Y/(4a)`, and the real Gaussian Fourier integral in `W` has factor `√(−det Z)/(2m)`.
-/

namespace TauCetiRoadmap.MetaplecticAutomorphicForms

/-! ## Layer 0: Symplectic and Heisenberg groups with topology -/

namespace Heisenberg

open LinearMap (BilinForm)
open Multiplicative

attribute [local instance] TauCeti.trivialMulDistribMulAction

variable {R C W W' : Type*} [CommRing R] [AddCommGroup C] [Module R C]
  [AddCommGroup W] [Module R W] [AddCommGroup W'] [Module R W']

/-- The factor set `(w, v) ↦ B(w, v)` of a bilinear map `B : W × W → C`, for the trivial action
of `W` on `C` (0.1). Its Tau Ceti extension is the group with law
`(t, w)(s, v) = (t + s + B(w, v), w + v)`. The cocycle identity is biadditivity of `B`. -/
def bilinearFactorSet (B : LinearMap.BilinMap R W C) :
    TauCeti.FactorSet (Multiplicative W) (Multiplicative C) where
  toFun p := ofAdd (B p.1.toAdd p.2.toAdd)
  isMulCocycle₂' g h j := by
    apply toAdd.injective
    simp only [TauCeti.trivialMulDistribMulAction_smul, toAdd_mul, toAdd_ofAdd, map_add,
      LinearMap.add_apply]
    abel
  map_one_one' := by simp

@[simp]
theorem bilinearFactorSet_apply (B : LinearMap.BilinMap R W C) (x y : Multiplicative W) :
    bilinearFactorSet B (x, y) = ofAdd (B x.toAdd y.toAdd) :=
  rfl

/-- Multiplication in coefficient-first coordinates (0.1). -/
theorem bilinearFactorSet_mul_left (B : LinearMap.BilinMap R W C)
    (p q : (bilinearFactorSet B).Extension) :
    (p * q).left.toAdd = p.left.toAdd + q.left.toAdd + B p.right.toAdd q.right.toAdd := by
  sorry

/-- For the zero cocycle on `ℤ`, multiplication adds the coefficient coordinates (0.1). -/
example (t u x y : ℤ) :
    let B : BilinForm ℤ ℤ := 0
    let p : (bilinearFactorSet B).Extension := ⟨ofAdd t, ofAdd x⟩
    let q : (bilinearFactorSet B).Extension := ⟨ofAdd u, ofAdd y⟩
    (p * q).left.toAdd = t + u := by
  sorry

/-- The upper-triangular cocycle takes value one at `(e₀,e₁)` (0.1). -/
example :
    let B := Matrix.toBilin' (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℤ)
    (bilinearFactorSet B (ofAdd ![1, 0], ofAdd ![0, 1])).toAdd = 1 := by
  sorry

/-- Reversing the basis vectors gives value zero for that cocycle (0.1). -/
example :
    let B := Matrix.toBilin' (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℤ)
    (bilinearFactorSet B (ofAdd ![0, 1], ofAdd ![1, 0])).toAdd = 0 := by
  sorry

/-- The commutator of `p` and `q` is central, with coefficient `B(w, v) − B(v, w)` (0.3). -/
theorem bilinearFactorSet_commutator (B : LinearMap.BilinMap R W C)
    (p q : (bilinearFactorSet B).Extension) :
    p * q * p⁻¹ * q⁻¹ = (bilinearFactorSet B).inl
      (ofAdd (B p.right.toAdd q.right.toAdd - B q.right.toAdd p.right.toAdd)) := by
  sorry

/-- **Center criterion** (0.4): `p` is central exactly when `B(w, ·) = B(·, w)` for its vector
coordinate `w`. -/
theorem bilinearFactorSet_mem_center_iff (B : LinearMap.BilinMap R W C)
    (p : (bilinearFactorSet B).Extension) :
    p ∈ Subgroup.center (bilinearFactorSet B).Extension ↔
      ∀ y : W, B p.right.toAdd y = B y p.right.toAdd := by
  sorry

/-- **Center of the Heisenberg group** (0.6): for an alternating nondegenerate form `B` with `2`
invertible, the center of the extension by `B/2` is the coefficient group. -/
theorem halfForm_center (B : BilinForm R W) (hB : B.IsAlt) (hn : B.Nondegenerate)
    [Invertible (2 : R)] :
    Subgroup.center (bilinearFactorSet ((⅟(2 : R)) • B)).Extension =
      ((bilinearFactorSet ((⅟(2 : R)) • B)).inl).range := by
  sorry

/-- Without nondegeneracy the center is larger: for the zero form on `ℤ` every element is
central, while the coefficient group is proper. -/
example : Subgroup.center (bilinearFactorSet (0 : BilinForm ℤ ℤ)).Extension ≠
    (bilinearFactorSet (0 : BilinForm ℤ ℤ)).inl.range := by
  sorry

/-- The cocycle `B(w, v)` of the upper-triangular form on `ℤ²` is not symmetric, so `e₀` and
`e₁` do not commute: the commutator coefficient is `B(e₀, e₁) − B(e₁, e₀) = 1`. -/
example :
    let B := Matrix.toBilin' (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℤ)
    let p : (bilinearFactorSet B).Extension := ⟨1, ofAdd ![1, 0]⟩
    let q : (bilinearFactorSet B).Extension := ⟨1, ofAdd ![0, 1]⟩
    (p * q * p⁻¹ * q⁻¹).left.toAdd = 1 := by
  sorry

/-- A bilinear isometry `e : (W, B) ≃ (W', B')` induces `(t, w) ↦ (t, e w)` between the
extensions (0.7). -/
def extensionIsometry {B : BilinForm R W} {B' : BilinForm R W'} (e : B.IsometryEquiv B') :
    (bilinearFactorSet B).Extension ≃* (bilinearFactorSet B').Extension where
  toFun p := ⟨p.left, ofAdd (e p.right.toAdd)⟩
  invFun p := ⟨p.left, ofAdd (e.symm p.right.toAdd)⟩
  left_inv p := by
    ext
    · rfl
    · simp only [toAdd_ofAdd]
      exact congrArg ofAdd (e.toLinearEquiv.symm_apply_apply p.right.toAdd)
  right_inv p := by
    ext
    · rfl
    · simp only [toAdd_ofAdd]
      exact congrArg ofAdd (e.toLinearEquiv.apply_symm_apply p.right.toAdd)
  map_mul' p q := by
    ext
    · simp only [TauCeti.FactorSet.Extension.mul_left, TauCeti.trivialMulDistribMulAction_smul,
        bilinearFactorSet_apply, toAdd_ofAdd, e.map_app]
    · simp only [TauCeti.FactorSet.Extension.mul_right, toAdd_mul, toAdd_ofAdd, map_add]

/-- Extension of the identity fixes `(3,4)` for the zero form (0.7). -/
example : extensionIsometry (BilinForm.IsometryEquiv.refl (0 : BilinForm ℤ ℤ))
    ⟨ofAdd 3, ofAdd 4⟩ = ⟨ofAdd 3, ofAdd 4⟩ := by
  sorry

/-- Extension of negation fixes the coefficient and negates the vector (0.7). -/
example :
    let e : (0 : BilinForm ℤ ℤ).IsometryEquiv 0 :=
      { (LinearEquiv.neg ℤ : ℤ ≃ₗ[ℤ] ℤ) with map_app' := by intros; simp }
    extensionIsometry e ⟨ofAdd 3, ofAdd 4⟩ = ⟨ofAdd 3, ofAdd (-4)⟩ := by
  sorry

/-- Inverse isometries induce inverse extension maps, also between different modules (0.7). -/
example {B : BilinForm R W} {B' : BilinForm R W'} (e : B.IsometryEquiv B')
    (p : (bilinearFactorSet B).Extension) :
    extensionIsometry e.symm (extensionIsometry e p) = p := by
  sorry

/-- The isometry group of `B` acts on the extension through the vector coordinate (0.8). -/
def extensionIsometryAction (B : BilinForm R W) :
    TauCeti.BilinForm.isometryGroup B →* MulAut (bilinearFactorSet B).Extension where
  toFun e := extensionIsometry
    { (e : W ≃ₗ[R] W) with
      map_app' := fun x y => (TauCeti.BilinForm.mem_isometryGroup_iff.mp e.2) x y }
  map_one' := rfl
  map_mul' _ _ := rfl

/-- The identity isometry acts identically on `(3,4)` (0.8). -/
example : extensionIsometryAction (0 : BilinForm ℤ ℤ) 1
    ⟨ofAdd 3, ofAdd 4⟩ = ⟨ofAdd 3, ofAdd 4⟩ := by
  sorry

/-- Negation in the native isometry group negates only the vector coordinate (0.8). -/
example :
    let e : TauCeti.BilinForm.isometryGroup (0 : BilinForm ℤ ℤ) :=
      ⟨LinearEquiv.neg ℤ, by intro x y; simp⟩
    extensionIsometryAction 0 e ⟨ofAdd 3, ofAdd 4⟩ = ⟨ofAdd 3, ofAdd (-4)⟩ := by
  sorry

/-- Every isometry fixes the entire coefficient subgroup (0.8). -/
example (B : BilinForm R W) (e : TauCeti.BilinForm.isometryGroup B) (t : R) :
    extensionIsometryAction B e ((bilinearFactorSet B).inl (ofAdd t)) =
      (bilinearFactorSet B).inl (ofAdd t) := by
  sorry

/-- The product `f * e` in the isometry group applies `e` first: on the zero form on `ℚ²`, with
`e = diag(2, 1)` and `f` the coordinate swap, `(1, 1)` goes to `(1, 2)`, whereas `e * f` sends it
to `(2, 1)`. -/
example (e f : TauCeti.BilinForm.isometryGroup (0 : BilinForm ℚ (Fin 2 → ℚ)))
    (he : ∀ v, (e : (Fin 2 → ℚ) ≃ₗ[ℚ] (Fin 2 → ℚ)) v = ![2 * v 0, v 1])
    (hf : ∀ v, (f : (Fin 2 → ℚ) ≃ₗ[ℚ] (Fin 2 → ℚ)) v = ![v 1, v 0]) :
    (extensionIsometryAction 0 (f * e) ⟨1, ofAdd ![1, 1]⟩).right = ofAdd ![1, 2] ∧
      (extensionIsometryAction 0 (e * f) ⟨1, ofAdd ![1, 1]⟩).right = ofAdd ![2, 1] := by
  sorry

/-- The character `(t, w) ↦ χ(t)` of the extension (0.12). It is multiplicative because `χ`
kills the values of `B`; without that hypothesis the coefficient of a product carries `B(w, v)`. -/
def centralCharacter {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (χ : Multiplicative C →* A) (hχ : ∀ x y : W, χ (ofAdd (B x y)) = 1) :
    (bilinearFactorSet B).Extension →* A where
  toFun p := χ p.left
  map_one' := by simp
  map_mul' p q := by
    simp only [TauCeti.FactorSet.Extension.mul_left, TauCeti.trivialMulDistribMulAction_smul,
      bilinearFactorSet_apply, map_mul, hχ, mul_one]

/-- **Uniqueness of the section-trivial extension** (0.11–0.12): a homomorphism agreeing with
`χ` on the coefficient group and trivial on the canonical section is `centralCharacter`. -/
theorem centralCharacter_unique {A : Type*} [Group A] (B : LinearMap.BilinMap R W C)
    (χ : Multiplicative C →* A) (hχ : ∀ x y : W, χ (ofAdd (B x y)) = 1)
    (ρ : (bilinearFactorSet B).Extension →* A)
    (hc : ∀ t : C, ρ ((bilinearFactorSet B).inl (ofAdd t)) = χ (ofAdd t))
    (hs : ∀ x : W, ρ ⟨1, ofAdd x⟩ = 1) :
    ρ = centralCharacter B χ hχ := by
  sorry

/-- On the zero cocycle, the identity character reads the coefficient coordinate (0.12). -/
example : centralCharacter (0 : BilinForm ℤ ℤ) (MonoidHom.id (Multiplicative ℤ))
    (by intros; rfl) ⟨ofAdd 3, ofAdd 4⟩ = ofAdd 3 := by
  sorry

/-- The trivial character extends trivially for every bilinear cocycle (0.12). -/
example (B : LinearMap.BilinMap R W C) (p : (bilinearFactorSet B).Extension) :
    centralCharacter B (1 : Multiplicative C →* ℂˣ) (by intros; rfl) p = 1 := by
  sorry

/-- Parity kills the nonzero cocycle `2xy` and evaluates to `−1` at `(3,4)` (0.12). -/
example :
    let B : BilinForm ℤ ℤ := 2 • LinearMap.mul ℤ ℤ
    let χ : Multiplicative ℤ →* ℂˣ :=
      { toFun := fun n => (-1) ^ n.toAdd
        map_one' := by simp
        map_mul' := by intro a b; simp only [toAdd_mul, zpow_add] }
    ∃ hχ : ∀ x y : ℤ, χ (ofAdd (B x y)) = 1,
      centralCharacter B χ hχ ⟨ofAdd 3, ofAdd 4⟩ = -1 := by
  sorry

/-- The criterion is necessary: for the identity character of `ℤ` and the upper-triangular form,
`(1, e₀)(1, e₁)` has coefficient `1`, so `(t, w) ↦ t` is not multiplicative. -/
example :
    let B := Matrix.toBilin' (!![0, 1; 0, 0] : Matrix (Fin 2) (Fin 2) ℤ)
    let p : (bilinearFactorSet B).Extension := ⟨1, ofAdd ![1, 0]⟩
    let q : (bilinearFactorSet B).Extension := ⟨1, ofAdd ![0, 1]⟩
    (p * q).left ≠ p.left * q.left := by
  sorry

end Heisenberg

namespace Schroedinger

open Multiplicative

variable {F V W : Type*} [Field F] [AddCommGroup V] [Module F V] [AddCommGroup W] [Module F W]

/-- The Schrödinger operator of `(t, x, y)` on functions `V → ℂ` (0.15): for a pairing
`B : V × W → F` and a character `ψ` of `F`, it sends `φ` to
`u ↦ ψ(t + B(u, y) + B(x, y)/2) φ(u + x)`. -/
noncomputable def schroedinger (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F)
    (x : V) (y : W) : (V → ℂ) →ₗ[ℂ] (V → ℂ) where
  toFun φ u := (ψ (ofAdd (t + B u y + (2 : F)⁻¹ * B x y)) : ℂ) * φ (u + x)
  map_add' φ φ' := by
    funext u
    simp [mul_add]
  map_smul' c φ := by
    funext u
    simp only [Pi.smul_apply, smul_eq_mul, RingHom.id_apply]
    ring

/-- **The Schrödinger law** (0.15): with `2 ≠ 0`, the operators compose by the Heisenberg law
`(t, x, y)(s, a, b) = (t + s + (B(x, b) − B(a, y))/2, x + a, y + b)`. -/
theorem schroedinger_mul (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F)
    (h2 : (2 : F) ≠ 0) (t s : F) (x a : V) (y b : W) :
    (schroedinger ψ B t x y).comp (schroedinger ψ B s a b) =
      schroedinger ψ B (t + s + (2 : F)⁻¹ * (B x b - B a y)) (x + a) (y + b) := by
  sorry

/-- The Schrödinger operators preserve the squared L² integral for a translation-invariant
measure and a unitary character (0.15); the descent to L² classes is 0.17. -/
theorem schroedinger_isUnitary (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F)
    [TopologicalSpace V] [IsTopologicalAddGroup V] [MeasurableSpace V] [BorelSpace V]
    (μ : MeasureTheory.Measure V) [μ.IsAddLeftInvariant]
    (hψ : ∀ s, ‖(ψ (ofAdd s) : ℂ)‖ = 1) (t : F) (x : V) (y : W) (φ : V → ℂ) :
    (∫ u, ‖schroedinger ψ B t x y φ u‖ ^ 2 ∂μ) = ∫ u, ‖φ u‖ ^ 2 ∂μ := by
  sorry

/-- **Haar measure on the Heisenberg group** (0.14): for left-invariant measures `μ` on `F` and
`ν` on `V`, the product measure is invariant under left multiplication by any `p` in the law
`(t, v) ↦ (p₁ + t + B(p₂, v), p₂ + v)`. -/
theorem heisenberg_haar (B : LinearMap.BilinForm F V)
    [TopologicalSpace F] [TopologicalSpace V] [IsTopologicalAddGroup F]
    [IsTopologicalAddGroup V] [MeasurableSpace F] [MeasurableSpace V]
    [BorelSpace F] [BorelSpace V] [SecondCountableTopology F] [SecondCountableTopology V]
    (μ : MeasureTheory.Measure F) (ν : MeasureTheory.Measure V)
    [MeasureTheory.SFinite μ] [MeasureTheory.SFinite ν]
    [μ.IsAddLeftInvariant] [ν.IsAddLeftInvariant]
    (hB : Continuous (fun q : V × V => B q.1 q.2)) (p : F × V) :
    MeasureTheory.Measure.map (fun q : F × V => (p.1 + q.1 + B p.2 q.2, p.2 + q.2)) (μ.prod ν) =
      μ.prod ν := by
  sorry

/-- The center acts by `ψ(t)`. -/
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (t : F) (φ : V → ℂ) :
    schroedinger ψ B t 0 0 φ = (ψ (ofAdd t) : ℂ) • φ := by
  sorry

/-- Translation and modulation commute up to the central phase `ψ(B(x, y))`. -/
example (ψ : Multiplicative F →* ℂˣ) (B : V →ₗ[F] W →ₗ[F] F) (x : V) (y : W)
    (h2 : (2 : F) ≠ 0) :
    (schroedinger ψ B 0 x 0).comp (schroedinger ψ B 0 0 y) =
      (ψ (ofAdd (B x y)) : ℂ) • (schroedinger ψ B 0 0 y).comp (schroedinger ψ B 0 x 0) := by
  sorry

end Schroedinger

/-! ## Layer 3: Dual pairs and local theta modules -/

namespace DualPair

open LinearMap (BilinForm)
open scoped TensorProduct

variable {F V W : Type*} [Field F] [AddCommGroup V] [Module F V] [AddCommGroup W] [Module F W]

/-- **The dual-pair form is symplectic** (3.1): a symmetric `b` and an alternating `ω` give an
alternating `b ⊗ ω`, in every characteristic. -/
theorem tensorSymplecticForm_isAlt (b : BilinForm F V) (ω : BilinForm F W) (hb : b.IsSymm)
    (hω : ω.IsAlt) : (b.tmul ω).IsAlt := by
  sorry

/-- Nondegenerate finite-dimensional factors give a nondegenerate `b ⊗ ω` (3.1). -/
theorem tensorSymplecticForm_nondegenerate [FiniteDimensional F V] [FiniteDimensional F W]
    (b : BilinForm F V) (ω : BilinForm F W) (hb : b.Nondegenerate) (hω : ω.Nondegenerate) :
    (b.tmul ω).Nondegenerate := by
  sorry

/-- On pure tensors `b ⊗ ω` is the product of the two forms. -/
example (b : BilinForm F V) (ω : BilinForm F W) (v v' : V) (w w' : W) :
    (b.tmul ω) (v ⊗ₜ w) (v' ⊗ₜ w') = b v v' * ω w w' := by
  sorry

/-- Two alternating factors do not give an alternating form: for `ω` the standard symplectic
form on `ℚ²`, `ω ⊗ ω` is symmetric and pairs `e₀ ⊗ e₁ − e₁ ⊗ e₀` with itself to `2`. -/
example (ω : BilinForm ℚ (Fin 2 → ℚ))
    (hω : ∀ v w, ω v w = v 0 * w 1 - v 1 * w 0) :
    let x : (Fin 2 → ℚ) ⊗[ℚ] (Fin 2 → ℚ) :=
      Pi.single 0 1 ⊗ₜ Pi.single 1 1 - Pi.single 1 1 ⊗ₜ Pi.single 0 1
    (ω.tmul ω) x x = 2 := by
  sorry

/-- The tensor action of `O(V) × Sp(W)` on `V ⊗ W` (3.1): `(g, h) ↦ g ⊗ h`. -/
def orthogonalSymplecticEmbedding (b : BilinForm F V) (ω : BilinForm F W) :
    TauCeti.BilinForm.isometryGroup b × TauCeti.BilinForm.isometryGroup ω →*
      (V ⊗[F] W ≃ₗ[F] V ⊗[F] W) where
  toFun p := TensorProduct.congr (p.1 : V ≃ₗ[F] V) (p.2 : W ≃ₗ[F] W)
  map_one' := TensorProduct.congr_refl_refl
  map_mul' _ _ := TensorProduct.congr_mul _ _ _ _

/-- The image of the tensor action preserves `b ⊗ ω` (3.1). -/
theorem orthogonalSymplecticEmbedding_isometry (b : BilinForm F V) (ω : BilinForm F W)
    (p : TauCeti.BilinForm.isometryGroup b × TauCeti.BilinForm.isometryGroup ω) :
    orthogonalSymplecticEmbedding b ω p ∈ TauCeti.BilinForm.isometryGroup (b.tmul ω) := by
  sorry

/-- **Kernel of the dual-pair map** (3.1): for nonzero `V` and `W`, `(g, h)` acts trivially on
`V ⊗ W` exactly when `g = a` and `h = a⁻¹` for a scalar `a`. -/
theorem dualPair_kernel [Nontrivial V] [Nontrivial W] (b : BilinForm F V) (ω : BilinForm F W)
    (g : TauCeti.BilinForm.isometryGroup b) (h : TauCeti.BilinForm.isometryGroup ω) :
    orthogonalSymplecticEmbedding b ω (g, h) = 1 ↔
      ∃ a : Fˣ, (∀ v, (g : V ≃ₗ[F] V) v = (a : F) • v) ∧ ∀ w, (h : W ≃ₗ[F] W) w = (a⁻¹ : Fˣ) • w := by
  sorry

/-- `(−1, −1)` lies in the kernel; without nontriviality of the factors the kernel is everything. -/
example (b : BilinForm F V) (ω : BilinForm F W) (g : TauCeti.BilinForm.isometryGroup b)
    (h : TauCeti.BilinForm.isometryGroup ω)
    (hg : ∀ v, (g : V ≃ₗ[F] V) v = -v) (hh : ∀ w, (h : W ≃ₗ[F] W) w = -w) :
    orthogonalSymplecticEmbedding b ω (g, h) = 1 := by
  sorry

open Classical in
/-- The first occurrence of a tower of theta modules (3.10): the least index with a nonzero
member, and `⊤` when every member vanishes. -/
noncomputable def firstOccurrence (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] : WithTop ℕ :=
  if h : ∃ r, ∃ x : Θ r, x ≠ 0 then (Nat.find h : ℕ) else ⊤

/-- The first occurrence is `⊤` exactly when every member of the tower is zero. -/
theorem firstOccurrence_eq_top_iff (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] :
    firstOccurrence Θ = ⊤ ↔ ∀ r (x : Θ r), x = 0 := by
  sorry

/-- A nonzero member at rank zero gives first occurrence zero. -/
example (Θ : ℕ → Type*) [∀ r, Zero (Θ r)] (x : Θ 0) (hx : x ≠ 0) : firstOccurrence Θ = 0 := by
  sorry

/-- The tower of zero modules has first occurrence `⊤` (3.10). -/
example : firstOccurrence (fun _ => Fin 1) = ⊤ := by
  sorry

/-- Equal occurrence ranks can give different dimension indices (3.10). -/
example : firstOccurrence (fun _ => ℤ) = firstOccurrence (fun _ => ℚ) ∧
    (0 : WithTop ℕ) + 2 * firstOccurrence (fun _ => ℤ) ≠
      1 + 2 * firstOccurrence (fun _ => ℚ) := by
  sorry

end DualPair

/-! ## Layer 4: Adelic metaplectic covers and finite Weil representations -/

namespace FiniteWeil

open Real

variable {D : Type*} [AddCommGroup D] [Fintype D] [DecidableEq D]

/-- The diagonal operator `T` of the finite Weil representation in the `ω_L` convention (4.7):
`(Tφ)(μ) = e(−q(μ)) φ(μ)` for a `ℚ/ℤ`-valued quadratic form `q`. -/
noncomputable def finiteWeil_TOperator (q : D → AddCircle (1 : ℝ)) : (D → ℂ) →ₗ[ℂ] (D → ℂ) :=
  Matrix.toLin' (Matrix.diagonal fun μ => ((AddCircle.toCircle (-q μ) : Circle) : ℂ))

/-- The operator `S` (4.7): `(Sφ)(ν) = c/√|D| · Σ_μ e((μ, ν)) φ(μ)` for the discriminant pairing
`(·, ·)` and the Weil phase `c` fixed by `ψ`. -/
noncomputable def finiteWeil_SOperator (pair : D →+ D →+ AddCircle (1 : ℝ)) (c : ℂ) :
    (D → ℂ) →ₗ[ℂ] (D → ℂ) :=
  Matrix.toLin' fun ν μ =>
    c / (Real.sqrt (Fintype.card D) : ℂ) * ((AddCircle.toCircle (pair μ ν) : Circle) : ℂ)

/-- **`S² = c²·[−1]`** (4.7): for a symmetric nondegenerate discriminant pairing,
`(S²φ)(ν) = c² φ(−ν)`. -/
theorem finiteWeil_SOperator_sq (pair : D →+ D →+ AddCircle (1 : ℝ)) (c : ℂ)
    (hsymm : ∀ μ ν, pair μ ν = pair ν μ) (hnd : ∀ ν, (∀ μ, pair μ ν = 0) → ν = 0)
    (φ : D → ℂ) (ν : D) :
    finiteWeil_SOperator pair c (finiteWeil_SOperator pair c φ) ν = c ^ 2 * φ (-ν) := by
  sorry

/-- The singleton zero quadratic module has trivial T action (4.7). -/
example : finiteWeil_TOperator (0 : Unit → AddCircle (1 : ℝ)) = LinearMap.id := by
  sorry

/-- The Fourier phase survives even on the singleton discriminant module (4.7). -/
example (c : ℂ) : finiteWeil_SOperator (0 : Unit →+ Unit →+ AddCircle (1 : ℝ)) c =
    c • LinearMap.id := by
  sorry

/-- The sign of the `ω_L` convention: `q(μ) = 1/4` gives `T e_μ = −i e_μ`. -/
example (q : D → AddCircle (1 : ℝ)) (μ : D) (hq : q μ = ((1 / 4 : ℝ) : AddCircle (1 : ℝ))) :
    finiteWeil_TOperator q (Pi.single μ 1) μ = -Complex.I := by
  sorry

/-- Conjugation reverses the quarter-norm T phase (4.7). -/
example (q : D → AddCircle (1 : ℝ)) (μ : D)
    (hq : q μ = ((1 / 4 : ℝ) : AddCircle (1 : ℝ))) :
    star (finiteWeil_TOperator q (Pi.single μ 1) μ) = Complex.I := by
  sorry

/-- On a singleton with the zero pairing and phase `1`, `S` is the identity. -/
example : finiteWeil_SOperator (0 : Unit →+ Unit →+ AddCircle (1 : ℝ)) 1 = LinearMap.id := by
  sorry

end FiniteWeil

/-! ## Layer 7: Half-integral weight, plus spaces and Shimura lifting -/

namespace HalfWeight

open UpperHalfPlane Complex

/-- `z ↦ (z + ν)/4` on the upper half-plane. -/
noncomputable def shiftFour (ν : Fin 4) (z : ℍ) : ℍ :=
  ⟨((z : ℂ) + (ν : ℕ)) / 4, by
    have := z.im_pos
    simp only [Complex.div_ofNat_im, Complex.add_im, Complex.natCast_im, add_zero]
    positivity⟩

/-- `z ↦ −1/(4z)` on the upper half-plane. -/
noncomputable def invertFour (z : ℍ) : ℍ :=
  ⟨-(4 * (z : ℂ))⁻¹, by
    have h1 : 0 < (4 * (z : ℂ)).im := by
      simpa [Complex.mul_im] using mul_pos (by norm_num : (0 : ℝ) < 4) z.im_pos
    have h2 : 4 * (z : ℂ) ≠ 0 := fun h => by simp [h] at h1
    rw [Complex.neg_im, Complex.inv_im, neg_div, neg_neg]
    exact div_pos h1 (Complex.normSq_pos.mpr h2)⟩

/-- The operators `U` and `W` of the plus space in the unitary normalization (7.10):
`UF(z) = (√2/4) Σ_{ν mod 4} F((z + ν)/4)` and
`WF(z) = e^{iπ/4} (z/|z|)^{−1/2} F(−1/(4z))`. The factor `√2` comes from the weight `y^{1/4}`. -/
noncomputable def plusU (F : ℍ → ℂ) (z : ℍ) : ℂ :=
  (Real.sqrt 2 : ℂ) / 4 * ∑ ν : Fin 4, F (shiftFour ν z)

@[inherit_doc plusU]
noncomputable def plusW (F : ℍ → ℂ) (z : ℍ) : ℂ :=
  Complex.exp (Complex.I * Real.pi / 4) * ((z : ℂ) / (‖(z : ℂ)‖ : ℂ)) ^ (-1 / 2 : ℂ) *
    F (invertFour z)

/-- The plus-space projector `pr⁺ = (2/3) W U + 1/3` (7.10); it is the orthogonal projection onto
the plus space only on the weight-one-half Maass space, a README target. -/
noncomputable def plusProjector (F : ℍ → ℂ) : ℍ → ℂ :=
  (2 / 3 : ℂ) • plusW (plusU F) + (1 / 3 : ℂ) • F

/-- On the constant function `1`, `pr⁺` is not the identity at `i`: the factor `√2` and the
phase of `W` survive. -/
example : plusProjector (fun _ => 1) UpperHalfPlane.I ≠ 1 := by
  sorry

end HalfWeight

/-! ## Layer 8: Genus-two Jacobi and Eisenstein analysis -/

namespace GenusTwo

open Matrix MeasureTheory
open scoped ComplexConjugate

/-! ### Fourier indices (8.1–8.9) -/

local notation "V" => Fin 2 → ℤ
local notation "FData" => QuadraticForm ℤ V × V

/-- The integral shift of a genus-two Fourier index `(T, R)` (8.1), with `a = m/N` and
`c = N^{1−j}` at cusp `j`: `T ↦ T + c(a λλᵀ − Rλᵀ)`, `R ↦ R − 2aλ` in quadratic-form terms. -/
def fourierShift (a c : ℤ) (l : V) (p : FData) : FData :=
  (p.1 + c • (a • QuadraticMap.linMulLin (dotProductBilin ℤ ℤ l) (dotProductBilin ℤ ℤ l) -
      QuadraticMap.linMulLin (dotProductBilin ℤ ℤ p.2) (dotProductBilin ℤ ℤ l)),
    p.2 - (2 * a) • l)

/-- The cusp-zero shift at `a=1,c=8` retains the factor eight (8.1). -/
example : fourierShift 1 8 ![1, 0] (0, 0) =
    (8 • QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2, 0]) := by
  sorry

/-- The cusp-one shift has `c=1` (8.1). -/
example : fourierShift 1 1 ![1, 0] (0, 0) =
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, ![-2, 0]) := by
  sorry

/-- Shifting the mixed index cancels its cross term (8.1). -/
example : fourierShift 1 1 ![0, 1]
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, ![1, 0]) =
      (QuadraticMap.proj (R := ℤ) (1 : Fin 2) 1, ![1, -2]) := by
  sorry

/-- The discriminant form `4aT − c RRᵀ` of a Fourier index (8.2). -/
def fourierDiscriminant (a c : ℤ) (p : FData) : QuadraticForm ℤ V :=
  (4 * a) • p.1 - c • QuadraticMap.linMulLin (dotProductBilin ℤ ℤ p.2) (dotProductBilin ℤ ℤ p.2)

/-- **Discriminant invariance** (8.3). -/
theorem fourierDiscriminant_shift (a c : ℤ) (l : V) (p : FData) :
    fourierDiscriminant a c (fourierShift a c l p) = fourierDiscriminant a c p := by
  sorry

/-- **Classification of Fourier-index orbits** (8.7): for `a ≠ 0`, two indices are related by
an integral shift exactly when they have the same discriminant and congruent vectors modulo
`2a`. -/
theorem exists_fourierShift_iff (a c : ℤ) (ha : a ≠ 0) (p q : FData) :
    (∃ l : V, fourierShift a c l p = q) ↔
      fourierDiscriminant a c p = fourierDiscriminant a c q ∧
        ∀ i, Int.ModEq (2 * a) (p.2 i) (q.2 i) := by
  sorry

/-- **Unique index with a prescribed residue lift** (8.8). -/
theorem existsUnique_fourierRepresentative (a c : ℤ) (ha : a ≠ 0) (p : FData) (ν : V)
    (hν : ∀ i, Int.ModEq (2 * a) (p.2 i) (ν i)) :
    ∃! Q : QuadraticForm ℤ V, fourierDiscriminant a c (Q, ν) = fourierDiscriminant a c p := by
  sorry

/-- The mixed quadratic index with zero vector has discriminant four at `(1,1)` (8.2). -/
example : fourierDiscriminant 1 1
    (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 1, 0) ![1, 1] = 4 := by
  sorry

/-- At `a = 1, c = 8` the vector `R = e₀` gives discriminant `−8` at `e₀`. -/
example : fourierDiscriminant 1 8 (0, ![1, 0]) ![1, 0] = -8 := by
  sorry

/-- The congruence condition is needed: `R = e₀` and `R = −e₀` have the same discriminant at
`a = 2`, but are not shift-related, since `e₀ ≢ −e₀ (mod 4)`. -/
example : fourierDiscriminant 2 1 (0, ![1, 0]) = fourierDiscriminant 2 1 (0, ![-1, 0]) ∧
    ¬ ∃ l : V, fourierShift 2 1 l (0, ![1, 0]) = (0, ![-1, 0]) := by
  sorry

/-- For `a = 0` the classification fails: `x₀²` and `0` have the same (zero) discriminant and the
same vector, but no shift relates them. -/
example : fourierDiscriminant 0 1 (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) =
      fourierDiscriminant 0 1 (0, 0) ∧
    ¬ ∃ l : V, fourierShift 0 1 l (0, 0) = (QuadraticMap.proj (R := ℤ) (0 : Fin 2) 0, 0) := by
  sorry

/-! ### Siegel space, theta series and Gaussian integrals (8.10–8.28) -/

/-- `e(z) = exp(2πiz)`. -/
noncomputable def expTwoPi (z : ℂ) : ℂ := Complex.exp (2 * Real.pi * Complex.I * z)

/-- `Z[w] = wᵀ Z w`. -/
def quad (Z : Matrix (Fin 2) (Fin 2) ℂ) (w : Fin 2 → ℂ) : ℂ := w ⬝ᵥ (Z *ᵥ w)

/-- The Siegel upper half-space of degree two (8.10): symmetric complex `Z` with positive-definite
imaginary part. -/
abbrev SiegelSpace : Type :=
  {Z : Matrix (Fin 2) (Fin 2) ℂ // Zᵀ = Z ∧ (Z.map Complex.im).PosDef}

/-- The strictly positive diagonal matrix `diag(i,2i)` is a Siegel point (8.10). -/
example : ∃ Z : SiegelSpace, Z.1 = !![Complex.I, 0; 0, 2 * Complex.I] := by
  sorry

/-- A real identity matrix has zero imaginary part and is excluded (8.10). -/
example : ¬ ∃ Z : SiegelSpace, Z.1 = 1 := by
  sorry

/-- Positive diagonal imaginary part does not replace symmetry (8.10). -/
example : ¬ ∃ Z : SiegelSpace, Z.1 = !![Complex.I, 1; 0, Complex.I] := by
  sorry

/-- The imaginary part `Y` of a point of the Siegel space. -/
def SiegelSpace.im (Z : SiegelSpace) : Matrix (Fin 2) (Fin 2) ℝ := Z.1.map Complex.im

/-- The base point `iI₂`. -/
noncomputable def SiegelSpace.base : SiegelSpace :=
  ⟨Complex.I • (1 : Matrix (Fin 2) (Fin 2) ℂ), by
    constructor
    · simp
    · have : ((Complex.I • (1 : Matrix (Fin 2) (Fin 2) ℂ)).map Complex.im) = 1 := by
        ext i j
        fin_cases i <;> fin_cases j <;> simp
      rw [this]
      exact Matrix.PosDef.one⟩

/-- The genus-two theta series `θᵃ_ν(Z, W) = Σ_{R ≡ ν mod 2a} e(Z[R]/(4a) + RᵀW)` (8.18). -/
noncomputable def genusTwoTheta (a : ℕ) (ν : Fin 2 → ℤ) (Z : Matrix (Fin 2) (Fin 2) ℂ)
    (W : Fin 2 → ℂ) : ℂ :=
  ∑' R : Fin 2 → ℤ, if ∀ i, Int.ModEq (2 * (a : ℤ)) (R i) (ν i) then
    expTwoPi (quad Z (fun i => (R i : ℂ)) / (4 * a) + (fun i => (R i : ℂ)) ⬝ᵥ W) else 0

/-- Reflection of both the residue and elliptic variables preserves the actual theta series
(8.18). -/
example (a : ℕ) (ha : 0 < a) (ν : Fin 2 → ℤ) (Z : SiegelSpace) (W : Fin 2 → ℂ) :
    genusTwoTheta a (-ν) Z.1 (-W) = genusTwoTheta a ν Z.1 W := by
  sorry

/-- **Quasi-periodicity** (8.18): `θ(Z, W) = e(a(Z[λ] + 2Wᵀλ)) θ(Z, W + Zλ + ρ)` for integral
`λ, ρ`. -/
theorem genusTwoTheta_elliptic (a : ℕ) (ha : 0 < a) (ν l r : Fin 2 → ℤ) (Z : SiegelSpace)
    (W : Fin 2 → ℂ) :
    genusTwoTheta a ν Z.1 W =
      expTwoPi (a * (quad Z.1 (fun i => (l i : ℂ)) + 2 * (W ⬝ᵥ fun i => (l i : ℂ)))) *
        genusTwoTheta a ν Z.1 (W + Z.1 *ᵥ (fun i => (l i : ℂ)) + fun i => (r i : ℂ)) := by
  sorry

/-- **Theta inversion** (8.24): for `a > 0` and `Z` in the Siegel space,
`θᵃ_ν(−Z⁻¹, Z⁻¹W) = e(a Z⁻¹[W]) √(−det Z)/(2a) Σ_{μ mod 2a} e(−νᵀμ/(2a)) θᵃ_μ(Z, W)`, with the
principal root, positive at `Z = iY`. -/
theorem theta_fourier_transform (a : ℕ) (ha : 0 < a) (Z : SiegelSpace) (W : Fin 2 → ℂ)
    (ν : Fin 2 → ℤ) :
    genusTwoTheta a ν (-Z.1⁻¹) (Z.1⁻¹ *ᵥ W) =
      expTwoPi (a * quad Z.1⁻¹ W) * (-Z.1.det) ^ (1 / 2 : ℂ) / (2 * a) *
        ∑ μ : Fin 2 → Fin (2 * a),
          expTwoPi (-(∑ i, (ν i : ℂ) * ((μ i : ℕ) : ℂ)) / (2 * a)) *
            genusTwoTheta a (fun i => ((μ i : ℕ) : ℤ)) Z.1 W := by
  sorry

/-- At the base point, theta inversion identifies the actual series, its finite residue sum,
and one half of `jacobiTheta (i/2)²` (8.24). -/
example :
    genusTwoTheta 1 0 (-(SiegelSpace.base.1)⁻¹) 0 = jacobiTheta (2 * Complex.I) ^ 2 ∧
    genusTwoTheta 1 0 (-(SiegelSpace.base.1)⁻¹) 0 =
      (1 / 2 : ℂ) * (∑ μ : Fin 2 → Fin 2,
        genusTwoTheta 1 (fun i => ((μ i : ℕ) : ℤ)) SiegelSpace.base.1 0) ∧
    (1 / 2 : ℂ) * (∑ μ : Fin 2 → Fin 2,
        genusTwoTheta 1 (fun i => ((μ i : ℕ) : ℤ)) SiegelSpace.base.1 0) =
      (1 / 2 : ℂ) * jacobiTheta (Complex.I / 2) ^ 2 := by
  sorry

/-- The normalized finite Fourier matrix at `a=1` squares to the identity on the four actual
residue vectors, since residue negation is trivial modulo two (8.24). -/
example (ν κ : Fin 2 → Fin 2) :
    (∑ μ : Fin 2 → Fin 2,
      (expTwoPi (-(∑ i, ((ν i : ℕ) : ℂ) * ((μ i : ℕ) : ℂ)) / 2) / 2) *
      (expTwoPi (-(∑ i, ((μ i : ℕ) : ℂ) * ((κ i : ℕ) : ℂ)) / 2) / 2)) =
      if ν = κ then (1 : ℂ) else 0 := by
  sorry

/-- For `W=(1,0)` at the base point the inversion phase is `exp(2π)`, different from one
(8.24). -/
example :
    quad SiegelSpace.base.1⁻¹ ![1, 0] = -Complex.I ∧
    expTwoPi (-Complex.I) = Complex.exp (2 * (Real.pi : ℂ)) ∧
    expTwoPi (-Complex.I) ≠ 1 := by
  sorry

/-- **Gaussian orthogonality** (8.21): with ordinary Lebesgue measure on `ℂ²`, written as
`det Y dλ dρ` in the coordinates `W = Zλ + ρ`, the weighted pairing of `θᵃ_μ` and `θᵃ_ν` is
`√det Y/(4a)` when `μ ≡ ν (mod 2a)` and zero otherwise. -/
theorem theta_pairing (a : ℕ) (ha : 0 < a) (Z : SiegelSpace) (μ ν : Fin 2 → ℤ) :
    (∫ l : Fin 2 → ℝ in Set.pi Set.univ (fun _ => Set.Ico 0 1),
      ∫ r : Fin 2 → ℝ in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        let W := Z.1 *ᵥ (fun i => (l i : ℂ)) + (fun i => (r i : ℂ))
        genusTwoTheta a μ Z.1 W * conj (genusTwoTheta a ν Z.1 W) *
          Complex.exp (-4 * Real.pi * a *
            quad ((Z.im)⁻¹.map (fun x : ℝ => (x : ℂ))) (fun i => ((W i).im : ℂ))) *
          (Z.im.det : ℂ)) =
      if ∀ i, Int.ModEq (2 * (a : ℤ)) (μ i) (ν i) then
        (Real.sqrt Z.im.det : ℂ) / (4 * a) else 0 := by
  sorry

/-- At `a=2,Z=iI₂`, the actual diagonal theta pairing is `1/8` (8.21). -/
example :
    (∫ l : Fin 2 → ℝ in Set.pi Set.univ (fun _ => Set.Ico 0 1),
      ∫ r : Fin 2 → ℝ in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        let Z := SiegelSpace.base
        let W := Z.1 *ᵥ (fun i => (l i : ℂ)) + (fun i => (r i : ℂ))
        genusTwoTheta 2 0 Z.1 W * conj (genusTwoTheta 2 0 Z.1 W) *
          Complex.exp (-4 * Real.pi * 2 *
            quad ((Z.im)⁻¹.map (fun x : ℝ => (x : ℂ))) (fun i => ((W i).im : ℂ))) *
          (Z.im.det : ℂ)) = 1 / 8 := by
  sorry

/-- At `a=1,Z=iI₂`, distinct residues have zero actual theta pairing (8.21). -/
example :
    (∫ l : Fin 2 → ℝ in Set.pi Set.univ (fun _ => Set.Ico 0 1),
      ∫ r : Fin 2 → ℝ in Set.pi Set.univ (fun _ => Set.Ico 0 1),
        let Z := SiegelSpace.base
        let W := Z.1 *ᵥ (fun i => (l i : ℂ)) + (fun i => (r i : ℂ))
        genusTwoTheta 1 0 Z.1 W * conj (genusTwoTheta 1 ![1, 0] Z.1 W) *
          Complex.exp (-4 * Real.pi *
            quad ((Z.im)⁻¹.map (fun x : ℝ => (x : ℂ))) (fun i => ((W i).im : ℂ))) *
          (Z.im.det : ℂ)) = 0 := by
  sorry

/-- **Real Gaussian Fourier integral in `W`** (8.62): for `Z` in the Siegel space and `m > 0`,
`∫_{ℝ²} e(−m Z⁻¹[W] − RᵀW) dW = √(−det Z)/(2m) · e(Z[R]/(4m))`, with the principal square root,
which is the holomorphic branch positive at `Z = iY`. This is the source of the factor `1/(2m)` in
the genus-two unfolding kernel; the theta pairing of 8.21 does not enter it. -/
theorem gaussianFourier_genusTwo (Z : SiegelSpace) (m : ℝ) (hm : 0 < m) (R : Fin 2 → ℝ) :
    ∫ W : Fin 2 → ℝ,
        expTwoPi (-(m : ℂ) * quad Z.1⁻¹ (fun i => (W i : ℂ)) - ∑ i, (R i : ℂ) * W i) =
      (-Z.1.det) ^ (1 / 2 : ℂ) / (2 * m) * expTwoPi (quad Z.1 (fun i => (R i : ℂ)) / (4 * m)) := by
  sorry

/-- At `Z = iI₂`, `m = 1`, `R = 0` the Gaussian Fourier integral is `1/2`; a factor `1/m` in
place of `1/(2m)` would give `1`. -/
example : ∫ W : Fin 2 → ℝ,
      expTwoPi (-(1 : ℂ) * quad SiegelSpace.base.1⁻¹ (fun i => (W i : ℂ))) = 1 / 2 := by
  sorry

/-- The same integral at `m = 2` is `1/4`, detecting the index scaling. -/
example : ∫ W : Fin 2 → ℝ,
      expTwoPi (-(2 : ℂ) * quad SiegelSpace.base.1⁻¹ (fun i => (W i : ℂ))) = 1 / 4 := by
  sorry

/-- The diagonal theta norm at `Z = iI₂`, `a = 1` is `1/4`; the printed denominator `2a` would
give `1/2`. -/
example : ∫ x : Fin 2 → ℝ, Real.exp (-4 * Real.pi * (x 0 ^ 2 + x 1 ^ 2)) = 1 / 4 := by
  sorry

/-- Residues modulo `2a` label the theta series: `θ¹_{(2,0)} = θ¹_{(0,0)}`. -/
example (Z : Matrix (Fin 2) (Fin 2) ℂ) (W : Fin 2 → ℂ) :
    genusTwoTheta 1 ![2, 0] Z W = genusTwoTheta 1 0 Z W := by
  sorry

end GenusTwo

/-!
The README specifies the further constructions and theorems: the oscillator
normalizer (Layer 1), the Weil index, Leray invariant, Rao cocycle, metaplectic double cover,
genuine Weil representation and generator formulas (Layer 2), the theta modules, Howe duality and
the conservation, see-saw and splitting theorems (Layer 3), the adelic cover, product formula and
global Weil representation (Layer 4), theta kernels, genuine automorphic forms and theta lifts
(Layer 5), the Siegel–Weil, Rallis and Jacobi interfaces (Layer 6), the weight-one-half Maass space,
Kohnen plus space, Poincaré families and Shimura lift (Layer 7), and the genus-two similitude cover,
Jacobi Eisenstein series, Whittaker and Novodvorsky transforms and unfolding identities (Layer 8).

The basic APIs specified in the README include the following additional target names:
bilinearFactorSet_inv bilinearFactorSet_mul_right
centralCharacter_apply centralCharacter_canonicalSection centralCharacter_inl
centralCharacter_multiplicative_iff extensionIsometryAction_apply
extensionIsometryAction_injective extensionIsometryAction_inl extensionIsometry_apply
extensionIsometry_inl extensionIsometry_refl extensionIsometry_trans
firstOccurrence_dimension firstOccurrence_nonzero firstOccurrence_vanishing
fourierDiscriminant_apply fourierDiscriminant_zero fourierDiscriminant_zero_vector
fourierShift_add fourierShift_fst_apply fourierShift_injective fourierShift_modEq
fourierShift_neg fourierShift_snd fourierShift_zero genusTwoTheta_diagonal
genusTwoTheta_residue schroedinger_apply schroedinger_center.
-/

end TauCetiRoadmap.MetaplecticAutomorphicForms
