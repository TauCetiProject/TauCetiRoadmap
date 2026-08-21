/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCetiRoadmap.OperatorTheory.OrthogonalGeometry.Suggested

/-!
# Spectral theory of self-adjoint operators: target signatures

**`README.md` is the definitive and exhaustive roadmap specification.** This file gives
suggested Lean forms for selected labeled obligations. The roadmap is complete when the
obligations in `README.md` are complete. `sorry` records target signatures in this human-owned
roadmap library.


The representation decision runs through every signature: an unbounded operator is a Mathlib
`LinearPMap` (`H →ₗ.[𝕜] H`), and closedness, dense domain and self-adjointness are hypotheses
on it rather than fields of a parallel operator type.
-/

/-! ## Scalar-generic `TauCeti.LinearPMap` resolvent target API

`SA-D01` is an in-place scalar generalization of Tau Ceti's existing real resolvent core.
These declarations intentionally use their eventual upstream names: an implementation should
generalize the existing `TauCeti.LinearPMap` declarations, not add a parallel resolvent API.
Specializing `𝕜 := ℝ` must preserve the existing public API and existing callers.  The
`lambda • I - A` convention is unchanged.
-/

namespace TauCeti

variable {𝕜 : Type*} [NontriviallyNormedField 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E]

namespace LinearPMap

variable {A : E →ₗ.[𝕜] E} {lambda mu : 𝕜} {R : E →L[𝕜] E}

/-- A bounded two-sided inverse of `lambda • I - A`, with range in `dom A`.

Roadmap: `SA-D01`. -/
structure IsResolventAt (A : E →ₗ.[𝕜] E) (lambda : 𝕜) (R : E →L[𝕜] E) : Prop where
  mem_domain (y : E) : R y ∈ A.domain
  smul_sub_apply (y : E) : lambda • R y - A ⟨R y, mem_domain y⟩ = y
  apply_smul_sub (x : A.domain) : R (lambda • (x : E) - A x) = (x : E)

/-- Roadmap: `SA-D04`. -/
theorem IsResolventAt.unique (h : IsResolventAt A lambda R) {R' : E →L[𝕜] E}
    (h' : IsResolventAt A lambda R') : R = R' := sorry

/-- Roadmap: `SA-D01`. -/
theorem IsResolventAt.smul_sub_injective (h : IsResolventAt A lambda R) :
    Function.Injective fun x : A.domain => lambda • (x : E) - A x := sorry

/-- Roadmap: `SA-D01`. -/
theorem IsResolventAt.smul_sub_surjective (h : IsResolventAt A lambda R) :
    Function.Surjective fun x : A.domain => lambda • (x : E) - A x := sorry

/-- Roadmap: `SA-D01`. -/
theorem IsResolventAt.smul_sub_bijective (h : IsResolventAt A lambda R) :
    Function.Bijective fun x : A.domain => lambda • (x : E) - A x := sorry

/-- The resolvent set of a partial operator.

Roadmap: `SA-D01`. -/
def resolventSet (A : E →ₗ.[𝕜] E) : Set 𝕜 :=
  {lambda | ∃ R : E →L[𝕜] E, IsResolventAt A lambda R}

/-- Roadmap: `SA-D01`. -/
theorem mem_resolventSet_iff :
    lambda ∈ resolventSet A ↔ ∃ R : E →L[𝕜] E, IsResolventAt A lambda R :=
  Iff.rfl

/-- Roadmap: `SA-D01`. -/
theorem IsResolventAt.mem_resolventSet (h : IsResolventAt A lambda R) :
    lambda ∈ resolventSet A :=
  ⟨R, h⟩

private theorem exists_isResolventAt_of_mem (A : E →ₗ.[𝕜] E) (lambda : 𝕜) :
    ∃ R : E →L[𝕜] E, lambda ∈ resolventSet A → IsResolventAt A lambda R := by
  by_cases h : lambda ∈ resolventSet A
  · exact ⟨h.choose, fun _ => h.choose_spec⟩
  · exact ⟨0, fun h' => absurd h' h⟩

/-- The total named resolvent `R(lambda, A) = (lambda • I - A)⁻¹`; its value away from the
resolvent set is immaterial.

Spec: D4.

Roadmap: `SA-D03`. -/
noncomputable def resolvent (A : E →ₗ.[𝕜] E) (lambda : 𝕜) : E →L[𝕜] E :=
  (exists_isResolventAt_of_mem A lambda).choose

/-- Roadmap: `SA-D03`. -/
theorem isResolventAt_resolvent (h : lambda ∈ resolventSet A) :
    IsResolventAt A lambda (resolvent A lambda) := sorry

/-- Roadmap: `SA-D04`. -/
theorem resolvent_eq_of_isResolventAt (h : IsResolventAt A lambda R) :
    resolvent A lambda = R := sorry

/-- Roadmap: `SA-D06`. -/
theorem resolvent_mem_domain (h : lambda ∈ resolventSet A) (y : E) :
    resolvent A lambda y ∈ A.domain := sorry

/-- Roadmap: `SA-D07`. -/
@[simp] theorem smul_sub_apply_resolvent (h : lambda ∈ resolventSet A) (y : E) :
    lambda • resolvent A lambda y -
      A ⟨resolvent A lambda y, resolvent_mem_domain h y⟩ = y := sorry

/-- Roadmap: `SA-D05`. -/
@[simp] theorem resolvent_smul_sub_apply (h : lambda ∈ resolventSet A) (x : A.domain) :
    resolvent A lambda (lambda • (x : E) - A x) = (x : E) := sorry

/-- Roadmap: `SA-D07`. -/
theorem apply_resolvent (h : lambda ∈ resolventSet A) (y : E) :
    A ⟨resolvent A lambda y, resolvent_mem_domain h y⟩ =
      lambda • resolvent A lambda y - y := sorry

/-- Roadmap: `SA-D01`. -/
theorem smul_sub_bijective (h : lambda ∈ resolventSet A) :
    Function.Bijective fun x : A.domain => lambda • (x : E) - A x := sorry

/-- No proper extension can share a resolvent point.  This existing Tau Ceti maximality result
is part of the scalar generalization, not a new self-adjoint-only theorem.

Roadmap: `SA-D01`. -/
theorem eq_of_le_of_mem_resolventSet {A B : E →ₗ.[𝕜] E} (hAB : A ≤ B)
    (hA : lambda ∈ resolventSet A) (hB : lambda ∈ resolventSet B) : A = B := sorry

/-- Roadmap: `SA-D01`. -/
theorem resolvent_apply_comm (h : lambda ∈ resolventSet A) (x : A.domain) :
    resolvent A lambda (A x) =
      A ⟨resolvent A lambda (x : E), resolvent_mem_domain h (x : E)⟩ := sorry

/-- Pointwise first resolvent identity in the canonical `lambda • I - A` convention.

Roadmap: `SA-D08`. -/
theorem resolvent_sub_resolvent_apply (hl : lambda ∈ resolventSet A)
    (hm : mu ∈ resolventSet A) (y : E) :
    resolvent A lambda y - resolvent A mu y
      = (mu - lambda) • resolvent A lambda (resolvent A mu y) := sorry

/-- First resolvent identity in the canonical `lambda • I - A` convention.

Roadmap: `SA-D08`. -/
theorem resolvent_sub_resolvent (hl : lambda ∈ resolventSet A) (hm : mu ∈ resolventSet A) :
    resolvent A lambda - resolvent A mu
      = (mu - lambda) • (resolvent A lambda ∘L resolvent A mu) := sorry

/-- Roadmap: `SA-D09`. -/
theorem resolvent_comm (hl : lambda ∈ resolventSet A) (hm : mu ∈ resolventSet A) :
    resolvent A lambda ∘L resolvent A mu =
      resolvent A mu ∘L resolvent A lambda := sorry

section CompleteSpace

variable [CompleteSpace E]

/-- The scalar-generic Neumann perturbation uses the field norm; at `𝕜 := ℝ` this specializes
back to the existing absolute-value hypothesis via `Real.norm_eq_abs`.

Roadmap: `SA-D11`. -/
theorem mem_resolventSet_of_norm_mul_lt_one (h : lambda ∈ resolventSet A)
    (hmu : ‖mu - lambda‖ * ‖resolvent A lambda‖ < 1) :
    mu ∈ resolventSet A := sorry

/-- Roadmap: `SA-D11`. -/
theorem isOpen_resolventSet (A : E →ₗ.[𝕜] E) : IsOpen (resolventSet A) := sorry

end CompleteSpace

section Bounded

variable {T : E →L[𝕜] E}

/-- Roadmap: `SA-D37`. -/
theorem isUnit_of_isResolventAt_toPMap_top
    (h : IsResolventAt ((T : E →ₗ[𝕜] E).toPMap ⊤) lambda R) :
    IsUnit (algebraMap 𝕜 (E →L[𝕜] E) lambda - T) := sorry

/-- Roadmap: `SA-D37`. -/
theorem isResolventAt_toPMap_top_of_isUnit
    (h : IsUnit (algebraMap 𝕜 (E →L[𝕜] E) lambda - T)) :
    IsResolventAt ((T : E →ₗ[𝕜] E).toPMap ⊤) lambda
      ((h.unit⁻¹ : (E →L[𝕜] E)ˣ) : E →L[𝕜] E) := sorry

/-- Roadmap: `SA-D37`. -/
theorem mem_resolventSet_toPMap_top_iff (T : E →L[𝕜] E) (lambda : 𝕜) :
    lambda ∈ resolventSet ((T : E →ₗ[𝕜] E).toPMap ⊤) ↔
      lambda ∈ _root_.resolventSet 𝕜 T := sorry

/-- Roadmap: `SA-D38`. -/
theorem resolvent_toPMap_top (T : E →L[𝕜] E) {lambda : 𝕜}
    (h : lambda ∈ _root_.resolventSet 𝕜 T) :
    resolvent ((T : E →ₗ[𝕜] E).toPMap ⊤) lambda = _root_.resolvent T lambda := sorry

end Bounded

end LinearPMap

end TauCeti

namespace TauCetiRoadmap.SelfAdjointSpectralTheory

open scoped InnerProductSpace ENNReal

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-! ## Part A -- one-parameter unitary groups and Stone's theorem -/

/-- A strongly continuous one-parameter unitary group on a complex Hilbert
space.

Roadmap: `SA-A01`. -/
structure OneParameterUnitaryGroup (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] where
  U : ℝ → (H →L[ℂ] H)
  unitary : ∀ (t : ℝ) (ψ φ : H), ⟪U t ψ, U t φ⟫_ℂ = ⟪ψ, φ⟫_ℂ
  group_law : ∀ s t : ℝ, U (s + t) = (U s).comp (U t)
  identity : U 0 = ContinuousLinearMap.id ℂ H
  strong_continuous : ∀ ψ : H, Continuous fun t : ℝ => U t ψ

/-- The generator: a `LinearPMap` defined on exactly the vectors where the
difference quotient converges.

Spec: D1.

Roadmap: `SA-A02`. -/
noncomputable def generator (U : OneParameterUnitaryGroup H) : H →ₗ.[ℂ] H := sorry

/-- **Stone's theorem, forward direction**: the generator is self-adjoint, with
density of the domain derived rather than assumed.

Roadmap: `SA-A22`. -/
theorem isSelfAdjoint_generator (U : OneParameterUnitaryGroup H) :
    IsSelfAdjoint (generator U) := sorry

/-- **The commutant preserves the generator**: an operator commuting with every
`U t` maps the generator's domain into itself and commutes with the generator
there.

The two conclusions are packaged as a
dependent pair because the second cannot be stated without the first.

Roadmap: `SA-A13–SA-A14`. -/
theorem generator_commute (U : OneParameterUnitaryGroup H) (T : H →L[ℂ] H)
    (hT : ∀ t : ℝ, ∀ y : H, T (U.U t y) = U.U t (T y))
    (x : (generator U).domain) :
    ∃ hmem : T (x : H) ∈ (generator U).domain,
      generator U ⟨T (x : H), hmem⟩ = T (generator U x) := sorry

/-! ## Part B -- the Borel functional calculus and projection-valued measures -/

section BorelCalculus

variable {a : H →L[ℂ] H}

/-- A bounded Borel function.  This is a genuine source algebra for the Borel calculus,
not a raw function plus repeated side hypotheses.

Roadmap: `SA-B01`. -/
structure BoundedBorelFunction (X : Type*) [MeasurableSpace X] where
  toFun : X → ℂ
  measurable_toFun : Measurable toFun
  exists_bound : ∃ M : ℝ, 0 ≤ M ∧ ∀ x, ‖toFun x‖ ≤ M

/-- Function coercion for bounded Borel symbols.

Roadmap: `SA-B01`. -/
instance {X : Type*} [MeasurableSpace X] : CoeFun (BoundedBorelFunction X) (fun _ => X → ℂ) :=
  ⟨BoundedBorelFunction.toFun⟩

/-- Pointwise commutative-ring structure for bounded Borel symbols.

Roadmap: `SA-B01`. -/
noncomputable instance {X : Type*} [MeasurableSpace X] : CommRing (BoundedBorelFunction X) := by
  sorry
/-- Pointwise star operation for bounded Borel symbols.

Roadmap: `SA-B01`. -/
noncomputable instance {X : Type*} [MeasurableSpace X] : Star (BoundedBorelFunction X) := by
  sorry
/-- Star-ring structure for bounded Borel symbols.

Roadmap: `SA-B01`. -/
noncomputable instance {X : Type*} [MeasurableSpace X] : StarRing (BoundedBorelFunction X) := by
  sorry
/-- Complex algebra structure for bounded Borel symbols.

Roadmap: `SA-B01`. -/
noncomputable instance {X : Type*} [MeasurableSpace X] : Algebra ℂ (BoundedBorelFunction X) := by
  sorry
/-- Star-module structure for bounded Borel symbols.

Roadmap: `SA-B01`. -/
noncomputable instance {X : Type*} [MeasurableSpace X] :
    StarModule ℂ (BoundedBorelFunction X) := by
  sorry

/-- Extensionality of bounded Borel symbols by pointwise equality.

Roadmap: `SA-B01`. -/
@[ext] theorem BoundedBorelFunction.ext {X : Type*} [MeasurableSpace X]
    {f g : BoundedBorelFunction X} (h : ∀ x, f x = g x) : f = g := by
  sorry

/-- **The bounded Borel functional calculus** as the homomorphism it mathematically is.
Agreement with `cfcHom` on continuous symbols and the norm/spectral-support theorems are API
lemmas about this map rather than separate algebraic laws.

Roadmap: `SA-B05`. -/
noncomputable def borelCalculus (ha : IsStarNormal a) :
    BoundedBorelFunction (spectrum ℂ a) →⋆ₐ[ℂ] (H →L[ℂ] H) := by
  sorry

/-- A projection-valued measure on a measurable parameter space, specified intrinsically
by its orthogonal projections and strong countable additivity. Scalar diagonal measures are
derived from this structure.

Roadmap: `SA-B14`. -/
structure ProjValMeasure (X : Type*) [MeasurableSpace X] (H : Type*)
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] where
  proj : ∀ B : Set X, MeasurableSet B → (H →L[ℂ] H)
  proj_empty : proj ∅ MeasurableSet.empty = 0
  proj_univ : proj Set.univ MeasurableSet.univ = ContinuousLinearMap.id ℂ H
  proj_selfAdjoint : ∀ (B : Set X) (hB : MeasurableSet B), IsSelfAdjoint (proj B hB)
  proj_inter : ∀ (B₁ B₂ : Set X) (hB₁ : MeasurableSet B₁) (hB₂ : MeasurableSet B₂),
    proj B₁ hB₁ * proj B₂ hB₂ = proj (B₁ ∩ B₂) (hB₁.inter hB₂)
  strongly_countably_additive :
    ∀ (B : ℕ → Set X) (hB : ∀ n, MeasurableSet (B n))
      (hdisj : Pairwise fun i j => Disjoint (B i) (B j))
      (hUnion : MeasurableSet (⋃ n, B n)) (ξ : H),
      HasSum (fun n => proj (B n) (hB n) ξ) (proj (⋃ n, B n) hUnion ξ)

/-- Reindex a PVM along a measurable map by taking inverse images of measurable sets.

Roadmap: `SA-B25`. -/
noncomputable def ProjValMeasure.map {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    (P : ProjValMeasure X H) (κ : X → Y) (hκ : Measurable κ) : ProjValMeasure Y H := by
  sorry

/-- The scalar measure induced by a PVM and a vector: `μξ(B) = ⟪ξ,P(B)ξ⟫`.

Roadmap: `SA-B21`. -/
noncomputable def ProjValMeasure.diagMeasure {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (ξ : H) : MeasureTheory.Measure X := by
  sorry

/-- The defining diagonal-mass identity for the derived scalar measure.

Roadmap: `SA-B22`. -/
theorem ProjValMeasure.inner_proj {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (B : Set X) (hB : MeasurableSet B) (ξ : H) :
    ⟪ξ, P.proj B hB ξ⟫_ℂ = (((P.diagMeasure ξ) B).toReal : ℂ) := by
  sorry

end BorelCalculus

/-! ## Part C -- closed operators on LinearPMap: graphs, constructions, form bounds -/

section ClosedOperators

variable {𝕜 : Type*} [RCLike 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]

/-- Perturbation of a partial map by an operator on its domain, the domain-aware
sum that keeps the carrier a `LinearPMap`.

Spec: D3.

Roadmap: `SA-C52`. -/
def perturb (A : E →ₗ.[𝕜] E) (V : A.domain →ₗ[𝕜] E) : E →ₗ.[𝕜] E where
  domain := A.domain
  toFun := A.toFun + V

/-- Self-adjointness survives a bounded symmetric perturbation
(Kato--Rellich at relative bound zero).

Roadmap: `SA-C54`. -/
theorem isSelfAdjoint_perturb_bounded {A : E →ₗ.[𝕜] E} (hA : IsSelfAdjoint A)
    {T : E →L[𝕜] E} (hT : IsSelfAdjoint T)
    (V : A.domain →ₗ[𝕜] E) (hV : ∀ x : A.domain, V x = T (x : E)) :
    IsSelfAdjoint (perturb A V) := sorry

/-- A bounded rectangular map sends the domain of `B` into the domain of `A` -- the
side condition without which `A (X x)` is not written down.

Roadmap: `SA-C05`. -/
def MapsDomainTo (A : E →ₗ.[𝕜] E) (B : F →ₗ.[𝕜] F) (X : F →L[𝕜] E) : Prop :=
  ∀ x : B.domain, X (x : F) ∈ A.domain

/-- The rectangular domain-aware Sylvester equation `A X − X B = C` on partial maps.
It is a structure rather than an equation between operators because the left-hand side
does not typecheck without domain transport, which is therefore a field. The square case
is obtained by setting `E = F`.

Roadmap: `SA-C66`. -/
structure SylvesterEquation (A : E →ₗ.[𝕜] E) (B : F →ₗ.[𝕜] F)
    (X C : F →L[𝕜] E) : Prop where
  mapsTo_domain : MapsDomainTo A B X
  equation : ∀ x : B.domain,
    A ⟨X (x : F), mapsTo_domain x⟩ - X (B x) = C (x : F)

/-! ### The form-bound vocabulary

Two predicates and the spectral bridges that produce them. -/

/-- Lower quadratic-form bound on a subspace.

Roadmap: `SA-C76`. -/
def LowerFormBoundOn (A : E →L[𝕜] E) (U : Submodule 𝕜 E) (c : ℝ) : Prop :=
  ∀ x ∈ U, c * ‖x‖ ^ 2 ≤ RCLike.re ⟪A x, x⟫_𝕜

/-- Upper quadratic-form bound on a subspace.

Roadmap: `SA-C77`. -/
def UpperFormBoundOn (A : E →L[𝕜] E) (U : Submodule 𝕜 E) (c : ℝ) : Prop :=
  ∀ x ∈ U, RCLike.re ⟪A x, x⟫_𝕜 ≤ c * ‖x‖ ^ 2

/-! #### Basic theory of the form bounds

The two directions in which a bound weakens, and the identification of the degenerate case
with Mathlib's `ContinuousLinearMap.IsPositive`. -/

/-- A lower form bound weakens as the constant decreases.

Roadmap: `SA-C78`. -/
theorem LowerFormBoundOn.mono_const {A : E →L[𝕜] E} {U : Submodule 𝕜 E} {c c' : ℝ}
    (h : LowerFormBoundOn A U c) (hc : c' ≤ c) : LowerFormBoundOn A U c' := sorry

/-- A lower form bound restricts to a smaller subspace.

Roadmap: `SA-C79`. -/
theorem LowerFormBoundOn.mono_subspace {A : E →L[𝕜] E} {U U' : Submodule 𝕜 E} {c : ℝ}
    (h : LowerFormBoundOn A U c) (hU : U' ≤ U) : LowerFormBoundOn A U' c := sorry

/-- An upper form bound weakens as the constant increases.

Roadmap: `SA-C80`. -/
theorem UpperFormBoundOn.mono_const {A : E →L[𝕜] E} {U : Submodule 𝕜 E} {c c' : ℝ}
    (h : UpperFormBoundOn A U c) (hc : c ≤ c') : UpperFormBoundOn A U c' := sorry

/-- An upper form bound restricts to a smaller subspace.

Roadmap: `SA-C81`. -/
theorem UpperFormBoundOn.mono_subspace {A : E →L[𝕜] E} {U U' : Submodule 𝕜 E} {c : ℝ}
    (h : UpperFormBoundOn A U c) (hU : U' ≤ U) : UpperFormBoundOn A U' c := sorry

/-- **The grounding to Mathlib.**  A positive operator is one with the zero lower form bound
on the whole space, so Mathlib's positivity API reaches anything stated with these.

Roadmap: `SA-C82`. -/
theorem IsPositive.lowerFormBoundOn_top {A : E →L[𝕜] E} (hA : A.IsPositive) :
    LowerFormBoundOn A ⊤ 0 := sorry

/-- The converse, which is what makes `LowerFormBoundOn _ ⊤ 0` a generalization of Mathlib's
predicate.

Roadmap: `SA-C83`. -/
theorem isPositive_of_lowerFormBoundOn_top {A : E →L[𝕜] E} (hsym : A.IsSymmetric)
    (h : LowerFormBoundOn A ⊤ 0) : A.IsPositive := sorry

namespace SpectralOrder.Complex

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]

/-- Restriction-spectrum lower bridge: a spectral half-line for the restriction
is a form bound on the subspace.

Roadmap: `SA-C84`. -/
theorem lowerFormBoundOn_of_restriction_spectrum_subset_Ici
    {A : E →L[ℂ] E} (hA : A.IsSymmetric) {U : Submodule ℂ E}
    [U.HasOrthogonalProjection] (hU : ∀ x ∈ U, A x ∈ U) {c : ℝ}
    (hσ : spectrum ℝ (A.restrict hU) ⊆ Set.Ici c) :
    LowerFormBoundOn A U c := sorry

/-- Restriction-spectrum upper bridge, the mirror image.

Roadmap: `SA-C85`. -/
theorem upperFormBoundOn_of_restriction_spectrum_subset_Iic
    {A : E →L[ℂ] E} (hA : A.IsSymmetric) {U : Submodule ℂ E}
    [U.HasOrthogonalProjection] (hU : ∀ x ∈ U, A x ∈ U) {c : ℝ}
    (hσ : spectrum ℝ (A.restrict hU) ⊆ Set.Iic c) :
    UpperFormBoundOn A U c := sorry

end SpectralOrder.Complex

end ClosedOperators

/-! ## Part D -- resolvents of self-adjoint LinearPMap operators

The scalar-generic `TauCeti.LinearPMap` target API above retains the landed real API's names
and `lambda • I - A` convention. The remaining Part D targets extend its algebraic and
self-adjoint theory. -/

section ResolventDefinitions

variable {𝕜 : Type*} [NontriviallyNormedField 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E]

/-- The spectrum of a partial linear map, defined as the complement of its resolvent set.

Roadmap: `SA-D02`. -/
def spectrum (A : E →ₗ.[𝕜] E) : Set 𝕜 :=
  (TauCeti.LinearPMap.resolventSet A)ᶜ

end ResolventDefinitions


section ComplexResolvent

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]

/-- A self-adjoint partial map has every non-real point in its resolvent set.

Roadmap: `SA-D17`. -/
theorem mem_resolventSet_of_im_ne_zero {A : E →ₗ.[ℂ] E} (hA : IsSelfAdjoint A)
    {z : ℂ} (hz : z.im ≠ 0) : z ∈ TauCeti.LinearPMap.resolventSet A := sorry

/-- The quantitative resolvent bound `‖R z‖ ≤ |Im z|⁻¹`.

Roadmap: `SA-D19`. -/
theorem norm_resolvent_le_of_im_ne_zero {A : E →ₗ.[ℂ] E} (hA : IsSelfAdjoint A)
    {z : ℂ} (hz : z.im ≠ 0) :
    ‖TauCeti.LinearPMap.resolvent A z‖ ≤ |z.im|⁻¹ := sorry

end ComplexResolvent

/-! ## Part E -- the spectral measure of an unbounded self-adjoint operator -/

section SpectralMeasure

variable (A : H →ₗ.[ℂ] H)

/-- **The spectral theorem**: the projection-valued measure of an unbounded
self-adjoint operator, constructed through the Cayley transform.

Spec: D5.

Roadmap: `SA-E01`. -/
noncomputable def spectralPVM (hA : IsSelfAdjoint A) : ProjValMeasure ℝ H := sorry

/-- The resolvent formula: the diagonal matrix elements of the resolvent are
Cauchy--Stieltjes transforms of the diagonal spectral measures.

Roadmap: `SA-E05`. -/
theorem spectralPVM_resolvent_formula (hA : IsSelfAdjoint A) {z : ℂ}
    (hz : z.im ≠ 0) (ξ : H) :
    ⟪ξ, TauCeti.LinearPMap.resolvent A z ξ⟫_ℂ
      = ∫ s, (z - (s : ℂ))⁻¹ ∂((spectralPVM A hA).diagMeasure ξ) := sorry

/-- The unitary group generated by a self-adjoint operator, `t ↦ e^{itA}`.

Spec: D6.

Roadmap: `SA-E26`. -/
noncomputable def genToGroup (hA : IsSelfAdjoint A) : OneParameterUnitaryGroup H := sorry

/-- **Stone's theorem, uniqueness half**: the generator of the generated group
is the operator, closing the loop with Part A.

Roadmap: `SA-E29`. -/
theorem generator_genToGroup (hA : IsSelfAdjoint A) :
    generator (genToGroup A hA) = A := sorry

/-- The **raw** Yosida approximant at the single imaginary shift `i n`. It is bounded and
converges strongly on the domain, and it is **not** self-adjoint: one shift is used, so the
imaginary parts do not cancel.

Indexed by `ℕ+`: at `n = 0` the resolvent argument `i n` is real, so `R(i n)` need not
exist.

Spec: D7.

Roadmap: `SA-E14`. -/
noncomputable def yosidaApproximant (_hA : IsSelfAdjoint A) (n : ℕ+) : H →L[ℂ] H :=
  - (((n : ℂ) ^ 2) • TauCeti.LinearPMap.resolvent A
      (Complex.I * (n : ℂ)))
    - (Complex.I * (n : ℂ)) • ContinuousLinearMap.id ℂ H

/-- The mirrored approximant, at the shift `-i n`.

Roadmap: `SA-E15`. -/
noncomputable def yosidaApproximantNeg (_hA : IsSelfAdjoint A) (n : ℕ+) : H →L[ℂ] H :=
  - (((n : ℂ) ^ 2) • TauCeti.LinearPMap.resolvent A
      (-(Complex.I * (n : ℂ))))
    + (Complex.I * (n : ℂ)) • ContinuousLinearMap.id ℂ H

/-- The **symmetrized** Yosida approximant, the average of the two shifts. This is the
self-adjoint one, and the form the unitary exponentials are built from.

Roadmap: `SA-E16`. -/
noncomputable def yosidaApproximantSym (hA : IsSelfAdjoint A) (n : ℕ+) : H →L[ℂ] H :=
  (2 : ℂ)⁻¹ • (yosidaApproximant A hA n + yosidaApproximantNeg A hA n)

/-- Self-adjointness holds for the symmetrized form.

Roadmap: `SA-E21`. -/
theorem isSelfAdjoint_yosidaApproximantSym (hA : IsSelfAdjoint A) (n : ℕ+) :
    IsSelfAdjoint (yosidaApproximantSym A hA n) := sorry

/-- The approximating unitary groups are the exponentials of the symmetrized approximant;
`yosidaApproximant` alone does not generate one.

Roadmap: `SA-E22`. -/
noncomputable def yosidaGroup (hA : IsSelfAdjoint A) (n : ℕ+) :
    OneParameterUnitaryGroup H := sorry

/-- The approximating groups converge strongly to the group `A` generates.

Roadmap: `SA-E27`. -/
theorem tendsto_yosidaGroup (hA : IsSelfAdjoint A) (t : ℝ) (ψ : H) :
    Filter.Tendsto (fun n : ℕ+ => (yosidaGroup A hA n).U t ψ) Filter.atTop
      (nhds ((genToGroup A hA).U t ψ)) := sorry

end SpectralMeasure

end TauCetiRoadmap.SelfAdjointSpectralTheory
