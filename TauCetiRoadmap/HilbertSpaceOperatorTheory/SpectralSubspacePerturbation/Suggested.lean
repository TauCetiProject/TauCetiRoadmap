/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import TauCetiRoadmap.HilbertSpaceOperatorTheory.HilbertSpaceOperatorFoundations.Suggested
import TauCetiRoadmap.HilbertSpaceOperatorTheory.MajorizationAndAngles.Suggested
import TauCetiRoadmap.HilbertSpaceOperatorTheory.SelfAdjointSpectralTheory.Suggested

/-!
# Spectral-subspace perturbation: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

This file imports the sibling signature files and consumes their proposed public vocabulary.
It does not redeclare spectral predicates, unitarily invariant seminorms, resolvents, or the
domain-aware Sylvester equation; the imports therefore build-check that the family proposes one
compatible API rather than several local approximations.
-/

namespace TauCetiRoadmap.SpectralSubspacePerturbation

open Module (finrank)
open scoped InnerProductSpace
open MeasureTheory

universe u v w

/-! ## Local derived objects

The spectral predicates and seminorm structures used below are imported from their owner
roadmaps. Only perturbation-specific constructions are declared here. -/

section LocalObjects

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]

/-- The directed sine cross-projection `P_{Vᗮ} ∘ P_U`. -/
noncomputable def sinThetaMap (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : E →ₗ[𝕜] E :=
  ((Vᗮ.starProjection ∘L U.starProjection : E →L[𝕜] E) : E →ₗ[𝕜] E)

/-- The Frobenius (Hilbert–Schmidt) norm through the standard orthonormal basis. -/
noncomputable def frobeniusNorm [FiniteDimensional 𝕜 E] (T : E →ₗ[𝕜] F) : ℝ :=
  Real.sqrt (∑ i, ‖T (stdOrthonormalBasis 𝕜 E i)‖ ^ 2)

end LocalObjects

/-! ## Part A -- the Haagerup–Zsidó kernel and its Fourier transform -/

section HaagerupZsido

/-- The hyperbolic weight, chosen so the mass computation collapses exactly. -/
noncomputable def weight (y : ℝ) : ℝ :=
  Real.tanh (Real.pi * y / 2)

/-- The Laplace transform of the weight at `|t|`. -/
noncomputable def weightLaplaceTransform (t : ℝ) : ℝ :=
  ∫ y in Set.Ioi (0 : ℝ), weight y * Real.exp (-|t| * y)

/-- The real Haagerup–Zsidó kernel. -/
noncomputable def realKernel (t : ℝ) : ℝ :=
  (Real.sin t / 2) * weightLaplaceTransform t

/-- The complex kernel; the rotation by `-i` makes the Fourier identity land
on `1 / x` rather than `i / x`. -/
noncomputable def reciprocalKernel (t : ℝ) : ℂ :=
  -Complex.I * (realKernel t : ℂ)

/-- Oddness; the two-sided Fourier identity follows from `1 ≤ x` by
reflection. -/
theorem reciprocalKernel_neg (t : ℝ) :
    reciprocalKernel (-t) = -reciprocalKernel t := by
  sorry

/-- Closed-form Laplace transform of `|sin|`, the inner integral of the mass
computation. -/
theorem integral_abs_sin_mul_exp_neg_abs {y : ℝ} (hy : 0 < y) :
    (∫ t : ℝ, |Real.sin t| * Real.exp (-y * |t|)) =
      2 * ((1 + Real.exp (-Real.pi * y)) /
        ((1 - Real.exp (-Real.pi * y)) * (1 + y ^ 2))) := by
  sorry

/-- **Milestone A1, first half: the exterior Fourier identity.** -/
theorem reciprocalKernel_fourier (x : ℝ) (hx : 1 ≤ |x|) :
    (∫ t : ℝ, reciprocalKernel t *
        Complex.exp ((((t * x : ℝ) : ℂ) * Complex.I))) = 1 / (x : ℂ) := by
  sorry

/-- **Milestone A1, second half: the exact mass `π / 2`.** -/
theorem integral_norm_reciprocalKernel :
    (∫ t : ℝ, ‖reciprocalKernel t‖) = Real.pi / 2 := by
  sorry

end HaagerupZsido

/-! ## Part B -- Sylvester equations and the Rosenblum theorem -/

section DimensionFreeBounds

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]

/-- **Dimension-free separated Sylvester bound** (integral-free, arbitrary
Hilbert spaces, both scalar fields): quadratic-form separation of size `g`
gives `‖X‖ ≤ ‖Y‖ / g`. -/
theorem opNorm_le_div_of_comp_sub_comp_eq
    {A : E →L[𝕜] E} {B : F →L[𝕜] F} {X Y : F →L[𝕜] E}
    (hA : (A : E →ₗ[𝕜] E).IsSymmetric) (hB : (B : F →ₗ[𝕜] F).IsSymmetric)
    {c g : ℝ} (hg : 0 < g)
    (hAc : ∀ x, (c + g) * ‖x‖ ^ 2 ≤ RCLike.re ⟪A x, x⟫_𝕜)
    (hBc : ∀ v, RCLike.re ⟪B v, v⟫_𝕜 ≤ c * ‖v‖ ^ 2)
    (hXY : A ∘L X - X ∘L B = Y) : ‖X‖ ≤ ‖Y‖ / g := by
  sorry

end DimensionFreeBounds

section FiniteDimensionalSylvester

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
  [FiniteDimensional 𝕜 E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F]
  [FiniteDimensional 𝕜 F]

/-- **Interval/exterior separation, constant one, every rectangular unitarily
invariant norm.** -/
theorem uiNorm_sylvester_le_of_intervalGap
    (N : MajorizationAndAngles.RectangularUnitarilyInvariantSeminorm 𝕜 E F)
    {A : F →ₗ[𝕜] F} {B : E →ₗ[𝕜] E} {X C : E →ₗ[𝕜] F}
    (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {a b δ : ℝ} (hδ : 0 < δ)
    (hBin : HilbertSpaceOperatorFoundations.SpectrumIn B ⊤ (Set.Icc a b))
    (hAout : HilbertSpaceOperatorFoundations.SpectrumIn A ⊤ {lam | lam ∉ Set.Ioo (a - δ) (b + δ)})
    (hEq : A ∘ₗ X - X ∘ₗ B = C) :
    δ * N X ≤ N C := by
  sorry

/-- **Arbitrary pairwise separation, the sharp constant `π / 2`** (the mass of
the Part A kernel), lifted from the simultaneous Ky Fan prefix estimate by Fan
dominance. -/
theorem uiNorm_sylvester_le_of_spectralDistance
    (N : MajorizationAndAngles.RectangularUnitarilyInvariantSeminorm 𝕜 E F)
    {A : F →ₗ[𝕜] F} {B : E →ₗ[𝕜] E} {X C : E →ₗ[𝕜] F}
    (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {δ : ℝ} (hδ : 0 < δ) (hgap : HilbertSpaceOperatorFoundations.SpectraSeparated A ⊤ B ⊤ δ)
    (hEq : A ∘ₗ X - X ∘ₗ B = C) :
    δ * N X ≤ (Real.pi / 2) * N C := by
  sorry

end FiniteDimensionalSylvester


section Unbounded

variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace ℂ E]
  [CompleteSpace E]
variable {F : Type w} [NormedAddCommGroup F] [InnerProductSpace ℂ F]
  [CompleteSpace F]

/-- **Milestone B2 — Rosenblum's theorem.**  A bounded operator intertwining
two self-adjoint partial maps with disjoint spectra is zero.  Proved without
a Borel functional calculus: `1` is a null point for every diagonal spectral
measure, so damped continuous Cayley symbols separate in the limit. -/
theorem eq_zero_of_intertwines_of_disjoint_spectrum
    {A : E →ₗ.[ℂ] E} {B : F →ₗ.[ℂ] F}
    (hA : IsSelfAdjoint A) (hB : IsSelfAdjoint B) {X : F →L[ℂ] E}
    (hmaps : ∀ y : B.domain, X (y : F) ∈ A.domain)
    (hint : ∀ y : B.domain, A ⟨X (y : F), hmaps y⟩ = X (B y))
    (hdisj : Disjoint (SelfAdjointSpectralTheory.spectrum A) (SelfAdjointSpectralTheory.spectrum B)) :
    X = 0 := by
  sorry

/-- The unbounded pairwise-separation bound with the sharp constant: open
target.  The Hilbert–Schmidt form with constant one, through the Sylvester
flow's generator gap, is the companion target. -/
example {A : E →ₗ.[ℂ] E} {B : F →ₗ.[ℂ] F}
    (hA : IsSelfAdjoint A) (hB : IsSelfAdjoint B)
    {X C : F →L[ℂ] E} (hEq : SelfAdjointSpectralTheory.SylvesterEquation A B X C)
    {δ : ℝ} (hδ : 0 < δ)
    (hgap : ∀ z ∈ SelfAdjointSpectralTheory.spectrum A,
      ∀ w ∈ SelfAdjointSpectralTheory.spectrum B, δ ≤ ‖z - w‖) :
    δ * ‖X‖ ≤ (Real.pi / 2) * ‖C‖ := by
  sorry

end Unbounded

/-! ## Part C -- the Davis–Kahan sin Θ theorems -/

section DimensionFreeSinTheta

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]

/-- **The dimension-free operator-norm `sin Θ` theorem, coercivity form**: on
an arbitrary Hilbert space, from the dimension-free Sylvester bound alone. -/
theorem sinTheta_directed_coercive
    {A B : E →L[𝕜] E}
    (hA : (A : E →ₗ[𝕜] E).IsSymmetric) (hB : (B : E →ₗ[𝕜] E).IsSymmetric)
    {U V : Submodule 𝕜 E} [U.HasOrthogonalProjection]
    [V.HasOrthogonalProjection]
    (hU : ∀ x ∈ U, A x ∈ U) (hV : ∀ x ∈ V, B x ∈ V)
    {c g : ℝ} (hg : 0 < g)
    (hUc : ∀ x ∈ U, (c + g) * ‖x‖ ^ 2 ≤ RCLike.re ⟪A x, x⟫_𝕜)
    (hVc : ∀ x ∈ V, RCLike.re ⟪B x, x⟫_𝕜 ≤ c * ‖x‖ ^ 2) :
    ‖(V.starProjection ∘L U.starProjection : E →L[𝕜] E)‖ ≤ ‖B - A‖ / g := by
  sorry

end DimensionFreeSinTheta

section FiniteSinTheta

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
  [FiniteDimensional 𝕜 E]

/-- **Milestone C1 — Davis–Kahan `sin Θ`, perturbation form, every square
unitarily invariant norm**, under the interval/exterior gap. -/
theorem sinTheta_perturbation_le
    (N : MajorizationAndAngles.UnitarilyInvariantSeminorm 𝕜 E)
    {A B : E →ₗ[𝕜] E} (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {U V : Submodule 𝕜 E} [U.HasOrthogonalProjection]
    [V.HasOrthogonalProjection]
    (hU : ∀ x ∈ U, A x ∈ U) (hV : ∀ x ∈ V, B x ∈ V)
    {a b δ : ℝ} (hδ : 0 < δ)
    (hAin : HilbertSpaceOperatorFoundations.SpectrumIn A U (Set.Icc a b))
    (hBout : HilbertSpaceOperatorFoundations.SpectrumIn B Vᗮ {lam | lam ∉ Set.Ioo (a - δ) (b + δ)}) :
    δ * N (sinThetaMap U V) ≤ N (B - A) := by
  sorry

/-- **Canonical spectral-projector Davis–Kahan theorem** with no eigenbasis
in the API; the equal-rank hypothesis turns the directed estimate into the
full projector difference. -/
theorem opNorm_spectralProjection_sub_spectralProjection_le
    {A B : E →ₗ[𝕜] E} (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {a b δ : ℝ} (hδ : 0 < δ)
    (hrank : finrank 𝕜 (HilbertSpaceOperatorFoundations.spectralSubspace A (Set.Icc a b)) =
      finrank 𝕜 (HilbertSpaceOperatorFoundations.spectralSubspace B (Set.Icc a b)))
    (hAin : HilbertSpaceOperatorFoundations.SpectrumIn A (HilbertSpaceOperatorFoundations.spectralSubspace A (Set.Icc a b)) (Set.Icc a b))
    (hBout : HilbertSpaceOperatorFoundations.SpectrumIn B (HilbertSpaceOperatorFoundations.spectralSubspace B (Set.Icc a b))ᗮ
      {lam | lam ∉ Set.Ioo (a - δ) (b + δ)}) :
    δ * ‖((HilbertSpaceOperatorFoundations.spectralSubspace A (Set.Icc a b)).starProjection -
        (HilbertSpaceOperatorFoundations.spectralSubspace B (Set.Icc a b)).starProjection : E →L[𝕜] E)‖ ≤
      ‖(B - A).toContinuousLinearMap‖ := by
  sorry

/-- **Milestone C2 — the two-sided `π/2` form**: arbitrary pairwise
separation of the selected `A`-spectrum from the complementary `B`-spectrum,
every square unitarily invariant norm. -/
theorem sinTheta_perturbation_le_of_spectralDistance
    (N : MajorizationAndAngles.UnitarilyInvariantSeminorm 𝕜 E)
    {A B : E →ₗ[𝕜] E} (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {U V : Submodule 𝕜 E} [U.HasOrthogonalProjection]
    [V.HasOrthogonalProjection]
    (hU : ∀ x ∈ U, A x ∈ U) (hV : ∀ x ∈ V, B x ∈ V)
    {δ : ℝ} (hδ : 0 < δ) (hgap : HilbertSpaceOperatorFoundations.SpectraSeparated A U B Vᗮ δ) :
    δ * N (sinThetaMap U V) ≤ (Real.pi / 2) * N (B - A) := by
  sorry

/-- **Davis's `sin 2θ` theorem, per-eigenvector product form**: for a unit
eigenvector `x` of the perturbed operator and `P` the projection onto the
invariant subspace, `(b - a) · ‖P x‖ · ‖x - P x‖ ≤ ε`. -/
theorem sin_two_theta_le
    {T P : E →ₗ[𝕜] E} (hT : T.IsSymmetric) (hP : P.IsSymmetric)
    {U : Submodule 𝕜 E} [U.HasOrthogonalProjection]
    (hUinv : ∀ u ∈ U, T u ∈ U) {a b ε : ℝ}
    (hb : ∀ u ∈ U, b * ‖u‖ ^ 2 ≤ RCLike.re ⟪T u, u⟫_𝕜)
    (ha : ∀ w ∈ Uᗮ, RCLike.re ⟪T w, w⟫_𝕜 ≤ a * ‖w‖ ^ 2)
    (hε : ∀ v, ‖P v‖ ≤ ε * ‖v‖)
    {x : E} (hx : ‖x‖ = 1) {μ : ℝ} (hμ : T x + P x = (μ : 𝕜) • x) :
    (b - a) * (‖U.starProjection x‖ * ‖x - U.starProjection x‖) ≤ ε := by
  sorry

end FiniteSinTheta

section Riccati

variable {U : Type v} [NormedAddCommGroup U] [InnerProductSpace ℂ U]
  [CompleteSpace U]
variable {W : Type w} [NormedAddCommGroup W] [InnerProductSpace ℂ W]
  [CompleteSpace W]

/-- Graph-subspace/Riccati target (open): for a self-adjoint block operator
`[[A₁, C⋆], [C, A₂]]` with an ordered form gap `g` between the diagonal
blocks, the Riccati equation has a solution whose norm obeys the tangent
bound; contractivity and uniqueness among contractions are the companion
targets. -/
example {A₁ : U →L[ℂ] U} {A₂ : W →L[ℂ] W} {C : U →L[ℂ] W}
    (hA₁ : (A₁ : U →ₗ[ℂ] U).IsSymmetric) (hA₂ : (A₂ : W →ₗ[ℂ] W).IsSymmetric)
    {c g : ℝ} (hg : 0 < g)
    (h₁ : ∀ x, RCLike.re ⟪A₁ x, x⟫_ℂ ≤ c * ‖x‖ ^ 2)
    (h₂ : ∀ y, (c + g) * ‖y‖ ^ 2 ≤ RCLike.re ⟪A₂ y, y⟫_ℂ)
    (hC : ‖C‖ < g / 2) :
    ∃ X : U →L[ℂ] W,
      X ∘L A₁ - A₂ ∘L X + X ∘L ContinuousLinearMap.adjoint C ∘L X = C ∧
        g * ‖X‖ ≤ 2 * ‖C‖ := by
  sorry

end Riccati

/-! ## Part D -- the Yu–Wang–Samworth statistical variant -/

section YuWangSamworth

variable {𝕜 : Type u} [RCLike 𝕜]
variable {E : Type v} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
  [FiniteDimensional 𝕜 E]

/-- `U` and `V` are eigenblocks of `A` and `B` selected by the same ordered
eigenvalue indices — the branch selection that excludes arbitrary reducing
subspaces when `B = A`. -/
def CorrespondingEigenblock {A B : E →ₗ[𝕜] E}
    (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    (U V : Submodule 𝕜 E) : Prop :=
  ∃ (n : ℕ) (hn : finrank 𝕜 E = n) (s : Finset (Fin n)),
    U = Submodule.span 𝕜 (⇑(hA.eigenvectorBasis hn) '' (s : Set (Fin n))) ∧
      V = Submodule.span 𝕜 (⇑(hB.eigenvectorBasis hn) '' (s : Set (Fin n)))

/-- Frobenius sine distance in canonical subspace notation. -/
noncomputable def sinThetaFrobenius (U V : Submodule 𝕜 E)
    [U.HasOrthogonalProjection] [V.HasOrthogonalProjection] : ℝ :=
  frobeniusNorm (sinThetaMap U V)

/-- **The complement identity**: the Frobenius sine of two equally indexed
blocks is exactly the square root of the cross-block overlap sum — the bridge
between the paper's cross-block energies and angles, public by decision. -/
theorem sinThetaFrobenius_eq_sqrt_sum_cross {n : ℕ}
    (bT bS : OrthonormalBasis (Fin n) 𝕜 E) (s : Finset (Fin n)) :
    sinThetaFrobenius
        (Submodule.span 𝕜 (⇑bT '' (s : Set (Fin n))))
        (Submodule.span 𝕜 (⇑bS '' (s : Set (Fin n)))) =
      Real.sqrt (∑ j ∈ s, ∑ k ∈ sᶜ, ‖⟪bT k, bS j⟫_𝕜‖ ^ 2) := by
  sorry

/-- **Milestone D1 — the exact Yu–Wang–Samworth population-gap theorem.** -/
theorem yuWangSamworth_sinTheta_le
    {A B : E →ₗ[𝕜] E} (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {U V : Submodule 𝕜 E} [U.HasOrthogonalProjection]
    [V.HasOrthogonalProjection]
    (hcorr : CorrespondingEigenblock hA hB U V)
    {d : ℕ} (hrank : finrank 𝕜 U = d) {Δ : ℝ} (hΔ : 0 < Δ)
    (hgap : HilbertSpaceOperatorFoundations.InternalGap A U Δ) :
    sinThetaFrobenius U V ≤
      2 * min (Real.sqrt d * ‖(B - A).toContinuousLinearMap‖)
        (frobeniusNorm (B - A)) / Δ := by
  sorry

/-- **The aligned-basis (Procrustes) surface**: orthonormal bases of the two
blocks whose pointwise discrepancy is controlled — the usable form when
eigenbases are determined only up to rotation. -/
theorem yuWangSamworth_alignedBasis_le
    {A B : E →ₗ[𝕜] E} (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {U V : Submodule 𝕜 E} [U.HasOrthogonalProjection]
    [V.HasOrthogonalProjection]
    (hcorr : CorrespondingEigenblock hA hB U V)
    {d : ℕ} (hrankU : finrank 𝕜 U = d) (hrankV : finrank 𝕜 V = d)
    {Δ : ℝ} (hΔ : 0 < Δ) (hgap : HilbertSpaceOperatorFoundations.InternalGap A U Δ) :
    ∃ (u v : Fin d → E), Orthonormal 𝕜 u ∧ Orthonormal 𝕜 v ∧
      Submodule.span 𝕜 (Set.range u) = U ∧
      Submodule.span 𝕜 (Set.range v) = V ∧
      Real.sqrt (∑ i, ‖v i - u i‖ ^ 2) ≤
        2 * Real.sqrt 2 *
          min (Real.sqrt d * ‖(B - A).toContinuousLinearMap‖)
            (frobeniusNorm (B - A)) / Δ := by
  sorry

/-- **The single-vector bound**: the rank-one, sign-aligned eigenvector
corollary — the headline statisticians quote. -/
theorem yuWangSamworth_eigenvector_le
    {A B : E →ₗ[𝕜] E} (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {u v : E} (hu : ‖u‖ = 1) (hv : ‖v‖ = 1)
    {lam μ Δ : ℝ} (hAu : A u = (lam : 𝕜) • u) (hBv : B v = (μ : 𝕜) • v)
    (hcorr : CorrespondingEigenblock hA hB
      (Submodule.span 𝕜 {u}) (Submodule.span 𝕜 {v}))
    (hΔ : 0 < Δ)
    (hgap : ∀ ν ∈ HilbertSpaceOperatorFoundations.restrictedSpectrum A (Submodule.span 𝕜 {u})ᗮ,
      Δ ≤ |lam - ν|) :
    ∃ c : 𝕜, ‖c‖ = 1 ∧
      ‖c • v - u‖ ≤
        2 * Real.sqrt 2 * ‖(B - A).toContinuousLinearMap‖ / Δ := by
  sorry

end YuWangSamworth

end TauCetiRoadmap.SpectralSubspacePerturbation
