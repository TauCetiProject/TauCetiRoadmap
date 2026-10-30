import Mathlib

/-!
# Modular forms of half-integral weight: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
carrier with its linear structure, `q`-expansion and cusp forms, `θ`, the level-`4` dimensions,
Dedekind sums with the closed forms of the `η` transformation, the unary theta series with the
Serre–Stark theorems in their `Γ₁(N)` form, and Kohnen's plus space with its dimension. The other
targets (the diamond operators and the nebentypus spaces `M_{k+1/2}(N, χ)`, multiplication by `θ`,
the Petersson product, `T(p²)`, the Shimura lift, the odd-rank theta series, the character of a
unary theta series, `T⁺(4)` and Kohnen's isomorphism, and Layers 6–7), with their definitions and
Checks, are specified in `README.md` only. Every proof here is `sorry`: these are targets, not
implementations. The exceptions are the linear structure, `cuspSpace`, `thetaForm`'s holomorphy
and `T ∈ Γ₀(4)`, whose proofs are real; `thetaForm`'s cusp bound and `plusSpace`'s closure cite
the named theorems `boundedAtCusps_theta`, `coeff_add` and `coeff_smul`.

The carrier is `HalfIntegralForm k Γ`: a function `ℍ → ℂ`, holomorphic, satisfying the
transformation law of weight `k + 1/2` on a subgroup `Γ ≤ Γ₀(4)` of `SL(2, ℤ)` in the
**multiplied-out form** `f(γz) θ(z)^{2k+1} = θ(γz)^{2k+1} f(z)`, with `θ(z) = jacobiTheta (2z)`,
and bounded at every cusp. Weights are `k + 1/2` with `k : ℕ`; the LMFDB's odd `k` is our
`2k + 1`. The theta multiplier `j(γ, z) = θ(γz)/θ(z)` of GeometryOfNumbersAndQuadraticArithmetic
§4.3 is not declared here: the law is spelled with `θ` on both sides, which is the same condition
because `θ` has no zero on `ℍ`. Holomorphy at the cusps is boundedness of
`|f(Az)| |cz + d|^{−(2k+1)/2}`, branch-free, as in Mathlib's `ModularForm`. A form on `Γ₁(N)` is
the direct sum of its nebentypus components (README 0.4), so a statement about every
`M_{k+1/2}(N, χ)` at once is stated here on `HalfIntegralForm k (Gamma1 N)`, and the level-`4`,
trivial-character space `M_{k+1/2}(Γ₀(4))` is `HalfIntegralForm k (Gamma0 4)`.
-/

namespace TauCetiRoadmap.HalfIntegralWeightModularForms

open Complex Real ModularForm CongruenceSubgroup
open UpperHalfPlane hiding I
open scoped MatrixGroups Manifold

noncomputable section

/-! ## Layer 0: the carrier -/

/-- Shimura's theta function `θ(z) = ∑_{n ∈ ℤ} e(n² z)`, Mathlib's `jacobiTheta` at `2z`
(`README.md`, pinned conventions). Consumed, not redefined. -/
abbrev theta (z : ℍ) : ℂ := jacobiTheta (2 * (z : ℂ))

/-- The denominator `cz + d` of `A ∈ SL(2, ℤ)` at `z`, as a complex number. -/
abbrev denomZ (A : SL(2, ℤ)) (z : ℍ) : ℂ := ((A 1 0 : ℤ) : ℂ) * z + ((A 1 1 : ℤ) : ℂ)

/-- **0.2, the cusp condition.** `|f(Az)| / |cz + d|^{(2k+1)/2}` is bounded as `Im z → ∞`, for
every `A ∈ SL(2, ℤ)`: holomorphy at every cusp, stated without a branch of the square root. -/
def BoundedAtCusps (k : ℕ) (f : ℍ → ℂ) : Prop :=
  ∀ A : SL(2, ℤ), IsBoundedAtImInfty fun z : ℍ =>
    ‖f (A • z)‖ / ‖denomZ A z‖ ^ ((2 * k + 1 : ℝ) / 2)

/-- **0.5, the cusp-form condition**: the same quotient tends to `0` at every cusp. -/
def ZeroAtCusps (k : ℕ) (f : ℍ → ℂ) : Prop :=
  ∀ A : SL(2, ℤ), IsZeroAtImInfty fun z : ℍ =>
    ‖f (A • z)‖ / ‖denomZ A z‖ ^ ((2 * k + 1 : ℝ) / 2)

/-- **0.2, the carrier.** A modular form of weight `k + 1/2` on `Γ` (intended: `Γ ≤ Γ₀(4)`), with
the multiplied-out transformation law (`README.md`, Layer 0, 0.2). -/
structure HalfIntegralForm (k : ℕ) (Γ : Subgroup SL(2, ℤ)) where
  toFun : ℍ → ℂ
  holo' : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) toFun
  law' : ∀ γ ∈ Γ, ∀ z : ℍ,
    toFun (γ • z) * theta z ^ (2 * k + 1) = theta (γ • z) ^ (2 * k + 1) * toFun z
  bdd' : BoundedAtCusps k toFun

namespace HalfIntegralForm

variable {k : ℕ} {Γ Γ' : Subgroup SL(2, ℤ)}

instance : FunLike (HalfIntegralForm k Γ) ℍ ℂ where
  coe := toFun
  coe_injective f g h := by cases f; cases g; congr

theorem ext {f g : HalfIntegralForm k Γ} (h : ∀ z, f z = g z) : f = g := DFunLike.ext f g h

theorem law (f : HalfIntegralForm k Γ) {γ : SL(2, ℤ)} (hγ : γ ∈ Γ) (z : ℍ) :
    f (γ • z) * theta z ^ (2 * k + 1) = theta (γ • z) ^ (2 * k + 1) * f z := f.law' γ hγ z

theorem bdd (f : HalfIntegralForm k Γ) : BoundedAtCusps k f := f.bdd'

theorem holo (f : HalfIntegralForm k Γ) : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) f := f.holo'

/-- **0.3**, restriction to a smaller group. -/
def ofLe (h : Γ' ≤ Γ) (f : HalfIntegralForm k Γ) : HalfIntegralForm k Γ' where
  toFun := f
  holo' := f.holo'
  law' := fun γ hγ z => f.law' γ (h hγ) z
  bdd' := f.bdd'

/-- The zero form: the law is `0 = 0`. Together with `thetaForm` below it witnesses that the
carrier is not empty. -/
def zeroForm : HalfIntegralForm k Γ where
  toFun := fun _ => 0
  holo' := mdifferentiable_const
  law' := fun _ _ _ => by simp
  bdd' := fun A => by
    simp only [norm_zero, zero_div]
    exact (Filter.zero_zeroAtFilter (β := ℝ) atImInfty).boundedAtFilter

/-! **0.3**, the `ℂ`-vector space structure: pointwise operations, since the law and the bound
are linear. -/

instance : Zero (HalfIntegralForm k Γ) := ⟨zeroForm⟩

instance : Add (HalfIntegralForm k Γ) where
  add f g :=
    { toFun := ⇑f + ⇑g
      holo' := f.holo.add g.holo
      law' := fun γ hγ z => by
        simp only [Pi.add_apply]
        rw [add_mul, mul_add, f.law hγ z, g.law hγ z]
      bdd' := fun A => by
        refine (Asymptotics.isBigO_of_le _ fun z => ?_).trans ((f.bdd A).add (g.bdd A))
        simp only [Pi.add_apply, Real.norm_eq_abs]
        rw [abs_of_nonneg (by positivity), abs_of_nonneg (by positivity), ← add_div]
        gcongr
        exact norm_add_le _ _ }

instance : Neg (HalfIntegralForm k Γ) where
  neg f :=
    { toFun := -⇑f
      holo' := f.holo.neg
      law' := fun γ hγ z => by
        simp only [Pi.neg_apply, neg_mul, mul_neg]
        rw [f.law hγ z]
      bdd' := fun A => by simpa only [Pi.neg_apply, norm_neg] using f.bdd A }

instance : Sub (HalfIntegralForm k Γ) := ⟨fun f g => f + -g⟩

instance {α : Type*} [SMul α ℂ] [IsScalarTower α ℂ ℂ] : SMul α (HalfIntegralForm k Γ) where
  smul c f :=
    { toFun := c • ⇑f
      holo' := by simpa using f.holo.const_smul (c • (1 : ℂ))
      law' := fun γ hγ z => by
        simp only [Pi.smul_apply]
        rw [← smul_one_mul c (f (γ • z)), ← smul_one_mul c (f z), mul_assoc, f.law hγ z]
        ring
      bdd' := fun A => by
        have e : (fun z : ℍ => ‖(c • ⇑f) (A • z)‖ / ‖denomZ A z‖ ^ ((2 * k + 1 : ℝ) / 2)) =
            ‖c • (1 : ℂ)‖ • fun z : ℍ => ‖f (A • z)‖ / ‖denomZ A z‖ ^ ((2 * k + 1 : ℝ) / 2) := by
          funext z
          simp only [Pi.smul_apply, smul_eq_mul]
          rw [← smul_one_mul c (f (A • z)), norm_mul, mul_div_assoc]
        show IsBoundedAtImInfty _
        rw [e]
        exact (f.bdd A).smul _ }

@[simp] theorem coe_zero : ⇑(0 : HalfIntegralForm k Γ) = 0 := rfl

@[simp] theorem coe_add (f g : HalfIntegralForm k Γ) : ⇑(f + g) = f + g := rfl

@[simp] theorem coe_neg (f : HalfIntegralForm k Γ) : ⇑(-f) = -f := rfl

@[simp] theorem coe_sub (f g : HalfIntegralForm k Γ) : ⇑(f - g) = f - g :=
  (sub_eq_add_neg _ _).symm

@[simp] theorem coe_smul {α : Type*} [SMul α ℂ] [IsScalarTower α ℂ ℂ] (c : α)
    (f : HalfIntegralForm k Γ) : ⇑(c • f) = c • ⇑f := rfl

instance : AddCommGroup (HalfIntegralForm k Γ) :=
  DFunLike.coe_injective.addCommGroup _ coe_zero coe_add coe_neg coe_sub
    (fun _ _ => coe_smul _ _) (fun _ _ => coe_smul _ _)

/-- Evaluation as an additive map to functions on `ℍ`. -/
def coeHom : HalfIntegralForm k Γ →+ (ℍ → ℂ) where
  toFun f := f
  map_zero' := coe_zero
  map_add' := coe_add

instance : Module ℂ (HalfIntegralForm k Γ) :=
  DFunLike.coe_injective.module ℂ coeHom fun _ _ => rfl

/-- **0.3**, the Fourier coefficient `a(n)` of `f = ∑ a(n) qⁿ`, `q = e(z)`; every `Γ` considered
contains `T`, on which the multiplier is `1`, so the period is `1`. -/
def coeff (f : HalfIntegralForm k Γ) (n : ℕ) : ℂ := (qExpansion 1 (f : ℍ → ℂ)).coeff n

theorem hasSum_coeff (hT : ModularGroup.T ∈ Γ) (f : HalfIntegralForm k Γ) (z : ℍ) :
    HasSum (fun n : ℕ => coeff f n * cexp (2 * π * I * z) ^ n) (f z) := sorry

/-- **0.3**, the coefficients are additive (given period `1`). -/
theorem coeff_add (hT : ModularGroup.T ∈ Γ) (f g : HalfIntegralForm k Γ) (n : ℕ) :
    coeff (f + g) n = coeff f n + coeff g n := sorry

/-- **0.3**, the coefficients are `ℂ`-homogeneous (given period `1`). -/
theorem coeff_smul (hT : ModularGroup.T ∈ Γ) (c : ℂ) (f : HalfIntegralForm k Γ) (n : ℕ) :
    coeff (c • f) n = c * coeff f n := sorry

/-- **0.3**, the equivalence of the branch-free cusp condition with Shimura's: at a cusp `A∞` of
width `h` and multiplier phase `κ_A ∈ [0, 1)`, boundedness is the absence of negative exponents in
`f(Az)(cz + d)^{−(2k+1)/2} = ∑_{n ≥ 0} b(n) e((n + κ_A) z/h)`. Stated as the existence of the
expansion. -/
theorem exists_expansion_at_cusp (hΓ : Γ ≤ Gamma0 4) [Γ.FiniteIndex] (f : HalfIntegralForm k Γ)
    (A : SL(2, ℤ)) :
    ∃ (h : ℝ) (κ : ℚ) (b : ℕ → ℂ), 0 < h ∧ 0 ≤ κ ∧ κ < 1 ∧ ∀ z : ℍ,
      HasSum (fun n : ℕ => b n * cexp (2 * π * I * ((n : ℂ) + κ) * z / h))
        (f (A • z) / (denomZ A z) ^ ((2 * k + 1 : ℂ) / 2)) := sorry

/-- **0.3, finite-dimensionality**, reduced to the integral-weight target: the route of record
pulls back the finite-dimensionality of `M_{k+1}` along the injection `f ↦ fθ` (README 0.3). -/
theorem finiteDimensional (hΓ : Γ ≤ Gamma1 4)
    [FiniteDimensional ℂ
      (ModularForm (Γ.map (Matrix.SpecialLinearGroup.mapGL ℝ)) ((k : ℤ) + 1))] :
    FiniteDimensional ℂ (HalfIntegralForm k Γ) := sorry

/-- **0.5**, cusp forms. -/
def IsCuspForm (f : HalfIntegralForm k Γ) : Prop := ZeroAtCusps k f

variable (k Γ) in
/-- **0.5**, the subspace `S_{k+1/2}(Γ)` of cusp forms. -/
def cuspSpace : Submodule ℂ (HalfIntegralForm k Γ) where
  carrier := {f | IsCuspForm f}
  zero_mem' := fun A => by
    simp only [coe_zero, Pi.zero_apply, norm_zero, zero_div]
    exact Filter.zero_zeroAtFilter (β := ℝ) atImInfty
  add_mem' := fun {f g} hf hg A => by
    refine squeeze_zero' (Filter.Eventually.of_forall fun z => by positivity)
      (Filter.Eventually.of_forall fun z => ?_) ((hf A).add (hg A))
    simp only [coe_add, Pi.add_apply, ← add_div]
    gcongr
    exact norm_add_le _ _
  smul_mem' := fun c f hf A => by
    simpa only [IsCuspForm, ZeroAtCusps, IsZeroAtImInfty, coe_smul, Pi.smul_apply, Pi.smul_def,
      smul_eq_mul, norm_mul, mul_div_assoc] using (hf A).smul ‖c‖

theorem mem_cuspSpace_iff (f : HalfIntegralForm k Γ) : f ∈ cuspSpace k Γ ↔ IsCuspForm f :=
  Iff.rfl

theorem coeff_zero_of_isCuspForm (hT : ModularGroup.T ∈ Γ) {f : HalfIntegralForm k Γ}
    (hf : IsCuspForm f) : coeff f 0 = 0 := sorry

end HalfIntegralForm

/-- **0.2**, the boundedness of `θ` at every cusp: at `∞` from `hasSum_nat_jacobiTheta`, at `0`
from the `W₄`-law of 0.1, at `1/2` from `θ(z + 1/2) = ∑ (−1)ⁿ qⁿ²` with the `W₄`-law. -/
theorem boundedAtCusps_theta : BoundedAtCusps 0 theta := sorry

/-- **0.2, non-vacuity.** `θ ∈ M_{1/2}(Γ₀(4))`. Its law is `θ(γz)θ(z) = θ(γz)θ(z)`; holomorphy
is `differentiableAt_jacobiTheta` at `2z`; boundedness at the cusps is `boundedAtCusps_theta`. -/
def thetaForm : HalfIntegralForm 0 (Gamma0 4) where
  toFun := theta
  holo' := fun τ => by
    have h : DifferentiableAt ℂ (fun w : ℂ => jacobiTheta (2 * w)) τ :=
      (differentiableAt_jacobiTheta (by simpa using τ.im_pos)).comp (τ : ℂ)
        (differentiableAt_id.const_mul (2 : ℂ))
    exact h.mdifferentiableAt.comp τ τ.mdifferentiable_coe
  law' := fun _ _ _ => by simp
  bdd' := boundedAtCusps_theta

@[simp] theorem thetaForm_apply (z : ℍ) : thetaForm z = theta z := rfl

/-- **0.2**, `θ` is not a cusp form: its constant term is `1`. -/
theorem thetaForm_coeff_zero : HalfIntegralForm.coeff thetaForm 0 = 1 := sorry

theorem not_isCuspForm_thetaForm : ¬ thetaForm.IsCuspForm := sorry

/-! ## 0.6: level `4` -/

namespace HalfIntegralForm

/-- **0.6, Cohen's basis** at level `4`: `dim M_{k+1/2}(Γ₀(4)) = ⌊k/2⌋ + 1`, with basis
`θ^{2k+1−4j} F^j`, `F = ∑_{n odd} σ(n) qⁿ`. -/
theorem finrank_four (k : ℕ) :
    Module.finrank ℂ (HalfIntegralForm k (Gamma0 4)) = k / 2 + 1 := sorry

/-- **0.6**, `dim S_{k+1/2}(Γ₀(4)) = ⌊k/2⌋ − 1` for `k ≥ 2`. -/
theorem finrank_cuspSpace_four (k : ℕ) (hk : 2 ≤ k) :
    Module.finrank ℂ (cuspSpace k (Gamma0 4)) = k / 2 - 1 := sorry

/-- **0.6, 4.2**, the level-`4` case: `M_{1/2}(Γ₀(4)) = ℂθ`. -/
theorem eq_span_thetaForm :
    (⊤ : Submodule ℂ (HalfIntegralForm 0 (Gamma0 4))) = Submodule.span ℂ {thetaForm} := sorry

end HalfIntegralForm

/-! ## Layer 3: the `η` multiplier system -/

section Eta

/-- **3.3**, the sawtooth function `((x)) = x − ⌊x⌋ − 1/2` for `x ∉ ℤ`, and `0` for `x ∈ ℤ`. -/
def sawtooth (x : ℚ) : ℚ := if x = ⌊x⌋ then 0 else Int.fract x - 1 / 2

/-- **3.3, Dedekind sums** `s(h, c) = ∑_{r=1}^{c−1} ((r/c))((hr/c))`; `0` for `c ≤ 1`. -/
def dedekindSum (h c : ℤ) : ℚ :=
  ∑ r ∈ Finset.Ico 1 c, sawtooth (r / c) * sawtooth (h * r / c)

/-- **3.3**, reciprocity (Apostol, Theorem 3.7), proved here through the `η` transformation. -/
theorem dedekindSum_reciprocity {h c : ℤ} (hh : 0 < h) (hc : 0 < c) (hcop : IsCoprime h c) :
    dedekindSum h c + dedekindSum c h = ((h : ℚ) ^ 2 + c ^ 2 + 1) / (12 * h * c) - 1 / 4 := sorry

/-- **3.3, Apostol's form** (Theorem 3.4):
`η(γz) = e((a + d)/(24c) − s(d, c)/2) (−i(cz + d))^{1/2} η(z)` for `c > 0`. -/
theorem eta_smul_eq_dedekind (γ : SL(2, ℤ)) (hc : 0 < γ 1 0) (z : ℍ) :
    ModularForm.eta ((γ • z : ℍ) : ℂ) =
      cexp (2 * π * I * ((((γ 0 0 + γ 1 1 : ℤ) : ℂ) / (24 * ((γ 1 0 : ℤ) : ℂ)))
          - (dedekindSum (γ 1 1) (γ 1 0) : ℂ) / 2))
        * (-I * denomZ γ z) ^ ((1 : ℂ) / 2) * ModularForm.eta z := sorry

/-- **3.3, the Rademacher–Knopp closed form**, odd `c`: `η(γz) = ν_η(γ) (cz + d)^{1/2} η(z)` with
`ν_η(γ) = (d/c) e(((a + d)c − bd(c² − 1) − 3c)/24)`. For odd `c > 0` the Kronecker symbol `(d/c)`
is Mathlib's `jacobiSym d c`. -/
theorem eta_smul_eq_of_odd (γ : SL(2, ℤ)) (hc : 0 < γ 1 0) (hodd : Odd (γ 1 0)) (z : ℍ) :
    ModularForm.eta ((γ • z : ℍ) : ℂ) = (jacobiSym (γ 1 1) (γ 1 0).toNat : ℂ) *
      cexp (2 * π * I * ((((γ 0 0 + γ 1 1) * γ 1 0 - γ 0 1 * γ 1 1 * ((γ 1 0) ^ 2 - 1)
        - 3 * γ 1 0 : ℤ) : ℂ) / 24)) * (denomZ γ z) ^ ((1 : ℂ) / 2) * ModularForm.eta z := sorry

/-- **3.3, the Rademacher–Knopp closed form**, even `c`: `η(γz) = ν_η(γ) (cz + d)^{1/2} η(z)` with
`ν_η(γ) = (c/d) e(((a + d)c − bd(c² − 1) + 3d − 3 − 3cd)/24)`. For even `c > 0` the entry `d` is
odd and the Kronecker symbol `(c/d)` is `jacobiSym c |d|`, since `(c/−1) = 1` for `c > 0`. -/
theorem eta_smul_eq_of_even (γ : SL(2, ℤ)) (hc : 0 < γ 1 0) (heven : Even (γ 1 0)) (z : ℍ) :
    ModularForm.eta ((γ • z : ℍ) : ℂ) = (jacobiSym (γ 1 0) (γ 1 1).natAbs : ℂ) *
      cexp (2 * π * I * ((((γ 0 0 + γ 1 1) * γ 1 0 - γ 0 1 * γ 1 1 * ((γ 1 0) ^ 2 - 1)
        + 3 * γ 1 1 - 3 - 3 * γ 1 0 * γ 1 1 : ℤ) : ℂ) / 24)) * (denomZ γ z) ^ ((1 : ℂ) / 2) *
      ModularForm.eta z := sorry

/-- **3.4, the first knowl identity** `θ(z) = η(2z)⁵ / (η(z)² η(4z)²)`. -/
theorem theta_eq_eta_quotient (z : ℍ) :
    theta z = ModularForm.eta (2 * (z : ℂ)) ^ 5 /
      (ModularForm.eta z ^ 2 * ModularForm.eta (4 * (z : ℂ)) ^ 2) := sorry

end Eta

/-! ## Layer 4: unary theta series and Serre–Stark -/

section Unary

/-- **4.1**, `θ_{ψ,t}(z) = ∑_{n ∈ ℤ} ψ(n) e(t n² z)`, of weight `1/2`. -/
def unaryTheta {r : ℕ} (ψ : DirichletCharacter ℂ r) (t : ℕ) (z : ℍ) : ℂ :=
  ∑' n : ℤ, ψ n * cexp (2 * π * I * t * (n : ℂ) ^ 2 * z)

/-- **4.1**, `h_{ψ,t}(z) = ∑_{n ∈ ℤ} ψ(n) n e(t n² z)`, of weight `3/2`. README 4.1 builds it as
`r ∑_{a mod r} ψ(a) g(a/r, 0; 2r²t z)` from the unary theta characteristic `g` of
QSeriesPartitionsAndMockModularForms §6.1 and proves that it is this series. -/
def unaryThetaOdd {r : ℕ} (ψ : DirichletCharacter ℂ r) (t : ℕ) (z : ℍ) : ℂ :=
  ∑' n : ℤ, ψ n * n * cexp (2 * π * I * t * (n : ℂ) ^ 2 * z)

/-- **4.1** (Shimura, Proposition 2.2): `θ_{ψ,t}` is a form of weight `1/2` on `Γ₁(4r²t)` for
primitive even `ψ` (with character `ψ χ_t` on `Γ₀(4r²t)`, README 4.1). -/
theorem exists_unaryTheta_eq {r : ℕ} [NeZero r] (ψ : DirichletCharacter ℂ r) (hψ : ψ.IsPrimitive)
    (hev : ψ (-1) = 1) (t : ℕ) [NeZero (4 * r ^ 2 * t)] :
    ∃ f : HalfIntegralForm 0 (Gamma1 (4 * r ^ 2 * t)), ⇑f = unaryTheta ψ t := sorry

/-- **4.1**, `θ_{ψ,t} = 0` for odd `ψ`. -/
theorem unaryTheta_eq_zero_of_odd {r : ℕ} (ψ : DirichletCharacter ℂ r) (hodd : ψ (-1) = -1)
    (t : ℕ) : unaryTheta ψ t = 0 := sorry

/-- **4.2, the Serre–Stark basis theorem** (Theorem A), summed over the characters modulo `N`:
`M_{1/2}(Γ₁(N))` is spanned by the `θ_{ψ,t}` with `ψ` primitive even and `r² t ∣ N/4`. README 4.2
states the theorem for each `M_{1/2}(N, χ)`, where `θ_{ψ,t}` lies for `χ = ψ χ_t`. -/
theorem serreStark {N : ℕ} [NeZero N] (hN : 4 ∣ N) :
    (⊤ : Submodule ℂ (HalfIntegralForm 0 (Gamma1 N))) = Submodule.span ℂ
      {f : HalfIntegralForm 0 (Gamma1 N) | ∃ (r t : ℕ) (ψ : DirichletCharacter ℂ r),
        ψ.IsPrimitive ∧ ψ (-1) = 1 ∧ r ^ 2 * t ∣ N / 4 ∧ ⇑f = unaryTheta ψ t} := sorry

/-- **4.3** (Serre–Stark, Theorem B): the cusp forms of weight `1/2` are the `θ_{ψ,t}` with `ψ`
not totally even, so there are none on `Γ₁(N)` when `N/4` is squarefree (then `r = 1`, `ψ = 1`),
for every character at once. A trivial character alone does not force vanishing:
`η(72z) = ½ θ_{χ₁₂,3} ∈ S_{1/2}(1728, 1)`. The first cusp form of weight `1/2` is
`η(24z) = ½ θ_{χ₁₂,1}` at level `576`. -/
theorem cuspSpace_zero_eq_bot_of_squarefree {N : ℕ} [NeZero N] (hN : 4 ∣ N)
    (hsq : Squarefree (N / 4)) :
    HalfIntegralForm.cuspSpace 0 (Gamma1 N) = ⊥ := sorry

/-- **4.1, 4.5**, the two identities of Shimura's Remark: `θ_{χ₁₂,1} = 2 η(24z)` and
`h_{χ₋₄,1} = 2 η(8z)³`. Here `χ₁₂ = χ₋₄ χ₋₃` with `χ₋₃(n) = (n/3)`, Mathlib's `quadraticChar`. -/
theorem unaryTheta_chi12 (z : ℍ) :
    unaryTheta (DirichletCharacter.changeLevel (show 4 ∣ 12 by norm_num)
        (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) *
      DirichletCharacter.changeLevel (show 3 ∣ 12 by norm_num)
        ((quadraticChar (ZMod 3)).ringHomComp (Int.castRingHom ℂ))) 1 z =
      2 * ModularForm.eta (24 * (z : ℂ)) := sorry

theorem unaryThetaOdd_chi4 (z : ℍ) :
    unaryThetaOdd (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) 1 z =
      2 * ModularForm.eta (8 * (z : ℂ)) ^ 3 := sorry

end Unary

/-! ## Layer 5: Kohnen's plus space -/

namespace HalfIntegralForm

/-- **5.1**, `T ∈ Γ₀(4)`: forms on `Γ₀(4)` have period `1`, so their coefficients are linear. -/
theorem T_mem_Gamma0_four : ModularGroup.T ∈ Gamma0 4 := by
  rw [Gamma0_mem]
  simp [ModularGroup.T]

variable (k : ℕ)

/-- **5.1, Kohnen's plus space** `M⁺_{k+1/2}(Γ₀(4))`: the forms whose coefficients vanish off
`(−1)^k n ≡ 0, 1 (mod 4)`. -/
def plusSpace : Submodule ℂ (HalfIntegralForm k (Gamma0 4)) where
  carrier := {f | ∀ n : ℕ, ((-1 : ℤ) ^ k * n) % 4 ≠ 0 → ((-1 : ℤ) ^ k * n) % 4 ≠ 1 →
    coeff f n = 0}
  zero_mem' := fun n h0 h1 => by
    simpa using coeff_smul T_mem_Gamma0_four 0 (0 : HalfIntegralForm k (Gamma0 4)) n
  add_mem' := fun hf hg n h0 h1 => by
    rw [coeff_add T_mem_Gamma0_four, hf n h0 h1, hg n h0 h1, add_zero]
  smul_mem' := fun c f hf n h0 h1 => by
    rw [coeff_smul T_mem_Gamma0_four, hf n h0 h1, mul_zero]

/-- **5.3**, `dim M⁺_{k+1/2}(4) = dim M_{2k}(SL₂(ℤ))`, the dimension count of Kohnen's
isomorphism (README 5.3). -/
theorem finrank_plusSpace :
    Module.finrank ℂ (plusSpace k) = Module.finrank ℂ
      (ModularForm ((CongruenceSubgroup.Gamma 1).map (Matrix.SpecialLinearGroup.mapGL ℝ))
        (2 * k : ℤ)) := sorry

/-- **5.1**, `M⁺_{3/2}(4) = 0`. -/
theorem plusSpace_one_eq_bot : plusSpace 1 = ⊥ := sorry

end HalfIntegralForm

end

end TauCetiRoadmap.HalfIntegralWeightModularForms
