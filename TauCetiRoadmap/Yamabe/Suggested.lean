module

public import Mathlib
public import TauCeti.Analysis.PDE.Yamabe.ConformalLaplacian
public import TauCeti.Analysis.PDE.Yamabe.Quotient
public import TauCeti.Analysis.PDE.Yamabe.SphereConstant
public import TauCeti.Analysis.Sobolev.D1p0.Basic
public import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.ConformallyFlat
public import TauCeti.Geometry.Manifold.Riemannian.Isometry.Basic
public import TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic
public import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Total
public import TauCeti.Geometry.Manifold.Riemannian.WithMetric

/-!
# The Yamabe problem and conformal scalar curvature: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, and introduces no
definition. The conformal Laplacian `TauCeti.Yamabe.conformalLaplacian`, the Yamabe quotient
`TauCeti.Yamabe.yamabeQuotient`, the constants `TauCeti.Yamabe.conformalCoefficient`,
`TauCeti.Yamabe.criticalExponent` and `TauCeti.Yamabe.sphereYamabeConstant`, the bubbles
`TauCeti.Yamabe.bubble`, the homogeneous space `TauCeti.D1p0`, the Weyl and Cotton tensors,
local conformal flatness `Bundle.ContMDiffRiemannianMetric.IsLocallyConformallyFlat` and the
round metric of the unit sphere are Tau Ceti's.

Statable at the pins and stated here: the converse of the Weyl–Schouten theorem, through the
Weyl tensor for `n ≥ 4` and the Cotton tensor for `n = 3` (Y0.5); the sharp Euclidean Sobolev
inequality (Y2.1) and the classification of its equality cases in `D^{1,2}` (Y2.2); Aubin's bound
`Y ≤ Y(Sⁿ)` (Y3.1); Theorem A, a smooth positive minimizer when `Y < Y(Sⁿ)` (Y3.3); Aubin's strict
inequality for `n ≥ 6` at a point of nonzero Weyl tensor (Theorem B, Y5); Schoen's strict
inequality off the conformal sphere for `3 ≤ n ≤ 5` or a vanishing Weyl tensor (Theorem C, Y7 and
Y8.4); the Yamabe theorem, in its minimizer and constant-scalar-curvature forms (Y9.1); uniqueness
of the unit-volume constant-scalar-curvature metric of nonpositive scalar curvature in a conformal
class (Y9.2); Obata's Hessian theorem, the equality case of the Lichnerowicz bound, and the
constant-scalar-curvature metrics conformal to the round sphere and to a positive Einstein metric
(Y9.3); and the characterization of the conformal sphere by `Y = Y(Sⁿ)` (Y9.4).

Two notions are spelled out in place rather than named. Being conformal to the round sphere is a
diffeomorphism onto the unit sphere of `ℝⁿ⁺¹` whose differential pulls the round inner product
back to a positive multiple of the metric. In Theorem C, local conformal flatness in dimension at
least `6` is the vanishing of the Weyl tensor, equivalent to it by Y0.5.

Not restated here, because Tau Ceti proves them and the README cites the declarations: the
conformal laws of the connection, curvature, Ricci, scalar, Schouten, Weyl and Cotton tensors, of
the gradient, Hessian, Laplacian and volume, the scalar law `Scal_ĝ = u^(-(n+2)/(n-2)) L_g u` and
the covariance of `L_g` (Y0.1–Y0.2); the energy identity, the conformal class, the critical
volume identity and the Euler–Lagrange equation of the Yamabe quotient (Y0.2–Y0.3); the area of
the round sphere (Y0.4); `div W = (n - 3) C`, the integrability identity of the conformal
flattening equation and the forward half of Weyl–Schouten (Y0.5); the space `D^{1,2}` with its
Sobolev embedding, dilations and translations (Y2.1); and the bubble equation, the bubble
energies and the cutoff-bubble estimates (Y2.3).

Not statable at the pins, hence not stated: the identity `m = 2A` of Y6 between the ADM mass of
the Green blow-up and the constant term of the Green function, which needs the ADM mass of an
asymptotically Euclidean end (PositiveMass 0.2), absent at the pin. The intermediate
constructions of Y1, Y2.4, Y4, Y6, Y8.1–Y8.3 and Y10 are specified in the README only.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.Yamabe

open Bundle MeasureTheory Module
open scoped ContDiff Manifold ENNReal InnerProductSpace

/-! ## Layer 2: the sharp Euclidean Sobolev inequality -/

section Euclidean

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
  [MeasurableSpace F] [BorelSpace F]

/-- Y2.1, the sharp Euclidean Sobolev inequality (Lee–Parker, Theorem 3.3 and (3.6), p. 50): for
`n ≥ 3` and a smooth compactly supported `u` on `ℝⁿ`,
`Y(Sⁿ) (∫ |u| ^ pₙ) ^ (2 / pₙ) ≤ aₙ ∫ |du|²`. It extends to `D^{1,2}` by the density of the test
functions in `TauCeti.D1p0`. -/
theorem sphereYamabeConstant_mul_le
    (hn : 3 ≤ finrank ℝ F) (u : F → ℝ) (hu : ContDiff ℝ ∞ u) (hc : HasCompactSupport u) :
    TauCeti.Yamabe.sphereYamabeConstant (finrank ℝ F) *
        (∫ x, |u x| ^ TauCeti.Yamabe.criticalExponent (finrank ℝ F)) ^
          (2 / TauCeti.Yamabe.criticalExponent (finrank ℝ F)) ≤
      TauCeti.Yamabe.conformalCoefficient (finrank ℝ F) * ∫ x, ‖fderiv ℝ u x‖ ^ 2 := by
  sorry

/-- Y2.2, the equality cases of the sharp Sobolev inequality (Lee–Parker, Theorem 3.3, p. 50): a
nonzero `u ∈ D^{1,2}(ℝⁿ)`, `n ≥ 3`, with `Y(Sⁿ) ‖u‖²_{pₙ} = aₙ ‖∇u‖²₂` is almost everywhere a
nonzero multiple of a bubble `U_{t,b}`. The norm of `u` is the `L²` norm of its gradient, and
`TauCeti.D1p0.sobolevEmbeddingL` reads it as a function in `L^{pₙ}`; `hexp` forces
`pstar = pₙ`. -/
theorem exists_ae_eq_mul_bubble_of_mul_norm_sq_eq (hn : 3 ≤ finrank ℝ F) {pstar : ℝ≥0∞}
    (hexp : pstar⁻¹ + (finrank ℝ F : ℝ≥0∞)⁻¹ = 2⁻¹)
    (u : TauCeti.D1p0 (volume : Measure F) ⊤ 2) (hu : u ≠ 0)
    (heq : TauCeti.Yamabe.sphereYamabeConstant (finrank ℝ F) *
        ‖TauCeti.D1p0.sobolevEmbeddingL hexp u‖ ^ 2 =
      TauCeti.Yamabe.conformalCoefficient (finrank ℝ F) * ‖u‖ ^ 2) :
    ∃ c : ℝ, c ≠ 0 ∧ ∃ t : ℝ, 0 < t ∧ ∃ b : F,
      (TauCeti.D1p0.sobolevEmbeddingL hexp u : F → ℝ) =ᵐ[volume]
        fun x ↦ c * TauCeti.Yamabe.bubble t b x := by
  sorry

end Euclidean

/-! ## Closed manifolds: Layers 0, 3, 5, 7–9 -/

section Closed

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M]

/-- Y0.5, the converse of the Weyl–Schouten theorem in dimension at least four (Lee–Parker,
p. 43): a smooth metric whose Weyl tensor vanishes everywhere is locally conformally flat. Tau
Ceti's `Bundle.ContMDiffRiemannianMetric.IsLocallyConformallyFlat.weylTensor_eq_zero` is the
forward implication. -/
theorem isLocallyConformallyFlat_of_weylTensor_eq_zero [T2Space M] [IsManifold I ∞ M]
    (hn : 4 ≤ finrank ℝ E) (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x))
    (hW : ∀ x, (letI : RiemannianBundle (fun x : M ↦ TangentSpace I x) := ⟨g.toRiemannianMetric⟩;
      (CovariantDerivative.leviCivitaConnection I M).weylTensor x) = 0) :
    g.IsLocallyConformallyFlat := by
  sorry

/-- Y0.5, the converse of the Weyl–Schouten theorem in dimension three, where the Weyl tensor
vanishes identically: a smooth metric whose Cotton tensor vanishes everywhere is locally
conformally flat. Tau Ceti's
`Bundle.ContMDiffRiemannianMetric.IsLocallyConformallyFlat.cottonTensor_eq_zero` is the forward
implication. -/
theorem isLocallyConformallyFlat_of_cottonTensor_eq_zero [T2Space M] [IsManifold I ∞ M]
    (hn : finrank ℝ E = 3) (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x))
    (hC : ∀ x, (letI : RiemannianBundle (fun x : M ↦ TangentSpace I x) := ⟨g.toRiemannianMetric⟩;
      (CovariantDerivative.leviCivitaConnection I M).cottonTensor x) = 0) :
    g.IsLocallyConformallyFlat := by
  sorry

/-- Y3.1, Aubin's bound `Y ≤ Y(Sⁿ)` (Lee–Parker, Lemma 3.4, p. 50): on a closed connected
manifold of dimension `n ≥ 3`, for every `ε > 0` some smooth positive function has Yamabe quotient
below `Y(Sⁿ) + ε`, so the infimum over smooth positive functions is at most `Y(Sⁿ)`. -/
theorem exists_yamabeQuotient_lt [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ConnectedSpace M] [I.Boundaryless] [IsManifold I ∞ M]
    [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (hn : 3 ≤ finrank ℝ E) {ε : ℝ} (hε : 0 < ε) :
    ∃ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u ∧ (∀ x, 0 < u x) ∧
      TauCeti.Yamabe.yamabeQuotient I u <
        TauCeti.Yamabe.sphereYamabeConstant (finrank ℝ E) + ε := by
  sorry

/-- Y3.3, Theorem A of Yamabe, Trudinger and Aubin (Lee–Parker, Theorem A, p. 39, through
Proposition 4.4 and Theorem 4.5, pp. 54–55): on a closed connected manifold of dimension
`n ≥ 3` whose Yamabe invariant is below `Y(Sⁿ)`, some smooth positive function minimizes the
Yamabe quotient among smooth positive functions. -/
theorem exists_isMinOn_yamabeQuotient_of_lt [T2Space M]
    [SecondCountableTopology M] [CompactSpace M] [ConnectedSpace M] [I.Boundaryless]
    [IsManifold I ∞ M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (hn : 3 ≤ finrank ℝ E)
    (h : ∃ v : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ v ∧ (∀ x, 0 < v x) ∧
      TauCeti.Yamabe.yamabeQuotient I v < TauCeti.Yamabe.sphereYamabeConstant (finrank ℝ E)) :
    ∃ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u ∧ (∀ x, 0 < u x) ∧
      IsMinOn (TauCeti.Yamabe.yamabeQuotient I) {v | ContMDiff I 𝓘(ℝ) ∞ v ∧ ∀ x, 0 < v x} u := by
  sorry

/-- Y5, Aubin's strict inequality, Theorem B (Lee–Parker, Theorem B, p. 39, with its proof,
pp. 58–59): on a closed connected manifold of dimension `n ≥ 6` whose Weyl tensor is nonzero at
some point, some smooth positive function has Yamabe quotient below `Y(Sⁿ)`. -/
theorem exists_yamabeQuotient_lt_sphereYamabeConstant_of_weylTensor_ne_zero [T2Space M]
    [SecondCountableTopology M] [CompactSpace M] [ConnectedSpace M] [I.Boundaryless]
    [IsManifold I ∞ M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (hn : 6 ≤ finrank ℝ E)
    (hW : ∃ x, (CovariantDerivative.leviCivitaConnection I M).weylTensor x ≠ 0) :
    ∃ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u ∧ (∀ x, 0 < u x) ∧
      TauCeti.Yamabe.yamabeQuotient I u < TauCeti.Yamabe.sphereYamabeConstant (finrank ℝ E) := by
  sorry

/-- Y7 and Y8.4, Schoen's strict inequality, Theorem C (Lee–Parker, Theorem C, p. 40): on a
closed connected manifold of dimension `3 ≤ n ≤ 5`, or of any dimension `n ≥ 3` with vanishing
Weyl tensor, that is not conformal to the round sphere, some smooth positive function has Yamabe
quotient below `Y(Sⁿ)`. No orientation or Spin structure is assumed. -/
theorem exists_yamabeQuotient_lt_sphereYamabeConstant_of_not_conformal [T2Space M]
    [SecondCountableTopology M] [CompactSpace M] [ConnectedSpace M] [I.Boundaryless]
    [IsManifold I ∞ M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    {n : ℕ} (hE : finrank ℝ E = n) (hn : 3 ≤ n)
    (hW : n ≤ 5 ∨ ∀ x, (CovariantDerivative.leviCivitaConnection I M).weylTensor x = 0)
    (hconf : ¬ ∃ (Φ : M ≃ₘ⟮I, 𝓡 n⟯ Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)
      (f : M → ℝ), (∀ x, 0 < f x) ∧ ∀ x (v w : TangentSpace I x),
        ⟪mfderiv I (𝓡 n) Φ x v, mfderiv I (𝓡 n) Φ x w⟫_ℝ = f x * ⟪v, w⟫_ℝ) :
    ∃ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u ∧ (∀ x, 0 < u x) ∧
      TauCeti.Yamabe.yamabeQuotient I u < TauCeti.Yamabe.sphereYamabeConstant n := by
  sorry

/-- Y9.1, the Yamabe theorem, minimizer form (Lee–Parker, the Yamabe theorem, p. 85, with
Theorem 4.5, p. 55): on every closed connected manifold of dimension `n ≥ 3` some smooth positive
function minimizes the Yamabe quotient among smooth positive functions. -/
theorem exists_isMinOn_yamabeQuotient [T2Space M]
    [SecondCountableTopology M] [CompactSpace M] [ConnectedSpace M] [I.Boundaryless]
    [IsManifold I ∞ M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    (hn : 3 ≤ finrank ℝ E) :
    ∃ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u ∧ (∀ x, 0 < u x) ∧
      IsMinOn (TauCeti.Yamabe.yamabeQuotient I) {v | ContMDiff I 𝓘(ℝ) ∞ v ∧ ∀ x, 0 < v x} u := by
  sorry

/-- Y9.1, the Yamabe theorem (Lee–Parker, the Yamabe theorem, p. 85): every smooth metric on a
closed connected manifold of dimension `n ≥ 3` has a conformal rescaling of constant scalar
curvature. -/
theorem exists_rescale_scalarCurvature_eq_const [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ConnectedSpace M] [I.Boundaryless] [IsManifold I ∞ M]
    (hn : 3 ≤ finrank ℝ E) (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) :
    ∃ (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hf_pos : ∀ x, 0 < f x) (c : ℝ),
      ∀ x, (g.rescale f hf hf_pos).scalarCurvature x = c := by
  sorry

/-- Y9.2, uniqueness in a conformal class of nonpositive Yamabe invariant: on a closed connected
manifold of dimension `n ≥ 3`, two unit-volume metrics `f₁ g` and `f₂ g` of constant scalar
curvature, the first nonpositive, coincide. The sign of the second constant is then forced. -/
theorem eq_of_scalarCurvature_rescale_eq_of_nonpos [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ConnectedSpace M] [I.Boundaryless] [IsManifold I ∞ M]
    [MeasurableSpace M] [BorelSpace M]
    (hn : 3 ≤ finrank ℝ E) (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x))
    {f₁ f₂ : M → ℝ} (hf₁ : ContMDiff I 𝓘(ℝ) ∞ f₁) (hf₁_pos : ∀ x, 0 < f₁ x)
    (hf₂ : ContMDiff I 𝓘(ℝ) ∞ f₂) (hf₂_pos : ∀ x, 0 < f₂ x) {c₁ c₂ : ℝ} (hc₁ : c₁ ≤ 0)
    (h₁ : ∀ x, (g.rescale f₁ hf₁ hf₁_pos).scalarCurvature x = c₁)
    (h₂ : ∀ x, (g.rescale f₂ hf₂ hf₂_pos).scalarCurvature x = c₂)
    (hV₁ : TauCeti.riemannianTotalVolume I (TauCeti.WithMetric (g.rescale f₁ hf₁ hf₁_pos)) = 1)
    (hV₂ : TauCeti.riemannianTotalVolume I (TauCeti.WithMetric (g.rescale f₂ hf₂ hf₂_pos)) = 1) :
    f₁ = f₂ := by
  sorry

/-- Y9.3, the constant-scalar-curvature metrics conformal to a positive Einstein metric (Obata,
*The conjectures on conformal transformations of Riemannian manifolds*, 1971): on a closed
connected manifold of dimension `n ≥ 3` with `Ric = κ g`, `κ > 0`, not conformal to the round
sphere, a conformal rescaling `f g` of constant scalar curvature has constant `f`. -/
theorem exists_forall_eq_of_ricciTensor_eq_smul [T2Space M] [SecondCountableTopology M]
    [CompactSpace M] [ConnectedSpace M] [I.Boundaryless] [IsManifold I ∞ M]
    {n : ℕ} (hE : finrank ℝ E = n) (hn : 3 ≤ n)
    (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) {κ : ℝ} (hκ : 0 < κ)
    (hRic : ∀ x (v w : TangentSpace I x),
      (letI : RiemannianBundle (fun x : M ↦ TangentSpace I x) := ⟨g.toRiemannianMetric⟩;
        (CovariantDerivative.leviCivitaConnection I M).ricciTensor x v w) = κ * g.inner x v w)
    (hconf : ¬ ∃ (Φ : M ≃ₘ⟮I, 𝓡 n⟯ Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)
      (h : M → ℝ), (∀ x, 0 < h x) ∧ ∀ x (v w : TangentSpace I x),
        ⟪mfderiv I (𝓡 n) Φ x v, mfderiv I (𝓡 n) Φ x w⟫_ℝ = h x * g.inner x v w)
    {f : M → ℝ} (hf : ContMDiff I 𝓘(ℝ) ∞ f) (hf_pos : ∀ x, 0 < f x) {c : ℝ}
    (hc : ∀ x, (g.rescale f hf hf_pos).scalarCurvature x = c) :
    ∃ a : ℝ, ∀ x, f x = a := by
  sorry

/-- Y9.4, the conformal sphere is characterized by its invariant (Lee–Parker, Theorems B and C,
pp. 39–40, with Theorem 3.2, p. 49): on a closed connected manifold of dimension `n ≥ 3`, every
smooth positive function has Yamabe quotient at least `Y(Sⁿ)`, that is `Y = Y(Sⁿ)` by Y3.1,
exactly when the manifold is conformal to the round sphere. -/
theorem forall_le_yamabeQuotient_iff [T2Space M]
    [SecondCountableTopology M] [CompactSpace M] [ConnectedSpace M] [I.Boundaryless]
    [IsManifold I ∞ M] [MeasurableSpace M] [BorelSpace M]
    [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
    [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
    [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]
    {n : ℕ} (hE : finrank ℝ E = n) (hn : 3 ≤ n) :
    (∀ u : M → ℝ, ContMDiff I 𝓘(ℝ) ∞ u → (∀ x, 0 < u x) →
        TauCeti.Yamabe.sphereYamabeConstant n ≤ TauCeti.Yamabe.yamabeQuotient I u) ↔
      ∃ (Φ : M ≃ₘ⟮I, 𝓡 n⟯ Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)
        (f : M → ℝ), (∀ x, 0 < f x) ∧ ∀ x (v w : TangentSpace I x),
          ⟪mfderiv I (𝓡 n) Φ x v, mfderiv I (𝓡 n) Φ x w⟫_ℝ = f x * ⟪v, w⟫_ℝ := by
  sorry

end Closed

/-! ## Layer 9: rigidity of the round sphere -/

section Obata

variable {n : ℕ} {M : Type*} [MetricSpace M]
  [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [IsManifold (𝓡 n) ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace (𝓡 n) x)]
  [IsContMDiffRiemannianBundle (𝓡 n) ∞ (EuclideanSpace ℝ (Fin n))
    (fun x : M ↦ TangentSpace (𝓡 n) x)]
  [IsContMDiffRiemannianBundle (𝓡 n) 1 (EuclideanSpace ℝ (Fin n))
    (fun x : M ↦ TangentSpace (𝓡 n) x)]
  [IsContMDiffRiemannianBundle (𝓡 n) 2 (EuclideanSpace ℝ (Fin n))
    (fun x : M ↦ TangentSpace (𝓡 n) x)]
  [IsRiemannianManifold (𝓡 n) M] [ConnectedSpace M]

/-- Y9.3, Obata's theorem (Obata, *Certain conditions for a Riemannian manifold to be isometric
with a sphere*, 1962): a complete connected Riemannian manifold of dimension `n ≥ 2` carrying a
nonzero smooth `f` with `Hess f = -f g` is isometric to the unit sphere of `ℝⁿ⁺¹`. The case
`Hess f = -k f g`, `k > 0`, is this one for the metric `k g`. The order-one and order-two
Riemannian-bundle instances are the ones the Hessian and curvature read. -/
theorem nonempty_riemannianIsometry_sphere_of_hessian_eq [CompleteSpace M] (hn : 2 ≤ n)
    {f : M → ℝ} (hf : ContMDiff (𝓡 n) 𝓘(ℝ) ∞ f) (hf₀ : ∃ x, f x ≠ 0)
    (hH : ∀ x (v w : TangentSpace (𝓡 n) x),
      TauCeti.Manifold.hessian (𝓡 n) f x v w = -(f x * ⟪v, w⟫_ℝ)) :
    Nonempty (TauCeti.RiemannianIsometry (𝓡 n) (𝓡 n) M
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)) := by
  sorry

/-- Y9.3, the equality case of the Lichnerowicz bound: a closed connected Riemannian manifold of
dimension `n ≥ 2` with `Ric ≥ (n - 1) g` and a nonzero smooth `f` with `Δ⁺ f = n f` is isometric to
the unit sphere of `ℝⁿ⁺¹`. RiemannianGeometry R7.0 gives `Hess f = -f g`, and
`nonempty_riemannianIsometry_sphere_of_hessian_eq` concludes; the bound itself is Tau Ceti's
`TauCeti.Manifold.finrank_mul_le_of_laplaceBeltrami_eq_neg_mul`. -/
theorem nonempty_riemannianIsometry_sphere_of_laplaceBeltrami_eq [CompactSpace M]
    [MeasurableSpace M] [BorelSpace M] (hn : 2 ≤ n)
    (hRic : ∀ (x : M) (v : TangentSpace (𝓡 n) x),
      ((n : ℝ) - 1) * ‖v‖ ^ 2 ≤
        (CovariantDerivative.leviCivitaConnection (𝓡 n) M).ricciTensor x v v)
    {f : M → ℝ} (hf : ContMDiff (𝓡 n) 𝓘(ℝ) ∞ f) (hf₀ : ∃ x, f x ≠ 0)
    (heig : ∀ x, TauCeti.Manifold.laplaceBeltrami (𝓡 n) f x = -(n * f x)) :
    Nonempty (TauCeti.RiemannianIsometry (𝓡 n) (𝓡 n) M
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1)) := by
  sorry

end Obata

/-- Y9.3, the constant-scalar-curvature metrics conformal to the round sphere (Lee–Parker,
Proposition 3.1, p. 48, and Theorem 3.2, p. 49): for `n ≥ 3`, if `u ^ (4 / (n - 2)) g` has
constant scalar curvature `c` on the unit sphere `Sⁿ`, so that `L u = c u ^ (pₙ - 1)`, then a
conformal diffeomorphism of `Sⁿ` pulls the round metric back to a constant multiple of that
metric. -/
theorem exists_diffeomorph_of_conformalLaplacian_eq {n : ℕ} (hn : 3 ≤ n)
    {u : Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1 → ℝ}
    (hu : ContMDiff (𝓡 n) 𝓘(ℝ) ∞ u) (hu_pos : ∀ x, 0 < u x) {c : ℝ}
    (hc : ∀ x, TauCeti.Yamabe.conformalLaplacian (𝓡 n) u x =
      c * u x ^ (TauCeti.Yamabe.criticalExponent n - 1)) :
    ∃ (Φ : Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1 ≃ₘ⟮𝓡 n, 𝓡 n⟯
        Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) (a : ℝ), 0 < a ∧
      ∀ x (v w : TangentSpace (𝓡 n) x), ⟪mfderiv (𝓡 n) (𝓡 n) Φ x v, mfderiv (𝓡 n) (𝓡 n) Φ x w⟫_ℝ =
        a * u x ^ (4 / ((n : ℝ) - 2)) * ⟪v, w⟫_ℝ := by
  sorry

end TauCetiRoadmap.Yamabe
