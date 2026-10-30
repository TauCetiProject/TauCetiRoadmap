import Mathlib
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Ricci

/-!
This file is not the roadmap and is not exhaustive. Representative interfaces
on existing metric, connection, multilinear-map and
positive tangent-cone carriers. README gives the complete specification and
all analytic/convergence suppliers. The `sorry`s are mathematical targets.
-/

open Bundle Set
open scoped Manifold ContDiff NNReal

namespace RicciFlowSuggested

section Metrics

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] {H : Type*} [TopologicalSpace H]
  {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [T2Space M] [ChartedSpace H M]
  [IsManifold I ∞ M]

abbrev SmoothMetric (I : ModelWithCorners ℝ E H) (M : Type*)
    [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M] :=
  ContMDiffRiemannianMetric I ∞ E (TangentSpace I : M → Type _)

/-- The actual native Ricci tensor, with the metric instance installed locally. -/
noncomputable def metricRicci (g : SmoothMetric I M) (x : M) :
    TangentSpace I x →ₗ[ℝ] TangentSpace I x →ₗ[ℝ] ℝ :=
  letI : RiemannianBundle (TangentSpace I : M → Type _) := ⟨g.toRiemannianMetric⟩
  (CovariantDerivative.leviCivitaConnection I M).ricciTensor x

/-- Joint time/space regularity is a native manifold derivative of a section,
not only smoothness at each time separately. -/
def IsSmoothMetricFamilyOn (g : ℝ → SmoothMetric I M) (s : Set ℝ) : Prop :=
  ContMDiffOn (𝓘(ℝ, ℝ).prod I)
    (I.prod 𝓘(ℝ, E →L[ℝ] E →L[ℝ] ℝ)) ∞
    (fun tx : ℝ × M => TotalSpace.mk' (E →L[ℝ] E →L[ℝ] ℝ)
      (E := fun x : M => TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ)
      tx.2 ((g tx.1).inner tx.2)) (s ×ˢ univ)

/-- Coefficient evaluation avoids changing tangent-space norms as time varies.
Within derivatives give the one-sided equation at the initial time. -/
def IsRicciFlowOn (g : ℝ → SmoothMetric I M) (s : Set ℝ) : Prop :=
  IsSmoothMetricFamilyOn g s ∧ ∀ t ∈ s, ∀ x (v w : TangentSpace I x),
    HasDerivWithinAt (fun τ => (g τ).inner x v w)
      (-2 * metricRicci (g t) x v w) s t

/-- R2's parabolic proof and DeTurck gauge produce a smooth native metric flow. -/
theorem exists_shortTime_ricciFlow [CompactSpace M] (g₀ : SmoothMetric I M) :
    ∃ T : ℝ, 0 < T ∧ ∃ g : ℝ → SmoothMetric I M,
      g 0 = g₀ ∧ IsRicciFlowOn g (Icc 0 T) := by
  sorry

/-- Equality concerns the restrictions to the actual interval. -/
theorem ricciFlow_unique [CompactSpace M] (T : ℝ) (hT : 0 < T)
    (g h : ℝ → SmoothMetric I M)
    (hg : IsRicciFlowOn g (Icc 0 T)) (hh : IsRicciFlowOn h (Icc 0 T))
    (h₀ : g 0 = h 0) : ∀ t ∈ Icc 0 T, g t = h t := by
  sorry

end Metrics

section AlgebraicCurvature

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
  [FiniteDimensional ℝ V]

abbrev FourTensor (V : Type*) [NormedAddCommGroup V] [NormedSpace ℝ V] :=
  ContinuousMultilinearMap ℝ (fun _ : Fin 4 => V) ℝ

/-- r(u,v,z,w)=g(R(u,v)w,z), so the unit sphere has r(u,v,u,v)>0. -/
def IsAlgebraicCurvature (r : FourTensor V) : Prop :=
  (∀ u v z w, r ![u,v,z,w] = -r ![v,u,z,w]) ∧
  (∀ u v z w, r ![u,v,z,w] = -r ![u,v,w,z]) ∧
  (∀ u v z w, r ![u,v,z,w] = r ![z,w,u,v]) ∧
  (∀ u v z w, r ![u,v,z,w] + r ![v,z,u,w] + r ![z,u,v,w] = 0)

/-- Actual symmetry/Bianchi submodule; its closedness and curvature-operator
comparison are R5.1 targets on this carrier. -/
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

/-- The explicit finite contraction formula, evaluated in the standard real
orthonormal basis. -/
noncomputable def reactionTensorContraction
    (r : algebraicCurvatureSubmodule (V := V)) (u v z w : V) : ℝ := by
  let b := stdOrthonormalBasis ℝ V
  exact
    (∑ p, ∑ q, r.1 ![u,v,b p,b q] * r.1 ![z,w,b p,b q]) +
    2 * (∑ p, ∑ q, r.1 ![u,b p,z,b q] * r.1 ![v,b p,w,b q]) -
    2 * (∑ p, ∑ q, r.1 ![u,b p,w,b q] * r.1 ![v,b p,z,b q])

/-- The R5.2 construction target: produce the algebraic-curvature tensor with
this explicit contraction. Basis independence and the Bianchi identities are
part of the construction API. -/
theorem exists_reactionTensor (r : algebraicCurvatureSubmodule (V := V)) :
    ∃ Q : algebraicCurvatureSubmodule (V := V),
      ∀ u v z w, Q.1 ![u,v,z,w] = reactionTensorContraction r u v z w := by
  sorry

noncomputable def reactionTensor (r : algebraicCurvatureSubmodule (V := V)) :
    algebraicCurvatureSubmodule (V := V) := Classical.choose (exists_reactionTensor r)

/-- Explicit contraction pins the reaction instead of treating Q as a free map. -/
theorem reactionTensor_apply {ι : Type*} [Fintype ι]
    (b : OrthonormalBasis ι ℝ V) (r : algebraicCurvatureSubmodule (V := V))
    (u v z w : V) :
    (reactionTensor r).1 ![u,v,z,w] =
      (∑ p, ∑ q, r.1 ![u,v,b p,b q] * r.1 ![z,w,b p,b q]) +
      2 * (∑ p, ∑ q, r.1 ![u,b p,z,b q] * r.1 ![v,b p,w,b q]) -
      2 * (∑ p, ∑ q, r.1 ![u,b p,w,b q] * r.1 ![v,b p,z,b q]) := by
  sorry

def pic2Expression (r : FourTensor V) (f : Fin 4 → V) (l m : ℝ) : ℝ :=
  r ![f 0,f 2,f 0,f 2] + l^2 * r ![f 0,f 3,f 0,f 3] +
  m^2 * r ![f 1,f 2,f 1,f 2] + l^2 * m^2 * r ![f 1,f 3,f 1,f 3] -
  2 * l * m * r ![f 0,f 1,f 2,f 3]

/-- The exact n≥4 real four-frame version of nonnegative isotropic curvature
on V⊕ℝ²; R5.5 builds and proves the zero-extension equivalence. -/
def IsPIC2FourFrame (r : FourTensor V) : Prop :=
  ∀ f, Orthonormal ℝ f → ∀ l ∈ Icc (-1 : ℝ) 1,
    ∀ m ∈ Icc (-1 : ℝ) 1, 0 ≤ pic2Expression r f l m

/-- R5.5's finite-dimensional inward-pointing statement. Using ℝ as the
scalar parameter of tangentConeAt would incorrectly allow negative time. -/
theorem reaction_mem_positive_tangentCone_pic2
    (hn : 4 ≤ Module.finrank ℝ V)
    (r : algebraicCurvatureSubmodule (V := V)) (hr : IsPIC2FourFrame r.1) :
    reactionTensor r ∈ tangentConeAt (ℝ≥0)
      {q : algebraicCurvatureSubmodule (V := V) | IsPIC2FourFrame q.1} r := by
  sorry

/-- R5.6's strict pointwise input. All planes, rather than selected wedge
basis vectors, occur in the hypotheses. -/
theorem strict_quarterPinching_isPIC2
    (hn : 4 ≤ Module.finrank ℝ V)
    (r : algebraicCurvatureSubmodule (V := V)) (a b : ℝ)
    (ha : 0 < a) (hab : b < 4 * a)
    (hsec : ∀ u v : V, Orthonormal ℝ ![u,v] → a ≤ r.1 ![u,v,u,v] ∧ r.1 ![u,v,u,v] ≤ b) :
    ∀ f, Orthonormal ℝ f → ∀ l ∈ Icc (-1 : ℝ) 1,
      ∀ m ∈ Icc (-1 : ℝ) 1, 0 < pic2Expression r.1 f l m := by
  sorry

end AlgebraicCurvature
end RicciFlowSuggested
