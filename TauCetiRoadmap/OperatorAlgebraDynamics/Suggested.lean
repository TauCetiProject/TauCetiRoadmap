/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.GroupTheory.FreeGroup.Reduce
import Mathlib.Analysis.CStarAlgebra.Hom
import Mathlib.Analysis.CStarAlgebra.Multiplier
import Mathlib.MeasureTheory.Group.ModularCharacter
import Mathlib.Analysis.CStarAlgebra.PositiveLinearFunctional
import Mathlib.Analysis.InnerProductSpace.StarOrder
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import TauCeti.RepresentationTheory.Continuous.Unitary.Basic
import TauCeti.Algebra.MonoidAlgebra.Twisted.Basic
import TauCeti.RepresentationTheory.Continuous.Integrated.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.
Actions use `StarAlgEquiv`; `ContRepresentation` carries bounded operators,
so strong continuity in the group variable remains an explicit hypothesis.
The integrated form below is a vector integral, not a Bochner integral in B(H).
-/

noncomputable section
open MeasureTheory
open scoped ComplexOrder

namespace OperatorAlgebraDynamics

variable {A G H : Type*} [NonUnitalCStarAlgebra A]
  [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- Point-norm continuity of an action gives joint continuity by isometry. -/
theorem continuous_action (α : G →* (A ≃⋆ₐ[ℂ] A))
    (hα : ∀ a, Continuous fun g => α g a) :
    Continuous fun p : G × A => α p.1 p.2 := by
  sorry

/-- The covariance identity is stated using composition of existing operators. -/
def IsCovariant (α : G →* (A ≃⋆ₐ[ℂ] A))
    (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (U : ContRepresentation ℂ G H) : Prop :=
  ∀ g a, (U g).comp (π a) = (π (α g a)).comp (U g)

variable [MeasurableSpace G] [BorelSpace G] [LocallyCompactSpace G] [T2Space G]

/-- The norm estimate does not require covariance, which is used for multiplicativity. -/
theorem exists_integratedOperator (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (U : ContRepresentation ℂ G H) (hU : TauCeti.ContRepresentation.IsUnitary U)
    (hcont : ∀ ξ, Continuous fun g => U g ξ)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) :
    ∃ T : H →L[ℂ] H,
      (∀ ξ, T ξ = ∫ g, π (f g) (U g ξ) ∂μ) ∧ ‖T‖ ≤ ∫ g, ‖f g‖ ∂μ := by
  sorry

/-- A named coefficient integrated operator with its actual vector integral. -/
def integratedOperator (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (U : ContRepresentation ℂ G H) (hU : TauCeti.ContRepresentation.IsUnitary U)
    (hcont : ∀ ξ, Continuous fun g => U g ξ)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) : H →L[ℂ] H :=
  (exists_integratedOperator π U hU hcont μ f hf).choose

theorem integratedOperator_apply (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (U : ContRepresentation ℂ G H) (hU : TauCeti.ContRepresentation.IsUnitary U)
    (hcont : ∀ ξ, Continuous fun g => U g ξ)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) (ξ : H) :
    integratedOperator π U hU hcont μ f hf ξ = ∫ g, π (f g) (U g ξ) ∂μ :=
  (exists_integratedOperator π U hU hcont μ f hf).choose_spec.1 ξ

section Scalar

variable {K : Type*} [AddGroup K] [TopologicalSpace K] [MeasurableSpace K]
  [R1Space K] [BorelSpace K]

/-- The scalar case consumes the existing native L1 integrated operator directly.
For a multiplicative group take K=Additive G and transport the tagging equivalences. -/
def scalarIntegrated (U : ContRepresentation ℂ (Multiplicative K) H)
    (hcont : ∀ ξ, Continuous fun k : K => U (Multiplicative.ofAdd k) ξ)
    (hbdd : ∃ C : ℝ, ∀ k, ‖U k‖ ≤ C)
    (μ : Measure K) [μ.InnerRegularCompactLTTop] :
    (K →₁[μ] ℂ) →L[ℂ] (H →L[ℂ] H) :=
  U.integratedOperatorL1 hcont hbdd μ

omit [CompleteSpace H] in
theorem scalarIntegrated_apply (U : ContRepresentation ℂ (Multiplicative K) H)
    (hcont : ∀ ξ, Continuous fun k : K => U (Multiplicative.ofAdd k) ξ)
    (hbdd : ∃ C : ℝ, ∀ k, ‖U k‖ ≤ C)
    (μ : Measure K) [μ.InnerRegularCompactLTTop] (f : K →₁[μ] ℂ) (ξ : H) :
    scalarIntegrated U hcont hbdd μ f ξ =
      ∫ k, f k • U (Multiplicative.ofAdd k) ξ ∂μ := rfl

end Scalar

section KMS

variable [PartialOrder A] [StarOrderedRing A]

/-- Positive-temperature KMS states with the upper-strip convention.
The norm-one condition is on the existing positive continuous linear functional. -/
def IsKMS (α : Multiplicative ℝ →* (A ≃⋆ₐ[ℂ] A)) (β : ℝ)
    (φ : A →P[ℂ] ℂ) : Prop :=
  0 < β ∧ ‖(φ : A →L[ℂ] ℂ)‖ = 1 ∧ ∀ a b : A,
    ∃ F : ℂ → ℂ,
      ContinuousOn F {z | 0 ≤ z.im ∧ z.im ≤ β} ∧
      DifferentiableOn ℂ F {z | 0 < z.im ∧ z.im < β} ∧
      Bornology.IsBounded (F '' {z | 0 ≤ z.im ∧ z.im ≤ β}) ∧
      (∀ t : ℝ, F t = φ (a * α (Multiplicative.ofAdd t) b)) ∧
      ∀ t : ℝ, F ((t : ℂ) + (β : ℂ) * Complex.I) =
        φ (α (Multiplicative.ofAdd t) b * a)

theorem kms_invariant (α : Multiplicative ℝ →* (A ≃⋆ₐ[ℂ] A))
    (hα : ∀ a, Continuous fun t : ℝ => α (Multiplicative.ofAdd t) a)
    {β : ℝ} {φ : A →P[ℂ] ℂ} (hφ : IsKMS α β φ) (t : ℝ) (a : A) :
    φ (α (Multiplicative.ofAdd t) a) = φ a := by
  sorry

/-- An actual entire continuation of the orbit gives the analytic KMS identity. -/
theorem kms_entire_identity (α : Multiplicative ℝ →* (A ≃⋆ₐ[ℂ] A))
    (hα : ∀ a, Continuous fun t : ℝ => α (Multiplicative.ofAdd t) a)
    {β : ℝ} {φ : A →P[ℂ] ℂ} (hφ : IsKMS α β φ)
    (a b : A) (F : ℂ → A) (hF : Differentiable ℂ F)
    (hreal : ∀ t : ℝ, F t = α (Multiplicative.ofAdd t) b) :
    φ (a * F ((β : ℂ) * Complex.I)) = φ (b * a) := by
  sorry

end KMS
section PowersPartition

/-- The full finite-partition interface for Powers averaging. The basis may
have arbitrary cardinality; a and b are two distinct free generators.
The translates are explicit set images, not an unspecified Powers predicate. -/
theorem exists_powers_partition {ι : Type*} (a b : ι) (hab : a ≠ b)
    (F : Finset (FreeGroup ι)) (hF : ∀ f ∈ F, f ≠ 1)
    (N : ℕ) (hN : 0 < N) :
    ∃ (C D : Set (FreeGroup ι)) (γ : Fin N → FreeGroup ι),
      Disjoint C D ∧ C ∪ D = Set.univ ∧
      (∀ f ∈ F, Disjoint ((fun x : FreeGroup ι => f * x) '' C) C) ∧
      Pairwise (fun i j : Fin N =>
        Disjoint ((fun x : FreeGroup ι => γ i * x) '' D)
          ((fun x : FreeGroup ι => γ j * x) '' D)) := by
  sorry

end PowersPartition

section CentralTwists

open scoped MultiplierAlgebra

/-- The multiplier extension of an action. The whole function is admitted;
no coefficient action is discarded behind a fixed-codomain data admission. -/
def multiplierAction :
    (G →* (A ≃⋆ₐ[ℂ] A)) → G →* (𝓜(ℂ, A) ≃⋆ₐ[ℂ] 𝓜(ℂ, A)) := by
  sorry

theorem multiplierAction_coe (α : G →* (A ≃⋆ₐ[ℂ] A)) (s : G) (a : A) :
    multiplierAction α s (a : 𝓜(ℂ, A)) = (α s a : 𝓜(ℂ, A)) := by
  sorry

/-- Strict continuity is expressed by the native double-centralizer actions.
The cocycle, normalization and centrality fields are explicit equations. -/
structure CentralCocycle (α : G →* (A ≃⋆ₐ[ℂ] A)) where
  value : G → G → unitary (𝓜(ℂ, A))
  central : ∀ s t (m : 𝓜(ℂ, A)), Commute (value s t : 𝓜(ℂ, A)) m
  one_left : ∀ s, value 1 s = 1
  one_right : ∀ s, value s 1 = 1
  cocycle : ∀ r s t,
    multiplierAction α r (value s t : 𝓜(ℂ, A)) * (value r (s * t) : 𝓜(ℂ, A)) =
      (value r s : 𝓜(ℂ, A)) * (value (r * s) t : 𝓜(ℂ, A))
  strict_left : ∀ a : A, Continuous fun q : G × G =>
    (value q.1 q.2 : 𝓜(ℂ, A)).fst a
  strict_right : ∀ a : A, Continuous fun q : G × G =>
    (value q.1 q.2 : 𝓜(ℂ, A)).snd a

/-- C1's nondegenerate representation extension, with its exact dense-span
hypothesis. This admits the whole function of π and its density proof. -/
def extendRepresentation :
    (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) →
    Dense (Submodule.span ℂ {η : H | ∃ a ξ, π a ξ = η} : Set H) →
    𝓜(ℂ, A) →⋆ₐ[ℂ] (H →L[ℂ] H) := by
  sorry

theorem extendRepresentation_coe (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (hπ : Dense (Submodule.span ℂ {η : H | ∃ a ξ, π a ξ = η} : Set H)) (a : A) :
    extendRepresentation π hπ (a : 𝓜(ℂ, A)) = π a := by
  sorry

/-- U is a family of native unitaries, rather than a genuine ContRepresentation. -/
structure CentralCovariantPair (α : G →* (A ≃⋆ₐ[ℂ] A)) (ω : CentralCocycle α) where
  pi : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)
  nondegenerate : Dense (Submodule.span ℂ {η : H | ∃ a ξ, pi a ξ = η} : Set H)
  unitaryMap : G → unitary (H →L[ℂ] H)
  at_one : unitaryMap 1 = 1
  strong_continuous : ∀ ξ : H, Continuous fun s => (unitaryMap s : H →L[ℂ] H) ξ
  covariance : ∀ s a,
    (unitaryMap s : H →L[ℂ] H) * pi a * star (unitaryMap s : H →L[ℂ] H) =
      pi (α s a)
  projective : ∀ s t,
    (unitaryMap s : H →L[ℂ] H) * (unitaryMap t : H →L[ℂ] H) =
      extendRepresentation pi nondegenerate (ω.value s t : 𝓜(ℂ, A)) *
        (unitaryMap (s * t) : H →L[ℂ] H)

/-- The coefficient product is in A, via the right multiplier action. -/
def centralConvolution (α : G →* (A ≃⋆ₐ[ℂ] A)) (ω : CentralCocycle α)
    (μ : Measure G) (f g : G → A) (s : G) : A :=
  ∫ r, (ω.value r (r⁻¹ * s) : 𝓜(ℂ, A)).snd (f r * α r (g (r⁻¹ * s))) ∂μ

/-- The modular factor uses the actual A7 character, with no unimodularity assumption. -/
def centralInvolution (α : G →* (A ≃⋆ₐ[ℂ] A)) (ω : CentralCocycle α)
    (f : G → A) (s : G) : A :=
  (Measure.modularCharacter s : ℝ) •
    (star (ω.value s s⁻¹ : 𝓜(ℂ, A))).fst (α s (star (f s⁻¹)))

/-- The raw central cochain formula; the README specifies normalization,
strict continuity, cocycle closure, and the direction of the completion map. -/
def rephasedValue (α : G →* (A ≃⋆ₐ[ℂ] A)) (ω : CentralCocycle α)
    (b : G → unitary (𝓜(ℂ, A))) (s t : G) : 𝓜(ℂ, A) :=
  (b s : 𝓜(ℂ, A)) * multiplierAction α s (b t : 𝓜(ℂ, A)) *
    (ω.value s t : 𝓜(ℂ, A)) * star (b (s * t) : 𝓜(ℂ, A))

def cochainTransport (b : G → unitary (𝓜(ℂ, A))) (f : G → A) (s : G) : A :=
  (b s : 𝓜(ℂ, A)).snd (f s)

/-- Exact pointwise formula before proving it descends to a unitary on L². -/
def regularTwistedValue (α : G →* (A ≃⋆ₐ[ℂ] A)) (ω : CentralCocycle α)
    (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (hπ : Dense (Submodule.span ℂ {η : H | ∃ a ξ, π a ξ = η} : Set H))
    (s : G) (ξ : G → H) (r : G) : H :=
  extendRepresentation π hπ
    (multiplierAction α r⁻¹ (ω.value s (s⁻¹ * r) : 𝓜(ℂ, A))) (ξ (s⁻¹ * r))

/-- Integration remains vector-valued for a projective unitary family. -/
theorem exists_centralIntegratedOperator (α : G →* (A ≃⋆ₐ[ℂ] A))
    (ω : CentralCocycle α) (P : CentralCovariantPair (H := H) α ω)
    (μ : Measure G) [μ.InnerRegularCompactLTTop]
    (f : G → A) (hf : Integrable f μ) :
    ∃ T : H →L[ℂ] H,
      (∀ ξ, T ξ = ∫ s, P.pi (f s) ((P.unitaryMap s : H →L[ℂ] H) ξ) ∂μ) ∧
        ‖T‖ ≤ ∫ s, ‖f s‖ ∂μ := by
  sorry

omit [TopologicalSpace G] [IsTopologicalGroup G] [MeasurableSpace G]
    [BorelSpace G] [LocallyCompactSpace G] [T2Space G] in
/-- The existing algebraic scalar core already has the required coboundary
orientation. The analytic norm and compatible star remain roadmap targets. -/
theorem scalarCoboundary_of (η θ : G → G → ℂˣ)
    [TauCeti.IsFactorSet η] [TauCeti.IsFactorSet θ] (b : G → ℂˣ)
    (hb : ∀ s t, θ s t * b (s * t) = η s t * (b s * b t)) (s : G) :
    TauCeti.TwistedMonoidAlgebra.equivOfCoboundary η θ b hb
      (TauCeti.TwistedMonoidAlgebra.of s) =
        (b s : ℂ) • (TauCeti.TwistedMonoidAlgebra.of s :
          TauCeti.twistedMonoidAlgebra ℂ G η) :=
  TauCeti.TwistedMonoidAlgebra.equivOfCoboundary_of η θ b hb s

end CentralTwists

end OperatorAlgebraDynamics
