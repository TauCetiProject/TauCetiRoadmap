# Roadmap: echo states and random features

**Summary.** A reservoir is a map `F : X × U → X` driving a state in a metric space by inputs
from a set `U`. Fed an input history that reaches infinitely far into the past, it
produces state sequences with `x(t) = F(x(t − 1), u(t))`; the reservoir has *echo states* on a set
`A` of admissible states when every input history admits exactly one such state sequence in `A`,
and *fading memory* when the current state depends continuously on the history (product
topology). Its headline theorems:

- *Existence and contraction.* If `A` is nonempty and compact, `F` maps `A × U` into `A` and is
  continuous in the state, every history has a solution in `A`. If moreover each `F(·, u)` is an
  `r`-contraction on `A` with `r < 1` and `F` is jointly continuous, the reservoir has echo
  states and fading memory, and two histories that agree on their last `n` inputs give states
  within `r^n · diam A`. A reservoir within `δ` of such a contraction keeps every solution in `A`
  within `δ/(1 − r)` of the echo.
- *Networks.* The echo state network `x ↦ tanh(A x + C u + ζ)` has echo states and fading
  memory for all real inputs when the largest singular value of `A` is less than one. The
  spectral radius does not suffice: a `2 × 2` matrix of spectral radius `1/2` gives two
  fixed points. For the linear reservoir `x ↦ A x + C u`, every bounded history has exactly one
  bounded solution if and only if the spectral radius of `A` is less than one.
- *Finite alphabets.* If `U` is finite and the maps `F(·, u)` form an iterated function system
  on a nonempty complete space, the bounded solutions are the shifts of its coding map, and the states
  they reach form its attractor.
- *Random features.* If `f*(y) = ∫ β(w) φ(y, w) dp(w)` with `p` a probability law, `|β| ≤ C`
  and `|φ| ≤ 1`, and `f̂` averages `β(w_k) φ(·, w_k)` over `K ≥ 1` independent draws from `p`,
  then the mean squared `L²(μ)` error is at most `C² μ(Y)/K` for every finite measure `μ`, and for
  a probability measure `μ` and every `δ > 0` the error is at most `(C/√K)(1 + √(2 log(1/δ)))`
  with probability at least `1 − δ`.

The network maps are built from the dense layer and the hyperbolic tangent layer of Tau Ceti's
neuromanifold library, the formalization of Neuromanifolds. The linear reservoir rests on the
criterion of IterativeMethodsForLinearSystems that matrix powers tend to zero exactly when the
spectral radius is below one; the finite-alphabet layer rests on the coding map and attractor of
FractalGeometry; the high-probability bound rests on McDiarmid's inequality in Tau Ceti.

Layer 1 proves existence, the contraction theorem and internal approximation. Layer 2 treats echo state networks and linear reservoirs. Layer 3
identifies echo states over a finite alphabet with the coding map. Layer 4, independent of the
others, proves the random-feature bounds.

## Conventions

- **Input histories.** A history is `z : ℕ → U` read backwards in time: `z 0` is the current
  input and `z k` the input `k` steps earlier. Jaeger's left-infinite sequence `…, u(n − 1), u(n)`
  is `z k = u(n − k)`, and Grigoryeva–Ortega's `z(t)`, `t ≤ 0`, is `z k = z(−k)`. The history
  that ended `k` steps ago is `fun j => z (j + k)`. Histories carry the product topology.
- **Solutions.** `x : ℕ → X` solves the reservoir equation of `F : X → U → X` for `z`
  (`IsSolution F z x`) when `x k = F (x (k + 1)) (z k)` for every `k`: the state `x k` is the
  state after the input `z k`. The map takes the state first and the input second.
- **Echo states.** `HasEchoStates F A` means that every history has exactly one solution with all
  its states in `A`. This is the definition of Grigoryeva–Ortega (existence and uniqueness);
  Jaeger's Definition 1 asks only for uniqueness, under his standing assumption that `U` and `A`
  are compact and `A` is mapped into itself, and 1.1 shows that existence then holds whenever `F`
  is continuous in the state. Echo states are always relative to `A`: a solution leaving `A` is
  not counted.
- **Echo function and fading memory.** The echo function `E` sends a history to the current state
  (Jaeger's echo functions, eq. (3)); its solutions are then `x k = E (fun j => z (j + k))`.
  Fading memory is continuity of `E` for the product topology. For inputs in a ball of `ℝ^n` this
  is Grigoryeva–Ortega's fading memory property for every weighting sequence, by their
  Theorem 2.6 (the weighted metrics all induce the product topology on uniformly bounded
  sequences). Statements are for a metric state space `X` and any input set; the contraction
  ratio `r` is a nonnegative real (`ℝ≥0`) and Lipschitz conditions are Mathlib's
  `LipschitzOnWith`.
- **Networks.** States are `ι → ℝ` and inputs `κ → ℝ` for finite types `ι`, `κ`, possibly empty.
  The dense layer `dense (A, b) x = A *ᵥ x + b` and the coordinatewise layer `tanhActivation` are
  Tau Ceti's. The largest singular value of a real matrix is Mathlib's operator norm for the
  Euclidean norms, `‖A‖` under `open scoped Matrix.Norms.L2Operator`. The spectral radius of a
  real matrix is Mathlib's `spectralRadius ℂ` of the same matrix over `ℂ`; the spectral radius
  over `ℝ` would miss complex eigenvalues. Bounded means `Bornology.IsBounded` of the range (for
  the sup norm on `ι → ℝ`; every norm gives the same notion).
- **Random features.** `Ω` and `Y` are measurable spaces, `p` a probability measure on `Ω` (the
  sampling law), `μ` a finite measure on `Y` (the input law), `φ : Y → Ω → ℝ` the feature map and
  `β : Ω → ℝ` the coefficient function. The `K` independent draws are the product law
  `Measure.pi fun _ : Fin K => p` on `Fin K → Ω`. Rahimi–Recht write the target with a weight
  `α(w)` and a density `p(w)` as `∫ α(w) φ(x; w) dw` with `|α| ≤ C p`; here `α = β p`, so the
  target is `∫ β φ dp` with `|β| ≤ C` and `p` need not have a density.
- **Junk values.** `0⁻¹ = 0` in `ℝ`, `Real.log 0 = 0`, and `√t = 0` for `t < 0`. The statements
  of Layer 4 assume `K ≥ 1` and `δ > 0` for this reason (Checks in 4.1 and 4.2).

## Layer 1: echo states and fading memory

### 1.1 Solutions exist on compact invariant sets

Define `IsSolution` and `HasEchoStates` as in the conventions. Prove
`exists_isSolution_of_isCompact`: if `A ⊆ X` is nonempty and compact, `F x u ∈ A` for all
`x ∈ A` and all `u`, and every `F (·) u` is continuous on `A`, then every history `z` has a
solution with all its states in `A`. Grigoryeva–Ortega prove this for compact convex subsets of
`ℝ^N` and jointly continuous `F` by Schauder's fixed point theorem (Theorem 3.1(i), p. 11, and
the remark after it); the statement here drops convexity and joint continuity, and the route below
is complete.

Route: in the product `A^ℕ`, compact by Tychonoff, let `S_m` be the set of sequences that satisfy
the reservoir equation for `k < m`. Each `S_m` is closed, since `x ↦ x k` and
`x ↦ F (x (k + 1)) (z k)` are continuous on `A^ℕ` and `X` is Hausdorff. Each is nonempty: put
`x j = a` for a fixed `a ∈ A` and all `j ≥ m`, and define `x (m − 1), …, x 0` downwards by the
equation, which stays in `A` because `A` is mapped into itself. The `S_m` decrease, so their
intersection is nonempty, and any of its points is a solution.

**Checks.**
- Compactness is needed: on `A = (0, 1] ⊆ ℝ` the map `x ↦ x/2` is continuous, `1/2`-Lipschitz
  and maps `A` into itself, but a solution would satisfy `x 0 = 2^(−k) x k ≤ 2^(−k)` for every
  `k`, forcing `x 0 = 0 ∉ A`.
- Continuity is needed: on `A = [0, 1]` let `F 0 = 1` and `F x = x/2` for `x > 0`. A solution
  never contains `0` (no point is mapped to `0`), so `x k = 2^k x 0` for all `k`, which leaves
  `[0, 1]`.
- Existence without uniqueness: for `F x u = tanh(2x)` on `A = [−1, 1]` the constants `0`, `s`
  and `−s` are solutions, where `s ∈ (1/10, 1)` solves `tanh(2s) = s` (the function
  `tanh(2s) − s` is positive at `1/10`, because `e^(2/5) > 7/5 > 11/9`, and negative at `1`).
  This is Jaeger's scalar example (p. 9).

*Needs:* Mathlib `isCompact_univ_pi`,
`IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed`.

### 1.2 Contractions have echo states and fading memory

Prove `hasEchoStates_of_lipschitzOnWith`: let `A` be nonempty, compact and mapped into itself by
`F`, let every `F (·) u` be `r`-Lipschitz on `A` with `r < 1`, and let `F` be continuous on
`A × U` (for a topology on `U`). Then `HasEchoStates F A` holds, and there is a continuous
`E : (ℕ → U) → X` such that every solution `x` with states in `A` is `x k = E (fun j => z (j + k))`,
and such that `dist (E z) (E z') ≤ r^n · diam A` whenever `z k = z' k` for all `k < n`.

Sources: Grigoryeva–Ortega, Theorem 3.1(ii), p. 11, proof pp. 12–13, for closed balls (or
compact sets) of `ℝ^N` and inputs in a compact set of `ℝ^n`; Jaeger, Proposition 3(a), p. 8,
proof in Appendix C, p. 41, for uniqueness. The statement here allows any metric space `X` and
any topological space `U`, and adds the explicit modulus `r^n · diam A`, which is proved here.

Route: existence is 1.1, since a Lipschitz map is continuous. If `x`, `x'` are solutions in `A`
for histories that agree below `n`, then `dist (x k) (x' k) ≤ r · dist (x (k+1)) (x' (k+1))` for
`k < n`, hence `dist (x 0) (x' 0) ≤ r^n · dist (x n) (x' n) ≤ r^n · diam A`. For `z = z'` and
all `n` this gives uniqueness, since `r^n → 0`. Define `E z` as the state at time `0` of the
solution for `z`. Shifting a solution for `z` by `k` gives a solution for `fun j => z (j + k)`,
so `x k = E (fun j => z (j + k))` by uniqueness, and the modulus holds. For continuity at `z`,
fix `ε > 0`, choose `n` with `r^n · diam A < ε/2`, and use compactness of `A` and continuity of
`(u, x) ↦ F x u` on `U × A` to find neighbourhoods `V_k` of `z k` (`k < n`) with
`dist (F x u) (F x (z k)) < η` for all `x ∈ A`, `u ∈ V_k`, where `η = (1 − r) ε / 2`. For `z'`
with `z' k ∈ V_k` the differences `e_k = dist (x k) (x' k)` satisfy `e_k ≤ r e_(k+1) + η`, so
`e_0 ≤ r^n · diam A + η/(1 − r) < ε`.

**Checks.**
- The modulus is attained: on `A = [0, 1]` with `U = {0, 1}` (discrete) and
  `F x u = r x + (1 − r) u`, the echo is `E z = (1 − r) Σ_j r^j z j`, and for `z` and `z'` equal
  to `0` below `n` and to `1`, resp. `0`, from `n` on, `E z − E z' = r^n`, with `diam A = 1`.
- The zero reservoir `F x u = g u` (`r = 0`) has echo `E z = g (z 0)`: only the current input
  counts, and the modulus `0^n · diam A` is `diam A` for `n = 0` and `0` for `n ≥ 1`.
- A spectral radius above one does not exclude echo states: `F x u = tanh(2x + u)` with inputs in
  `U = [3, 4]` maps `A = [−1, 1]` into itself, and there the argument `2x + u` is at least `1`,
  so the derivative is at most `2(1 − tanh(1)²) < 1`, because `tanh(1)² > 1/2` (equivalently
  `e² > 3 + 2√2`, which holds as `e² > 6 > 3 + 2√2`). So the reservoir has echo states and fading
  memory, although the scalar weight `2` has spectral radius `2` and, with `0` allowed as an
  input, the same weight gives three solutions (1.1). This is Jaeger's example (p. 9); his hint
  there, `tanh(x) < 1/2` for `x ≥ 1`, is a misprint for the bound `1 − tanh(x)² < 1/2` on the
  derivative of `tanh`, which is the bound used here.
- With `A = ∅` (and `U` nonempty) every hypothesis except nonemptiness holds and the echo state
  property fails, since no history has a solution in `∅`.

*Needs:* 1.1; Mathlib `LipschitzOnWith`, `LipschitzOnWith.continuousOn`,
`IsCompact.mem_uniformity_of_prod`, `Metric.diam`, `tendsto_pow_atTop_nhds_zero_of_lt_one`.

### 1.3 Internal approximation

Prove `dist_le_of_lipschitzOnWith`: let `A` be bounded, every `F₁ (·) u` be `r`-Lipschitz on `A`
with `r < 1`, and `dist (F₁ x u) (F₂ x u) ≤ δ` for all `x ∈ A` and all `u`. If `x₁` and `x₂` are
solutions of the reservoir equations of `F₁` and of `F₂` for the same history, with all states in
`A`, then `dist (x₁ k) (x₂ k) ≤ δ/(1 − r)` for every `k`. No continuity and no uniqueness for
`F₂` is assumed. Grigoryeva–Ortega, Theorem 3.1(iii), p. 11, proof pp. 13–14 (the estimate
(3.4)), state it with a strict inequality between the sup distance of the reservoir maps and
`(1 − r) ε`; the form here gives theirs.

Route: `e_k = dist (x₁ k) (x₂ k)` is at most the distance from `F₁ (x₁ (k+1)) (z k)` to
`F₁ (x₂ (k+1)) (z k)`, at most `r e_(k+1)`, plus the distance from `F₁ (x₂ (k+1)) (z k)` to
`F₂ (x₂ (k+1)) (z k)`, at most `δ`; so `e_k ≤ r^m · diam A + δ (1 + r + … + r^(m−1))` for every `m`;
let `m → ∞`.

**Checks.**
- The bound is attained: on `ℝ` with `A = [0, 2]`, `F₁ x u = x/2` and `F₂ x u = x/2 + 1` map `A`
  into itself and differ by `δ = 1`; their solutions `0` and `2` (constant) are at distance
  `2 = δ/(1 − 1/2)`.
- With `F₁ = F₂` and `δ = 0` it recovers the uniqueness of 1.2.

*Needs:* Mathlib `LipschitzOnWith`, `Metric.diam`, `tendsto_pow_atTop_nhds_zero_of_lt_one`.

### Examples

The checks of 1.2 give a reservoir whose echo function is a weighted digit expansion; Layer 3
takes it up for finite alphabets.

### Dependencies

Mathlib only. 1.2 uses 1.1.

## Layer 2: echo state networks and linear reservoirs

### 2.1 The echo state network

Define `esnMap A C ζ`, for `A : Matrix ι ι ℝ`, `C : Matrix ι κ ℝ` and `ζ : ι → ℝ`, as
`x, u ↦ tanhActivation () (dense (A, C *ᵥ u + ζ) x)`, so that its coordinate `i` is
`tanh(Σ_j A i j · x j + (C *ᵥ u) i + ζ i)`. Prove `hasEchoStates_esnMap`: if `‖A‖ < 1` for the
Euclidean operator norm, then `HasEchoStates (esnMap A C ζ) univ`, and there is a continuous echo
function `E : (ℕ → κ → ℝ) → ι → ℝ` with `x k = E (fun j => z (j + k))` for every solution.

Sources: Jaeger, Proposition 3(a), p. 8, proof in Appendix C, p. 41 (uniqueness, for inputs in a
compact set and states in `[−1, 1]^N`); Grigoryeva–Ortega, Corollary 3.2(ii), p. 14, proof
p. 24, for a differentiable squashing function with bounded derivative and inputs in a compact
convex set (echo states and fading memory). The statement here is for the hyperbolic tangent and allows every input history
in `ℝ^κ`, bounded or not.

Route: transport to `EuclideanSpace ℝ ι` by `PiLp.continuousLinearEquiv`, a homeomorphism, so
that the conclusions (which are topological) are unchanged. There `A' = [−1, 1]^ι` is compact
and mapped into itself, since `−1 < tanh < 1`. The scalar `tanh` is `1`-Lipschitz: it is
`sinh/cosh` with derivative `1/cosh² ∈ (0, 1]`. Applied coordinatewise this gives
`‖tanh(a) − tanh(b)‖ ≤ ‖a − b‖` in the Euclidean norm, so each `esnMap A C ζ (·) u` is
`‖A‖`-Lipschitz (`Matrix.l2_opNorm_mulVec`); it is jointly continuous. Apply 1.2 with `r = ‖A‖`.
Every solution lies in `(−1, 1)^ι ⊆ A'`, so uniqueness among solutions in `A'` is uniqueness
among all solutions.

**Checks.**
- The spectral radius does not suffice. `W = [[3/2, 1], [−2, −3/2]]` has trace `0` and
  determinant `−1/4`, so its eigenvalues are `±1/2`; `WᵀW = [[25/4, 9/2], [9/2, 13/4]]` has
  largest eigenvalue `(19/2 + √90)/2 > 1`. With `C` the identity, `ζ = 0` and the constant input
  `u = (−1, 10)`, the map `x ↦ tanh(W x + u)` sends each of the disjoint boxes
  `B₁ = [1/2, 1] × [1 − 10^(−4), 1]` and `B₂ = [−1, −1/2] × [1 − 10^(−4), 1]` into itself. The
  first argument `(3/2) x₁ + x₂ − 1` increases and the second `−2 x₁ − (3/2) x₂ + 10` decreases in
  both variables, so on `B₁` they range over `[7499/10000, 3/2]` and `[13/2, 7.50015]`, and on `B₂`
  over `[−1.5001, −3/4]` and `[19/2, 10.50015]`; then `tanh(7499/10000) ≥ 1/2` because
  `e^1.4998 ≥ 3`, `tanh(−3/4) ≤ −1/2`, and `tanh(13/2) ≥ 1 − 10^(−4)` because `e^13 ≥ 19999`
  (Taylor partial sums give both exponential bounds). By Brouwer's theorem, or by the
  intermediate value theorem twice (solve the second coordinate for fixed `x₁`, the second map
  being decreasing in `x₂`, then the first), each box holds a fixed point. The two constant
  sequences are distinct solutions for the constant history, so the echo state property fails
  although the spectral radius is `1/2`.
- For `A = 0` the echo is `E z = tanh(C *ᵥ z 0 + ζ)`, depending on the current input only.
- With `ι` empty the state space is a point and every statement holds trivially.

*Needs:* 1.2; Tau Ceti `TauCeti.Neuromanifold.dense`, `TauCeti.Neuromanifold.tanhActivation`;
Mathlib `Matrix.l2_opNorm_mulVec`, `PiLp.continuousLinearEquiv`, `Real.tanh_lt_one`,
`Real.neg_one_lt_tanh`, `Real.tanh_eq_sinh_div_cosh`, `Real.hasDerivAt_sinh`,
`Real.hasDerivAt_cosh`, `Real.cosh_sq`, `lipschitzWith_of_nnnorm_deriv_le`.

### 2.2 The echo of a linear reservoir

Define `linearReservoir A C` as `x, u ↦ dense (A, C *ᵥ u) x`, that is `A x + C u`. Prove
`isSolution_linearReservoir_tsum`: if `spectralRadius ℂ (A.map (↑)) < 1` and `z` is bounded, then
for every `k` the series `Σ_j (A^j * C) *ᵥ z (k + j)` is summable, its sums form a bounded
sequence, and that sequence solves the reservoir equation; by 2.3 it is the unique bounded
solution. (Proved here.)

Route: IterativeMethodsForLinearSystems 1.2 gives `A^k → 0`, also for the row-sum norm, which
induces the same topology; hence `‖A^m‖ ≤ 1/2` for some `m ≥ 1`. Writing `k = q m + s` with
`s < m`, submultiplicativity gives `‖A^k‖ ≤ ‖A^m‖^q ‖A^s‖ ≤ c · 2^(−k/m)` with
`c = 2 max_(s<m) ‖A^s‖`. So the series converge absolutely, uniformly in `k`. Then
`A x (k + 1) + C z k = Σ_j A^(j+1) C z (k + 1 + j) + C z k = Σ_j A^j C z (k + j) = x k`.

**Checks.**
- For `A = 0` the echo is `C z k`; for the nilpotent `A = [[0, 1], [0, 0]]` it is
  `C z k + A C z (k + 1)`.
- For the scalar reservoir `A = 1/2`, `C = 1` and the constant history `1`, the echo is
  `Σ_j 2^(−j) = 2`, the fixed point of `x ↦ x/2 + 1`.

*Needs:* Tau Ceti `TauCeti.Neuromanifold.dense`; IterativeMethodsForLinearSystems 1.2
(`tendsto_pow_atTop_nhds_zero_iff_spectralRadius_map_lt_one`); Mathlib
`Matrix.linftyOpNormedAlgebra`.

### 2.3 Linear reservoirs: echo states and the spectral radius

Prove `hasEchoStates_linearReservoir_iff`: every bounded history `z : ℕ → κ → ℝ` has exactly one
bounded solution if and only if `spectralRadius ℂ (A.map (↑)) < 1`. (Proved here: no source
opened for this roadmap prints the statement.)

Route. If the spectral radius is less than one, existence is 2.2. If `x` and `x'` are bounded
solutions, their difference `d` solves the equation for the zero input, so `d k = A^m d (k + m)`
for all `m`, which tends to `0` by the geometric bound in the route of 2.2; hence `d = 0`.
Conversely, if the spectral radius is at least one, then `ι` is nonempty and, for the
row-sum norm on complex matrices (`Matrix.linftyOpNormedAlgebra`), the spectrum contains `λ` with
`|λ|` equal to the spectral radius (`spectrum.exists_nnnorm_eq_spectralRadius`); it is an
eigenvalue (`Matrix.spectrum_toLin'`, `Module.End.hasEigenvalue_iff_mem_spectrum`) with an
eigenvector `v ∈ ℂ^ι`. The real sequence `y k = Re(λ^(−k) v)` is bounded (`|λ| ≥ 1`) and solves
the equation for the zero input, because `A` is real and `A (λ^(−k−1) v) = λ^(−k) v`. It is not
zero: if `λ` is real, choose `v` real; otherwise, if `Re v = 0` then `v = i b` with `b ≠ 0` real
and `y 1 = Re(i/λ) b = (Im λ/|λ|²) b ≠ 0`. Then `0` and `y` are two bounded solutions for the
bounded zero history.

**Checks.**
- `A = [[0, 1], [0, 0]]` has `A² = 0`, spectral radius `0` and largest singular value `1`
  (`AᵀA = diag(0, 1)`): the linear reservoir has echo states, with echo `C z 0 + A C z 1`, so the
  norm condition of 2.1 is sufficient and not necessary.
- `A = 1` (spectral radius `1`): every constant `v` is a bounded solution for the zero input.
- The rotation `A = [[0, −1], [1, 0]]` has no real eigenvalue and spectral radius `1` over `ℂ`;
  `y k = A^(−k) e₁` is a bounded nonzero solution for the zero input. A spectral radius taken
  over real eigenvalues only would be `0` here, and the statement would fail.
- With `ι` empty both sides hold: the only state is `0` and the spectral radius of the empty
  matrix is `0`.

*Needs:* 2.2; IterativeMethodsForLinearSystems 1.2
(`tendsto_pow_atTop_nhds_zero_iff_spectralRadius_map_lt_one`, through 2.2); Mathlib
`spectralRadius`, `spectrum.exists_nnnorm_eq_spectralRadius`, `Matrix.linftyOpNormedAlgebra`,
`Matrix.spectrum_toLin'`, `Module.End.hasEigenvalue_iff_mem_spectrum`, `Matrix.map_pow`.

### Examples

The checks of 2.1 separate the norm condition from the spectral condition for networks; those of
2.3 show that for linear reservoirs the spectral condition is exact.

### Dependencies

2.1 uses 1.2 and Tau Ceti's neuromanifold library. 2.2 uses IterativeMethodsForLinearSystems 1.2;
2.3 uses 2.2 and IterativeMethodsForLinearSystems 1.2.

## Layer 3: finite input alphabets and iterated function systems

### 3.1 Echo states are the coding map

Copy verbatim from FractalGeometry 1.1 the structure `IFS U X` (maps `Φ u : X → X` with ratios
`ratio u ∈ (0, 1)` and `Φ u` Lipschitz with its ratio), its coercion to a family of maps, and
`IFS.IsAttractor` (a nonempty compact `K` with `⋃ u, Φ u '' K = K`).

For a finite input alphabet `U` with the discrete topology, regard `Φ : IFS U X` as the reservoir
`F x u = Φ u x`. Prove `isSolution_iff_eq_codingMap`: if `π : (ℕ → U) → X` is continuous and
satisfies the coding equation `π ω = Φ (ω 0) (π (fun n => ω (n + 1)))`, then a bounded `x` solves
the reservoir equation for `z` if and only if `x k = π (fun n => z (n + k))` for every `k`. Such a
`π` exists, and is unique, when `X` is complete and nonempty (FractalGeometry 1.4,
`IFS.existsUnique_codingMap`). (Proved here.)

Route: the shifts of `π` solve the equation by the coding equation at `fun n => z (n + k)`. They
are bounded, since `ℕ → U` is compact and `π` continuous. If `x` is another bounded solution, let
`r < 1` be the largest ratio (`U` is finite; for `U` empty there are no histories) and `M` a bound
for the distances between the two solutions; then their distance at time `k` is at most `r^m M`
for every `m`.

**Checks.**
- Boundedness is needed: for the single map `x ↦ x/2` on `ℝ` (`U` a point), `π` is the constant
  `0`, but `x k = 2^k` is an unbounded solution.
- The reservoir of the checks of 1.2 with `r = 1/3` is the system `x ↦ x/3`, `x ↦ x/3 + 2/3`:
  its echo `E z = Σ_j 2 z j 3^(−(j+1))` is the ternary expansion with digits `2 z j`.
- An echo state network with finite input alphabet and `0 < ‖A‖ < 1` is an iterated function
  system on `EuclideanSpace ℝ ι` with every ratio `‖A‖` (the Lipschitz bound of 2.1 holds on all
  of `ℝ^ι`), and all its solutions are bounded; so its echo function is a coding map.

*Needs:* FractalGeometry 1.1 (`IFS`, copied); Mathlib `isCompact_univ_pi`,
`tendsto_pow_atTop_nhds_zero_of_lt_one`.

### 3.2 The reachable states form the attractor

Prove `setOf_isSolution_eq_of_isAttractor`: for finite `U` with the discrete topology and an
attractor `K` of `Φ`, the set of states `x 0` of bounded solutions of the reservoir equation, over
all histories, is `K`. No completeness of `X` is assumed. (Proved here.)

Route: each `Φ u` maps `K` into `K`, so `Φ` restricts to a system on the compact, hence complete
and nonempty, space `K`, with the same ratios, for which `K` itself (as `univ`) is an attractor.
FractalGeometry 1.4 gives its coding map `π_K` (`IFS.existsUnique_codingMap`) with range all of
`K` (`IFS.range_codingMap`). The composite of `π_K` with the inclusion is continuous and satisfies
the coding equation of `Φ`, so by 3.1 the states `x 0` of bounded solutions are exactly the values
of this composite, which form `K`.

**Checks.**
- For `r = 1/3` the reachable states are the middle-thirds Cantor set; for `r = 1/2` (maps
  `x ↦ x/2` and `x ↦ x/2 + 1/2`) they are all of `[0, 1]` (binary expansions).
- With `U` empty there is no attractor (the union over `U` is empty), so the statement is
  vacuous; the set on the left is then empty, as there are no histories.

*Needs:* 3.1; FractalGeometry 1.1 (`IFS.IsAttractor`, copied), 1.4 (`IFS.existsUnique_codingMap`,
`IFS.range_codingMap`).

### Examples

Over the alphabet `{0, 1}` the reservoir `x ↦ r x + (1 − r) u` on `[0, 1]` has as its states the
numbers `(1 − r) Σ_j r^j z j`: the attractor of the two maps, a Cantor set for `0 < r < 1/2` and
the interval for `1/2 ≤ r < 1`.

### Dependencies

FractalGeometry 1.1 and 1.4. 3.2 uses 3.1. Independent of Layers 1 and 2.

## Layer 4: random features

### 4.1 The mean squared error

Define `rksTarget p β φ y = ∫ β w · φ y w ∂p(w)` and, for `w : Fin K → Ω`,
`rksApprox β φ w y = K⁻¹ · Σ_k β (w k) · φ y (w k)`. Prove `integral_integral_rksApprox_sub_sq`:
if `p` is a probability measure, `μ` a finite measure, `β` and `φ` (jointly) measurable,
`|β| ≤ C`, `|φ| ≤ 1` and `K ≥ 1`, then the expectation over the product law of the squared
`L²(μ)` error,
`∫ (∫ (rksApprox β φ w y − rksTarget p β φ y)² dμ(y)) d(p^K)(w)`, equals
`(∫∫ (β w · φ y w)² dp(w) dμ(y) − ∫ (rksTarget p β φ y)² dμ(y)) / K`, and is therefore at most
`C² μ(Y) / K`.

Sources: Rahimi–Recht 2008, Lemma 1, p. 3, and its proof, which applies Lemma 4 (appendix,
p. 7) in `L²(μ)`; the identity is the variance identity (18) in the proof of Lemma 4. Lemma 1 is
stated there for "a measure `μ`", but its proof bounds the `L²(μ)` norm of each feature by `C`,
which needs `μ(Y) ≤ 1` (the norm is at most `C √μ(Y)`), and the lemma fails for measures of large
mass (Checks); the statement here carries the factor `μ(Y)`, and it allows any probability law `p`
in place of one with a density.

Route: for fixed `y`, the terms `β (w k) φ y (w k)` are independent under the product law
(`iIndepFun_pi`), with mean `rksTarget p β φ y`; the variance of their average is their variance
divided by `K` (`IndepFun.variance_sum`). Integrate over `μ` and exchange the order of integration
(Fubini, `integral_integral_swap`; all integrands are bounded by `C²` and measurable). The bound
follows from `(β φ)² ≤ C²` and the nonnegativity of the subtracted term.

**Checks.**
- Equality in the bound: `Ω = {a, b}` with the uniform law, `β = C`, `φ y a = 1`, `φ y b = −1`.
  Then `rksTarget = 0`, the approximant is `C` times the mean of `K` independent signs, and its
  mean square is `C²/K` (exactly, for `K = 1, 2, 3, 4`, by enumerating the `2^K` sign patterns),
  which is `C² μ(Y)/K` for a probability measure `μ`.
- The factor `μ(Y)` is needed: in the same example with `μ` of total mass `4` and `K = 1` the mean
  squared error is `4C²`, more than `C²/K = C²`, the bound that the proof of Rahimi–Recht's Lemma 1
  takes from their (19) with radius `C`.
- Rahimi–Recht's Lemma 1 itself fails for a measure of large mass, although it only asks for some
  combination `Σ_k α_k φ(·, w_k)` with `|α_k| ≤ C/K`. Take `Y = {y₁, y₂}`, `Ω = {a, b}` with the
  uniform law, `φ(·, a) = (1, 1)`, `φ(·, b) = (1, −1)`, `β = C > 0`, so that the target is `(C, 0)`,
  and `K = 1`. Under the uniform probability on `Y`, every `t φ(·, w₁)` with `|t| ≤ C` has squared
  distance `((t − C)² + t²)/2 ≥ C²/4` from the target (equality at `t = C/2`). Under `μ` equal to `64` times that
  probability (mass `32` at each point) the distance is therefore at least `4C` for both draws,
  while the lemma's bound at `δ = 1/2` is `C(1 + √(2 log 2)) < 4C`, since `log 2 < 1` (as `e > 2`):
  its event has probability `0`, not at least `1/2`.
- `K ≥ 1` is needed: for `K = 0` the approximant is `0` (as `0⁻¹ = 0`), so for `β = C`, `φ = 1`
  the left side is `C² μ(Y)`, while the right side is a quotient by `0`, which is `0`.
- A feature map from Tau Ceti's layers: with `Ω = (Matrix (Fin 1) κ ℝ) × (Fin 1 → ℝ)` and
  `φ y w = tanhActivation () (dense w y) 0`, one hidden unit `tanh(a · y + b)`, `|φ| ≤ 1`.

*Needs:* Mathlib `Measure.pi`, `ProbabilityTheory.iIndepFun_pi`,
`ProbabilityTheory.IndepFun.variance_sum`, `MeasureTheory.integral_integral_swap`,
`MeasureTheory.StronglyMeasurable.integral_prod_right'`.

### 4.2 The error with high probability

Prove `measure_sqrt_integral_rksApprox_sub_sq_le`: under the hypotheses of 4.1 with `μ` a
probability measure, for every `δ > 0`, the product law gives probability at least `1 − δ` to the
event that `√(∫ (rksApprox β φ w y − rksTarget p β φ y)² dμ(y)) ≤ (C/√K)(1 + √(2 log(1/δ)))`.

Source: Rahimi–Recht 2008, Lemma 1, eq. (9), p. 3, with Lemma 4, eq. (16), p. 7, proved there by
McDiarmid's inequality (eqs. (17)–(20)). The constant is theirs.

Route: let `G(w)` be the `L²(μ)` error. Replacing one draw `w k` changes the approximant by `1/K`
times the difference of two functions of `L²(μ)` norm at most `C`, so `G` changes by at most
`2C/K` (triangle inequality in `L²(μ)`, `eLpNorm_sub_le`). Tau Ceti's McDiarmid inequality
(`hasSubgaussianMGF_of_bounded_differences_fin`, with `c = 2C/K`; `G` is measurable by
`MeasureTheory.StronglyMeasurable.integral_prod_right'`) makes `G − E G` sub-Gaussian
with variance proxy `K (C/K)² = C²/K`, and the Chernoff bound
(`ProbabilityTheory.HasSubgaussianMGF.measure_ge_le`) gives probability at most
`exp(−K ε²/(2C²)) = δ` for `G − E G ≥ ε` with `ε = (C/√K) √(2 log(1/δ))` and `δ ≤ 1`. By Jensen's
inequality for the square root (`ConcaveOn.le_map_integral`) and 4.1, `E G ≤ √(C²/K) = C/√K`. For
`δ ≥ 1` there is nothing to prove, and for `C = 0` the error is `0`.

**Checks.**
- `δ > 0` is needed: at `δ = 0`, `log(0⁻¹) = log 0 = 0`, so the bound would read `C/√K` with
  probability `1`. In the example of 4.1 with `K = 2` and `μ` a probability measure, the error is
  `C` with probability `1/2` and `0` with probability `1/2`, and `C > C/√2`.
- In the same example with `K = 1` the error is exactly `C`, within the bound for every `δ`.
- The variance proxy: `K · ((2C/K)/2)² = C²/K` (checked for `K = 1, 2, 5`).

*Needs:* 4.1; Tau Ceti `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences_fin`;
Mathlib `ProbabilityTheory.HasSubgaussianMGF.measure_ge_le`, `ConcaveOn.le_map_integral`,
`MeasureTheory.eLpNorm_sub_le`, `MeasureTheory.StronglyMeasurable.integral_prod_right'`.

### Examples

The Rademacher example of 4.1 is the extreme case: the target is `0` and every feature has norm
exactly `C`.

### Dependencies

Mathlib and Tau Ceti only. 4.2 uses 4.1.

## Scope and ownership

This roadmap owns the echo state property and fading memory of reservoir equations driven by
left-infinite input histories: existence on compact invariant sets, the contraction theorem with
its exponential modulus, internal approximation, the echo state network under the singular value
condition, the spectral characterization for linear reservoirs and their echo series, the
identification of echo states over a finite alphabet with the coding map and attractor of an
iterated function system, and the mean-square and high-probability bounds for random-feature
approximation drawn from a fixed sampling law.

Stated by other roadmaps or in the libraries, and used here:

- The dense layer and the hyperbolic tangent layer are Tau Ceti's neuromanifold library, the
  formalization of Neuromanifolds §2 (concrete layers); nothing else of that roadmap is used, and
  no definition of it is restated.
- IterativeMethodsForLinearSystems 1.2 owns the equivalence of `A^k → 0` with a spectral radius
  below one; 2.2 and 2.3 use it and do not restate it.
- FractalGeometry 1.1 owns iterated function systems and attractors (copied verbatim) and 1.4 the
  coding map and its range; Layer 3 uses them and restates neither.
- McDiarmid's inequality is in Tau Ceti; Lipschitz maps, compactness, spectral radii, product
  measures, independence and the sub-Gaussian Chernoff bound are in Mathlib.

Statements of other roadmaps that border this one, none of them used: LinearSystemsAndControl 5.1
calls the real matrices with spectral radius below one Schur stable, 5.4 characterizes them by the
Stein equation, and its discrete-time system (1.3) runs forward from an initial state, while 2.3
is about bounded solutions of the driven equation over the whole past;
UniversalApproximation 4.1 states Maurey's lemma, the existence of a good average of `K`
dictionary elements chosen for the target, while Layer 4 samples the features from a law fixed
in advance and bounds the
error in expectation and in probability.

Not treated here: random Fourier features for shift-invariant kernels, Bochner's theorem (in Tau
Ceti) and the uniform kernel-approximation bound of Rahimi–Recht's 2007 paper; the concentration
of empirical kernel mean embeddings in a reproducing kernel Hilbert space; the excess-risk
theorem of Rahimi–Recht 2008 (Theorem 1), whose estimation half is a Rademacher-complexity bound;
Jaeger's sufficient condition for the absence of echo states (spectral radius above one with the
null input admitted, Proposition 3(b)), whose printed proof rests on an exercise about unstable
fixed points; the universality theorem of Grigoryeva–Ortega (Theorem 4.1), which rests on results
not proved there; reservoirs with random coefficients and Lyapunov exponents; readout training;
and every algorithm, program and running time.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Topology/EMetricSpace/Lipschitz.lean`: `LipschitzOnWith`,
  `LipschitzOnWith.continuousOn`. Used in 1.2, 1.3, 2.1.
- `Mathlib/Topology/Compactness/Compact.lean`: `isCompact_univ_pi` (Tychonoff),
  `IsCompact.nonempty_iInter_of_sequence_nonempty_isCompact_isClosed` (a decreasing sequence of
  nonempty closed sets, the first compact, has nonempty intersection). Used in 1.1, 3.1.
- `Mathlib/Topology/UniformSpace/HeineCantor.lean`: `IsCompact.mem_uniformity_of_prod` (for `f`
  continuous on `s ×ˢ k` with `k` compact, `f p x` is uniformly close to `f q x` over `x ∈ k` for
  `p` near `q` in `s`). Used in 1.2.
- `Mathlib/Topology/MetricSpace/Bounded.lean`: `Metric.diam`. Used in 1.2, 1.3.
- `Mathlib/Analysis/SpecificLimits/Basic.lean`: `tendsto_pow_atTop_nhds_zero_of_lt_one`. Used in
  1.2, 1.3, 3.1.
- `Mathlib/Analysis/Complex/Trigonometric.lean`: `Real.tanh_lt_one`, `Real.neg_one_lt_tanh`,
  `Real.tanh_eq_sinh_div_cosh`, `Real.cosh_sq`;
  `Mathlib/Analysis/SpecialFunctions/Trigonometric/DerivHyp.lean`: `Real.hasDerivAt_sinh`,
  `Real.hasDerivAt_cosh`; `Mathlib/Analysis/Calculus/MeanValue.lean`:
  `lipschitzWith_of_nnnorm_deriv_le`. Used in 2.1.
- `Mathlib/Analysis/CStarAlgebra/Matrix.lean`: the scoped instances of
  `Matrix.Norms.L2Operator` (the operator norm for the Euclidean norms) and
  `Matrix.l2_opNorm_mulVec` (`‖A *ᵥ x‖ ≤ ‖A‖ ‖x‖` in `EuclideanSpace`). Used in 2.1.
- `Mathlib/Analysis/Normed/Lp/PiLp.lean`: `PiLp.continuousLinearEquiv` (the identity between
  `EuclideanSpace ℝ ι` and `ι → ℝ` as a continuous linear equivalence). Used in 2.1.
- `Mathlib/Analysis/Normed/Algebra/Spectrum.lean`: `spectralRadius`;
  `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean`: `spectrum.exists_nnnorm_eq_spectralRadius`
  (in a complex Banach algebra the spectral radius is attained on the spectrum);
  `Mathlib/Analysis/Matrix/Normed.lean`: `Matrix.linftyOpNormedAlgebra`;
  `Mathlib/LinearAlgebra/Eigenspace/Matrix.lean`: `Matrix.spectrum_toLin'`;
  `Mathlib/LinearAlgebra/Eigenspace/Basic.lean`: `Module.End.hasEigenvalue_iff_mem_spectrum`;
  `Matrix.map_pow`. Used in 2.2, 2.3.
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun_pi` (coordinates
  are independent under `Measure.pi`); `Mathlib/Probability/Moments/Variance.lean`:
  `ProbabilityTheory.IndepFun.variance_sum`; `Mathlib/MeasureTheory/Integral/Prod.lean`:
  `MeasureTheory.integral_integral_swap`, `MeasureTheory.StronglyMeasurable.integral_prod_right'`;
  `Mathlib/MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi`. Used in 4.1, 4.2.
- `Mathlib/Probability/Moments/SubGaussian.lean`:
  `ProbabilityTheory.HasSubgaussianMGF.measure_ge_le` (`P(ε ≤ X) ≤ exp(−ε²/(2c))` for `ε ≥ 0`);
  `Mathlib/Analysis/Convex/Integral.lean`: `ConcaveOn.le_map_integral` (Jensen);
  `Mathlib/MeasureTheory/Function/LpSeminorm/TriangleInequality.lean`:
  `MeasureTheory.eLpNorm_sub_le`. Used in 4.2.

### From Tau Ceti

- `TauCeti/Geometry/Neuromanifold/Dense.lean`: `TauCeti.Neuromanifold.dense`
  (`dense (A, b) x = A *ᵥ x + b`, for a finite input index type). Used in 2.1, 2.2 and in a
  Check of 4.1.
- `TauCeti/Geometry/Neuromanifold/Activation.lean`: `TauCeti.Neuromanifold.tanhActivation`
  (the parameter-free layer applying `Real.tanh` to every coordinate). Used in 2.1 and in a
  Check of 4.1.
- `TauCeti/Probability/McDiarmid.lean`:
  `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences_fin` (for a probability measure
  `ν`, a measurable `f : (Fin n → β) → ℝ` whose value changes by at most `c` when one coordinate
  is changed is, after centring, sub-Gaussian under `Measure.pi fun _ => ν` with variance proxy
  `n (c/2)²`). Used in 4.2.

### From TauCetiRoadmap.IterativeMethodsForLinearSystems

- 1.2: `tendsto_pow_atTop_nhds_zero_iff_spectralRadius_map_lt_one` (for a real square matrix
  `G`, `G^k → 0` if and only if `spectralRadius ℂ (G.map (↑)) < 1`). Used in 2.2, 2.3.

### From TauCetiRoadmap.FractalGeometry

- 1.1: `IFS ι X` (maps with ratios in `(0, 1)`, each Lipschitz with its ratio), its coercion to
  a family of maps, and `IFS.IsAttractor`, copied verbatim. Used in 3.1, 3.2.
- 1.4: `IFS.existsUnique_codingMap` (for `X` complete and nonempty and `ι` finite with the
  discrete topology, exactly one continuous `π : (ℕ → ι) → X` satisfies
  `π ω = F (ω 0) (π (fun n => ω (n + 1)))`) and `IFS.range_codingMap` (for `ι` finite with the
  discrete topology, the range of such a `π` is the attractor `K`, given `IsAttractor K`). Used in
  3.1, 3.2.

## References

- Herbert Jaeger, *The "echo state" approach to analysing and training recurrent neural networks
  — with an Erratum note*, corrected version (26 January 2010) of GMD Report 148, German National
  Research Center for Information Technology, 2001; on the author's group page
  (https://www.ai.rug.nl/minds/uploads/EchoStatesTechRep.pdf). Pages are those printed: Definition 1
  and eq. (3), p. 6; Proposition 3, p. 8; the scalar example, p. 9; proof of Proposition 3,
  Appendix C, p. 41. The erratum (Appendix E) concerns Definition 3 and Proposition 1, not used
  here.
- Lyudmila Grigoryeva and Juan-Pablo Ortega, *Echo state networks are universal*, Neural Networks
  108 (2018), 495–508; arXiv:1806.00797v2. Located by the PDF pages of the arXiv version:
  Definition 2.5, p. 7; Theorem 2.6, p. 8; Theorem 3.1, p. 11, proof pp. 12–14; Corollary 3.2,
  p. 14, proof p. 24.
- Ali Rahimi and Benjamin Recht, *Weighted sums of random kitchen sinks: replacing minimization
  with randomization in learning*, Advances in Neural Information Processing Systems 21 (2008);
  open copy at papers.nips.cc. Lemma 1 with eq. (9), p. 3; Lemma 4 with eqs. (16)–(20),
  Appendix A, p. 7.
