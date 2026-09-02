import Mathlib

/-!
# Differential geometry — forms, de Rham cohomology, flows, and degree: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Only targets whose types the pinned Mathlib can express are stated here: the paired and
ℝ-valued wedge products (layer 0.1), the smoothness of the alternating bundle (layer
0.2), the two new flat lemmas of layers 1.3 and 6.2 — the Poincaré lemma in the
relative, boundary-chart-ready form — complete flows on compact manifolds (layer 3.3),
and the hairy ball theorem in its elementary form (layer 11.1). The manifold inverse
function theorem, formerly a target here, is consumed from Tau Ceti's
`TauCeti/Geometry/Manifold/LocalDiffeomorph.lean` (on current Tau Ceti main, ahead of
the pinned rev) with a small extension — see layer 10.1 of `README.md`. The other manifold-level layers — `mextDeriv` and its
naturality, orientations and the orientation double cover, `∫_M ω` and Stokes, the de
Rham complex, singular comparison, duality, and the degree proper — need types this
file's dependencies do not yet provide (forms on manifolds, manifold orientations,
integration of forms); their milestones are stated in `README.md` and get added here
with `sorry` as each layer makes their types expressible. `sorry` is allowed
here (human-owned roadmap territory); none of these statements registers an instance —
the `ContMDiffVectorBundle` target below is stated as a theorem and should be promoted
to an instance only once proved.

Conventions (see `README.md`): scalars `ℝ` where the geometry is real, `𝕜` where the
statement is honestly general; the wedge follows the determinant convention, pinned by
`wedge_apply_one_one` below; hypotheses are unbundled and stated at their point of use.
Elaborates against the pinned toolchain (sorry-warnings only).
-/

open Bundle Set
open scoped Manifold Bundle Topology ContDiff InnerProductSpace

namespace TauCetiRoadmap.DifferentialGeometry

/-! ## Layer 0: alternating bundles, differential forms, and the wedge -/

section Wedge

variable {E F₁ F₂ F₃ : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F₁] [NormedSpace ℝ F₁] [NormedAddCommGroup F₂] [NormedSpace ℝ F₂]
  [NormedAddCommGroup F₃] [NormedSpace ℝ F₃]

/-- **Layer 0.1.** The paired wedge product of continuous alternating maps, in the
determinant convention, combining values through an explicit continuous bilinear map —
the `wedge_product` shape of Kudryashov's `DeRhamCohomology`. At this generality the
theorems are bilinearity, the norm bound, compatibility with `compContinuousLinearMap`,
the characterization through alternatization,
and naturality in `μ`; associativity and graded commutativity are **not** theorems here
(degree zero reduces them to associativity and commutativity of `μ`) and hold only
under explicit hypotheses on the pairings — see `README.md`, layer 0.1. -/
noncomputable def wedgeWith {k l : ℕ} (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃)
    (φ : E [⋀^Fin k]→L[ℝ] F₁) (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    E [⋀^Fin (k + l)]→L[ℝ] F₃ :=
  sorry

/-- **Layer 0.1.** The ℝ-valued wedge, the multiplication specialization of `wedgeWith`:
`ω ∧ η = ((k+l)!/(k!·l!)) • Alt (ω ⊗ η)`, so that elementary covectors satisfy
`ε^I ∧ ε^J = ε^{I++J}` and top-degree wedges of covectors are determinants. This is the
graded-commutative case, and the normalization is pinned by `wedge_apply_one_one`
below. -/
noncomputable def wedge {k l : ℕ} (φ : E [⋀^Fin k]→L[ℝ] ℝ) (ψ : E [⋀^Fin l]→L[ℝ] ℝ) :
    E [⋀^Fin (k + l)]→L[ℝ] ℝ :=
  wedgeWith (ContinuousLinearMap.mul ℝ ℝ) φ ψ

/-- **Layer 0.1, normalization gate.** On two 1-forms the wedge is the 2×2 determinant.
This pins the normalization: under the Alt convention the right-hand side would carry a
factor `1/2`, and a `wedge := 0` filler fails here. -/
theorem wedge_apply_one_one (φ ψ : E [⋀^Fin 1]→L[ℝ] ℝ) (v w : E) :
    wedge φ ψ ![v, w] = φ ![v] * ψ ![w] - φ ![w] * ψ ![v] :=
  sorry

/-- **Layer 0.1.** Left linearity in the scalar; with `wedge_add_left` and the right
variants (not stated here) this makes the wedge bilinear. -/
theorem wedge_smul_left {k l : ℕ} (c : ℝ) (φ : E [⋀^Fin k]→L[ℝ] ℝ)
    (ψ : E [⋀^Fin l]→L[ℝ] ℝ) :
    wedge (c • φ) ψ = c • wedge φ ψ :=
  sorry

end Wedge

section AlternatingBundle

variable {𝕜 B ι : Type*} {n : WithTop ℕ∞}
  [NontriviallyNormedField 𝕜] [Fintype ι]
  {F₁ F₂ : Type*} [NormedAddCommGroup F₁] [NormedSpace 𝕜 F₁]
  [NormedAddCommGroup F₂] [NormedSpace 𝕜 F₂]
  {E₁ : B → Type*} [∀ x, AddCommGroup (E₁ x)] [∀ x, Module 𝕜 (E₁ x)]
  [TopologicalSpace (TotalSpace F₁ E₁)] [∀ x, TopologicalSpace (E₁ x)]
  {E₂ : B → Type*} [∀ x, AddCommGroup (E₂ x)] [∀ x, Module 𝕜 (E₂ x)]
  [TopologicalSpace (TotalSpace F₂ E₂)] [∀ x, TopologicalSpace (E₂ x)]
  {EB : Type*} [NormedAddCommGroup EB] [NormedSpace 𝕜 EB]
  {HB : Type*} [TopologicalSpace HB] {IB : ModelWithCorners 𝕜 EB HB}
  [TopologicalSpace B] [ChartedSpace HB B]
  [FiberBundle F₁ E₁] [VectorBundle 𝕜 F₁ E₁]
  [FiberBundle F₂ E₂] [VectorBundle 𝕜 F₂ E₂]
  [∀ x, IsTopologicalAddGroup (E₂ x)] [∀ x, ContinuousSMul 𝕜 (E₂ x)]

/-- **Layer 0.2.** The bundle of continuous alternating maps
between two `C^n` vector bundles over the same base is a `C^n` vector bundle — the
statement mirrors `ContMDiffVectorBundle.continuousLinearMap` in
`Mathlib/Geometry/Manifold/VectorBundle/Hom.lean`, over the topological bundle of
`Mathlib/Topology/VectorBundle/ContinuousAlternatingMap.lean`. Stated as a theorem;
promote to an instance once proved, never while it carries `sorry`. -/
theorem contMDiffVectorBundle_continuousAlternatingMap
    [ContMDiffVectorBundle n F₁ E₁ IB] [ContMDiffVectorBundle n F₂ E₂ IB] :
    ContMDiffVectorBundle n (F₁ [⋀^ι]→L[𝕜] F₂) (fun x ↦ E₁ x [⋀^ι]→L[𝕜] E₂ x) IB :=
  sorry

end AlternatingBundle

/-! ## Layer 1: the exterior derivative (flat prerequisite) -/

section ExtDerivSmooth

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [NormedAddCommGroup F] [NormedSpace ℝ F]

/-- **Layer 1.3, the new flat lemma.** The exterior derivative of a `C^∞` form is `C^∞`:
the smoothness-preservation statement the pinned Mathlib lacks, and the one the de Rham
complex depends on (the finite-regularity refinement `C^n → C^(n−1)` is part of the
milestone). Stated `Within` so it applies on `Set.range I` of a model with corners. -/
theorem contDiffOn_extDerivWithin {k : ℕ} {φ : E → E [⋀^Fin k]→L[ℝ] F} {s : Set E}
    (hs : UniqueDiffOn ℝ s) (hφ : ContDiffOn ℝ ∞ φ s) :
    ContDiffOn ℝ ∞ (extDerivWithin φ s) s :=
  sorry

/-! ## Layer 6.2: the Poincaré lemma, flat, in all degrees -/

/-- **Layer 6.2.** The Poincaré lemma in all degrees, in the *relative* form the
manifold theory needs: the domain is star-convex with unique differentiability and
dense interior, but not assumed open in the ambient space — a boundary-chart image (a
ball intersected with a half-space, relatively open in `Set.range I`) is the typical
case, and an ambient-open statement does not reach its boundary points. The ambient-open
star-shaped case is the specialization. Mathlib's pinned toolchain has the 1-form convex
case (`Mathlib/MeasureTheory/Integral/CurveIntegral/Poincare`); the C¹ refinement stated
in `README.md` layer 6.2 is part of the milestone, like the finite-regularity refinement
of `contDiffOn_extDerivWithin` above. -/
theorem exists_extDerivWithin_eq_of_starConvex [CompleteSpace F] {k : ℕ} {s : Set E}
    {a : E} (ha : a ∈ s) (hs : StarConvex ℝ a s) (hsd : UniqueDiffOn ℝ s)
    (hsc : s ⊆ closure (interior s)) {φ : E → E [⋀^Fin (k + 1)]→L[ℝ] F}
    (hφ : ContDiffOn ℝ ∞ φ s) (hclosed : ∀ x ∈ s, extDerivWithin φ s x = 0) :
    ∃ ψ : E → E [⋀^Fin k]→L[ℝ] F,
      ContDiffOn ℝ ∞ ψ s ∧ ∀ x ∈ s, extDerivWithin ψ s x = φ x :=
  sorry

end ExtDerivSmooth

/-! ## Layer 3: flows -/

section Flows

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I 1 M]

/-- **Layer 3.3.** Every `C¹` vector field on a compact boundaryless manifold is
complete: through every point there is a global integral curve. The full milestone is
the fundamental theorem of flows (the maximal flow, its open domain, joint smoothness,
and the group law — see `README.md`, layer 3.2); this corollary is stated here because
the pinned `IsMIntegralCurve` vocabulary already expresses it. -/
theorem exists_isMIntegralCurve_of_compactSpace
    [BoundarylessManifold I M] [T2Space M] [CompactSpace M]
    {v : (x : M) → TangentSpace I x}
    (hv : ContMDiff I I.tangent 1 (fun x ↦ (⟨x, v x⟩ : TangentBundle I M)))
    (x₀ : M) :
    ∃ γ : ℝ → M, γ 0 = x₀ ∧ IsMIntegralCurve γ v :=
  sorry

end Flows

/-! ## Layer 11: the hairy ball theorem -/

section HairyBall

/-- **Layer 11.1.** The hairy ball theorem, elementary form: on an even-dimensional
sphere (odd-dimensional ambient space), every continuous tangent vector field vanishes
somewhere. Tangency is `⟪w x, x⟫_ℝ = 0`, matching how
`Mathlib/Geometry/Manifold/Instances/Sphere.lean` describes the tangent space; the
bundle-section corollary and the odd-dimensional converse are stated in `README.md`
(layer 11.2). -/
theorem exists_eq_zero_of_inner_eq_zero {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] {n : ℕ} [Fact (Module.finrank ℝ E = n + 1)] (hn : Even n)
    {w : Metric.sphere (0 : E) 1 → E} (hw : Continuous w)
    (ht : ∀ x : Metric.sphere (0 : E) 1, ⟪w x, (x : E)⟫_ℝ = 0) :
    ∃ x, w x = 0 :=
  sorry

end HairyBall

end TauCetiRoadmap.DifferentialGeometry
