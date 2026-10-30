import Mathlib
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Sectional
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Ricci
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.HopfRinow
import TauCeti.Geometry.Manifold.SmoothEmbedding.NormalSpace
import TauCeti.Geometry.Manifold.TubularNeighborhood.Euclidean

/-!
# Riemannian geometry: selected target interfaces

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These signatures illustrate real curvature/curve/normal-bundle interfaces
and computational acceptance cases. They do not replace the complete milestones.
Unimplemented mathematical objects have honest `sorry` bodies; no free proposition fields
stand in for a derivative, ellipticity condition, or geometric comparison.
-/

noncomputable section

namespace TauCetiRoadmap.RiemannianGeometry

open Set Bundle
open scoped Manifold ContDiff

section Intrinsic

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]

/-- R1: the existing sectional-curvature predicate determines the actual pointwise tensor. -/
theorem constant_sectional_tensor_iff (κ : ℝ) :
    (CovariantDerivative.leviCivitaConnection I M).HasConstantSectionalCurvature
      (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) κ ↔
    (RiemannianBundle.g (E := fun x : M => TangentSpace I x)).IsConstantCurvatureTensor
      (CovariantDerivative.leviCivitaConnection I M) inferInstance κ := by
  sorry

/-- R1: Schur's pointwise-isotropy theorem, with its load-bearing dimension. -/
theorem schur [ConnectedSpace M] (hdim : 3 ≤ Module.finrank ℝ E)
    (κ : M → ℝ)
    (hplanes : ∀ x, (CovariantDerivative.leviCivitaConnection I M).HasSectionalCurvatureAt
      (CovariantDerivative.isMetricCompatible_leviCivitaConnection I) x (κ x)) :
    ∀ x y : M, κ x = κ y := by
  sorry

/-- R2: the Jacobi equation on the supplier's actual along-curve derivative.
Its C² lift and the geodesic predicate’s UniqueDiffOn hypothesis are explicit.
R2 supplies the fixed-chart C^(k+1) → C^k derivative-lift theorem before iterating it. -/
def IsJacobiFieldOn (γ : ℝ → M) (X : ∀ t, TangentSpace I (γ t)) (s : Set ℝ) : Prop :=
  TauCeti.Manifold.IsGeodesicCurveOn I γ s ∧
  ContMDiffOn 𝓘(ℝ, ℝ) I.tangent 2
    (fun t => (⟨γ t, X t⟩ : TangentBundle I M)) s ∧
  ∀ t ∈ s,
    (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ
      ((CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X s) s t +
      (CovariantDerivative.leviCivitaConnection I M).curvatureTensor (γ t)
        (X t) (TauCeti.Manifold.curveVelocityWithin I γ s t)
        (TauCeti.Manifold.curveVelocityWithin I γ s t) = 0

/-- R2: uniqueness is only on the stated interval, not for arbitrary values outside it. -/
theorem jacobi_eq_of_initial_data {γ : ℝ → M}
    {X Y : ∀ t, TangentSpace I (γ t)} {a b : ℝ} (hab : a < b)
    (hX : IsJacobiFieldOn (I := I) γ X (Icc a b))
    (hY : IsJacobiFieldOn (I := I) γ Y (Icc a b))
    (hpos : X a = Y a)
    (hvel : (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X (Icc a b) a =
      (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ Y (Icc a b) a) :
    ∀ t ∈ Icc a b, X t = Y t := by
  sorry

/-- R2: arbitrary initial field and covariant derivative give an interval solution. -/
theorem exists_jacobi_initial_data {γ : ℝ → M} {a b : ℝ} (hab : a < b)
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc a b))
    (u v : TangentSpace I (γ a)) :
    ∃ X : ∀ t, TangentSpace I (γ t),
      IsJacobiFieldOn (I := I) γ X (Icc a b) ∧ X a = u ∧
      (CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ X (Icc a b) a = v := by
  sorry

/-- Extension only for using the existing within-derivative API; interval values are the data. -/
def extendIntervalField (γ : ℝ → M) {a b : ℝ}
    (X : ∀ t : Icc a b, TangentSpace I (γ t)) : ∀ t, TangentSpace I (γ t) :=
  fun t => if ht : t ∈ Icc a b then X ⟨t, ht⟩ else 0

/-- The C¹ endpoint-zero interval submodule, inside R3’s piecewise C¹ carrier.
There are no freely chosen outside values and hence no spurious outside-value kernel. -/
def cOneEndpointZeroFields (γ : ℝ → M) (a b : ℝ)
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc a b)) :
    Submodule ℝ (∀ t : Icc a b, TangentSpace I (γ t)) where
  carrier := {X | ContMDiffOn 𝓘(ℝ, ℝ) I.tangent 1
      (fun t => (⟨γ t, extendIntervalField γ X t⟩ : TangentBundle I M)) (Icc a b) ∧
      (∀ ha : a ∈ Icc a b, X ⟨a, ha⟩ = 0) ∧ (∀ hb : b ∈ Icc a b, X ⟨b, hb⟩ = 0)}
  zero_mem' := by sorry
  add_mem' := by sorry
  smul_mem' := by sorry

/-- R3: a real bilinear form on genuine C¹ interval sections, not arbitrary functions.
The full milestone extends it to the piecewise C¹ carrier and H¹ comparison. -/
def indexForm (γ : ℝ → M) {a b : ℝ} (hab : a < b)
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc a b)) :
    LinearMap.BilinForm ℝ (cOneEndpointZeroFields (I := I) γ a b hγ) := by
  sorry

theorem indexForm_apply (γ : ℝ → M) {a b : ℝ} (hab : a < b)
    (hγ : TauCeti.Manifold.IsGeodesicCurveOn I γ (Icc a b))
    (X Y : cOneEndpointZeroFields (I := I) γ a b hγ) :
    indexForm γ hab hγ X Y = ∫ t in a..b,
      inner ℝ
        ((CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ
          (extendIntervalField γ X.val) (Icc a b) t)
        ((CovariantDerivative.leviCivitaConnection I M).alongCurveWithin γ
          (extendIntervalField γ Y.val) (Icc a b) t) -
      inner ℝ
        ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor (γ t)
          (extendIntervalField γ X.val t) (TauCeti.Manifold.curveVelocityWithin I γ (Icc a b) t)
          (TauCeti.Manifold.curveVelocityWithin I γ (Icc a b) t)) (extendIntervalField γ Y.val t) := by
  sorry

/-- R3/R4: nonpositive sectional curvature forbids a nonzero endpoint-zero Jacobi field. -/
theorem jacobi_eq_zero_of_nonpositive_curvature {γ : ℝ → M}
    {X : ∀ t, TangentSpace I (γ t)} {a b : ℝ} (hab : a < b)
    (hX : IsJacobiFieldOn (I := I) γ X (Icc a b))
    (hK : ∀ x (u v : TangentSpace I x),
      inner ℝ ((CovariantDerivative.leviCivitaConnection I M).curvatureTensor x u v v) u ≤ 0)
    (ha : X a = 0) (hb : X b = 0) : ∀ t ∈ Icc a b, X t = 0 := by
  sorry


end Intrinsic

section GlobalDistance

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- R4: the Ricci lower bound controls distances in the supplier's actual Riemannian metric. -/
theorem bonnetMyers_distance [ConnectedSpace M] [CompleteSpace M]
    (hdim : 2 ≤ Module.finrank ℝ E) {ricciBound : ℝ} (hRicciBound : 0 < ricciBound)
    (hRic : ∀ x (v : TangentSpace I x),
      ricciBound * ‖v‖ ^ 2 ≤ (CovariantDerivative.leviCivitaConnection I M).ricciTensor x v v)
    (x y : M) :
    dist x y ≤ Real.pi * Real.sqrt (((Module.finrank ℝ E : ℝ) - 1) / ricciBound) := by
  sorry


end GlobalDistance

section SmoothDistanceDuality

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [MetricSpace M] [SecondCountableTopology M] [ChartedSpace H M]
  [IsManifold I ∞ M] [ConnectedSpace M]
  [RiemannianBundle (fun x : M => TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M => TangentSpace I x)]
  [IsRiemannianManifold I M]

/-- R7.8: quantitative smooth approximation recovers the intrinsic distance.
No completeness assumption or Dirac stand-in is used in this signature. -/
theorem riemannianDist_eq_sSup_smooth (x y : M) :
    dist x y = sSup {r : ℝ | ∃ f : M → ℝ,
      ContMDiff I 𝓘(ℝ, ℝ) ∞ f ∧ Bornology.IsBounded (Set.range f) ∧
      (∀ p, ‖mfderiv I 𝓘(ℝ, ℝ) f p‖ ≤ 1) ∧ r = |f x - f y|} := by
  sorry

end SmoothDistanceDuality

section Immersions

variable {E F H G M N : Type*}
  [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [FiniteDimensional ℝ F]
  [TopologicalSpace H] [TopologicalSpace G]
  {I : ModelWithCorners ℝ E H} {J : ModelWithCorners ℝ F G}
  [I.Boundaryless] [J.Boundaryless]
  [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]
  [TopologicalSpace N] [T2Space N] [ChartedSpace G N] [IsManifold J ∞ N]
  [RiemannianBundle (fun x : N => TangentSpace J x)]
  [IsContMDiffRiemannianBundle J ∞ F (fun x : N => TangentSpace J x)]

/-- One normal-fiber definition for arbitrary immersions, including noninjective eigenmaps. -/
def immersionNormal (f : M → N) (x : M) : Submodule ℝ (TangentSpace J (f x)) :=
  (LinearMap.range (mfderiv I J f x).toLinearMap).orthogonal

/-- R5: the general second fundamental form in the pullback ambient normal fiber. -/
def secondFundamentalForm (f : M → N) (hf : Manifold.IsImmersion I J ∞ f)
    (x : M) : TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ]
      ↥(immersionNormal (I := I) (J := J) f x) := by
  sorry

/-- The actual ambient along-curve connection determines the normal projection. -/
theorem secondFundamentalForm_along_curve (f : M → N)
    (hf : Manifold.IsImmersion I J ∞ f) (c : ℝ → M)
    (hc : ContMDiff 𝓘(ℝ, ℝ) I ∞ c) (Y : ∀ x, TangentSpace I x)
    (hY : ContMDiff I I.tangent ∞ (fun x => (⟨x, Y x⟩ : TangentBundle I M))) :
    secondFundamentalForm f hf (c 0) (TauCeti.Manifold.curveVelocity I c 0) (Y (c 0)) =
      (immersionNormal (I := I) (J := J) f (c 0)).orthogonalProjectionOnto
        ((CovariantDerivative.leviCivitaConnection J N).alongCurveWithin (f ∘ c)
          (fun t => mfderiv I J f (c t) (Y (c t))) univ 0) := by
  sorry

variable [RiemannianBundle (fun x : M => TangentSpace I x)]

/-- Its metric is required to be the induced metric, not an arbitrary metric on M. -/
def shapeOperator (f : M → N) (hf : Manifold.IsImmersion I J ∞ f)
    (hinduced : ∀ x (u v : TangentSpace I x), inner ℝ u v =
      inner ℝ (mfderiv I J f x u) (mfderiv I J f x v))
    (x : M) (η : ↥(immersionNormal (I := I) (J := J) f x)) :
    TangentSpace I x →L[ℝ] TangentSpace I x := by
  sorry

theorem inner_shapeOperator (f : M → N) (hf : Manifold.IsImmersion I J ∞ f)
    (hinduced : ∀ x (u v : TangentSpace I x), inner ℝ u v =
      inner ℝ (mfderiv I J f x u) (mfderiv I J f x v))
    (x : M) (η : ↥(immersionNormal (I := I) (J := J) f x))
    (u v : TangentSpace I x) :
    inner ℝ (shapeOperator f hf hinduced x η u) v =
      inner ℝ (secondFundamentalForm f hf x u v : TangentSpace J (f x)) η := by
  sorry

end Immersions

section EuclideanExtrinsic

variable {E H M F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [FiniteDimensional ℝ E] [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [I.Boundaryless] [TopologicalSpace M] [T2Space M] [ChartedSpace H M]
  [IsManifold I ∞ M] [NormedAddCommGroup F] [InnerProductSpace ℝ F]
  [FiniteDimensional ℝ F]

omit [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [IsManifold I ∞ M]
  [FiniteDimensional ℝ F] in
/-- Euclidean and general-target normal fibers are literally the same complement. -/
theorem immersionNormal_eq_normalSubspace (f : M → F) (x : M) :
    immersionNormal (I := I) (J := 𝓘(ℝ, F)) f x = TauCeti.normalSubspace I f x := by
  rfl

/-- R5: Euclidean immersion specialization, including maps with antipodal fibres. -/
def euclideanImmersionSecondFundamentalForm (f : M → F)
    (hf : Manifold.IsImmersion I 𝓘(ℝ, F) ∞ f) (x : M) :
    TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ]
      ↥(TauCeti.normalSubspace I f x) :=
  secondFundamentalForm f hf x

/-- Embeddings consume the same immersion object on the native normal subspace. -/
def euclideanSecondFundamentalForm (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, F) ∞ M F)
    (x : M) : TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ]
      ↥(TauCeti.normalSubspace I (f : M → F) x) :=
  euclideanImmersionSecondFundamentalForm (f : M → F) f.isImmersion x

/-- The curve-derivative characterization pins the preceding object to the embedding.
No metric on M is required for this normal projection. -/
theorem euclideanSecondFundamentalForm_along_curve
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, F) ∞ M F) (c : ℝ → M)
    (hc : ContMDiff 𝓘(ℝ, ℝ) I ∞ c) (Y : ∀ x, TangentSpace I x)
    (hY : ContMDiff I I.tangent ∞ (fun x => (⟨x, Y x⟩ : TangentBundle I M))) :
    euclideanSecondFundamentalForm f (c 0) (TauCeti.Manifold.curveVelocity I c 0) (Y (c 0)) =
      (TauCeti.normalSubspace I (f : M → F) (c 0)).orthogonalProjectionOnto
        (deriv (fun t => mfderiv I 𝓘(ℝ, F) (f : M → F) (c t) (Y (c t))) 0) := by
  sorry

variable [RiemannianBundle (fun x : M => TangentSpace I x)]

/-- R5/R6: the shape map uses the explicitly induced tangent metric. -/
def euclideanShapeOperator (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, F) ∞ M F)
    (hinduced : ∀ x (u v : TangentSpace I x), inner ℝ u v =
      inner ℝ (mfderiv I 𝓘(ℝ, F) (f : M → F) x u)
        (mfderiv I 𝓘(ℝ, F) (f : M → F) x v))
    (x : M) (η : ↥(TauCeti.normalSubspace I (f : M → F) x)) :
    TangentSpace I x →L[ℝ] TangentSpace I x :=
  shapeOperator (f : M → F) f.isImmersion hinduced x η

theorem inner_euclideanShapeOperator
    (f : TauCeti.SmoothEmbedding I 𝓘(ℝ, F) ∞ M F) (x : M)
    (hinduced : ∀ x (u v : TangentSpace I x), inner ℝ u v =
      inner ℝ (mfderiv I 𝓘(ℝ, F) (f : M → F) x u)
        (mfderiv I 𝓘(ℝ, F) (f : M → F) x v))
    (η : ↥(TauCeti.normalSubspace I (f : M → F) x)) (u v : TangentSpace I x) :
    inner ℝ (euclideanShapeOperator f hinduced x η u) v =
      inner ℝ (euclideanSecondFundamentalForm f x u v : F) (η : F) := by
  sorry


end EuclideanExtrinsic

/- The focal-domain and whole-tube scaling interfaces consume GeometricTopology's
normal-bundle/exponential and positivity contracts in the definitive README.
Their unimplemented carriers are not mirrored by private prototypes here. -/

section Veronese

/-- R8: the five independent degree-two harmonic coordinates; unit sphere maps to unit sphere. -/
def veronese (x : EuclideanSpace ℝ (Fin 3)) : EuclideanSpace ℝ (Fin 5) :=
  WithLp.toLp 2 ![Real.sqrt 3 / 2 * (x 0 ^ 2 - x 1 ^ 2),
    Real.sqrt 3 * x 0 * x 1, Real.sqrt 3 * x 0 * x 2,
    Real.sqrt 3 * x 1 * x 2, (2 * x 2 ^ 2 - x 0 ^ 2 - x 1 ^ 2) / 2]

theorem norm_veronese (x : EuclideanSpace ℝ (Fin 3)) : ‖veronese x‖ = ‖x‖ ^ 2 := by
  sorry

/-- The derivative multiplies the unit-sphere tangent metric by three, not by one. -/
theorem inner_fderiv_veronese (x u v : EuclideanSpace ℝ (Fin 3))
    (hx : ‖x‖ = 1) (hu : inner ℝ x u = 0) (hv : inner ℝ x v = 0) :
    inner ℝ (fderiv ℝ veronese x u) (fderiv ℝ veronese x v) = 3 * inner ℝ u v := by
  sorry

theorem veronese_fibers (x y : EuclideanSpace ℝ (Fin 3))
    (hx : ‖x‖ = 1) (hy : ‖y‖ = 1) :
    veronese x = veronese y ↔ y = x ∨ y = -x := by
  sorry

end Veronese

section FiniteBrokenGeodesics

variable {M : Type*} [PseudoMetricSpace M] {n : ℕ}

/-- Insert the two fixed endpoints into a finite tuple of interior vertices. -/
def brokenNode (p q : M) (v : Fin n → M) (i : Fin (n + 2)) : M :=
  if h₀ : i.val = 0 then p
  else if h₁ : i.val = n + 1 then q
  else v ⟨i.val - 1, by omega⟩

omit [PseudoMetricSpace M] in
@[simp] theorem brokenNode_first (p q : M) (v : Fin n → M) :
    brokenNode p q v 0 = p := by simp [brokenNode]

omit [PseudoMetricSpace M] in
@[simp] theorem brokenNode_last (p q : M) (v : Fin n → M) :
    brokenNode p q v (Fin.last (n + 1)) = q := by simp [brokenNode]

@[fun_prop] theorem continuous_brokenNode (p q : M) (i : Fin (n + 2)) :
    Continuous (fun v : Fin n → M => brokenNode p q v i) := by
  unfold brokenNode
  split_ifs <;> fun_prop

/-- R3's distance energy is defined before geodesic interpolation or smoothness. -/
def brokenDiscreteEnergy (p q : M) (t : Fin (n + 2) → ℝ) (v : Fin n → M) : ℝ :=
  (1 / 2 : ℝ) * ∑ j : Fin (n + 1),
    dist (brokenNode p q v j.castSucc) (brokenNode p q v j.succ) ^ 2 /
      (t j.succ - t j.castSucc)

@[fun_prop] theorem continuous_brokenDiscreteEnergy (p q : M)
    (t : Fin (n + 2) → ℝ) : Continuous (brokenDiscreteEnergy p q t) := by
  unfold brokenDiscreteEnergy
  fun_prop

/-- The actual open finite-vertex domain has a strict energy cutoff. -/
def brokenEnergyDomain (p q : M) (t : Fin (n + 2) → ℝ) (c : ℝ) : Set (Fin n → M) :=
  {v | brokenDiscreteEnergy p q t v < c}

theorem isOpen_brokenEnergyDomain (p q : M) (t : Fin (n + 2) → ℝ) (c : ℝ) :
    IsOpen (brokenEnergyDomain p q t c) :=
  isOpen_lt (continuous_brokenDiscreteEnergy p q t) continuous_const

theorem brokenDiscreteEnergy_edge_bound (p q : M) (t : Fin (n + 2) → ℝ)
    (hΔ : ∀ j : Fin (n + 1), 0 < t j.succ - t j.castSucc)
    (v : Fin n → M) (j : Fin (n + 1)) :
    dist (brokenNode p q v j.castSucc) (brokenNode p q v j.succ) ^ 2 ≤
      2 * brokenDiscreteEnergy p q t v * (t j.succ - t j.castSucc) := by
  have hs := Finset.single_le_sum (s := Finset.univ)
    (f := fun k : Fin (n + 1) =>
      dist (brokenNode p q v k.castSucc) (brokenNode p q v k.succ) ^ 2 /
        (t k.succ - t k.castSucc))
    (fun k _ => div_nonneg (sq_nonneg _) (hΔ k).le) (Finset.mem_univ j)
  have he : dist (brokenNode p q v j.castSucc) (brokenNode p q v j.succ) ^ 2 /
      (t j.succ - t j.castSucc) ≤ 2 * brokenDiscreteEnergy p q t v := by
    unfold brokenDiscreteEnergy
    linarith
  exact (div_le_iff₀ (hΔ j)).mp he

theorem brokenEnergyDomain_edge_lt (p q : M) (t : Fin (n + 2) → ℝ)
    (hΔ : ∀ j : Fin (n + 1), 0 < t j.succ - t j.castSucc)
    {c ρ : ℝ} (hρ : 0 < ρ)
    (hmesh : ∀ j : Fin (n + 1), 2 * c * (t j.succ - t j.castSucc) < ρ ^ 2)
    {v : Fin n → M} (hv : v ∈ brokenEnergyDomain p q t c) (j : Fin (n + 1)) :
    dist (brokenNode p q v j.castSucc) (brokenNode p q v j.succ) < ρ := by
  have he := brokenDiscreteEnergy_edge_bound p q t hΔ v j
  have hc := mul_lt_mul_of_pos_right
    (mul_lt_mul_of_pos_left hv (by norm_num : (0 : ℝ) < 2)) (hΔ j)
  have hb := lt_of_le_of_lt he (lt_trans hc (hmesh j))
  nlinarith [dist_nonneg (x := brokenNode p q v j.castSucc)
    (y := brokenNode p q v j.succ)]

end FiniteBrokenGeodesics

end TauCetiRoadmap.RiemannianGeometry
