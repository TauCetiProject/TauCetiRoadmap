module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.Projection.Gap
public import TauCeti.Analysis.PDE.DirichletProblem
public import TauCeti.Analysis.PDE.Ellipticity.Basic
public import TauCeti.Analysis.Sobolev.W1p.Restriction
public import TauCeti.Analysis.Sobolev.W1p.Zero
public import TauCeti.Analysis.Sobolev.Wkp.Restriction
public import TauCeti.Topology.Semicontinuity.GammaConvergence

/-!
# Eigenvalue approximation and adaptive finite elements: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions): a variational eigenproblem is a compact form pair
`P : CompactFormPair ℝ V H` with an explicit coercivity constant; its `n`-th eigenvalue
(zero-based, nondecreasing, with multiplicity) is `P.rayleighMinMax ⊤ n` and the `n`-th discrete
eigenvalue of a subspace `L` is `P.rayleighMinMax L n`. Solution maps are data with the predicate
`IsSolutionMap`. Gaps between subspaces are `directedGap` and `gap`, built on `Metric.infDist`.
Possibly infinite quantities of the adaptive layer are in `ℝ≥0∞`. Constants `∃ C` are quantified
before meshes and functions.

Local copies, verbatim: `CompactFormPair`, `CompactFormPair.energy` (VariationalMethods §3.1)
and `CompactFormPair.rayleighMinMax` (VariationalMethods §4.4); from
GalerkinMethodsAndLagrangeFiniteElements: `E`, `evalₗ`, `polynomialsDegLE` (its Conventions,
copied there from SobolevPolynomialApproximation), `toOrderL`, `seminorm` (ditto), `cellDiam`,
`cellInball`, `cellOpen` (§2.1), `SimplicialMesh` with `domain`, `domainOpens`, `meshSize`,
`SharesFacet`, `HasConnectedStars`, `IsShapeRegular` (§2.2), `lagrangeSpace`,
`lagrangeSubmoduleW1p`, `lagrangeSubmoduleW1p0` (§§4.1–4.2), `IsGalerkinSolution` (§6.1),
`HasAdjointH2Regularity` (§6.3); from MixedAndNonconformingFiniteElements: `PolyField`,
`polyDiv`, `polyGrad`, `raviartThomas` with `polyFieldsDegLE` and `xMul`, `normalComp` (§4.1),
`facet`, `facetNormal` (its Conventions), `fieldDot` (§4.2), `SimplicialMesh.neighbor` (Layer 5)
and `rtFamilies` (§6.1).

The supporting lemma `form_solutionMap_sub_eq_zero` (Galerkin orthogonality, README 1.1) closes
by unfolding. Five headlines carry proofs, all short computations: `rayleigh_error_eq_quadratic`,
`norm_error_le_of_weighted_residuals`, `norm_sub_sq_add_norm_add_sq_eq_of_equilibrated`,
`exists_adaptive_error_contraction` and `falk_obstacle_error_le`.

The Mathlib and Tau Ceti declarations the README names are pinned by the `#check` lines at the end
of the file.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.EigenvalueApproximationAndAdaptiveFiniteElements

open TauCeti TauCeti.PDE MeasureTheory Set Metric Filter TopologicalSpace
open scoped ENNReal NNReal Topology InnerProductSpace

/-! ## Local copies of VariationalMethods -/

section FormPair

variable (𝕜 E H : Type*) [RCLike 𝕜]
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
  [NormedAddCommGroup H] [InnerProductSpace 𝕜 H] [CompleteSpace H]

/-- A compact form pair: a form domain `E`, a Hilbert space `H`, an injective, dense, compact
inclusion `E → H` (not assumed to be a topological embedding), a bounded Hermitian form on `E`
(conjugate-linear in its first slot) and a quantitative shifted lower bound
`c‖u‖² ≤ Re a(u,u) + ω‖j u‖²` with `c > 0`. Local copy of `CompactFormPair` of
VariationalMethods, §3.1. -/
structure CompactFormPair where
  /-- The form-domain inclusion `j : E → H`. -/
  inclusion : E →L[𝕜] H
  injective : Function.Injective inclusion
  dense : DenseRange inclusion
  compact : IsCompactOperator inclusion
  /-- The bounded Hermitian form `a`. -/
  form : E →L⋆[𝕜] E →L[𝕜] 𝕜
  hermitian : ∀ u v, form u v = star (form v u)
  /-- The coercivity constant `c`. -/
  coercivityConstant : ℝ
  coercivityConstant_pos : 0 < coercivityConstant
  /-- The shift `ω`. -/
  shift : ℝ
  shifted_lower_bound : ∀ u,
    coercivityConstant * ‖u‖ ^ 2 ≤ RCLike.re (form u u) + shift * ‖inclusion u‖ ^ 2

variable {𝕜 E H}

/-- The quadratic energy `q(u) = Re a(u,u)` of a compact form pair. Local copy of
`CompactFormPair.energy` of VariationalMethods, §3.1. -/
def CompactFormPair.energy (P : CompactFormPair 𝕜 E H) (u : E) : ℝ :=
  RCLike.re (P.form u u)

/-- The `n`-th min–max value of a subspace `L` of the form domain: the infimum, over
`(n+1)`-dimensional subspaces `M ≤ L`, of the supremum of the Rayleigh quotient
`q(u)/‖j u‖²` over nonzero `u ∈ M`. When `L` has dimension at most `n` the set is empty and the
value is the junk value `0` of `sInf`. Local copy of `CompactFormPair.rayleighMinMax` of
VariationalMethods, §4.4. -/
noncomputable def CompactFormPair.rayleighMinMax (P : CompactFormPair 𝕜 E H)
    (L : Submodule 𝕜 E) (n : ℕ) : ℝ :=
  sInf {s : ℝ | ∃ M : Submodule 𝕜 E, M ≤ L ∧ Module.finrank 𝕜 M = n + 1 ∧
    s = sSup {r : ℝ | ∃ u ∈ M, u ≠ 0 ∧ r = P.energy u / ‖P.inclusion u‖ ^ 2}}

end FormPair

/-! ## Layer 1: solution operators, gaps and convergence of spectral approximations -/

section Gap

variable {𝕜 X : Type*} [RCLike 𝕜] [NormedAddCommGroup X] [NormedSpace 𝕜 X]

/-- The directed gap `δ(U, W) = sup_{u ∈ U, ‖u‖ = 1} dist(u, W)`. It is at most `1`, since `W`
contains `0`, and it is `0` when `U = 0` (supremum over the empty type). -/
def directedGap (U W : Submodule 𝕜 X) : ℝ :=
  ⨆ u : {u : X // u ∈ U ∧ ‖u‖ = 1}, infDist (u : X) W

/-- The gap `δ̂(U, W) = max (δ(U, W), δ(W, U))`. -/
def gap (U W : Submodule 𝕜 X) : ℝ := max (directedGap U W) (directedGap W U)

/-- **The distance gap is the projection gap** (README 1.2): for subspaces of an inner product
space with orthogonal projections, `δ(U, W) = ‖P_{Wᗮ} P_U‖`. -/
theorem directedGap_eq_directedProjectionGap {Y : Type*} [NormedAddCommGroup Y]
    [InnerProductSpace 𝕜 Y] (U W : Submodule 𝕜 Y) [U.HasOrthogonalProjection]
    [W.HasOrthogonalProjection] :
    directedGap U W = Submodule.directedProjectionGap U W := sorry

end Gap

section SolutionMaps

variable {V H : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [CompleteSpace V]
  [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]

/-- `S` is the solution map of the pair on the subspace `L`: `S f ∈ L` and
`a(S f, v) = ⟪f, j v⟫` for every `v ∈ L`. With `L = ⊤` this is the continuous solution map; with
`L = V_h` the discrete one, and `j ∘ S` is the operator `T` or `T_h` on `H`. -/
def IsSolutionMap (P : CompactFormPair ℝ V H) (L : Submodule ℝ V) (S : H →L[ℝ] V) : Prop :=
  ∀ f, S f ∈ L ∧ ∀ v ∈ L, P.form (S f) v = ⟪f, P.inclusion v⟫_ℝ

/-- **Solution maps exist and are unique** (README 1.1) on every closed subspace, for a coercive
pair. -/
theorem existsUnique_isSolutionMap (P : CompactFormPair ℝ V H) {α : ℝ} (hα : 0 < α)
    (hcoer : ∀ u, α * ‖u‖ ^ 2 ≤ P.energy u) (L : Submodule ℝ V) (hL : IsClosed (L : Set V)) :
    ∃! S : H →L[ℝ] V, IsSolutionMap P L S := sorry

omit [CompleteSpace V] [CompleteSpace H] in
/-- **Galerkin orthogonality** (supporting lemma, README 1.1): `a(S f - S_h f, v) = 0` for
`v ∈ V_h`, so `T_h = P_h T` with `P_h` the energy projection onto `V_h`. -/
theorem form_solutionMap_sub_eq_zero (P : CompactFormPair ℝ V H) {L : Submodule ℝ V}
    {S₀ S : H →L[ℝ] V} (h₀ : IsSolutionMap P ⊤ S₀) (h : IsSolutionMap P L S) (f : H) {v : V}
    (hv : v ∈ L) : P.form (S₀ f - S f) v = 0 := by
  rw [map_sub, sub_apply, (h₀ f).2 v Submodule.mem_top, (h f).2 v hv,
    sub_self]

/-- Eigen-data of the pair, as in VariationalMethods §4.4: a Hilbert basis `b` of `H` of images
of form-domain eigenvectors `u n` with nondecreasing eigenvalues. -/
def IsEigenbasis (P : CompactFormPair ℝ V H) (b : HilbertBasis ℕ ℝ H) (u : ℕ → V)
    (eigenvalue : ℕ → ℝ) : Prop :=
  (∀ n, P.inclusion (u n) = b n) ∧ Monotone eigenvalue ∧
    ∀ n v, P.form (u n) v = eigenvalue n * ⟪b n, P.inclusion v⟫_ℝ

/-- Discrete eigen-data on a finite-dimensional subspace `L`: vectors `w 0, …, w (dim L - 1)` of
`L` with `H`-orthonormal images and nondecreasing discrete eigenvalues `μ i`, each satisfying the
discrete eigen-equation on `L`. Values of `w` and `μ` at indices `≥ dim L` are not used. -/
def IsDiscreteEigenbasis (P : CompactFormPair ℝ V H) (L : Submodule ℝ V) (w : ℕ → V)
    (μ : ℕ → ℝ) : Prop :=
  (∀ i < Module.finrank ℝ L, w i ∈ L) ∧
    Orthonormal ℝ (fun i : Fin (Module.finrank ℝ L) => P.inclusion (w i)) ∧
    (∀ i j, i ≤ j → j < Module.finrank ℝ L → μ i ≤ μ j) ∧
    ∀ i < Module.finrank ℝ L, ∀ v ∈ L,
      P.form (w i) v = μ i * ⟪P.inclusion (w i), P.inclusion v⟫_ℝ

/-- The span in `H` of the images of the first `N` vectors of a family. -/
def spanFirst (P : CompactFormPair ℝ V H) (w : ℕ → V) (N : ℕ) : Submodule ℝ H :=
  Submodule.span ℝ (range fun i : Fin N => P.inclusion (w i))

/-- **Convergence of a spectral approximation** in the sense of Boffi (7.7): for every cluster
boundary `N` (`λ_{N-1} < λ_N`), eventually `dim V_n ≥ N`, the first `N` discrete eigenvalues
converge to the first `N` eigenvalues, and the gap in `H` between the spans of the first `N`
eigenvectors and discrete eigenvectors tends to `0`. -/
def EigenConverges (P : CompactFormPair ℝ V H) (u : ℕ → V) (eigenvalue : ℕ → ℝ)
    (Vn : ℕ → Submodule ℝ V) (w : ℕ → ℕ → V) (μ : ℕ → ℕ → ℝ) : Prop :=
  ∀ N, 0 < N → eigenvalue (N - 1) < eigenvalue N →
    (∀ᶠ n in atTop, N ≤ Module.finrank ℝ (Vn n)) ∧
      (∀ i < N, Tendsto (fun n => μ n i) atTop (𝓝 (eigenvalue i))) ∧
      Tendsto (fun n => gap (spanFirst P u N) (spanFirst P (w n) N)) atTop (𝓝 0)

/-- **Convergence is norm convergence** (README 1.3): a sequence of finite-dimensional Galerkin
approximations converges in the sense of `EigenConverges` exactly when `‖T - T_n‖ → 0` in
`L(H)`. -/
theorem eigenConverges_iff_tendsto_norm (P : CompactFormPair ℝ V H) {α : ℝ} (hα : 0 < α)
    (hcoer : ∀ u, α * ‖u‖ ^ 2 ≤ P.energy u) {b : HilbertBasis ℕ ℝ H} {u : ℕ → V}
    {eigenvalue : ℕ → ℝ} (he : IsEigenbasis P b u eigenvalue) (Vn : ℕ → Submodule ℝ V)
    [∀ n, FiniteDimensional ℝ (Vn n)] {S₀ : H →L[ℝ] V} (hS₀ : IsSolutionMap P ⊤ S₀)
    {S : ℕ → H →L[ℝ] V} (hS : ∀ n, IsSolutionMap P (Vn n) (S n)) {w : ℕ → ℕ → V}
    {μ : ℕ → ℕ → ℝ} (hw : ∀ n, IsDiscreteEigenbasis P (Vn n) (w n) (μ n)) :
    EigenConverges P u eigenvalue Vn w μ ↔
      Tendsto (fun n => ‖P.inclusion ∘L S₀ - P.inclusion ∘L S n‖) atTop (𝓝 0) := sorry

/-- **Compactness turns pointwise into norm convergence** (README 1.3): if `T_n f → T f` for
every `f ∈ H`, then `‖T - T_n‖ → 0`. -/
theorem tendsto_norm_of_tendsto_apply (P : CompactFormPair ℝ V H) {α : ℝ} (hα : 0 < α)
    (hcoer : ∀ u, α * ‖u‖ ^ 2 ≤ P.energy u) (Vn : ℕ → Submodule ℝ V) {S₀ : H →L[ℝ] V}
    (hS₀ : IsSolutionMap P ⊤ S₀) {S : ℕ → H →L[ℝ] V} (hS : ∀ n, IsSolutionMap P (Vn n) (S n))
    (hpt : ∀ f, Tendsto (fun n => P.inclusion (S n f)) atTop (𝓝 (P.inclusion (S₀ f)))) :
    Tendsto (fun n => ‖P.inclusion ∘L S₀ - P.inclusion ∘L S n‖) atTop (𝓝 0) := sorry

end SolutionMaps

/-! ## Layer 2: norm-convergent compact operators on a complex Banach space -/

section Banach

variable {X : Type*} [NormedAddCommGroup X] [NormedSpace ℂ X] [CompleteSpace X]

/-- The sum of the generalized eigenspaces of `T` for its eigenvalues in the open disc of radius
`r` about `μ`. -/
def clusterSpace (T : X →L[ℂ] X) (μ : ℂ) (r : ℝ) : Submodule ℂ X :=
  ⨆ ν ∈ spectrum ℂ T ∩ ball μ r, Module.End.maxGenEigenspace (T : Module.End ℂ X) ν

/-- **No spurious modes** (README 2.1): a compact subset of the resolvent set of `T` lies in the
resolvent set of `T_n` for all large `n`. -/
theorem eventually_subset_resolventSet {T : X →L[ℂ] X} {Tn : ℕ → X →L[ℂ] X}
    (hconv : Tendsto Tn atTop (𝓝 T)) {K : Set ℂ} (hK : IsCompact K)
    (hKT : K ⊆ resolventSet ℂ T) : ∀ᶠ n in atTop, K ⊆ resolventSet ℂ (Tn n) := sorry

/-- **Conservation of algebraic multiplicity** (README 2.1): for a nonzero eigenvalue `μ` of a
compact `T`, isolated in the closed disc `B̄(μ, r)`, eventually `T_n` has finitely many
eigenvalues in the disc `B(μ, r)` and their algebraic multiplicities add up to that of `μ`. -/
theorem eventually_sum_finrank_maxGenEigenspace_eq {T : X →L[ℂ] X} (hT : IsCompactOperator T)
    {Tn : ℕ → X →L[ℂ] X} (hconv : Tendsto Tn atTop (𝓝 T)) {μ : ℂ} {r : ℝ} (hr : 0 < r)
    (hμ : μ ≠ 0) (hiso : spectrum ℂ T ∩ closedBall μ r = {μ}) :
    ∀ᶠ n in atTop, (spectrum ℂ (Tn n) ∩ ball μ r).Finite ∧
      ∑ᶠ ν ∈ spectrum ℂ (Tn n) ∩ ball μ r,
          Module.finrank ℂ (Module.End.maxGenEigenspace (Tn n : Module.End ℂ X) ν) =
        Module.finrank ℂ (Module.End.maxGenEigenspace (T : Module.End ℂ X) μ) := sorry

/-- **Gap of generalized eigenspaces** (README 2.2): `δ̂(G_μ, G_{n,μ}) ≤ c ‖(T - T_n)|_{G_μ}‖`
for all large `n`. -/
theorem exists_gap_clusterSpace_le {T : X →L[ℂ] X} (hT : IsCompactOperator T)
    {Tn : ℕ → X →L[ℂ] X} (hconv : Tendsto Tn atTop (𝓝 T)) {μ : ℂ} {r : ℝ} (hr : 0 < r)
    (hμ : μ ≠ 0) (hiso : spectrum ℂ T ∩ closedBall μ r = {μ}) :
    ∃ c : ℝ, ∀ᶠ n in atTop,
      gap (Module.End.maxGenEigenspace (T : Module.End ℂ X) μ) (clusterSpace (Tn n) μ r) ≤
        c * ‖(T - Tn n).comp (Module.End.maxGenEigenspace (T : Module.End ℂ X) μ).subtypeL‖ := sorry

/-- **Eigenvalue error and the ascent** (README 2.2): if `G_μ = ker (T - μ)^α` with `α ≥ 1`,
every eigenvalue `ν` of `T_n` in `B(μ, r)` has `|μ - ν| ≤ c ‖(T - T_n)|_{G_μ}‖^{1/α}` for all
large `n`. -/
theorem exists_norm_sub_le_rpow_ascent {T : X →L[ℂ] X} (hT : IsCompactOperator T)
    {Tn : ℕ → X →L[ℂ] X} (hconv : Tendsto Tn atTop (𝓝 T)) {μ : ℂ} {r : ℝ} (hr : 0 < r)
    (hμ : μ ≠ 0) (hiso : spectrum ℂ T ∩ closedBall μ r = {μ}) {α : ℕ} (hα : 1 ≤ α)
    (hasc : LinearMap.ker (((T - μ • 1 : X →L[ℂ] X) : Module.End ℂ X) ^ α) =
      Module.End.maxGenEigenspace (T : Module.End ℂ X) μ) :
    ∃ c : ℝ, ∀ᶠ n in atTop, ∀ ν ∈ spectrum ℂ (Tn n) ∩ ball μ r,
      ‖μ - ν‖ ≤ c *
        ‖(T - Tn n).comp (Module.End.maxGenEigenspace (T : Module.End ℂ X) μ).subtypeL‖ ^
          ((α : ℝ)⁻¹) := sorry

end Banach

/-! ## Layer 3: rates for symmetric problems -/

section Rates

variable {V H : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [CompleteSpace V]
  [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]

/-- The eigenspace `{u | a(u, v) = λ ⟪j u, j v⟫ for all v}` of the pair at `λ`. -/
def formEigenspace (P : CompactFormPair ℝ V H) (lam : ℝ) : Submodule ℝ V where
  carrier := {u | ∀ v, P.form u v = lam * ⟪P.inclusion u, P.inclusion v⟫_ℝ}
  zero_mem' := fun v => by simp
  add_mem' := by
    intro a b ha hb v
    simp only [Set.mem_ofPred_eq] at ha hb
    rw [map_add, add_apply, ha v, hb v, map_add, inner_add_left, mul_add]
  smul_mem' := by
    intro c a ha v
    simp only [Set.mem_ofPred_eq] at ha
    rw [map_smulₛₗ, smul_apply, ha v, map_smul, real_inner_smul_left]
    simp only [RCLike.conj_to_real, smul_eq_mul]
    ring

/-- **Double order of eigenvalue convergence** (README 3.1): under norm convergence,
`λ_n^{(k)} ≤ λ^{(k)} + C δ(E, V_n)²` for all large `n`, with `E` the eigenspace of `λ^{(k)}`
and the directed gap taken in the norm of `V`. -/
theorem rayleighMinMax_le_add_sq_directedGap (P : CompactFormPair ℝ V H) {α : ℝ} (hα : 0 < α)
    (hcoer : ∀ u, α * ‖u‖ ^ 2 ≤ P.energy u) (Vn : ℕ → Submodule ℝ V)
    [∀ n, FiniteDimensional ℝ (Vn n)] {S₀ : H →L[ℝ] V} (hS₀ : IsSolutionMap P ⊤ S₀)
    {S : ℕ → H →L[ℝ] V} (hS : ∀ n, IsSolutionMap P (Vn n) (S n))
    (hconv : Tendsto (fun n => ‖P.inclusion ∘L S₀ - P.inclusion ∘L S n‖) atTop (𝓝 0)) (k : ℕ) :
    ∃ C : ℝ, ∀ᶠ n in atTop, P.rayleighMinMax (Vn n) k ≤ P.rayleighMinMax ⊤ k +
      C * directedGap (formEigenspace P (P.rayleighMinMax ⊤ k)) (Vn n) ^ 2 := sorry

/-- **Eigenvector error** (README 3.1): if `λ_i = λ_k` exactly for `k ≤ i < k + m`, every
`u ∈ E` is approximated in `V` by a combination of the discrete eigenvectors `k, …, k + m - 1`
with error `≤ C δ(E, V_n) ‖u‖`. -/
theorem exists_mem_span_norm_sub_le (P : CompactFormPair ℝ V H) {α : ℝ} (hα : 0 < α)
    (hcoer : ∀ u, α * ‖u‖ ^ 2 ≤ P.energy u) (Vn : ℕ → Submodule ℝ V)
    [∀ n, FiniteDimensional ℝ (Vn n)] {S₀ : H →L[ℝ] V} (hS₀ : IsSolutionMap P ⊤ S₀)
    {S : ℕ → H →L[ℝ] V} (hS : ∀ n, IsSolutionMap P (Vn n) (S n))
    (hconv : Tendsto (fun n => ‖P.inclusion ∘L S₀ - P.inclusion ∘L S n‖) atTop (𝓝 0))
    {w : ℕ → ℕ → V} {μ : ℕ → ℕ → ℝ} (hw : ∀ n, IsDiscreteEigenbasis P (Vn n) (w n) (μ n))
    {k m : ℕ} (hkm : ∀ i, P.rayleighMinMax ⊤ i = P.rayleighMinMax ⊤ k ↔ k ≤ i ∧ i < k + m) :
    ∃ C : ℝ, ∀ᶠ n in atTop, ∀ u ∈ formEigenspace P (P.rayleighMinMax ⊤ k),
      ∃ v ∈ Submodule.span ℝ (w n '' Ico k (k + m)),
        ‖u - v‖ ≤ C * directedGap (formEigenspace P (P.rayleighMinMax ⊤ k)) (Vn n) * ‖u‖ :=
  sorry

omit [CompleteSpace V] [CompleteSpace H] in
/-- **The Rayleigh quotient error is quadratic** (README 3.1): for an eigenvector `u` with
eigenvalue `λ` and any `v` with `‖j v‖ = 1`, `q(v) - λ = q(v - u) - λ ‖j (v - u)‖²`. -/
theorem rayleigh_error_eq_quadratic (P : CompactFormPair ℝ V H) {u v : V} {lam : ℝ}
    (hu : ∀ w, P.form u w = lam * ⟪P.inclusion u, P.inclusion w⟫_ℝ)
    (hv : ‖P.inclusion v‖ = 1) :
    P.energy v - lam = P.energy (v - u) - lam * ‖P.inclusion (v - u)‖ ^ 2 := by
  have h₁ := hu v
  have h₂ := hu u
  have hs : P.form v u = P.form u v := by
    rw [P.hermitian v u]
    rfl
  rw [real_inner_self_eq_norm_sq] at h₂
  have hnorm := norm_sub_sq_real (P.inclusion v) (P.inclusion u)
  rw [hv, real_inner_comm (P.inclusion u) (P.inclusion v)] at hnorm
  simp only [CompactFormPair.energy, RCLike.re_to_real, map_sub, sub_apply,
    hnorm]
  linarith only [h₁, h₂, hs]

end Rates

/-! ## Local copies of GalerkinMethodsAndLagrangeFiniteElements -/

/-- Euclidean space `ℝⁿ`. Local copy of `E` of GalerkinMethodsAndLagrangeFiniteElements,
Conventions (itself a copy from SobolevPolynomialApproximation). -/
abbrev E (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-- Evaluation of a real polynomial in `n` variables as a function on `E n`. Local copy of
`evalₗ` of GalerkinMethodsAndLagrangeFiniteElements, Conventions. -/
def evalₗ (n : ℕ) : MvPolynomial (Fin n) ℝ →ₗ[ℝ] (E n → ℝ) where
  toFun q x := MvPolynomial.eval (fun i => x i) q
  map_add' q r := by ext x; simp
  map_smul' c q := by ext x; simp

/-- The polynomial functions of total degree at most `m` on `E n`. Local copy of
`polynomialsDegLE` of GalerkinMethodsAndLagrangeFiniteElements, Conventions. -/
def polynomialsDegLE (n m : ℕ) : Submodule ℝ (E n → ℝ) :=
  (MvPolynomial.restrictTotalDegree (Fin n) ℝ m).map (evalₗ n)

section SobolevCopies

variable {n : ℕ} {Ω : Opens (E n)} {p : ℝ≥0∞} [Fact (1 ≤ p)]

/-- The embedding `W^{k,p}(Ω) → W^{j,p}(Ω)` for `j ≤ k`. Local copy of `toOrderL` of
GalerkinMethodsAndLagrangeFiniteElements, Conventions. -/
def toOrderL {j k : ℕ} (h : j ≤ k) : Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j :=
  Nat.leRec (motive := fun k _ => Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j)
    (ContinuousLinearMap.id ℝ _) (fun k _ ih => ih.comp (Wkp.lowerOrderL k)) h

/-- The Sobolev seminorm `|u|_{W^{j,p}(Ω)}` of `u ∈ W^{k,p}(Ω)`, `j ≤ k`. Local copy of
`seminorm` of GalerkinMethodsAndLagrangeFiniteElements, Conventions. -/
def seminorm (k : ℕ) : (j : ℕ) → j ≤ k → Wkp volume Ω p k → ℝ
  | 0, _, u => ‖Wkp.value k u‖
  | j + 1, h, u => ‖Wkp.iteratedGradient j (toOrderL h u)‖

end SobolevCopies

section Mesh

variable {d : ℕ}

/-- The diameter `h_K` of a simplex. Local copy of `cellDiam` of
GalerkinMethodsAndLagrangeFiniteElements, §2.1. -/
def cellDiam (K : Affine.Simplex ℝ (E d) d) : ℝ := diam K.closedInterior

/-- The diameter `ρ_K = 2 r_K` of the inscribed ball of a simplex. Local copy of `cellInball` of
GalerkinMethodsAndLagrangeFiniteElements, §2.1. -/
def cellInball [NeZero d] (K : Affine.Simplex ℝ (E d) d) : ℝ := 2 * K.inradius

/-- The open cell `int K`, as an open set. Local copy of `cellOpen` of
GalerkinMethodsAndLagrangeFiniteElements, §2.1. -/
def cellOpen (K : Affine.Simplex ℝ (E d) d) : Opens (E d) :=
  ⟨interior K.closedInterior, isOpen_interior⟩

/-- A conforming simplicial mesh of a polyhedral domain in `E d`: finitely many `d`-simplices
with pairwise disjoint interiors, any two of which meet in the convex hull of common vertices.
Local copy of `SimplicialMesh` of GalerkinMethodsAndLagrangeFiniteElements, §2.2. -/
structure SimplicialMesh (d : ℕ) where
  /-- The number of cells. -/
  numCells : ℕ
  /-- The cells. -/
  cell : Fin numCells → Affine.Simplex ℝ (E d) d
  /-- Distinct cells have disjoint interiors. -/
  disjoint_interior : Pairwise fun i j => Disjoint (cell i).interior (cell j).interior
  /-- Two cells meet in the convex hull of a set of common vertices. -/
  conforming : ∀ i j, ∃ s : Set (Fin (d + 1)), (cell i).points '' s ⊆ range (cell j).points ∧
    (cell i).closedInterior ∩ (cell j).closedInterior = convexHull ℝ ((cell i).points '' s)

namespace SimplicialMesh

/-- The closed region `Ω̄ = ⋃ K` covered by a mesh. Local copy (GalerkinMethodsAndLagrange
FiniteElements, §2.2). -/
def domain (M : SimplicialMesh d) : Set (E d) := ⋃ i, (M.cell i).closedInterior

/-- The open domain `Ω = int ⋃ K` of a mesh. Local copy (GalerkinMethodsAndLagrange
FiniteElements, §2.2). -/
def domainOpens (M : SimplicialMesh d) : Opens (E d) := ⟨interior M.domain, isOpen_interior⟩

/-- The mesh size `h = max_K h_K` (zero for the empty mesh). Local copy
(GalerkinMethodsAndLagrangeFiniteElements, §2.2). -/
def meshSize (M : SimplicialMesh d) : ℝ := ⨆ i, cellDiam (M.cell i)

end SimplicialMesh

/-- Cells `i` and `j` of a mesh share a facet: `d` vertices of cell `i` are vertices of cell `j`.
Local copy (GalerkinMethodsAndLagrangeFiniteElements, §2.2). -/
def SimplicialMesh.SharesFacet (M : SimplicialMesh d) (i j : Fin M.numCells) : Prop :=
  ∃ s : Finset (Fin (d + 1)), s.card = d ∧ (M.cell i).points '' ↑s ⊆ range (M.cell j).points

/-- The cells containing any point `x` are connected through facets containing `x`. This excludes
pinched vertex stars such as two triangles meeting only at a vertex. Local copy
(GalerkinMethodsAndLagrangeFiniteElements, §2.2). -/
def SimplicialMesh.HasConnectedStars (M : SimplicialMesh d) : Prop :=
  ∀ x : E d, ∀ i j, x ∈ (M.cell i).closedInterior → x ∈ (M.cell j).closedInterior →
    Relation.ReflTransGen (fun a b => M.SharesFacet a b ∧ x ∈ (M.cell a).closedInterior ∧
      x ∈ (M.cell b).closedInterior) i j

/-- A family of meshes is shape regular with constant `σ`: `h_K ≤ σ ρ_K` for every cell. Local
copy (GalerkinMethodsAndLagrangeFiniteElements, §2.2). -/
def IsShapeRegular [NeZero d] (T : ℕ → SimplicialMesh d) (σ : ℝ) : Prop :=
  ∀ n i, cellDiam ((T n).cell i) ≤ σ * cellInball ((T n).cell i)

/-- The continuous piecewise polynomials of degree `k` on a mesh, extended by zero. Local copy
of `lagrangeSpace` of GalerkinMethodsAndLagrangeFiniteElements, §4.1. -/
def lagrangeSpace (M : SimplicialMesh d) (k : ℕ) : Submodule ℝ (E d → ℝ) where
  carrier := {v | (∀ x ∉ M.domain, v x = 0) ∧ ContinuousOn v M.domain ∧
    ∀ i, ∃ q ∈ polynomialsDegLE d k, EqOn v q (M.cell i).closedInterior}
  zero_mem' := ⟨fun _ _ => rfl, continuousOn_const, fun _ => ⟨0, zero_mem _, fun _ _ => rfl⟩⟩
  add_mem' := by
    rintro v w ⟨hv0, hvc, hvq⟩ ⟨hw0, hwc, hwq⟩
    refine ⟨fun x hx => by simp [hv0 x hx, hw0 x hx], hvc.add hwc, fun i => ?_⟩
    obtain ⟨q, hq, hvq⟩ := hvq i
    obtain ⟨r, hr, hwr⟩ := hwq i
    exact ⟨q + r, add_mem hq hr, fun x hx => by simp [hvq hx, hwr hx]⟩
  smul_mem' := by
    rintro c v ⟨hv0, hvc, hvq⟩
    refine ⟨fun x hx => by simp [hv0 x hx], hvc.const_smul c, fun i => ?_⟩
    obtain ⟨q, hq, hvq⟩ := hvq i
    exact ⟨c • q, Submodule.smul_mem _ c hq, fun x hx => by simp [hvq hx]⟩

/-- The Sobolev functions on `Ω` represented by a Lagrange finite element function. Local copy
of `lagrangeSubmoduleW1p` of GalerkinMethodsAndLagrangeFiniteElements, §4.2. -/
def lagrangeSubmoduleW1p (Ω : Opens (E d)) (p : ℝ≥0∞) [Fact (1 ≤ p)] (M : SimplicialMesh d)
    (k : ℕ) : Submodule ℝ (W1p volume Ω p) where
  carrier := {u | ∃ v ∈ lagrangeSpace M k, ⇑(W1p.value u) =ᵐ[volume.restrict (Ω : Set (E d))] v}
  zero_mem' := ⟨0, zero_mem _, by
    simpa only [← W1p.valueL_apply, map_zero] using
      Lp.coeFn_zero ℝ p (volume.restrict (Ω : Set (E d)))⟩
  add_mem' := by
    rintro u w ⟨v, hv, huv⟩ ⟨v', hv', hwv⟩
    exact ⟨v + v', add_mem hv hv', (W1p.value_add_ae u w).trans (huv.add hwv)⟩
  smul_mem' := by
    rintro c u ⟨v, hv, huv⟩
    exact ⟨c • v, Submodule.smul_mem _ c hv,
      (W1p.value_smul_ae c u).trans (huv.const_smul c)⟩

/-- The Lagrange finite element functions in `W^{1,p}_0(Ω)`. Local copy of
`lagrangeSubmoduleW1p0` of GalerkinMethodsAndLagrangeFiniteElements, §4.2. -/
def lagrangeSubmoduleW1p0 (Ω : Opens (E d)) (p : ℝ≥0∞) [Fact (1 ≤ p)] (M : SimplicialMesh d)
    (k : ℕ) : Submodule ℝ (W1p0 volume Ω p) :=
  (lagrangeSubmoduleW1p Ω p M k).comap (W1p0 volume Ω p).subtype

end Mesh

section GalerkinCopies

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d] {Ω : Opens (E d)}

/-- `uh` solves the Galerkin problem for `-div(A∇u) = f`, `u = 0` on `∂Ω`, in `Vh ⊆ H¹₀(Ω)`.
Local copy of `IsGalerkinSolution` of GalerkinMethodsAndLagrangeFiniteElements, §6.1. -/
def IsGalerkinSolution (A : E d → Matrix (Fin d) (Fin d) ℝ)
    (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (Vh : Submodule ℝ (W1p0 volume Ω 2))
    (uh : W1p0 volume Ω 2) : Prop :=
  uh ∈ Vh ∧ ∀ v ∈ Vh, energyFormH1 A 0 0 (uh : W1p volume Ω 2) (v : W1p volume Ω 2) =
    dirichletForcing f v

/-- The `H²` regularity of the adjoint problem with constant `Creg`: for every `g ∈ L²(Ω)` the
weak solution `z ∈ H¹₀(Ω)` of `-div(Aᵀ∇z) = g` lies in `H²(Ω)` with `|z|_{H²} ≤ Creg ‖g‖`.
Local copy of `HasAdjointH2Regularity` of GalerkinMethodsAndLagrangeFiniteElements, §6.3. -/
def HasAdjointH2Regularity (Ω : Opens (E d)) (A : E d → Matrix (Fin d) (Fin d) ℝ)
    (Creg : ℝ) : Prop :=
  ∀ g : Lp ℝ 2 (volume.restrict (Ω : Set (E d))), ∃ z : W1p0 volume Ω 2,
    IsWeakSolutionDirichlet (fun x => (A x).transpose) 0 0 g z ∧
      ∃ w : Wkp volume Ω 2 2, Wkp.firstOrder 1 w = (z : W1p volume Ω 2) ∧
        seminorm 2 2 le_rfl w ≤ Creg * ‖g‖

end GalerkinCopies

/-! ## Layer 3 (continued): the Dirichlet Laplacian with Lagrange elements -/

section Laplace

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d] {Ω : Opens (E d)}

/-- `P` is the compact form pair of the Dirichlet Laplacian on `Ω`: `V = H¹₀(Ω)`, `H = L²(Ω)`,
`j` the value map and `a(u, v) = ∫ ∇u · ∇v`. -/
def IsDirichletLaplacePair
    (P : CompactFormPair ℝ (W1p0 volume Ω 2) (Lp ℝ 2 (volume.restrict (Ω : Set (E d))))) :
    Prop :=
  (∀ u, P.inclusion u = W1p.value (u : W1p volume Ω 2)) ∧
    ∀ u v, P.form u v = energyFormH1 (fun _ => 1) 0 0 (u : W1p volume Ω 2) (v : W1p volume Ω 2)

/-- **Eigenvalue rate for Lagrange elements** (README 3.2): if the eigenspace of `λ^{(l)}` lies
in `H^{s+1}(Ω)`, `1 ≤ s ≤ k`, then `λ_h^{(l)} ≤ λ^{(l)} + C h^{2s}` for all large `n`. -/
theorem exists_dirichletEigenvalue_rate {σ : ℝ} {k s : ℕ} (hs : 1 ≤ s) (hsk : s ≤ k)
    (P : CompactFormPair ℝ (W1p0 volume Ω 2) (Lp ℝ 2 (volume.restrict (Ω : Set (E d)))))
    (hP : IsDirichletLaplacePair P) (T : ℕ → SimplicialMesh d) (hT : ∀ n, (T n).domainOpens = Ω)
    (hσ : IsShapeRegular T σ) (hstar : ∀ n, (T n).HasConnectedStars)
    (hh : Tendsto (fun n => (T n).meshSize) atTop (𝓝 0)) (l : ℕ)
    (hreg : ∀ u ∈ formEigenspace P (P.rayleighMinMax ⊤ l), ∃ w : Wkp volume Ω 2 (s + 1),
      Wkp.firstOrder s w = (u : W1p volume Ω 2)) :
    ∃ C : ℝ, ∀ᶠ n in atTop, P.rayleighMinMax (lagrangeSubmoduleW1p0 Ω 2 (T n) k) l ≤
      P.rayleighMinMax ⊤ l + C * (T n).meshSize ^ (2 * s) := sorry

/-- **Eigenfunction rate in `H¹`** (README 3.2): with the hypotheses of the eigenvalue rate and
`λ_i = λ_l` exactly for `l ≤ i < l + m`, every eigenfunction `u` is approximated by a
combination of the discrete eigenfunctions `l, …, l + m - 1` with
`‖∇(u - v)‖ ≤ C h^s ‖u‖_{L²}`. -/
theorem exists_dirichletEigenfunction_H1_rate {σ : ℝ} {k s : ℕ} (hs : 1 ≤ s) (hsk : s ≤ k)
    (P : CompactFormPair ℝ (W1p0 volume Ω 2) (Lp ℝ 2 (volume.restrict (Ω : Set (E d)))))
    (hP : IsDirichletLaplacePair P) (T : ℕ → SimplicialMesh d) (hT : ∀ n, (T n).domainOpens = Ω)
    (hσ : IsShapeRegular T σ) (hstar : ∀ n, (T n).HasConnectedStars)
    (hh : Tendsto (fun n => (T n).meshSize) atTop (𝓝 0)) {l m : ℕ}
    (hlm : ∀ i, P.rayleighMinMax ⊤ i = P.rayleighMinMax ⊤ l ↔ l ≤ i ∧ i < l + m)
    (hreg : ∀ u ∈ formEigenspace P (P.rayleighMinMax ⊤ l), ∃ w : Wkp volume Ω 2 (s + 1),
      Wkp.firstOrder s w = (u : W1p volume Ω 2))
    {w : ℕ → ℕ → W1p0 volume Ω 2} {μ : ℕ → ℕ → ℝ}
    (hw : ∀ n, IsDiscreteEigenbasis P (lagrangeSubmoduleW1p0 Ω 2 (T n) k) (w n) (μ n)) :
    ∃ C : ℝ, ∀ᶠ n in atTop, ∀ u ∈ formEigenspace P (P.rayleighMinMax ⊤ l),
      ∃ v ∈ Submodule.span ℝ (w n '' Ico l (l + m)),
        ‖W1p.gradient ((u : W1p volume Ω 2) - (v : W1p volume Ω 2))‖ ≤
          C * (T n).meshSize ^ s * ‖W1p.value (u : W1p volume Ω 2)‖ := sorry

/-- **Eigenfunction rate in `L²`** (README 3.2): adding `H²` regularity of the source problem,
the approximation of the previous headline satisfies `‖u - v‖_{L²} ≤ C h^{s+1} ‖u‖_{L²}`. -/
theorem exists_dirichletEigenfunction_L2_rate {σ Creg : ℝ} {k s : ℕ} (hs : 1 ≤ s) (hsk : s ≤ k)
    (P : CompactFormPair ℝ (W1p0 volume Ω 2) (Lp ℝ 2 (volume.restrict (Ω : Set (E d)))))
    (hP : IsDirichletLaplacePair P) (hreg2 : HasAdjointH2Regularity Ω (fun _ => 1) Creg)
    (T : ℕ → SimplicialMesh d) (hT : ∀ n, (T n).domainOpens = Ω)
    (hσ : IsShapeRegular T σ) (hstar : ∀ n, (T n).HasConnectedStars)
    (hh : Tendsto (fun n => (T n).meshSize) atTop (𝓝 0)) {l m : ℕ}
    (hlm : ∀ i, P.rayleighMinMax ⊤ i = P.rayleighMinMax ⊤ l ↔ l ≤ i ∧ i < l + m)
    (hreg : ∀ u ∈ formEigenspace P (P.rayleighMinMax ⊤ l), ∃ w : Wkp volume Ω 2 (s + 1),
      Wkp.firstOrder s w = (u : W1p volume Ω 2))
    {w : ℕ → ℕ → W1p0 volume Ω 2} {μ : ℕ → ℕ → ℝ}
    (hw : ∀ n, IsDiscreteEigenbasis P (lagrangeSubmoduleW1p0 Ω 2 (T n) k) (w n) (μ n)) :
    ∃ C : ℝ, ∀ᶠ n in atTop, ∀ u ∈ formEigenspace P (P.rayleighMinMax ⊤ l),
      ∃ v ∈ Submodule.span ℝ (w n '' Ico l (l + m)),
        ‖W1p.value ((u : W1p volume Ω 2) - (v : W1p volume Ω 2))‖ ≤
          C * (T n).meshSize ^ (s + 1) * ‖W1p.value (u : W1p volume Ω 2)‖ := sorry

end Laplace

/-! ## Local copies of MixedAndNonconformingFiniteElements -/

section PolynomialFields

variable {d : ℕ}

/-- A polynomial vector field on `E d`: one real polynomial per component. Local copy of
`PolyField` of MixedAndNonconformingFiniteElements, §4.1. -/
abbrev PolyField (d : ℕ) := Fin d → MvPolynomial (Fin d) ℝ

/-- The vector fields with components of total degree at most `k`, `P_k^d`. Local copy of
`polyFieldsDegLE` of MixedAndNonconformingFiniteElements, §4.1. -/
def polyFieldsDegLE (d k : ℕ) : Submodule ℝ (PolyField d) :=
  Submodule.pi univ fun _ => MvPolynomial.restrictTotalDegree (Fin d) ℝ k

/-- The divergence `∑ᵢ ∂ᵢ vᵢ` of a polynomial vector field. Local copy of `polyDiv` of
MixedAndNonconformingFiniteElements, §4.1. -/
def polyDiv (d : ℕ) : PolyField d →ₗ[ℝ] MvPolynomial (Fin d) ℝ :=
  ∑ i : Fin d, (MvPolynomial.pderiv i).toLinearMap ∘ₗ LinearMap.proj i

/-- The gradient `(∂ᵢ q)ᵢ` of a polynomial. Local copy of `polyGrad` of
MixedAndNonconformingFiniteElements, §4.1. -/
def polyGrad (d : ℕ) : MvPolynomial (Fin d) ℝ →ₗ[ℝ] PolyField d :=
  LinearMap.pi fun i => (MvPolynomial.pderiv i).toLinearMap

/-- The field `x q` for a polynomial `q`. Local copy of `xMul` of
MixedAndNonconformingFiniteElements, §4.1. -/
def xMul (d : ℕ) : MvPolynomial (Fin d) ℝ →ₗ[ℝ] PolyField d :=
  LinearMap.pi fun i => LinearMap.mulLeft ℝ (MvPolynomial.X i)

/-- The Raviart–Thomas space `RT_k = P_k^d ⊕ x P̃_k`, with `P̃_k` the homogeneous polynomials of
degree `k`. Local copy of `raviartThomas` of MixedAndNonconformingFiniteElements, §4.1. -/
def raviartThomas (d k : ℕ) : Submodule ℝ (PolyField d) :=
  polyFieldsDegLE d k ⊔ (MvPolynomial.homogeneousSubmodule (Fin d) ℝ k).map (xMul d)

/-- The normal component `∑ₗ nₗ vₗ(x)` of a polynomial field at `x`. Local copy of `normalComp`
of MixedAndNonconformingFiniteElements, §4.1. -/
def normalComp (v : PolyField d) (n x : E d) : ℝ := ∑ l, n l * evalₗ d (v l) x

/-- The facet of a simplex opposite vertex `a`. Local copy of `facet` of
MixedAndNonconformingFiniteElements, Conventions. -/
def facet (K : Affine.Simplex ℝ (E d) d) (a : Fin (d + 1)) : Set (E d) :=
  convexHull ℝ (K.points '' {a}ᶜ)

/-- The outward unit normal of the facet opposite vertex `a`. Local copy of `facetNormal` of
MixedAndNonconformingFiniteElements, Conventions. -/
def facetNormal [NeZero d] (K : Affine.Simplex ℝ (E d) d) (a : Fin (d + 1)) : E d :=
  (K.height a)⁻¹ • (K.altitudeFoot a -ᵥ K.points a)

/-- The pointwise product `v · w` of two polynomial fields at `x`. Local copy of `fieldDot` of
MixedAndNonconformingFiniteElements, §4.2. -/
def fieldDot (v w : PolyField d) (x : E d) : ℝ := ∑ l, evalₗ d (v l) x * evalₗ d (w l) x

end PolynomialFields

section MixedCopies

variable {d : ℕ} [NeZero d]

open Classical in
/-- The cell across the facet of cell `i` opposite its vertex `a`, if that facet is interior.
Local copy of `SimplicialMesh.neighbor` of MixedAndNonconformingFiniteElements, Layer 5. -/
def SimplicialMesh.neighbor (M : SimplicialMesh d) (i : Fin M.numCells) (a : Fin (d + 1)) :
    Option (Fin M.numCells) :=
  if h : ∃ j, j ≠ i ∧ facet (M.cell i) a ⊆ (M.cell j).closedInterior then some h.choose
  else none

/-- The global Raviart–Thomas space: one field of `RT_k` per cell, with continuous normal
components across interior facets. Local copy of `rtFamilies` of
MixedAndNonconformingFiniteElements, §6.1. -/
def rtFamilies (M : SimplicialMesh d) (k : ℕ) : Submodule ℝ (Fin M.numCells → PolyField d) where
  carrier := {v | (∀ i, v i ∈ raviartThomas d k) ∧ ∀ i a j, M.neighbor i a = some j →
    ∀ x ∈ facet (M.cell i) a,
      normalComp (v i) (facetNormal (M.cell i) a) x = normalComp (v j) (facetNormal (M.cell i) a) x}
  zero_mem' := ⟨fun _ => zero_mem _, fun _ _ _ _ _ _ => by simp [normalComp]⟩
  add_mem' := by
    rintro v w ⟨hv, hvn⟩ ⟨hw, hwn⟩
    refine ⟨fun i => add_mem (hv i) (hw i), fun i a j hj x hx => ?_⟩
    have h1 := hvn i a j hj x hx
    have h2 := hwn i a j hj x hx
    simp only [normalComp, Pi.add_apply, map_add, mul_add, Finset.sum_add_distrib] at h1 h2 ⊢
    rw [h1, h2]
  smul_mem' := by
    rintro c v ⟨hv, hvn⟩
    refine ⟨fun i => Submodule.smul_mem _ c (hv i), fun i a j hj x hx => ?_⟩
    have h1 := hvn i a j hj x hx
    simp only [normalComp, Pi.smul_apply, map_smul, smul_eq_mul] at h1 ⊢
    simp only [mul_left_comm _ c, ← Finset.mul_sum, h1]

end MixedCopies

/-! ## Layer 4: residual a posteriori estimates -/

section Residual

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d]

/-- The size `|K|^{1/d}` of a cell, the mesh-size function of the adaptive layer; it is
comparable to `h_K` under shape regularity and halves its `d`-th power under bisection. -/
def cellSize (K : Affine.Simplex ℝ (E d) d) : ℝ :=
  (volume K.closedInterior).toReal ^ ((d : ℝ)⁻¹)

/-- The flux `D ∇q` of a polynomial for a constant coefficient matrix `D`. -/
def polyFlux (D : Matrix (Fin d) (Fin d) ℝ) (q : MvPolynomial (Fin d) ℝ) : PolyField d :=
  fun l => ∑ m, MvPolynomial.C (D l m) * MvPolynomial.pderiv m q

/-- The jump `(D_i ∇q_i - D_j ∇q_j) · n` of the normal flux across the facet of cell `i`
opposite `a`, with `n` the outward normal of cell `i`; zero on a boundary facet. -/
def normalFluxJump (M : SimplicialMesh d) (D : Fin M.numCells → Matrix (Fin d) (Fin d) ℝ)
    (q : Fin M.numCells → MvPolynomial (Fin d) ℝ) (i : Fin M.numCells) (a : Fin (d + 1)) :
    MvPolynomial (Fin d) ℝ :=
  (M.neighbor i a).elim 0 fun j => ∑ l, MvPolynomial.C (facetNormal (M.cell i) a l) *
    (polyFlux (D i) (q i) l - polyFlux (D j) (q j) l)

/-- The square `η_K²` of the residual indicator of cell `i`:
`|K| ^ {2/d} ‖f + div(D_K ∇q_K)‖²_{L²(K)} + |K| ^ {1/d} ∑_F ‖[D∇q] · n‖²_{L²(F)}`. -/
def residualIndicatorSq (M : SimplicialMesh d) (D : Fin M.numCells → Matrix (Fin d) (Fin d) ℝ)
    (f : E d → ℝ) (q : Fin M.numCells → MvPolynomial (Fin d) ℝ) (i : Fin M.numCells) : ℝ :=
  cellSize (M.cell i) ^ 2 * ∫ x in (M.cell i).closedInterior,
      (f x + evalₗ d (polyDiv d (polyFlux (D i) (q i))) x) ^ 2 +
    cellSize (M.cell i) * ∑ a, ∫ x in facet (M.cell i) a,
      evalₗ d (normalFluxJump M D q i a) x ^ 2 ∂μHE[d - 1]

/-- The data oscillation `inf_{p ∈ P_l} ‖f - p‖²_{L²(K)}` (a real infimum of a set bounded below
by `0` and containing the value at `p = 0`). -/
def dataOsc (l : ℕ) (K : Affine.Simplex ℝ (E d) d) (f : E d → ℝ) : ℝ :=
  ⨅ p : MvPolynomial.restrictTotalDegree (Fin d) ℝ l,
    ∫ x in K.closedInterior, (f x - evalₗ d (p : MvPolynomial (Fin d) ℝ) x) ^ 2

open Classical in
/-- Cell `i` together with the cells across its interior facets. -/
def facetPatch (M : SimplicialMesh d) (i : Fin M.numCells) : Finset (Fin M.numCells) :=
  insert i (Finset.univ.filter fun j => ∃ a, M.neighbor i a = some j)

open Classical in
/-- The cells sharing a vertex with cell `i`. -/
def vertexPatch (M : SimplicialMesh d) (i : Fin M.numCells) : Finset (Fin M.numCells) :=
  Finset.univ.filter fun j => ∃ a b, (M.cell i).points a = (M.cell j).points b

/-- **Abstract reliability** (README 4.1): if `a(e, v) = ∑ᵢ ⟪rᵢ, zᵢ(v)⟫` with
`∑ᵢ ‖zᵢ(v)‖² / wᵢ ≤ C² ‖v‖²`, then `‖e‖ ≤ (C/α) (∑ᵢ wᵢ ‖rᵢ‖²)^{1/2}`. -/
theorem norm_error_le_of_weighted_residuals {V H : Type*}
    [NormedAddCommGroup V] [NormedSpace ℝ V]
    [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (A : V →L[ℝ] StrongDual ℝ V) {α C : ℝ} (hα : 0 < α) (hC : 0 ≤ C)
    (hcoerce : ∀ e, α * ‖e‖ ^ 2 ≤ A e e)
    (n : ℕ) (w : Fin n → ℝ) (hw : ∀ i, 0 < w i) (r : Fin n → H)
    (z : V → Fin n → H) (e : V)
    (hrep : ∀ v, A e v = ∑ i, ⟪r i, z v i⟫_ℝ)
    (hinterp : ∀ v, (∑ i, ‖z v i‖ ^ 2 / w i) ≤ C ^ 2 * ‖v‖ ^ 2) :
    ‖e‖ ≤ (C / α) * Real.sqrt (∑ i, w i * ‖r i‖ ^ 2) := by
  let R := ∑ i, w i * ‖r i‖ ^ 2
  let Z := ∑ i, ‖z e i‖ ^ 2 / w i
  let a := fun i ↦ Real.sqrt (w i) * ‖r i‖
  let b := fun i ↦ ‖z e i‖ / Real.sqrt (w i)
  have hR : 0 ≤ R := Finset.sum_nonneg fun i _ ↦ mul_nonneg (hw i).le (sq_nonneg _)
  have ha : ∑ i, (a i) ^ 2 = R := by
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    simp only [a, mul_pow, Real.sq_sqrt (hw i).le]
  have hb : ∑ i, (b i) ^ 2 = Z := by
    refine Finset.sum_congr rfl fun i _ ↦ ?_
    simp only [b, div_pow, Real.sq_sqrt (hw i).le]
  have hCS : (∑ i, a i * b i) ^ 2 ≤ R * Z := by
    rw [← ha, ← hb]
    exact Finset.sum_mul_sq_le_sq_mul_sq Finset.univ a b
  have hinner : A e e ≤ ∑ i, a i * b i := by
    rw [hrep e]
    refine Finset.sum_le_sum fun i _ ↦ ?_
    have hp : Real.sqrt (w i) ≠ 0 := (Real.sqrt_pos.mpr (hw i)).ne'
    have heq : a i * b i = ‖r i‖ * ‖z e i‖ := by
      dsimp only [a, b]
      field_simp
    rw [heq]
    exact (le_abs_self _).trans (abs_real_inner_le_norm _ _)
  have hE := (hcoerce e).trans hinner
  have hEpos : 0 ≤ α * ‖e‖ ^ 2 := by positivity
  have hSpos : 0 ≤ ∑ i, a i * b i := hEpos.trans hE
  have hprod : α * ‖e‖ ^ 2 ≤ C * Real.sqrt R * ‖e‖ := by
    apply (sq_le_sq₀ hEpos (by positivity)).mp
    calc
      _ ≤ (∑ i, a i * b i) ^ 2 := (sq_le_sq₀ hEpos hSpos).mpr hE
      _ ≤ R * Z := hCS
      _ ≤ R * (C ^ 2 * ‖e‖ ^ 2) := mul_le_mul_of_nonneg_left (hinterp e) hR
      _ = _ := by rw [mul_pow, mul_pow, Real.sq_sqrt hR]; ring
  by_cases he : ‖e‖ = 0
  · rw [he]
    exact mul_nonneg (div_nonneg hC hα.le) (Real.sqrt_nonneg _)
  have hnorm : 0 < ‖e‖ := lt_of_le_of_ne (norm_nonneg _) (Ne.symm he)
  have he' : α * ‖e‖ ≤ C * Real.sqrt R := by
    apply (mul_le_mul_iff_right₀ hnorm).mp
    nlinarith only [hprod]
  rw [div_mul_eq_mul_div, le_div_iff₀ hα]
  simpa only [mul_comm ‖e‖ α] using he'

/-- **Reliability of the residual estimator** (README 4.2): for a piecewise constant uniformly
elliptic coefficient, `‖∇(u - u_h)‖² ≤ C ∑_K η_K²`, with `C` depending only on `d`, `k`, `σ`, `λ`
and `Λ`. -/
theorem exists_residual_reliability (σ lam Lam : ℝ) (k : ℕ) (hk : 1 ≤ k) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (Ω : Opens (E d)) (M : SimplicialMesh d), M.domainOpens = Ω →
      (∀ i, cellDiam (M.cell i) ≤ σ * cellInball (M.cell i)) → M.HasConnectedStars →
      ∀ (A : E d → Matrix (Fin d) (Fin d) ℝ) (D : Fin M.numCells → Matrix (Fin d) (Fin d) ℝ),
      UniformlyEllipticOn (Ω : Set (E d)) A lam Lam →
      (∀ i, ∀ x ∈ cellOpen (M.cell i), A x = D i) →
      ∀ (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u uh : W1p0 volume Ω 2)
        (q : Fin M.numCells → MvPolynomial (Fin d) ℝ),
      IsWeakSolutionDirichlet A 0 0 f u →
      IsGalerkinSolution A f (lagrangeSubmoduleW1p0 Ω 2 M k) uh →
      (∀ i, ∀ᵐ x ∂(volume.restrict ((M.cell i).closedInterior)),
        W1p.value (uh : W1p volume Ω 2) x = evalₗ d (q i) x) →
      ‖W1p.gradient ((u : W1p volume Ω 2) - (uh : W1p volume Ω 2))‖ ^ 2 ≤
        C * ∑ i, residualIndicatorSq M D f q i := sorry

/-- **Local efficiency of the residual estimator** (README 4.2): for a piecewise polynomial
`u_h ∈ H¹₀(Ω)` of degree `≤ k`,
`η_K² ≤ C ∑_{K' ∈ ω_K} (‖∇(u - u_h)‖²_{K'} + |K'|^{2/d} osc_{k-1}(f, K'))`, over the cells
sharing a facet with `K`. -/
theorem exists_residual_efficiency (σ lam Lam : ℝ) (k : ℕ) (hk : 1 ≤ k) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (Ω : Opens (E d)) (M : SimplicialMesh d), M.domainOpens = Ω →
      (∀ i, cellDiam (M.cell i) ≤ σ * cellInball (M.cell i)) →
      ∀ (A : E d → Matrix (Fin d) (Fin d) ℝ) (D : Fin M.numCells → Matrix (Fin d) (Fin d) ℝ),
      UniformlyEllipticOn (Ω : Set (E d)) A lam Lam →
      (∀ i, ∀ x ∈ cellOpen (M.cell i), A x = D i) →
      ∀ (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u uh : W1p0 volume Ω 2)
        (q : Fin M.numCells → MvPolynomial (Fin d) ℝ),
      IsWeakSolutionDirichlet A 0 0 f u →
      (∀ i, q i ∈ MvPolynomial.restrictTotalDegree (Fin d) ℝ k) →
      (∀ i, ∀ᵐ x ∂(volume.restrict ((M.cell i).closedInterior)),
        W1p.value (uh : W1p volume Ω 2) x = evalₗ d (q i) x) →
      ∀ i, residualIndicatorSq M D f q i ≤ C * ∑ j ∈ facetPatch M i,
        ((∫ x in (M.cell j).closedInterior,
            ‖W1p.gradient ((u : W1p volume Ω 2) - (uh : W1p volume Ω 2)) x‖ ^ 2) +
          cellSize (M.cell j) ^ 2 * dataOsc (k - 1) (M.cell j) f) := sorry

end Residual

/-! ## Layer 5: equilibrated fluxes -/

section Equilibration

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d] {Ω : Opens (E d)}

omit [NeZero d] in
/-- **The Prager–Synge identity** (README 5.1): for the weak solution of `-Δu = f` and any flux
`σ` with `div σ = f` in the weak sense on `H¹₀(Ω)`,
`‖∇u - ∇u_h‖² + ‖∇u + σ‖² = ‖∇u_h + σ‖²` for every `u_h ∈ H¹₀(Ω)`. -/
theorem norm_sub_sq_add_norm_add_sq_eq_of_equilibrated
    {f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))}
    {u : W1p0 volume Ω 2} (uh : W1p0 volume Ω 2)
    (σ : Lp (E d) 2 (volume.restrict (Ω : Set (E d))))
    (hu : IsWeakSolutionDirichlet (fun _ => 1) 0 0 f u)
    (hdiv : ∀ v : W1p0 volume Ω 2,
      ⟪σ, W1p.gradient (v : W1p volume Ω 2)⟫_ℝ = -⟪f, W1p.value (v : W1p volume Ω 2)⟫_ℝ) :
    ‖W1p.gradient (u : W1p volume Ω 2) - W1p.gradient (uh : W1p volume Ω 2)‖ ^ 2 +
        ‖W1p.gradient (u : W1p volume Ω 2) + σ‖ ^ 2 =
      ‖W1p.gradient (uh : W1p volume Ω 2) + σ‖ ^ 2 := by
  have h₁ := (isWeakSolutionDirichlet_iff f u).mp hu uh
  have h₂ := (isWeakSolutionDirichlet_iff f u).mp hu u
  rw [energyFormH1_one_zero_zero_eq_inner, ← dirichletForcing_apply_eq_setIntegral,
    dirichletForcing_apply] at h₁ h₂
  have h₃ := hdiv uh
  have h₄ := hdiv u
  have horth : ⟪W1p.gradient (u : W1p volume Ω 2) + σ,
      W1p.gradient (uh : W1p volume Ω 2) - W1p.gradient (u : W1p volume Ω 2)⟫_ℝ = 0 := by
    rw [inner_add_left, inner_sub_right, inner_sub_right]
    linarith only [h₁, h₂, h₃, h₄]
  have hsum : W1p.gradient (uh : W1p volume Ω 2) + σ =
      (W1p.gradient (u : W1p volume Ω 2) + σ) +
        (W1p.gradient (uh : W1p volume Ω 2) - W1p.gradient (u : W1p volume Ω 2)) := by
    abel
  calc
    _ = ‖W1p.gradient (u : W1p volume Ω 2) + σ‖ ^ 2 +
        ‖W1p.gradient (uh : W1p volume Ω 2) - W1p.gradient (u : W1p volume Ω 2)‖ ^ 2 := by
      rw [norm_sub_rev (W1p.gradient (u : W1p volume Ω 2)) (W1p.gradient (uh : W1p volume Ω 2)),
        add_comm]
    _ = _ := by
      rw [hsum]
      simpa only [pow_two] using (norm_add_sq_eq_norm_sq_add_norm_sq_real horth).symm

/-- **Guaranteed bound from cellwise equilibration** (README 5.2): if `div σ = g` and `g` has
the cell means of `f`, then `‖∇(u - u_h)‖ ≤ (∑_K (‖∇u_h + σ‖_K + (h_K/π) ‖f - g‖_K)²)^{1/2}`. -/
theorem norm_gradient_sub_le_of_cellMeans (M : SimplicialMesh d) (hM : M.domainOpens = Ω)
    {f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))} {u : W1p0 volume Ω 2}
    (hu : IsWeakSolutionDirichlet (fun _ => 1) 0 0 f u) (uh : W1p0 volume Ω 2)
    (σ : Lp (E d) 2 (volume.restrict (Ω : Set (E d))))
    (g : Lp ℝ 2 (volume.restrict (Ω : Set (E d))))
    (hdiv : ∀ v : W1p0 volume Ω 2,
      ⟪σ, W1p.gradient (v : W1p volume Ω 2)⟫_ℝ = -⟪g, W1p.value (v : W1p volume Ω 2)⟫_ℝ)
    (hmean : ∀ i, ∫ x in (M.cell i).closedInterior, g x = ∫ x in (M.cell i).closedInterior, f x) :
    ‖W1p.gradient (u : W1p volume Ω 2) - W1p.gradient (uh : W1p volume Ω 2)‖ ≤
      Real.sqrt (∑ i, (Real.sqrt (∫ x in (M.cell i).closedInterior,
          ‖(W1p.gradient (uh : W1p volume Ω 2) + σ) x‖ ^ 2) +
        cellDiam (M.cell i) / Real.pi *
          Real.sqrt (∫ x in (M.cell i).closedInterior, (f x - g x) ^ 2)) ^ 2) := sorry

/-- **Local flux equilibration** (README 5.2): for the Galerkin solution of degree `k` and
`l ≥ k - 1`, there is a Raviart–Thomas flux of degree `l` whose divergence has the `P_l` moments
of `f` on every cell and which is locally efficient:
`‖σ + ∇u_h‖²_K ≤ C ∑_{K' ∋ vertex of K} (‖∇(u - u_h)‖²_{K'} + h_{K'}² osc_l(f, K'))`. -/
theorem exists_equilibratedFlux (σ : ℝ) (k l : ℕ) (hk : 1 ≤ k) (hl : k - 1 ≤ l) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (Ω : Opens (E d)) (M : SimplicialMesh d), M.domainOpens = Ω →
      (∀ i, cellDiam (M.cell i) ≤ σ * cellInball (M.cell i)) → M.HasConnectedStars →
      ∀ (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u uh : W1p0 volume Ω 2)
        (q : Fin M.numCells → MvPolynomial (Fin d) ℝ),
      IsWeakSolutionDirichlet (fun _ => 1) 0 0 f u →
      IsGalerkinSolution (fun _ => 1) f (lagrangeSubmoduleW1p0 Ω 2 M k) uh →
      (∀ i, ∀ᵐ x ∂(volume.restrict ((M.cell i).closedInterior)),
        W1p.value (uh : W1p volume Ω 2) x = evalₗ d (q i) x) →
      ∃ τ ∈ rtFamilies M l,
        (∀ i, ∀ p ∈ MvPolynomial.restrictTotalDegree (Fin d) ℝ l,
          ∫ x in (M.cell i).closedInterior, evalₗ d (polyDiv d (τ i)) x * evalₗ d p x =
            ∫ x in (M.cell i).closedInterior, f x * evalₗ d p x) ∧
        ∀ i, ∫ x in (M.cell i).closedInterior,
            fieldDot (τ i + polyGrad d (q i)) (τ i + polyGrad d (q i)) x ≤
          C * ∑ j ∈ vertexPatch M i,
            ((∫ x in (M.cell j).closedInterior,
                ‖W1p.gradient ((u : W1p volume Ω 2) - (uh : W1p volume Ω 2)) x‖ ^ 2) +
              cellDiam (M.cell j) ^ 2 * dataOsc l (M.cell j) f) := sorry

end Equilibration

/-! ## Layer 6: adaptive finite elements -/

section Adaptive

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d]

/-- `M'` refines `M`: both cover the same region and every cell of `M'` lies in a cell of `M`. -/
def IsRefinement (M M' : SimplicialMesh d) : Prop :=
  M'.domain = M.domain ∧ ∀ j, ∃ i, (M'.cell j).closedInterior ⊆ (M.cell i).closedInterior

/-- **Abstract contraction** (README 6.1): reliability `e_j ≤ R η_j`, quasi-orthogonality
`e_{j+1} + s_j ≤ e_j` and estimator reduction `η_{j+1} ≤ q η_j + C s_j` with `q < 1` give
`e_{j+1} + γ η_{j+1} ≤ ρ (e_j + γ η_j)` with `γ > 0`, `ρ ∈ (0, 1)`. -/
theorem exists_adaptive_error_contraction
    (energy estimator jump : ℕ → ℝ) {q C R : ℝ}
    (hpos : ∀ j, 0 ≤ energy j ∧ 0 ≤ estimator j ∧ 0 ≤ jump j)
    (hq : 0 ≤ q) (hq' : q < 1) (hC : 0 ≤ C) (hR : 0 ≤ R)
    (hrel : ∀ j, energy j ≤ R * estimator j)
    (horth : ∀ j, energy (j + 1) + jump j ≤ energy j)
    (hred : ∀ j, estimator (j + 1) ≤ q * estimator j + C * jump j) :
    ∃ γ > (0 : ℝ), ∃ ρ ∈ Ioo (0 : ℝ) 1,
      ∀ j, energy (j + 1) + γ * estimator (j + 1) ≤ ρ * (energy j + γ * estimator j) := by
  let γ : ℝ := 1 / (1 + C)
  let δ : ℝ := γ * (1 - q) / (2 * (R + γ))
  have hγ : 0 < γ := one_div_pos.mpr (by linarith)
  have hγC : γ * C ≤ 1 := by
    have heq : γ * (1 + C) = 1 := div_mul_cancel₀ _ (by positivity)
    nlinarith only [heq, hγ]
  have hden : 0 < R + γ := add_pos_of_nonneg_of_pos hR hγ
  have hδ : 0 < δ := div_pos (mul_pos hγ (sub_pos.mpr hq')) (mul_pos two_pos hden)
  have hδeq : δ * (R + γ) = γ * (1 - q) / 2 := by
    dsimp only [δ]
    field_simp
  have hδone : δ < 1 := by
    apply (mul_lt_mul_iff_right₀ hden).mp
    rw [mul_comm (R + γ) δ, hδeq, mul_one]
    nlinarith only [hγ, hR, mul_nonneg hγ.le hq]
  refine ⟨γ, hγ, 1 - δ, ⟨sub_pos.mpr hδone, sub_lt_self _ hδ⟩, fun j ↦ ?_⟩
  have hstep : energy (j + 1) + γ * estimator (j + 1) ≤ energy j + γ * q * estimator j := by
    have hred' := mul_le_mul_of_nonneg_left (hred j) hγ.le
    have hjump := mul_nonpos_of_nonpos_of_nonneg (sub_nonpos.mpr hγC) (hpos j).2.2
    linarith only [horth j, hred', hjump]
  have hbudget : δ * (energy j + γ * estimator j) ≤ γ * (1 - q) * estimator j :=
    calc
      _ ≤ δ * ((R + γ) * estimator j) :=
        mul_le_mul_of_nonneg_left (by linarith only [hrel j]) hδ.le
      _ = (γ * (1 - q) / 2) * estimator j := by rw [← mul_assoc, hδeq]
      _ ≤ _ := mul_le_mul_of_nonneg_right
        (by linarith only [mul_nonneg hγ.le (sub_nonneg.mpr hq'.le)]) (hpos j).2.1
  linarith only [hstep, hbudget]

/-- **Contraction of the adaptive loop** (README 6.1): with Dörfler marking of parameter `θ`
and every marked cell refined so that its subcells have at most half its volume, the
quasi-error `‖∇(u - u_n)‖² + γ ∑ η²` contracts by a factor `ρ < 1` at every step. -/
theorem exists_dorfler_contraction (σ lam Lam θ : ℝ) (k : ℕ) (hk : 1 ≤ k) (hθ : 0 < θ)
    (hθ1 : θ ≤ 1) :
    ∃ ρ ∈ Ioo (0 : ℝ) 1, ∃ γ > (0 : ℝ), ∀ (Ω : Opens (E d)) (T : ℕ → SimplicialMesh d)
      (A : E d → Matrix (Fin d) (Fin d) ℝ)
      (D : (n : ℕ) → Fin (T n).numCells → Matrix (Fin d) (Fin d) ℝ)
      (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u : W1p0 volume Ω 2)
      (uh : ℕ → W1p0 volume Ω 2) (q : (n : ℕ) → Fin (T n).numCells → MvPolynomial (Fin d) ℝ)
      (marked : (n : ℕ) → Finset (Fin (T n).numCells)),
      (∀ n, (T n).domainOpens = Ω) → IsShapeRegular T σ → (∀ n, (T n).HasConnectedStars) →
      (∀ n, IsRefinement (T n) (T (n + 1))) →
      (∀ n, ∀ i ∈ marked n, ∀ j, ((T (n + 1)).cell j).closedInterior ⊆
          ((T n).cell i).closedInterior →
        volume ((T (n + 1)).cell j).closedInterior ≤ volume ((T n).cell i).closedInterior / 2) →
      UniformlyEllipticOn (Ω : Set (E d)) A lam Lam → (∀ n i, (D n i).IsSymm) →
      (∀ n i, ∀ x ∈ cellOpen ((T n).cell i), A x = D n i) →
      IsWeakSolutionDirichlet A 0 0 f u →
      (∀ n, IsGalerkinSolution A f (lagrangeSubmoduleW1p0 Ω 2 (T n) k) (uh n)) →
      (∀ n i, ∀ᵐ x ∂(volume.restrict (((T n).cell i).closedInterior)),
        W1p.value (uh n : W1p volume Ω 2) x = evalₗ d (q n i) x) →
      (∀ n, θ ^ 2 * ∑ i, residualIndicatorSq (T n) (D n) f (q n) i ≤
        ∑ i ∈ marked n, residualIndicatorSq (T n) (D n) f (q n) i) →
      ∀ n, ‖W1p.gradient ((u : W1p volume Ω 2) - (uh (n + 1) : W1p volume Ω 2))‖ ^ 2 +
          γ * ∑ i, residualIndicatorSq (T (n + 1)) (D (n + 1)) f (q (n + 1)) i ≤
        ρ * (‖W1p.gradient ((u : W1p volume Ω 2) - (uh n : W1p volume Ω 2))‖ ^ 2 +
          γ * ∑ i, residualIndicatorSq (T n) (D n) f (q n) i) := sorry

/-- The approximation-class quasi-norm
`|y|_{A_s} = sup_N N^s inf { ‖∇(y - v)‖ : v ∈ V(M), M ∈ 𝒯, #M ≤ #M₀ + N }` in `ℝ≥0∞`, over an
admissible class `𝒯` of meshes of `Ω`. -/
def approxClassNorm (s : ℝ) (𝒯 : Set (SimplicialMesh d)) (M₀ : SimplicialMesh d) (k : ℕ)
    {Ω : Opens (E d)} (y : W1p0 volume Ω 2) : ℝ≥0∞ :=
  ⨆ N : ℕ, (N : ℝ≥0∞) ^ s * ⨅ (M ∈ 𝒯) (_ : M.numCells ≤ M₀.numCells + N),
    ⨅ v ∈ lagrangeSubmoduleW1p0 Ω 2 M k,
      ENNReal.ofReal ‖W1p.gradient ((y : W1p volume Ω 2) - (v : W1p volume Ω 2))‖

/-- **Optimal rate of the adaptive loop** (README 6.2): for the Poisson problem with data
piecewise polynomial of degree `k - 1` on the initial mesh, Dörfler marking with `θ < θ₀` and
quasi-minimal marked sets, an admissible class with the overlay property and the cumulative
closure estimate, `‖∇(u - u_n)‖ ≤ C |u|_{A_s} (#T_n - #T_0)^{-s}` for `n ≥ 1`. -/
theorem exists_adaptive_optimal_rate (σ : ℝ) (k : ℕ) (hk : 1 ≤ k) {s : ℝ} (hs : 0 < s) :
    ∃ θ₀ > (0 : ℝ), ∀ θ ∈ Ioo 0 θ₀, ∀ cMark cRef : ℕ, ∃ C : ℝ≥0∞, C ≠ ⊤ ∧
    ∀ (Ω : Opens (E d)) (𝒯 : Set (SimplicialMesh d)) (T : ℕ → SimplicialMesh d)
      (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u : W1p0 volume Ω 2)
      (uh : ℕ → W1p0 volume Ω 2) (q : (n : ℕ) → Fin (T n).numCells → MvPolynomial (Fin d) ℝ)
      (marked : (n : ℕ) → Finset (Fin (T n).numCells)),
      (∀ M ∈ 𝒯, M.domainOpens = Ω ∧ (∀ i, cellDiam (M.cell i) ≤ σ * cellInball (M.cell i)) ∧
        M.HasConnectedStars ∧ IsRefinement (T 0) M) →
      (∀ N : ℕ, {M ∈ 𝒯 | M.numCells ≤ (T 0).numCells + N}.Finite) →
      (∀ M ∈ 𝒯, ∀ M' ∈ 𝒯, ∃ M'' ∈ 𝒯, IsRefinement M M'' ∧ IsRefinement M' M'' ∧
        M''.numCells + (T 0).numCells ≤ M.numCells + M'.numCells) →
      (∀ n, T n ∈ 𝒯) → (∀ n, IsRefinement (T n) (T (n + 1))) →
      (∀ n, ∀ i ∈ marked n, ∀ j, ((T (n + 1)).cell j).closedInterior ⊆
          ((T n).cell i).closedInterior →
        volume ((T (n + 1)).cell j).closedInterior ≤ volume ((T n).cell i).closedInterior / 2) →
      (∀ n, (T (n + 1)).numCells ≤ (T 0).numCells +
        cRef * ∑ m ∈ Finset.range (n + 1), (marked m).card) →
      (∃ p : Fin (T 0).numCells → MvPolynomial (Fin d) ℝ,
        (∀ i, p i ∈ MvPolynomial.restrictTotalDegree (Fin d) ℝ (k - 1)) ∧
        ∀ i, ∀ᵐ x ∂(volume.restrict (((T 0).cell i).closedInterior)), f x = evalₗ d (p i) x) →
      IsWeakSolutionDirichlet (fun _ => 1) 0 0 f u →
      (∀ n, IsGalerkinSolution (fun _ => 1) f (lagrangeSubmoduleW1p0 Ω 2 (T n) k) (uh n)) →
      (∀ n i, ∀ᵐ x ∂(volume.restrict (((T n).cell i).closedInterior)),
        W1p.value (uh n : W1p volume Ω 2) x = evalₗ d (q n i) x) →
      (∀ n, θ ^ 2 * ∑ i, residualIndicatorSq (T n) (fun _ => 1) f (q n) i ≤
        ∑ i ∈ marked n, residualIndicatorSq (T n) (fun _ => 1) f (q n) i) →
      (∀ n (S : Finset (Fin (T n).numCells)),
        θ ^ 2 * ∑ i, residualIndicatorSq (T n) (fun _ => 1) f (q n) i ≤
          ∑ i ∈ S, residualIndicatorSq (T n) (fun _ => 1) f (q n) i →
        (marked n).card ≤ cMark * S.card) →
      ∀ n, 1 ≤ n →
        ENNReal.ofReal ‖W1p.gradient ((u : W1p volume Ω 2) - (uh n : W1p volume Ω 2))‖ ≤
          C * approxClassNorm s 𝒯 (T 0) k u *
            (((T n).numCells - (T 0).numCells : ℕ) : ℝ≥0∞) ^ (-s) := sorry

end Adaptive

/-! ## Layer 7: variational inequalities and Γ-convergence of discretizations -/

section Obstacle

/-- **Falk's estimate** (README 7.1): for solutions of the variational inequalities on `K` and on
a possibly nonconforming discrete set `K_h`, and any `v ∈ K`, `v_h ∈ K_h`,
`(α/2) ‖u - u_h‖² ≤ ‖Au - f‖ (‖u_h - v‖ + ‖u - v_h‖) + (‖A‖²/2α) ‖u - v_h‖²`. -/
theorem falk_obstacle_error_le {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
    (A : V →L[ℝ] StrongDual ℝ V) (f : StrongDual ℝ V) {α : ℝ} (hα : 0 < α)
    (hcoerce : ∀ v, α * ‖v‖ ^ 2 ≤ A v v)
    (K Kh : Set V) {u uh : V}
    (hsol : ∀ v ∈ K, f (v - u) ≤ A u (v - u))
    (hdisc : ∀ v ∈ Kh, f (v - uh) ≤ A uh (v - uh))
    {v vh : V} (hv : v ∈ K) (hvh : vh ∈ Kh) :
    α / 2 * ‖u - uh‖ ^ 2 ≤
      ‖A u - f‖ * (‖uh - v‖ + ‖u - vh‖) + ‖A‖ ^ 2 / (2 * α) * ‖u - vh‖ ^ 2 := by
  let e := u - uh
  let d := u - vh
  let r := A u - f
  have hrv : 0 ≤ r (v - u) := sub_nonneg.mpr (hsol v hv)
  have hre : r e ≤ ‖r‖ * ‖uh - v‖ := by
    have he : e = v - uh - (v - u) := by dsimp only [e]; abel
    have h := r.le_opNorm (v - uh)
    rw [Real.norm_eq_abs, norm_sub_rev v uh] at h
    rw [he, map_sub]
    exact (sub_le_self _ hrv).trans ((le_abs_self _).trans h)
  have hrd : -r d ≤ ‖r‖ * ‖d‖ :=
    (neg_le_abs _).trans (by simpa only [Real.norm_eq_abs] using r.le_opNorm d)
  have hAe : A e d ≤ ‖A‖ * ‖e‖ * ‖d‖ :=
    calc
      _ ≤ ‖(A e) d‖ := le_abs_self _
      _ ≤ ‖A e‖ * ‖d‖ := (A e).le_opNorm d
      _ ≤ _ := mul_le_mul_of_nonneg_right (A.le_opNorm e) (norm_nonneg _)
  have hdis : A uh d - f d ≤ A uh e - f e := by
    have he : e = d + (vh - uh) := by dsimp only [e, d]; abel
    rw [he, map_add, map_add]
    linarith only [hdisc vh hvh]
  have he₁ : A e e = r e - (A uh e - f e) := by
    simp only [e, r, map_sub, sub_apply]
    ring
  have he₂ : -(A uh d - f d) = A e d - r d := by
    simp only [e, r, map_sub, sub_apply]
    ring
  have henergy : A e e ≤ ‖r‖ * (‖uh - v‖ + ‖d‖) + ‖A‖ * ‖e‖ * ‖d‖ := by
    linarith only [hre, hrd, hAe, hdis, he₁, he₂]
  have hyoung : ‖A‖ * ‖e‖ * ‖d‖ ≤ α / 2 * ‖e‖ ^ 2 + ‖A‖ ^ 2 / (2 * α) * ‖d‖ ^ 2 := by
    apply (mul_le_mul_iff_of_pos_right hα).mp
    simp only [add_mul, mul_assoc]
    have hc : ‖A‖ ^ 2 / (2 * α) * α = ‖A‖ ^ 2 / 2 := by field_simp
    rw [mul_comm (‖d‖ ^ 2) α, ← mul_assoc (‖A‖ ^ 2 / (2 * α)) α, hc]
    nlinarith only [sq_nonneg (α * ‖e‖ - ‖A‖ * ‖d‖)]
  linarith only [hcoerce e, henergy, hyoung]

/-- **Falk's estimate with a pivot space** (README 7.1): if `Au - f` is represented by `g ∈ H`
through `j : V → H`, the consistency terms are measured in `H`:
`(α/2) ‖u - u_h‖² ≤ ‖g‖ (‖j(u_h - v)‖ + ‖j(u - v_h)‖) + (‖A‖²/2α) ‖u - v_h‖²`. -/
theorem falk_obstacle_error_le_of_pivot {V H : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
    [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (A : V →L[ℝ] StrongDual ℝ V) (f : StrongDual ℝ V) {α : ℝ} (hα : 0 < α)
    (hcoerce : ∀ v, α * ‖v‖ ^ 2 ≤ A v v) (J : V →L[ℝ] H)
    (K Kh : Set V) {u uh : V} {g : H} (hg : ∀ w, (A u - f) w = ⟪g, J w⟫_ℝ)
    (hsol : ∀ v ∈ K, f (v - u) ≤ A u (v - u))
    (hdisc : ∀ v ∈ Kh, f (v - uh) ≤ A uh (v - uh))
    {v vh : V} (hv : v ∈ K) (hvh : vh ∈ Kh) :
    α / 2 * ‖u - uh‖ ^ 2 ≤
      ‖g‖ * (‖J (uh - v)‖ + ‖J (u - vh)‖) + ‖A‖ ^ 2 / (2 * α) * ‖u - vh‖ ^ 2 := sorry

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d] {Ω : Opens (E d)}

/-- The continuous obstacle set `{v ∈ H¹₀(Ω) | v ≥ χ a.e.}`. -/
def obstacleSet (Ω : Opens (E d)) (χ : E d → ℝ) : Set (W1p0 volume Ω 2) :=
  {v | ∀ᵐ x ∂(volume.restrict (Ω : Set (E d))), χ x ≤ W1p.value (v : W1p volume Ω 2) x}

/-- The discrete obstacle set of piecewise linear functions with nodal values `≥ χ` at the
vertices of the mesh. -/
def discreteObstacleSet (Ω : Opens (E d)) (M : SimplicialMesh d) (χ : E d → ℝ) :
    Set (W1p0 volume Ω 2) :=
  {v | ∃ w ∈ lagrangeSpace M 1,
    ⇑(W1p.value (v : W1p volume Ω 2)) =ᵐ[volume.restrict (Ω : Set (E d))] w ∧
      ∀ i a, χ ((M.cell i).points a) ≤ w ((M.cell i).points a)}

/-- `u` solves the variational inequality of the obstacle problem for `-Δ` on the set `K`. -/
def IsObstacleSolution (K : Set (W1p0 volume Ω 2))
    (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u : W1p0 volume Ω 2) : Prop :=
  u ∈ K ∧ ∀ v ∈ K, dirichletForcing f (v - u) ≤
    energyFormH1 (fun _ => 1) 0 0 (u : W1p volume Ω 2) ((v - u : W1p0 volume Ω 2) : W1p volume Ω 2)

/-- **Obstacle problem with piecewise linears** (README 7.1): for `d ≤ 3`, `u, χ ∈ H²(Ω)`, `χ`
continuous and `≤ 0` on `∂Ω`, and the discrete constraint at the vertices,
`‖∇(u - u_h)‖² ≤ C h² ((‖f‖ + |u|₂)(|χ|₂ + |u|₂) + |u|₂²)`. -/
theorem exists_obstacle_P1_rate (hd : d ≤ 3) {σ : ℝ} (T : ℕ → SimplicialMesh d)
    (hT : ∀ n, (T n).domainOpens = Ω) (hσ : IsShapeRegular T σ)
    (hstar : ∀ n, (T n).HasConnectedStars) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (f : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (χ : E d → ℝ)
      (wχ : Wkp volume Ω 2 2) (u : W1p0 volume Ω 2) (w : Wkp volume Ω 2 2),
      ContinuousOn χ (closure (Ω : Set (E d))) →
      ⇑(Wkp.value 2 wχ) =ᵐ[volume.restrict (Ω : Set (E d))] χ →
      (∀ x ∈ frontier (Ω : Set (E d)), χ x ≤ 0) →
      Wkp.firstOrder 1 w = (u : W1p volume Ω 2) →
      IsObstacleSolution (obstacleSet Ω χ) f u → ∀ n (uh : W1p0 volume Ω 2),
      IsObstacleSolution (discreteObstacleSet Ω (T n) χ) f uh →
      ‖W1p.gradient ((u : W1p volume Ω 2) - (uh : W1p volume Ω 2))‖ ^ 2 ≤
        C * (T n).meshSize ^ 2 * ((‖f‖ + seminorm 2 2 le_rfl w) *
          (seminorm 2 2 le_rfl wχ + seminorm 2 2 le_rfl w) + seminorm 2 2 le_rfl w ^ 2) := sorry

end Obstacle

section GammaConvergence

open Classical in
/-- The discrete functional `I_h`: equal to `I` on the subspace `Y` and `⊤` off it. -/
def restrictTo {X : Type*} [AddCommGroup X] [Module ℝ X] (I : X → EReal) (Y : Submodule ℝ X) :
    X → EReal :=
  fun x => if x ∈ Y then I x else ⊤

/-- **Γ-convergence of conforming discretizations** (README 7.2): if the subspaces `X_n`
approximate every point in norm, `I` is sequentially weakly lower semicontinuous and norm
continuous, then the restrictions of `I` to `X_n` Γ-converge to `I` in the weak topology. -/
theorem tendstoGamma_restrictTo {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X]
    (I : X → EReal) (Xn : ℕ → Submodule ℝ X)
    (hdense : ∀ x, ∃ y : ℕ → X, (∀ n, y n ∈ Xn n) ∧ Tendsto y atTop (𝓝 x))
    (hlsc : ∀ ⦃x : WeakSpace ℝ X⦄ ⦃y : ℕ → WeakSpace ℝ X⦄, Tendsto y atTop (𝓝 x) →
      I ((toWeakSpace ℝ X).symm x) ≤ liminf (fun n => I ((toWeakSpace ℝ X).symm (y n))) atTop)
    (hcont : Continuous I) :
    TendstoGamma (fun n (x : WeakSpace ℝ X) => restrictTo I (Xn n) ((toWeakSpace ℝ X).symm x))
      (fun x => I ((toWeakSpace ℝ X).symm x)) := sorry

/-- **Convergence of almost minimizers** (README 7.2): if `F_n` Γ-converges to `f`,
`F_n(u_n) ≤ inf F_n + ε_n` with `ε_n → 0`, and `u_n → x₀`, then `x₀` minimizes `f` and
`F_n(u_n) → f(x₀)`. -/
theorem isMinOn_and_tendsto_of_almostMinimizer {X : Type*} [TopologicalSpace X]
    {F : ℕ → X → EReal} {f : X → EReal} (h : TendstoGamma F f) {ε : ℕ → ℝ}
    (hε : Tendsto ε atTop (𝓝 0)) {u : ℕ → X} (hu : ∀ n, F n (u n) ≤ (⨅ v, F n v) + ε n)
    {x₀ : X} (hx₀ : Tendsto u atTop (𝓝 x₀)) :
    IsMinOn f univ x₀ ∧ Tendsto (fun n => F n (u n)) atTop (𝓝 (f x₀)) := sorry

end GammaConvergence

#check @Submodule.directedProjectionGap
#check @Submodule.projectionGap
#check @Submodule.projectionGap_eq_max
#check @Submodule.directedProjectionGap_le_iff
#check @Metric.infDist
#check @IsCompactOperator
#check @Module.End.maxGenEigenspace
#check @spectrum
#check @resolventSet
#check @WeakSpace
#check @IsCoercive.continuousLinearEquivOfBilin
#check @MeasureTheory.Measure.hausdorffMeasure
#check @HilbertBasis
#check @MvPolynomial.pderiv
#check @TauCeti.TendstoGamma
#check @TauCeti.TendstoGamma.isMinOn_of_tendsto
#check @Affine.Simplex.closedInterior
#check @ContinuousLinearMap.opNorm
#check @TauCeti.TendstoGamma.limsup_iInf_le
#check @TauCeti.W1p0
#check @TauCeti.W1p.value
#check @TauCeti.W1p.gradient
#check @TauCeti.Wkp
#check @TauCeti.Wkp.firstOrder
#check @TauCeti.PDE.energyFormH1
#check @TauCeti.PDE.energyFormH1_one_zero_zero_eq_inner
#check @TauCeti.PDE.dirichletForcing
#check @TauCeti.PDE.IsWeakSolutionDirichlet
#check @TauCeti.PDE.UniformlyEllipticOn

end TauCetiRoadmap.EigenvalueApproximationAndAdaptiveFiniteElements
