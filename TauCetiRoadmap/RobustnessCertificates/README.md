# Certified robustness: Lipschitz margins, LipSDP and bound propagation

**Summary.** Develop the mathematics behind certificates that a neural-network classifier
cannot change its prediction under any input perturbation of bounded norm. A certificate is a
proof that the predicted class keeps a strictly positive margin over a whole ball. Three
families are covered. *Lipschitz-margin* certificates turn a Lipschitz bound on the logits into
a certified radius; for affine classifiers the radius is exact and given by a dual norm.
*LipSDP* certificates bound the Lipschitz constant of a network by a semidefinite feasibility
condition, using the fact that the activations are slope-restricted; the condition is never
worse than the product of the layers' operator norms. *Bound-propagation* certificates push an
input box through the network, either as boxes (interval bound propagation) or as linear
upper and lower bounds (CROWN-type linear relaxation). The roadmap ends with exact rational
certificates that the kernel can check, and a worked example in which the four certified radii
are computed and compared.

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

It consumes, and does not re-prove:

- [Neuromanifolds](../Neuromanifolds/README.md), as implemented in Tau Ceti under
  `TauCeti/Geometry/Neuromanifold`: the specification `TauCeti.Neuromanifold.MLPSpec`, its
  parameters, its prefix evaluation `evalPrefix`, its realization `realize`, the dense layer
  and the ReLU and tanh activations;
- Mathlib: `LipschitzWith`, `EuclideanSpace`, the sup norm on `Fin n → ℝ`, `Matrix.PosSemidef`
  with the Schur-complement lemmas `Matrix.PosDef.fromBlocks₁₁` and
  `Matrix.PosDef.fromBlocks₂₂`, and the `ℓ²` operator norm on matrices
  (`Matrix.Norms.L2Operator`).

Out of scope: randomized smoothing and other probabilistic certificates, which need Gaussian
measure and binomial confidence bounds; attacks and lower bounds on the robust radius;
complexity results (computing the exact Lipschitz constant of a ReLU network is NP-hard);
convolutional, residual and attention layers beyond what `MLPSpec` covers; training methods;
and floating-point error in evaluating a network.

## Conventions

- A **classifier** with `k` classes on a set `X` is a map `f : X → (Fin k → ℝ)`, the logits. It
  **predicts** `i` at `x` when `f x j < f x i` for all `j ≠ i`.
- `f` is **certified on** `S ⊆ X` **with class** `i` when it predicts `i` at every point of `S`.
  The **certified radius** at `x` in a metric space is the supremum of the `r` such that `f` is
  certified on `Metric.ball x r` with the class it predicts at `x`, and `0` when `f` predicts
  no class at `x`.
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
- A **one-hidden-layer network** is `f(x) = W₂ σ(W₁ x + b₁) + b₂` with `W₁ ∈ ℝ^{h×n}`,
  `W₂ ∈ ℝ^{k×h}` and `σ` applied coordinatewise. It is the realization of an `MLPSpec ℝ 2`.
- An activation `σ : ℝ → ℝ` is **slope-restricted in** `[α, β]`, with `α ≤ β`, when
  `0 ≤ (σ a - σ b - α (a - b)) (β (a - b) - (σ a - σ b))` for all `a, b`. For `a ≠ b` this says
  that the difference quotient of `σ` lies in `[α, β]`.

## Layer 1: margin certificates

### 1.1 The robustness predicate

Define `CertifiedOn f S i`. Prove that it is antitone in `S`, that it holds on `∅`, that it is
closed under unions of sets, and that a certificate on `Metric.ball x r` for `r > 0` implies
that `f` predicts `i` at `x`. Transported along `WithLp.equiv`, an `ℓ∞` certificate of radius
`r` implies an `ℓ²` certificate of radius `r`, since `‖v‖_∞ ≤ ‖v‖₂`.

### 1.2 Lipschitz-margin certificates

Let `X` be a seminormed additive group and `f : X → EuclideanSpace ℝ (Fin k)`.

- **Coordinate gaps.** `|v i - v j| ≤ √2 ‖v‖₂` for `i ≠ j`, with equality at `v = e_i - e_j`.
- **Global constant.** If `f` is `L`-Lipschitz, every gap at `x` is at least `m > 0`, and
  `√2 L ε ≤ m`, then `f` is certified on `Metric.ball x ε` with class `i`. This is the
  Lipschitz-margin radius of Tsuzuku–Sato–Sugiyama.
- **Per-pair constants.** If each gap `g_{ij}` is `L_{ij}`-Lipschitz, `0 < g_{ij}(x)` and
  `L_{ij} ε ≤ g_{ij}(x)` for all `j ≠ i`, then `f` is certified on `Metric.ball x ε`. If `f` is
  `L`-Lipschitz then every `g_{ij}` is `√2 L`-Lipschitz, so the per-pair radius is at least the
  global one.
- **Output norms.** For logits measured in the sup norm, the constant `√2` becomes `2`, and
  equality is attained.

### 1.3 Affine classifiers

Let `X` be a real normed space and `f x j = φ_j x + b_j` with `φ_j ∈ X →L[ℝ] ℝ`, and write
`a_j = φ_i - φ_j`. For `r > 0`, `f` is certified on `Metric.ball x r` with class `i` if and
only if, for every `j ≠ i`, `0 < g_{ij}(x)` and `r ‖a_j‖ ≤ g_{ij}(x)`, where `‖a_j‖` is the
operator norm. For `f(x) = W x + b` with rows `W_j`, identify the dual norm `‖·‖_*` of `a_j`
given by the row `W_i - W_j` in the two instances:

- in `ℓ²`, `‖a‖_* = ‖a‖₂`;
- in `ℓ∞`, `‖a‖_* = Σ_p |a_p|`.

So the certified radius of an affine classifier is exactly `min_{j ≠ i} g_{ij}(x) / ‖a_j‖_*`,
with the convention that a term with `a_j = 0` and `g_{ij}(x) > 0` imposes no constraint.

## Layer 2: Lipschitz bounds for networks

### 2.1 Layers

- An affine map `x ↦ W x + b` on Euclidean spaces is `‖W‖₂`-Lipschitz, and `‖W‖₂` is the
  least such constant.
- For `0 ≤ λ`, `‖W‖₂² ≤ λ` if and only if `λ • 1 - Wᵀ W ⪰ 0`. Hence a rational `λ` with a
  positive semidefiniteness certificate bounds `‖W‖₂`.
- In `ℓ∞`, `x ↦ W x + b` is `‖W‖_∞`-Lipschitz, where `‖W‖_∞ = max_p Σ_q |W_{pq}|`, and this
  constant is the least one.
- A coordinatewise activation built from a `K`-Lipschitz `σ : ℝ → ℝ` is `K`-Lipschitz on
  `EuclideanSpace ℝ (Fin n)` and on `Fin n → ℝ`. ReLU and tanh are `1`-Lipschitz.

### 2.2 Multilayer perceptrons

For `A : MLPSpec ℝ L` with `K_i`-Lipschitz activations and parameters `θ`, the realization
`A.realize θ` is `∏ᵢ ‖Wᵢ‖₂ · ∏ⱼ K_j`-Lipschitz in `ℓ²`, and similarly in `ℓ∞` with `‖Wᵢ‖_∞`.
The constant does not depend on the biases. For identity activations and depth 2 the least
constant is `‖W₂ W₁‖₂`, which equals the product when `W₂ = W₁ᵀ`. The product is not the least
constant in general: the
worked example of 6.2 has product constant `φ √2` for its first and second layers, where `φ` is
the golden ratio, while its realization is `√2`-Lipschitz.

## Layer 3: LipSDP

### 3.1 Slope restrictions

- If `σ` is monotone and `K`-Lipschitz then it is slope-restricted in `[0, K]`. Conversely a
  function slope-restricted in `[α, β]` is `max(|α|, |β|)`-Lipschitz.
- ReLU and tanh are slope-restricted in `[0, 1]`. The leaky ReLU `t ↦ max(t, c t)` with
  `0 ≤ c ≤ 1` is slope-restricted in `[c, 1]`.
- **Incremental quadratic constraint.** If `σ` is slope-restricted in `[α, β]` and `T = diag t`
  with `t ≥ 0`, then for all `u, u'` with `Δu = u - u'` and `Δy = σ(u) - σ(u')`,

  `0 ≤ Σ_p 2 t_p (Δy_p - α Δu_p) (β Δu_p - Δy_p)`.

### 3.2 One hidden layer

For `f(x) = W₂ σ(W₁ x + b₁) + b₂` with `σ` slope-restricted in `[α, β]`, define for `ρ ≥ 0`
and `t ≥ 0` the symmetric block matrix

`M(ρ, t) = [[ρ I + 2αβ W₁ᵀ T W₁, -(α+β) W₁ᵀ T], [-(α+β) T W₁, 2T - W₂ᵀ W₂]]`, with `T = diag t`.

- **Soundness.** If `M(ρ, t) ⪰ 0` then `‖f x - f x'‖₂² ≤ ρ ‖x - x'‖₂²` for all `x, x'`, so `f`
  is `√ρ`-Lipschitz. The proof evaluates the quadratic form of `M` at `(Δx, Δy)` and adds the
  incremental quadratic constraint.
- **Schur form.** For `α = 0`, `β = 1` and `ρ > 0`, `M(ρ, t) ⪰ 0` if and only if
  `2T - W₂ᵀ W₂ - ρ⁻¹ T W₁ W₁ᵀ T ⪰ 0`. This matrix is `h × h`, independent of the input dimension.
- **Comparison with the product bound.** For `α = 0` and `β = 1`, the point `t = ‖W₂‖₂² 𝟙`,
  `ρ = ‖W₁‖₂² ‖W₂‖₂²` is feasible. So the best LipSDP constant is at most the product constant.
- **Per-pair form.** Replacing `W₂` by the row `W₂,ᵢ - W₂,ⱼ` gives a Lipschitz constant for the
  gap `g_{ij}`, to be used in the per-pair certificate of 1.2.

### 3.3 Multilayer perceptrons

For `A : MLPSpec ℝ L` whose hidden activations are all slope-restricted in `[α, β]`, write the
increments of the hidden layers as one vector `z = (Δx⁰, Δx¹, …, Δx^{L-1})`. Let `E₀` and
`E_{L-1}` be the projections onto the first and last blocks, let `P z` be the stacked
pre-activation increments `(W₁ Δx⁰, …, W_{L-1} Δx^{L-2})`, and let `Q z = (Δx¹, …, Δx^{L-1})`.
If, for some `ρ ≥ 0` and diagonal `T ⪰ 0` of the total hidden width,

`ρ E₀ᵀ E₀ - E_{L-1}ᵀ W_Lᵀ W_L E_{L-1} + 2 [P; Q]ᵀ [[αβ T, -((α+β)/2) T], [-((α+β)/2) T, T]] [P; Q] ⪰ 0`,

then `A.realize θ` is `√ρ`-Lipschitz in `ℓ²`. For `L = 2` this is `M(ρ, t)`. For `α = 0`,
`β = 1` the product bound is feasible: take `ρ = ∏ₘ ‖Wₘ‖₂²` and `T = (∏_{m > ℓ} ‖Wₘ‖₂²) I` on
hidden layer `ℓ`. The proof uses `2‖y‖² - 2 y · W x ≥ ‖y‖² - ‖W‖₂² ‖x‖²`, which telescopes.

## Layer 4: interval bound propagation

### 4.1 Boxes through layers

Boxes are `Set.Icc l u` in `Fin n → ℝ`, with center `c = (l + u)/2` and radius `r = (u - l)/2`.

- **Affine layers.** If `x ∈ Icc l u` then
  `W x + b ∈ Icc (W c + b - |W| r) (W c + b + |W| r)`. If `l ≤ u`, then for each output
  coordinate `p` both bounds are attained at some point of the box, so the per-layer bounds
  are exact coordinatewise.
- **Activations.** If `σ` is monotone then `x ∈ Icc l u` implies
  `σ ∘ x ∈ Icc (σ ∘ l) (σ ∘ u)`, with both bounds attained.
- **Composition.** For `A : MLPSpec ℝ L` with monotone hidden activations, define the
  interval bounds of every prefix by the same recursion as `A.evalPrefix`. Prove that
  `A.evalPrefix θ x i` lies in the `i`-th box whenever `x` lies in the input box. Composed
  bounds are not exact in general: the example of 6.2 shows a strict loss.

### 4.2 Margin certificates

- **Elementary criterion.** If the output box `Icc lo hi` satisfies `hi j < lo i` for all
  `j ≠ i`, then `A.realize θ` is certified on the input box with class `i`.
- **Specification layer.** Bounding the gap directly, by applying 4.1 to the last affine layer
  with the row `W_{L,i} - W_{L,j}` and bias `b_{L,i} - b_{L,j}`, gives a lower bound on
  `g_{ij}` that is at least `lo i - hi j`, because `|a - a'| ≤ |a| + |a'|` entrywise.

## Layer 5: linear relaxation

### 5.1 ReLU envelopes

Let `l < 0 < u` and `s = u / (u - l)`.

- **Upper chord.** `max z 0 ≤ s (z - l)` for `z ∈ [l, u]`, with equality at both endpoints.
  It is the least affine upper bound of ReLU on `[l, u]`.
- **Lower lines.** `α z ≤ max z 0` for all `z` and every `α ∈ [0, 1]`. These are exactly the
  affine lower bounds of ReLU on `[l, u]` with zero intercept.
- For `0 ≤ l` ReLU is the identity on `[l, u]`, and for `u ≤ 0` it is zero.

### 5.2 One hidden layer

Let `f(x) = W₂ relu(W₁ x + b₁) + b₂`, let `c ∈ ℝ^k` be a specification vector, and let
`l ≤ W₁ x + b₁ ≤ u` hold for every `x ∈ S` (for instance from 4.1). Put `a = W₂ᵀ c`, and fix
slopes `α_p ∈ [0, 1]`. For each hidden neuron `p` define `(λ_p, μ_p)` as `(1, 0)` if `0 ≤ l_p`,
as `(0, 0)` if `u_p ≤ 0`, and otherwise, when `l_p < 0 < u_p`, as `(α_p, 0)` if `a_p ≥ 0` and
as `(s_p, -s_p l_p)` with `s_p = u_p / (u_p - l_p)` if `a_p < 0`. Then
`a_p relu(z) ≥ a_p (λ_p z + μ_p)` for `z ∈ [l_p, u_p]`. Define `Λ = W₁ᵀ (a ⊙ λ)` and
`κ = (a ⊙ λ) · b₁ + a · μ + c · b₂`.

- **Soundness.** `Λ · x + κ ≤ c · f(x)` for every `x ∈ S`.
- **`ℓ∞` minimum.** `min_{‖x - x₀‖_∞ ≤ ε} (Λ · x + κ) = Λ · x₀ + κ - ε Σ_q |Λ_q|`.
- **Certificate.** With `c = e_i - e_j` for every `j ≠ i`, a positive minimum certifies the box.

## Layer 6: exact certificates and a worked example

### 6.1 Rational semidefiniteness certificates

- If `d ≥ 0` then `L diag d Lᵀ ⪰ 0`, over any ordered field.
- If `M : Matrix n n ℚ` is positive semidefinite then so is its cast to `ℝ`.
- Give a decidable check that a rational `M` equals `L diag d Lᵀ` with `L` lower unitriangular
  and `d ≥ 0`, and prove it sound for `M ⪰ 0`. Use it to discharge the LipSDP condition of
  6.2 by computation.

### 6.2 Worked example

Let `n = h = k = 2`, `W₁ = [[1, 0], [1, 1]]`, `b₁ = 0`, `W₂ = [[1, -1], [0, 0]]`, `b₂ = 0`, and
`σ = relu`. At `x₀ = (1, -1)` the logits are `(1, 0)`, so the network predicts class `0` with
margin `1`. Prove each of the following.

- **Exact radius.** The gap is `g(x) = relu(x₁) - relu(x₁ + x₂)`. The exact certified radius
  at `x₀` is `1` in both `ℓ²` and `ℓ∞`.
- **Product bound.** `‖W₁‖₂ = φ`, `‖W₂‖₂ = √2`, and the global certificate of 1.2 gives
  radius `1 / (2φ)`.
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

## Dependencies and order

Layer 1 uses only Mathlib. Layer 2 uses 1.2 and `MLPSpec`. Layer 3 uses Layer 2 and the
Schur-complement lemmas. Layer 4 uses `MLPSpec` and 1.1. Layer 5 uses Layer 4. Layer 6 uses
all of them; 6.1 is independent and can be done at any time.

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
- A. Megretski and A. Rantzer, *System analysis via integral quadratic constraints*, IEEE
  Trans. Automat. Control **42** (1997), 819–830.
- S. Gowal et al., *On the effectiveness of interval bound propagation for training verifiably
  robust models*, 2018, arXiv:1810.12715.
- E. Wong and J. Z. Kolter, *Provable defenses against adversarial examples via the convex
  outer adversarial polytope*, ICML 2018, arXiv:1711.00851.
- H. Zhang, T.-W. Weng, P.-Y. Chen, C.-J. Hsieh and L. Daniel, *Efficient neural network
  robustness certification with general activation functions*, NeurIPS 2018,
  arXiv:1811.00866.
