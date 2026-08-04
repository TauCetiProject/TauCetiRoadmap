import Mathlib

/-!
# Restricted three-body nonintegrability: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for the first reusable definitions and a few
acceptance gates, so contributors and reviewers converge on conventions; discharging all of them
finishes neither a lane nor the roadmap.

The summit is Yagasaki, arXiv:2106.04925v7, Theorem 1.1: meromorphic nonintegrability of the
planar and spatial circular restricted three-body problem near either primary for every
`0 < μ < 1`. The prerequisite tower and the precise scope are in `README.md`.

Only objects expressible honestly against current Mathlib are pinned here. In particular, this file
does not invent empty `Prop` placeholders for meromorphic maps on complex manifolds,
Picard--Vessiot extensions, Morales--Ramis--Simó, or the final theorem. Add those signatures as the
corresponding types land in Tau Ceti.
-/

namespace TauCetiRoadmap.RestrictedThreeBody

open Set

/-! ## Lane A1: vector-field integrability in a complex vector space -/

/-- The finite-dimensional complex state space used by the first flat-space dynamics API. -/
abbrev ComplexState (n : ℕ) := Fin n → ℂ

/-- An autonomous vector field on `ℂⁿ`. The manifold API later generalizes this flat model. -/
abbrev ComplexVectorField (n : ℕ) := ComplexState n → ComplexState n

/-- `F` is a first integral of `X` when its differential annihilates `X` everywhere. Regularity is
carried separately by theorems: Mathlib's total `fderiv` is zero where no derivative exists. -/
def IsFirstIntegral {n : ℕ} (X : ComplexVectorField n) (F : ComplexState n → ℂ) : Prop :=
  ∀ x, fderiv ℂ F x (X x) = 0

/-- The domain-restricted first-integral predicate used by local integrability. -/
def IsFirstIntegralOn {n : ℕ} (X : ComplexVectorField n) (F : ComplexState n → ℂ)
    (U : Set (ComplexState n)) : Prop :=
  ∀ x ∈ U, fderivWithin ℂ F U x (X x) = 0

/-- Two flat vector fields commute when their Mathlib Lie bracket vanishes. -/
def Commute {n : ℕ} (X Y : ComplexVectorField n) : Prop :=
  VectorField.lieBracket ℂ X Y = 0

/-- The domain-restricted commuting predicate used by local integrability. -/
def CommuteOn {n : ℕ} (X Y : ComplexVectorField n) (U : Set (ComplexState n)) : Prop :=
  ∀ x ∈ U, VectorField.lieBracketWithin ℂ X Y U x = 0

/-- Pointwise functional independence of scalar functions, expressed as linear independence of
their Fréchet differentials. -/
def FunctionallyIndependentAt {n ι : ℕ} (F : Fin ι → ComplexState n → ℂ)
    (x : ComplexState n) : Prop :=
  LinearIndependent ℂ fun i ↦ fderiv ℂ (F i) x

/-- Pointwise independence of vector fields. -/
def VectorFieldsIndependentAt {n q : ℕ} (X : Fin q → ComplexVectorField n)
    (x : ComplexState n) : Prop :=
  LinearIndependent ℂ fun i ↦ X i x

/-- Independence on a dense relatively open locus of `U`. This is the roadmap convention for the
paper's “almost everywhere”; it is deliberately not measure-theoretic `Filter.Eventually`. -/
def GenericallyFunctionallyIndependentOn {n ι : ℕ}
    (F : Fin ι → ComplexState n → ℂ) (U : Set (ComplexState n)) : Prop :=
  ∃ V : Set (ComplexState n), IsOpen V ∧ V ⊆ U ∧ U ⊆ closure V ∧
    ∀ x ∈ V, FunctionallyIndependentAt F x

/-- Generic independence for a family of vector fields, with the same dense-open convention. -/
def GenericallyVectorFieldsIndependentOn {n q : ℕ}
    (X : Fin q → ComplexVectorField n) (U : Set (ComplexState n)) : Prop :=
  ∃ V : Set (ComplexState n), IsOpen V ∧ V ⊆ U ∧ U ⊆ closure V ∧
    ∀ x ∈ V, VectorFieldsIndependentAt X x

/-- Bogoyavlenskij `(q,n-q)`-integrability on `U`, before imposing analytic or meromorphic
regularity: a generically independent commuting family containing the system vector field and a
generically independent family of common first integrals. The meromorphic manifold version is a
later Lane-A3 target. -/
def IsBogoyavlenskijIntegrableOn {n : ℕ} (q : ℕ) (X₀ : ComplexVectorField n)
    (U : Set (ComplexState n)) : Prop :=
  0 < q ∧ q ≤ n ∧ U.Nonempty ∧
  ∃ X : Fin q → ComplexVectorField n, ∃ F : Fin (n - q) → ComplexState n → ℂ,
    (∃ i, X i = X₀) ∧
    (∀ i j, CommuteOn (X i) (X j) U) ∧
    GenericallyVectorFieldsIndependentOn X U ∧
    GenericallyFunctionallyIndependentOn F U ∧
    ∀ i j, IsFirstIntegralOn (X i) (F j) U

/-! ## Lane C: the elementary block-matrix obstruction -/

/-- The scalar `3×3` model of Yagasaki's block matrices
`M(C₁,C₂,C₃) = [[1,0,C₁],[C₃,1,C₂],[0,0,1]]` from Lemma 2.5. The implementation must generalize
this seed to rectangular blocks, then prove the stronger statement about the identity component of
the differential Galois group. -/
def obstructionMatrix (C₁ C₂ C₃ : ℂ) : Matrix (Fin 3) (Fin 3) ℂ :=
  !![1, 0, C₁;
     C₃, 1, C₂;
     0, 0, 1]

/-- The raw noncommutation calculation in Yagasaki Lemma 2.5. This is only the algebraic seed:
noncommuting elements alone do **not** prove that the identity component is noncommutative; the
roadmap separately requires the Zariski-closure-of-powers argument. -/
theorem obstructionMatrix_noncommute {C₁ C₂ C₃ C₁' C₂' C₃' : ℂ}
    (h : C₃ * C₁' ≠ C₃' * C₁) :
    obstructionMatrix C₁ C₂ C₃ * obstructionMatrix C₁' C₂' C₃' ≠
      obstructionMatrix C₁' C₂' C₃' * obstructionMatrix C₁ C₂ C₃ := by
  sorry

/-! ## Lane D1: the physical rotating-frame Hamiltonians -/

/-- A readable planar canonical state `(x,y,pₓ,pᵧ)`. The manifold mechanics API supplies its
equivalence with the canonical vector space. -/
structure PlanarState where
  x : ℝ
  y : ℝ
  px : ℝ
  py : ℝ

/-- A readable spatial canonical state `(x,y,z,pₓ,pᵧ,p_z)`. -/
structure SpatialState where
  x : ℝ
  y : ℝ
  z : ℝ
  px : ℝ
  py : ℝ
  pz : ℝ

/-- The planar circular restricted three-body potential in the rotating frame, with masses `μ` and
`1-μ` at `(1-μ,0)` and `(-μ,0)`. Collision points are excluded by theorem hypotheses. -/
noncomputable def planarPotential (μ x y : ℝ) : ℝ :=
  μ / Real.sqrt ((x - 1 + μ) ^ 2 + y ^ 2) +
    (1 - μ) / Real.sqrt ((x + μ) ^ 2 + y ^ 2)

/-- The spatial circular restricted three-body potential, with the same primary convention. -/
noncomputable def spatialPotential (μ x y z : ℝ) : ℝ :=
  μ / Real.sqrt ((x - 1 + μ) ^ 2 + y ^ 2 + z ^ 2) +
    (1 - μ) / Real.sqrt ((x + μ) ^ 2 + y ^ 2 + z ^ 2)

/-- The planar rotating-frame Hamiltonian, with `ω = dq ∧ dp` and
`q̇ = ∂H/∂p`, `ṗ = -∂H/∂q`. -/
noncomputable def planarHamiltonian (μ : ℝ) (s : PlanarState) : ℝ :=
  (s.px ^ 2 + s.py ^ 2) / 2 + (s.px * s.y - s.py * s.x) -
    planarPotential μ s.x s.y

/-- The spatial rotating-frame Hamiltonian with the roadmap's pinned signs. -/
noncomputable def spatialHamiltonian (μ : ℝ) (s : SpatialState) : ℝ :=
  (s.px ^ 2 + s.py ^ 2 + s.pz ^ 2) / 2 + (s.px * s.y - s.py * s.x) -
    spatialPotential μ s.x s.y s.z

/-- At the integrable endpoint `μ=0`, the planar potential is the single-primary Kepler potential.
This is an acceptance gate, not a case of the nonintegrability summit. -/
theorem planarPotential_zero (x y : ℝ) :
    planarPotential 0 x y = 1 / Real.sqrt (x ^ 2 + y ^ 2) := by
  sorry

/-- Rotation by `π` and `μ ↔ 1-μ` exchanges the primaries in the planar potential. -/
theorem planarPotential_primaryExchange (μ x y : ℝ) :
    planarPotential (1 - μ) (-x) (-y) = planarPotential μ x y := by
  sorry

/-- The spatial primary-exchange acceptance gate. -/
theorem spatialPotential_primaryExchange (μ x y z : ℝ) :
    spatialPotential (1 - μ) (-x) (-y) (-z) = spatialPotential μ x y z := by
  sorry

end TauCetiRoadmap.RestrictedThreeBody
