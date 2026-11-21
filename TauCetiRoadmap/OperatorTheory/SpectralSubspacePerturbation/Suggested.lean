/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.InnerProductSpace.LinearPMap.Sylvester
import TauCeti.Analysis.InnerProductSpace.LinearPMap.SpectralSeparation
import TauCeti.Analysis.InnerProductSpace.Projection.TanTheta
import TauCeti.Analysis.InnerProductSpace.RayleighRitz
import TauCeti.Analysis.InnerProductSpace.Spectral.Eigenframe
import TauCeti.Analysis.InnerProductSpace.PointSpectrum
import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.Frobenius
import TauCeti.Topology.Algebra.Module.LinearPMap.Intertwining

/-!
# Spectral-subspace perturbation: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, and the README carries every
target, its API and its Checks.

The headline theorems are:

* the domain-aware `π / 2` Sylvester bound for self-adjoint operators, bounded or not, whose
  spectra are `δ`-separated (README §2.16);
* Rosenblum's theorem: a bounded intertwiner of two self-adjoint operators with disjoint spectra
  is zero (README §2.17);
* the Davis–Kahan `tan Θ` theorem for a Ritz residual (README §3.28);
* the Yu–Wang–Samworth aligned-basis and single-eigenvector theorems (README §4.17 and §4.18).

The other headline theorems of the roadmap are declarations of the pinned Tau Ceti and are not
restated here: the exterior Fourier identity and the mass `π / 2` of the Haagerup–Zsidó kernel,
the finite-dimensional Sylvester bounds with constant one and with constant `π / 2`, the
Davis–Kahan `sin Θ` and `sin 2Θ` theorems, and the Yu–Wang–Samworth `sin Θ` theorem. The README
names them in its supplier contracts. Every headline theorem is statable at the pins.
-/

namespace TauCetiRoadmap.SpectralSubspacePerturbation

open Module (finrank)
open scoped InnerProductSpace

/-! ## Layer 2: Sylvester equations and Rosenblum's theorem -/

/-- **The domain-aware `π / 2` Sylvester bound.** Let `A` and `B` be self-adjoint operators,
possibly unbounded, on complex Hilbert spaces, whose real spectra are `δ`-separated with
`δ > 0`. If bounded `X` and `C` satisfy `A X - X B = C` on the domain of `B`, with `X` mapping
the domain of `B` into that of `A`, then `δ ‖X‖ ≤ (π / 2) ‖C‖` (Seelmann 2014, Theorem 3.1;
Albeverio–Makarov–Motovilov 2003, Theorem 2.7, for weak solutions). README §2.16. -/
theorem mul_norm_le_pi_div_two_mul_norm_of_sylvesterEquation
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]
    {A : E →ₗ.[ℂ] E} {B : F →ₗ.[ℂ] F}
    (hA : IsSelfAdjoint A) (hB : IsSelfAdjoint B) {X C : F →L[ℂ] E}
    (hEq : LinearPMap.SylvesterEquation A B X C) {δ : ℝ} (hδ : 0 < δ)
    (hsep : LinearPMap.SpectralSetsSeparated A B Set.univ Set.univ δ) :
    δ * ‖X‖ ≤ Real.pi / 2 * ‖C‖ := by
  sorry

/-- **Rosenblum's theorem.** A bounded operator `X` that intertwines two self-adjoint operators,
possibly unbounded, with disjoint spectra is zero: if `X` maps the domain of `B` into that of `A`
and `A X y = X B y` for every `y` in the domain of `B` (Tau Ceti's `B.Intertwines A X`), then
`X = 0`. For bounded `A` this is a theorem of Krein, Daleckii and Rosenblum
(Albeverio–Makarov–Motovilov 2003, Lemma 2.5). README §2.17. -/
theorem eq_zero_of_intertwines_of_disjoint_spectrum
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℂ F] [CompleteSpace F]
    {A : E →ₗ.[ℂ] E} {B : F →ₗ.[ℂ] F}
    (hA : IsSelfAdjoint A) (hB : IsSelfAdjoint B) {X : F →L[ℂ] E}
    (hint : B.Intertwines A X)
    (hdisj : Disjoint A.spectrum B.spectrum) :
    X = 0 := by
  sorry

/-! ## Layer 3: the Davis–Kahan theorems -/

/-- **The Davis–Kahan `tan Θ` theorem, equal ranks.** Let `A` be symmetric on a
finite-dimensional inner product space `E`, let `U` be `A`-invariant, and let `Z` be a subspace
with `dim Z = dim U`. Let `M` be the compression of `A` to `Z` and `R = A ι - ι M : Z → E` its
Ritz residual, `ι` the inclusion of `Z`. If the eigenvalues of `M` lie in `[β, α]` and those of
`A` on `Uᗮ` lie in `[α + δ, ∞)` with `δ > 0`, then every principal angle from `Z` to `U` is below
`π / 2`, and the tangent map `Z.tanThetaMap U`, whose singular values are the principal tangents,
satisfies `δ N (tan Θ) ≤ N R` in every unitarily invariant seminorm `N` on the maps `Z → E`
(Davis–Kahan 1970, the `tan Θ` theorem). README §3.28. -/
theorem directedProjectionGap_lt_one_and_mul_map_tanThetaMap_le
    {𝕜 : Type*} [RCLike 𝕜]
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    [CompleteSpace E]
    {A : E →L[𝕜] E} (hA : (A : E →ₗ[𝕜] E).IsSymmetric)
    {U Z : Submodule 𝕜 E} (hU : ∀ x ∈ U, A x ∈ U) (hrank : finrank 𝕜 Z = finrank 𝕜 U)
    {α β δ : ℝ} (hβα : β ≤ α) (hδ : 0 < δ)
    (hM : Module.End.PointSpectrumIn
      ((A.compression Z.subtypeL : Z →L[𝕜] Z) : Z →ₗ[𝕜] Z) ⊤ (Set.Icc β α))
    (hAU : Module.End.PointSpectrumIn (A : E →ₗ[𝕜] E) Uᗮ (Set.Ici (α + δ))) :
    Z.directedProjectionGap U < 1 ∧
      ∀ N : TauCeti.UnitarilyInvariantSeminorm 𝕜 Z E,
        δ * N (Z.tanThetaMap U) ≤
          N ((A.sylvester (A.compression Z.subtypeL) Z.subtypeL : Z →L[𝕜] E) : Z →ₗ[𝕜] E) := by
  sorry

/-! ## Layer 4: the Yu–Wang–Samworth variant -/

/-- **The Yu–Wang–Samworth aligned-basis theorem.** Let `A` (the population operator) and `B` be
symmetric on a finite-dimensional inner product space, and let `U` and `V` be corresponding
rank-`d` eigenblocks of `A` and `B`, spanned by eigenvectors at the same sorted eigenvalue indices.
If the eigenvalues of `A` on `U` are `Δ`-separated from those on `Uᗮ`, with `Δ > 0`, then `U` and
`V` have orthonormal bases `u` and `v` with
`(∑ᵢ ‖vᵢ - uᵢ‖²)^{1/2} ≤ 2√2 min(√d ‖B - A‖, ‖B - A‖_F) / Δ` (Yu–Wang–Samworth 2015,
Theorem 2, inequality (3), for real matrices and consecutive indices). README §4.17. -/
theorem yuWangSamworth_alignedBasis_le
    {𝕜 : Type*} [RCLike 𝕜]
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    {A B : E →ₗ[𝕜] E} (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {n d : ℕ} (hn : finrank 𝕜 E = n) {e : Fin d ↪ Fin n} {U V : Submodule 𝕜 E}
    (hcorr : hA.CorrespondingEigenblocks hB hn e U V)
    {Δ : ℝ} (hΔ : 0 < Δ) (hgap : Module.End.PointInternalGap A U Δ) :
    ∃ u v : Fin d → E, Orthonormal 𝕜 u ∧ Orthonormal 𝕜 v ∧
      Submodule.span 𝕜 (Set.range u) = U ∧ Submodule.span 𝕜 (Set.range v) = V ∧
      √(∑ i, ‖v i - u i‖ ^ 2) ≤
        2 * √2 * min (√d * ‖(B - A).toContinuousLinearMap‖)
          (TauCeti.UnitarilyInvariantSeminorm.frobenius 𝕜 E E (B - A)) / Δ := by
  sorry

/-- **The Yu–Wang–Samworth single-eigenvector theorem.** Let `u` and `v` be unit eigenvectors of
the symmetric operators `A` and `B`, at the same sorted eigenvalue index, and let the eigenvalue
`λ` of `u` be at distance at least `Δ > 0` from every eigenvalue of `A` on `uᗮ`. Then some scalar
`c` of modulus one aligns `v` with `u`: `‖c v - u‖ ≤ 2√2 ‖B - A‖ / Δ` (Yu–Wang–Samworth 2015,
Corollary 3). It is the case `d = 1` of `yuWangSamworth_alignedBasis_le` in the vector form
statisticians use, kept as a check that the hypotheses of that theorem specialise to a single
eigenvector. That `v` is an eigenvector of `B` is part of `hcorr`. README §4.18. -/
theorem yuWangSamworth_eigenvector_le
    {𝕜 : Type*} [RCLike 𝕜]
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
    {A B : E →ₗ[𝕜] E} (hA : A.IsSymmetric) (hB : B.IsSymmetric)
    {n : ℕ} (hn : finrank 𝕜 E = n) {e : Fin 1 ↪ Fin n}
    {u v : E} (hu : ‖u‖ = 1) (hv : ‖v‖ = 1)
    {lam Δ : ℝ} (hAu : A u = (lam : 𝕜) • u)
    (hcorr : hA.CorrespondingEigenblocks hB hn e (𝕜 ∙ u) (𝕜 ∙ v))
    (hΔ : 0 < Δ)
    (hgap : ∀ ν ∈ Module.End.restrictedPointSpectrum A (𝕜 ∙ u)ᗮ, Δ ≤ |lam - ν|) :
    ∃ c : 𝕜, ‖c‖ = 1 ∧ ‖c • v - u‖ ≤ 2 * √2 * ‖(B - A).toContinuousLinearMap‖ / Δ := by
  sorry

end TauCetiRoadmap.SpectralSubspacePerturbation
