/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Targets — one-parameter semigroups and Bochner-type representations (`OneParameterSemigroups`)

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Representative `sorry`-milestones for the `OneParameterSemigroups` roadmap. The three parts are
seeded at the shape the README's *Generality bar* pins up front: Part A carries general C₀
semigroups with a growth bound `(M, ω)` (contractions as a subclass, never the silent default),
a generator that is genuinely unbounded, and an unbounded-resolvent notion of its own with a
bridge to Mathlib's Banach-algebra `resolvent`; Part B bundles smoothness into complete
monotonicity so the sign condition cannot pass vacuously; Part C states positive-definiteness
generically on an involutive additive monoid and instantiates it.

Conventions folded in from the README: real Banach `X` first (`[NormedSpace ℝ X]`), with
complexification left as the route to the complex resolvent set; the generator modelled on
Mathlib's `LinearPMap` plus a dense-domain hypothesis (`DenseLinearOperator` is exactly that thin
wrapper, not a parallel unbounded-operator API); Bernstein's representing measure on
`Measure ℝ≥0`, so non-negative support is automatic rather than a side-condition; Bochner stated
over a general finite-dimensional real inner-product space `V`, never hard-coded `Fin d`
coordinates; every predicate named and spelled out rather than folded into a conclusion.

One deviation from the README is deliberate and flagged for the roadmap author: the BCR
involution on `ℝ≥0 × V` is written out as `(t, a) ↦ (t, -a)` in `IsSemigroupGroupPD` rather than
taken from the product `StarAddMonoid` instance. See that declaration's docstring.

Elaborated against Mathlib on Lean 4.33.0-rc1, not against this repository's pinned
4.31.0-rc1 toolchain; the `build` check here is the authority.
-/

namespace TauCetiRoadmap.OneParameterSemigroups

open MeasureTheory Filter Topology
open scoped NNReal ENNReal ComplexOrder

/-! ## Part A — Strongly continuous semigroups -/

variable {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]

/-- **A strongly continuous (C₀) semigroup** on a real Banach space `X`, indexed by `ℝ≥0`.

Indexing by `ℝ≥0` rather than by `ℝ` with a `0 ≤ t` side-condition keeps the semigroup law
unconditional. The two-sided C₀ *groups* of the README's stretch goal (Stone's theorem, the
unitary `e^{itH}`) are a separate object indexed by `ℝ`; they are deliberately not reached by
weakening this one. -/
structure StronglyContinuousSemigroup (X : Type*) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  /-- The operator family `S t`. -/
  toFun : ℝ≥0 → X →L[ℝ] X
  /-- `S 0 = I`. -/
  map_zero' : toFun 0 = 1
  /-- The semigroup law `S (s + t) = S s ∘ S t`. -/
  map_add' : ∀ s t, toFun (s + t) = (toFun s).comp (toFun t)
  /-- Strong continuity: each orbit `t ↦ S t x` is continuous. Note this is *strong*, not norm,
  continuity — `t ↦ S t` need not be continuous into `X →L[ℝ] X`. -/
  continuous_orbit : ∀ x, Continuous fun t => toFun t x

namespace StronglyContinuousSemigroup

instance : CoeFun (StronglyContinuousSemigroup X) fun _ => ℝ≥0 → X →L[ℝ] X := ⟨toFun⟩

/-- **Growth bound.** `‖S t‖ ≤ M e^{ω t}`, stated at the general `(M, ω)` level. A contraction
semigroup is the case `M = 1`, `ω = 0`. -/
def HasGrowthBound (S : StronglyContinuousSemigroup X) (M ω : ℝ) : Prop :=
  ∀ t : ℝ≥0, ‖S t‖ ≤ M * Real.exp (ω * t)

/-- Every C₀ semigroup admits *some* growth bound, with `1 ≤ M`. This is the uniform
boundedness argument on `[0, 1]`, and it is what makes `(M, ω)` a genuine invariant rather than
a hypothesis one is free to assume away. -/
theorem existsGrowthBound (S : StronglyContinuousSemigroup X) :
    ∃ M ω : ℝ, 1 ≤ M ∧ S.HasGrowthBound M ω := sorry

/-- **Contraction semigroups** as a subclass, never the silent default. -/
def IsContraction (S : StronglyContinuousSemigroup X) : Prop := S.HasGrowthBound 1 0

end StronglyContinuousSemigroup

/-- **A densely defined linear operator**: Mathlib's `LinearPMap` together with the dense-domain
hypothesis. This is the thin wrapper the README asks for, *not* a parallel unbounded-operator
API — every lemma about it should reduce to `LinearPMap` plus `dense_domain`. -/
structure DenseLinearOperator (X : Type*) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  /-- The underlying partially defined map. -/
  toLinearPMap : X →ₗ.[ℝ] X
  /-- The domain is dense. -/
  dense_domain : Dense (toLinearPMap.domain : Set X)

/-- **The generator** `A` of a C₀ semigroup: the strong derivative at `0`, on the domain where
that derivative exists. Densely defined, closed, and generally unbounded. -/
noncomputable def StronglyContinuousSemigroup.generator (S : StronglyContinuousSemigroup X) :
    DenseLinearOperator X := sorry

/-- The generator is closed. -/
theorem generator_isClosed (S : StronglyContinuousSemigroup X) :
    S.generator.toLinearPMap.IsClosed := sorry

/-- **The generator determines the semigroup.** Uniqueness is what makes "the" generator a
legitimate phrase, and it is the engine behind the abstract Cauchy problem below. -/
theorem eq_of_generator_eq {S T : StronglyContinuousSemigroup X}
    (h : S.generator = T.generator) : S = T := sorry

/-- The domain is invariant and `A` commutes with the semigroup: `S t (D(A)) ⊆ D(A)` and
`A (S t x) = S t (A x)`. -/
theorem generator_comm (S : StronglyContinuousSemigroup X) (t : ℝ≥0)
    (x : S.generator.toLinearPMap.domain) :
    ∃ y : S.generator.toLinearPMap.domain,
      (y : X) = S t (x : X) ∧
        S.generator.toLinearPMap y = S t (S.generator.toLinearPMap x) := sorry

/-- **Orbits through the domain are differentiable**, with derivative `A (S t x)`; this is the
classical solution of the abstract Cauchy problem, stated pointwise. -/
theorem hasDerivAt_orbit (S : StronglyContinuousSemigroup X)
    (x : S.generator.toLinearPMap.domain) (t : ℝ≥0) :
    ∃ y : S.generator.toLinearPMap.domain,
      (y : X) = S t (x : X) ∧
        HasDerivAt (fun s : ℝ => S (Real.toNNReal s) (x : X))
          (S.generator.toLinearPMap y) (t : ℝ) := sorry

/-- **The workhorse foundational lemma.** `∫₀ᵗ S s x ds ∈ D(A)` and `A ∫₀ᵗ S s x ds = S t x - x`.
Everything in the generation theory is built on this and on density of `D(A)`. -/
theorem integral_mem_domain (S : StronglyContinuousSemigroup X) (x : X) (t : ℝ≥0) :
    ∃ y : S.generator.toLinearPMap.domain,
      (y : X) = ∫ s in Set.Icc (0 : ℝ) t, S (Real.toNNReal s) x ∧
        S.generator.toLinearPMap y = S t x - x := sorry

/-- **Bounded ↔ uniformly continuous.** `A` is bounded (`domain = ⊤`) exactly when `t ↦ S t` is
norm-continuous. This is the precise sense in which the unbounded generator is unavoidable. -/
theorem domain_eq_top_iff_continuous (S : StronglyContinuousSemigroup X) :
    S.generator.toLinearPMap.domain = ⊤ ↔ Continuous fun t : ℝ≥0 => S t := sorry

/-! ### Resolvent theory

Mathlib's `resolvent` is Banach-algebra-only, so an unbounded generator needs its own notion.
The bridge lemma below identifies the two in the bounded case rather than duplicating theory. -/

/-- **The resolvent set of an unbounded operator**: `λ ∈ ρ(A)` iff `λ • I - A : D(A) → X` is a
bijection with bounded inverse. Stated for real `λ`; the complex resolvent set and the
analyticity below are reached through the complexification `X_ℂ`, per the README. -/
def resolventSet (A : DenseLinearOperator X) : Set ℝ := sorry

/-- **The resolvent** `R(λ, A) = (λ • I - A)⁻¹`, as a bounded operator, for `λ ∈ ρ(A)`. -/
noncomputable def resolvent (A : DenseLinearOperator X) (l : ℝ) : X →L[ℝ] X := sorry

/-- **The bridge lemma.** When the operator is everywhere defined (`domain = ⊤`), so that it is a
genuine Banach-algebra element, this resolvent agrees with Mathlib's `resolvent`. Stating this
is what keeps the unbounded notion from becoming a parallel duplicate. -/
theorem resolvent_eq_mathlib_resolvent (A : DenseLinearOperator X)
    (B : X →L[ℝ] X) (hA : A.toLinearPMap.domain = ⊤)
    (hB : ∀ x : A.toLinearPMap.domain, A.toLinearPMap x = B (x : X)) (l : ℝ)
    (hl : l ∈ resolventSet A) :
    resolvent A l = _root_.resolvent B (l : ℝ) := sorry

/-- **The Laplace-transform representation** `R(λ, A) x = ∫₀^∞ e^{-λ t} S t x dt`, for real
`λ > ω`. The integral is a *pointwise* `X`-valued Bochner integral: a general C₀ semigroup is
only strongly continuous, so `t ↦ S t` need not be norm-measurable into `X →L[ℝ] X`. Integrate
in `x` first, then bundle. -/
theorem resolvent_eq_integral (S : StronglyContinuousSemigroup X) {M ω : ℝ}
    (hS : S.HasGrowthBound M ω) {l : ℝ} (hl : ω < l) (x : X) :
    resolvent S.generator l x =
      ∫ t in Set.Ioi (0 : ℝ), Real.exp (-l * t) • S (Real.toNNReal t) x := sorry

/-- **The resolvent identity** `R(λ) - R(μ) = (μ - λ) R(λ) R(μ)`. -/
theorem resolvent_sub_resolvent (A : DenseLinearOperator X) {l m : ℝ}
    (hl : l ∈ resolventSet A) (hm : m ∈ resolventSet A) :
    resolvent A l - resolvent A m = (m - l) • (resolvent A l).comp (resolvent A m) := sorry

/-- **The power formula** `R(λ)ⁿ x = ∫₀^∞ tⁿ⁻¹/(n-1)! · e^{-λt} S t x dt` for `n ≥ 1`. -/
theorem resolvent_pow_eq_integral (S : StronglyContinuousSemigroup X) {M ω : ℝ}
    (hS : S.HasGrowthBound M ω) {l : ℝ} (hl : ω < l) {n : ℕ} (hn : 1 ≤ n) (x : X) :
    (resolvent S.generator l ^ n) x =
      ∫ t in Set.Ioi (0 : ℝ),
        (t ^ (n - 1) / (Nat.factorial (n - 1) : ℝ) * Real.exp (-l * t)) •
          S (Real.toNNReal t) x := sorry

/-- **The derivative formula** `dᵏR(λ)/dλᵏ = (-1)ᵏ k! · R(λ)^{k+1}`; with the power formula this
is what exhibits `λ ↦ ⟪R(λ) x, φ⟫` as completely monotone, tying Part A to Part B. -/
theorem iteratedDeriv_resolvent (A : DenseLinearOperator X) (k : ℕ) (l : ℝ)
    (hl : l ∈ resolventSet A) :
    iteratedDeriv k (fun m => resolvent A m) l =
      ((-1 : ℝ) ^ k * (Nat.factorial k : ℝ)) • resolvent A l ^ (k + 1) :=
  sorry

/-- **The Hille–Yosida bounds**, at the general `(M, ω)` level: `‖R(λ)ⁿ‖ ≤ M / (λ - ω)ⁿ`. The
contraction bound `‖R(λ)‖ ≤ 1/λ` is the corollary below, not the definition. -/
theorem norm_resolvent_pow_le (S : StronglyContinuousSemigroup X) {M ω : ℝ}
    (hS : S.HasGrowthBound M ω) {l : ℝ} (hl : ω < l) {n : ℕ} (hn : 1 ≤ n) :
    ‖resolvent S.generator l ^ n‖ ≤ M / (l - ω) ^ n := sorry

/-- The contraction corollary. -/
theorem norm_resolvent_le_of_isContraction (S : StronglyContinuousSemigroup X)
    (hS : S.IsContraction) {l : ℝ} (hl : 0 < l) :
    ‖resolvent S.generator l‖ ≤ 1 / l := sorry

/-! ### Dissipativity -/

/-- **Dissipativity** in the general Banach sense, via the resolvent-range inequality
`‖(λ • I - A) x‖ ≥ λ ‖x‖` for `λ > 0`. The Hilbert characterization `Re ⟪A x, x⟫ ≤ 0` is a
*specialization*, stated separately, and must not be taken as the definition. -/
def DenseLinearOperator.IsDissipative (A : DenseLinearOperator X) : Prop :=
  ∀ l : ℝ, 0 < l → ∀ x : A.toLinearPMap.domain,
    l * ‖(x : X)‖ ≤ ‖l • (x : X) - A.toLinearPMap x‖

/-- **Lumer–Phillips, converse half**: the generator of a contraction semigroup is dissipative. -/
theorem isDissipative_generator (S : StronglyContinuousSemigroup X) (hS : S.IsContraction) :
    S.generator.IsDissipative := sorry

/-! ### The generation milestones

Both are genuinely build-here, via the Yosida approximation `Aλ = λ² R(λ, A) - λ I`. Note the
sequencing the README insists on: `S` does not exist yet, so the approximation argument must
prove the `e^{t Aλ} x` are Cauchy uniformly on compact `t`-intervals, *define* `S t x` as the
limit, and only then identify the generator. Phrasing it as convergence "to `S t x`" presumes
the object being constructed. -/

/-- **Milestone — the Hille–Yosida generation theorem.** A densely defined operator whose
resolvent set contains `(ω, ∞)` and whose resolvent powers satisfy the `(M, ω)` bounds generates
a C₀ semigroup of growth `(M, ω)`. -/
theorem hilleYosida_generation (A : DenseLinearOperator X) (M ω : ℝ) (hM : 1 ≤ M)
    (hρ : ∀ l : ℝ, ω < l → l ∈ resolventSet A)
    (hbound : ∀ n : ℕ, 1 ≤ n → ∀ l : ℝ, ω < l → ‖resolvent A l ^ n‖ ≤ M / (l - ω) ^ n) :
    ∃ S : StronglyContinuousSemigroup X, S.generator = A ∧ S.HasGrowthBound M ω := sorry

/-- **Milestone — the Lumer–Phillips theorem.** Kept distinct from Hille–Yosida because the
hypothesis set is different: dissipativity plus a range condition, yielding a *contraction*
semigroup. -/
theorem lumerPhillips (A : DenseLinearOperator X) (hd : A.IsDissipative)
    (hr : ∃ l₀ : ℝ, 0 < l₀ ∧
      ∀ y : X, ∃ x : A.toLinearPMap.domain, l₀ • (x : X) - A.toLinearPMap x = y) :
    ∃ S : StronglyContinuousSemigroup X, S.generator = A ∧ S.IsContraction := sorry

/-- **Milestone — the abstract Cauchy problem.** For `x ∈ D(A)`, `u t = S t x` is a classical
solution of `u' = A u`, `u 0 = x`. It follows from generator uniqueness, but it is the
motivating payoff of Part A, so it is stated as a milestone in its own right. -/
theorem abstractCauchy (S : StronglyContinuousSemigroup X)
    (x : S.generator.toLinearPMap.domain) :
    S 0 (x : X) = (x : X) ∧
      ∀ t : ℝ≥0, ∃ y : S.generator.toLinearPMap.domain,
        (y : X) = S t (x : X) ∧
          HasDerivAt (fun s : ℝ => S (Real.toNNReal s) (x : X))
            (S.generator.toLinearPMap y) (t : ℝ) := sorry

/-! ## Part B — Completely monotone and Bernstein functions -/

/-- **Complete monotonicity on `[0, ∞)`**, with smoothness *bundled in*.

The `ContDiffOn` clause is load-bearing, not decoration: `iteratedDeriv` is total and returns `0`
where `f` is not differentiable, so the sign condition alone would be satisfied vacuously
(`0 ≤ 0`) by functions that are not smooth. Stating it on the closed `Set.Ici 0` is also what
forces `f 0⁺ < ∞`, which is exactly the finiteness of the representing measure in `bernstein`. -/
def IsCompletelyMonotone (f : ℝ → ℝ) : Prop :=
  ContDiffOn ℝ (⊤ : ℕ∞) f (Set.Ici 0) ∧
    ∀ n : ℕ, ∀ t : ℝ, 0 ≤ t → 0 ≤ (-1 : ℝ) ^ n * iteratedDeriv n f t

/-- **Bernstein functions**: non-negative on `[0, ∞)` with completely monotone derivative. -/
def IsBernsteinFunction (f : ℝ → ℝ) : Prop :=
  (∀ t : ℝ, 0 ≤ t → 0 ≤ f t) ∧ IsCompletelyMonotone (deriv f)

/-- Closure under sums. -/
theorem IsCompletelyMonotone.add {f g : ℝ → ℝ} (hf : IsCompletelyMonotone f)
    (hg : IsCompletelyMonotone g) : IsCompletelyMonotone (f + g) := sorry

/-- Closure under non-negative scalar multiples. -/
theorem IsCompletelyMonotone.const_smul {f : ℝ → ℝ} (hf : IsCompletelyMonotone f) {c : ℝ}
    (hc : 0 ≤ c) : IsCompletelyMonotone (c • f) := sorry

/-- Closure under products. -/
theorem IsCompletelyMonotone.mul {f g : ℝ → ℝ} (hf : IsCompletelyMonotone f)
    (hg : IsCompletelyMonotone g) : IsCompletelyMonotone (f * g) := sorry

/-- Closure under pointwise limits. Note this needs the limit to stay smooth; the natural
statement carries a locally-uniform-convergence hypothesis rather than bare pointwise. -/
theorem IsCompletelyMonotone.of_tendstoLocallyUniformly {F : ℕ → ℝ → ℝ} {f : ℝ → ℝ}
    (hF : ∀ n, IsCompletelyMonotone (F n))
    (hconv : TendstoLocallyUniformlyOn F f atTop (Set.Ici 0)) :
    IsCompletelyMonotone f := sorry

/-- **Composition**: a completely monotone function of a Bernstein function is completely
monotone. -/
theorem IsCompletelyMonotone.comp_bernstein {g f : ℝ → ℝ} (hg : IsCompletelyMonotone g)
    (hf : IsBernsteinFunction f) : IsCompletelyMonotone (g ∘ f) := sorry

/-- **The extreme rays.** Each `t ↦ e^{-t x}` with `x ≥ 0` is completely monotone; `bernstein`
says every completely monotone function is a mixture of exactly these. -/
theorem isCompletelyMonotone_exp (x : ℝ) (hx : 0 ≤ x) :
    IsCompletelyMonotone fun t => Real.exp (-t * x) := sorry

/-- **Milestone — Bernstein's theorem.** `f` is completely monotone on the closed `[0, ∞)` iff it
is the Laplace transform of a unique finite positive measure.

The representing measure lives on `Measure ℝ≥0`, so non-negative support is automatic rather
than a `support ⊆ Ici 0` side-condition — the same convention as `bcr_semigroup_bochner`. The
closed-interval definition matters: complete monotonicity on the *open* `(0, ∞)` alone yields
only a possibly infinite measure (Hausdorff–Bernstein–Widder), as `1/t = ∫₀^∞ e^{-tx} dx`
witnesses. -/
theorem bernstein (f : ℝ → ℝ) :
    IsCompletelyMonotone f ↔
      ∃! μ : Measure ℝ≥0, IsFiniteMeasure μ ∧
        ∀ t : ℝ, 0 ≤ t → f t = ∫ x, Real.exp (-t * (x : ℝ)) ∂μ := sorry

/-! ## Part C — Positive-definite functions, Bochner and BCR -/

/-- **Positive-definiteness on an involutive additive monoid.** Stated generically, then
instantiated, per the README's "define generically, then instantiate" instruction.

The condition uses the involution, `F (a i + star (a j))`, not the group difference
`F (a i - a j)`; the two agree on a group whose star is negation, and it is the involutive form
that generalizes to the semigroup `ℝ≥0 × V`. The order `0 ≤ _` is the `ComplexOrder` one, so it
asserts both that the sum is real and that it is non-negative. -/
def IsPositiveDefinite {M : Type*} [AddCommMonoid M] [StarAddMonoid M] (F : M → ℂ) : Prop :=
  ∀ (n : ℕ) (c : Fin n → ℂ) (a : Fin n → M),
    0 ≤ ∑ i, ∑ j, c i * star (c j) * F (a i + star (a j))

/-- Conjugate symmetry. -/
theorem IsPositiveDefinite.conj_symm {M : Type*} [AddCommMonoid M] [StarAddMonoid M] {F : M → ℂ}
    (hF : IsPositiveDefinite F) (a : M) : star (F (star a)) = F a := sorry

/-- `F 0` is real. -/
theorem IsPositiveDefinite.im_apply_zero {M : Type*} [AddCommMonoid M] [StarAddMonoid M]
    {F : M → ℂ} (hF : IsPositiveDefinite F) : (F 0).im = 0 := sorry

/-- `0 ≤ (F 0).re`. -/
theorem IsPositiveDefinite.re_apply_zero_nonneg {M : Type*} [AddCommMonoid M] [StarAddMonoid M]
    {F : M → ℂ} (hF : IsPositiveDefinite F) : 0 ≤ (F 0).re := sorry

/-- `‖F a‖ ≤ (F 0).re` — the Lean-typed form of `F 0 ≥ |F a|`. -/
theorem IsPositiveDefinite.norm_le {M : Type*} [AddCommMonoid M] [StarAddMonoid M] {F : M → ℂ}
    (hF : IsPositiveDefinite F) (a : M) : ‖F a‖ ≤ (F 0).re := sorry

/-- Closure under sums. -/
theorem IsPositiveDefinite.add {M : Type*} [AddCommMonoid M] [StarAddMonoid M] {F G : M → ℂ}
    (hF : IsPositiveDefinite F) (hG : IsPositiveDefinite G) : IsPositiveDefinite (F + G) := sorry

/-- Closure under pointwise (Schur) products. -/
theorem IsPositiveDefinite.mul {M : Type*} [AddCommMonoid M] [StarAddMonoid M] {F G : M → ℂ}
    (hF : IsPositiveDefinite F) (hG : IsPositiveDefinite G) : IsPositiveDefinite (F * G) := sorry

/-- **Continuity at `0` upgrades to uniform continuity.** -/
theorem IsPositiveDefinite.uniformContinuous {V : Type*} [NormedAddCommGroup V]
    [InnerProductSpace ℝ V] [StarAddMonoid V] {F : V → ℂ} (hF : IsPositiveDefinite F)
    (hcont : ContinuousAt F 0) : UniformContinuous F := sorry

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]
  [MeasurableSpace V] [BorelSpace V]

/-- **Positive-definiteness in the group form**, `F (a - b)`, on a finite-dimensional real
inner-product space. This is the shape Bochner's theorem is stated in. -/
def IsPositiveDefiniteGroup (F : V → ℂ) : Prop :=
  ∀ (n : ℕ) (c : Fin n → ℂ) (a : Fin n → V),
    0 ≤ ∑ i, ∑ j, c i * star (c j) * F (a i - a j)

/-- **The bridge lemma**: the Fourier transform of a finite measure is continuous and positive
definite. This is the easy direction of Bochner and the sanity check on the definition. -/
theorem isPositiveDefiniteGroup_fourier (μ : Measure V) [IsFiniteMeasure μ] :
    IsPositiveDefiniteGroup
      (fun a => ∫ q, Complex.exp (-2 * Real.pi * Complex.I * ((inner ℝ a q : ℝ) : ℂ)) ∂μ) :=
  sorry

/-- **A Fourier-convention conversion lemma.** Mathlib's transform carries the `2π` in the
exponent (`e^{-2πi⟪·,·⟫}`, unitary, no prefactors) while the characteristic-function literature
uses `e^{i⟪·,·⟫}`. Downstream users *will* mix the two, so this is stated as a lemma rather than
left as a warning comment. -/
theorem fourier_eq_charFun_comp (μ : Measure V) [IsFiniteMeasure μ] (a : V) :
    ∫ q, Complex.exp (-2 * Real.pi * Complex.I * ((inner ℝ a q : ℝ) : ℂ)) ∂μ =
      ∫ q, Complex.exp (-((inner ℝ ((2 * Real.pi) • a) q : ℝ) : ℂ) * Complex.I) ∂μ := sorry

/-- **Milestone 1 — Bochner's theorem on `V`.** A function on a finite-dimensional real
inner-product space is continuous and positive definite iff it is the Fourier transform of a
finite positive measure. Stated for general `V`, with `ℝ^d` a corollary rather than the
statement.

Build-here: Mathlib's "Bochner" is the *integral*, and its positive-definiteness is only for
matrices and quadratic forms — there is no continuous-positive-definite-*function* notion and no
representation theorem. Two routes are open: the positive linear functional `f ↦ ∫ f̂ φ` with
Riesz–Markov, or `charFun` with Lévy continuity and Prokhorov tightness. -/
theorem bochner (F : V → ℂ) (hcont : Continuous F) (hpd : IsPositiveDefiniteGroup F) :
    ∃! μ : Measure V, IsFiniteMeasure μ ∧
      ∀ a, F a = ∫ q, Complex.exp (-2 * Real.pi * Complex.I * ((inner ℝ a q : ℝ) : ℂ)) ∂μ :=
  sorry

/-- **Positive-definiteness on the involutive semigroup `ℝ≥0 × V`**, with the BCR involution
`(t, a)⋆ = (t, -a)` written out.

*Deviation from the README, flagged deliberately.* The README says the product `StarAddMonoid`
instance supplies this involution automatically. It does not: the default `Star` on `ℝ≥0` and on
a real inner-product space is the *trivial* one, so `star (t, a) = (t, a)` and the product
instance would silently give the wrong notion — the failure being invisible, since the
definition still typechecks and still says something, just not BCR. Spelling the involution out
keeps the intended statement independent of which `Star` instance is in scope. The alternative
is to introduce a type synonym for `V` carrying negation as its star; if the roadmap author
prefers that, this declaration should be replaced by `IsPositiveDefinite` on that synonym. -/
def IsSemigroupGroupPD (F : ℝ≥0 × V → ℂ) : Prop :=
  ∀ (n : ℕ) (c : Fin n → ℂ) (t : Fin n → ℝ≥0) (a : Fin n → V),
    0 ≤ ∑ i, ∑ j, c i * star (c j) * F (t i + t j, a i - a j)

/-- **Milestone 2 — the BCR semigroup–Bochner representation** (Berg–Christensen–Ressel 4.1.13).
A bounded continuous positive-definite function on `ℝ≥0 × V` is the Laplace–Fourier transform of
a unique finite measure. Existence consumes Milestone 1; uniqueness is independent of it and is
portable early, resting only on injectivity of the Laplace and Fourier transforms.

Time lives in `ℝ≥0`, so the representing measure has the right support by construction. -/
theorem bcr_semigroup_bochner (F : ℝ≥0 × V → ℂ) (hcont : Continuous F)
    (hbdd : ∃ C : ℝ, ∀ p, ‖F p‖ ≤ C) (hpd : IsSemigroupGroupPD F) :
    ∃! μ : Measure (ℝ≥0 × V), IsFiniteMeasure μ ∧
      ∀ (t : ℝ≥0) (a : V), F (t, a) =
        ∫ p, (Real.exp (-(t : ℝ) * (p.1 : ℝ)) : ℂ) *
          Complex.exp (-2 * Real.pi * Complex.I * ((inner ℝ a p.2 : ℝ) : ℂ)) ∂μ := sorry

/-- **The consistency check the README asks for**: with no spatial variable, BCR collapses to
Bernstein. Stating it pins the two milestones to each other instead of leaving them adjacent. -/
theorem bcr_eq_bernstein_of_subsingleton [Subsingleton V] (F : ℝ≥0 × V → ℂ)
    (hF : IsSemigroupGroupPD F) (f : ℝ → ℝ)
    (hf : ∀ t : ℝ≥0, (f t : ℂ) = F (t, 0)) :
    IsCompletelyMonotone f := sorry

end TauCetiRoadmap.OneParameterSemigroups
