module

public import Mathlib
public import TauCeti.RepresentationTheory.Continuous.MatrixCoefficient

/-!
# Matrix elements of `SU(1,1)` and the Mehler–Fock transform: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions): `SU11.boostMatrixElement τ m n t` is Vilenkin and Klimyk's
`𝔓^τ_{mn}(cosh t)` as a function of `t ∈ ℝ`, defined for every `τ ∈ ℂ` and real `m`, `n` by its
circle integral. Identities that hold for real indices with an integral difference are stated with
`n : ℝ` and `m = n + k`, `k : ℤ`; statements that pass through `principalSeries τ e` use the
integer labels `n', n` of `fourierBasis` and the weights `n' - e/2`, `n - e/2`. Quotients of Gamma
functions are written with reciprocal Gamma functions or Pochhammer polynomials, so no statement
carries an off-pole hypothesis.

The definitions of SpecialFunctionsGroupModels that this roadmap consumes (`su11`, `SU11`, the
coordinates, the circle model, `principalSeries`, `complementaryWeight`, `bergmanMeasure`,
`SU11.diskAct`, `SU11.discreteAction` and `matrixElement`) are verbatim local copies of that
roadmap's `Suggested.lean`, each with a docstring naming the owner and its section, since this
file imports no other roadmap. The definitions owned here are `SU11.boostMatrixElement`,
`SU11.discreteMatrixElement`, `SU11.parabolic`, `SU11.sinhMeasure`, `SU11.plancherelMeasure`,
`SU11.mehlerFock` and `SU11.mehlerFockOrder`. Prose bullets of the README that pass through
objects of roadmaps not imported here (the continued Gauss function `𝐅`, the functions `P^μ_ν`,
the Jacobi polynomials and the `SU(2)` functions `d^j`) are not stated. Section numbers in
docstrings are those of the README.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsSU11MatrixElements

open MeasureTheory Set Matrix Complex AddCircle
open scoped Real ComplexConjugate InnerProductSpace ContDiff ENNReal

/-! ## Copied from SpecialFunctionsGroupModels -/

/-- SpecialFunctionsGroupModels 0.1 (local copy). The group `SU(1,1)` of matrices
`[[a, b], [conj b, conj a]]` of determinant `1`, as a subgroup of `SL(2, ℂ)`. -/
def su11 : Subgroup (SpecialLinearGroup (Fin 2) ℂ) where
  carrier := {g | g.1 1 0 = conj (g.1 0 1) ∧ g.1 1 1 = conj (g.1 0 0)}
  mul_mem' := by
    rintro g h ⟨hg₁, hg₂⟩ ⟨hh₁, hh₂⟩
    show (g.1 * h.1) 1 0 = conj ((g.1 * h.1) 0 1) ∧ (g.1 * h.1) 1 1 = conj ((g.1 * h.1) 0 0)
    simp only [Matrix.mul_apply, Fin.sum_univ_two, hg₁, hg₂, hh₁, hh₂, map_add, map_mul,
      Complex.conj_conj]
    constructor <;> ring
  one_mem' := by simp
  inv_mem' := by
    rintro g ⟨hg₁, hg₂⟩
    show (adjugate g.1) 1 0 = conj ((adjugate g.1) 0 1) ∧
      (adjugate g.1) 1 1 = conj ((adjugate g.1) 0 0)
    simp [Matrix.adjugate_fin_two, hg₁, hg₂]

/-- SpecialFunctionsGroupModels 0.1 (local copy). `SU(1,1)` as a type, with the subspace
topology of `SL(2, ℂ)`. -/
abbrev SU11 := ↥su11

namespace SU11

/-- SpecialFunctionsGroupModels 0.1 (local copy). The entry `a = g₀₀` of
`g = [[a, b], [conj b, conj a]]`. -/
def entryA (g : SU11) : ℂ := g.1.1 0 0

/-- SpecialFunctionsGroupModels 0.1 (local copy). The entry `b = g₀₁` of
`g = [[a, b], [conj b, conj a]]`. -/
def entryB (g : SU11) : ℂ := g.1.1 0 1

/-- SpecialFunctionsGroupModels 0.1 (local copy). The element `[[a, b], [conj b, conj a]]` of
`SU(1,1)` for `|a|² - |b|² = 1`. -/
def ofPair (a b : ℂ) (h : Complex.normSq a - Complex.normSq b = 1) : SU11 :=
  ⟨⟨!![a, b; conj b, conj a], by
      rw [Matrix.det_fin_two_of, Complex.mul_conj, Complex.mul_conj]
      exact_mod_cast h⟩, by
    show _ ∧ _
    simp⟩

/-- SpecialFunctionsGroupModels 0.1 (local copy). The rotation `k_α = diag(e^{iα/2}, e^{-iα/2})`. -/
def rotation (α : ℝ) : SU11 :=
  ofPair (Complex.exp (((α / 2 : ℝ) : ℂ) * Complex.I)) 0 (by
    rw [map_zero, sub_zero, Complex.normSq_eq_norm_sq, Complex.norm_exp_ofReal_mul_I]
    norm_num)

/-- SpecialFunctionsGroupModels 0.1 (local copy). The boost
`b_t = [[cosh (t/2), sinh (t/2)], [sinh (t/2), cosh (t/2)]]`. -/
def boost (t : ℝ) : SU11 :=
  ofPair (Real.cosh (t / 2) : ℂ) (Real.sinh (t / 2) : ℂ) (by
    rw [Complex.normSq_ofReal, Complex.normSq_ofReal]
    linear_combination Real.cosh_sq_sub_sinh_sq (t / 2))

/-- SpecialFunctionsGroupModels 0.1 (local copy). The second boost
`[[cosh (t/2), i sinh (t/2)], [-i sinh (t/2), cosh (t/2)]]`. -/
def boostY (t : ℝ) : SU11 :=
  ofPair (Real.cosh (t / 2) : ℂ) ((Real.sinh (t / 2) : ℂ) * Complex.I) (by
    rw [Complex.normSq_mul, Complex.normSq_I, Complex.normSq_ofReal, Complex.normSq_ofReal]
    linear_combination Real.cosh_sq_sub_sinh_sq (t / 2))

/-- SpecialFunctionsGroupModels 0.1 (local copy). The Euler parametrization
`g(α, t, γ) = k_α b_t k_γ`. -/
def euler (α t γ : ℝ) : SU11 := rotation α * boost t * rotation γ

end SU11

instance : Fact (0 < 2 * π) := ⟨Real.two_pi_pos⟩

/-- The circle `ℝ / 2πℤ` carrying the angle `θ`. -/
local notation "𝕋" => AddCircle (2 * π)

namespace SU11

/-- SpecialFunctionsGroupModels 2.1 (local copy). The denominator `b z + conj a` of the
fractional linear map of `g`. -/
def circleDenominator (g : SU11) (z : ℂ) : ℂ := entryB g * z + conj (entryA g)

/-- SpecialFunctionsGroupModels 2.1 (local copy). The right action
`e^{iθ} ↦ (a e^{iθ} + conj b) / (b e^{iθ} + conj a)` of `SU(1,1)` on the circle, on angles. -/
def circleAct (g : SU11) (θ : 𝕋) : 𝕋 :=
  ((Complex.arg ((entryA g * fourier 1 θ + conj (entryB g)) /
    circleDenominator g (fourier 1 θ)) : ℝ) : 𝕋)

/-- SpecialFunctionsGroupModels 2.1 (local copy). The principal-series multiplier
`|u|^{2τ} (u / |u|)^{e}`, `u = b e^{iθ} + conj a`, with `e = 2ε ∈ {0, 1}`. -/
def principalMultiplier (τ : ℂ) (e : Fin 2) (g : SU11) (θ : 𝕋) : ℂ :=
  let u := circleDenominator g (fourier 1 θ)
  ((‖u‖ : ℂ) ^ (2 * τ)) * (u / (‖u‖ : ℂ)) ^ (e : ℕ)

/-- SpecialFunctionsGroupModels 2.1 (local copy). The principal-series action on functions on
the circle. -/
def principalAction (τ : ℂ) (e : Fin 2) (g : SU11) (f : 𝕋 → ℂ) (θ : 𝕋) : ℂ :=
  principalMultiplier τ e g θ * f (circleAct g θ)

/-- SpecialFunctionsGroupModels 2.1 (local copy). A representation on `L²(𝕋)` realizes the
principal series when it agrees almost everywhere with the pointwise formula and has continuous
orbit maps. -/
def IsPrincipalSeriesRealization (τ : ℂ) (e : Fin 2)
    (U : ContRepresentation ℂ SU11 (Lp ℂ 2 (haarAddCircle (T := 2 * π)))) : Prop :=
  (∀ g f, (U g f : 𝕋 → ℂ) =ᵐ[haarAddCircle] principalAction τ e g f) ∧
    ∀ f, Continuous fun g => U g f

open scoped Classical in
/-- SpecialFunctionsGroupModels 2.1 (local copy). The principal series `T_{(τ, e/2)}` of
`SU(1,1)` on `L²(𝕋)`: the realization of the pointwise formula when one exists, and the trivial
representation otherwise. -/
def principalSeries (τ : ℂ) (e : Fin 2) :
    ContRepresentation ℂ SU11 (Lp ℂ 2 (haarAddCircle (T := 2 * π))) :=
  if h : ∃ U, IsPrincipalSeriesRealization τ e U then h.choose else .ofMonoidHom 1

end SU11

/-- SpecialFunctionsGroupModels 2.2 (local copy). The complementary-series weight
`Γ(τ - n + 1) / Γ(-τ - n)`. -/
def complementaryWeight (τ : ℝ) (n : ℤ) : ℝ :=
  Real.Gamma (τ - n + 1) / Real.Gamma (-τ - n)

/-- SpecialFunctionsGroupModels 2.3 (local copy). The weighted Bergman probability measure
`((k-1)/π) (1 - |z|²)^{k-2} dA` on the unit disc. -/
def bergmanMeasure (k : ℕ) : Measure ℂ :=
  (volume.restrict (Metric.ball (0 : ℂ) 1)).withDensity
    fun z => ENNReal.ofReal (((k : ℝ) - 1) / π * (1 - ‖z‖ ^ 2) ^ (k - 2))

namespace SU11

/-- SpecialFunctionsGroupModels 2.3 (local copy). The right action
`z ↦ (a z + conj b) / (b z + conj a)` on the disc. -/
def diskAct (g : SU11) (z : ℂ) : ℂ :=
  (entryA g * z + conj (entryB g)) / circleDenominator g z

/-- SpecialFunctionsGroupModels 2.3 (local copy). The holomorphic discrete series action
`(b z + conj a)^{-k} h(z · g)`. -/
def discreteAction (k : ℕ) (g : SU11) (h : ℂ → ℂ) (z : ℂ) : ℂ :=
  circleDenominator g z ^ (-(k : ℤ)) * h (diskAct g z)

end SU11

section MatrixElements

variable {G H ι : Type*} [Group G] [NormedAddCommGroup H] [InnerProductSpace ℂ H]

/-- SpecialFunctionsGroupModels 3.1 (local copy). The matrix element `D_{mn}(g) = ⟪e_m, U(g) e_n⟫`
of a representation in a Hilbert basis, Edmonds's `⟨m|D(g)|n⟩`. -/
def matrixElement (U : ContRepresentation ℂ G H) (e : HilbertBasis ι ℂ H) (m n : ι) (g : G) : ℂ :=
  ⟪e m, U g (e n)⟫_ℂ

end MatrixElements

/-! ## Layer 1: the functions `𝔓^τ_{mn}` -/

namespace SU11

/-- README 1.1. Vilenkin and Klimyk's `𝔓^τ_{mn}(cosh t)` as a function of `t`:
`(2π)⁻¹ ∫₀^{2π} (cosh(t/2) + sinh(t/2) e^{iθ})^{τ+n} (cosh(t/2) + sinh(t/2) e^{-iθ})^{τ-n}
e^{i(m-n)θ} dθ`, with principal powers of bases of positive real part. -/
def boostMatrixElement (τ : ℂ) (m n t : ℝ) : ℂ :=
  ((2 * π : ℝ) : ℂ)⁻¹ * ∫ θ in (0 : ℝ)..2 * π,
    ((Real.cosh (t / 2) : ℂ) + Real.sinh (t / 2) * Complex.exp ((θ : ℂ) * Complex.I)) ^ (τ + n) *
      ((Real.cosh (t / 2) : ℂ) + Real.sinh (t / 2) * Complex.exp (-((θ : ℂ) * Complex.I))) ^
        (τ - n) *
      Complex.exp (((m - n : ℝ) : ℂ) * θ * Complex.I)

/-- README 1.1. **Principal-series matrix elements.** With `m' = n' - e/2` and `m = n - e/2`,
`D_{m'm}(g(α, t, γ)) = e^{i(m'α + mγ)} 𝔓^τ_{m'm}(cosh t)`. -/
theorem principalSeries_matrixElement_euler_eq (τ : ℂ) (e : Fin 2) (n' n : ℤ) (α t γ : ℝ) :
    matrixElement (principalSeries τ e) (fourierBasis (T := 2 * π)) n' n (euler α t γ) =
      Complex.exp ((((n' - (e : ℕ) / 2 : ℝ) * α + (n - (e : ℕ) / 2 : ℝ) * γ : ℝ) : ℂ) *
          Complex.I) *
        boostMatrixElement τ (n' - (e : ℕ) / 2) (n - (e : ℕ) / 2) t := by
  sorry

/-- README 1.1. **Value at the identity.** `𝔓^τ_{n+k,n}(1) = δ_{k0}`. -/
theorem boostMatrixElement_zero (τ : ℂ) (n : ℝ) (k : ℤ) :
    boostMatrixElement τ (n + k) n 0 = if k = 0 then 1 else 0 := by
  sorry

/-- README 1.1. **Holomorphy in the degree.** `τ ↦ 𝔓^τ_{mn}(cosh t)` is entire. -/
theorem differentiable_boostMatrixElement_degree (m n t : ℝ) :
    Differentiable ℂ fun τ => boostMatrixElement τ m n t := by
  sorry

/-- README 1.1. **Real analyticity in `t`.** -/
theorem contDiff_boostMatrixElement_radius (τ : ℂ) (m n : ℝ) :
    ContDiff ℝ ω fun t => boostMatrixElement τ m n t := by
  sorry

/-- README 1.1. **Parity.** `𝔓^τ_{n+k,n}` at `-t` is `(-1)^k` times its value at `t`. -/
theorem boostMatrixElement_neg (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) :
    boostMatrixElement τ (n + k) n (-t) = (-1 : ℂ) ^ k * boostMatrixElement τ (n + k) n t := by
  sorry

/-- README 1.2. **The `tanh²` form.** For `m = n + k`, `k ∈ ℕ`,
`𝔓^τ_{mn} = (τ - m + 1)_k / k! · cosh^{2τ}(t/2) tanh^k(t/2)
F(-τ - n, -τ + m; k + 1; tanh²(t/2))`. -/
theorem boostMatrixElement_eq_hypergeometric (τ : ℂ) (n : ℝ) (k : ℕ) (t : ℝ) :
    boostMatrixElement τ (n + k) n t =
      (ascPochhammer ℂ k).eval (τ - (n + k : ℝ) + 1) / (k.factorial : ℂ) *
        (Real.cosh (t / 2) : ℂ) ^ (2 * τ) * (Real.tanh (t / 2) : ℂ) ^ k *
        ordinaryHypergeometric (-τ - n) (-τ + (n + k : ℝ)) ((k : ℂ) + 1)
          ((Real.tanh (t / 2) : ℂ) ^ 2) := by
  sorry

/-- README 1.3. **Laplace's integral.**
`𝔓^τ_{00}(cosh t) = π⁻¹ ∫₀^π (cosh t + sinh t cos φ)^τ dφ`. -/
theorem boostMatrixElement_zero_zero (τ : ℂ) (t : ℝ) :
    boostMatrixElement τ 0 0 t =
      ((π : ℝ) : ℂ)⁻¹ * ∫ φ in (0 : ℝ)..π,
        ((Real.cosh t + Real.sinh t * Real.cos φ : ℝ) : ℂ) ^ τ := by
  sorry

/-- README 1.4. **Sign reversal.** `𝔓^τ_{-m,-n} = 𝔓^τ_{mn}`. -/
theorem boostMatrixElement_neg_neg (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) :
    boostMatrixElement τ (-(n + k)) (-n) t = boostMatrixElement τ (n + k) n t := by
  sorry

/-- README 1.4. **Transposition**, with reciprocal Gamma functions:
`𝔓^τ_{mn} / (Γ(τ + n + 1) Γ(τ - n + 1)) = 𝔓^τ_{nm} / (Γ(τ + m + 1) Γ(τ - m + 1))`. -/
theorem boostMatrixElement_swap (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) :
    boostMatrixElement τ (n + k) n t * ((Gamma (τ + n + 1))⁻¹ * (Gamma (τ - n + 1))⁻¹) =
      boostMatrixElement τ n (n + k) t *
        ((Gamma (τ + (n + k : ℝ) + 1))⁻¹ * (Gamma (τ - (n + k : ℝ) + 1))⁻¹) := by
  sorry

/-- README 1.4. **Reflection of the degree**, with reciprocal Gamma functions:
`𝔓^{-τ-1}_{mn} / (Γ(τ - m + 1) Γ(τ + m + 1))` equals
`(-1)^{m-n} 𝔓^τ_{mn} / (Γ(τ - n + 1) Γ(τ + n + 1))`. -/
theorem boostMatrixElement_reflect (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) :
    boostMatrixElement (-τ - 1) (n + k) n t *
        ((Gamma (τ - (n + k : ℝ) + 1))⁻¹ * (Gamma (τ + (n + k : ℝ) + 1))⁻¹) =
      (-1 : ℂ) ^ k * boostMatrixElement τ (n + k) n t *
        ((Gamma (τ - n + 1))⁻¹ * (Gamma (τ + n + 1))⁻¹) := by
  sorry

/-- README 1.4. **Conjugation.** `conj 𝔓^τ_{mn} = 𝔓^{conj τ}_{mn}`. -/
theorem conj_boostMatrixElement (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) :
    conj (boostMatrixElement τ (n + k) n t) = boostMatrixElement (conj τ) (n + k) n t := by
  sorry

/-- README 1.5. **Vanishing.** For `ℓ = N/2` and `m, n ∈ ℓ + ℤ`, `𝔓^ℓ_{mn} = 0` when
`|n| ≤ ℓ < |m|`. -/
theorem boostMatrixElement_eq_zero_of_lt (N : ℕ) (a b : ℤ) (t : ℝ)
    (hn : |(N / 2 + b : ℝ)| ≤ N / 2) (hm : (N / 2 : ℝ) < |(N / 2 + a : ℝ)|) :
    boostMatrixElement ((N : ℂ) / 2) (N / 2 + a) (N / 2 + b) t = 0 := by
  sorry

/-! ## Layer 2: the unitary series -/

/-- README 2.1. **Unitarity relations of the principal series**, the column through
`n - e/2`: `Σ_k |𝔓^τ_{n+k,n}(cosh t)|² = 1` for `Re τ = -1/2`. -/
theorem hasSum_norm_sq_boostMatrixElement_row (τ : ℂ) (hτ : τ.re = -1 / 2) (e : Fin 2) (n : ℤ)
    (t : ℝ) :
    HasSum (fun k : ℤ =>
      ‖boostMatrixElement τ (n - (e : ℕ) / 2 + k) (n - (e : ℕ) / 2) t‖ ^ 2) 1 := by
  sorry

/-- README 2.1. **Unitarity relations of the principal series**, the row through `n - e/2`:
`Σ_k |𝔓^τ_{n,n+k}(cosh t)|² = 1` for `Re τ = -1/2`. -/
theorem hasSum_norm_sq_boostMatrixElement_column (τ : ℂ) (hτ : τ.re = -1 / 2) (e : Fin 2)
    (n : ℤ) (t : ℝ) :
    HasSum (fun k : ℤ =>
      ‖boostMatrixElement τ (n - (e : ℕ) / 2) (n - (e : ℕ) / 2 + k) t‖ ^ 2) 1 := by
  sorry

/-- README 2.1. **Bound.** `|𝔓^τ_{mn}(cosh t)| ≤ 1` for `Re τ = -1/2`. -/
theorem norm_boostMatrixElement_le_one (τ : ℂ) (hτ : τ.re = -1 / 2) (e : Fin 2) (n' n : ℤ)
    (t : ℝ) :
    ‖boostMatrixElement τ (n' - (e : ℕ) / 2) (n - (e : ℕ) / 2) t‖ ≤ 1 := by
  sorry

/-- README 2.1. **Complementary series.** For real `-1 < τ < 0`, with `w = complementaryWeight τ`,
`Σ_k w(k)/w(n) |𝔓^τ_{kn}(cosh t)|² = 1`. -/
theorem hasSum_complementarySeries_weighted_norm_sq (τ : ℝ) (hτ : τ ∈ Ioo (-1) 0) (n : ℤ)
    (t : ℝ) :
    HasSum (fun k : ℤ => complementaryWeight τ k / complementaryWeight τ n *
        ‖boostMatrixElement τ k n t‖ ^ 2) 1 := by
  sorry

/-- README 2.1. **Boundedness range.** `t ↦ 𝔓^τ_{00}(cosh t)` is bounded on `[0, ∞)` exactly when
`-1 ≤ Re τ ≤ 0`. -/
theorem isBounded_boostMatrixElement_zero_zero_iff (τ : ℂ) :
    Bornology.IsBounded ((fun t => boostMatrixElement τ 0 0 t) '' Ici 0) ↔
      -1 ≤ τ.re ∧ τ.re ≤ 0 := by
  sorry

/-- README 2.2. The discrete-series matrix element `⟪φ_{j'}, T(g) φ_j⟫` in the weighted Bergman
space of weight `k`, with the orthonormal basis `φ_j = C(k - 1 + j, j)^{1/2} z^j`. -/
def discreteMatrixElement (k j' j : ℕ) (g : SU11) : ℂ :=
  (Real.sqrt ((Nat.choose (k - 1 + j') j' : ℝ) * Nat.choose (k - 1 + j) j) : ℂ) *
    ∫ z, conj (z ^ j') * discreteAction k g (fun w => w ^ j) z ∂bergmanMeasure k

/-- README 2.2. **Discrete-series matrix elements.** With `m' = k/2 + j'`, `m = k/2 + j`,
`D_{j'j}(g(α, t, γ)) = e^{i(m'α + mγ)} (C_j / C_{j'})^{1/2} 𝔓^{-k/2}_{m'm}(cosh t)`. -/
theorem discreteMatrixElement_euler (k j' j : ℕ) (hk : 2 ≤ k) (α t γ : ℝ) :
    discreteMatrixElement k j' j (euler α t γ) =
      Complex.exp ((((k / 2 + j' : ℝ) * α + (k / 2 + j : ℝ) * γ : ℝ) : ℂ) * Complex.I) *
        (Real.sqrt ((Nat.choose (k - 1 + j) j : ℝ) / Nat.choose (k - 1 + j') j') : ℂ) *
        boostMatrixElement (-(k : ℂ) / 2) (k / 2 + j') (k / 2 + j) t := by
  sorry

/-- README 2.2. **Generating function.** `(C_{j'}/C_j)^{1/2} D_{j'j}(b_t)` is the coefficient of
`z^{j'}` in `(cosh(t/2) z + sinh(t/2))^j (sinh(t/2) z + cosh(t/2))^{-k-j}`. -/
theorem discreteMatrixElement_boost_coeff (k j' j : ℕ) (hk : 2 ≤ k) (t : ℝ) :
    (Real.sqrt ((Nat.choose (k - 1 + j') j' : ℝ) / Nat.choose (k - 1 + j) j) : ℂ) *
        discreteMatrixElement k j' j (boost t) =
      iteratedDeriv j' (fun z : ℂ => ((Real.cosh (t / 2) : ℂ) * z + Real.sinh (t / 2)) ^ j *
          ((Real.sinh (t / 2) : ℂ) * z + Real.cosh (t / 2)) ^ (-((k + j : ℕ) : ℤ))) 0 /
        (j'.factorial : ℂ) := by
  sorry

/-- README 2.2. **Unitarity.** `Σ_{j'} |D_{j'j}(g)|² = 1`. -/
theorem hasSum_norm_sq_discreteMatrixElement (k j : ℕ) (hk : 2 ≤ k) (g : SU11) :
    HasSum (fun j' : ℕ => ‖discreteMatrixElement k j' j g‖ ^ 2) 1 := by
  sorry

/-! ## Layer 3: identities from the group law -/

/-- README 3.1. **The Euler angles of a product.** If `b_{t₁} g(φ, t₂, 0) = g(α, t, γ)` then
`cosh t = cosh t₁ cosh t₂ + sinh t₁ sinh t₂ cos φ`. -/
theorem cosh_of_boost_mul_euler (t₁ t₂ φ α t γ : ℝ)
    (h : boost t₁ * euler φ t₂ 0 = euler α t γ) :
    Real.cosh t = Real.cosh t₁ * Real.cosh t₂ + Real.sinh t₁ * Real.sinh t₂ * Real.cos φ := by
  sorry

/-- README 3.1. **Addition theorem.** With `b_{t₁} g(φ, t₂, 0) = g(α, t, γ)`,
`Σ_k 𝔓^τ_{m'k}(cosh t₁) e^{ikφ} 𝔓^τ_{km}(cosh t₂) = e^{i(m'α + mγ)} 𝔓^τ_{m'm}(cosh t)`. -/
theorem hasSum_boostMatrixElement_addition (τ : ℂ) (e : Fin 2) (n' n : ℤ) (t₁ t₂ φ α t γ : ℝ)
    (h : boost t₁ * euler φ t₂ 0 = euler α t γ) :
    HasSum (fun k : ℤ =>
        boostMatrixElement τ (n' - (e : ℕ) / 2) (k - (e : ℕ) / 2) t₁ *
          Complex.exp ((((k - (e : ℕ) / 2 : ℝ) * φ : ℝ) : ℂ) * Complex.I) *
          boostMatrixElement τ (k - (e : ℕ) / 2) (n - (e : ℕ) / 2) t₂)
      (Complex.exp ((((n' - (e : ℕ) / 2 : ℝ) * α + (n - (e : ℕ) / 2 : ℝ) * γ : ℝ) : ℂ) *
          Complex.I) *
        boostMatrixElement τ (n' - (e : ℕ) / 2) (n - (e : ℕ) / 2) t) := by
  sorry

/-- README 3.2. **Multiplication formula, Fourier-coefficient form.**
`𝔓^τ_{0k}(cosh t₁) 𝔓^τ_{k0}(cosh t₂) = (2π)⁻¹ ∫₀^{2π} e^{-ikφ} 𝔓^τ_{00}(x(φ)) dφ`. -/
theorem boostMatrixElement_mul_boostMatrixElement (τ : ℂ) (k : ℤ) (t₁ t₂ : ℝ) :
    boostMatrixElement τ 0 k t₁ * boostMatrixElement τ k 0 t₂ =
      ((2 * π : ℝ) : ℂ)⁻¹ * ∫ φ in (0 : ℝ)..2 * π,
        Complex.exp (-(((k * φ : ℝ) : ℂ) * Complex.I)) *
          boostMatrixElement τ 0 0
            (Real.arcosh (Real.cosh t₁ * Real.cosh t₂ +
              Real.sinh t₁ * Real.sinh t₂ * Real.cos φ)) := by
  sorry

/-- README 3.2. **Product formula with the triangle kernel.** -/
theorem boostMatrixElement_product_kernel (τ : ℂ) (t₁ t₂ : ℝ) (h₁ : 0 < t₁) (h₂ : 0 < t₂) :
    boostMatrixElement τ 0 0 t₁ * boostMatrixElement τ 0 0 t₂ =
      ((π : ℝ) : ℂ)⁻¹ * ∫ s in |t₁ - t₂|..(t₁ + t₂),
        boostMatrixElement τ 0 0 s *
          ((Real.sinh s / Real.sqrt ((Real.cosh (t₁ + t₂) - Real.cosh s) *
            (Real.cosh s - Real.cosh (t₁ - t₂))) : ℝ) : ℂ) := by
  sorry

/-- README 3.3. **Generating function.**
`Σ_k 𝔓^τ_{n+k,n}(cosh t) e^{-ikθ} = (cosh(t/2) + sinh(t/2) e^{iθ})^{τ+n}
(cosh(t/2) + sinh(t/2) e^{-iθ})^{τ-n}`. -/
theorem hasSum_boostMatrixElement_fourier (τ : ℂ) (n t θ : ℝ) :
    HasSum (fun k : ℤ => boostMatrixElement τ (n + k) n t *
        Complex.exp (-(((k * θ : ℝ) : ℂ) * Complex.I)))
      (((Real.cosh (t / 2) : ℂ) + Real.sinh (t / 2) * Complex.exp ((θ : ℂ) * Complex.I)) ^
          (τ + n) *
        ((Real.cosh (t / 2) : ℂ) + Real.sinh (t / 2) * Complex.exp (-((θ : ℂ) * Complex.I))) ^
          (τ - n)) := by
  sorry

/-- README 3.3. **Row sums.** `Σ_k 𝔓^τ_{n+k,n}(cosh t) = e^{τt}`. -/
theorem hasSum_boostMatrixElement_row (τ : ℂ) (n t : ℝ) :
    HasSum (fun k : ℤ => boostMatrixElement τ (n + k) n t) (Complex.exp (τ * t)) := by
  sorry

/-- README 3.3. **Row sums**, alternating: `Σ_k (-1)^k 𝔓^τ_{n+k,n}(cosh t) = e^{-τt}`. -/
theorem hasSum_boostMatrixElement_row_alternating (τ : ℂ) (n t : ℝ) :
    HasSum (fun k : ℤ => (-1 : ℂ) ^ k * boostMatrixElement τ (n + k) n t)
      (Complex.exp (-(τ * t))) := by
  sorry

/-- README 3.3. **Convolution in the degree.**
`𝔓^{τ₁+τ₂}_{m, n₁+n₂} = Σ_k 𝔓^{τ₁}_{n₁+k, n₁} 𝔓^{τ₂}_{m-n₁-k, n₂}`, `m = n₁ + n₂ + j`. -/
theorem hasSum_boostMatrixElement_degree (τ₁ τ₂ : ℂ) (n₁ n₂ : ℝ) (j : ℤ) (t : ℝ) :
    HasSum (fun k : ℤ => boostMatrixElement τ₁ (n₁ + k) n₁ t *
        boostMatrixElement τ₂ (n₂ + (j - k : ℤ)) n₂ t)
      (boostMatrixElement (τ₁ + τ₂) (n₁ + n₂ + j) (n₁ + n₂) t) := by
  sorry

/-- README 3.3. **Shift of the degree by `1/2`.** With `m = n + 1/2 + k`,
`𝔓^{τ+1/2}_{m, n+1/2} = cosh(t/2) 𝔓^τ_{m-1/2, n} + sinh(t/2) 𝔓^τ_{m+1/2, n}`. -/
theorem boostMatrixElement_degree_shift (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) :
    boostMatrixElement (τ + 1 / 2) (n + 1 / 2 + k) (n + 1 / 2) t =
      Real.cosh (t / 2) * boostMatrixElement τ (n + k) n t +
        Real.sinh (t / 2) * boostMatrixElement τ (n + 1 + k) n t := by
  sorry

/-! ## Layer 4: recurrences -/

/-- README 4.1. **Derivatives**, in the first index. With `m = n + k`,
`d/dt 𝔓^τ_{mn} = ½(τ - m + 1) 𝔓^τ_{m-1,n} + ½(τ + m + 1) 𝔓^τ_{m+1,n}`. -/
theorem hasDerivAt_boostMatrixElement_left (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) :
    HasDerivAt (fun s => boostMatrixElement τ (n + k) n s)
      ((τ - (n + k : ℝ) + 1) / 2 * boostMatrixElement τ (n + k - 1) n t +
        (τ + (n + k : ℝ) + 1) / 2 * boostMatrixElement τ (n + k + 1) n t) t := by
  sorry

/-- README 4.1. **Derivatives**, in the second index. With `m = n + k`,
`d/dt 𝔓^τ_{mn} = ½(τ + n) 𝔓^τ_{m,n-1} + ½(τ - n) 𝔓^τ_{m,n+1}`. -/
theorem hasDerivAt_boostMatrixElement_right (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) :
    HasDerivAt (fun s => boostMatrixElement τ (n + k) n s)
      ((τ + n) / 2 * boostMatrixElement τ (n + k) (n - 1) t +
        (τ - n) / 2 * boostMatrixElement τ (n + k) (n + 1) t) t := by
  sorry

/-- README 4.1. **Ladder relations**, lowering. For `t ≠ 0` and `m = n + k`,
`d/dt 𝔓^τ_{mn} + (n cosh t - m)/sinh t · 𝔓^τ_{mn} = (τ + n) 𝔓^τ_{m,n-1}`. -/
theorem boostMatrixElement_ladder_lower (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) (ht : t ≠ 0) :
    deriv (fun s => boostMatrixElement τ (n + k) n s) t +
        (((n * Real.cosh t - (n + k)) / Real.sinh t : ℝ) : ℂ) * boostMatrixElement τ (n + k) n t =
      (τ + n) * boostMatrixElement τ (n + k) (n - 1) t := by
  sorry

/-- README 4.1. **Ladder relations**, raising. For `t ≠ 0` and `m = n + k`,
`d/dt 𝔓^τ_{mn} - (n cosh t - m)/sinh t · 𝔓^τ_{mn} = (τ - n) 𝔓^τ_{m,n+1}`. -/
theorem boostMatrixElement_ladder_raise (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) (ht : t ≠ 0) :
    deriv (fun s => boostMatrixElement τ (n + k) n s) t -
        (((n * Real.cosh t - (n + k)) / Real.sinh t : ℝ) : ℂ) * boostMatrixElement τ (n + k) n t =
      (τ - n) * boostMatrixElement τ (n + k) (n + 1) t := by
  sorry

/-- README 4.2. **Three-term recurrences**, in the second index. For `t ≠ 0` and `m = n + k`,
`2(n cosh t - m)/sinh t · 𝔓^τ_{mn} = (τ + n) 𝔓^τ_{m,n-1} - (τ - n) 𝔓^τ_{m,n+1}`. -/
theorem boostMatrixElement_recurrence_right (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) (ht : t ≠ 0) :
    ((2 * (n * Real.cosh t - (n + k)) / Real.sinh t : ℝ) : ℂ) *
        boostMatrixElement τ (n + k) n t =
      (τ + n) * boostMatrixElement τ (n + k) (n - 1) t -
        (τ - n) * boostMatrixElement τ (n + k) (n + 1) t := by
  sorry

/-- README 4.2. **Three-term recurrences**, in the first index. For `t ≠ 0` and `m = n + k`,
`2(m cosh t - n)/sinh t · 𝔓^τ_{mn} = (τ - m + 1) 𝔓^τ_{m-1,n} - (τ + m + 1) 𝔓^τ_{m+1,n}`. -/
theorem boostMatrixElement_recurrence_left (τ : ℂ) (n : ℝ) (k : ℤ) (t : ℝ) (ht : t ≠ 0) :
    ((2 * ((n + k) * Real.cosh t - n) / Real.sinh t : ℝ) : ℂ) *
        boostMatrixElement τ (n + k) n t =
      (τ - (n + k : ℝ) + 1) * boostMatrixElement τ (n + k - 1) n t -
        (τ + (n + k : ℝ) + 1) * boostMatrixElement τ (n + k + 1) n t := by
  sorry

/-! ## Layer 5: other subgroups and transforms -/

/-- README 5.1. The parabolic element `[[1 + is/2, s/2], [s/2, 1 - is/2]]`. -/
def parabolic (s : ℝ) : SU11 :=
  ofPair ((1 : ℂ) + ((s / 2 : ℝ) : ℂ) * Complex.I) ((s / 2 : ℝ) : ℂ) (by
    have h : (1 : ℂ) + ((s / 2 : ℝ) : ℂ) * Complex.I =
        ((1 : ℝ) : ℂ) + ((s / 2 : ℝ) : ℂ) * Complex.I := by simp
    rw [h, Complex.normSq_add_mul_I, Complex.normSq_ofReal]
    ring)

/-- README 5.1. **The parabolic subgroup**: `parabolic` is a homomorphism from `ℝ`. -/
theorem parabolic_add (s s' : ℝ) : parabolic (s + s') = parabolic s * parabolic s' := by
  sorry

/-- README 5.1. **The parabolic subgroup in Euler angles**:
`parabolic s = g(β, 2 arsinh(s/2), β)` with `β = arctan(s/2)`. -/
theorem parabolic_eq_euler (s : ℝ) :
    parabolic s =
      euler (Real.arctan (s / 2)) (2 * Real.arsinh (s / 2)) (Real.arctan (s / 2)) := by
  sorry

/-- README 5.1. **The second hyperbolic subgroup.**
`D_{m'm}(boostY t) = i^{m'-m} 𝔓^τ_{m'm}(cosh t)`. -/
theorem principalSeries_matrixElement_boostY (τ : ℂ) (e : Fin 2) (n' n : ℤ) (t : ℝ) :
    matrixElement (principalSeries τ e) (fourierBasis (T := 2 * π)) n' n (boostY t) =
      Complex.I ^ (n' - n) * boostMatrixElement τ (n' - (e : ℕ) / 2) (n - (e : ℕ) / 2) t := by
  sorry

/-- README 5.1. **Matrix elements on the parabolic subgroup.**
`D_{m'm}(parabolic s) = e^{i(m'+m) arctan(s/2)} 𝔓^τ_{m'm}(cosh(2 arsinh(s/2)))`. -/
theorem principalSeries_matrixElement_parabolic (τ : ℂ) (e : Fin 2) (n' n : ℤ) (s : ℝ) :
    matrixElement (principalSeries τ e) (fourierBasis (T := 2 * π)) n' n (parabolic s) =
      Complex.exp ((((n' - (e : ℕ) / 2 + (n - (e : ℕ) / 2) : ℝ) * Real.arctan (s / 2) : ℝ) : ℂ) *
          Complex.I) *
        boostMatrixElement τ (n' - (e : ℕ) / 2) (n - (e : ℕ) / 2) (2 * Real.arsinh (s / 2)) := by
  sorry

/-- README 5.2. The measure `sinh t dt` on `(0, ∞)`. -/
def sinhMeasure : Measure ℝ :=
  (volume.restrict (Ioi 0)).withDensity fun t => ENNReal.ofReal (Real.sinh t)

/-- README 5.2. The Plancherel measure `ρ tanh(πρ) dρ` on `(0, ∞)`. -/
def plancherelMeasure : Measure ℝ :=
  (volume.restrict (Ioi 0)).withDensity fun ρ => ENNReal.ofReal (ρ * Real.tanh (π * ρ))

/-- README 5.2. The Mehler–Fock transform `ρ ↦ ∫₀^∞ f(t) 𝔓^{-1/2+iρ}_{00}(cosh t) sinh t dt`. -/
def mehlerFock (f : ℝ → ℂ) (ρ : ℝ) : ℂ :=
  ∫ t, f t * boostMatrixElement (-1 / 2 + ρ * Complex.I) 0 0 t ∂sinhMeasure

/-- README 5.2. **Parseval.** -/
theorem lintegral_mehlerFock (f : ℝ → ℂ) (hf : Continuous f) (hc : HasCompactSupport f)
    (hs : tsupport f ⊆ Ioi 0) :
    ∫⁻ t, ‖f t‖ₑ ^ 2 ∂sinhMeasure = ∫⁻ ρ, ‖mehlerFock f ρ‖ₑ ^ 2 ∂plancherelMeasure := by
  sorry

/-- README 5.2. **Inversion.** -/
theorem mehlerFock_inversion (f : ℝ → ℂ) (hf : ContDiff ℝ ∞ f) (hc : HasCompactSupport f)
    (hs : tsupport f ⊆ Ioi 0) (t : ℝ) (ht : 0 < t) :
    f t = ∫ ρ, mehlerFock f ρ * boostMatrixElement (-1 / 2 + ρ * Complex.I) 0 0 t
      ∂plancherelMeasure := by
  sorry

/-- README 5.2. **Unitarity.** A unitary `L²(sinh t dt) ≃ L²(ρ tanh(πρ) dρ)` agreeing with
`mehlerFock` on continuous compactly supported functions. -/
theorem exists_mehlerFock_unitary :
    ∃ U : Lp ℂ 2 sinhMeasure ≃ₗᵢ[ℂ] Lp ℂ 2 plancherelMeasure,
      ∀ (f : ℝ → ℂ), Continuous f → HasCompactSupport f → tsupport f ⊆ Ioi 0 →
        ∀ hm : MemLp f 2 sinhMeasure,
          (U (hm.toLp f) : ℝ → ℂ) =ᵐ[plancherelMeasure] mehlerFock f := by
  sorry

/-- README 5.3. The Mehler–Fock transform of order `m`,
`ρ ↦ ∫₀^∞ f(t) conj 𝔓^{-1/2+iρ}_{m0}(cosh t) sinh t dt`. -/
def mehlerFockOrder (m : ℤ) (f : ℝ → ℂ) (ρ : ℝ) : ℂ :=
  ∫ t, f t * conj (boostMatrixElement (-1 / 2 + ρ * Complex.I) m 0 t) ∂sinhMeasure

/-- README 5.3. **Parseval of order `m`.** -/
theorem lintegral_mehlerFockOrder (m : ℤ) (f : ℝ → ℂ) (hf : Continuous f)
    (hc : HasCompactSupport f) (hs : tsupport f ⊆ Ioi 0) :
    ∫⁻ t, ‖f t‖ₑ ^ 2 ∂sinhMeasure = ∫⁻ ρ, ‖mehlerFockOrder m f ρ‖ₑ ^ 2 ∂plancherelMeasure := by
  sorry

/-- README 5.3. **Inversion of order `m`.** -/
theorem mehlerFockOrder_inversion (m : ℤ) (f : ℝ → ℂ) (hf : ContDiff ℝ ∞ f)
    (hc : HasCompactSupport f) (hs : tsupport f ⊆ Ioi 0) (t : ℝ) (ht : 0 < t) :
    f t = ∫ ρ, mehlerFockOrder m f ρ * boostMatrixElement (-1 / 2 + ρ * Complex.I) m 0 t
      ∂plancherelMeasure := by
  sorry

end SU11

/-! ## Mathlib and Tau Ceti names used in the README -/

#check @ordinaryHypergeometric
#check @ascPochhammer
#check @Complex.Gamma
#check @Real.Gamma
#check @Real.arcosh
#check @Real.arsinh
#check @Real.arctan
#check @fourierBasis
#check @fourierLp
#check @haarAddCircle
#check @HilbertBasis
#check @HasSum
#check @HasDerivAt
#check @ContDiff
#check @Differentiable
#check @Bornology.IsBounded
#check @iteratedDeriv
#check @Complex.cpow_add
#check @intervalIntegral
#check @MeasureTheory.Measure.withDensity
#check @MeasureTheory.Lp
#check @LinearIsometryEquiv
#check @ContRepresentation

end TauCetiRoadmap.SpecialFunctionsSU11MatrixElements
