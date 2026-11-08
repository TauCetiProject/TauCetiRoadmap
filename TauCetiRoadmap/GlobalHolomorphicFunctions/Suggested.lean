import Mathlib
import TauCeti.Analysis.Contour.Cycle.Basic

/-!
# Global holomorphic functions of one complex variable: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs: Looman–Menchoff, the sharp
finite-product bound, weighted genus-one products, holomorphic hulls and Runge, compact-open
completeness, divisor and isolated-singularity realization, boundary noncontinuation, full
Weierstrass factorization, Cauchy–Pompeiu on a cycle, global smooth ∂̄ solvability with closed
completion, and Cousin I.

Primary factors, primary products and equal-divisor factorization are AnalyticNumberTheoryPartI
§§0.15–0.15a. That file is not importable here, so the primary factor is written out where the
statements below use it.

The operator ∂̄ is written in real Fréchet coordinates: `2 ∂̄u(z) = u_x(z) + i u_y(z)` with
`u_x = fderiv ℝ u z 1` and `u_y = fderiv ℝ u z I`, the convention of Tau Ceti's conjugate
Wirtinger derivative `conjWirtingerDeriv u z 1` (`TauCeti/Analysis/Complex/Wirtinger/Basic.lean`)
and of its Cauchy–Pompeiu formula (`TauCeti/Analysis/Complex/Pompeiu/Basic.lean`); the statements
below carry the factor 2 on the data side. The compact-support Cauchy transform, its ∂̄ identity
and reconstruction are that library's and are not restated.

Not statable at the pins: the form-level closed completion `d(g dz + f dz̄) = 0` and the exactness
of every smooth complex-valued and real-valued two-form on an open subset of ℂ (README Layer 7.2)
are stated on Tau Ceti's smooth-form carrier (`TauCeti.SmoothForm`, `TauCeti.mextDeriv`,
`TauCeti.SmoothForm.complexDz` and `complexDzBar` of `TauCeti/Geometry/Manifold/DifferentialForm/`),
which the pinned Tau Ceti does not contain; nothing is stated in their place. The scalar
closed-completion equation below is their coefficient form.
-/
namespace TauCetiRoadmap.GlobalHolomorphicFunctions

open Filter Set Topology MeasureTheory
open scoped ContDiff Manifold

/-! ## Layer 0: real-plane calculus -/

/-- **Preparatory Looman–Menchoff.** Continuity and the two everywhere real-direction
complex derivatives satisfying CR imply holomorphicity. No real Fréchet derivative or
continuity/integrability of the coordinate partials is assumed (Gray–Morris, Theorem 3, p. 247). -/
theorem differentiableOn_complex_of_continuous_real_lineDerivatives_cr
    {Ω : Set ℂ} (hΩ : IsOpen Ω) (f : ℂ → ℂ) (hcont : ContinuousOn f Ω)
    (hline : ∀ z ∈ Ω, ∃ fx fy : ℂ,
      HasLineDerivAt ℝ f fx z 1 ∧
      HasLineDerivAt ℝ f fy z Complex.I ∧
      fy = Complex.I * fx) :
    DifferentiableOn ℂ f Ω := by
  sorry

/-! ## Layer 1: locally uniform products -/

-- Supplied by AnalyticNumberTheoryPartI:
-- §0.15 `TauCetiRoadmap.AnalyticNumberTheoryPartI.elementaryFactor` and
-- `TauCetiRoadmap.AnalyticNumberTheoryPartI.exists_entire_primary_product_exact`.

open scoped Classical in
/-- Weighted genus-one specialization. Compact finiteness supplies cofinite escape on the
repeated index; inverse-square summability supplies the compact majorants. Both products
converge to the same normalized entire function, even at zeros. The factor
`(1 - w) * exp w` is AnalyticNumberTheoryPartI's `elementaryFactor 1`, written out. -/
theorem exists_entire_genusOne_product (S : Set ℂ) [Countable S] (m : S → ℕ)
    (hzero : (0 : ℂ) ∉ S)
    (hfinite : ∀ K : Set ℂ, IsCompact K → (S ∩ K).Finite)
    (hsum : Summable (fun ρ : S => (m ρ : ℝ) / ‖(ρ : ℂ)‖ ^ 2)) :
    ∃ F : ℂ → ℂ,
      HasProdLocallyUniformlyOn
        (fun (ρ : S) z => ((1 - z / (ρ : ℂ)) * Complex.exp (z / (ρ : ℂ))) ^ m ρ) F Set.univ ∧
      HasProdLocallyUniformlyOn
        (fun (i : Σ ρ : S, Fin (m ρ)) z => (1 - z / (i.1 : ℂ)) * Complex.exp (z / (i.1 : ℂ)))
        F Set.univ ∧
      Differentiable ℂ F ∧ F 0 = 1 ∧
      ∀ z, analyticOrderAt F z = (if hz : z ∈ S then (m ⟨z, hz⟩ : ℕ∞) else 0) ∧
        MeromorphicOn.divisor F Set.univ z =
          (if hz : z ∈ S then (m ⟨z, hz⟩ : ℤ) else 0) := by
  sorry

/-- Native-divisor input form of the genus-one product. Its locally finite support supplies
the countability and compact-finiteness hypotheses of the support-indexed target. The factor
`(1 - w) * exp w` is AnalyticNumberTheoryPartI's `elementaryFactor 1`, written out. -/
theorem exists_entire_genusOne_product_of_divisor
    (D : Function.locallyFinsuppWithin (Set.univ : Set ℂ) ℤ)
    (hD : ∀ z, 0 ≤ D z) (hDzero : D 0 = 0)
    (hsum : Summable (fun ρ : Function.support D => (D (ρ : ℂ) : ℝ) / ‖(ρ : ℂ)‖ ^ 2)) :
    ∃ F : ℂ → ℂ,
      HasProdLocallyUniformlyOn
        (fun (ρ : Function.support D) z =>
          ((1 - z / (ρ : ℂ)) * Complex.exp (z / (ρ : ℂ))) ^ (D (ρ : ℂ)).toNat) F Set.univ ∧
      Differentiable ℂ F ∧ F 0 = 1 ∧ MeromorphicOn.divisor F Set.univ = D := by
  sorry

/-- **Sharp finite-product majorant.** For every finite family of complex numbers,
`‖∏ (1 + uᵢ) − 1‖ ≤ ∏ (1 + ‖uᵢ‖) − 1`, by induction on the index set with no factor divided
out. Mathlib's `Finset.norm_prod_one_add_sub_one_le` bounds the left side by
`exp (∑ ‖uᵢ‖) − 1`, which follows from this bound and is strictly weaker: for `u = (1, 1)` both
sides here equal 3 (Rainer, proof of Proposition 14.2, p. 35). -/
theorem norm_prod_one_add_sub_one_le_prod_one_add_norm_sub_one {ι : Type*} (s : Finset ι)
    (u : ι → ℂ) : ‖∏ i ∈ s, (1 + u i) - 1‖ ≤ ∏ i ∈ s, (1 + ‖u i‖) - 1 := by
  sorry

/-! ## Layer 2: plane domains, compact hulls, and Runge approximation -/

/-- A Runge pair: an open `Ω`, a compact `K ⊆ Ω`, and `K` filled in `Ω` (no connected
component of `Ω \ K` is relatively compact in `Ω`, Tau Ceti's `IsFilledIn K Ω`, written out).
Mathlib's connected components are used; all closures are in the ambient plane. -/
def IsRungeCompactPair (Ω K : Set ℂ) : Prop :=
  IsOpen Ω ∧ IsCompact K ∧ K ⊆ Ω ∧
    ∀ z ∈ Ω \ K,
      ¬ (IsCompact (closure (connectedComponentIn (Ω \ K) z)) ∧
        closure (connectedComponentIn (Ω \ K) z) ⊆ Ω)

/-- The holomorphic hull inside Ω: every bound on K for an Ω-holomorphic function
also holds at the given point. Universal real bounds make the hull of the empty set empty. -/
def holomorphicHull (Ω K : Set ℂ) : Set ℂ :=
  {z | z ∈ Ω ∧ ∀ f : ℂ → ℂ, DifferentiableOn ℂ f Ω →
    ∀ B : ℝ, (∀ w ∈ K, ‖f w‖ ≤ B) → ‖f z‖ ≤ B}

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

/-- The hull of a compact subset of an open plane set is compact and fills exactly the
relatively compact complementary components; the inclusion of those components is the
maximum principle, the reverse inclusion uses scalar Runge (Rainer, Lemma 11.3, pp. 27–28). -/
theorem holomorphicHull_eq_fill {Ω K : Set ℂ}
    (hΩ : IsOpen Ω) (hK : IsCompact K) (hKΩ : K ⊆ Ω) :
    IsCompact (holomorphicHull Ω K) ∧
      holomorphicHull Ω K = K ∪ {z | z ∈ Ω \ K ∧
        IsCompact (closure (connectedComponentIn (Ω \ K) z)) ∧
        closure (connectedComponentIn (Ω \ K) z) ⊆ Ω} := by
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

/-- Holomorphic functions on an open complex subtype, using Mathlib's analytic map bundle. -/
abbrev HolomorphicMapSpace (U : TopologicalSpace.Opens ℂ) :=
  ContMDiffMap (modelWithCornersSelf ℂ ℂ) (modelWithCornersSelf ℂ ℂ) U ℂ ω

/-- The underlying continuous map of a native analytic map. -/
noncomputable def HolomorphicMapSpace.toContinuousMap (U : TopologicalSpace.Opens ℂ)
    (f : HolomorphicMapSpace U) : C(U, ℂ) :=
  (f : C(U, ℂ))

namespace HolomorphicMapTopology

noncomputable section

/-- The subtype of an open plane set is locally compact. -/
scoped instance openSubtypeLocallyCompact (U : TopologicalSpace.Opens ℂ) :
    LocallyCompactSpace U := U.isOpen.locallyCompactSpace

/-- The compact-convergence uniformity on holomorphic maps is induced from continuous maps. -/
scoped instance compactConvergenceUniformity (U : TopologicalSpace.Opens ℂ) :
    UniformSpace (HolomorphicMapSpace U) :=
  UniformSpace.comap (HolomorphicMapSpace.toContinuousMap U) inferInstance

end
end HolomorphicMapTopology

open scoped HolomorphicMapTopology

/-- Holomorphic maps on any open plane set are complete for compact convergence
(Rainer, §11, equation (11.2) and Exercise 19, p. 25). -/
theorem complete_holomorphicMapSpace (U : TopologicalSpace.Opens ℂ) :
    CompleteSpace (HolomorphicMapSpace U) := by
  sorry

/-! ## Layer 3: prescribed zeros and divisor realization -/

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

/-! ## Layer 4: Mittag–Leffler and isolated singularities -/

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

/-- **GH1, GH2 corollary.** Every meromorphic function on an open plane set is a quotient
of two holomorphic functions, interpreted on the codiscrete set where the denominator is
nonzero. -/
theorem exists_holomorphic_quotient {Ω : Set ℂ} (hΩ : IsOpen Ω) {F : ℂ → ℂ} (hF : MeromorphicOn F Ω) :
    ∃ f g : ℂ → ℂ, DifferentiableOn ℂ f Ω ∧ DifferentiableOn ℂ g Ω ∧
      (∀ᶠ z in codiscreteWithin Ω, g z ≠ 0 ∧ F z = f z / g z) := by
  sorry

/-! ## Layer 5: full Weierstrass factorization -/

-- Supplied by AnalyticNumberTheoryPartI:
-- §0.15a `TauCetiRoadmap.AnalyticNumberTheoryPartI.exists_entire_exp_mul_of_divisor_eq`.

/-- Every nonzero entire function is an origin power times an entire exponential times
an unordered locally uniformly convergent primary product over its nonzero zeros, with
native analytic orders as multiplicities (Rainer, Remark 15.4, p. 38). The local `E` is
AnalyticNumberTheoryPartI's `elementaryFactor`, written out. -/
theorem entire_weierstrass_factorization (f : ℂ → ℂ) (hf : Differentiable ℂ f)
    (hne : ∃ z, f z ≠ 0) :
    let E := fun (p : ℕ) (w : ℂ) =>
      (1 - w) * Complex.exp (∑ k ∈ Finset.range p, w ^ (k + 1) / (k + 1))
    ∃ (m : ℕ) (p : {a : ℂ // a ≠ 0 ∧ f a = 0} → ℕ) (P g : ℂ → ℂ),
      analyticOrderAt f 0 = (m : ℕ∞) ∧ Differentiable ℂ P ∧ Differentiable ℂ g ∧
      HasProdLocallyUniformlyOn
        (fun a z => E (p a) (z / a.val) ^ (analyticOrderAt f a.val).toNat)
        P Set.univ ∧
      ∀ z, f z = z ^ m * Complex.exp (g z) * P z := by
  sorry

/-! ## Layer 6: products, approximation, and contour examples -/

open scoped Classical in
/-- Cauchy–Pompeiu for a bounded open region with a native cycle whose trace is its
boundary and whose index is one inside and zero outside. The area term is
`π⁻¹ ∫_Δ ∂̄f(z)/(z − ξ) dA`, written with `2 ∂̄f = f_x + i f_y`. The Jordan-boundary
construction in README.md supplies these hypotheses (Rainer, Proposition 10.1, p. 23). -/
theorem cauchyPompeiu {Ω Δ : Set ℂ} (hΩ : IsOpen Ω) (hΔ : IsOpen Δ)
    (hbounded : Bornology.IsBounded Δ) (hclosure : closure Δ ⊆ Ω)
    (C : TauCeti.Contour.Cycle) (htrace : C.trace = frontier Δ)
    (hindex : ∀ z ∉ C.trace,
      TauCeti.Contour.Cycle.windingNumber z C = if z ∈ Δ then 1 else 0)
    (f : ℂ → ℂ) (hf : ContDiffOn ℝ 1 f Ω) {ξ : ℂ} (hξ : ξ ∈ Δ) :
    f ξ = (2 * (Real.pi : ℂ) * Complex.I)⁻¹ *
        TauCeti.Contour.Cycle.integral (fun z => f z / (z - ξ)) C -
      (2 * (Real.pi : ℂ))⁻¹ *
        ∫ z in Δ, (fderiv ℝ f z 1 + Complex.I * fderiv ℝ f z Complex.I) / (z - ξ) := by
  sorry

/-! ## Layer 7: global smooth ∂̄ solvability and Cousin I -/

/-- **GH5, global smooth `∂̄` solvability.** Every smooth datum `f` on an arbitrary open plane
set has a smooth global solution `u` of `∂̄u = f`, written `u_x + i u_y = 2f`; the construction
is the exhaustion/Runge correction in GH5 (Rainer, Theorem 12.2, p. 31). -/
theorem exists_smooth_conjWirtingerDeriv_eq {Ω : Set ℂ} (hΩ : IsOpen Ω)
    (f : ℂ → ℂ) (hf : ContDiffOn ℝ ∞ f Ω) :
    ∃ u : ℂ → ℂ, ContDiffOn ℝ ∞ u Ω ∧
      ∀ z ∈ Ω, fderiv ℝ u z 1 + Complex.I * fderiv ℝ u z Complex.I = 2 * f z := by
  sorry

/-- **GH5, closed completion.** For every smooth `f` there is a smooth `g` with `∂̄g = ∂_z f`,
written `g_x + i g_y = f_x − i f_y`; this coefficient equation is equivalent to closedness of
`g dz + f dz̄` on the smooth-form carrier of README Layer 7.2. -/
theorem exists_smooth_closed_completion {Ω : Set ℂ} (hΩ : IsOpen Ω)
    (f : ℂ → ℂ) (hf : ContDiffOn ℝ ∞ f Ω) :
    ∃ g : ℂ → ℂ, ContDiffOn ℝ ∞ g Ω ∧
      ∀ z ∈ Ω, fderiv ℝ g z 1 + Complex.I * fderiv ℝ g z Complex.I =
        fderiv ℝ f z 1 - Complex.I * fderiv ℝ f z Complex.I := by
  sorry

/-- Every holomorphic additive cocycle on an arbitrary open cover of an open plane set
is a coboundary. A subordinate locally finite partition of unity supplies the proof;
local finiteness of the given cover is unnecessary (Rainer, Theorem 12.4, p. 32). -/
theorem additive_cousin_I {ι : Type*} {Ω : Set ℂ} (hΩ : IsOpen Ω)
    (U : ι → Set ℂ) (hU : ∀ i, IsOpen (U i)) (hsub : ∀ i, U i ⊆ Ω)
    (hcover : Ω ⊆ ⋃ i, U i) (c : ι → ι → ℂ → ℂ)
    (hc : ∀ i j, DifferentiableOn ℂ (c i j) (U i ∩ U j))
    (hcycle : ∀ i j k z, z ∈ U i ∩ U j ∩ U k →
      c i j z + c j k z + c k i z = 0) :
    ∃ b : ι → ℂ → ℂ, (∀ i, DifferentiableOn ℂ (b i) (U i)) ∧
      ∀ i j z, z ∈ U i ∩ U j → b i z - b j z = c i j z := by
  sorry

end TauCetiRoadmap.GlobalHolomorphicFunctions
