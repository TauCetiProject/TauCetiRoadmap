module

public import Mathlib
public import TauCeti.Analysis.Convex.Conjugate
public import TauCeti.Analysis.Convex.Subdifferential
public import TauCeti.Analysis.Convex.FenchelMoreau
public import TauCeti.Analysis.Convex.Polyhedron.Basic
public import TauCeti.Analysis.Convex.Superlinear
public import TauCeti.Analysis.Convex.Differentiability
public import TauCeti.Analysis.Convex.SubgradientImage
public import TauCeti.Analysis.Convex.Hessian
public import TauCeti.Analysis.Convex.Alexandrov
public import TauCeti.Analysis.Convex.Strong
public import TauCeti.Analysis.Convex.EffectiveDomain
public import TauCeti.Analysis.Convex.RecessionConstant
public import TauCeti.Analysis.Calculus.Rademacher
public import TauCeti.Analysis.LocallyConvex.Bipolar
public import TauCeti.Geometry.Convex.Cone.Alternative
public import TauCeti.Topology.MetricSpace.Ekeland
public import TauCeti.Analysis.Normed.Module.Dual.Reflexive.WeakCompact
public import TauCeti.MeasureTheory.OptimalTransport.CTransform.Rockafellar
public import TauCeti.MeasureTheory.OptimalTransport.Finite.Duality

/-!
# Convex analysis and duality: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
bold headlines of the README, each with every conclusion the README attaches to it, together
with the definitions their statements need; every bold headline of the README carries a Lean name
and is stated here. The README's bullets without a bold name are targets of the same standing,
stated there in prose with their locators or proof routes.

The conventions of the README are used throughout. Extended-real functions are `E → EReal`; a
function is *convex* when its real epigraph `{p : E × ℝ | f p.1 ≤ p.2}` is convex, *proper*
when it never takes the value `⊥` and is somewhere below `⊤`, and *closed* when it is lower
semicontinuous. Conjugates and subdifferentials are Tau Ceti's `TauCeti.fenchelConjugate` and
`TauCeti.subdifferential` for a bilinear pairing: `innerₗ E` on an inner product space, and the
evaluation pairing `(topDualPairing ℝ E).flip` into `StrongDual ℝ E` on a normed space.

The indicator and the normal cone are owned by VariationalMethods §2.1 and appear here as local
copies whose docstrings name that owner. The implementation namespace of the README is
`TauCeti`; the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open Set Filter Topology MeasureTheory TauCeti
open scoped Pointwise Matrix RealInnerProductSpace InnerProductSpace

namespace TauCetiRoadmap.ConvexAnalysisAndDuality

attribute [local instance] Classical.propDecidable

/-! ## Local copies of VariationalMethods §2.1 -/

section VariationalMethods

variable {E F : Type*} [AddCommGroup E] [Module ℝ E] [AddCommGroup F] [Module ℝ F]

/-- The convex indicator of `C`: `0` on `C` and `⊤` outside. Local copy of the indicator of
VariationalMethods §2.1, which owns it. -/
def convexIndicator (C : Set E) : E → EReal := fun x => if x ∈ C then 0 else ⊤

/-- The normal cone of `C` at `x` for the pairing `B`: the `y` with `B (v - x) y ≤ 0` for every
`v ∈ C`. Local copy of the normal cone of VariationalMethods §2.1, which owns it; there the
pairing is the evaluation pairing into `StrongDual ℝ E`. It is used only at points `x ∈ C`. -/
def normalCone (B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ) (C : Set E) (x : E) : Set F :=
  {y | ∀ v ∈ C, B (v - x) y ≤ 0}

end VariationalMethods

/-! ## Convex sets and cones (Layer 1) -/

section Geometry

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- 1.1: in finite dimension every frontier point of a convex set lies on a supporting
hyperplane, with no interior hypothesis. -/
theorem exists_support_of_mem_frontier {C : Set E} (hC : Convex ℝ C) {x : E}
    (hx : x ∈ frontier C) : ∃ y : E, y ≠ 0 ∧ ∀ c ∈ C, ⟪c, y⟫ ≤ ⟪x, y⟫ := by
  sorry

/-- 1.1: a point of `C` outside its relative interior has a nontrivial supporting hyperplane, one
that does not contain `C`. -/
theorem exists_nontrivial_support_of_notMem_intrinsicInterior {C : Set E} (hC : Convex ℝ C)
    {x : E} (hx : x ∈ C) (hxi : x ∉ intrinsicInterior ℝ C) :
    ∃ y : E, (∀ c ∈ C, ⟪c, y⟫ ≤ ⟪x, y⟫) ∧ ∃ c ∈ C, ⟪c, y⟫ < ⟪x, y⟫ := by
  sorry

variable {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V] [FiniteDimensional ℝ V]

/-- 1.2, the Minkowski–Carathéodory theorem: a compact convex set in finite dimension is the
convex hull of its extreme points, each point using at most `dim + 1` of them. -/
theorem convexHull_extremePoints_eq {K : Set V} (hK : IsCompact K) (hKc : Convex ℝ K) :
    convexHull ℝ (K.extremePoints ℝ) = K ∧
      ∀ x ∈ K, ∃ t : Finset V, (t : Set V) ⊆ K.extremePoints ℝ ∧
        t.card ≤ Module.finrank ℝ (vectorSpan ℝ K) + 1 ∧ x ∈ convexHull ℝ (t : Set V) := by
  sorry

/-- 1.3, the Minkowski–Weyl theorem for polyhedra, and its bounded case: a convex polyhedron is a
polytope plus a finitely generated cone, and a bounded one is a polytope. -/
theorem isConvexPolyhedron_iff_convexHull_add_hull {s : Set V} :
    (IsConvexPolyhedron s ↔ ∃ P D : Finset V,
        s = convexHull ℝ (P : Set V) + (PointedCone.hull ℝ (D : Set V) : Set V)) ∧
      (IsConvexPolyhedron s ∧ Bornology.IsBounded s ↔
        ∃ P : Finset V, s = convexHull ℝ (P : Set V)) := by
  sorry

/-- 3.6: in finite dimension the relative interior of a linear image of a convex set is the image
of its relative interior; with `L (a, b) = a - b` this gives `ri (C - D) = ri C - ri D`. -/
theorem intrinsicInterior_linearMap_image {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    [FiniteDimensional ℝ W] (L : V →ₗ[ℝ] W) {C : Set V} (hC : Convex ℝ C) :
    intrinsicInterior ℝ (L '' C) = L '' intrinsicInterior ℝ C ∧
      ∀ D : Set V, Convex ℝ D →
        intrinsicInterior ℝ (C - D) = intrinsicInterior ℝ C - intrinsicInterior ℝ D := by
  sorry

/-- 1.4, Farkas' lemma: `A x = b` has a solution `x ≥ 0` exactly when no `y` has `Aᵀ y ≥ 0` and
`⟪b, y⟫ < 0`. -/
theorem exists_nonneg_mulVec_eq_iff {m n : Type*} [Fintype m] [Fintype n] (A : Matrix m n ℝ)
    (b : m → ℝ) :
    (∃ x : n → ℝ, 0 ≤ x ∧ A *ᵥ x = b) ↔ ¬ ∃ y : m → ℝ, 0 ≤ Aᵀ *ᵥ y ∧ b ⬝ᵥ y < 0 := by
  sorry

end Geometry

/-! ## Pairing-generic definitions and theorems (Layers 2–4) -/

section Operations

variable {E F : Type*} [AddCommGroup E] [Module ℝ E] [AddCommGroup F] [Module ℝ F]

/-- The support function `σ_C(y) = ⨆ x ∈ C, B x y`, equal to `⊥` for empty `C`. -/
def supportFunction (B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ) (C : Set E) (y : F) : EReal :=
  ⨆ x ∈ C, (B x y : EReal)

/-- The one-sided polar `{y | ∀ x ∈ C, B x y ≤ 1}`. -/
def convexPolar (B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ) (C : Set E) : Set F :=
  {y | ∀ x ∈ C, B x y ≤ 1}

/-- The infimal convolution `(f □ g)(x) = ⨅ y, f y + g (x - y)`. -/
def infConv (f g : E → EReal) (x : E) : EReal :=
  ⨅ y, f y + g (x - y)

/-- The recession function `f^∞(d) = ⨆ x ∈ dom f, (f (x + d) - f x)`. For a proper convex `f`
it is the slope of `f` at infinity in direction `d`; it is `⊥` when `dom f` is empty. -/
def recessionFunction (f : E → EReal) (d : E) : EReal :=
  ⨆ x ∈ {x | f x ≠ ⊤}, (f (x + d) - f x)

/-- The closed perspective of `f`: `t f(x / t)` for `t > 0`, the recession function at `t = 0`,
and `⊤` for `t < 0`. -/
def perspective (f : E → EReal) (p : E × ℝ) : EReal :=
  if 0 < p.2 then (p.2 : EReal) * f (p.2⁻¹ • p.1)
  else if p.2 = 0 then recessionFunction f p.1 else ⊤

/-- The one-sided directional derivative `f'(x; d)`, defined as the infimum over `t > 0` of the
difference quotients. For a convex `f` finite at `x` the quotients are monotone in `t`, so this is
their limit as `t ↓ 0` (`tendsto_dirDeriv`). -/
def dirDeriv (f : E → EReal) (x d : E) : EReal :=
  ⨅ t : Ioi (0 : ℝ), (((t : ℝ)⁻¹ : ℝ) : EReal) * (f (x + (t : ℝ) • d) - f x)

/-- 2.3: the infimal convolution of convex functions that never take `⊥` is convex, and its
conjugate is the sum of the conjugates. -/
theorem convex_epigraph_infConv_and_fenchelConjugate (B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ) {f g : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hg : Convex ℝ {p : E × ℝ | g p.1 ≤ p.2})
    (hbf : ∀ x, f x ≠ ⊥) (hbg : ∀ x, g x ≠ ⊥) :
    Convex ℝ {p : E × ℝ | infConv f g p.1 ≤ p.2} ∧
      fenchelConjugate B (infConv f g) = fenchelConjugate B f + fenchelConjugate B g := by
  sorry

/-- 3.1: for a convex `f` finite at `x` the difference quotients converge to `f'(x; d)` as
`t ↓ 0`. -/
theorem tendsto_dirDeriv {f : E → EReal} (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2})
    (hbot : ∀ x, f x ≠ ⊥) {x : E} (hx : f x ≠ ⊤) (d : E) :
    Tendsto (fun t : ℝ => ((t⁻¹ : ℝ) : EReal) * (f (x + t • d) - f x)) (𝓝[>] 0)
      (𝓝 (dirDeriv f x d)) := by
  sorry

/-- 3.1: the directional derivative determines the subdifferential. -/
theorem mem_subdifferential_iff_forall_le_dirDeriv (B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ) {f : E → EReal}
    {x : E} (hx : f x ≠ ⊤) (hxb : f x ≠ ⊥) {y : F} :
    y ∈ subdifferential B f x ↔ ∀ d, (B d y : EReal) ≤ dirDeriv f x d := by
  sorry

end Operations

/-! ## Hilbert tier (Layers 2–4) -/

section Hilbert

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]

/-- 2.1: the conjugate of the indicator is the support function, and the conjugate of the
support function is the indicator of the closed convex hull. -/
theorem fenchelConjugate_convexIndicator_and_supportFunction (C : Set H) :
    fenchelConjugate (innerₗ H) (convexIndicator C) = supportFunction (innerₗ H) C ∧
      fenchelConjugate (innerₗ H) (supportFunction (innerₗ H) C) =
        convexIndicator (closure (convexHull ℝ C)) := by
  sorry

/-- 2.2, the bipolar theorem for the one-sided polar. -/
theorem convexPolar_convexPolar (C : Set H) :
    convexPolar (innerₗ H) (convexPolar (innerₗ H) C) = closure (convexHull ℝ (insert 0 C)) := by
  sorry

/-- 2.4: the recession function of a proper closed convex function is the limit of the slopes
along every ray from a point of the domain, and it is the support function of `dom f*`. -/
theorem recessionFunction_spec {f : H → EReal} (hf : Convex ℝ {p : H × ℝ | f p.1 ≤ p.2})
    (hbot : ∀ x, f x ≠ ⊥) (hdom : ∃ x, f x ≠ ⊤) (hlsc : LowerSemicontinuous f) :
    (∀ x, f x ≠ ⊤ → ∀ d, Tendsto (fun t : ℝ => ((t⁻¹ : ℝ) : EReal) * (f (x + t • d) - f x))
        atTop (𝓝 (recessionFunction f d))) ∧
      recessionFunction f =
        supportFunction (innerₗ H) {u | fenchelConjugate (innerₗ H) f u ≠ ⊤} := by
  sorry

/-- 2.5: the perspective of a proper closed convex function is convex and lower semicontinuous,
and it is the largest lower semicontinuous function below `t f(x / t)` on `t > 0`. -/
theorem perspective_spec {f : H → EReal} (hf : Convex ℝ {p : H × ℝ | f p.1 ≤ p.2})
    (hbot : ∀ x, f x ≠ ⊥) (hdom : ∃ x, f x ≠ ⊤) (hlsc : LowerSemicontinuous f) :
    Convex ℝ {q : (H × ℝ) × ℝ | perspective f q.1 ≤ q.2} ∧
      LowerSemicontinuous (perspective f) ∧
      ∀ g : H × ℝ → EReal, LowerSemicontinuous g →
        (∀ x, ∀ t : ℝ, 0 < t → g (x, t) ≤ (t : EReal) * f (t⁻¹ • x)) → g ≤ perspective f := by
  sorry

/-- 3.7: the one-sided tangent cone and the normal cone of a convex set are polar to each other.
Mathlib's two-sided `tangentConeAt ℝ` is not the tangent cone of convex analysis. -/
theorem posTangentConeAt_eq_and_normalCone_polar {C : Set H} (hC : Convex ℝ C) {x : H}
    (hx : x ∈ C) :
    posTangentConeAt C x = closure {v | ∃ t : ℝ, 0 < t ∧ ∃ c ∈ C, v = t • (c - x)} ∧
      normalCone (innerₗ H) C x = {u | ∀ v ∈ posTangentConeAt C x, ⟪v, u⟫ ≤ 0} ∧
      posTangentConeAt C x = {v | ∀ u ∈ normalCone (innerₗ H) C x, ⟪v, u⟫ ≤ 0} := by
  sorry

/-- 3.8: `u` is normal to the convex set `C` at `x ∈ C` exactly when `x` is a nearest point of
`C` to `x + γ u`, for any `γ > 0`. -/
theorem mem_normalCone_iff_isMinOn {C : Set H} (hC : Convex ℝ C) {x u : H} (hx : x ∈ C)
    {γ : ℝ} (hγ : 0 < γ) :
    u ∈ normalCone (innerₗ H) C x ↔ IsMinOn (fun c => ‖x + γ • u - c‖) C x := by
  sorry

/-- 3.8, Moreau's decomposition for a closed convex cone: every `x` is uniquely the sum of an
element of `K` and an element of its polar cone that are orthogonal, and these are the nearest
points of `K` and of the polar cone to `x`. -/
theorem exists_unique_moreau_decomposition (K : ProperCone ℝ H) (x : H) :
    ∃ a b : H, a ∈ K ∧ -b ∈ ProperCone.innerDual (K : Set H) ∧ a + b = x ∧ ⟪a, b⟫ = 0 ∧
      IsMinOn (fun c => ‖x - c‖) (K : Set H) a ∧
      IsMinOn (fun c => ‖x - c‖) {c | -c ∈ ProperCone.innerDual (K : Set H)} b ∧
      ∀ a' b' : H, a' ∈ K → -b' ∈ ProperCone.innerDual (K : Set H) → a' + b' = x →
        ⟪a', b'⟫ = 0 → a' = a ∧ b' = b := by
  sorry

/-- 4.1: a proper closed `μ`-strongly convex function has a unique minimizer, grows
quadratically away from it, and has a `μ`-strongly monotone subdifferential. -/
theorem strongConvex_minimizer_spec {f : H → EReal} (hbot : ∀ x, f x ≠ ⊥)
    (hdom : ∃ x, f x ≠ ⊤) (hlsc : LowerSemicontinuous f) {μ : ℝ} (hμ : 0 < μ)
    (hconv : Convex ℝ {p : H × ℝ | f p.1 - ((μ / 2 * ‖p.1‖ ^ 2 : ℝ) : EReal) ≤ p.2}) :
    (∃! z, ∀ x, f z ≤ f x) ∧
      (∀ z, (∀ x, f z ≤ f x) → ∀ x, f z + ((μ / 2 * ‖x - z‖ ^ 2 : ℝ) : EReal) ≤ f x) ∧
      ∀ x₁ x₂ y₁ y₂ : H, y₁ ∈ subdifferential (innerₗ H) f x₁ →
        y₂ ∈ subdifferential (innerₗ H) f x₂ → μ * ‖x₁ - x₂‖ ^ 2 ≤ ⟪x₁ - x₂, y₁ - y₂⟫ := by
  sorry

/-- 4.2: a proper closed convex function is `μ`-strongly convex exactly when its conjugate is
finite and differentiable with a `μ⁻¹`-Lipschitz gradient. -/
theorem strongConvex_iff_lipschitz_gradient_fenchelConjugate {f : H → EReal}
    (hf : Convex ℝ {p : H × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥) (hdom : ∃ x, f x ≠ ⊤)
    (hlsc : LowerSemicontinuous f) {μ : ℝ} (hμ : 0 < μ) :
    Convex ℝ {p : H × ℝ | f p.1 - ((μ / 2 * ‖p.1‖ ^ 2 : ℝ) : EReal) ≤ p.2} ↔
      (∀ y, fenchelConjugate (innerₗ H) f y ≠ ⊤) ∧
        ∃ G : H → H, (∀ y, HasGradientAt (fun z => (fenchelConjugate (innerₗ H) f z).toReal)
          (G y) y) ∧ LipschitzWith (Real.toNNReal μ⁻¹) G := by
  sorry

end Hilbert

/-! ## Normed tier (Layers 3–5) -/

section Banach

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup F]
  [NormedSpace ℝ F]

/-- 3.2, the max formula: at a point of continuity the subdifferential is nonempty and the
directional derivative is the largest value of `u d` over subgradients `u`. -/
theorem isGreatest_dirDeriv {f : E → EReal} (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2})
    (hbot : ∀ x, f x ≠ ⊥) {x : E} (hx : f x ≠ ⊤) (hc : ContinuousAt f x) (d : E) :
    IsGreatest ((fun u : StrongDual ℝ E => (u d : EReal)) ''
      subdifferential (topDualPairing ℝ E).flip f x) (dirDeriv f x d) := by
  sorry

/-- 3.5, the sum rule under a continuity qualification. -/
theorem subdifferential_add_of_continuousAt {f g : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hg : Convex ℝ {p : E × ℝ | g p.1 ≤ p.2})
    (hbf : ∀ x, f x ≠ ⊥) (hbg : ∀ x, g x ≠ ⊥) {x₀ : E} (hfx₀ : f x₀ ≠ ⊤) (hgx₀ : g x₀ ≠ ⊤)
    (hc : ContinuousAt g x₀) (x : E) :
    subdifferential (topDualPairing ℝ E).flip (f + g) x =
      subdifferential (topDualPairing ℝ E).flip f x +
        subdifferential (topDualPairing ℝ E).flip g x := by
  sorry

/-- 3.5, the chain rule with a bounded linear map under a continuity qualification. -/
theorem subdifferential_comp_of_continuousAt {g : F → EReal}
    (hg : Convex ℝ {p : F × ℝ | g p.1 ≤ p.2}) (hbg : ∀ y, g y ≠ ⊥) (A : E →L[ℝ] F) {x₀ : E}
    (hgx₀ : g (A x₀) ≠ ⊤) (hc : ContinuousAt g (A x₀)) (x : E) :
    subdifferential (topDualPairing ℝ E).flip (g ∘ A) x =
      (fun u : StrongDual ℝ F => u.comp A) ''
        subdifferential (topDualPairing ℝ F).flip g (A x) := by
  sorry

/-- 5.1, Fenchel–Rockafellar duality under a continuity qualification: no duality gap, and the
dual supremum is attained when the primal value is finite. -/
theorem fenchelRockafellar_of_continuousAt {f : E → EReal} {g : F → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hg : Convex ℝ {p : F × ℝ | g p.1 ≤ p.2})
    (hbf : ∀ x, f x ≠ ⊥) (hbg : ∀ y, g y ≠ ⊥) (A : E →L[ℝ] F) {x₀ : E} (hfx₀ : f x₀ ≠ ⊤)
    (hgx₀ : g (A x₀) ≠ ⊤) (hc : ContinuousAt g (A x₀)) :
    (⨅ x, f x + g (A x)) = (⨆ u : StrongDual ℝ F,
        -fenchelConjugate (topDualPairing ℝ E).flip f (-(u.comp A)) -
          fenchelConjugate (topDualPairing ℝ F).flip g u) ∧
      ((⨅ x, f x + g (A x)) ≠ ⊥ → ∃ u : StrongDual ℝ F, (⨅ x, f x + g (A x)) =
        -fenchelConjugate (topDualPairing ℝ E).flip f (-(u.comp A)) -
          fenchelConjugate (topDualPairing ℝ F).flip g u) := by
  sorry

/-- 5.1, the conjugate of a sum under a continuity qualification: it is the infimal convolution of
the conjugates, and the infimum is attained wherever the value is not `⊤`. -/
theorem fenchelConjugate_add_of_continuousAt {f g : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hg : Convex ℝ {p : E × ℝ | g p.1 ≤ p.2})
    (hbf : ∀ x, f x ≠ ⊥) (hbg : ∀ x, g x ≠ ⊥) {x₀ : E} (hfx₀ : f x₀ ≠ ⊤) (hgx₀ : g x₀ ≠ ⊤)
    (hc : ContinuousAt g x₀) :
    fenchelConjugate (topDualPairing ℝ E).flip (f + g) =
        infConv (fenchelConjugate (topDualPairing ℝ E).flip f)
          (fenchelConjugate (topDualPairing ℝ E).flip g) ∧
      ∀ u, fenchelConjugate (topDualPairing ℝ E).flip (f + g) u ≠ ⊤ → ∃ v,
        fenchelConjugate (topDualPairing ℝ E).flip (f + g) u =
          fenchelConjugate (topDualPairing ℝ E).flip f v +
            fenchelConjugate (topDualPairing ℝ E).flip g (u - v) := by
  sorry

/-- The `ε`-subdifferential: the `y` with `f x + B (x' - x) y - ε ≤ f x'` for every `x'`, at a
point where `f` is finite. -/
def epsSubdifferential {E' F' : Type*} [AddCommGroup E'] [Module ℝ E'] [AddCommGroup F']
    [Module ℝ F'] (B : E' →ₗ[ℝ] F' →ₗ[ℝ] ℝ) (ε : ℝ) (f : E' → EReal) (x : E') : Set F' :=
  {y | f x ≠ ⊥ ∧ f x ≠ ⊤ ∧ ∀ x', f x + ((B (x' - x) y - ε : ℝ) : EReal) ≤ f x'}

/-- 4.6, the Brøndsted–Rockafellar theorem. -/
theorem exists_mem_subdifferential_near [CompleteSpace E] {f : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥)
    (hlsc : LowerSemicontinuous f) {ε r : ℝ} (hε : 0 < ε) (hr : 0 < r) {x₀ : E}
    {y₀ : StrongDual ℝ E} (hy₀ : y₀ ∈ epsSubdifferential (topDualPairing ℝ E).flip ε f x₀) :
    ∃ x : E, ∃ y : StrongDual ℝ E, y ∈ subdifferential (topDualPairing ℝ E).flip f x ∧
      ‖x - x₀‖ ≤ r ∧ ‖y - y₀‖ ≤ ε / r := by
  sorry

/-- 4.5, Mazur's theorem: on a separable Banach space a continuous convex function on an open
convex set is Gâteaux differentiable on a dense `G_δ` subset. -/
theorem exists_isGδ_gateaux [CompleteSpace E] [TopologicalSpace.SeparableSpace E] {U : Set E}
    (hU : IsOpen U) (hUc : Convex ℝ U) {f : E → ℝ} (hf : ConvexOn ℝ U f)
    (hfc : ContinuousOn f U) :
    ∃ G ⊆ U, IsGδ G ∧ U ⊆ closure G ∧
      ∀ x ∈ G, ∃ L : StrongDual ℝ E, ∀ v, HasLineDerivAt ℝ f (L v) x v := by
  sorry

/-- 4.5: when the dual is separable, a continuous convex function on an open convex set is
Fréchet differentiable on a dense `G_δ` subset. -/
theorem exists_isGδ_differentiableAt [CompleteSpace E]
    [TopologicalSpace.SeparableSpace (StrongDual ℝ E)] {U : Set E} (hU : IsOpen U)
    (hUc : Convex ℝ U) {f : E → ℝ} (hf : ConvexOn ℝ U f) (hfc : ContinuousOn f U) :
    ∃ G ⊆ U, IsGδ G ∧ U ⊆ closure G ∧ ∀ x ∈ G, DifferentiableAt ℝ f x := by
  sorry

end Banach

/-! ## Euclidean tier (Layers 2–5) -/

section Euclidean

variable {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]

/-- 3.2: a proper convex function on a finite-dimensional space has subgradients at every point
of the relative interior of its domain. -/
theorem nonempty_subdifferential_of_mem_intrinsicInterior {f : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥) {x : E}
    (hx : x ∈ intrinsicInterior ℝ {x | f x ≠ ⊤}) :
    (subdifferential (innerₗ E) f x).Nonempty := by
  sorry

/-- 3.3: at an interior point of the domain, differentiability is a singleton subdifferential,
and the gradient is continuous on the set of interior points of differentiability. -/
theorem differentiableAt_iff_subdifferential_eq_singleton {f : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥) :
    (∀ x ∈ interior {x | f x ≠ ⊤}, (DifferentiableAt ℝ (fun y => (f y).toReal) x ↔
        ∃ g, subdifferential (innerₗ E) f x = {g})) ∧
      ContinuousOn (gradient fun y => (f y).toReal)
        {x | x ∈ interior {x | f x ≠ ⊤} ∧ DifferentiableAt ℝ (fun y => (f y).toReal) x} := by
  sorry

/-- 3.3: a differentiable function on an open convex set is convex exactly when its gradient is
monotone. -/
theorem convexOn_iff_monotone_gradient {U : Set E} (hU : IsOpen U) (hUc : Convex ℝ U)
    {f : E → ℝ} (hd : ∀ x ∈ U, DifferentiableAt ℝ f x) :
    ConvexOn ℝ U f ↔ ∀ x ∈ U, ∀ y ∈ U, 0 ≤ ⟪gradient f x - gradient f y, x - y⟫ := by
  sorry

/-- 3.4, Danskin's theorem: the subdifferential of a maximum of smooth convex functions over a
compact index set is the convex hull of the active gradients. -/
theorem subdifferential_iSup_eq_convexHull {T : Type*} [TopologicalSpace T] {K : Set T}
    (hK : IsCompact K) (hne : K.Nonempty) (φ : E → T → ℝ)
    (hconv : ∀ t ∈ K, ConvexOn ℝ univ (φ · t)) (hdiff : ∀ t ∈ K, Differentiable ℝ (φ · t))
    (hcont : ContinuousOn (fun p : E × T => φ p.1 p.2) (univ ×ˢ K))
    (hgrad : ContinuousOn (fun p : E × T => gradient (φ · p.2) p.1) (univ ×ˢ K)) (x : E) :
    subdifferential (innerₗ E) (fun y => ((⨆ t : K, φ y t : ℝ) : EReal)) x =
      convexHull ℝ ((fun t => gradient (φ · t) x) ''
        {t | t ∈ K ∧ φ x t = ⨆ s : K, φ x s}) := by
  sorry

/-- 3.6, the sum rule under the relative-interior qualification. -/
theorem subdifferential_add_of_intrinsicInterior {f g : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hg : Convex ℝ {p : E × ℝ | g p.1 ≤ p.2})
    (hbf : ∀ x, f x ≠ ⊥) (hbg : ∀ x, g x ≠ ⊥)
    (hri : (intrinsicInterior ℝ {x | f x ≠ ⊤} ∩ intrinsicInterior ℝ {x | g x ≠ ⊤}).Nonempty)
    (x : E) :
    subdifferential (innerₗ E) (f + g) x =
      subdifferential (innerₗ E) f x + subdifferential (innerₗ E) g x := by
  sorry

/-- 3.6, the linear chain rule under the relative-interior qualification. -/
theorem subdifferential_comp_of_intrinsicInterior {g : F → EReal}
    (hg : Convex ℝ {p : F × ℝ | g p.1 ≤ p.2}) (hbg : ∀ y, g y ≠ ⊥) (A : E →L[ℝ] F)
    (hri : ∃ x₀, A x₀ ∈ intrinsicInterior ℝ {y | g y ≠ ⊤}) (x : E) :
    subdifferential (innerₗ E) (g ∘ A) x =
      (ContinuousLinearMap.adjoint A) '' subdifferential (innerₗ F) g (A x) := by
  sorry

/-- 3.7: the normal cone of an intersection under the relative-interior qualification. -/
theorem normalCone_inter_of_intrinsicInterior {C D : Set E} (hC : Convex ℝ C)
    (hD : Convex ℝ D) (hri : (intrinsicInterior ℝ C ∩ intrinsicInterior ℝ D).Nonempty) {x : E}
    (hx : x ∈ C ∩ D) :
    normalCone (innerₗ E) (C ∩ D) x = normalCone (innerₗ E) C x + normalCone (innerₗ E) D x := by
  sorry

/-- 5.1, Fenchel duality under the relative-interior qualification. -/
theorem fenchelRockafellar_of_intrinsicInterior {f : E → EReal} {g : F → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hg : Convex ℝ {p : F × ℝ | g p.1 ≤ p.2})
    (hbf : ∀ x, f x ≠ ⊥) (hbg : ∀ y, g y ≠ ⊥) (A : E →L[ℝ] F)
    (hri : ∃ x₀ ∈ intrinsicInterior ℝ {x | f x ≠ ⊤}, A x₀ ∈ intrinsicInterior ℝ {y | g y ≠ ⊤}) :
    (⨅ x, f x + g (A x)) = (⨆ u : F,
        -fenchelConjugate (innerₗ E) f (-(ContinuousLinearMap.adjoint A u)) -
          fenchelConjugate (innerₗ F) g u) ∧
      ((⨅ x, f x + g (A x)) ≠ ⊥ → ∃ u : F, (⨅ x, f x + g (A x)) =
        -fenchelConjugate (innerₗ E) f (-(ContinuousLinearMap.adjoint A u)) -
          fenchelConjugate (innerₗ F) g u) := by
  sorry

/-- 5.1, the conjugate of a sum under the relative-interior qualification: it is the infimal
convolution of the conjugates, and the infimum is attained wherever the value is not `⊤`. -/
theorem fenchelConjugate_add_of_intrinsicInterior {f g : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hg : Convex ℝ {p : E × ℝ | g p.1 ≤ p.2})
    (hbf : ∀ x, f x ≠ ⊥) (hbg : ∀ x, g x ≠ ⊥)
    (hri : (intrinsicInterior ℝ {x | f x ≠ ⊤} ∩ intrinsicInterior ℝ {x | g x ≠ ⊤}).Nonempty) :
    fenchelConjugate (innerₗ E) (f + g) =
        infConv (fenchelConjugate (innerₗ E) f) (fenchelConjugate (innerₗ E) g) ∧
      ∀ u, fenchelConjugate (innerₗ E) (f + g) u ≠ ⊤ → ∃ v,
        fenchelConjugate (innerₗ E) (f + g) u =
          fenchelConjugate (innerₗ E) f v + fenchelConjugate (innerₗ E) g (u - v) := by
  sorry

/-- 2.4: a proper closed convex function on a finite-dimensional space has bounded sublevel sets
exactly when its recession function is positive in every nonzero direction. -/
theorem isBounded_sublevel_iff_recessionFunction_pos {f : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥) (hdom : ∃ x, f x ≠ ⊤)
    (hlsc : LowerSemicontinuous f) :
    (∀ r : ℝ, Bornology.IsBounded {x | f x ≤ r}) ↔ ∀ d : E, d ≠ 0 → 0 < recessionFunction f d := by
  sorry

/-- Essential smoothness: the domain has interior, `f` is differentiable there, and `f` has no
subgradient at points outside the interior of its domain. -/
def IsEssentiallySmooth (f : E → EReal) : Prop :=
  (interior {x | f x ≠ ⊤}).Nonempty ∧
    (∀ x ∈ interior {x | f x ≠ ⊤}, DifferentiableAt ℝ (fun y => (f y).toReal) x) ∧
    ∀ x ∉ interior {x | f x ≠ ⊤}, subdifferential (innerₗ E) f x = ∅

/-- Essential strict convexity: `f` is strictly convex on every convex set of points carrying a
subgradient. -/
def IsEssentiallyStrictlyConvex (f : E → EReal) : Prop :=
  ∀ s : Set E, Convex ℝ s → s ⊆ {x | (subdifferential (innerₗ E) f x).Nonempty} →
    StrictConvexOn ℝ s (fun x => (f x).toReal)

/-- A function of Legendre type is essentially smooth and essentially strictly convex. -/
def IsLegendre (f : E → EReal) : Prop :=
  IsEssentiallySmooth f ∧ IsEssentiallyStrictlyConvex f

/-- 4.3, steepness: a proper closed convex function is essentially smooth exactly when the
interior of its domain is nonempty, it is differentiable there, and the norm of its gradient tends
to infinity at every frontier point of that interior. -/
theorem isEssentiallySmooth_iff_tendsto_norm_gradient {f : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥) (hdom : ∃ x, f x ≠ ⊤)
    (hlsc : LowerSemicontinuous f) :
    IsEssentiallySmooth f ↔
      (interior {x | f x ≠ ⊤}).Nonempty ∧
        (∀ x ∈ interior {x | f x ≠ ⊤}, DifferentiableAt ℝ (fun y => (f y).toReal) x) ∧
        ∀ x ∈ frontier (interior {x | f x ≠ ⊤}),
          Tendsto (fun y => ‖gradient (fun z => (f z).toReal) y‖)
            (𝓝[interior {x | f x ≠ ⊤}] x) atTop := by
  sorry

/-- 4.3: a proper closed convex function is essentially smooth exactly when its conjugate is
essentially strictly convex. -/
theorem isEssentiallySmooth_iff_isEssentiallyStrictlyConvex_fenchelConjugate {f : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥) (hdom : ∃ x, f x ≠ ⊤)
    (hlsc : LowerSemicontinuous f) :
    IsEssentiallySmooth f ↔ IsEssentiallyStrictlyConvex (fenchelConjugate (innerₗ E) f) := by
  sorry

/-- 4.3: the conjugate of a function of Legendre type is of Legendre type, and the gradient is a
bijection between the interiors of the domains, inverse to the gradient of the conjugate. -/
theorem IsLegendre.fenchelConjugate_and_bijOn_gradient {f : E → EReal}
    (hf : Convex ℝ {p : E × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥) (hdom : ∃ x, f x ≠ ⊤)
    (hlsc : LowerSemicontinuous f) (hL : IsLegendre f) :
    IsLegendre (fenchelConjugate (innerₗ E) f) ∧
      BijOn (gradient fun y => (f y).toReal) (interior {x | f x ≠ ⊤})
        (interior {y | fenchelConjugate (innerₗ E) f y ≠ ⊤}) ∧
      ∀ x ∈ interior {x | f x ≠ ⊤},
        gradient (fun z => (fenchelConjugate (innerₗ E) f z).toReal)
          (gradient (fun y => (f y).toReal) x) = x := by
  sorry

/-- 5.2, the Karush–Kuhn–Tucker theorem under Slater's condition: a minimizer of a convex
program with a strictly feasible point carries Lagrange multipliers. -/
theorem exists_kkt_of_slater {ι : Type*} [Fintype ι] {f : E → ℝ} {g : ι → E → ℝ}
    (hf : ConvexOn ℝ univ f) (hg : ∀ i, ConvexOn ℝ univ (g i)) (A : E →L[ℝ] F) (b : F)
    (hslater : ∃ x, (∀ i, g i x < 0) ∧ A x = b) {xs : E}
    (hmin : IsMinOn f {x | (∀ i, g i x ≤ 0) ∧ A x = b} xs)
    (hxs : xs ∈ {x | (∀ i, g i x ≤ 0) ∧ A x = b}) :
    ∃ l : ι → ℝ, ∃ y : F, (∀ i, 0 ≤ l i) ∧ (∀ i, l i * g i xs = 0) ∧
      ∃ u ∈ subdifferential (innerₗ E) (fun x => (f x : EReal)) xs, ∃ v : ι → E,
        (∀ i, v i ∈ subdifferential (innerₗ E) (fun x => (g i x : EReal)) xs) ∧
        u + ∑ i, l i • v i + ContinuousLinearMap.adjoint A y = 0 := by
  sorry

/-- 5.2: the Karush–Kuhn–Tucker conditions are sufficient, with no constraint qualification and
no convexity hypothesis; the subgradient inequalities carry the argument. -/
theorem isMinOn_of_kkt {ι : Type*} [Fintype ι] {f : E → ℝ} {g : ι → E → ℝ}
    (A : E →L[ℝ] F) (b : F) {xs : E}
    (hxs : xs ∈ {x | (∀ i, g i x ≤ 0) ∧ A x = b}) (l : ι → ℝ) (y : F) (hl : ∀ i, 0 ≤ l i)
    (hcs : ∀ i, l i * g i xs = 0) (u : E)
    (hu : u ∈ subdifferential (innerₗ E) (fun x => (f x : EReal)) xs) (v : ι → E)
    (hv : ∀ i, v i ∈ subdifferential (innerₗ E) (fun x => (g i x : EReal)) xs)
    (hsum : u + ∑ i, l i • v i + ContinuousLinearMap.adjoint A y = 0) :
    IsMinOn f {x | (∀ i, g i x ≤ 0) ∧ A x = b} xs := by
  sorry

/-- 5.4, conic duality: for a closed convex cone `K`, a strictly feasible primal with finite value
has no duality gap and a dual solution. -/
theorem conic_duality (K : ProperCone ℝ E) (A : E →L[ℝ] F) (b : F) (c : E)
    (hslater : ∃ x ∈ interior (K : Set E), A x = b)
    (hfin : (⨅ x ∈ {x | A x = b ∧ x ∈ K}, (⟪c, x⟫ : EReal)) ≠ ⊥) :
    (⨅ x ∈ {x | A x = b ∧ x ∈ K}, (⟪c, x⟫ : EReal)) =
        (⨆ y ∈ {y | c - ContinuousLinearMap.adjoint A y ∈ ProperCone.innerDual (K : Set E)},
          (⟪b, y⟫ : EReal)) ∧
      ∃ y, c - ContinuousLinearMap.adjoint A y ∈ ProperCone.innerDual (K : Set E) ∧
        (⟪b, y⟫ : EReal) = ⨅ x ∈ {x | A x = b ∧ x ∈ K}, (⟪c, x⟫ : EReal) := by
  sorry

end Euclidean

/-! ## Monotone structure, Hilbert tier (Layer 4) -/

section Monotone

/-- A set `Γ ⊆ E × F` is monotone for the pairing `B` when `0 ≤ B (x₁ - x₂) (y₁ - y₂)` for any
two of its points. -/
def IsMonotoneSet {E F : Type*} [AddCommGroup E] [Module ℝ E] [AddCommGroup F] [Module ℝ F]
    (B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ) (Γ : Set (E × F)) : Prop :=
  ∀ p ∈ Γ, ∀ q ∈ Γ, 0 ≤ B (p.1 - q.1) (p.2 - q.2)

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]

/-- 4.4, Rockafellar's theorem: the subdifferential of a proper closed convex function is
maximal monotone. -/
theorem maximal_isMonotoneSet_subdifferential {f : H → EReal}
    (hf : Convex ℝ {p : H × ℝ | f p.1 ≤ p.2}) (hbot : ∀ x, f x ≠ ⊥) (hdom : ∃ x, f x ≠ ⊤)
    (hlsc : LowerSemicontinuous f) :
    Maximal (IsMonotoneSet (innerₗ H)) {p : H × H | p.2 ∈ subdifferential (innerₗ H) f p.1} := by
  sorry

/-- 4.4, Rockafellar's cyclic monotonicity theorem: the maximal cyclically monotone sets are
exactly the graphs of subdifferentials of proper closed convex functions. -/
theorem maximal_isCyclicallyMonotone_iff (Γ : Set (H × H)) :
    Maximal (IsCyclicallyMonotone (pairingCost (innerₗ H))) Γ ↔
      ∃ f : H → EReal, Convex ℝ {p : H × ℝ | f p.1 ≤ p.2} ∧ (∀ x, f x ≠ ⊥) ∧
        (∃ x, f x ≠ ⊤) ∧ LowerSemicontinuous f ∧
        Γ = {p : H × H | p.2 ∈ subdifferential (innerₗ H) f p.1} := by
  sorry

/-- 4.4: a proper closed convex function is determined by its subdifferential up to an additive
constant. -/
theorem exists_eq_add_const_of_subdifferential_eq {f g : H → EReal}
    (hf : Convex ℝ {p : H × ℝ | f p.1 ≤ p.2}) (hbf : ∀ x, f x ≠ ⊥) (hdf : ∃ x, f x ≠ ⊤)
    (hlf : LowerSemicontinuous f) (hg : Convex ℝ {p : H × ℝ | g p.1 ≤ p.2})
    (hbg : ∀ x, g x ≠ ⊥) (hdg : ∃ x, g x ≠ ⊤) (hlg : LowerSemicontinuous g)
    (h : ∀ x, subdifferential (innerₗ H) f x = subdifferential (innerₗ H) g x) :
    ∃ c : ℝ, ∀ x, f x = g x + c := by
  sorry

end Monotone

/-! ## Linear programming (Layer 5) -/

section LinearProgramming

variable {m n : Type*} [Fintype m] [Fintype n]

/-- 5.3, linear-programming duality: if `min ⟪c, x⟫` over `A x = b, x ≥ 0` is feasible and
bounded below, the primal and the dual `max ⟪b, y⟫` over `Aᵀ y ≤ c` have solutions with equal
values; and a feasible pair has equal values exactly when complementary slackness holds. -/
theorem linearProgramming_duality (A : Matrix m n ℝ) (b : m → ℝ) (c : n → ℝ)
    (hfeas : ∃ x : n → ℝ, 0 ≤ x ∧ A *ᵥ x = b)
    (hbdd : ∃ M : ℝ, ∀ x : n → ℝ, 0 ≤ x → A *ᵥ x = b → M ≤ c ⬝ᵥ x) :
    (∃ x : n → ℝ, ∃ y : m → ℝ, 0 ≤ x ∧ A *ᵥ x = b ∧ Aᵀ *ᵥ y ≤ c ∧ c ⬝ᵥ x = b ⬝ᵥ y ∧
      IsMinOn (fun x' => c ⬝ᵥ x') {x' | 0 ≤ x' ∧ A *ᵥ x' = b} x ∧
      IsMaxOn (fun y' => b ⬝ᵥ y') {y' | Aᵀ *ᵥ y' ≤ c} y) ∧
      ∀ x : n → ℝ, ∀ y : m → ℝ, 0 ≤ x → A *ᵥ x = b → Aᵀ *ᵥ y ≤ c →
        (c ⬝ᵥ x = b ⬝ᵥ y ↔ ∀ j, x j * (c - Aᵀ *ᵥ y) j = 0) := by
  sorry

end LinearProgramming

/-! ## Integral representation (Layer 6) -/

section Choquet

variable {V : Type*} [AddCommGroup V] [Module ℝ V] [TopologicalSpace V]
  [IsTopologicalAddGroup V] [ContinuousSMul ℝ V] [LocallyConvexSpace ℝ V] [T2Space V]

/-- The cone over `K` in `V × ℝ`: the points `(t • x, t)` with `t ≥ 0` and `x ∈ K`. -/
def coneOver (K : Set V) : Set (V × ℝ) :=
  {p | ∃ t : ℝ, 0 ≤ t ∧ ∃ x ∈ K, p = (t • x, t)}

/-- `K` is a Choquet simplex when the cone over it is a lattice in its own order: any two of its
elements have a least upper bound in the cone, for the order `a ≤ c ↔ c - a ∈ coneOver K`. For
convex `K` this says that `coneOver K - coneOver K` is a vector lattice (Simon, p. 174). -/
def IsChoquetSimplex (K : Set V) : Prop :=
  ∀ a ∈ coneOver K, ∀ b ∈ coneOver K, ∃ c ∈ coneOver K, c - a ∈ coneOver K ∧
    c - b ∈ coneOver K ∧
    ∀ d ∈ coneOver K, d - a ∈ coneOver K → d - b ∈ coneOver K → d - c ∈ coneOver K

/-- 6.1, Choquet's theorem: in a compact metrizable convex set the extreme points form a Borel
set, and every point is the barycenter of a probability measure carried by them. -/
theorem exists_probabilityMeasure_barycenter_extremePoints {K : Set V} (hK : IsCompact K)
    (hKc : Convex ℝ K) [TopologicalSpace.MetrizableSpace K] [MeasurableSpace K] [BorelSpace K]
    (x : K) :
    MeasurableSet {y : K | y.1 ∈ K.extremePoints ℝ} ∧
      ∃ μ : Measure K, IsProbabilityMeasure μ ∧ μ {y : K | y.1 ∉ K.extremePoints ℝ} = 0 ∧
        ∀ φ : StrongDual ℝ V, ∫ y, φ y.1 ∂μ = φ x.1 := by
  sorry

/-- 6.2, the Choquet–Meyer uniqueness theorem in the metrizable case: the representing measure
carried by the extreme points is unique for every point exactly when `K` is a simplex. -/
theorem isChoquetSimplex_iff_existsUnique {K : Set V} (hK : IsCompact K) (hKc : Convex ℝ K)
    [TopologicalSpace.MetrizableSpace K] [MeasurableSpace K] [BorelSpace K] :
    IsChoquetSimplex K ↔ ∀ x : K, ∃! μ : Measure K, IsProbabilityMeasure μ ∧
      μ {y : K | y.1 ∉ K.extremePoints ℝ} = 0 ∧ ∀ φ : StrongDual ℝ V, ∫ y, φ y.1 ∂μ = φ x.1 := by
  sorry

end Choquet

end TauCetiRoadmap.ConvexAnalysisAndDuality

/-! ## Suppliers named in the README -/

#check @TauCeti.fenchelConjugate
#check @TauCeti.subdifferential
#check @TauCeti.sub_le_fenchelConjugate
#check @TauCeti.le_add_fenchelConjugate
#check @TauCeti.mem_subdifferential_iff_add_fenchelConjugate_eq
#check @TauCeti.fenchelConjugate_flip_fenchelConjugate_eq
#check @TauCeti.fenchelConjugate_flip_fenchelConjugate_eq_iff
#check @TauCeti.fenchelConjugate_innerₗ_fenchelConjugate_innerₗ
#check @TauCeti.exists_affine_le_of_lt
#check @TauCeti.mem_subdifferential_fenchelConjugate_iff
#check @TauCeti.mem_subdifferential_coe_iff_isMinOn_sub
#check @TauCeti.apply_le_apply_of_mem_subdifferential
#check @TauCeti.nonempty_subdifferential_of_mem_interior
#check @TauCeti.hasFDerivAt_apply_eq_of_mem_subdifferential
#check @TauCeti.mem_subdifferential_of_hasFDerivAt
#check @TauCeti.hasGradientAt_toReal_of_continuousAt_subgradient
#check @TauCeti.mem_subdifferential_add_affine_iff
#check @TauCeti.convexOn_toReal
#check @TauCeti.IsConvexPolyhedron
#check @TauCeti.IsCyclicallyMonotone
#check @TauCeti.pairingCost
#check @TauCeti.isCyclicallyMonotone_pairingCost_iff_exists_fenchelConjugate
#check @TauCeti.contDiff_fenchelConjugate_toReal_of_superlinear
#check @TauCeti.mem_subdifferential_iff_eq_gradient_fenchelConjugate_of_superlinear
#check @TauCeti.convexOn_of_hasFDerivAt_gradient
#check @TauCeti.isCompact_toWeakSpace_of_isClosed_of_convex_of_isBounded
#check @TauCeti.recessionConstant
#check @TauCeti.exists_forall_dual_pos_iff
#check @StrongConvexOn
#check @StrongConvexOn.add_add_le_of_hasFDerivWithinAt
#check @Submodule.FG
#check @geometric_hahn_banach_compact_closed
#check @ConvexOn.isPositive_of_hasFDerivAt_gradient
#check @ConvexOn.ae_differentiableAt_of_mem_interior
#check @ConvexOn.ae_existsUnique_isPositive_isLittleO
#check @StrongDual.bipolar_eq_closedAbsConvexHull
#check @ConvexOn.continuousOn_tfae
#check @ConvexOn.locallyLipschitzOn_interior
#check @ConvexOn.locallyLipschitzOn_intrinsicInterior
#check @ConvexOn.sSup_affine_eq
#check @geometric_hahn_banach_point_closed
#check @geometric_hahn_banach_of_nonempty_interior_point
#check @Convex.helly_theorem'
#check @Convex.radon_partition
#check @convexHull_eq_union
#check @AffineIndependent.card_le_finrank_succ
#check @closure_convexHull_extremePoints
#check @IsCompact.extremePoints_nonempty
#check @Sion.minimax
#check @ProperCone.innerDual
#check @ProperCone.hyperplane_separation'
#check @ProperCone.relative_hyperplane_separation
#check @PointedCone.DualFG
#check @PointedCone.dual
#check @PointedCone.hull
#check @strongConvexOn_iff_convex
#check @intrinsicInterior
#check @exists_norm_eq_iInf_of_complete_convex
#check @norm_eq_iInf_iff_real_inner_le_zero
#check @tangentConeAt
#check @posTangentConeAt
#check @tangentConeAt_eq_univ
#check @intrinsicInterior_prod_eq
#check @LowerSemicontinuous.exists_add_mul_dist_le_and_lt_add_mul_dist
#check @topDualPairing
#check @HasLineDerivAt
#check @Set.extremePoints
#check @ContinuousLinearMap.adjoint
#check @Convex.toWeakSpace_closure
#check @IsMinOn.of_isLocalMinOn_of_convexOn
#check @NormedSpace.isCompact_closure_of_isBounded
#check @ProperCone.innerDual_innerDual
#check @RealRMK.rieszMeasure
#check @RealRMK.integral_rieszMeasure
#check @TauCeti.exists_cost_eq_finiteDualValue
