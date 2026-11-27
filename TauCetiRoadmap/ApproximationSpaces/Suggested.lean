/-
Copyright (c) 2026 Mario Ullrich. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib

/-!
# Approximation spaces and real interpolation of quasi-normed groups: target signatures

**This file is not the roadmap and is not exhaustive.** The roadmap is `README.md`, the definitive
specification; this file states some of the roadmap's targets against the pinned Mathlib and Tau
Ceti, each with `sorry`, together with the definitions they need. Every other target, API fact and
check is in the README.

Quasi-norms take values in `ℝ≥0∞`, and membership in a space is finiteness of its quasi-norm
(README, Conventions 2 and 3). Jackson's, Bernstein's and Nikolskii's inequalities are written out
as explicit hypotheses (README, Convention 7). The declarations are public, so that the
`Suggested.lean` of ClassicalApproximationSpaces imports and uses them.

## Targets stated below

* Part A: quasi-norms and the `ρ`-triangle inequality of `L_p` (AS-A01), discrete Hardy
  inequalities (AS-A02), approximation schemes, errors and approximation spaces (AS-A03–AS-A06),
  block decompositions (AS-A12), schemes of functions with Nikolskii's inequality, the
  embeddings and block decompositions in `L_p` (AS-A14–AS-A17);
* Part B: quasi-normed couples and the K-method (AS-B01), the E-functional (AS-B05), the
  representation theorem (AS-B06), moduli compatible with a scheme (AS-B10).
-/

@[expose] public section

noncomputable section

open scoped ENNReal NNReal
open MeasureTheory Filter Topology

namespace TauCetiRoadmap.ApproximationSpaces

/-! ## Part A: quasi-normed groups, approximation schemes and approximation spaces -/

/-- A quasi-norm with constant `K ≥ 1` on a `𝕜`-module, with values in `ℝ≥0∞`; the value `∞` is
allowed, so that the two quasi-norms of a couple live on one ambient module.

Roadmap: `AS-A01`. -/
structure QuasiENorm (𝕜 X : Type*) [NormedField 𝕜] [AddCommGroup X] [Module 𝕜 X] where
  /-- The quasi-norm. -/
  toFun : X → ℝ≥0∞
  /-- The constant of the quasi-triangle inequality. -/
  K : ℝ≥0
  /-- The constant is at least `1`. -/
  one_le_K : 1 ≤ K
  /-- The quasi-norm vanishes at `0`. -/
  map_zero : toFun 0 = 0
  /-- Homogeneity. -/
  map_smul : ∀ (c : 𝕜) (x : X), toFun (c • x) = ‖c‖ₑ * toFun x
  /-- The quasi-triangle inequality. -/
  add_le : ∀ x y, toFun (x + y) ≤ K * (toFun x + toFun y)

/-- The `ρ`-triangle inequality of `eLpNorm`, `ρ = min 1 p`, for every exponent and all functions.
Mathlib has the quasi-triangle inequality `eLpNorm_add_le'` with the constant `LpAddConst p`.

Roadmap: `AS-A01`. -/
theorem eLpNorm_add_rpow_min_le {α E : Type*} [MeasurableSpace α] {μ : Measure α}
    [NormedAddCommGroup E] (p : ℝ≥0∞) (f g : α → E) :
    eLpNorm (f + g) p μ ^ (min 1 p).toReal ≤
      eLpNorm f p μ ^ (min 1 p).toReal + eLpNorm g p μ ^ (min 1 p).toReal := by
  sorry

/-- `eLpNorm` is a quasi-norm on `Lp ℂ p μ` for every `0 < p ≤ ∞`, with Mathlib's constant
`LpAddConst p`.

Roadmap: `AS-A01`. -/
def lpQuasiENorm {α : Type*} [MeasurableSpace α] (μ : Measure α) (p : ℝ≥0∞) :
    QuasiENorm ℂ (Lp ℂ p μ) where
  toFun f := eLpNorm f p μ
  K := max 1 (ENNReal.LpAddConst p).toNNReal
  one_le_K := le_max_left _ _
  map_zero := sorry
  map_smul := sorry
  add_le := sorry

/-- **Hardy's inequality for dyadic tails**: for `s > 0` and `ρ > 0`,
`‖(2^{ks} (∑_{i ≥ 0} a_{k+i}^ρ)^{1/ρ})_k‖_{ℓ_q} ≤ C ‖(2^{ks} a_k)_k‖_{ℓ_q}`.

Roadmap: `AS-A02`. -/
theorem exists_eLpNorm_tail_le {s : ℝ} (hs : 0 < s) {ρ : ℝ} (hρ : 0 < ρ) (q : ℝ≥0∞) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ a : ℕ → ℝ≥0∞,
      eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (s * k) * (∑' i, a (k + i) ^ ρ) ^ (1 / ρ)) q
          Measure.count ≤
        C * eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (s * k) * a k) q Measure.count := by
  sorry

/-- **Hardy's inequality for dyadic partial sums**: for `s > 0` and `ρ > 0`,
`‖(2^{-ks} (∑_{j ≤ k} a_j^ρ)^{1/ρ})_k‖_{ℓ_q} ≤ C ‖(2^{-ks} a_k)_k‖_{ℓ_q}`.

Roadmap: `AS-A02`. -/
theorem exists_eLpNorm_partialSum_le {s : ℝ} (hs : 0 < s) {ρ : ℝ} (hρ : 0 < ρ) (q : ℝ≥0∞) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ a : ℕ → ℝ≥0∞,
      eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (-(s * k)) *
          (∑ j ∈ Finset.range (k + 1), a j ^ ρ) ^ (1 / ρ)) q Measure.count ≤
        C * eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (-(s * k)) * a k) q Measure.count := by
  sorry

variable {𝕜 X : Type*} [NormedField 𝕜] [AddCommGroup X] [Module 𝕜 X]

/-- An approximation scheme in the sense of Pietsch: `A 0 = {0}`, increasing, stable under
scalars, and `A m + A n ⊆ A (m + n)`.

Roadmap: `AS-A03`. -/
structure ApproximationScheme (N : QuasiENorm 𝕜 X) where
  /-- The sets of approximants of complexity `n`. -/
  A : ℕ → Set X
  /-- The approximants of complexity `0` are `{0}`. -/
  A_zero : A 0 = {0}
  /-- The sets increase. -/
  mono : ∀ n, A n ⊆ A (n + 1)
  /-- Each set is stable under scalars. -/
  smul_mem : ∀ (c : 𝕜) n x, x ∈ A n → c • x ∈ A n
  /-- `A m + A n ⊆ A (m + n)`. -/
  add_mem : ∀ m n x y, x ∈ A m → y ∈ A n → x + y ∈ A (m + n)
  /-- Approximants have finite quasi-norm. -/
  finite : ∀ n x, x ∈ A n → N.toFun x < ⊤

namespace ApproximationScheme

variable {N : QuasiENorm 𝕜 X} (S : ApproximationScheme N)

/-- The complexity `min {n : x ∈ A n}`, `∞` off `⋃ n, A n`.

Roadmap: `AS-A03`. -/
def complexity (x : X) : ℝ≥0∞ :=
  ⨅ (n : ℕ) (_ : x ∈ S.A n), (n : ℝ≥0∞)

/-- The error of best approximation `E_n(f) = inf_{a ∈ A n} N (f - a)`.

Roadmap: `AS-A04`. -/
def approxError (n : ℕ) (f : X) : ℝ≥0∞ :=
  ⨅ a ∈ S.A n, N.toFun (f - a)

/-- Pietsch's quasi-norm `‖((n+1)^{s - 1/q} E_n(f))_{n ≥ 0}‖_{ℓ_q}`; for `q = ∞` the exponent
`1/q.toReal` is `0`.

Roadmap: `AS-A05`. -/
def approxNorm (s : ℝ) (q : ℝ≥0∞) (f : X) : ℝ≥0∞ :=
  eLpNorm (fun n : ℕ => ((n : ℝ≥0∞) + 1) ^ (s - 1 / q.toReal) * S.approxError n f) q
    Measure.count

/-- The dyadic quasi-norm `N f + ‖(2^{ks} E_{2^k}(f))_k‖_{ℓ_q}`.

Roadmap: `AS-A05`. -/
def approxNormDyadic (s : ℝ) (q : ℝ≥0∞) (f : X) : ℝ≥0∞ :=
  N.toFun f + eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (s * k) * S.approxError (2 ^ k) f) q
    Measure.count

/-- For `s ≥ 0` the two quasi-norms are equivalent, with constants depending on `s`, `q` and the
constant of the quasi-norm.

Roadmap: `AS-A05`. -/
theorem exists_approxNorm_equiv {s : ℝ} (hs : 0 ≤ s) {q : ℝ≥0∞} (hq : 0 < q) :
    ∃ C : ℝ≥0∞, C ≠ ⊤ ∧ ∀ f,
      S.approxNorm s q f ≤ C * S.approxNormDyadic s q f ∧
        S.approxNormDyadic s q f ≤ C * S.approxNorm s q f := by
  sorry

/-- The approximation space `A^s_q`, the elements of finite quasi-norm.

Roadmap: `AS-A06`. -/
def approxSpace (s : ℝ) (q : ℝ≥0∞) : Submodule 𝕜 X where
  carrier := {f | S.approxNorm s q f < ⊤}
  zero_mem' := sorry
  add_mem' := sorry
  smul_mem' := sorry

/-- **Block decompositions** in a `ρ`-normed group, without completeness: for `s > 0`,
`f ∈ A^s_q` iff `f` is the limit of the partial sums of blocks `g k ∈ A (2^k)` with
`(2^{ks} N (g k))_k ∈ ℓ_q`.

Roadmap: `AS-A12`. -/
theorem approxNorm_lt_top_iff_exists_blocks {ρ : ℝ} (hρ : 0 < ρ)
    (hN : ∀ x y, N.toFun (x + y) ^ ρ ≤ N.toFun x ^ ρ + N.toFun y ^ ρ)
    {s : ℝ} (hs : 0 < s) {q : ℝ≥0∞} (hq : 0 < q) (f : X) :
    S.approxNorm s q f < ⊤ ↔ ∃ g : ℕ → X, (∀ k, g k ∈ S.A (2 ^ k)) ∧
      Tendsto (fun n => N.toFun (f - ∑ k ∈ Finset.range n, g k)) atTop (𝓝 0) ∧
      eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (s * k) * N.toFun (g k)) q Measure.count < ⊤ := by
  sorry

end ApproximationScheme

section FunctionScheme

variable {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)

/-- A scheme of functions: an approximation scheme in `L_∞(μ)` with its norm.

Roadmap: `AS-A14`. -/
abbrev FunctionScheme := ApproximationScheme (lpQuasiENorm μ ∞)

variable {μ} [IsFiniteMeasure μ]

namespace FunctionScheme

variable (S : FunctionScheme μ)

/-- The error of best approximation of a function in `L_p` by the approximants of level `n`,
`E_n(f)_p = inf_{a ∈ S_n} ‖f - a‖_p`, for every `0 < p ≤ ∞`.

Roadmap: `AS-A14`. -/
def lpError (p : ℝ≥0∞) (n : ℕ) (f : Ω → ℂ) : ℝ≥0∞ :=
  ⨅ a ∈ S.A n, eLpNorm (f - ⇑a) p μ

/-- The dyadic Besov quasi-norm of the scheme, `‖f‖_p + ‖(2^{ks} E_{2^k}(f)_p)_k‖_{ℓ_q}`, for every
`0 < p, q ≤ ∞`.

Roadmap: `AS-A14`. -/
def besovENorm (p : ℝ≥0∞) (s : ℝ) (q : ℝ≥0∞) (f : Ω → ℂ) : ℝ≥0∞ :=
  eLpNorm f p μ +
    eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (s * k) * S.lpError p (2 ^ k) f) q Measure.count

/-- **Nikolskii's inequality below `1`**: from `‖a‖_∞ ≤ C n^D ‖a‖_1` on `S_n` to
`‖a‖_∞ ≤ C^{1/p} n^{D/p} ‖a‖_p` for `0 < p ≤ 1` (Ditzian–Prymak 2016, Theorem 2.1).

Roadmap: `AS-A15`. -/
theorem eLpNorm_top_le_of_le_one {D : ℝ} {C : ℝ≥0∞}
    (h1 : ∀ n : ℕ, 1 ≤ n → ∀ a ∈ S.A n,
      eLpNorm (⇑a) ∞ μ ≤ C * (n : ℝ≥0∞) ^ D * eLpNorm (⇑a) 1 μ)
    {p : ℝ≥0∞} (hp0 : 0 < p) (hp1 : p ≤ 1) (n : ℕ) (hn : 1 ≤ n) (a : Lp ℂ ∞ μ)
    (ha : a ∈ S.A n) :
    eLpNorm (⇑a) ∞ μ ≤ C ^ (1 / p.toReal) * (n : ℝ≥0∞) ^ (D / p.toReal) * eLpNorm (⇑a) p μ := by
  sorry

/-- **The embedding theorem** for `0 < p ≤ r ≤ ∞`: under Nikolskii's inequality of dimension `D`
at the exponent `p`, `B^s_{p,q}(S) ⊆ B^{s - α}_{r,q}(S)` with `α = D (1/p - 1/r) < s`, every `q`.

Roadmap: `AS-A16`. -/
theorem exists_besovENorm_le_of_nikolskii {D : ℝ} (hD : 0 ≤ D) {p r : ℝ≥0∞} (hp0 : 0 < p)
    (hpr : p ≤ r) {C : ℝ≥0∞} (hC : C ≠ ⊤)
    (hNik : ∀ n : ℕ, 1 ≤ n → ∀ a ∈ S.A n,
      eLpNorm (⇑a) ∞ μ ≤ C * (n : ℝ≥0∞) ^ (D / p.toReal) * eLpNorm (⇑a) p μ)
    {s : ℝ} (hs : D * (1 / p.toReal - 1 / r.toReal) < s) {q : ℝ≥0∞} (hq : 0 < q) :
    ∃ K : ℝ≥0∞, K ≠ ⊤ ∧ ∀ f : Ω → ℂ,
      S.besovENorm r (s - D * (1 / p.toReal - 1 / r.toReal)) q f ≤ K * S.besovENorm p s q f := by
  sorry

/-- **Block decompositions in `L_p`**: for `s > 0`, `f ∈ B^s_{p,q}(S)` iff `f = ∑ g_k` almost
everywhere with `g_k ∈ S_{2^k}` and `(2^{ks} ‖g_k‖_p)_k ∈ ℓ_q` (DeVore–Popov 1988, Corollary 5.3).

Roadmap: `AS-A17`. -/
theorem besovENorm_lt_top_iff_exists_blocks {p : ℝ≥0∞} (hp0 : 0 < p) {s : ℝ} (hs : 0 < s)
    {q : ℝ≥0∞} (hq : 0 < q) (f : Ω → ℂ) :
    S.besovENorm p s q f < ⊤ ↔ ∃ g : ℕ → Lp ℂ ∞ μ, (∀ k, g k ∈ S.A (2 ^ k)) ∧
      (∀ᵐ x ∂μ, HasSum (fun k => g k x) (f x)) ∧
      eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (s * k) * eLpNorm (⇑(g k)) p μ) q Measure.count < ⊤ := by
  sorry

end FunctionScheme

end FunctionScheme

/-! ## Part B: real interpolation of quasi-normed couples -/

/-- A couple of quasi-norms, possibly infinite, on one ambient module; `X_i = {N_i < ∞}`.

Roadmap: `AS-B01`. -/
structure QuasiCouple (𝕜 V : Type*) [NormedField 𝕜] [AddCommGroup V] [Module 𝕜 V] where
  /-- The quasi-norm of the first space. -/
  N₀ : QuasiENorm 𝕜 V
  /-- The quasi-norm of the second space. -/
  N₁ : QuasiENorm 𝕜 V

namespace QuasiCouple

variable {V : Type*} [AddCommGroup V] [Module 𝕜 V] (C : QuasiCouple 𝕜 V)

/-- Peetre's K-functional `K(t, x) = inf {N₀ x₀ + t N₁ x₁ : x = x₀ + x₁}`.

Roadmap: `AS-B01`. -/
def kFunctional (t : ℝ≥0∞) (x : V) : ℝ≥0∞ :=
  ⨅ (x₀ : V) (x₁ : V) (_ : x₀ + x₁ = x), C.N₀.toFun x₀ + t * C.N₁.toFun x₁

/-- The measure `dt / t` on `(0, ∞)`. -/
def dtOverT : Measure ℝ :=
  (volume.restrict (Set.Ioi (0 : ℝ))).withDensity fun t => ENNReal.ofReal t⁻¹

/-- The K-method quasi-norm `‖t ↦ t^{-θ} K(t, x)‖_{L_q(dt/t)}`, for every `0 < q ≤ ∞`.

Roadmap: `AS-B01`. -/
def kMethodENorm (θ : ℝ) (q : ℝ≥0∞) (x : V) : ℝ≥0∞ :=
  eLpNorm (fun t : ℝ => ENNReal.ofReal t ^ (-θ) * C.kFunctional (ENNReal.ofReal t) x) q dtOverT

end QuasiCouple

section EFunctional

variable {V : Type*} [AddCommGroup V] [Module 𝕜 V]

/-- The E-functional of a quasi-norm `N₀` and a complexity `N₁`,
`E(t, x) = inf {N₀ (x - y) : N₁ y ≤ t}`.

Roadmap: `AS-B05`. -/
def eFunctional (N₀ : QuasiENorm 𝕜 V) (N₁ : V → ℝ≥0∞) (t : ℝ≥0∞) (x : V) : ℝ≥0∞ :=
  ⨅ (y : V) (_ : N₁ y ≤ t), N₀.toFun (x - y)

end EFunctional

/-- For the complexity of a scheme the E-functional is the error of best approximation.

Roadmap: `AS-B05`. -/
theorem eFunctional_complexity {N : QuasiENorm 𝕜 X} (S : ApproximationScheme N) (n : ℕ) (f : X) :
    eFunctional N S.complexity (n : ℝ≥0∞) f = S.approxError n f := by
  sorry

/-- The couple `(X, ι Y)` of a linear map `ι : Y → X`: the first quasi-norm is `N`, the second
`x ↦ inf {N_Y y : ι y = x}`.

Roadmap: `AS-B06`. -/
def embeddingCouple {Y : Type*} [AddCommGroup Y] [Module 𝕜 Y] (N : QuasiENorm 𝕜 X)
    (NY : QuasiENorm 𝕜 Y) (ι : Y →ₗ[𝕜] X) : QuasiCouple 𝕜 X where
  N₀ := N
  N₁ :=
    { toFun := fun x => ⨅ (y : Y) (_ : ι y = x), NY.toFun y
      K := NY.K
      one_le_K := NY.one_le_K
      map_zero := sorry
      map_smul := sorry
      add_le := sorry }

/-- **The representation theorem** for quasi-normed `X` and `Y`: under Jackson's and Bernstein's
inequalities of order `r`, `A^s_q = (X, ι Y)_{s/r, q}` for `0 < s < r` and every `0 < q ≤ ∞`.

Roadmap: `AS-B06`. -/
theorem approxNorm_lt_top_iff_kMethodENorm_lt_top {Y : Type*} [AddCommGroup Y] [Module 𝕜 Y]
    {N : QuasiENorm 𝕜 X} {NY : QuasiENorm 𝕜 Y} (S : ApproximationScheme N) (ι : Y →ₗ[𝕜] X)
    {r : ℝ} (hr : 0 < r) {B : ℝ≥0∞} (hB : B ≠ ⊤)
    (jackson : ∀ (y : Y) (n : ℕ), 1 ≤ n →
      S.approxError n (ι y) ≤ B * (n : ℝ≥0∞) ^ (-r) * NY.toFun y)
    (bernstein : ∀ (n : ℕ) (a : X), 1 ≤ n → a ∈ S.A n →
      ∃ y, ι y = a ∧ NY.toFun y ≤ B * (n : ℝ≥0∞) ^ r * N.toFun a)
    {s : ℝ} (hs : 0 < s) (hsr : s < r) {q : ℝ≥0∞} (hq : 0 < q) (f : X) :
    S.approxNorm s q f < ⊤ ↔ (embeddingCouple N NY ι).kMethodENorm (s / r) q f < ⊤ := by
  sorry

/-- **Moduli compatible with a scheme**: a modulus `ω f k` at the scales `2^{-k}` whose `ρ`-th
power is subadditive, with `ω ≤ C N`, Jackson's inequality and the inverse inequality of order
`θ`, describes `A^s_q` for `0 ≤ s < θ` and every `0 < q ≤ ∞`.

Roadmap: `AS-B10`. -/
theorem approxNormDyadic_lt_top_iff_of_modulus {N : QuasiENorm 𝕜 X} (S : ApproximationScheme N)
    (ω : X → ℕ → ℝ≥0∞) {ρ : ℝ} (hρ : 0 < ρ)
    (hω : ∀ f g k, ω (f + g) k ^ ρ ≤ ω f k ^ ρ + ω g k ^ ρ)
    {C : ℝ≥0∞} (hC : C ≠ ⊤) (hωN : ∀ f k, ω f k ≤ C * N.toFun f)
    (jackson : ∀ f k, S.approxError (2 ^ k) f ≤ C * ω f k)
    {θ : ℝ} (inverse : ∀ (j k : ℕ) (a : X), a ∈ S.A (2 ^ j) →
      ω a k ≤ C * (2 : ℝ≥0∞) ^ (-(θ * ((k - j : ℕ) : ℝ))) * N.toFun a)
    {s : ℝ} (hs : 0 ≤ s) (hsθ : s < θ) {q : ℝ≥0∞} (hq : 0 < q) (f : X) :
    S.approxNormDyadic s q f < ⊤ ↔
      N.toFun f + eLpNorm (fun k : ℕ => (2 : ℝ≥0∞) ^ (s * k) * ω f k) q Measure.count < ⊤ := by
  sorry

end TauCetiRoadmap.ApproximationSpaces
