/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.GroupTheory.Perm.OrbitCount.Basic
import TauCeti.Probability.FreeProbability.Cumulant.Basic
import TauCeti.Probability.FreeProbability.Cumulant.Series
import TauCeti.Probability.FreeProbability.Independence
import TauCeti.Probability.FreeProbability.Semicircular.Basic
import TauCeti.Probability.FreeProbability.Variables
import TauCeti.RepresentationTheory.Compact.Haar
import TauCeti.Topology.Algebra.UnitaryGroup

/-!
# Free probability: target signatures

This file is not the roadmap: the roadmap is `README.md`, which is the definitive specification,
and every target, API list and Check lives there. This file states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each admitted with `sorry`, together with
the few definitions their statements need.

The headline theorems of the roadmap, with the README section that states each:

* §3.5, faithfulness of reduced free product states (Dykema): the vacuum state of the reduced
  free product of unital C*-algebras with faithful states is faithful, and tracial inputs give a
  trace. Not statable at the pins: neither library has the free product of pointed Hilbert
  spaces or the reduced free product of C*-algebras.
* §6.2, free group factors from the free Gaussian functor: `Γ(H) ≅ L(F_dim H)`. Not statable:
  the pins have neither group von Neumann algebras nor the free Gaussian functor.
* §4.6, tracial amalgamated free products of finite von Neumann algebras and the faithfulness of
  their expectations. Not statable: the pins have no C*-conditional expectations, no interior
  tensor products of Hilbert modules and no normal states on von Neumann algebras.
* §5.6, multiplicativity of the S-transform for free variables with nonzero means: stated below
  as `sSeries_momentSeries_mul`, on the S-series `sSeries`.
* §5.1, §5.7 and §6.7, additivity of the R-transform under free additive convolution, the free
  multiplicative convolution and the free Lévy–Khintchine theorem. Not statable: free additive
  and multiplicative convolution of measures are laws of sums and products of free realizations,
  and the pins have no free product in which to realize them.
* §7.1, compression of free cumulants by a free projection: stated below as
  `freeCumulant_mul_mul_eq_pow_mul_freeCumulant`.
* §7.5, the polar decomposition of an injective R-diagonal element of a finite von Neumann
  algebra. Not statable: the pins have no normal traces on von Neumann algebras.
* §8.4, asymptotic freeness of independent GUE matrices from deterministic matrices with
  convergent star-moments, without a norm bound: stated below as
  `tendsto_integral_trace_gueMatrix_word`, on the GUE matrix `gueMatrix`.
* §8.5, the large-`N` asymptotics of the unitary Weingarten function: stated below as
  `isBigO_pow_mul_weingarten_sub`, on `permGram` and `weingarten`.
* §8.6, asymptotic freeness of Haar-conjugated deterministic matrices: stated below as
  `tendsto_integral_trace_haar_conj_word`.

The pinned Tau Ceti already proves three further results the README builds on, which are
therefore not restated here: freeness is the vanishing of mixed free cumulants
(`TauCeti.isFreelyIndependent_iff_freeCumulant_eq_zero`), the free cumulants of products of two
free families are given by the Kreweras complement
(`TauCeti.IsFreelyIndependent.freeCumulant_mul_eq_sum_partitionCumulant_mul_partitionCumulant`),
and the free central limit theorem in moments and in law
(`TauCeti.IsFreelyIndependentElements.tendsto_apply_inv_sqrt_smul_sum_pow_semicircleReal`,
`TauCeti.IsFreelyIndependentElements.tendsto_law_inv_sqrt_smul_sum_semicircleReal`).
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Topology Asymptotics

namespace TauCetiRoadmap.FreeProbability

/-! ## Layer 5: free convolution, formal series and scalar transforms -/

/-- The S-series `S(z) = (1 + z) Ψ^⟨-1⟩(z) / z` of a power series `Ψ` whose linear coefficient is
a unit. For `Ψ = M - 1`, with `M` the moment series of a variable of nonzero mean, this is its
S-transform (Nica–Speicher, Lectures 16–18). The inverse is Mathlib's compositional inverse
`PowerSeries.substInvOfIsUnit`, and division by `z` shifts its coefficients down, the constant
coefficient of the inverse being zero. -/
def sSeries (Ψ : PowerSeries ℂ) (hmean : IsUnit (PowerSeries.coeff 1 Ψ)) : PowerSeries ℂ :=
  (1 + PowerSeries.X) *
    PowerSeries.mk (fun n => PowerSeries.coeff (n + 1) (Ψ.substInvOfIsUnit hmean))

/-- **Multiplicativity of the S-transform.** If `a` and `b` are free with respect to a normalized
linear functional `φ` and have nonzero means, then `S_{ab} = S_a S_b`, where `S_x` is the S-series
of `M_x - 1` and `M_x` the moment series of `x`. No trace and no positivity is assumed. The unit
hypothesis on `ab` holds automatically, since freeness gives `φ (a * b) = φ a * φ b`
(Nica–Speicher, Lectures 16–18). -/
theorem sSeries_momentSeries_mul {A : Type*} [Ring A] [Algebra ℂ A] (φ : A →ₗ[ℂ] ℂ)
    (hφ : φ 1 = 1) {a b : A} (hab : TauCeti.IsFreelyIndependentElements φ ![a, b])
    (ha : IsUnit (PowerSeries.coeff 1 (TauCeti.momentSeries φ a - 1)))
    (hb : IsUnit (PowerSeries.coeff 1 (TauCeti.momentSeries φ b - 1)))
    (hmul : IsUnit (PowerSeries.coeff 1 (TauCeti.momentSeries φ (a * b) - 1))) :
    sSeries (TauCeti.momentSeries φ (a * b) - 1) hmul =
      sSeries (TauCeti.momentSeries φ a - 1) ha * sSeries (TauCeti.momentSeries φ b - 1) hb := by
  sorry

/-! ## Layer 7: compression, circular and R-diagonal elements -/

/-- **Compression by a free projection.** Let `φ` be a normalized linear functional, `p` an
idempotent with `t = φ p ≠ 0`, and `a₁, …, aₙ` elements such that the unital algebras generated
by `p` and by the `aᵢ` are free. In the compressed space `(pAp, t⁻¹ φ)` the free cumulants of the
compressed letters are `κₙ(p a₁ p, …, p aₙ p) = t ^ (n - 1) κₙ(a₁, …, aₙ)`. The compressed
cumulants are computed with the functional `x ↦ t⁻¹ φ x` on products of compressed letters, which
lie in `pAp`. No trace and no positivity is assumed (Nica–Speicher, Theorem 14.10). -/
theorem freeCumulant_mul_mul_eq_pow_mul_freeCumulant {A : Type*} [Ring A] [Algebra ℂ A]
    (φ : A →ₗ[ℂ] ℂ) (hφ : φ 1 = 1) {p : A} (hp : IsIdempotentElem p) (hp0 : φ p ≠ 0) {n : ℕ}
    (a : Fin n → A)
    (hfree : TauCeti.IsFreelyIndependent φ ![Algebra.adjoin ℂ {p}, Algebra.adjoin ℂ (Set.range a)]) :
    TauCeti.freeCumulant (fun x => (φ p)⁻¹ * φ x) (fun i => p * a i * p) Finset.univ =
      φ p ^ (n - 1) * TauCeti.freeCumulant φ a Finset.univ := by
  sorry

/-! ## Layer 8: Gaussian and Haar random-matrix asymptotic freeness -/

/-- The `N × N` GUE matrix built from real coordinates `g`, in the normalization of
RandomMatrices §5.1 at `β = 2`: the diagonal entry `(j, j)` is `g j j / √N`, the entry `(j, k)`
with `j < k` is `(g j k + i g k j) / √(2N)`, and the entries below the diagonal are the conjugates.
For independent standard Gaussian coordinates the diagonal entries are `N(0, 1/N)` and the real
and imaginary parts of the entries above the diagonal are `N(0, 1/(2N))`. -/
def gueMatrix (N : ℕ) (g : Fin N → Fin N → ℝ) : Matrix (Fin N) (Fin N) ℂ :=
  Matrix.of fun j k => ((Real.sqrt N)⁻¹ : ℂ) *
    if j = k then (g j j : ℂ)
    else if j < k then ((g j k : ℂ) + Complex.I * g k j) / Real.sqrt 2
    else ((g k j : ℂ) - Complex.I * g j k) / Real.sqrt 2

/-- **Asymptotic freeness of GUE matrices from deterministic matrices.** For every `N` let the
real coordinates `g N i j k` be independent standard Gaussians, so that `gueMatrix N (g N i · ·)`,
`i ∈ ι`, are independent GUE matrices, and let `D N` be a family of deterministic `N × N` matrices
whose normalized-trace star-moments converge to those of a family `d` in an algebra with
normalized functional `ψ`. Let `s` be selfadjoint standard semicircular elements such that the
unital algebras generated by the `s i` and the star algebra generated by `d` are free. Then the
expected normalized trace of every word in the GUE matrices, the `D N` and their adjoints
converges to `ψ` of the corresponding word in `s`, `d` and their adjoints. No bound on the operator
norms of the `D N` is assumed (Nica–Speicher, Theorem 22.35). -/
theorem tendsto_integral_trace_gueMatrix_word {Ω ι κ : Type*} [MeasurableSpace Ω]
    {P : Measure Ω} [IsProbabilityMeasure P]
    (g : (N : ℕ) → ι → Fin N → Fin N → Ω → ℝ)
    (hg_meas : ∀ N i j k, Measurable (g N i j k))
    (hg_indep : ∀ N, iIndepFun (fun c : ι × Fin N × Fin N => g N c.1 c.2.1 c.2.2) P)
    (hg_law : ∀ N i j k, P.map (g N i j k) = gaussianReal 0 1)
    (D : (N : ℕ) → κ → Matrix (Fin N) (Fin N) ℂ)
    {B : Type*} [Ring B] [StarRing B] [Algebra ℂ B] [StarModule ℂ B]
    (ψ : B →ₗ[ℂ] ℂ) (hψ : ψ 1 = 1) (s : ι → B) (d : κ → B)
    (hs : ∀ i, IsSelfAdjoint (s i)) (hsc : ∀ i, TauCeti.IsSemicircular ψ (s i) 1)
    (hfree : TauCeti.IsFreelyIndependent ψ fun o : Option ι =>
      o.elim (StarAlgebra.adjoin ℂ (Set.range d)).toSubalgebra fun i => Algebra.adjoin ℂ {s i})
    (hD : ∀ w : List (κ × Bool),
      Tendsto (fun N : ℕ => (N : ℂ)⁻¹ *
          ((w.map fun x : κ × Bool => if x.2 then star (D N x.1) else D N x.1).prod).trace)
        atTop (𝓝 (ψ (w.map fun x : κ × Bool => if x.2 then star (d x.1) else d x.1).prod)))
    (w : List ((ι ⊕ κ) × Bool)) :
    Tendsto (fun N : ℕ => ∫ ω, (N : ℂ)⁻¹ *
        ((w.map fun x : (ι ⊕ κ) × Bool => Sum.elim (fun i => gueMatrix N fun j k => g N i j k ω)
          (fun c => if x.2 then star (D N c) else D N c) x.1).prod).trace ∂P) atTop
      (𝓝 (ψ (w.map fun x : (ι ⊕ κ) × Bool =>
        Sum.elim s (fun c => if x.2 then star (d c) else d c) x.1).prod)) := by
  sorry

/-- The Gram matrix of the permutation operators on `(ℂ^N)^{⊗k}` for the trace inner product:
`permGram N k σ τ = N ^ #cycles(σ⁻¹ τ)`, cycles counted with fixed points. -/
def permGram (N k : ℕ) : Matrix (Equiv.Perm (Fin k)) (Equiv.Perm (Fin k)) ℚ :=
  Matrix.of fun σ τ => (N : ℚ) ^ TauCeti.orbitCount (σ⁻¹ * τ)

/-- The unitary Weingarten function `Wg(N, σ)`: the entry `(1, σ)` of the inverse of `permGram N k`.
For `N ≥ k` the Gram matrix is invertible; for `N < k` it is singular and Mathlib's inverse, and
hence this value, is zero. -/
def weingarten (N k : ℕ) (σ : Equiv.Perm (Fin k)) : ℚ :=
  (permGram N k)⁻¹ 1 σ

/-- **Weingarten asymptotics.** For fixed `σ ∈ S_k`,
`Wg(N, σ) = N ^ (#cycles(σ) - 2k) (Möb(σ) + O(N⁻²))` as `N → ∞`, where
`Möb(σ) = ∏_{cycles C} (-1) ^ (|C| - 1) catalan (|C| - 1)`; fixed points contribute the factor `1`
(Collins–Śniady, Corollary 2.7). -/
theorem isBigO_pow_mul_weingarten_sub (k : ℕ) (σ : Equiv.Perm (Fin k)) :
    (fun N : ℕ => (N : ℝ) ^ (2 * k - TauCeti.orbitCount σ) * (weingarten N k σ : ℝ) -
        (σ.cycleType.map fun l => (-1 : ℝ) ^ (l - 1) * catalan (l - 1)).prod) =O[atTop]
      fun N : ℕ => ((N : ℝ) ^ 2)⁻¹ := by
  sorry

/-- **Asymptotic freeness of Haar-conjugated matrices.** Let `U N` be Haar distributed on the
unitary group `U(N)`, and let `A N` and `D N` be families of deterministic `N × N` matrices whose
separate normalized-trace star-moments converge to those of families `a` and `d` in an algebra with
normalized functional `ψ`, in which the star algebras generated by `a` and by `d` are free. Then
the expected normalized trace of every word in the conjugates `U A U*`, the `D N` and their
adjoints converges to `ψ` of the corresponding word in `a`, `d` and their adjoints. Neither a joint
limit of `A N` and `D N` nor a bound on their operator norms is assumed (Nica–Speicher,
Theorem 23.14; Collins, Theorem 3.1). -/
theorem tendsto_integral_trace_haar_conj_word {Ω ι κ : Type*} [MeasurableSpace Ω]
    {P : Measure Ω} [IsProbabilityMeasure P]
    (U : (N : ℕ) → Ω → Matrix.unitaryGroup (Fin N) ℂ) (hU : ∀ N, Measurable (U N))
    (hU_law : ∀ N, P.map (U N) = TauCeti.haarProb (Matrix.unitaryGroup (Fin N) ℂ))
    (A : (N : ℕ) → ι → Matrix (Fin N) (Fin N) ℂ) (D : (N : ℕ) → κ → Matrix (Fin N) (Fin N) ℂ)
    {B : Type*} [Ring B] [StarRing B] [Algebra ℂ B] [StarModule ℂ B]
    (ψ : B →ₗ[ℂ] ℂ) (hψ : ψ 1 = 1) (a : ι → B) (d : κ → B)
    (hfree : TauCeti.IsFreelyIndependent ψ
      ![(StarAlgebra.adjoin ℂ (Set.range a)).toSubalgebra,
        (StarAlgebra.adjoin ℂ (Set.range d)).toSubalgebra])
    (hA : ∀ w : List (ι × Bool),
      Tendsto (fun N : ℕ => (N : ℂ)⁻¹ *
          ((w.map fun x : ι × Bool => if x.2 then star (A N x.1) else A N x.1).prod).trace)
        atTop (𝓝 (ψ (w.map fun x : ι × Bool => if x.2 then star (a x.1) else a x.1).prod)))
    (hD : ∀ w : List (κ × Bool),
      Tendsto (fun N : ℕ => (N : ℂ)⁻¹ *
          ((w.map fun x : κ × Bool => if x.2 then star (D N x.1) else D N x.1).prod).trace)
        atTop (𝓝 (ψ (w.map fun x : κ × Bool => if x.2 then star (d x.1) else d x.1).prod)))
    (w : List ((ι ⊕ κ) × Bool)) :
    Tendsto (fun N : ℕ => ∫ ω, (N : ℂ)⁻¹ *
        ((w.map fun x : (ι ⊕ κ) × Bool => Sum.elim
          (fun i => (U N ω : Matrix (Fin N) (Fin N) ℂ) *
            (if x.2 then star (A N i) else A N i) * star (U N ω : Matrix (Fin N) (Fin N) ℂ))
          (fun c => if x.2 then star (D N c) else D N c) x.1).prod).trace ∂P) atTop
      (𝓝 (ψ (w.map fun x : (ι ⊕ κ) × Bool => Sum.elim (fun i => if x.2 then star (a i) else a i)
          (fun c => if x.2 then star (d c) else d c) x.1).prod)) := by
  sorry

end TauCetiRoadmap.FreeProbability
