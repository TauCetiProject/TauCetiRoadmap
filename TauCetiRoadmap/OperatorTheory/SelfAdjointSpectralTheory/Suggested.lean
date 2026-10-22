/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded
import TauCeti.Analysis.Semigroups.Basic
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

/-! ## The spectrum of a partial operator

The scalar-generic resolvent core is supplied by Tau Ceti in
`TauCeti.Analysis.Normed.Operator.Resolvent.Unbounded`: `IsResolventAt` and its bijectivity
lemmas, `resolventSet`, `resolvent` with the inverse and domain laws,
`eq_of_le_of_mem_resolventSet`, operator and resolvent commutation, the first resolvent identity,
Neumann perturbation and openness, and the bounded-operator conversions. The algebraic core is
stated over `[NontriviallyNormedField 𝕜]` on normed spaces with the `lambda • I - A`
convention. Neumann perturbation, openness and the local `Ring.inverse` formula additionally
require `[CompleteSpace E]`; resolvent analyticity in the companion `Resolvent.Analytic` module
has the same completeness hypothesis. `SA-D01` consumes these supplied declarations under their
existing hypotheses, and this file imports the core rather than restating it.

What Part D still adds at the level of the core is the spectrum, which Tau Ceti does not define for
a partial operator.
-/

namespace TauCeti

variable {𝕜 : Type*} [NontriviallyNormedField 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace 𝕜 E]

namespace LinearPMap

/-- The spectrum of a partial linear map, defined as the complement of its resolvent set.


Roadmap: `SA-D02`. -/
def spectrum (A : E →ₗ.[𝕜] E) : Set 𝕜 :=
  (LinearPMap.resolventSet A)ᶜ

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

/-- Restriction to nonnegative time on the underlying real Banach space.


Roadmap: `SA-A15`. -/
noncomputable def OneParameterUnitaryGroup.toSemigroup (U : OneParameterUnitaryGroup H) :
    TauCeti.Semigroups.StronglyContinuousSemigroup H where
  toFun t := (U.U (t : ℝ)).restrictScalars ℝ
  map_zero' := by sorry
  map_add' := by sorry
  continuousAt_zero' := by sorry

/-- The semigroup restriction has the same pointwise action as the unitary group.


Roadmap: `SA-A15`. -/
@[simp] theorem OneParameterUnitaryGroup.toSemigroup_apply (U : OneParameterUnitaryGroup H)
    (t : NNReal) (x : H) : U.toSemigroup t x = U.U (t : ℝ) x := rfl

/-- Unitarity gives contractivity of the real semigroup restriction.


Roadmap: `SA-A15`. -/
theorem OneParameterUnitaryGroup.norm_toSemigroup_le (U : OneParameterUnitaryGroup H)
    (t : NNReal) : ‖U.toSemigroup t‖ ≤ 1 := by
  sorry

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

/-- Pullback of bounded measurable symbols.

Roadmap: `SA-B01`. -/
def BoundedBorelFunction.pullback {X Y : Type*}
    [MeasurableSpace X] [MeasurableSpace Y] (κ : X → Y) (hκ : Measurable κ)
    (f : BoundedBorelFunction Y) : BoundedBorelFunction X where
  toFun := f ∘ κ
  measurable_toFun := f.measurable_toFun.comp hκ
  exists_bound := by
    obtain ⟨M, hM, hf⟩ := f.exists_bound
    exact ⟨M, hM, fun x => hf (κ x)⟩

/-- Continuous symbols enter the existing Borel algebra through this map.

Roadmap: `SA-B38`. -/
noncomputable def BoundedBorelFunction.ofContinuousMap {K : Type*}
    [TopologicalSpace K] [CompactSpace K] [MeasurableSpace K]
    [OpensMeasurableSpace K] : C(K, ℂ) →⋆ₐ[ℂ] BoundedBorelFunction K := by
  sorry

/-- Measurable pullback bundles as a homomorphism on the symbol algebra.

Roadmap: `SA-B01`. -/
noncomputable def BoundedBorelFunction.pullbackHom {X Y : Type*}
    [MeasurableSpace X] [MeasurableSpace Y] (κ : X → Y) (hκ : Measurable κ) :
    BoundedBorelFunction Y →⋆ₐ[ℂ] BoundedBorelFunction X := by
  sorry

/-- The bundled map uses the pointwise pullback definition.

Roadmap: `SA-B01`. -/
theorem BoundedBorelFunction.pullbackHom_apply {X Y : Type*}
    [MeasurableSpace X] [MeasurableSpace Y] (κ : X → Y) (hκ : Measurable κ)
    (f : BoundedBorelFunction Y) :
    pullbackHom κ hκ f = pullback κ hκ f := by
  sorry

/-- Scalar density pairing uses measurable functions independently of PVM symbols.


Roadmap: `SA-B82`. -/
theorem integral_withDensityᵥ {𝕜 X : Type*} [RCLike 𝕜] [MeasurableSpace X]
    (ν : MeasureTheory.Measure X) [MeasureTheory.IsFiniteMeasure ν]
    (g : X → 𝕜) (hg : MeasureTheory.Integrable g ν)
    (f : X → 𝕜) (hf : Measurable f) (M : ℝ) (hM : 0 ≤ M)
    (hbound : ∀ x, ‖f x‖ ≤ M) :
    (∫ᵛ x, f x ∂[ContinuousLinearMap.mul ℝ 𝕜; ν.withDensityᵥ g]) =
      ∫ x, f x * g x ∂ν := by
  sorry

/-- Native weighted complex measures satisfy change of density.


Roadmap: `SA-B64`. -/
theorem integral_complexMeasure_withDensity {X : Type*} [MeasurableSpace X]
    (μ : MeasureTheory.ComplexMeasure X) [MeasureTheory.IsFiniteMeasure μ.variation]
    (f g : X → ℂ)
    (hf : Measurable f) (hg : Measurable g)
    (M N : ℝ) (hM : 0 ≤ M) (hN : 0 ≤ N)
    (hfb : ∀ x, ‖f x‖ ≤ M) (hgb : ∀ x, ‖g x‖ ≤ N) :
    (∫ᵛ x, f x ∂[ContinuousLinearMap.mul ℝ ℂ;
      μ.withDensity g (ContinuousLinearMap.mul ℝ ℂ)]) =
      ∫ᵛ x, f x * g x ∂[ContinuousLinearMap.mul ℝ ℂ; μ] := by
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
      (_hdisj : Pairwise fun i j => Disjoint (B i) (B j))
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

/-- Finiteness belongs to the diagonal-measure construction, including H=0.

Roadmap: `SA-B21`. -/
noncomputable instance ProjValMeasure.diagMeasure_finite {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (ξ : H) :
    MeasureTheory.IsFiniteMeasure (P.diagMeasure ξ) := by
  sorry

/-- The defining diagonal-mass identity for the derived scalar measure.


Roadmap: `SA-B22`. -/
theorem ProjValMeasure.inner_proj {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (B : Set X) (hB : MeasurableSet B) (ξ : H) :
    ⟪ξ, P.proj B hB ξ⟫_ℂ = (((P.diagMeasure ξ) B).toReal : ℂ) := by
  sorry

/-- Off-diagonal scalar measures use the native complex-measure carrier.

Roadmap: `SA-B40`. -/
noncomputable def ProjValMeasure.scalarMeasure {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (ξ ψ : H) : MeasureTheory.ComplexMeasure X := by
  sorry

/-- The conjugate-first pairing fixes the scalar polarization convention.

Roadmap: `SA-B41`. -/
theorem ProjValMeasure.scalarMeasure_apply {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (ξ ψ : H) (B : Set X) (hB : MeasurableSet B) :
    P.scalarMeasure ξ ψ B = ⟪ξ, P.proj B hB ψ⟫_ℂ := by
  sorry

/-- The quantitative bound yields the required finite-variation instance.

Roadmap: `SA-B42`. -/
theorem ProjValMeasure.scalarMeasure_variation_le {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (ξ ψ : H) :
    (P.scalarMeasure ξ ψ).variation Set.univ ≤ ENNReal.ofReal (‖ξ‖ * ‖ψ‖) := by
  sorry

/-- The native scalar integral uses the variation measure's finiteness.

Roadmap: `SA-B42`. -/
noncomputable instance ProjValMeasure.scalarMeasure_finite {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (ξ ψ : H) :
    MeasureTheory.IsFiniteMeasure (P.scalarMeasure ξ ψ).variation := by
  sorry

/-- Integration against an arbitrary normalized PVM, on the existing symbol algebra.

Roadmap: `SA-B44`. -/
noncomputable def ProjValMeasure.integral {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) : BoundedBorelFunction X →⋆ₐ[ℂ] (H →L[ℂ] H) := by
  sorry

/-- Operator-norm control uses an explicit uniform bound.

Roadmap: `SA-B47`. -/
theorem ProjValMeasure.norm_integral_le {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (f : BoundedBorelFunction X) (M : ℝ)
    (hM : 0 ≤ M) (hf : ∀ x, ‖f x‖ ≤ M) : ‖P.integral f‖ ≤ M := by
  sorry

/-- The scalar formula uses the native real-bilinear complex multiplication pairing.

Roadmap: `SA-B45`. -/
theorem ProjValMeasure.integral_inner {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (f : BoundedBorelFunction X) (ξ ψ : H) :
    ⟪ξ, P.integral f ψ⟫_ℂ =
      ∫ᵛ x, f x ∂[ContinuousLinearMap.mul ℝ ℂ; P.scalarMeasure ξ ψ] := by
  sorry

/-- The all-vector a.e. filter is the native supremum of diagonal a.e. filters.

Roadmap: `SA-B49`. -/
noncomputable def ProjValMeasure.ae {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) : Filter X :=
  ⨆ ξ : H, MeasureTheory.ae (P.diagMeasure ξ)

/-- The native supremum filter gives the all-diagonal interpretation.

Roadmap: `SA-B49`. -/
theorem ProjValMeasure.eventually_ae_iff {X : Type*} [MeasurableSpace X]
    (P : ProjValMeasure X H) (R : X → Prop) :
    (∀ᶠ x in P.ae, R x) ↔ ∀ ξ : H, ∀ᵐ x ∂P.diagMeasure ξ, R x := by
  exact Filter.mem_iSup

/-- The normalized PVM of a unital compact-space representation.

Roadmap: `SA-B59`. -/
noncomputable def ProjValMeasure.ofRepresentation {K : Type*}
    [TopologicalSpace K] [CompactSpace K] [T2Space K]
    [MeasurableSpace K] [BorelSpace K]
    (π : C(K, ℂ) →⋆ₐ[ℂ] (H →L[ℂ] H)) : ProjValMeasure K H := by
  sorry

/-- The normal Borel calculus specializes the same compact-space representation PVM.

Roadmap: `SA-B05`. -/
noncomputable def borelCalculus (ha : IsStarNormal a) :
    BoundedBorelFunction (spectrum ℂ a) →⋆ₐ[ℂ] (H →L[ℂ] H) :=
  (ProjValMeasure.ofRepresentation (cfcHom ha)).integral

/-- Regularity is the native positive diagonal-measure property.

Roadmap: `SA-B60`. -/
theorem ProjValMeasure.ofRepresentation_regular {K : Type*}
    [TopologicalSpace K] [CompactSpace K] [T2Space K]
    [MeasurableSpace K] [BorelSpace K]
    (π : C(K, ℂ) →⋆ₐ[ℂ] (H →L[ℂ] H)) (ξ : H) :
    ((ProjValMeasure.ofRepresentation π).diagMeasure ξ).Regular := by
  sorry

/-- Recovery pins the defining relation to π on continuous symbols.

Roadmap: `SA-B61`. -/
theorem ProjValMeasure.integral_ofRepresentation {K : Type*}
    [TopologicalSpace K] [CompactSpace K] [T2Space K]
    [MeasurableSpace K] [BorelSpace K]
    (π : C(K, ℂ) →⋆ₐ[ℂ] (H →L[ℂ] H)) (f : C(K, ℂ)) :
    (ProjValMeasure.ofRepresentation π).integral
      (BoundedBorelFunction.ofContinuousMap f) = π f := by
  sorry

/-- Regularity is a hypothesis of uniqueness on compact Hausdorff K.

Roadmap: `SA-B62`. -/
theorem ProjValMeasure.ofRepresentation_unique {K : Type*}
    [TopologicalSpace K] [CompactSpace K] [T2Space K]
    [MeasurableSpace K] [BorelSpace K]
    (π : C(K, ℂ) →⋆ₐ[ℂ] (H →L[ℂ] H)) (P : ProjValMeasure K H)
    (hreg : ∀ ξ : H, (P.diagMeasure ξ).Regular)
    (hrec : ∀ f : C(K, ℂ),
      P.integral (BoundedBorelFunction.ofContinuousMap f) = π f) :
    P = ProjValMeasure.ofRepresentation π := by
  sorry

section SupportedRepresentation
variable {K : Type*} [TopologicalSpace K] [CompactSpace K] [T2Space K]
  [MeasurableSpace K] [BorelSpace K]

/-- The essential Hilbert space is the range of π(1).

Roadmap: `SA-B66`. -/
noncomputable def representationEssentialSpace (π : C(K, ℂ) →⋆ₙₐ[ℂ] (H →L[ℂ] H)) : Submodule ℂ H :=
  (π 1).range

/-- The orthogonal-projection range is complete.

Roadmap: `SA-B66`. -/
instance representationEssentialSpace_complete
    (π : C(K, ℂ) →⋆ₙₐ[ℂ] (H →L[ℂ] H)) :
    CompleteSpace (representationEssentialSpace π) := by
  sorry

/-- Restricting the representation to its support makes it unital.

Roadmap: `SA-B67`. -/
def representationOnEssentialSpace (π : C(K, ℂ) →⋆ₙₐ[ℂ] (H →L[ℂ] H)) :
    C(K, ℂ) →⋆ₐ[ℂ]
      (representationEssentialSpace π →L[ℂ] representationEssentialSpace π) := by
  sorry

/-- Zero extension on the original Hilbert space.

Roadmap: `SA-B67`. -/
noncomputable def representationIntegral (π : C(K, ℂ) →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (f : BoundedBorelFunction K) : H →L[ℂ] H :=
  let J := (representationEssentialSpace π).subtypeL
  J ∘L (ProjValMeasure.ofRepresentation (representationOnEssentialSpace π)).integral f ∘L
    J.adjoint

/-- Recovery for the possibly degenerate representation.

Roadmap: `SA-B67`. -/
theorem representationIntegral_continuous (π : C(K, ℂ) →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (f : C(K, ℂ)) : representationIntegral π
      (BoundedBorelFunction.ofContinuousMap f) = π f := by
  sorry

/-- Commutation with the representation is equivalent to commutation with its PVM.

Roadmap: `SA-B79`. -/
theorem ProjValMeasure.ofRepresentation_commute
    (π : C(K, ℂ) →⋆ₐ[ℂ] (H →L[ℂ] H)) (T : H →L[ℂ] H) :
    (∀ f : C(K, ℂ), Commute T (π f)) ↔
      ∀ B : Set K, ∀ hB : MeasurableSet B,
        Commute T ((ProjValMeasure.ofRepresentation π).proj B hB) := by
  sorry
end SupportedRepresentation

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

The scalar-generic `TauCeti.LinearPMap` target API above uses the supplied scalar-generic API
and `lambda • I - A` convention. Part D consumes the supplied resolvent algebra
and develops its self-adjoint estimates, spectral and explicit-series comparisons. -/

section ComplexResolvent

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]

/-- A self-adjoint partial map has every non-real point in its resolvent set.


Roadmap: `SA-D17`. -/
theorem mem_resolventSet_of_im_ne_zero {A : E →ₗ.[ℂ] E} (hA : IsSelfAdjoint A)
    {z : ℂ} (hz : z.im ≠ 0) : z ∈ LinearPMap.resolventSet A := sorry

/-- The quantitative resolvent bound `‖R z‖ ≤ |Im z|⁻¹`.


Roadmap: `SA-D19`. -/
theorem norm_resolvent_le_of_im_ne_zero {A : E →ₗ.[ℂ] E} (hA : IsSelfAdjoint A)
    {z : ℂ} (hz : z.im ≠ 0) :
    ‖LinearPMap.resolvent A z‖ ≤ |z.im|⁻¹ := sorry

end ComplexResolvent

section RealPointResolvent

variable {𝕜 : Type*} [RCLike 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]

/-- A positive lower bound at a real shift of a self-adjoint partial operator gives a resolvent.


Roadmap: `SA-D22`. -/
theorem mem_resolventSet_and_norm_le_of_lower_bound {A : E →ₗ.[𝕜] E}
    (hA : IsSelfAdjoint A) {z c : ℝ} (hc : 0 < c)
    (hbound : ∀ x : A.domain,
      c * ‖(x : E)‖ ≤ ‖A x - (z : 𝕜) • (x : E)‖) :
    (z : 𝕜) ∈ LinearPMap.resolventSet A ∧
      ‖LinearPMap.resolvent A (z : 𝕜)‖ ≤ c⁻¹ := by
  sorry

end RealPointResolvent

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
    ⟪ξ, LinearPMap.resolvent A z ξ⟫_ℂ
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
  - (((n : ℂ) ^ 2) • LinearPMap.resolvent A
      (Complex.I * (n : ℂ)))
    - (Complex.I * (n : ℂ)) • ContinuousLinearMap.id ℂ H

/-- The mirrored approximant, at the shift `-i n`.


Roadmap: `SA-E15`. -/
noncomputable def yosidaApproximantNeg (_hA : IsSelfAdjoint A) (n : ℕ+) : H →L[ℂ] H :=
  - (((n : ℂ) ^ 2) • LinearPMap.resolvent A
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

section FiniteEuclideanExample

/-- SA-C87: the course's concrete matrix on the Euclidean Hilbert carrier. -/
def courseMatrix : Matrix (Fin 5) (Fin 5) ℂ :=
  !![3, 8, 0, -10, 2; -3, 4, 1, 0, -7; 3, -4, 1, 0, 7;
     3, 4, 0, 15, -3; 3, -4, 0, -5, -13]

noncomputable def courseMatrixOperator :
    EuclideanSpace ℂ (Fin 5) →L[ℂ] EuclideanSpace ℂ (Fin 5) :=
  (Matrix.toEuclideanLin courseMatrix).toContinuousLinearMap

/-- The operator norm uses the Hilbert norm on both sides. -/
theorem norm_courseMatrixOperator : ‖courseMatrixOperator‖ = Real.sqrt 350 := by
  sorry

end FiniteEuclideanExample

end TauCetiRoadmap.SelfAdjointSpectralTheory
