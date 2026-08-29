import Mathlib
import TauCeti.NumberTheory.ModularForms.DiamondOperators
import TauCeti.NumberTheory.ModularForms.LevelOne.GradedRing
import TauCetiRoadmap.IntegralLattices.Suggested

/-!
# Theta series of lattices: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. The declarations below suggest Lean forms for the load-bearing milestones, so that
contributors and reviewers converge on the carrier, the conventions, and the shape of the two
modularity theorems. Discharging every declaration here would finish neither a layer nor the
roadmap. `sorry` is permitted in this human-owned repository: these are targets, not
implementations.

The carrier is a full `ℤ`-lattice in a finite-dimensional **real inner product space**, expressed
by `Submodule ℤ E` with Mathlib's `IsZLattice ℝ L` — deliberately *not* the rational carrier of the
[integral-lattices roadmap](../IntegralLattices/README.md), because the theta series needs a real
norm to converge and Poisson summation needs the covolume. The bridge between the two models is
`ratModel` below, stated against that roadmap's `IntegralLattice` (imported from its
`Suggested.lean`), and all discriminant-form theory is consumed across it.

Three conventions are visible in every signature and are the point of seeding this file at all.
First, the exponent is `π * I * ‖v‖ ^ 2 * τ`, so that for an even lattice the `q`-expansion is
indexed by `‖v‖ ^ 2 / 2` and matches `E₄` and `Δ` without a rescaling. Second, rank is arbitrary
through the theta series (Layers 1–3) and **even**, `n = 2 * k`, from the transformation laws on,
so every automorphy factor is `(-I) ^ k * τ ^ k` at `Monoid.npow`: `Complex.cpow` occurs only in
the general-rank Fourier transform of the Gaussian, never in a modularity statement. Third, the
general-level theorem is reached through Schoeneberg's coset splitting and the Gauss sums of
Layer 6, not through a Weil representation, so no declaration here quantifies over a
finite-quadratic-module signature or a presentation of `SL(2, ℤ)`.

Some of these names are consumed by other roadmaps and are not free to drift. The L-functions
roadmap takes `poissonSummation`, `summable_poisson_left`, `summable_poisson_right`, `gaussian`,
`gaussian_apply`, `fourier_gaussian`, `dual`, `dual_dual` and `covolume_dual`; the
integral-lattices roadmap takes `thetaSeries`, `thetaCoset`, `thetaCosetClass`,
`summable_thetaSeries`, `hasSum_thetaSeries`, `qExpansion_thetaSeries_coeff`, `hasSum_thetaCoset`,
`thetaSeries_orthSum`, `thetaSeries_scale`, `thetaSeries_int`, `thetaSeries_add_one`,
`thetaSeries_add_two`, `thetaCoset_add_one`, `thetaSeries_neg_inv`, `thetaCoset_neg_inv`,
`thetaCosetClass_neg_inv`, `pairingChar` and `covolume_eq_sqrt_natCard_discGroup`. Each cites the
name rather than restating the statement, so renaming one of them edits another specification.
-/

namespace TauCetiRoadmap.ThetaSeries

open Complex Real MeasureTheory ModularForm CongruenceSubgroup
open UpperHalfPlane hiding I
open scoped MatrixGroups RealInnerProductSpace SchwartzMap FourierTransform Manifold
open scoped ArithmeticFunction.sigma TensorProduct

noncomputable section

variable {E F : Type*}
  [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]

/-! ## Layer 1: Poisson summation for a lattice

Independent of the lattice vocabulary of Layer 2; only the dual lattice is needed, and that is
Mathlib's `dualSubmodule`. The measurable structure on `E` (which makes `volume` the Haar measure
normalised by orthonormal bases) is assumed only where `volume` or `𝓕` occurs. -/

section Poisson

/-- The dual lattice, literally Mathlib's `BilinForm.dualSubmodule` for the inner product.
There is no second dual-lattice notion in this development. -/
def dual (L : Submodule ℤ E) : Submodule ℤ E := LinearMap.BilinForm.dualSubmodule (innerₗ E) L

@[inherit_doc] scoped notation:max L "^∨" => TauCetiRoadmap.ThetaSeries.dual L

/-- The standard lattice `ℤ ^ n ⊆ ℝ ^ n`, the base case of Poisson summation. -/
def stdLattice (n : ℕ) : Submodule ℤ (EuclideanSpace ℝ (Fin n)) :=
  Submodule.span ℤ (Set.range (EuclideanSpace.basisFun (Fin n) ℝ))

instance (n : ℕ) : DiscreteTopology (stdLattice n) := sorry
instance (n : ℕ) : IsZLattice ℝ (stdLattice n) := sorry

theorem dual_stdLattice (n : ℕ) : (stdLattice n)^∨ = stdLattice n := sorry

variable [MeasurableSpace E] [BorelSpace E]

/-- **1B, the standard lattice.** Mathlib's one-dimensional theorem
(`SchwartzMap.tsum_eq_tsum_fourierIntegral`) applied once per coordinate, with the partial
Schwartz and partial Fourier-transform lemmas of `README.md`, Layer 1B, as the intermediate
targets. -/
theorem poissonSummation_stdLattice (n : ℕ) (f : 𝓢(EuclideanSpace ℝ (Fin n), ℂ))
    (v : EuclideanSpace ℝ (Fin n)) :
    ∑' ℓ : stdLattice n, f (v + (ℓ : EuclideanSpace ℝ (Fin n))) =
      ∑' m : stdLattice n, 𝓕 (fun x => f x) (m : EuclideanSpace ℝ (Fin n)) *
        cexp (2 * π * I * ⟪v, (m : EuclideanSpace ℝ (Fin n))⟫) := sorry

/-- **1C, Fourier change of variables** under a linear automorphism of `E`: the transform of
`f ∘ A` is `|det A|⁻¹` times the transform of `f` composed with the adjoint of `A⁻¹`. Mathlib has
the isometry case; this is the general one. -/
theorem fourierIntegral_comp_equiv (A : E ≃L[ℝ] E) (f : E → ℂ) (y : E) :
    𝓕 (f ∘ A) y =
      (|LinearMap.det ((A : E →L[ℝ] E) : E →ₗ[ℝ] E)|)⁻¹ *
        𝓕 f (ContinuousLinearMap.adjoint (A.symm : E →L[ℝ] E) y) := sorry

/-- The image of a lattice under a linear automorphism, as a `ℤ`-submodule. -/
def mapEquiv (A : E ≃L[ℝ] E) (L : Submodule ℤ E) : Submodule ℤ E :=
  L.map (((A : E →L[ℝ] E) : E →ₗ[ℝ] E).restrictScalars ℤ)

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

instance (A : E ≃L[ℝ] E) : DiscreteTopology (mapEquiv A L) := sorry
instance (A : E ≃L[ℝ] E) : IsZLattice ℝ (mapEquiv A L) := sorry

/-- **1D, dual-lattice transport**: the dual of `A L` is the image of `L^∨` under the adjoint of
`A⁻¹`. -/
theorem dual_mapEquiv (A : E ≃L[ℝ] E) :
    (mapEquiv A L)^∨ =
      (L^∨).map
        ((ContinuousLinearMap.adjoint (A.symm : E →L[ℝ] E) : E →ₗ[ℝ] E).restrictScalars ℤ) :=
  sorry

/-- **1D**, the covolume scales by `|det A|`. -/
theorem covolume_mapEquiv (A : E ≃L[ℝ] E) :
    ZLattice.covolume (mapEquiv A L) volume =
      |LinearMap.det ((A : E →L[ℝ] E) : E →ₗ[ℝ] E)| * ZLattice.covolume L volume := sorry

/-- **1A, Poisson summation for a full-rank `ℤ`-lattice.** Mathlib has the case `ℤ ⊆ ℝ` only;
this is the general statement, assembled from 1B–1D by a linear change of variables, not by
induction on the dimension.

⚠ The sign of the character is fixed by Mathlib's `𝓕`, which carries `exp (-2 π i ⟪x, y⟫)`; sources
writing `exp (-2 π i ⟪v, m⟫)` on the right agree after `m ↦ -m`.

⚠ The hypotheses are exactly `[InnerProductSpace ℝ E] [FiniteDimensional ℝ E]` plus the Borel
structure, and they are not weakened for a consumer whose own space is not an inner product space
— Mathlib's `NumberField.mixedEmbedding.mixedSpace` carries a product sup norm, for instance.
Such a consumer applies this theorem in a model that is one and transports along a linear isometry;
the transport is the consumer's target, not this one's. -/
theorem poissonSummation (f : 𝓢(E, ℂ)) (v : E) :
    ∑' ℓ : L, f (v + (ℓ : E)) =
      (ZLattice.covolume L volume)⁻¹ *
        ∑' m : L^∨, 𝓕 (fun x : E => f x) (m : E) * cexp (2 * π * I * ⟪v, (m : E)⟫) := sorry

/-- **1E**, summability of the lattice side on its own. -/
theorem summable_poisson_left (f : 𝓢(E, ℂ)) (v : E) :
    Summable fun ℓ : L => f (v + (ℓ : E)) := sorry

/-- **1E**, summability of the dual side on its own. -/
theorem summable_poisson_right (f : 𝓢(E, ℂ)) (v : E) :
    Summable fun m : L^∨ => 𝓕 (fun x : E => f x) (m : E) * cexp (2 * π * I * ⟪v, (m : E)⟫) :=
  sorry

/-- **1F**, the Gaussian on `E`, Schwartz for `0 < τ.im`. -/
def gaussian (τ : ℍ) : 𝓢(E, ℂ) := sorry

theorem gaussian_apply (τ : ℍ) (x : E) : gaussian τ x = cexp (π * I * (‖x‖ ^ 2 : ℝ) * τ) := sorry

/-- **1F**, the Fourier transform of the Gaussian at arbitrary rank. This is the one place
`Complex.cpow` appears, and it is not a modularity statement. -/
theorem fourier_gaussian (τ : ℍ) (y : E) :
    𝓕 (fun x : E => (gaussian τ : E → ℂ) x) y =
      ((τ : ℂ) / I) ^ (-(Module.finrank ℝ E : ℂ) / 2) *
        cexp (π * I * (‖y‖ ^ 2 : ℝ) * (-1 / (τ : ℂ))) := sorry

/-- **1F**, the same at even rank `n = 2 * k`, with the exponent an honest `Monoid.npow`: the shape
Layer 4 consumes. Mathlib's inner-product-space Gaussian Fourier transform is the input; this is
a repackaging, not a reproof. -/
theorem fourier_gaussian_of_even (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (τ : ℍ) (y : E) :
    𝓕 (fun x : E => (gaussian τ : E → ℂ) x) y =
      ((-I) ^ k * (τ : ℂ) ^ k)⁻¹ * cexp (π * I * (‖y‖ ^ 2 : ℝ) * (-1 / (τ : ℂ))) := sorry

end Poisson

/-! ## Layer 2: the real lattice model and its arithmetic invariants -/

section Model

variable (L : Submodule ℤ E)

/-- Integrality. The definition of record is the submodule inequality; the elementwise form is
`isIntegral_iff` below. -/
def IsIntegral : Prop := L ≤ L^∨

theorem isIntegral_iff : IsIntegral L ↔ ∀ x ∈ L, ∀ y ∈ L, ∃ m : ℤ, ⟪x, y⟫ = (m : ℝ) := sorry

/-- Evenness: every norm is an even integer. Not implied by, and strictly stronger than,
`IsIntegral`. -/
def IsEven : Prop := ∀ x ∈ L, ∃ m : ℤ, ‖x‖ ^ 2 = 2 * (m : ℝ)

theorem isIntegral_of_isEven (h : IsEven L) : IsIntegral L := sorry

/-- Unimodularity is self-duality. That it is equivalent to `covolume = 1` for an integral lattice
is `isUnimodular_iff_covolume_eq_one`, a theorem, not an alternative definition. -/
def IsUnimodular : Prop := L = L^∨

/-- The discriminant group of the real model, the literal quotient `L^∨ ⧸ L`. Its bilinear and
quadratic forms are *not* redefined here: they are the integral-lattices roadmap's, transported
across `ratModel` below. -/
abbrev discGroup : Type _ := L^∨ ⧸ L.comap (L^∨).subtype

/-- The scaled lattice `c • L`. -/
def scale (c : ℝ) : Submodule ℤ E := L.map ((LinearMap.lsmul ℝ E c).restrictScalars ℤ)

variable [DiscreteTopology L] [IsZLattice ℝ L]

instance : DiscreteTopology (L^∨) := sorry
instance : IsZLattice ℝ (L^∨) := sorry

theorem dual_dual : (L^∨)^∨ = L := sorry

instance : Finite (discGroup L) := sorry

instance : Fintype (discGroup L) := Fintype.ofFinite _

/-! ### Scaling is not an invariance -/

instance (c : ℝ) [NeZero c] : DiscreteTopology (scale L c) := sorry
instance (c : ℝ) [NeZero c] : IsZLattice ℝ (scale L c) := sorry

theorem dual_scale {c : ℝ} (hc : 0 < c) : (scale L c)^∨ = scale (L^∨) c⁻¹ := sorry

theorem scale_neg (c : ℝ) : scale L (-c) = scale L c := sorry

/-- The exact criterion for a scaled lattice to be integral. -/
theorem isIntegral_scale_iff (c : ℝ) :
    IsIntegral (scale L c) ↔ ∀ x ∈ L, ∀ y ∈ L, ∃ m : ℤ, c ^ 2 * ⟪x, y⟫ = (m : ℝ) := sorry

theorem isIntegral_scale_sqrt (h : IsIntegral L) (m : ℕ) : IsIntegral (scale L (√(m : ℝ))) := sorry

theorem isEven_scale_sqrt_of_isEven (h : IsEven L) (m : ℕ) : IsEven (scale L (√(m : ℝ))) := sorry

theorem isEven_scale_sqrt_of_even (h : IsIntegral L) {m : ℕ} (hm : Even m) :
    IsEven (scale L (√(m : ℝ))) := sorry

/-- `√m • L` is never unimodular for `m > 1`: `√2 • E₈` is even and integral and not unimodular. -/
theorem not_isUnimodular_scale_sqrt (h : IsIntegral L) {m : ℕ} (hm : 1 < m) :
    ¬ IsUnimodular (scale L (√(m : ℝ))) := sorry

/-! ### The level -/

/-- The level of an even lattice: the least `N > 0` with `N * ‖x‖ ^ 2 / 2 ∈ ℤ` for every `x` in the
dual. Equivalently the order of the discriminant quadratic form. Junk (`0`) off `IsEven`. -/
def level : ℕ :=
  sInf {N : ℕ | 0 < N ∧ ∀ x ∈ L^∨, ∃ m : ℤ, (N : ℝ) * ‖x‖ ^ 2 / 2 = m}

theorem level_pos (h : IsEven L) : 0 < level L := sorry

theorem level_eq_one_iff (h : IsEven L) : level L = 1 ↔ IsUnimodular L := sorry

/-- The level controls the dual inclusion `N • L^∨ ≤ L`. -/
theorem scale_level_dual_le (h : IsEven L) : scale (L^∨) (level L) ≤ L := sorry

theorem natCard_discGroup_dvd_level_pow (h : IsEven L) :
    Nat.card (discGroup L) ∣ level L ^ Module.finrank ℝ E := sorry

theorem level_dvd_two_mul_natCard_discGroup (h : IsEven L) :
    level L ∣ 2 * Nat.card (discGroup L) := sorry

/-- The Fricke partner `√N • L^∨` is even and its level **divides** `N`. ⚠ Equality is false in
general: `√2 • E₈` has level `2`, and `√2 • (√2 • E₈)^∨ = E₈` has level `1`. The exact value,
`N / gcd (N, content L)`, is stated in `README.md`, Layer 2F. -/
theorem isEven_scale_sqrt_level_dual (h : IsEven L) :
    IsEven (scale (L^∨) (√(level L : ℝ))) := sorry

theorem level_scale_sqrt_level_dual_dvd (h : IsEven L) :
    haveI : NeZero (√(level L : ℝ)) := ⟨by sorry⟩
    level (scale (L^∨) (√(level L : ℝ))) ∣ level L := sorry

/-! ### Shells and representation numbers -/

/-- The shell of squared norm `t`, as a `Set` with a finiteness theorem — not a `Finset` behind a
decidability instance, since the finiteness is the content. -/
def shell (t : ℝ) : Set E := {v : E | v ∈ L ∧ ‖v‖ ^ 2 = t}

theorem finite_shell (t : ℝ) : (shell L t).Finite := sorry

/-- The representation numbers. -/
def repNum (t : ℝ) : ℕ := (shell L t).ncard

theorem repNum_zero : repNum L 0 = 1 := sorry

/-- The shell of the coset `γ + L`. -/
def cosetShell (γ : E) (t : ℝ) : Set E := {v : E | v ∈ L ∧ ‖γ + v‖ ^ 2 = t}

theorem finite_cosetShell (γ : E) (t : ℝ) : (cosetShell L γ t).Finite := sorry

/-- The coset representation numbers `r_{γ+L}(t)`. -/
def cosetRepNum (γ : E) (t : ℝ) : ℕ := (cosetShell L γ t).ncard

/-- **The support congruence.** For even `L` of level `N` and `γ ∈ L^∨`, a coset shell of squared
norm `2 m / N` is empty unless `m ≡ N q_L(γ) (mod N)`, where `N ‖γ‖² / 2` is the integer `j`.
⚠ `q_L(γ)` fixes the congruence class of the exponents, not the first exponent. -/
theorem cosetRepNum_eq_zero_of_not_modEq (h : IsEven L) {γ : E} (hγ : γ ∈ L^∨) {m : ℕ}
    {j : ℤ} (hj : (level L : ℝ) * ‖γ‖ ^ 2 / 2 = j) (hm : (m : ZMod (level L)) ≠ (j : ZMod (level L))) :
    cosetRepNum L γ (2 * m / level L) = 0 := sorry

theorem shell_eq_empty_of_isEven (h : IsEven L) {t : ℝ} (ht : ¬ ∃ m : ℕ, t = 2 * m) :
    shell L t = ∅ := sorry

/-! ### Covolume, determinant, index -/

variable [MeasurableSpace E] [BorelSpace E]

/-- The determinant of a lattice: the square of the covolume. For an integral lattice this is a
positive integer, equal to `|det Gram|` and to `[L^∨ : L]`. -/
def det : ℝ := (ZLattice.covolume L volume) ^ 2

theorem covolume_dual : ZLattice.covolume (L^∨) volume = (ZLattice.covolume L volume)⁻¹ := sorry

theorem exists_det_eq_natCast (h : IsIntegral L) : ∃ d : ℕ, 0 < d ∧ det L = d := sorry

theorem natCard_discGroup (h : IsIntegral L) : (Nat.card (discGroup L) : ℝ) = det L := sorry

/-- The bridge a consumer needs: the sphere-packing predicate `covolume = 1` on an integral lattice
*is* self-duality. -/
theorem isUnimodular_iff_covolume_eq_one (h : IsIntegral L) :
    IsUnimodular L ↔ ZLattice.covolume L volume = 1 := sorry

theorem det_scale {c : ℝ} (hc : 0 < c) :
    haveI : NeZero c := ⟨hc.ne'⟩
    det (scale L c) = c ^ (2 * Module.finrank ℝ E) * det L := sorry

/-- `det (√N • L^∨) = N ^ n / det L`. -/
theorem det_scale_sqrt_level_dual (h : IsEven L) :
    haveI : NeZero (√(level L : ℝ)) := ⟨by sorry⟩
    det (scale (L^∨) (√(level L : ℝ))) = (level L : ℝ) ^ Module.finrank ℝ E / det L := sorry

end Model

/-! ### Orthogonal direct sums, in `WithLp 2 (E × F)` -/

section OrthSum

variable (L : Submodule ℤ E) (M : Submodule ℤ F)

/-- The external orthogonal direct sum of two lattices. -/
def orthSum : Submodule ℤ (WithLp 2 (E × F)) :=
  (L.prod M).comap (WithLp.linearEquiv 2 ℤ (E × F)).toLinearMap

variable [DiscreteTopology L] [IsZLattice ℝ L] [DiscreteTopology M] [IsZLattice ℝ M]

instance : DiscreteTopology (orthSum L M) := sorry
instance : IsZLattice ℝ (orthSum L M) := sorry

theorem isEven_orthSum (hL : IsEven L) (hM : IsEven M) : IsEven (orthSum L M) := sorry

theorem isUnimodular_orthSum (hL : IsUnimodular L) (hM : IsUnimodular M) :
    IsUnimodular (orthSum L M) := sorry

/-- The shell convolution for even lattices, a finite sum over `ℕ`. The general real-lattice
version is a sum over the finite set of represented norms `≤ t` (`README.md`, Layer 2G). -/
theorem repNum_orthSum (hL : IsEven L) (hM : IsEven M) (m : ℕ) :
    repNum (orthSum L M) (2 * m) =
      ∑ i ∈ Finset.range (m + 1), repNum L (2 * i) * repNum M (2 * (m - i)) := sorry

end OrthSum

/-! ### The bridge to the rational carrier of the integral-lattices roadmap

The `ℤ`-bilinear integral form on `L` base-changes to `ℚ ⊗[ℤ] L`, giving an `IntegralLattice` in
the sense of that roadmap (its 0A); the dual (1B), discriminant group (1C) and discriminant forms
(1D) computed there agree with those computed in `E`, and the level agrees with its 1J. This is
the *only* place the two models are compared; afterwards, discriminant-form facts are quoted
across it and never reproved in `E`. -/

section Bridge

open TauCetiRoadmap.IntegralLattices

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- The inner product restricted to an integral lattice, as an integer-valued bilinear form. -/
def integralForm (h : IsIntegral L) : LinearMap.BilinForm ℤ L := sorry

theorem integralForm_apply (h : IsIntegral L) (x y : L) :
    ((integralForm L h x y : ℤ) : ℝ) = ⟪(x : E), (y : E)⟫ := sorry

/-- **2D, the bridge.** The rational model of an integral real lattice: carrier the image of
`L` in `ℚ ⊗[ℤ] L`, form the base change of `integralForm`. -/
def ratModel (h : IsIntegral L) : IntegralLattice (ℚ ⊗[ℤ] L) where
  carrier := LinearMap.range (TensorProduct.mk ℤ ℚ L 1)
  isLattice := sorry
  form := (integralForm L h).baseChange ℚ
  isSymm := sorry
  integral := sorry

instance (h : IsIntegral L) : (ratModel L h).IsNondegenerate := sorry

theorem ratModel_isEven_iff (h : IsIntegral L) : (ratModel L h).IsEven ↔ IsEven L := sorry

theorem ratModel_isUnimodular_iff (h : IsIntegral L) :
    (ratModel L h).IsUnimodular ↔ IsUnimodular L := sorry

/-- The discriminant groups of the two models agree, as an additive equivalence. -/
def discGroupEquiv (h : IsIntegral L) : discGroup L ≃+ (ratModel L h).DiscriminantGroup := sorry

/-- The equivalence carries the real pairing `⟪γ, δ⟫ mod ℤ` to the rational discriminant pairing:
on representatives `γ δ ∈ L^∨`, the value `(ratModel L h).discriminantPairing` at their classes is
the class of the rational number `⟪γ, δ⟫` (which is rational because `γ, δ ∈ L^∨` and `L` spans). -/
theorem discGroupEquiv_pairing (h : IsIntegral L) (γ δ : L^∨) {r : ℚ}
    (hr : (r : ℝ) = ⟪(γ : E), (δ : E)⟫) :
    (ratModel L h).discriminantPairing
        (discGroupEquiv L h (Submodule.Quotient.mk γ))
        (discGroupEquiv L h (Submodule.Quotient.mk δ)) =
      (↑r : AddCircle (1 : ℚ)) := sorry

/-- For an even lattice the equivalence carries `‖γ‖² / 2 mod ℤ` to the half-norm discriminant
quadratic form. -/
theorem discGroupEquiv_quadratic (h : IsIntegral L) (he : IsEven L) (γ : L^∨) {r : ℚ}
    (hr : (r : ℝ) = ‖(γ : E)‖ ^ 2 / 2) :
    (ratModel L h).discriminantQuadraticForm ((ratModel_isEven_iff L h).mpr he)
        (discGroupEquiv L h (Submodule.Quotient.mk γ)) =
      (↑r : AddCircle (1 : ℚ)) := sorry

/-- The level of the real model is the order of the rational discriminant quadratic form. -/
theorem level_eq_addOrderOf_quadratic (h : IsIntegral L) (he : IsEven L) :
    level L =
      addOrderOf ((ratModel L h).discriminantQuadraticForm ((ratModel_isEven_iff L h).mpr he)) :=
  sorry

variable [MeasurableSpace E] [BorelSpace E]

theorem natCard_discriminantGroup_ratModel (h : IsIntegral L) :
    (Nat.card (ratModel L h).DiscriminantGroup : ℝ) = det L := sorry

end Bridge

/-! ### The Kronecker symbol

Mathlib's `jacobiSym` handles odd denominators only; the Kronecker symbol extends it to all of `ℤ`
and is a Layer-2 target in its own right, independent of any lattice. ⚠ Nothing here produces a
character modulo the *level*: `kroneckerChar D` lives at modulus `|D|`, and the passage to the
level is the conductor theorem of Layer 6. -/

section Kronecker

/-- The Kronecker symbol `(a / b)`: the completely multiplicative extension of `jacobiSym` to all
`b : ℤ`, with the standard values at `2`, `-1`, and `0`. -/
def kroneckerSym (a b : ℤ) : ℤ := sorry

theorem kroneckerSym_eq_jacobiSym (a : ℤ) {b : ℕ} (hb : Odd b) :
    kroneckerSym a b = jacobiSym a b := sorry

theorem kroneckerSym_mul_right (a b c : ℤ) :
    kroneckerSym a (b * c) = kroneckerSym a b * kroneckerSym a c := sorry

/-- For a discriminant `D ≡ 0, 1 (mod 4)`, `D ≠ 0`, the Kronecker symbol `(D / ·)` is periodic
modulo `|D|` and defines a quadratic Dirichlet character at that modulus. -/
def kroneckerChar (D : ℤ) (hD : D ≡ 0 [ZMOD 4] ∨ D ≡ 1 [ZMOD 4]) (hD₀ : D ≠ 0) :
    DirichletCharacter ℂ D.natAbs := sorry

theorem kroneckerChar_intCast (D : ℤ) (hD : D ≡ 0 [ZMOD 4] ∨ D ≡ 1 [ZMOD 4]) (hD₀ : D ≠ 0)
    (a : ℤ) : kroneckerChar D hD hD₀ (a : ZMod D.natAbs) = (kroneckerSym D a : ℂ) := sorry

theorem kroneckerChar_isQuadratic (D : ℤ) (hD : D ≡ 0 [ZMOD 4] ∨ D ≡ 1 [ZMOD 4]) (hD₀ : D ≠ 0) :
    MulChar.IsQuadratic (kroneckerChar D hD hD₀) := sorry

theorem kroneckerChar_neg_one (D : ℤ) (hD : D ≡ 0 [ZMOD 4] ∨ D ≡ 1 [ZMOD 4]) (hD₀ : D ≠ 0) :
    kroneckerChar D hD hD₀ (-1) = (SignType.sign D : ℂ) := sorry

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- The signed discriminant `D_L = (-1)^k * det L` of an even lattice of rank `2 * k`, as an
integer: `det L` is the order of the discriminant group. -/
def signedDisc (k : ℕ) : ℤ := (-1) ^ k * (Nat.card (discGroup L) : ℤ)

theorem signedDisc_ne_zero (k : ℕ) : signedDisc L k ≠ 0 := sorry

/-- For an even lattice of rank `2k`, the signed discriminant is `≡ 0` or `1 (mod 4)`. This is
what makes the Kronecker character exist at modulus `|D_L|`. -/
theorem signedDisc_modEq (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) :
    signedDisc L k ≡ 0 [ZMOD 4] ∨ signedDisc L k ≡ 1 [ZMOD 4] := sorry

end Kronecker

/-! ## Layer 3: the theta series

Rank is arbitrary throughout this section. -/

section Theta

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- The theta series of a lattice. ⚠ The exponent is `π I ‖v‖² τ`, not `2 π I ‖v‖² τ`. -/
def thetaSeries (τ : ℍ) : ℂ := ∑' v : L, cexp (π * I * (‖(v : E)‖ ^ 2 : ℝ) * τ)

/-- The theta series of a translate of `L`. For `γ ∈ L^∨` it is the coset series `θ_{γ+L}`,
depending only on the class of `γ` in `L^∨ ⧸ L` (`thetaCoset_add_mem`). -/
def thetaCoset (γ : E) (τ : ℍ) : ℂ := ∑' v : L, cexp (π * I * (‖γ + (v : E)‖ ^ 2 : ℝ) * τ)

theorem summable_thetaSeries (τ : ℍ) :
    Summable fun v : L => cexp (π * I * (‖(v : E)‖ ^ 2 : ℝ) * τ) := sorry

theorem summable_thetaCoset (γ : E) (τ : ℍ) :
    Summable fun v : L => cexp (π * I * (‖γ + (v : E)‖ ^ 2 : ℝ) * τ) := sorry

theorem thetaCoset_zero : thetaCoset L 0 = thetaSeries L := sorry

theorem thetaCoset_add_mem (γ : E) {w : E} (hw : w ∈ L) : thetaCoset L (γ + w) = thetaCoset L γ :=
  sorry

/-- `θ_{-γ} = θ_γ`: the family `(θ_γ)_{γ ∈ A_L}` is *not* linearly independent, so no matrix
identity can be read off identities between theta functions. -/
theorem thetaCoset_neg (γ : E) : thetaCoset L (-γ) = thetaCoset L γ := sorry

/-- The coset series indexed by the discriminant group. -/
def thetaCosetClass (γ : discGroup L) : ℍ → ℂ :=
  Quotient.liftOn' γ (fun v : L^∨ => thetaCoset L (v : E)) sorry

omit [FiniteDimensional ℝ E] [DiscreteTopology L] [IsZLattice ℝ L] in
theorem thetaCosetClass_mk (γ : L^∨) :
    thetaCosetClass L (Submodule.Quotient.mk γ) = thetaCoset L (γ : E) := rfl

/-- `Θ_{L^∨} = ∑_{γ ∈ A_L} θ_{γ+L}`: the theta series of the **dual** is the sum of the coset
series, a finite sum over the discriminant group. -/
theorem thetaSeries_dual_eq_sum (τ : ℍ) :
    thetaSeries (L^∨) τ = ∑ γ : discGroup L, thetaCosetClass L γ τ := sorry

theorem mdifferentiable_thetaSeries : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) (thetaSeries L) := sorry

theorem mdifferentiable_thetaCoset (γ : E) : MDifferentiable 𝓘(ℂ) 𝓘(ℂ) (thetaCoset L γ) := sorry

/-- Positivity on the imaginary axis: the nonvanishing witness the rank argument of Layer 5 needs.
One line here, a nuisance later. -/
theorem thetaSeries_pos {y : ℝ} (hy : 0 < y) :
    0 < (thetaSeries L ⟨y * I, by sorry⟩).re := sorry

/-- The `q`-expansion of an even lattice: coefficients are the representation numbers. -/
theorem hasSum_thetaSeries (h : IsEven L) (τ : ℍ) :
    HasSum (fun m : ℕ => (repNum L (2 * m) : ℂ) * cexp (2 * π * I * τ) ^ m) (thetaSeries L τ) :=
  sorry

theorem qExpansion_thetaSeries_coeff (h : IsEven L) (m : ℕ) :
    (qExpansion 1 (thetaSeries L)).coeff m = (repNum L (2 * m) : ℂ) := sorry

/-- The `q_N`-expansion of a coset series, `q_N = exp (2 π i τ / N)`, with the coset
representation numbers as coefficients; by `cosetRepNum_eq_zero_of_not_modEq` the support lies in
one congruence class modulo `N`. -/
theorem hasSum_thetaCoset (h : IsEven L) {γ : E} (hγ : γ ∈ L^∨) (τ : ℍ) :
    HasSum (fun m : ℕ => (cosetRepNum L γ (2 * m / level L) : ℂ) *
        cexp (2 * π * I * τ / level L) ^ m)
      (thetaCoset L γ τ) := sorry

/-- The constant term of `Θ_L` is `1`; in particular `Θ_L` is bounded at `i∞` and is never a cusp
form. -/
theorem qExpansion_thetaSeries_coeff_zero (h : IsEven L) :
    (qExpansion 1 (thetaSeries L)).coeff 0 = 1 := sorry

theorem thetaSeries_scale {c : ℝ} (hc : 0 < c) (τ : ℍ) :
    haveI : NeZero c := ⟨hc.ne'⟩
    thetaSeries (scale L c) τ = thetaSeries L ⟨c ^ 2 * τ, by sorry⟩ := sorry

theorem thetaSeries_orthSum (M : Submodule ℤ F) [DiscreteTopology M] [IsZLattice ℝ M] (τ : ℍ) :
    thetaSeries (orthSum L M) τ = thetaSeries L τ * thetaSeries M τ := sorry

end Theta

/-! ### The rank-one and rank-two comparisons with `jacobiTheta` -/

section JacobiTheta

instance : DiscreteTopology (Submodule.span ℤ {(1 : ℝ)}) := sorry
instance : IsZLattice ℝ (Submodule.span ℤ {(1 : ℝ)}) := sorry

/-- **The convention check**: at rank one this is Mathlib's `jacobiTheta`, as functions. If this
fails, the exponent or the norm convention is wrong, and it is far cheaper to find out here. It
compares functions and `q`-expansions only; the `S`-law of `jacobiTheta` is half-integral weight
and is consumed only through its square, `thetaSeries_stdLattice_two_neg_inv`. -/
theorem thetaSeries_int (τ : ℍ) : thetaSeries (Submodule.span ℤ {(1 : ℝ)}) τ = jacobiTheta τ :=
  sorry

theorem thetaSeries_stdLattice (n : ℕ) (τ : ℍ) :
    thetaSeries (stdLattice n) τ = jacobiTheta τ ^ n := sorry

end JacobiTheta

/-! ## Layer 4: the two transformation laws

From here on the rank is even, `n = 2 * k`, wherever an automorphy factor appears. -/

section Transformation

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- **4A, translation on a coset.** `θ_γ(τ + 1) = e(q_L(γ)) θ_γ(τ)`, with
`e(q_L(γ)) = exp (π i ‖γ‖²)` well defined on the class of `γ` because `L` is even. Rank is
arbitrary here. ⚠ Evenness is exactly what this needs; integrality is not enough. -/
theorem thetaCoset_add_one (h : IsEven L) {γ : E} (hγ : γ ∈ L^∨) (τ : ℍ) :
    thetaCoset L γ (⟨(τ : ℂ) + 1, by sorry⟩) =
      cexp (π * I * (‖γ‖ ^ 2 : ℝ)) * thetaCoset L γ τ := sorry

theorem thetaSeries_add_one (h : IsEven L) (τ : ℍ) :
    thetaSeries L (⟨(τ : ℂ) + 1, by sorry⟩) = thetaSeries L τ := sorry

/-- The integral (not necessarily even) case has period `2`, the shape of
`jacobiTheta_T_sq_smul`. -/
theorem thetaSeries_add_two (h : IsIntegral L) (τ : ℍ) :
    thetaSeries L (⟨(τ : ℂ) + 2, by sorry⟩) = thetaSeries L τ := sorry

variable [MeasurableSpace E] [BorelSpace E]

/-- **4B, inversion, scalar form.** No integrality hypothesis: this is Poisson summation at
`v = 0`. -/
theorem thetaSeries_neg_inv (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (τ : ℍ) :
    thetaSeries L (⟨-1 / (τ : ℂ), by sorry⟩) =
      (ZLattice.covolume L volume)⁻¹ * (-I) ^ k * (τ : ℂ) ^ k * thetaSeries (L^∨) τ := sorry

/-- **4C, inversion at a general translate.** Poisson summation at the Gaussian translated by
`v`, for any `v : E`; this is the form the coset splitting of Layer 7 consumes. -/
theorem thetaCoset_neg_inv (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (v : E) (τ : ℍ) :
    thetaCoset L v (⟨-1 / (τ : ℂ), by sorry⟩) =
      (ZLattice.covolume L volume)⁻¹ * (-I) ^ k * (τ : ℂ) ^ k *
        ∑' m : L^∨, cexp (2 * π * I * ⟪v, (m : E)⟫) * cexp (π * I * (‖(m : E)‖ ^ 2 : ℝ) * τ) :=
  sorry

/-- The character `e(b_L(γ, δ)) = exp (2 π i ⟪γ, δ⟫)` on the discriminant group, well defined
because `γ, δ ∈ L^∨` and `⟪γ, ℓ⟫ ∈ ℤ` for `ℓ ∈ L`. -/
def pairingChar (γ δ : discGroup L) : ℂ :=
  Quotient.liftOn₂' γ δ (fun x y : L^∨ => cexp (2 * π * I * ⟪(x : E), (y : E)⟫)) sorry

omit [FiniteDimensional ℝ E] [DiscreteTopology L] [IsZLattice ℝ L] [MeasurableSpace E]
  [BorelSpace E] in
theorem pairingChar_mk (γ δ : L^∨) :
    pairingChar L (Submodule.Quotient.mk γ) (Submodule.Quotient.mk δ) =
      cexp (2 * π * I * ⟪(γ : E), (δ : E)⟫) := rfl

/-- **4C, the vector-valued law.** For even `L` and `γ ∈ L^∨` the sum over `L^∨` breaks into
cosets and the character descends to `A_L`. The coefficient `(covolume L)⁻¹` is `|A_L|^{-1/2}`. -/
theorem thetaCosetClass_neg_inv (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (h : IsEven L)
    (γ : discGroup L) (τ : ℍ) :
    thetaCosetClass L γ (⟨-1 / (τ : ℂ), by sorry⟩) =
      (ZLattice.covolume L volume)⁻¹ * (-I) ^ k * (τ : ℂ) ^ k *
        ∑ δ : discGroup L, pairingChar L γ δ * thetaCosetClass L δ τ := sorry

theorem covolume_eq_sqrt_natCard_discGroup (h : IsIntegral L) :
    ZLattice.covolume L volume = √(Nat.card (discGroup L) : ℝ) := sorry

/-- **4D, the in-scope comparison with Mathlib's `S`-law**: at rank two,
`Θ_{ℤ²}(-1/τ) = (τ/i) Θ_{ℤ²}(τ)`, the square of `jacobiTheta_S_smul`. -/
theorem thetaSeries_stdLattice_two_neg_inv (τ : ℍ) :
    thetaSeries (stdLattice 2) (⟨-1 / (τ : ℂ), by sorry⟩) =
      (τ : ℂ) / I * thetaSeries (stdLattice 2) τ := sorry

end Transformation

/-! ## Layer 5: level one -/

section LevelOne

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- **5A, the rank of an even unimodular lattice is divisible by `8`.** Proved at this layer by the
elementary route (pass to `L ⊕ L` or `L ⊕ L ⊕ L ⊕ L` to reach rank `≡ 4 mod 8`, then contradict
`Θ ≠ 0`), and again in Layer 6 in one line from Milgram's formula. Both proofs are wanted. -/
theorem eight_dvd_finrank_of_even_unimodular (he : IsEven L) (hu : IsUnimodular L) :
    8 ∣ Module.finrank ℝ E := sorry

/-- **5B**, the theta series of an even unimodular lattice, as a level-one modular form of weight
`n / 2`. Built the way Mathlib builds `CuspForm.discriminant`: the two laws of Layer 4 plus
Mathlib's level-one generation lemma. -/
def thetaForm (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) (hu : IsUnimodular L) :
    ModularForm 𝒮ℒ (k : ℤ) := sorry

@[simp] theorem coe_thetaForm (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) (hu : IsUnimodular L) :
    ⇑(thetaForm L k hn he hu) = thetaSeries L := sorry

theorem qExpansion_thetaForm_coeff (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) (hu : IsUnimodular L) (m : ℕ) :
    (qExpansion 1 (thetaForm L k hn he hu)).coeff m = (repNum L (2 * m) : ℂ) := sorry

theorem thetaForm_ne_zero (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) (hu : IsUnimodular L) : thetaForm L k hn he hu ≠ 0 := sorry

/-- **5D, the structural corollary**: in weights divisible by `4`, the level-one graded ring is
generated by `E₄` and `Δ`, so the theta series of an even unimodular lattice of rank `2k` is a
unique combination `∑ c (a, b) • E₄ ^ a * Δ ^ b` over `4 a + 12 b = k`. Consumes Tau Ceti's landed
`mvPolynomialEquivModularForms` and `E₆ ^ 2 = E₄ ^ 3 - 1728 Δ`. -/
theorem existsUnique_finsupp_thetaForm (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) (hu : IsUnimodular L) :
    ∃! c : ℕ × ℕ →₀ ℂ,
      (∀ ab ∈ c.support, 4 * ab.1 + 12 * ab.2 = k) ∧
        (thetaForm L k hn he hu : ℍ → ℂ) =
          fun τ => c.sum fun ab z => z * ModularForm.E₄ τ ^ ab.1 * ModularForm.discriminant τ ^ ab.2 :=
  sorry

end LevelOne

/-! ## Layer 6: Gauss sums of a lattice

The arithmetic input to Hecke–Schoeneberg, isolated so that Layer 7 is an assembly. The one
analytic identity is the reciprocity law, proved by theta asymptotics from Layer 4; everything else
is finite algebra at an *odd* modulus. -/

section GaussSums

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- The sublattice `c • L`, as a submodule of `L`, so that `L ⧸ cSub L c` is the finite quotient
`L / cL` of order `c ^ n`. -/
def cSub (c : ℕ) : Submodule ℤ L := (L.map ((c : ℤ) • LinearMap.id)).comap L.subtype

instance (c : ℕ) [NeZero c] : Finite (L ⧸ cSub L c) := sorry

instance (c : ℕ) [NeZero c] : Fintype (L ⧸ cSub L c) := Fintype.ofFinite _

theorem natCard_quotient_cSub (c : ℕ) [NeZero c] :
    Nat.card (L ⧸ cSub L c) = c ^ Module.finrank ℝ E := sorry

/-- The summand `e(a ‖y‖² / (2c) + ⟪y, m⟫ / c)` of a twisted Gauss sum, well defined on `L / cL`
because `L` is even and `m ∈ L^∨`. -/
def gaussTerm (a : ℤ) (c : ℕ) (m : E) (y : L ⧸ cSub L c) : ℂ :=
  Quotient.liftOn' y
    (fun v : L => cexp (2 * π * I * (a * (‖(v : E)‖ ^ 2 : ℝ) / (2 * c) + ⟪(v : E), m⟫ / c))) sorry

/-- **6A, the Gauss sum** `G_L(a, c) = ∑_{y ∈ L/cL} e(a ‖y‖² / (2c))`. -/
def gaussSum (a : ℤ) (c : ℕ) [NeZero c] : ℂ := ∑ y : L ⧸ cSub L c, gaussTerm L a c 0 y

/-- **6A, the twisted Gauss sum** `G_L(a, c; m)`. -/
def gaussSumTwisted (a : ℤ) (c : ℕ) [NeZero c] (m : E) : ℂ := ∑ y : L ⧸ cSub L c, gaussTerm L a c m y

theorem gaussSum_one_one : gaussSum L 1 1 = 1 := sorry

theorem gaussSum_add_two_mul (a : ℤ) (c : ℕ) [NeZero c] (t : ℤ) :
    gaussSum L (a + 2 * c * t) c = gaussSum L a c := sorry

/-- **6A, vanishing**: for `N ∣ c` the twisted sum vanishes unless `m ∈ L`, by the shift
`y ↦ y + c w`, `w ∈ L^∨`. -/
theorem gaussSumTwisted_eq_zero (h : IsEven L) (a : ℤ) {c : ℕ} [NeZero c] (hc : level L ∣ c)
    {m : E} (hm : m ∈ L^∨) (hm' : m ∉ L) : gaussSumTwisted L a c m = 0 := sorry

/-- **6A, completing the square**: for `m ∈ L` and `a d ≡ 1 (mod c)`. -/
theorem gaussSumTwisted_eq_of_mem (h : IsEven L) {a d : ℤ} {c : ℕ} [NeZero c]
    (had : a * d ≡ 1 [ZMOD c]) {m : E} (hm : m ∈ L) :
    gaussSumTwisted L a c m = cexp (-(2 * π * I * (a * d ^ 2 * (‖m‖ ^ 2 : ℝ) / (2 * c)))) *
      gaussSum L a c := sorry

/-- The quotient `L^∨ / aL`, the index set of the dual side of the reciprocity law. -/
def aSubDual (a : ℕ) : Submodule ℤ (L^∨) := (L.map ((a : ℤ) • LinearMap.id)).comap (L^∨).subtype

instance (a : ℕ) [NeZero a] : Finite (L^∨ ⧸ aSubDual L a) := sorry

instance (a : ℕ) [NeZero a] : Fintype (L^∨ ⧸ aSubDual L a) := Fintype.ofFinite _

/-- The summand `e(-c ‖y‖² / (2a))` on `L^∨ / aL`, well defined because `L` is even. -/
def dualGaussTerm (c : ℕ) (a : ℕ) (y : L^∨ ⧸ aSubDual L a) : ℂ :=
  Quotient.liftOn' y (fun v : L^∨ => cexp (-(2 * π * I * (c * (‖(v : E)‖ ^ 2 : ℝ) / (2 * a))))) sorry

variable [MeasurableSpace E] [BorelSpace E]

/-- **6B, reciprocity.** For coprime positive `a, c`,
`G_L(a, c) = (c/a)^k (det L)^{-1/2} e(n/8) ∑_{y ∈ L^∨/aL} e(-c ‖y‖²/(2a))`. Proved by comparing the
two evaluations of `Θ_L(a/c + it)` as `t → 0⁺`; the rank-one case is Landsberg–Schaar. -/
theorem gaussSum_reciprocity (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (h : IsEven L)
    {a c : ℕ} [NeZero a] [NeZero c] (hac : Nat.Coprime a c) :
    gaussSum L a c =
      ((c : ℂ) / a) ^ k * ((√(det L) : ℝ) : ℂ)⁻¹ * cexp (2 * π * I * (2 * k) / 8) *
        ∑ y : L^∨ ⧸ aSubDual L a, dualGaussTerm L c a y := sorry

/-- The character value `e(q_L(γ)) = exp (π i ‖γ‖²)` on the discriminant group of an even
lattice. -/
def quadChar (γ : discGroup L) : ℂ :=
  Quotient.liftOn' γ (fun v : L^∨ => cexp (π * I * (‖(v : E)‖ ^ 2 : ℝ))) sorry

/-- **6C, Milgram's formula** for a positive-definite even lattice,
`∑_{γ ∈ A_L} e(q_L(γ)) = |A_L|^{1/2} e(n/8)`: the case `a = c = 1` of reciprocity.

⚠ This is not a duplicate of the integral-lattices roadmap's Milgram theorem (its 1I,
`t₊ - t₋ ≡ sign q_L (mod 8)` at every signature, proved there by finite arithmetic from the
Gauss-sum invariant of its 1H). Both are wanted: that one covers the indefinite case, which is out
of scope here, and this one is the analytic route Layer 7 and
`eight_dvd_finrank_of_even_unimodular'` need. The bridge (`discGroupEquiv_quadratic`) identifies
them, and neither is derived from the other. -/
theorem milgram (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (h : IsEven L) :
    ∑ γ : discGroup L, quadChar L γ =
      ((√(Nat.card (discGroup L) : ℝ) : ℝ) : ℂ) * cexp (2 * π * I * (2 * k) / 8) := sorry

/-- `8 ∣ n` again, in one line from Milgram: `|A_L| = 1` forces `e(n/8) = 1`. -/
theorem eight_dvd_finrank_of_even_unimodular' (he : IsEven L) (hu : IsUnimodular L) :
    8 ∣ Module.finrank ℝ E := sorry

/-- **6D, evaluation at an odd modulus.** For `a` odd and coprime to `N`, and `N ∣ c`, the dual
side of reciprocity is `det L * (D_L / a) * a^k`: the form `-(c/N)(N ‖·‖²/2)` is unimodular
modulo `a`, and only `g_p² = (-1/p) p` is needed from the rank-one Gauss sums. -/
theorem sum_dualGaussTerm_eq (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (h : IsEven L)
    {a c : ℕ} [NeZero a] [NeZero c] (ha : Odd a) (haN : Nat.Coprime a (level L))
    (hc : level L ∣ c) :
    ∑ y : L^∨ ⧸ aSubDual L a, dualGaussTerm L c a y =
      (Nat.card (discGroup L) : ℂ) * (jacobiSym (signedDisc L k) a : ℂ) * (a : ℂ) ^ k := sorry

/-- **6E, the closed form**: for odd positive `a` coprime to `c` and `N ∣ c`,
`G_L(a, c) = c^k (det L)^{1/2} e(n/8) (D_L / a)`. -/
theorem gaussSum_eq (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (h : IsEven L)
    {a c : ℕ} [NeZero a] [NeZero c] (ha : Odd a) (hac : Nat.Coprime a c) (hc : level L ∣ c) :
    gaussSum L a c =
      (c : ℂ) ^ k * ((√(det L) : ℝ) : ℂ) * cexp (2 * π * I * (2 * k) / 8) *
        (jacobiSym (signedDisc L k) a : ℂ) := sorry

/-- **6F, the conductor theorem.** The conductor of the Kronecker character of `D_L` divides the
level: `G_L(a, N) = G_L(1, N)` for `a ≡ 1 (mod N)` forces `(D_L / a) = 1` on such `a`. This is the
load-bearing lattice theorem behind the nebentypus, *not* Mathlib's generic
`conductor_dvd_level`. -/
theorem conductor_kroneckerChar_signedDisc_dvd_level (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) :
    (kroneckerChar (signedDisc L k) (signedDisc_modEq L k hn he)
      (signedDisc_ne_zero L k)).conductor ∣ level L := sorry

open scoped Classical in
/-- **6F, the nebentypus** `χ_L : DirichletCharacter ℂ (level L)`: the Kronecker character of
`D_L`, constructed at modulus `|D_L|`, made primitive, and induced at the level through the
conductor theorem. Junk (the trivial character) off the hypotheses. -/
def discChar (k : ℕ) : DirichletCharacter ℂ (level L) :=
  if h : Module.finrank ℝ E = 2 * k ∧ IsEven L then
    DirichletCharacter.changeLevel
      (conductor_kroneckerChar_signedDisc_dvd_level L k h.1 h.2)
      (kroneckerChar (signedDisc L k) (signedDisc_modEq L k h.1 h.2)
        (signedDisc_ne_zero L k)).primitiveCharacter
  else 1

/-- The defining evaluation: away from the level, `χ_L` is the Kronecker symbol of the signed
discriminant. -/
theorem discChar_intCast (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L)
    {a : ℤ} (ha : IsCoprime a (level L : ℤ)) :
    discChar L k (a : ZMod (level L)) = (kroneckerSym (signedDisc L k) a : ℂ) := sorry

theorem discChar_isQuadratic (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) :
    MulChar.IsQuadratic (discChar L k) := sorry

/-- Parity: `χ_L(-1) = (-1)^k`, the compatibility with the weight demanded by the modular-forms
roadmap's parity lemma `M_k(N, χ) ≠ 0 → χ(-1) = (-1)^k`. -/
theorem discChar_neg_one (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) :
    discChar L k (-1) = (-1) ^ k := sorry

theorem discChar_eq_one_of_isUnimodular (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L)
    (hu : IsUnimodular L) : discChar L k = 1 := sorry

end GaussSums

/-! ## Layer 7: general level — the Hecke–Schoeneberg theorem

Schoeneberg's coset splitting: no group presentation and no representation. The entries of
`A : SL(2, ℤ)` are `A 0 0 = a`, `A 0 1 = b`, `A 1 0 = c`, `A 1 1 = d`. -/

section GeneralLevel

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]
variable [MeasurableSpace E] [BorelSpace E]

/-- **7B, the coset splitting.** For every `A ∈ SL(2, ℤ)` with `c > 0` and every even `L`,
`Θ_L(Aτ)` is `(covolume L)⁻¹ ((cτ + d)/(ic))^k` times a sum over `L^∨` of twisted Gauss sums
against `e(d ‖m‖²/(2c)) exp (π i ‖m‖² τ)`. No level condition yet. -/
theorem thetaSeries_smul_eq_tsum (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (h : IsEven L)
    (A : SL(2, ℤ)) (hc : 0 < A 1 0) (τ : ℍ) :
    haveI : NeZero (A 1 0).toNat := ⟨by omega⟩
    thetaSeries L (A • τ) =
      (ZLattice.covolume L volume)⁻¹ * (((A 1 0 : ℂ) * τ + A 1 1) / (I * A 1 0)) ^ k *
        ∑' m : L^∨, gaussSumTwisted L (A 0 0) (A 1 0).toNat (m : E) *
          cexp (2 * π * I * (A 1 1 * (‖(m : E)‖ ^ 2 : ℝ) / (2 * A 1 0))) *
          cexp (π * I * (‖(m : E)‖ ^ 2 : ℝ) * τ) := sorry

/-- **7C, Hecke–Schoeneberg, classical spelling**: slashing the theta series of an even lattice of
even rank `2k` by an element of `Γ₀(N)`, `N` the level, multiplies it by the nebentypus at the
lower-right entry. Layer 5 is the case `N = 1`. -/
theorem thetaSeries_slash_of_mem_Gamma0 (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) {A : SL(2, ℤ)} (hA : A ∈ Gamma0 (level L)) :
    thetaSeries L ∣[(k : ℤ)] A = discChar L k (A 1 1 : ZMod (level L)) • thetaSeries L := sorry

/-- **7E, the coset series on `Γ(N)`**: the same splitting applied to a coset. -/
theorem thetaCoset_slash_of_mem_Gamma (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) {γ : E} (hγ : γ ∈ L^∨) {A : SL(2, ℤ)}
    (hA : A ∈ CongruenceSubgroup.Gamma (level L)) :
    thetaCoset L γ ∣[(k : ℤ)] A = thetaCoset L γ := sorry

/-- **7E**, bundled: each coset theta series is a modular form on the principal congruence
subgroup `Γ(N)`. -/
theorem exists_modularForm_coe_eq_thetaCoset (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) {γ : E} (hγ : γ ∈ L^∨) :
    ∃ F : ModularForm
      ((CongruenceSubgroup.Gamma (level L)).map (Matrix.SpecialLinearGroup.mapGL ℝ)) (k : ℤ),
      ⇑F = thetaCoset L γ := sorry

/-- **7D**, the theta series of an even lattice of even rank, bundled as a modular form on `Γ₁(N)`,
`N` the level. Boundedness at *every* cusp comes from the coset splitting: each slash of `Θ_L` is a
combination of coset theta series, whose `q_N`-expansions are supported in nonnegative
exponents. -/
def thetaFormOfLevel (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) :
    ModularForm ((Gamma1 (level L)).map (Matrix.SpecialLinearGroup.mapGL ℝ)) (k : ℤ) := sorry

@[simp] theorem coe_thetaFormOfLevel (k : ℕ) (hn : Module.finrank ℝ E = 2 * k) (he : IsEven L) :
    ⇑(thetaFormOfLevel L k hn he) = thetaSeries L := sorry

/-- **7D, Hecke–Schoeneberg, character-space spelling**: `Θ_L` lies in the `χ_L`-eigenspace of the
diamond operators, Tau Ceti's `modFormCharSpace`, with the character in its unit-homomorphism face
via `MulChar.equivToUnitHom` (the roadmap keeps both faces, as the modular-forms roadmap does).
The `NeZero` instance is supplied by `level_pos he`; the equivalence with the classical spelling
above goes through the landed `mem_modFormCharSpace_iff_nebentypus`. -/
theorem thetaFormOfLevel_mem_modFormCharSpace (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) [NeZero (level L)] :
    thetaFormOfLevel L k hn he ∈
      modFormCharSpace (k : ℤ) (MulChar.equivToUnitHom (discChar L k)) := sorry

/-- **7F**, the constant term is `1`: `Θ_L` is never a cusp form. -/
theorem qExpansion_thetaFormOfLevel_coeff_zero (k : ℕ) (hn : Module.finrank ℝ E = 2 * k)
    (he : IsEven L) :
    (qExpansion 1 (thetaFormOfLevel L k hn he)).coeff 0 = 1 := sorry

end GeneralLevel

/-! ## Layer 8: the classical identifications

The general rank-8 and rank-24 statements come first; `E₈` and Leech are their instances, and the
kissing numbers are corollaries of the instances. ⚠ `240` and `196560` are **outputs**: neither may
appear as a hypothesis, and a proof that computes either by counting has not discharged its
target.

The sphere-packing project's `E8Lattice` and `LeechLattice` are not declarations this repository
can import (see `README.md`, *Provenance*), so every statement below is seeded in **lattice-free
form** — rank plus evenness plus unimodularity, plus rootlessness for rank `24` — with the named
instantiations specified in the README and discharged in Tau Ceti once the lattices land there.
Nothing is lost: the classification of even unimodular lattices in these ranks is out of scope, so
the hypotheses are exactly what the proofs consume. -/

section Identification

variable (L : Submodule ℤ E) [DiscreteTopology L] [IsZLattice ℝ L]

/-- **8A.** Every even unimodular lattice of rank `8` has theta series `E₄`. The only input is
`repNum L 0 = 1`: the Sturm bound at weight `4` is `⌊4/12⌋ = 0`. -/
theorem thetaForm_eq_E₄ (hn : Module.finrank ℝ E = 8) (he : IsEven L) (hu : IsUnimodular L) :
    thetaForm L 4 (by omega) he hu = ModularForm.E₄ := sorry

/-- **8C.** Every even unimodular lattice of rank `24` has theta series
`E₄ ^ 3 + (r_L(2) - 720) Δ`. The Sturm bound at weight `12` is `1`, so the constant term and
`r_L(2)` determine the form. -/
theorem thetaForm_rank_24 (hn : Module.finrank ℝ E = 24) (he : IsEven L) (hu : IsUnimodular L) :
    (thetaForm L 12 (by omega) he hu : ℍ → ℂ) =
      fun τ => (ModularForm.E₄ τ) ^ 3 +
        ((repNum L 2 : ℂ) - 720) * ModularForm.discriminant τ := sorry

/-- **8B.** `r_L(2m) = 240 σ₃(m)` for every even unimodular lattice of rank `8` — in particular for
`E₈`, whose evenness and unimodularity the sphere-packing project has already formalized. A
corollary of `thetaForm_eq_E₄`, `qExpansion_thetaForm_coeff`, and the `q`-expansion of `E₄` with
`bernoulli 4 = -1/30`; stated in `ℕ`, since both sides are counts. -/
theorem repNum_rank_eight (hn : Module.finrank ℝ E = 8)
    (he : IsEven L) (hu : IsUnimodular L) {m : ℕ} (hm : m ≠ 0) :
    repNum L (2 * m) = 240 * σ 3 m := sorry

/-- The kissing number of `E₈`, as an **output**: the case `m = 1` of `repNum_rank_eight`, not a
counting argument over the root system. -/
theorem repNum_two_rank_eight (hn : Module.finrank ℝ E = 8)
    (he : IsEven L) (hu : IsUnimodular L) :
    repNum L 2 = 240 := sorry

/-- **8D.** `Θ_L = E₄ ^ 3 - 720 Δ` for every **rootless** even unimodular lattice of rank `24` — the
Leech identity, whose lattice-specific hypothesis is the sphere-packing project's `leech_rootless`.
The rootless case of `thetaForm_rank_24`. -/
theorem coe_thetaForm_rank_24_rootless (hn : Module.finrank ℝ E = 24)
    (he : IsEven L) (hu : IsUnimodular L) (hr : repNum L 2 = 0) :
    (thetaForm L 12 (by omega) he hu : ℍ → ℂ) =
      fun τ => (ModularForm.E₄ τ) ^ 3 - 720 * ModularForm.discriminant τ := sorry

/-- `r_Λ(2m) = (65520/691) (σ₁₁(m) - τ(m))`, the coefficient form of the equivalent identity
`Θ_Λ = E₁₂ - (65520/691) Δ`. Mathlib has no named Ramanujan `τ`-function, so `τ(m)` is spelled as
what it is: the `m`-th `q`-expansion coefficient of `Δ`. Stated in `ℂ`, where the `q`-expansion
coefficients live; that both sides are rational (indeed, that the right side is a natural number)
is part of the content. -/
theorem repNum_rank_24_rootless (hn : Module.finrank ℝ E = 24)
    (he : IsEven L) (hu : IsUnimodular L) (hr : repNum L 2 = 0) {m : ℕ} (hm : m ≠ 0) :
    (repNum L (2 * m) : ℂ) =
      65520 / 691 * ((σ 11 m : ℂ) - (qExpansion 1 CuspForm.discriminant).coeff m) := sorry

/-- The kissing number of the Leech lattice, as an **output**: the case `m = 2` of
`repNum_rank_24_rootless`, with `σ₁₁(2) = 2049` and `τ(2) = -24`. `196560` appears in no
hypothesis. -/
theorem repNum_four_rank_24_rootless (hn : Module.finrank ℝ E = 24)
    (he : IsEven L) (hu : IsUnimodular L) (hr : repNum L 2 = 0) :
    repNum L 4 = 196560 := sorry

/-- **8A.** Every even unimodular lattice of rank `16` has theta series `E₄ ^ 2`: at weight `8` the
Sturm bound is again `0`, so `repNum L 0 = 1` is the only input. -/
theorem coe_thetaForm_rank_16 (hn : Module.finrank ℝ E = 16)
    (he : IsEven L) (hu : IsUnimodular L) :
    (thetaForm L 8 (by omega) he hu : ℍ → ℂ) =
      fun τ => (ModularForm.E₄ τ) ^ 2 := sorry

/-- Hence any two even unimodular lattices of rank `16` — `E₈ ⊕ E₈` and `D₁₆⁺` among them — have
*equal* bundled theta series, even across different ambient spaces. -/
theorem thetaForm_rank_16_eq (M : Submodule ℤ F) [DiscreteTopology M] [IsZLattice ℝ M]
    (hnE : Module.finrank ℝ E = 16) (hnF : Module.finrank ℝ F = 16)
    (heL : IsEven L) (huL : IsUnimodular L) (heM : IsEven M) (huM : IsUnimodular M) :
    thetaForm L 8 (by omega) heL huL = thetaForm M 8 (by omega) heM huM := sorry

/-- **8E, the theta series does not determine the lattice** (Witt's example). The witnesses are
`E₈ ⊕ E₈` and `D₁₆⁺` (`README.md`, Layer 8E). The two halves have different owners: equality of
the theta series is `thetaForm_rank_16_eq` here, and the non-isometry is the integral-lattices
roadmap's 6D, which constructs both lattices and separates them by their root systems. Neither
that computation nor any substitute for it — in particular not a count of the norm-`2` vectors,
of which both lattices have `480` — is a target here.

Isometry is spelled per the README convention: a real linear isometry of the ambient space
carrying one lattice onto the other, here as an image of sets to keep `ℤ`-`ℝ` scalar bookkeeping
out of the statement. -/
theorem exists_thetaSeries_eq_not_isometric :
    ∃ L' M' : Submodule ℤ (EuclideanSpace ℝ (Fin 16)),
      IsEven L' ∧ IsUnimodular L' ∧ IsEven M' ∧ IsUnimodular M' ∧
      thetaSeries L' = thetaSeries M' ∧
      ¬ ∃ e : EuclideanSpace ℝ (Fin 16) ≃ₗᵢ[ℝ] EuclideanSpace ℝ (Fin 16),
          e '' (L' : Set (EuclideanSpace ℝ (Fin 16))) =
            (M' : Set (EuclideanSpace ℝ (Fin 16))) := sorry

end Identification

end

end TauCetiRoadmap.ThetaSeries
