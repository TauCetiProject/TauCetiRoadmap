import Mathlib

/-!
# Sobolev spaces of differential forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here state headline theorems against the pinned Mathlib and Tau Ceti
APIs, so that contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

These headlines are stated in `README.md` alone, with what each one lacks at the pins:

* the Hodge star and the codifferential (§1.2): `Orientation.formHodgeStar`;
* density (§3.3), the adjoints of `d` (§3.4) and the divergence link (§3.6): the Banach space
  `WᵖΛᵏ(Ω)` with its weak `d` and the codifferential;
* pullback (§4.1): `WᵖΛᵏ(Ω)` and Rademacher's derivative of a bi-Lipschitz map;
* traces, Green's formula, the zero-trace characterization and gluing (§5.1–§5.4):
  `Set.IsLipschitzDomainWith` and the tangential trace;
* Gaffney on the cube (§7.1): `HΛᵏ₀(Q)`, `H*Λᵏ(Q)` and the codifferential;
* Picard's compactness and its consequences (§7.3, §7.4): the same spaces on a Lipschitz domain.
-/

noncomputable section

open MeasureTheory TopologicalSpace Filter Topology
open scoped ENNReal Distributions InnerProductSpace

namespace TauCetiRoadmap.SobolevDifferentialForms

/-- The Euclidean space `ℝⁿ` of the roadmap. -/
abbrev E (n : ℕ) := EuclideanSpace ℝ (Fin n)

/-! ### Covectors (§1.1) -/

/-- `k`-covectors on `ℝⁿ`: a type wrapper around Mathlib's continuous alternating maps, in the
shape of Mathlib's `WithLp`, carrying the Hilbert structure transported from `⋀[ℝ]^k (E n)`. -/
@[ext]
structure Covector (n k : ℕ) where
  /-- Wrap an alternating map as a covector. -/
  toCovector ::
  /-- The underlying alternating map. -/
  ofCovector : E n [⋀^Fin k]→L[ℝ] ℝ

namespace Covector

variable {n k : ℕ}

/-- The bijection between a covector type and its underlying alternating maps. -/
def equiv (n k : ℕ) : Covector n k ≃ (E n [⋀^Fin k]→L[ℝ] ℝ) where
  toFun := ofCovector
  invFun := toCovector
  left_inv _ := rfl
  right_inv _ := rfl

instance : AddCommGroup (Covector n k) := (equiv n k).addCommGroup

/-- The additive bijection with the underlying alternating maps. -/
def addEquiv (n k : ℕ) : Covector n k ≃+ (E n [⋀^Fin k]→L[ℝ] ℝ) :=
  { equiv n k with map_add' := fun _ _ => rfl }

instance : Module ℝ (Covector n k) := AddEquiv.module ℝ (addEquiv n k)

/-- The inner product of `ℝⁿ` as a bilinear form is a bijection onto the dual. -/
theorem bijective_innerₗ (n : ℕ) : Function.Bijective (innerₗ (E n)) := by
  have h : Function.Injective (innerₗ (E n)) := fun x y hxy =>
    ext_inner_left ℝ fun z => by
      simpa [real_inner_comm] using congrArg (fun f : E n →ₗ[ℝ] ℝ => f z) hxy
  refine ⟨h, ?_⟩
  exact (LinearMap.injective_iff_surjective_of_finrank_eq_finrank (by simp)).mp h

/-- The musical map of §1.1 into Mathlib's inner product space `⋀[ℝ]^k (E n)`: a covector is a
functional on `⋀[ℝ]^k (E n)` by `exteriorPower.alternatingMapLinearEquiv`, turned into a
multivector by the bijection `(innerₗ (E n)).exteriorPower k`. -/
def toExteriorPower (n k : ℕ) : Covector n k →ₗ[ℝ] ⋀[ℝ]^k (E n) :=
  (LinearEquiv.ofBijective (LinearMap.BilinForm.exteriorPower (innerₗ (E n)) k)
      (LinearMap.BilinForm.bijective_exteriorPower _ k (bijective_innerₗ n))).symm.toLinearMap ∘ₗ
    exteriorPower.alternatingMapLinearEquiv.toLinearMap ∘ₗ
      { toFun := fun α => α.ofCovector.toAlternatingMap
        map_add' := fun _ _ => rfl
        map_smul' := fun _ _ => rfl }

/-- The musical map is injective, so the Gram norm is a norm. -/
theorem injective_toExteriorPower (n k : ℕ) : Function.Injective (toExteriorPower n k) := by
  intro α β h
  simp only [toExteriorPower, LinearMap.comp_apply, LinearEquiv.coe_coe] at h
  have h' := exteriorPower.alternatingMapLinearEquiv.injective ((LinearEquiv.injective _) h)
  exact Covector.ext (ContinuousAlternatingMap.toAlternatingMap_injective h')

/-- The Gram norm, induced by the musical map. -/
instance : NormedAddCommGroup (Covector n k) :=
  NormedAddCommGroup.induced _ _ (toExteriorPower n k) (injective_toExteriorPower n k)

instance : NormedSpace ℝ (Covector n k) := NormedSpace.induced ℝ _ _ (toExteriorPower n k)

/-- The Gram inner product, induced by the musical map. -/
instance : InnerProductSpace ℝ (Covector n k) where
  inner α β := ⟪toExteriorPower n k α, toExteriorPower n k β⟫_ℝ
  norm_sq_eq_re_inner α := norm_sq_eq_re_inner (𝕜 := ℝ) (toExteriorPower n k α)
  conj_inner_symm α β := inner_conj_symm (𝕜 := ℝ) (toExteriorPower n k α) (toExteriorPower n k β)
  add_left α β γ := by simp [inner_add_left]
  smul_left α β c := by
    simpa using real_inner_smul_left (toExteriorPower n k α) (toExteriorPower n k β) c

instance : FiniteDimensional ℝ (Covector n k) :=
  FiniteDimensional.of_injective (toExteriorPower n k) (injective_toExteriorPower n k)

end Covector

open Covector

/-! ### The weak exterior derivative (§2.1, §2.2) -/

/-- `u` has weak exterior derivative `w` on `Ω` (§2.1). -/
def HasWeakExtDerivOn {n k : ℕ} (Ω : Opens (E n)) (u : E n → Covector n k)
    (w : E n → Covector n (k + 1)) : Prop :=
  LocallyIntegrableOn u Ω ∧ LocallyIntegrableOn w Ω ∧
    ∀ (ψ : 𝓓(Ω, ℝ)) (v : Fin (k + 1) → E n),
      ∫ x, (ψ : E n → ℝ) x * (w x).ofCovector v =
        -∑ j : Fin (k + 1), (-1 : ℝ) ^ (j : ℕ) *
          ∫ x, (u x).ofCovector (Fin.removeNth j v) * fderiv ℝ (ψ : E n → ℝ) x (v j)

/-- `d ∘ d = 0` (§2.2). -/
theorem HasWeakExtDerivOn.ae_eq_zero {n k : ℕ} {Ω : Opens (E n)} {u : E n → Covector n k}
    {w : E n → Covector n (k + 1)} {z : E n → Covector n (k + 2)}
    (hu : HasWeakExtDerivOn Ω u w) (hw : HasWeakExtDerivOn Ω w z) :
    z =ᵐ[volume.restrict (Ω : Set (E n))] 0 := sorry

/-! ### Abstract Hilbert complexes (§6.1) -/

section HilbertComplex

variable {W₀ W₁ W₂ : Type*}
  [NormedAddCommGroup W₀] [InnerProductSpace ℝ W₀] [CompleteSpace W₀]
  [NormedAddCommGroup W₁] [InnerProductSpace ℝ W₁] [CompleteSpace W₁]
  [NormedAddCommGroup W₂] [InnerProductSpace ℝ W₂] [CompleteSpace W₂]

/-- The kernel of an unbounded operator, as a subspace of the ambient space. -/
def kerPMap {V V' : Type*} [AddCommGroup V] [Module ℝ V] [AddCommGroup V'] [Module ℝ V']
    (T : V →ₗ.[ℝ] V') : Submodule ℝ V :=
  (LinearMap.ker T.toFun).map T.domain.subtype

/-- The range of an unbounded operator. -/
def rangePMap {V V' : Type*} [AddCommGroup V] [Module ℝ V] [AddCommGroup V'] [Module ℝ V']
    (T : V →ₗ.[ℝ] V') : Submodule ℝ V' :=
  LinearMap.range T.toFun

/-- The harmonic space `ker d₁ ∩ ker d₀*` of a pair of composable operators (§6.1). -/
def harmonic (d₀ : W₀ →ₗ.[ℝ] W₁) (d₁ : W₁ →ₗ.[ℝ] W₂) : Submodule ℝ W₁ :=
  kerPMap d₁ ⊓ kerPMap (LinearPMap.adjoint d₀)

/-- The compactness property with weight `ε` (§6.1): sequences bounded in the graph norm of
`u ↦ (u, d₁ u, d₀* (ε u))` have convergent subsequences in `W₁`. -/
def CompactProperty (d₀ : W₀ →ₗ.[ℝ] W₁) (d₁ : W₁ →ₗ.[ℝ] W₂) (ε : W₁ →L[ℝ] W₁) : Prop :=
  ∀ (u : ℕ → W₁) (hu : ∀ i, u i ∈ d₁.domain)
    (hε : ∀ i, ε (u i) ∈ (LinearPMap.adjoint d₀).domain),
    (∀ i, ‖u i‖ ≤ 1 ∧ ‖d₁ ⟨u i, hu i⟩‖ ≤ 1 ∧ ‖LinearPMap.adjoint d₀ ⟨ε (u i), hε i⟩‖ ≤ 1) →
      ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ a, Tendsto (u ∘ φ) atTop (𝓝 a)

variable {d₀ : W₀ →ₗ.[ℝ] W₁} {d₁ : W₁ →ₗ.[ℝ] W₂}

/-- **Hodge decomposition** (§6.1). -/
theorem hodge_decomposition (hd₀ : d₀.IsClosed) (hd₁ : d₁.IsClosed)
    (hd₀' : Dense (d₀.domain : Set W₀)) (hd₁' : Dense (d₁.domain : Set W₁))
    (hcomplex : rangePMap d₀ ≤ kerPMap d₁) :
    (rangePMap d₀).topologicalClosure ⊔ harmonic d₀ d₁ ⊔
        (rangePMap (LinearPMap.adjoint d₁)).topologicalClosure = ⊤ ∧
      (rangePMap d₀).topologicalClosure ⟂ harmonic d₀ d₁ ∧
      harmonic d₀ d₁ ⟂ (rangePMap (LinearPMap.adjoint d₁)).topologicalClosure ∧
      (rangePMap d₀).topologicalClosure ⟂
        (rangePMap (LinearPMap.adjoint d₁)).topologicalClosure := sorry

/-- **Closed range is the Poincaré inequality** (§6.1). -/
theorem isClosed_range_iff_poincare (hd₁ : d₁.IsClosed) :
    IsClosed (rangePMap d₁ : Set W₂) ↔
      ∃ c : ℝ, ∀ u : d₁.domain, (u : W₁) ∈ (kerPMap d₁)ᗮ → ‖(u : W₁)‖ ≤ c * ‖d₁ u‖ := sorry

/-- **The compactness property gives closed ranges and finite-dimensional harmonic spaces**
(§6.1). -/
theorem CompactProperty.isClosed_range (hd₀ : d₀.IsClosed) (hd₁ : d₁.IsClosed)
    (hd₀' : Dense (d₀.domain : Set W₀)) (hd₁' : Dense (d₁.domain : Set W₁))
    (hcomplex : rangePMap d₀ ≤ kerPMap d₁)
    (h : CompactProperty d₀ d₁ (ContinuousLinearMap.id ℝ W₁)) :
    IsClosed (rangePMap d₀ : Set W₁) ∧ IsClosed (rangePMap d₁ : Set W₂) ∧
      FiniteDimensional ℝ (harmonic d₀ d₁) := sorry

/-- **Independence of the weight** (§6.1): for a bounded, self-adjoint, uniformly positive `ε`. -/
theorem compactProperty_iff_weight (hd₀ : d₀.IsClosed) (hd₁ : d₁.IsClosed)
    (hd₀' : Dense (d₀.domain : Set W₀)) (hcomplex : rangePMap d₀ ≤ kerPMap d₁)
    {ε : W₁ →L[ℝ] W₁} (hsymm : ∀ x y, ⟪ε x, y⟫_ℝ = ⟪x, ε y⟫_ℝ) {c : ℝ} (hc : 0 < c)
    (hpos : ∀ x, c * ‖x‖ ^ 2 ≤ ⟪ε x, x⟫_ℝ) :
    CompactProperty d₀ d₁ (ContinuousLinearMap.id ℝ W₁) ↔ CompactProperty d₀ d₁ ε := sorry

end HilbertComplex

end TauCetiRoadmap.SobolevDifferentialForms
