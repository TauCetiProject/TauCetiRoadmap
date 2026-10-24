import Mathlib
import TauCeti.Geometry.Symplectic.Manifold.TwoForm
import TauCeti.Geometry.Symplectic.Cotangent.Basic
import TauCeti.Geometry.Symplectic.SymplecticTransport
import TauCeti.Geometry.Manifold.IntegralCurve.Flow

/-!
# Hamiltonian systems and moment maps: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The symplectic form is written `σ` here (Souriau's letter) because `ω` is a notation under
`open scoped ContDiff`; `README.md` writes it `ω`.

The declarations whose first explicit argument is the form are in the namespace
`TauCeti.SmoothTwoForm`, next to `SmoothTwoForm.IsSymplectic`, so that they read
`σ.IsHamiltonian F` and `σ.poissonBracket F G`. `InfinitesimalAction` and
`coordinateSymplecticForm` are in `TauCetiRoadmap.HamiltonianSystems`.
-/

open TauCeti
open scoped ContDiff Manifold

noncomputable section

variable
  {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

namespace TauCeti.SmoothTwoForm

/-! ## Layer 1: Hamiltonian vector fields and the Poisson bracket -/

/-- `X` is a Hamiltonian vector field of `F` for `σ`: `ι_X σ = dF`. -/
def IsHamiltonianVectorField (σ : SmoothTwoForm I M) (F : M → ℝ)
    (X : (x : M) → TangentSpace I x) : Prop :=
  ∀ x v, σ x (X x) v = mvfderiv I F x v

open Classical in
/-- The Hamiltonian vector field of `F` at `x`: a vector `v` with `σ x v = dF_x` when one exists
(it is unique when `σ` is nondegenerate), `0` otherwise. -/
def hamiltonianVectorField (σ : SmoothTwoForm I M) (F : M → ℝ) (x : M) : TangentSpace I x :=
  if h : ∃ v : TangentSpace I x, ∀ w, σ x v w = mvfderiv I F x w then h.choose else 0

/-- `F` is smooth and has a smooth Hamiltonian vector field. -/
def IsHamiltonian (σ : SmoothTwoForm I M) (F : M → ℝ) : Prop :=
  ContMDiff I 𝓘(ℝ, ℝ) ∞ F ∧ ∃ X : (x : M) → TangentSpace I x,
    ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, X x⟩ : TangentBundle I M)) ∧
      σ.IsHamiltonianVectorField F X

/-- Strong nondegeneracy: at every point, `v ↦ σ x v` is onto the continuous dual. -/
def IsStronglyNondegenerate (σ : SmoothTwoForm I M) : Prop :=
  ∀ (x : M) (α : TangentSpace I x →L[ℝ] ℝ), ∃ v : TangentSpace I x, ∀ w, σ x v w = α w

/-- The Poisson bracket `{F, G} = dF (X_G)`. -/
def poissonBracket (σ : SmoothTwoForm I M) (F G : M → ℝ) (x : M) : ℝ :=
  mvfderiv I F x (σ.hamiltonianVectorField G x)

/-- Layer 1: uniqueness of the Hamiltonian vector field under weak nondegeneracy. -/
theorem IsHamiltonianVectorField.eq {σ : SmoothTwoForm I M} (hσ : σ.IsNondegenerate)
    {F : M → ℝ} {X Y : (x : M) → TangentSpace I x} (hX : σ.IsHamiltonianVectorField F X)
    (hY : σ.IsHamiltonianVectorField F Y) : X = Y := by
  sorry

/-- Layer 1: in finite dimension, a nondegenerate form is strongly nondegenerate. -/
theorem isStronglyNondegenerate_of_finiteDimensional [FiniteDimensional ℝ E]
    {σ : SmoothTwoForm I M} (hσ : σ.IsNondegenerate) : σ.IsStronglyNondegenerate := by
  sorry

/-- Layer 1: strong nondegeneracy implies nondegeneracy (alternation and Hahn-Banach). -/
theorem IsStronglyNondegenerate.isNondegenerate {σ : SmoothTwoForm I M}
    (hσ : σ.IsStronglyNondegenerate) : σ.IsNondegenerate := by
  sorry

/-- Layer 1: for a strongly nondegenerate form, every smooth function is Hamiltonian. -/
theorem isHamiltonian_of_contMDiff {σ : SmoothTwoForm I M} (hσ : σ.IsStronglyNondegenerate)
    {F : M → ℝ} (hF : ContMDiff I 𝓘(ℝ, ℝ) ∞ F) : σ.IsHamiltonian F := by
  sorry

/-- Layer 1: the invariant formula for a closed two-form, at a point, for vector fields smooth near
that point. -/
theorem IsClosed.mvfderiv_apply_sub_apply_mlieBracket_eq_zero {σ : SmoothTwoForm I M}
    (hσ : σ.IsClosed)
    {U V W : (x : M) → TangentSpace I x} {x : M}
    (hU : ContMDiffAt I I.tangent ∞ (fun y ↦ (⟨y, U y⟩ : TangentBundle I M)) x)
    (hV : ContMDiffAt I I.tangent ∞ (fun y ↦ (⟨y, V y⟩ : TangentBundle I M)) x)
    (hW : ContMDiffAt I I.tangent ∞ (fun y ↦ (⟨y, W y⟩ : TangentBundle I M)) x) :
    mvfderiv I (fun y ↦ σ y (V y) (W y)) x (U x)
      - mvfderiv I (fun y ↦ σ y (U y) (W y)) x (V x)
      + mvfderiv I (fun y ↦ σ y (U y) (V y)) x (W x)
      - σ x (VectorField.mlieBracket I U V x) (W x)
      + σ x (VectorField.mlieBracket I U W x) (V x)
      - σ x (VectorField.mlieBracket I V W x) (U x) = 0 := by
  sorry

/-- Milestone 1: the Poisson bracket of two Hamiltonian functions is Hamiltonian, with Hamiltonian
vector field `-[X_F, X_G]`. -/
theorem IsHamiltonian.poissonBracket {σ : SmoothTwoForm I M} (hσ : σ.IsSymplectic)
    {F G : M → ℝ} (hF : σ.IsHamiltonian F) (hG : σ.IsHamiltonian G) :
    σ.IsHamiltonian (σ.poissonBracket F G) ∧
      σ.IsHamiltonianVectorField (σ.poissonBracket F G)
        (-VectorField.mlieBracket I (σ.hamiltonianVectorField F) (σ.hamiltonianVectorField G)) := by
  sorry

/-- Milestone 1: the Jacobi identity. -/
theorem poissonBracket_jacobi {σ : SmoothTwoForm I M} (hσ : σ.IsSymplectic)
    {F G K : M → ℝ} (hF : σ.IsHamiltonian F) (hG : σ.IsHamiltonian G) (hK : σ.IsHamiltonian K) :
    σ.poissonBracket F (σ.poissonBracket G K) + σ.poissonBracket G (σ.poissonBracket K F)
      + σ.poissonBracket K (σ.poissonBracket F G) = 0 := by
  sorry

/-! ## Layer 2: dynamics -/

/-- Layer 2: along an integral curve `γ` of `X_H` on an open set `s` of times, `F ∘ γ` has
derivative `{F, H} (γ t)` at every `t ∈ s` such that `F` is differentiable at `γ t`. -/
theorem hasDerivAt_comp_of_isMIntegralCurveOn {σ : SmoothTwoForm I M} {F H : M → ℝ}
    {γ : ℝ → M} {s : Set ℝ} (hs : IsOpen s)
    (hγ : IsMIntegralCurveOn γ (σ.hamiltonianVectorField H) s)
    {t : ℝ} (ht : t ∈ s) (hF : MDifferentiableAt I 𝓘(ℝ, ℝ) F (γ t)) :
    HasDerivAt (F ∘ γ) (σ.poissonBracket F H (γ t)) t := by
  sorry

/-- Layer 2: conservation of energy. Along an integral curve of `X_H` on an open set `s` of times,
a differentiable `H` takes the same value at any two times of a preconnected `T ⊆ s` (an
interval): the derivative statement for `F = H`, with `{H, H} = 0`. Its values on two connected
components of `s` need not agree. -/
theorem apply_eq_of_isMIntegralCurveOn {σ : SmoothTwoForm I M} {H : M → ℝ}
    {γ : ℝ → M} {s T : Set ℝ} (hs : IsOpen s)
    (hγ : IsMIntegralCurveOn γ (σ.hamiltonianVectorField H) s)
    (hT : IsPreconnected T) (hTs : T ⊆ s) (hH : MDifferentiable I 𝓘(ℝ, ℝ) H)
    {t₁ t₂ : ℝ} (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T) : H (γ t₁) = H (γ t₂) := by
  sorry

/-- `φ` is a symplectic map from `σ` to `σ'`: it pulls `σ'` back to `σ`. The model spaces of
`M` and `M'` may differ, and `φ` need not be invertible: symplectic embeddings are symplectic
maps. -/
def IsSymplecticMap
    {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    {H' : Type*} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    {M' : Type*} [TopologicalSpace M'] [ChartedSpace H' M'] [IsManifold I' ∞ M']
    (σ : SmoothTwoForm I M) (σ' : SmoothTwoForm I' M') (φ : M → M') : Prop :=
  ∀ x v w, σ' (φ x) (mfderiv I I' φ x v) (mfderiv I I' φ x w) = σ x v w

/-- A diffeomorphism `φ` is a symplectomorphism from `σ` to `σ'` when it is a symplectic map.
Like the linear `SymplecticForm.IsSymplectomorphism`, this is a predicate on an equivalence. -/
def IsSymplectomorphism
    {E' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E']
    {H' : Type*} [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'}
    {M' : Type*} [TopologicalSpace M'] [ChartedSpace H' M'] [IsManifold I' ∞ M']
    {n : WithTop ℕ∞} (σ : SmoothTwoForm I M) (σ' : SmoothTwoForm I' M')
    (φ : M ≃ₘ^n⟮I, I'⟯ M') : Prop :=
  σ.IsSymplecticMap σ' φ

/-- Milestone 2: the flow of a Hamiltonian vector field preserves `σ` (finite dimension,
boundaryless, Hausdorff). -/
theorem IsSymplectic.apply_mfderiv_maximalIntegralCurve [FiniteDimensional ℝ E] [T2Space M]
    [BoundarylessManifold I M] {σ : SmoothTwoForm I M} (hσ : σ.IsSymplectic) {F : M → ℝ}
    (hF : ContMDiff I 𝓘(ℝ, ℝ) ∞ F) {x : M} {t : ℝ}
    (hxt : (x, t) ∈ maximalIntegralCurveFlowDomain (σ.hamiltonianVectorField F))
    (v w : TangentSpace I x) :
    σ (maximalIntegralCurve (σ.hamiltonianVectorField F) x t)
        (mfderiv I I (fun y ↦ maximalIntegralCurve (σ.hamiltonianVectorField F) y t) x v)
        (mfderiv I I (fun y ↦ maximalIntegralCurve (σ.hamiltonianVectorField F) y t) x w) =
      σ x v w := by
  sorry

end TauCeti.SmoothTwoForm

/-! ## Layer 2: canonical coordinates -/

namespace TauCetiRoadmap.HamiltonianSystems

/-- The canonical symplectic form on `(Fin n → ℝ) × (Fin n → ℝ)`, with points `(q, p)`: the
pullback of `cotangentSymplecticForm` by `(q, p) ↦ (q, p ⬝ᵥ ·)`, written as its
`SymplecticForm.transport` along the inverse of that equivalence. -/
def coordinateSymplecticForm (n : ℕ) : SymplecticForm ((Fin n → ℝ) × (Fin n → ℝ)) :=
  (cotangentSymplecticForm (V := Fin n → ℝ)).transport
    ((LinearEquiv.refl ℝ (Fin n → ℝ)).prodCongr (dotProductEquiv ℝ (Fin n))).symm

open scoped Matrix in
/-- `ω((q, p), (q', p')) = p' ⬝ᵥ q - p ⬝ᵥ q'`. -/
theorem coordinateSymplecticForm_apply (n : ℕ) (u w : (Fin n → ℝ) × (Fin n → ℝ)) :
    coordinateSymplecticForm n u w = w.2 ⬝ᵥ u.1 - u.2 ⬝ᵥ w.1 :=
  rfl

/-- Layer 2: Hamilton's equations in coordinates, `X_H = (∂H/∂p, -∂H/∂q)`. The Hamiltonian
vector field is the one of Layer 1, read in the model space through
`NormedSpace.fromTangentSpace`. -/
theorem hamiltonianVectorField_coordinateSymplecticForm {n : ℕ}
    {H : (Fin n → ℝ) × (Fin n → ℝ) → ℝ} {x : (Fin n → ℝ) × (Fin n → ℝ)}
    (hH : DifferentiableAt ℝ H x) :
    NormedSpace.fromTangentSpace x
        ((coordinateSymplecticForm n).constSmooth.hamiltonianVectorField H x) =
      (fun i ↦ fderiv ℝ H x (0, Pi.single i 1), fun i ↦ -fderiv ℝ H x (Pi.single i 1, 0)) := by
  sorry

/-- Layer 2: the Poisson bracket of Layer 1 in coordinates,
`{F, G} = Σ_i (∂F/∂q_i ∂G/∂p_i - ∂F/∂p_i ∂G/∂q_i)`. -/
theorem poissonBracket_coordinateSymplecticForm {n : ℕ}
    {F G : (Fin n → ℝ) × (Fin n → ℝ) → ℝ} {x : (Fin n → ℝ) × (Fin n → ℝ)}
    (hF : DifferentiableAt ℝ F x) (hG : DifferentiableAt ℝ G x) :
    (coordinateSymplecticForm n).constSmooth.poissonBracket F G x =
      ∑ i, (fderiv ℝ F x (Pi.single i 1, 0) * fderiv ℝ G x (0, Pi.single i 1) -
        fderiv ℝ F x (0, Pi.single i 1) * fderiv ℝ G x (Pi.single i 1, 0)) := by
  sorry

end TauCetiRoadmap.HamiltonianSystems

/-! ## Layer 3: infinitesimal symmetries and moment maps -/

variable (𝔤 : Type*) [LieRing 𝔤] [LieAlgebra ℝ 𝔤]

namespace TauCetiRoadmap.HamiltonianSystems

variable (I M) in
/-- An infinitesimal action of `𝔤` on `M` by smooth vector fields, with the convention of the
fundamental vector fields of a left action: `(⁅Z, Z'⁆)_M = -[Z_M, Z'_M]`. -/
structure InfinitesimalAction where
  /-- The vector field of an element of `𝔤`. -/
  toLinearMap : 𝔤 →ₗ[ℝ] ((x : M) → TangentSpace I x)
  contMDiff : ∀ Z, ContMDiff I I.tangent ∞ (fun x ↦ (⟨x, toLinearMap Z x⟩ : TangentBundle I M))
  map_lie : ∀ Z Z', toLinearMap ⁅Z, Z'⁆ =
    -VectorField.mlieBracket I (toLinearMap Z) (toLinearMap Z')

end TauCetiRoadmap.HamiltonianSystems

open TauCetiRoadmap.HamiltonianSystems

variable {𝔤}

namespace TauCeti.SmoothTwoForm

/-- `μ` is a moment map: `ι_{Z_M} σ = d⟨μ, Z⟩`, with each component smooth. -/
def IsMomentMap (σ : SmoothTwoForm I M) (a : InfinitesimalAction I M 𝔤)
    (μ : M → Module.Dual ℝ 𝔤) : Prop :=
  ∀ Z, ContMDiff I 𝓘(ℝ, ℝ) ∞ (fun x ↦ μ x Z) ∧
    σ.IsHamiltonianVectorField (fun x ↦ μ x Z) (a.toLinearMap Z)

/-- The cocycle of a moment map at a point: `{μ_Z, μ_Z'} - μ_{⁅Z, Z'⁆}`. -/
def momentCocycle (σ : SmoothTwoForm I M) (μ : M → Module.Dual ℝ 𝔤) (x : M) (Z Z' : 𝔤) : ℝ :=
  σ.poissonBracket (fun y ↦ μ y Z) (fun y ↦ μ y Z') x - μ x ⁅Z, Z'⁆

/-- Layer 3: Noether's theorem. -/
theorem IsMomentMap.poissonBracket_eq_zero {σ : SmoothTwoForm I M} (hσ : σ.IsSymplectic)
    {a : InfinitesimalAction I M 𝔤} {μ : M → Module.Dual ℝ 𝔤} (hμ : σ.IsMomentMap a μ)
    {F : M → ℝ} (hF : σ.IsHamiltonian F)
    {Z : 𝔤} (hinv : ∀ x, mvfderiv I F x (a.toLinearMap Z x) = 0) :
    σ.poissonBracket (fun y ↦ μ y Z) F = 0 := by
  sorry

/-- Layer 3: Noether's theorem, conservation form. If `F` is invariant under `Z`, then along an
integral curve of `X_F` on an open set `s` of times, `μ_Z` takes the same value at any two times
of a preconnected `T ⊆ s` (an interval). -/
theorem IsMomentMap.apply_eq_of_isMIntegralCurveOn {σ : SmoothTwoForm I M} (hσ : σ.IsSymplectic)
    {a : InfinitesimalAction I M 𝔤} {μ : M → Module.Dual ℝ 𝔤} (hμ : σ.IsMomentMap a μ)
    {F : M → ℝ} (hF : σ.IsHamiltonian F)
    {Z : 𝔤} (hinv : ∀ x, mvfderiv I F x (a.toLinearMap Z x) = 0)
    {γ : ℝ → M} {s T : Set ℝ} (hs : IsOpen s)
    (hγ : IsMIntegralCurveOn γ (σ.hamiltonianVectorField F) s)
    (hT : IsPreconnected T) (hTs : T ⊆ s) {t₁ t₂ : ℝ} (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T) :
    μ (γ t₁) Z = μ (γ t₂) Z := by
  sorry

/-- Layer 3: a moment map shifted by a constant `ν` is a moment map. -/
theorem IsMomentMap.add_const {σ : SmoothTwoForm I M} {a : InfinitesimalAction I M 𝔤}
    {μ : M → Module.Dual ℝ 𝔤} (hμ : σ.IsMomentMap a μ) (ν : Module.Dual ℝ 𝔤) :
    σ.IsMomentMap a (fun x ↦ μ x + ν) := by
  sorry

/-- Layer 3: the shift equation at a point. Shifting the moment map by a constant `ν` changes
its cocycle at `x` by `-ν ⁅Z, Z'⁆`. No hypothesis on `M` is involved. -/
theorem IsMomentMap.momentCocycle_add_const {σ : SmoothTwoForm I M}
    {a : InfinitesimalAction I M 𝔤} {μ : M → Module.Dual ℝ 𝔤} (hμ : σ.IsMomentMap a μ)
    (ν : Module.Dual ℝ 𝔤) (x : M) (Z Z' : 𝔤) :
    σ.momentCocycle (fun y ↦ μ y + ν) x Z Z' = σ.momentCocycle μ x Z Z' - ν ⁅Z, Z'⁆ := by
  sorry

/-- Layer 3: at every point, the cocycle of a moment map for a closed form is a Lie algebra
2-cocycle with trivial coefficients. No connectedness or nonemptiness of `M` is involved. -/
theorem IsMomentMap.exists_twoCocycle_apply_eq_momentCocycle {σ : SmoothTwoForm I M}
    (hσ : σ.IsClosed) {a : InfinitesimalAction I M 𝔤} {μ : M → Module.Dual ℝ 𝔤}
    (hμ : σ.IsMomentMap a μ) (x : M) :
    ∃ c ∈ LieModule.Cohomology.twoCocycle ℝ 𝔤 (TrivialLieModule ℝ 𝔤 ℝ),
      ∀ Z Z', ((c : LieModule.Cohomology.twoCochain ℝ 𝔤 (TrivialLieModule ℝ 𝔤 ℝ)) Z Z' :
        TrivialLieModule ℝ 𝔤 ℝ) =
          (TrivialLieModule.equiv ℝ 𝔤 ℝ).symm (σ.momentCocycle μ x Z Z') := by
  sorry

/-- Layer 3: independence of the point. On a preconnected manifold, the cocycle of a moment map
for a closed form takes the same value at any two points. -/
theorem IsMomentMap.momentCocycle_eq_of_preconnectedSpace [PreconnectedSpace M]
    {σ : SmoothTwoForm I M} (hσ : σ.IsClosed) {a : InfinitesimalAction I M 𝔤}
    {μ : M → Module.Dual ℝ 𝔤} (hμ : σ.IsMomentMap a μ) (x y : M) (Z Z' : 𝔤) :
    σ.momentCocycle μ x Z Z' = σ.momentCocycle μ y Z Z' := by
  sorry

/-- Layer 3: the evaluation equation. On a connected manifold (preconnected and nonempty), for a
closed form, exactly one Lie algebra 2-cocycle with trivial coefficients takes the value
`σ.momentCocycle μ x Z Z'` on `(Z, Z')` for every point `x`: the cocycle of the moment map. On
the empty manifold the condition is vacuous and holds for every 2-cocycle, hence
`[ConnectedSpace M]`. -/
theorem IsMomentMap.existsUnique_twoCocycle [ConnectedSpace M] {σ : SmoothTwoForm I M}
    (hσ : σ.IsClosed) {a : InfinitesimalAction I M 𝔤} {μ : M → Module.Dual ℝ 𝔤}
    (hμ : σ.IsMomentMap a μ) :
    ∃! c : LieModule.Cohomology.twoCocycle ℝ 𝔤 (TrivialLieModule ℝ 𝔤 ℝ),
      ∀ x Z Z', ((c : LieModule.Cohomology.twoCochain ℝ 𝔤 (TrivialLieModule ℝ 𝔤 ℝ)) Z Z' :
        TrivialLieModule ℝ 𝔤 ℝ) =
          (TrivialLieModule.equiv ℝ 𝔤 ℝ).symm (σ.momentCocycle μ x Z Z') := by
  sorry

/-- Layer 3: the shift equation. On a connected manifold, if `c` is the cocycle of `μ` and `c'`
the cocycle of `μ + ν`, with `ν` constant, then `c' = c + d₁₂ ν`, where `ν` is read as a 1-cochain
with values in `TrivialLieModule ℝ 𝔤 ℝ`. On the empty manifold the two evaluation hypotheses are
vacuous and the conclusion fails in general, hence `[ConnectedSpace M]`. -/
theorem IsMomentMap.eq_add_d₁₂_of_add_const [ConnectedSpace M] {σ : SmoothTwoForm I M}
    {a : InfinitesimalAction I M 𝔤} {μ : M → Module.Dual ℝ 𝔤} (hμ : σ.IsMomentMap a μ)
    (ν : Module.Dual ℝ 𝔤)
    {c c' : LieModule.Cohomology.twoCochain ℝ 𝔤 (TrivialLieModule ℝ 𝔤 ℝ)}
    (hc : ∀ x Z Z', c Z Z' = (TrivialLieModule.equiv ℝ 𝔤 ℝ).symm (σ.momentCocycle μ x Z Z'))
    (hc' : ∀ x Z Z', c' Z Z' =
      (TrivialLieModule.equiv ℝ 𝔤 ℝ).symm (σ.momentCocycle (fun y ↦ μ y + ν) x Z Z')) :
    c' = c + LieModule.Cohomology.d₁₂ ℝ 𝔤 (TrivialLieModule ℝ 𝔤 ℝ)
      ((TrivialLieModule.equiv ℝ 𝔤 ℝ).symm.toLinearMap ∘ₗ ν) := by
  sorry

end TauCeti.SmoothTwoForm

end
