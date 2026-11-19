# Roadmap: newton and quasi-newton methods

**Summary.** This roadmap develops the local convergence theory of Newton's method for nonlinear
equations between real Banach spaces and the matrix theory of the quasi-Newton updates BFGS and
DFP. Its objects are the Newton map `N(x) = x − f'(x)⁻¹ f(x)` of a differentiable map `f`, its
iterates, the updates as explicit matrix-valued functions of a matrix and two vectors, and
sequences defined by recursion from them. Where an inverse or a quotient is undefined, Lean's
value `0` is used.

The headline theorems are these.

- *Local quadratic convergence.* Let `f` map one real Banach space to another, be continuously
  differentiable on the ball of radius `κ` about a zero `x⋆`, with `A = f'(x⋆)` invertible and
  `‖A⁻¹(f'(x) − f'(x⋆ + τ(x − x⋆)))‖ ≤ K(1 − τ)‖x − x⋆‖` for `x` in the ball and `0 ≤ τ ≤ 1`.
  From every point within `r = min(κ, 2/(3K))` of `x⋆` the Newton iterates stay within `r`,
  converge to `x⋆`, and satisfy `‖x_(k+1) − x⋆‖ ≤ K‖x_k − x⋆‖² / (2(1 − K‖x_k − x⋆‖))`; `x⋆` is
  the only zero within `min(κ, 2/K)`.
- *The Newton–Kantorovich theorem.* Let `f` map one real Banach space to another, be continuous on
  a set `C` and differentiable in its interior, `x₀` interior with `A = f'(x₀)` invertible,
  `‖A⁻¹(f'(y) − f'(x))‖ ≤ L‖x − y‖` on `C`, `‖A⁻¹ f(x₀)‖ ≤ b`, `L, b > 0`, `2bL ≤ 1`, and the
  closed ball of radius `t⋆ = (1 − √(1 − 2bL))/L` about `x₀` inside `C`. Then the Newton iterates
  stay in the open ball of radius `t⋆` and converge to the only zero of `f` in the closed ball,
  the error at least halving at each step.
- *The quasi-Newton updates.* For `B` positive definite and `sᵀy ≠ 0`, the BFGS and DFP updates
  are positive definite exactly when `sᵀy > 0`. For `W` positive definite with `Ws = y`, the DFP
  update of a symmetric `B` is the unique symmetric `X` with `Xs = y` minimizing
  `trace(W⁻¹(X − B)W⁻¹(X − B))`. With exact line searches on a strictly convex quadratic in
  dimension `n`, from a positive definite matrix, Broyden's class with nonnegative parameters
  reaches the minimizer in at most `n` steps, and if the minimizer is not reached before step `n`,
  the matrix after `n` steps is the inverse Hessian.
- *The Dennis–Moré characterization.* Let `f` map a finite-dimensional real normed space to
  itself, with a Gâteaux derivative `f'` on an open convex `D`, continuous at `x⋆ ∈ D`, `f'(x⋆)`
  invertible. If `x_(k+1) = x_k − B_k⁻¹ f(x_k)` with invertible `B_k` stays in `D`, tends to `x⋆`
  and differs from `x⋆` for large `k`, then the convergence is superlinear and `f(x⋆) = 0` if and
  only if `‖(B_k − f'(x⋆)) s_k‖ / ‖s_k‖ → 0` for the steps `s_k = x_(k+1) − x_k`.

The roadmap builds on Mathlib's derivatives, mean value inequalities and positive definite
matrices, and on Tau Ceti's Neumann-series bounds. Mathlib's Newton map of a polynomial is
algebraic; it agrees with the one here on real polynomials. First-order, Riemannian and
interior-point methods are not treated here.

## How to read the build

Layer 1 below defines the Newton map and the Newton sequence, proves the quadratic remainder
estimate for a map with Lipschitz derivative, and proves local quadratic convergence with an
explicit radius together with the uniqueness of the zero. Layer 2 depends on Layer 1 and proves the
Newton–Kantorovich theorem and its quadratic form. Layer 3 depends on no other layer: the BFGS and
DFP updates of a matrix and of its inverse, their secant equations, positive definiteness, their
inverses, and the least-change characterization. Layer 4 depends on no other layer and proves the
Dennis–Moré characterization for sequences driven by arbitrary invertible matrices. Layer 5
depends on Layer 3 and proves quadratic termination for Broyden's class. Within a layer the
sections are in build order.

## Conventions

- **Spaces.** In Layers 1 and 2, `E` and `F` are real normed spaces; the theorems of 1.3, 1.4 and
  Layer 2 assume both complete, as their sources do. In Layer 4, `E` is a finite-dimensional real
  normed space with any norm. In Layers 3 and 5 matrices are `Matrix ι ι ℝ` for a finite type `ι`
  with decidable equality, `n = Fintype.card ι`, and vectors are functions `ι → ℝ`.
- **Derivatives.** A theorem names the derivative it uses: a map `f' : E → E →L[ℝ] F` with
  `HasFDerivAt f (f' x) x` on an open set, `HasFDerivWithinAt` on a convex set in 1.2, or
  `HasLineDerivAt` (the Gâteaux derivative in a direction) in Layer 4. The Newton map is defined
  with Mathlib's `fderiv`, which agrees with `f'` wherever `HasFDerivAt f (f' x) x` holds.
- **Inverses and quotients.** `ContinuousLinearMap.inverse T` is the inverse of `T` when `T` is a
  continuous linear equivalence and `0` otherwise. `M⁻¹` for a square matrix is the inverse when
  `M` is invertible and `0` otherwise. For reals, `c⁻¹` and `a / c` are `0` when `c = 0`. An
  invertible derivative at a base point is given as a continuous linear equivalence `A : E ≃L[ℝ] F`
  with `f' x₀ = A`, and `A⁻¹` is `A.symm`.
- **Affine invariance.** Lipschitz conditions are stated for `A⁻¹ ∘ f'`, as in the sources, so
  that they do not change when `f` is replaced by `T ∘ f` for an invertible `T`. The usual form,
  `‖A⁻¹‖ ≤ β` with `f'` `L₀`-Lipschitz, implies the condition with constant `β L₀`.
- **Matrices.** `s ⬝ᵥ y` is `sᵀy`, `M *ᵥ s` is `Ms`, `s ᵥ* M` is `sᵀM`, and `vecMulVec u v` is the
  matrix `u vᵀ`. Positive definite is Mathlib's `Matrix.PosDef`, which includes symmetry.
- **Rates.** A sequence `x_k → x⋆` converges superlinearly when `‖x_(k+1) − x⋆‖ / ‖x_k − x⋆‖ → 0`.
  Layer 4 assumes `x_k ≠ x⋆` for all large `k`, so the quotient has a nonzero denominator from
  some index on.
- **Names of methods.** "Newton", "BFGS", "DFP" and "Broyden's class" name maps, matrix-valued
  functions and recursively defined sequences; nothing in the roadmap is an algorithm to be run.

## Layer 1: the Newton map and local convergence

### 1.1 The Newton map and the Newton sequence

Define `newtonMap f x = x − (fderiv ℝ f x).inverse (f x)` for `f : E → F`, and
`newtonSeq f x₀ k`, the `k`-th iterate of `newtonMap f` at `x₀`. At a point where the derivative
is not invertible the Newton map is the identity.

**Checks.**
- For `f(x) = x² − 2` on `ℝ` and `x₀ = 2` the sequence begins `2, 3/2, 17/12, 577/408`.
- For an affine map `f(x) = Mx + c` with `M` invertible, `newtonMap f x = −M⁻¹c` for every `x`: one
  step reaches the zero. If `M` is not invertible, `newtonMap f x = x` for every `x`.
- For `f(x) = x²` on `ℝ`, `newtonMap f x = x/2` for `x ≠ 0` and `newtonMap f 0 = 0`: at a zero with
  non-invertible derivative the sequence converges only linearly, so the invertibility of
  `f'(x⋆)` in 1.3 cannot be dropped.
- For a real polynomial `P`, `newtonMap (fun x ↦ P.eval x) x` equals Mathlib's
  `Polynomial.newtonMap P x` for every real `x`, including the points where `P'(x) = 0`, where both
  fix `x`; a definition sending such points to `0` would not agree there.

*Needs:* Mathlib `fderiv`, `ContinuousLinearMap.inverse`. (Definitions.)

### 1.2 The quadratic remainder estimate

Prove `norm_sub_sub_fderiv_le`: let `S ⊆ E` be convex, let `g : E → F` have derivative `g' u`
within `S` at every `u ∈ S`, and let `‖g' u − g' v‖ ≤ L‖u − v‖` for `u, v ∈ S`. Then for
`x, y ∈ S`, `‖g y − g x − g' x (y − x)‖ ≤ (L/2)‖y − x‖²` (Ferreira–Svaiter, Proposition 6, p. 6,
there for a ball and with the derivative at the base point normalized to the identity).

Route: on the segment from `x` to `y`, which lies in `S`, the function
`θ ↦ g(x + θ(y − x)) − θ g' x (y − x)` has derivative within `[0, 1]` equal to
`(g'(x + θ(y − x)) − g' x)(y − x)`, of norm at most `Lθ‖y − x‖²`. Comparison with
`θ ↦ Lθ²‖y − x‖²/2` bounds its increment over `[0, 1]`.

**Checks.**
- For `g(x) = Lx²/2` on `ℝ`, `g y − g x − g'(x)(y − x) = L(y − x)²/2`: the constant `1/2` cannot be
  lowered.
- An affine `g` satisfies the hypothesis with `L = 0` and the remainder is `0`.

*Needs:* Mathlib `HasFDerivWithinAt.comp_hasDerivWithinAt`,
`image_norm_le_of_norm_deriv_right_le_deriv_boundary`. (Proved here, except as cited.)

### 1.3 Local quadratic convergence

Prove `newtonSeq_local_quadratic`: let `E`, `F` be Banach spaces, `κ > 0`, `K > 0`, and let `f`
have derivative `f' x` at every `x` in the open ball `B(x⋆, κ)`, with `f'` continuous there,
`f x⋆ = 0`, `f' x⋆ = A` for a continuous linear equivalence `A`, and

    ‖A⁻¹ (f' x − f' (x⋆ + τ (x − x⋆)))‖ ≤ K (1 − τ) ‖x − x⋆‖   for x ∈ B(x⋆, κ), τ ∈ [0, 1].

Let `r = min κ (2/(3K))`. For every `x₀ ∈ B(x⋆, r)` the Newton sequence stays in `B(x⋆, r)`,
converges to `x⋆`, and

    ‖x_(k+1) − x⋆‖ ≤ K ‖x_k − x⋆‖² / (2 (1 − K ‖x_k − x⋆‖))   for every k

(Ferreira, Theorem 13 with `p = 1`, p. 8, for `x₀ ≠ x⋆`; the bound with `‖x_k − x⋆‖` in the
denominator is inequality (14) in the proof of Proposition 12, p. 7, for the majorant
`t ↦ Kt²/2 − t`. For `x₀ = x⋆` the sequence is constant.) When `2/(3K) < κ` the radius `2/(3K)`
cannot be enlarged (Ferreira, Theorem 13 and Remark 3, pp. 8–9); the first Check below exhibits
this.

Route: write `e = x − x⋆`. The case `τ = 0` gives `‖A⁻¹(f' x − A)‖ ≤ K‖e‖ < 1`, so `f' x` is
invertible and `‖(f' x)⁻¹ A‖ ≤ 1/(1 − K‖e‖)` by the Neumann series. Then
`N(x) − x⋆ = (f' x)⁻¹ A · A⁻¹(f' x e − (f x − f x⋆))`, and the function
`θ ↦ A⁻¹(f(x⋆ + θe) − θ f' x e)` has derivative of norm at most `K(1 − θ)‖e‖²`, so its increment
over `[0, 1]` has norm at most `K‖e‖²/2`. This gives the bound. It is less than `‖e‖` exactly
when `‖e‖ < 2/(3K)`, so the errors decrease, the sequence stays in the ball, and the ratio of
successive errors is at most `K‖x₀ − x⋆‖ / (2(1 − K‖x₀ − x⋆‖)) < 1`.

- Consequence: if `‖A⁻¹‖ ≤ β`, `f'` is `L₀`-Lipschitz on `B(x⋆, κ)` and
  `‖x₀ − x⋆‖ < min κ (1/(2βL₀))`, then `‖x_(k+1) − x⋆‖ ≤ βL₀‖x_k − x⋆‖²` for every `k`; take
  `K = βL₀`, for which `1/(2(1 − K‖x_k − x⋆‖)) ≤ 1`.

**Checks.**
- Let `K > 0` and `f(x) = x − (K/2)x|x|` on `ℝ`, with `x⋆ = 0`, `A = 1` and `κ = 2/K`. Then
  `f'(x) = 1 − K|x|` and the radial condition holds with equality, on all of `ℝ`, so any `κ`
  may be used. For `0 < |x| < 1/K`,
  `newtonMap f x = −Kx|x| / (2(1 − K|x|))`, so the bound of 1.3 is an equality. At
  `x₀ = 2/(3K)` the sequence alternates between `2/(3K)` and `−2/(3K)` and does not converge, so no
  radius larger than `2/(3K)` works.
- For `f(x) = x² − 2`, `x⋆ = √2`: `A = 2√2` and the condition holds with `K = 1/√2`, so
  `r = 2√2/3 ≈ 0.943` when `κ ≥ r`. From `x₀ = 2`, `|x₀ − x⋆| ≈ 0.586`; the next errors are
  `≈ 0.0858`, `≈ 0.00245`, `≈ 2.12·10⁻⁶`, each below the bound of 1.3 computed from the previous
  one (`≈ 0.207`, `≈ 0.00277`, `≈ 2.13·10⁻⁶`).
- With `x₀ = x⋆` every iterate is `x⋆`, since `f x⋆ = 0`.

*Needs:* 1.1; Tau Ceti `ContinuousLinearMap.isInvertible_of_norm_sub_lt`,
`NormedRing.norm_inverse_one_sub_le`; Mathlib `ContinuousLinearMap.inverse_equiv`,
`HasFDerivAt.fderiv`, `HasFDerivWithinAt.comp_hasDerivWithinAt`,
`image_norm_le_of_norm_deriv_right_le_deriv_boundary`. (Proved here, except as cited.)

### 1.4 Uniqueness of the zero

Prove `eq_of_mem_ball_of_eq_zero`: under the hypotheses of 1.3, without a starting point, `x⋆` is
the only zero of `f` in `B(x⋆, min κ (2/K))` (Ferreira, Theorem 2, pp. 2–3, for the majorant
`t ↦ Kt²/2 − t`, where the uniqueness radius is
the supremum of the `t < κ` at which the majorant is negative, that is `min κ (2/K)`; Theorem 13,
p. 8, is this case and writes the radius as `2/K`).

Route: if `f z = 0` and `e = z − x⋆`, then `0 = A⁻¹(f z − f x⋆) = e + ∫₀¹ A⁻¹(f'(x⋆ + θe) − A)e dθ`,
and the integral has norm at most `K‖e‖²/2 < ‖e‖` unless `e = 0`.

**Checks.**
- In the first example of 1.3, taken with any `κ > 2/K` (its radial condition holds on all of
  `ℝ`), `f(±2/K) = 0`: the zeros nearest to `x⋆ = 0` lie on the boundary of `B(0, 2/K)`, so the
  radius `min κ (2/K) = 2/K` cannot be enlarged.

*Needs:* Mathlib `intervalIntegral.integral_eq_sub_of_hasDerivAt`, `HasFDerivAt.comp_hasDerivAt`,
`ContinuousLinearMap.inverse_equiv`. (Proved here, except as cited.)

### Examples

Newton's method for minimization is the case `f = ∇φ` of a twice differentiable `φ` on a real
Hilbert space, with `f'` the Hessian: at a critical point `x⋆` whose Hessian `H` is coercive
(`⟪H v, v⟫ ≥ c‖v‖²` for some `c > 0`), hence invertible, 1.3 applies with `A = H` when the
Hessian satisfies the radial condition of 1.3. Positivity of `⟪H v, v⟫` for `v ≠ 0` is not
enough in infinite dimension: for `φ(x) = ½ ∑ xₙ²/n` on `ℓ²` the Hessian `diag(1/n)` is positive
and not surjective. The two scalar examples of 1.3 and
the double root `x²` of 1.1 show the radius, the rate and the role of invertibility.

### Dependencies

Mathlib `fderiv`, `ContinuousLinearMap.inverse`, `ContinuousLinearMap.inverse_equiv`,
`HasFDerivAt.fderiv`, `HasFDerivWithinAt.comp_hasDerivWithinAt`,
`image_norm_le_of_norm_deriv_right_le_deriv_boundary`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt`, `HasFDerivAt.comp_hasDerivAt`; Tau Ceti
`ContinuousLinearMap.isInvertible_of_norm_sub_lt`, `NormedRing.norm_inverse_one_sub_le`. No other
layer.

## Layer 2: the Newton–Kantorovich theorem

### 2.1 The Kantorovich radius and the theorem

Define `kantorovichRadius L b = (1 − √(1 − 2bL))/L` and
`kantorovichOuterRadius L b = (1 + √(1 − 2bL))/L`, the two roots of `t ↦ Lt²/2 − t + b` when
`0 < L` and `2bL ≤ 1`.

Prove `newtonKantorovich`: let `E`, `F` be Banach spaces, `C ⊆ E`, `f` continuous on `C` with
derivative `f' x` at every interior point `x` of `C`, `x₀` interior to `C`, `f' x₀ = A` for a
continuous linear equivalence `A`, and suppose

- `‖A⁻¹(f' y − f' x)‖ ≤ L‖x − y‖` for all `x, y ∈ C`;
- `‖A⁻¹ f(x₀)‖ ≤ b`, with `0 < L`, `0 < b` and `2bL ≤ 1`;
- the closed ball `B[x₀, t⋆]` lies in `C`, where `t⋆ = kantorovichRadius L b`.

Then every Newton iterate from `x₀` lies in the open ball `B(x₀, t⋆)`; the sequence converges to a
point `x⋆ ∈ B[x₀, t⋆]` with `f x⋆ = 0`; `x⋆` is the only zero of `f` in `B[x₀, t⋆]`; and
`‖x⋆ − x_(k+1)‖ ≤ ‖x⋆ − x_k‖/2` for every `k` (Ferreira–Svaiter, Theorem 1, p. 2). The theorem is
due to Kantorovich.

Route: replace `f` by `A⁻¹ ∘ f`, so that `f' x₀` is the identity. Compare `f` with the scalar
majorant `t ↦ Lt²/2 − t + b`, whose Newton iterates `t_k` from `0` increase to `t⋆`. For
`‖x − x₀‖ ≤ t < t⋆` the Neumann series gives `f' x` invertible with
`‖(f' x)⁻¹‖ ≤ 1/(1 − Lt)`. On the sets of `x` with `‖x − x₀‖ ≤ t` and `‖f x‖ ≤ Lt²/2 − t + b`,
which the Newton map sends into the set of the next `t`, 1.2 gives
`‖x_(k+1) − x_k‖ ≤ t_(k+1) − t_k`, so the sequence is Cauchy, converges in the complete space `E`,
and its limit is a zero in `B[x₀, t⋆]`. Uniqueness and the halving of the error come from the same
comparison with the majorant.

**Checks.**
- The scalar majorant itself: `f(t) = Lt²/2 − t + b` on `ℝ`, `x₀ = 0`, `A = −1` satisfies the
  hypotheses with these `L` and `b`. With `L = 1`, `b = 1/2` (so `2bL = 1`) both radii equal `1`,
  the iterates are `1/2, 3/4, 7/8, …, 1 − 2⁻ᵏ`, and `1 − x_(k+1) = (1 − x_k)/2` exactly: the
  factor `1/2` is attained and at `2bL = 1` the convergence is not quadratic.
- With `L = 1`, `b = 0.6` (so `2bL = 1.2`) the scalar majorant has no real zero and its Newton
  iterates `0.6, 1.05, −0.975, 0.0631, …` do not converge; the hypothesis `2bL ≤ 1` cannot be
  dropped. In Lean `√(1 − 2bL)` would be `0` there and the radius `1/L`, which bounds no zero.
- The hypothesis `0 < b` matters: if `f x₀ = 0` and `b = 0`, then `t⋆ = 0` and the open ball
  `B(x₀, 0)` is empty, while the sequence is constant at `x₀`.
- `b ≤ t⋆ ≤ 2b`, with `t⋆ → b` as `L → 0`: for an affine `f` the first step reaches the zero, at
  distance `‖A⁻¹ f(x₀)‖ ≤ b` from `x₀`.
- In the usual form, with `‖A⁻¹‖ ≤ β`, `f'` `L₀`-Lipschitz on `C` and `‖A⁻¹ f(x₀)‖ ≤ η`, the
  theorem applies with `L = βL₀` and `b = η`; its hypothesis is `h = βL₀η ≤ 1/2` and the radius is
  `(1 − √(1 − 2h))/(βL₀)`.
- On `ℝ²` with the norm `‖·‖∞`, let `f(x) = (x₁² − x₂ − 0.1, x₂² − x₁ − 0.05)` and `x₀ = 0`. Then
  `A = f'(0)` swaps the coordinates and changes their signs, `A⁻¹ f(0) = (0.05, 0.1)`, so `b = 0.1`,
  and `A⁻¹(f' y − f' x)` has norm `2‖x − y‖∞`, so `L = 2`. Here `2bL = 0.4` and
  `t⋆ = (1 − √0.6)/2 ≈ 0.1127`; the Newton iterates converge to the zero
  `≈ (−0.0403, −0.0984)`, at distance `≈ 0.0984 ≤ t⋆` from `x₀`.

*Needs:* 1.1, 1.2; Tau Ceti `ContinuousLinearMap.isInvertible_of_norm_sub_lt`,
`NormedRing.norm_inverse_one_sub_le`; Mathlib `ContinuousLinearMap.inverse_equiv`,
`HasFDerivAt.fderiv`, `cauchySeq_of_dist_le_of_summable`, `cauchySeq_tendsto_of_complete`.
(Proved here, except as cited.)

### 2.2 The quadratic rate

Prove `newtonKantorovich_quadratic`: under the hypotheses of 2.1 with `2bL < 1`, the Newton
sequence converges to a zero `x⋆` of `f` with

    ‖x⋆ − x_(k+1)‖ ≤ L / (2 √(1 − 2bL)) · ‖x⋆ − x_k‖²   for every k,

and `x⋆` is the only zero of `f` in `B[x₀, ρ]` for every `ρ` with
`kantorovichRadius L b ≤ ρ < kantorovichOuterRadius L b` and `B[x₀, ρ] ⊆ C` (Ferreira–Svaiter,
Theorem 1, inequality (4) and the last assertion, p. 2; (4) carries an extra factor at most `1`,
which is dropped here).

Route: the majorant has the simple zero `t⋆ < t⋆⋆`, and its Newton iterates satisfy
`t⋆ − t_(k+1) ≤ L/(2√(1 − 2bL)) (t⋆ − t_k)²`; the comparison of 2.1 transfers the bound. For
uniqueness in the larger ball, the majorant is negative on `(t⋆, t⋆⋆)`.

**Checks.**
- With `L = 1` and `b = 0.4`: `t⋆ ≈ 0.55279`, `t⋆⋆ ≈ 1.44721` and the constant is
  `1/(2√0.2) ≈ 1.11803`. The scalar majorant's iterates `0.4, 0.53333, 0.55238, 0.552786…` satisfy
  both the bound of 2.2 and the halving of 2.1.
- At `2bL = 1` the constant is undefined (in Lean `L/(2·0) = 0`), and the first Check of 2.1 shows
  that no quadratic bound holds; the strict inequality is needed.

*Needs:* 2.1. (Proved here, except as cited.)

### Examples

The scalar majorant `t ↦ Lt²/2 − t + b` at `2bL = 1`, `2bL < 1` and `2bL > 1`, and the map on
`ℝ²` of 2.1 with its constants computed in the norm `‖·‖∞`.

### Dependencies

Layer 1 (1.1, 1.2); Mathlib `ContinuousLinearMap.inverse_equiv`, `HasFDerivAt.fderiv`,
`cauchySeq_of_dist_le_of_summable`, `cauchySeq_tendsto_of_complete`; Tau Ceti
`ContinuousLinearMap.isInvertible_of_norm_sub_lt`, `NormedRing.norm_inverse_one_sub_le`.

## Layer 3: the BFGS and DFP updates

Throughout, `B` approximates a Hessian, `H` an inverse Hessian, `s` is a step and `y` the
corresponding change of gradient. A direct update should satisfy the secant equation `B₊s = y`,
an inverse update the equation `H₊y = s`.

### 3.1 The four updates and the secant equations

Define, with `ρ = (yᵀs)⁻¹`,

- `bfgsUpdate B s y = B − (sᵀBs)⁻¹ (Bs)(sᵀB) + ρ y yᵀ`;
- `bfgsInvUpdate H s y = (I − ρ s yᵀ) H (I − ρ y sᵀ) + ρ s sᵀ`;
- `dfpUpdate B s y = (I − ρ y sᵀ) B (I − ρ s yᵀ) + ρ y yᵀ`;
- `dfpInvUpdate H s y = H − (yᵀHy)⁻¹ (Hy)(yᵀH) + ρ s sᵀ`

(Dennis–Moré 1977, (7.18), (7.19), (7.25) and Theorem 7.8). Prove the secant equations:

- `bfgsUpdate_mulVec`: if `sᵀy ≠ 0` and `sᵀBs ≠ 0`, then `bfgsUpdate B s y *ᵥ s = y`.
- If `sᵀy ≠ 0`, then `dfpUpdate B s y *ᵥ s = y`, for every square `B`: the factor
  `I − ρ s yᵀ` kills `s`, so this follows by expanding the definition.

**Checks.**
- With `B = I` on `ℝ²`, `s = (1, 0)` and `y = (2, 1)`: `bfgsUpdate I s y = [[2, 1], [1, 3/2]]` and
  `dfpUpdate I s y = [[2, 1], [1, 7/4]]`. Both send `s` to `y`; they differ, so neither formula can
  stand for the other.
- Duality: `bfgsInvUpdate H s y = dfpUpdate H y s` and `dfpInvUpdate H s y = bfgsUpdate H y s`
  for every `H`, by inspection (Dennis–Moré 1977, (7.30)): each inverse formula is the other
  method's direct formula with `s` and `y` interchanged.
- The updates of a symmetric matrix are symmetric.
- With `s = 0` both direct updates return `B`, since all the reciprocals are `0`; for `y ≠ 0` the
  secant equation fails, so `sᵀy ≠ 0` is needed.
- With `B = [[0, 1], [1, 0]]`, `s = (1, 0)`, `y = (1, 1)`: `sᵀBs = 0`, the formula gives
  `[[1, 2], [2, 1]]`, which sends `s` to `(1, 2) ≠ y`; so `sᵀBs ≠ 0` is needed for BFGS.

*Needs:* Mathlib `Matrix.vecMulVec`, `Matrix.mulVec`, `dotProduct`. (Proved here.)

### 3.2 Positive definiteness

Prove, for `B` positive definite and `sᵀy ≠ 0`:

- `bfgsUpdate_posDef_iff`: `bfgsUpdate B s y` is positive definite if and only if `0 < sᵀy`;
- `dfpUpdate_posDef_iff`: `dfpUpdate B s y` is positive definite if and only if `0 < sᵀy`

(Dennis–Moré 1977, Theorem 7.7 for DFP; Theorem 7.8 for the inverse form of BFGS, which gives the
direct form through 3.3).

Route: if the update is positive definite, `sᵀy = sᵀB₊s > 0` by 3.1. Conversely, for BFGS,
`xᵀB₊x = xᵀBx − (sᵀBx)²/(sᵀBs) + (yᵀx)²/(yᵀs)`; the first two terms are nonnegative by the
Cauchy–Schwarz inequality for the inner product `(u, v) ↦ uᵀBv`, with equality only for `x` a
multiple of `s`, and then the last term is positive. For DFP, the first term
`((I − ρ s yᵀ)x)ᵀ B ((I − ρ s yᵀ)x)` vanishes only when `x` is a multiple of `s`, and then
`ρ(yᵀx)² > 0`.

**Checks.**
- With `B = diag(2, 1)`, `s = (1, 0)`, `y = (0, 1)` (so `sᵀy = 0`): the BFGS formula gives
  `diag(0, 1)`, singular, while the DFP formula gives `B`, because its reciprocal is `0`. So the
  equivalence fails for DFP without `sᵀy ≠ 0`.
- With the same `B`, `s = (1, 0)` and `y = (−1, 0)` (so `sᵀy = −1`): both updates equal
  `diag(−1, 1)`, which is not positive definite.

*Needs:* 3.1; Mathlib `Matrix.PosDef`, `Matrix.PosDef.dotProduct_mulVec_pos`, `discrim_le_zero`.
(Proved here, except as cited.)

### 3.3 The inverses of the updates

Prove, for `B` symmetric and invertible and `sᵀy ≠ 0`:

- `inv_bfgsUpdate`: if `sᵀBs ≠ 0`, then `(bfgsUpdate B s y)⁻¹ = bfgsInvUpdate B⁻¹ s y`;
- `inv_dfpUpdate`: if `yᵀB⁻¹y ≠ 0`, then `(dfpUpdate B s y)⁻¹ = dfpInvUpdate B⁻¹ s y`

(Dennis–Moré 1977, Theorems 7.8 and 7.7, where the extra condition is shown to be equivalent to the
invertibility of the inverse BFGS update and of the DFP update, respectively). For `B` positive
definite with `sᵀy > 0` both extra conditions hold.

Route: each update is `B` plus a matrix of rank at most two, `U C Uᵀ` with `U` of size `n × 2`;
the Woodbury identity, or a direct check that the product of the two sides is `I`, gives the
formula.

**Checks.**
- With `B = I`, `s = (1, 0)`, `y = (2, 1)`: `(bfgsUpdate I s y)⁻¹ = [[3/4, −1/2], [−1/2, 1]]` and
  `(dfpUpdate I s y)⁻¹ = [[0.7, −0.4], [−0.4, 0.8]]`, which are `bfgsInvUpdate I s y` and
  `dfpInvUpdate I s y`.
- With `B = [[0, 1], [1, 0]]`, `s = (1, 0)`, `y = (1, 1)` (so `sᵀBs = 0`): the formula for
  `bfgsUpdate` gives `[[1, 2], [2, 1]]`, which is invertible, while `bfgsInvUpdate B⁻¹ s y` is
  `diag(1, 0)`, which is singular; the hypothesis `sᵀBs ≠ 0` cannot be dropped.

*Needs:* 3.1; Mathlib `Matrix.add_mul_mul_inv_eq_sub`, `Matrix.inv_eq_left_inv` (or Tau Ceti's
Sherman–Morrison formula `Matrix.inv_add_vecMulVec`, applied twice). (Proved here, except as
cited.)

### 3.4 The least-change characterization

Prove `dfpUpdate_least_change`: let `B` be symmetric and `W` positive definite with `Ws = y`.
Then `dfpUpdate B s y` is symmetric, sends `s` to `y`, and for every other symmetric `X` with
`Xs = y`,

    trace (W⁻¹ (D − B) W⁻¹ (D − B)) < trace (W⁻¹ (X − B) W⁻¹ (X − B)),   D = dfpUpdate B s y.

The quantity is the square of the Frobenius norm of `W^(−1/2)(X − B)W^(−1/2)` (Dennis–Moré 1977,
Theorem 7.3 with `c = y`, stated there with a symmetric nonsingular weight `M` with
`My = M⁻¹s`; `W = M⁻²` turns that condition into `Ws = y`). The characterization is due to
Greenstadt and to Goldfarb.

Route: the objective is the quadratic form of `W⁻¹ ⊗ W⁻¹`, positive definite by Mathlib's
`Matrix.PosDef.kronecker`, evaluated at `X − B`. The feasible set is `D` plus the symmetric `Z`
with `Zs = 0`, and `trace(W⁻¹(D − B)W⁻¹Z) = 0` for every such `Z`, since `W⁻¹(D − B)W⁻¹` has the
form `a sᵀ + s aᵀ` (Dennis–Moré's computation with `z = My = M⁻¹s`). Hence the objective at `D + Z`
exceeds that at `D` by the form at `Z`, which is positive for `Z ≠ 0`.

**Checks.**
- With `W = I` the condition forces `s = y`. For `B = 0` and `s = y = (1, 0)`, `D = diag(1, 0)`;
  the symmetric `X` with `Xs = s` are `diag(1, c)`, at Frobenius distance `√(1 + c²)` from `B = 0`,
  least at `c = 0`.
- With `s = 0` the condition forces `y = 0`, and `D = B` with objective `0`.
- Applied to a symmetric `H` with `s` and `y` interchanged and a positive definite weight `M`
  with `My = s`, 3.4 and the duality Check of 3.1 say that `bfgsInvUpdate H s y` is the unique
  symmetric `X` with `Xy = s` that minimizes `trace(M⁻¹(X − H)M⁻¹(X − H))`.
- Positive definiteness of the weight is needed: with the symmetric, indefinite
  `M = diag(2, −1, 1)`, `y = (1, 1, 0)`, `s = My = (2, −1, 0)`, `H = 0` and the symmetric `Z` with
  rows `(0, 0, 1)`, `(0, 0, −1)`, `(1, −1, 0)`, which satisfies `Zy = 0`, the objective at
  `bfgsInvUpdate H s y + tZ` is `1 − t²`, unbounded below.

*Needs:* 3.1; Mathlib `Matrix.PosDef.kronecker`, `Matrix.PosDef.inv`,
`Matrix.PosDef.dotProduct_mulVec_pos`, `Matrix.trace_mul_comm`. (Proved here, except as cited.)

### Examples

The updates of `I` along `s = (1, 0)`, `y = (2, 1)` with their inverses; `diag(2, 1)` with
`sᵀy = 0` and `sᵀy < 0`; the indefinite `[[0, 1], [1, 0]]` with `sᵀBs = 0`.

### Dependencies

Mathlib `Matrix.vecMulVec`, `Matrix.mulVec`, `dotProduct`, `Matrix.PosDef`,
`Matrix.PosDef.dotProduct_mulVec_pos`, `Matrix.PosDef.inv`, `Matrix.PosDef.kronecker`,
`Matrix.add_mul_mul_inv_eq_sub`, `Matrix.inv_eq_left_inv`, `Matrix.trace_mul_comm`,
`discrim_le_zero`. No other layer.

## Layer 4: the Dennis–Moré characterization

### 4.1 Superlinear convergence

Prove `superlinear_iff_dennisMore`: let `E` be a finite-dimensional real normed space, `D ⊆ E`
open and convex, `f : E → E` with Gâteaux derivative `f' z` at every `z ∈ D` (for every direction
`h`, `HasLineDerivAt ℝ f (f' z h) z h`), `f'` continuous at `x⋆ ∈ D` and `f' x⋆` invertible. Let
`B_k` be invertible, `x_(k+1) = x_k − B_k⁻¹ f(x_k)`, `x_k ∈ D` for all `k`, `x_k → x⋆`, and
`x_k ≠ x⋆` for all large `k`. Then

    (‖x_(k+1) − x⋆‖ / ‖x_k − x⋆‖ → 0 and f x⋆ = 0)  ⟺  ‖(B_k − f' x⋆) s_k‖ / ‖s_k‖ → 0,

where `s_k = x_(k+1) − x_k` (Dennis–Moré 1974, Theorem 2.2, p. 551; Dennis–Moré 1977,
Theorem 3.1, states the form with `f(x⋆) = 0` assumed).

Route: `(B_k − f' x⋆) s_k = (f(x_(k+1)) − f(x_k) − f' x⋆ s_k) − f(x_(k+1))`, and the bracket is
`o(‖s_k‖)` by the mean value inequality along the segment, using the Gâteaux derivatives and the
continuity of `f'` at `x⋆`. So the right side is equivalent to `‖f(x_(k+1))‖/‖s_k‖ → 0`, which
forces
`f x⋆ = 0`. Near `x⋆`, `‖f x‖` is bounded below by a multiple of `‖x − x⋆‖` since `f' x⋆` is
invertible, and `‖s_k‖ ≤ ‖x_(k+1) − x⋆‖ + ‖x_k − x⋆‖`; this gives superlinear convergence.
Conversely superlinear convergence gives `‖s_k‖/‖x_k − x⋆‖ → 1` (Dennis–Moré 1974, Lemma 2.1),
and `‖f(x_(k+1))‖` is at most a multiple of `‖x_(k+1) − x⋆‖`. Once `x_k ≠ x⋆` for all large `k`,
also `s_k ≠ 0` for all large `k`, since `s_k = 0` would make the sequence constant from `k` on.

**Checks.**
- Newton's sequence, `B_k = f'(x_k)`, satisfies the right side when `f'` is continuous at `x⋆`,
  since the quotient is at most `‖f'(x_k) − f'(x⋆)‖`.
- For `f(x) = x + x²` on `ℝ`, `x⋆ = 0` and the constant `B_k = 2 = 2 f'(0)`, from `x₀ = 0.5` the
  iterates `x_(k+1) = (x_k − x_k²)/2` converge to `0` with ratio tending to `1/2`
  (`0.25, 0.4375, 0.4727, …`), and the quotient on the right is `|2 − 1| = 1` for every `k`:
  neither side holds.
- The right side constrains `B_k` only along the steps `s_k`, so it can hold without `B_k`
  converging to `f'(x⋆)`.

*Needs:* Mathlib `HasLineDerivAt`, `norm_image_sub_le_of_norm_deriv_le_segment'`,
`ContinuousLinearMap.IsInvertible`, `ContinuousLinearMap.inverse`,
`ContinuousLinearEquiv.antilipschitzWith`. (Proved here, except as cited.)

### Examples

The scalar map `x + x²` with a fixed matrix, and Newton's sequence. In one dimension, the secant
method takes `B_k` to be the difference quotient of `f` between `x_(k−1)` and `x_k`; when its
iterates are distinct and converge to `x⋆` with `f'` continuous at `x⋆`, the mean value theorem
gives `B_k → f'(x⋆)`, so the right side holds.

### Dependencies

Mathlib `HasLineDerivAt`, `norm_image_sub_le_of_norm_deriv_le_segment'`,
`ContinuousLinearMap.IsInvertible`, `ContinuousLinearMap.inverse`,
`ContinuousLinearEquiv.antilipschitzWith`. No other layer.

## Layer 5: quadratic termination

### 5.1 Broyden's class and exact line searches on a quadratic

Define `broydenInvUpdate φ H s y = (1 − φ) • dfpInvUpdate H s y + φ • bfgsInvUpdate H s y`;
`φ = 0` is DFP and `φ = 1` is BFGS. For a symmetric positive definite `A` and a vector `b`, let
`q(x) = xᵀAx/2 − bᵀx`, whose minimizer is `A⁻¹b`. Define `quadraticStep A b φ (x, H)`: with
`g = Ax − b`, `d = Hg` and the exact line-search step `s = −((gᵀd)/(dᵀAd)) d`, the pair
`(x + s, broydenInvUpdate φ H s (As))`. Define `quadraticSeq A b φ x₀ H₀` by
`quadraticSeq … 0 = (x₀, H₀)` and step `k + 1` obtained by `quadraticStep` with `φ k`. At a point
with `g = 0` the step is `0` and the matrix is unchanged, since all reciprocals are `0`.

**Checks.**
- For positive definite `H` and `sᵀy > 0`, `broydenInvUpdate φ H s y` equals Dennis–Moré's form
  `H_DFP + φ vvᵀ` with `v = (yᵀHy)^(1/2) (s/(sᵀy) − Hy/(yᵀHy))` (Dennis–Moré 1977, (7.26) and
  (8.6)).
- With `A = diag(1, 2)`, `b = (1, 1)`, `x₀ = 0`, `H₀ = I`: for every `φ`, `x₁ = (2/3, 2/3)`; the
  BFGS matrix is `H₁ = [[11/9, −1/9], [−1/9, 5/9]]` and the DFP matrix
  `H₁ = [[17/15, −1/15], [−1/15, 8/15]]`; for `φ = 0` and for `φ = 1`, `x₂ = (1, 1/2) = A⁻¹b` and
  `H₂ = diag(1, 1/2) = A⁻¹`.
- Starting at the minimizer, the sequence is constant: `x_k = x₀` and `H_k = H₀` for all `k`.

*Needs:* 3.1. (Definitions.)

### 5.2 Quadratic termination

Prove `quadraticSeq_terminates`: if `A` and `H₀` are positive definite and `φ k ≥ 0` for every
`k`, then some `x_l` with `l ≤ n` equals `A⁻¹b`, and if no `x_k` with `k < n` does, then
`H_n = A⁻¹` (Dennis–Moré 1977, Theorem 8.1, with the exact step (8.4) and Broyden's class (8.6)).
The theorem is due to Broyden.

Route: by induction, while the gradient is nonzero, `H_k` is positive definite (3.2 through 3.3,
or directly for the inverse forms), the steps are `A`-conjugate (`s_iᵀAs_j = 0` for `i ≠ j`), and
`H_k y_j = s_j` for `j < k`, since each inverse update satisfies `H₊y = s` and preserves the
earlier relations by conjugacy. Then `g_k` is orthogonal to `s_0, …, s_(k−1)`, so after `n` nonzero
steps the gradient vanishes, and `H_n A s_j = s_j` for the `n` independent `s_j` gives
`H_n = A⁻¹`.

**Checks.**
- With `A = diag(1, 3)`, `b = (1, 0)`, `x₀ = 0`, `H₀ = I` and `φ = 1`: `g₀` is an eigenvector of
  `A`, `x₁ = (1, 0) = A⁻¹b`, and `H_k = I ≠ A⁻¹` for every `k`; the second assertion needs every
  `x_k` with `k < n` to differ from the minimizer.
- Some lower bound on `φ` is needed, and `φ ≥ 0` is a sufficient one. In the example of 5.1,
  `det H₁ = (φ₀ + 9)/15`: for `φ₀ > −9` the matrix `H₁` is positive definite and `x₂ = A⁻¹b`, but
  at `φ₀ = −9`, `H₁ = [[1/3, 1/3], [1/3, 1/3]]` is singular with `H₁ g₁ = 0` for
  `g₁ = (−1/3, 1/3)`, so every subsequent step is `0` and `x_k = (2/3, 2/3) ≠ (1, 1/2)` for all
  `k ≥ 1`.
- If `n = 0` both assertions hold trivially: `x₀ = A⁻¹b` and `H₀ = A⁻¹` in the zero-dimensional
  space.

*Needs:* 3.1, 3.2, 3.3, 5.1; Mathlib `Matrix.PosDef`, `Matrix.PosDef.dotProduct_mulVec_pos`,
`Matrix.PosDef.isUnit`. (Proved here, except as cited.)

### Examples

The quadratic with `A = diag(1, 2)`, `b = (1, 1)` under BFGS, DFP and the parameter `−9`; the
quadratic with `A = diag(1, 3)` that terminates after one step.

### Dependencies

Layer 3 (3.1, 3.2, 3.3); Mathlib `Matrix.PosDef`, `Matrix.PosDef.dotProduct_mulVec_pos`,
`Matrix.PosDef.isUnit`.

## Scope and ownership

This roadmap owns the definitions and theorems above: the Newton map and the Newton sequence of a
map between real normed spaces, the quadratic remainder estimate, local quadratic convergence with
the radius `2/(3K)` and the uniqueness of the zero, the Newton–Kantorovich theorem with its
quadratic form, the BFGS and DFP updates of a matrix and of its inverse with their secant
equations, positive definiteness, inverses and the least-change characterization, the Dennis–Moré
characterization, and quadratic termination of Broyden's class.

Already in the libraries and therefore not targets:

- Mathlib's Newton map of a polynomial, `Polynomial.newtonMap` in `Mathlib/Dynamics/Newton.lean`,
  with its fixed points (`Polynomial.isFixedPt_newtonMap_of_isUnit_iff`) and its use for lifting
  approximate roots modulo nilpotents
  (`Polynomial.existsUnique_nilpotent_sub_and_aeval_eq_zero`). It is algebraic: it acts on any
  commutative algebra and no convergence in a norm is stated. On real polynomials it agrees with
  `newtonMap`, as the Check of 1.1 says.
- Hensel's lemma over the `p`-adic integers, `hensels_lemma` in
  `Mathlib/NumberTheory/Padics/Hensel.lean`, a Newton-type existence theorem for polynomial roots
  in a nonarchimedean setting. The Newton–Kantorovich theorem of 2.1 is a different statement, on
  real Banach spaces.
- The inverse function theorem, `HasStrictFDerivAt.toOpenPartialHomeomorph` in
  `Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean`, and Tau Ceti's
  `ApproximatesLinearOn.exists_eq_zero_of_two_mul_norm_le` in
  `TauCeti/Analysis/Calculus/ApproximatesLinearOn.lean`: a map within `c` of one fixed linear
  equivalence `f'` on a closed ball `B[b, r]`, with `2Cc ≤ 1` and `2C‖f b‖ ≤ r` for a bound
  `C > 0` on `‖f'⁻¹‖`, has a zero within `2C‖f b‖` of the centre `b`, the only zero in the ball. Neither concerns the Newton sequence, its radius of convergence
  or its rate, and neither is restated; the existence part of 2.1 is a different theorem, with the
  Lipschitz constant of the derivative in place of a uniform approximation.
- The Woodbury identity `Matrix.add_mul_mul_inv_eq_sub`, Tau Ceti's Sherman–Morrison formula
  `Matrix.inv_add_vecMulVec` and the positive definiteness of Kronecker products
  `Matrix.PosDef.kronecker`, used in 3.3 and 3.4. The inverses of the BFGS and DFP updates are not
  stated there.
- Tau Ceti's invertibility of a perturbed continuous linear equivalence
  (`ContinuousLinearMap.isInvertible_of_norm_sub_lt`) and the Neumann-series bound
  `NormedRing.norm_inverse_one_sub_le`, used in Layers 1 and 2.

No roadmap on the main branch states any target of this roadmap or is a supplier.

Two open roadmaps, not on main, state scalar forms of the estimate of 1.2. FirstOrderOptimization
1.1 states, for a real function on the whole space with a Lipschitz gradient, the two-sided
bound of the remainder by `(K/2)‖y − x‖²`, which is the case `F = ℝ`, `S = E` of 1.2;
SpectralSteepestDescent 5.1 states the one-sided bound from above. This roadmap owns only the
form for maps into a normed space on a convex set, which the Newton step needs, and does not
depend on either.

Not treated here: first-order methods; Newton's method on Riemannian manifolds; matrix iterations
of Newton–Schulz type; the Newton decrement, self-concordant functions and interior-point methods;
damped Newton steps, line-search conditions of Armijo and Wolfe type, and trust regions; global
convergence of BFGS and DFP; the local superlinear convergence of the BFGS, DFP and Broyden
methods; Broyden's update for nonlinear systems, the symmetric rank-one update and the
Powell-symmetric-Broyden update; Gauss–Newton and inexact Newton methods; Smale's point estimates;
implementations, stopping rules and operation counts.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Calculus/FDeriv/Defs.lean`: `fderiv`, `HasFDerivAt`, `HasFDerivWithinAt`.
  `Mathlib/Analysis/Calculus/FDeriv/Basic.lean`: `HasFDerivAt.fderiv` (`HasFDerivAt f f' x` implies `fderiv 𝕜 f x = f'`).
- `Mathlib/Analysis/Calculus/Deriv/Comp.lean`: `HasFDerivWithinAt.comp_hasDerivWithinAt` (the
  chain rule for a map with a derivative within a set composed with a curve into that set) and
  `HasFDerivAt.comp_hasDerivAt` (the same at an interior point).
- `Mathlib/Analysis/Calculus/LineDeriv/Basic.lean`: `HasLineDerivAt 𝕜 f f' x v` (the derivative of
  `t ↦ f (x + t • v)` at `0` is `f'`).
- `Mathlib/Analysis/Calculus/MeanValue.lean`:
  `image_norm_le_of_norm_deriv_right_le_deriv_boundary` (a function whose right derivative is
  bounded in norm by the derivative of a real function `B`, and which starts below `B`, stays below
  `B` on an interval); `norm_image_sub_le_of_norm_deriv_le_segment'` (on `[a, b]`, a derivative within
  `[a, b]` bounded by `C` on `[a, b)` gives `‖f x − f a‖ ≤ C(x − a)`).
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`:
  `intervalIntegral.integral_eq_sub_of_hasDerivAt` (for `f` with derivative `f'` on `[a, b]` and
  `f'` interval integrable, `∫ f' = f b − f a`).
- `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Invertible.lean`:
  `ContinuousLinearMap.IsInvertible` (the map is a continuous linear equivalence),
  `ContinuousLinearMap.inverse` (its inverse, `0` for a map that is not an equivalence),
  `ContinuousLinearMap.inverse_equiv` (`(e : M →L[R] M₂).inverse = e.symm`).
- `Mathlib/Analysis/Normed/Operator/NormedSpace.lean`: `ContinuousLinearEquiv.antilipschitzWith`
  (a continuous linear equivalence `e` is antilipschitz with constant `‖e.symm‖₊`).
- `Mathlib/Topology/Algebra/InfiniteSum/Real.lean`: `cauchySeq_of_dist_le_of_summable`
  (successive distances bounded by a summable sequence give a Cauchy sequence).
  `Mathlib/Topology/UniformSpace/Cauchy.lean`: `cauchySeq_tendsto_of_complete`.
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.vecMulVec`, `Matrix.mulVec`, `dotProduct`.
- `Mathlib/LinearAlgebra/Matrix/PosDef.lean`: `Matrix.PosDef` (Hermitian, here symmetric, with
  `0 < xᵀMx` for `x ≠ 0`); `Matrix.PosDef.dotProduct_mulVec_pos`; `Matrix.PosDef.isUnit`;
  `Matrix.PosDef.inv` (the inverse of a positive definite matrix over a field is positive
  definite).
- `Mathlib/Analysis/Matrix/Order.lean`: `Matrix.PosDef.kronecker` (the Kronecker product of two
  positive definite matrices over `ℝ` or `ℂ` is positive definite).
- `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean`: `Matrix.add_mul_mul_inv_eq_sub` (the
  Woodbury identity, for `A`, `C` and `C⁻¹ + V A⁻¹ U` invertible); `Matrix.inv_eq_left_inv`
  (`B * A = 1` implies `A⁻¹ = B`).
- `Mathlib/LinearAlgebra/Matrix/Trace.lean`: `Matrix.trace_mul_comm`.
- `Mathlib/Algebra/QuadraticDiscriminant.lean`: `discrim_le_zero` (a quadratic polynomial that is
  nonnegative everywhere has nonpositive discriminant).
- `Mathlib/Dynamics/Newton.lean`: `Polynomial.newtonMap`, used only in a Check of 1.1.

### From Tau Ceti

- `TauCeti/Analysis/Calculus/ContinuousLinearMapInverse.lean`:
  `ContinuousLinearMap.isInvertible_of_norm_sub_lt` (for a complete `E`, a continuous linear
  equivalence `L` and `A` with `‖A − L‖₊ < ‖L.symm‖₊⁻¹`, `A` is invertible).
- `TauCeti/Analysis/Normed/Ring/Units.lean`: `NormedRing.norm_inverse_one_sub_le` (in a normed
  ring with summable geometric series, `‖x‖ < 1` implies
  `‖Ring.inverse (1 − x)‖ ≤ ‖1‖ − 1 + (1 − ‖x‖)⁻¹`; for continuous linear endomorphisms of a
  nonzero Banach space `‖1‖ = 1`).
- `TauCeti/LinearAlgebra/Matrix/SchurComplement.lean`: `Matrix.inv_add_vecMulVec` (for an invertible
  `A` over a commutative ring and `1 + vᵀA⁻¹u` a unit, `(A + u vᵀ)⁻¹` is given by the
  Sherman–Morrison formula), an alternative route in 3.3.

No Tau Ceti declaration is used by a statement of `Suggested.lean`, which imports only Mathlib.

## References

- O. P. Ferreira and B. F. Svaiter, *Kantorovich's Theorem on Newton's Method*, arXiv:1209.5704,
  version 1 (2012, dated 2007 in the text); the page numbers above are those of that version.
- O. P. Ferreira, *Local convergence of Newton's method under majorant condition*,
  arXiv:1002.4534, version 1 (2010); the theorem, remark, equation and page numbers above are those
  of that version.
- J. E. Dennis, Jr. and J. J. Moré, *A characterization of superlinear convergence and its
  application to quasi-Newton methods*, Math. Comp. 28 (1974), 549–560,
  doi:10.1090/S0025-5718-1974-0343581-1.
- J. E. Dennis, Jr. and J. J. Moré, *Quasi-Newton methods, motivation and theory*, SIAM Rev. 19
  (1977), 46–89, doi:10.1137/1019005; read in the open copy HAL hal-01495720 (version 1, a
  typescript with its own pagination, so no page numbers are cited); the theorem and equation
  numbers above are those of that copy.
- Attributions made in prose without a locator: L. V. Kantorovich (the Newton–Kantorovich theorem,
  1948); C. G. Broyden (quadratic termination for his class, 1967); J. Greenstadt and D. Goldfarb
  (variational derivations of the updates, 1970); W. C. Davidon, R. Fletcher and M. J. D. Powell
  (the DFP update); C. G. Broyden, R. Fletcher, D. Goldfarb and D. F. Shanno (the BFGS update,
  1970).
