module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.MoorePenrose
public import TauCeti.Analysis.InnerProductSpace.Spectrum
public import TauCeti.Analysis.InnerProductSpace.ContinuousFunctionalCalculus
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.Compact
public import TauCeti.Analysis.Convex.Subdifferential

/-!
# Regularization of linear ill-posed problems: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches to
it, together with the definitions their statements need. Every headline whose carriers exist at
the pins is stated. The bullets of the README without a Lean name are definitions given in prose,
results supplied by Mathlib or Tau Ceti, or facts about a single definition that follow in one
step from it; these are API lemmas, not headlines. A few headlines that close by unfolding a
definition and one library inequality are proved here as sanity checks.

The conventions of the README are used throughout. `X` and `Y` are Hilbert spaces over
`RCLike 𝕜`, `K : X →L[𝕜] Y` is bounded, `adjoint K` is its Hilbert adjoint, and kernels, ranges
and orthogonal complements are those of the underlying linear map. A singular system is indexed
by an arbitrary type `ι`, finite or infinite, with positive singular values and no order on the
indices. A regularization scheme is a family `R : κ → Y →L[𝕜] X` together with a filter `l` on
the parameter type `κ`: `𝓝[>] 0` on `ℝ` for Tikhonov regularization and the spectral cut-off,
`atTop` on `ℕ` for the Landweber iteration. Limits and exact-data targets are given by the
Moore–Penrose generalized inverse `generalizedInverse K`, a linear partial map `Y →ₗ.[𝕜] X`.
Layer 6 works on a real Banach space `U` with the dual pairing of `StrongDual ℝ U`, and with the
subdifferential `TauCeti.subdifferential` of an `EReal`-valued function.

The implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace.
-/

@[expose] public section

noncomputable section

open Filter Topology Set ContinuousLinearMap
open scoped InnerProductSpace NNReal

namespace TauCetiRoadmap.RegularizationOfLinearIllPosedProblems

/-! ## Layer 1: singular systems and the Picard criterion -/

section SingularSystem

variable {𝕜 X Y : Type*} [RCLike 𝕜]
  [NormedAddCommGroup X] [InnerProductSpace 𝕜 X] [CompleteSpace X]
  [NormedAddCommGroup Y] [InnerProductSpace 𝕜 Y] [CompleteSpace Y]

/-- **A singular system** `(σ, e, g)` of a bounded operator `K` (1.1): orthonormal families `e`
in `X` and `g` in `Y` and positive numbers `σ` with `K eᵢ = σᵢ gᵢ` and `K* gᵢ = σᵢ eᵢ`, complete
in the sense that a vector orthogonal to every `eᵢ` lies in the kernel of `K`. The index type is
arbitrary; finite rank is a finite index type. -/
structure IsSingularSystem {ι : Type*} (K : X →L[𝕜] Y) (σ : ι → ℝ) (e : ι → X) (g : ι → Y) :
    Prop where
  orthonormal_e : Orthonormal 𝕜 e
  orthonormal_g : Orthonormal 𝕜 g
  pos : ∀ i, 0 < σ i
  apply_e : ∀ i, K (e i) = (σ i : 𝕜) • g i
  adjoint_apply_g : ∀ i, adjoint K (g i) = (σ i : 𝕜) • e i
  apply_eq_zero : ∀ x, (∀ i, ⟪e i, x⟫_𝕜 = 0) → K x = 0

/-- **Existence of a singular system for a compact operator** (1.1). -/
theorem IsCompactOperator.exists_isSingularSystem {K : X →L[𝕜] Y}
    (hK : IsCompactOperator K) :
    ∃ (s : Set X) (σ : s → ℝ) (g : s → Y), s.Countable ∧
      IsSingularSystem K σ (fun i ↦ (i : X)) g ∧ Tendsto σ cofinite (𝓝 0) := by
  sorry

/-- Tau Ceti: a compact self-adjoint operator has a Hilbert basis of eigenvectors. -/
example := @ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector

/-- Tau Ceti: approximation numbers, which are the singular values of a compact operator in
nonincreasing order. -/
example := @ContinuousLinearMap.singularValue

variable {ι : Type*} {K : X →L[𝕜] Y} {σ : ι → ℝ} {e : ι → X} {g : ι → Y}

/-- **The singular value expansion** (1.1): `K x = ∑ σᵢ ⟪eᵢ, x⟫ gᵢ` and
`‖K x‖² = ∑ σᵢ² |⟪eᵢ, x⟫|²`; the kernel of `K` is the orthogonal complement of the `eᵢ`, and
every `x` orthogonal to the kernel is `∑ ⟪eᵢ, x⟫ eᵢ`. -/
theorem IsSingularSystem.hasSum_apply (h : IsSingularSystem K σ e g) :
    (∀ x, HasSum (fun i ↦ ((σ i : 𝕜) * ⟪e i, x⟫_𝕜) • g i) (K x)) ∧
    (∀ x, HasSum (fun i ↦ σ i ^ 2 * ‖⟪e i, x⟫_𝕜‖ ^ 2) (‖K x‖ ^ 2)) ∧
    LinearMap.ker (K : X →ₗ[𝕜] Y) = (Submodule.span 𝕜 (Set.range e))ᗮ ∧
    ∀ x ∈ (LinearMap.ker (K : X →ₗ[𝕜] Y))ᗮ, HasSum (fun i ↦ ⟪e i, x⟫_𝕜 • e i) x := by
  sorry

/-- **Singular systems of the adjoint and of the Gram operator** (1.1). -/
theorem IsSingularSystem.adjoint_and_gram (h : IsSingularSystem K σ e g) :
    IsSingularSystem (adjoint K) σ g e ∧
      IsSingularSystem (adjoint K ∘L K) (fun i ↦ σ i ^ 2) e e := by
  sorry

/-- **Finite rank** (1.1): the range of `K` is finite-dimensional exactly when the singular
system is finite. -/
theorem IsSingularSystem.finiteDimensional_range_iff (h : IsSingularSystem K σ e g) :
    FiniteDimensional 𝕜 (LinearMap.range (K : X →ₗ[𝕜] Y)) ↔ Finite ι := by
  sorry

/-- **Picard's criterion** (1.2): `K x = y` is solvable exactly when `y` is orthogonal to the
kernel of `K*` and `∑ |⟪gᵢ, y⟫|² / σᵢ² < ∞`; the Picard series then converges to the solution
orthogonal to the kernel of `K`. -/
theorem IsSingularSystem.exists_eq_image_iff_picard (h : IsSingularSystem K σ e g) (y : Y) :
    ((∃ x, K x = y) ↔ (y ∈ (LinearMap.ker (adjoint K : Y →ₗ[𝕜] X))ᗮ ∧
        Summable fun i ↦ ‖⟪g i, y⟫_𝕜‖ ^ 2 / σ i ^ 2)) ∧
    ((∃ x, K x = y) → ∃ x, HasSum (fun i ↦ ((σ i : 𝕜)⁻¹ * ⟪g i, y⟫_𝕜) • e i) x ∧
        K x = y ∧ x ∈ (LinearMap.ker (K : X →ₗ[𝕜] Y))ᗮ) := by
  sorry

end SingularSystem

/-! ## Layer 2: the Moore–Penrose generalized inverse -/

section GeneralizedInverse

variable {𝕜 X Y : Type*} [RCLike 𝕜]
  [NormedAddCommGroup X] [InnerProductSpace 𝕜 X] [CompleteSpace X]
  [NormedAddCommGroup Y] [InnerProductSpace 𝕜 Y] [CompleteSpace Y]

/-- A **least-squares solution** of `K x = y` (2.1): `x` minimizes the residual `‖K z - y‖`. -/
def IsLeastSquaresSolution (K : X →L[𝕜] Y) (y : Y) (x : X) : Prop :=
  ∀ z, ‖K x - y‖ ≤ ‖K z - y‖

/-- The natural domain `R(K) + R(K)⊥` of the generalized inverse (2.1). -/
def generalizedInverseDomain (K : X →L[𝕜] Y) : Submodule 𝕜 Y :=
  LinearMap.range (K : X →ₗ[𝕜] Y) ⊔ (LinearMap.range (K : X →ₗ[𝕜] Y))ᗮ

/-- The graph of the generalized inverse (2.1): the pairs `(K x + z, x)` with `x` orthogonal to
the kernel of `K` and `z` orthogonal to its range. -/
def generalizedInverseGraph (K : X →L[𝕜] Y) : Submodule 𝕜 (Y × X) :=
  LinearMap.range
    (LinearMap.prod
      ((K : X →ₗ[𝕜] Y) ∘ₗ (LinearMap.ker (K : X →ₗ[𝕜] Y))ᗮ.subtype ∘ₗ LinearMap.fst 𝕜 _ _ +
        (LinearMap.range (K : X →ₗ[𝕜] Y))ᗮ.subtype ∘ₗ LinearMap.snd 𝕜 _ _)
      ((LinearMap.ker (K : X →ₗ[𝕜] Y))ᗮ.subtype ∘ₗ LinearMap.fst 𝕜 _ _))

/-- **The Moore–Penrose generalized inverse** `K†` of a bounded operator (2.1), the linear
partial map whose graph is `generalizedInverseGraph K`. -/
def generalizedInverse (K : X →L[𝕜] Y) : Y →ₗ.[𝕜] X :=
  (generalizedInverseGraph K).toLinearPMap

variable (K : X →L[𝕜] Y)

/-- **Graph and domain of `K†`** (2.1): the graph is `generalizedInverseGraph K`, the domain is
`R(K) + R(K)⊥`, and the domain is dense. -/
theorem graph_generalizedInverse :
    (generalizedInverse K).graph = generalizedInverseGraph K ∧
      (generalizedInverse K).domain = generalizedInverseDomain K ∧
      Dense (generalizedInverseDomain K : Set Y) := by
  sorry

/-- **Least-squares solutions** (2.1): one exists exactly for `y` in the domain of `K†`; they
are the solutions of the normal equation and form `K† y + N(K)`. -/
theorem isLeastSquaresSolution_iff (y : Y) :
    ((∃ x, IsLeastSquaresSolution K y x) ↔ y ∈ generalizedInverseDomain K) ∧
    ∀ (hy : y ∈ (generalizedInverse K).domain) (x : X),
      (IsLeastSquaresSolution K y x ↔ adjoint K (K x) = adjoint K y) ∧
      (IsLeastSquaresSolution K y x ↔
        x - generalizedInverse K ⟨y, hy⟩ ∈ LinearMap.ker (K : X →ₗ[𝕜] Y)) := by
  sorry

/-- **`K† y` is the minimal-norm least-squares solution** (2.1), the unique least-squares
solution orthogonal to the kernel. -/
theorem generalizedInverse_isMinimalNorm (y : (generalizedInverse K).domain) :
    generalizedInverse K y ∈ (LinearMap.ker (K : X →ₗ[𝕜] Y))ᗮ ∧
      IsLeastSquaresSolution K y (generalizedInverse K y) ∧
      ∀ x, IsLeastSquaresSolution K y x →
        ‖generalizedInverse K y‖ ≤ ‖x‖ ∧ (‖x‖ = ‖generalizedInverse K y‖ →
          x = generalizedInverse K y) := by
  sorry

/-- **The Moore–Penrose equations** (2.1): `K K† = Q` on the domain, with `Q` the orthogonal
projection onto the closure of the range, and `K† K = I - P`, with `P` the orthogonal projection
onto the kernel. -/
theorem generalizedInverse_moorePenrose :
    (∀ y : (generalizedInverse K).domain, K (generalizedInverse K y) =
      (LinearMap.range (K : X →ₗ[𝕜] Y)).topologicalClosure.starProjection (y : Y)) ∧
    ∀ (x : X) (hx : K x ∈ (generalizedInverse K).domain),
      generalizedInverse K ⟨K x, hx⟩ =
        (LinearMap.ker (K : X →ₗ[𝕜] Y))ᗮ.starProjection x := by
  sorry

/-- **`K†` has a closed graph** (2.2). -/
theorem isClosed_generalizedInverse : (generalizedInverse K).IsClosed := by
  sorry

/-- **Boundedness of `K†`** (2.2): `K†` is continuous on its domain exactly when the range of `K`
is closed; then the domain is `Y` and `K†` is the bounded operator satisfying Tau Ceti's four
Penrose conditions. -/
theorem continuous_generalizedInverse_iff :
    (Continuous (generalizedInverse K) ↔ IsClosed (Set.range K)) ∧
    (IsClosed (Set.range K) → generalizedInverseDomain K = ⊤ ∧
      ∃ B : Y →L[𝕜] X, LinearMap.IsMoorePenroseInverse (K : X →ₗ[𝕜] Y) (B : Y →ₗ[𝕜] X) ∧
        ∀ y : (generalizedInverse K).domain, B y = generalizedInverse K y) := by
  sorry

/-- Tau Ceti: the four Penrose conditions. -/
example := @LinearMap.IsMoorePenroseInverse

/-- **The compact case** (2.3): for an operator with a singular system, the domain of `K†` is
the Picard set and `K† y` is the Picard series. -/
theorem IsSingularSystem.generalizedInverse_hasSum {ι : Type*} {σ : ι → ℝ} {e : ι → X}
    {g : ι → Y} (h : IsSingularSystem K σ e g) :
    (∀ y, y ∈ generalizedInverseDomain K ↔ Summable fun i ↦ ‖⟪g i, y⟫_𝕜‖ ^ 2 / σ i ^ 2) ∧
    ∀ y : (generalizedInverse K).domain,
      HasSum (fun i ↦ ((σ i : 𝕜)⁻¹ * ⟪g i, (y : Y)⟫_𝕜) • e i) (generalizedInverse K y) := by
  sorry

/-- **Closed range of a compact operator** (2.3): the range of a compact operator is closed
exactly when it is finite-dimensional, so `K†` is unbounded for every compact operator of
infinite rank. -/
theorem isClosed_range_iff_finiteDimensional (hK : IsCompactOperator K) :
    IsClosed (Set.range K) ↔ FiniteDimensional 𝕜 (LinearMap.range (K : X →ₗ[𝕜] Y)) := by
  sorry

/-- **Agreement with Tau Ceti's finite-dimensional Moore–Penrose inverse** (2.3). -/
theorem generalizedInverse_eq_moorePenroseInverse [FiniteDimensional 𝕜 X]
    [FiniteDimensional 𝕜 Y] :
    generalizedInverseDomain K = ⊤ ∧ ∀ y : (generalizedInverse K).domain,
      generalizedInverse K y = (K : X →ₗ[𝕜] Y).moorePenroseInverse y := by
  sorry

/-- Tau Ceti: the finite-dimensional Moore–Penrose inverse from the singular system. -/
example := @LinearMap.moorePenroseInverse

end GeneralizedInverse

/-! ## Layer 3: regularization schemes and parameter choice -/

section Schemes

variable {𝕜 X Y : Type*} [RCLike 𝕜]
  [NormedAddCommGroup X] [InnerProductSpace 𝕜 X] [CompleteSpace X]
  [NormedAddCommGroup Y] [InnerProductSpace 𝕜 Y] [CompleteSpace Y]
  {κ : Type*}

/-- **A linear regularization scheme** for `K` along a filter `l` on the parameters (3.1):
`R a y → K† y` along `l` for every `y` in the domain of `K†`. -/
def IsRegularizationScheme (K : X →L[𝕜] Y) (R : κ → Y →L[𝕜] X) (l : Filter κ) : Prop :=
  ∀ y : (generalizedInverse K).domain, Tendsto (fun a ↦ R a y) l (𝓝 (generalizedInverse K y))

/-- **A regular parameter choice** `α(δ, yᵟ)` (3.1): for every exact `y` in the domain of `K†`,
`R_{α(δ, yᵟ)} yᵟ → K† y` as `δ → 0`, uniformly over all data with `‖yᵟ - y‖ ≤ δ`. -/
def IsRegularParameterChoice (K : X →L[𝕜] Y) (R : κ → Y →L[𝕜] X) (α : ℝ → Y → κ) : Prop :=
  ∀ y : (generalizedInverse K).domain, ∀ ε > 0, ∃ δ₀ > 0, ∀ δ, 0 < δ → δ < δ₀ →
    ∀ yδ : Y, ‖yδ - y‖ ≤ δ → ‖R (α δ yδ) yδ - generalizedInverse K y‖ < ε

variable {K : X →L[𝕜] Y} {R : κ → Y →L[𝕜] X} {l : Filter κ}

/-- **Schemes for an injective operator** (3.1): for injective `K` a regularization scheme is a
family with `R a (K x) → x` for every `x` and `R a z → 0` for every `z` orthogonal to the range;
for dense range the second condition is empty. -/
theorem isRegularizationScheme_iff_of_injective (hK : Function.Injective K) :
    IsRegularizationScheme K R l ↔
      (∀ x, Tendsto (fun a ↦ R a (K x)) l (𝓝 x)) ∧
        ∀ z ∈ (LinearMap.range (K : X →ₗ[𝕜] Y))ᗮ, Tendsto (fun a ↦ R a z) l (𝓝 0) := by
  sorry

omit [CompleteSpace X] [CompleteSpace Y] in
/-- **Error splitting into propagated noise and approximation error** (3.1). -/
theorem norm_sub_le_noise_add_bias (B : Y →L[𝕜] X) {y yδ : Y} {δ : ℝ} (x : X)
    (hδ : ‖yδ - y‖ ≤ δ) : ‖B yδ - x‖ ≤ δ * ‖B‖ + ‖B y - x‖ := by
  have h1 : B yδ - x = B (yδ - y) + (B y - x) := by rw [map_sub]; abel
  rw [h1]
  refine (norm_add_le _ _).trans (add_le_add_left ?_ _)
  calc ‖B (yδ - y)‖ ≤ ‖B‖ * ‖yδ - y‖ := B.le_opNorm _
    _ ≤ ‖B‖ * δ := mul_le_mul_of_nonneg_left hδ (norm_nonneg _)
    _ = δ * ‖B‖ := mul_comm _ _

/-- **Unbounded schemes** (3.1): if the range of `K` is not closed, `‖R a‖ → ∞` along `l`. -/
theorem IsRegularizationScheme.tendsto_norm_atTop (hR : IsRegularizationScheme K R l)
    (hK : ¬ IsClosed (Set.range K)) : Tendsto (fun a ↦ ‖R a‖) l atTop := by
  sorry

/-- **No convergence in operator norm** (3.1): if the range of `K` is not closed, then for no
family of bounded operators `R a` does `R a ∘L K` tend to the identity in operator norm along a
nontrivial filter; regularization schemes in particular converge only pointwise. -/
theorem not_tendsto_comp_of_not_isClosed_range [l.NeBot] (hK : ¬ IsClosed (Set.range K)) :
    ¬ Tendsto (fun a ↦ R a ∘L K) l (𝓝 (ContinuousLinearMap.id 𝕜 X)) := by
  sorry

/-- **A priori parameter choice** (3.1): if `α δ` tends along `l` and the propagated noise
`δ ‖R (α δ)‖` tends to zero, then `α` is a regular parameter choice. -/
theorem IsRegularizationScheme.isRegularParameterChoice (hR : IsRegularizationScheme K R l)
    (α : ℝ → κ) (hα : Tendsto α (𝓝[>] 0) l)
    (hnoise : Tendsto (fun δ ↦ δ * ‖R (α δ)‖) (𝓝[>] 0) (𝓝 0)) :
    IsRegularParameterChoice K R (fun δ _ ↦ α δ) := by
  sorry

/-- **Bakushinskii's theorem** (3.1): a regular parameter choice that does not use the noise
level exists only when the range of `K` is closed, that is, when `K†` is bounded. -/
theorem isClosed_range_of_isRegularParameterChoice (α : Y → κ)
    (h : IsRegularParameterChoice K R (fun _ yδ ↦ α yδ)) :
    IsClosed (Set.range K) ∧
      ∃ C, ∀ y : (generalizedInverse K).domain, ‖generalizedInverse K y‖ ≤ C * ‖(y : Y)‖ := by
  sorry

variable {ι : Type*} {σ : ι → ℝ} {e : ι → X} {g : ι → Y}

/-- **Spectral filters** (3.2): a bounded filter `q` with `|q a σ| ≤ c a · σ` and
`q a σ → 1` along `l` defines a regularization scheme with `‖R a‖ ≤ c a`. -/
theorem IsSingularSystem.exists_spectralFilter (h : IsSingularSystem K σ e g)
    (q : κ → ℝ → ℝ) (C : ℝ) (c : κ → ℝ) (hc0 : ∀ a, 0 ≤ c a) (hq : ∀ a i, |q a (σ i)| ≤ C)
    (hqc : ∀ a i, |q a (σ i)| ≤ c a * σ i) (hlim : ∀ i, Tendsto (fun a ↦ q a (σ i)) l (𝓝 1)) :
    ∃ R : κ → Y →L[𝕜] X,
      (∀ a y, HasSum (fun i ↦ (((q a (σ i) / σ i : ℝ) : 𝕜) * ⟪g i, y⟫_𝕜) • e i) (R a y)) ∧
      (∀ a, ‖R a‖ ≤ c a) ∧ IsRegularizationScheme K R l := by
  sorry

/-- **Spectral cut-off** (3.2): truncation at the threshold `τ > 0` is a regularization scheme as
`τ → 0⁺`, with `‖R τ‖ = 1 / σ_{i₀}` for the least singular value `σ_{i₀} ≥ τ`. -/
theorem IsSingularSystem.exists_spectralCutoff (h : IsSingularSystem K σ e g) :
    ∃ R : ℝ → Y →L[𝕜] X,
      (∀ τ > 0, ∀ y, HasSum (fun i ↦
        (if τ ≤ σ i then (σ i : 𝕜)⁻¹ * ⟪g i, y⟫_𝕜 else 0) • e i) (R τ y)) ∧
      IsRegularizationScheme K R (𝓝[>] 0) ∧
      ∀ τ > 0, ∀ i₀, τ ≤ σ i₀ → (∀ i, τ ≤ σ i → σ i₀ ≤ σ i) → ‖R τ‖ = (σ i₀)⁻¹ := by
  sorry

end Schemes

/-! ## Layer 4: Tikhonov regularization -/

section Tikhonov

variable {𝕜 X Y : Type*} [RCLike 𝕜]
  [NormedAddCommGroup X] [InnerProductSpace 𝕜 X] [CompleteSpace X]
  [NormedAddCommGroup Y] [InnerProductSpace 𝕜 Y] [CompleteSpace Y]

/-- **The Tikhonov operator** `R_α = (α I + K* K)⁻¹ K*` (4.1). The inverse is `Ring.inverse`,
which is `0` on a noninvertible operator; for `α > 0` the operator `α I + K* K` is invertible. -/
def tikhonov (K : X →L[𝕜] Y) (α : ℝ) : Y →L[𝕜] X :=
  Ring.inverse ((α : 𝕜) • (1 : X →L[𝕜] X) + adjoint K ∘L K) ∘L adjoint K

variable (K : X →L[𝕜] Y)

/-- **The Tikhonov functional and the regularized normal equation** (4.1). -/
theorem tikhonov_spec {α : ℝ} (hα : 0 < α) (y : Y) :
    IsUnit ((α : 𝕜) • (1 : X →L[𝕜] X) + adjoint K ∘L K) ∧
    (α : 𝕜) • tikhonov K α y + adjoint K (K (tikhonov K α y)) = adjoint K y ∧
    (∀ x, (α : 𝕜) • x + adjoint K (K x) = adjoint K y → x = tikhonov K α y) ∧
    ∀ x, x ≠ tikhonov K α y →
      ‖K (tikhonov K α y) - y‖ ^ 2 + α * ‖tikhonov K α y‖ ^ 2 < ‖K x - y‖ ^ 2 + α * ‖x‖ ^ 2 := by
  sorry

/-- **Norm bounds for the Tikhonov operator** (4.1). -/
theorem norm_tikhonov_le {α : ℝ} (hα : 0 < α) :
    ‖tikhonov K α‖ ≤ ‖K‖ / α ∧ ‖tikhonov K α‖ ≤ 1 / (2 * Real.sqrt α) := by
  sorry

/-- **Tikhonov regularization is a regularization scheme** (4.1), for every bounded `K`. -/
theorem isRegularizationScheme_tikhonov :
    IsRegularizationScheme K (tikhonov K) (𝓝[>] 0) := by
  sorry

/-- **The Tikhonov filter** (4.1): `R_α y = ∑ σᵢ / (α + σᵢ²) ⟪gᵢ, y⟫ eᵢ`. -/
theorem IsSingularSystem.hasSum_tikhonov {ι : Type*} {σ : ι → ℝ} {e : ι → X} {g : ι → Y}
    (h : IsSingularSystem K σ e g) {α : ℝ} (hα : 0 < α) (y : Y) :
    HasSum (fun i ↦ (((σ i / (α + σ i ^ 2) : ℝ) : 𝕜) * ⟪g i, y⟫_𝕜) • e i) (tikhonov K α y) := by
  sorry

/-- **A priori Tikhonov regularization** (4.1): `α(δ) → 0` and `δ² / α(δ) → 0` give a regular
parameter choice. -/
theorem isRegularParameterChoice_tikhonov (α : ℝ → ℝ) (hpos : ∀ δ > 0, 0 < α δ)
    (h0 : Tendsto α (𝓝[>] 0) (𝓝 0)) (h1 : Tendsto (fun δ ↦ δ ^ 2 / α δ) (𝓝[>] 0) (𝓝 0)) :
    IsRegularParameterChoice K (tikhonov K) (fun δ _ ↦ α δ) := by
  sorry

section SourceCondition

variable [Algebra ℝ (X →L[𝕜] X)] [IsScalarTower ℝ 𝕜 (X →L[𝕜] X)]

/-- **The source condition in singular coordinates** (4.2): for `ν > 0`, `(K* K)^ν w` has
coordinates `σᵢ^{2ν} ⟪eᵢ, w⟫` and is orthogonal to the kernel of `K`. -/
theorem IsSingularSystem.inner_cfc_rpow {ι : Type*} {σ : ι → ℝ} {e : ι → X} {g : ι → Y}
    (h : IsSingularSystem K σ e g) {ν : ℝ} (hν : 0 < ν) (w : X) :
    (∀ i, ⟪e i, cfc (fun t : ℝ ↦ t ^ ν) (adjoint K ∘L K) w⟫_𝕜 =
      (((σ i ^ 2) ^ ν : ℝ) : 𝕜) * ⟪e i, w⟫_𝕜) ∧
    cfc (fun t : ℝ ↦ t ^ ν) (adjoint K ∘L K) w ∈ (LinearMap.ker (K : X →ₗ[𝕜] Y))ᗮ := by
  sorry

/-- **Tikhonov convergence rates under a source condition** (4.2): for
`x† = (K* K)^ν w` with `0 < ν ≤ 1`, the exact-data error is at most `α^ν ‖w‖`, the noisy-data
error at most `δ / (2 √α) + α^ν ‖w‖`, and the choice `α = (δ / ‖w‖)^{2/(2ν+1)}` gives
`(3/2) ‖w‖^{1/(2ν+1)} δ^{2ν/(2ν+1)}`. -/
theorem norm_tikhonov_sub_le_rpow {ν : ℝ} (hν0 : 0 < ν) (hν1 : ν ≤ 1) (w : X) :
    let xd := cfc (fun t : ℝ ↦ t ^ ν) (adjoint K ∘L K) w
    (∀ α > 0, ‖tikhonov K α (K xd) - xd‖ ≤ α ^ ν * ‖w‖) ∧
    (∀ α > 0, ∀ (δ : ℝ) (yδ : Y), ‖yδ - K xd‖ ≤ δ →
      ‖tikhonov K α yδ - xd‖ ≤ δ / (2 * Real.sqrt α) + α ^ ν * ‖w‖) ∧
    (w ≠ 0 → ∀ δ > 0, ∀ yδ : Y, ‖yδ - K xd‖ ≤ δ →
      ‖tikhonov K ((δ / ‖w‖) ^ (2 / (2 * ν + 1))) yδ - xd‖ ≤
        3 / 2 * ‖w‖ ^ (1 / (2 * ν + 1)) * δ ^ (2 * ν / (2 * ν + 1))) := by
  sorry

end SourceCondition

/-- **The rate `O(α)` characterizes the range of `K* K`** (4.2). -/
theorem isBigO_tikhonov_sub_iff (x : X) :
    ((fun α : ℝ ↦ ‖tikhonov K α (K x) - x‖) =O[𝓝[>] 0] fun α ↦ α) ↔
      x ∈ LinearMap.range ((adjoint K ∘L K : X →L[𝕜] X) : X →ₗ[𝕜] X) := by
  sorry

/-- **Saturation of Tikhonov regularization** (4.2): an exact-data error `o(α)` forces
`x = 0`. -/
theorem eq_zero_of_isLittleO_tikhonov_sub (x : X)
    (h : (fun α : ℝ ↦ ‖tikhonov K α (K x) - x‖) =o[𝓝[>] 0] fun α ↦ α) : x = 0 := by
  sorry

/-! ### Morozov's discrepancy principle -/

/-- A **minimum norm solution with discrepancy `δ`** (4.3): `‖K x - y‖ ≤ δ`, and `x` has the
least norm among all such elements. -/
def IsMinNormDiscrepancySolution (y : Y) (δ : ℝ) (x : X) : Prop :=
  ‖K x - y‖ ≤ δ ∧ ∀ z, ‖K z - y‖ ≤ δ → ‖x‖ ≤ ‖z‖

/-- **Existence and uniqueness of the minimum norm solution with discrepancy** (4.3); it is `0`
exactly when `‖y‖ ≤ δ`. -/
theorem existsUnique_isMinNormDiscrepancySolution {y : Y} {δ : ℝ}
    (hne : ∃ x, ‖K x - y‖ ≤ δ) :
    (∃! x, IsMinNormDiscrepancySolution K y δ x) ∧
      (IsMinNormDiscrepancySolution K y δ 0 ↔ ‖y‖ ≤ δ) := by
  sorry

/-- **Morozov's discrepancy principle** (4.3): for dense range and `‖y‖ > δ > 0`, the minimum
norm solution with discrepancy `δ` is the Tikhonov solution for a parameter `α > 0` with
residual exactly `δ`, and `α (‖y‖ - δ) ≤ ‖K‖² δ`. -/
theorem exists_morozov_parameter (hK : DenseRange K) {y : Y} {δ : ℝ} (hδ : 0 < δ)
    (hy : δ < ‖y‖) {x : X} (hx : IsMinNormDiscrepancySolution K y δ x) :
    ∃ α > 0, x = tikhonov K α y ∧ ‖K x - y‖ = δ ∧ α * (‖y‖ - δ) ≤ ‖K‖ ^ 2 * δ := by
  sorry

/-- **Regularity of the discrepancy principle** (4.3): the minimum norm solutions with
discrepancy `δ` for data `yᵟ` with `‖yᵟ - K x†‖ ≤ δ` converge to `x†`, uniformly over the data,
when `x†` is orthogonal to the kernel. -/
theorem tendsto_isMinNormDiscrepancySolution {xd : X}
    (hxd : xd ∈ (LinearMap.ker (K : X →ₗ[𝕜] Y))ᗮ) :
    ∀ ε > 0, ∃ δ₀ > 0, ∀ δ, 0 < δ → δ < δ₀ → ∀ (yδ : Y) (x : X), ‖yδ - K xd‖ ≤ δ →
      IsMinNormDiscrepancySolution K yδ δ x → ‖x - xd‖ < ε := by
  sorry

/-- **Rate of the discrepancy principle** (4.3): under `x† = K* z` the error is at most
`2 √(‖z‖ δ)`. -/
theorem norm_sub_le_of_isMinNormDiscrepancySolution {xd : X} {z : Y} (hz : xd = adjoint K z)
    {δ : ℝ} {yδ : Y} (hyδ : ‖yδ - K xd‖ ≤ δ) {x : X}
    (hx : IsMinNormDiscrepancySolution K yδ δ x) :
    ‖x - xd‖ ≤ 2 * Real.sqrt (‖z‖ * δ) := by
  sorry

end Tikhonov

/-! ## Layer 5: the Landweber iteration -/

section Landweber

variable {𝕜 X Y : Type*} [RCLike 𝕜]
  [NormedAddCommGroup X] [InnerProductSpace 𝕜 X] [CompleteSpace X]
  [NormedAddCommGroup Y] [InnerProductSpace 𝕜 Y] [CompleteSpace Y]

/-- **The Landweber operator** `R_m = a ∑_{k=0}^{m} (I - a K* K)^k K*` (5.1); the index `m`
counts `m + 1` gradient steps. -/
def landweberFilter (K : X →L[𝕜] Y) (a : ℝ) (m : ℕ) : Y →L[𝕜] X :=
  (a : 𝕜) • ∑ k ∈ Finset.range (m + 1),
    ((1 - (a : 𝕜) • (adjoint K ∘L K)) ^ k) ∘L adjoint K

/-- **The Landweber iterates** `x₀ = a K* y`, `x_k = (I - a K* K) x_{k-1} + a K* y` (5.1). -/
def landweberIterate (K : X →L[𝕜] Y) (a : ℝ) (y : Y) : ℕ → X
  | 0 => (a : 𝕜) • adjoint K y
  | k + 1 => (1 - (a : 𝕜) • (adjoint K ∘L K)) (landweberIterate K a y k) + (a : 𝕜) • adjoint K y

/-- **The first index meeting the discrepancy bound** `‖K R_m yᵟ - yᵟ‖ ≤ γ δ` (5.2); it is `0`
when no index does. -/
def landweberDiscrepancyIndex (K : X →L[𝕜] Y) (a γ δ : ℝ) (yδ : Y) : ℕ :=
  sInf {m | ‖K (landweberFilter K a m yδ) - yδ‖ ≤ γ * δ}

variable (K : X →L[𝕜] Y)

/-- **The iterates are the Landweber operators applied to the data** (5.1). -/
theorem landweberIterate_eq (a : ℝ) (y : Y) (m : ℕ) :
    landweberIterate K a y m = landweberFilter K a m y := by
  sorry

/-- **Noise amplification of the Landweber iteration** (5.1): `‖R_m‖ ≤ √(a (m + 1))` for
`0 < a ≤ 1 / ‖K‖²`. -/
theorem norm_landweberFilter_le {a : ℝ} (ha : 0 < a) (haK : a * ‖K‖ ^ 2 ≤ 1) (m : ℕ) :
    ‖landweberFilter K a m‖ ≤ Real.sqrt (a * (m + 1)) := by
  sorry

/-- **The Landweber iteration is a regularization scheme** (5.1) for `0 < a < 2 / ‖K‖²`. -/
theorem isRegularizationScheme_landweberFilter {a : ℝ} (ha : 0 < a) (haK : a * ‖K‖ ^ 2 < 2) :
    IsRegularizationScheme K (landweberFilter K a) atTop := by
  sorry

/-- **A priori stopping** (5.1): `m(δ) → ∞` and `δ² m(δ) → 0` give a regular parameter choice. -/
theorem isRegularParameterChoice_landweberFilter {a : ℝ} (ha : 0 < a) (haK : a * ‖K‖ ^ 2 ≤ 1)
    (m : ℝ → ℕ) (hm : Tendsto m (𝓝[>] 0) atTop)
    (hδ : Tendsto (fun δ ↦ δ ^ 2 * (m δ : ℝ)) (𝓝[>] 0) (𝓝 0)) :
    IsRegularParameterChoice K (landweberFilter K a) (fun δ _ ↦ m δ) := by
  sorry

/-- **Discrepancy stopping of the Landweber iteration** (5.2): for `γ > 1` and attainable data a
stopping index exists, and the first one gives a regular parameter choice. -/
theorem exists_landweber_discrepancy_tendsto {a γ : ℝ} (ha : 0 < a) (haK : a * ‖K‖ ^ 2 ≤ 1)
    (hγ : 1 < γ) {xd : X} (hxd : xd ∈ (LinearMap.ker (K : X →ₗ[𝕜] Y))ᗮ) :
    (∀ δ > 0, ∀ yδ : Y, ‖yδ - K xd‖ ≤ δ →
      ∃ m, ‖K (landweberFilter K a m yδ) - yδ‖ ≤ γ * δ) ∧
    ∀ ε > 0, ∃ δ₀ > 0, ∀ δ, 0 < δ → δ < δ₀ → ∀ yδ : Y, ‖yδ - K xd‖ ≤ δ →
      ‖landweberFilter K a (landweberDiscrepancyIndex K a γ δ yδ) yδ - xd‖ < ε := by
  sorry

end Landweber

/-! ## Layer 6: variational regularization in Banach spaces -/

section Bregman

variable {U V : Type*} [NormedAddCommGroup U] [NormedSpace ℝ U]
  [NormedAddCommGroup V] [InnerProductSpace ℝ V] [CompleteSpace V]

/-- The dual pairing `⟪u, p⟫ = p u` of `U` with `StrongDual ℝ U` (6.1), the pairing in which
subgradients of functionals on `U` are taken. -/
def dualPairing : U →ₗ[ℝ] StrongDual ℝ U →ₗ[ℝ] ℝ :=
  (topDualPairing ℝ U).flip

/-- **The Bregman distance** `D_J^p(u, u₀) = J u - J u₀ - p (u - u₀)` (6.1). -/
def bregmanDist (J : U → EReal) (p : StrongDual ℝ U) (u u₀ : U) : EReal :=
  J u - J u₀ - ((p (u - u₀) : ℝ) : EReal)

/-- **The symmetric Bregman distance** `(p - p₀) (u - u₀)` (6.1). -/
def symmetricBregmanDist (p p₀ : StrongDual ℝ U) (u u₀ : U) : ℝ :=
  (p - p₀) (u - u₀)

/-- The functional `K* v = ⟪v, K ·⟫` on `U`, for `K : U →L[ℝ] V` with `V` a Hilbert space
(6.1). -/
def adjointFunctional (K : U →L[ℝ] V) (v : V) : StrongDual ℝ U :=
  (innerSL ℝ v).comp K

/-- Tau Ceti: the subdifferential of an `EReal`-valued function for a pairing. -/
example := @TauCeti.subdifferential

/-- **Symmetric Bregman distances are nonnegative** (6.1), by monotonicity of the
subdifferential. -/
theorem symmetricBregmanDist_nonneg {J : U → EReal} {p p₀ : StrongDual ℝ U} {u u₀ : U}
    (hp : p ∈ TauCeti.subdifferential dualPairing J u)
    (hp₀ : p₀ ∈ TauCeti.subdifferential dualPairing J u₀) :
    0 ≤ symmetricBregmanDist p p₀ u u₀ := by
  have h := TauCeti.apply_le_apply_of_mem_subdifferential dualPairing hp₀ hp
  simp only [dualPairing, LinearMap.flip_apply, topDualPairing_apply] at h
  simpa [symmetricBregmanDist, sub_nonneg] using h

/-- **Bregman distances are nonnegative** (6.1): `D_J^{p₀}(u, u₀) ≥ 0` for a subgradient
`p₀ ∈ ∂J(u₀)`, by the subgradient inequality; a proved sanity check of `bregmanDist`. -/
theorem bregmanDist_nonneg {J : U → EReal} {p₀ : StrongDual ℝ U} {u₀ : U}
    (hp₀ : p₀ ∈ TauCeti.subdifferential dualPairing J u₀) (u : U) :
    0 ≤ bregmanDist J p₀ u u₀ := by
  obtain ⟨hbot, htop, h⟩ := (TauCeti.mem_subdifferential_iff _).1 hp₀
  have hu : J u₀ + ((p₀ (u - u₀) : ℝ) : EReal) ≤ J u := h u
  unfold bregmanDist
  generalize J u₀ = s at hu hbot htop ⊢
  generalize J u = t at hu ⊢
  generalize p₀ (u - u₀) = c at hu ⊢
  lift s to ℝ using ⟨htop, hbot⟩
  rw [← EReal.coe_add] at hu
  induction t using EReal.rec with
  | bot => exact absurd (le_bot_iff.mp hu) (EReal.coe_ne_bot _)
  | top => rw [EReal.top_sub_coe, EReal.top_sub_coe]; exact le_top
  | coe t =>
    rw [← EReal.coe_sub, ← EReal.coe_sub]
    have : s + c ≤ t := by exact_mod_cast hu
    exact_mod_cast (by linarith)

variable (K : U →L[ℝ] V)

omit [CompleteSpace V] in
/-- **The source condition selects a `J`-minimizing solution** (6.2): if `K* v ∈ ∂J(u†)`, then
`u†` minimizes `J` on the solutions of `K u = K u†`; a proved sanity check, by the subgradient
inequality with `⟪v, K (u - u†)⟫ = 0`. -/
theorem le_of_mem_subdifferential_adjointFunctional {J : U → EReal} {ud : U} {v : V}
    (hsrc : adjointFunctional K v ∈ TauCeti.subdifferential dualPairing J ud) {u : U}
    (hu : K u = K ud) : J ud ≤ J u := by
  have h := ((TauCeti.mem_subdifferential_iff _).1 hsrc).2.2 u
  simpa [dualPairing, adjointFunctional, map_sub, hu] using h

/-- **Optimality condition of variational regularization** (6.2): at a minimizer `u_α` of
`½ ‖K u - fᵟ‖² + α J u` with `J` convex, `K* (fᵟ - K u_α) / α ∈ ∂J(u_α)`. -/
theorem mem_subdifferential_of_isMinOn {J : U → EReal}
    (hJ : Convex ℝ {p : U × ℝ | J p.1 ≤ p.2}) (hbot : ∀ u, J u ≠ ⊥) {α : ℝ} (hα : 0 < α)
    {fδ : V} {uα : U} (htop : J uα ≠ ⊤)
    (hmin : ∀ u, ((‖K uα - fδ‖ ^ 2 / 2 : ℝ) : EReal) + (α : EReal) * J uα ≤
      ((‖K u - fδ‖ ^ 2 / 2 : ℝ) : EReal) + (α : EReal) * J u) :
    adjointFunctional K (α⁻¹ • (fδ - K uα)) ∈ TauCeti.subdifferential dualPairing J uα := by
  sorry

/-- **Error estimate in the symmetric Bregman distance** (6.2): under the source condition
`K* v ∈ ∂J(u†)`, with `p_α = K* (fᵟ - K u_α) / α ∈ ∂J(u_α)`,
`D^symm(u†, u_α) + ‖K u_α - fᵟ‖² / (2α) ≤ δ² / (2α) + α ‖v‖² / 2`, and `α = δ / ‖v‖` gives
`D^symm(u†, u_α) ≤ ‖v‖ δ`. -/
theorem symmetricBregmanDist_add_le {J : U → EReal}
    (hJ : Convex ℝ {p : U × ℝ | J p.1 ≤ p.2}) (hbot : ∀ u, J u ≠ ⊥) {α δ : ℝ} (hα : 0 < α)
    {f fδ : V} {ud uα : U} {v : V} (hud : K ud = f) (hfδ : ‖fδ - f‖ ≤ δ) (htop : J uα ≠ ⊤)
    (hmin : ∀ u, ((‖K uα - fδ‖ ^ 2 / 2 : ℝ) : EReal) + (α : EReal) * J uα ≤
      ((‖K u - fδ‖ ^ 2 / 2 : ℝ) : EReal) + (α : EReal) * J u)
    (hsrc : adjointFunctional K v ∈ TauCeti.subdifferential dualPairing J ud) :
    let D := symmetricBregmanDist (adjointFunctional K v)
      (adjointFunctional K (α⁻¹ • (fδ - K uα))) ud uα
    0 ≤ D ∧ D + ‖K uα - fδ‖ ^ 2 / (2 * α) ≤ δ ^ 2 / (2 * α) + α / 2 * ‖v‖ ^ 2 ∧
      (v ≠ 0 → α = δ / ‖v‖ → D ≤ ‖v‖ * δ) := by
  sorry

/-- **The quadratic case** (6.2): on a real Hilbert space the subgradients of `½ ‖·‖²` are the
functionals `⟪u, ·⟫`, the symmetric Bregman distance is `‖u - u₀‖²`, and the source condition
reads `u† = K* v`. -/
theorem mem_subdifferential_half_sq_norm_iff {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] [CompleteSpace H] (L : H →L[ℝ] V) (u u₀ : H) (p : StrongDual ℝ H)
    (v : V) :
    (p ∈ TauCeti.subdifferential dualPairing (fun x ↦ ((‖x‖ ^ 2 / 2 : ℝ) : EReal)) u ↔
      p = innerSL ℝ u) ∧
    symmetricBregmanDist (innerSL ℝ u) (innerSL ℝ u₀) u u₀ = ‖u - u₀‖ ^ 2 ∧
    (adjointFunctional L v ∈
        TauCeti.subdifferential dualPairing (fun x ↦ ((‖x‖ ^ 2 / 2 : ℝ) : EReal)) u ↔
      u = adjoint L v) := by
  sorry

end Bregman

/-! ## Supplier names

This block declares nothing. It pins every Mathlib and Tau Ceti name that the README writes in
code. -/

#check @ContinuousLinearMap.adjoint
#check @ContinuousFunctionalCalculus
#check @ContinuousLinearMap.orthogonal_range
#check @Submodule.starProjection
#check @Submodule.HasOrthogonalProjection
#check @Submodule.orthogonal
#check @Submodule.toLinearPMap
#check @Submodule.toLinearPMap_graph_eq
#check @LinearPMap.graph
#check @LinearPMap.IsClosed
#check @IsCoercive.continuousLinearEquivOfBilin
#check @Real.rpow
#check @Asymptotics.IsBigO
#check @Asymptotics.IsLittleO
#check @Filter.Tendsto
#check @Filter.atTop
#check @Filter.cofinite
#check @nhdsWithin
#check @tsum
#check @IsCompactOperator.tendsto_singularValue
#check @LinearMap.isMoorePenroseInverse_iff_eq_moorePenroseInverse
#check @TauCeti.apply_le_apply_of_mem_subdifferential

/-- Tau Ceti: the instance `ContinuousFunctionalCalculus ℝ (E →L[𝕜] E) IsSelfAdjoint` over
`RCLike 𝕜`, PolarDecomposition's PD-A10. -/
example {𝕜 E : Type*} [RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
    [CompleteSpace E] [Algebra ℝ (E →L[𝕜] E)] [IsScalarTower ℝ 𝕜 (E →L[𝕜] E)] :
    ContinuousFunctionalCalculus ℝ (E →L[𝕜] E) IsSelfAdjoint := inferInstance

end TauCetiRoadmap.RegularizationOfLinearIllPosedProblems
