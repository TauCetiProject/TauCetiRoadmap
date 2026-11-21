# Roadmap: self-gravitating spherical equilibria

**Summary.** A static, spherically symmetric ball of gas held together by its own gravity is
described by a few ordinary differential equations in the radius: the mass inside radius `r`,
and the balance between the pressure gradient and gravity. When the pressure is a power of the
density, `p = K ρ^(1+1/n)`, the whole star is encoded in one function `θ` of one variable, the
solution of the Lane–Emden equation `θ'' + (2/ξ) θ' + θⁿ = 0` with `θ(0) = 1`. That equation is
singular at the centre, and this roadmap first fixes what its solution is: the function that is
continuous at `ξ = 0`, with `θⁿ` read as `(max θ 0)ⁿ` past a zero. Everything is a statement about
real functions of one real variable; no spacetime metric is defined.

The headline theorems are these.

- *The regular solution.* For every real `n ≥ 0` the Lane–Emden equation has exactly one
  solution on `[0, ∞)` that is continuous at the centre with value `1` there, and it is strictly
  decreasing. For `n = 0` it is `1 − ξ²/6`; for `n = 1` it is `sin ξ / ξ` up to its first zero
  `π` and `π/ξ − 1` after it; for `n = 5` it is `(1 + ξ²/3)^(−1/2)`.
- *The first zero.* For `0 ≤ n < 5` the solution has a zero; for `n ≥ 5` it has none. For
  `n > 1` both come from a virial identity, which at a zero `ξ₁` says that `(5 − n)` times a
  positive integral equals `3 μ(ξ₁)²/ξ₁`, where `μ(ξ) = −ξ² θ'(ξ)`.
- *Polytropes.* For `n > 0` a nonnegative density, continuous at the centre, is in hydrostatic
  equilibrium with the pressure `K ρ^(1+1/n)` if and only if it is `ρ(0) θ(r/α)ⁿ` up to the
  first zero of `θ`, if there is one, and zero after it, with an explicit length `α`. For
  `0 < n < 5` every such star with positive central density has a finite radius `R` and mass `M`
  with `K = C G M^((n−1)/n) R^((3−n)/n)`, where `C` depends on `n` only. For a static star of
  radius `R` whose density and pressure are continuous on `[0, R]`, with zero pressure at `R`,
  the virial identity `3 ∫ p dV + E = 0` holds between the
  pressure and the gravitational energy `E`; for a polytrope of radius `R` this gives the
  Betti–Ritter formula `(5 − n) E = −3 G M²/R`.
- *Buchdahl's inequality.* For a regular solution of the Tolman–Oppenheimer–Volkoff system on
  `[0, R]` whose mean density `m(r)/r³` does not increase outwards and whose pressure at `R` is
  nonnegative, `2 m(R)/R < 8/9`; the constant-density stars show that `8/9` cannot be lowered.

The roadmap uses Mathlib's real powers, interval integrals, fundamental theorem of calculus and
its existence and uniqueness theorems for ordinary differential equations. It does not use the
Newtonian potential of the PDE roadmap: gravity enters only through the mass function, and the
link between the two is not treated. The Lorentzian geometry in which the
Tolman–Oppenheimer–Volkoff system is derived is not used either.

Layer 1 below defines the regular solution and proves its integral form, existence, uniqueness
and monotonicity. Layer 2 identifies the three explicit solutions, and Layer 3 proves the
finite-radius theorem for `n < 5`, the virial identity and the positivity for `n ≥ 5`. Layer 2
uses Layer 1, and Layer 3 uses Layers 1 and 2. Layer 4 turns Lane–Emden solutions into
Newtonian stars and uses Layers 1 and 3. Layer 5, on the relativistic system, uses only the mass
function of Layer 4.

## Conventions

- **Variables.** The radius `r` and the Lane–Emden variable `ξ` are real numbers; statements look
  only at `r ≥ 0` and `ξ ≥ 0`, and values at negative arguments play no role. A density, a
  pressure and a Lane–Emden solution are functions `ℝ → ℝ`. The index `n` is a real number, and
  powers with a real exponent are Mathlib's real power `x ^ y`.
- **Constants.** `G > 0` is the gravitational constant and `K > 0` the polytropic constant. The
  relativistic Layer 5 uses units with `G = c = 1`.
- **Mass function.** `massFunction ρ r = 4π ∫₀ʳ s² ρ(s) ds`, the mass inside radius `r` of the
  radial density `ρ`, used in Layers 4 and 5.

### Design: what a solution of the Lane–Emden equation is

The equation `θ'' + (2/ξ) θ' + θⁿ = 0` has a coefficient that is singular at `ξ = 0`, and `θⁿ`
is not defined for `θ < 0` when `n` is not an integer. Four choices fix the object.

- **The nonlinearity.** `laneEmdenNonlin n θ = (max θ 0) ^ n`. For `n > 0` it is `θⁿ` for
  `θ > 0` and `0` for `θ ≤ 0`, and it is continuous. For `n = 0` it is the constant `1`, since
  Mathlib's `x ^ 0` is `1` for every real `x`, `0` included.
  **Checks.**
  - Without the `max`, Mathlib's power of a negative base is `exp (log x · y) · cos (y π)`, so
    `(−1) ^ (4/3) = cos (4π/3) = −1/2`: an unclamped equation of index `4/3` would keep a nonzero
    force after the zero. With the clamp the value is `0`.
  - For `n = 1` the unclamped equation is linear, and its solution `sin ξ / ξ` oscillates; with
    the clamp the solution is `π/ξ − 1` on `[π, ∞)` (2.2).
  - For `n = 0` the clamped solution is `1 − ξ²/6` on all of `[0, ∞)`. The alternative
    "`θⁿ` where `θ > 0`, else `0`" would give an equation with no twice differentiable solution
    on `[0, ∞)`: its solution `1 − ξ²/6` on `[0, √6]` continues as `2√6 (1/ξ − 1/√6)`, and the
    second derivative jumps from `−1/3` to `2/3` at `√6`.
- **The domain and regularity at the centre.** `IsLaneEmdenSolutionOn n X θ` asks that
  `θ 0 = 1`, that `θ` be continuous on `[0, X)`, and that at every `ξ ∈ (0, X)` it be twice
  differentiable with `θ'' + (2/ξ) θ' + (max θ 0)ⁿ = 0`. `IsLaneEmdenSolution n θ` asks this for
  every `X`, that is, on `[0, ∞)`. The condition `θ'(0) = 0` is not imposed: it follows (1.2).
  **Checks.**
  - `cos ξ / ξ` solves the equation of index `1` on `(0, π/2)`, where it is positive, and tends
    to `+∞` at `0`; continuity at the centre excludes it. Every solution on `(0, X)` that is
    bounded near `0` has `ξ² θ'(ξ) = c − ∫₀^ξ s² (max θ 0)ⁿ ds` for a constant `c`, and
    continuity at `0` forces `c = 0`.
  - `sin ξ / ξ`, with value `1` at `0`, has derivative tending to `0` at `0`.
- **The first zero.** A zero of the solution is a `ξ₁ > 0` with `θ ξ₁ = 0`; since the solution is
  strictly decreasing (1.4) there is at most one, and the solution is positive on `[0, ξ₁)`. The
  star is the ball of radius `α ξ₁`. On `[0, ξ₁]` the clamp plays no role; beyond `ξ₁` the
  statements about the star see the solution only through `(max θ 0)ⁿ`, which is `0` there for
  `n > 0`.
- **The mass variable.** `laneEmdenMu n θ ξ = ∫₀^ξ s² (max (θ s) 0)ⁿ ds`; for a solution it equals
  `−ξ² θ'(ξ)` (1.2).

## Layer 1: the regular solution of the Lane–Emden equation

### 1.1 The nonlinearity and the solution

Define `laneEmdenNonlin`, `IsLaneEmdenSolutionOn`, `IsLaneEmdenSolution` and `laneEmdenMu` as in
the design above.

- For `n > 0`, `θ ↦ laneEmdenNonlin n θ` is continuous, vanishes for `θ ≤ 0`, and is increasing
  and locally Lipschitz on `(0, ∞)` (Mathlib `Real.continuousAt_rpow_const`,
  `Real.hasDerivAt_rpow_const`).
- A solution on `[0, ∞)` is a solution on every `[0, X)`, and the restriction of a solution on
  `[0, X)` to `[0, X')` with `X' ≤ X` is a solution there.

*Needs:* Mathlib `Real.rpow_zero`, `Real.zero_rpow`, `Real.rpow_def_of_neg`,
`Real.continuousAt_rpow_const`, `Real.hasDerivAt_rpow_const`. (Proved here.)

### 1.2 The integral form

For `n ≥ 0` and `X > 0`, `isLaneEmdenSolutionOn_iff`: `θ` solves the equation on `[0, X)` if and
only if `θ` is continuous on `[0, X)` and, for every `ξ ∈ [0, X)`,
`θ ξ = 1 − ∫₀^ξ s (1 − s/ξ) (max (θ s) 0)ⁿ ds` (the integrated form of the reduced equation of
Ramming–Rein, §2.1.1, eqs. (2.5)–(2.6), p. 8, after the change of variables `r = ξ / √(4π)`;
Pols, §4.1, p. 47, states the centre conditions `θ(0) = 1`, `θ'(0) = 0`).

- The first step of the route below shows that a solution has `θ'(ξ) = −μ(ξ)/ξ²` for
  `ξ ∈ (0, X)`, with `μ = laneEmdenMu n θ`, and `θ'(ξ) → 0` as `ξ → 0`, so that `θ` has
  derivative `0` within `[0, ∞)` at `0`; later routes cite this step as 1.2.

Route. If `θ` solves the equation, `(ξ² θ')' = −ξ² (max θ 0)ⁿ` on `(0, X)`; the right side is
continuous there, so `ξ² θ'(ξ) − η² θ'(η) = −∫_η^ξ s² (max θ 0)ⁿ ds` for `0 < η < ξ < X`. The
integrand is bounded near `0` since `θ` is continuous at `0`, so `η² θ'(η)` has a limit `c` as
`η → 0`; if `c ≠ 0` then `θ'(η)` behaves like `c/η²` and `θ` is unbounded near `0`, which
continuity at `0` forbids. Hence `θ'(ξ) = −μ(ξ)/ξ²`; integrating from `0` (continuity at `0` again)
and exchanging the order of integration gives the integral equation, the kernel being
`∫_s^ξ t⁻² dt = 1/s − 1/ξ`. Conversely the integral equation, with `(max θ 0)ⁿ` continuous on
`[0, X)` (for `n > 0` by 1.1, for `n = 0` it is `1`), reads
`θ ξ = 1 − ∫₀^ξ s (max θ 0)ⁿ ds + ξ⁻¹ ∫₀^ξ s² (max θ 0)ⁿ ds`; the fundamental theorem of calculus
gives `θ' = −μ/ξ²` and then `θ'' = 2μ/ξ³ − (max θ 0)ⁿ = −(2/ξ) θ' − (max θ 0)ⁿ` on `(0, X)`, and
the equation at `ξ = 0` gives `θ 0 = 1`.

**Checks.**
- For `n = 1` and `θ = sin ξ / ξ`, `1 − ∫₀^ξ s (1 − s/ξ) (sin s / s) ds = sin ξ / ξ` for `ξ ≤ π`.
- The hypothesis `X > 0` is needed: for `X ≤ 0` the right side holds for every function, while
  the left side still asks `θ 0 = 1`.

*Needs:* 1.1; Mathlib `intervalIntegral.integral_hasDerivAt_right`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`, `ContinuousOn.intervalIntegrable`.

### 1.3 Existence and uniqueness

For every real `n ≥ 0`, `laneEmden_existsUnique`: there is `θ` with `IsLaneEmdenSolution n θ`,
and any two solutions on the same `[0, X)` agree on `[0, X)` (Ramming–Rein, §2.1.1, pp. 8–9,
sketch the proof for the reduced equation with a nonlinearity that is continuous, continuously
differentiable on `(0, ∞)` and zero on `(−∞, 0]`, which covers `n > 0`; the case `n = 0` is
explicit).

Route. For `n = 0` the integral equation of 1.2 is solved by `1 − ξ²/6` and has no other
solution, its right side not depending on `θ`. Let `n > 0`.
1. *Near the centre.* On the closed ball of radius `1/2` around the constant `1` in the
   continuous functions on `[0, δ]` with the sup norm, the map
   `θ ↦ 1 − ∫₀^ξ s (1 − s/ξ) (max (θ s) 0)ⁿ ds` takes values within `δ²/2 · (3/2)ⁿ` of `1` and is
   Lipschitz with constant `L δ²/2`, `L` a Lipschitz constant of `θ ↦ θⁿ` on `[1/2, 3/2]`. For
   small `δ` it is a contraction of that ball (Mathlib `ContractingWith.efixedPoint'`), so the
   integral equation has a unique solution on `[0, δ]` with values in `[1/2, 3/2]`; a solution
   with values outside that interval is excluded on a shorter interval by continuity at `0`.
2. *Away from the centre.* For `ξ ≥ δ` the pair `(θ, μ)` solves the regular system
   `θ' = −μ/ξ²`, `μ' = ξ² (max θ 0)ⁿ`, whose right side is Lipschitz in `(θ, μ)` on every set
   `{δ ≤ ξ ≤ T, c ≤ θ ≤ 1}` with `c > 0`. Picard–Lindelöf (Mathlib
   `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`) continues the solution, and
   `ODE_solution_unique_of_mem_Icc_right` makes it unique, as long as it stays positive. While
   `θ > 0` one has `0 < θ ≤ 1` and `0 ≤ μ(ξ) ≤ ξ³/3`, so the solution exists on `[0, ∞)` or `θ`
   decreases to `0` at a finite `ξ₁`, where it is continuous with `θ ξ₁ = 0` and
   `θ'(ξ₁) = −μ(ξ₁)/ξ₁² < 0`.
3. *After a zero.* For `ξ > ξ₁` every solution is negative, since `θ' = −μ/ξ² < 0`, so
   `(max θ 0)ⁿ = 0`, `μ` is constant and `θ ξ = μ(ξ₁) (1/ξ − 1/ξ₁)`. Conversely the function
   glued from the solution on `[0, ξ₁]` and this formula has `θ' = −μ/ξ²` on `(0, ∞)` with `μ`
   continuously differentiable, since `(max θ 0)ⁿ` is continuous and `0` at `ξ₁` for `n > 0`;
   so it is twice differentiable at `ξ₁` too and solves the equation on `(0, ∞)`.
Uniqueness on `[0, X)`: two solutions agree on `[0, δ]` by step 1; the supremum of the points up
to which they agree cannot be a point where both are positive (step 2), so they agree up to the
first zero of either, which is then common, and after it by step 3. Positivity of `μ(ξ)` for
`ξ > 0` holds because the integrand is positive near `0`.

**Checks.**
- For `n = 1` the solution is `π/ξ − 1` after `π`, with `μ(π) = ∫₀^π s sin s ds = π`; its second
  derivative is `2/π²` on both sides of `π`, as it must be for a twice differentiable solution.
- For `n = 5` the solution never vanishes, and `μ(ξ) → √3` (2.3).

*Needs:* 1.1, 1.2; Mathlib `ContractingWith.efixedPoint'`,
`IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`,
`ODE_solution_unique_of_mem_Icc_right`.

### 1.4 Monotonicity

For `n ≥ 0`, `laneEmden_strictAntiOn`: a solution on `[0, ∞)` is strictly decreasing on
`[0, ∞)`. (Proved here.) Route: by 1.2,
`θ'(ξ) = −μ(ξ)/ξ² < 0` for `ξ > 0`, and `θ` is continuous at `0` (Mathlib
`strictAntiOn_of_deriv_neg`).

**Checks.**
- `1 − ξ²/6`, `sin ξ / ξ` on `[0, π]` followed by `π/ξ − 1`, and `(1 + ξ²/3)^(−1/2)` are strictly
  decreasing.

*Needs:* 1.2; Mathlib `strictAntiOn_of_deriv_neg`.

### Examples

The three explicit solutions of Layer 2; the post-zero formula `θ ξ = μ(ξ₁) (1/ξ − 1/ξ₁)` for
`n > 0`.

### Dependencies

Mathlib only.

## Layer 2: the solutions for n = 0, 1, 5

### 2.1 Index 0

`laneEmden_zero`: if `θ` solves the equation of index `0` on `[0, ∞)`, then `θ ξ = 1 − ξ²/6` for
every `ξ ≥ 0`; in particular the first zero is `√6` and `μ(√6) = 2√6` (Pols, §4.1, eq. (4.8),
p. 47, and Table 4.1, on `[0, √6]`; past `√6` the formula is the convention of the design, under
which the nonlinearity of index `0` is the constant `1`). Route: by 1.2, `θ` satisfies the
integral equation, whose right side for `n = 0` does not depend on `θ` and equals `1 − ξ²/6`
(its integral is `∫₀^ξ s (1 − s/ξ) ds = ξ²/6`).

**Checks.**
- `μ(√6) = (√6)³/3 = 2√6`, and `θ'(√6) = −μ(√6)/6 = −√6/3`, the derivative of `1 − ξ²/6` there.

*Needs:* 1.2.

### 2.2 Index 1

`laneEmden_one`: if `θ` solves the equation of index `1` on `[0, ∞)`, then `θ ξ = sin ξ / ξ` for
`ξ ∈ (0, π]` and `θ ξ = π/ξ − 1` for `ξ ≥ π` (Pols, §4.1, eq. (4.9), p. 47, for the first
formula; the second is the clamp of the design). Route: the function equal to `1` at `0`,
`sin ξ / ξ` on `(0, π]` and `π/ξ − 1` after `π` is continuous, twice differentiable on `(0, ∞)`
(both pieces have value `0`, slope `−1/π` and second derivative `2/π²` at `π`) and solves the
equation; 1.3 gives uniqueness.

**Checks.**
- The first zero is `π` and `μ(π) = π`, matching Pols, Table 4.1 (`zₙ = Θₙ = 3.14159`).

*Needs:* 1.3.

### 2.3 Index 5

`laneEmden_five`: if `θ` solves the equation of index `5` on `[0, ∞)`, then
`θ ξ = (1 + ξ²/3)^(−1/2)` for all `ξ ≥ 0`, and `∫₀^∞ ξ² θ(ξ)⁵ dξ = √3` (Pols, §4.1, eq. (4.10),
p. 47; the value `√3` is the entry `Θ₅ = 1.73205` of Table 4.1). Route: differentiation shows
that the formula solves the equation; it is positive, so the clamp is inactive; 1.3 gives
uniqueness. For the integral, `ξ² θ(ξ)⁵ = μ'(ξ)` with `μ(ξ) = −ξ² θ'(ξ) = (ξ³/3)(1 + ξ²/3)^(−3/2)`,
which tends to `3^(3/2)/3 = √3` (Mathlib `MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`).

**Checks.**
- `θ(√3) = 1/√2` and `μ(√3) = √3/2^(3/2)`.
- By 4.1, the mass function of the polytrope of index `5` tends to `4π ρ(0) α³ √3` although its
  density never vanishes.

*Needs:* 1.3; Mathlib `MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto`.

### Examples

Pols, Table 4.1, lists the first zeros `√6 = 2.44949` and `π`, and `μ(ξ₁) = 2√6 = 4.89898` and
`π`, for `n = 0` and `1`; both are recomputed exactly from 2.1 and 2.2.

### Dependencies

Layer 1.

## Layer 3: the first zero

### 3.1 Finite radius for n < 5

For `0 ≤ n < 5`, `laneEmden_exists_zero`: a solution on `[0, ∞)` has a zero `ξ₁ > 0`, and it is
positive on `[0, ξ₁)` (Ramming–Rein, Lemma 3.1, p. 13, with `l = 0` and `g(y) = (max y 0)ⁿ`, and
its fluid form Theorem 4.2, p. 17, for `n < 3`; the range `3 ≤ n < 5` is proved here). Positivity
before `ξ₁` is 1.4, and since `θ 0 = 1` and `θ` is continuous, a zero exists as soon as `θ` is not
positive on all of `[0, ∞)` (Mathlib `intermediate_value_Icc'`).

Route for `0 ≤ n < 3`: for `n = 0` it is 2.1. For `0 < n < 3`, after the
change of variables `r = ξ/√(4π)` of 1.2 the function satisfies `y' = −m/r²` with
`m(r) = 4π ∫₀ʳ s² g(y(s)) ds`, where `g(y) = (max y 0)ⁿ` is continuous, increasing, zero for
`y ≤ 0`, positive for `y > 0`, and `g(y) ≥ yⁿ`; Lemma 3.1 gives a zero. Its proof: the solution
decreases (1.4) to a limit `y∞`; `y∞ > 0` forces `y(r) ≤ y(0) − C r²`; `y∞ = 0` gives
`y(r) ≥ m(1)/r` for `r ≥ 1` and `∫_{y(r)}^{y(0)} dη / g(η) ≥ C r²`, which contradict each other
as `r → ∞` when `n < 3`.

Route for `1 < n < 5`, which covers `3 ≤ n < 5`. Suppose that `θ > 0` on `[0, ∞)`. Then the clamp
is inactive, `θ ≤ 1` (1.4), `θ' = −μ/ξ²` and `μ' = ξ² θⁿ` on `(0, ∞)` (1.2), and
`0 < μ(ξ) ≤ ξ³/3` for `ξ > 0`.
1. *The limit.* `θ` decreases to a limit `L ≥ 0`. If `L > 0`, then `μ(ξ) ≥ Lⁿ ξ³/3`, so
   `θ(ξ) ≤ 1 − Lⁿ ξ²/6`, which is negative for large `ξ`; hence `θ(ξ) → 0`.
2. *The identity with boundary terms.* Fix `ξ > 0` and put `W = ∫₀^ξ s θⁿ μ ds`,
   `J = ∫₀^ξ s² θ^(n+1) ds` and `I(ξ) = ∫₀^ξ μ²/s² ds`. Integrating
   `s³ (θ^(n+1))' = −(n + 1) s θⁿ μ` by parts gives `(n + 1) W = 3J − ξ³ θ(ξ)^(n+1)`; integrating
   `θ μ'` by parts gives `J = θ(ξ) μ(ξ) + I(ξ)`; and `μ μ'/s = (μ²/(2s))' + μ²/(2s²)` gives
   `W = μ(ξ)²/(2ξ) + I(ξ)/2`. The boundary terms at `0` vanish since `θ ≤ 1` and `μ(s) ≤ s³/3`.
   Eliminating `W` and `J`,
   `(5 − n) I(ξ)/2 = (n + 1) μ(ξ)²/(2ξ) − 3 θ(ξ) μ(ξ) + ξ³ θ(ξ)^(n+1)`.
   At a zero `ξ₁` of `θ` the same three steps give 3.2.
3. *Two estimates.* For `T > ξ`, `θ(ξ) − θ(T) = ∫_ξ^T μ/s² ds ≥ μ(ξ) (1/ξ − 1/T)` since `μ`
   increases; letting `T → ∞` (step 1), `μ(ξ) ≤ ξ θ(ξ)`. Since `θ` decreases,
   `μ(ξ) ≥ ξ³ θ(ξ)ⁿ/3`, so `(θ^(1−n))' = (n − 1) θ^(−n) μ/ξ² ≥ (n − 1) ξ/3`; the function
   `(n − 1) ξ²/6 − θ(ξ)^(1−n)` is nonincreasing on `[0, ∞)` with value `−1` at `0`, so
   `θ(ξ)^(n−1) ≤ 6/((n − 1) ξ²)`. This is the step that needs `n > 1`.
4. *The contradiction.* By step 3, and `θ μ > 0`, the right side of step 2 is at most
   `(n + 1) ξ θ(ξ)²/2 + ξ³ θ(ξ)^(n+1)`. With `θ(ξ) ≤ c ξ^(−2/(n−1))`, `c = (6/(n − 1))^(1/(n−1))`,
   both terms are at most a constant times `ξ^((n−5)/(n−1))`, because
   `1 − 4/(n − 1) = 3 − 2(n + 1)/(n − 1) = (n − 5)/(n − 1)`; for `n < 5` the exponent is negative
   and the right side tends to `0`. The left side is nondecreasing in `ξ`, and for `ξ ≥ 1` it is
   at least `(5 − n) I(1)/2 > 0`: a contradiction.

**Checks.**
- The first zeros for `n = 0, 1` are `√6` and `π` (2.1, 2.2).
- For `n = 3` the first route breaks at its last step: with `g(η) = η³` the right side of the
  final inequality of the proof of Lemma 3.1 tends to `1/(2c)` instead of `0`, which is no
  contradiction; the second route covers this index. Pols, Table 4.1, lists the zero
  `z₃ = 6.89685` of index `3`.
- At `n = 5` the identity of step 2 holds with both sides `0`, as the factor `5 − n` requires: for
  `θ = (1 + ξ²/3)^(−1/2)` (2.3), `μ = (ξ³/3) θ³`, and the right side is
  `ξ³ θ⁶ (ξ²/3 − (1 + ξ²/3) + 1) = 0`.

*Needs:* 1.2, 1.4, 2.1; Mathlib `intermediate_value_Icc'`,
`intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`, `Real.hasDerivAt_rpow_const`,
`antitoneOn_of_deriv_nonpos`.

### 3.2 The virial identity of the Lane–Emden equation

For `n ≥ 0`, `laneEmden_virial`: if a solution on `[0, ∞)` vanishes at `ξ₁ > 0`, then
`(5 − n) ∫₀^{ξ₁} ξ (max θ 0)ⁿ μ(ξ) dξ = 3 μ(ξ₁)²/ξ₁` with `μ = laneEmdenMu n θ`. (Proved here.
In physical variables it is the Betti–Ritter formula of 4.4, which Pols, eq. (4.19), p. 49,
states without proof.)

Route. Write `W = ∫₀^{ξ₁} ξ θⁿ μ dξ` and `ω = μ(ξ₁)`; on `[0, ξ₁]`, `θ ≥ 0` (1.4) and
`μ' = ξ² θⁿ`, `θ' = −μ/ξ²` (1.2).
1. *Pressure.* `(θ^(n+1))' = −(n+1) θⁿ μ/ξ²`; integrating `ξ³ (θ^(n+1))'` by parts on `[0, ξ₁]`,
   with boundary terms `0` since `θ(ξ₁) = 0`, gives `(n + 1) W = 3 ∫₀^{ξ₁} ξ² θ^(n+1) dξ`.
2. *Enthalpy.* `∫₀^{ξ₁} ξ² θ^(n+1) dξ = ∫ θ μ' dξ = [θ μ] − ∫ θ' μ dξ = ∫₀^{ξ₁} μ²/ξ² dξ`, the
   bracket vanishing at both ends.
3. *Energy.* `W = ∫ μ μ'/ξ dξ = [μ²/(2ξ)] + ∫ μ²/(2ξ²) dξ = ω²/(2ξ₁) + (1/2) ∫₀^{ξ₁} μ²/ξ² dξ`,
   since `μ(ξ)²/ξ → 0` at `0` (`μ(ξ) ≤ ξ³/3`); this is the fundamental theorem of calculus for
   `μ²/(2ξ)`, continuous on `[0, ξ₁]` with value `0` at `0`.
Combining, `(n + 1) W = 3 (2W − ω²/ξ₁)`, that is `(5 − n) W = 3 ω²/ξ₁`. Near `0` every integrand
is bounded, and `n ≥ 0` keeps `θⁿ` continuous on `[0, ξ₁]`. The integrations by parts in steps
1 and 2 use functions continuous on `[0, ξ₁]` and differentiable on `(0, ξ₁)`.

**Checks.**
- `n = 0`: `μ = ξ³/3`, `ξ₁ = √6`, `W = ∫₀^√6 ξ⁴/3 dξ = 12√6/5`, and `5W = 12√6 = 3 (2√6)²/√6`.
- `n = 1`: `μ(ξ) = sin ξ − ξ cos ξ`, `W = ∫₀^π sin ξ (sin ξ − ξ cos ξ) dξ = π/2 + π/4 = 3π/4`, and
  `4W = 3π = 3π²/π`.

*Needs:* 1.2, 1.4; Mathlib `intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`.

### 3.3 No zero for n ≥ 5

For `n ≥ 5`, `laneEmden_pos_of_five_le`: a solution on `[0, ∞)` is positive on `[0, ∞)` (Pols,
§4.1, p. 47, states it). (Proved here.) Route: if it vanished somewhere, it would vanish at some
`ξ₁ > 0` (it is `1` at `0`); then 3.2 gives `(5 − n) W = 3 μ(ξ₁)²/ξ₁ > 0` with `W > 0`, which is
impossible for `n ≥ 5`.

**Checks.**
- For `n = 5` this agrees with 2.3, where the solution is `(1 + ξ²/3)^(−1/2) > 0`.

*Needs:* 3.2.

### Examples

The first zeros and masses `μ(ξ₁)` of 2.1–2.2; the identity of 3.2 at `n = 0, 1`.

### Dependencies

Layers 1 and 2.

## Layer 4: Newtonian polytropes

### 4.1 Hydrostatic equilibrium and the Lane–Emden reduction

Define `massFunction ρ r = 4π ∫₀ʳ s² ρ(s) ds`; `IsHydrostaticOn G ρ p S`: for every `r ∈ S`, `p`
has derivative `−G m(r) ρ(r)/r²` at `r`, with `m = massFunction ρ`; and
`polytropeScale n K G ρc = √((n + 1) K ρc^(1/n − 1) / (4π G))`, the length `α`.

`isHydrostaticOn_polytrope_iff`: let `n > 0`, `K > 0`, `G > 0`, let `θ` solve the Lane–Emden
equation of index `n` on `[0, ∞)`, and let `ρ ≥ 0` on `[0, ∞)` be continuous at `0` from the
right. Then the pressure `K ρ^(1+1/n)` is hydrostatic on `(0, ∞)` if and only if
`ρ r = ρ(0) (max θ(r/α) 0)ⁿ` for all `r ≥ 0`, with `α = polytropeScale n K G (ρ 0)` (Pols, §4.1,
eqs. (4.2)–(4.7), pp. 46–47; Ramming–Rein, §2.2.1, pp. 11–12, for a general equation of state
with `G = 1`).

Route. If `ρ(0) = 0`: the pressure is nonincreasing (its derivative is `≤ 0`), nonnegative and
tends to `0` at `0`, so it vanishes and `ρ = 0`; conversely `ρ = 0` is hydrostatic. Let
`ρc = ρ(0) > 0`.
- (⇐) Put `θ₊ = max θ 0`. Then `p = K ρc^(1+1/n) θ₊(r/α)^(n+1)` is differentiable on `(0, ∞)`
  with derivative `K ρc^(1+1/n) (n + 1) θ₊ⁿ θ'(r/α)/α` (at the zero `α ξ₁` both one-sided
  derivatives are `0`, since `n + 1 > 1`), and `m(r) = 4π ρc α³ μ(r/α)` by the substitution
  `s = α u` (Mathlib `intervalIntegral.integral_comp_mul_left`). With `θ' = −μ/ξ²` (1.2) the two
  sides of the hydrostatic equation agree exactly when `α² = (n + 1) K ρc^(1/n − 1)/(4π G)`.
- (⇒) `p` is differentiable, hence continuous, on `(0, ∞)`, so `ρ = (p/K)^(n/(n+1))` is
  continuous on `[0, ∞)`. Where `ρ > 0`, `ψ(ξ) = (ρ(α ξ)/ρc)^(1/n)` is differentiable and the
  hydrostatic equation reads `ψ'(ξ) = −ξ⁻² ∫₀^ξ u² ψ(u)ⁿ du`, so `ψ` solves the Lane–Emden equation
  on `[0, Ξ)`, `Ξ` the first zero of `ρ(α ·)` (or `∞`), and equals `θ` there (1.2, 1.3). Then
  `θ(Ξ) = 0`, and after `Ξ` the pressure, nonincreasing and `0` at `α Ξ`, vanishes, so `ρ = 0`,
  which is `ρc θ₊ⁿ` since `θ < 0` there (1.4).

**Checks.**
- `n = 1`: `α² = K/(2π G)`, independent of `ρc`; the density `ρc sin(r/α)/(r/α)` up to `π α`.
- Nonnegativity is needed: for `n = 1` the density `ρc sin(r/α)/(r/α)` on all of `[0, ∞)`, which
  is negative on `(π α, 2π α)`, satisfies the hydrostatic equation with `p = K ρ²` (where
  `ρ ≠ 0` it is the linear equation `ρ' = −G m/(2K r²)`, and where `ρ = 0` both sides vanish),
  but it is not `ρc (max θ 0)`.
- Continuity at `0` is needed: the density equal to `1` at `0` and to the polytrope of central
  density `2` on `(0, ∞)` is hydrostatic on `(0, ∞)` (the mass function does not see the value
  at `0`) but is not the polytrope of central density `1`.
- `K > 0` is needed: for `K = 0` the scale is `0`, the right side holds for the constant density
  `ρ(0)`, and a constant positive density with zero pressure is not hydrostatic.
- `G > 0` is needed: for `G < 0` the argument of the square root in the scale is negative, Mathlib's
  `√` gives `0`, the right side again holds for the constant density `ρ(0) > 0`, and the constant
  pressure is not hydrostatic since `G m(r) ρ(0)/r² ≠ 0`.
- `n > 0` is needed: for `n = 0` the exponent `1 + 1/n` is `1` (Mathlib's `1/0 = 0`), the law
  `p = K ρ` is isothermal, and its equilibria are not the constant densities the right side
  describes.

*Needs:* 1.2, 1.3, 1.4; Mathlib `Real.hasDerivAt_rpow_const`,
`intervalIntegral.integral_comp_mul_left`, `intervalIntegral.integral_hasDerivAt_right`.

### 4.2 Radius, mass and the mass–radius relation

For `0 < n < 5`, `polytrope_mass_radius`: there is `C > 0` such that for all `K > 0`, `G > 0` and
every density `ρ ≥ 0` with `ρ(0) > 0`, continuous at `0`, whose pressure `K ρ^(1+1/n)` is
hydrostatic on `(0, ∞)`, there is `R > 0` with `ρ > 0` on `[0, R)`, `ρ = 0` on `[R, ∞)`, and
`K = C G M^((n−1)/n) R^((3−n)/n)` with `M = m(R)` (Pols, §4.1.1, eqs. (4.11)–(4.15), p. 48).

Route. By 4.1 and 3.1, `R = α ξ₁` and `M = 4π ρc α³ ω` with `ω = μ(ξ₁) > 0`. Eliminating `ρc`
from `α² = (n + 1) K ρc^(1/n − 1)/(4π G)` gives the relation with
`C = (4π)^(1/n) ω^((1−n)/n) ξ₁^((n−3)/n) / (n + 1)`, which depends on `n` only.

**Checks.**
- `n = 1`: `C = 2π/π² = 2/π` (Pols, Table 4.1, `N₁ = 0.63662`), so `R = π √(K/(2π G))` does not
  depend on `M`.
- `n = 3`: `α² = K ρc^(−2/3)/(π G)`, so `M = 4π ρc α³ ω = 4 ω K^(3/2)/(√π G^(3/2))` does not
  depend on the central density, and the relation reads `K = C G M^(2/3)` (`R^0 = 1`).
- The quantifier order matters: `C` is chosen before `K`, `G` and the central density.

*Needs:* 3.1, 4.1.

### 4.3 The virial identity

Define `gravitationalEnergy G ρ R = −4π G ∫₀^R r m(r) ρ(r) dr`, the energy `−∫ G m dm / r`.

`virial_identity`: for `R ≥ 0`, if `ρ` and `p` are continuous on `[0, R]`, `p` is hydrostatic on
`(0, R)` and `p R = 0`, then `3 · 4π ∫₀^R r² p dr + gravitationalEnergy G ρ R = 0`, that is
`3 ∫ p dV = −E` (Pols, §2.3, eqs. (2.19)–(2.23), pp. 13–14). Route: `r³ p` is continuous on
`[0, R]` and differentiable on `(0, R)` with derivative `3 r² p − G r m ρ`, which is bounded
because `|m(r)| ≤ C r³`; its integral over `[0, R]` is `R³ p(R) − 0 = 0` (Mathlib
`intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`).

**Checks.**
- Uniform ball, `ρ = ρ₀` on `[0, R]`: `m = 4π ρ₀ r³/3`, `E = −(16/15) π² G ρ₀² R⁵ = −3 G M²/(5R)`,
  and the hydrostatic pressure `p = (2π/3) G ρ₀² (R² − r²)` gives `3 · 4π ∫₀^R r² p dr` equal to
  the same `(16/15) π² G ρ₀² R⁵`.
- Continuity of `p` at `R` is needed: `ρ = 0`, `p = 1` on `[0, R)` and `p(R) = 0` is hydrostatic
  on `(0, R)`, but `3 · 4π ∫₀^R r² p dr = 4π R³ ≠ 0 = −E`.

*Needs:* 4.1; Mathlib `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`,
`ContinuousOn.intervalIntegrable`.

### 4.4 The Betti–Ritter formula

`polytrope_gravitationalEnergy`: under the hypotheses of 4.1 (with the pressure `K ρ^(1+1/n)`
hydrostatic on `(0, ∞)`), if `R > 0`, `ρ > 0` on `[0, R)` and `ρ(R) = 0`, then
`(5 − n) E = −3 G M²/R` with `E = gravitationalEnergy G ρ R` and `M = m(R)` (Pols, eq. (4.19),
p. 49, stated without proof). Route: by 4.1, `R = α ξ₁`; the substitution `r = α ξ` turns `E`
into `−16 π² G ρc² α⁵ W` and `3 G M²/R` into `16 π² G ρc² α⁵ · 3 ω²/ξ₁`, and 3.2 finishes.

**Checks.**
- `n = 1`, `α = 1`: `m = 4π (sin r − r cos r)`, `M = 4π²`, `R = π`, and
  `E = −16 π² G ∫₀^π (sin r − r cos r) sin r dr = −12 π³ G = −3 G M²/(4R)`; the virial identity
  4.3 holds with `p = 2π G sin² r / r²`.
- `R` must be the first zero: the polytrope of index `1` vanishes on all of `[π α, ∞)`, and for
  `R > π α` the identity fails, since `E` and `M` do not change while `R` grows. The hypothesis
  `ρ > 0` on `[0, R)` excludes these `R`.
- The case `n = 0` (the uniform ball) is outside 4.1, but 3.2 at `n = 0` is its dimensionless
  form: `E = −3 G M²/(5R)`, as in the Check of 4.3.

*Needs:* 3.2, 4.1.

### Examples

The homogeneous ball; the polytrope of index `1`, whose radius depends only on `K` and `G`.

### Dependencies

Layers 1 and 3 (3.1 in 4.2, 3.2 in 4.4).

## Layer 5: Buchdahl's inequality for the Tolman–Oppenheimer–Volkoff system

### 5.1 The system

`IsTOVSolutionOn ρ p R`: `2 m(r) < r` for every `r ∈ (0, R]`, and for every `r ∈ (0, R)` the
function `p` has derivative `−(ρ + p)(m + 4π r³ p)/(r (r − 2m))` at `r`, with `m = massFunction ρ`
and units `G = c = 1` (Reall, §1.5, eqs. (1.10)–(1.12), p. 6, where `2m < r` is the positivity of
`1 − 2m/r`). The system is used as an ordinary differential equation; its derivation from the
Einstein equations is not part of this roadmap.

**Checks.**
- For constant `ρ₀`, `m(r) = 4π ρ₀ r³/3` and `2 m(r)/r = 8π ρ₀ r²/3`, increasing in `r`.

*Needs:* 4.1 (`massFunction`).

### 5.2 Buchdahl's inequality

`buchdahl`: let `R > 0`, let `ρ` and `p` be continuous on `[0, R]`, let the mean density
`m(r)/r³` be nonincreasing on `(0, R]`, let `(ρ, p)` satisfy `IsTOVSolutionOn ρ p R`, and let
`p(R) ≥ 0`. Then `9 m(R) < 4R`, that is `2 m(R)/R < 8/9` (Reall, §1.7, eq. (1.20), p. 8, for
nonnegative nonincreasing `ρ` and a star with `p(R) = 0`; Reall leaves the proof to an
examples sheet). (Proved here.)

Route. Write `S(r) = √(1 − 2m(r)/r)`, `q(r) = (m + 4π r³ p)/(r² S²)` and `M = m(R)`; if `M ≤ 0`
there is nothing to prove.
1. `q` is continuous on `(0, R]` and `q(r) = O(r)` at `0`, since `ρ` and `p` are bounded,
   `m(r) = O(r³)`, and `1 − 2m(r)/r`, positive on `(0, R]` with limit `1` at `0`, is bounded below
   by a positive constant there. So `ζ(r) = exp (−∫_r^R q)` is continuous on `[0, R]`, positive, and
   `ζ' = q ζ`.
2. With `Y = ζ (m + 4π r³ p)/(r³ S)`, the system and `m' = 4π r² ρ` give
   `Y' = (ζ/S) (m/r³)'` on `(0, R)`, which is `≤ 0` by the mean-density hypothesis; so
   `Y(r) ≥ Y(R) ≥ ζ(R) M/(R³ S(R))`, the last step by `p(R) ≥ 0`.
3. `ζ' = r Y/S`, `Y ≥ ζ(R) M/(R³ S(R)) > 0` by step 2 and `M > 0`, and `m(r)/r³ ≥ M/R³` gives
   `1/S(r) ≥ (1 − 2M r²/R³)^(−1/2)`. Integrating over `[0, R]`, with `∫₀^R r (1 − 2M r²/R³)^(−1/2) dr = (R³/(2M)) (1 − S(R))`,
   `ζ(R) − ζ(0) ≥ ζ(R) (1 − S(R))/(2 S(R))`.
4. Since `ζ(0) > 0`, `3 S(R) > 1`, that is `1 − 2M/R > 1/9`.
The route uses neither `ρ ≥ 0` nor `p ≥ 0` away from `R`.

**Checks.**
- A nonincreasing `ρ` has nonincreasing mean density: `m(r)/r³ = 4π ∫₀¹ u² ρ(r u) du`.
- The constant-density stars of 5.3 have `2M/R` arbitrarily close to `8/9`.

*Needs:* 4.1 (`massFunction`), 5.1; Mathlib `antitoneOn_of_deriv_nonpos`,
`intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le`,
`intervalIntegral.integral_hasDerivAt_right`, `Real.exp_pos`.

### 5.3 Sharpness: the constant-density stars

Define `constantDensityPressure ρ₀ R r` as
`ρ₀ (√(1 − 2M r²/R³) − √(1 − 2M/R)) / (3 √(1 − 2M/R) − √(1 − 2M r²/R³))` with `M = 4π ρ₀ R³/3`.

`buchdahl_sharp`: for `R > 0`, `ρ₀ > 0` and `9M < 4R`, this pressure is continuous on `[0, R]`,
the pair (constant `ρ₀`, this pressure) satisfies `IsTOVSolutionOn` on `(0, R]`, the pressure
vanishes at `R` and is nonnegative on `[0, R]` (Reall, §1.7, p. 8, states the sharpness for
constant density). (Proved here.) Route: the denominator is at least `3 √(1 − 2M/R) − 1 > 0`
because `2M/R < 8/9`; `2 m(r)/r = 2M r²/R³ ≤ 2M/R < 1`; the numerator is `≥ 0` and vanishes at
`R`; the TOV equation is checked by differentiation. Every value of `2M/R` in `(0, 8/9)` occurs,
so 5.2 cannot hold with a constant below `8/9`.

**Checks.**
- The central pressure is `ρ₀ (1 − √(1 − β))/(3 √(1 − β) − 1)` with `β = 2M/R`; it tends to `+∞`
  as `β → 8/9` and to `0` as `β → 0`.
- With `β = 3/4`: `√(1 − β) = 1/2` and the central pressure is `ρ₀ (1/2)/(1/2) = ρ₀`.

*Needs:* 4.1 (`massFunction`), 5.1.

### Examples

The constant-density stars, with `2M/R` filling `(0, 8/9)`.

### Dependencies

Layer 4 (the mass function only).

## Scope and ownership

This roadmap owns the Lane–Emden equation with real index `n ≥ 0` as an initial value problem
singular at the centre (its regular solution, integral form, existence, uniqueness, monotonicity,
the explicit solutions of index `0`, `1`, `5`, the finite radius for `n < 5`, the virial identity
and the positivity for `n ≥ 5`), the hydrostatic equation of a radial Newtonian star with the
mass function, polytropes and their Lane–Emden reduction, the mass–radius relation, the virial
identity and the Betti–Ritter formula, and Buchdahl's inequality for the
Tolman–Oppenheimer–Volkoff system stated as an ordinary differential equation, with its
constant-density sharpness.

Boundaries.

- The PDE roadmap, Layer 3 (3.4, the Newtonian potential theorem for `C_c^∞` densities), owns the
  Newtonian potential. This roadmap never uses it: gravity enters through `G m(r)/r²`, and the
  statement that this is the radial gradient of the Newtonian potential of a radial density is not
  treated here.
- Lorentzian metrics, the Schwarzschild solution and the Einstein equations are not defined here;
  the Tolman–Oppenheimer–Volkoff system of Layer 5 is a system of real ordinary differential
  equations. Schwarzschild orbits and Friedmann models are not treated here.
- The existence and uniqueness theorems of Mathlib (Picard–Lindelöf, Gronwall uniqueness) are
  used for the regular part of the system; no theorem on main about Carathéodory solutions is
  needed, since the Lane–Emden system is continuous in the radius away from the centre.

Not treated here: Emden–Fowler and isothermal spheres; kinetic (Vlasov–Poisson) polytropes and
their compact support; stability of polytropes; Chandrasekhar's limiting mass beyond the scaling
of 4.2; the general-relativistic finite radius of Ramming–Rein, Theorem 4.2; Andréasson's
extension of Buchdahl's inequality to anisotropic pressure and non-monotone density (Andréasson,
Theorems 1 and 2, p. 7); the interior bound (1.19) of Reall's §1.7.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/SpecialFunctions/Pow/Real.lean`: `Real.rpow_zero` (`x ^ 0 = 1`),
  `Real.zero_rpow` (`0 ^ y = 0` for `y ≠ 0`), `Real.rpow_def_of_neg` (the value
  `exp (log x · y) · cos (y π)` for `x < 0`), used in the design and its Checks.
- `Mathlib/Analysis/SpecialFunctions/Pow/Continuity.lean`: `Real.continuousAt_rpow_const`
  (continuity of `x ↦ x ^ q` at `x` when `x ≠ 0` or `q ≥ 0`), for 1.1.
- `Mathlib/Analysis/SpecialFunctions/Pow/Deriv.lean`: `Real.hasDerivAt_rpow_const` (derivative
  `p x^(p−1)` when `x ≠ 0` or `p ≥ 1`), for 1.1, 3.1 and 4.1.
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`:
  `intervalIntegral.integral_hasDerivAt_right` (an interval integral of an integrable function,
  continuous at `b`, has derivative `f b` in its upper limit),
  `intervalIntegral.integral_eq_sub_of_hasDerivAt_of_le` (for `a ≤ b`, `f` continuous on `[a, b]`
  with derivative `f'` on `(a, b)` and `f'` integrable, `∫_a^b f' = f b − f a`), for 1.2, 3.1,
  3.2, 4.3, 5.2.
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/IntegrationByParts.lean`:
  `intervalIntegral.integral_mul_deriv_eq_deriv_mul_of_hasDerivAt` (integration by parts on
  `[a, b]` for functions continuous on `[a, b]`, differentiable on `(a, b)`, with integrable
  derivatives), for 3.1 and 3.2.
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`: `ContinuousOn.intervalIntegrable`,
  `intervalIntegral.integral_comp_mul_left` (`∫_a^b f(c x) dx = c⁻¹ ∫_{ca}^{cb} f` for `c ≠ 0`),
  for 1.2, 4.1, 4.3.
- `Mathlib/MeasureTheory/Integral/IntegralEqImproper.lean`:
  `MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto` (an integral over `(a, ∞)` of a
  derivative with integrable values is the limit at infinity minus the value at `a`), for 2.3.
- `Mathlib/Topology/MetricSpace/Contracting.lean`: `ContractingWith.efixedPoint'` (the fixed
  point of a contraction that maps a complete set into itself), for 1.3.
- `Mathlib/Analysis/ODE/ExistUnique.lean`:
  `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt` (local existence for a field that
  is bounded, continuous in time and Lipschitz in the state on a cylinder) and
  `ODE_solution_unique_of_mem_Icc_right` (two solutions of a field Lipschitz in the state on the
  region they stay in, equal at the left end of an interval, agree on the interval), for 1.3.
- `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`: `strictAntiOn_of_deriv_neg`,
  `antitoneOn_of_deriv_nonpos`, for 1.4, 3.1 and 5.2.
- `Mathlib/Topology/Order/IntermediateValue.lean`: `intermediate_value_Icc'` (a function continuous
  on `[a, b]` with `a ≤ b` takes every value between `f b` and `f a` on `[a, b]`), for 3.1.
- `Mathlib/Analysis/Complex/Exponential.lean`: `Real.exp_pos`, for 5.2.

### From Tau Ceti

Nothing; `Suggested.lean` imports only Mathlib.

## References

- [RR] Tobias Ramming and Gerhard Rein, *Spherically symmetric equilibria for self-gravitating
  kinetic or fluid models in the non-relativistic and relativistic case — a simple proof for
  finite extension*, arXiv:1203.2590v1 (2012): §2.1.1 (pp. 8–9), §2.2.1 (pp. 11–12), Lemma 3.1
  (p. 13), Theorem 4.2 (p. 17).
- [PO] Onno R. Pols, *Stellar Structure and Evolution*, lecture notes, Utrecht, September 2011,
  chapters 1–4, from the author's page (www.astro.ru.nl/~onnop/education/stev_utrecht_notes/):
  §2.3 (pp. 13–14), §4.1 and Table 4.1 (pp. 46–47), §4.1.1 (pp. 48–49); page numbers as printed.
- [HR] Harvey S. Reall, *Black Holes*, Part III lecture notes, Cambridge, version of 15 March 2024,
  from the author's page (www.damtp.cam.ac.uk/user/hsr1000/): §1.5 (p. 6), §1.7 (pp. 7–8).
- [AN] Håkan Andréasson, *Sharp bounds on 2m/r of general spherically symmetric static objects*,
  arXiv:gr-qc/0702137v2 (2007): Theorems 1 and 2 (p. 7), cited for what is not treated here.
- Attributions in prose, as the texts above give them: Hans Buchdahl (1959) for the inequality
  `2M/R ≤ 8/9` and Karl Schwarzschild (1916) for the constant-density bound (Andréasson, §1,
  p. 2).
