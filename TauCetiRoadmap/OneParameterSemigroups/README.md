# Roadmap: one-parameter semigroups, completely monotone and positive-definite functions, and Bochner-type representations

Operator semigroups are the analytic backbone of evolution equations (heat, Fokker–Planck)
and of Markov-process theory. This roadmap specifies their reusable theory together with
completely monotone, Bernstein and positive-definite functions and their integral
representations. Consume the Mathlib and Tau Ceti objects described below: Banach/Hilbert
spaces, bounded and partial linear operators, resolvents, Bochner integrals, Fourier
analysis, C₀ semigroups, and the native representation predicates. Develop and connect the
full APIs and examples in Parts A–C.

The goal is to **build the reusable theory of these objects**, not to race to a handful of
named theorems. The bar for "done": a researcher in evolution equations, Markov semigroups,
or harmonic analysis finds the objects defined at their natural generality, equipped with
the basic API (closure properties, the standard identities, the connections to existing
Mathlib structures), so that the headline theorems are *consequences of a developed theory*
rather than isolated endpoints. A PR that proves a headline theorem but leaves the
surrounding object without its basic API is not yet what we want.

Suggested home: `TauCeti/Analysis/Semigroups/`, `TauCeti/Analysis/CompletelyMonotone/`,
`TauCeti/Analysis/PositiveDefinite/`, `TauCeti/Analysis/Bochner/`.

## Generality bar (decide these up front; do not silently specialize)

- **Semigroups: general C₀ first, contraction as a subclass.** Define general strongly
  continuous semigroups with a growth bound `‖S t‖ ≤ M e^{ω t}`; contraction semigroups
  (`M = 1, ω = 0`) are a subclass. State the Hille–Yosida bounds at the general `(M, ω)`
  level (`‖R(λ,A)ⁿ‖ ≤ M / (λ−ω)ⁿ`); the contraction case is the corollary, never the
  silent default.
- **Scalar field: real-Banach-first, stated explicitly.** Develop over a real Banach space
  `X` (`[NormedSpace ℝ X]`) — Hille–Yosida / Lumer–Phillips hold there, and a complex Hilbert
  space carries the real action together with an explicit `S.IsComplexLinear` hypothesis.
  Retain the complex generator and its scalar-restriction comparison. For a real X,
  consume the normed **complexification** `TauCeti.Complexification X` and develop the
  domain, action and complex-resolvent comparisons specified in Part A.
- **C₀ groups.** Two-sided strongly continuous groups `(S(t))_{t∈ℝ}` — e.g. the unitary
  `e^{itH}` of Schrödinger — are *not* reached by the contraction-semigroup API. Stone's
  theorem on Hilbert space is a milestone of
  [`OperatorTheory/SelfAdjointSpectralTheory`](../OperatorTheory/SelfAdjointSpectralTheory/README.md),
  which is cited for it rather than specifying it twice.
- **Generators are unbounded.** The generator is a densely defined `LinearPMap`. Its resolvent
  uses the shared `TauCeti.LinearPMap` core, with `λ ∈ ρ(A)` when
  `λ I - A : D(A) → X` has a bounded two-sided inverse. The bounded-operator bridge
  identifies this inverse with Mathlib's Banach-algebra resolvent. This roadmap owns the general
  generator theory and its resolvent estimates;
  [`OperatorTheory/SelfAdjointSpectralTheory`](../OperatorTheory/SelfAdjointSpectralTheory/README.md)
  owns the scalar generalization of the shared resolvent core, the self-adjoint estimates, and
  the imaginary-shift Yosida approximants.
- **Bochner at its natural generality.** A continuous positive-definite function lives on a
  **general finite-dimensional real inner-product space** `V` (so `ℝ²` as `ℝ × ℝ`, or any
  finite-dim space, is covered) — *not* on hard-coded `Fin d` coordinates. State Bochner for
  such `V`. The BCR involutive-semigroup representation is then
  stated over `[0,∞) × V`.
- **Spell hypotheses out; never bundle.** Positive-definiteness, complete monotonicity, the
  involution, growth bounds — each is a named predicate, stated explicitly, not folded into
  a conclusion.

## What Mathlib already has (consume, and connect to)

- **Operators & spectrum:** `ContinuousLinearMap`, operator norm, `spectrum`, **`resolvent`**,
  the holomorphic functional calculus; **unbounded operators** via `LinearPMap` (closure,
  adjoint, cores). Tie the generator and its domain to these; the generator's resolvent needs
  its own notion (it is not a Banach-algebra element — see the generality bar), bridged to
  Mathlib's `resolvent` in the bounded case rather than duplicated.
- **The Bochner integral** (`MeasureTheory/Integral/Bochner/*`): the resolvent is a
  **pointwise** `X`-valued Bochner integral `R(λ)x = ∫₀^∞ e^{−λt} S(t)x dt`. ⚠ A general C₀
  semigroup is only *strongly* continuous, so `t ↦ S(t)` need not be norm-measurable as a
  `ContinuousLinearMap` (`B(X)` is generally non-separable) — integrate **pointwise** in `x`,
  then bundle the result into a `ContinuousLinearMap`. Plus dominated convergence, Fubini,
  the `Ioi`/`integral_comp_add_right` lemmas.
- **Fourier analysis** (`Analysis/Fourier/*`): `FourierTransform`, inversion, Plancherel,
  and characteristic-function uniqueness of finite measures — the spatial half of Bochner.
  ⚠ Mind Mathlib's `2π` convention (`e^{-2πi⟨·,·⟩}`, unitary, no prefactors).
- **Measure theory:** `Measure`/`IsFiniteMeasure`, `charFun`
  (`MeasureTheory/Measure/CharacteristicFunction`), **Lévy continuity**, **Prokhorov**
  (`MeasureTheory/Measure/Prokhorov`), **Riesz–Markov–Kakutani**
  (`MeasureTheory/Integral/RieszMarkovKakutani`) — the measure-extraction toolkit.
  Use `Mathlib.MeasureTheory.Measure.LevyConvergence` for Lévy continuity.
- **Real analysis:** `Real.exp`, Taylor's theorem with integral remainder, monotone/dominated
  convergence, `deriv`/iterated derivatives — for the completely-monotone theory.

## Programme and ownership

The following are definitive targets, including the full basic theory of every object.
Consume existing native declarations under their own names; develop the remaining
comparisons and examples in the stated dependency order. Each part specifies its API,
representation milestones and acceptance examples. The shared scalar-polymorphic partial
operator resolvent core belongs to
[`OperatorTheory/SelfAdjointSpectralTheory`](../OperatorTheory/SelfAdjointSpectralTheory/README.md);
this roadmap owns general C₀ generation and its Banach-space complexification applications.

---

## Part A — Strongly continuous semigroups

**Objects.** `StronglyContinuousSemigroup` (general C₀, with a growth bound), its subclass
`ContractionSemigroup`; the **generator** `A` with its dense domain `D(A)` (a `LinearPMap`);
the **resolvent** `R(λ,A)`. Model the generator with Mathlib's `LinearPMap` directly (plus a
dense-domain hypothesis); the `DenseLinearOperator` named in the stubs below is exactly that
thin wrapper, not a parallel unbounded-operator API.

**API to develop.**
- The semigroup laws, strong continuity, and the growth bound `‖S t‖ ≤ M e^{ω t}`
  (`existsGrowthBound`); the generator as the strong derivative at `0` on `D(A)`.
- **The generator determines the semigroup uniquely**; the generator is **closed**, with
  `S(t)·D(A) ⊆ D(A)` and `A S(t)x = S(t) A x`, and `t ↦ S(t)x` differentiable for `x ∈ D(A)`.
- **Bounded ↔ uniformly continuous:** `A` is bounded (`domain = ⊤`) iff the semigroup is
  uniformly (norm-) continuous; plus the bounded-perturbation theorem.
- **Foundational lemmas:** `∫₀ᵗ S(s)x ds ∈ D(A)` with `A ∫₀ᵗ S(s)x ds = S(t)x − x`; a **named
  density-of-`D(A)`** theorem for generated semigroups (density of `D(Aⁿ)` / smooth vectors is
  a useful secondary target). These are the workhorses behind the generation theorem.
- **Dissipativity:** the Lumer–Phillips **converse** (the generator of a contraction semigroup
  is dissipative) and maximal dissipativity. ⚠ The Hilbert characterization `Re⟪Ax, x⟫ ≤ 0`
  is a **Hilbert-only specialization**; the general Banach notion goes through duality maps /
  resolvent-range inequalities.
- **Resolvent theory** (its own unbounded-resolvent notion + the bridge lemma above):
  - `R(λ,A)x = ∫₀^∞ e^{−λt} S(t)x dt` (pointwise Bochner integral) for **real** `λ > ω` (use
    a complexification for the complex resolvent set and the analyticity below);
  - the **resolvent identity** `R(λ,A) − R(μ,A) = (μ − λ) R(λ,A) R(μ,A)`;
  - **analyticity** of `λ ↦ R(λ,A)` on the resolvent set;
  - the **derivative / power formulas** (for `n ≥ 1`) `R(λ,A)ⁿ x = ∫₀^∞ tⁿ⁻¹/(n−1)! · e^{−λt}
    S(t)x dt`, with `dᵏR(λ,A)/dλᵏ = (−1)ᵏ k! · R(λ,A)^{k+1}`;
  - the **iterated-resolvent bounds** (for `λ > ω`, `n ≥ 1`) `‖R(λ,A)ⁿ‖ ≤ M / (λ − ω)ⁿ`
    (Hille–Yosida bound, general `(M, ω)`; contraction `‖R(λ,A)‖ ≤ 1/λ` is the corollary).

**Complexification and complex actions.** Use the native
`TauCeti.Complexification X`, whose elements have coordinates x+iy, complex scalar action
`(a+ib)(x+iy)=(ax−by)+i(bx+ay)`, and Taylor norm
`‖x+iy‖=sup_{|z|=1} ‖Re(z(x+iy))‖`. Its real embedding `ofRealLI` is isometric;
`max(‖x‖,‖y‖)≤‖x+iy‖≤‖x‖+‖y‖`, `equivProd` is a real continuous linear
equivalence with X×X, and completeness is inherited from X. Consume these native maps
and `ContinuousLinearMap.complexify`, including preservation of norms, identities,
composition and powers. A complex Banach space viewed over ℝ retains its given complex
action; do not identify its Taylor complexification with the original space isometrically.

For a densely defined real `LinearPMap` A, specify its complexification by the graph
`((x+iy),(u+iv))∈graph(A_ℂ) ↔ (x,u)∈graph(A) ∧ (y,v)∈graph(A)`.
Its domain is D(A)+iD(A), its action is Ax+iAy, and density and closedness transport
through `equivProd`. Prove the inverse comparison for every real resolvent point:
`λ∈ρ(A) ↔ (λ:ℂ)∈ρ(A_ℂ)` and `R(λ,A_ℂ)=R(λ,A).complexify`, with equal norms.
The reverse implication uses conjugation, uniqueness of the inverse, and its restriction
to the conjugation-fixed real subspace. This graph construction and its comparison API
are targets here; use the shared `LinearPMap` resolvent definitions throughout.

For a real C₀ semigroup S, consume `StronglyContinuousSemigroup.complexify`,
`hasGrowthBound_complexify_iff`, `mem_complexify_domain_iff` and the native graph/action
comparisons. Identify its complex generator with A_ℂ for A=S.generator, using the
displayed graph equality. For an action on an already complex space, retain
`S.IsComplexLinear`, `S.complexLinearOperator` and `S.complexGenerator`; its restriction
to ℝ is exactly S.generator, with the same domain and action. Conversely, generation
from a complex-linear A preserves complex linearity by generator uniqueness, using
`isComplexLinear_of_generator_eq_restrictScalars`.

For `Re z>ω`, use the native complex-resolvent theory to give
`R(z,A_ℂ)u=∫₀^∞ exp(−zt) S_ℂ(t)u dt` as a **pointwise** vector-valued integral and
`‖R(z,A_ℂ)^n‖≤M/(Re z−ω)^n` for n≥1. Consume
`resolvent_complexify_complexGenerator_ofReal` for the real-axis comparison.
The shared resolvent Neumann expansion gives operator-norm analyticity on the entire
resolvent set; its restriction to this half-plane agrees with the integral construction.
Give the resolvent identity, all complex derivative/power formulas, and the original
complex-space version under `S.IsComplexLinear`. Prove the real Hille–Yosida theorem
before applying this bridge, so complexification does not become a premise of real
generation.

**Milestone — Hille–Yosida generation theorem.** A densely-defined operator whose resolvent
set contains `(ω,∞)` and whose powers satisfy `‖R(λ,A)ⁿ‖ ≤ M/(λ−ω)ⁿ` generates a C₀ semigroup
of growth `(M, ω)`.

**Milestone — Lumer–Phillips theorem** (kept distinct — a different hypothesis set). A
densely-defined **dissipative** operator with a **range condition** (`∃ λ₀ > 0` with `λ₀ − A`
surjective) generates a **contraction** semigroup.

**Yosida construction and growth bounds.** Consume the native
`TauCeti.Semigroups.hilleYosida_generation` and its exponent-zero approximation API.
For general growth `(M,ω)`, with `1≤M`, first set `B=A−ωI` on the same dense domain.
Transport the resolvent-power bounds to `‖R(λ,B)^n‖≤M/λ^n` for `λ>0`, and form
`Bλ=λ²R(λ,B)−λI`. The native
`TauCeti.Semigroups.norm_exp_smul_yosidaApproximation_le` gives
`‖exp(t Bλ)‖≤M` for `t≥0`, using all resolvent-power estimates. Prove the orbits
are Cauchy uniformly on compact time intervals, construct their strong limit T,
identify its generator with B, and recover `S(t)=exp(ωt)T(t)` with
`‖S(t)‖≤M exp(ωt)` and generator A. Use the native scalar-shift and exponential-shift
comparisons throughout. At `M=1,ω=0` these are contraction approximants, as used
in Lumer–Phillips. For the unshifted `Aλ=λ²R(λ,A)−λI`, also give the direct estimate
`‖exp(t Aλ)‖≤M exp(t λω/(λ−ω))` for `λ>max(ω,0)` and `t≥0`, by the exponential
power series and the general resolvent-power bounds. Carry the uniform bounds
on compact time intervals in the Cauchy and limit arguments before S is defined.
Include `X=ℝ,A=Id,M=1,ω=1,λ=2`: `Aλ=2Id` and `exp(t Aλ)=exp(2t)Id`.
Refs: Engel–Nagel II.3.5–3.8; Pazy Ch. 1.

**Milestone — abstract Cauchy problem.** `u(t) = S(t)x` is the solution of `u' = A u`,
`u(0) = x`: a **classical** solution for `x ∈ D(A)` (`u(t) ∈ D(A)`, `u' = Au`), a **mild**
solution for general `x`. It follows from generator-uniqueness, but it is the motivating
payoff, so state it as a milestone.

```lean
variable {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]

-- resolvent identity, analyticity, power bounds (the developed API), then:
-- variable (M ω : ℝ)   -- growth constants; 1 ≤ M
-- theorem hilleYosida_generation (A : DenseLinearOperator X)
--     (hdense : Dense (A.domain : Set X))
--     (hρ : ∀ l : ℝ, ω < l → l ∈ resolventSet A)          -- (ω,∞) ⊆ ρ(A)
--     (hbound : ∀ n, 1 ≤ n → ∀ l : ℝ, ω < l → ‖resolvent A l ^ n‖ ≤ M / (l - ω) ^ n) :
--     ∃ S : StronglyContinuousSemigroup X, S.generator = A ∧ S.HasGrowthBound ω M
-- theorem lumerPhillips (A : DenseLinearOperator X)
--     (hd : A.IsDissipative)
--     (hr : ∃ l₀ > 0, Surjective (l₀ • 1 - A))    -- surjectivity of (λ₀·I − A) : D(A) → X
--     : ∃ S : ContractionSemigroup X, S.generator = A
```

**Acceptance examples.** On real `L^p`, `1≤p<∞`, construct
`S(t)f=exp(−tm)f` for a measurable real multiplier m bounded below almost everywhere;
identify the generator as multiplication by −m on `{f | mf∈L^p}`. When `m≥0` this
is a contraction semigroup and `‖R(λ)‖≤1/λ` for `λ>0`. For a general lower bound,
state the corresponding exponential growth and shifted resolvent bound. For every
bounded operator A, construct `exp(tA)`, prove its generator and resolvent identity,
and identify the resolvent with the Neumann series for `λ>‖A‖`. Keep the general
bound `‖R(λ,A)‖≤M/(λ−ω)` under its declared growth hypotheses. Include `A=Id`
on `ℝ`, where `R(λ,A)=(λ−1)⁻¹Id` for `λ>1`, as a positive-growth test.

## Part B — Completely monotone (and Bernstein) functions

**Objects.** `IsContinuousCompletelyMonotoneOnIoi` — continuity on `[0,∞)` together with
complete monotonicity on the *open* `(0,∞)`:
`ContinuousOn f (Set.Ici 0) ∧ IsCompletelyMonotoneOnIoi f`. ⚠ A sign condition alone will not do:
`iteratedDeriv` is total and defaults to `0` where `f` is not differentiable, so `0 ≤ 0` would let
a non-smooth `f` pass *vacuously*; the smoothness must be part of the predicate. ⚠ But it must be
smoothness on the open ray, not on `Set.Ici 0`. Demanding `ContDiffOn ℝ ⊤ f (Set.Ici 0)` makes the
reverse direction of the milestone below false: take the finite measure with mass `∝ 1/n²` at each
`n`, whose Laplace transform is continuous at `0` but has no finite right derivative there, so it
is not `ContDiffOn` within `Set.Ici 0`. Consume `TauCeti.IsBernsteinFunction`: f is continuous and nonnegative on `[0,∞)`,
C∞ on `(0,∞)`, and `deriv f` is completely monotone on `(0,∞)`. Values on the
negative ray are immaterial. Smoothness at0 is not required; sqrt is an acceptance
example with a singular right derivative.

**API to develop.**
- Closure: completely monotone functions on `(0,∞)` are closed under **sums,
  nonnegative scalar multiples, products, and finite-valued pointwise limits**.
  For the class continuous on `[0,∞)`, also require continuity of the limit at0
  (or prove it from a stated uniform convergence hypothesis there).
  Include `f_n(t)=exp(−nt)`: its pointwise limit on the closed ray is1 at0 and0
  for `t>0`, and is discontinuous at0. **Composition** `g∘f` of a completely
  monotone g with a Bernstein f is completely monotone wherever g is defined
  on the range of f; include the zero value only when g has the required
  continuous extension there. Supply derivative and integral closure with
  their sign, finiteness and endpoint hypotheses.
- The **extreme rays**: the functions `t ↦ e^{−tx}` (`x ≥ 0`) are the building blocks, and the
  representation below realizes a general completely monotone function as a mixture of them.
- **Bernstein representation and basic theory.** Develop the nonnegative cone,
  monotonicity, concavity, composition and the criterion that `exp(−s f)` is completely
  monotone for every s≥0. State the criterion for continuous nonnegative f on `[0,∞)`;
  its converse supplies the open-ray smoothness. The **Lévy–Khinchine representation** is
  `f(t)=a+bt+∫(1−exp(−tx)) ν(dx)` for t≥0, with a,b≥0, ν a positive measure on
  `ℝ≥0`, `ν{0}=0`, and `Integrable (fun x => min 1 (x:ℝ)) ν`.
  Consume `IsBernsteinLevyMeasure` and the native exponent and unique-triplet theorem.
  Give existence, uniqueness, a=f(0), b=lim_{t→∞} f(t)/t, and
  `f'(t)=b+∫x exp(−tx)ν(dx)` for t>0, justifying each integral/differentiation.
- **Stieltjes functions.** Consume `IsStieltjesFunction` and `RepresentsStieltjes`:
  `g(t)=a/t+b+∫(t+x)⁻¹ ρ(dx)` for t>0, a,b≥0, `ρ:Measure ℝ≥0`, `ρ{0}=0`,
  and `Integrable stieltjesWeight ρ`, where `stieltjesWeight x=(1+x)⁻¹`.
  No finiteness of ρ or value/continuity at0 is implicit. Develop the cone, C∞ and
  complete monotonicity on `(0,∞)`, uniqueness of (a,b,ρ), a=lim_{t↓0}t g(t),
  b=lim_{t→∞}g(t), and the exact criterion for a finite continuous extension at0:
  a=0 and `∫_{x>0} x⁻¹ρ(dx)<∞`, with value b plus that integral.
- **Complete Bernstein functions.** Consume `IsCompleteBernsteinFunction` and
  `RepresentsCompleteBernstein`: `f(t)=a+bt+∫t/(t+x)ρ(dx)` on `[0,∞)`,
  with the same nonnegative coefficients, no-atom and weighted integrability convention.
  Give uniqueness, closure, f(0)=a, the drift limit, and the inclusion in Bernstein
  functions. Prove the equivalence with a Bernstein Lévy measure having a completely
  monotone density m on `(0,∞)` relative to Lebesgue measure. Pin the conversion
  `m(s)=∫_{x>0}x exp(−sx)ρ(dx)` and prove its integrability and uniqueness via the
  Lévy triplet; build this bridge here on the native classes.
- **Exact correspondences.** Stieltjes g iff t↦t g(t) on `(0,∞)` has a complete
  Bernstein extension to `[0,∞)`, with extension value a at0; complete Bernstein f
  implies f(t)/t is Stieltjes. A nonzero Stieltjes function is positive on `(0,∞)`
  and its reciprocal has a complete Bernstein extension; conversely a nonzero complete
  Bernstein function has Stieltjes reciprocal. Consume the native reciprocal theorems
  with their explicit `EqOn (Ioi 0)` and right-continuity-at0 clauses. Record separately
  their extension to the zero function under Lean's convention `0⁻¹=0`; it is not an
  assertion of ordinary division by zero. Specify the remaining transformations on
  `(0,∞)` with their continuous extensions: complete Bernstein f implies that
  t/f(t) and t f(1/t) extend to complete Bernstein functions; Stieltjes g iff
  g(1/t) has a complete Bernstein extension. The Stieltjes class itself is invariant
  under g↦g(1/t)/t; this swaps a and b and carries ρ to the pushforward under
  x↦1/x of the measure with density x⁻¹ relative to ρ. Consume the native
  `Measure.stieltjesInversion` and its no-atom, integrability and involution lemmas.
  All class equalities on the open ray use `EqOn`; endpoint values are supplied by
  the indicated extension, including the separate zero convention. For the reciprocal proof,
  consume the native slit-plane holomorphic Stieltjes transform, Pick characterization
  and Nevanlinna/Herglotz representation, including positivity on `(0,∞)`, upper
  half-plane sign and zero-free statements for nonzero data. These analytic suppliers
  precede the reciprocal result; do not infer it from complete monotonicity alone.

**Milestone — Bernstein's theorem.** `f` completely monotone **on the closed `[0,∞)`** (so
`f(0⁺) < ∞`) **iff** it is the Laplace transform of a unique **finite** positive measure on
`[0,∞)`. ⚠ Complete monotonicity on the *open* `(0,∞)` alone yields only a general (possibly
infinite) positive measure — e.g. `1/t = ∫₀^∞ e^{−tx} dx` is completely monotone with the
infinite Lebesgue representing measure (Hausdorff–Bernstein–Widder). Finiteness is exactly the
`f(0⁺) < ∞` criterion, which the continuity clause of the definition above builds in. Encode the measure on
`Measure ℝ≥0` (non-negative support automatic — the same convention as the BCR milestone, not a
`support ⊆ Ici 0` side-condition). Develop both directions and uniqueness (Laplace-transform
injectivity); measure extraction via Prokhorov tightness.

```lean
-- theorem bernstein (f : ℝ → ℝ) :
--     IsContinuousCompletelyMonotoneOnIoi f ↔
--       ∃! μ : Measure ℝ≥0, IsFiniteMeasure μ ∧
--         ∀ t ≥ 0, f t = ∫ x, Real.exp (-t * (x : ℝ)) ∂μ
```

**Acceptance examples.** `e^{−t} → δ₁`; `1/(1+t) → e^{−x}dx`; closure used to build new
completely monotone functions from these.

## Part C — Positive-definite functions and Bochner's theorem

**Objects.** Consume `TauCeti.IsPositiveDefinite` on an additive involutive
monoid `[AddMonoid M] [StarAddMonoid M]`: every finite quadratic form
`Σ_{i,j} cᵢ conj(cⱼ) F(aᵢ+star(aⱼ))` is nonnegative in ℂ.
For a finite-dimensional real inner-product space V, use the native difference-kernel
predicate `TauCeti.IsPositiveDefiniteSub`, with entries `F(vᵢ−vⱼ)`.
For `ℝ≥0×V`, consume the public `TauCeti.IsSemigroupGroupPD`, whose entries are
`F(tᵢ+tⱼ,vᵢ−vⱼ)`. Its native implementation supplies the involution `(t,v)↦(t,−v)`
through a private wrapper; use the public predicate and its kernel comparison.
Install no global negation-star instance on V, and require none from consumers.
Continuity and, for BCR, boundedness remain separate hypotheses.

**API to develop.**
- Basic properties: **closure under sums, nonnegative scalar multiples, and
  Schur (pointwise) products**; conjugate symmetry, `(F 0).im=0`, and
  `0≤(F 0).re`. On a general involutive monoid use the kernel Cauchy–Schwarz bound
  `‖F(a+star b)‖²≤(F(a+star a)).re (F(b+star b)).re`.
  On V with the difference kernel, prove `‖F(v)‖≤(F 0).re` and
  **continuity at0 implies uniform continuity**. For BCR functions, carry the
  boundedness hypothesis to obtain `‖F(t,v)‖≤(F(0,0)).re` independently of any
  representing measure. Explicitly set g(t)=(F(t,0)).re, prove F(t,0) is real nonnegative
  by the diagonal test at t/2, and iterate Cauchy–Schwarz
  `g(t)^2≤g(0)g(2t)`. If g(0)>0, a global bound C gives
  `g(t)≤g(0)^(1−2⁻ⁿ) C^(2⁻ⁿ)` for every n≥1 and hence g(t)≤g(0).
  If g(0)=0, Cauchy–Schwarz with the origin forces F=0. The same inequality then
  gives `‖F(t,v)‖²≤g(2t)g(0)≤g(0)²`. Only after this prerequisite derive uniform
  continuity of a bounded continuous BCR function from its finite-measure
  representation, without using that consequence as a premise of existence.
  Include `F(t,v)=exp(t)`: its BCR quadratic form is `|Σᵢ cᵢ exp(tᵢ)|²`,
  although F is unbounded and does not satisfy the bound by F(0,0).
  Pointwise limits preserve positive-definiteness; continuity requires a separate
  hypothesis such as locally uniform convergence.
- The **PD-function ↔ PD-kernel** equivalence (`K(a,b) = F(a + b⋆)`; `F(a − b)` for a group),
  pullbacks, and the GNS/Kolmogorov decomposition; normalization `F(0) = 1`.
- A stated **Fourier-convention conversion lemma** between Mathlib's `2π` form
  (`e^{−2πi⟨·,·⟩}`) and the characteristic-function form (`e^{i⟨·,·⟩}`) — downstream users will
  mix the two, so a conversion lemma beats a `⚠`.
- The bridge lemma: a finite measure's Fourier transform is continuous positive-definite
  (`pd_quadratic_form_of_measure`).

**Milestone 1 — Bochner's theorem on `V`.** A function on a finite-dimensional real
inner-product space `V` is continuous and positive-definite **iff** it is the Fourier
transform of a finite positive measure on `V`. State it for general `V`, with `ℝᵈ` as a
corollary.

Consume the native finite-dimensional `TauCeti.bochner` and its Fourier atom convention.
Develop both the characteristic-function/Lévy–Prokhorov construction and its comparison
with the positive-functional/Riesz–Markov construction wherever both apply, identifying
the same unique measure. The measure-to-function direction, uniqueness and Fourier
normalizations are common prerequisites.

**Milestone 1L — Bochner on locally compact abelian groups.** For a locally compact
Hausdorff abelian topological group G, use `PontryaginDual (Multiplicative G)` with its
native compact-open topology and Borel measurable structure. A continuous
`TauCeti.IsPositiveDefiniteSub` function φ:G→ℂ is exactly
`φ(g)=∫χ, (χ (Multiplicative.ofAdd g):ℂ) dμ(χ)` for a unique **finite inner regular
positive Borel measure** μ on the dual. Continuity at0 suffices on the PD side.
Consume `TauCeti.Analysis.Bochner.LocallyCompactGroup`, the native
`FiniteMeasure.pontryaginMeasureTransform`, its tight-measure continuity theorem and
inner-regular uniqueness theorem. The countability-free statement must retain inner
regularity; give the arbitrary-finite-Borel formulation when the dual is Polish.

Develop the transform's mass, Dirac, sum, nonnegative scalar, convolution and pullback
laws, conjugation, uniform continuity and norm bound by φ(0). Consume the native
GNS construction and strongly continuous cyclic unitary representation spectral-measure
theorem for existence, retaining the inverse/sign convention of its matrix coefficient.
Use the native dual carrier, character evaluation and Haar integration APIs. Consume
the independent harmonic-analysis prefix of
[VonNeumannAlgebras V11](https://github.com/TauCetiProject/TauCetiRoadmap/blob/d231d5b229b03546f4bbd7aeb3021dac5416d2bb/TauCetiRoadmap/VonNeumannAlgebras/README.md#L1902-L1976)
for character separation, the closed bidual embedding, Fourier inversion/Plancherel,
and the topological group isomorphism `g↦(χ↦χ(g))`, with its inverse, naturality and
Haar-rescaling comparisons for arbitrary locally compact Hausdorff abelian G.
That prefix supplies general duality; this milestone owns its Bochner representation,
transform laws and the following finite-dimensional application/comparison. The prefix
is independent of V11's later normal crossed products, modular theory and uses of
C₀ semigroups; none of those later conclusions or countability hypotheses is an input.
Prove the finite-dimensional identification
`q↦(a↦exp(−2πi⟨a,q⟩))` with this dual and transport the representing measure, showing
that Milestone1 is the same theorem under that identification. Include G=ℤ
(circle/Herglotz measures), compact G (discrete dual), and finite abelian G
(finite Fourier sums), with total mass φ(0) and uniqueness in each case.

**Milestone 2 — BCR semigroup–Bochner (Berg–Christensen–Ressel 4.1.13).** A bounded
continuous positive-definite function on the involutive semigroup `[0,∞) × V` is the
Laplace–Fourier transform of a unique finite measure; develop existence (consuming Milestone
1) and uniqueness (`laplaceFourier_unique`, Fourier/Laplace injectivity, Mathlib-only).

```lean
variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]
-- Mathlib Fourier convention (e^{-2πi⟨·,·⟩}); the real inner product is coerced to ℂ.
-- (Alternatively phrase via `fourierChar`/`charFun` directly.)

-- theorem bochner (F : V → ℂ) (hcont : Continuous F) (hpd : IsPositiveDefiniteSub F) :
--     ∃! μ : Measure V, IsFiniteMeasure μ ∧
--       ∀ a, F a = ∫ q, Complex.exp (-2 * π * Complex.I * (⟪a, q⟫_ℝ : ℂ)) ∂μ
-- -- time lives in ℝ≥0, so the representing measure has the right support automatically:
-- theorem bcr_semigroup_bochner (F : ℝ≥0 × V → ℂ) (hpd : IsSemigroupGroupPD F) … :
--     ∃! μ : Measure (ℝ≥0 × V), IsFiniteMeasure μ ∧
--       ∀ t a, F (t, a) = ∫ (p, q), (Real.exp (-(t : ℝ) * p) : ℂ) *
--         Complex.exp (-2 * π * Complex.I * (⟪a, q⟫_ℝ : ℂ)) ∂μ
```

**Acceptance examples.** Bochner on `V = ℝ` recovers the classical statement; the case
`V = 0` (no spatial variable) collapses BCR back to Bernstein; a Gaussian `a ↦ e^{−‖a‖²}` is
positive-definite, with the expected Gaussian representing measure.

---

## Dependency ordering

Part A and Part B develop independently. Within A, the shared partial-operator
resolvent and generator APIs precede real Hille–Yosida generation; complexification
and complex scalar retention then identify the complex generator and its resolvent.
Within B, open-ray Laplace representation and differentiation precede Bernstein
Lévy–Khinchine existence/uniqueness; the Stieltjes integral theory precedes complete
Bernstein comparisons, with the slit-plane/Pick suppliers preceding reciprocals.
Part C uses generic positive-definite kernels and GNS. Finite-dimensional Bochner
precedes BCR existence; the boundedness-to-origin estimate is proved directly first.
The LCA representation uses the native GNS/cyclic spectral-measure suppliers and inner
regular uniqueness. Its duality applications consume only V11's independent harmonic
prefix, and include the explicit finite-dimensional Bochner comparison. V11's later
C₀-semigroup and modular applications are not prerequisites of that prefix. BCR
uniqueness uses Fourier/Laplace injectivity independently of existence. Its V=0
acceptance example consumes Part B's finite-measure Bernstein theorem.

## References

- K.-J. Engel, R. Nagel, *One-Parameter Semigroups for Linear Evolution Equations* (GTM 194,
  2000); A. Pazy, *Semigroups of Linear Operators and Applications to PDE* (1983) —
  C₀-semigroups, generators, resolvent theory, Hille–Yosida, Lumer–Phillips.
- R. Schilling, R. Song, Z. Vondraček, *Bernstein Functions: Theory and Applications* (de
  Gruyter, 2nd ed. 2012) — completely monotone / Bernstein functions and their structure.
- W. Rudin, *Fourier Analysis on Groups* (1962); G. Folland, *A Course in Abstract Harmonic
  Analysis* (2nd ed. 2016) — Bochner's theorem, positive-definite functions, Pontryagin
  duality and positive-definite functions.
- C. Berg, J. P. R. Christensen, P. Ressel, *Harmonic Analysis on Semigroups* (GTM 100, 1984)
  — Theorem 4.1.13, positive-definite functions on involutive semigroups.
