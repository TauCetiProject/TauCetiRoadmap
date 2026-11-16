# Roadmap: certified robustness by Lipschitz margins, LipSDP and bound propagation

**Summary.** Develop the mathematics behind certificates that a neural-network classifier cannot
change its prediction under any input perturbation of bounded norm. A certificate is a proof
that the predicted class keeps a strictly positive margin over a whole ball. Three families are
covered. *Lipschitz-margin* certificates turn a Lipschitz bound on the logits into a certified
radius; for affine classifiers the radius is exact and given by a dual norm. *LipSDP*
certificates bound the Lipschitz constant of a network by a semidefinite feasibility condition,
using the fact that the activations are slope-restricted; the condition is never worse than the
product of the layers' operator norms. *Bound-propagation* certificates push an input box
through the network, either as boxes (interval bound propagation) or as linear upper and lower
bounds (CROWN-type linear relaxation). The roadmap ends with rational `LDLᵀ` factorizations
witnessing semidefiniteness, and a worked example in which the four certified radii are computed
and compared.

## Scope and ownership

This roadmap owns:

- the robustness predicate and its basic API;
- Lipschitz-margin certificates in an arbitrary normed input space, with global and per-pair
  constants, and the exact certified radius of an affine classifier;
- Lipschitz bounds for layers and for multilayer perceptrons, and the product bound;
- slope-restricted activations, the incremental quadratic constraint, and the LipSDP
  certificate for one hidden layer and for multilayer perceptrons, with its Schur-complement
  form and its comparison with the product bound;
- interval bound propagation: boxes, affine and monotone-activation layers, soundness and
  coordinatewise exactness per layer, and margin certificates;
- linear relaxations of ReLU and the soundness of one-hidden-layer backward linear bound
  propagation, with its closed-form minimum over an `ℓ∞` ball;
- positive-semidefiniteness certificates by rational `LDLᵀ` factorizations, and their transfer
  from `ℚ` to `ℝ`.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

Out of scope: randomized smoothing and other probabilistic certificates, which need Gaussian
measure and binomial confidence bounds and belong to
[RandomizedSmoothing](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2428); attacks and
lower bounds on the robust radius;
complexity results (computing the exact Lipschitz constant of a ReLU network is NP-hard);
convolutional, residual and attention layers beyond what `MLPSpec` covers; training methods;
and floating-point error in evaluating a network.

## Exact supplier contracts

- [Neuromanifolds](../Neuromanifolds/README.md), Milestone 2, as implemented in Tau Ceti under
  `TauCeti/Geometry/Neuromanifold`: the specification `TauCeti.Neuromanifold.MLPSpec`, its
  parameters `MLPSpec.Parameters`, its prefix evaluation `MLPSpec.evalPrefix` with
  `evalPrefix_succ`, its realization `MLPSpec.realize`, its layer activation
  `MLPSpec.layerActivation`, the dense layer `TauCeti.Neuromanifold.dense` and the activation
  layers `reluActivation` and `tanhActivation`.
- Mathlib: `LipschitzWith`, `EuclideanSpace` and `WithLp.equiv`, the sup norm on `Fin n → ℝ`,
  `Matrix.PosSemidef` with the Schur-complement lemmas `Matrix.PosDef.fromBlocks₁₁` and
  `Matrix.PosDef.fromBlocks₂₂`, and the `ℓ²` operator norm on matrices
  (`Matrix.Norms.L2Operator`).

## How to read the build

Each layer opens with its definitions. Each numbered target ends with its source locator in
parentheses, or says that it is proved here, then lists its **Checks** (three or more
discriminating tests that a wrong convention would fail) and a *Needs:* line naming the targets
and suppliers it uses. `Suggested.lean` states the headline theorems of Layers 1–6 against the
pinned APIs.

## Conventions

- A **classifier** with `k` classes on a set `X` is a map `f : X → (Fin k → ℝ)`, the logits. It
  **predicts** `i` at `x` when `f x j < f x i` for all `j ≠ i`.
- `f` is **certified on** `S ⊆ X` **with class** `i` when it predicts `i` at every point of `S`.
  The **certified radius** of `f` at `x` with class `i`, in a metric space, is the supremum in
  `ℝ≥0∞` of the `r : ℝ≥0` such that `f` is certified on `Metric.ball x r` with class `i`. It is
  `⊤` when every ball is certified, for instance when `k = 1`.
- The `ℓ²` input space is `EuclideanSpace ℝ (Fin n)`. The `ℓ∞` input space is `Fin n → ℝ`,
  whose Mathlib norm is the sup norm. The closed `ℓ∞` ball of radius `ε ≥ 0` about `x` is the
  box `Set.Icc (x - ε) (x + ε)`.
- Logits are measured in `ℓ²` when a Lipschitz constant is used: the logit map is then
  `f : X → EuclideanSpace ℝ (Fin k)`.
- The **gap** of `i` over `j` is `g_{ij}(x) = f x i - f x j`, and the **margin** at `x` is
  `min_{j ≠ i} g_{ij}(x)`.
- For a matrix `W`, `‖W‖₂` is the `ℓ²` operator norm and `|W|` is the entrywise absolute value.
  `Wᵀ` is the transpose, `diag t` the diagonal matrix of a vector `t`, and `⪰ 0` means
  `Matrix.PosSemidef`.
- A **one-hidden-layer network** `oneHidden W₁ b₁ W₂ b₂ σ` is
  `f(x) = W₂ σ(W₁ x + b₁) + b₂` with `W₁ ∈ ℝ^{h×n}`, `W₂ ∈ ℝ^{k×h}` and `σ` applied
  coordinatewise. It is the realization of an `MLPSpec ℝ 2`.
- An activation `σ : ℝ → ℝ` is **slope-restricted in** `[α, β]` (`SlopeRestricted α β σ`),
  with `α ≤ β`, when
  `0 ≤ (σ a - σ b - α (a - b)) (β (a - b) - (σ a - σ b))` for all `a, b`. For `a ≠ b` this says
  that the difference quotient of `σ` lies in `[α, β]`.

**Checks** (conventions).

- `oneHidden` with `W₁ = W₂ = 1`, `b₁ = b₂ = 0` and ReLU is `relu` on `ℝ`.
- `t ↦ -t` is not slope-restricted in `[0, 1]`: `a = 1`, `b = 0` give `(-1)(2) = -2`.
- For `k = 1` the certified radius is `⊤` at every point.

## Layer 1: margin certificates

### 1.1 The robustness predicate

Define `CertifiedOn f S i`. Prove that it is antitone in `S`, that it holds on `∅`, that it is
closed under unions of sets, and that a certificate on `Metric.ball x r` for `r > 0` implies
that `f` predicts `i` at `x`. Transported along `WithLp.equiv`, an `ℓ∞` certificate of radius
`r` implies an `ℓ²` certificate of radius `r`, since `‖v‖_∞ ≤ ‖v‖₂`.

(Proved here.)

**Checks.**

- The constant classifier `f x = (1, 0)` is certified on every set with class `0`, and with
  class `1` only on `∅`.
- At a tie `f x = (0, 0)`, `f` is not certified on `{x}` with any class.
- `CertifiedOn f ∅ i` holds for every `f` and `i`.
- For the identity of `EuclideanSpace ℝ (Fin 2)` and class `0`, `CertifiedOn` holds on the
  open ball about `(1, 0)` of radius `r` exactly when `r ≤ 1/√2`, the distance to the tie line
  `x₀ = x₁`; a closed ball fails at `r = 1/√2`.

*Needs:* none.

### 1.2 Lipschitz-margin certificates

Let `X` be a seminormed additive group and `f : X → EuclideanSpace ℝ (Fin k)`.

- **Coordinate gaps.** `|v i - v j| ≤ √2 ‖v‖₂` for `i ≠ j`, with equality at `v = e_i - e_j`
  (`abs_sub_le_sqrt_two_mul_norm`).
- **Global constant.** If `f` is `L`-Lipschitz, every gap at `x` is at least `m > 0`, and
  `√2 L ε ≤ m`, then `f` is certified on `Metric.ball x ε` with class `i`
  (`certifiedOn_ball_of_lipschitzWith`).
- **Per-pair constants.** If each gap `g_{ij}` is `L_{ij}`-Lipschitz, `0 < g_{ij}(x)` and
  `L_{ij} ε ≤ g_{ij}(x)` for all `j ≠ i`, then `f` is certified on `Metric.ball x ε`
  (`certifiedOn_ball_of_lipschitzWith_gap`). If `f` is
  `L`-Lipschitz then every `g_{ij}` is `√2 L`-Lipschitz, so the per-pair radius is at least the
  global one.
- **Output norms.** For logits measured in the sup norm, the constant `√2` becomes `2`, and
  equality is attained.

(Tsuzuku–Sato–Sugiyama, Proposition 1, eq. (2), p. 3, for the global constant, and
Proposition 2, eq. (3), p. 3, for the per-pair constants; the sup-norm form is proved here.)

**Checks.**

- `v = e_i - e_j` attains `|v i - v j| = √2 ‖v‖₂`.
- The identity of `EuclideanSpace ℝ (Fin 2)`, with `L = 1`, `x = (1, 0)` and `i = 0`, has margin
  `1`, certified radius `1/√2`, and exact radius `1/√2`: the global certificate is sharp here.
- A constant `f` with every gap at least `m > 0` is `0`-Lipschitz and certified on every ball.

*Needs:* 1.1.

### 1.3 Affine classifiers

Let `X` be a real normed space and `f x j = φ_j x + b_j` with `φ_j ∈ X →L[ℝ] ℝ`, and write
`a_j = φ_i - φ_j`. For `r > 0`, `f` is certified on `Metric.ball x r` with class `i` if and
only if, for every `j ≠ i`, `0 < g_{ij}(x)` and `r ‖a_j‖ ≤ g_{ij}(x)`, where `‖a_j‖` is the
operator norm (`certifiedOn_ball_affine_iff`). For `f(x) = W x + b` with rows `W_j`, the dual
norm `‖·‖_*` of the functional given by the row `a = W_i - W_j` is:

- in `ℓ²`, `‖a‖_* = ‖a‖₂`, by `Matrix.l2_opNorm_def` for the `1 × n` matrix of `a`;
- in `ℓ∞`, `‖a‖_* = Σ_p |a_p|`, by `Matrix.linfty_opNorm_eq_opNorm` for the `1 × n` matrix of
  `a`.

So the certified radius of an affine classifier is exactly `min_{j ≠ i} g_{ij}(x) / ‖a_j‖_*`,
with the convention that a term with `a_j = 0` and `g_{ij}(x) > 0` imposes no constraint.

(Proved here.)

**Checks.**

- The identity of `ℝ²` at `x = (1, 0)` with class `0`: the radius is `1/√2` in `ℓ²` and `1/2` in
  `ℓ∞`.
- A constant classifier with positive gaps has `a_j = 0` for all `j`, so every radius is
  certified.
- At a point with `g_{ij}(x) = 0` no radius `r > 0` is certified.

*Needs:* 1.1; Mathlib `Matrix.l2_opNorm_def`, `Matrix.linfty_opNorm_eq_opNorm`.

### Examples

The identity classifier of `ℝ²` at `(1, 0)` (1.1–1.3) and the worked example of 6.2.

### Dependencies

1.1 uses nothing; 1.2 and 1.3 use 1.1 and Mathlib operator norms.

## Layer 2: Lipschitz bounds for networks

### 2.1 Layers

- The matrix norms are Mathlib's operator norms: `Matrix.l2_opNorm_def` and
  `Matrix.l2_opNorm_mulVec` for `‖W‖₂`, and `Matrix.linfty_opNorm_def` and
  `Matrix.linfty_opNorm_eq_opNorm` for `‖W‖_∞ = max_p Σ_q |W_{pq}|`. The targets are the
  Lipschitz corollaries: `x ↦ W x + b` is `‖W‖₂`-Lipschitz on Euclidean spaces and
  `‖W‖_∞`-Lipschitz on sup-normed spaces, and in each case no smaller constant works.
- For `0 ≤ λ`, `‖W‖₂² ≤ λ` if and only if `λ • 1 - Wᵀ W ⪰ 0` (`sq_l2_opNorm_le_iff`). Hence a
  rational `λ` with a rational `LDLᵀ` factorization of `λ • 1 - Wᵀ W` bounds `‖W‖₂`.
- A coordinatewise activation built from a `K`-Lipschitz `σ : ℝ → ℝ` is `K`-Lipschitz on
  `EuclideanSpace ℝ (Fin n)` and on `Fin n → ℝ`. ReLU and tanh are `1`-Lipschitz.

(Szegedy et al., §4.3, pp. 8–9, for layerwise operator-norm bounds; the Lipschitz corollaries
and the semidefinite form are proved here from the cited Mathlib declarations.)

**Checks.**

- `W = diag(3, 1)`: `‖W‖₂ = 3`; `9 • 1 - WᵀW = diag(0, 8) ⪰ 0`, while `8 • 1 - WᵀW` is not.
- `W = [[1, 1]]`: `‖W‖₂ = √2` and `‖W‖_∞ = 2`.
- ReLU is `1`-Lipschitz and not `K`-Lipschitz for any `K < 1`.

*Needs:* Mathlib `Matrix.l2_opNorm_mulVec`, `Matrix.linfty_opNorm_eq_opNorm`,
`Matrix.PosSemidef`; Neuromanifolds Milestone 2 (`reluActivation`, `tanhActivation`).

### 2.2 Multilayer perceptrons

For `A : MLPSpec ℝ L` with `K_i`-Lipschitz activations and parameters `θ`, the realization
`A.realize θ` is `∏ᵢ ‖Wᵢ‖₂ · ∏ⱼ K_j`-Lipschitz in `ℓ²` (`lipschitzWith_realize_prod`), and
similarly in `ℓ∞` with `‖Wᵢ‖_∞`. The constant does not depend on the biases. For identity
activations and depth 2 the least constant is `‖W₂ W₁‖₂`, which equals the product when
`W₂ = W₁ᵀ`. The product is not the least constant in general; 6.2 gives an instance.

(Szegedy et al., §4.3, pp. 8–9, and Table 5, p. 9, for the product of layerwise bounds; the
statements for `MLPSpec` are proved here.)

**Checks.**

- Depth `2`, identity activation, `W₂ = W₁ᵀ = W`: the least constant is `‖WᵀW‖₂ = ‖W‖₂²`, the
  product.
- Depth `1`: the realization is affine, and the product is `‖W₁‖₂`, the least constant.
- Changing the biases leaves the product constant unchanged.

*Needs:* 2.1; Mathlib `LipschitzWith.comp`; Neuromanifolds Milestone 2
(`MLPSpec.evalPrefix_succ`, `MLPSpec.realize`).

### Examples

`W = diag(3, 1)` and `W = [[1, 1]]` (2.1); identity-activation networks (2.2); 6.2.

### Dependencies

2.1 uses Mathlib's matrix operator norms; 2.2 uses 2.1 and `MLPSpec`.

## Layer 3: LipSDP

### 3.1 Slope restrictions

- If `σ` is monotone and `K`-Lipschitz then it is slope-restricted in `[0, K]`
  (`slopeRestricted_of_monotone_of_lipschitzWith`). Conversely a
  function slope-restricted in `[α, β]` is `max(|α|, |β|)`-Lipschitz.
- ReLU and tanh are slope-restricted in `[0, 1]`. The leaky ReLU `t ↦ max(t, c t)` with
  `0 ≤ c ≤ 1` is slope-restricted in `[c, 1]`.
- **Incremental quadratic constraint.** If `σ` is slope-restricted in `[α, β]` and `T = diag t`
  with `t ≥ 0`, then for all `u, u'` with `Δu = u - u'` and `Δy = σ(u) - σ(u')`,

  `0 ≤ Σ_p 2 t_p (Δy_p - α Δu_p) (β Δu_p - Δy_p)`.

(Fazlyab et al., arXiv v2, Definition 1, p. 3, and Lemma 1, eq. (9), p. 4. The source assumes
`0 ≤ α < β`; the statements here allow any `α ≤ β`, by the same computation.)

**Checks.**

- ReLU is slope-restricted in `[0, 1]` but not in `[0, 1/2]`: at `a = 1`, `b = 0` the product is
  `1 · (1/2 - 1) < 0`.
- The leaky ReLU with `c = 1/2` is slope-restricted in `[1/2, 1]` but not in `[3/5, 1]`: at
  `a = -1`, `b = 0` the product is `(1/10)(-1/2) < 0`.
- `t ↦ 2t` is slope-restricted in `[2, 2]` and hence `2`-Lipschitz.

*Needs:* none.

### 3.2 One hidden layer

For `f(x) = W₂ σ(W₁ x + b₁) + b₂` with `σ` slope-restricted in `[α, β]`, define for `ρ ≥ 0`
and `t ≥ 0` the symmetric block matrix

`M(ρ, t) = [[ρ I + 2αβ W₁ᵀ T W₁, -(α+β) W₁ᵀ T], [-(α+β) T W₁, 2T - W₂ᵀ W₂]]`, with `T = diag t`.

- **Soundness.** If `M(ρ, t) ⪰ 0` then `‖f x - f x'‖₂² ≤ ρ ‖x - x'‖₂²` for all `x, x'`, so `f`
  is `√ρ`-Lipschitz (`lipSDP_sound`, with `M(ρ, t) = lipSDPMatrix W₁ W₂ α β ρ t`). The proof
  evaluates the quadratic form of `M` at `(Δx, Δy)` and adds the incremental quadratic
  constraint.
- **Schur form.** For `α = 0`, `β = 1` and `ρ > 0`, `M(ρ, t) ⪰ 0` if and only if
  `2T - W₂ᵀ W₂ - ρ⁻¹ T W₁ W₁ᵀ T ⪰ 0` (`lipSDPMatrix_posSemidef_iff`). This matrix is `h × h`,
  independent of the input dimension.
- **Comparison with the product bound.** For `α = 0` and `β = 1`, the point `t = ‖W₂‖₂² 𝟙`,
  `ρ = ‖W₁‖₂² ‖W₂‖₂²` is feasible (`lipSDPMatrix_prod_posSemidef`). So the best LipSDP constant
  is at most the product constant.
- **Per-pair form.** Replacing `W₂` by the row `W₂,ᵢ - W₂,ⱼ` gives a Lipschitz constant for the
  gap `g_{ij}`, to be used in the per-pair certificate of 1.2.

(Fazlyab et al., Theorem 1, eq. (10), p. 5, for soundness. The source assumes `0 ≤ α < β` and
`ρ > 0`; signed `α ≤ β` and `ρ ≥ 0` go beyond it and follow from the same quadratic-form
identity. The Schur form, the comparison with the product bound and the per-pair form have no
source and are proved here.)

**Checks.**

- The example of 6.2: at `ρ = 2` and `t = (2, 1)` the Schur matrix is `diag(1, 0) ⪰ 0`.
- `W₂ = 0`: `M(0, 0) = 0 ⪰ 0`, and `f` is constant.
- `n = h = k = 1`, `W₁ = W₂ = 1`, ReLU: `M(1, 1) = [[1, -1], [-1, 1]] ⪰ 0`, and no `ρ < 1` is
  feasible, since `f = relu` is not `K`-Lipschitz for `K < 1`.

*Needs:* 2.1, 3.1; Mathlib `Matrix.PosDef.fromBlocks₁₁`.

### 3.3 Multilayer perceptrons

For `1 ≤ L` and `A : MLPSpec ℝ L` whose hidden activations are all slope-restricted in `[α, β]`,
write the increments of the hidden layers as one vector `z = (Δx⁰, Δx¹, …, Δx^{L-1})`. Let `E₀`
and `E_{L-1}` be the projections onto the first and last blocks, let `P z` be the stacked
pre-activation increments `(W₁ Δx⁰, …, W_{L-1} Δx^{L-2})`, and let `Q z = (Δx¹, …, Δx^{L-1})`.
If, for some `ρ ≥ 0` and diagonal `T ⪰ 0` of the total hidden width,

`ρ E₀ᵀ E₀ - E_{L-1}ᵀ W_Lᵀ W_L E_{L-1} + 2 [P; Q]ᵀ [[αβ T, -((α+β)/2) T], [-((α+β)/2) T, T]] [P; Q] ⪰ 0`,

then `A.realize θ` is `√ρ`-Lipschitz in `ℓ²`. For `L = 2` this is `M(ρ, t)`. For `α = 0`,
`β = 1` the product bound is feasible: take `ρ = ∏ₘ ‖Wₘ‖₂²` and `T = (∏_{m > ℓ} ‖Wₘ‖₂²) I` on
hidden layer `ℓ`. The proof uses `2‖y‖² - 2 y · W x ≥ ‖y‖² - ‖W‖₂² ‖x‖²`, which telescopes.

(Fazlyab et al., Theorem 2, eq. (14), p. 6, under the same widening of hypotheses as 3.2; the
feasibility of the product point has no source and is proved here.)

**Checks.**

- For `L = 2` the matrix is `M(ρ, t)` of 3.2.
- Depth `3`, all widths `1`, all weights `1`, ReLU: `ρ = 1` with `t = (1, 1)` is feasible.
- `W_L = 0`: `ρ = 0` and `T = 0` are feasible.

*Needs:* 3.1, 3.2; Neuromanifolds Milestone 2 (`MLPSpec.evalPrefix_succ`).

### Examples

The ReLU, leaky ReLU and linear activations (3.1); the scalar network `relu` (3.2); the
worked example of 6.2.

### Dependencies

3.1 uses nothing; 3.2 uses 2.1, 3.1 and the Schur complement; 3.3 uses 3.1, 3.2 and `MLPSpec`.

## Layer 4: interval bound propagation

### 4.1 Boxes through layers

Boxes are `Set.Icc l u` in `Fin n → ℝ`, with center `c = (l + u)/2` and radius `r = (u - l)/2`.

- **Affine layers.** If `x ∈ Icc l u` then
  `W x + b ∈ Icc (W c + b - |W| r) (W c + b + |W| r)` (`ibpAffine`,
  `mulVec_add_mem_ibpAffine`). If `l ≤ u`, then for each output
  coordinate `p` both bounds are attained at some point of the box, so the per-layer bounds
  are exact coordinatewise (`exists_eq_ibpAffine`).
- **Activations.** If `σ` is monotone then `x ∈ Icc l u` implies
  `σ ∘ x ∈ Icc (σ ∘ l) (σ ∘ u)`. If moreover `l ≤ u`, both bounds are attained; without `l ≤ u`
  only the inclusion holds.
- **Composition.** For `A : MLPSpec ℝ L` with monotone hidden activations, define the
  interval bounds of every prefix by the same recursion as `A.evalPrefix` (`ibpBounds`). Prove
  that `A.evalPrefix θ x i` lies in the `i`-th box whenever `x` lies in the input box
  (`evalPrefix_mem_ibpBounds`). Composed
  bounds are not exact in general: the example of 6.2 shows a strict loss.

(Gowal et al., Equations (6)–(7), p. 4, for the center–radius affine step and monotone
activations; exactness per layer is proved here.)

**Checks.**

- `W = [[1, -1]]`, `b = 0`, box `[0, 1]²`: the bounds are `[-1, 1]`, attained at `(0, 1)` and
  `(1, 0)`.
- A degenerate box `l = u` gives the bounds `W l + b` on both sides.
- `W = (1 1)`, `l = (1 - ε, -1 - ε)`, `u = (1 + ε, -1 + ε)`: the bounds are `[-2ε, 2ε]`.
- `x ↦ x - x` as two layers `[[1], [1]]` then `[[1, -1]]`, with identity activation, on `[0, 1]`:
  the composed bounds are `[-1, 1]` while the function is `0`.

*Needs:* 1.1; Neuromanifolds Milestone 2 (`MLPSpec.evalPrefix_succ`,
`MLPSpec.layerActivation`).

### 4.2 Margin certificates

- **Elementary criterion.** If the output box `Icc lo hi` satisfies `hi j < lo i` for all
  `j ≠ i`, then `A.realize θ` is certified on the input box with class `i`
  (`certifiedOn_Icc_of_ibpBounds`).
- **Specification layer.** For `l ≤ u` on the last hidden box, bounding the gap directly, by
  applying 4.1 to the last affine layer with the row `W_{L,i} - W_{L,j}` and bias `b_{L,i} -
  b_{L,j}`, gives a lower bound on `g_{ij}` that is at least `lo i - hi j`, because `|a - a'| ≤
  |a| + |a'|` entrywise.

(Gowal et al., eq. (9), p. 4, for eliding the last layer into the specification; the comparison
is proved here.)

**Checks.**

- `f(x) = (x + 1, x)` on the box `[0, 1]`: the elementary criterion fails (`hi 1 = 1 = lo 0`),
  while the specification layer gives the gap lower bound `1 > 0`.
- For a constant network both criteria agree.
- The activation `t ↦ t²`, which is not monotone, maps the box `[-1, 1]` to the bounds `[1, 1]`,
  which miss the value `0`: monotonicity cannot be dropped from 4.1.
- `n = 1`, rows `a = a' = (1)`, biases `0`, and the reversed box `l = 1`, `u = -1`: the
  specification bound is `0` while `lo i - hi j = 2`, so `l ≤ u` cannot be dropped; with
  `l = -1`, `u = 1` the comparison reads `0 ≥ -2`.

*Needs:* 1.1, 4.1.

### Examples

The boxes of the Checks of 4.1 and 4.2; the worked example of 6.2.

### Dependencies

4.1 uses 1.1 and `MLPSpec`; 4.2 uses 1.1 and 4.1.

## Layer 5: linear relaxation

### 5.1 ReLU envelopes

Let `l < 0 < u` and `s = u / (u - l)`.

- **Upper chord.** `max z 0 ≤ s (z - l)` for `z ∈ [l, u]`, with equality at both endpoints.
  It is the least affine upper bound of ReLU on `[l, u]`.
- **Lower lines.** `α z ≤ max z 0` for all `z` and every `α ∈ [0, 1]`. These are exactly the
  affine lower bounds of ReLU on `[l, u]` with zero intercept.
- For `0 ≤ l` ReLU is the identity on `[l, u]`, and for `u ≤ 0` it is zero.

(Wong–Kolter, eq. (3), p. 3, for the upper chord; Zhang et al., §3.2, p. 5, for the adaptive
lower lines.)

**Checks.**

- `l = -1`, `u = 1`: `s = 1/2`, and the chord `(z + 1)/2` equals ReLU at `±1` and is `1/2` at `0`.
- `α = 1` gives `z ≤ max z 0`; `α = 2` fails at `z = 1`.
- `crownRelax a l u α` is `(1, 0)` for `0 ≤ l` and `(0, 0)` for `u ≤ 0`, whatever `a` and `α`.
- `crownRelax (-1) (-2ε) (2ε) α = (1/2, ε)` for `ε > 0`.

*Needs:* none.

### 5.2 One hidden layer

Let `f(x) = W₂ relu(W₁ x + b₁) + b₂`, let `c ∈ ℝ^k` be a specification vector, and let
`l ≤ W₁ x + b₁ ≤ u` hold for every `x ∈ S` (for instance from 4.1). Put `a = W₂ᵀ c`, and fix
slopes `α_p ∈ [0, 1]`. For each hidden neuron `p` define `(λ_p, μ_p)` as `(1, 0)` if `0 ≤ l_p`,
as `(0, 0)` if `u_p ≤ 0`, and otherwise, when `l_p < 0 < u_p`, as `(α_p, 0)` if `a_p ≥ 0` and
as `(s_p, -s_p l_p)` with `s_p = u_p / (u_p - l_p)` if `a_p < 0`. Then
`a_p relu(z) ≥ a_p (λ_p z + μ_p)` for `z ∈ [l_p, u_p]`. Define `Λ = W₁ᵀ (a ⊙ λ)` and
`κ = (a ⊙ λ) · b₁ + a · μ + c · b₂`.

- **Soundness.** `Λ · x + κ ≤ c · f(x)` for every `x ∈ S` (`crown_sound`, with the pair
  `(λ_p, μ_p) = crownRelax a_p l_p u_p α_p`).
- **`ℓ∞` minimum.** `min_{‖x - x₀‖_∞ ≤ ε} (Λ · x + κ) = Λ · x₀ + κ - ε Σ_q |Λ_q|`.
- **Certificate.** With `c = e_i - e_j` for every `j ≠ i`, a positive minimum certifies the box.

(Zhang et al., Theorem 3.2 and Corollary 3.3, p. 4, and Tables 2–3, p. 5.)

**Checks.**

- The example of 6.2: `Λ = (1/2, -1/2)` and minimum `1 - 2ε`.
- If every hidden neuron is active (`0 ≤ l`), then `Λ · x + κ = c · f(x)` on `S`.
- `c = 0` gives `Λ = 0` and `κ = 0`.

*Needs:* 5.1; 4.1 for the bounds `l`, `u`.

### Examples

The scalar envelopes of the Checks of 5.1; the worked example of 6.2.

### Dependencies

5.1 uses nothing; 5.2 uses 5.1, and 4.1 supplies its pre-activation bounds.

## Layer 6: exact certificates and a worked example

### 6.1 Rational semidefiniteness certificates

- If `d ≥ 0` then `L diag d Lᵀ ⪰ 0`: this is Mathlib's `Matrix.PosSemidef.diagonal` with
  `Matrix.PosSemidef.mul_mul_conjTranspose_same`.
- Every positive semidefinite real `M` factors as `L diag d Lᵀ` with `L` lower unitriangular and
  `d ≥ 0` (`exists_ldlt_of_posSemidef`): a zero pivot of a semidefinite matrix has a zero column
  below it. If `M` is rational, so are `L` and `d`.
- If `M : Matrix n n ℚ` is positive semidefinite then so is its cast to `ℝ`
  (`PosSemidef.map_ratCast`).
- For the Schur matrix of 6.2 the factorization is `L = 1`, `d = (1, 0)`.

(Proved here.)

**Checks.**

- `L = [[1, 0], [1, 1]]`, `d = (1, 0)`: `L diag d Lᵀ = [[1, 1], [1, 1]] ⪰ 0`.
- `[[2, 1], [1, 1]] = L diag(2, 1/2) Lᵀ` with `L = [[1, 0], [1/2, 1]]`.
- `diag(1, -1)` is not positive semidefinite, and its only factorization with `L = 1` has
  `d = (1, -1)`.

*Needs:* Mathlib `Matrix.PosSemidef.diagonal`, `Matrix.PosSemidef.mul_mul_conjTranspose_same`.

### 6.2 Worked example

Let `n = h = k = 2`, `W₁ = [[1, 0], [1, 1]]`, `b₁ = 0`, `W₂ = [[1, -1], [0, 0]]`, `b₂ = 0`, and
`σ = relu`. At `x₀ = (1, -1)` the logits are `(1, 0)`, so the network predicts class `0` with
margin `1`. Prove each of the following.

- **Exact radius.** The gap is `g(x) = relu(x₁) - relu(x₁ + x₂)`. The exact certified radius
  at `x₀` is `1` in both `ℓ²` and `ℓ∞`.
- **Product bound.** `‖W₁‖₂ = φ`, the golden ratio, and `‖W₂‖₂ = √2`, so the product constant
  of 2.2 is `φ √2`, while the realization is `√2`-Lipschitz. The global certificate of 1.2
  gives radius `1 / (2φ)`.
- **LipSDP.** `ρ = 2` and `t = (2, 1)` satisfy the per-pair Schur condition of 3.2 exactly:
  the Schur matrix is `diag(1, 0)`. So the gap is `√2`-Lipschitz and the `ℓ²` radius `1/√2` is
  certified. No smaller `ρ` is feasible, since the gap's gradient on the region
  `x₁ < 0 < x₁ + x₂` is `(-1, -1)`.
- **Interval bounds.** For `0 ≤ ε < 1`, the specification-layer bound of 4.2 on the box of
  radius `ε` is `1 - 3ε`. So IBP certifies every `ε < 1/3`, and no `ε ≥ 1/3`.
- **Linear relaxation.** For `0 < ε < 1`, with pre-activation bounds from 4.1, the first hidden
  neuron is active and the second is unstable with `l = -2ε`, `u = 2ε`, `s = 1/2`. The bound of
  5.2 is `Λ = (1/2, -1/2)`, minimum `1 - 2ε`. So it certifies every `ε < 1/2`.

The certified radii are thus `1/(2φ) < 1/√2 < 1` in `ℓ²` and `1/3 < 1/2 < 1` in `ℓ∞`.

(Proved here.)

*Needs:* 1.2, 2.2, 3.2, 4.2, 5.2, 6.1.

## Dependencies and order

Layer 1 uses only Mathlib. Layer 2 uses Mathlib's matrix operator norms and `MLPSpec`. Layer 3
uses 2.1 and the Schur complement. Layer 4 uses 1.1 and `MLPSpec`. Layer 5 uses 4.1 for its
pre-activation bounds. 6.1 uses only Mathlib, and 6.2 uses all of the layers. The per-target
*Needs:* lines are authoritative.

## Downstream consumers

None at present.

## Provenance

A formalization of much of Layers 1 and 3–6, for fixed small networks on `EuclideanSpace`, is
in [lean4-mlir](https://github.com/brettkoonce/lean4-mlir), in the files
`LeanMlir/Proofs/Certificates/LipschitzCert/Basic.lean` (coordinate gaps and the
Lipschitz-margin radius), `DenseEuclid.lean` (dense and ReLU layers and Gram-matrix bounds),
`LipschitzCert/PairSDP.lean` (ReLU slope restriction and the per-pair LipSDP bound in Schur
form), `IntervalBound.lean` and `IntervalBoundConv/Basic.lean` (interval bound propagation), and
`CrownBound.lean` (ReLU envelopes and one-hidden-layer CROWN). It is BSD-3 licensed, and its
author contributed this roadmap. There the certificates are applied to trained MNIST and
CIFAR-10 networks with generated rational data. The roadmap generalizes the statements to
`MLPSpec`, to slope restrictions in `[α, β]`, and to exact radii; the source is reference
material, not the specification.

## References

- C. Szegedy et al., *Intriguing properties of neural networks*, ICLR 2014, arXiv:1312.6199.
- Y. Tsuzuku, I. Sato and M. Sugiyama, *Lipschitz-margin training: scalable certification of
  perturbation invariance for deep neural networks*, NeurIPS 2018, arXiv:1802.04034.
- M. Fazlyab, A. Robey, H. Hassani, M. Morari and G. J. Pappas, *Efficient and accurate
  estimation of Lipschitz constants for deep neural networks*, NeurIPS 2019, arXiv:1906.04893.
- S. Gowal et al., *On the effectiveness of interval bound propagation for training verifiably
  robust models*, 2018, arXiv:1810.12715.
- E. Wong and J. Z. Kolter, *Provable defenses against adversarial examples via the convex
  outer adversarial polytope*, ICML 2018, arXiv:1711.00851.
- H. Zhang, T.-W. Weng, P.-Y. Chen, C.-J. Hsieh and L. Daniel, *Efficient neural network
  robustness certification with general activation functions*, NeurIPS 2018,
  arXiv:1811.00866.
