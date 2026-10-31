import Mathlib
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Ricci
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Scalar
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Sectional
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Metric

/-!
# Ricci flow, preserved curvature cones, and sphere theorems: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions needed to state them (smooth metrics and their curvatures with the metric's own
Levi-Civita connection installed locally, the metric-family and Ricci-flow predicates, the
algebraic curvature tensors, the reaction tensor and the four-frame PIC2 condition).

Headline theorems stated here:

* short-time existence and uniqueness of the Ricci flow on a closed manifold
  (`exists_shortTime_ricciFlow`, `ricciFlow_unique`, Layers 2–3);
* the Bianchi-preservation and basis-independence of the reaction tensor and the inward-pointing
  of the reaction on the PIC2 cone, and strict quarter pinching implies interior PIC2
  (`reactionTensor_mem`, `reactionTensor_apply_orthonormalBasis`,
  `reaction_mem_positive_tangentCone_pic2`, `strict_quarterPinching_isPIC2`, Layer 5);
* Hamilton's theorem in dimension three (`hamilton_positiveRicci_dim3`), Brendle–Schoen's
  pointwise quarter-pinched theorem in dimensions at least four
  (`brendleSchoen_pointwise_quarterPinched`) and its differentiable sphere theorem
  (`brendleSchoen_diffeomorph_sphere`, Layer 7);
* the positive-curvature surface theorem (`positiveScalar_surface`) and the global
  quarter-pinched sphere theorem in every dimension at least two
  (`global_quarterPinched_diffeomorph_sphere`, Layer 8).

Each sphere theorem is stated in its metric form, "`M` carries a smooth metric of constant
positive sectional curvature", through Tau Ceti's `Bundle.ContMDiffRiemannianMetric.IsConstantCurvatureTensor`,
and, for simply connected `M`, as a diffeomorphism onto the round sphere.

Not statable at the pins:

* Böhm–Wilking's theorem (a closed manifold with 2-positive curvature operator carries a metric
  of constant positive curvature): the curvature operator is a self-adjoint operator on the
  bivector space `Λ²T_xM` with its Gram inner product, and 2-positivity is a condition on its two
  smallest eigenvalues; the bivector bundle with that inner product is RiemannianGeometry R1's
  target on SmoothBundlesConnections B2's exterior square, and no bivector carrier exists at the
  pins. Its special case, positive curvature operator, lacks the same carrier.
* The convergence forms of all sphere theorems (the volume-normalized Ricci flow exists for all
  time and converges in every `C^k` norm to the round metric): there is no `C^k` topology on
  families of metrics and no iterated covariant derivative of a metric family at the pins.
* The space-form form of the sphere theorems for non-simply-connected `M` (a diffeomorphism onto
  `Sⁿ/Γ` with `Γ` a finite group of isometries acting freely): the quotient model is
  RiemannianGeometry R4.7's target.
-/

open Bundle Set
open scoped Manifold ContDiff NNReal

namespace TauCetiRoadmap.RicciFlow

/-! ## Layer 1: metric families and variation calculus -/

section Metrics

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [T2Space M] [ChartedSpace H M]
  [IsManifold I ∞ M]

/-- A smooth Riemannian metric on `M`: Mathlib's `ContMDiffRiemannianMetric` of order `∞` on the
tangent bundle. -/
abbrev SmoothMetric (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M] :=
  ContMDiffRiemannianMetric I ∞ E (TangentSpace I : M → Type _)

/-- The Ricci tensor of the Levi-Civita connection of `g` at `x`, with the metric instance
installed locally: `Ric(u,v) = trace (w ↦ R(w,u)v)`, positive on the round sphere. -/
noncomputable def metricRicci (g : SmoothMetric I M) (x : M) :
    TangentSpace I x →ₗ[ℝ] TangentSpace I x →ₗ[ℝ] ℝ :=
  letI : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  (CovariantDerivative.leviCivitaConnection I M).ricciTensor x

/-- The scalar curvature of `g` at `x`: the `g`-trace of `metricRicci g x`. -/
noncomputable def metricScalar (g : SmoothMetric I M) (x : M) : ℝ :=
  letI : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  (CovariantDerivative.leviCivitaConnection I M).scalarCurvature x

/-- The sectional curvature of `g` at `x` on the plane spanned by `u` and `v`:
`⟪R(u,v)v, u⟫ / det Gram(u,v)`, a junk value on linearly dependent pairs. -/
noncomputable def metricSectional (g : SmoothMetric I M) (x : M)
    (u v : TangentSpace I x) : ℝ :=
  letI : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  (CovariantDerivative.leviCivitaConnection I M).sectionalCurvature
    (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) x u v

/-- A family of smooth metrics is smooth on the time set `s` when the coefficient map
`(t, x) ↦ g_t(x)` is a smooth section over `s × M` of the bilinear-form bundle: joint
time/space regularity, not only smoothness at each time separately. -/
def IsSmoothMetricFamilyOn (g : ℝ → SmoothMetric I M) (s : Set ℝ) : Prop :=
  ContMDiffOn (𝓘(ℝ, ℝ).prod I)
    (I.prod 𝓘(ℝ, E →L[ℝ] E →L[ℝ] ℝ)) ∞
    (fun tx : ℝ × M => TotalSpace.mk' (E →L[ℝ] E →L[ℝ] ℝ)
      (E := fun x : M => TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ)
      tx.2 ((g tx.1).inner tx.2)) (s ×ˢ univ)

/-- The unnormalized Ricci flow `∂_t g = −2 Ric(g)` on the time set `s`: a smooth metric family
whose coefficients `g_t(x)(v,w)` have, within `s`, time derivative `−2 Ric(g_t)_x(v,w)`.
Within-derivatives give the one-sided equation at the initial time. -/
def IsRicciFlowOn (g : ℝ → SmoothMetric I M) (s : Set ℝ) : Prop :=
  IsSmoothMetricFamilyOn g s ∧ ∀ t ∈ s, ∀ x (v w : TangentSpace I x),
    HasDerivWithinAt (fun τ => (g τ).inner x v w)
      (-2 * metricRicci (g t) x v w) s t

/-! ## Layer 2 and Layer 3: parabolic foundations, DeTurck gauge and maximal flows -/

/-- Hamilton–DeTurck short-time existence: every smooth metric on a closed manifold is the initial
value of a Ricci flow on some interval `[0, T]`, `T > 0` (Topping, Theorem 5.2.1). -/
theorem exists_shortTime_ricciFlow [CompactSpace M] (g₀ : SmoothMetric I M) :
    ∃ T : ℝ, 0 < T ∧ ∃ g : ℝ → SmoothMetric I M,
      g 0 = g₀ ∧ IsRicciFlowOn g (Icc 0 T) := by
  sorry

/-- Forward uniqueness of the Ricci flow on a closed manifold: two flows on `[0, T]` with the same
initial metric agree at every time of the interval. -/
theorem ricciFlow_unique [CompactSpace M] (T : ℝ) (hT : 0 < T)
    (g h : ℝ → SmoothMetric I M)
    (hg : IsRicciFlowOn g (Icc 0 T)) (hh : IsRicciFlowOn h (Icc 0 T))
    (h₀ : g 0 = h 0) : ∀ t ∈ Icc 0 T, g t = h t := by
  sorry

end Metrics

/-! ## Layer 5: algebraic curvature operators and invariant cones -/

section AlgebraicCurvature

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
  [FiniteDimensional ℝ V]

/-- Real continuous four-linear forms on `V`, the carrier of algebraic curvature tensors. -/
abbrev FourTensor (V : Type*) [NormedAddCommGroup V] [NormedSpace ℝ V] :=
  ContinuousMultilinearMap ℝ (fun _ : Fin 4 => V) ℝ

/-- The algebraic curvature symmetries of `r(u,v,z,w) = g(R(u,v)w, z)`: skew-symmetry in the first
and in the last pair, pair interchange and the first Bianchi identity. With this convention
`r(u,v,u,v)` is positive on the round sphere. -/
def IsAlgebraicCurvature (r : FourTensor V) : Prop :=
  (∀ u v z w, r ![u,v,z,w] = -r ![v,u,z,w]) ∧
  (∀ u v z w, r ![u,v,z,w] = -r ![u,v,w,z]) ∧
  (∀ u v z w, r ![u,v,z,w] = r ![z,w,u,v]) ∧
  (∀ u v z w, r ![u,v,z,w] + r ![v,z,u,w] + r ![z,u,v,w] = 0)

/-- The submodule of algebraic curvature tensors. Its closedness and its comparison with the
curvature operator on bivectors are Layer 5 targets. -/
def algebraicCurvatureSubmodule : Submodule ℝ (FourTensor V) where
  carrier := {r | IsAlgebraicCurvature r}
  zero_mem' := by simp [IsAlgebraicCurvature]
  add_mem' := by
    intro r q hr hq
    rcases hr with ⟨hr₁,hr₂,hr₃,hr₄⟩
    rcases hq with ⟨hq₁,hq₂,hq₃,hq₄⟩
    refine ⟨?_,?_,?_,?_⟩ <;> intro u v z w
    · simp only [add_apply]; rw [hr₁, hq₁]; ring
    · simp only [add_apply]; rw [hr₂, hq₂]; ring
    · simp only [add_apply]; rw [hr₃, hq₃]
    · simp only [add_apply]
      linear_combination hr₄ u v z w + hq₄ u v z w
  smul_mem' := by
    intro c r hr
    rcases hr with ⟨hr₁,hr₂,hr₃,hr₄⟩
    refine ⟨?_,?_,?_,?_⟩ <;> intro u v z w
    · simp only [smul_apply, smul_eq_mul]; rw [hr₁]; ring
    · simp only [smul_apply, smul_eq_mul]; rw [hr₂]; ring
    · simp only [smul_apply, smul_eq_mul]; rw [hr₃]
    · simp only [smul_apply, smul_eq_mul]
      linear_combination c * hr₄ u v z w

/-- The rank-one four-tensor `(u,v,z,w) ↦ ⟪b i,u⟫ ⟪b j,v⟫ ⟪b k,z⟫ ⟪b l,w⟫` attached to four
vectors of a family `b`. -/
noncomputable def coordFourTensor {ι : Type*} (b : ι → V) (i j k l : ι) : FourTensor V :=
  (ContinuousMultilinearMap.mkPiAlgebraFin ℝ 4 ℝ).compContinuousLinearMap
    ![innerSL ℝ (b i), innerSL ℝ (b j), innerSL ℝ (b k), innerSL ℝ (b l)]

/-- The components of the reaction tensor `Q(r)` in an orthonormal basis `b`, with
`r_ijpq = r(b i, b j, b p, b q)`:
`Q(r)_ijkl = Σ_pq r_ijpq r_klpq + 2 Σ_pq r_ipkq r_jplq − 2 Σ_pq r_iplq r_jpkq`
(Brendle–Schoen, Manifolds with 1/4-pinched curvature are space forms, §2). -/
noncomputable def reactionComponent {ι : Type*} [Fintype ι] (b : OrthonormalBasis ι ℝ V)
    (r : FourTensor V) (i j k l : ι) : ℝ :=
  (∑ p, ∑ q, r ![b i, b j, b p, b q] * r ![b k, b l, b p, b q]) +
  2 * (∑ p, ∑ q, r ![b i, b p, b k, b q] * r ![b j, b p, b l, b q]) -
  2 * (∑ p, ∑ q, r ![b i, b p, b l, b q] * r ![b j, b p, b k, b q])

/-- The reaction tensor `Q(r)` of the curvature evolution `D_t R = L_g R + Q(R)`, expanded in the
standard orthonormal basis of `V`: `Q(r) = Σ_ijkl Q(r)_ijkl ⟪b i,·⟫⟪b j,·⟫⟪b k,·⟫⟪b l,·⟫`. Its
basis independence is `reactionTensor_apply_orthonormalBasis`. -/
noncomputable def reactionTensor (r : FourTensor V) : FourTensor V :=
  ∑ i, ∑ j, ∑ k, ∑ l,
    reactionComponent (stdOrthonormalBasis ℝ V) r i j k l •
      coordFourTensor (stdOrthonormalBasis ℝ V) i j k l

/-- Basis independence of the reaction tensor: in every orthonormal basis `b` of `V`, `Q(r)` is
the contraction `Q(r)(u,v,z,w) = Σ_pq r(u,v,b p,b q) r(z,w,b p,b q) + 2 Σ_pq r(u,b p,z,b q)
r(v,b p,w,b q) − 2 Σ_pq r(u,b p,w,b q) r(v,b p,z,b q)`. -/
theorem reactionTensor_apply_orthonormalBasis {ι : Type*} [Fintype ι]
    (b : OrthonormalBasis ι ℝ V) (r : FourTensor V) (u v z w : V) :
    reactionTensor r ![u,v,z,w] =
      (∑ p, ∑ q, r ![u,v,b p,b q] * r ![z,w,b p,b q]) +
      2 * (∑ p, ∑ q, r ![u,b p,z,b q] * r ![v,b p,w,b q]) -
      2 * (∑ p, ∑ q, r ![u,b p,w,b q] * r ![v,b p,z,b q]) := by
  sorry

/-- The reaction tensor of an algebraic curvature tensor is an algebraic curvature tensor: `Q`
preserves the pair skew-symmetries, pair interchange and the first Bianchi identity
(Hamilton's `Q(R) = 2(R² + R^#)` on the curvature-operator side). -/
theorem reactionTensor_mem (r : FourTensor V) (hr : r ∈ algebraicCurvatureSubmodule (V := V)) :
    reactionTensor r ∈ algebraicCurvatureSubmodule (V := V) := by
  sorry

/-- The isotropic-curvature expression of `r` on the orthonormal four-frame `f` with parameters
`λ = l` and `μ = m`:
`r_1313 + λ² r_1414 + μ² r_2323 + λ² μ² r_2424 − 2 λ μ r_1234`, indices read from `f 0 … f 3`. -/
def pic2Expression (r : FourTensor V) (f : Fin 4 → V) (l m : ℝ) : ℝ :=
  r ![f 0,f 2,f 0,f 2] + l^2 * r ![f 0,f 3,f 0,f 3] +
  m^2 * r ![f 1,f 2,f 1,f 2] + l^2 * m^2 * r ![f 1,f 3,f 1,f 3] -
  2 * l * m * r ![f 0,f 1,f 2,f 3]

/-- The real four-frame form of PIC2 (nonnegative isotropic curvature of the zero extension of
`r` to `V ⊕ ℝ²`): the isotropic expression is nonnegative on every orthonormal four-frame and all
parameters `λ, μ ∈ [−1, 1]`. For `dim V ≥ 4` this is equivalent to PIC2 (Layer 5). -/
def IsPIC2FourFrame (r : FourTensor V) : Prop :=
  ∀ f, Orthonormal ℝ f → ∀ l ∈ Icc (-1 : ℝ) 1,
    ∀ m ∈ Icc (-1 : ℝ) 1, 0 ≤ pic2Expression r f l m

/-- Brendle–Schoen: the reaction `Q(r)` of a PIC2 algebraic curvature tensor `r` lies in the
positive tangent cone of the PIC2 cone at `r`, so the ODE `dR/dt = Q(R)` preserves PIC2
(Manifolds with 1/4-pinched curvature are space forms, Propositions 8–11 and the zero-extension
argument of §3). The scalars are `ℝ≥0`: the real tangent cone would allow negative time. -/
theorem reaction_mem_positive_tangentCone_pic2
    (hn : 4 ≤ Module.finrank ℝ V)
    (r : algebraicCurvatureSubmodule (V := V)) (hr : IsPIC2FourFrame r.1) :
    (⟨reactionTensor r.1, reactionTensor_mem r.1 r.2⟩ : algebraicCurvatureSubmodule (V := V)) ∈
      tangentConeAt (ℝ≥0)
        {q : algebraicCurvatureSubmodule (V := V) | IsPIC2FourFrame q.1} r := by
  sorry

/-- Strict pointwise quarter pinching gives strict PIC2: if every sectional curvature of `r`
lies in `[a, b]` with `0 < a` and `b < 4a`, the isotropic expression is positive on every
orthonormal four-frame and all parameters in `[−1, 1]` (Berger's estimate
`|r_1234| ≤ (2/3)(b − a)`; Brendle–Schoen, Manifolds with 1/4-pinched curvature are space
forms, the remark following Theorem 3). -/
theorem strict_quarterPinching_isPIC2
    (hn : 4 ≤ Module.finrank ℝ V)
    (r : algebraicCurvatureSubmodule (V := V)) (a b : ℝ)
    (ha : 0 < a) (hab : b < 4 * a)
    (hsec : ∀ u v : V, Orthonormal ℝ ![u,v] → a ≤ r.1 ![u,v,u,v] ∧ r.1 ![u,v,u,v] ≤ b) :
    ∀ f, Orthonormal ℝ f → ∀ l ∈ Icc (-1 : ℝ) 1,
      ∀ m ∈ Icc (-1 : ℝ) 1, 0 < pic2Expression r.1 f l m := by
  sorry

end AlgebraicCurvature

/-! ## Layer 7: positive curvature operators and pointwise sphere theorems -/

section SphereTheorems

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [T2Space M] [ChartedSpace H M]
  [IsManifold I ∞ M]

/-- Hamilton's theorem: a closed connected three-manifold carrying a metric of positive Ricci
curvature carries a smooth metric of constant positive sectional curvature
(Topping, Theorem 10.1.1; the convergence form is Layer 7). -/
theorem hamilton_positiveRicci_dim3 [CompactSpace M] [ConnectedSpace M]
    (h3 : Module.finrank ℝ E = 3) (g : SmoothMetric I M)
    (hRic : ∀ x : M, ∀ v : TangentSpace I x, v ≠ 0 → 0 < metricRicci g x v v) :
    ∃ (g' : SmoothMetric I M) (κ : ℝ), 0 < κ ∧
      Bundle.ContMDiffRiemannianMetric.IsConstantCurvatureTensor g' κ := by
  sorry

/-- Brendle–Schoen: a closed connected manifold of dimension at least four whose sectional
curvatures are pointwise strictly quarter pinched, `0 < K(π) < 4 K(π')` for all two-planes
`π, π'` at the same point, carries a smooth metric of constant positive sectional curvature
(Manifolds with 1/4-pinched curvature are space forms, Theorem 1). -/
theorem brendleSchoen_pointwise_quarterPinched [CompactSpace M] [ConnectedSpace M]
    (h4 : 4 ≤ Module.finrank ℝ E) (g : SmoothMetric I M)
    (hpinch : ∀ x : M, ∀ u v u' v' : TangentSpace I x,
      LinearIndependent ℝ ![u, v] → LinearIndependent ℝ ![u', v'] →
        0 < metricSectional g x u v ∧ metricSectional g x u v < 4 * metricSectional g x u' v') :
    ∃ (g' : SmoothMetric I M) (κ : ℝ), 0 < κ ∧
      Bundle.ContMDiffRiemannianMetric.IsConstantCurvatureTensor g' κ := by
  sorry

/-- The differentiable sphere theorem: a closed simply connected manifold of dimension `n ≥ 4`
with pointwise strictly quarter-pinched sectional curvatures is diffeomorphic to the round
sphere `Sⁿ` (Brendle–Schoen, Manifolds with 1/4-pinched curvature are space forms, Theorem 1,
with the space form simply connected). -/
theorem brendleSchoen_diffeomorph_sphere [CompactSpace M] [SimplyConnectedSpace M] {n : ℕ}
    (hn : Module.finrank ℝ E = n) (h4 : 4 ≤ n) (g : SmoothMetric I M)
    (hpinch : ∀ x : M, ∀ u v u' v' : TangentSpace I x,
      LinearIndependent ℝ ![u, v] → LinearIndependent ℝ ![u', v'] →
        0 < metricSectional g x u v ∧ metricSectional g x u v < 4 * metricSectional g x u' v') :
    Nonempty (Diffeomorph I (𝓡 n) M (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) ∞) := by
  sorry

/-! ## Layer 8: positive surfaces and the complete global sphere statement -/

/-- Hamilton's surface theorem: a closed connected surface carrying a metric of positive scalar
(Gauss) curvature carries a smooth metric of constant positive curvature (Santoro, Theorem 4.0.3;
Chen–Lu–Tian for the soliton step). -/
theorem positiveScalar_surface [CompactSpace M] [ConnectedSpace M]
    (h2 : Module.finrank ℝ E = 2) (g : SmoothMetric I M)
    (hR : ∀ x : M, 0 < metricScalar g x) :
    ∃ (g' : SmoothMetric I M) (κ : ℝ), 0 < κ ∧
      Bundle.ContMDiffRiemannianMetric.IsConstantCurvatureTensor g' κ := by
  sorry

/-- The global quarter-pinched sphere theorem, in its differentiable form: a closed simply
connected manifold of dimension `n ≥ 2` whose sectional curvatures all lie in `[a, b]` with
`0 < a` and `b < 4a` is diffeomorphic to the round sphere `Sⁿ` (Berger–Klingenberg's
homeomorphism statement is Brendle–Schoen, Sphere theorems in geometry, Theorem 1.1; the
diffeomorphism comes from Layer 7 for `n ≥ 3` and from this layer for `n = 2`). -/
theorem global_quarterPinched_diffeomorph_sphere [CompactSpace M] [SimplyConnectedSpace M]
    {n : ℕ} (hn : Module.finrank ℝ E = n) (h2 : 2 ≤ n) (g : SmoothMetric I M)
    (a b : ℝ) (ha : 0 < a) (hab : b < 4 * a)
    (hK : ∀ x : M, ∀ u v : TangentSpace I x, LinearIndependent ℝ ![u, v] →
      a ≤ metricSectional g x u v ∧ metricSectional g x u v ≤ b) :
    Nonempty (Diffeomorph I (𝓡 n) M (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) ∞) := by
  sorry

end SphereTheorems

end TauCetiRoadmap.RicciFlow
