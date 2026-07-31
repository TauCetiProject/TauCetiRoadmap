/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Matrix spectra, concentration, and the toolkit of spectral statistics: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.
-/

namespace TauCetiRoadmap.MatrixSpectralStatistics

open MeasureTheory InnerProductSpace
open scoped ENNReal Matrix

/-! ## Part A -- rank factorization and positive-semidefinite Gram factorization -/

section RankFactorization

variable {𝕜 : Type*} [Field 𝕜] {m n : Type*} [Fintype m] [Fintype n] [DecidableEq n]

/-- Rank at most `r` is exactly factorization through `Fin r`. -/
theorem rank_le_iff_exists_eq_mul (M : Matrix m n 𝕜) (r : ℕ) :
    M.rank ≤ r ↔ ∃ (L : Matrix m (Fin r) 𝕜) (R : Matrix (Fin r) n 𝕜), M = L * R := sorry

/-- **The multidimensional-scaling embedding step**, as an iff: a matrix is
positive semidefinite of rank at most `d` exactly when it is the Gram matrix of
`n` points in `d`-dimensional space. -/
theorem posSemidef_and_rank_le_iff_exists_conjTranspose_mul_self
    {𝕜 : Type*} [RCLike 𝕜] [PartialOrder 𝕜] [StarOrderedRing 𝕜]
    {n d : ℕ} (B : Matrix (Fin n) (Fin n) 𝕜) :
    (B.PosSemidef ∧ B.rank ≤ d) ↔ ∃ A : Matrix (Fin d) (Fin n) 𝕜, B = Aᴴ * A := sorry

/-- **Milestone A2, general factors.** At minimal rank the factorization is unique up to
the obvious `GL` action.  Stated as an existence over the group rather than through a
quotient object: there is no quotient here, and inventing one would be an unasked-for
design. `r = M.rank` is load-bearing -- above the rank the extra columns are
unconstrained and the statement is false. -/
theorem exists_units_eq_mul_of_rank_factorization {r : ℕ} (M : Matrix m n 𝕜)
    (hr : M.rank = r) {L L' : Matrix m (Fin r) 𝕜} {R R' : Matrix (Fin r) n 𝕜}
    (h : M = L * R) (h' : M = L' * R') :
    ∃ g : (Matrix (Fin r) (Fin r) 𝕜)ˣ,
      L' = L * (g : Matrix (Fin r) (Fin r) 𝕜) ∧
        R' = ((g⁻¹ : (Matrix (Fin r) (Fin r) 𝕜)ˣ) : Matrix (Fin r) (Fin r) 𝕜) * R := sorry

end RankFactorization

section GramUniqueness

variable {𝕜 : Type*} [RCLike 𝕜]

/-- **Milestone A2, Gram factorization.**  Unique up to a *left unitary*, at a fixed
factor size and with no rank hypothesis -- which is why this is not a corollary of the
rank-factorization statement above.  The group differs (`unitaryGroup`, not the
invertibles) because this one remembers an inner product.

The quantifier side matters: the unitary acts on the `d` side.  In the
multidimensional-scaling consumer that is exactly the rigid-motion indeterminacy of a
recovered configuration; a unitary on the `n` side would be false and would look
plausible. -/
theorem exists_unitary_mul_of_conjTranspose_mul_self_eq {n d : ℕ}
    {A A' : Matrix (Fin d) (Fin n) 𝕜} (h : Aᴴ * A = A'ᴴ * A') :
    ∃ U ∈ Matrix.unitaryGroup (Fin d) 𝕜, A' = U * A := sorry

end GramUniqueness

/-! ## Part B -- Berge's maximum theorem over a fixed compact feasible set -/

section Berge

variable {P X : Type*} [TopologicalSpace P] [TopologicalSpace X]
variable {K : Set X} {g : P → X → ℝ}

/-- Compactness form of approximate-minimizer stability: an approximate minimizing
sequence on a compact feasible set has a subsequence converging to a true minimizer.
This one is proved, and it is the statement the Berge argument below consumes. -/
theorem exists_subseq_tendsto_isMinOn_of_approxMinOn [FirstCountableTopology X]
    (hK : IsCompact K) {F : X → ℝ} (hF : Continuous F)
    {z : ℕ → X} (hz : ∀ k, z k ∈ K)
    {ε : X → ℕ → ℝ} (hε : ∀ x ∈ K, Filter.Tendsto (ε x) Filter.atTop (nhds 0))
    (happrox : ∀ x ∈ K, ∀ k, F (z k) ≤ F x + ε x k) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ ψ ∈ K, IsMinOn F K ψ ∧
      Filter.Tendsto (fun t => z (φ t)) Filter.atTop (nhds ψ) := sorry

/-! **The quantitative stability statement is deliberately unnamed.**  A
`approxMinimizer_stability_target` placeholder stood here, and it named nothing: the
prose behind it -- "an approximate minimizer at a nearby parameter is close to the
argmin set" -- is three different theorems depending on the quantifier order, and the
one worth proving has a shape like

```text
∀ ε > 0, ∃ δ > 0, ∃ η > 0, dist p p₀ < δ → x ∈ K → IsApproxMinOn (g p) K η x →
  ∃ x₀ ∈ K, IsMinOn (g p₀) K x₀ ∧ dist x x₀ < ε
```

Once that signature is fixed, `exists_isMinOn_dist_lt_of_approxMinOn` names it from its
conclusion.  Guessing the name before the quantifiers are settled is what produced the
placeholder. -/

/-- **Berge, argmin half**: the argmin correspondence over a fixed compact
feasible set is upper hemicontinuous, through Mathlib's own predicate.

The clean name belongs to this statement.  The existing proof additionally assumes
`[FirstCountableTopology X]`, which is a proof artifact -- it goes through the
sequential characterization -- so if both versions coexist it is the *restricted* one
that should be qualified (`..._of_firstCountable`) or kept private, not this one.

`IsMinOn` rather than an invented argmin-set API: the predicate is Mathlib's. -/
theorem upperHemicontinuousAt_isMinOn [T2Space X]
    (hK : IsCompact K) (hg : Continuous (Function.uncurry g))
    (p₀ : P) [(nhds p₀).IsCountablyGenerated] :
    UpperHemicontinuousAt (fun p => {x ∈ K | IsMinOn (g p) K x}) p₀ := sorry

/-- **Berge, value half**: the value function is continuous.

Stated without `[FirstCountableTopology P]`.  The existing proof carries that hypothesis
and this is the intended endpoint, so the general theorem should own the clean name and
the sequential one be qualified if it has to survive. -/
theorem continuous_iInf_of_isCompact
    (hK : IsCompact K) (hKne : K.Nonempty) (hg : Continuous (Function.uncurry g)) :
    Continuous (fun p => ⨅ x : ↥K, g p ↑x) := sorry

/-! ### Milestone B3 -- the classical theorem, over a varying constraint

The two halves use *different* hypotheses on `K`, which is the content of the classical
proof and the reason the fixed-`K` case is a special case rather than a step: upper
semicontinuity of the value needs `K` upper hemicontinuous, lower semicontinuity needs it
lower hemicontinuous. -/

/-- **Berge, value half, varying constraint.** -/
theorem continuous_iInf_of_hemicontinuous {K : P → Set X}
    (hKcompact : ∀ p, IsCompact (K p)) (hKne : ∀ p, (K p).Nonempty)
    (hKu : ∀ p, UpperHemicontinuousAt K p) (hKl : ∀ p, LowerHemicontinuousAt K p)
    (hg : Continuous (Function.uncurry g)) :
    Continuous (fun p => ⨅ x : ↥(K p), g p ↑x) := sorry

/-- **Berge, argmin half, varying constraint.** Upper hemicontinuity keeps limits of
nearby feasible points feasible; lower hemicontinuity is separately needed so every feasible
competitor at the limiting parameter can be approximated nearby. Nonempty compact values
ensure the argmin correspondence is well-defined and nonempty. -/
theorem upperHemicontinuousAt_isMinOn_of_hemicontinuous [T2Space X] {K : P → Set X}
    (hKcompact : ∀ p, IsCompact (K p)) (hKne : ∀ p, (K p).Nonempty)
    (hKu : ∀ p, UpperHemicontinuousAt K p) (hKl : ∀ p, LowerHemicontinuousAt K p)
    (hg : Continuous (Function.uncurry g)) (p₀ : P) :
    UpperHemicontinuousAt (fun p => {x ∈ K p | IsMinOn (g p) (K p) x}) p₀ := sorry

end Berge

/-! ## Part C -- matrix spectra and spectral measurability -/

section MatrixSpectra

variable {n : ℕ} {Ω : Type*} [MeasurableSpace Ω]

/-- `Matrix` is a type-level `def`, so the pi `MeasurableSpace` instance does not fire
through it.  The existing implementation names this instance for the same reason; without it the
measurability statement below does not elaborate. -/
instance instMeasurableSpaceMatrix : MeasurableSpace (Matrix (Fin n) (Fin n) ℝ) :=
  inferInstanceAs (MeasurableSpace (Fin n → Fin n → ℝ))

/-- Sorted eigenvalues of a Hermitian matrix, the ordering every perturbation
statement below is stated against. -/
noncomputable def sortedEigenvalues {A : Matrix (Fin n) (Fin n) ℝ}
    (hA : A.IsHermitian) : Fin n → ℝ := sorry

/-- **Weyl composed with the entrywise bridge**: an entrywise `ε`-perturbation
moves each sorted eigenvalue by at most `n·ε`.  The entrywise-to-operator-norm
comparison is one of the two Mathlib gaps this Part states precisely. -/
theorem abs_sortedEigenvalues_sub_le_of_entry_le {A Ahat : Matrix (Fin n) (Fin n) ℝ}
    (hA : A.IsHermitian) (hAhat : Ahat.IsHermitian)
    {ε : ℝ} (hentry : ∀ i j, |Ahat i j - A i j| ≤ ε) (k : Fin n) :
    |sortedEigenvalues hAhat k - sortedEigenvalues hA k| ≤ (n : ℝ) * ε := sorry

/-- The spectral `h`-transform of a Hermitian matrix. -/
noncomputable def specTransform (h : ℝ → ℝ) {A : Matrix (Fin n) (Fin n) ℝ}
    (hA : A.IsHermitian) : Matrix (Fin n) (Fin n) ℝ := sorry

/-- **Spectral measurability**: the `h`-transform of a measurable Hermitian
random matrix is measurable — without which no probability statement about a
sample eigenspace is well-posed. -/
theorem measurable_specTransform (h : ℝ → ℝ) (hh : Continuous h)
    {Bm : Ω → Matrix (Fin n) (Fin n) ℝ} (hBmeas : Measurable Bm)
    (hsym : ∀ ω, (Bm ω).IsHermitian) :
    Measurable fun ω => specTransform h (hsym ω) := sorry

/-! ### The `RCLike` norm comparisons (open half of Milestone C1)

No new mathematics: Cauchy--Schwarz and the triangle inequality are field-generic.  What
the port costs is that the real proofs use `|·|` and `Real`-specific order lemmas where
these need `‖·‖`.  Two consequences are decisions rather than bookkeeping -- the entrywise
hypothesis becomes a bound on `‖A i j‖`, so **complex Hermitian matrices are covered by
the same statement**, and both constants survive unchanged, which a complexification
argument would not have managed. -/

section RCLikeComparisons

variable {𝕜 : Type*} [RCLike 𝕜]

theorem sum_norm_le_sqrt_card_mul_norm {ι : Type*} [Fintype ι]
    (x : EuclideanSpace 𝕜 ι) :
    ∑ i, ‖x i‖ ≤ Real.sqrt (Fintype.card ι) * ‖x‖ := sorry

theorem norm_toEuclideanLin_le_of_entry_le {n : ℕ} {A : Matrix (Fin n) (Fin n) 𝕜}
    {ε : ℝ} (hε : 0 ≤ ε) (hentry : ∀ i j, ‖A i j‖ ≤ ε)
    (x : EuclideanSpace 𝕜 (Fin n)) :
    ‖Matrix.toEuclideanLin A x‖ ≤ (n : ℝ) * ε * ‖x‖ := sorry

end RCLikeComparisons

end MatrixSpectra

/-! ## Part D -- sample moments and matrix concentration

Chebyshev plus a union bound over `n²` entries, converted to a spectral bound
by Part C.  The elementary route is dimension-suboptimal by design: matrix
Bernstein would give `log n` in place of `n`, at the cost of Laplace-transform
machinery Mathlib does not have. -/

section Concentration

variable {n : ℕ} {Ω : Type*} [MeasurableSpace Ω]

/-- **Eigenvalue concentration of a sample matrix**: second moments of the
entries give, by Chebyshev and a union bound, simultaneous control of every
sorted eigenvalue with probability `1 − n²v/η²`. -/
theorem measure_forall_abs_sortedEigenvalues_sub_le_ge
    (P : Measure Ω) [IsProbabilityMeasure P]
    (Shat : Ω → Matrix (Fin n) (Fin n) ℝ) (A : Matrix (Fin n) (Fin n) ℝ)
    (hSherm : ∀ ω, (Shat ω).IsHermitian) (hAherm : A.IsHermitian)
    (hmeas : ∀ k l, Measurable fun ω => Shat ω k l)
    (hint : ∀ k l, Integrable (fun ω => (Shat ω k l - A k l) ^ 2) P)
    {v η : ℝ} (hη : 0 < η) (hmoment : ∀ k l, ∫ ω, (Shat ω k l - A k l) ^ 2 ∂P ≤ v) :
    P {ω | ∀ k, |sortedEigenvalues (hSherm ω) k - sortedEigenvalues hAherm k|
        ≤ (n : ℝ) * η} ≥ 1 - ENNReal.ofReal ((n : ℝ) ^ 2 * v / η ^ 2) := sorry

/-- The empirical mean of a finite family. -/
noncomputable def finiteMean (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {n : ℕ} (z : Fin n → E) : E :=
  ((n : 𝕜)⁻¹) • ∑ i, z i

/-- The unnormalized centered scatter operator `∑ᵢ (zᵢ − mean z) ⊗ (zᵢ − mean z)`. -/
noncomputable def centeredScatter (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {n : ℕ} (z : Fin n → E) : E →L[𝕜] E :=
  ∑ i, rankOne 𝕜 (z i - finiteMean 𝕜 z) (z i - finiteMean 𝕜 z)

/-- **The exact add-one update for the centered scatter operator**, the streaming
identity of the sample-moment layer.

Named for the operation rather than as a target: this is an exact identity, and the
existing implementation proves it under this name.  `_snoc` would be marginally more literal --
the implementation appends with `Fin.snoc` -- but `append` names the mathematics. -/
theorem centeredScatter_append (𝕜 : Type*) [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace 𝕜 E] {n : ℕ} (z : Fin n → E) (y : E) :
    centeredScatter 𝕜 (Fin.snoc z y) = centeredScatter 𝕜 z +
      ((n : 𝕜) / ((n : 𝕜) + 1)) •
        rankOne 𝕜 (y - finiteMean 𝕜 z) (y - finiteMean 𝕜 z) := sorry

/-- **Milestone D2 -- the operator-norm deviation event**, on the same hypotheses as the
eigenvalue event above so that the two are visibly one event read two ways.

**Not a corollary of D1.**  Eigenvalue closeness does not bound an operator-norm
difference: two matrices can have identical spectra and differ by a rotation.  Both
descend from the same entrywise event, D1 through Weyl's inequality and this through
Part C's `norm_toEuclideanLin_le_of_entry_le` -- siblings, not parent and child.

So the route is a refactor, not a new probability argument: factor the entrywise event
out of the eigenvalue theorem first, then compose it with the norm comparison here and
with Weyl there.  In the other order the Chebyshev-plus-union-bound argument gets written
twice, and the two probabilities are only coincidentally equal.

**No symmetry hypothesis**, deliberately: an operator-norm bound needs none, while D1
needs both matrices Hermitian to have eigenvalues at all. -/
theorem measure_forall_norm_toEuclideanLin_sub_le_ge
    (P : Measure Ω) [IsProbabilityMeasure P]
    (Shat : Ω → Matrix (Fin n) (Fin n) ℝ) (A : Matrix (Fin n) (Fin n) ℝ)
    (hmeas : ∀ k l, Measurable fun ω => Shat ω k l)
    (hint : ∀ k l, Integrable (fun ω => (Shat ω k l - A k l) ^ 2) P)
    {v η : ℝ} (hη : 0 < η) (hmoment : ∀ k l, ∫ ω, (Shat ω k l - A k l) ^ 2 ∂P ≤ v) :
    P {ω | ∀ x : EuclideanSpace ℝ (Fin n),
        ‖Matrix.toEuclideanLin (Shat ω - A) x‖ ≤ (n : ℝ) * η * ‖x‖}
      ≥ 1 - ENNReal.ofReal ((n : ℝ) ^ 2 * v / η ^ 2) := sorry

end Concentration

end TauCetiRoadmap.MatrixSpectralStatistics
