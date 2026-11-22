import Mathlib
import TauCeti.Analysis.Calculus.ParametricFDeriv

/-!
# Hypergradients and bilevel optimization: target signatures

This file is not the roadmap: the roadmap is `README.md`. It states the headline theorems of
the roadmap against the pinned Mathlib and Tau Ceti APIs, each with `sorry`, together with the
few definitions they need, all with real bodies. Every headline theorem of the README is statable at
the pins and is stated here.

A bilevel problem has a hyperparameter `l : Λ` and weights `w : W` in real normed spaces. The
inner problem is either a fixed-point equation `w = Φ (l, w)` for a family of contractions, or
the minimization of `g (l, ·)`; the outer objective is `E : Λ × W → ℝ`, and the hypergradient is
the derivative at `l` of `F l = E (l, w l)`, where `w l` is the inner solution. Derivatives are
Fréchet derivatives (`fderiv`), so a hypergradient is a continuous linear functional on `Λ`.
The derivative of a map on `Λ × W` in the weight variable is Tau Ceti's `spatialFDeriv`, and its
derivative in the hyperparameter is `parameterFDeriv` below. Inverses of continuous linear maps
are Mathlib's `ContinuousLinearMap.inverse`, whose value at a non-invertible map is `0`; every
statement that uses one also asserts or assumes the invertibility.

`LipschitzSmoothWith` and `gradientStep` are copied verbatim from FirstOrderOptimization 1.1
and Layer 2.
-/

noncomputable section

open Set Filter Topology
open scoped NNReal Gradient

namespace TauCetiRoadmap.HypergradientsAndBilevelOptimization

section FirstOrderOptimization

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]

/-- 3.1 (copied verbatim from FirstOrderOptimization 1.1): `f` is `K`-smooth, that is,
differentiable with first-order Taylor remainder at most `K / 2 * dist x y ^ 2`. -/
structure LipschitzSmoothWith (𝕜 : Type*) [NontriviallyNormedField 𝕜] {F G : Type*}
    [NormedAddCommGroup F] [NormedSpace 𝕜 F] [NormedAddCommGroup G] [NormedSpace 𝕜 G]
    (K : ℝ≥0) (f : F → G) : Prop where
  differentiable : Differentiable 𝕜 f
  fderiv_norm_le : ∀ x y, ‖f y - f x - fderiv 𝕜 f x (y - x)‖ ≤ K / 2 * dist x y ^ 2

/-- 3.1 (copied verbatim from FirstOrderOptimization, Layer 2): one gradient step with step
size `η`. -/
def gradientStep (f : E → ℝ) (η : ℝ) (x : E) : E := x - η • ∇ f x

end FirstOrderOptimization

variable {Λ : Type*} [NormedAddCommGroup Λ] [NormedSpace ℝ Λ]

/-! ## Layer 1: exact hypergradients -/

/-- 1.1 The derivative of a map on `Λ × W` in the hyperparameter at `(l, w)`: the restriction
of its Fréchet derivative to the first factor (the counterpart of Tau Ceti's `spatialFDeriv`,
which restricts to the second factor). It is `0` where the map is not differentiable. -/
def parameterFDeriv {W F : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    [NormedAddCommGroup F] [NormedSpace ℝ F] (Φ : Λ × W → F) (w : W) (l : Λ) : Λ →L[ℝ] F :=
  (fderiv ℝ Φ (l, w)).comp (ContinuousLinearMap.inl ℝ Λ W)

/-- 1.1 The solution map of a family of contractions: `l ↦` the unique fixed point of
`Φ (l, ·)`. -/
def fixedPointMap {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W] [CompleteSpace W]
    (Φ : Λ × W → W) {q : ℝ≥0} (hc : ∀ l, ContractingWith q fun w ↦ Φ (l, w)) (l : Λ) : W :=
  ContractingWith.fixedPoint (fun w ↦ Φ (l, w)) (hc l)

/-- 1.1 **Differentiation of a parametrized fixed point** (Grazzi et al. 2020, Lemma 2.2 and
Theorem A.1). If every `Φ (l, ·)` is a `q`-contraction and `Φ` is `C¹` at `(l, w l)`, then
`1 - ∂_w Φ` is invertible there, the fixed point `w` has derivative
`(1 - ∂_w Φ)⁻¹ ∘ ∂_l Φ` at `l`, and `l ↦ E (l, w l)` has derivative
`∂_l E + ∂_w E ∘ (1 - ∂_w Φ)⁻¹ ∘ ∂_l Φ`. -/
theorem hasFDerivAt_fixedPointMap {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    [CompleteSpace Λ] [CompleteSpace W] {Φ : Λ × W → W} {E : Λ × W → ℝ} {q : ℝ≥0}
    (hc : ∀ l, ContractingWith q fun w ↦ Φ (l, w)) {l : Λ}
    (hΦ : ContDiffAt ℝ 1 Φ (l, fixedPointMap Φ hc l))
    (hE : DifferentiableAt ℝ E (l, fixedPointMap Φ hc l)) :
    let w := fixedPointMap Φ hc l
    let A := spatialFDeriv (𝕜 := ℝ) Φ w l
    (1 - A).IsInvertible ∧ ‖(1 - A).inverse‖ ≤ (1 - (q : ℝ))⁻¹ ∧
      HasFDerivAt (fixedPointMap Φ hc) ((1 - A).inverse ∘L parameterFDeriv Φ w l) l ∧
      HasFDerivAt (fun x ↦ E (x, fixedPointMap Φ hc x))
        (parameterFDeriv E w l +
          spatialFDeriv (𝕜 := ℝ) E w l ∘L ((1 - A).inverse ∘L parameterFDeriv Φ w l)) l :=
  sorry

/-- 1.2 The inner stationarity map of `g`: `(l, w) ↦` the derivative of `g` in the weights at
`(l, w)`. Its zeros include the minimizers of the inner problems `g (l, ·)`. -/
def stationarityMap {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W] (g : Λ × W → ℝ)
    (p : Λ × W) : StrongDual ℝ W :=
  spatialFDeriv (𝕜 := ℝ) g p.2 p.1

/-- 1.2 The implicit hypergradient evaluated at `(l, w)`:
`∂_l E - ∂_w E ∘ (∂_w ∂_w g)⁻¹ ∘ ∂_l ∂_w g`, all at `(l, w)`. At an inner minimizer it is the
hypergradient (1.2); at any other point it is the approximate hypergradient of 2.2. -/
def implicitHypergradient {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    (g E : Λ × W → ℝ) (w : W) (l : Λ) : StrongDual ℝ Λ :=
  parameterFDeriv E w l - spatialFDeriv (𝕜 := ℝ) E w l ∘L
    ((spatialFDeriv (𝕜 := ℝ) (stationarityMap g) w l).inverse ∘L
      parameterFDeriv (stationarityMap g) w l)

/-- 1.2 **Strongly convex inner problem** (Ghadimi–Wang 2018, Lemma 2.1; Grazzi et al. 2020,
Corollary A.1). If every `g (l, ·)` is `μ`-strongly convex on a Hilbert space, `w l` minimizes
`g (l, ·)` for every `l`, and `g` is `C²` at `(l, w l)`, then the weight Hessian is invertible
with inverse of norm at most `μ⁻¹`, `w` has derivative `-(∂_w ∂_w g)⁻¹ ∘ ∂_l ∂_w g` at `l`, and
`l ↦ E (l, w l)` has derivative `implicitHypergradient g E (w l) l`. -/
theorem hasFDerivAt_argmin_of_strongConvexOn {W : Type*} [NormedAddCommGroup W]
    [InnerProductSpace ℝ W] [CompleteSpace Λ] [CompleteSpace W] {g E : Λ × W → ℝ} {μ : ℝ}
    (hμ : 0 < μ) (hsc : ∀ l, StrongConvexOn univ μ fun v ↦ g (l, v)) {w : Λ → W}
    (hw : ∀ l, IsMinOn (fun v ↦ g (l, v)) univ (w l)) {l : Λ}
    (hg : ContDiffAt ℝ 2 g (l, w l)) (hE : DifferentiableAt ℝ E (l, w l)) :
    let H := spatialFDeriv (𝕜 := ℝ) (stationarityMap g) (w l) l
    H.IsInvertible ∧ ‖H.inverse‖ ≤ μ⁻¹ ∧
      HasFDerivAt w (-(H.inverse ∘L parameterFDeriv (stationarityMap g) (w l) l)) l ∧
      HasFDerivAt (fun x ↦ E (x, w x)) (implicitHypergradient g E (w l) l) l :=
  sorry

/-- 1.3 **The local branch of a nondegenerate inner minimizer** (Lorraine et al. 2019,
Appendix C, for the implicit function; the rest is proved here). Let `W` be finite-dimensional,
`g` be `C²` at `(l₀, w₀)`, `w₀` be a critical point of `g (l₀, ·)` with positive definite
Hessian. Then there is a branch `ψ` with `ψ l₀ = w₀`, differentiable at `l₀` with the
derivative of 1.2, along which `E` has the hypergradient of 1.2; near `l₀` every `ψ l` is a
critical point of `g (l, ·)` with quadratic growth, and near `(l₀, w₀)` the critical points of
the inner problems are exactly the points of the branch. -/
theorem exists_branch_of_hessian_pos {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    [FiniteDimensional ℝ W] [CompleteSpace Λ] {g E : Λ × W → ℝ} {l₀ : Λ} {w₀ : W}
    (hg : ContDiffAt ℝ 2 g (l₀, w₀)) (hcrit : fderiv ℝ (fun v ↦ g (l₀, v)) w₀ = 0)
    (hpos : ∀ v, v ≠ 0 → 0 < fderiv ℝ (fderiv ℝ fun v ↦ g (l₀, v)) w₀ v v)
    (hE : DifferentiableAt ℝ E (l₀, w₀)) :
    ∃ ψ : Λ → W, ψ l₀ = w₀ ∧
      HasFDerivAt ψ (-((spatialFDeriv (𝕜 := ℝ) (stationarityMap g) w₀ l₀).inverse ∘L
        parameterFDeriv (stationarityMap g) w₀ l₀)) l₀ ∧
      HasFDerivAt (fun x ↦ E (x, ψ x)) (implicitHypergradient g E w₀ l₀) l₀ ∧
      (∀ᶠ l in 𝓝 l₀, fderiv ℝ (fun v ↦ g (l, v)) (ψ l) = 0 ∧
        ∃ σ > 0, ∀ᶠ v in 𝓝 (ψ l), g (l, ψ l) + σ * ‖v - ψ l‖ ^ 2 ≤ g (l, v)) ∧
      ∀ᶠ p in 𝓝 (l₀, w₀), fderiv ℝ (fun v ↦ g (p.1, v)) p.2 = 0 ↔ ψ p.1 = p.2 :=
  sorry

/-! ## Layer 2: regularity with explicit constants -/

/-- 2.1 **The inner solution is Lipschitz** (Ghadimi–Wang 2018, Lemma 2.2(b)). If every
`g (l, ·)` is `μ`-strongly convex with derivative `G l v` at every `v`, and
`‖G l v - G l' v‖ ≤ C * ‖l - l'‖`, then the minimizers satisfy
`‖w l - w l'‖ ≤ C / μ * ‖l - l'‖`. -/
theorem norm_argmin_sub_le {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    {g : Λ × W → ℝ} {G : Λ → W → StrongDual ℝ W} {μ C : ℝ} (hμ : 0 < μ)
    (hsc : ∀ l, StrongConvexOn univ μ fun v ↦ g (l, v))
    (hG : ∀ l v, HasFDerivAt (fun v ↦ g (l, v)) (G l v) v)
    (hC : ∀ l l' v, ‖G l v - G l' v‖ ≤ C * ‖l - l'‖) {w : Λ → W}
    (hw : ∀ l, IsMinOn (fun v ↦ g (l, v)) univ (w l)) (l l' : Λ) :
    ‖w l - w l'‖ ≤ C / μ * ‖l - l'‖ :=
  sorry

/-- 2.2 **The hypergradient at an approximate inner solution** (Ghadimi–Wang 2018,
Lemma 2.2(a)). Under 1.2 with `g` `C²` and `E` differentiable everywhere, if in the weights
`∂_l ∂_w g` is bounded by `Cgxy` and `∂_l E`, `∂_w E`, `∂_l ∂_w g`, `∂_w ∂_w g` are Lipschitz
with constants `Lfx`, `Lfy`, `Lgxy`, `Lgyy` at the hyperparameter `l`, and
`‖∂_w E (l, w l)‖ ≤ Cfy`, then for every `v`
`‖implicitHypergradient g E v l - hypergradient‖ ≤ C ‖v - w l‖`, with
`C = Lfx + Lfy Cgxy / μ + Cfy (Lgxy / μ + Lgyy Cgxy / μ²)`. -/
theorem norm_implicitHypergradient_sub_le {W : Type*} [NormedAddCommGroup W]
    [InnerProductSpace ℝ W] [CompleteSpace Λ] [CompleteSpace W] {g E : Λ × W → ℝ} {μ : ℝ}
    (hg : ContDiff ℝ 2 g) (hE : Differentiable ℝ E) (hμ : 0 < μ)
    (hsc : ∀ l, StrongConvexOn univ μ fun v ↦ g (l, v)) {w : Λ → W}
    (hw : ∀ l, IsMinOn (fun v ↦ g (l, v)) univ (w l)) (l : Λ)
    {Cgxy Cfy Lfx Lfy Lgxy Lgyy : ℝ}
    (hCgxy : ∀ v, ‖parameterFDeriv (stationarityMap g) v l‖ ≤ Cgxy)
    (hCfy : ‖spatialFDeriv (𝕜 := ℝ) E (w l) l‖ ≤ Cfy)
    (hLfx : ∀ v v', ‖parameterFDeriv E v l - parameterFDeriv E v' l‖ ≤ Lfx * ‖v - v'‖)
    (hLfy : ∀ v v', ‖spatialFDeriv (𝕜 := ℝ) E v l - spatialFDeriv (𝕜 := ℝ) E v' l‖ ≤
      Lfy * ‖v - v'‖)
    (hLgxy : ∀ v v', ‖parameterFDeriv (stationarityMap g) v l -
      parameterFDeriv (stationarityMap g) v' l‖ ≤ Lgxy * ‖v - v'‖)
    (hLgyy : ∀ v v', ‖spatialFDeriv (𝕜 := ℝ) (stationarityMap g) v l -
      spatialFDeriv (𝕜 := ℝ) (stationarityMap g) v' l‖ ≤ Lgyy * ‖v - v'‖) (v : W) :
    ‖implicitHypergradient g E v l - fderiv ℝ (fun x ↦ E (x, w x)) l‖ ≤
      (Lfx + Lfy * Cgxy / μ + Cfy * (Lgxy / μ + Lgyy * Cgxy / μ ^ 2)) * ‖v - w l‖ :=
  sorry

/-- 2.3 **The hypergradient is Lipschitz**, with a corrected constant (Ghadimi–Wang 2018,
Lemma 2.2(c), whose printed constant is false; proved here). Under 2.2 with its bounds and
Lipschitz constants in the weights holding at every hyperparameter, if `∂_l E`, `∂_w E`,
`∂_l ∂_w g`, `∂_w ∂_w g` are also Lipschitz in the hyperparameter with constants `Lfx'`,
`Lfy'`, `Lgxy'`, `Lgyy'`, and `‖∂_w E‖ ≤ Cfy` everywhere, then with `ℓ = Cgxy / μ` the
hypergradient is Lipschitz with constant
`Lfx' + Lfx ℓ + (Lgxy' + Lgxy ℓ) Cfy / μ + Cgxy (Lgyy' + Lgyy ℓ) Cfy / μ² + ℓ (Lfy' + Lfy ℓ)`. -/
theorem norm_hypergradient_sub_le {W : Type*} [NormedAddCommGroup W]
    [InnerProductSpace ℝ W] [CompleteSpace Λ] [CompleteSpace W] {g E : Λ × W → ℝ} {μ : ℝ}
    (hg : ContDiff ℝ 2 g) (hE : Differentiable ℝ E) (hμ : 0 < μ)
    (hsc : ∀ l, StrongConvexOn univ μ fun v ↦ g (l, v)) {w : Λ → W}
    (hw : ∀ l, IsMinOn (fun v ↦ g (l, v)) univ (w l))
    {Cgxy Cfy Lfx Lfy Lgxy Lgyy Lfx' Lfy' Lgxy' Lgyy' : ℝ}
    (hCgxy : ∀ l v, ‖parameterFDeriv (stationarityMap g) v l‖ ≤ Cgxy)
    (hCfy : ∀ l v, ‖spatialFDeriv (𝕜 := ℝ) E v l‖ ≤ Cfy)
    (hLfx : ∀ l v v', ‖parameterFDeriv E v l - parameterFDeriv E v' l‖ ≤ Lfx * ‖v - v'‖)
    (hLfy : ∀ l v v', ‖spatialFDeriv (𝕜 := ℝ) E v l - spatialFDeriv (𝕜 := ℝ) E v' l‖ ≤
      Lfy * ‖v - v'‖)
    (hLgxy : ∀ l v v', ‖parameterFDeriv (stationarityMap g) v l -
      parameterFDeriv (stationarityMap g) v' l‖ ≤ Lgxy * ‖v - v'‖)
    (hLgyy : ∀ l v v', ‖spatialFDeriv (𝕜 := ℝ) (stationarityMap g) v l -
      spatialFDeriv (𝕜 := ℝ) (stationarityMap g) v' l‖ ≤ Lgyy * ‖v - v'‖)
    (hLfx' : ∀ l l' v, ‖parameterFDeriv E v l - parameterFDeriv E v l'‖ ≤ Lfx' * ‖l - l'‖)
    (hLfy' : ∀ l l' v, ‖spatialFDeriv (𝕜 := ℝ) E v l - spatialFDeriv (𝕜 := ℝ) E v l'‖ ≤
      Lfy' * ‖l - l'‖)
    (hLgxy' : ∀ l l' v, ‖parameterFDeriv (stationarityMap g) v l -
      parameterFDeriv (stationarityMap g) v l'‖ ≤ Lgxy' * ‖l - l'‖)
    (hLgyy' : ∀ l l' v, ‖spatialFDeriv (𝕜 := ℝ) (stationarityMap g) v l -
      spatialFDeriv (𝕜 := ℝ) (stationarityMap g) v l'‖ ≤ Lgyy' * ‖l - l'‖) (l l' : Λ) :
    let ℓ := Cgxy / μ
    ‖fderiv ℝ (fun x ↦ E (x, w x)) l - fderiv ℝ (fun x ↦ E (x, w x)) l'‖ ≤
      (Lfx' + Lfx * ℓ + (Lgxy' + Lgxy * ℓ) * Cfy / μ + Cgxy * (Lgyy' + Lgyy * ℓ) * Cfy / μ ^ 2 +
        ℓ * (Lfy' + Lfy * ℓ)) * ‖l - l'‖ :=
  sorry

/-! ## Layer 3: approximate hypergradients -/

/-- 3.1 **The gradient step is a contraction.** If `f` is `μ`-strongly convex and `K`-smooth
with `0 < μ ≤ K`, and `0 < α` with `α K < 2`, then the gradient step with step size `α` is a
contraction with constant `max |1 - α μ| |1 - α K|`. -/
theorem contractingWith_gradientStep {W : Type*} [NormedAddCommGroup W] [InnerProductSpace ℝ W]
    [CompleteSpace W] {f : W → ℝ} {μ α : ℝ} {K : ℝ≥0} (hμ : 0 < μ) (hμK : μ ≤ K)
    (hs : StrongConvexOn univ μ f) (hf : LipschitzSmoothWith ℝ K f) (hα : 0 < α)
    (hαK : α * K < 2) :
    ContractingWith (max |1 - α * μ| |1 - α * K|).toNNReal (gradientStep f α) :=
  sorry

/-- 3.2 The `t`-th iterate of `Φ (l, ·)` from `w₀`, as a function of the hyperparameter. -/
def unrolled {W : Type*} (Φ : Λ × W → W) (w₀ : W) (t : ℕ) (l : Λ) : W :=
  (fun w ↦ Φ (l, w))^[t] w₀

/-- 3.2 **Iterative differentiation** (Grazzi et al. 2020, Proposition 2.1 and Theorem 2.1).
Under 1.1 with `Φ` `C¹` and `E` differentiable, let `‖w l‖ ≤ D`, let `‖∂_w E (l, v)‖ ≤ LE` and
`‖∂_l Φ (l, v)‖ ≤ LΦ` for `‖v‖ ≤ 2 D`, and let `∂_w Φ`, `∂_l Φ`, `∂_w E`, `∂_l E` be Lipschitz
in the weights at `l` with constants `ν₁`, `ν₂`, `η₁`, `η₂`. Then for every `t` the iterates
from `0` satisfy the derivative bound of Proposition 2.1 and the hypergradient bound
`(c₁ + c₃) q ^ t + c₂ t q ^ (t - 1)`. -/
theorem norm_fderiv_unrolled_sub_le {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    [CompleteSpace Λ] [CompleteSpace W] {Φ : Λ × W → W} {E : Λ × W → ℝ} {q : ℝ≥0}
    (hΦ : ContDiff ℝ 1 Φ) (hE : Differentiable ℝ E) (hc : ∀ l, ContractingWith q fun w ↦ Φ (l, w))
    (l : Λ) {D LE LΦ : ℝ} {ν₁ ν₂ η₁ η₂ : ℝ≥0} (hD : ‖fixedPointMap Φ hc l‖ ≤ D)
    (hLE : ∀ v : W, ‖v‖ ≤ 2 * D → ‖spatialFDeriv (𝕜 := ℝ) E v l‖ ≤ LE)
    (hLΦ : ∀ v : W, ‖v‖ ≤ 2 * D → ‖parameterFDeriv Φ v l‖ ≤ LΦ)
    (hν₁ : LipschitzWith ν₁ fun v ↦ spatialFDeriv (𝕜 := ℝ) Φ v l)
    (hν₂ : LipschitzWith ν₂ fun v ↦ parameterFDeriv Φ v l)
    (hη₁ : LipschitzWith η₁ fun v ↦ spatialFDeriv (𝕜 := ℝ) E v l)
    (hη₂ : LipschitzWith η₂ fun v ↦ parameterFDeriv E v l) (t : ℕ) :
    let c₁ := (η₂ + η₁ * LΦ / (1 - q)) * D
    let c₂ := (ν₂ + ν₁ * LΦ / (1 - q)) * LE * D
    let c₃ := LE * LΦ / (1 - q)
    ‖fderiv ℝ (unrolled Φ 0 t) l - fderiv ℝ (fixedPointMap Φ hc) l‖ ≤
        (ν₂ + ν₁ * LΦ / (1 - q)) * D * t * (q : ℝ) ^ (t - 1) + LΦ * (q : ℝ) ^ t / (1 - q) ∧
      ‖fderiv ℝ (fun x ↦ E (x, unrolled Φ 0 t x)) l -
          fderiv ℝ (fun x ↦ E (x, fixedPointMap Φ hc x)) l‖ ≤
        (c₁ + c₃) * (q : ℝ) ^ t + c₂ * t * (q : ℝ) ^ (t - 1) :=
  sorry

/-- 3.3 The truncated Neumann hypergradient with `k` terms at `(l, w)`:
`∂_l E + ∂_w E ∘ (∑_{i < k} (∂_w Φ)^i) ∘ ∂_l Φ`, all at `(l, w)`. -/
def neumannHypergradient {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    (Φ : Λ × W → W) (E : Λ × W → ℝ) (k : ℕ) (w : W) (l : Λ) : StrongDual ℝ Λ :=
  parameterFDeriv E w l + spatialFDeriv (𝕜 := ℝ) E w l ∘L
    ((∑ i ∈ Finset.range k, spatialFDeriv (𝕜 := ℝ) Φ w l ^ i) ∘L parameterFDeriv Φ w l)

/-- 3.3 **The truncated Neumann series at an approximate fixed point** (Grazzi et al. 2020,
Theorem 2.4 with Proposition A.2, for an arbitrary approximate fixed point). Under the
hypotheses of 3.2, for every `v` with `‖v - w l‖ ≤ ρ D`, `0 ≤ ρ ≤ 1`, and every `k`, the
distance from `neumannHypergradient Φ E k v l` to the hypergradient is at most
`(c₁ + c₂ (1 - q ^ k) / (1 - q)) ρ + c₃ q ^ k`. -/
theorem norm_neumannHypergradient_sub_le {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    [CompleteSpace Λ] [CompleteSpace W] {Φ : Λ × W → W} {E : Λ × W → ℝ} {q : ℝ≥0}
    (hΦ : ContDiff ℝ 1 Φ) (hE : Differentiable ℝ E) (hc : ∀ l, ContractingWith q fun w ↦ Φ (l, w))
    (l : Λ) {D LE LΦ ρ : ℝ} {ν₁ ν₂ η₁ η₂ : ℝ≥0} (hD : ‖fixedPointMap Φ hc l‖ ≤ D)
    (hLE : ∀ v : W, ‖v‖ ≤ 2 * D → ‖spatialFDeriv (𝕜 := ℝ) E v l‖ ≤ LE)
    (hLΦ : ∀ v : W, ‖v‖ ≤ 2 * D → ‖parameterFDeriv Φ v l‖ ≤ LΦ)
    (hν₁ : LipschitzWith ν₁ fun v ↦ spatialFDeriv (𝕜 := ℝ) Φ v l)
    (hν₂ : LipschitzWith ν₂ fun v ↦ parameterFDeriv Φ v l)
    (hη₁ : LipschitzWith η₁ fun v ↦ spatialFDeriv (𝕜 := ℝ) E v l)
    (hη₂ : LipschitzWith η₂ fun v ↦ parameterFDeriv E v l) (hρ₀ : 0 ≤ ρ) (hρ₁ : ρ ≤ 1) {v : W}
    (hv : ‖v - fixedPointMap Φ hc l‖ ≤ ρ * D) (k : ℕ) :
    let c₁ := (η₂ + η₁ * LΦ / (1 - q)) * D
    let c₂ := (ν₂ + ν₁ * LΦ / (1 - q)) * LE * D
    let c₃ := LE * LΦ / (1 - q)
    ‖neumannHypergradient Φ E k v l - fderiv ℝ (fun x ↦ E (x, fixedPointMap Φ hc x)) l‖ ≤
      (c₁ + c₂ * (1 - (q : ℝ) ^ k) / (1 - q)) * ρ + c₃ * (q : ℝ) ^ k :=
  sorry

/-- 3.4 **Unrolling from a fixed point is the truncated Neumann series** (Lorraine et al. 2019,
Theorem 2, with the index range of its appendix). If `w₀` is a fixed point of `Φ (l₀, ·)` and
`Φ`, `E` are differentiable at `(l₀, w₀)`, then the `t`-th iterate from `w₀` has derivative
`(∑_{j < t} (∂_w Φ)^j) ∘ ∂_l Φ` at `l₀`, and `l ↦ E (l, unrolled Φ w₀ t l)` has derivative
`neumannHypergradient Φ E t w₀ l₀`. -/
theorem hasFDerivAt_unrolled_of_isFixedPt {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    {Φ : Λ × W → W} {E : Λ × W → ℝ} {l₀ : Λ} {w₀ : W} (hΦ : DifferentiableAt ℝ Φ (l₀, w₀))
    (hfix : Φ (l₀, w₀) = w₀) (hE : DifferentiableAt ℝ E (l₀, w₀)) (t : ℕ) :
    HasFDerivAt (unrolled Φ w₀ t)
        ((∑ j ∈ Finset.range t, spatialFDeriv (𝕜 := ℝ) Φ w₀ l₀ ^ j) ∘L
          parameterFDeriv Φ w₀ l₀) l₀ ∧
      HasFDerivAt (fun x ↦ E (x, unrolled Φ w₀ t x)) (neumannHypergradient Φ E t w₀ l₀) l₀ :=
  sorry

/-- 3.5 **DARTS' first-order and one-step architecture gradients** (Liu–Simonyan–Yang 2019,
§2.3, which proves no bound; the bounds follow from 1.1, 3.1 and 3.4). Let
every `g (l, ·)` be `μ`-strongly convex and `K`-smooth with `0 < μ ≤ K`, `g` be `C²`, `E` be
differentiable, `w l` minimize `g (l, ·)`, `0 < ξ`, `ξ K < 2`, `q = max |1 - ξ μ| |1 - ξ K|`,
and `Φ (l, v) = gradientStep (g (l, ·)) ξ v`. If `‖∂_w E (l, w l)‖ ≤ LE` and
`‖∂_l Φ (l, w l)‖ ≤ LΦ`, then the first-order gradient `∂_l E (l, w l)` is within
`LE LΦ / (1 - q)` of the hypergradient, and the one-step gradient, the derivative of
`l' ↦ E (l', Φ (l', w l))` at `l`, is within `LE LΦ q / (1 - q)`. -/
theorem norm_darts_sub_le {W : Type*} [NormedAddCommGroup W] [InnerProductSpace ℝ W]
    [CompleteSpace Λ] [CompleteSpace W] {g E : Λ × W → ℝ} {μ ξ : ℝ} {K : ℝ≥0}
    (hg : ContDiff ℝ 2 g) (hE : Differentiable ℝ E) (hμ : 0 < μ) (hμK : μ ≤ K)
    (hsc : ∀ l, StrongConvexOn univ μ fun v ↦ g (l, v))
    (hsm : ∀ l, LipschitzSmoothWith ℝ K fun v ↦ g (l, v)) (hξ : 0 < ξ) (hξK : ξ * K < 2)
    {w : Λ → W} (hw : ∀ l, IsMinOn (fun v ↦ g (l, v)) univ (w l)) (l : Λ) {LE LΦ : ℝ}
    (hLE : ‖spatialFDeriv (𝕜 := ℝ) E (w l) l‖ ≤ LE)
    (hLΦ : ‖parameterFDeriv (fun p : Λ × W ↦ gradientStep (fun v ↦ g (p.1, v)) ξ p.2) (w l) l‖ ≤
      LΦ) :
    let q := max |1 - ξ * μ| |1 - ξ * K|
    ‖parameterFDeriv E (w l) l - fderiv ℝ (fun x ↦ E (x, w x)) l‖ ≤ LE * LΦ / (1 - q) ∧
      ‖fderiv ℝ (fun x ↦ E (x, gradientStep (fun v ↦ g (x, v)) ξ (w l))) l -
          fderiv ℝ (fun x ↦ E (x, w x)) l‖ ≤ LE * LΦ * q / (1 - q) :=
  sorry

end TauCetiRoadmap.HypergradientsAndBilevelOptimization
