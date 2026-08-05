/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Spectral theory of self-adjoint operators: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

The representation decision runs through every signature: an unbounded operator is a Mathlib
`LinearPMap` (`H →ₗ.[𝕜] H`), and closedness, dense domain and self-adjointness are hypotheses
on it rather than fields of a parallel operator type.
-/

namespace TauCetiRoadmap.SelfAdjointSpectralTheory

open scoped InnerProductSpace ENNReal

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-! ## Part A -- one-parameter unitary groups and Stone's theorem -/

/-- A strongly continuous one-parameter unitary group on a complex Hilbert
space. -/
structure OneParameterUnitaryGroup (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] where
  U : ℝ → (H →L[ℂ] H)
  unitary : ∀ (t : ℝ) (ψ φ : H), ⟪U t ψ, U t φ⟫_ℂ = ⟪ψ, φ⟫_ℂ
  group_law : ∀ s t : ℝ, U (s + t) = (U s).comp (U t)
  identity : U 0 = ContinuousLinearMap.id ℂ H
  strong_continuous : ∀ ψ : H, Continuous fun t : ℝ => U t ψ

/-- The generator: a `LinearPMap` defined on exactly the vectors where the
difference quotient converges.

Spec: D1. -/
noncomputable def generator (U : OneParameterUnitaryGroup H) : H →ₗ.[ℂ] H := sorry

/-- **Stone's theorem, forward direction**: the generator is self-adjoint, with
density of the domain derived rather than assumed. -/
theorem isSelfAdjoint_generator (U : OneParameterUnitaryGroup H) :
    IsSelfAdjoint (generator U) := sorry

/-- **The commutant preserves the generator**: an operator commuting with every
`U t` maps the generator's domain into itself and commutes with the generator
there.

The two conclusions are packaged as a
dependent pair because the second cannot be stated without the first. -/
theorem generator_commute (U : OneParameterUnitaryGroup H) (T : H →L[ℂ] H)
    (hT : ∀ t : ℝ, ∀ y : H, T (U.U t y) = U.U t (T y))
    (x : (generator U).domain) :
    ∃ hmem : T (x : H) ∈ (generator U).domain,
      generator U ⟨T (x : H), hmem⟩ = T (generator U x) := sorry

/-! ## Part B -- the Borel functional calculus and projection-valued measures -/

section BorelCalculus

variable {a : H →L[ℂ] H}

/-- A symbol admissible for the bounded Borel calculus: measurable and uniformly bounded.

Bundled rather than carried as two loose hypotheses, because the calculus is a homomorphism
*out of* this class and the class has its own closure theory. With the conditions loose,
multiplicativity cannot even be stated without additionally assuming measurability and
boundedness of `f * g`, both of which are consequences of the hypotheses already present. -/
structure IsBddMeasurable (f : spectrum ℂ a → ℂ) : Prop where
  measurable : Measurable f
  exists_bound : ∃ M : ℝ, 0 ≤ M ∧ ∀ x, ‖f x‖ ≤ M

/-- Admissible symbols are closed under products. This is the lemma that lets
multiplicativity below take two hypotheses instead of four. -/
theorem IsBddMeasurable.mul {f g : spectrum ℂ a → ℂ}
    (hf : IsBddMeasurable f) (hg : IsBddMeasurable g) :
    IsBddMeasurable (fun x => f x * g x) := sorry

/-- Admissible symbols are closed under sums and scalar multiples, so the calculus is
linear on a class that is itself a module. -/
theorem IsBddMeasurable.add {f g : spectrum ℂ a → ℂ}
    (hf : IsBddMeasurable f) (hg : IsBddMeasurable g) :
    IsBddMeasurable (fun x => f x + g x) := sorry

/-- The bounded Borel functional calculus of a normal operator, extending the
continuous calculus along dominated convergence of diagonal measures.

Spec: D2. -/
noncomputable def borelCalculus (ha : IsStarNormal a) {f : spectrum ℂ a → ℂ}
    (hf : IsBddMeasurable f) : H →L[ℂ] H := sorry

/-- Multiplicativity of the Borel calculus, carried from the continuous calculus
by the polarised transport principle.

Admissibility of the product is *constructed* from the two hypotheses via
`IsBddMeasurable.mul`, not assumed. -/
theorem borelCalculus_mul (ha : IsStarNormal a) {f g : spectrum ℂ a → ℂ}
    (hf : IsBddMeasurable f) (hg : IsBddMeasurable g) :
    borelCalculus ha (hf.mul hg) = borelCalculus ha hf * borelCalculus ha hg := sorry

/-- A projection-valued measure on the Borel sets of `ℝ`: projections, countable
additivity in the strong topology, and the diagonal scalar measures as data. -/
structure ProjValMeasure (H : Type*) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H] where
  /-- The projection assigned to each Borel set.  Measurability is an argument, not a
  side condition: `proj` is meaningless off the Borel sets. -/
  proj : ∀ B : Set ℝ, MeasurableSet B → (H →L[ℂ] H)
  /-- The diagonal scalar measures, carried **as data** rather than constructed: the
  resolvent formula quantifies over them, so they have to be nameable from the structure. -/
  diag : H → MeasureTheory.Measure ℝ
  /-- Each diagonal measure is finite -- its mass is `‖ξ‖ ^ 2`. -/
  diag_finite : ∀ ξ : H, MeasureTheory.IsFiniteMeasure (diag ξ)
  /-- The weld: diagonal matrix elements of the projections are the diagonal measures.
  Idempotence and self-adjointness are consequences of this and `proj_inter`, so they are
  not fields. -/
  inner_proj : ∀ (B : Set ℝ) (hB : MeasurableSet B) (ξ : H),
    ⟪ξ, proj B hB ξ⟫_ℂ = (((diag ξ) B).toReal : ℂ)
  /-- The whole line carries the identity. -/
  proj_univ : proj Set.univ MeasurableSet.univ = ContinuousLinearMap.id ℂ H
  /-- Multiplicativity: intersection of sets is composition of projections. -/
  proj_inter : ∀ (B₁ B₂ : Set ℝ) (hB₁ : MeasurableSet B₁) (hB₂ : MeasurableSet B₂),
    proj B₁ hB₁ * proj B₂ hB₂ = proj (B₁ ∩ B₂) (hB₁.inter hB₂)

end BorelCalculus

/-! ## Part C -- closed operators on LinearPMap: graphs, constructions, form bounds -/

section ClosedOperators

variable {𝕜 : Type*} [RCLike 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]
variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [CompleteSpace F]

/-- Perturbation of a partial map by an operator on its domain, the domain-aware
sum that keeps the carrier a `LinearPMap`.

Spec: D3. -/
def perturb (A : E →ₗ.[𝕜] E) (V : A.domain →ₗ[𝕜] E) : E →ₗ.[𝕜] E where
  domain := A.domain
  toFun := A.toFun + V

/-- Self-adjointness survives a bounded symmetric perturbation
(Kato--Rellich at relative bound zero). -/
theorem isSelfAdjoint_perturb_bounded {A : E →ₗ.[𝕜] E} (hA : IsSelfAdjoint A)
    {T : E →L[𝕜] E} (hT : IsSelfAdjoint T)
    (V : A.domain →ₗ[𝕜] E) (hV : ∀ x : A.domain, V x = T (x : E)) :
    IsSelfAdjoint (perturb A V) := sorry

/-- A bounded rectangular map sends the domain of `B` into the domain of `A` -- the
side condition without which `A (X x)` is not written down. -/
def MapsDomainTo (A : E →ₗ.[𝕜] E) (B : F →ₗ.[𝕜] F) (X : F →L[𝕜] E) : Prop :=
  ∀ x : B.domain, X (x : F) ∈ A.domain

/-- The rectangular domain-aware Sylvester equation `A X − X B = C` on partial maps.
It is a structure rather than an equation between operators because the left-hand side
does not typecheck without domain transport, which is therefore a field. The square case
is obtained by setting `E = F`. -/
structure SylvesterEquation (A : E →ₗ.[𝕜] E) (B : F →ₗ.[𝕜] F)
    (X C : F →L[𝕜] E) : Prop where
  mapsTo_domain : MapsDomainTo A B X
  equation : ∀ x : B.domain,
    A ⟨X (x : F), mapsTo_domain x⟩ - X (B x) = C (x : F)

/-! ### The form-bound vocabulary

Two predicates and the spectral bridges that produce them. -/

/-- Lower quadratic-form bound on a subspace. -/
def LowerFormBoundOn (A : E →L[𝕜] E) (U : Submodule 𝕜 E) (c : ℝ) : Prop :=
  ∀ x ∈ U, c * ‖x‖ ^ 2 ≤ RCLike.re ⟪A x, x⟫_𝕜

/-- Upper quadratic-form bound on a subspace. -/
def UpperFormBoundOn (A : E →L[𝕜] E) (U : Submodule 𝕜 E) (c : ℝ) : Prop :=
  ∀ x ∈ U, RCLike.re ⟪A x, x⟫_𝕜 ≤ c * ‖x‖ ^ 2

/-! #### Basic theory of the form bounds

The two directions in which a bound weakens, and the identification of the degenerate case
with Mathlib's `ContinuousLinearMap.IsPositive`. -/

/-- A lower form bound weakens as the constant decreases. -/
theorem LowerFormBoundOn.mono_const {A : E →L[𝕜] E} {U : Submodule 𝕜 E} {c c' : ℝ}
    (h : LowerFormBoundOn A U c) (hc : c' ≤ c) : LowerFormBoundOn A U c' := sorry

/-- A lower form bound restricts to a smaller subspace. -/
theorem LowerFormBoundOn.mono_subspace {A : E →L[𝕜] E} {U U' : Submodule 𝕜 E} {c : ℝ}
    (h : LowerFormBoundOn A U c) (hU : U' ≤ U) : LowerFormBoundOn A U' c := sorry

/-- An upper form bound weakens as the constant increases. -/
theorem UpperFormBoundOn.mono_const {A : E →L[𝕜] E} {U : Submodule 𝕜 E} {c c' : ℝ}
    (h : UpperFormBoundOn A U c) (hc : c ≤ c') : UpperFormBoundOn A U c' := sorry

/-- An upper form bound restricts to a smaller subspace. -/
theorem UpperFormBoundOn.mono_subspace {A : E →L[𝕜] E} {U U' : Submodule 𝕜 E} {c : ℝ}
    (h : UpperFormBoundOn A U c) (hU : U' ≤ U) : UpperFormBoundOn A U' c := sorry

/-- **The grounding to Mathlib.**  A positive operator is one with the zero lower form bound
on the whole space, so Mathlib's positivity API reaches anything stated with these. -/
theorem IsPositive.lowerFormBoundOn_top {A : E →L[𝕜] E} (hA : A.IsPositive) :
    LowerFormBoundOn A ⊤ 0 := sorry

/-- The converse, which is what makes `LowerFormBoundOn _ ⊤ 0` a generalization of Mathlib's
predicate. -/
theorem isPositive_of_lowerFormBoundOn_top {A : E →L[𝕜] E} (hsym : A.IsSymmetric)
    (h : LowerFormBoundOn A ⊤ 0) : A.IsPositive := sorry

section ComplexScalars

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]

/-- Restriction-spectrum lower bridge: a spectral half-line for the restriction
is a form bound on the subspace. -/
theorem lowerFormBoundOn_of_restriction_spectrum_subset_Ici
    {A : E →L[ℂ] E} (hA : A.IsSymmetric) {U : Submodule ℂ E}
    [U.HasOrthogonalProjection] (hU : ∀ x ∈ U, A x ∈ U) {c : ℝ}
    (hσ : spectrum ℝ (A.restrict hU) ⊆ Set.Ici c) :
    LowerFormBoundOn A U c := sorry

/-- Restriction-spectrum upper bridge, the mirror image. -/
theorem upperFormBoundOn_of_restriction_spectrum_subset_Iic
    {A : E →L[ℂ] E} (hA : A.IsSymmetric) {U : Submodule ℂ E}
    [U.HasOrthogonalProjection] (hU : ∀ x ∈ U, A x ∈ U) {c : ℝ}
    (hσ : spectrum ℝ (A.restrict hU) ⊆ Set.Iic c) :
    UpperFormBoundOn A U c := sorry

end ComplexScalars

end ClosedOperators

/-! ## Part D -- resolvents of self-adjoint LinearPMap operators

Mathlib's `spectrum`/`resolvent` are Banach-algebra notions and do not apply to
a partial map, so the resolvent set is defined here and bridged to Mathlib's in
the bounded case. -/

section Resolvents

variable {𝕜 : Type*} [RCLike 𝕜]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [CompleteSpace E]

/-- The resolvent set of a partial map: the points where `A − z` has a bounded
two-sided inverse. -/
def resolventSet (A : E →ₗ.[𝕜] E) : Set 𝕜 :=
  { z | ∃ R : E →L[𝕜] E,
      (∀ ψ : A.domain, R (A ψ - z • (ψ : E)) = (ψ : E)) ∧
      (∀ φ : E, ∃ h : R φ ∈ A.domain, A ⟨R φ, h⟩ - z • R φ = φ) }

/-- The spectrum of a partial linear map, defined as the complement of its resolvent set. -/
def spectrum (A : E →ₗ.[𝕜] E) : Set 𝕜 :=
  (resolventSet A)ᶜ

/-- The named resolvent at a point of the resolvent set.

Spec: D4. -/
noncomputable def resolvent (A : E →ₗ.[𝕜] E) {z : 𝕜} (hz : z ∈ resolventSet A) :
    E →L[𝕜] E :=
  hz.choose

section ComplexResolvent

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]

/-- A self-adjoint partial map has every non-real point in its resolvent set. -/
theorem mem_resolventSet_of_im_ne_zero {A : E →ₗ.[ℂ] E} (hA : IsSelfAdjoint A)
    {z : ℂ} (hz : z.im ≠ 0) : z ∈ resolventSet A := sorry

/-- The quantitative resolvent bound `‖R z‖ ≤ |Im z|⁻¹`. -/
theorem norm_resolvent_le_of_im_ne_zero {A : E →ₗ.[ℂ] E} (hA : IsSelfAdjoint A)
    {z : ℂ} (hz : z.im ≠ 0) :
    ‖resolvent A (mem_resolventSet_of_im_ne_zero hA hz)‖ ≤ |z.im|⁻¹ := sorry

end ComplexResolvent

/-- The first resolvent identity on the common resolvent set.

Tau Ceti already proves this identity for a *semigroup's* resolvent
(`TauCeti.Analysis.Semigroups.Resolvent.Identity.resolvent_sub_resolvent`), keyed to a
`StronglyContinuousSemigroup` with growth-bound hypotheses and real `λ`, `μ`. This is the
`LinearPMap` statement: any `z` in the resolvent set, over `𝕜`. Neither subsumes the other
as stated, but a semigroup generator *is* a `LinearPMap`, so the two should be related
rather than proved twice. -/
theorem resolvent_sub_resolvent {A : E →ₗ.[𝕜] E} {w z : 𝕜}
    (hw : w ∈ resolventSet A) (hz : z ∈ resolventSet A) (φ : E) :
    resolvent A hw φ - resolvent A hz φ
      = (w - z) • resolvent A hw (resolvent A hz φ) := sorry

end Resolvents

/-! ## Part E -- the spectral measure of an unbounded self-adjoint operator -/

section SpectralMeasure

variable (A : H →ₗ.[ℂ] H)

/-- **The spectral theorem**: the projection-valued measure of an unbounded
self-adjoint operator, constructed through the Cayley transform.

Spec: D5. -/
noncomputable def spectralPVM (hA : IsSelfAdjoint A) : ProjValMeasure H := sorry

/-- The resolvent formula: the diagonal matrix elements of the resolvent are
Cauchy--Stieltjes transforms of the diagonal spectral measures. -/
theorem spectralPVM_resolvent_formula (hA : IsSelfAdjoint A) {z : ℂ}
    (hz : z.im ≠ 0) (hzr : z ∈ resolventSet A) (ξ : H) :
    ⟪ξ, resolvent A hzr ξ⟫_ℂ
      = ∫ s, ((s : ℂ) - z)⁻¹ ∂((spectralPVM A hA).diag ξ) := sorry

/-- The unitary group generated by a self-adjoint operator, `t ↦ e^{itA}`.

Spec: D6. -/
noncomputable def genToGroup (hA : IsSelfAdjoint A) : OneParameterUnitaryGroup H := sorry

/-- **Stone's theorem, uniqueness half**: the generator of the generated group
is the operator, closing the loop with Part A. -/
theorem generator_genToGroup (hA : IsSelfAdjoint A) :
    generator (genToGroup A hA) = A := sorry

/-- The **raw** Yosida approximant at the single imaginary shift `i n`. It is bounded and
converges strongly on the domain, and it is **not** self-adjoint: one shift is used, so the
imaginary parts do not cancel.

Indexed by `ℕ+`: at `n = 0` the resolvent argument `i n` is real, so `R(i n)` need not
exist.

Spec: D7. -/
noncomputable def yosidaApproximant (hA : IsSelfAdjoint A) (n : ℕ+) : H →L[ℂ] H :=
  ((n : ℂ) ^ 2) •
      resolvent A (mem_resolventSet_of_im_ne_zero hA
        (z := Complex.I * (n : ℂ)) (by simp [n.ne_zero]))
    - (Complex.I * (n : ℂ)) • ContinuousLinearMap.id ℂ H

/-- The mirrored approximant, at the shift `-i n`. -/
noncomputable def yosidaApproximantNeg (hA : IsSelfAdjoint A) (n : ℕ+) : H →L[ℂ] H :=
  ((n : ℂ) ^ 2) •
      resolvent A (mem_resolventSet_of_im_ne_zero hA
        (z := -(Complex.I * (n : ℂ))) (by simp [n.ne_zero]))
    + (Complex.I * (n : ℂ)) • ContinuousLinearMap.id ℂ H

/-- The **symmetrized** Yosida approximant, the average of the two shifts. This is the
self-adjoint one, and the form the unitary exponentials are built from. -/
noncomputable def yosidaApproximantSym (hA : IsSelfAdjoint A) (n : ℕ+) : H →L[ℂ] H :=
  (2 : ℂ)⁻¹ • (yosidaApproximant A hA n + yosidaApproximantNeg A hA n)

/-- Self-adjointness holds for the symmetrized form. -/
theorem isSelfAdjoint_yosidaApproximantSym (hA : IsSelfAdjoint A) (n : ℕ+) :
    IsSelfAdjoint (yosidaApproximantSym A hA n) := sorry

/-- The approximating unitary groups are the exponentials of the symmetrized approximant;
`yosidaApproximant` alone does not generate one. -/
noncomputable def yosidaGroup (hA : IsSelfAdjoint A) (n : ℕ+) :
    OneParameterUnitaryGroup H := sorry

/-- The approximating groups converge strongly to the group `A` generates. -/
theorem tendsto_yosidaGroup (hA : IsSelfAdjoint A) (t : ℝ) (ψ : H) :
    Filter.Tendsto (fun n : ℕ+ => (yosidaGroup A hA n).U t ψ) Filter.atTop
      (nhds ((genToGroup A hA).U t ψ)) := sorry

end SpectralMeasure

end TauCetiRoadmap.SelfAdjointSpectralTheory
