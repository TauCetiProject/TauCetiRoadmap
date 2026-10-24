/-
# Global holomorphic functions of one complex variable: proposed signatures

**This file is not the roadmap and is not exhaustive.** These are suggested Lean declarations;
the README is the definitive specification. All admitted theorems are honest targets.
-/


import Mathlib
import TauCeti.Analysis.Contour.Primitive

/-!
Native one-variable dependencies used in GH4: root-namespace `cot_series_rep`,
`HasProdLocallyUniformlyOn_euler_sin_prod`,
`multipliableUniformlyOn_euler_sin_prod_on_compact`. The generic
`Complex.logDeriv_tendsto` is in `Mathlib.Analysis.Complex.LocallyUniformLimit`.
The cotangent and Euler-product declarations above are in
`Mathlib.Analysis.SpecialFunctions.Trigonometric.Cotangent`;
the factorization equivalences are `AnalyticAt.analyticOrderAt_eq_natCast` and
`meromorphicOrderAt_eq_int_iff` in the analytic and meromorphic order modules. The real-plane
normalization for complex area measure is `Complex.volume_preserving_equiv_real_prod` from
`Mathlib.MeasureTheory.Measure.Lebesgue.Complex` (and its `Fin 2 → ℝ` counterpart).
-/


namespace TauCetiRoadmap.GlobalHolomorphicFunctions

open Filter Set Topology MeasureTheory
open scoped ContDiff Manifold

/-- A compact subset has no complementary component relatively compact in the domain.
Use Mathlib's actual connected components; all closures are in the ambient plane. -/
def IsRungeCompactPair (Ω K : Set ℂ) : Prop :=
  IsOpen Ω ∧ IsCompact K ∧ K ⊆ Ω ∧
    ∀ z ∈ Ω \ K,
      ¬ (IsCompact (closure (connectedComponentIn (Ω \ K) z)) ∧
        closure (connectedComponentIn (Ω \ K) z) ⊆ Ω)

/-- **GH0, Runge.** Every ambient-neighborhood holomorphic function is uniformly
approximable on `K` by functions holomorphic on `Ω` exactly for compact Runge pairs. -/
theorem isRungeCompactPair_iff_approximation {Ω K : Set ℂ}
    (hΩ : IsOpen Ω) (hK : IsCompact K) (hKΩ : K ⊆ Ω) :
    IsRungeCompactPair Ω K ↔
      ∀ U : Set ℂ, IsOpen U → K ⊆ U →
      ∀ f : ℂ → ℂ, DifferentiableOn ℂ f U →
        ∀ ε > 0, ∃ g : ℂ → ℂ, DifferentiableOn ℂ g Ω ∧
          ∀ z ∈ K, ‖f z - g z‖ < ε := by
  sorry

/-- **GH0, finite-rank Runge operator.** Fix a compact collar L inside the holomorphy
neighborhood and the ambient domain. For every ε, one finite evaluation formula, independent of f,
approximates every U-holomorphic f with an explicit operator bound in terms of `sup_L ‖f‖`.
This stronger interface is what permits differentiation in smooth parameters and preserves
holomorphic dependence on external complex parameters. -/
theorem exists_finite_rank_runge_operator {Ω K U : Set ℂ}
    (hRunge : IsRungeCompactPair Ω K) (hU : IsOpen U) (hKU : K ⊆ U) :
    ∃ L : Set ℂ, IsCompact L ∧ K ⊆ interior L ∧ L ⊆ U ∩ Ω ∧
      ∀ ε : ℝ, 0 < ε →
        ∃ N : ℕ, ∃ ζ : Fin N → ℂ, ∃ w : Fin N → ℂ,
          ∃ g : Fin N → ℂ → ℂ,
            (∀ j, ζ j ∈ interior L) ∧
            (∀ j, DifferentiableOn ℂ (g j) Ω) ∧
            ∀ f : ℂ → ℂ, DifferentiableOn ℂ f U →
              ∀ B : ℝ, 0 ≤ B → (∀ z ∈ L, ‖f z‖ ≤ B) →
                ∀ z ∈ K,
                  ‖f z - ∑ j, w j * f (ζ j) * g j z‖ ≤ ε * B := by
  sorry

/-- **GH1 prerequisite.** Approximation by functions that are nowhere zero throughout the
ambient domain. This is stronger than ordinary scalar Runge approximation. -/
theorem exists_zero_free_holomorphic_approximation
    {Ω K U : Set ℂ} (hRunge : IsRungeCompactPair Ω K)
    (hU : IsOpen U) (hKU : K ⊆ U) {u : ℂ → ℂ}
    (hu : DifferentiableOn ℂ u U) (hne : ∀ z ∈ U, u z ≠ 0) :
    ∀ ε > 0, ∃ g : ℂ → ℂ, DifferentiableOn ℂ g Ω ∧
      (∀ z ∈ Ω, g z ≠ 0) ∧ ∀ z ∈ K, ‖u z - g z‖ < ε := by
  sorry

/-- **GH1, zero-divisor realization.** The datum is Mathlib's native locally finite support
function on the domain, not a private closed-discrete wrapper. -/
theorem exists_holomorphic_with_zero_orders
    {Ω : Set ℂ} (hΩ : IsOpen Ω) (m : Function.locallyFinsuppWithin Ω ℕ) :
    ∃ f : ℂ → ℂ, DifferentiableOn ℂ f Ω ∧
      ∀ z ∈ Ω, analyticOrderAt f z = (m z : ℕ∞) := by
  sorry

/-- **GH1, signed divisor realization.** `MeromorphicOn.divisor` is itself the native
`locallyFinsuppWithin Ω ℤ` carrier. The finite-order conclusion excludes the identically-zero
function on every component. -/
theorem exists_meromorphic_with_divisor
    {Ω : Set ℂ} (hΩ : IsOpen Ω) (ν : Function.locallyFinsuppWithin Ω ℤ) :
    ∃ f : ℂ → ℂ, MeromorphicOn f Ω ∧ MeromorphicOn.divisor f Ω = ν ∧
      ∀ z ∈ Ω, meromorphicOrderAt f z ≠ ⊤ := by
  sorry

/-- **GH2, Mittag–Leffler.** Meromorphic germs with finite principal parts on a relatively
closed discrete subset can be realized simultaneously by one meromorphic function. -/
theorem exists_meromorphic_prescribed_principal_parts
    {Ω : Set ℂ} (hΩ : IsOpen Ω) {E : Set ℂ} (hEΩ : E ⊆ Ω) (hE : Eᶜ ∈ codiscreteWithin Ω)
    (P : E → ℂ → ℂ) (hP : ∀ a : E, MeromorphicAt (P a) a.val) :
    ∃ f : ℂ → ℂ, MeromorphicOn f Ω ∧
      (∀ a : E, ∃ g : ℂ → ℂ, AnalyticAt ℂ g a.val ∧
        ∀ᶠ z in 𝓝[≠] a.val, f z - P a z = g z) ∧
      DifferentiableOn ℂ f (Ω \ E) := by
  sorry

/-- **GH2, isolated singularities.** Prescribed holomorphic germs on punctured neighborhoods
may have essential singularities. The difference extends holomorphically at each marked point. -/
theorem exists_holomorphic_prescribed_isolated_singularities
    {Ω : Set ℂ} (hΩ : IsOpen Ω) {E : Set ℂ} (hEΩ : E ⊆ Ω) (hE : Eᶜ ∈ codiscreteWithin Ω)
    (U : E → Set ℂ) (P : E → ℂ → ℂ)
    (hU : ∀ a, IsOpen (U a)) (haU : ∀ a : E, a.val ∈ U a)
    (hP : ∀ a : E, DifferentiableOn ℂ (P a) (U a \ {a.val})) :
    ∃ f : ℂ → ℂ, DifferentiableOn ℂ f (Ω \ E) ∧
      ∀ a : E, ∃ g : ℂ → ℂ, AnalyticAt ℂ g a.val ∧
        (∀ᶠ z in 𝓝[≠] a.val, f z - P a z = g z) := by
  sorry

/-- Weierstrass's primary factor. The empty correction sum gives `E₀(w)=1-w`. -/
noncomputable def elementaryFactor (p : ℕ) (w : ℂ) : ℂ :=
  (1 - w) * Complex.exp (∑ k ∈ Finset.range p, w ^ (k + 1) / (k + 1))

@[simp] theorem elementaryFactor_order_zero (w : ℂ) : elementaryFactor 0 w = 1 - w := by
  simp [elementaryFactor]

@[simp] theorem elementaryFactor_one (w : ℂ) :
    elementaryFactor 1 w = (1 - w) * Complex.exp w := by
  simp [elementaryFactor]

/-- Preparatory primary-product realization. Its zero-set statement records support only; the
exact-order companion below records multiplicity. -/
theorem exists_entire_primary_product (a : ℕ → ℂ) (p : ℕ → ℕ)
    (ha : ∀ n, a n ≠ 0)
    (hEscape : Tendsto (fun n => ‖a n‖) atTop atTop)
    (hsum : ∀ R : ℝ, 0 < R → Summable (fun n => (R / ‖a n‖) ^ (p n + 1))) :
    ∃ F : ℂ → ℂ,
      HasProdLocallyUniformlyOn (fun n z => elementaryFactor (p n) (z / a n)) F Set.univ ∧
      DifferentiableOn ℂ F Set.univ ∧
      ∀ z, F z = 0 ↔ ∃ n, z = a n := by
  sorry

/-- Preparatory normalized primary-factor deviation estimate. -/
theorem elementaryFactor_deviation_le (p : ℕ) {w : ℂ} (hw : ‖w‖ ≤ 1) :
    ‖1 - elementaryFactor p w‖ ≤ ‖w‖ ^ (p + 1) := by
  sorry

/-- Preparatory locally-uniform product for summable holomorphic deviations. -/
theorem hasProd_one_add_of_summableOnCompact {U : Set ℂ} (hU : IsOpen U)
    (u : ℕ → ℂ → ℂ) (hu : ∀ n, DifferentiableOn ℂ (u n) U)
    (hsum : ∀ K, IsCompact K → K ⊆ U → Summable (fun n => ⨆ z ∈ K, ‖u n z‖)) :
    ∃ F : ℂ → ℂ, HasProdLocallyUniformlyOn (fun n z => 1 + u n z) F U ∧
      DifferentiableOn ℂ F U := by
  sorry

/-- **Preparatory, arbitrary countable indexing and exact multiplicities.** The cofinite escape condition
includes finite and empty index types and forces every zero fiber to be finite, so its cardinal is
the exact multiplicity. -/
theorem exists_entire_primary_product_exact (ι : Type*) [Countable ι]
    (a : ι → ℂ) (p : ι → ℕ)
    (ha : ∀ i, a i ≠ 0)
    (hEscape : Tendsto (fun i => ‖a i‖) (Filter.cofinite : Filter ι) atTop)
    (hsum : ∀ R : ℝ, 0 < R → Summable (fun i => (R / ‖a i‖) ^ (p i + 1))) :
    ∃ F : ℂ → ℂ,
      HasProdLocallyUniformlyOn (fun i z => elementaryFactor (p i) (z / a i)) F Set.univ ∧
      DifferentiableOn ℂ F Set.univ ∧
      ∀ z, analyticOrderAt F z = (Nat.card {i // a i = z} : ℕ∞) := by
  sorry

open scoped Classical in
/-- Weighted genus-one specialization. Compact finiteness supplies cofinite escape on the
repeated index; inverse-square summability supplies the compact majorants. Both products
converge to the same normalized entire function, even at zeros. -/
theorem exists_entire_genusOne_product (S : Set ℂ) [Countable S] (m : S → ℕ)
    (hzero : (0 : ℂ) ∉ S)
    (hfinite : ∀ K : Set ℂ, IsCompact K → (S ∩ K).Finite)
    (hsum : Summable (fun ρ : S => (m ρ : ℝ) / ‖(ρ : ℂ)‖ ^ 2)) :
    ∃ F : ℂ → ℂ,
      HasProdLocallyUniformlyOn
        (fun (ρ : S) z => elementaryFactor 1 (z / (ρ : ℂ)) ^ m ρ) F Set.univ ∧
      HasProdLocallyUniformlyOn
        (fun (i : Σ ρ : S, Fin (m ρ)) z => elementaryFactor 1 (z / (i.1 : ℂ)))
        F Set.univ ∧
      Differentiable ℂ F ∧ F 0 = 1 ∧
      ∀ z, analyticOrderAt F z = (if hz : z ∈ S then (m ⟨z, hz⟩ : ℕ∞) else 0) ∧
        MeromorphicOn.divisor F Set.univ z =
          (if hz : z ∈ S then (m ⟨z, hz⟩ : ℤ) else 0) := by
  sorry

/-- Native-divisor input form of the genus-one product. Its locally finite support supplies
the countability and compact-finiteness hypotheses of the support-indexed target. -/
theorem exists_entire_genusOne_product_of_divisor
    (D : Function.locallyFinsuppWithin (Set.univ : Set ℂ) ℤ)
    (hD : ∀ z, 0 ≤ D z) (hDzero : D 0 = 0)
    (hsum : Summable (fun ρ : Function.support D => (D (ρ : ℂ) : ℝ) / ‖(ρ : ℂ)‖ ^ 2)) :
    ∃ F : ℂ → ℂ,
      HasProdLocallyUniformlyOn
        (fun (ρ : Function.support D) z =>
          elementaryFactor 1 (z / (ρ : ℂ)) ^ (D (ρ : ℂ)).toNat) F Set.univ ∧
      Differentiable ℂ F ∧ F 0 = 1 ∧ MeromorphicOn.divisor F Set.univ = D := by
  sorry

/-- Consume the native period-to-primitive result for the contour provider's closed paths. -/
theorem primitive_of_vanishing_closed_integrals {U : Set ℂ} {f : ℂ → ℂ}
    (hU : IsOpen U) (hf : ContinuousOn f U)
    (h : ∀ (γ : ℝ → ℂ) (a b : ℝ), TauCeti.Contour.IsPiecewiseC1On γ a b →
      MapsTo γ (uIcc a b) U → γ a = γ b →
      ∫ t in a..b, deriv γ t • f (γ t) = 0) :
    Complex.IsExactOn f U :=
  TauCeti.Contour.isExactOn_of_forall_closed_integral_eq_zero hU hf h

/-- Consume the contour provider's primitive-to-logarithm theorem on an arbitrary open plane set. -/
theorem holomorphic_log_of_logDeriv_primitive {U : Set ℂ} {f : ℂ → ℂ}
    (hU : IsOpen U) (hf : DifferentiableOn ℂ f U) (hne : 0 ∉ f '' U)
    (hex : Complex.IsExactOn (logDeriv f) U) :
    ∃ g : ℂ → ℂ, DifferentiableOn ℂ g U ∧ EqOn (Complex.exp ∘ g) f U :=
  TauCeti.Contour.exists_differentiableOn_eqOn_exp_comp_of_isExactOn hU hf hne hex

/-- Consume the contour provider's no-holes specialization, which supplies the primitive and
logarithm implications for simply connected plane domains. -/
theorem holomorphic_log_of_filledHull_subset {U : Set ℂ} {f : ℂ → ℂ}
    (hU : IsOpen U) (hUf : TauCeti.filledHull U ⊆ U)
    (hf : DifferentiableOn ℂ f U) (hne : 0 ∉ f '' U) :
    ∃ g : ℂ → ℂ, DifferentiableOn ℂ g U ∧ EqOn (Complex.exp ∘ g) f U :=
  TauCeti.Contour.exists_differentiableOn_eqOn_exp_comp_of_filledHull_subset hU hUf hf hne

/-- **GH3, zero-free entire logarithm.** Native primitive/logarithm adapters supply the
quotient step after the primary product removes the zeros. -/
theorem exists_entire_log (f : ℂ → ℂ) (hf : Differentiable ℂ f) (hne : ∀ z, f z ≠ 0) :
    ∃ g : ℂ → ℂ, Differentiable ℂ g ∧ ∀ z, f z = Complex.exp (g z) := by
  obtain ⟨g, hg, hEq⟩ := holomorphic_log_of_filledHull_subset
    (U := Set.univ) isOpen_univ (by simp) (fun z _ => differentiableWithinAt_univ.mpr (hf z)) (by
      rintro ⟨z, -, hz⟩
      exact hne z hz)
  refine ⟨g, ?_, ?_⟩
  · exact (differentiableOn_univ.mp hg)
  · intro z
    exact (hEq (Set.mem_univ z)).symm

/-- **GH3, reusable equal-divisor factorization.** Both functions must be nontrivial:
the native divisor of the identically zero function is also zero. The quotient is extended
through common zeros before its entire logarithm is taken. -/
theorem exists_entire_exp_mul_of_divisor_eq (f F : ℂ → ℂ)
    (hf : Differentiable ℂ f) (hF : Differentiable ℂ F)
    (hf_ne : ∃ z, f z ≠ 0) (hF_ne : ∃ z, F z ≠ 0)
    (hdiv : MeromorphicOn.divisor f Set.univ = MeromorphicOn.divisor F Set.univ) :
    ∃ g : ℂ → ℂ, Differentiable ℂ g ∧ ∀ z, f z = Complex.exp (g z) * F z := by
  sorry

/-- **GH1, GH2 corollary.** Every meromorphic function on an open plane set is a quotient
of two holomorphic functions, interpreted on the codiscrete set where the denominator is
nonzero. -/
theorem exists_holomorphic_quotient {Ω : Set ℂ} (hΩ : IsOpen Ω) {F : ℂ → ℂ} (hF : MeromorphicOn F Ω) :
    ∃ f g : ℂ → ℂ, DifferentiableOn ℂ f Ω ∧ DifferentiableOn ℂ g Ω ∧
      (∀ᶠ z in codiscreteWithin Ω, g z ≠ 0 ∧ F z = f z / g z) := by
  sorry

/-- **Preparatory Looman–Menchoff.** Continuity and the two everywhere real-direction
complex derivatives satisfying CR imply holomorphicity. No real Fréchet derivative or
continuity/integrability of the coordinate partials is assumed. -/
theorem differentiableOn_complex_of_continuous_real_lineDerivatives_cr
    {Ω : Set ℂ} (hΩ : IsOpen Ω) (f : ℂ → ℂ) (hcont : ContinuousOn f Ω)
    (hline : ∀ z ∈ Ω, ∃ fx fy : ℂ,
      HasLineDerivAt ℝ f fx z 1 ∧
      HasLineDerivAt ℝ f fy z Complex.I ∧
      fy = Complex.I * fx) :
    DifferentiableOn ℂ f Ω := by
  sorry


/-- The real-coordinate Cauchy–Riemann operator `∂̄`, expressed through the native real
Fréchet derivative. The vectors `1` and `I` are the x and y coordinate directions. -/
noncomputable def barDerivative (u : ℂ → ℂ) (z : ℂ) : ℂ :=
  (fderiv ℝ u z 1 + Complex.I * fderiv ℝ u z Complex.I) / 2

/-- The Wirtinger `∂_z` operator, in the same real Fréchet coordinates. -/
noncomputable def zDerivative (u : ℂ → ℂ) (z : ℂ) : ℂ :=
  (fderiv ℝ u z 1 - Complex.I * fderiv ℝ u z Complex.I) / 2

/-- The real-coordinate `∂̄u = 0` equation is exactly the Cauchy–Riemann equation for the
real Fréchet derivative. -/
theorem barDerivative_eq_zero_iff_cr (u : ℂ → ℂ) (z : ℂ) :
    barDerivative u z = 0 ↔ fderiv ℝ u z Complex.I = Complex.I * fderiv ℝ u z 1 := by
  sorry

/-- For a real-differentiable function, vanishing `∂̄` is equivalent to complex differentiability.
This is the pointwise adapter between the smooth and holomorphic layers. -/
theorem differentiableAt_complex_iff_barDerivative_eq_zero
    (u : ℂ → ℂ) (z : ℂ) (hu : DifferentiableAt ℝ u z) :
    DifferentiableAt ℂ u z ↔ barDerivative u z = 0 := by
  sorry

/-- The ordinary complex-valued Bochner integral defining the compact-support
Cauchy–Green transform. `volume` is Lebesgue area measure on the real plane underlying ℂ. -/
noncomputable def cauchyGreen (φ : ℂ → ℂ) (z : ℂ) : ℂ :=
  ((Real.pi : ℂ)⁻¹) * ∫ ζ, φ ζ / (z - ζ) ∂MeasureTheory.volume

/-- The Cauchy kernel singularity is locally integrable in two real dimensions; compact
support and smoothness of `φ` give Bochner integrability for every `z`. -/
theorem cauchyGreen_kernel_integrable (φ : ℂ → ℂ)
    (hφ : HasCompactSupport φ) (hφsmooth : ContDiff ℝ ∞ φ) (z : ℂ) :
    MeasureTheory.Integrable (fun ζ : ℂ => φ ζ / (z - ζ)) MeasureTheory.volume := by
  sorry

/-- Compact-support Cauchy–Green produces a smooth function on the whole plane. -/
theorem cauchyGreen_contDiff (φ : ℂ → ℂ)
    (hφ : HasCompactSupport φ) (hφsmooth : ContDiff ℝ ∞ φ) :
    ContDiff ℝ ∞ (cauchyGreen φ) := by
  sorry

/-- With `dA=dx dy` and `∂̄=(∂x+i∂y)/2`, the normalized Cauchy–Green transform solves
`∂̄u=φ` pointwise on ℂ. -/
theorem cauchyGreen_barDerivative (φ : ℂ → ℂ)
    (hφ : HasCompactSupport φ) (hφsmooth : ContDiff ℝ ∞ φ) (z : ℂ) :
    barDerivative (cauchyGreen φ) z = φ z := by
  sorry

/-- **Compact-support reconstruction.** Applying the Cauchy–Green transform to `∂̄φ`
recovers a compactly supported smooth function. -/
theorem cauchyGreen_barDerivative_reconstruct (φ : ℂ → ℂ)
    (hφ : HasCompactSupport φ) (hφsmooth : ContDiff ℝ ∞ φ) :
    ∀ z, cauchyGreen (barDerivative φ) z = φ z := by
  sorry

/-- **GH5, global smooth `∂̄` solvability.** Every smooth datum on an arbitrary open plane
set has a smooth global solution; the construction is the exhaustion/Runge correction in GH5. -/
theorem exists_smooth_barDerivative_eq {Ω : Set ℂ} (hΩ : IsOpen Ω)
    (f : ℂ → ℂ) (hf : ContDiffOn ℝ ∞ f Ω) :
    ∃ u : ℂ → ℂ, ContDiffOn ℝ ∞ u Ω ∧
      ∀ z ∈ Ω, barDerivative u z = f z := by
  sorry

/-- **GH5, closed completion.** This coefficient equation is equivalent to closedness of
`g dz + f dbarz` on GH5's differential-form carrier. -/
theorem exists_smooth_closed_completion {Ω : Set ℂ} (hΩ : IsOpen Ω)
    (f : ℂ → ℂ) (hf : ContDiffOn ℝ ∞ f Ω) :
    ∃ g : ℂ → ℂ, ContDiffOn ℝ ∞ g Ω ∧
      ∀ z ∈ Ω, barDerivative g z = zDerivative f z := by
  sorry


/-- Holomorphic functions on an open complex subtype, using Mathlib's analytic map bundle. -/
abbrev HolomorphicMapSpace (U : TopologicalSpace.Opens ℂ) :=
  ContMDiffMap (modelWithCornersSelf ℂ ℂ) (modelWithCornersSelf ℂ ℂ) U ℂ ω

/-- The underlying continuous map of a native analytic map. -/
noncomputable def HolomorphicMapSpace.toContinuousMap (U : TopologicalSpace.Opens ℂ)
    (f : HolomorphicMapSpace U) : C(U, ℂ) :=
  (f : C(U, ℂ))

theorem HolomorphicMapSpace.toContinuousMap_injective (U : TopologicalSpace.Opens ℂ) :
    Function.Injective (HolomorphicMapSpace.toContinuousMap U) := by
  intro f g h
  apply ContMDiffMap.coe_injective
  exact congrArg ContinuousMap.toFun h

namespace HolomorphicMapTopology

noncomputable section

scoped instance openSubtypeLocallyCompact (U : TopologicalSpace.Opens ℂ) :
    LocallyCompactSpace U := U.isOpen.locallyCompactSpace

scoped instance compactConvergenceUniformity (U : TopologicalSpace.Opens ℂ) :
    UniformSpace (HolomorphicMapSpace U) :=
  UniformSpace.comap (HolomorphicMapSpace.toContinuousMap U) inferInstance

end
end HolomorphicMapTopology

open scoped HolomorphicMapTopology

theorem HolomorphicMapSpace.tendsto_iff_tendstoLocallyUniformly
    (U : TopologicalSpace.Opens ℂ)
    {ι : Type*} {p : Filter ι} {F : ι → HolomorphicMapSpace U} {f : HolomorphicMapSpace U} :
    Tendsto F p (𝓝 f) ↔
      TendstoLocallyUniformly (fun i x => F i x) f p := by
  letI := HolomorphicMapTopology.compactConvergenceUniformity U
  simp only [nhds_induced, Filter.tendsto_comap_iff]
  exact ContinuousMap.tendsto_iff_tendstoLocallyUniformly

/-- Compatibility with the native pointwise algebra structures. -/
theorem HolomorphicMapSpace.toContinuousMap_mul (U : TopologicalSpace.Opens ℂ)
    (f g : HolomorphicMapSpace U) :
    HolomorphicMapSpace.toContinuousMap U (f * g) =
      HolomorphicMapSpace.toContinuousMap U f * HolomorphicMapSpace.toContinuousMap U g := rfl

/-- A total ambient representative; no continuity outside the open domain is asserted. -/
noncomputable def ambientRepresentative (U : TopologicalSpace.Opens ℂ) (f : C(U, ℂ)) :
    ℂ → ℂ :=
  Function.extend Subtype.val f 0

/-- **GH0.** The analytic-map bundle realizes exactly the ambient holomorphic predicate.
The comparison is an interface target; it is not assumed in the carrier definition. -/
theorem range_holomorphicMapSpace_toContinuousMap (U : TopologicalSpace.Opens ℂ) :
    Set.range (HolomorphicMapSpace.toContinuousMap U) =
      {f : C(U, ℂ) | DifferentiableOn ℂ (ambientRepresentative U f) (U : Set ℂ)} := by
  sorry

/-- **GH0.** Holomorphic maps have closed image in native compact convergence. -/
theorem isClosed_range_holomorphicMapSpace_toContinuousMap (U : TopologicalSpace.Opens ℂ) :
    IsClosed (Set.range (HolomorphicMapSpace.toContinuousMap U)) := by
  sorry

/-- **GH1.** One holomorphic function fails to extend across every boundary point.
Agreement is required on the whole overlap with the boundary-centered ball. -/
theorem exists_holomorphic_no_boundary_ball_extension {Ω : Set ℂ} (hΩ : IsOpen Ω) :
    ∃ f : ℂ → ℂ, DifferentiableOn ℂ f Ω ∧
      ∀ a ∈ frontier Ω, ∀ r : ℝ, 0 < r →
        ¬ ∃ F : ℂ → ℂ, DifferentiableOn ℂ F (Metric.ball a r) ∧
          EqOn F f (Metric.ball a r ∩ Ω) := by
  sorry

/-- **GH1.** Strong branchwise meromorphic noncontinuation on an arbitrary open set.
The shell-cover zero construction supplies accumulation inside every local branch. -/
theorem exists_holomorphic_no_meromorphic_boundary_germ {Ω : Set ℂ} (hΩ : IsOpen Ω) :
    ∃ f : ℂ → ℂ, DifferentiableOn ℂ f Ω ∧
      ∀ ξ ∈ frontier Ω, ∀ r : ℝ, 0 < r →
        ∀ z ∈ Metric.ball ξ r ∩ Ω,
          ξ ∈ closure (connectedComponentIn (Metric.ball ξ r ∩ Ω) z) →
          ¬ ∃ F : ℂ → ℂ, MeromorphicOn F (Metric.ball ξ r) ∧
            EqOn F f (connectedComponentIn (Metric.ball ξ r ∩ Ω) z) := by
  sorry

end TauCetiRoadmap.GlobalHolomorphicFunctions
