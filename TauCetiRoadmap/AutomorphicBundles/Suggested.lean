import Mathlib
import TauCeti.Algebra.AlgebraicGroup.Dynamic.Parabolic
import TauCeti.Algebra.AlgebraicGroup.GeneralLinear.Dynamic.GL2.Basic

/-!
# AutomorphicBundles: representative target signatures

This file is not the roadmap: `README.md` is. It records the definitions and theorem signatures of
the roadmap that can be stated against the pinned Mathlib and Tau Ceti, and it is not exhaustive.
Shimura varieties, their canonical principal bundles, automorphic vector bundles, toroidal and
minimal compactifications, canonical extensions, Fourier–Jacobi expansions and coherent
cohomology have no carriers at the pins; the targets about them are specified in `README.md` only.

The design choices made explicit here are:

* **Parabolics.** ShimuraData §3.7 supplies the filtration parabolic `P(μ⁻¹)` and its Hodge sign.
  Its pointwise adapter here uses the inverse of the Hodge cocharacter, and the Hodge–Tate
  parabolic of Boxer–Calegari–Gee–Pilloni is `P(μ)`; both
  are Tau Ceti's `TauCeti.Cocharacter.parabolic`, whose points are those `g` with
  `lim_{t → 0} l(t) g l(t)⁻¹` existing. Their intersection is the common Levi subgroup (Layer B0).
* **Automorphy factors.** A factor is a left cocycle `J(gh, x) = J(g, hx) ∘ J(h, x)` for a left
  action on the base. Since `LinearEquiv.trans` applies its first argument first, the Lean
  cocycle reads `(J h x).trans (J g (h • x))`. The slash operator inverts the factor,
  `(f|g)(x) = J(g, x)⁻¹ (f (g • x))`, and is Mathlib's `SlashAction`, a right action (Layer B4).
* **Hilbert weights.** An arithmetic weight is a family `k_τ` and an integer `w` with
  `k_τ ≡ w (mod 2)`; the determinant exponent `m_τ = (w − k_τ)/2` may be negative (Layer B4).
* **Siegel Hodge–Tate data.** For a dominant `GSp₄` weight `(k₁, k₂; w)` the four coherent weights
  and the doubled Tate exponents of the classical Hodge–Tate decomposition are recorded as integer
  data; the decomposition itself is a README target (Layer B5).

The README names every target; this file states the ones whose carriers exist at the pins.
-/

open scoped MatrixGroups ModularForm

noncomputable section

namespace TauCetiRoadmap.AutomorphicBundles

/-! ## Layer B0: coefficients, associated bundles and descent -/

section Parabolic

variable {R H : Type*} [CommRing R] [CommRing H] [HopfAlgebra R H]

/-- The inverse `t ↦ l(t⁻¹)` of a cocharacter `l : 𝔾ₘ → Spec H`, written on coordinate rings: the
cocharacter followed by the inversion `T ↦ T⁻¹` of `𝔾ₘ`. Belongs to Layer B0
(*Hodge and opposite parabolic conventions*). -/
def inverseCocharacter (l : H →ₐc[R] LaurentPolynomial R) : H →ₐc[R] LaurentPolynomial R :=
  (AddMonoidAlgebra.mapDomainBialgHom R (-AddMonoidHom.id ℤ)).comp l

/-- Inverting a cocharacter twice gives it back. -/
theorem inverseCocharacter_inverseCocharacter (l : H →ₐc[R] LaurentPolynomial R) :
    inverseCocharacter (inverseCocharacter l) = l := by
  sorry

variable (A : Type*) [CommRing A] [Algebra R A]

/-- The `A`-point adapter `P(μ⁻¹)`. For a Hodge cocharacter acting on `H^{p,q}` by `z^{−p}`,
ShimuraData §3.7 identifies this with its supplied `filtrationParabolic`, the stabilizer of
`F^a = ⊕_{p ≥ a} H^{p,q}`. The definition also applies to arbitrary Hopf-algebra cocharacters. -/
def hodgeParabolic (μ : H →ₐc[R] LaurentPolynomial R) : Subgroup (WithConv (H →ₐ[R] A)) :=
  TauCeti.Cocharacter.parabolic A (inverseCocharacter μ)

/-- The Hodge–Tate parabolic `P_HT = P(μ)` of Boxer–Calegari–Gee–Pilloni, opposite to
`hodgeParabolic` ([BCGP], §3.2.13–3.2.16 and §4.8). -/
def hodgeTateParabolic (μ : H →ₐc[R] LaurentPolynomial R) : Subgroup (WithConv (H →ₐ[R] A)) :=
  TauCeti.Cocharacter.parabolic A μ

/-- A cocharacter and its inverse centralize the same points. -/
theorem levi_inverseCocharacter (μ : H →ₐc[R] LaurentPolynomial R) :
    TauCeti.Cocharacter.levi A (inverseCocharacter μ) = TauCeti.Cocharacter.levi A μ := by
  sorry

/-- **The two parabolics are opposite**: their intersection is the common Levi subgroup
`Z_G(μ)`. A point in both has a conjugation orbit extending over `0` and over `∞`, hence
constant ([ConradLuminy], Theorem 4.1.7 and its proof, pp.112–113). -/
theorem hodgeParabolic_inf_hodgeTateParabolic (μ : H →ₐc[R] LaurentPolynomial R) :
    hodgeParabolic A μ ⊓ hodgeTateParabolic A μ = TauCeti.Cocharacter.levi A μ := by
  sorry

-- Test `hodgeParabolic_test_levi`: the Levi `Z_G(μ)` lies in the Hodge parabolic.
example (μ : H →ₐc[R] LaurentPolynomial R) :
    TauCeti.Cocharacter.levi A μ ≤ hodgeParabolic A μ := by
  rw [hodgeParabolic, ← levi_inverseCocharacter A μ]
  exact TauCeti.Cocharacter.levi_le_parabolic

-- Test `hodgeTateParabolic_test_levi`: the same Levi lies in the Hodge–Tate parabolic.
example (μ : H →ₐc[R] LaurentPolynomial R) :
    TauCeti.Cocharacter.levi A μ ≤ hodgeTateParabolic A μ :=
  TauCeti.Cocharacter.levi_le_parabolic

-- Test `hodgeParabolic_test_gl2`: the two nonidentity root shears distinguish the
-- Hodge parabolic P(μ⁻¹) from P(μ) for μ(t)=diag(t,1), on actual Hopf-coordinate points.
example :
    let μ := TauCeti.GeneralLinear.Dynamic.GL2.dynamicCocharacter (R := ℚ)
    let upper := (TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) (A := ℚ) 2).symm
      (TauCeti.transvectionUnit (by decide : (0 : Fin 2) ≠ 1) (1 : ℚ))
    let lower := (TauCeti.GeneralLinear.pointsMulEquiv (R := ℚ) (A := ℚ) 2).symm
      (TauCeti.transvectionUnit (by decide : (1 : Fin 2) ≠ 0) (1 : ℚ))
    lower ∈ hodgeParabolic ℚ μ ∧ lower ∉ hodgeTateParabolic ℚ μ ∧
      upper ∈ hodgeTateParabolic ℚ μ ∧ upper ∉ hodgeParabolic ℚ μ := by
  sorry

end Parabolic

/-! ## Layer B4: classical forms and explicit weights -/

section SectionMaps

open CategoryTheory

-- Test `classicalForms_test_map_id`: the identity coefficient map fixes every section.
example {X : AlgebraicGeometry.Scheme} (V : X.Modules) (s : SheafOfModules.sections V) :
    SheafOfModules.sectionsMap (𝟙 V : V ⟶ V) s = s := by
  sorry

-- Test `classicalForms_test_map_comp`: section maps compose in coefficient-map order.
example {X : AlgebraicGeometry.Scheme} {V W U : X.Modules} (u : V ⟶ W) (v : W ⟶ U)
    (s : SheafOfModules.sections V) :
    SheafOfModules.sectionsMap (u ≫ v : V ⟶ U) s =
      SheafOfModules.sectionsMap v (SheafOfModules.sectionsMap u s) := by
  sorry

-- Test `classicalForms_test_map_zero`: a section zero on every open maps to a zero section.
example {X : AlgebraicGeometry.Scheme} {V W : X.Modules} (u : V ⟶ W)
    (s : SheafOfModules.sections V) (hs : ∀ U, s.val U = 0) :
    ∀ U, (SheafOfModules.sectionsMap u s).val U = 0 := by
  sorry

end SectionMaps

section AutomorphyFactor

variable {β G X R V : Type*} [Monoid G] [MulAction G X] [Semiring R] [AddCommMonoid V]
  [Module R V]

/-- A normalized functional automorphy factor: for each weight `k`, a family of linear
automorphisms `J k g x` of the coefficient `V` with `J(1, x) = id` and the shifted left cocycle
`J(gh, x) = J(g, hx) ∘ J(h, x)`. The holomorphy in `x` and the boundary conditions of Layer B4
(*The normalized automorphy factor*) are conditions on the analytic carrier and are not part of
this structure. -/
structure AutomorphyFactor (β G X R V : Type*) [Monoid G] [MulAction G X] [Semiring R]
    [AddCommMonoid V] [Module R V] where
  /-- The coefficient automorphism `J(k, g, x)`. -/
  coefficient : β → G → X → (V ≃ₗ[R] V)
  /-- `J(k, 1, x) = id`. -/
  normalized : ∀ k x, coefficient k 1 x = LinearEquiv.refl R V
  /-- `J(k, gh, x) = J(k, g, hx) ∘ J(k, h, x)`. -/
  cocycle : ∀ k g h x,
    coefficient k (g * h) x = (coefficient k h x).trans (coefficient k g (h • x))

namespace AutomorphyFactor

/-- The normalized factor with every coefficient equal to the identity. -/
def trivial : AutomorphyFactor β G X R V where
  coefficient _ _ _ := LinearEquiv.refl R V
  normalized _ _ := rfl
  cocycle _ _ _ _ := rfl

-- Test `AutomorphyFactor_test_unit`: identity coefficients satisfy both factor laws.
example (k : β) (g h : G) (x : X) :
    (trivial : AutomorphyFactor β G X R V).coefficient k 1 x = LinearEquiv.refl R V ∧
    (trivial : AutomorphyFactor β G X R V).coefficient k (g * h) x =
      ((trivial : AutomorphyFactor β G X R V).coefficient k h x).trans
        ((trivial : AutomorphyFactor β G X R V).coefficient k g (h • x)) := by
  constructor <;> rfl

/-- Change of frame by `u : X → GL(V)`: `J′(g, x) = u(gx) ∘ J(g, x) ∘ u(x)⁻¹`. -/
def changeFrame (J : AutomorphyFactor β G X R V) (u : X → (V ≃ₗ[R] V)) :
    AutomorphyFactor β G X R V where
  coefficient k g x := ((u x).symm.trans (J.coefficient k g x)).trans (u (g • x))
  normalized k x := by
    ext v
    simp [J.normalized]
  cocycle k g h x := by
    ext v
    simp [J.cocycle, mul_smul]

/-- Two factors with the same coefficient maps are equal. -/
theorem ext {J K : AutomorphyFactor β G X R V}
    (h : ∀ k g x, J.coefficient k g x = K.coefficient k g x) : J = K := by
  sorry

/-- Changing frame by the identity does nothing. -/
theorem changeFrame_id (J : AutomorphyFactor β G X R V) :
    J.changeFrame (fun _ ↦ LinearEquiv.refl R V) = J := by
  sorry

/-- Changing frame by `u` and then by `v` is changing frame by `x ↦ v(x) ∘ u(x)`. -/
theorem changeFrame_comp (J : AutomorphyFactor β G X R V) (u v : X → (V ≃ₗ[R] V)) :
    (J.changeFrame u).changeFrame v = J.changeFrame (fun x ↦ (u x).trans (v x)) := by
  sorry

-- Test `AutomorphyFactor_test_frame`: a gauge of the identity has the shifted cocycle.
example (u : X → (V ≃ₗ[R] V)) (k : β) (g h : G) (x : X) :
    let J := (trivial : AutomorphyFactor β G X R V).changeFrame u
    J.coefficient k (g * h) x = (J.coefficient k h x).trans (J.coefficient k g (h • x)) := by
  sorry

end AutomorphyFactor

/-- **The slash adapter.** A normalized family of linear automorphisms satisfying the shifted
left cocycle defines Mathlib's `SlashAction` on `X → V` by `(f|_k g)(x) = J(k, g, x)⁻¹ f(g • x)`.
No finiteness, topology or field hypothesis is needed. -/
@[instance_reducible]
def slashActionOfAutomorphyFactor (J : β → G → X → (V ≃ₗ[R] V))
    (hone : ∀ k x, J k 1 x = LinearEquiv.refl R V)
    (hmul : ∀ k g h x, J k (g * h) x = (J k h x).trans (J k g (h • x))) :
    SlashAction β G (X → V) where
  map k g f x := (J k g x).symm (f (g • x))
  zero_slash k g := by funext x; simp
  slash_one k f := by funext x; simp [hone]
  slash_mul k g h f := by funext x; simp [hmul, mul_smul]
  add_slash k g f f' := by funext x; simp

variable (J : β → G → X → (V ≃ₗ[R] V)) (hone : ∀ k x, J k 1 x = LinearEquiv.refl R V)
  (hmul : ∀ k g h x, J k (g * h) x = (J k h x).trans (J k g (h • x)))

/-- Evaluation of the slash adapter. -/
theorem slashActionOfAutomorphyFactor_map_apply (k : β) (g : G) (f : X → V) (x : X) :
    (slashActionOfAutomorphyFactor J hone hmul).map k g f x = (J k g x).symm (f (g • x)) := by
  sorry

/-- Invariance under every `g` is the transformation law `f(gx) = J(k, g, x) f(x)`; no section
value is cancelled, so no nonvanishing hypothesis is needed. -/
theorem slashActionOfAutomorphyFactor_invariant_iff (k : β) (f : X → V) :
    (∀ g, (slashActionOfAutomorphyFactor J hone hmul).map k g f = f) ↔
      ∀ g x, f (g • x) = J k g x (f x) := by
  sorry

/-- The slash operator is `R`-linear on functions. -/
theorem slashActionOfAutomorphyFactor_map_smul (k : β) (g : G) (r : R) (f : X → V) :
    (slashActionOfAutomorphyFactor J hone hmul).map k g (r • f) =
      r • (slashActionOfAutomorphyFactor J hone hmul).map k g f := by
  sorry

/-- The operator depends only on the coefficient maps. -/
theorem slashActionOfAutomorphyFactor_congr (K : β → G → X → (V ≃ₗ[R] V))
    (kone : ∀ k x, K k 1 x = LinearEquiv.refl R V)
    (kmul : ∀ k g h x, K k (g * h) x = (K k h x).trans (K k g (h • x)))
    (hJK : ∀ k g x, J k g x = K k g x) :
    slashActionOfAutomorphyFactor J hone hmul = slashActionOfAutomorphyFactor K kone kmul := by
  sorry

/-- For the trivial factor the operator is precomposition with the left action. -/
theorem slashActionOfAutomorphyFactor_map_of_trivial (hJ : ∀ k g x, J k g x = LinearEquiv.refl R V)
    (k : β) (g : G) (f : X → V) :
    (slashActionOfAutomorphyFactor J hone hmul).map k g f = fun x ↦ f (g • x) := by
  sorry

-- Test `slashActionOfAutomorphyFactor_test_trivial`: the identity factor gives precomposition.
example (k : β) (g : G) (f : X → V) :
    (slashActionOfAutomorphyFactor
      (AutomorphyFactor.trivial : AutomorphyFactor β G X R V).coefficient
      AutomorphyFactor.trivial.normalized AutomorphyFactor.trivial.cocycle).map k g f =
        fun x ↦ f (g • x) := by
  rfl

-- Test `slashActionOfAutomorphyFactor_test_zero`: no nonvanishing hypothesis is needed.
example (k : β) (g : G) :
    (slashActionOfAutomorphyFactor J hone hmul).map k g (0 : X → V) = 0 := by
  ext x
  exact (J k g x).symm.map_zero

-- Test `slashActionOfAutomorphyFactor_test_frame`: the inverse gauge has the stated order.
example (u : X → (V ≃ₗ[R] V)) (k : β) (g : G) (f : X → V) (x : X) :
    let K := (AutomorphyFactor.trivial : AutomorphyFactor β G X R V).changeFrame u
    (slashActionOfAutomorphyFactor K.coefficient K.normalized K.cocycle).map k g f x =
      u x ((u (g • x)).symm (f (g • x))) := by
  sorry

-- B4.5: evaluation allows arbitrary sections, identity elements, and prescribed scalar factors.
example (k : β) (g : G) (f : X → V) (x : X) :
    (slashActionOfAutomorphyFactor J hone hmul).map k g f x =
      (J k g x).symm (f (g • x)) := rfl

example (k : β) (f : X → V) (x : X) :
    (slashActionOfAutomorphyFactor J hone hmul).map k 1 f x = f x := by
  simp

example {G X : Type*} [Monoid G] [MulAction G X]
    (K : AutomorphyFactor Unit G X ℚ ℚ) (g : G) (x : X) (f : X → ℚ)
    (hK : K.coefficient () g x = LinearEquiv.smulOfNeZero ℚ ℚ 2 (by norm_num)) :
    (slashActionOfAutomorphyFactor K.coefficient K.normalized K.cocycle).map () g f x =
      (1 / 2 : ℚ) * f (g • x) := by
  sorry

-- B4.6: the zero function satisfies both descriptions of invariance.
example (k : β) :
    (∀ g, (slashActionOfAutomorphyFactor J hone hmul).map k g (0 : X → V) = 0) ∧
      (∀ g x, (0 : X → V) (g • x) = J k g x ((0 : X → V) x)) := by
  sorry

example (k : β) (f : X → V) (hX : ∀ (g : G) (x : X), g • x = x) :
    let K := (AutomorphyFactor.trivial : AutomorphyFactor β G X R V)
    (∀ g, (slashActionOfAutomorphyFactor K.coefficient K.normalized K.cocycle).map k g f = f) ∧
      (∀ g x, f (g • x) = K.coefficient k g x (f x)) := by
  sorry

-- The nonidentity of C₂ acts by −1 on a rational fibre over a point.
example :
    let K : AutomorphyFactor Unit (Multiplicative (ZMod 2)) Unit ℚ ℚ :=
      { coefficient := fun _ g _ ↦ LinearEquiv.smulOfNeZero ℚ ℚ
          (if g = 1 then 1 else -1) (by split_ifs <;> norm_num)
        normalized := by
          intro k x
          ext v
          simp
        cocycle := by sorry }
    ∀ f : Unit → ℚ,
      ((∀ g, (slashActionOfAutomorphyFactor K.coefficient K.normalized K.cocycle).map () g f = f)
        ↔ f () = 0) ∧
      ((∀ g x, f (g • x) = K.coefficient () g x (f x)) ↔ f () = 0) := by
  sorry

end AutomorphyFactor

/-- **The inverse-base right cocycle.** For the right action `x · g = g⁻¹ • x` the factor
`J_right(x, g) = J(g⁻¹, x)` satisfies `J((gh)⁻¹, x) = J(h⁻¹, g⁻¹x) J(g⁻¹, x)`. This changes the
action on the base; it is not the right slash action on functions. -/
theorem inverse_base_action_cocycle {G K X : Type*} [Group G] [Group K] [MulAction G X]
    (J : G → X → K) (hmul : ∀ g h x, J (g * h) x = J g (h • x) * J h x) (g h : G) (x : X) :
    J (g * h)⁻¹ x = J h⁻¹ (g⁻¹ • x) * J g⁻¹ x := by
  sorry

/-- **A section detects a scalar cocycle where it does not vanish.** If `f(gx) = J(g, x) f(x)`
for all `g, x`, the cocycle identity holds at every `x` with `f x ≠ 0`. -/
theorem cocycle_at_of_automorphy_of_ne_zero {G X K : Type*} [Monoid G] [MulAction G X] [Field K]
    (J : G → X → K) (f : X → K) (hf : ∀ g x, f (g • x) = J g x * f x) (g h : G) (x : X)
    (hx : f x ≠ 0) : J (g * h) x = J g (h • x) * J h x := by
  sorry

/-- The scalar coefficient `z ↦ denom(g, z)^k` of `SL₂(ℤ)` acting on the upper half-plane, as
a linear automorphism of `ℂ`. Used only to compare the slash adapter with Mathlib. -/
def sl2ScalarFactor (k : ℤ) (g : SL(2, ℤ)) (z : UpperHalfPlane) : ℂ ≃ₗ[ℂ] ℂ :=
  LinearEquiv.smulOfNeZero ℂ ℂ (UpperHalfPlane.denom g z ^ k)
    (zpow_ne_zero k (UpperHalfPlane.denom_ne_zero g z))

-- Test `slashActionOfAutomorphyFactor_test_sl2`: with the factor `denom(g, z)^k` the adapter is
-- Mathlib's weight-`k` slash action of `SL₂(ℤ)`.
example (k : ℤ) (g : SL(2, ℤ)) (f : UpperHalfPlane → ℂ) (z : UpperHalfPlane)
    (hone : ∀ k z, sl2ScalarFactor k 1 z = LinearEquiv.refl ℂ ℂ)
    (hmul : ∀ k g h z, sl2ScalarFactor k (g * h) z =
      (sl2ScalarFactor k h z).trans (sl2ScalarFactor k g (h • z))) :
    (slashActionOfAutomorphyFactor sl2ScalarFactor hone hmul).map k g f z = (f ∣[k] g) z := by
  rw [slashActionOfAutomorphyFactor_map_apply, ModularForm.SL_slash_apply]
  simp [sl2ScalarFactor, Units.smul_def, zpow_neg, mul_comm]

-- Test `slashActionOfAutomorphyFactor_test_semilinear`: the determinant-negative part of
-- `GL₂(ℝ)` acts semilinearly on scalars, so no `ℂ`-linear factor reproduces it.
example (k : ℤ) (g : GL (Fin 2) ℝ) (f : UpperHalfPlane → ℂ) (c : ℂ) :
    (c • f) ∣[k] g = UpperHalfPlane.σ g c • (f ∣[k] g) :=
  ModularForm.smul_slash k g f c

-- Test `AutomorphyFactor_test_scalar_shift`: `S²` has denominator `−1`, whereas the
-- unshifted product at `2i` is `−4`.
example : let z : UpperHalfPlane := ⟨2 * Complex.I, by norm_num⟩
    UpperHalfPlane.denom (ModularGroup.S * ModularGroup.S : SL(2, ℤ)) z = -1 ∧
      UpperHalfPlane.denom ModularGroup.S z * UpperHalfPlane.denom ModularGroup.S z = -4 := by
  let z : UpperHalfPlane := ⟨2 * Complex.I, by norm_num⟩
  change UpperHalfPlane.denom (ModularGroup.S * ModularGroup.S : SL(2, ℤ)) z = -1 ∧
    UpperHalfPlane.denom ModularGroup.S z * UpperHalfPlane.denom ModularGroup.S z = -4
  rw [ModularGroup.denom_apply (ModularGroup.S * ModularGroup.S) z, ModularGroup.denom_S z]
  constructor
  · change ((↑(((ModularGroup.S : Matrix (Fin 2) (Fin 2) ℤ) * ModularGroup.S) 1 0) : ℂ) *
      (z : ℂ) + ↑(((ModularGroup.S : Matrix (Fin 2) (Fin 2) ℤ) * ModularGroup.S) 1 1)) = -1
    rw [ModularGroup.S_mul_S_eq]
    norm_num
  · change (2 * Complex.I) * (2 * Complex.I) = -4
    rw [mul_mul_mul_comm]
    norm_num [Complex.I_mul_I]

/-- The rational shear `(a, b) ↦ (a + b, b)`. -/
def shearX : (ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ) where
  toFun p := (p.1 + p.2, p.2)
  invFun p := (p.1 - p.2, p.2)
  left_inv p := by simp
  right_inv p := by simp
  map_add' p q := Prod.ext (by simp; ring) (by simp)
  map_smul' c p := Prod.ext (by simp; ring) (by simp)

/-- The rational shear `(a, b) ↦ (a, a + b)`. -/
def shearY : (ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ) where
  toFun p := (p.1, p.1 + p.2)
  invFun p := (p.1, p.2 - p.1)
  left_inv p := by simp
  right_inv p := by simp
  map_add' p q := Prod.ext (by simp) (by simp; ring)
  map_smul' c p := Prod.ext (by simp) (by simp; ring)

-- Test `AutomorphyFactor_test_shift`: the shifted and unshifted C₂ products differ.
example :
    let t : Multiplicative (ZMod 2) := Multiplicative.ofAdd 1
    let u : Multiplicative (ZMod 2) → ((ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) :=
      fun x ↦ if x = 1 then LinearEquiv.refl ℚ (ℚ × ℚ) else shearX
    let J := (AutomorphyFactor.trivial : AutomorphyFactor Unit (Multiplicative (ZMod 2))
      (Multiplicative (ZMod 2)) ℚ (ℚ × ℚ)).changeFrame u
    J.coefficient () (t * t) 1 (0, 1) = (0, 1) ∧
      ((J.coefficient () t 1).trans (J.coefficient () t 1)) (0, 1) = (2, 1) := by
  sorry

-- B4.7: noncommuting coefficients give the reversed inverse product.
example :
    let J : ((ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) → (ℚ × ℚ) → ((ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) :=
      fun g _ ↦ g
    J (shearX * shearY)⁻¹ (0, 0) = J shearY⁻¹ (shearX⁻¹ (0, 0)) * J shearX⁻¹ (0, 0) ∧
      J (shearX * shearY)⁻¹ (0, 0) ≠ J shearX⁻¹ (0, 0) * J shearY⁻¹ (shearX⁻¹ (0, 0)) := by
  sorry

example {G K X : Type*} [Group G] [Group K] [MulAction G X]
    (J : G → X → K) (hone : ∀ x, J 1 x = 1) (x : X) :
    (1 : G)⁻¹ • x = x ∧ J (1 : G)⁻¹ x = 1 := by
  simp [hone]

-- The character id on ℚˣ has value 2 of infinite order, detecting an omitted inverse.
example :
    let χ : ℚˣ →* ℚˣ := MonoidHom.id ℚˣ
    let g : ℚˣ := Units.mk0 2 (by norm_num)
    χ g⁻¹ = (χ g)⁻¹ ∧ χ g⁻¹ ≠ χ g := by
  sorry

-- B4.8: at a nonzero constant section the trivial base action forces the unit factor.
example {G : Type*} [Monoid G] (J : G → Unit → ℚ)
    (hf : ∀ g x, (1 : ℚ) = J g x * 1) :
    (∀ g x, J g x = 1) ∧ ∀ g h x, J (g * h) x = J g x * J h x := by
  sorry

-- On the free two-point orbit, every nowhere-zero function gives a shifted scalar cocycle.
example (f : Multiplicative (ZMod 2) → ℚ) (hf : ∀ x, f x ≠ 0) :
    let J := fun g x ↦ f (g * x) / f x
    ∀ g h x, J (g * h) x = J g (h * x) * J h x := by
  sorry

/-- The constant factor `J(g, x) = g` of `GL(ℚ²)` acting on `ℚ²` by evaluation. -/
def constantFactor : AutomorphyFactor Unit ((ℚ × ℚ) ≃ₗ[ℚ] (ℚ × ℚ)) (ℚ × ℚ) ℚ (ℚ × ℚ) where
  coefficient _ g _ := g
  normalized _ _ := rfl
  cocycle _ _ _ _ := rfl

-- Test `AutomorphyFactor_test_order`: `J(S_x S_y)(1, 0) = (2, 1)` and `J(S_y S_x)(1, 0) = (1, 1)`;
-- composing coefficients in the reverse order fails this test.
example : constantFactor.coefficient () (shearX * shearY) (0, 0) (1, 0) = (2, 1) ∧
    constantFactor.coefficient () (shearY * shearX) (0, 0) (1, 0) = (1, 1) := by
  constructor
  · simp [constantFactor, shearX, shearY]; norm_num
  · simp [constantFactor, shearX, shearY]

-- Test `slashActionOfAutomorphyFactor_test_noncommuting`: the slash of the constant `(1, 0)` by
-- `S_x S_y` is `(1, −1)` and by `S_y S_x` is `(2, −1)`.
example :
    (slashActionOfAutomorphyFactor constantFactor.coefficient constantFactor.normalized
      constantFactor.cocycle).map () (shearX * shearY) (fun _ ↦ ((1 : ℚ), (0 : ℚ))) (0, 0) =
        (1, -1) ∧
    (slashActionOfAutomorphyFactor constantFactor.coefficient constantFactor.normalized
      constantFactor.cocycle).map () (shearY * shearX) (fun _ ↦ ((1 : ℚ), (0 : ℚ))) (0, 0) =
        (2, -1) := by
  constructor
  · change (shearX * shearY).symm ((1 : ℚ), (0 : ℚ)) = (1, -1)
    simp [LinearEquiv.mul_eq_trans, shearX, shearY]
  · change (shearY * shearX).symm ((1 : ℚ), (0 : ℚ)) = (2, -1)
    simp [LinearEquiv.mul_eq_trans, shearX, shearY]
    norm_num

-- Test `slashActionOfAutomorphyFactor_test_inverse`: the slash of the constant `(0, 1)` by `S_x`
-- is `(−1, 1)`, which an operator that forgets the inverse gets wrong.
example :
    (slashActionOfAutomorphyFactor constantFactor.coefficient constantFactor.normalized
      constantFactor.cocycle).map () shearX (fun _ ↦ ((0 : ℚ), (1 : ℚ))) (0, 0) = (-1, 1) := by
  change shearX.symm ((0 : ℚ), (1 : ℚ)) = (-1, 1)
  simp [shearX]

-- Test `slashActionOfAutomorphyFactor_test_zero_noncocycle`: a zero section transforms under the
-- normalized nonzero factor `1 ↦ 1, t ↦ 2` of `C₂`, which is not a cocycle since `2² ≠ 1`.
example :
    (∀ g : Multiplicative (ZMod 2), (0 : ℚ) = (if g = 1 then 1 else 2) * 0) ∧
    ¬ ∀ g h : Multiplicative (ZMod 2),
    (if g * h = 1 then (1 : ℚ) else 2) = (if g = 1 then 1 else 2) * (if h = 1 then 1 else 2) := by
  constructor
  · intro g; simp
  · intro h
    have := h (Multiplicative.ofAdd 1) (Multiplicative.ofAdd 1)
    have hg : (Multiplicative.ofAdd 1 : Multiplicative (ZMod 2)) * Multiplicative.ofAdd 1 = 1 := by
      decide
    have hne : (Multiplicative.ofAdd 1 : Multiplicative (ZMod 2)) ≠ 1 := by decide
    simp only [hg, hne, ite_true, ite_false] at this
    norm_num at this

/-- An arithmetic Hilbert weight: integers `k_τ` indexed by the real embeddings and a central
weight `w` with `k_τ ≡ w (mod 2)` ([Diamond21], §3.2, p.12; [Milne90], III §8). -/
structure HilbertArithmeticWeight (ι : Type*) where
  /-- The embedding-indexed weights `k_τ`. -/
  k : ι → ℤ
  /-- The central weight `w`. -/
  w : ℤ
  /-- `k_τ ≡ w (mod 2)`. -/
  parity : ∀ i, (w - k i) % 2 = 0

namespace HilbertArithmeticWeight

variable {ι : Type*}

/-- The determinant exponent `m_τ = (w − k_τ)/2`, possibly negative. -/
def detExponent (a : HilbertArithmeticWeight ι) (i : ι) : ℤ := (a.w - a.k i) / 2

/-- `2 m_τ = w − k_τ`. -/
theorem two_mul_detExponent (a : HilbertArithmeticWeight ι) (i : ι) :
    2 * a.detExponent i = a.w - a.k i := by
  sorry

/-- Tensor products of Hilbert coefficients add weights. -/
def add (a b : HilbertArithmeticWeight ι) : HilbertArithmeticWeight ι where
  k i := a.k i + b.k i
  w := a.w + b.w
  parity i := by
    have h := a.parity i
    have h' := b.parity i
    omega

/-- Weights with the same `k` and `w` are equal. -/
theorem ext {a b : HilbertArithmeticWeight ι} (hk : a.k = b.k) (hw : a.w = b.w) : a = b := by
  sorry

-- Test `HilbertArithmeticWeight_test_zero`: `k = 0`, `w = 0` has every `m_τ = 0`.
example (i : ι) :
    (⟨fun _ ↦ 0, 0, fun _ ↦ rfl⟩ : HilbertArithmeticWeight ι).detExponent i = 0 := by
  rfl

-- Test `HilbertArithmeticWeight_test_negative`: `k = 4`, `w = 2` has `m = −1`.
example : (⟨fun _ ↦ 4, 2, fun _ ↦ rfl⟩ : HilbertArithmeticWeight Unit).detExponent () = -1 := by
  rfl

-- Test `HilbertArithmeticWeight_test_parity`: `k = 3`, `w = 2` is not an arithmetic weight.
example : ¬ ∃ a : HilbertArithmeticWeight Unit, a.k () = 3 ∧ a.w = 2 := by
  rintro ⟨a, hk, hw⟩
  have := a.parity ()
  omega

-- Test `HilbertArithmeticWeight_test_add`: two determinant exponents `−1` add to `−2`.
example : let a : HilbertArithmeticWeight Unit := ⟨fun _ ↦ 4, 2, fun _ ↦ rfl⟩
    let b : HilbertArithmeticWeight Unit := ⟨fun _ ↦ 2, 0, fun _ ↦ rfl⟩
    (a.add b).k () = 6 ∧ (a.add b).w = 2 ∧ (a.add b).detExponent () = -2 := by
  decide

-- The zero weight is a right and left identity for every index type.
example (a : HilbertArithmeticWeight ι) :
    let zeroWeight : HilbertArithmeticWeight ι := ⟨fun _ ↦ 0, 0, fun _ ↦ rfl⟩
    a.add zeroWeight = a := by
  apply ext
  · funext i
    exact add_zero _
  · exact add_zero _

example (a : HilbertArithmeticWeight ι) :
    let zeroWeight : HilbertArithmeticWeight ι := ⟨fun _ ↦ 0, 0, fun _ ↦ rfl⟩
    zeroWeight.add a = a := by
  apply ext
  · funext i
    exact zero_add _
  · exact zero_add _

-- Negation preserves parity and gives an additive inverse.
example (a : HilbertArithmeticWeight ι) :
    let zeroWeight : HilbertArithmeticWeight ι := ⟨fun _ ↦ 0, 0, fun _ ↦ rfl⟩
    let negWeight : HilbertArithmeticWeight ι :=
      ⟨fun i ↦ -a.k i, -a.w, fun i ↦ by have h := a.parity i; omega⟩
    a.add negWeight = zeroWeight := by
  apply ext
  · funext i
    exact add_neg_cancel _
  · exact add_neg_cancel _

end HilbertArithmeticWeight

/-! ## Layer B5: Hecke action and Fourier expansions -/

namespace ClassicalHecke

/-- The weight-zero value of the normalized modular Hecke operator at an unramified prime `ℓ`:
the correspondence has degree `ℓ + 1` and the normalization is `ν = det⁻¹`, so
`T_ℓ(1) = ν(diag(1, ℓ)) (ℓ + 1)`. -/
def modularNormalization (ℓ : ℕ) (_hℓ : Nat.Prime ℓ) : ℚ := (ℓ : ℚ)⁻¹ * (ℓ + 1)

-- Test `ClassicalHecke.modularNormalization`: `T_ℓ(1) = (ℓ + 1)/ℓ`, not `ℓ + 1` and not `1`.
example : modularNormalization 2 (by decide) = 3 / 2 := by
  norm_num [modularNormalization]

example : modularNormalization 3 (by decide) = 4 / 3 := by
  norm_num [modularNormalization]

example : modularNormalization 5 (by decide) = 6 / 5 := by
  norm_num [modularNormalization]

end ClassicalHecke

namespace SiegelHT

/-- The four coherent weights `λ_j` of the classical Hodge–Tate decomposition for the dominant
`GSp₄` weight `κ = (k₁, k₂; w)`, in the untwisted coherent convention ([BCGP], §4.8, p.101):
`(k₁, k₂; −w)`, `(2 − k₁, k₂; −w)`, `(3 − k₂, k₁ + 1; −w)`, `(3 − k₂, 3 − k₁; −w)`. -/
def coherentWeights (k₁ k₂ w : ℤ) : Fin 4 → ℤ × ℤ × ℤ :=
  ![(k₁, k₂, -w), (2 - k₁, k₂, -w), (3 - k₂, k₁ + 1, -w), (3 - k₂, 3 - k₁, -w)]

/-- Twice the Tate exponents `a_j` of the decomposition: the `j`-th summand carries the twist
`(−a_j)` ([BCGP], Theorem 4.8.2, p.101). -/
def twiceTateExponents (k₁ k₂ w : ℤ) : Fin 4 → ℤ :=
  ![k₁ + k₂ + w, 2 - k₁ + k₂ + w, 4 - k₂ + k₁ + w, 6 - k₁ - k₂ + w]

/-- Under the parity condition `k₁ + k₂ + w ≡ 0 (mod 2)` every Tate exponent is an integer. -/
theorem twiceTateExponents_even (k₁ k₂ w : ℤ) (hpar : (k₁ + k₂ + w) % 2 = 0) (j : Fin 4) :
    ∃ a : ℤ, twiceTateExponents k₁ k₂ w j = 2 * a := by
  sorry

-- Test `SiegelHT.weights_zero`: for `κ = 0` the coherent weights are `(0,0;0)`, `(2,0;0)`,
-- `(3,1;0)`, `(3,3;0)` and the Tate exponents are `0, 1, 2, 3`.
example : coherentWeights 0 0 0 = ![(0, 0, 0), (2, 0, 0), (3, 1, 0), (3, 3, 0)] ∧
    twiceTateExponents 0 0 0 = ![0, 2, 4, 6] := by
  constructor <;> decide

-- Test `SiegelHT.weights_nonzero`: the central coordinate is `−w` in every Weyl term.
example : coherentWeights 0 (-2) 2 = ![(0, -2, -2), (2, -2, -2), (5, 1, -2), (5, 3, -2)] ∧
    twiceTateExponents 0 (-2) 2 = ![0, 2, 8, 10] := by
  constructor <;> decide

-- The BCGP identity Weyl element has length zero and gives the degree-three coherent term.
-- Here `2ρ_U = (-3,-3)`, whereas `2ρ_L = (1,-1)` gives the wrong Levi-dual weight.
example : (-(-3 : ℤ), -(-3 : ℤ), (0 : ℤ)) = coherentWeights 0 0 0 3 ∧
    (-(-1 : ℤ), -(1 : ℤ), (0 : ℤ)) ≠ coherentWeights 0 0 0 3 ∧
    coherentWeights 0 0 0 3 ≠ coherentWeights 0 0 0 0 := by
  decide

-- Test `SiegelHT.parity`: `(0, 0; 1)` fails the parity condition, and its first doubled exponent
-- is odd.
example : (0 + 0 + 1 : ℤ) % 2 ≠ 0 ∧ twiceTateExponents 0 0 1 0 = 1 := by
  decide

end SiegelHT

end TauCetiRoadmap.AutomorphicBundles

end

/-!
## Targets specified in `README.md` only

The following targets need carriers that the pins do not have — a Shimura variety with its
canonical model, the canonical principal bundle, automorphic vector bundles, toroidal and minimal
compactifications, canonical extensions, coherent cohomology of algebraic stacks, formal
Fourier–Jacobi charts, pro-Kummer-étale local systems — and are specified in `README.md` only:
B0: `hodgeParabolicConvention`, `centralSplitQuotient`, `ineffectiveFibreDescent`,
`associatedCoefficient`, `compactDualCoefficient`, `homogeneousHodgeTorsor`, `analyticCoefficient`,
`sectionsEquivariant`, `coefficientGaloisDescent`, `geometricAnalyticCoefficients`.

B1: `finiteTensorStabilizer`, `absoluteHodgePropagation`, `hodgeTensorRealizations`,
`tensorFrameTorsor`, `filtrationReduction`, `hodgeCanonicalPrincipalBundle`,
`embeddingIndependence`, `cmPrincipalNormalization`, `abelianCanonicalPrincipalBundle`,
`principalHeckePullback`.

B1.general: `generalComplexStandardPrincipalBundle`, `connectedPrincipalConjugation`,
`adjointJetRealization`, `generalConnectedReduction`,
`generalPrincipalModel`, `generalCompactDualMap`, `generalConjugationCocycle`.

B2: `automorphicVectorBundle`, `automorphicAnalyticComparison`, `leviHighestWeightConvention`,
`bettiCoefficientLocalSystem`, `etaleCoefficientLocalSystem`, `filteredDeRhamCoefficient`,
`realizationComparison`, `coefficientTensorHecke`, `siegelTautologicalSequence`.

B2.general: `generalAssociatedModel`, `generalFlatRealizations`, `generalRealizationConjugation`.

B3: `boundaryCoefficientChart`, `canonicalExtension`, `canonicalExtensionGluing`,
`subcanonicalExtension`, `refinementCanonicalExtension`, `fanIndependentSections`,
`logarithmicConnectionExtension`, `minimalCoherentPushforward`, `canonicalRationalDescent`,
`integralLeviCoefficient`.

B3.general: `generalBoundaryCoefficientComparison`, `generalCanonicalExtension`, `generalLogarithmicComparison`,
`generalBoundaryFunctoriality`.

B3.Hilbert: `ramifiedHilbertOpenSplittingModel`, `ramifiedHilbertCuspData`,
`ramifiedHilbertBoundaryModel`, `ramifiedBoundaryCoefficientLines`,
`ramifiedHilbertFormalDescent`, `ramifiedHilbertCuspDetection`.

B3.log: `horizontalLogSites`, `canonicalKummerCoefficient`, `unipotentLogPeriodComparison`,
`ordinaryLogCohomologyComparison`, `boundaryPeriodKernel`.

B3.BGG: `siegelRelativeBGG`, `siegelDualBGGComplex`, `siegelBGGGradedComparison`.

B3.HT: `smallHasseCanonicalSubgroups`, `siegelAnticanonicalTower`, `siegelBoundaryHebbarkeit`,
`siegelPerfectoidPeriodTower`, `siegelPerfectoidToroidalTower`,
`hodgeTypePerfectoidToroidalTower`, `rationalHTLeviTorsor`, `algebraicVBZero`.

`centralSplitQuotient` uses ShimuraData §4.9's quotient; its comparison with the rank-removal
quotient assumes a CM-split connected centre. The abelian/general principal existence targets
carry Milne II (2.1). `generalComplexStandardPrincipalBundle` supplies algebraic complex torsors,
connections, Hecke maps and compact-dual maps before field-automorphism conjugation.
`horizontalLogSites` uses PrismaticCohomologyPartIV §8.60's log structures and Kummer-étale site
and constructs the additional pro-site and perfectoid basis. `ramifiedHilbertBoundaryModel`
uses complete smooth projective admissible fans with polarization functions for projectivity.
`siegelPerfectoidToroidalTower` and `hodgeTypePerfectoidToroidalTower` use the fans induced from
an initial smooth projective fan or strictly compatible pair; their level transitions are finite flat.

B4: `gl2HodgeLineComparison`, `classicalForms`, `cuspForms`, `analyticClassicalComparison`,
`hilbertCoefficient`, `hilbertCentralDescent`, `unsplitHilbertDescent`, `ramifiedHilbertLine`,
`siegelCoefficient`, `unitaryCoefficient`, `numberFieldFormsBaseChange`, `qcqsSectionsColimit`,
`integralForms`, `classicalVBTateNormalization`.

B5: `ClassicalHecke.operator`, `SiegelHT.decomposition`, `SiegelHT.decomposition_compactSupport`,
`finiteLocallyFreeTrace`, `ScalarFourierJacobi.expansion`, `integralForms_coefficient_leftExact`,
`FJCoefficient.invariantFamily_leftExact`, `FourierJacobi.injective_primeQuotient`,
`FourierJacobi.injective_of_extension`, `FourierJacobi.injective_of_finite`,
`FourierJacobi.expansionPrinciple`, `FourierJacobi.coefficientRecognition`,
`FourierJacobi.cusp_iff_boundaryRestriction`, `ClassicalHecke.convolution`,
`ClassicalHecke.nonNeatDescent`, `FourierJacobi.modular_qExpansion_comparison`,
`VectorFourierJacobi.expansion`, `VectorFourierJacobi.expansionPrinciple`, `HilbertQExpansion.map`,
`HilbertQExpansion.expansionPrinciple`, `HilbertQExpansion.cusp_iff_constantTerms`,
`ClassicalHecke.expansion_compat`, `SiegelHT.classicalVB_equivariance`.

Additional analytic API specified only in the README:
B4.3: `AutomorphyFactor_forget`.
B5.10: `ClassicalHecke.operator_one`, `ClassicalHecke.coefficient_map`.

-/
