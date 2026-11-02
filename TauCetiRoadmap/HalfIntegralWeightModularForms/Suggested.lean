module

import Mathlib

/-!
# Modular forms of half-integral weight: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, using simple definitions on native
carriers. The headlines stated here are finite-dimensionality, Cohen's level-four dimension
formulas, Dedekind reciprocity and the eta transformation formulas, the theta eta quotient,
even and odd unary-theta modularity, both Serre–Stark basis theorems, the two unary eta
identities, and the dimension consequence of Kohnen's correspondence.

The following headlines are not statable with these definitions at the pins. The Shimura
lift, its Euler product and its decomposition lack the half-integral Hecke action and the
constructed lift. Odd-rank lattice modularity lacks ThetaSeries' real-lattice theta-form
bridge. Kohnen's Hecke correspondence and higher-level newform theorem lack the plus-space
Hecke and newspace carriers. Kohnen–Zagier, Waldspurger and the normalized Shintani adjunction
lack the half-integral Petersson space, the Shimura maps and the cycle-integral construction.
The Jacobi theta-component comparison, dimension theorem and Skoruppa–Zagier correspondence
lack the supplier's holomorphic Jacobi carrier and its classical comparison. These remain
proof targets in the README; no replacement predicates or admitted constructions are used here.

The carrier `HalfIntegralForm k Γ` has weight `k+1/2`, a multiplied-out theta transformation
law and branch-free bounds at every cusp. Finite-dimensionality requires finite index.
Levels are positive and divisible by four. The Serre–Stark family is indexed by primitive
characters of positive conductor and positive dilations, with no repeated imprimitive
characters. Its totally-even predicate tests the signs of the coprime local factors.
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

/-- Evaluation of a form as its underlying function. -/
instance : FunLike (HalfIntegralForm k Γ) ℍ ℂ where
  coe := toFun
  coe_injective f g h := by cases f; cases g; congr

/-- The zero form: the law is `0 = 0`. It is the additive identity of the space. -/
def zeroForm : HalfIntegralForm k Γ where
  toFun := fun _ => 0
  holo' := mdifferentiable_const
  law' := fun _ _ _ => by simp
  bdd' := fun A => by
    simp only [norm_zero, zero_div]
    exact (Filter.zero_zeroAtFilter (β := ℝ) atImInfty).boundedAtFilter

/-! **0.3**, the `ℂ`-vector space structure: pointwise operations, since the law and the bound
are linear. -/

/-- The zero function as additive identity. -/
instance : Zero (HalfIntegralForm k Γ) := ⟨zeroForm⟩

/-- Addition of holomorphic sections and their cusp bounds. -/
instance : Add (HalfIntegralForm k Γ) where
  add f g :=
    { toFun := ⇑f + ⇑g
      holo' := f.holo'.add g.holo'
      law' := fun γ hγ z => by
        have hf : f (γ • z) * theta z ^ (2 * k + 1) =
            theta (γ • z) ^ (2 * k + 1) * f z := f.law' γ hγ z
        have hg : g (γ • z) * theta z ^ (2 * k + 1) =
            theta (γ • z) ^ (2 * k + 1) * g z := g.law' γ hγ z
        simp only [Pi.add_apply]
        rw [add_mul, mul_add, hf, hg]
      bdd' := fun A => by
        refine (Asymptotics.isBigO_of_le _ fun z => ?_).trans ((f.bdd' A).add (g.bdd' A))
        simp only [Pi.add_apply, Real.norm_eq_abs]
        rw [abs_of_nonneg (by positivity), abs_of_nonneg (by positivity), ← add_div]
        gcongr
        exact norm_add_le _ _ }

/-- Negation of holomorphic sections. -/
instance : Neg (HalfIntegralForm k Γ) where
  neg f :=
    { toFun := -⇑f
      holo' := f.holo'.neg
      law' := fun γ hγ z => by
        simp only [Pi.neg_apply, neg_mul, mul_neg]
        exact congrArg Neg.neg (f.law' γ hγ z)
      bdd' := fun A => by
        have hf : BoundedAtCusps k (f : ℍ → ℂ) := f.bdd'
        simpa only [Pi.neg_apply, norm_neg] using hf A }

/-- Pointwise subtraction of forms. -/
instance : Sub (HalfIntegralForm k Γ) := ⟨fun f g => f + -g⟩

/-- Scalar multiplication compatible with the complex action. -/
instance {α : Type*} [SMul α ℂ] [IsScalarTower α ℂ ℂ] : SMul α (HalfIntegralForm k Γ) where
  smul c f :=
    { toFun := c • ⇑f
      holo' := by
        have hf : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) (f : ℍ → ℂ) := f.holo'
        simpa using hf.const_smul (c • (1 : ℂ))
      law' := fun γ hγ z => by
        simp only [Pi.smul_apply]
        have hf : f (γ • z) * theta z ^ (2 * k + 1) =
            theta (γ • z) ^ (2 * k + 1) * f z := f.law' γ hγ z
        rw [← smul_one_mul c (f (γ • z)), ← smul_one_mul c (f z), mul_assoc, hf]
        ring
      bdd' := fun A => by
        have e : (fun z : ℍ => ‖(c • ⇑f) (A • z)‖ / ‖denomZ A z‖ ^ ((2 * k + 1 : ℝ) / 2)) =
            ‖c • (1 : ℂ)‖ • fun z : ℍ => ‖f (A • z)‖ / ‖denomZ A z‖ ^ ((2 * k + 1 : ℝ) / 2) := by
          funext z
          simp only [Pi.smul_apply, smul_eq_mul]
          rw [← smul_one_mul c (f (A • z)), norm_mul, mul_div_assoc]
        show IsBoundedAtImInfty _
        rw [e]
        exact (f.bdd' A).smul _ }

/-- The zero form has the zero underlying function. -/
@[simp] theorem coe_zero : ⇑(0 : HalfIntegralForm k Γ) = 0 := rfl

/-- Addition is pointwise. -/
@[simp] theorem coe_add (f g : HalfIntegralForm k Γ) : ⇑(f + g) = f + g := rfl

/-- Negation is pointwise. -/
@[simp] theorem coe_neg (f : HalfIntegralForm k Γ) : ⇑(-f) = -f := rfl

/-- Subtraction is pointwise. -/
@[simp] theorem coe_sub (f g : HalfIntegralForm k Γ) : ⇑(f - g) = f - g :=
  (sub_eq_add_neg _ _).symm

/-- Scalar multiplication is pointwise. -/
@[simp] theorem coe_smul {α : Type*} [SMul α ℂ] [IsScalarTower α ℂ ℂ] (c : α)
    (f : HalfIntegralForm k Γ) : ⇑(c • f) = c • ⇑f := rfl

/-- The additive commutative group of forms. -/
instance : AddCommGroup (HalfIntegralForm k Γ) :=
  DFunLike.coe_injective.addCommGroup _ coe_zero coe_add coe_neg coe_sub
    (fun _ _ => coe_smul _ _) (fun _ _ => coe_smul _ _)

/-- Evaluation as an additive map to functions on `ℍ`. -/
def coeHom : HalfIntegralForm k Γ →+ (ℍ → ℂ) where
  toFun f := f
  map_zero' := coe_zero
  map_add' := coe_add

/-- The complex vector space of forms. -/
instance : Module ℂ (HalfIntegralForm k Γ) :=
  DFunLike.coe_injective.module ℂ coeHom fun _ _ => rfl

/-- The period-one Fourier coefficient, evaluated on the horizontal line of height one.
For a form with `T ∈ Γ`, this equals `(qExpansion 1 f).coeff n`. -/
def coeff (f : HalfIntegralForm k Γ) (n : ℕ) : ℂ :=
  ∫ x : ℝ in 0..1, cexp (-2 * π * I * n * ((x : ℂ) + I)) *
    f ⟨(x : ℂ) + I, by simp⟩

/-- Integration on the horizontal line makes Fourier coefficients additive. -/
theorem coeff_add (f g : HalfIntegralForm k Γ) (n : ℕ) :
    coeff (f + g) n = coeff f n + coeff g n := by
  simp only [coeff, coe_add, Pi.add_apply, mul_add]
  apply intervalIntegral.integral_add
  · apply Continuous.intervalIntegrable
    have hf : Continuous f := f.holo'.continuous
    fun_prop
  · apply Continuous.intervalIntegrable
    have hg : Continuous g := g.holo'.continuous
    fun_prop

/-- Integration on the horizontal line makes Fourier coefficients complex-linear. -/
theorem coeff_smul (c : ℂ) (f : HalfIntegralForm k Γ) (n : ℕ) :
    coeff (c • f) n = c * coeff f n := by
  simp only [coeff, coe_smul, Pi.smul_apply, smul_eq_mul]
  simp_rw [mul_left_comm _ c]
  exact intervalIntegral.integral_const_mul _ _

/-- Forms of weight `k+1/2` on a finite-index subgroup of `Γ₀(4)` form a
finite-dimensional complex vector space. Multiplication by theta injects into integral
weight on `Γ ∩ Γ₁(4)`. -/
theorem finiteDimensional (hΓ : Γ ≤ Gamma0 4) [Γ.FiniteIndex] :
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

end HalfIntegralForm

/-! ### Cohen's level-four dimensions -/

namespace HalfIntegralForm

/-- **0.6, Cohen's basis** at level `4`: `dim M_{k+1/2}(Γ₀(4)) = ⌊k/2⌋ + 1`, with basis
`θ^{2k+1−4j} F^j`, `F = ∑_{n odd} σ(n) qⁿ`. -/
theorem finrank_four (k : ℕ) :
    Module.finrank ℂ (HalfIntegralForm k (Gamma0 4)) = k / 2 + 1 := sorry

/-- **0.6**, `dim S_{k+1/2}(Γ₀(4)) = ⌊k/2⌋ − 1` for `k ≥ 2`. -/
theorem finrank_cuspSpace_four (k : ℕ) (hk : 2 ≤ k) :
    Module.finrank ℂ (cuspSpace k (Gamma0 4)) = k / 2 - 1 := sorry

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

/-- A primitive odd character of positive conductor gives a cuspidal unary theta
series of weight `3/2`, on the full positive level `4r²t`. -/
theorem exists_unaryThetaOdd_eq {r : ℕ} [NeZero r] (ψ : DirichletCharacter ℂ r)
    (hψ : ψ.IsPrimitive) (hodd : ψ (-1) = -1) (t : ℕ) [NeZero (4 * r ^ 2 * t)] :
    ∃ f : HalfIntegralForm.cuspSpace 1 (Gamma1 (4 * r ^ 2 * t)),
      ∀ z : ℍ, (f : HalfIntegralForm 1 (Gamma1 (4 * r ^ 2 * t))) z =
        unaryThetaOdd ψ t z := sorry

/-- The Serre–Stark indices at level `N`: a positive primitive even conductor and a
positive dilation satisfying the full divisibility condition `r²t ∣ N/4`. -/
structure UnaryIndex (N : ℕ) where
  r : ℕ
  t : ℕ
  r_pos : 0 < r
  t_pos : 0 < t
  psi : DirichletCharacter ℂ r
  primitive : psi.IsPrimitive
  even : psi (-1) = 1
  level_dvd : r ^ 2 * t ∣ N / 4

/-- A character is totally even when it is one on every sign supported on a coprime
factor of its modulus; by the Chinese remainder theorem this says every local component
is even. -/
def TotallyEven {r : ℕ} (ψ : DirichletCharacter ℂ r) : Prop :=
  ∀ a b : ℕ, a * b = r → Nat.Coprime a b →
    ∀ u : ℤ, Int.ModEq a u (-1) → Int.ModEq b u 1 → ψ u = 1

/-- Serre–Stark Theorem A: the correctly indexed unary theta family is a basis,
including linear independence as well as spanning, on `Γ₁(N)`. -/
theorem serreStark {N : ℕ} [NeZero N] (hN : 4 ∣ N) :
    ∃ b : Module.Basis (UnaryIndex N) ℂ (HalfIntegralForm 0 (Gamma1 N)),
      ∀ i z, b i z = unaryTheta i.psi i.t z := sorry

/-- Serre–Stark Theorem B: the subfamily whose primitive character is not totally
even is a basis of the entire weight-one-half cusp space. -/
theorem serreStark_cusp {N : ℕ} [NeZero N] (hN : 4 ∣ N) :
    ∃ b : Module.Basis {i : UnaryIndex N // ¬ TotallyEven i.psi} ℂ
      (HalfIntegralForm.cuspSpace 0 (Gamma1 N)),
      ∀ i z, (b i : HalfIntegralForm 0 (Gamma1 N)) z =
        unaryTheta i.val.psi i.val.t z := sorry

/-- **4.1, 4.5**, the two identities of Shimura's Remark: `θ_{χ₁₂,1} = 2 η(24z)` and
`h_{χ₋₄,1} = 2 η(8z)³`. Here `χ₁₂ = χ₋₄ χ₋₃` with `χ₋₃(n) = (n/3)`, Mathlib's `quadraticChar`. -/
theorem unaryTheta_chi12 (z : ℍ) :
    unaryTheta (DirichletCharacter.changeLevel (show 4 ∣ 12 by norm_num)
        (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) *
      DirichletCharacter.changeLevel (show 3 ∣ 12 by norm_num)
        ((quadraticChar (ZMod 3)).ringHomComp (Int.castRingHom ℂ))) 1 z =
      2 * ModularForm.eta (24 * (z : ℂ)) := sorry

/-- Jacobi's unary identity: the odd character modulo four gives twice eta cubed at eight times the argument. -/
theorem unaryThetaOdd_chi4 (z : ℍ) :
    unaryThetaOdd (ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)) 1 z =
      2 * ModularForm.eta (8 * (z : ℂ)) ^ 3 := sorry

end Unary

/-! ## Layer 5: Kohnen's plus space -/

namespace HalfIntegralForm

variable (k : ℕ)

/-- **5.1, Kohnen's plus space** `M⁺_{k+1/2}(Γ₀(4))`: the forms whose coefficients vanish off
`(−1)^k n ≡ 0, 1 (mod 4)`. -/
def plusSpace : Submodule ℂ (HalfIntegralForm k (Gamma0 4)) where
  carrier := {f | ∀ n : ℕ, ((-1 : ℤ) ^ k * n) % 4 ≠ 0 → ((-1 : ℤ) ^ k * n) % 4 ≠ 1 →
    coeff f n = 0}
  zero_mem' := fun n h0 h1 => by
    simpa using coeff_smul 0 (0 : HalfIntegralForm k (Gamma0 4)) n
  add_mem' := fun hf hg n h0 h1 => by
    rw [coeff_add, hf n h0 h1, hg n h0 h1, add_zero]
  smul_mem' := fun c f hf n h0 h1 => by
    rw [coeff_smul, hf n h0 h1, mul_zero]

/-- **5.3**, `dim M⁺_{k+1/2}(4) = dim M_{2k}(SL₂(ℤ))`, the dimension count of Kohnen's
isomorphism (README 5.3). -/
theorem finrank_plusSpace (hk : 1 ≤ k) :
    Module.finrank ℂ (plusSpace k) = Module.finrank ℂ
      (ModularForm ((CongruenceSubgroup.Gamma 1).map (Matrix.SpecialLinearGroup.mapGL ℝ))
        (2 * k : ℤ)) := sorry

end HalfIntegralForm

end

end TauCetiRoadmap.HalfIntegralWeightModularForms
