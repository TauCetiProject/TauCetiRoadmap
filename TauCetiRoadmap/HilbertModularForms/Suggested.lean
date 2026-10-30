import Mathlib
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Basic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.NormCoeff
import TauCeti.NumberTheory.ModularForms.Newforms.Newform
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Basic
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Finite
import TauCeti.NumberTheory.NumberField.TotallyPositive

/-!
# Hilbert modular forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. This file states only what can be stated over Mathlib and the pinned Tau Ceti: the
domain, the group and the slash action (Layer 0), the lattices, the groups `Γ₀(𝔫)_𝔟` and the
systems of representatives (Layer 1), the spaces of modular and cusp forms, Fourier coefficients
and normalized ideal coefficients (Layer 2), the finite-dimensionality theorems (Layer 3), and
the `L`-series of a tuple. The other targets — the Petersson product, the component transport,
the Hecke, central and Atkin–Lehner operators, old and new subspaces, newforms and their
invariants, completed `L`-functions, twists, CM, base change, the Doi–Naganuma lift and the
LMFDB interface — need constructions that are themselves milestones of this roadmap; they are
specified, with their definitions and Checks, in `README.md` only. `sorry` is permitted in the
proofs of this human-owned repository: these are targets, not implementations.

The carrier is a function `UpperHalfSpace F → ℂ`, where `UpperHalfSpace F := InfinitePlace F → ℍ`
is one copy of Mathlib's upper half-plane per infinite place of the totally real field `F`
(`NumberField.IsTotallyReal F`), acted on componentwise by `GL2Pos F`, the subgroup of
`GL (Fin 2) F` of totally positive determinant, through the real embeddings and Mathlib's
`UpperHalfPlane.glAction`. No ordering of the places is chosen: `Fin n` indexes nothing.

Conventions visible in the signatures (`README.md`, *Pinned conventions*). A weight is a function
`k : InfinitePlace F → ℤ` with all differences even (`Weight`); `k.top` is `k₀ = max k_w` and
`k.m w = (k₀ - k_w)/2`. The slash `slash k γ f` is the **arithmetic** normalization
`∏_w σ_w(det γ)^(k_w + m_w - 1) · denom(σ_w γ, z_w)^(-k_w) · f(γ • z)`; the unitary one is
`slashUnitary` and is used in no other declaration. A form of level `𝔫` is a tuple
`HilbertModularForms F 𝔫 k R`, indexed by the narrow class group through a system of
representatives `R : NarrowRepresentatives F`; the component of class `c` lives on
`Gamma0 F 𝔫 (R.rep c)`, the group `Γ₀(𝔫)_𝔟` of the LMFDB knowl. The spaces carry **no cusp
condition**: Koecher's principle (`koecher`) is a theorem. The Fourier coefficient `fourierCoeff`
is the mean of `f(x + i) e(-Tr(μ(x + i)))` over the boxes `[-T, T]^Σ` as `T → ∞`, which for a
holomorphic function periodic under a full lattice is the README's mean over a fundamental
parallelotope. The normalized coefficient `coeff f` is a Tau Ceti `IdealArithmeticFunction F`,
indexed by nonzero integral ideals and extended by zero to all ideals as `coeffIdeal`. The
`L`-series is Mathlib's `LSeries` of Tau Ceti's `normCoeff` of the coefficient function, in the
arithmetic normalization with centre `k₀/2`.

The degree hypothesis `1 < Module.finrank ℚ F` is an explicit argument of the theorems that use
it (Koecher's principle, finite dimensionality); the definitions are stated without it.

Every proof below is `sorry` except the closure proofs of the subgroups and submodules, the
linearity of the slash, and the bridge checks, which are real terms so that the elaborator
checks the instance lists the README promises: the closure of `GL2Pos` under products and
inverses from Tau Ceti's `IsTotallyPositive.mul`/`.inv`, the `MulAction` of `GL2Pos F` on
`UpperHalfSpace F` from `UpperHalfPlane.glAction`, the construction `NarrowRepresentatives.choice`
from `NarrowClassGroup.mk_surjective`, the inclusion `cuspForms_le`, the identification of the
exponent lattice `dualLattice_eq` from `FractionalIdeal.dual_inv` and `coeIdeal_differentIdeal`,
and `finiteDimensional_of_isCompact_closedBall`, the Riesz input of 3.5.
-/

noncomputable section

open NumberField UpperHalfPlane IsDedekindDomain TauCeti
open scoped UpperHalfPlane nonZeroDivisors

namespace TauCetiRoadmap.HilbertModularForm

variable (F : Type*) [Field F] [NumberField F] [IsTotallyReal F]

/-! ### Layer 0: the domain, the group, the slash action, holomorphy -/

/-- `ℍ^Σ`, one upper half-plane per infinite place of `F` (`README.md`, Layer 0, 0.1). -/
abbrev UpperHalfSpace := InfinitePlace F → ℍ

/-- The real embedding `σ_w : F →+* ℝ` at the (real) infinite place `w` (`README.md`, Layer 0,
0.1); `Standing hypotheses`. -/
def realEmbedding (w : InfinitePlace F) : F →+* ℝ :=
  InfinitePlace.embedding_of_isReal (IsTotallyReal.isReal w)

/-- `σ_w` on `GL₂`, `GL (Fin 2) F →* GL (Fin 2) ℝ` (`README.md`, Layer 0, 0.1). -/
def toGLReal (w : InfinitePlace F) : GL (Fin 2) F →* GL (Fin 2) ℝ :=
  Matrix.GeneralLinearGroup.map (realEmbedding F w)

/-- `GL₂⁺(F)`, the matrices of totally positive determinant (`README.md`, Layer 0, 0.1). The
closure proofs are bridge checks of Tau Ceti's `IsTotallyPositive` API. -/
def GL2Pos : Subgroup (GL (Fin 2) F) where
  carrier := {γ | IsTotallyPositive ((Matrix.GeneralLinearGroup.det γ : Fˣ) : F)}
  one_mem' := by simp
  mul_mem' {a b} ha hb := by
    simpa only [Set.mem_ofPred_eq, map_mul, Units.val_mul] using
      IsTotallyPositive.mul (K := F) ha hb
  inv_mem' {a} ha := by
    simpa only [Set.mem_ofPred_eq, map_inv, Units.val_inv_eq_inv_val] using
      IsTotallyPositive.inv (K := F) ha

/-- The determinant of `γ ∈ GL₂⁺(F)` as an element of `F`. -/
def det₀ (γ : GL2Pos F) : F := ((Matrix.GeneralLinearGroup.det (γ : GL (Fin 2) F) : Fˣ) : F)

/-- The `(i, j)` entry of `γ ∈ GL₂⁺(F)`. -/
def entry (γ : GL2Pos F) (i j : Fin 2) : F := ((γ : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) i j

omit [NumberField F] [IsTotallyReal F] in
theorem isTotallyPositive_det₀ (γ : GL2Pos F) : IsTotallyPositive (det₀ F γ) := γ.2

/-- The componentwise action `(γ • z) w = σ_w(γ) • z w` (`README.md`, Layer 0, 0.1). -/
instance : SMul (GL2Pos F) (UpperHalfSpace F) :=
  ⟨fun γ z w => toGLReal F w (γ : GL (Fin 2) F) • z w⟩

omit [NumberField F] in
theorem smul_apply (γ : GL2Pos F) (z : UpperHalfSpace F) (w : InfinitePlace F) :
    (γ • z) w = toGLReal F w (γ : GL (Fin 2) F) • z w := rfl

/-- `GL₂⁺(F)` acts on `ℍ^Σ` (`README.md`, Layer 0, 0.1); a bridge check of Mathlib's
`UpperHalfPlane.glAction` through `Matrix.GeneralLinearGroup.map`. -/
instance : MulAction (GL2Pos F) (UpperHalfSpace F) where
  one_smul z := funext fun w => by rw [smul_apply, OneMemClass.coe_one, map_one, one_smul]
  mul_smul γ δ z := funext fun w => by
    rw [smul_apply, smul_apply, smul_apply, Subgroup.coe_mul, map_mul, mul_smul]

/-- `σ_w(det γ) > 0`, so Mathlib's conjugation `σ` in `glAction` never fires on `GL₂⁺(F)`
(`README.md`, Layer 0, 0.1). -/
theorem det_toGLReal_pos (γ : GL2Pos F) (w : InfinitePlace F) :
    0 < (toGLReal F w (γ : GL (Fin 2) F)).det.val := sorry

/-- The action is the Möbius action at every place: a bridge check of
`UpperHalfPlane.coe_smul_of_det_pos` (`README.md`, Layer 0, 0.1). -/
theorem coe_smul_apply (γ : GL2Pos F) (z : UpperHalfSpace F) (w : InfinitePlace F) :
    ((γ • z) w : ℂ) = num (toGLReal F w (γ : GL (Fin 2) F)) (z w) /
      denom (toGLReal F w (γ : GL (Fin 2) F)) (z w) :=
  coe_smul_of_det_pos (det_toGLReal_pos F γ w) (z w)

/-- A weight `k ∈ ℤ^Σ` with all `k_w` of one parity (`README.md`, Layer 0, 0.3). -/
structure Weight where
  /-- The weight at each place. -/
  k : InfinitePlace F → ℤ
  /-- The parity condition. -/
  parity : ∀ v w, Even (k v - k w)

namespace Weight

variable {F}

/-- Parallel weight `a` (`README.md`, Layer 0, 0.3): the non-vacuity constructor of `Weight`. -/
def parallel (a : ℤ) : Weight F := ⟨fun _ => a, fun _ _ => by simp⟩

/-- `k` is parallel (`README.md`, Layer 0, 0.3). -/
def IsParallel (k : Weight F) : Prop := ∃ a, ∀ w, k.k w = a

/-- `k₀ := max_w k_w` (`README.md`, Layer 0, 0.3). -/
def top (k : Weight F) : ℤ := Finset.univ.sup' Finset.univ_nonempty k.k

/-- `m_w := (k₀ - k_w)/2` (`README.md`, Layer 0, 0.3). -/
def m (k : Weight F) (w : InfinitePlace F) : ℤ := (k.top - k.k w) / 2

theorem top_parallel (a : ℤ) : (parallel (F := F) a).top = a := sorry

theorem m_eq_zero_of_isParallel {k : Weight F} (h : k.IsParallel) (w : InfinitePlace F) :
    k.m w = 0 := sorry

end Weight

/-- The weight-`k` slash in the arithmetic normalization (`README.md`, Layer 0, 0.3; *Pinned
conventions*, Slash). -/
def slash (k : Weight F) (γ : GL2Pos F) (f : UpperHalfSpace F → ℂ) : UpperHalfSpace F → ℂ :=
  fun z => (∏ w, (((realEmbedding F w (det₀ F γ) : ℝ) : ℂ) ^ (k.k w + k.m w - 1) *
    (denom (toGLReal F w (γ : GL (Fin 2) F)) (z w)) ^ (-(k.k w)))) * f (γ • z)

variable {F}

theorem slash_one (k : Weight F) (f : UpperHalfSpace F → ℂ) : slash F k 1 f = f := sorry

/-- `(f ∣_k γ) ∣_k δ = f ∣_k (γδ)` (`README.md`, Layer 0, 0.3). -/
theorem slash_mul (k : Weight F) (γ δ : GL2Pos F) (f : UpperHalfSpace F → ℂ) :
    slash F k δ (slash F k γ f) = slash F k (γ * δ) f := sorry

theorem slash_add (k : Weight F) (γ : GL2Pos F) (f g : UpperHalfSpace F → ℂ) :
    slash F k γ (f + g) = slash F k γ f + slash F k γ g := by
  funext z
  simp only [slash, Pi.add_apply, mul_add]

theorem slash_smul (k : Weight F) (γ : GL2Pos F) (a : ℂ) (f : UpperHalfSpace F → ℂ) :
    slash F k γ (a • f) = a • slash F k γ f := by
  funext z
  simp only [slash, Pi.smul_apply, smul_eq_mul]
  ring

theorem slash_zero (k : Weight F) (γ : GL2Pos F) : slash F k γ 0 = 0 := by
  funext z
  simp only [slash, Pi.zero_apply, mul_zero]

/-- A scalar `a ∈ F^×` acts by the signed norm `N(a)^{k₀ - 2}` (`README.md`, Layer 0, 0.3); no
positivity is needed since `det (a·1) = a²`. -/
theorem slash_scalar (k : Weight F) (γ : GL2Pos F) (a : F)
    (hγ : ((γ : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) = Matrix.scalar (Fin 2) a)
    (f : UpperHalfSpace F → ℂ) :
    slash F k γ f = ((Algebra.norm ℚ a : ℂ) ^ (k.top - 2)) • f := sorry

variable (F)

/-- The unitary slash of the LMFDB knowl, with `σ_w(det γ)^{k_w/2}` as a real power
(`README.md`, Layer 0, 0.4). -/
def slashUnitary (k : Weight F) (γ : GL2Pos F) (f : UpperHalfSpace F → ℂ) :
    UpperHalfSpace F → ℂ :=
  fun z => (∏ w, (((realEmbedding F w (det₀ F γ)) ^ ((k.k w : ℝ) / 2) : ℝ) : ℂ) *
    (denom (toGLReal F w (γ : GL (Fin 2) F)) (z w)) ^ (-(k.k w))) * f (γ • z)

variable {F}

/-- `f ∣_k γ = N(det γ)^{(k₀ - 2)/2} · (f ∣_k^u γ)` (`README.md`, Layer 0, 0.4). -/
theorem slash_eq_slashUnitary (k : Weight F) (γ : GL2Pos F) (f : UpperHalfSpace F → ℂ) :
    slash F k γ f =
      ((((Algebra.norm ℚ (det₀ F γ) : ℝ) ^ (((k.top : ℝ) - 2) / 2) : ℝ) : ℂ)) •
        slashUnitary F k γ f := sorry

variable (F)

/-- Holomorphy on `ℍ^Σ`, as differentiability of the coordinatewise `ofComplex` extension on the
open polyhalf-plane (`README.md`, Layer 0, 0.2; *Pinned conventions*, Holomorphy). -/
def IsHolomorphic (f : UpperHalfSpace F → ℂ) : Prop :=
  DifferentiableOn ℂ (fun z : InfinitePlace F → ℂ => f fun w => ofComplex (z w))
    {z | ∀ w, 0 < (z w).im}

variable {F}

theorem IsHolomorphic.slash {f : UpperHalfSpace F → ℂ} (hf : IsHolomorphic F f) (k : Weight F)
    (γ : GL2Pos F) : IsHolomorphic F (slash F k γ f) := sorry

variable (F)

/-- `Tr(μz) = Σ_w σ_w(μ) z_w` (`README.md`, Layer 2, 2.1). -/
def tracePairing (μ : F) (z : UpperHalfSpace F) : ℂ :=
  ∑ w, ((realEmbedding F w μ : ℝ) : ℂ) * (z w : ℂ)

/-- `e(Tr(μz)) = exp(2πi Tr(μz))` (`README.md`, Layer 2, 2.1). -/
def expTrace (μ : F) (z : UpperHalfSpace F) : ℂ :=
  Complex.exp (2 * Real.pi * Complex.I * tracePairing F μ z)

theorem isHolomorphic_expTrace (μ : F) : IsHolomorphic F (expTrace F μ) := sorry

/-! ### Layer 1: lattices, the groups `Γ₀(𝔫)_𝔟`, systems of representatives -/

/-- The lattice `L_𝔟 = 𝒪_F ⊕ 𝔟 ⊂ F²` (`README.md`, Layer 1, 1.1). -/
def lattice (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : Submodule (𝓞 F) (Fin 2 → F) where
  carrier := {v | v 0 ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) ∧ v 1 ∈ (𝔟 : FractionalIdeal (𝓞 F)⁰ F)}
  add_mem' ha hb :=
    ⟨Submodule.add_mem ((1 : FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F) ha.1 hb.1,
      Submodule.add_mem ((𝔟 : FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F) ha.2 hb.2⟩
  zero_mem' := ⟨Submodule.zero_mem ((1 : FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F),
    Submodule.zero_mem ((𝔟 : FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F)⟩
  smul_mem' c _ hv := ⟨Submodule.smul_mem ((1 : FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F)
    c hv.1, Submodule.smul_mem ((𝔟 : FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F) c hv.2⟩

omit [NumberField F] [IsTotallyReal F] in
theorem entry_mul (γ δ : GL2Pos F) (i j : Fin 2) :
    entry F (γ * δ) i j = entry F γ i 0 * entry F δ 0 j + entry F γ i 1 * entry F δ 1 j := by
  simp [entry, Matrix.mul_apply, Fin.sum_univ_two]

omit [NumberField F] [IsTotallyReal F] in
theorem det₀_mul (γ δ : GL2Pos F) : det₀ F (γ * δ) = det₀ F γ * det₀ F δ := by
  simp [det₀]

omit [NumberField F] [IsTotallyReal F] in
theorem det₀_inv (γ : GL2Pos F) : det₀ F γ⁻¹ = (det₀ F γ)⁻¹ := by
  simp [det₀]

omit [NumberField F] [IsTotallyReal F] in
theorem entry_inv (γ : GL2Pos F) :
    entry F γ⁻¹ 0 0 = (det₀ F γ)⁻¹ * entry F γ 1 1 ∧
    entry F γ⁻¹ 0 1 = (det₀ F γ)⁻¹ * -entry F γ 0 1 ∧
    entry F γ⁻¹ 1 0 = (det₀ F γ)⁻¹ * -entry F γ 1 0 ∧
    entry F γ⁻¹ 1 1 = (det₀ F γ)⁻¹ * entry F γ 0 0 := by
  simp [entry, det₀, Matrix.coe_units_inv, Matrix.inv_def, Matrix.adjugate_fin_two,
    Matrix.GeneralLinearGroup.val_det_apply]

/-- `Γ₀(𝔫)_𝔟 = {(a b; c d) : a, d ∈ 𝒪_F, b ∈ 𝔟⁻¹, c ∈ 𝔫𝔟, det ∈ 𝒪_{F,+}^×}` (`README.md`, Layer 1,
1.2; *Pinned conventions*, Lattice of a component). `𝔫 = ⊤` gives the full group `Γ_𝔟`. -/
def Gamma0 (𝔫 : Ideal (𝓞 F)) (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : Subgroup (GL2Pos F) where
  carrier := {γ |
    entry F γ 0 0 ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) ∧
    entry F γ 1 1 ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) ∧
    entry F γ 0 1 ∈ ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F) ∧
    entry F γ 1 0 ∈ (𝔫 : FractionalIdeal (𝓞 F)⁰ F) * (𝔟 : FractionalIdeal (𝓞 F)⁰ F) ∧
    ∃ u ∈ totallyPositiveIntegerUnits (K := F), algebraMap (𝓞 F) F (u : 𝓞 F) = det₀ F γ}
  one_mem' := by
    refine ⟨?_, ?_, ?_, ?_, 1, one_mem _, by simp [det₀]⟩
    · simp only [entry, OneMemClass.coe_one, Units.val_one, Matrix.one_apply_eq]
      exact FractionalIdeal.one_mem_one _
    · simp only [entry, OneMemClass.coe_one, Units.val_one, Matrix.one_apply_eq]
      exact FractionalIdeal.one_mem_one _
    · simp only [entry, OneMemClass.coe_one, Units.val_one, Matrix.one_apply_ne zero_ne_one]
      exact Submodule.zero_mem (((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) :
        FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F)
    · exact Submodule.zero_mem (((𝔫 : FractionalIdeal (𝓞 F)⁰ F) * (𝔟 : FractionalIdeal (𝓞 F)⁰ F) :
        FractionalIdeal (𝓞 F)⁰ F) : Submodule (𝓞 F) F)
  mul_mem' {γ δ} hγ hδ := by
    obtain ⟨a₁, d₁, b₁, c₁, u, hu, hdu⟩ := hγ
    obtain ⟨a₂, d₂, b₂, c₂, v, hv, hdv⟩ := hδ
    have add_mem : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {x y : F}, x ∈ I → y ∈ I → x + y ∈ I :=
      fun {I x y} hx hy => (I : Submodule (𝓞 F) F).add_mem hx hy
    have hB : ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F) *
        (𝔟 : FractionalIdeal (𝓞 F)⁰ F) = 1 := Units.inv_mul 𝔟
    have hN : (𝔫 : FractionalIdeal (𝓞 F)⁰ F) ≤ 1 := FractionalIdeal.coeIdeal_le_one
    have h1 : ∀ {x y : F}, x ∈ ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F) →
        y ∈ (𝔫 : FractionalIdeal (𝓞 F)⁰ F) * (𝔟 : FractionalIdeal (𝓞 F)⁰ F) →
        x * y ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) := fun {x y} hx hy => by
      have := FractionalIdeal.mul_mem_mul hx hy
      rw [mul_left_comm, hB, mul_one] at this
      exact hN this
    have h2 : ∀ {x y : F}, x ∈ (𝔫 : FractionalIdeal (𝓞 F)⁰ F) * (𝔟 : FractionalIdeal (𝓞 F)⁰ F) →
        y ∈ ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F) →
        x * y ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) := fun {x y} hx hy => mul_comm y x ▸ h1 hy hx
    have hl : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {x y : F}, x ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) →
        y ∈ I → x * y ∈ I := fun {I x y} hx hy => by
      simpa using FractionalIdeal.mul_mem_mul hx hy
    have hr : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {x y : F}, x ∈ I →
        y ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) → x * y ∈ I := fun {I x y} hx hy =>
      mul_comm y x ▸ hl hy hx
    refine ⟨?_, ?_, ?_, ?_, u * v, mul_mem hu hv, ?_⟩
    · rw [entry_mul]; exact add_mem (hl a₁ a₂) (h1 b₁ c₂)
    · rw [entry_mul]; exact add_mem (h2 c₁ b₂) (hl d₁ d₂)
    · rw [entry_mul]; exact add_mem (hl a₁ b₂) (hr b₁ d₂)
    · rw [entry_mul]; exact add_mem (hr c₁ a₂) (hl d₁ c₂)
    · rw [det₀_mul, ← hdu, ← hdv]; simp
  inv_mem' {γ} hγ := by
    obtain ⟨a, d, b, c, u, hu, hdu⟩ := hγ
    obtain ⟨e₀₀, e₀₁, e₁₀, e₁₁⟩ := entry_inv F γ
    have neg_mem : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {x : F}, x ∈ I → -x ∈ I :=
      fun {I x} hx => (I : Submodule (𝓞 F) F).neg_mem hx
    have hdet : (det₀ F γ)⁻¹ ∈ (1 : FractionalIdeal (𝓞 F)⁰ F) :=
      (FractionalIdeal.mem_one_iff _).2 ⟨((u⁻¹ : (𝓞 F)ˣ) : 𝓞 F), by
        rw [← hdu]; exact map_units_inv (algebraMap (𝓞 F) F) u⟩
    have hl : ∀ {I : FractionalIdeal (𝓞 F)⁰ F} {y : F}, y ∈ I → (det₀ F γ)⁻¹ * y ∈ I :=
      fun {I y} hy => by simpa using FractionalIdeal.mul_mem_mul hdet hy
    refine ⟨?_, ?_, ?_, ?_, u⁻¹, inv_mem hu, ?_⟩
    · rw [e₀₀]; exact hl d
    · rw [e₁₁]; exact hl a
    · rw [e₀₁]; exact hl (neg_mem b)
    · rw [e₁₀]; exact hl (neg_mem c)
    · rw [det₀_inv, ← hdu]; simp

variable {F}

/-- `Γ₀(𝔫)_𝔟 ≤ Γ₀(𝔪)_𝔟` for `𝔪 ∣ 𝔫` (`README.md`, Layer 1, 1.2). -/
theorem Gamma0_le_of_dvd {𝔪 𝔫 : Ideal (𝓞 F)} (h : 𝔪 ∣ 𝔫) (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) :
    Gamma0 F 𝔫 𝔟 ≤ Gamma0 F 𝔪 𝔟 := sorry


/-- `Γ₀(𝔫)_𝔟` is the stabilizer of `L_𝔟` intersected with the Borel condition at `𝔫`; for `𝔫 = ⊤`
it is the full stabilizer (`README.md`, Layer 1, 1.1). -/
theorem mem_Gamma0_top_iff (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) (γ : GL2Pos F) :
    γ ∈ Gamma0 F ⊤ 𝔟 ↔
      (lattice F 𝔟).map (Matrix.toLin' ((γ : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F)
        |>.restrictScalars (𝓞 F)) = lattice F 𝔟 := sorry

/-- Commensurability of two level groups on one component (`README.md`, Layer 1, 1.3). -/
theorem commensurable_Gamma0 (𝔫 𝔫' : Ideal (𝓞 F)) (h𝔫 : 𝔫 ≠ ⊥) (h𝔫' : 𝔫' ≠ ⊥)
    (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) :
    (Gamma0 F 𝔫 𝔟).Commensurable (Gamma0 F 𝔫' 𝔟) := sorry

/-- Component transport: `diag(1, α)` conjugates `Γ₀(𝔫)_𝔟` onto `Γ₀(𝔫)_{α𝔟}` for `α ≫ 0`
(`README.md`, Layer 1, 1.3). -/
theorem exists_conj_Gamma0 (𝔫 : Ideal (𝓞 F)) (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) (α : F)
    (hα : IsTotallyPositive α) :
    ∃ (δ : GL2Pos F) (𝔟' : (FractionalIdeal (𝓞 F)⁰ F)ˣ),
      ((δ : GL (Fin 2) F) : Matrix (Fin 2) (Fin 2) F) = !![1, 0; 0, α] ∧
      (𝔟' : FractionalIdeal (𝓞 F)⁰ F) =
        FractionalIdeal.spanSingleton (𝓞 F)⁰ α * (𝔟 : FractionalIdeal (𝓞 F)⁰ F) ∧
      (Gamma0 F 𝔫 𝔟).map (MulAut.conj δ).toMonoidHom = Gamma0 F 𝔫 𝔟' := sorry

variable (F)

/-- A system of representatives of the narrow class group by invertible fractional ideals
(`README.md`, Layer 1, 1.5; *Pinned conventions*, Components). -/
structure NarrowRepresentatives where
  /-- The representative of each narrow class. -/
  rep : NarrowClassGroup F → (FractionalIdeal (𝓞 F)⁰ F)ˣ
  /-- It represents its class. -/
  mk_rep : ∀ c, NarrowClassGroup.mk (rep c) = c

/-- A system of representatives exists (`README.md`, Layer 1, 1.5): the non-vacuity constructor
of `NarrowRepresentatives`, a bridge check of Tau Ceti's `NarrowClassGroup.mk_surjective`. -/
def NarrowRepresentatives.choice : NarrowRepresentatives F :=
  ⟨fun c => (NarrowClassGroup.mk_surjective c).choose,
    fun c => (NarrowClassGroup.mk_surjective c).choose_spec⟩

/-- Two systems differ by totally positive scalars (`README.md`, Layer 1, 1.5). -/
theorem NarrowRepresentatives.exists_scalar (R R' : NarrowRepresentatives F)
    (c : NarrowClassGroup F) :
    ∃ α : F, IsTotallyPositive α ∧
      (R'.rep c : FractionalIdeal (𝓞 F)⁰ F) =
        FractionalIdeal.spanSingleton (𝓞 F)⁰ α * (R.rep c : FractionalIdeal (𝓞 F)⁰ F) := sorry

/-! ### Layer 2: Fourier expansions, Koecher's principle, the spaces -/

/-- `M_k(Γ)`: holomorphic functions with `f ∣_k γ = f` for all `γ ∈ Γ`, **no cusp condition**
(`README.md`, Layer 2, 2.3). -/
def modularForms (Γ : Subgroup (GL2Pos F)) (k : Weight F) :
    Submodule ℂ (UpperHalfSpace F → ℂ) where
  carrier := {f | IsHolomorphic F f ∧ ∀ γ ∈ Γ, slash F k γ f = f}
  add_mem' {f g} hf hg := ⟨hf.1.add hg.1, fun γ hγ => by
    rw [slash_add, hf.2 γ hγ, hg.2 γ hγ]⟩
  zero_mem' := ⟨differentiableOn_const 0, fun γ _ => slash_zero k γ⟩
  smul_mem' a f hf := ⟨hf.1.const_smul a, fun γ hγ => by
    rw [slash_smul, hf.2 γ hγ]⟩

/-- The point `x + i` of `ℍ^Σ`, with real part `x ∈ F_ℝ = (Σ → ℝ)` and imaginary part `1` at
every place (`README.md`, Layer 2, 2.1). -/
def basePoint (x : InfinitePlace F → ℝ) : UpperHalfSpace F :=
  fun w => ⟨x w + Complex.I, by simp⟩

/-- The box `[-T, T]^Σ ⊂ F_ℝ` (`README.md`, Layer 2, 2.1). -/
def box (T : ℝ) : Set (InfinitePlace F → ℝ) := Set.Icc (fun _ => -T) (fun _ => T)

/-- The mean of `g(x + i)` over `x ∈ [-T, T]^Σ` (`README.md`, Layer 2, 2.1). -/
def boxMean (g : UpperHalfSpace F → ℂ) (T : ℝ) : ℂ :=
  ⨍ x in box F T, g (basePoint F x)

/-- The Fourier coefficient `a(μ)` (`README.md`, Layer 2, 2.1): the limit as `T → ∞` of the mean
of `f(x + i) e(-Tr(μ(x + i)))` over the boxes `[-T, T]^Σ`. For a holomorphic `f` periodic under a
full lattice `Λ ⊂ F` this limit exists and is the README's mean over a fundamental parallelotope
of `Λ` (absolutely convergent expansion, and the box means of `e(Tr(λx))` tend to `0` for
`λ ≠ 0`), so the definition does not depend on a choice of period lattice. -/
def fourierCoeff (f : UpperHalfSpace F → ℂ) (μ : F) : ℂ :=
  Filter.limUnder Filter.atTop (boxMean F fun z => f z * expTrace F (-μ) z)

/-- The constant term `a_0(f)` (`README.md`, Layer 2, 2.4, 2.5). -/
def constantTerm (f : UpperHalfSpace F → ℂ) : ℂ := fourierCoeff F f 0

/-- The exponent lattice `(𝔟⁻¹)^∨` of the component `𝔟`, Mathlib's trace dual (`README.md`,
*Pinned conventions*, Translation lattice and exponents). -/
def dualLattice (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F :=
  FractionalIdeal.dual ℤ ℚ ((𝔟⁻¹ : (FractionalIdeal (𝓞 F)⁰ F)ˣ) : FractionalIdeal (𝓞 F)⁰ F)

omit [IsTotallyReal F] in
/-- `(𝔟⁻¹)^∨ = 𝔟 𝔡⁻¹` (`README.md`, Layer 2, 2.1): a bridge check of Mathlib's
`FractionalIdeal.dual_inv` and `coeIdeal_differentIdeal`. -/
theorem dualLattice_eq (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) :
    dualLattice F 𝔟 =
      (𝔟 : FractionalIdeal (𝓞 F)⁰ F) * ((differentIdeal ℤ (𝓞 F) : Ideal (𝓞 F)) :
        FractionalIdeal (𝓞 F)⁰ F)⁻¹ := by
  rw [dualLattice, Units.val_inv_eq_inv_val, FractionalIdeal.dual_inv,
    coeIdeal_differentIdeal (A := ℤ) (K := ℚ) (L := F) (B := 𝓞 F), inv_inv, mul_comm]

variable {F}

/-- The Fourier expansion of a component (`README.md`, Layer 2, 2.1, 2.3): absolutely convergent
over the exponent lattice, with the coefficients of `fourierCoeff`. -/
theorem hasSum_fourier {𝔫 : Ideal (𝓞 F)} {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ} {k : Weight F}
    {f : UpperHalfSpace F → ℂ} (hf : f ∈ modularForms F (Gamma0 F 𝔫 𝔟) k)
    (z : UpperHalfSpace F) :
    HasSum (fun μ : {μ : F // μ ∈ dualLattice F 𝔟} => fourierCoeff F f μ * expTrace F μ z)
      (f z) := sorry

/-- **Koecher's principle** (`README.md`, Layer 2, 2.2): for `n ≥ 2` the coefficients of a form
vanish off `{0} ∪ {μ ≫ 0}`. -/
theorem koecher (hn : 1 < Module.finrank ℚ F) {𝔫 : Ideal (𝓞 F)}
    {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ} {k : Weight F} {f : UpperHalfSpace F → ℂ}
    (hf : f ∈ modularForms F (Gamma0 F 𝔫 𝔟) k) {μ : F} (hμ : μ ≠ 0)
    (hpos : ¬ IsTotallyPositive μ) : fourierCoeff F f μ = 0 := sorry

/-- The unit law `a(εμ) = ∏_w ε_w^{k_w + m_w - 1} a(μ)` for `ε ∈ 𝒪_{F,+}^×` (`README.md`,
Layer 2, 2.3). -/
theorem fourierCoeff_unit_mul {𝔫 : Ideal (𝓞 F)} {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ}
    {k : Weight F} {f : UpperHalfSpace F → ℂ} (hf : f ∈ modularForms F (Gamma0 F 𝔫 𝔟) k)
    (ε : (𝓞 F)ˣ) (hε : ε ∈ totallyPositiveIntegerUnits (K := F)) (μ : F) :
    fourierCoeff F f (algebraMap (𝓞 F) F (ε : 𝓞 F) * μ) =
      (∏ w, (((realEmbedding F w (algebraMap (𝓞 F) F (ε : 𝓞 F)) : ℝ) : ℂ) ^
        (k.k w + k.m w - 1))) * fourierCoeff F f μ := sorry

/-- **The parity lemma** (`README.md`, Layer 2, 2.3): odd `k₀` and a unit of norm `-1` force
`M_k(Γ₀(𝔫)_𝔟) = 0`. -/
theorem modularForms_eq_bot_of_odd {𝔫 : Ideal (𝓞 F)} {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ}
    {k : Weight F} (hodd : Odd k.top) (u : (𝓞 F)ˣ) (hu : Algebra.norm ℤ (u : 𝓞 F) = -1) :
    modularForms F (Gamma0 F 𝔫 𝔟) k = ⊥ := sorry

/-- **Cuspidality in non-parallel weight** (`README.md`, Layer 2, 2.5): every constant term of a
form of non-parallel weight vanishes. -/
theorem constantTerm_slash_eq_zero_of_not_isParallel (hn : 1 < Module.finrank ℚ F)
    {𝔫 : Ideal (𝓞 F)} {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ} {k : Weight F} (hk : ¬ k.IsParallel)
    {f : UpperHalfSpace F → ℂ} (hf : f ∈ modularForms F (Gamma0 F 𝔫 𝔟) k) (γ : GL2Pos F) :
    constantTerm F (slash F k γ f) = 0 := sorry

variable (F)

/-- `S_k(Γ)`: the forms whose constant term vanishes at every cusp, that is
`a_0(f ∣_k γ) = 0` for all `γ ∈ GL₂⁺(F)` (`README.md`, Layer 2, 2.6; *Pinned conventions*, Cusp
form). The vanishing is stated as convergence of the box means of `f ∣_k γ` to `0`, together with
their integrability on every box, which holds for every holomorphic `f` since `f ∣_k γ` is then
continuous; stated this way the condition is visibly linear. -/
def cuspForms (Γ : Subgroup (GL2Pos F)) (k : Weight F) : Submodule ℂ (UpperHalfSpace F → ℂ) where
  carrier := {f | f ∈ modularForms F Γ k ∧ ∀ γ : GL2Pos F,
    (∀ T, MeasureTheory.IntegrableOn (fun x => slash F k γ f (basePoint F x)) (box F T)) ∧
      Filter.Tendsto (boxMean F (slash F k γ f)) Filter.atTop (nhds 0)}
  add_mem' {f g} hf hg := ⟨add_mem hf.1 hg.1, fun γ => by
    refine ⟨fun T => ?_, ?_⟩
    · rw [slash_add]; exact ((hf.2 γ).1 T).add ((hg.2 γ).1 T)
    · have h : boxMean F (slash F k γ (f + g)) =
          boxMean F (slash F k γ f) + boxMean F (slash F k γ g) := by
        funext T
        rw [slash_add]
        exact MeasureTheory.setAverage_add ((hf.2 γ).1 T) ((hg.2 γ).1 T)
      rw [h, ← add_zero (0 : ℂ)]
      exact (hf.2 γ).2.add (hg.2 γ).2⟩
  zero_mem' := ⟨zero_mem _, fun γ => by
    have h : boxMean F (0 : UpperHalfSpace F → ℂ) = fun _ => 0 := by
      funext T
      simp [boxMean]
    simp [slash_zero, h]⟩
  smul_mem' a f hf := ⟨Submodule.smul_mem _ a hf.1, fun γ => by
    refine ⟨fun T => ?_, ?_⟩
    · rw [slash_smul]; exact ((hf.2 γ).1 T).const_mul a
    · have h : boxMean F (slash F k γ (a • f)) = fun T => a * boxMean F (slash F k γ f) T := by
        funext T
        rw [slash_smul]
        exact MeasureTheory.average_const_mul _ a _
      rw [h, ← mul_zero a]
      exact (hf.2 γ).2.const_mul a⟩

/-- Cusp forms are modular forms (`README.md`, Layer 2, 2.6); a bridge check. -/
theorem cuspForms_le (Γ : Subgroup (GL2Pos F)) (k : Weight F) :
    cuspForms F Γ k ≤ modularForms F Γ k := fun _ hf => hf.1

/-- `M_k(𝔫; R) = ∏_c M_k(Γ₀(𝔫)_{rep c})`, the tuple space of forms of level `𝔫` (`README.md`,
Layer 2, 2.3; *Pinned conventions*, Components). -/
abbrev HilbertModularForms (𝔫 : Ideal (𝓞 F)) (k : Weight F) (R : NarrowRepresentatives F) :=
  ∀ c : NarrowClassGroup F, modularForms F (Gamma0 F 𝔫 (R.rep c)) k

variable {F}

/-- The tuple is a cusp form when every component is (`README.md`, Layer 2, 2.6). -/
def IsCuspForm {𝔫 : Ideal (𝓞 F)} {k : Weight F} {R : NarrowRepresentatives F}
    (f : HilbertModularForms F 𝔫 k R) : Prop :=
  ∀ c, (f c : UpperHalfSpace F → ℂ) ∈ cuspForms F (Gamma0 F 𝔫 (R.rep c)) k

variable (F)

/-- The cusp forms of level `𝔫` as a submodule of the tuple space (`README.md`, Layer 2, 2.6). -/
def cuspSubmodule (𝔫 : Ideal (𝓞 F)) (k : Weight F) (R : NarrowRepresentatives F) :
    Submodule ℂ (HilbertModularForms F 𝔫 k R) where
  carrier := {f | IsCuspForm f}
  add_mem' hf hg c := add_mem (hf c) (hg c)
  zero_mem' _ := zero_mem _
  smul_mem' a _ hf c := Submodule.smul_mem _ a (hf c)

open Classical in
/-- The normalized coefficient `c(𝔪, f)` as a Tau Ceti `IdealArithmeticFunction F`
(`README.md`, Layer 2, 2.4; *Pinned conventions*, Ideal coefficients): for the narrow class `c`
with `[𝔪 · rep(c) · 𝔡⁻¹] = 1` and a totally positive generator `μ` of `𝔪 · rep(c) · 𝔡⁻¹`,
`c(𝔪, f) = a_{rep c}(μ) · ∏_w σ_w(μ)^(m_w)`. Such `c` and `μ` always exist; independence of the
choice of `μ` is the theorem of 2.4. -/
def coeff {𝔫 : Ideal (𝓞 F)} {k : Weight F} {R : NarrowRepresentatives F}
    (f : HilbertModularForms F 𝔫 k R) : IdealArithmeticFunction F := fun 𝔪 =>
  if h : ∃ (c : NarrowClassGroup F) (μ : F), IsTotallyPositive μ ∧
      FractionalIdeal.spanSingleton (𝓞 F)⁰ μ =
        ((𝔪 : Ideal (𝓞 F)) : FractionalIdeal (𝓞 F)⁰ F) * (R.rep c : FractionalIdeal (𝓞 F)⁰ F) *
          ((differentIdeal ℤ (𝓞 F) : Ideal (𝓞 F)) : FractionalIdeal (𝓞 F)⁰ F)⁻¹ then
    fourierCoeff F (f h.choose : UpperHalfSpace F → ℂ) h.choose_spec.choose *
      ∏ w, ((realEmbedding F w h.choose_spec.choose : ℝ) : ℂ) ^ (k.m w)
  else 0


/-- `c(𝔪, f)` extended by `0` to every ideal, through Tau Ceti's `zeroExtend` (`README.md`,
Layer 2, 2.4). -/
def coeffIdeal {𝔫 : Ideal (𝓞 F)} {k : Weight F} {R : NarrowRepresentatives F}
    (f : HilbertModularForms F 𝔫 k R) (𝔪 : Ideal (𝓞 F)) : ℂ :=
  IdealArithmeticFunction.zeroExtend (coeff F f) 𝔪

variable {F}

/-- In parallel weight, `c(𝔪, f)` is the Fourier coefficient of the component of the class of
`𝔪⁻¹𝔡` at a totally positive generator `μ` of `𝔪 · rep(c) · 𝔡⁻¹` (`README.md`, Layer 2, 2.4). -/
theorem coeff_eq_fourierCoeff {𝔫 : Ideal (𝓞 F)} {k : Weight F} (hk : k.IsParallel)
    {R : NarrowRepresentatives F} (f : HilbertModularForms F 𝔫 k R) (𝔪 : (Ideal (𝓞 F))⁰)
    (c : NarrowClassGroup F) (μ : F) (hμ : IsTotallyPositive μ)
    (hgen : FractionalIdeal.spanSingleton (𝓞 F)⁰ μ =
      ((𝔪 : Ideal (𝓞 F)) : FractionalIdeal (𝓞 F)⁰ F) * (R.rep c : FractionalIdeal (𝓞 F)⁰ F) *
        ((differentIdeal ℤ (𝓞 F) : Ideal (𝓞 F)) : FractionalIdeal (𝓞 F)⁰ F)⁻¹) :
    coeff F f 𝔪 = fourierCoeff F (f c) μ := sorry

/-- `f ↦ c(·, f)` is linear (`README.md`, Layer 2, 2.4). -/
theorem coeff_add {𝔫 : Ideal (𝓞 F)} {k : Weight F} {R : NarrowRepresentatives F}
    (f g : HilbertModularForms F 𝔫 k R) : coeff F (f + g) = coeff F f + coeff F g := sorry

/-- `f ↦ c(·, f)` is injective (`README.md`, Layer 2, 2.4). -/
theorem coeff_injective (𝔫 : Ideal (𝓞 F)) (k : Weight F) (R : NarrowRepresentatives F) :
    Function.Injective (coeff F : HilbertModularForms F 𝔫 k R → IdealArithmeticFunction F) :=
  sorry


/-! ### Layer 3: reduction theory and finite dimensionality -/

/-- The Hecke bound `|c(𝔪, f)| ≤ C_f N𝔪^{k₀/2}` for cusp forms (`README.md`, Layer 3, 3.3). -/
theorem exists_norm_coeff_le (hn : 1 < Module.finrank ℚ F) {𝔫 : Ideal (𝓞 F)} {k : Weight F}
    {R : NarrowRepresentatives F} {f : HilbertModularForms F 𝔫 k R} (hf : IsCuspForm f) :
    ∃ C : ℝ, ∀ 𝔪 : (Ideal (𝓞 F))⁰,
      ‖coeff F f 𝔪‖ ≤ C * (Ideal.absNorm (𝔪 : Ideal (𝓞 F)) : ℝ) ^ ((k.top : ℝ) / 2) := sorry

/-- **Finite dimensionality** of `S_k(Γ₀(𝔫)_𝔟)` (`README.md`, Layer 3, 3.5). -/
theorem finiteDimensional_cuspForms (hn : 1 < Module.finrank ℚ F) (𝔫 : Ideal (𝓞 F)) (h𝔫 : 𝔫 ≠ ⊥)
    (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) (k : Weight F) :
    FiniteDimensional ℂ (cuspForms F (Gamma0 F 𝔫 𝔟) k) := sorry

/-- **Finite dimensionality** of `M_k(Γ₀(𝔫)_𝔟)` (`README.md`, Layer 3, 3.5). -/
theorem finiteDimensional_modularForms (hn : 1 < Module.finrank ℚ F) (𝔫 : Ideal (𝓞 F))
    (h𝔫 : 𝔫 ≠ ⊥) (𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ) (k : Weight F) :
    FiniteDimensional ℂ (modularForms F (Gamma0 F 𝔫 𝔟) k) := sorry

/-- The tuple space is finite dimensional (`README.md`, Layer 3, 3.5). -/
theorem finiteDimensional_hilbertModularForms (hn : 1 < Module.finrank ℚ F) (𝔫 : Ideal (𝓞 F))
    (h𝔫 : 𝔫 ≠ ⊥) (k : Weight F) (R : NarrowRepresentatives F) :
    FiniteDimensional ℂ (HilbertModularForms F 𝔫 k R) := sorry

/-- The Riesz input of 3.5: a normed space whose closed unit ball is compact is finite
dimensional (`README.md`, Layer 3, 3.5). A bridge check of Mathlib's
`FiniteDimensional.of_isCompact_closedBall₀`, with the instances the README promises. -/
theorem finiteDimensional_of_isCompact_closedBall {V : Type*} [NormedAddCommGroup V]
    [InnerProductSpace ℂ V] (h : IsCompact (Metric.closedBall (0 : V) 1)) :
    FiniteDimensional ℂ V :=
  FiniteDimensional.of_isCompact_closedBall₀ ℂ one_pos h

/-- For `k₀ ≤ 0` the only forms are the constants in weight `0` (`README.md`, Layer 3, 3.5). -/
theorem modularForms_eq_bot_of_top_neg (hn : 1 < Module.finrank ℚ F) {𝔫 : Ideal (𝓞 F)}
    {𝔟 : (FractionalIdeal (𝓞 F)⁰ F)ˣ} {k : Weight F} (hk : k.top < 0) :
    modularForms F (Gamma0 F 𝔫 𝔟) k = ⊥ := sorry


/-! ### Layer 5: the narrow class of a prime -/

/-- The narrow class `[𝔭]` of a prime ideal, at which central characters are evaluated
(`README.md`, Layer 5, 5.2). -/
def narrowClass (𝔭 : HeightOneSpectrum (𝓞 F)) : NarrowClassGroup F :=
  NarrowClassGroup.mk0 ⟨𝔭.asIdeal, mem_nonZeroDivisors_of_ne_zero 𝔭.ne_bot⟩

/-! ### Layer 8: `L`-series -/

variable (F) in
/-- `L(f, s) = Σ_𝔪 c(𝔪, f) N𝔪^(-s)`, Mathlib's `LSeries` of Tau Ceti's `normCoeff` of the
coefficient function (`README.md`, Layer 8, 8.1; *Pinned conventions*, `L`-function). -/
def LFunction {𝔫 : Ideal (𝓞 F)} {k : Weight F} {R : NarrowRepresentatives F}
    (f : HilbertModularForms F 𝔫 k R) (s : ℂ) : ℂ :=
  LSeries (normCoeff F (coeff F f)) s

/-! ### Layer 9: the polynomials of the base-change relation -/

/-- `h^{(r)}`: for a polynomial `h` with `h(0) = 1`, written `∏ (1 - ρ⁻¹ T)` over its roots, the
polynomial `∏ (1 - ρ^(-r) T)` whose inverse roots are the `r`-th powers (`README.md`, Layer 9,
9.4; the knowl `mf.base_change`). -/
def powRoots (h : Polynomial ℂ) (r : ℕ) : Polynomial ℂ :=
  (h.roots.map fun ρ => 1 - Polynomial.C (ρ⁻¹ ^ r) * Polynomial.X).prod

/-- The local factor of a classical newform, `1 - a_p T + χ(p) p^(κ - 1) T²`, from Tau Ceti's
`HeckeRing.GL2.Newform` and its `dirichletLift` (`README.md`, Layer 9, 9.4; the Modular Forms
roadmap's Layer 7). -/
def classicalLocalFactor {N : ℕ} [NeZero N] {κ : ℤ} (f : HeckeRing.GL2.Newform N κ) (p : ℕ) :
    Polynomial ℂ :=
  open Polynomial in
  1 - C ((qExpansion 1 (f.toCuspForm : ℍ → ℂ)).coeff p) * X +
    C (f.dirichletLift p * (p : ℂ) ^ (κ - 1)) * X ^ 2

end TauCetiRoadmap.HilbertModularForm
