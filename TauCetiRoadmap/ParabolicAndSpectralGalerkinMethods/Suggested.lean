module

public import Mathlib
public import TauCeti.Analysis.PDE.DirichletProblem
public import TauCeti.Analysis.PDE.EnergyForm.Sobolev
public import TauCeti.Analysis.PDE.Parabolic.Galerkin
public import TauCeti.Analysis.Sobolev.W1p.Zero
public import TauCeti.Analysis.Sobolev.Wkp.Restriction

/-!
# Parabolic and spectral Galerkin methods: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions): an abstract parabolic problem has a trial space `V`, a pivot
inner product space `H`, a continuous linear map `ι : V →L[ℝ] H` and a bilinear form
`a : V →L[ℝ] V →L[ℝ] ℝ`; projections and discrete solutions are predicates, never chosen
functions; time derivatives are `derivWithin` under a differentiability hypothesis or explicit
derivative functions with `HasDerivWithinAt`; errors that may be infinite are in `ℝ≥0∞`, with
`‖·‖ₑ` and `∫⁻`. For the heat equation `V = W1p0 volume Ω 2` (with Tau Ceti's local inner
product instances), `H = L²(Ω)`, `ι = W1p0.valueL` and `a` the Dirichlet form `dirichletForm`.
A weight on `(-1, 1)` is `(volume.restrict (Ioo (-1) 1)).withDensity (ENNReal.ofReal ∘ w)`.

Local copies, verbatim: `E`, `toOrderL`, `seminorm` (SobolevPolynomialApproximation, Conventions
and §1.3, through GalerkinMethodsAndLagrangeFiniteElements) and `HasAdjointH2Regularity`
(GalerkinMethodsAndLagrangeFiniteElements, §6.3); `IsOrthogonalityMeasure`, `pairing`, `monic`
and `zeros` (SpecialFunctionsOrthogonalPolynomialsGeneral, §§2.1, 2.2 and 5.1); `jacobi` and
`jacobiMeasure` (LaguerreJacobi, §§3.2 and 4.1).

Proved declarations: `norm_le_of_isPivotProjection` and `dirichletForm_apply` are headlines that
close by unfolding; `hasDerivAt_dgPoly` is a supporting step, not a target. The `#check` lines
at the end of the file pin the upstream declarations that the README names.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.ParabolicAndSpectralGalerkinMethods

open TauCeti TauCeti.PDE MeasureTheory Set Metric Filter TopologicalSpace Polynomial
open scoped ENNReal NNReal Topology InnerProductSpace Real

/-! ## Local copies -/

/-- Euclidean space `ℝⁿ`. Local copy of `E` of SobolevPolynomialApproximation, Conventions, as
copied by GalerkinMethodsAndLagrangeFiniteElements. -/
abbrev E (n : ℕ) := EuclideanSpace ℝ (Fin n)

section SobolevCopies

variable {n : ℕ} {Ω : Opens (E n)} {p : ℝ≥0∞} [Fact (1 ≤ p)]

/-- The embedding `W^{k,p}(Ω) → W^{j,p}(Ω)` for `j ≤ k`. Local copy of `toOrderL` of
SobolevPolynomialApproximation, §1.3, as copied by GalerkinMethodsAndLagrangeFiniteElements. -/
def toOrderL {j k : ℕ} (h : j ≤ k) : Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j :=
  Nat.leRec (motive := fun k _ => Wkp volume Ω p k →L[ℝ] Wkp volume Ω p j)
    (ContinuousLinearMap.id ℝ _) (fun k _ ih => ih.comp (Wkp.lowerOrderL k)) h

/-- The Sobolev seminorm `|u|_{W^{j,p}(Ω)}` of `u ∈ W^{k,p}(Ω)`, `j ≤ k`. Local copy of
`seminorm` of SobolevPolynomialApproximation, §1.3, as copied by
GalerkinMethodsAndLagrangeFiniteElements. -/
def seminorm (k : ℕ) : (j : ℕ) → j ≤ k → Wkp volume Ω p k → ℝ
  | 0, _, u => ‖Wkp.value k u‖
  | j + 1, h, u => ‖Wkp.iteratedGradient j (toOrderL h u)‖

end SobolevCopies

section RegularityCopy

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d]

/-- The `H²` regularity of the adjoint problem with constant `Creg`: for every `g ∈ L²(Ω)` the
weak solution `z ∈ H¹₀(Ω)` of `-div(Aᵀ∇z) = g` lies in `H²(Ω)` with `|z|_{H²} ≤ Creg ‖g‖`. Local
copy of `HasAdjointH2Regularity` of GalerkinMethodsAndLagrangeFiniteElements, §6.3. -/
def HasAdjointH2Regularity (Ω : Opens (E d)) (A : E d → Matrix (Fin d) (Fin d) ℝ)
    (Creg : ℝ) : Prop :=
  ∀ g : Lp ℝ 2 (volume.restrict (Ω : Set (E d))), ∃ z : W1p0 volume Ω 2,
    IsWeakSolutionDirichlet (fun x => (A x).transpose) 0 0 g z ∧
      ∃ w : Wkp volume Ω 2 2, Wkp.firstOrder 1 w = (z : W1p volume Ω 2) ∧
        seminorm 2 2 le_rfl w ≤ Creg * ‖g‖

end RegularityCopy

section OrthogonalPolynomialCopies

/-- An orthogonality measure (DLMF 18.2.4_5): every moment is finite and the support is
infinite. Local copy of `IsOrthogonalityMeasure` of SpecialFunctionsOrthogonalPolynomialsGeneral,
§2.1. -/
structure IsOrthogonalityMeasure (μ : Measure ℝ) : Prop where
  integrable_pow : ∀ n : ℕ, Integrable (fun x : ℝ => x ^ n) μ
  support_infinite : μ.support.Infinite

/-- The moment pairing `⟨p, q⟩ = ∫ p(x) q(x) dμ(x)`. Local copy of `pairing` of
SpecialFunctionsOrthogonalPolynomialsGeneral, §2.1. -/
def pairing (μ : Measure ℝ) (p q : ℝ[X]) : ℝ :=
  ∫ x, p.eval x * q.eval x ∂μ

/-- The monic orthogonal polynomials, by Gram–Schmidt applied to the monomials. Local copy of
`monic` of SpecialFunctionsOrthogonalPolynomialsGeneral, §2.2. -/
def monic (μ : Measure ℝ) : ℕ → ℝ[X]
  | n => X ^ n - ∑ k : Fin n,
      C (pairing μ (X ^ n) (monic μ k) / pairing μ (monic μ k) (monic μ k)) * monic μ k
decreasing_by exact k.isLt

/-- The zeros of `monic μ n` in increasing order. Local copy of `zeros` of
SpecialFunctionsOrthogonalPolynomialsGeneral, §5.1. -/
def zeros (μ : Measure ℝ) (n : ℕ) (i : Fin n) : ℝ :=
  ((monic μ n).roots.sort (· ≤ ·)).getD i 0

end OrthogonalPolynomialCopies

/-! ## Layer 1: abstract parabolic Galerkin approximation -/

section Abstract

variable {V H : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
  [NormedAddCommGroup H] [InnerProductSpace ℝ H]

/-! ### 1.1 The Ritz and pivot projections -/

/-- `r` is a Ritz (elliptic) projection of `w` onto `S` for the form `a`. -/
def IsRitzProjection (a : V →L[ℝ] V →L[ℝ] ℝ) (S : Submodule ℝ V) (w r : V) : Prop :=
  r ∈ S ∧ ∀ χ ∈ S, a r χ = a w χ

/-- `p ∈ S` is the projection of `g ∈ H` onto `ι(S)` in the pivot inner product. -/
def IsPivotProjection (ι : V →L[ℝ] H) (S : Submodule ℝ V) (g : H) (p : V) : Prop :=
  p ∈ S ∧ ∀ χ ∈ S, ⟪ι p, ι χ⟫_ℝ = ⟪g, ι χ⟫_ℝ

/-- **Ritz projection** (README 1.1): existence and uniqueness for a form positive on `S`. -/
theorem existsUnique_isRitzProjection (a : V →L[ℝ] V →L[ℝ] ℝ) (S : Submodule ℝ V)
    [FiniteDimensional ℝ S] (hpos : ∀ χ ∈ S, χ ≠ 0 → 0 < a χ χ) (w : V) :
    ∃! r, IsRitzProjection a S w r := sorry

/-- **Pivot projection** (README 1.1): existence and uniqueness for `ι` injective on `S`. -/
theorem existsUnique_isPivotProjection (ι : V →L[ℝ] H) (S : Submodule ℝ V)
    [FiniteDimensional ℝ S] (hι : ∀ χ ∈ S, ι χ = 0 → χ = 0) (g : H) :
    ∃! p, IsPivotProjection ι S g p := sorry

/-- **Stability of the pivot projection** (README 1.1): `‖ι p‖ ≤ ‖g‖`. -/
theorem norm_le_of_isPivotProjection {ι : V →L[ℝ] H} {S : Submodule ℝ V} {g : H} {p : V}
    (hp : IsPivotProjection ι S g p) : ‖ι p‖ ≤ ‖g‖ := by
  have h := hp.2 p hp.1
  rw [real_inner_self_eq_norm_sq] at h
  have h2 := real_inner_le_norm g (ι p)
  nlinarith [norm_nonneg (ι p), norm_nonneg g]

/-! ### 1.2 The spatially semidiscrete problem -/

/-- `uh` solves the semidiscrete problem `(uh', χ) + a(uh, χ) = (f, χ)`, `χ ∈ S`, on `[0, ∞)`. -/
def IsSemidiscreteSolution (ι : V →L[ℝ] H) (a : V →L[ℝ] V →L[ℝ] ℝ) (S : Submodule ℝ V)
    (f : ℝ → H) (uh : ℝ → V) : Prop :=
  ∀ t, 0 ≤ t → uh t ∈ S ∧ DifferentiableWithinAt ℝ uh (Ici 0) t ∧
    ∀ χ ∈ S, ⟪ι (derivWithin uh (Ici 0) t), ι χ⟫_ℝ + a (uh t) χ = ⟪f t, ι χ⟫_ℝ

/-- `u` is a strong solution on the time set `I`: differentiable in `V` with
`(u', χ) + a(u, χ) = (f, χ)` for every `χ ∈ V`. -/
def IsStrongSolution (ι : V →L[ℝ] H) (a : V →L[ℝ] V →L[ℝ] ℝ) (f : ℝ → H) (I : Set ℝ)
    (u : ℝ → V) : Prop :=
  ∀ t ∈ I, DifferentiableWithinAt ℝ u I t ∧
    ∀ χ, ⟪ι (derivWithin u I t), ι χ⟫_ℝ + a (u t) χ = ⟪f t, ι χ⟫_ℝ

/-- **Semidiscrete existence and uniqueness** (README 1.2). -/
theorem existsUnique_isSemidiscreteSolution (ι : V →L[ℝ] H) (a : V →L[ℝ] V →L[ℝ] ℝ)
    (S : Submodule ℝ V) [FiniteDimensional ℝ S] (hι : ∀ χ ∈ S, ι χ = 0 → χ = 0) {f : ℝ → H}
    (hf : Continuous f) {x : V} (hx : x ∈ S) :
    ∃ uh, uh 0 = x ∧ IsSemidiscreteSolution ι a S f uh ∧
      ∀ w, w 0 = x → IsSemidiscreteSolution ι a S f w → EqOn w uh (Ici 0) := sorry

/-- **Semidiscrete error bound** (README 1.2): the error is bounded by the initial error
against the Ritz projection, the Ritz defect at `t` and the integrated Ritz defect of `u'`. -/
theorem semidiscrete_error_le (ι : V →L[ℝ] H) (a : V →L[ℝ] V →L[ℝ] ℝ) (S : Submodule ℝ V)
    [FiniteDimensional ℝ S] (hpos : ∀ χ ∈ S, χ ≠ 0 → 0 < a χ χ) {f : ℝ → H}
    {u uh Ru Rdu : ℝ → V} (hu : IsStrongSolution ι a f (Ici 0) u)
    (huh : IsSemidiscreteSolution ι a S f uh)
    (hR : ∀ t, 0 ≤ t → IsRitzProjection a S (u t) (Ru t))
    (hRd : ∀ t, 0 ≤ t → IsRitzProjection a S (derivWithin u (Ici 0) t) (Rdu t)) {t : ℝ}
    (ht : 0 ≤ t) :
    ‖ι (uh t - u t)‖ₑ ≤ ‖ι (uh 0 - Ru 0)‖ₑ + ‖ι (Ru t - u t)‖ₑ +
      ∫⁻ s in Icc 0 t, ‖ι (Rdu s - derivWithin u (Ici 0) s)‖ₑ := sorry

/-- **Semidiscrete error bound with decay** (README 1.2), when `λ ‖ι χ‖² ≤ a(χ, χ)` on `S`. -/
theorem semidiscrete_error_le_exp (ι : V →L[ℝ] H) (a : V →L[ℝ] V →L[ℝ] ℝ)
    (S : Submodule ℝ V) [FiniteDimensional ℝ S] (hpos : ∀ χ ∈ S, χ ≠ 0 → 0 < a χ χ) {lam : ℝ}
    (hlam : ∀ χ ∈ S, lam * ‖ι χ‖ ^ 2 ≤ a χ χ) {f : ℝ → H} {u uh Ru Rdu : ℝ → V}
    (hu : IsStrongSolution ι a f (Ici 0) u) (huh : IsSemidiscreteSolution ι a S f uh)
    (hR : ∀ t, 0 ≤ t → IsRitzProjection a S (u t) (Ru t))
    (hRd : ∀ t, 0 ≤ t → IsRitzProjection a S (derivWithin u (Ici 0) t) (Rdu t)) {t : ℝ}
    (ht : 0 ≤ t) :
    ‖ι (uh t - u t)‖ₑ ≤ ENNReal.ofReal (Real.exp (-lam * t)) * ‖ι (uh 0 - Ru 0)‖ₑ +
      ‖ι (Ru t - u t)‖ₑ + ∫⁻ s in Icc 0 t,
        ENNReal.ofReal (Real.exp (-lam * (t - s))) * ‖ι (Rdu s - derivWithin u (Ici 0) s)‖ₑ :=
  sorry

/-! ### 1.3 The θ-scheme in time -/

/-- `U` solves the θ-scheme with step `k` and forcing `F n` on the step from `n` to `n + 1`:
`(U^{n+1} - U^n, χ) + k a(θ U^{n+1} + (1 - θ) U^n, χ) = k (F n, χ)` for `χ ∈ S`. -/
def IsThetaSchemeSolution (ι : V →L[ℝ] H) (a : V →L[ℝ] V →L[ℝ] ℝ) (S : Submodule ℝ V)
    (θ k : ℝ) (F : ℕ → H) (U : ℕ → V) : Prop :=
  (∀ n, U n ∈ S) ∧ ∀ n, ∀ χ ∈ S,
    ⟪ι (U (n + 1) - U n), ι χ⟫_ℝ + k * a (θ • U (n + 1) + (1 - θ) • U n) χ =
      k * ⟪F n, ι χ⟫_ℝ

/-- **The θ-scheme is uniquely solvable** (README 1.3) for `θ ≥ 0`, `k ≥ 0`. -/
theorem existsUnique_isThetaSchemeSolution (ι : V →L[ℝ] H) (a : V →L[ℝ] V →L[ℝ] ℝ)
    (S : Submodule ℝ V) [FiniteDimensional ℝ S] (hι : ∀ χ ∈ S, ι χ = 0 → χ = 0)
    (hnn : ∀ χ ∈ S, 0 ≤ a χ χ) {θ k : ℝ} (hθ : 0 ≤ θ) (hk : 0 ≤ k) (F : ℕ → H) {x : V}
    (hx : x ∈ S) : ∃! U, U 0 = x ∧ IsThetaSchemeSolution ι a S θ k F U := sorry

/-- **Backward Euler error bound** (README 1.3): `θ = 1`, `F n = f((n + 1) k)`; `u2` is the
second time derivative of `ι ∘ u`. -/
theorem backwardEuler_error_le (ι : V →L[ℝ] H) (a : V →L[ℝ] V →L[ℝ] ℝ) (S : Submodule ℝ V)
    [FiniteDimensional ℝ S] (hpos : ∀ χ ∈ S, χ ≠ 0 → 0 < a χ χ) {k : ℝ} (hk : 0 < k)
    {f : ℝ → H} {u Ru Rdu : ℝ → V} {U : ℕ → V} {u2 : ℝ → H}
    (hu : IsStrongSolution ι a f (Ici 0) u)
    (hu2 : ∀ t, 0 ≤ t →
      HasDerivWithinAt (fun s => ι (derivWithin u (Ici 0) s)) (u2 t) (Ici 0) t)
    (hU : IsThetaSchemeSolution ι a S 1 k (fun n => f ((n + 1) * k)) U)
    (hR : ∀ t, 0 ≤ t → IsRitzProjection a S (u t) (Ru t))
    (hRd : ∀ t, 0 ≤ t → IsRitzProjection a S (derivWithin u (Ici 0) t) (Rdu t)) (n : ℕ) :
    ‖ι (U n - u (n * k))‖ₑ ≤ ‖ι (U 0 - Ru 0)‖ₑ + ‖ι (Ru (n * k) - u (n * k))‖ₑ +
      ∫⁻ s in Icc 0 (n * k), ‖ι (Rdu s - derivWithin u (Ici 0) s)‖ₑ +
      ENNReal.ofReal k * ∫⁻ s in Icc 0 (n * k), ‖u2 s‖ₑ := sorry

/-- **Crank–Nicolson error bound** (README 1.3): `θ = 1/2`, `F n = f((n + 1/2) k)`; `u3` is the
third time derivative of `ι ∘ u` and `w` represents `a(u, ·)` in `H`, with second derivative
`w2`. -/
theorem crankNicolson_error_le (ι : V →L[ℝ] H) (a : V →L[ℝ] V →L[ℝ] ℝ) (S : Submodule ℝ V)
    [FiniteDimensional ℝ S] (hpos : ∀ χ ∈ S, χ ≠ 0 → 0 < a χ χ) {k : ℝ} (hk : 0 < k)
    {f : ℝ → H} {u Ru Rdu : ℝ → V} {U : ℕ → V} {u2 u3 w w1 w2 : ℝ → H}
    (hu : IsStrongSolution ι a f (Ici 0) u)
    (hu2 : ∀ t, 0 ≤ t →
      HasDerivWithinAt (fun s => ι (derivWithin u (Ici 0) s)) (u2 t) (Ici 0) t)
    (hu3 : ∀ t, 0 ≤ t → HasDerivWithinAt u2 (u3 t) (Ici 0) t)
    (hw : ∀ t, 0 ≤ t → ∀ χ, a (u t) χ = ⟪w t, ι χ⟫_ℝ)
    (hw1 : ∀ t, 0 ≤ t → HasDerivWithinAt w (w1 t) (Ici 0) t)
    (hw2 : ∀ t, 0 ≤ t → HasDerivWithinAt w1 (w2 t) (Ici 0) t)
    (hU : IsThetaSchemeSolution ι a S (1 / 2) k (fun n => f ((n + 1 / 2) * k)) U)
    (hR : ∀ t, 0 ≤ t → IsRitzProjection a S (u t) (Ru t))
    (hRd : ∀ t, 0 ≤ t → IsRitzProjection a S (derivWithin u (Ici 0) t) (Rdu t)) (n : ℕ) :
    ‖ι (U n - u (n * k))‖ₑ ≤ ‖ι (U 0 - Ru 0)‖ₑ + ‖ι (Ru (n * k) - u (n * k))‖ₑ +
      ∫⁻ s in Icc 0 (n * k), ‖ι (Rdu s - derivWithin u (Ici 0) s)‖ₑ +
      ENNReal.ofReal (k ^ 2 / 8) * ∫⁻ s in Icc 0 (n * k), ‖u3 s‖ₑ +
      ENNReal.ofReal (k ^ 2 / 4) * ∫⁻ s in Icc 0 (n * k), ‖w2 s‖ₑ := sorry

end Abstract

/-! ## Layer 2: the heat equation with an approximation family of order `r` -/

section Heat

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d] {Ω : Opens (E d)}

/-! ### 2.1 The Dirichlet form, approximation of order `r` and the Ritz projection -/

/-- The Dirichlet form `a(u, v) = ∫_Ω ∇u · ∇v` on `H¹₀(Ω)`: Tau Ceti's bundled energy form with
coefficient matrix `1` and no lower-order terms. -/
def dirichletForm (Ω : Opens (E d)) : W1p0 volume Ω 2 →L[ℝ] W1p0 volume Ω 2 →L[ℝ] ℝ :=
  energyFormH1L0 (mu := volume) (Omega := Ω) (a := fun _ => (1 : Matrix (Fin d) (Fin d) ℝ))
    (b := 0) (c := 0)
    (memLp_top_const (μ := volume.restrict (Ω : Set (E d)))
      (energyIntegrand (1 : Matrix (Fin d) (Fin d) ℝ) (0 : E d) (0 : ℝ)))

omit [NeZero d] in
/-- The Dirichlet form is the energy form of `-Δ` (README 2.1). -/
theorem dirichletForm_apply (u v : W1p0 volume Ω 2) :
    dirichletForm Ω u v = energyFormH1 (fun _ => (1 : Matrix (Fin d) (Fin d) ℝ)) 0 0
      (u : W1p volume Ω 2) (v : W1p volume Ω 2) := by
  unfold dirichletForm
  exact energyFormH1L0_apply _ u v

/-- The family `S h ⊆ H¹₀(Ω)`, `0 < h < 1`, has approximation order `r` with constant `C`: every
`w ∈ H¹₀(Ω) ∩ H^s(Ω)`, `1 ≤ s ≤ r`, has `χ ∈ S h` with
`‖w - χ‖ + h ‖∇(w - χ)‖ ≤ C h^s |w|_{H^s}`. -/
def HasApproximationOrder (Ω : Opens (E d)) (r : ℕ) (C : ℝ)
    (S : ℝ → Submodule ℝ (W1p0 volume Ω 2)) : Prop :=
  ∀ h ∈ Ioo (0 : ℝ) 1, ∀ s, 1 ≤ s → s ≤ r → ∀ (w : W1p0 volume Ω 2) (ws : Wkp volume Ω 2 s),
    Wkp.value s ws = W1p.value (w : W1p volume Ω 2) →
      ∃ χ ∈ S h, ‖W1p.value ((w : W1p volume Ω 2) - (χ : W1p volume Ω 2))‖ +
          h * ‖W1p.gradient ((w : W1p volume Ω 2) - (χ : W1p volume Ω 2))‖ ≤
        C * h ^ s * seminorm s s le_rfl ws

/-- **Ritz projection error** (README 2.1): `‖R w - w‖ + h ‖∇(R w - w)‖ ≤ C' h^s |w|_{H^s}`. -/
theorem exists_ritz_error_le {r : ℕ} (hr : 2 ≤ r) {C Creg : ℝ}
    (hreg : HasAdjointH2Regularity Ω (fun _ => 1) Creg)
    {S : ℝ → Submodule ℝ (W1p0 volume Ω 2)} (hS : HasApproximationOrder Ω r C S) :
    ∃ C' : ℝ, 0 ≤ C' ∧ ∀ h ∈ Ioo (0 : ℝ) 1, ∀ s, 1 ≤ s → s ≤ r →
      ∀ (w : W1p0 volume Ω 2) (ws : Wkp volume Ω 2 s),
        Wkp.value s ws = W1p.value (w : W1p volume Ω 2) → ∀ Rw : W1p0 volume Ω 2,
        IsRitzProjection (dirichletForm Ω) (S h) w Rw →
        ‖W1p.value ((Rw : W1p volume Ω 2) - (w : W1p volume Ω 2))‖ +
            h * ‖W1p.gradient ((Rw : W1p volume Ω 2) - (w : W1p volume Ω 2))‖ ≤
          C' * h ^ s * seminorm s s le_rfl ws := sorry

/-! ### 2.2 Semidiscrete and fully discrete error estimates -/

/-- **Semidiscrete heat equation, smooth data** (README 2.2): order `h^r` in `L²`. -/
theorem exists_semidiscrete_error_le {r : ℕ} (hr : 2 ≤ r) {C Creg : ℝ}
    (hreg : HasAdjointH2Regularity Ω (fun _ => 1) Creg)
    {S : ℝ → Submodule ℝ (W1p0 volume Ω 2)} (hS : HasApproximationOrder Ω r C S)
    (hfin : ∀ h, FiniteDimensional ℝ (S h)) :
    ∃ C' : ℝ, 0 ≤ C' ∧ ∀ h ∈ Ioo (0 : ℝ) 1,
      ∀ (f : ℝ → Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u uh : ℝ → W1p0 volume Ω 2)
        (ur urt : ℝ → Wkp volume Ω 2 r),
      IsStrongSolution W1p0.valueL (dirichletForm Ω) f (Ici 0) u →
      IsSemidiscreteSolution W1p0.valueL (dirichletForm Ω) (S h) f uh →
      (∀ t, 0 ≤ t → Wkp.value r (ur t) = W1p.value (u t : W1p volume Ω 2)) →
      (∀ t, 0 ≤ t → Wkp.value r (urt t) =
        W1p.value ((derivWithin u (Ici 0) t : W1p0 volume Ω 2) : W1p volume Ω 2)) →
      ∀ t, 0 ≤ t → ‖W1p0.valueL (uh t - u t)‖ₑ ≤ ‖W1p0.valueL (uh 0 - u 0)‖ₑ +
        ENNReal.ofReal (C' * h ^ r) * (ENNReal.ofReal (seminorm r r le_rfl (ur 0)) +
          ENNReal.ofReal (seminorm r r le_rfl (ur t)) +
          ∫⁻ s in Icc 0 t, ENNReal.ofReal (seminorm r r le_rfl (urt s))) := sorry

/-- **Backward Euler for the heat equation** (README 2.2): order `h^r + k`. -/
theorem exists_backwardEuler_error_le {r : ℕ} (hr : 2 ≤ r) {C Creg : ℝ}
    (hreg : HasAdjointH2Regularity Ω (fun _ => 1) Creg)
    {S : ℝ → Submodule ℝ (W1p0 volume Ω 2)} (hS : HasApproximationOrder Ω r C S)
    (hfin : ∀ h, FiniteDimensional ℝ (S h)) :
    ∃ C' : ℝ, 0 ≤ C' ∧ ∀ h ∈ Ioo (0 : ℝ) 1, ∀ k : ℝ, 0 < k →
      ∀ (f : ℝ → Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u : ℝ → W1p0 volume Ω 2)
        (U : ℕ → W1p0 volume Ω 2) (u2 : ℝ → Lp ℝ 2 (volume.restrict (Ω : Set (E d))))
        (ur urt : ℝ → Wkp volume Ω 2 r),
      IsStrongSolution W1p0.valueL (dirichletForm Ω) f (Ici 0) u →
      (∀ t, 0 ≤ t → HasDerivWithinAt (fun s => W1p0.valueL (derivWithin u (Ici 0) s)) (u2 t)
        (Ici 0) t) →
      IsThetaSchemeSolution W1p0.valueL (dirichletForm Ω) (S h) 1 k
        (fun n => f ((n + 1) * k)) U →
      (∀ t, 0 ≤ t → Wkp.value r (ur t) = W1p.value (u t : W1p volume Ω 2)) →
      (∀ t, 0 ≤ t → Wkp.value r (urt t) =
        W1p.value ((derivWithin u (Ici 0) t : W1p0 volume Ω 2) : W1p volume Ω 2)) →
      ∀ n : ℕ, ‖W1p0.valueL (U n - u (n * k))‖ₑ ≤ ‖W1p0.valueL (U 0 - u 0)‖ₑ +
        ENNReal.ofReal (C' * h ^ r) * (ENNReal.ofReal (seminorm r r le_rfl (ur 0)) +
          ENNReal.ofReal (seminorm r r le_rfl (ur (n * k))) +
          ∫⁻ s in Icc 0 (n * k), ENNReal.ofReal (seminorm r r le_rfl (urt s))) +
        ENNReal.ofReal k * ∫⁻ s in Icc 0 (n * k), ‖u2 s‖ₑ := sorry

/-- **Crank–Nicolson for the heat equation** (README 2.2): order `h^r + k²`; `w = -Δu`. -/
theorem exists_crankNicolson_error_le {r : ℕ} (hr : 2 ≤ r) {C Creg : ℝ}
    (hreg : HasAdjointH2Regularity Ω (fun _ => 1) Creg)
    {S : ℝ → Submodule ℝ (W1p0 volume Ω 2)} (hS : HasApproximationOrder Ω r C S)
    (hfin : ∀ h, FiniteDimensional ℝ (S h)) :
    ∃ C' : ℝ, 0 ≤ C' ∧ ∀ h ∈ Ioo (0 : ℝ) 1, ∀ k : ℝ, 0 < k →
      ∀ (f : ℝ → Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u : ℝ → W1p0 volume Ω 2)
        (U : ℕ → W1p0 volume Ω 2) (u2 u3 w w1 w2 : ℝ → Lp ℝ 2 (volume.restrict (Ω : Set (E d))))
        (ur urt : ℝ → Wkp volume Ω 2 r),
      IsStrongSolution W1p0.valueL (dirichletForm Ω) f (Ici 0) u →
      (∀ t, 0 ≤ t → HasDerivWithinAt (fun s => W1p0.valueL (derivWithin u (Ici 0) s)) (u2 t)
        (Ici 0) t) →
      (∀ t, 0 ≤ t → HasDerivWithinAt u2 (u3 t) (Ici 0) t) →
      (∀ t, 0 ≤ t → ∀ χ, dirichletForm Ω (u t) χ = ⟪w t, W1p0.valueL χ⟫_ℝ) →
      (∀ t, 0 ≤ t → HasDerivWithinAt w (w1 t) (Ici 0) t) →
      (∀ t, 0 ≤ t → HasDerivWithinAt w1 (w2 t) (Ici 0) t) →
      IsThetaSchemeSolution W1p0.valueL (dirichletForm Ω) (S h) (1 / 2) k
        (fun n => f ((n + 1 / 2) * k)) U →
      (∀ t, 0 ≤ t → Wkp.value r (ur t) = W1p.value (u t : W1p volume Ω 2)) →
      (∀ t, 0 ≤ t → Wkp.value r (urt t) =
        W1p.value ((derivWithin u (Ici 0) t : W1p0 volume Ω 2) : W1p volume Ω 2)) →
      ∀ n : ℕ, ‖W1p0.valueL (U n - u (n * k))‖ₑ ≤ ‖W1p0.valueL (U 0 - u 0)‖ₑ +
        ENNReal.ofReal (C' * h ^ r) * (ENNReal.ofReal (seminorm r r le_rfl (ur 0)) +
          ENNReal.ofReal (seminorm r r le_rfl (ur (n * k))) +
          ∫⁻ s in Icc 0 (n * k), ENNReal.ofReal (seminorm r r le_rfl (urt s))) +
        ENNReal.ofReal (k ^ 2 / 8) * ∫⁻ s in Icc 0 (n * k), ‖u3 s‖ₑ +
        ENNReal.ofReal (k ^ 2 / 4) * ∫⁻ s in Icc 0 (n * k), ‖w2 s‖ₑ := sorry

end Heat

/-! ## Layer 3: nonsmooth initial data -/

section Nonsmooth

/-! ### 3.1 The abstract smoothing estimate -/

/-- **Smoothing estimate for the error equation** (README 3.1): if `T` is self-adjoint and
positive semidefinite, `T e' + e = ρ` for `t > 0` and `T e(0) = 0`, then
`‖e(t)‖² ≤ 8 (‖ρ(t)‖² + t⁻¹ ∫₀ᵗ (‖ρ‖² + s² ‖ρ'‖²))`. -/
theorem norm_sq_le_of_errorEquation {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (T : H →L[ℝ] H) (hT : (T : H →ₗ[ℝ] H).IsSymmetric) (hTpos : ∀ x, 0 ≤ ⟪T x, x⟫_ℝ)
    {e ρ : ℝ → H} (he : ContinuousOn e (Ici 0)) (hed : ∀ t, 0 < t → DifferentiableAt ℝ e t)
    (hρ : ∀ t, 0 < t → DifferentiableAt ℝ ρ t) (heq : ∀ t, 0 < t → T (deriv e t) + e t = ρ t)
    (h0 : T (e 0) = 0) {t : ℝ} (ht : 0 < t) :
    ‖e t‖ₑ ^ 2 ≤ 8 * (‖ρ t‖ₑ ^ 2 + (ENNReal.ofReal t)⁻¹ *
      ∫⁻ s in Ioc 0 t, (‖ρ s‖ₑ ^ 2 + ENNReal.ofReal (s ^ 2) * ‖deriv ρ s‖ₑ ^ 2)) := sorry

/-! ### 3.2 The heat equation with initial data in `L²` -/

attribute [local instance] W1p0.instNormedAddCommGroup W1p0.instInnerProductSpace

variable {d : ℕ} [NeZero d] {Ω : Opens (E d)}

/-- **Nonsmooth data error estimate** (README 3.2), order two: with `uh(0)` the `L²` projection
of `v ∈ L²(Ω)`, `‖uh(t) - u(t)‖ ≤ C' h² / (t + h²) ‖v‖` for `t > 0`. -/
theorem exists_nonsmooth_error_le (hΩ : Bornology.IsBounded (Ω : Set (E d))) {C Creg : ℝ}
    (hreg : HasAdjointH2Regularity Ω (fun _ => 1) Creg)
    {S : ℝ → Submodule ℝ (W1p0 volume Ω 2)} (hS : HasApproximationOrder Ω 2 C S)
    (hfin : ∀ h, FiniteDimensional ℝ (S h)) :
    ∃ C' : ℝ, 0 ≤ C' ∧ ∀ h ∈ Ioo (0 : ℝ) 1,
      ∀ (v : Lp ℝ 2 (volume.restrict (Ω : Set (E d)))) (u uh : ℝ → W1p0 volume Ω 2),
      IsStrongSolution W1p0.valueL (dirichletForm Ω) 0 (Ioi 0) u →
      Tendsto (fun t => W1p0.valueL (u t)) (𝓝[>] 0) (𝓝 v) →
      IsSemidiscreteSolution W1p0.valueL (dirichletForm Ω) (S h) 0 uh →
      IsPivotProjection (V := W1p0 volume Ω 2) (H := Lp ℝ 2 (volume.restrict (Ω : Set (E d))))
        W1p0.valueL (S h) v (uh 0) →
      ∀ t, 0 < t → ‖W1p0.valueL (uh t - u t)‖ ≤ C' * h ^ 2 / (t + h ^ 2) * ‖v‖ := sorry

end Nonsmooth

/-! ## Layer 4: discontinuous Galerkin time stepping -/

/-! ### 4.1 The scalar step -/

/-- One discontinuous-Galerkin step of degree less than `q` for `u' + z u = 0` on the unit
interval, from the value `1`: `∫₀¹ (U' + z U) p + (U(0) - 1) p(0) = 0` for `deg p < q`. -/
def IsDGHeatStep (q : ℕ) (z : ℝ) (U : ℝ[X]) : Prop :=
  U.natDegree < q ∧
    ∀ p : ℝ[X], p.natDegree < q →
      (∫ t in (0 : ℝ)..1, (U.derivative.eval t + z * U.eval t) * p.eval t) +
        (U.eval 0 - 1) * p.eval 0 = 0

/-- **The scalar step is uniquely solvable** (README 4.1) for `q ≥ 1`, `z ≥ 0`. -/
theorem existsUnique_isDGHeatStep {q : ℕ} (hq : 1 ≤ q) {z : ℝ} (hz : 0 ≤ z) :
    ∃! U, IsDGHeatStep q z U := sorry

/-- **`q = 1` is backward Euler** (README 4.1). -/
theorem isDGHeatStep_one {z : ℝ} (hz : 1 + z ≠ 0) : IsDGHeatStep 1 z (C (1 + z)⁻¹) := sorry

/-- **`q = 2` gives the subdiagonal Padé approximant** (README 4.1). -/
theorem eval_one_of_isDGHeatStep_two {z : ℝ} {U : ℝ[X]} (hU : IsDGHeatStep 2 z U) :
    U.eval 1 = (1 - z / 3) / (1 + 2 * z / 3 + z ^ 2 / 6) := sorry

/-- **Stability of the step** (README 4.1): `|U(1)| ≤ 1` for `z ≥ 0`. -/
theorem abs_eval_one_le_of_isDGHeatStep {q : ℕ} {z : ℝ} (hz : 0 ≤ z) {U : ℝ[X]}
    (hU : IsDGHeatStep q z U) : |U.eval 1| ≤ 1 := sorry

/-- **Nodal superconvergence of the scalar step** (README 4.1): `|U(1) - e^{-z}| ≤ C z^{2q}`. -/
theorem exists_dgHeatStep_error_le_pow (q : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ z ∈ Icc (0 : ℝ) 1, ∀ U : ℝ[X], IsDGHeatStep q z U →
      |U.eval 1 - Real.exp (-z)| ≤ C * z ^ (2 * q) := sorry

/-! ### 4.2 The step for a self-adjoint operator -/

section DG

variable {S : Type*} [NormedAddCommGroup S] [InnerProductSpace ℝ S]

/-- The local polynomial `τ ↦ ∑ τ^i c_i`, `τ ∈ [0, 1]`, with coefficients `c : Fin q → S`. -/
def dgPoly {q : ℕ} (c : Fin q → S) (τ : ℝ) : S := ∑ i : Fin q, τ ^ (i : ℕ) • c i

/-- The derivative `τ ↦ ∑ i τ^{i-1} c_i` of `dgPoly c`. -/
def dgPolyDeriv {q : ℕ} (c : Fin q → S) (τ : ℝ) : S :=
  ∑ i : Fin q, ((i : ℕ) * τ ^ ((i : ℕ) - 1)) • c i

/-- `dgPolyDeriv` is the derivative of `dgPoly` (supporting step). -/
theorem hasDerivAt_dgPoly {q : ℕ} (c : Fin q → S) (τ : ℝ) :
    HasDerivAt (dgPoly c) (dgPolyDeriv c τ) τ := by
  unfold dgPoly dgPolyDeriv
  apply HasDerivAt.fun_sum
  intro i _
  simpa using (hasDerivAt_pow (i : ℕ) τ).smul_const (c i)

/-- One DG step of degree less than `q` and length `k` for `u' + A u = f`, rescaled to `[0, 1]`
(`g τ = f(t₀ + k τ)`), from the value `U₀`: for every `l < q` and `ψ ∈ S`,
`∫₀¹ (⟪U', ψ⟫ + k ⟪A U, ψ⟫) τ^l + [l = 0] ⟪U(0) - U₀, ψ⟫ = k ∫₀¹ ⟪g, ψ⟫ τ^l`. -/
def IsDGStep (A : S →L[ℝ] S) (k : ℝ) (g : ℝ → S) (U₀ : S) {q : ℕ} (c : Fin q → S) : Prop :=
  ∀ (l : Fin q) (ψ : S),
    (∫ τ in (0 : ℝ)..1, (⟪dgPolyDeriv c τ, ψ⟫_ℝ + k * ⟪A (dgPoly c τ), ψ⟫_ℝ) * τ ^ (l : ℕ)) +
        (if (l : ℕ) = 0 then ⟪dgPoly c 0 - U₀, ψ⟫_ℝ else 0) =
      k * ∫ τ in (0 : ℝ)..1, ⟪g τ, ψ⟫_ℝ * τ ^ (l : ℕ)

/-- The nodal values `U^0 = v`, `U^{n+1} = U(t_{n+1})` of DG coefficients `c n` on `J_{n+1}`. -/
def dgNodal {q : ℕ} (v : S) (c : ℕ → Fin q → S) : ℕ → S
  | 0 => v
  | n + 1 => dgPoly (c n) 1

/-- `c` is the DG solution with uniform step `k`, forcing `f` and initial value `v`. -/
def IsDGSolution (A : S →L[ℝ] S) (k : ℝ) (f : ℝ → S) (v : S) {q : ℕ} (c : ℕ → Fin q → S) :
    Prop :=
  ∀ n : ℕ, IsDGStep A k (fun τ => f ((n + τ) * k)) (dgNodal v c n) (c n)

/-- **The DG step is uniquely solvable** (README 4.2). -/
theorem existsUnique_isDGStep [FiniteDimensional ℝ S] (A : S →L[ℝ] S)
    (hA : (A : S →ₗ[ℝ] S).IsSymmetric) (hpos : ∀ x, 0 ≤ ⟪A x, x⟫_ℝ) {k : ℝ} (hk : 0 ≤ k)
    {g : ℝ → S} (hg : IntervalIntegrable g volume 0 1) (U₀ : S) (q : ℕ) :
    ∃! c : Fin q → S, IsDGStep A k g U₀ c := sorry

/-- **Reduction to the scalar step on an eigenvector** (README 4.2). -/
theorem isDGStep_of_isDGHeatStep (A : S →L[ℝ] S) {lam : ℝ} {x : S} (hx : A x = lam • x)
    {k : ℝ} {q : ℕ} {P : ℝ[X]} (hP : IsDGHeatStep q (k * lam) P) :
    IsDGStep A k 0 x (fun i : Fin q => P.coeff i • x) := sorry

/-! ### 4.3 Error estimates -/

/-- **Global DG error** (README 4.3): `‖U^N - u(t_N)‖² ≤ C k^{2q} ∫₀^{t_N} |u^{(q)}|₁²`. -/
theorem exists_dg_error_sq_le (q : ℕ) (hq : 1 ≤ q) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (S : Type) [NormedAddCommGroup S] [InnerProductSpace ℝ S]
      [FiniteDimensional ℝ S] (A : S →L[ℝ] S), (A : S →ₗ[ℝ] S).IsSymmetric →
      (∀ x, 0 ≤ ⟪A x, x⟫_ℝ) → ∀ k : ℝ, 0 < k → ∀ f u : ℝ → S, ContDiff ℝ q u →
      (∀ t, 0 ≤ t → deriv u t + A (u t) = f t) → ∀ c : ℕ → Fin q → S,
      IsDGSolution A k f (u 0) c → ∀ N : ℕ,
        ‖dgNodal (u 0) c N - u (N * k)‖ ^ 2 ≤
          C * k ^ (2 * q) * ∫ t in (0 : ℝ)..(N * k),
            ⟪A (iteratedDeriv q u t), iteratedDeriv q u t⟫_ℝ := sorry

/-- **Nodal superconvergence** (README 4.3), `q ≥ 2`:
`‖U^N - u(t_N)‖² ≤ C k^{4q-2} ∫₀^{t_N} |u^{(q)}|²_{2q-1}`. -/
theorem exists_dg_nodal_superconvergence (q : ℕ) (hq : 2 ≤ q) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (S : Type) [NormedAddCommGroup S] [InnerProductSpace ℝ S]
      [FiniteDimensional ℝ S] (A : S →L[ℝ] S), (A : S →ₗ[ℝ] S).IsSymmetric →
      (∀ x, 0 ≤ ⟪A x, x⟫_ℝ) → ∀ k : ℝ, 0 < k → ∀ f u : ℝ → S, ContDiff ℝ q u →
      (∀ t, 0 ≤ t → deriv u t + A (u t) = f t) → ∀ c : ℕ → Fin q → S,
      IsDGSolution A k f (u 0) c → ∀ N : ℕ,
        ‖dgNodal (u 0) c N - u (N * k)‖ ^ 2 ≤
          C * k ^ (4 * q - 2) * ∫ t in (0 : ℝ)..(N * k),
            ⟪(A ^ (2 * q - 1)) (iteratedDeriv q u t), iteratedDeriv q u t⟫_ℝ := sorry

end DG

/-! ## Layer 5: Fourier approximation of periodic functions -/

section Fourier

local instance instTwoPiPos : Fact (0 < 2 * π) := ⟨Real.two_pi_pos⟩

/-! ### 5.1 Bernstein's inequality in `L²` -/

/-- The trigonometric polynomial `x ↦ ∑_{|j| ≤ N} c_j e^{ijx}`. -/
def fourierPoly (N : ℕ) (c : ℤ → ℂ) (x : ℝ) : ℂ :=
  ∑ j ∈ Finset.Icc (-(N : ℤ)) N, c j * Complex.exp (j * x * Complex.I)

/-- **Bernstein's inequality in `L²`** (README 5.1): `‖φ^{(m)}‖ ≤ N^m ‖φ‖` on `[0, 2π]`. -/
theorem bernstein_fourierPoly (N : ℕ) (c : ℤ → ℂ) (m : ℕ) :
    ∫ x in (0 : ℝ)..2 * π, ‖iteratedDeriv m (fourierPoly N c) x‖ ^ 2 ≤
      (N : ℝ) ^ (2 * m) * ∫ x in (0 : ℝ)..2 * π, ‖fourierPoly N c x‖ ^ 2 := sorry

/-! ### 5.2 Truncation of the Fourier series -/

/-- **Maximum-norm truncation error** (README 5.2), with the constant `2 / (2m - 1)`. -/
theorem norm_sub_truncation_sq_le (u : C(AddCircle (2 * π), ℂ)) {m : ℝ} (hm : 1 / 2 < m)
    {N : ℕ} (hN : 1 ≤ N) (x : AddCircle (2 * π)) :
    ‖u x - ∑ k ∈ Finset.Icc (-(N : ℤ)) N, fourierCoeff u k • fourier k x‖ₑ ^ 2 ≤
      ENNReal.ofReal (2 / (2 * m - 1) * (N : ℝ) ^ (1 - 2 * m)) *
        ∑' k : ℤ, ENNReal.ofReal (|(k : ℝ)| ^ (2 * m)) * ‖fourierCoeff u k‖ₑ ^ 2 := sorry

/-! ### 5.3 Trigonometric interpolation -/

/-- The interpolation node `x_j = π j / N` on the circle. -/
def trigNode (N j : ℕ) : AddCircle (2 * π) := ((π * j / N : ℝ) : AddCircle (2 * π))

/-- The discrete Fourier coefficient `(2N)⁻¹ ∑_{j<2N} u(x_j) e^{-ikx_j}`. -/
def discreteCoeff (N : ℕ) (u : AddCircle (2 * π) → ℂ) (k : ℤ) : ℂ :=
  (2 * N : ℂ)⁻¹ * ∑ j ∈ Finset.range (2 * N), u (trigNode N j) * fourier (-k) (trigNode N j)

/-- The trigonometric interpolant on `2N` equispaced nodes, with the coefficients at `k = ±N`
halved. -/
def trigInterpolant (N : ℕ) (u : AddCircle (2 * π) → ℂ) (x : AddCircle (2 * π)) : ℂ :=
  ∑ k ∈ Finset.Icc (-(N : ℤ)) N,
    (discreteCoeff N u k / (if |k| = N then 2 else 1)) * fourier k x

/-- **The interpolant interpolates** (README 5.3). -/
theorem trigInterpolant_trigNode {N : ℕ} (hN : 1 ≤ N) (u : AddCircle (2 * π) → ℂ) {j : ℕ}
    (hj : j < 2 * N) : trigInterpolant N u (trigNode N j) = u (trigNode N j) := sorry

/-- **Interpolation error in `L²`** (README 5.3): `‖I_N u - u‖² ≤ C N^{-2m} |u|_m²`, `m > 1/2`. -/
theorem exists_trigInterpolant_error_le {m : ℝ} (hm : 1 / 2 < m) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (u : C(AddCircle (2 * π), ℂ)) (N : ℕ), 1 ≤ N →
      ∫⁻ x, ‖trigInterpolant N u x - u x‖ₑ ^ 2 ∂AddCircle.haarAddCircle ≤
        ENNReal.ofReal (C * (N : ℝ) ^ (-(2 * m))) *
          ∑' k : ℤ, ENNReal.ofReal (|(k : ℝ)| ^ (2 * m)) * ‖fourierCoeff u k‖ₑ ^ 2 := sorry

end Fourier

/-! ## Layer 6: Jacobi weights and polynomial projections -/

section Jacobi

/-! ### 6.1 The Jacobi measure and the derivative relation -/

/-- The Jacobi polynomial `Pₙ^{(α,β)}` over a `ℚ`-algebra, by the explicit sum of DLMF 18.5.8.
Local copy of `jacobi` of LaguerreJacobi, §3.2. -/
noncomputable def jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) : R[X] :=
  ((1 : ℚ) / 2 ^ n) • ∑ k ∈ Finset.range (n + 1),
    (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      ((ascPochhammer R (n - k)).smeval (β + k + 1) *
        (ascPochhammer R k).smeval (α + (n - k : ℕ) + 1))) • ((X - 1) ^ (n - k) * (X + 1) ^ k)

/-- The Jacobi measure `(1-x)^α (1+x)^β dx` on `(-1, 1)`. Local copy of `jacobiMeasure` of
LaguerreJacobi, §4.1. -/
noncomputable def jacobiMeasure (α β : ℝ) : Measure ℝ :=
  (volume.restrict (Ioo (-1) 1)).withDensity
    fun x => ENNReal.ofReal ((1 - x) ^ α * (1 + x) ^ β)

/-- The squared weighted norm `∫ |g|² (1 - x)^α (1 + x)^β`, in `ℝ≥0∞`. -/
def weightedNormSq (α β : ℝ) (g : ℝ → ℝ) : ℝ≥0∞ :=
  ∫⁻ x, ‖g x‖ₑ ^ 2 ∂jacobiMeasure α β

/-- **The Jacobi measure is an orthogonality measure** (README 6.1) for `α, β > -1`. -/
theorem isOrthogonalityMeasure_jacobiMeasure {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) :
    IsOrthogonalityMeasure (jacobiMeasure α β) := sorry

/-- **The Gram–Schmidt polynomials of the Jacobi measure are the Jacobi polynomials**
(README 6.1): `monic (jacobiMeasure α β) n` is `jacobi α β n` divided by its leading
coefficient. -/
theorem monic_jacobiMeasure_eq {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (n : ℕ) :
    monic (jacobiMeasure α β) n = C (jacobi α β n).leadingCoeff⁻¹ * jacobi α β n := sorry

/-- **Derivative relation** (README 6.1): `(p_{n+1}^{α,β})' = (n + 1) p_n^{α+1,β+1}` for the
monic Jacobi polynomials. -/
theorem derivative_monic_jacobiMeasure {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (n : ℕ) :
    derivative (monic (jacobiMeasure α β) (n + 1)) =
      C ((n : ℝ) + 1) * monic (jacobiMeasure (α + 1) (β + 1)) n := sorry

/-- **Norms of the derivatives** (README 6.1):
`∫ (p_n')² ω^{α+1,β+1} = n (n + α + β + 1) ∫ p_n² ω^{α,β}`. -/
theorem pairing_derivative_monic_jacobiMeasure {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (n : ℕ) :
    pairing (jacobiMeasure (α + 1) (β + 1)) (derivative (monic (jacobiMeasure α β) n))
        (derivative (monic (jacobiMeasure α β) n)) =
      n * (n + α + β + 1) * pairing (jacobiMeasure α β) (monic (jacobiMeasure α β) n)
        (monic (jacobiMeasure α β) n) := sorry

/-! ### 6.2 The weighted `L²` projection -/

/-- `p` is the orthogonal projection of `u` onto polynomials of degree `≤ N` in `L²_{ω^{α,β}}`. -/
def IsWeightedProjection (α β : ℝ) (N : ℕ) (u : ℝ → ℝ) (p : ℝ[X]) : Prop :=
  p.natDegree ≤ N ∧ ∀ q : ℝ[X], q.natDegree ≤ N →
    ∫ x, (u x - p.eval x) * q.eval x ∂jacobiMeasure α β = 0

/-- **Weighted projection error** (README 6.2), fixed `m`:
`N^{2(m-l)} ‖∂^l (u - π_N u)‖²_{ω^{α+l,β+l}} ≤ C ‖∂^m u‖²_{ω^{α+m,β+m}}`, `l ≤ m ≤ N + 1`. -/
theorem exists_weightedProjection_error_le {α β : ℝ} (hα : -1 < α) (hβ : -1 < β) (m : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ N : ℕ, m ≤ N + 1 → ∀ u : ℝ → ℝ, ContDiffOn ℝ m u (Ioo (-1) 1) →
      (∀ j ≤ m, weightedNormSq (α + j) (β + j) (iteratedDeriv j u) < ⊤) →
      ∀ p : ℝ[X], IsWeightedProjection α β N u p → ∀ l ≤ m,
        ENNReal.ofReal ((N : ℝ) ^ (2 * (m - l))) *
            weightedNormSq (α + l) (β + l) (iteratedDeriv l fun x => u x - p.eval x) ≤
          ENNReal.ofReal C * weightedNormSq (α + m) (β + m) (iteratedDeriv m u) := sorry

/-! ### 6.3 The `H¹₀` projection -/

/-- `p` is the `H¹₀` projection of `u` onto polynomials of degree `≤ N` vanishing at `±1`. -/
def IsH10Projection (N : ℕ) (u : ℝ → ℝ) (p : ℝ[X]) : Prop :=
  p.natDegree ≤ N ∧ p.eval (-1) = 0 ∧ p.eval 1 = 0 ∧ ∀ q : ℝ[X], q.natDegree ≤ N →
    q.eval (-1) = 0 → q.eval 1 = 0 →
      ∫ x in (-1 : ℝ)..1, (deriv u x - (derivative p).eval x) * (derivative q).eval x = 0

/-- **`H¹₀` projection error** (README 6.3), fixed `m ≥ 1`, `m ≤ N + 1`: the derivative error
against the weighted norm of `u^{(m)}` and the optimal `L²` error. -/
theorem exists_H10Projection_error_le (m : ℕ) (hm : 1 ≤ m) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ N : ℕ, m ≤ N + 1 → ∀ u : ℝ → ℝ, ContinuousOn u (Icc (-1) 1) →
      u (-1) = 0 → u 1 = 0 → ContDiffOn ℝ m u (Ioo (-1) 1) →
      weightedNormSq 0 0 (deriv u) < ⊤ → ∀ p : ℝ[X], IsH10Projection N u p →
        ENNReal.ofReal ((N : ℝ) ^ (2 * (m - 1))) *
            weightedNormSq 0 0 (fun x => deriv u x - (derivative p).eval x) ≤
          ENNReal.ofReal C * weightedNormSq ((m : ℝ) - 1) ((m : ℝ) - 1) (iteratedDeriv m u) ∧
        ENNReal.ofReal ((N : ℝ) ^ (2 * m)) * weightedNormSq 0 0 (fun x => u x - p.eval x) ≤
          ENNReal.ofReal C * weightedNormSq 0 0 (iteratedDeriv m u) := sorry

end Jacobi

/-! ## Layer 7: Legendre–Gauss–Lobatto interpolation and the Legendre–Galerkin method -/

section LegendreGalerkin

/-! ### 7.1 Legendre–Gauss–Lobatto interpolation -/

/-- The `n + 2` Legendre–Gauss–Lobatto nodes for degree `N = n + 1`: `-1`, the zeros of
`L_{n+1}'` (the monic Jacobi polynomial of degree `n` for `α = β = 1`), and `1`. -/
def lglNodes (n : ℕ) : Fin (n + 2) → ℝ :=
  Fin.cons (-1) (Fin.snoc (α := fun _ => ℝ) (zeros (jacobiMeasure 1 1) n) 1)

/-- The interpolant of degree `≤ n + 1` at the Legendre–Gauss–Lobatto nodes. -/
def lglInterpolant (n : ℕ) (u : ℝ → ℝ) : ℝ[X] :=
  Lagrange.interpolate Finset.univ (lglNodes n) (u ∘ lglNodes n)

/-- **The nodes are increasing** (README 7.1). -/
theorem lglNodes_strictMono (n : ℕ) : StrictMono (lglNodes n) := sorry

/-- **Legendre–Gauss–Lobatto interpolation error** (README 7.1), fixed `m ≥ 1`, `m ≤ N + 1`:
`N^{2(m-1)} (‖(I_N u - u)'‖² + N² ‖I_N u - u‖²_{ω^{-1,-1}}) ≤ C ‖u^{(m)}‖²_{ω^{m-1,m-1}}`. -/
theorem exists_lglInterpolant_error_le (m : ℕ) (hm : 1 ≤ m) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ n : ℕ, m ≤ n + 2 → ∀ u : ℝ → ℝ, ContinuousOn u (Icc (-1) 1) →
      ContDiffOn ℝ m u (Ioo (-1) 1) →
        ENNReal.ofReal (((n : ℝ) + 1) ^ (2 * (m - 1))) *
            (weightedNormSq 0 0 (fun x => deriv u x - (derivative (lglInterpolant n u)).eval x) +
              ENNReal.ofReal (((n : ℝ) + 1) ^ 2) *
                weightedNormSq (-1) (-1) (fun x => u x - (lglInterpolant n u).eval x)) ≤
          ENNReal.ofReal C * weightedNormSq ((m : ℝ) - 1) ((m : ℝ) - 1) (iteratedDeriv m u) :=
  sorry

/-! ### 7.2 The Legendre–Galerkin method -/

/-- `U` solves the Legendre–Galerkin problem of degree `N = n + 1` for `-u'' + α u = f`,
`u(±1) = 0`, with the load interpolated at the Legendre–Gauss–Lobatto nodes. -/
def IsLegendreGalerkinSolution (α : ℝ) (n : ℕ) (f : ℝ → ℝ) (U : ℝ[X]) : Prop :=
  U.natDegree ≤ n + 1 ∧ U.eval (-1) = 0 ∧ U.eval 1 = 0 ∧ ∀ v : ℝ[X], v.natDegree ≤ n + 1 →
    v.eval (-1) = 0 → v.eval 1 = 0 →
      ∫ x in (-1 : ℝ)..1, ((derivative U).eval x * (derivative v).eval x +
          α * U.eval x * v.eval x) =
        ∫ x in (-1 : ℝ)..1, (lglInterpolant n f).eval x * v.eval x

/-- **The Legendre–Galerkin problem is uniquely solvable** (README 7.2) for `α ≥ 0`. -/
theorem existsUnique_legendreGalerkin {α : ℝ} (hα : 0 ≤ α) (n : ℕ) (f : ℝ → ℝ) :
    ∃! U, IsLegendreGalerkinSolution α n f U := sorry

/-- **Legendre–Galerkin error in `H¹`** (README 7.2), fixed `m, k ≥ 1`, `m, k ≤ N + 1`:
`‖u - U‖²_{H¹} ≤ C (N^{-2(m-1)} ‖u^{(m)}‖²_{ω^{m-1,m-1}} + N^{-2k} ‖f^{(k)}‖²_{ω^{k-1,k-1}})`. -/
theorem exists_legendreGalerkin_H1_error_bound {α : ℝ} (hα : 0 ≤ α) (m k : ℕ) (hm : 1 ≤ m)
    (hk : 1 ≤ k) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ n : ℕ, m ≤ n + 2 → k ≤ n + 2 → ∀ u f : ℝ → ℝ,
      ContinuousOn u (Icc (-1) 1) → u (-1) = 0 → u 1 = 0 →
      ContDiffOn ℝ (max m 2 : ℕ) u (Ioo (-1) 1) →
      (∀ x ∈ Ioo (-1 : ℝ) 1, -iteratedDeriv 2 u x + α * u x = f x) →
      ContinuousOn f (Icc (-1) 1) → ContDiffOn ℝ k f (Ioo (-1) 1) →
      ∀ U : ℝ[X], IsLegendreGalerkinSolution α n f U →
        weightedNormSq 0 0 (fun x => u x - U.eval x) +
            weightedNormSq 0 0 (fun x => deriv u x - (derivative U).eval x) ≤
          ENNReal.ofReal C *
            (weightedNormSq ((m : ℝ) - 1) ((m : ℝ) - 1) (iteratedDeriv m u) /
                ((n : ℝ≥0∞) + 1) ^ (2 * (m - 1)) +
              weightedNormSq ((k : ℝ) - 1) ((k : ℝ) - 1) (iteratedDeriv k f) /
                ((n : ℝ≥0∞) + 1) ^ (2 * k)) := sorry

end LegendreGalerkin

#check @TauCeti.W1p0
#check @TauCeti.W1p0.valueL
#check @TauCeti.W1p.value
#check @TauCeti.W1p.gradient
#check @TauCeti.Wkp
#check @TauCeti.Wkp.value
#check @TauCeti.Wkp.firstOrder
#check @TauCeti.Wkp.lowerOrderL
#check @TauCeti.Wkp.iteratedGradient
#check @TauCeti.PDE.energyFormH1
#check @TauCeti.PDE.energyFormH1L0
#check @TauCeti.PDE.energyFormH1L0_apply
#check @TauCeti.PDE.IsWeakSolutionDirichlet
#check @TauCeti.PDE.existsUnique_galerkinSolution
#check @ContinuousLinearMap.gelfandDual
#check @MeasureTheory.memLp_top_const
#check @fourierBasis
#check @fourierBasis_repr
#check @fourierCoeff
#check @fourier
#check @AddCircle.haarAddCircle
#check @hasSum_sq_fourierCoeff
#check @has_pointwise_sum_fourier_series_of_summable
#check @Lagrange.interpolate
#check @Polynomial.derivative
#check @iteratedDeriv
#check @MeasureTheory.Measure.withDensity
#check @LinearMap.IsSymmetric
#check @derivWithin
#check @HasDerivWithinAt

end TauCetiRoadmap.ParabolicAndSpectralGalerkinMethods
