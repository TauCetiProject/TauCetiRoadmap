# Roadmap: hypergradients and bilevel optimization

**Summary.** A bilevel problem chooses a hyperparameter `λ` (in architecture search, the
architecture; in hyperparameter optimization, a regularization weight) to minimize an outer
objective `F(λ) = E(λ, w(λ))`, where the weights `w(λ)` solve an inner problem: they are the
fixed point of a contraction `Φ(λ, ·)`, or the minimizer of a training loss `g(λ, ·)`. The
derivative of `F` is the hypergradient. This roadmap proves the formulas for the hypergradient
and explicit error bounds for practical approximations. Every statement is a theorem
about functions, their Fréchet derivatives and sequences of iterates; the hyperparameters and
weights live in real normed spaces, complete where fixed points or implicit functions are used
and Hilbert where gradients or the Lax–Milgram theorem enter; inner problems are unconstrained.

The headline theorems are these.

- *Fixed points.* If every `Φ(λ, ·)` is a `q`-contraction with `q < 1`, `Φ` is `C¹` and `E`
  differentiable, then `1 − ∂_w Φ` is invertible with inverse of norm at most `1/(1 − q)`, the
  fixed point is differentiable with derivative `(1 − ∂_w Φ)⁻¹ ∂_λ Φ`, and
  `F′ = ∂_λ E + ∂_w E (1 − ∂_w Φ)⁻¹ ∂_λ Φ`.
- *Strongly convex inner problems.* If every `g(λ, ·)` is `μ`-strongly convex with `μ > 0`,
  `g` is `C²` and `E` differentiable, then the minimizer is differentiable and
  `F′ = ∂_λ E − ∂_w E (∂²_ww g)⁻¹ ∂²_λw g`. In finite dimension, a nonconvex inner problem has
  the same formula along the local branch of minimizers through a critical point with positive
  definite Hessian, though its global minimizer can jump.
- *Approximate hypergradients.* Differentiating `t` iterates of `Φ` from `0`, or truncating the
  Neumann series of `(1 − ∂_w Φ)⁻¹` after `k` terms at an approximate solution, gives an error
  at most `(c₁ + c₃) q^t + c₂ t q^(t−1)`, respectively
  `(c₁ + c₂ (1 − q^k)/(1 − q)) ρ + c₃ q^k`, with explicit constants from the Lipschitz constants
  of the partial derivatives (Grazzi, Franceschi, Pontil and Salzo).
- *DARTS.* For a strongly convex and smooth training loss and a gradient step of size `ξ` with
  contraction constant `q`, the first-order architecture gradient `∂_λ E(λ, w(λ))` and the
  one-step gradient of Liu, Simonyan and Yang are within `L_E L_Φ/(1 − q)` and
  `L_E L_Φ q/(1 − q)` of the hypergradient, and both bounds are attained on DARTS' example.

The roadmap rests on Mathlib's implicit function theorem, contraction mapping theorem and
Neumann series; on Tau Ceti's partial derivatives of maps on products and its bounds for
inverses of perturbations of the identity; on FirstOrderOptimization, whose smoothness notion
and gradient step it copies and whose cocoercivity inequality makes the gradient step a
contraction; and on NonlinearProgrammingOptimality, whose second-order sufficient condition gives
quadratic growth along a branch of local minimizers.

Below, Layer 1 proves the exact formulas, Layer 2 the Lipschitz bounds for strongly convex inner
problems, and Layer 3 the error bounds of the approximations. Layers 2 and 3 use Layer 1;
Layer 3 does not use Layer 2.

## Conventions

- **Spaces.** `Λ` (hyperparameters) and `W` (weights) are real normed spaces; `Λ` is complete
  wherever the implicit function theorem is used, and so is `W`. A statement that uses gradients
  or strong convexity takes `W` a real Hilbert space (`InnerProductSpace ℝ W`, `CompleteSpace W`);
  1.3 takes `W` finite-dimensional. Maps on the product are written with the hyperparameter
  first, `Φ : Λ × W → W`, `g, E : Λ × W → ℝ`, so that Mathlib's implicit function theorem,
  which solves for the second factor, applies as it is. In Lean the hyperparameter is `l`.
- **Partial derivatives.** `∂_w Φ (λ, w)` is Tau Ceti's `spatialFDeriv Φ w λ`, the Fréchet
  derivative of `Φ` at `(λ, w)` restricted to the second factor, and `∂_λ Φ (λ, w)` is
  `parameterFDeriv Φ w λ`, its restriction to the first factor (defined in 1.1). Both are joint
  derivatives: at a point where `Φ` is not jointly differentiable they are `0` (Mathlib's junk
  value of `fderiv`), even if a slice is differentiable. Every statement assumes enough joint
  differentiability at the points it evaluates them, and where `Φ` is differentiable at `(λ, w)`
  they are the derivatives of the slices `Φ(λ, ·)` and `Φ(·, w)` (Tau Ceti
  `TauCeti.fderiv_slice_right`, `TauCeti.fderiv_slice_left`).
- **Hypergradients are derivatives, not gradients.** The hypergradient is the continuous linear
  functional `fderiv ℝ F λ : Λ →L[ℝ] ℝ`, and all norms are operator norms. The transposes of the
  sources become compositions: `w′(λ)ᵀ ∇_w E` becomes `∂_w E ∘ w′(λ)`. In `ℝⁿ` with the Euclidean
  inner product the two descriptions correspond through `InnerProductSpace.toDual`.
- **Second derivatives.** For `g : Λ × W → ℝ`, `stationarityMap g (λ, w) = ∂_w g (λ, w)`, a
  continuous linear functional on `W`; its zeros include the minimizers of the inner problems.
  The weight Hessian `∂²_ww g (λ, w)` is `∂_w (stationarityMap g) (λ, w) : W →L[ℝ] (W →L[ℝ] ℝ)`
  and the mixed block `∂²_λw g (λ, w)` is `∂_λ (stationarityMap g) (λ, w) : Λ →L[ℝ] (W →L[ℝ] ℝ)`.
- **Sign convention.** The inner solution satisfies `stationarityMap g (λ, w(λ)) = 0`, so
  `∂²_λw g + ∂²_ww g ∘ w′ = 0` and `w′ = −(∂²_ww g)⁻¹ ∘ ∂²_λw g`, with a minus sign; for a fixed
  point, `w = Φ(λ, w)` gives `w′ = (1 − ∂_w Φ)⁻¹ ∘ ∂_λ Φ`, with a plus sign.
- **Inverses.** `T.inverse` is Mathlib's `ContinuousLinearMap.inverse`, equal to `0` when `T` is
  not invertible (`Ring.inverse` on `W →L[ℝ] W` agrees with it,
  `ContinuousLinearMap.ringInverse_eq_inverse`). Every statement that uses an inverse also
  asserts or assumes that the map is invertible at the point where it is evaluated, so that no
  statement holds only through this value.
- **Inner solutions.** For a family of contractions the solution map is `fixedPointMap Φ hc`,
  built from Mathlib's `ContractingWith.fixedPoint`; it is a genuine function, with no choice.
  For a minimization problem the inner solution is data: a map `w : Λ → W` with
  `IsMinOn (fun v ↦ g (λ, v)) univ (w λ)` for every `λ`. Under strong convexity such a map
  exists when each `g(λ, ·)` is continuous (FirstOrderOptimization 1.3,
  `StrongConvexOn.existsUnique_isMinOn`) and is then unique.
- **Contractions and constants.** `ContractingWith q f` (Mathlib) means `q : ℝ≥0`, `q < 1` and
  `f` is `q`-Lipschitz; `q = 0` is allowed. Bounds are written without division by `q`:
  Grazzi et al.'s `(t/q) q^t` is written `t q^(t−1)`, read with `0⁰ = 1`, which is Lean's
  convention for natural-number powers.
- **Strong convexity** is Mathlib's `StrongConvexOn univ μ`, with the normalization
  `f(a x + b y) ≤ a f x + b f y − a b μ/2 ‖x − y‖²`. Smoothness is `LipschitzSmoothWith ℝ K`,
  copied verbatim from FirstOrderOptimization 1.1 (differentiable, with first-order Taylor
  remainder at most `K/2 ‖y − x‖²`), and `gradientStep f α x = x − α ∇f x` is copied verbatim
  from FirstOrderOptimization, Layer 2.

## Layer 1: exact hypergradients

### 1.1 Differentiation of a parametrized fixed point

Define `parameterFDeriv Φ w λ = fderiv ℝ Φ (λ, w) ∘L inl`, the derivative in the
hyperparameter, and, for `hc : ∀ λ, ContractingWith q (Φ(λ, ·))` on a complete `W`, the solution
map `fixedPointMap Φ hc λ = ContractingWith.fixedPoint (Φ(λ, ·)) (hc λ)`.

Let `Λ` and `W` be Banach spaces, let every `Φ(λ, ·)` be a `q`-contraction, let `Φ` be `C¹` at
`(λ, w(λ))` and `E` differentiable there, where `w = fixedPointMap Φ hc`. Prove
(`hasFDerivAt_fixedPointMap`), with `A = ∂_w Φ (λ, w(λ))`:

- `1 − A` is invertible and `‖(1 − A)⁻¹‖ ≤ 1/(1 − q)`;
- `w` has derivative `(1 − A)⁻¹ ∘ ∂_λ Φ (λ, w(λ))` at `λ`;
- `F = λ ↦ E(λ, w(λ))` has derivative `∂_λ E + ∂_w E ∘ (1 − A)⁻¹ ∘ ∂_λ Φ` at `λ`, all at
  `(λ, w(λ))`. Grouped as `∂_λ E + v ∘ ∂_λ Φ` with `v = ∂_w E ∘ (1 − A)⁻¹`, this is the adjoint
  form, in which `v` solves the linear equation `v ∘ (1 − A) = ∂_w E`.

Route. The slice `Φ(λ, ·)` is `q`-Lipschitz, so its derivative at `w(λ)`, which is `A`, has norm
at most `q` (Mathlib `norm_fderiv_le_of_lipschitz`; `TauCeti.fderiv_slice_right`). Tau Ceti's
`NormedRing.norm_inverse_one_sub_le` with `‖1‖ ≤ 1` gives that `1 − A` is a unit with
`‖Ring.inverse (1 − A)‖ ≤ (1 − ‖A‖)⁻¹ ≤ (1 − q)⁻¹`; a unit of `W →L[ℝ] W` is invertible as a
continuous linear map. Apply Mathlib's `ContDiffAt.implicitFunction` to `G (λ, w) = w − Φ(λ, w)`
at `(λ, w(λ))`: the derivative of `G` in the second factor is `1 − A`. It gives a function `ψ`
with `ψ λ = w(λ)` and, near `(λ, w(λ))`, `G (μ', v) = 0 ↔ ψ μ' = v`
(`ContDiffAt.eventually_apply_eq_iff_implicitFunction`). Since `ψ` is continuous at `λ`, for `μ'`
near `λ` the point `(μ', ψ μ')` is in that neighbourhood, so `ψ μ'` is a fixed point of
`Φ(μ', ·)` and equals `w(μ')` (`ContractingWith.fixedPoint_unique`). Hence `w` agrees with `ψ`
near `λ` and has its derivative `−(1 − A)⁻¹ ∘ (−∂_λ Φ)`
(`ContDiffAt.hasStrictFDerivAt_implicitFunction`). The last item is the chain rule. (Grazzi,
Franceschi, Pontil and Salzo 2020, Lemma 2.2, p. 4, proof p. 12, and Theorem A.1, p. 12, in `ℝᵈ`
for `Φ` continuously differentiable everywhere and `q ∈ (0, 1)`; here in Banach spaces, with
differentiability only at the point and `q = 0` allowed. The route is theirs.)

**Checks.**

- `Φ(λ, w) = r w + λ` on `ℝ` with `|r| < 1`: `w(λ) = λ/(1 − r)` and the formula gives
  `w′ = 1/(1 − r)` (for `r = 1/2, −2/3, 0`: `2, 3/5, 1`).
- Policy evaluation of a Markov decision process: `Φ(r, v) = r + γ P v` with `γ = 1/2` and
  `P = [[1/2, 1/2], [1, 0]]`, sup norm. The fixed point is `(1 − γP)⁻¹ r`, the value of the
  policy, the formula gives `w′ = (1 − γP)⁻¹ = [[8/5, 2/5], [4/5, 6/5]]`, and its
  sup norm is `2 = 1/(1 − q)` with `q = 1/2`: the bound on the inverse is attained.
- `q = 0`: `Φ(λ, ·)` is constant, `w(λ) = Φ(λ, 0)` and the formula gives `w′ = ∂_λ Φ`.
- The contraction hypothesis is used for the existence and uniqueness of the fixed point as well
  as for invertibility: `Φ(λ, w) = w + λ` is `1`-Lipschitz in `w` and has no fixed point for
  `λ ≠ 0`.

*Needs:* Mathlib `ContractingWith.fixedPoint`, `ContractingWith.fixedPoint_unique`,
`norm_fderiv_le_of_lipschitz`, `ContDiffAt.implicitFunction`,
`ContDiffAt.hasStrictFDerivAt_implicitFunction`,
`ContDiffAt.eventually_apply_eq_iff_implicitFunction`, `ContDiffAt.implicitFunction_apply_self`,
`ContinuousLinearMap.ringInverse_eq_inverse`; Tau Ceti `spatialFDeriv`,
`TauCeti.fderiv_slice_right`, `NormedRing.norm_inverse_one_sub_le`.

### 1.2 Strongly convex inner problems

Define `stationarityMap g (λ, w) = spatialFDeriv g w λ`, and the implicit hypergradient at
`(λ, w)`,

    implicitHypergradient g E w λ = ∂_λ E − ∂_w E ∘ (∂²_ww g)⁻¹ ∘ ∂²_λw g    (all at (λ, w)).

Let `W` be a Hilbert space and `Λ` a Banach space, `μ > 0`, every `g(λ, ·)` `μ`-strongly convex,
`w` a map of minimizers, `g` `C²` at `(λ, w(λ))` and `E` differentiable there. Prove
(`hasFDerivAt_argmin_of_strongConvexOn`), with `H = ∂²_ww g (λ, w(λ))`:

- `H` is invertible and `‖H⁻¹‖ ≤ 1/μ`;
- `w` has derivative `−H⁻¹ ∘ ∂²_λw g (λ, w(λ))` at `λ`;
- `F = λ ↦ E(λ, w(λ))` has derivative `implicitHypergradient g E (w λ) λ`, that is,
  `∇F = ∇_λ E − ∇²_λw g (∇²_ww g)⁻¹ ∇_w E` in coordinates.

Route. Coercivity: for `h = g(λ, ·)` and `x = w(λ)`, Tau Ceti's
`StrongConvexOn.add_add_le_of_hasFDerivWithinAt` at `x` and at `x + s v`, added, gives
`(h′(x + s v) − h′(x))(s v) ≥ μ s² ‖v‖²` for small `s`; dividing by `s²` and letting `s → 0`
gives `H v v ≥ μ ‖v‖²` (`h` is twice differentiable at `x` because `g` is `C²` there, and
`H = fderiv ℝ (fderiv ℝ h) x` by `TauCeti.fderiv_slice_right` applied near `(λ, x)`). Then
`‖H v‖ ≥ μ ‖v‖`. Riesz: `InnerProductSpace.toDual` identifies `H` with the operator of a coercive
bilinear form, which is invertible by Lax–Milgram (`IsCoercive.continuousLinearEquivOfBilin`);
hence `H` is invertible with `‖H⁻¹‖ ≤ 1/μ`. Fermat: `stationarityMap g (λ, w(λ)) = 0`
(`IsLocalMin.fderiv_eq_zero`). Since `g` is `C²` at the point, `stationarityMap g` is `C¹` there,
and Mathlib's `ContDiffAt.implicitFunction` applies to it at `(λ, w(λ))`, with derivative
`−H⁻¹ ∘ ∂²_λw g`. For `μ'` near `λ` the implicit function `ψ` gives a zero `(μ', ψ μ')` of
`stationarityMap g` at which `g` is differentiable; there `ψ μ'` is a critical point of the
strongly convex `g(μ', ·)`, hence its unique minimizer (the first-order inequality again), so
`ψ μ' = w(μ')`. The hypergradient is the chain rule. (Ghadimi and Wang 2018, Lemma 2.1, p. 7;
Grazzi et al. 2020, Corollary A.1, p. 12. Ghadimi and Wang list only their Assumptions 2.a–b,
twice differentiability and a Lipschitz gradient, as hypotheses; their proof uses the strong
convexity of Assumption 2.c, without which `g = 0` has no unique minimizer. Here in a Hilbert
space, with `C²` only at the point; the coercivity step is proved here.)

When `E = g`, `∂_w g (λ, w(λ)) = 0` and the formula reduces to `∂_λ g (λ, w(λ))`: the derivative
of the optimal value is the derivative in the hyperparameter at the frozen minimizer (Tau Ceti
`HasFDerivAt.fderiv_comp_graph_eq_fderiv_slice_of_fderiv_right_eq_zero`).

**Checks.**

- `g = ½ wᵀ A(λ) w − b(λ)ᵀ w` on `ℝ²` with `A(λ) = [[2 + λ², 1], [1, 3]]` (strongly convex with
  `μ = (5 − √5)/2` for every `λ`), `b(λ) = (λ, 1 − λ)`, and
  `E = ((w₁ − 1)² + (w₂ + 2)²)/2 + λ³/3 + λ w₂`. The formula equals `F′(λ)`, computed by solving
  for `w(λ)` and differentiating, at `λ = 0, 1/2, −3, 7/5` (values `−2`, `−74783/48668`,
  `85805/8192`, `72580363/125772800`).
- Sign: with `+` in place of `−` the formula gives `109697/48668` at `λ = 1/2`, and the term
  `∂_λ E` alone gives `33/92`; both differ from `F′(1/2) = −74783/48668`.
- Envelope case: for `E = g` on the same example, `F′ − ∂_λ g (λ, w(λ)) = 0` identically.
- Strong convexity is needed: `g = w⁴/4 − λ w` is strictly convex with unique minimizer
  `w(λ) = λ^(1/3)`, whose difference quotients at `0` along `λ = 8^(−k)` are `4, 16, 64` for
  `k = 1, 2, 3`; `w` is not differentiable at `0`, where `∂²_ww g = 0`.

*Needs:* 1.1 (`parameterFDeriv`); Mathlib `ContDiffAt.implicitFunction` and the three lemmas
listed in 1.1, `IsLocalMin.fderiv_eq_zero`, `IsCoercive.continuousLinearEquivOfBilin`,
`InnerProductSpace.toDual`; Tau Ceti `spatialFDeriv`, `TauCeti.fderiv_slice_right`,
`StrongConvexOn.add_add_le_of_hasFDerivWithinAt`.

### 1.3 The local branch of a nondegenerate inner minimizer

This is the setting of architecture search, where the training loss is not convex. Let `W` be
finite-dimensional, `Λ` a Banach space, `g` `C²` at `(λ₀, w₀)`, `w₀` a critical point of
`g(λ₀, ·)` whose Hessian `fderiv ℝ (fderiv ℝ (g(λ₀, ·))) w₀` is positive definite, and `E`
differentiable at `(λ₀, w₀)`. Prove (`exists_branch_of_hessian_pos`) that there is `ψ : Λ → W`
with:

- `ψ λ₀ = w₀`, `ψ` has derivative `−(∂²_ww g)⁻¹ ∘ ∂²_λw g` at `λ₀` (at `(λ₀, w₀)`), and
  `λ ↦ E(λ, ψ λ)` has derivative `implicitHypergradient g E w₀ λ₀` at `λ₀`;
- for `λ` near `λ₀`, `ψ λ` is a critical point of `g(λ, ·)` with quadratic growth: some `σ > 0`
  has `g(λ, ψ λ) + σ ‖v − ψ λ‖² ≤ g(λ, v)` for `v` near `ψ λ`; in particular `ψ λ` is a strict
  local minimizer;
- near `(λ₀, w₀)`, `w` is a critical point of `g(λ, ·)` exactly when `w = ψ λ`.

Route. Positive definiteness makes the Hessian injective, hence invertible in finite dimension.
Apply Mathlib's `ContDiffAt.implicitFunction` to `stationarityMap g` at `(λ₀, w₀)` as in 1.2: this
gives `ψ`, its derivative and the local equivalence; near `(λ₀, w₀)` the critical points of
`g(λ, ·)` are the zeros of `stationarityMap g`, because `g` is differentiable there. Positivity
on the unit sphere, which is compact, has a positive minimum `m` at `(λ₀, w₀)`; the second
derivative of `g` is continuous at `(λ₀, w₀)`, and `ψ` is continuous at `λ₀`, so for `λ` near
`λ₀` the Hessian of `g(λ, ·)` at `ψ λ` stays positive on the unit sphere. Then
NonlinearProgrammingOptimality 3.3 (`exists_quadratic_growth_of_lagrangianHessian_pos`) applies
to `f = g(λ, ·)` at `ψ λ` with no constraints (index types `ι = κ = Empty`): then
`feasibleSet g h = univ`, a Karush–Kuhn–Tucker multiplier is the empty pair and exists because
`fderiv ℝ f (ψ λ) = 0`, the critical cone is all of `W`, and `lagrangianHessian` is
`fderiv ℝ (fderiv ℝ f) (ψ λ) d d`; it gives the quadratic growth. The hypergradient is the chain
rule. For a `C³` family, Tau Ceti's
`TauCeti.IsNondegenerateCriticalPoint.exists_contDiffAt_criticalPoint_continuation` gives the
branch, its local uniqueness and the constancy of its Morse index; 1.3 asks for `C²` only and adds
the derivative of the branch, the hypergradient and the quadratic growth. (The implicit function
statement is Lorraine, Vicol and Duvenaud 2019, Appendix C, p. 14, stated without proof; the
statement here and its route are proved here.)

**Checks.**

- `g = (w² − 1)² + λ w` at `(0, 1)`: `∂_w g = 0`, `∂²_ww g = 8 > 0`, and the branch has
  `ψ′(0) = −∂²_λw g/∂²_ww g = −1/8`.
- On the same `g`, the global minimizer jumps, so 1.3 is about a branch and never about "the"
  minimizer: `g(λ, −w) − g(λ, w) = −2λ w`, so for `λ > 0` every global minimizer is negative and
  for `λ < 0` positive; at `λ = 1/10`, `g = −1/10` at `w = −1`, `1/10` at `w = 1`, `1` at `0`,
  and `∂_w g(1/10, ·)` has three real roots, one of them in `(−11/10, −1)`.
- Positive definiteness is needed: `g = w⁴/4 − λ w` at `(0, 0)` has a critical point with zero
  Hessian, and its minimizer `λ^(1/3)` is not differentiable at `0` (Check of 1.2).

*Needs:* 1.2 (`stationarityMap`, `implicitHypergradient`); Mathlib
`ContDiffAt.implicitFunction` and the lemmas listed in 1.1; NonlinearProgrammingOptimality 3.3
(`exists_quadratic_growth_of_lagrangianHessian_pos`, with `feasibleSet`, `IsKKTMultiplier`,
`criticalCone`, `lagrangianHessian` of its Layers 1–3); Tau Ceti `spatialFDeriv`,
`TauCeti.fderiv_slice_right`.

### Examples

- Ridge regression with a regularization weight `μ + λ²` (`μ > 0`):
  `g(λ, w) = ‖X w − y‖²/2 + (μ + λ²) ‖w‖²/2` is `μ`-strongly convex for every `λ ∈ ℝ`,
  `∂²_ww g = XᵀX + μ + λ²` and `∂²_λw g = 2λ w`, so 1.2 gives
  `w′(λ) = −2λ (XᵀX + μ + λ²)⁻¹ w(λ)`.
- Policy evaluation (Check of 1.1): the derivative of the value of a policy with respect to the
  reward is the resolvent `(1 − γP)⁻¹`.

### Dependencies

1.1: Mathlib, Tau Ceti. 1.2: 1.1, Mathlib, Tau Ceti. 1.3: 1.2, Mathlib, Tau Ceti,
NonlinearProgrammingOptimality 3.3.

## Layer 2: regularity with explicit constants

All three items are in the strongly convex setting of 1.2.

### 2.1 The inner solution is Lipschitz

Let `W` be a real normed space, `μ > 0`, every `g(λ, ·)` `μ`-strongly convex with derivative
`G λ v` at every `v`, `‖G λ v − G λ′ v‖ ≤ C ‖λ − λ′‖` for all `λ, λ′, v`, and `w` a map of
minimizers. Prove `‖w(λ) − w(λ′)‖ ≤ (C/μ) ‖λ − λ′‖` (`norm_argmin_sub_le`).

Route. Tau Ceti's `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` at `a` and at `b`, added,
gives strong monotonicity `(G λ′ a − G λ′ b)(a − b) ≥ μ ‖a − b‖²`. Take `a = w(λ)`, `b = w(λ′)`:
`G λ′ b = 0` and `G λ a = 0` (`IsLocalMin.fderiv_eq_zero`), so
`μ ‖a − b‖² ≤ (G λ′ a − G λ a)(a − b) ≤ C ‖λ − λ′‖ ‖a − b‖`. (Ghadimi and Wang 2018,
Lemma 2.2(b), p. 8, in `ℝᵐ` with the bound `‖∇²_xy g‖ ≤ C` and a proof through the derivative
of `w`; here in a normed space with no second derivatives, and this route is proved here.) The
derivative is a datum `G` with `HasFDerivAt` at every point, so that the hypothesis on `C` is a
statement about true derivatives and not about the value `0` that `fderiv` takes at a kink.

**Checks.**

- `g = 3w²/2 − 2λ w` on `ℝ`: `μ = 3`, `C = 2`, `w(λ) = 2λ/3`; the Lipschitz constant `2/3`
  equals `C/μ`.
- `μ > 0` is needed: with `μ = 0`, `g = 0`, `G = 0` and `C = 0` every other hypothesis holds (Lean's
  `C/μ` is `0/0 = 0`), and `w(0) = 0`, `w(λ) = 1` for `λ ≠ 0` is a map of minimizers that is not
  even continuous.

*Needs:* Tau Ceti `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`; Mathlib
`IsLocalMin.fderiv_eq_zero`.

### 2.2 The hypergradient at an approximate inner solution

Under the hypotheses of 1.2 with `g` `C²` and `E` differentiable everywhere, fix `λ` and assume,
for all weights `v, v′`: `‖∂²_λw g (λ, v)‖ ≤ C_gxy`; `∂_λ E (λ, ·)`, `∂_w E (λ, ·)`,
`∂²_λw g (λ, ·)` and `∂²_ww g (λ, ·)` are Lipschitz with constants `L_fx`, `L_fy`, `L_gxy`,
`L_gyy`; and `‖∂_w E (λ, w(λ))‖ ≤ C_fy`. Prove (`norm_implicitHypergradient_sub_le`) that for
every `v`

    ‖implicitHypergradient g E v λ − F′(λ)‖ ≤ C ‖v − w(λ)‖,
    C = L_fx + L_fy C_gxy/μ + C_fy (L_gxy/μ + L_gyy C_gxy/μ²).

Route. By 1.2, `F′(λ) = implicitHypergradient g E (w λ) λ`. At every `v` (not only at the
minimizer) the Hessian is coercive: Tau Ceti's `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`
for `g(λ, ·)` at `v` and at `v + s u`, added, gives `(∂_w g (λ, v + s u) − ∂_w g (λ, v))(s u) ≥
μ s² ‖u‖²`; dividing by `s²` and letting `s → 0` gives `∂²_ww g (λ, v)(u, u) ≥ μ ‖u‖²`, so by
Lax–Milgram (`IsCoercive.continuousLinearEquivOfBilin` through `InnerProductSpace.toDual`)
`∂²_ww g (λ, v)` is invertible and `‖(∂²_ww g (λ, v))⁻¹‖ ≤ 1/μ`. Write the difference of the
two values of `∂_λ E − ∂_w E ∘ H⁻¹ ∘ M` as
`Δ∂_λ E − (Δ∂_w E) H(v)⁻¹ M(v) − ∂_w E (H(v)⁻¹ − H(w)⁻¹) M(v) − ∂_w E H(w)⁻¹ ΔM`, with `∂_w E` at
`w(λ)` in the last two terms, and use `H(v)⁻¹ − H(w)⁻¹ = H(v)⁻¹ (H(w) − H(v)) H(w)⁻¹`,
whose norm is at most `L_gyy ‖v − w(λ)‖/μ²`.
(Ghadimi and Wang 2018, Lemma 2.2(a), (2.9), p. 8, with the decomposition (2.11), in `ℝᵐ` under
their Assumptions 1 and 2, which bound `∂_w E` everywhere; here `C_fy` is needed only at
`w(λ)`, and the space is a Hilbert space.)

**Checks.**

- The bound is attained: `g = 3w²/2 − 2λ w`, `E = λ w` on `ℝ`. Then `C_gxy = 2`, `μ = 3`,
  `L_fx = 1` and the other Lipschitz constants are `0`, so `C = 1`; and
  `implicitHypergradient g E v λ − F′(λ) = v + 2λ/3 − 4λ/3 = v − w(λ)` exactly.

*Needs:* 1.2; Tau Ceti `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`, `spatialFDeriv`; Mathlib
`ContinuousLinearMap.inverse`, `IsCoercive.continuousLinearEquivOfBilin`,
`InnerProductSpace.toDual`.

### 2.3 The hypergradient is Lipschitz

Under the hypotheses of 2.2 holding at every hyperparameter, with `‖∂_w E‖ ≤ C_fy` everywhere,
assume moreover that `∂_λ E (·, v)`, `∂_w E (·, v)`, `∂²_λw g (·, v)` and `∂²_ww g (·, v)` are
Lipschitz in the hyperparameter, uniformly in `v`, with constants `L̄_fx`, `L̄_fy`, `L̄_gxy`,
`L̄_gyy` (`Lfx'`, `Lfy'`, `Lgxy'`, `Lgyy'` in Lean). Prove (`norm_hypergradient_sub_le`) that,
with `ℓ = C_gxy/μ`,

    ‖F′(λ) − F′(λ′)‖ ≤ L_F ‖λ − λ′‖,
    L_F = L̄_fx + L_fx ℓ + (L̄_gxy + L_gxy ℓ) C_fy/μ + C_gxy (L̄_gyy + L_gyy ℓ) C_fy/μ²
          + ℓ (L̄_fy + L_fy ℓ).

Route. By the mean value inequality (`Convex.norm_image_sub_le_of_norm_fderiv_le`) and
`‖∂²_λw g‖ ≤ C_gxy`, the derivative of `g` in the weights is `C_gxy`-Lipschitz in the
hyperparameter, so 2.1 gives `‖w(λ) − w(λ′)‖ ≤ ℓ ‖λ − λ′‖`. Along the curve `λ ↦ (λ, w(λ))`
each of the four partial derivatives varies by at most `(L̄ + L ℓ) ‖λ − λ′‖` with its own pair
of constants, and `F′ = ∂_λ E − ∂_w E ∘ H⁻¹ ∘ M` by 1.2; expand the difference of the products as
in 2.2, with `‖H⁻¹‖ ≤ 1/μ`, `‖M‖ ≤ C_gxy` and `‖∂_w E‖ ≤ C_fy`. (This corrects Ghadimi and Wang
2018, Lemma 2.2(c), (2.10), p. 8, whose proof is "similar to part a)". Their constant
`L_f = (L̄_fy + C) C_gxy/μ + L_fx + C_fy (L̄_gxy C_fy/μ + L̄_gyy C_gxy/μ²)`, with `C` of 2.2, has
two defects: `L_fx` stands where `L̄_fx`, the Lipschitz constant of `∂_λ E` in the
hyperparameter, must stand (their Assumptions 1–2 do not bound `L̄_fx`), and the `L̄_gxy` term
carries `C_fy²` where `C_fy` must stand; expanded, `L_F − L_f` is exactly
`L̄_fx − L_fx + L̄_gxy C_fy (1 − C_fy)/μ`. The statement and its route are proved here.)

**Checks.**

- The printed constant is false: `E = λ²/2`, `g = w²/2` on `ℝ` (and on `[0, 1]`, their
  setting). Every constant of their Assumptions 1–2 may be taken `1/100`, except `μ = L_g = 1`;
  their `L_f` is then `1020401/10⁸`, but `F′(λ) = λ` has Lipschitz constant `1`. With the true
  constants (`L̄_fx = 1`, all others `0`, `μ = 1`), `L_F = 1`.
- The `C_fy²` defect alone: `E = w/10`, `g = w²/2 − λ² w/2` on their `X = [0, 1]`, where
  `∂_λ E = 0`. There `C_gxy = L̄_gxy = 1`, `C_fy = 1/10`, `μ = L_g = 1`, and every other constant
  may be taken `1/100`; their `L_f` is `53/1000`, but `w(λ) = λ²/2` and `F′(λ) = λ/10` has
  Lipschitz constant `1/10`.
- `g = 3w²/2 − 2λ w`, `E = λ²/2 + w`: `F′(λ) = λ + 2/3` has Lipschitz constant `1`; here
  `C_gxy = 2`, `μ = 3`, `C_fy = 1`, `L̄_fx = 1` and the other constants are `0`, and `L_F = 1`.
- Second derivatives that vary: `g = h(w − λ/2)` with `h(u) = u²/2 + log(1 + u²)/4`, and
  `E = log(1 + w²)/2 + λ²/2`, on `ℝ`. Here `h″(u) = 1 + (1 − u²)/(2(1 + u²)²)` takes values
  in `[15/16, 3/2]` (minimum at `u² = 3`, maximum at `0`) and `h‴(u) = u(u² − 3)/(1 + u²)³` has
  `|h‴| ≤ τ = 3/8 + √2/4` (attained at `u = ±(√2 − 1)`), so `μ = 15/16`, `C_gxy = 3/4`,
  `L_gyy = τ`, `L̄_gyy = L_gxy = τ/2`, `L̄_gxy = τ/4`, `C_fy = 1/2`, `L_fy = 1`, `L̄_fx = 1`,
  `L_fx = L̄_fy = 0`, and `ℓ = 4/5`. Then `w(λ) = λ/2`, `F′(λ) = λ(λ² + 5)/(λ² + 4)`, and
  `F″` has maximum `5/4` (at `λ = 0`), while `L_F = 989/500 + 169√2/750`, which lies between
  `229/100` and `23/10`.

*Needs:* 1.2, 2.1, 2.2's decomposition; Mathlib `Convex.norm_image_sub_le_of_norm_fderiv_le`.

### Examples

- For `g = ½ ⟪A w, w⟫ − ⟪B λ, w⟫` with a constant self-adjoint `A ≥ μ` and a constant `B`, the
  second derivatives of `g` are constant: the terms with `L_gxy`, `L_gyy`, `L̄_gxy`, `L̄_gyy`
  drop out of 2.2 and 2.3, and `C_gxy = ‖B‖`.

### Dependencies

2.1: Tau Ceti, Mathlib. 2.2: 1.2. 2.3: 1.2, 2.1, 2.2.

## Layer 3: approximate hypergradients

### 3.1 The gradient step is a contraction

Let `W` be a Hilbert space, `f` `μ`-strongly convex and `K`-smooth (`LipschitzSmoothWith ℝ K f`)
with `0 < μ ≤ K`, and `0 < α` with `α K < 2`. Prove that `gradientStep f α` is a contraction with
constant `max |1 − αμ| |1 − αK|` (`contractingWith_gradientStep`).

Route. `h = f − μ/2 ‖·‖²` is convex (Mathlib `strongConvexOn_iff_convex`), and its Taylor
remainder is that of `f` minus `μ/2 ‖y − x‖²`, which lies in `[0, (K − μ)/2 ‖y − x‖²]`, so `h`
is `(K − μ)`-smooth (the lower bound `0` is the first-order inequality of the convex
differentiable `h`, Tau Ceti's `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` with modulus `0`).
For `K > μ`, FirstOrderOptimization 1.2
(`ConvexOn.norm_gradient_sub_sq_le_inner`) gives cocoercivity of `∇h`: with `d = x − y` and
`e = ∇h x − ∇h y`, `‖e‖²/(K − μ) ≤ ⟪e, d⟫`, hence also `‖e‖ ≤ (K − μ) ‖d‖`. The gradient step
moves `d` to `(1 − αμ) d − α e`. If `1 − αμ ≥ 0`, its squared norm is at most
`(1 − αμ)² ‖d‖² + (α² − 2α(1 − αμ)/(K − μ)) ‖e‖²`, linear in `‖e‖² ∈ [0, (K − μ)² ‖d‖²]`, and its
values at the two ends are `(1 − αμ)² ‖d‖²` and `(1 − αK)² ‖d‖²`. If `1 − αμ < 0`, the
Cauchy–Schwarz inequality gives the bound `((αμ − 1) + α(K − μ))² ‖d‖² = (αK − 1)² ‖d‖²`. For
`K = μ`, `h` is affine, `∇h` is constant and the step is `x ↦ (1 − αμ) x + c`. The constant is
below `1` because `0 < αμ ≤ αK < 2`. (Grazzi et al. 2020, Appendix B, p. 15, state this for `C²`
functions on `ℝᵈ` without proof. For `α ≤ 2/(μ + K)` the weaker constant
`(1 − 2αμK/(μ + K))^(1/2)` follows by expanding the square and using FirstOrderOptimization 1.3,
`StrongConvexOn.inner_gradient_sub_ge`. The statement for the full range and its route are
proved here.)

**Checks.**

- `f = (x₁² + 4x₂²)/2`, `μ = 1`, `K = 4`: the gradient step is `I − α diag(1, 4)`, whose exact
  Lipschitz constant is `max |1 − α| |1 − 4α|`: `7/8, 3/4, 3/5, 4/5` for
  `α = 1/8, 1/4, 2/5, 9/20`, equal to the theorem's constant, so the constant is sharp; the
  constant `(1 − 2αμK/(μ + K))^(1/2)` of the restricted range has squares `4/5, 3/5, 9/25` for
  the first three, and for `α = 9/20 > 2/(μ + K)` it is not available.
- `α K < 2` is needed: at `α = 1/2 = 2/K` the constant is `1`. For `g = w²/2 − λ w` and the step
  `w − α(w − λ)`, the derivatives in `λ` of the iterates from `0` are `2, 0, 2, 0, …` for
  `α = 2` and `3, −3, 9, −15, …, −1023` for `α = 3`: they do not converge.
- `μ ≤ K` is needed in the zero space, where every function is `μ`-strongly convex and
  `K`-smooth for all `μ, K`: with `μ = 3`, `K = 1`, `α = 1` the constant is `2`.

*Needs:* FirstOrderOptimization 1.1 (`LipschitzSmoothWith`, copied), Layer 2 (`gradientStep`,
copied), 1.2 (`ConvexOn.norm_gradient_sub_sq_le_inner`), and for the restricted range 1.3
(`StrongConvexOn.inner_gradient_sub_ge`); Mathlib `strongConvexOn_iff_convex`,
`ContractingWith`; Tau Ceti `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`.

### 3.2 Iterative differentiation

Define `unrolled Φ w₀ t λ = (Φ(λ, ·))^[t] w₀`. Let `Λ`, `W` be Banach spaces, `Φ` `C¹` with
every `Φ(λ, ·)` a `q`-contraction, `E` differentiable, `w = fixedPointMap Φ hc`, and at a fixed
`λ`: `‖w(λ)‖ ≤ D`; `‖∂_w E (λ, v)‖ ≤ L_E` and `‖∂_λ Φ (λ, v)‖ ≤ L_Φ` for `‖v‖ ≤ 2D`; and
`∂_w Φ (λ, ·)`, `∂_λ Φ (λ, ·)`, `∂_w E (λ, ·)`, `∂_λ E (λ, ·)` Lipschitz with constants `ν₁`,
`ν₂`, `η₁`, `η₂`. Put

    c₁ = (η₂ + η₁ L_Φ/(1 − q)) D,   c₂ = (ν₂ + ν₁ L_Φ/(1 − q)) L_E D,   c₃ = L_E L_Φ/(1 − q).

Prove (`norm_fderiv_unrolled_sub_le`) that for every `t ≥ 0`, with `w_t = unrolled Φ 0 t`,

- `‖w_t′(λ) − w′(λ)‖ ≤ (ν₂ + ν₁ L_Φ/(1 − q)) D t q^(t−1) + L_Φ q^t/(1 − q)`;
- `‖F_t′(λ) − F′(λ)‖ ≤ (c₁ + c₃) q^t + c₂ t q^(t−1)`, where `F_t(λ) = E(λ, w_t(λ))`.

Route. Differentiating `w_t = Φ(·, w_(t−1))` and `w = Φ(·, w)` (1.1) gives
`Δ′_t ≤ q Δ′_(t−1) + p Δ_(t−1)` with `p = ν₂ + ν₁ L_Φ/(1 − q)`, `Δ_t = ‖w_t(λ) − w(λ)‖ ≤ q^t D`
(the `t`-th iterate is `q^t`-Lipschitz, `LipschitzWith.iterate`, and fixes `w(λ)`) and
`Δ′_t = ‖w_t′ − w′‖`, using `‖∂_w Φ‖ ≤ q` (`norm_fderiv_le_of_lipschitz`) and
`‖w′‖ ≤ L_Φ/(1 − q)` (1.1). The recursion
`u_k ≤ q u_(k−1) + τ_(k−1)`, `τ_k ≤ q τ_(k−1)` gives `u_k ≤ q^k u_0 + k q^(k−1) τ_0` (Grazzi et
al., Lemma A.1(ii), p. 12, an induction), and `Δ′_0 = ‖w′‖`. For the hypergradient, split
`F_t′ − F′` into `Δ∂_λ E`, `∂_w E (w_t) ∘ (w_t′ − w′)` and `(Δ∂_w E) ∘ w′`, and use
`‖w_t‖ ≤ (1 + q^t) D ≤ 2D`. (Grazzi et al. 2020, Proposition 2.1 and Theorem 2.1, p. 4, proofs
pp. 12–13, in `ℝᵈ` for `t ≥ 1` with the bound written `(c₁ + c₂ t/q + c₃) q^t`; here in Banach
spaces, division-free, and for `t = 0` as well, where both bounds still hold: the first because
`‖w′‖ ≤ L_Φ/(1 − q)`, the second because `F_0′ − F′ = ∂_λ E (λ, 0) − ∂_λ E (λ, w) − ∂_w E ∘ w′`
with `‖∂_λ E (λ, 0) − ∂_λ E (λ, w)‖ ≤ η₂ D ≤ c₁` and `‖∂_w E ∘ w′‖ ≤ c₃`.)

A constant start `w₀` reduces to the start `0` by the translation `w ↦ w + w₀`, with the norm
conditions centred at `w₀`.

**Checks.**

- Quadratic, exact: `g = a w²/2 − λ w`, `Φ = w − α(a w − λ)`, `E = (w − 1/2)²/2 + λ²/2` at
  `λ = 3`, so `ν₁ = ν₂ = 0` and `c₂ = 0`. For `(a, α) = (2, 1/4), (2, 3/4), (1, 1/3)`
  (`q = 1/2, 1/2, 2/3`; the second overshoots, `1 − αa < 0`) both bounds hold for
  `t = 0, …, 14`; at `(2, 1/4)`, `t = 5` the hypergradient error is `157/4096 ≤ 5/64`.
- Not quadratic, exercising `c₂`: `Φ(λ, w) = λ + w/(2(1 + w²))` at `λ = 3/4`, whose fixed point
  is `1`; `q = 1/2` (the derivative `(1 − w²)/(1 + w²)²` of `w/(1 + w²)` has absolute value at
  most `1`) and `ν₁ = 1` (its derivative `2w(w² − 3)/(1 + w²)³` has absolute value at most `2`;
  both checked by root counts of the defect polynomials), `ν₂ = 0`, `L_Φ = 1`, `D = 1`, with
  `E = (w − 2)²/2 + λ w`, `η₁ = η₂ = 1`, `L_E = 13/4`. The exact iterates satisfy both bounds for
  `t = 0, …, 8`; at `t = 2` the derivative error is `56/625`.
- The contraction cannot be dropped: for `g = w⁴/4 − λ w` and `Φ = w − (w³ − λ)/2`, the unrolled
  derivatives at `λ = 0` from `0` are `t/2` (`1/2, 1, 3/2, 2, 5/2`), which diverge, while
  `fderiv` of the minimizer `λ^(1/3)` at `0` is the junk value `0`.
- Non-unique inner minimizers: for `g = (w₁ + w₂ − λ)²/2` the iterates from `0` converge to the
  minimum-norm minimizer, with derivative `(1/2, 1/2)`, which is not an implicit-function
  object; the Hessian is singular and the formula of 1.2 would use the inverse's value `0`.

*Needs:* 1.1 (`fixedPointMap`, the derivative and the bound on `(1 − ∂_w Φ)⁻¹`); Mathlib
`HasFDerivAt.comp`, `LipschitzWith.iterate`, `ContractingWith.fixedPoint_isFixedPt`,
`norm_fderiv_le_of_lipschitz`; Tau Ceti
`spatialFDeriv`, `TauCeti.fderiv_slice_right`, `TauCeti.fderiv_slice_left`.

### 3.3 The truncated Neumann series at an approximate fixed point

Define the truncated Neumann hypergradient with `k` terms at `(λ, v)`,

    neumannHypergradient Φ E k v λ = ∂_λ E + ∂_w E ∘ (Σ_{i<k} (∂_w Φ)^i) ∘ ∂_λ Φ   (all at (λ, v)).

Under the hypotheses of 3.2, let `0 ≤ ρ ≤ 1` and `‖v − w(λ)‖ ≤ ρ D`. Prove
(`norm_neumannHypergradient_sub_le`) that for every `k ≥ 0`

    ‖neumannHypergradient Φ E k v λ − F′(λ)‖ ≤ (c₁ + c₂ (1 − q^k)/(1 − q)) ρ + c₃ q^k.

In particular (`ρ = 0`, `v = w(λ)`), the `k`-term truncation at the exact fixed point is within
`L_E L_Φ q^k/(1 − q)` of the hypergradient.

Route. `‖v‖ ≤ 2D`, so `‖∂_w E (λ, v)‖ ≤ L_E`. With `u_k = (Σ_{i<k} A^i) ∘ B`, `A = ∂_w Φ (λ, v)`,
`B = ∂_λ Φ (λ, v)`, one has `u_k = A ∘ u_(k−1) + B` and `w′ = A_* ∘ w′ + B_*` at `w(λ)`, so
`‖u_k − w′‖ ≤ q ‖u_(k−1) − w′‖ + p ρ D`, and Lemma A.1(i) (with a constant `τ`) gives
`‖u_k − w′‖ ≤ q^k L_Φ/(1 − q) + p ρ D (1 − q^k)/(1 − q)`. Then split as in 3.2. For `ρ = 0` the
error is `∂_w E ∘ (Σ_{i<k} A^i − (1 − A)⁻¹) ∘ B`, and Mathlib's
`NormedRing.inverse_one_sub_nth_order'` writes the middle factor as `−A^k (1 − A)⁻¹`, of norm at
most `q^k/(1 − q)`. (Grazzi et al. 2020, Theorem 2.4, p. 6, with Proposition A.2, p. 15, proofs
printed, for the iterates of an algorithm with `‖w_t − w‖ ≤ ρ(t) ‖w‖`; the proof uses only
`‖v − w(λ)‖ ≤ ρ D` and `‖v‖ ≤ 2D`, so here `v` is any point with that property, and `k = 0` is
included.)

**Checks.**

- `H = diag(1, 4)`, `α = 1/4`, `Φ = w − α(H w − B λ)`: the error of the truncated series,
  `H⁻¹ − α Σ_{i<K} (I − αH)^i = (I − αH)^K H⁻¹`, is `diag((3/4)^K, 0)` for `K = 1, …, 5` and
  `diag(1, 1/4)` for `K = 0`, of norm `(3/4)^K`, so with `∂_w E` and `B` along the first
  coordinate the bound `L_E L_Φ q^K/(1 − q)` (`q = 3/4`, `L_Φ = α‖B‖`) is attained.
- The non-quadratic example of 3.2 at `v = 1, 3/2, 1/2, 2, 0` (`ρ = |v − 1|`): the bound holds
  for `k = 0, …, 8`.

*Needs:* 1.1, 3.2's constants and Lemma A.1; Mathlib `NormedRing.inverse_one_sub_nth_order'`,
`ContinuousLinearMap.ringInverse_eq_inverse`; Tau Ceti `NormedRing.norm_inverse_one_sub_le`,
`spatialFDeriv`.

### 3.4 Unrolling from a fixed point is the truncated Neumann series

Let `Λ`, `W` be normed spaces, `w₀` a fixed point of `Φ(λ₀, ·)`, and `Φ`, `E` differentiable at
`(λ₀, w₀)`. Prove (`hasFDerivAt_unrolled_of_isFixedPt`) that for every `t ≥ 0`,
`unrolled Φ w₀ t` has derivative `(Σ_{j<t} (∂_w Φ)^j) ∘ ∂_λ Φ` at `λ₀` (at `(λ₀, w₀)`), and
`λ ↦ E(λ, unrolled Φ w₀ t λ)` has derivative `neumannHypergradient Φ E t w₀ λ₀`.

Route. Induction on `t`: every iterate takes the value `w₀` at `λ₀`, so the chain rule for
`w_(t+1) = Φ(·, w_t)` at `λ₀` uses `Φ` only at `(λ₀, w₀)`, and `w_(t+1)′ = ∂_λ Φ + ∂_w Φ ∘ w_t′`.
For gradient steps `Φ = w − α ∂_w g` at a minimizer this is
`−α (Σ_{j<t} (1 − α ∂²_ww g)^j) ∘ ∂²_λw g`; when every `Φ(λ, ·)` is a contraction, 3.3 (with
`ρ = 0`) shows that it tends to `w′(λ₀)` of 1.1.
(Lorraine, Vicol and Duvenaud 2019, Theorem 2, p. 5, display (7), and its appendix version, p. 16,
for unrolled gradient steps from an optimum; the main-text display sums over `j < i` for
`w_(i+1)`, one term short, and the appendix has the right range `j ≤ i`. Here for any
differentiable `Φ` and any fixed point; the induction is written here.)

**Checks.**

- `g = w⁴/4 + w²/2 − λ w` at `λ₀ = 2`, minimizer `w₀ = 1`, Hessian `4`, step `α = 1/8`: the
  derivatives of the iterates, computed by differentiating the composed maps symbolically, are
  `1/8, 3/16, 7/32, 15/64`, equal to `α Σ_{j<i} (1/2)^j`, tending to `1/4 = 1/H`. The main-text
  index range would give `0` for the first iterate.
- The fixed-point hypothesis is needed: `Φ(λ, w) = λ w + w/2` at `λ₀ = 0` from `w₀ = 1`, which is
  not fixed: the second iterate has derivative `1`, while the formula gives `3/2`.

*Needs:* 1.1 (`parameterFDeriv`), 3.2 (`unrolled`), 3.3 (`neumannHypergradient`); Mathlib
`HasFDerivAt.comp`, `Function.iterate_succ_apply'`.

### 3.5 DARTS' first-order and one-step architecture gradients

Let `W` be a Hilbert space, `Λ` a Banach space, `g` `C²`, every `g(λ, ·)` `μ`-strongly convex and
`K`-smooth with `0 < μ ≤ K`, `E` differentiable, `w` a map of minimizers, `0 < ξ` with `ξK < 2`,
`q = max |1 − ξμ| |1 − ξK|`, and `Φ(λ, v) = gradientStep (g(λ, ·)) ξ v`. If
`‖∂_w E (λ, w(λ))‖ ≤ L_E` and `‖∂_λ Φ (λ, w(λ))‖ ≤ L_Φ`, prove (`norm_darts_sub_le`):

- the first-order architecture gradient `∂_λ E (λ, w(λ))` (DARTS with `ξ = 0`) satisfies
  `‖∂_λ E (λ, w(λ)) − F′(λ)‖ ≤ L_E L_Φ/(1 − q)`;
- the one-step architecture gradient, the derivative at `λ` of `λ′ ↦ E(λ′, Φ(λ′, w(λ)))` with the
  weights held at `w(λ)` (DARTS (6), whose chain-rule expansion is (7)), satisfies
  `‖one-step − F′(λ)‖ ≤ L_E L_Φ q/(1 − q)`.

Route. By 3.1 each `Φ(λ, ·)` is a `q`-contraction; its fixed point is the minimizer, where the
gradient vanishes, so `fixedPointMap = w`, and `Φ` is `C¹` because `g` is `C²`. By 1.1, `F′(λ)` is
the exact fixed-point hypergradient `∂_λ E + ∂_w E ∘ (1 − A)⁻¹ ∘ B`, with `A = ∂_w Φ` and
`B = ∂_λ Φ` at `(λ, w(λ))`, and `‖(1 − A)⁻¹‖ ≤ 1/(1 − q)`; moreover `‖A‖ ≤ q`, because `A` is
the derivative of the `q`-Lipschitz slice `Φ(λ, ·)` (`TauCeti.fderiv_slice_right`,
`norm_fderiv_le_of_lipschitz`, as in the route of 1.1). The first-order gradient
is `neumannHypergradient Φ E 0` and, by 3.4 with `t = 1`, the one-step gradient is
`neumannHypergradient Φ E 1` at `(λ, w(λ))`. Their errors are `−∂_w E ∘ (1 − A)⁻¹ ∘ B` and,
since `1 − (1 − A)⁻¹ = −A (1 − A)⁻¹`, `−∂_w E ∘ A ∘ (1 − A)⁻¹ ∘ B`, of norms at most
`L_E L_Φ/(1 − q)` and `L_E L_Φ q/(1 − q)`. Only the bounds at `(λ, w(λ))` are used, so this
route does not go through 3.3, which assumes bounds on a ball and Lipschitz constants.
(Liu, Simonyan and Yang 2019, §2.3, displays (5)–(7), p. 4, which state no theorem; the bounds
are proved here.) DARTS remarks that (6) reduces to `∇_α L_val(w, α)` at a local optimum; this
holds for the weights at which `L_val` is evaluated, not for the derivative: at an optimum the
one-step gradient differs from the first-order gradient by `∂_w E ∘ ∂_λ Φ`, which need not vanish
(Check below).

**Checks.**

- DARTS' Figure 2 example (p. 5): `E = L_val = λ w − 2λ + 1`, `g = L_train = w² − 2λ w + λ²`, so
  `μ = K = 2`, `w(λ) = λ`, `F′(λ) = 2λ − 2`, `q = |1 − 2ξ|`, `L_Φ = 2ξ`, `L_E = |λ|`. The one-step
  gradient (6) is `4λξ − 2wξ + w − 2`, equal to (7), and at `w = λ` it is `(1 + 2ξ)λ − 2`; the
  first-order gradient is `λ − 2`. Their difference at the optimum is `2ξλ`, not `0`. The zeros
  are `λ = 2` (first-order), `λ = 2/(1 + 2ξ)` (one-step) and `λ = 1` (the true optimum).
- Both bounds are attained: at `λ = 3` the first-order error is `3 = L_E L_Φ/(1 − q)` for
  `ξ ≤ 1/2`, and the one-step error is `3/2, 1, 0 = L_E L_Φ q/(1 − q)` for `ξ = 1/4, 1/3, 1/2`.
  For `ξ = 3/4` (`q = 1/2`) the errors are `3 ≤ 9` and `3/2 ≤ 9/2`.

*Needs:* 1.1, 3.1, 3.3 (`neumannHypergradient`), 3.4; FirstOrderOptimization 1.1 and Layer 2 (copied
`LipschitzSmoothWith`, `gradientStep`); Mathlib `IsLocalMin.fderiv_eq_zero`, `gradient`,
`norm_fderiv_le_of_lipschitz`; Tau Ceti `TauCeti.fderiv_slice_right`.

### Examples

- With `Φ(λ, w) = w − ξ ∇_w g(λ, w)`, 3.2 is the error of differentiating through `t` training
  steps from `0`, and 3.3 with `v = w_t(λ)`, `ρ = q^t` (since `‖w_t − w‖ ≤ q^t ‖w‖`) and `k = t`
  is the error of `t` Neumann terms at the weights reached. The two bounds differ only in the
  `c₂` term, `c₂ q^t (1 − q^t)/(1 − q)` against `c₂ t q^(t−1)`, and `q(1 − q^t)/(1 − q) < t` for
  `t ≥ 1` (Grazzi et al., §2.3), so the bound of 3.3 is never larger.

### Dependencies

3.1: FirstOrderOptimization 1.1, 1.2, 1.3, Layer 2. 3.2: 1.1. 3.3: 1.1, 3.2. 3.4: 1.1, 3.2, 3.3
(definitions). 3.5: 1.1, 3.1, 3.3 (definition), 3.4.

## Scope and ownership

This roadmap owns the derivative of parametrized fixed points and of strongly convex argmins as
hypergradient statements, the local branch of nondegenerate inner minimizers with its
hypergradient and quadratic growth (1.3), the Lipschitz bounds of Layer 2, the contraction
property of the gradient step on its full range of step sizes (3.1), and the error bounds of
iterative differentiation, of the truncated Neumann series and of DARTS' approximations.

- Mathlib owns the implicit function theorem, the contraction mapping theorem and Neumann series;
  they are cited, never restated. Tau Ceti owns the partial derivative `spatialFDeriv`, the slice
  and graph chain rules, the bound for `(1 − x)⁻¹`, the first-order inequality of strongly convex
  functions, and, for `C³` families, the continuation of a nondegenerate critical point
  (`TauCeti.IsNondegenerateCriticalPoint.exists_contDiffAt_criticalPoint_continuation`); 1.3
  differs from it by asking for `C²` only and by stating the derivative of the branch, the
  hypergradient and the quadratic growth.
- FirstOrderOptimization owns `LipschitzSmoothWith`, `gradientStep`, cocoercivity (1.2), the
  existence of minimizers of strongly convex functions (1.3) and the rates of gradient descent;
  3.1 rests on its 1.2 and states the contraction for every step size below `2/K`, which its 3.4
  uses inside a route for `η ≤ 2/(μ + K)` without declaring it.
- NonlinearProgrammingOptimality owns the second-order sufficient condition, used above with no
  constraints. It leaves the sensitivity of solutions and multipliers to parameters outside its
  scope; this roadmap treats the sensitivity of solutions only for unconstrained inner problems.
- Inner problems with constraints (a box, a simplex, a cone), whose solution maps need
  sensitivity analysis of Karush–Kuhn–Tucker systems or implicit function theorems for
  generalized equations, are not treated here. Neither are stochastic hypergradient estimators,
  the convergence of outer optimization algorithms, finite-difference approximations of
  Hessian–vector products, the existence and convergence of minimizers of approximate bilevel
  problems (Franceschi et al. 2018, Theorems 3.1–3.2), or envelope theorems for value functions of
  consumer theory.
- The algebra of 1.2 also appears as the influence function of an M-functional in
  MathematicalStatisticsAsymptotic (5.3, 9.1), along contamination paths of a distribution and not
  as a hypergradient; nothing is shared.

## Exact supplier contracts

### From Mathlib

- `ContDiffAt.implicitFunction`, `ContDiffAt.hasStrictFDerivAt_implicitFunction`,
  `ContDiffAt.eventually_apply_eq_iff_implicitFunction`, `ContDiffAt.implicitFunction_apply_self`
  (`Mathlib/Analysis/Calculus/ImplicitContDiff.lean`): for `f : E₁ × E₂ → F` on complete spaces
  over `RCLike 𝕜`, `ContDiffAt 𝕜 n f u` with `n ≠ 0` and `fderiv 𝕜 f u ∘L inr` invertible give
  a function `ψ` with `ψ u.1 = u.2`, strict derivative `−(fderiv f u ∘L inr).inverse ∘L
  (fderiv f u ∘L inl)` at `u.1`, and `f v = f u ↔ ψ v.1 = v.2` for `v` near `u`. Used in 1.1–1.3.
- `ContractingWith`, `ContractingWith.fixedPoint`, `ContractingWith.fixedPoint_unique`,
  `ContractingWith.fixedPoint_isFixedPt` (`Mathlib/Topology/MetricSpace/Contracting.lean`):
  `[Nonempty α] [CompleteSpace α]`; the fixed point is a fixed point and the unique one. Used in
  1.1, 3.2. `LipschitzWith.iterate` (`Mathlib/Topology/EMetricSpace/Lipschitz.lean`): the `n`-th
  iterate of a `K`-Lipschitz map is `K^n`-Lipschitz. Used in 3.2.
- `norm_fderiv_le_of_lipschitz` (`Mathlib/Analysis/Calculus/FDeriv/Basic.lean`): a `C`-Lipschitz
  map has derivatives of norm at most `C`. Used in 1.1, 3.2, 3.5.
- `NormedRing.inverse_one_sub_nth_order'` (`Mathlib/Analysis/Normed/Ring/Units.lean`): for
  `‖t‖ < 1`, `Ring.inverse (1 − t) = Σ_{i<n} t^i + t^n * Ring.inverse (1 − t)`. Used in 3.3.
- `ContinuousLinearMap.ringInverse_eq_inverse`, `ContinuousLinearMap.inverse`
  (`Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Invertible.lean`). Used in 1.1, 3.3.
- `IsCoercive.continuousLinearEquivOfBilin` (`Mathlib/Analysis/InnerProductSpace/LaxMilgram.lean`)
  and `InnerProductSpace.toDual` (`Mathlib/Analysis/InnerProductSpace/Dual.lean`): Lax–Milgram on
  a real Hilbert space. Used in 1.2.
- `IsLocalMin.fderiv_eq_zero` (`Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`). Used in 1.2,
  2.1, 3.5.
- `Convex.norm_image_sub_le_of_norm_fderiv_le` (`Mathlib/Analysis/Calculus/MeanValue.lean`).
  Used in 2.3.
- `strongConvexOn_iff_convex` (`Mathlib/Analysis/Convex/Strong.lean`): on an inner product space,
  `μ`-strong convexity of `f` is convexity of `f − μ/2 ‖·‖²`. Used in 3.1.
- `StrongConvexOn`, `IsMinOn`, `HasFDerivAt.comp`, `Function.iterate_succ_apply'`, `gradient`.

### From Tau Ceti

- `spatialFDeriv` (`TauCeti/Analysis/Calculus/ParametricFDeriv.lean`): `spatialFDeriv F x t =
  (fderiv 𝕜 F (t, x)).comp (inr 𝕜 P E)`, the junk value `0` where `F` is not differentiable. Used
  in every statement.
- `TauCeti.fderiv_slice_left`, `TauCeti.fderiv_slice_right`,
  `HasFDerivAt.fderiv_comp_graph_eq_fderiv_slice_of_fderiv_right_eq_zero`
  (`TauCeti/Analysis/Calculus/FDeriv/Prod.lean`): at a point of joint differentiability the
  derivatives of the slices are the restrictions of the joint derivative; the envelope identity.
  Used in 1.1–1.3, 3.2, 3.5.
- `NormedRing.norm_inverse_one_sub_le` (`TauCeti/Analysis/Normed/Ring/Units.lean`): for
  `‖x‖ < 1`, `‖Ring.inverse (1 − x)‖ ≤ ‖1‖ − 1 + (1 − ‖x‖)⁻¹`. Used in 1.1, 3.3.
- `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` (`TauCeti/Analysis/Convex/Strong.lean`): for
  `f` `m`-strongly convex on `s` with derivative `f′` within `s` at `x ∈ s`, and `y ∈ s`,
  `f x + f′ (y − x) + m/2 ‖y − x‖² ≤ f y`. Used in 1.2, 2.1.
- `TauCeti.IsNondegenerateCriticalPoint.exists_contDiffAt_criticalPoint_continuation`
  (`TauCeti/Analysis/Calculus/Morse/CriticalPointContinuation.lean`): the `C³` continuation of a
  nondegenerate critical point; named in 1.3 and in the scope above for comparison.

The statements import `TauCeti.Analysis.Calculus.ParametricFDeriv`; the root module `TauCeti`
does not re-export these modules.

### From TauCetiRoadmap.FirstOrderOptimization

- 1.1 `LipschitzSmoothWith` (copied verbatim) and Layer 2 `gradientStep` (copied verbatim), on a
  real Hilbert space.
- 1.2 `ConvexOn.norm_gradient_sub_sq_le_inner`: for `0 < K`, `f` convex and `K`-smooth,
  `‖∇f x − ∇f y‖²/K ≤ ⟪∇f x − ∇f y, x − y⟫`. Used in 3.1.
- 1.3 `StrongConvexOn.existsUnique_isMinOn`: a continuous `μ`-strongly convex function with
  `μ > 0` has a unique minimizer. Used in the Conventions to say that maps of minimizers exist.
- 1.3 `StrongConvexOn.inner_gradient_sub_ge`: for `0 < μ`, `f` `μ`-strongly convex and
  `K`-smooth, `μK/(μ + K) ‖x − y‖² + 1/(μ + K) ‖∇f x − ∇f y‖² ≤ ⟪∇f x − ∇f y, x − y⟫`. Named in
  3.1 for the restricted range of step sizes.

### From TauCetiRoadmap.NonlinearProgrammingOptimality

- 3.3 `exists_quadratic_growth_of_lagrangianHessian_pos`, with Layer 1 `feasibleSet`, Layer 2
  `IsKKTMultiplier` and Layer 3 `criticalCone`, `lagrangianHessian`: on a finite-dimensional real
  normed space with finite index types, at a feasible point with objective and active constraints
  `C²`, a Karush–Kuhn–Tucker multiplier and a Lagrangian Hessian positive on the nonzero critical
  directions, there is `σ > 0` with `f x + σ ‖y − x‖² ≤ f y` for feasible `y` near `x`. Used in 1.3
  with the empty index types.

## References

- R. Grazzi, L. Franceschi, M. Pontil, S. Salzo, *On the iteration complexity of hypergradient
  computation*, Proceedings of the 37th International Conference on Machine Learning, PMLR 119,
  2020; arXiv:2006.16218v2 (read; page numbers are those of the arXiv file).
- S. Ghadimi, M. Wang, *Approximation methods for bilevel programming*, arXiv:1802.02246v1, 2018
  (read).
- J. Lorraine, P. Vicol, D. Duvenaud, *Optimizing millions of hyperparameters by implicit
  differentiation*, arXiv:1911.02590v1, 2019 (read).
- H. Liu, K. Simonyan, Y. Yang, *DARTS: Differentiable architecture search*, International
  Conference on Learning Representations 2019; arXiv:1806.09055v2 (read).
- L. Franceschi, P. Frasconi, S. Salzo, R. Grazzi, M. Pontil, *Bilevel programming for
  hyperparameter optimization and meta-learning*, Proceedings of the 35th International
  Conference on Machine Learning, PMLR 80, 2018; arXiv:1806.04910v2 (read; cited only for what
  is not treated).
