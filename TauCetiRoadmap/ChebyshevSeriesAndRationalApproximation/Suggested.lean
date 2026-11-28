import Mathlib
import TauCeti.Analysis.SpecialFunctions.Trigonometric.Chebyshev.Parseval

/-!
# Chebyshev series and rational approximation: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib, with `sorry` proofs, together with the
definitions those statements need; every definition has a real body. The README's other
headlines are targets of the same standing, stated in prose.

Conventions (README, Conventions). Uniform approximation takes place in `C(K, ℝ)` (or `C(K, ℂ)`)
for a compact `K` with its supremum norm, and the error of best approximation from a set `A` is
`Metric.infDist f A`; a supremum over an unbounded set never occurs. A bound on all of `ℝ` for a
periodic function is written `∀ θ, |g θ - t θ| ≤ C`. Chebyshev polynomials are Mathlib's
`Polynomial.Chebyshev.T` (indexed by `ℤ`), the Chebyshev points of degree `n` are Mathlib's
`Polynomial.Chebyshev.node n j = cos (j π / n)`, `j ≤ n`, and Chebyshev coefficients are cosine
integrals of `f ∘ cos`, valued in any real Banach space so that the analytic layer can use
complex-valued functions. Padé approximation is algebraic and is stated over an arbitrary field.

Local copies. `polyDegLE`, `bestApproxError`, `lebesgueFunction`, `lebesgueConstant` and
`trigPoly` are verbatim copies of the definitions of PolynomialInterpolationAndBestApproximation
(its 2.1, 3.1 and 4.1). `IsOrthogonalityMeasure` is a verbatim copy of the definition of
SpecialFunctionsOrthogonalPolynomialsGeneral (its 2.1). They live in this roadmap's namespace
under their short names.

One declaration is a supporting step proved here, not a target:
`chebyshevCoeff_eq_integral_measureT`, which identifies the cosine form of the Chebyshev
coefficient with the weighted integral of the sources.
-/

noncomputable section

open Polynomial Set Real Filter Topology MeasureTheory
open scoped BigOperators

namespace TauCetiRoadmap.ChebyshevSeriesAndRationalApproximation

attribute [local instance] Classical.propDecidable

/-! ## Local copies of definitions owned elsewhere -/

/-- Local copy of PolynomialInterpolationAndBestApproximation 2.1: the polynomials of degree at
most `n`, as continuous functions on `[a, b]`. -/
def polyDegLE (a b : ℝ) (n : ℕ) : Set C(Icc a b, ℝ) :=
  {g | ∃ p : ℝ[X], p.natDegree ≤ n ∧ p.toContinuousMapOn (Icc a b) = g}

/-- Local copy of PolynomialInterpolationAndBestApproximation 2.1: the error `Eₙ(f)` of best
uniform approximation on `[a, b]` by polynomials of degree at most `n`. -/
def bestApproxError (a b : ℝ) (n : ℕ) (f : C(Icc a b, ℝ)) : ℝ :=
  Metric.infDist f (polyDegLE a b n)

/-- Local copy of PolynomialInterpolationAndBestApproximation 3.1: the Lebesgue function. -/
def lebesgueFunction {ι : Type*} [DecidableEq ι] (s : Finset ι) (v : ι → ℝ) (x : ℝ) : ℝ :=
  ∑ i ∈ s, |(Lagrange.basis s v i).eval x|

/-- Local copy of PolynomialInterpolationAndBestApproximation 3.1: the Lebesgue constant on
`[a, b]`, the supremum of the Lebesgue function over `[a, b]`. -/
def lebesgueConstant {ι : Type*} [DecidableEq ι] (a b : ℝ) (s : Finset ι) (v : ι → ℝ) : ℝ :=
  sSup (lebesgueFunction s v '' Icc a b)

/-- Local copy of PolynomialInterpolationAndBestApproximation 4.1: the real trigonometric
polynomial `θ ↦ ∑_{k ≤ n} (a k cos kθ + b k sin kθ)` of degree at most `n`. -/
def trigPoly (n : ℕ) (a b : ℕ → ℝ) (θ : ℝ) : ℝ :=
  ∑ k ∈ Finset.range (n + 1), (a k * Real.cos (k * θ) + b k * Real.sin (k * θ))

/-- Local copy of SpecialFunctionsOrthogonalPolynomialsGeneral 2.1: an orthogonality measure,
every moment finite and the support infinite. -/
structure IsOrthogonalityMeasure (μ : Measure ℝ) : Prop where
  integrable_pow : ∀ n : ℕ, Integrable (fun x : ℝ => x ^ n) μ
  support_infinite : μ.support.Infinite

/-! ## Layer 1: Haar spaces -/

section Haar

variable {K : Type*} [TopologicalSpace K]

/-- 1.1 A subspace `V` of `C(K, ℝ)` is a Haar space of dimension `N` if data at any `N` distinct
points of `K` are interpolated by exactly one element of `V`. -/
def IsHaarSpace (V : Submodule ℝ C(K, ℝ)) (N : ℕ) : Prop :=
  ∀ (x : Fin N → K) (y : Fin N → ℝ), Function.Injective x →
    ∃! v : V, ∀ i, (v : C(K, ℝ)) (x i) = y i

/-- 1.1 The zero count: an `N`-dimensional `V` is a Haar space iff no nonzero element vanishes at
`N` distinct points. -/
theorem isHaarSpace_iff_forall_eq_zero (V : Submodule ℝ C(K, ℝ)) [FiniteDimensional ℝ V]
    {N : ℕ} (hdim : Module.finrank ℝ V = N) :
    IsHaarSpace V N ↔
      ∀ (v : V) (x : Fin N → K), Function.Injective x →
        (∀ i, (v : C(K, ℝ)) (x i) = 0) → v = 0 := by
  sorry

/-- 1.1 The collocation determinant: for every basis, `V` is a Haar space iff the determinant
`det (b j (x i))` is nonzero at all `N` distinct points. -/
theorem isHaarSpace_iff_det_ne_zero (V : Submodule ℝ C(K, ℝ)) {N : ℕ}
    (b : Module.Basis (Fin N) ℝ V) :
    IsHaarSpace V N ↔
      ∀ x : Fin N → K, Function.Injective x →
        (Matrix.of fun i j => ((b j : V) : C(K, ℝ)) (x i)).det ≠ 0 := by
  sorry

/-- 1.2 The polynomials of degree less than `N`, restricted to a set `s ⊆ ℝ`. -/
def polyRestrict (s : Set ℝ) (N : ℕ) : Submodule ℝ C(s, ℝ) :=
  (Polynomial.degreeLT ℝ N).map (Polynomial.toContinuousMapOnAlgHom s).toLinearMap

/-- 1.2 On a set with at least `N` points, the polynomials of degree less than `N` form a Haar
space of dimension `N`. -/
theorem isHaarSpace_polyRestrict {s : Set ℝ} {N : ℕ} (hs : N ≤ s.ncard ∨ s.Infinite) :
    Module.finrank ℝ (polyRestrict s N) = N ∧ IsHaarSpace (polyRestrict s N) N := by
  sorry

/-- 1.3 The Mairhuber–Curtis theorem: a subset of `ℝᵈ`, `d ≥ 2`, with an interior point carries
no Haar space of dimension `N ≥ 2`. -/
theorem not_isHaarSpace_of_interior_nonempty {d : ℕ} (hd : 2 ≤ d)
    {S : Set (EuclideanSpace ℝ (Fin d))} (hS : (interior S).Nonempty)
    (V : Submodule ℝ C(S, ℝ)) [FiniteDimensional ℝ V] {N : ℕ}
    (hdim : Module.finrank ℝ V = N) (hN : 2 ≤ N) :
    ¬ IsHaarSpace V N := by
  sorry

/-- 1.4 `g` equioscillates between `k` extreme points of `[a, b]`: it takes the values
`σ (-1)ⁱ ‖g‖` at `k` increasing points, for a sign `σ = ±1`. -/
def Equioscillates {a b : ℝ} (g : C(Icc a b, ℝ)) (k : ℕ) : Prop :=
  ∃ x : Fin k → Icc a b, StrictMono x ∧ ∃ σ : ℝ, (σ = 1 ∨ σ = -1) ∧
    ∀ i, g (x i) = σ * (-1) ^ (i : ℕ) * ‖g‖

/-- 1.4 de la Vallée Poussin's bound for a Haar space: if `f - v` alternates strictly in sign
at `n + 2` increasing points, the least of the `|f - v|` there is at most the distance from `f`
to `V`. -/
theorem inf'_abs_le_infDist_of_isHaarSpace {a b : ℝ} {n : ℕ}
    (V : Submodule ℝ C(Icc a b, ℝ)) [FiniteDimensional ℝ V]
    (hdim : Module.finrank ℝ V = n + 1) (hV : IsHaarSpace V (n + 1))
    (f : C(Icc a b, ℝ)) {v : C(Icc a b, ℝ)} (hv : v ∈ V)
    (x : Fin (n + 2) → Icc a b) (hx : StrictMono x)
    (hsign : ∀ i : Fin (n + 1),
      ((f - v) (x i.castSucc)) * ((f - v) (x i.succ)) < 0) :
    Finset.univ.inf' Finset.univ_nonempty (fun i => |(f - v) (x i)|) ≤
      Metric.infDist f (V : Set C(Icc a b, ℝ)) := by
  sorry

/-- 1.4 The alternation theorem for a Haar space of dimension `n + 1` on `[a, b]`: `v ∈ V` is a
best uniform approximation of `f` iff `f - v` equioscillates between `n + 2` extreme points; the
best approximation is unique. -/
theorem norm_sub_eq_infDist_iff_equioscillates {a b : ℝ} (hab : a < b) {n : ℕ}
    (V : Submodule ℝ C(Icc a b, ℝ)) [FiniteDimensional ℝ V]
    (hdim : Module.finrank ℝ V = n + 1) (hV : IsHaarSpace V (n + 1)) (f : C(Icc a b, ℝ)) :
    (∀ v ∈ V, ‖f - v‖ = Metric.infDist f (V : Set C(Icc a b, ℝ)) ↔
      Equioscillates (f - v) (n + 2)) ∧
    ∃! v : V, ‖f - (v : C(Icc a b, ℝ))‖ = Metric.infDist f (V : Set C(Icc a b, ℝ)) := by
  sorry

/-- 1.5 Haar's theorem: on a compact Hausdorff space, every continuous function has exactly one
best uniform approximation from the `N`-dimensional subspace `V` iff `V` is a Haar space. -/
theorem forall_existsUnique_bestApprox_iff_isHaarSpace [CompactSpace K] [T2Space K]
    (V : Submodule ℝ C(K, ℝ)) [FiniteDimensional ℝ V] {N : ℕ}
    (hdim : Module.finrank ℝ V = N) :
    (∀ f : C(K, ℝ), ∃! v : V, ‖f - (v : C(K, ℝ))‖ = Metric.infDist f (V : Set C(K, ℝ))) ↔
      IsHaarSpace V N := by
  sorry

end Haar

/-! ## Layer 2: trigonometric and complex best approximation -/

section TrigComplex

local instance instFactZeroLtTwoPi : Fact (0 < 2 * π) := ⟨by positivity⟩

/-- 2.1 `θ ↦ cos kθ` on the circle `ℝ / 2πℤ`, the real part of Mathlib's `fourier k`. -/
def cosCircle (k : ℕ) : C(AddCircle (2 * π), ℝ) :=
  ⟨fun x => (fourier (k : ℤ) x).re, Complex.continuous_re.comp (fourier (k : ℤ)).continuous⟩

/-- 2.1 `θ ↦ sin kθ` on the circle `ℝ / 2πℤ`, the imaginary part of Mathlib's `fourier k`. -/
def sinCircle (k : ℕ) : C(AddCircle (2 * π), ℝ) :=
  ⟨fun x => (fourier (k : ℤ) x).im, Complex.continuous_im.comp (fourier (k : ℤ)).continuous⟩

/-- 2.1 The real trigonometric polynomials of degree at most `n` on the circle `ℝ / 2πℤ`. -/
def trigPolyDegLE (n : ℕ) : Submodule ℝ C(AddCircle (2 * π), ℝ) :=
  Submodule.span ℝ (cosCircle '' Iic n ∪ sinCircle '' Iic n)

/-- 2.1 The trigonometric polynomials of degree at most `n` form a Haar space of dimension
`2n + 1` on the circle. -/
theorem isHaarSpace_trigPolyDegLE (n : ℕ) :
    Module.finrank ℝ (trigPolyDegLE n) = 2 * n + 1 ∧
      IsHaarSpace (trigPolyDegLE n) (2 * n + 1) := by
  sorry

/-- 2.1 Every continuous `2π`-periodic function has exactly one best uniform approximation among
the real trigonometric polynomials of degree at most `n`. -/
theorem existsUnique_bestApprox_trigPolyDegLE (n : ℕ) (g : C(AddCircle (2 * π), ℝ)) :
    ∃! t : trigPolyDegLE n,
      ‖g - (t : C(AddCircle (2 * π), ℝ))‖ =
        Metric.infDist g (trigPolyDegLE n : Set C(AddCircle (2 * π), ℝ)) := by
  sorry

/-- 2.2 The complex polynomials of degree at most `n` as continuous functions on `[-1, 1]`. -/
def complexPolyDegLE (n : ℕ) : Set C(Icc (-1 : ℝ) 1, ℂ) :=
  {g | ∃ p : ℂ[X], p.natDegree ≤ n ∧ ∀ x : Icc (-1 : ℝ) 1, g x = p.eval ((x : ℝ) : ℂ)}

/-- 2.2 A complex continuous function on `[-1, 1]` has exactly one best uniform approximation by
complex polynomials of degree at most `n`. -/
theorem existsUnique_bestApprox_complexPoly (n : ℕ) (f : C(Icc (-1 : ℝ) 1, ℂ)) :
    ∃! p : ℂ[X], p.natDegree ≤ n ∧ ∃ g ∈ complexPolyDegLE n,
      (∀ x : Icc (-1 : ℝ) 1, g x = p.eval ((x : ℝ) : ℂ)) ∧
      ‖f - g‖ = Metric.infDist f (complexPolyDegLE n) := by
  sorry

end TrigComplex

/-! ## Layer 3: Chebyshev series -/

section ChebyshevSeries

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 3.1 The Chebyshev coefficient `a_k = (c_k/π) ∫₀^π cos(kθ) f(cos θ) dθ`, with `c₀ = 1` and
`c_k = 2` for `k ≥ 1`. -/
def chebyshevCoeff (f : ℝ → E) (k : ℕ) : E :=
  ((if k = 0 then 1 else 2) / π) • ∫ θ in (0 : ℝ)..π, Real.cos (k * θ) • f (Real.cos θ)

/-- 3.1 The Chebyshev projection (truncated Chebyshev series) of degree `n`. -/
def chebyshevProj (f : ℝ → E) (n : ℕ) (x : ℝ) : E :=
  ∑ k ∈ Finset.range (n + 1), (Chebyshev.T ℝ k).eval x • chebyshevCoeff f k

/-- 3.1 The Chebyshev interpolant of degree `n`: the interpolant of `f` in the Chebyshev points
`cos (jπ/n)`, `j ≤ n`, written with the Lagrange basis so that `f` may be vector valued. -/
def chebyshevInterp (f : ℝ → E) (n : ℕ) (x : ℝ) : E :=
  ∑ j ∈ Finset.range (n + 1),
    (Lagrange.basis (Finset.range (n + 1)) (Chebyshev.node n) j).eval x • f (Chebyshev.node n j)

/-- 3.1 Supporting step (proved): for real `f`, the coefficient is the integral against Mathlib's
Chebyshev measure `dx/√(1 - x²)` on `(-1, 1]`. -/
theorem chebyshevCoeff_eq_integral_measureT (f : ℝ → ℝ) (k : ℕ) :
    chebyshevCoeff f k =
      (if k = 0 then 1 else 2) / π * ∫ x, f x * (Chebyshev.T ℝ k).eval x ∂Chebyshev.measureT := by
  rw [chebyshevCoeff, Chebyshev.integral_measureT_eq_integral_cos, smul_eq_mul]
  congr 1
  refine intervalIntegral.integral_congr fun θ _ => ?_
  simp only [smul_eq_mul]
  rw [Chebyshev.T_real_cos]
  push_cast
  ring

/-- 3.2 A Lipschitz function on `[-1, 1]` has an absolutely convergent Chebyshev series, which
converges to it, uniformly on `[-1, 1]`. -/
theorem hasSum_chebyshevCoeff_of_lipschitzOnWith {f : ℝ → ℝ} {L : NNReal}
    (hf : LipschitzOnWith L f (Icc (-1) 1)) :
    Summable (fun k => |chebyshevCoeff f k|) ∧
      (∀ x ∈ Icc (-1 : ℝ) 1,
        HasSum (fun k => chebyshevCoeff f k * (Chebyshev.T ℝ k).eval x) (f x)) ∧
      TendstoUniformlyOn (fun n x => chebyshevProj f n x) f atTop (Icc (-1) 1) := by
  sorry

/-- 3.2 Uniqueness of the Chebyshev expansion among absolutely summable ones. -/
theorem eq_chebyshevCoeff_of_hasSum {f : ℝ → ℝ} {c : ℕ → ℝ} (hc : Summable (fun k => |c k|))
    (hfc : ∀ x ∈ Icc (-1 : ℝ) 1, HasSum (fun k => c k * (Chebyshev.T ℝ k).eval x) (f x))
    (k : ℕ) : c k = chebyshevCoeff f k := by
  sorry

/-- 3.3 Aliasing (Trefethen (4.4)): the index `m = |(k + n - 1) mod 2n - (n - 1)|` in `[0, n]`. -/
def chebyshevAlias (n k : ℕ) : ℕ :=
  Int.natAbs (((k : ℤ) + n - 1) % (2 * n) - (n - 1))

/-- 3.3 Aliasing of Chebyshev polynomials: on the `n + 1` Chebyshev points, `T k` agrees with
`T (chebyshevAlias n k)`, and `chebyshevAlias n k ≤ n`. -/
theorem eval_T_node_eq_chebyshevAlias {n : ℕ} (hn : 1 ≤ n) (k : ℕ) :
    chebyshevAlias n k ≤ n ∧ ∀ j ≤ n,
      (Chebyshev.T ℝ k).eval (Chebyshev.node n j) =
        (Chebyshev.T ℝ (chebyshevAlias n k)).eval (Chebyshev.node n j) := by
  sorry

/-- 3.3 The error expansions of projection and interpolation for a Lipschitz function
(Trefethen (4.8)–(4.9)). -/
theorem hasSum_sub_chebyshevProj_and_chebyshevInterp {f : ℝ → ℝ} {L : NNReal}
    (hf : LipschitzOnWith L f (Icc (-1) 1)) {n : ℕ} (hn : 1 ≤ n) {x : ℝ}
    (hx : x ∈ Icc (-1 : ℝ) 1) :
    HasSum (fun k => chebyshevCoeff f (k + n + 1) * (Chebyshev.T ℝ (k + n + 1 : ℕ)).eval x)
        (f x - chebyshevProj f n x) ∧
      HasSum (fun k => chebyshevCoeff f (k + n + 1) *
          ((Chebyshev.T ℝ (k + n + 1 : ℕ)).eval x -
            (Chebyshev.T ℝ (chebyshevAlias n (k + n + 1))).eval x))
        (f x - chebyshevInterp f n x) := by
  sorry

/-- 3.4 Coefficient decay for derivatives of bounded variation: if `f, …, f^(ν-1)` are absolutely
continuous on `[-1, 1]` and `f^(ν)` agrees a.e. with a function `g` of finite variation `V`, then
`|a_k| ≤ 2V / (π k (k-1) ⋯ (k-ν)) ≤ 2V / (π (k-ν)^(ν+1))` for `k ≥ ν + 1`. -/
theorem abs_chebyshevCoeff_le_of_boundedVariation {f g : ℝ → ℝ} {ν : ℕ}
    (hac : ∀ j < ν,
      AbsolutelyContinuousOnInterval (iteratedDerivWithin j f (Icc (-1) 1)) (-1) 1)
    (hg : ∀ᵐ x ∂(volume.restrict (Icc (-1 : ℝ) 1)),
      iteratedDerivWithin ν f (Icc (-1) 1) x = g x)
    (hV : eVariationOn g (Icc (-1) 1) ≠ ⊤) {k : ℕ} (hk : ν + 1 ≤ k) :
    |chebyshevCoeff f k| ≤
        2 * (eVariationOn g (Icc (-1) 1)).toReal /
          (π * ∏ i ∈ Finset.range (ν + 1), ((k : ℝ) - i)) ∧
      2 * (eVariationOn g (Icc (-1) 1)).toReal /
          (π * ∏ i ∈ Finset.range (ν + 1), ((k : ℝ) - i)) ≤
        2 * (eVariationOn g (Icc (-1) 1)).toReal / (π * ((k : ℝ) - ν) ^ (ν + 1)) := by
  sorry

/-- 3.4 Algebraic convergence of projection and interpolation for `ν ≥ 1` and `n > ν`:
`|f - f_n| ≤ 2V/(πν(n-ν)^ν)` and `|f - p_n| ≤ 4V/(πν(n-ν)^ν)` on `[-1, 1]`. -/
theorem abs_sub_chebyshevProj_le_of_boundedVariation {f g : ℝ → ℝ} {ν : ℕ} (hν : 1 ≤ ν)
    (hac : ∀ j < ν,
      AbsolutelyContinuousOnInterval (iteratedDerivWithin j f (Icc (-1) 1)) (-1) 1)
    (hg : ∀ᵐ x ∂(volume.restrict (Icc (-1 : ℝ) 1)),
      iteratedDerivWithin ν f (Icc (-1) 1) x = g x)
    (hV : eVariationOn g (Icc (-1) 1) ≠ ⊤) {n : ℕ} (hn : ν < n) {x : ℝ}
    (hx : x ∈ Icc (-1 : ℝ) 1) :
    |f x - chebyshevProj f n x| ≤
        2 * (eVariationOn g (Icc (-1) 1)).toReal / (π * ν * ((n : ℝ) - ν) ^ ν) ∧
      |f x - chebyshevInterp f n x| ≤
        4 * (eVariationOn g (Icc (-1) 1)).toReal / (π * ν * ((n : ℝ) - ν) ^ ν) := by
  sorry

end ChebyshevSeries

/-! ## Layer 4: the Chebyshev projection, minimal projections and Faber's theorem -/

section Faber

/-- 4.1 The Lebesgue constant of the Chebyshev projection of degree `n`:
`(1/2π) ∫_{-π}^{π} |1 + 2 ∑_{k=1}^{n} cos kt| dt`, the `L¹` norm of the Dirichlet kernel. -/
def chebyshevProjLebesgue (n : ℕ) : ℝ :=
  (2 * π)⁻¹ * ∫ t in (-π)..π,
    |1 + 2 * ∑ k ∈ Finset.Icc 1 n, Real.cos (k * t)|

/-- 4.1 The Chebyshev projection has norm `chebyshevProjLebesgue n` on `C[-1, 1]`: it is bounded
by it, the bound is approached at `x = 1`, and `chebyshevProjLebesgue n ≤ (4/π²) log(n + 1) + 3`. -/
theorem abs_chebyshevProj_le_chebyshevProjLebesgue (n : ℕ) :
    (∀ f : ℝ → ℝ, ContinuousOn f (Icc (-1) 1) → ∀ M, (∀ y ∈ Icc (-1 : ℝ) 1, |f y| ≤ M) →
      ∀ x ∈ Icc (-1 : ℝ) 1, |chebyshevProj f n x| ≤ chebyshevProjLebesgue n * M) ∧
    (∀ ε > 0, ∃ f : ℝ → ℝ, ContinuousOn f (Icc (-1) 1) ∧ (∀ y ∈ Icc (-1 : ℝ) 1, |f y| ≤ 1) ∧
      chebyshevProjLebesgue n - ε < |chebyshevProj f n 1|) ∧
    chebyshevProjLebesgue n ≤ 4 / π ^ 2 * Real.log (n + 1) + 3 := by
  sorry

/-- 4.1 Logarithmic growth from below: `(4/π²) log(n + 1) ≤ chebyshevProjLebesgue n`. -/
theorem four_div_pi_sq_mul_log_le_chebyshevProjLebesgue (n : ℕ) :
    4 / π ^ 2 * Real.log (n + 1) ≤ chebyshevProjLebesgue n := by
  sorry

/-- 4.2 The Chebyshev projection is near-best:
`|f - f_n| ≤ (4 + (4/π²) log(n + 1)) Eₙ(f)` on `[-1, 1]`. -/
theorem abs_sub_chebyshevProj_le_bestApproxError {f : ℝ → ℝ} (hf : ContinuousOn f (Icc (-1) 1))
    {n : ℕ} {x : ℝ} (hx : x ∈ Icc (-1 : ℝ) 1) :
    |f x - chebyshevProj f n x| ≤
      (4 + 4 / π ^ 2 * Real.log (n + 1)) *
        bestApproxError (-1) 1 n ⟨(Icc (-1 : ℝ) 1).domRestrict f, hf.domRestrict⟩ := by
  sorry

/-- 4.3 Minimality of the Chebyshev projection up to a factor `2` (Berman–Marcinkiewicz, Faber):
every bounded linear projection of `C[-1, 1]` onto the polynomials of degree at most `n` has norm
at least `chebyshevProjLebesgue n / 2`. -/
theorem chebyshevProjLebesgue_div_two_le_opNorm {n : ℕ}
    (U : C(Icc (-1 : ℝ) 1, ℝ) →L[ℝ] C(Icc (-1 : ℝ) 1, ℝ))
    (hrange : ∀ f, U f ∈ polyDegLE (-1) 1 n) (hproj : ∀ p ∈ polyDegLE (-1) 1 n, U p = p) :
    chebyshevProjLebesgue n / 2 ≤ ‖U‖ := by
  sorry

/-- 4.4 Every set of `n + 1` distinct nodes in `[-1, 1]` has Lebesgue constant at least
`(2/π²) log(n + 1)`. -/
theorem two_div_pi_sq_mul_log_le_lebesgueConstant {ι : Type*} [DecidableEq ι] {s : Finset ι}
    {n : ℕ} (hs : s.card = n + 1) {v : ι → ℝ} (hv : Set.InjOn v s)
    (hmem : ∀ i ∈ s, v i ∈ Icc (-1 : ℝ) 1) :
    2 / π ^ 2 * Real.log (n + 1) ≤ lebesgueConstant (-1) 1 s v := by
  sorry

/-- 4.4 Faber's theorem: for every triangular array of distinct nodes in `[a, b]` (which forces
`a < b`), the Lebesgue constants are unbounded, and some continuous `f` has interpolants that do
not converge to `f` uniformly on `[a, b]`. -/
theorem exists_not_tendsto_uniform_lagrange {a b : ℝ}
    (nodes : ∀ n : ℕ, Fin (n + 1) → ℝ)
    (hinj : ∀ n, Function.Injective (nodes n)) (hmem : ∀ n i, nodes n i ∈ Icc a b) :
    ¬ BddAbove (Set.range fun n => lebesgueConstant a b Finset.univ (nodes n)) ∧
    ∃ f : ℝ → ℝ, ContinuousOn f (Icc a b) ∧
      ¬ TendstoUniformlyOn
        (fun n x => (Lagrange.interpolate Finset.univ (nodes n) (fun i => f (nodes n i))).eval x)
        f atTop (Icc a b) := by
  sorry

end Faber

/-! ## Layer 5: analytic functions and Bernstein ellipses -/

section Analytic

/-- 5.1 The open Bernstein ellipse with foci `±1` and semi-axis sum `ρ` (for `ρ > 1`). -/
def bernsteinEllipse (ρ : ℝ) : Set ℂ := {z | ‖z - 1‖ + ‖z + 1‖ < ρ + ρ⁻¹}

/-- 5.1 The ellipse through a real singularity `±α`, `α > 1`, and through `±iβ`, `β > 0`. -/
theorem mem_bernsteinEllipse_iff {ρ : ℝ} (hρ : 1 < ρ) :
    (∀ α : ℝ, 1 < α → (((α : ℂ) ∈ bernsteinEllipse ρ) ↔ α + √(α ^ 2 - 1) < ρ)) ∧
    (∀ β : ℝ, 0 < β → ((β * Complex.I ∈ bernsteinEllipse ρ) ↔ β + √(β ^ 2 + 1) < ρ)) := by
  sorry

/-- 5.1 Bernstein's lemma: a polynomial of degree at most `d` bounded by `M` on `[-1, 1]` is
bounded by `ρ ^ d M` on the Bernstein ellipse. -/
theorem norm_eval_le_of_mem_bernsteinEllipse {ρ : ℝ} (hρ : 1 < ρ) {d : ℕ} {p : ℂ[X]}
    (hp : p.natDegree ≤ d) {M : ℝ} (hM : ∀ x ∈ Icc (-1 : ℝ) 1, ‖p.eval (x : ℂ)‖ ≤ M)
    {z : ℂ} (hz : z ∈ bernsteinEllipse ρ) :
    ‖p.eval z‖ ≤ ρ ^ d * M := by
  sorry

/-- 5.2 Coefficients of a function analytic and bounded by `M` on `E_ρ`:
`‖a₀‖ ≤ M` and `‖a_k‖ ≤ 2 M ρ^(-k)` for `k ≥ 1`. -/
theorem norm_chebyshevCoeff_le_of_analyticOnEllipse {f : ℂ → ℂ} {ρ M : ℝ} (hρ : 1 < ρ)
    (hf : AnalyticOnNhd ℂ f (bernsteinEllipse ρ))
    (hM : ∀ z ∈ bernsteinEllipse ρ, ‖f z‖ ≤ M) :
    ‖chebyshevCoeff (fun x : ℝ => f x) 0‖ ≤ M ∧
      ∀ k, 1 ≤ k → ‖chebyshevCoeff (fun x : ℝ => f x) k‖ ≤ 2 * M / ρ ^ k := by
  sorry

/-- 5.2 Geometric convergence of projection and interpolation: on `[-1, 1]`,
`‖f - f_n‖ ≤ 2Mρ^(-n)/(ρ - 1)` and `‖f - p_n‖ ≤ 4Mρ^(-n)/(ρ - 1)` for every `n`. -/
theorem norm_sub_chebyshevProj_le_of_analyticOnEllipse {f : ℂ → ℂ} {ρ M : ℝ} (hρ : 1 < ρ)
    (hf : AnalyticOnNhd ℂ f (bernsteinEllipse ρ))
    (hM : ∀ z ∈ bernsteinEllipse ρ, ‖f z‖ ≤ M) {x : ℝ} (hx : x ∈ Icc (-1 : ℝ) 1) :
    ∀ n : ℕ, ‖f x - chebyshevProj (fun y : ℝ => f y) n x‖ ≤ 2 * M / (ρ ^ n * (ρ - 1)) ∧
      ‖f x - chebyshevInterp (fun y : ℝ => f y) n x‖ ≤ 4 * M / (ρ ^ n * (ρ - 1)) := by
  sorry

/-- 5.3 Bernstein's converse: geometric polynomial approximation on `[-1, 1]` with ratio `ρ`
gives an analytic extension to the open ellipse `E_ρ`. -/
theorem exists_analyticOnNhd_of_geometric_polyApprox {f : ℝ → ℂ} {ρ C : ℝ} (hρ : 1 < ρ)
    (q : ℕ → ℂ[X]) (hdeg : ∀ n, (q n).natDegree ≤ n)
    (happrox : ∀ n, ∀ x ∈ Icc (-1 : ℝ) 1, ‖f x - (q n).eval (x : ℂ)‖ ≤ C / ρ ^ n) :
    ∃ F : ℂ → ℂ, AnalyticOnNhd ℂ F (bernsteinEllipse ρ) ∧ ∀ x ∈ Icc (-1 : ℝ) 1, F x = f x := by
  sorry

/-- 5.3 Analyticity on `[-1, 1]` is equivalent to geometric convergence of best polynomial
approximation. -/
theorem exists_geometric_polyApprox_iff {f : ℝ → ℂ} :
    (∃ ρ > 1, ∃ C : ℝ, ∃ q : ℕ → ℂ[X], (∀ n, (q n).natDegree ≤ n) ∧
        ∀ n, ∀ x ∈ Icc (-1 : ℝ) 1, ‖f x - (q n).eval (x : ℂ)‖ ≤ C / ρ ^ n) ↔
      ∃ U : Set ℂ, IsOpen U ∧ (∀ x ∈ Icc (-1 : ℝ) 1, (x : ℂ) ∈ U) ∧
        ∃ F : ℂ → ℂ, AnalyticOnNhd ℂ F U ∧ ∀ x ∈ Icc (-1 : ℝ) 1, F x = f x := by
  sorry

end Analytic

/-! ## Layer 6: Jackson, Favard and inverse theorems with explicit constants -/

section Jackson

/-- 6.1 Jackson's theorem for smooth periodic functions: if `g` is `2π`-periodic, `C^k` and `g^(k)`
is `α`-Hölder with constant `M`, then for `n ≥ 1` some trigonometric polynomial of degree at most
`n` is within `(1 + π²/2)^(k+1) M / n^(k+α)` of `g` on `ℝ`. -/
theorem exists_trigPoly_sub_le_jackson {g : ℝ → ℝ} (hper : Function.Periodic g (2 * π)) {k : ℕ}
    (hg : ContDiff ℝ k g) {α M : ℝ} (hα : α ∈ Ioc (0 : ℝ) 1)
    (hhol : ∀ θ₁ θ₂, |iteratedDeriv k g θ₁ - iteratedDeriv k g θ₂| ≤ M * |θ₁ - θ₂| ^ α)
    {n : ℕ} (hn : 1 ≤ n) :
    ∃ a b : ℕ → ℝ, ∀ θ, |g θ - trigPoly n a b θ| ≤
      (1 + π ^ 2 / 2) ^ (k + 1) * M / (n : ℝ) ^ ((k : ℝ) + α) := by
  sorry

/-- 6.1 Jackson's theorem for smooth functions on `[-1, 1]`: for `n > k`,
`Eₙ(f) ≤ (1 + π²/2)^(k+1) M / (n (n-1) ⋯ (n-k+1) (n-k)^α)`. -/
theorem exists_polynomial_uniform_error_le_jackson {f : ℝ → ℝ} {k : ℕ}
    (hf : ContDiffOn ℝ k f (Icc (-1) 1)) {α M : ℝ} (hα : α ∈ Ioc (0 : ℝ) 1)
    (hhol : ∀ x₁ ∈ Icc (-1 : ℝ) 1, ∀ x₂ ∈ Icc (-1 : ℝ) 1,
      |iteratedDerivWithin k f (Icc (-1) 1) x₁ - iteratedDerivWithin k f (Icc (-1) 1) x₂| ≤
        M * |x₁ - x₂| ^ α)
    {n : ℕ} (hn : k < n) :
    ∃ p : ℝ[X], p.natDegree ≤ n ∧ ∀ x ∈ Icc (-1 : ℝ) 1,
      |f x - p.eval x| ≤ (1 + π ^ 2 / 2) ^ (k + 1) * M /
        ((∏ i ∈ Finset.range k, ((n : ℝ) - i)) * ((n : ℝ) - k) ^ α) := by
  sorry

/-- 6.2 Favard's estimate: if `u` is `2π`-periodic, `m ≥ 1`, and `u^(m-1)` is `B`-Lipschitz, then
some trigonometric polynomial of degree at most `N - 1` is within `(π/2) B / N^m` of `u` on `ℝ`. -/
theorem exists_trigPoly_sub_le_favard {u : ℝ → ℝ} (hper : Function.Periodic u (2 * π)) {m : ℕ}
    (hm : 1 ≤ m) (hu : ContDiff ℝ (m - 1) u) {B : NNReal}
    (hlip : LipschitzWith B (iteratedDeriv (m - 1) u)) {N : ℕ} (hN : 1 ≤ N) :
    ∃ a b : ℕ → ℝ, ∀ θ, |u θ - trigPoly (N - 1) a b θ| ≤ π / 2 * B / (N : ℝ) ^ m := by
  sorry

/-- 6.3 Bernstein's inverse theorem for `r ≥ 1` and `0 < α < 1`: if the best trigonometric errors
are `O(n^(-r-α))`, then `g` is `C^r` and `g^(r)` is `α`-Hölder. -/
theorem contDiff_and_holder_of_trigPoly_error_le {g : ℝ → ℝ} (hcont : Continuous g)
    (hper : Function.Periodic g (2 * π)) {r : ℕ} (hr : 1 ≤ r) {α M : ℝ}
    (hα : α ∈ Ioo (0 : ℝ) 1)
    (herr : ∀ n : ℕ, 1 ≤ n → ∃ a b : ℕ → ℝ, ∀ θ,
      |g θ - trigPoly n a b θ| ≤ M / (n : ℝ) ^ ((r : ℝ) + α)) :
    ContDiff ℝ r g ∧ ∃ C : ℝ, ∀ θ₁ θ₂,
      |iteratedDeriv r g θ₁ - iteratedDeriv r g θ₂| ≤ C * |θ₁ - θ₂| ^ α := by
  sorry

/-- 6.3 The inverse theorem fails at `α = 1`: for every `r` some `C^r` periodic `g` has best
errors `O(n^(-r-1))` while `g^(r)` is not Lipschitz. -/
theorem exists_trigPoly_error_le_not_lipschitz (r : ℕ) :
    ∃ g : ℝ → ℝ, Function.Periodic g (2 * π) ∧ ContDiff ℝ r g ∧
      (∃ M : ℝ, ∀ n : ℕ, 1 ≤ n → ∃ a b : ℕ → ℝ, ∀ θ,
        |g θ - trigPoly n a b θ| ≤ M / (n : ℝ) ^ (r + 1)) ∧
      ¬ ∃ C : NNReal, LipschitzWith C (iteratedDeriv r g) := by
  sorry

end Jackson

/-! ## Layer 7: best rational approximation -/

section Rational

/-- 7.1 The defect of a rational function in `R_{mn}`: `min (m - μ) (n - ν)` for exact type
`(μ, ν)`, and `n` for `r = 0`. -/
def rationalDefect {K : Type*} [Field K] (m n : ℕ) (r : RatFunc K) : ℕ :=
  if r = 0 then n else min (m - r.num.natDegree) (n - r.denom.natDegree)

/-- 7.1 `r` lies in `R_{mn}` and has no pole on `[a, b]`. -/
def IsRationalOn (a b : ℝ) (m n : ℕ) (r : RatFunc ℝ) : Prop :=
  r.num.natDegree ≤ m ∧ r.denom.natDegree ≤ n ∧ ∀ x ∈ Icc a b, r.denom.eval x ≠ 0

/-- 7.1 The real rational functions of type `(m, n)` without poles in `[a, b]`, as continuous
functions on `[a, b]`. -/
def rationalSet (a b : ℝ) (m n : ℕ) : Set C(Icc a b, ℝ) :=
  {g | ∃ r : RatFunc ℝ, IsRationalOn a b m n r ∧
    ∀ x : Icc a b, g x = r.num.eval (x : ℝ) / r.denom.eval (x : ℝ)}

/-- 7.2 Existence and uniqueness of the best real rational approximation of type `(m, n)` on
`[a, b]`. -/
theorem exists_best_rational_uniform {a b : ℝ} (m n : ℕ) (f : C(Icc a b, ℝ)) :
    ∃! g, g ∈ rationalSet a b m n ∧ ‖f - g‖ = Metric.infDist f (rationalSet a b m n) := by
  sorry

/-- 7.2 Characterization with the defect: a pole-free `r ∈ R_{mn}` is the best approximation iff
`f - r` equioscillates between `m + n + 2 - d` extreme points, `d` the defect of `r`. -/
theorem norm_sub_eq_infDist_rationalSet_iff {a b : ℝ} (hab : a < b) (m n : ℕ)
    (f : C(Icc a b, ℝ)) {r : RatFunc ℝ} (hr : IsRationalOn a b m n r) {g : C(Icc a b, ℝ)}
    (hg : ∀ x : Icc a b, g x = r.num.eval (x : ℝ) / r.denom.eval (x : ℝ)) :
    ‖f - g‖ = Metric.infDist f (rationalSet a b m n) ↔
      Equioscillates (f - g) (m + n + 2 - rationalDefect m n r) := by
  sorry

end Rational

/-! ## Layer 8: Padé approximants and the Padé table -/

section Pade

variable {K : Type*} [Field K]

open PowerSeries in
/-- 8.1 `(p, q)` is a Padé pair of type `(m, n)` for `f`: degree bounds, `q ≠ 0`, and
`p - f q = O(z^(m+n+1))`. -/
def IsPadePair (f : PowerSeries K) (m n : ℕ) (p q : K[X]) : Prop :=
  p.natDegree ≤ m ∧ q.natDegree ≤ n ∧ q ≠ 0 ∧
    PowerSeries.X ^ (m + n + 1) ∣ (p : PowerSeries K) - f * (q : PowerSeries K)

/-- 8.1 The Padé approximant `r_{mn}` (Frobenius–Trefethen convention): the quotient of any Padé
pair; `0` if no pair exists (which 8.2 excludes). -/
def pade (f : PowerSeries K) (m n : ℕ) : RatFunc K :=
  if h : ∃ pq : K[X] × K[X], IsPadePair f m n pq.1 pq.2 then
    algebraMap K[X] (RatFunc K) h.choose.1 / algebraMap K[X] (RatFunc K) h.choose.2
  else 0

/-- 8.1 The Baker approximant `[m/n]`: `A/B` with `B(0) = 1` and `A/B - f = O(z^(m+n+1))`. -/
def IsBakerPade (f : PowerSeries K) (m n : ℕ) (A B : K[X]) : Prop :=
  A.natDegree ≤ m ∧ B.natDegree ≤ n ∧ B.eval 0 = 1 ∧
    PowerSeries.X ^ (m + n + 1) ∣ (A : PowerSeries K) - f * (B : PowerSeries K)

/-- 8.1 The coefficient `c_k` of `f` at an integer index, `0` for `k < 0`. -/
def coeffZ (f : PowerSeries K) (k : ℤ) : K :=
  if k < 0 then 0 else PowerSeries.coeff k.toNat f

/-- 8.1 The Hankel matrix of Baker–Graves-Morris (4.8), zero-based: entries `c_{m-n+i+j+1}`. -/
def padeHankel (f : PowerSeries K) (m n : ℕ) : Matrix (Fin n) (Fin n) K :=
  Matrix.of fun i j => coeffZ f ((m : ℤ) - n + i + j + 1)

/-- 8.2 Padé pairs exist, and any two define the same rational function. -/
theorem exists_padePair_and_eq_cross (f : PowerSeries K) (m n : ℕ) :
    ∃ p q : K[X], IsPadePair f m n p q ∧
      ∀ P Q : K[X], IsPadePair f m n P Q → p * Q = P * q := by
  sorry

/-- 8.2 Lowest terms: `r_{mn} = p̂/q̂` with `q̂(0) ≠ 0`, of type `(m, n)`, and every Padé pair is
`(π p̂, π q̂)` with `deg π` at most the defect. -/
theorem pade_lowest_terms (f : PowerSeries K) (m n : ℕ) :
    (pade f m n).denom.eval 0 ≠ 0 ∧ (pade f m n).num.natDegree ≤ m ∧
      (pade f m n).denom.natDegree ≤ n ∧
      ∀ p q : K[X], IsPadePair f m n p q → ∃ c : K[X],
        c.natDegree ≤ rationalDefect m n (pade f m n) ∧
          p = c * (pade f m n).num ∧ q = c * (pade f m n).denom := by
  sorry

/-- 8.3 Characterization (Trefethen, Thm 27.1): `r ∈ R_{mn}` with `r` regular at `0` is `r_{mn}`
iff `f - r = O(z^(m+n+1-d))`, `d` the defect of `r`. -/
theorem eq_pade_iff (f : PowerSeries K) (m n : ℕ) {r : RatFunc K}
    (hnum : r.num.natDegree ≤ m) (hden : r.denom.natDegree ≤ n) (h0 : r.denom.eval 0 ≠ 0) :
    r = pade f m n ↔
      PowerSeries.X ^ (m + n + 1 - rationalDefect m n r) ∣
        (r.num : PowerSeries K) - f * (r.denom : PowerSeries K) := by
  sorry

/-- 8.4 The Baker approximant exists iff `f - r_{mn} = O(z^(m+n+1))`, and then it is `r_{mn}`; it
exists whenever the Hankel determinant `C(m/n)` is nonzero. -/
theorem exists_isBakerPade_iff (f : PowerSeries K) (m n : ℕ) :
    ((∃ A B : K[X], IsBakerPade f m n A B) ↔
      PowerSeries.X ^ (m + n + 1) ∣
        ((pade f m n).num : PowerSeries K) - f * ((pade f m n).denom : PowerSeries K)) ∧
    (∀ A B : K[X], IsBakerPade f m n A B →
      algebraMap K[X] (RatFunc K) A / algebraMap K[X] (RatFunc K) B = pade f m n) ∧
    ((padeHankel f m n).det ≠ 0 → ∃ A B : K[X], IsBakerPade f m n A B) := by
  sorry

/-- 8.5 The block structure: if a nonzero table entry `r` of exact type `(λ, μ)` has
`f - r` of exact order `λ + μ + k + 1`, then `r_{mn} = r` exactly on the square
`λ ≤ m ≤ λ + k`, `μ ≤ n ≤ μ + k`, and there the Baker approximant exists exactly when
`m + n ≤ λ + μ + k`. -/
theorem pade_eq_iff_mem_block (f : PowerSeries K) {m₀ n₀ k : ℕ} (hr : pade f m₀ n₀ ≠ 0)
    (hord : ((((pade f m₀ n₀).num : PowerSeries K) -
        f * ((pade f m₀ n₀).denom : PowerSeries K)).order : ℕ∞) =
      ((pade f m₀ n₀).num.natDegree + (pade f m₀ n₀).denom.natDegree + k + 1 : ℕ)) (m n : ℕ) :
    (pade f m n = pade f m₀ n₀ ↔
      ((pade f m₀ n₀).num.natDegree ≤ m ∧ m ≤ (pade f m₀ n₀).num.natDegree + k ∧
        (pade f m₀ n₀).denom.natDegree ≤ n ∧ n ≤ (pade f m₀ n₀).denom.natDegree + k)) ∧
    (pade f m n = pade f m₀ n₀ →
      ((∃ A B : K[X], IsBakerPade f m n A B) ↔
        m + n ≤ (pade f m₀ n₀).num.natDegree + (pade f m₀ n₀).denom.natDegree + k)) := by
  sorry

/-- 8.5 A rational `f = p₀/q₀` (lowest terms, exact type `(λ, μ)`, `q₀(0) ≠ 0`) is its own Padé
approximant for all `m ≥ λ`, `n ≥ μ`. -/
theorem pade_eq_of_rational (f : PowerSeries K) {p₀ q₀ : K[X]} (hcop : IsCoprime p₀ q₀)
    (hq₀ : q₀.eval 0 ≠ 0) (hf : f * (q₀ : PowerSeries K) = (p₀ : PowerSeries K)) {m n : ℕ}
    (hm : p₀.natDegree ≤ m) (hn : q₀.natDegree ≤ n) :
    pade f m n = algebraMap K[X] (RatFunc K) p₀ / algebraMap K[X] (RatFunc K) q₀ := by
  sorry

end Pade

/-! ## Layer 9: the theorem of de Montessus de Ballore -/

section Montessus

/-- 9.1 The Maclaurin series of `f` at `0`. -/
def maclaurin (f : ℂ → ℂ) : PowerSeries ℂ :=
  PowerSeries.mk fun k => iteratedDeriv k f 0 / k.factorial

/-- 9.1 de Montessus de Ballore: let `f = H/Q` on the closed disk of radius `R`, with `H` analytic
there, `Q(0) ≠ 0`, `deg Q = M`, the zeros of `Q` (of any multiplicity) in the open disk and `H`
nonzero at them. Then
the Baker approximants `[L/M]` exist for large `L` and converge to `f` uniformly on compact
subsets of the closed disk avoiding the poles. -/
theorem exists_pade_row_tendstoUniformlyOn {f H : ℂ → ℂ} {Q : ℂ[X]} {R : ℝ} (hR : 0 < R)
    (hQ0 : Q.eval 0 ≠ 0) (hroot : ∀ z, Q.eval z = 0 → ‖z‖ < R ∧ H z ≠ 0)
    (hH : AnalyticOnNhd ℂ H (Metric.closedBall 0 R))
    (hf : ∀ z ∈ Metric.closedBall (0 : ℂ) R, Q.eval z ≠ 0 → f z = H z / Q.eval z) :
    (∀ᶠ L in atTop, ∃ A B : ℂ[X], IsBakerPade (maclaurin f) L Q.natDegree A B) ∧
    ∀ A B : ℕ → ℂ[X], (∀ᶠ L in atTop, IsBakerPade (maclaurin f) L Q.natDegree (A L) (B L)) →
      ∀ S : Set ℂ, IsCompact S → S ⊆ Metric.closedBall 0 R → (∀ z ∈ S, Q.eval z ≠ 0) →
        TendstoUniformlyOn (fun L z => (A L).eval z / (B L).eval z) f atTop S := by
  sorry

end Montessus

/-! ## Layer 10: Stieltjes series -/

section Stieltjes

/-- 10.1 The Stieltjes function `z ↦ ∫ dμ(u) / (1 + z u)` of a measure on `[0, ∞)`. -/
def stieltjesFun (μ : Measure ℝ) (z : ℂ) : ℂ :=
  ∫ u, (1 + z * u)⁻¹ ∂μ

/-- 10.1 The Stieltjes series `∑ⱼ (-1)ʲ μⱼ zʲ`, `μⱼ` the moments of `μ`. -/
def stieltjesSeries (μ : Measure ℝ) : PowerSeries ℝ :=
  PowerSeries.mk fun j => (-1) ^ j * ∫ u, u ^ j ∂μ

/-- 10.1 The Stieltjes function is analytic off `(-∞, 0]` and the Stieltjes series is its
expansion with the exact remainder `(-z)^N ∫ uᴺ/(1 + zu) dμ`. -/
theorem analyticOnNhd_stieltjesFun {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ)
    (hpos : ∀ᵐ u ∂μ, 0 ≤ u) :
    AnalyticOnNhd ℂ (stieltjesFun μ) Complex.slitPlane ∧
      ∀ z ∈ Complex.slitPlane, ∀ N : ℕ, stieltjesFun μ z =
        ∑ j ∈ Finset.range N, (-z) ^ j * ((∫ u, u ^ j ∂μ : ℝ) : ℂ) +
          (-z) ^ N * ∫ u, (u : ℂ) ^ N * (1 + z * u)⁻¹ ∂μ := by
  sorry

/-- 10.2 Every Baker approximant `[L/M]` of a Stieltjes series with `M ≤ L + 1` exists. -/
theorem exists_padePair_of_stieltjes {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ)
    (hpos : ∀ᵐ u ∂μ, 0 ≤ u) {L M : ℕ} (hLM : M ≤ L + 1) :
    ∃ A B : ℝ[X], IsBakerPade (stieltjesSeries μ) L M A B := by
  sorry

/-- 10.2 For `M ≤ L + 1` the poles of `[L/M]` are simple, negative, with positive residues:
`B = B.leadingCoeff · ∏ (X - tᵢ)` with `t` strictly increasing and negative, and
`A(tᵢ)/B'(tᵢ) > 0`. -/
theorem poles_isBakerPade_stieltjesSeries {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ)
    (hpos : ∀ᵐ u ∂μ, 0 ≤ u) {L M : ℕ} (hLM : M ≤ L + 1) {A B : ℝ[X]}
    (hAB : IsBakerPade (stieltjesSeries μ) L M A B) :
    B.natDegree = M ∧ ∃ t : Fin M → ℝ, StrictMono t ∧ (∀ i, t i < 0) ∧
      B = C B.leadingCoeff * ∏ i, (X - C (t i)) ∧
      ∀ i, 0 < A.eval (t i) / B.derivative.eval (t i) := by
  sorry

/-- 10.3 For fixed `j` the paradiagonal Baker approximants `[M + j - 1 / M]` (`J = j - 1 ≥ -1`)
converge, uniformly on every bounded set at positive distance from `(-∞, 0]`, to a function
analytic off `(-∞, 0]`. -/
theorem tendstoUniformlyOn_isBakerPade_stieltjesSeries {μ : Measure ℝ}
    (hμ : IsOrthogonalityMeasure μ) (hpos : ∀ᵐ u ∂μ, 0 ≤ u) (j : ℕ) (A B : ℕ → ℝ[X])
    (hAB : ∀ M, 1 ≤ M → IsBakerPade (stieltjesSeries μ) (M + j - 1) M (A M) (B M)) :
    ∃ F : ℂ → ℂ, AnalyticOnNhd ℂ F Complex.slitPlane ∧
      ∀ D : Set ℂ, Bornology.IsBounded D →
        (∃ δ > 0, ∀ z ∈ D, ∀ t : ℝ, t ≤ 0 → δ ≤ ‖z - t‖) →
          TendstoUniformlyOn (fun M z => aeval z (A M) / aeval z (B M)) F atTop D := by
  sorry

/-- 10.4 Positive radius: if `μ` is concentrated on `[0, 1/R]`, the paradiagonal approximants
converge to the Stieltjes function and their poles lie in `(-∞, -R)`. -/
theorem tendstoUniformlyOn_stieltjesFun_of_radius {μ : Measure ℝ} (hμ : IsOrthogonalityMeasure μ)
    (hpos : ∀ᵐ u ∂μ, 0 ≤ u) {R : ℝ} (hR : 0 < R) (hsupp : ∀ᵐ u ∂μ, u ≤ 1 / R) (j : ℕ)
    (A B : ℕ → ℝ[X])
    (hAB : ∀ M, 1 ≤ M → IsBakerPade (stieltjesSeries μ) (M + j - 1) M (A M) (B M)) :
    (∀ M, 1 ≤ M → ∀ t : ℝ, (B M).eval t = 0 → t < -R) ∧
      ∀ D : Set ℂ, Bornology.IsBounded D →
        (∃ δ > 0, ∀ z ∈ D, ∀ t : ℝ, t ≤ 0 → δ ≤ ‖z - t‖) →
          TendstoUniformlyOn (fun M z => aeval z (A M) / aeval z (B M)) (stieltjesFun μ)
            atTop D := by
  sorry

/-- 10.4 Carleman's condition `∑ μⱼ^(-1/(2j)) = ∞` gives convergence to the Stieltjes function. -/
theorem tendstoUniformlyOn_stieltjesFun_of_carleman {μ : Measure ℝ}
    (hμ : IsOrthogonalityMeasure μ) (hpos : ∀ᵐ u ∂μ, 0 ≤ u)
    (hcar : ¬ Summable fun j : ℕ => (∫ u, u ^ (j + 1) ∂μ) ^ (-(1 / (2 * ((j : ℝ) + 1)))))
    (j : ℕ) (A B : ℕ → ℝ[X])
    (hAB : ∀ M, 1 ≤ M → IsBakerPade (stieltjesSeries μ) (M + j - 1) M (A M) (B M)) :
    ∀ D : Set ℂ, Bornology.IsBounded D →
      (∃ δ > 0, ∀ z ∈ D, ∀ t : ℝ, t ≤ 0 → δ ≤ ‖z - t‖) →
        TendstoUniformlyOn (fun M z => aeval z (A M) / aeval z (B M)) (stieltjesFun μ) atTop D := by
  sorry

end Stieltjes

/-! ## Upstream declarations named in the README -/

#check @Polynomial.Chebyshev.T_real_cos
#check @Polynomial.Chebyshev.node
#check @Polynomial.Chebyshev.measureT
#check @Polynomial.Chebyshev.integral_measureT_eq_integral_cos
#check @Polynomial.toContinuousMapOnAlgHom
#check @Polynomial.degreeLT
#check @Matrix.det_vandermonde_ne_zero_iff
#check @Lagrange.basis
#check @Lagrange.interpolate
#check @Metric.infDist
#check @fourier
#check @AbsolutelyContinuousOnInterval
#check @eVariationOn
#check @Complex.slitPlane
#check @RatFunc.num
#check @RatFunc.denom
#check @PowerSeries.order
#check @banach_steinhaus
#check @TauCeti.chebyshevTHilbertBasis
#check @TauCeti.hasSum_chebyshevT_expansion

end TauCetiRoadmap.ChebyshevSeriesAndRationalApproximation
