module

public import Mathlib
public import TauCeti.Analysis.Fredholm.CompactPerturbation
public import TauCeti.Analysis.Normed.Ring.Units

/-!
# Second-kind integral equations: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The bullets of the README without a
Lean name are definitions given in prose, results supplied by Mathlib, Tau Ceti or another
roadmap, or corollaries stated in prose; they are targets of the same standing. Three statements
that close by unfolding a definition and one or two library lemmas are proved here as sanity
checks: `nystromOperator_apply`, `IsCompactOperator.zero_mem_spectrum` and
`nystrom_iff_nodal_system`.

Conventions (README, Conventions). Scalars are `RCLike 𝕜`, operators are continuous linear maps
with the operator norm, and inverses are `Ring.inverse`, which is `0` at a non-unit; every
statement that uses an inverse also states the invertibility. The second-kind equation is
`φ - A φ = f` (Kress's form) in Layers 2, 3, 5 and in 4.3, and `(lam • 1 - K) x = y`
(Atkinson's form) in 4.2. Function spaces on a compact metric space `G` are `C(G, 𝕜)` with the
sup norm; an integral operator with kernel `k` against a measure `μ` is an operator `A` with
`IsKernelOperator μ k A`. Volterra equations are real, on `[0, T]`, with kernels continuous on
the closed triangle `volterraTriangle T`; the weakly singular factor `(t - s) ^ (-α)` is
`Real.rpow`, whose junk value at `s = t` is a single point and does not affect an integral.

The implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace. The `#check` lines at the end of the file pin the Mathlib and Tau Ceti declarations that
the README names as suppliers.
-/

@[expose] public section

noncomputable section

open Filter Topology Set MeasureTheory Polynomial
open scoped NNReal ENNReal

namespace TauCetiRoadmap.SecondKindIntegralEquations

/-! ## Layer 1: compact operators and compact integral operators -/

section Riesz

variable {𝕜 X Y : Type*} [RCLike 𝕜] [NormedAddCommGroup X] [NormedSpace 𝕜 X]
  [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]

/-- **No bounded inverse** (1.1): a compact operator on an infinite-dimensional normed space is
not bounded below. -/
theorem not_exists_norm_le_mul_norm_of_isCompactOperator {A : X →L[𝕜] Y}
    (hA : IsCompactOperator A) (hX : ¬ FiniteDimensional 𝕜 X) :
    ¬ ∃ C : ℝ, ∀ x, ‖x‖ ≤ C * ‖A x‖ := by
  sorry

/-- **`0` is a spectral value** (1.1) of a compact operator on an infinite-dimensional normed
space; proved here as a sanity check (a unit `A` would make the identity `A⁻¹ A` compact). -/
theorem IsCompactOperator.zero_mem_spectrum {A : X →L[𝕜] X} (hA : IsCompactOperator A)
    (hX : ¬ FiniteDimensional 𝕜 X) : (0 : 𝕜) ∈ spectrum 𝕜 A := by
  rw [spectrum.zero_mem_iff]
  rintro ⟨u, hu⟩
  apply hX
  have h1 : IsCompactOperator ((↑u⁻¹ : X →L[𝕜] X) ∘L A) := hA.clm_comp _
  have h2 : ((↑u⁻¹ : X →L[𝕜] X) ∘L A) = ContinuousLinearMap.id 𝕜 X := by
    rw [← hu]; exact u.inv_mul
  rw [h2] at h1
  exact isCompactOperator_id_iff_finiteDimensional.mp h1

end Riesz

section KernelOperators

variable {𝕜 : Type*} [RCLike 𝕜]

/-- **Integral operator with kernel `k`** (1.2): `A φ x = ∫ k x y * φ y ∂μ` for every continuous
`φ` and every `x`. -/
def IsKernelOperator {G : Type*} [TopologicalSpace G] [CompactSpace G] [MeasurableSpace G]
    (μ : Measure G) (k : G → G → 𝕜) (A : C(G, 𝕜) →L[𝕜] C(G, 𝕜)) : Prop :=
  ∀ (φ : C(G, 𝕜)) (x : G), A φ x = ∫ y, k x y * φ y ∂μ

variable {G : Type*} [MetricSpace G] [CompactSpace G] [MeasurableSpace G] [BorelSpace G]

/-- **Continuous kernels** (1.2): a continuous kernel defines an integral operator on `C(G, 𝕜)`
for every finite measure, with norm `‖A‖ = sup_x ∫ |k(x, y)| dμ(y)`. -/
theorem exists_isKernelOperator_of_continuous (μ : Measure G) [IsFiniteMeasure μ]
    (k : C(G × G, 𝕜)) :
    ∃ A : C(G, 𝕜) →L[𝕜] C(G, 𝕜), IsKernelOperator μ (fun x y ↦ k (x, y)) A ∧
      ‖A‖ = ⨆ x, ∫ y, ‖k (x, y)‖ ∂μ := by
  sorry

/-- **Compactness for continuous kernels** (1.2) on `C(G, 𝕜)`. -/
theorem isCompactOperator_of_continuousKernel (μ : Measure G) [IsFiniteMeasure μ]
    (k : C(G × G, 𝕜)) {A : C(G, 𝕜) →L[𝕜] C(G, 𝕜)}
    (hA : IsKernelOperator μ (fun x y ↦ k (x, y)) A) : IsCompactOperator A := by
  sorry

/-- **Compactness for weakly singular kernels** (1.3) on `C(G)`, `G ⊆ ℝᵐ` compact, Lebesgue
measure: a kernel continuous off the diagonal with `‖k x y‖ ≤ M |x - y| ^ (α - m)`, `0 < α`,
has integrable sections and defines a compact integral operator. -/
theorem exists_isCompactOperator_of_weaklySingular {m : ℕ}
    (G : Set (EuclideanSpace ℝ (Fin m))) [CompactSpace G]
    (k : EuclideanSpace ℝ (Fin m) → EuclideanSpace ℝ (Fin m) → 𝕜)
    (hk : ContinuousOn (Function.uncurry k) {p | p.1 ∈ G ∧ p.2 ∈ G ∧ p.1 ≠ p.2})
    {M α : ℝ} (hα : 0 < α)
    (hM : ∀ x ∈ G, ∀ y ∈ G, x ≠ y → ‖k x y‖ ≤ M * dist x y ^ (α - m)) :
    (∀ (φ : C(G, 𝕜)) (x : G),
      Integrable (fun y : G ↦ k x y * φ y) (Measure.comap Subtype.val volume)) ∧
    ∃ A : C(G, 𝕜) →L[𝕜] C(G, 𝕜),
      IsKernelOperator (Measure.comap Subtype.val volume) (fun x y : G ↦ k x y) A ∧
      IsCompactOperator A := by
  sorry

end KernelOperators

/-! ## Layer 2: the Fredholm alternative in dual systems -/

section DualSystem

variable {𝕜 X Y : Type*} [RCLike 𝕜] [NormedAddCommGroup X] [NormedSpace 𝕜 X] [CompleteSpace X]
  [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] [CompleteSpace Y]

/-- **First Fredholm theorem** (2.1): for compact operators adjoint in a nondegenerate dual
system, the nullspaces of `1 - A` and `1 - B` are finite dimensional of the same dimension. -/
theorem finrank_ker_one_sub_eq (P : X →ₗ[𝕜] Y →ₗ[𝕜] 𝕜) (hP : P.Nondegenerate)
    {A : X →L[𝕜] X} {B : Y →L[𝕜] Y} (hA : IsCompactOperator A) (hB : IsCompactOperator B)
    (hAB : ∀ x y, P (A x) y = P x (B y)) :
    FiniteDimensional 𝕜 (LinearMap.ker ((1 - A : X →L[𝕜] X) : X →ₗ[𝕜] X)) ∧
      FiniteDimensional 𝕜 (LinearMap.ker ((1 - B : Y →L[𝕜] Y) : Y →ₗ[𝕜] Y)) ∧
      Module.finrank 𝕜 (LinearMap.ker ((1 - A : X →L[𝕜] X) : X →ₗ[𝕜] X)) =
        Module.finrank 𝕜 (LinearMap.ker ((1 - B : Y →L[𝕜] Y) : Y →ₗ[𝕜] Y)) := by
  sorry

/-- **Second Fredholm theorem** (2.1): the ranges of `1 - A` and `1 - B` are the annihilators of
the nullspaces of `1 - B` and `1 - A`. -/
theorem exists_fredholm_solution_iff_pairing (P : X →ₗ[𝕜] Y →ₗ[𝕜] 𝕜) (hP : P.Nondegenerate)
    {A : X →L[𝕜] X} {B : Y →L[𝕜] Y} (hA : IsCompactOperator A) (hB : IsCompactOperator B)
    (hAB : ∀ x y, P (A x) y = P x (B y)) :
    (∀ f : X, (∃ φ, φ - A φ = f) ↔ ∀ ψ, B ψ = ψ → P f ψ = 0) ∧
      ∀ g : Y, (∃ ψ, ψ - B ψ = g) ↔ ∀ φ, A φ = φ → P φ g = 0 := by
  sorry

/-- **The Fredholm alternative** (2.1): injectivity and surjectivity of `1 - A` and of `1 - B`
are four equivalent properties. -/
theorem tfae_injective_surjective_one_sub (P : X →ₗ[𝕜] Y →ₗ[𝕜] 𝕜) (hP : P.Nondegenerate)
    {A : X →L[𝕜] X} {B : Y →L[𝕜] Y} (hA : IsCompactOperator A) (hB : IsCompactOperator B)
    (hAB : ∀ x y, P (A x) y = P x (B y)) :
    List.TFAE [Function.Injective (1 - A : X →L[𝕜] X), Function.Surjective (1 - A : X →L[𝕜] X),
      Function.Injective (1 - B : Y →L[𝕜] Y), Function.Surjective (1 - B : Y →L[𝕜] Y)] := by
  sorry

end DualSystem

section FredholmKernel

variable {𝕜 : Type*} [RCLike 𝕜] {G : Type*} [MetricSpace G] [CompactSpace G] [MeasurableSpace G]
  [BorelSpace G]

/-- **Fredholm's alternative for continuous kernels** (2.2): with `B` the integral operator of
the transposed kernel, `1 - A` is bijective iff `1 - B` is, their nullspaces have the same finite
dimension, and `φ - A φ = f` is solvable iff `∫ f ψ dμ = 0` for every solution of `ψ = B ψ`. No
support condition on the finite measure is needed. -/
theorem fredholm_alternative_continuousKernel (μ : Measure G) [IsFiniteMeasure μ]
    (k : C(G × G, 𝕜)) {A B : C(G, 𝕜) →L[𝕜] C(G, 𝕜)}
    (hA : IsKernelOperator μ (fun x y ↦ k (x, y)) A)
    (hB : IsKernelOperator μ (fun x y ↦ k (y, x)) B) :
    (Function.Bijective (1 - A : C(G, 𝕜) →L[𝕜] C(G, 𝕜)) ↔
      Function.Bijective (1 - B : C(G, 𝕜) →L[𝕜] C(G, 𝕜))) ∧
      FiniteDimensional 𝕜
        (LinearMap.ker ((1 - A : C(G, 𝕜) →L[𝕜] C(G, 𝕜)) : C(G, 𝕜) →ₗ[𝕜] C(G, 𝕜))) ∧
      FiniteDimensional 𝕜
        (LinearMap.ker ((1 - B : C(G, 𝕜) →L[𝕜] C(G, 𝕜)) : C(G, 𝕜) →ₗ[𝕜] C(G, 𝕜))) ∧
      Module.finrank 𝕜 (LinearMap.ker ((1 - A : C(G, 𝕜) →L[𝕜] C(G, 𝕜)) : C(G, 𝕜) →ₗ[𝕜] C(G, 𝕜))) =
        Module.finrank 𝕜 (LinearMap.ker ((1 - B : C(G, 𝕜) →L[𝕜] C(G, 𝕜)) : C(G, 𝕜) →ₗ[𝕜] C(G, 𝕜))) ∧
      ∀ f : C(G, 𝕜), (∃ φ, φ - A φ = f) ↔ ∀ ψ, B ψ = ψ → ∫ x, f x * ψ x ∂μ = 0 := by
  sorry

end FredholmKernel

/-! ## Layer 3: collectively compact operator approximation -/

section CollectivelyCompact

variable {𝕜 X Y Z : Type*} [RCLike 𝕜] [NormedAddCommGroup X] [NormedSpace 𝕜 X]
  [NormedAddCommGroup Y] [NormedSpace 𝕜 Y] [NormedAddCommGroup Z] [NormedSpace 𝕜 Z]

/-- **Collective compactness** (3.1): the union of the images of the closed unit ball under the
operators of the family is relatively compact. -/
def IsCollectivelyCompact {ι : Type*} (A : ι → X →L[𝕜] Y) : Prop :=
  IsCompact (closure (⋃ i, A i '' Metric.closedBall (0 : X) 1))

/-- **Members and pointwise limits** (3.1): the operators of a collectively compact family are
compact and uniformly bounded, and a pointwise limit along a nontrivial filter is compact. -/
theorem IsCollectivelyCompact.isCompactOperator {ι : Type*} {A : ι → X →L[𝕜] Y}
    (h : IsCollectivelyCompact A) :
    (∀ i, IsCompactOperator (A i)) ∧ (∃ C, ∀ i, ‖A i‖ ≤ C) ∧
      ∀ (l : Filter ι) [l.NeBot] (L : X →L[𝕜] Y),
        (∀ x, Tendsto (fun i ↦ A i x) l (𝓝 (L x))) → IsCompactOperator L := by
  sorry

/-- **Uniformity on collectively compact families** (3.1): pointwise convergence `L n → L₀` on a
Banach space is uniform after composition with a collectively compact family. -/
theorem IsCollectivelyCompact.eventually_norm_sub_comp_le [CompleteSpace Y] {ι : Type*}
    {A : ι → X →L[𝕜] Y} (hA : IsCollectivelyCompact A) {L : ℕ → Y →L[𝕜] Z} {L₀ : Y →L[𝕜] Z}
    (hL : ∀ y, Tendsto (fun n ↦ L n y) atTop (𝓝 (L₀ y))) :
    ∀ ε > 0, ∀ᶠ n in atTop, ∀ i, ‖(L n - L₀) ∘L A i‖ ≤ ε := by
  sorry

/-- **Anselone's lemma** (3.1): for a collectively compact sequence converging pointwise to `A₀`,
`(Aₙ - A₀) A₀ → 0` and `(Aₙ - A₀) Aₙ → 0` in norm. -/
theorem IsCollectivelyCompact.tendsto_norm_sub_comp [CompleteSpace X] {A : ℕ → X →L[𝕜] X}
    (hA : IsCollectivelyCompact A) {A₀ : X →L[𝕜] X}
    (h : ∀ x, Tendsto (fun n ↦ A n x) atTop (𝓝 (A₀ x))) :
    Tendsto (fun n ↦ ‖(A n - A₀) ∘L A₀‖) atTop (𝓝 0) ∧
      Tendsto (fun n ↦ ‖(A n - A₀) ∘L A n‖) atTop (𝓝 0) := by
  sorry

/-- **Perturbation through `(S - A) S`** (3.2): if `1 - A` is invertible, `S` is compact and
`q = ‖(1 - A)⁻¹ (S - A) S‖ < 1`, then `1 - S` is invertible with
`‖(1 - S)⁻¹‖ ≤ (1 + ‖(1 - A)⁻¹ S‖) / (1 - q)`, and the same factor bounds the error of the
perturbed equation. -/
theorem isUnit_one_sub_of_norm_comp_lt [CompleteSpace X] {A S : X →L[𝕜] X}
    (hA : IsUnit (1 - A)) (hS : IsCompactOperator S)
    (h : ‖Ring.inverse (1 - A) * ((S - A) * S)‖ < 1) :
    IsUnit (1 - S) ∧
      ‖Ring.inverse (1 - S)‖ ≤
        (1 + ‖Ring.inverse (1 - A) * S‖) / (1 - ‖Ring.inverse (1 - A) * ((S - A) * S)‖) ∧
      ∀ φ f φS fS : X, φ - A φ = f → φS - S φS = fS →
        ‖φS - φ‖ ≤ (1 + ‖Ring.inverse (1 - A) * S‖) /
          (1 - ‖Ring.inverse (1 - A) * ((S - A) * S)‖) * (‖(S - A) φ‖ + ‖fS - f‖) := by
  sorry

/-- **Collectively compact approximation** (3.2): if `Aₙ` is collectively compact, `Aₙ → A`
pointwise and `1 - A` is injective, then eventually `1 - Aₙ` is invertible, the inverses are
uniformly bounded, and the error is bounded by `C (‖(Aₙ - A) φ‖ + ‖fₙ - f‖)`. -/
theorem eventually_secondKind_boundedInverse [CompleteSpace X] {A : X →L[𝕜] X}
    {An : ℕ → X →L[𝕜] X} (hinj : Function.Injective (1 - A : X →L[𝕜] X))
    (hcc : IsCollectivelyCompact An) (hpt : ∀ x, Tendsto (fun n ↦ An n x) atTop (𝓝 (A x))) :
    ∃ C : ℝ, ∀ᶠ n in atTop, IsUnit (1 - An n) ∧ ‖Ring.inverse (1 - An n)‖ ≤ C ∧
      ∀ φ f φn fn : X, φ - A φ = f → φn - An n φn = fn →
        ‖φn - φ‖ ≤ C * (‖(An n - A) φ‖ + ‖fn - f‖) := by
  sorry

end CollectivelyCompact

/-! ## Layer 4: projection methods -/

section Projection

variable {𝕜 X : Type*} [RCLike 𝕜] [NormedAddCommGroup X] [NormedSpace 𝕜 X] [CompleteSpace X]

/-- **Projection methods for second-kind equations** (4.2): for bounded projections `Pₙ` with
`‖K - Pₙ K‖ → 0` and `λ • 1 - K` invertible, eventually `λ • 1 - Pₙ K` is invertible
with uniformly bounded inverses, and the projection solution `xₙ` of `(λ - Pₙ K) xₙ = Pₙ y` lies
in the range of `Pₙ`, satisfies `x - xₙ = λ (λ - Pₙ K)⁻¹ (x - Pₙ x)` and the two-sided bound. -/
theorem exists_projection_secondKind_bounds {K : X →L[𝕜] X} {P : ℕ → X →L[𝕜] X}
    (hproj : ∀ n, P n ∘L P n = P n) (hconv : Tendsto (fun n ↦ ‖K - P n ∘L K‖) atTop (𝓝 0))
    {lam : 𝕜} (hunit : IsUnit (lam • 1 - K)) :
    ∃ C : ℝ, ∀ᶠ n in atTop, IsUnit (lam • 1 - P n ∘L K) ∧
      ‖Ring.inverse (lam • 1 - P n ∘L K)‖ ≤ C ∧
      ∀ x y : X, (lam • 1 - K) x = y →
        P n (Ring.inverse (lam • 1 - P n ∘L K) (P n y)) =
            Ring.inverse (lam • 1 - P n ∘L K) (P n y) ∧
          x - Ring.inverse (lam • 1 - P n ∘L K) (P n y) =
            lam • Ring.inverse (lam • 1 - P n ∘L K) (x - P n x) ∧
          ‖lam‖ / ‖lam • 1 - P n ∘L K‖ * ‖x - P n x‖ ≤
            ‖x - Ring.inverse (lam • 1 - P n ∘L K) (P n y)‖ ∧
          ‖x - Ring.inverse (lam • 1 - P n ∘L K) (P n y)‖ ≤
            ‖lam‖ * ‖Ring.inverse (lam • 1 - P n ∘L K)‖ * ‖x - P n x‖ := by
  sorry

end Projection

section PiecewiseLinear

variable {𝕜 : Type*} [RCLike 𝕜]

/-- **Piecewise linear interpolation** (4.3) on the mesh `t` of `[a, b]`: `P φ` agrees with `φ` at
the nodes and is affine on each cell. Values of `φ` at the nodes are read through
`Set.IccExtend`. -/
def IsPiecewiseLinearInterpolation {a b : ℝ} (hab : a ≤ b) {N : ℕ} (t : Fin (N + 1) → ℝ)
    (P : C(Icc a b, 𝕜) →L[𝕜] C(Icc a b, 𝕜)) : Prop :=
  ∀ (φ : C(Icc a b, 𝕜)) (i : Fin N) (s : Icc a b), t i.castSucc ≤ s → (s : ℝ) ≤ t i.succ →
    P φ s = (((t i.succ - s) / (t i.succ - t i.castSucc) : ℝ) : 𝕜) *
        Set.IccExtend hab φ (t i.castSucc) +
      (((s - t i.castSucc) / (t i.succ - t i.castSucc) : ℝ) : 𝕜) * Set.IccExtend hab φ (t i.succ)

/-- **Convergence of piecewise linear interpolation** (4.3): on meshes of `[a, b]`, `a < b`,
whose widths tend to `0`, the interpolation operators are projections of norm at most `1` and
converge pointwise to the identity. -/
theorem tendsto_pwLinearInterpolation {a b : ℝ} (hab : a < b) {N : ℕ → ℕ}
    {t : (n : ℕ) → Fin (N n + 1) → ℝ} (ht : ∀ n, StrictMono (t n)) (ht0 : ∀ n, t n 0 = a)
    (ht1 : ∀ n, t n (Fin.last (N n)) = b)
    (hwidth : ∀ ε > 0, ∀ᶠ n in atTop, ∀ i : Fin (N n), t n i.succ - t n i.castSucc ≤ ε)
    {P : ℕ → C(Icc a b, 𝕜) →L[𝕜] C(Icc a b, 𝕜)}
    (hP : ∀ n, IsPiecewiseLinearInterpolation hab.le (t n) (P n)) :
    (∀ n, P n ∘L P n = P n ∧ ‖P n‖ ≤ 1) ∧ ∀ φ, Tendsto (fun n ↦ P n φ) atTop (𝓝 φ) := by
  sorry

/-- **Collocation with linear splines** (4.3): for a compact `A` on `C([a, b])` with `1 - A`
injective, eventually `1 - Pₙ A` is invertible and the collocation solution
`φₙ = (1 - Pₙ A)⁻¹ Pₙ f` satisfies `‖φₙ - φ‖ ≤ C ‖Pₙ φ - φ‖`. -/
theorem pwLinear_collocation_tendsto {a b : ℝ} (hab : a < b) {N : ℕ → ℕ}
    {t : (n : ℕ) → Fin (N n + 1) → ℝ} (ht : ∀ n, StrictMono (t n)) (ht0 : ∀ n, t n 0 = a)
    (ht1 : ∀ n, t n (Fin.last (N n)) = b)
    (hwidth : ∀ ε > 0, ∀ᶠ n in atTop, ∀ i : Fin (N n), t n i.succ - t n i.castSucc ≤ ε)
    {P : ℕ → C(Icc a b, 𝕜) →L[𝕜] C(Icc a b, 𝕜)}
    (hP : ∀ n, IsPiecewiseLinearInterpolation hab.le (t n) (P n))
    {A : C(Icc a b, 𝕜) →L[𝕜] C(Icc a b, 𝕜)} (hA : IsCompactOperator A)
    (hinj : Function.Injective (1 - A : C(Icc a b, 𝕜) →L[𝕜] C(Icc a b, 𝕜))) :
    ∃ C : ℝ, ∀ᶠ n in atTop, IsUnit (1 - P n ∘L A) ∧
      ∀ φ f : C(Icc a b, 𝕜), φ - A φ = f →
        ‖Ring.inverse (1 - P n ∘L A) (P n f) - φ‖ ≤ C * ‖P n φ - φ‖ := by
  sorry

end PiecewiseLinear

/-! ## Layer 5: the Nyström method -/

section Nystrom

variable {𝕜 : Type*} [RCLike 𝕜] {G : Type*} [MetricSpace G] [CompactSpace G]

/-- **The Nyström operator** (5.1) of the kernel `k` and the rule with nodes `x` and weights `w`:
`φ ↦ ∑ⱼ wⱼ φ(xⱼ) k(·, xⱼ)`. -/
def nystromOperator (k : C(G × G, 𝕜)) {N : ℕ} (x : Fin N → G) (w : Fin N → 𝕜) :
    C(G, 𝕜) →L[𝕜] C(G, 𝕜) :=
  ∑ j, (w j • ContinuousMap.evalCLM (M := 𝕜) 𝕜 (x j)).smulRight
    (k.comp ((ContinuousMap.id G).prodMk (ContinuousMap.const G (x j))))

/-- The Nyström operator evaluates as its defining sum (5.1); proved here as a sanity check of
the definition. -/
theorem nystromOperator_apply (k : C(G × G, 𝕜)) {N : ℕ} (x : Fin N → G) (w : Fin N → 𝕜)
    (φ : C(G, 𝕜)) (y : G) :
    nystromOperator k x w φ y = ∑ j, w j * φ (x j) * k (y, x j) := by
  simp [nystromOperator, mul_assoc]

variable [MeasurableSpace G] [BorelSpace G]

/-- **Nyström operators of convergent rules** (5.1): if `∑ⱼ wₙⱼ g(xₙⱼ) → ∫ g dμ` for every
continuous `g`, the Nyström operators are collectively compact and converge pointwise to the
integral operator, and for a measure without atoms `‖A‖ ≤ ‖A - Aₙ‖` for every `n`. -/
theorem isCollectivelyCompact_nystromOperator (μ : Measure G) [IsFiniteMeasure μ]
    (k : C(G × G, 𝕜)) {N : ℕ → ℕ} {x : (n : ℕ) → Fin (N n) → G} {w : (n : ℕ) → Fin (N n) → 𝕜}
    (hQ : ∀ g : C(G, 𝕜),
      Tendsto (fun n ↦ ∑ j, w n j * g (x n j)) atTop (𝓝 (∫ y, g y ∂μ)))
    {A : C(G, 𝕜) →L[𝕜] C(G, 𝕜)} (hA : IsKernelOperator μ (fun x y ↦ k (x, y)) A) :
    IsCollectivelyCompact (fun n ↦ nystromOperator k (x n) (w n)) ∧
      (∀ φ, Tendsto (fun n ↦ nystromOperator k (x n) (w n) φ) atTop (𝓝 (A φ))) ∧
      (NullSingletonClass μ → ∀ n, ‖A‖ ≤ ‖A - nystromOperator k (x n) (w n)‖) := by
  sorry

omit [MeasurableSpace G] [BorelSpace G] in
/-- **The nodal system** (5.2): `φ` solves the Nyström equation iff its nodal values solve the
linear system and `φ` is given by the Nyström interpolation formula; conversely every solution
`c` of the system gives the solution `f + ∑ⱼ wⱼ cⱼ k(·, xⱼ)`, with nodal values `c`. Proved here
as a sanity check of `nystromOperator`. -/
theorem nystrom_iff_nodal_system (k : C(G × G, 𝕜)) {N : ℕ} (x : Fin N → G) (w : Fin N → 𝕜)
    (f : C(G, 𝕜)) :
    (∀ φ : C(G, 𝕜), φ - nystromOperator k x w φ = f ↔
      (∀ i, φ (x i) - ∑ j, w j * k (x i, x j) * φ (x j) = f (x i)) ∧
        ∀ y, φ y = f y + ∑ j, w j * k (y, x j) * φ (x j)) ∧
    ∀ c : Fin N → 𝕜, (∀ i, c i - ∑ j, w j * k (x i, x j) * c j = f (x i)) →
      let φ := f + ∑ j, (w j * c j) • k.comp ((ContinuousMap.id G).prodMk
        (ContinuousMap.const G (x j)))
      φ - nystromOperator k x w φ = f ∧ ∀ i, φ (x i) = c i := by
  have key : ∀ (φ : C(G, 𝕜)) (y : G),
      nystromOperator k x w φ y = ∑ j, w j * k (y, x j) * φ (x j) := by
    intro φ y; rw [nystromOperator_apply]; congr 1; ext j; ring
  have hφ : ∀ φ : C(G, 𝕜), φ - nystromOperator k x w φ = f ↔
      ∀ y, φ y = f y + ∑ j, w j * k (y, x j) * φ (x j) := by
    intro φ
    constructor
    · intro h y
      have := congrArg (fun g : C(G, 𝕜) ↦ g y) h
      simp only [ContinuousMap.sub_apply, key] at this
      rw [← this]; ring
    · intro h; ext y
      simp only [ContinuousMap.sub_apply, key]
      rw [h y]; ring
  refine ⟨fun φ ↦ ?_, fun c hc ↦ ?_⟩
  · rw [hφ]
    exact ⟨fun h ↦ ⟨fun i ↦ by rw [h (x i)]; ring, h⟩, fun h ↦ h.2⟩
  · intro φ
    have hval : ∀ y, φ y = f y + ∑ j, w j * k (y, x j) * c j := by
      intro y
      simp only [φ, ContinuousMap.add_apply, ContinuousMap.coe_sum, Finset.sum_apply,
        ContinuousMap.smul_apply, ContinuousMap.comp_apply, smul_eq_mul]
      congr 1; refine Finset.sum_congr rfl fun j _ ↦ ?_
      simp only [ContinuousMap.prodMk, ContinuousMap.coe_mk, ContinuousMap.id_apply,
        ContinuousMap.const_apply]
      ring
    have hnod : ∀ i, φ (x i) = c i := by
      intro i; rw [hval]; have := hc i; linear_combination -this
    refine ⟨(hφ φ).2 fun y ↦ ?_, hnod⟩
    rw [hval y]; simp only [hnod]

/-- **Convergence of the Nyström method** (5.2): for a convergent quadrature and a uniquely
solvable equation, eventually the Nyström equations are uniquely solvable with uniformly bounded
inverses and `‖φ - φₙ‖ ≤ C ‖(A - Aₙ) φ‖`. -/
theorem exists_nystrom_convergence (μ : Measure G) [IsFiniteMeasure μ] (k : C(G × G, 𝕜))
    {N : ℕ → ℕ} {x : (n : ℕ) → Fin (N n) → G} {w : (n : ℕ) → Fin (N n) → 𝕜}
    (hQ : ∀ g : C(G, 𝕜),
      Tendsto (fun n ↦ ∑ j, w n j * g (x n j)) atTop (𝓝 (∫ y, g y ∂μ)))
    {A : C(G, 𝕜) →L[𝕜] C(G, 𝕜)} (hA : IsKernelOperator μ (fun x y ↦ k (x, y)) A)
    (hinj : Function.Injective (1 - A : C(G, 𝕜) →L[𝕜] C(G, 𝕜))) :
    ∃ C : ℝ, ∀ᶠ n in atTop, IsUnit (1 - nystromOperator k (x n) (w n)) ∧
      ‖Ring.inverse (1 - nystromOperator k (x n) (w n))‖ ≤ C ∧
      ∀ φ f : C(G, 𝕜), φ - A φ = f →
        ‖φ - Ring.inverse (1 - nystromOperator k (x n) (w n)) f‖ ≤
          C * ‖(A - nystromOperator k (x n) (w n)) φ‖ := by
  sorry

end Nystrom

/-! ## Layer 6: Volterra equations of the second kind -/

section Volterra

/-- The closed triangle `D = {(t, s) : 0 ≤ s ≤ t ≤ T}` (6.1). -/
def volterraTriangle (T : ℝ) : Set (ℝ × ℝ) := {p | 0 ≤ p.2 ∧ p.2 ≤ p.1 ∧ p.1 ≤ T}

/-- **The resolvent kernel** (6.1): a kernel continuous on the triangle has a unique continuous
resolvent satisfying the first resolvent equation; it also satisfies the second. -/
theorem exists_volterra_resolvent {T : ℝ} {K : ℝ → ℝ → ℝ}
    (hK : ContinuousOn (Function.uncurry K) (volterraTriangle T)) :
    ∃ R : ℝ → ℝ → ℝ, ContinuousOn (Function.uncurry R) (volterraTriangle T) ∧
      (∀ p ∈ volterraTriangle T, R p.1 p.2 = K p.1 p.2 + ∫ v in p.2..p.1, K p.1 v * R v p.2) ∧
      (∀ p ∈ volterraTriangle T, R p.1 p.2 = K p.1 p.2 + ∫ v in p.2..p.1, R p.1 v * K v p.2) ∧
      ∀ R' : ℝ → ℝ → ℝ, ContinuousOn (Function.uncurry R') (volterraTriangle T) →
        (∀ p ∈ volterraTriangle T,
          R' p.1 p.2 = K p.1 p.2 + ∫ v in p.2..p.1, K p.1 v * R' v p.2) →
        EqOn (Function.uncurry R') (Function.uncurry R) (volterraTriangle T) := by
  sorry

/-- **Unique solvability by the resolvent** (6.1): for every continuous `g` the equation
`y(t) = g(t) + ∫₀ᵗ K(t, s) y(s) ds` has exactly one continuous solution on `[0, T]`, and it is
`y(t) = g(t) + ∫₀ᵗ R(t, s) g(s) ds` for the continuous resolvent `R`. -/
theorem volterra_existsUnique_solution {T : ℝ} {K R : ℝ → ℝ → ℝ}
    (hK : ContinuousOn (Function.uncurry K) (volterraTriangle T))
    (hR : ContinuousOn (Function.uncurry R) (volterraTriangle T))
    (hRK : ∀ p ∈ volterraTriangle T,
      R p.1 p.2 = K p.1 p.2 + ∫ v in p.2..p.1, K p.1 v * R v p.2)
    {g : ℝ → ℝ} (hg : ContinuousOn g (Icc 0 T)) :
    ∃ y : ℝ → ℝ, ContinuousOn y (Icc 0 T) ∧
      (∀ t ∈ Icc (0 : ℝ) T, y t = g t + ∫ s in (0 : ℝ)..t, K t s * y s) ∧
      (∀ t ∈ Icc (0 : ℝ) T, y t = g t + ∫ s in (0 : ℝ)..t, R t s * g s) ∧
      ∀ u : ℝ → ℝ, ContinuousOn u (Icc 0 T) →
        (∀ t ∈ Icc (0 : ℝ) T, u t = g t + ∫ s in (0 : ℝ)..t, K t s * u s) →
        EqOn u y (Icc 0 T) := by
  sorry

/-- **Weakly singular Volterra equations** (6.2): for `0 < α < 1` and `K` continuous on the
triangle there is `Q` continuous on the triangle such that, for every continuous `g`, the
equation `y(t) = g(t) + ∫₀ᵗ (t - s)^(-α) K(t, s) y(s) ds` has exactly one continuous solution,
and it is `y(t) = g(t) + ∫₀ᵗ (t - s)^(-α) Q(t, s) g(s) ds`. -/
theorem volterra_weaklySingular_existsUnique {T α : ℝ} (hα : α ∈ Ioo (0 : ℝ) 1)
    {K : ℝ → ℝ → ℝ} (hK : ContinuousOn (Function.uncurry K) (volterraTriangle T)) :
    ∃ Q : ℝ → ℝ → ℝ, ContinuousOn (Function.uncurry Q) (volterraTriangle T) ∧
      ∀ g : ℝ → ℝ, ContinuousOn g (Icc 0 T) →
        ∃ y : ℝ → ℝ, ContinuousOn y (Icc 0 T) ∧
          (∀ t ∈ Icc (0 : ℝ) T, y t = g t + ∫ s in (0 : ℝ)..t, (t - s) ^ (-α) * K t s * y s) ∧
          (∀ t ∈ Icc (0 : ℝ) T, y t = g t + ∫ s in (0 : ℝ)..t, (t - s) ^ (-α) * Q t s * g s) ∧
          ∀ u : ℝ → ℝ, ContinuousOn u (Icc 0 T) →
            (∀ t ∈ Icc (0 : ℝ) T, u t = g t + ∫ s in (0 : ℝ)..t, (t - s) ^ (-α) * K t s * u s) →
            EqOn u y (Icc 0 T) := by
  sorry

end Volterra

/-! ## Layer 7: piecewise polynomial collocation for Volterra equations -/

section Collocation

/-- A mesh `0 = t₀ < t₁ < ⋯ < t_N = T` of `[0, T]` with all widths at most `h` (7.1). -/
def IsVolterraMesh (T h : ℝ) {N : ℕ} (t : Fin (N + 1) → ℝ) : Prop :=
  StrictMono t ∧ t 0 = 0 ∧ t (Fin.last N) = T ∧ ∀ i : Fin N, t i.succ - t i.castSucc ≤ h

/-- **The collocation equations** (7.1) for `y = g + ∫₀ᵗ W(t, s) y(s) ds`: on each cell
`(tᵢ, tᵢ₊₁]` the solution is the polynomial `p i` of degree less than `m`, and the equation holds
at the points `tᵢ + c_j (tᵢ₊₁ - tᵢ)`; earlier cells enter by their full integrals and the current
cell by its integral up to the collocation point. -/
def IsVolterraCollocation {N m : ℕ} (t : Fin (N + 1) → ℝ) (c : Fin m → ℝ) (W : ℝ → ℝ → ℝ)
    (g : ℝ → ℝ) (p : Fin N → ℝ[X]) : Prop :=
  (∀ i, (p i).natDegree < m) ∧ ∀ (i : Fin N) (j : Fin m),
    (p i).eval (t i.castSucc + c j * (t i.succ - t i.castSucc)) =
      g (t i.castSucc + c j * (t i.succ - t i.castSucc)) +
      (∑ k ∈ Finset.univ.filter (· < i), ∫ s in t k.castSucc..t k.succ,
        W (t i.castSucc + c j * (t i.succ - t i.castSucc)) s * (p k).eval s) +
      ∫ s in t i.castSucc..(t i.castSucc + c j * (t i.succ - t i.castSucc)),
        W (t i.castSucc + c j * (t i.succ - t i.castSucc)) s * (p i).eval s

/-- The orthogonality integrals `J(ν) = ∫₀¹ s^ν ∏ᵢ (s - cᵢ) ds` of the collocation parameters
(7.2). -/
def collocationMoment {m : ℕ} (c : Fin m → ℝ) (ν : ℕ) : ℝ :=
  ∫ s in (0 : ℝ)..1, s ^ ν * ∏ i, (s - c i)

/-- The graded mesh `tⱼ = T (j / N)^r` (7.3). -/
def gradedMesh (T r : ℝ) (N : ℕ) : Fin (N + 1) → ℝ := fun j ↦ T * ((j : ℝ) / N) ^ r

/-- **Unique solvability of the collocation equations** (7.1): for continuous `K` and
`0 ≤ α < 1` there is `h̄ > 0` such that on every mesh of width below `h̄` the collocation
equations of the kernel `(t - s)^(-α) K(t, s)` have exactly one solution, for every `g`. -/
theorem existsUnique_volterraCollocation {m : ℕ} (hm : 0 < m) {T α : ℝ} (hα0 : 0 ≤ α)
    (hα1 : α < 1) {c : Fin m → ℝ} (hc : StrictMono c) (hc01 : ∀ j, c j ∈ Icc (0 : ℝ) 1)
    {K : ℝ → ℝ → ℝ} (hK : ContinuousOn (Function.uncurry K) (volterraTriangle T)) :
    ∃ hbar > 0, ∀ (g : ℝ → ℝ) (N : ℕ) (t : Fin (N + 1) → ℝ) (h : ℝ), IsVolterraMesh T h t →
      h < hbar →
      ∃! p : Fin N → ℝ[X], IsVolterraCollocation t c (fun t s ↦ (t - s) ^ (-α) * K t s) g p := by
  sorry

/-- **Global order `m`** (7.1): for `g ∈ Cᵐ`, `K ∈ Cᵐ` the collocation solution satisfies
`|y - u_h| ≤ C hᵐ` on `[0, T]`, with `C` independent of the mesh. -/
theorem exists_volterraCollocation_error_le {m : ℕ} (hm : 0 < m) {T : ℝ} {c : Fin m → ℝ}
    (hc : StrictMono c) (hc01 : ∀ j, c j ∈ Icc (0 : ℝ) 1) {K : ℝ → ℝ → ℝ} {g y : ℝ → ℝ}
    (hK : ContDiffOn ℝ m (Function.uncurry K) (volterraTriangle T))
    (hg : ContDiffOn ℝ m g (Icc 0 T)) (hy : ContinuousOn y (Icc 0 T))
    (heq : ∀ t ∈ Icc (0 : ℝ) T, y t = g t + ∫ s in (0 : ℝ)..t, K t s * y s) :
    ∃ hbar > 0, ∃ C : ℝ, ∀ (N : ℕ) (t : Fin (N + 1) → ℝ) (h : ℝ), IsVolterraMesh T h t →
      h < hbar → ∀ p : Fin N → ℝ[X], IsVolterraCollocation t c K g p →
        ∀ i : Fin N, ∀ s ∈ Icc (t i.castSucc) (t i.succ), |y s - (p i).eval s| ≤ C * h ^ m := by
  sorry

/-- **How many moments vanish** (7.2): if `J(ν) = 0` for all `ν < κ`, then `κ ≤ m`, and
`κ ≤ m - 1` when `1` is a collocation parameter. -/
theorem collocationMoment_order_le {m : ℕ} (c : Fin m → ℝ) {κ : ℕ}
    (hJ : ∀ ν < κ, collocationMoment c ν = 0) : κ ≤ m ∧ (1 ∈ Set.range c → κ ≤ m - 1) := by
  sorry

/-- **Nodal superconvergence** (7.2): if `J(ν) = 0` for `ν < κ` and `g`, `K` are of class
`C^(m + κ)`, the iterated collocation solution is `O(h^(m + κ))` at the mesh points, and so is
`u_h` itself when `1` is a collocation parameter. -/
theorem volterraCollocation_nodal_error_le {m κ : ℕ} (hm : 0 < m) {T : ℝ} {c : Fin m → ℝ}
    (hc : StrictMono c) (hc01 : ∀ j, c j ∈ Icc (0 : ℝ) 1)
    (hJ : ∀ ν < κ, collocationMoment c ν = 0) {K : ℝ → ℝ → ℝ} {g y : ℝ → ℝ}
    (hK : ContDiffOn ℝ (m + κ) (Function.uncurry K) (volterraTriangle T))
    (hg : ContDiffOn ℝ (m + κ) g (Icc 0 T)) (hy : ContinuousOn y (Icc 0 T))
    (heq : ∀ t ∈ Icc (0 : ℝ) T, y t = g t + ∫ s in (0 : ℝ)..t, K t s * y s) :
    ∃ hbar > 0, ∃ C : ℝ, ∀ (N : ℕ) (t : Fin (N + 1) → ℝ) (h : ℝ), IsVolterraMesh T h t →
      h < hbar → ∀ p : Fin N → ℝ[X], IsVolterraCollocation t c K g p →
        (∀ n : Fin N, |y (t n.succ) - (g (t n.succ) + ∑ k ∈ Finset.univ.filter (· ≤ n),
            ∫ s in t k.castSucc..t k.succ, K (t n.succ) s * (p k).eval s)| ≤ C * h ^ (m + κ)) ∧
          (1 ∈ Set.range c → ∀ n : Fin N, |y (t n.succ) - (p n).eval (t n.succ)| ≤
            C * h ^ (m + κ)) := by
  sorry

/-- **Graded meshes** (7.3): for `0 < α < 1`, `g ∈ Cᵐ`, `K ∈ Cᵐ` and `μ ≥ 1 - α`, on the graded
mesh with exponent `r = μ / (1 - α)` and `N` large the collocation solution of the weakly
singular equation exists, is unique, and has error `C (T / N)^(min(μ, m))`. -/
theorem exists_graded_volterraCollocation_error_le {m : ℕ} (hm : 0 < m) {T α μ : ℝ}
    (hT : 0 < T) (hα : α ∈ Ioo (0 : ℝ) 1) (hμ : 1 - α ≤ μ) {c : Fin m → ℝ} (hc : StrictMono c)
    (hc01 : ∀ j, c j ∈ Icc (0 : ℝ) 1) {K : ℝ → ℝ → ℝ} {g y : ℝ → ℝ}
    (hK : ContDiffOn ℝ m (Function.uncurry K) (volterraTriangle T))
    (hg : ContDiffOn ℝ m g (Icc 0 T)) (hy : ContinuousOn y (Icc 0 T))
    (heq : ∀ t ∈ Icc (0 : ℝ) T, y t = g t + ∫ s in (0 : ℝ)..t, (t - s) ^ (-α) * K t s * y s) :
    ∃ N₀ : ℕ, ∃ C : ℝ, ∀ N : ℕ, N₀ ≤ N →
      (∃! p : Fin N → ℝ[X], IsVolterraCollocation (gradedMesh T (μ / (1 - α)) N) c
          (fun t s ↦ (t - s) ^ (-α) * K t s) g p) ∧
      ∀ p : Fin N → ℝ[X], IsVolterraCollocation (gradedMesh T (μ / (1 - α)) N) c
          (fun t s ↦ (t - s) ^ (-α) * K t s) g p →
        ∀ i : Fin N, ∀ s ∈ Icc (gradedMesh T (μ / (1 - α)) N i.castSucc)
            (gradedMesh T (μ / (1 - α)) N i.succ),
          |y s - (p i).eval s| ≤ C * (T / N) ^ min μ m := by
  sorry

end Collocation

end TauCetiRoadmap.SecondKindIntegralEquations

#check @TauCeti.isFredholm_one_sub
#check @ContinuousLinearMap.index_one_sub_eq_zero
#check @ContinuousLinearMap.IsFredholm
#check @IsCompactOperator.hasEigenvalue_or_mem_resolventSet
#check @IsCompactOperator.hasEigenvalue_iff_mem_spectrum
#check @isCompactOperator_id_iff_finiteDimensional
#check @FiniteDimensional.of_totallyBounded_nhds_zero
#check @NormedRing.norm_inverse_add_le
#check @Units.add
#check @banach_steinhaus
#check @BoundedContinuousFunction.arzela_ascoli
#check @ContinuousMap.evalCLM
#check @LinearMap.Nondegenerate
#check @Set.IccExtend
